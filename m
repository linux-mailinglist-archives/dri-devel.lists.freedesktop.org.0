Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BD2531143
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 16:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CD210FD78;
	Mon, 23 May 2022 14:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CBA10FD7C
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653315066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cQ2F3mi+DuL7lUq4YcbWoe7vDTV3N7hMeos9Mv7PPDg=;
 b=XPDZtxYzZbcjA4r2a4LRRrAEHvLNrAQASfWrTG11oZmi1fNVqmhDGvmIWbthEwN0PmtBpJ
 mSWZchpuAmKguArYKBnPFLsQDWUb+kMIXrNc7U1r+CkB+UTtfvBuDK6wyqKqyy4edMrxEW
 +EfzR33hddUJ8QB9MKxpB56D2+DR63Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-NTyTPWodNG-g89cpHOqgCg-1; Mon, 23 May 2022 10:11:04 -0400
X-MC-Unique: NTyTPWodNG-g89cpHOqgCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 e9-20020a05600c4e4900b00394779649b1so10643809wmq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 07:11:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cQ2F3mi+DuL7lUq4YcbWoe7vDTV3N7hMeos9Mv7PPDg=;
 b=N4gXw0ZbDJFxZF4dvnc++liUKiVi4tYP7C6khboTTftPEiPR30k8pDLrpuin42pxoi
 8ULdNwFqgKm6sefv+RDMTJGeKZJPxOzUMsYp+S7uC+P41PJaaJlq2mWrgmG4fw1wFBgH
 kQq+9q5dqHZP65hxjuUsdTp7EzxsztxylonFy38YK8+n4c3eMelCznoShbYGSb1hW3Mh
 2+WA94M2Gr5S0HkwSRhUbnPr5F7pjh/eRPRNxBHzD7LLbiNVAUAW1Riyw6tTDK8LwoCC
 1Al/d7ZgbXa3WWOjGV38DVfcP6jjY2i45yXrNDF4ytEzd/646EC1VzDpzWHy+sOMAIFI
 PSDg==
X-Gm-Message-State: AOAM532F2nxz/AR4OFvqXKq/X3cd16KRR6sJFaW/CtoNOXdQrUSSPPAc
 23hQO9uX8HRBGoMP4d/4gZP7LV9arJSPA7H5c/7jhWrDrQfjFU306T+IPaqD7PrwFt5hcdi/lR/
 BF6D25P+hhcIHMfEokeLZ5QS2OxKt
X-Received: by 2002:a05:6000:1a45:b0:20e:6164:d86c with SMTP id
 t5-20020a0560001a4500b0020e6164d86cmr18845486wry.561.1653315063180; 
 Mon, 23 May 2022 07:11:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymLcijc3WiiGUvKg1xxfLQz9gs2q9wfB9ZCIjGILyrJP57aIq3qOAI307PMuGJbT3BHnIfYw==
X-Received: by 2002:a05:6000:1a45:b0:20e:6164:d86c with SMTP id
 t5-20020a0560001a4500b0020e6164d86cmr18845462wry.561.1653315062962; 
 Mon, 23 May 2022 07:11:02 -0700 (PDT)
Received: from [172.20.10.7] ([90.167.95.5]) by smtp.gmail.com with ESMTPSA id
 l15-20020adfbd8f000000b0020e65d7d36asm10459492wrh.11.2022.05.23.07.11.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 07:11:02 -0700 (PDT)
Message-ID: <0389b672-a4f4-4943-7b3e-7732685ae6c2@redhat.com>
Date: Mon, 23 May 2022 16:11:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/st7735r: Fix module autoloading for Okaya RH128128T
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20220520091602.179078-1-javierm@redhat.com>
 <CAMuHMdVmFGjGbHz1yo7tOzqtUbMTDkUxaMo2fVSp1HMU=_1emA@mail.gmail.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <CAMuHMdVmFGjGbHz1yo7tOzqtUbMTDkUxaMo2fVSp1HMU=_1emA@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Lechner <david@lechnology.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Geert,

On 5/20/22 14:02, Geert Uytterhoeven wrote:
> Hi Javier,
> 
> CC spi
> 
> On Fri, May 20, 2022 at 11:16 AM Javier Martinez Canillas
> <javierm@redhat.com> wrote:
>> The SPI core always reports a "MODALIAS=spi:<foo>", even if the device was
>> registered via OF. This means that the st7735r.ko module won't autoload if
>> a DT has a node with a compatible "okaya,rh128128t" string.
>>
>> In that case, kmod expects a "MODALIAS=of:N*T*Cokaya,rh128128t" uevent but
>> instead will get a "MODALIAS=spi:rh128128t", which is not present in the
>> list of aliases:
>>
>>   $ modinfo drivers/gpu/drm/tiny/st7735r.ko | grep alias
>>   alias:          of:N*T*Cokaya,rh128128tC*
>>   alias:          of:N*T*Cokaya,rh128128t
>>   alias:          of:N*T*Cjianda,jd-t18003-t01C*
>>   alias:          of:N*T*Cjianda,jd-t18003-t01
>>   alias:          spi:jd-t18003-t01
>>
>> To workaround this issue, add in the SPI table an entry for that device.
>>
>> Fixes: d1d511d516f7 ("drm: tiny: st7735r: Add support for Okaya RH128128T")
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Thanks for your patch!
> We really need to fix this at the subsystem level.
> 

Yes, agreed.

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>

Thanks! I've pushed this to drm-misc (drm-misc-next) with your Reviewed-by
and David's Acked-by.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

