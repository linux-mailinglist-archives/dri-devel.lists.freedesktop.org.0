Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECB38FB8A
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 964C66E0FD;
	Tue, 25 May 2021 07:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDB76E0FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 07:19:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id x8so30978715wrq.9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 00:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZIF5qbJq5dDbTJkMUZQx+e6A8wnJOGmQFFouRAB4vUQ=;
 b=fPjSmZYrxa3jhg9v7KNIkfBuVzdPafEjR4yuhdo77RlnRctzYGJt5CBXzx5hYkcHO9
 +CMaIU7LIfmqH14An0A6RaAiVtioTQmJbT7EyffFC4UxLJHd8XS8GjTN/u3nMXdjxgil
 0lZzznUMlpP62/bLpTGiqzgZQl3XuPkaV0y9raIQlp/TQGBLD4NHmPYLOa8BM8EY7nX0
 LM9a5w2sMcacBLh1494DbEnDpiQFcqj0PXgNSe2dPRNSLW76fijemgaFSRNVCDq5Tfhz
 esPfTKmkzyjZByxmueQFFKj2Jdrom6jAVECHL2y9ivpgV7SbPZ3JqV1ZdTZpWq1Vez//
 yRjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZIF5qbJq5dDbTJkMUZQx+e6A8wnJOGmQFFouRAB4vUQ=;
 b=fRWsoJlrLB6Ue1EAP375Hk2WsYFfDyA1JzPf0b2Zt0246M3TLpzJ0oGV8NGwHNDSCV
 hBhWEbVQDP+T2H8sYgla5CdHwoZBQbpHoj0GRg7NTBZpQEVoZ+4lZsKytv/U748BQPUn
 CMPA05oiinmxzYRPJE8jQgsT2jm7NE3TqfGWbyjPUqKWmvpfstTrfqJ0xCvktGGM/Sm8
 MPdclPWNVdMrG44dkFsHcfi4vrihL0r2rXaoWXmplDQQfFz+fRBCycNdHM2XcrXtyXSp
 9UFhtlDA2vVOlbVymIYTE8OVE6AmZUbYYeHkWY1jzVFI2YbFJfyPuKShUvpa7VZu/UFV
 lsRw==
X-Gm-Message-State: AOAM532AD67OPbGaFa/NY/5bCMQZby5JE6I05OQS3FIC4QVnwbrlG7tr
 7vkCAbP25fIvA/N35uU+Co1WZw==
X-Google-Smtp-Source: ABdhPJxrlnvAxMSl+3epwoB8HYZGMfsPWkE8KGVioeRDms8mbTXy66Ka0tFnT+1HbxZ+RQTVeY4fMg==
X-Received: by 2002:adf:db42:: with SMTP id f2mr25788089wrj.5.1621927171421;
 Tue, 25 May 2021 00:19:31 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:1062:9531:8150:c5f3?
 ([2a01:e0a:90c:e290:1062:9531:8150:c5f3])
 by smtp.gmail.com with ESMTPSA id u18sm2620660wmj.15.2021.05.25.00.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 00:19:30 -0700 (PDT)
Subject: Re: [PATCH] drm/meson: fix shutdown crash when component not probed
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20210430082744.3638743-1-narmstrong@baylibre.com>
 <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <6a350607-3ccf-1af0-be17-8a31cc937e57@baylibre.com>
Date: Tue, 25 May 2021 09:19:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFBinCC0aaMUbBkJ4bjhFa0A+sZH1muyW6kqAQYfjjXOkrNPGg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Martin,

On 20/05/2021 22:25, Martin Blumenstingl wrote:
> Hi Neil,
> 
> since this has not received any Reviewed-by yet I tried my best to
> review it myself
> 
> On Fri, Apr 30, 2021 at 10:28 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> --- a/drivers/gpu/drm/meson/meson_drv.c
>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>> @@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
>>  static void meson_drv_shutdown(struct platform_device *pdev)
>>  {
>>         struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> this part made it hard for me because I was wondering where the
> matching dev_set_drvdata call is
> it turns out platform_set_drvdata is used instead, meaning for me it
> would have been easier to understand if platform_get_drvdata was used
> here
> that's however nothing which has changed with this patch

OK sure, indeed, but since it's the same... but yeah it may be an issue if platform_set_drvdata changes.

> 
>> -       struct drm_device *drm = priv->drm;
>>
>> -       DRM_DEBUG_DRIVER("\n");
>> -       drm_kms_helper_poll_fini(drm);
>> -       drm_atomic_helper_shutdown(drm);
>> +       if (!priv)
>> +               return;
>> +
>> +       drm_kms_helper_poll_fini(priv->drm);
>> +       drm_atomic_helper_shutdown(priv->drm);
>>  }
> then this part finally made sense to me (as non-drm person), as
> platform_set_drvdata comes near the end of meson_drv_bind_master (so
> any errors would cause the drvdata to be NULL).
> 
> with this I can also give me:
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> in addition to my:
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks !

> 
> Can you please queue this up for -fixes or do we need to ask someone to do it?

Yes, the drm-misc-next & drm-misc-fixes are aleays opened and merged each week in the corresponding drm-next and drm-fixes
branches, so we can push patches at anytime without thinking about the merge window (except drm-misc-fixes merged back with -rc1).

Neil

> 
> 
> Best regards,
> Martin
> 

