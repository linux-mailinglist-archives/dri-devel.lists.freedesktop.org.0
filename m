Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C48B332D25
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 18:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9226A89F41;
	Tue,  9 Mar 2021 17:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 103A189F92
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Mar 2021 17:22:31 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u16so17208773wrt.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Mar 2021 09:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=62Pu5sBR5nx/jUzaP/qRm1YBEm5frpGuQUSWypR3GX8=;
 b=U6fXiHEPH3L4q0wNrcCtUSPM+4WKrol1Mytk36zpQNWtBDBc2nYz0xgv3vvrk+ivsv
 iSeH2W32SP9Ey1qRWxXoU3cnCvdJf/wd7oVJip97+D/qmQ3rR58ruTCUQLQxyN0C7iyP
 TOCrKF8HN1Rf2zEl3iaJDKbs4G+veyMQH/sE4UZHQ7R7jSII0I6SoZxv8hWiixb3aP7y
 hOmn+UrXSwVV2nocf3o0H6KD6piSIo+DZ8nJlAQIN6Dbh5bZOO4zXoikiXi703A3UiWt
 8eU0E1hxnlQJvM+K0GYcwCN3njsIeDWPCNnPRa4XNzRg/CG5eyBtPi8ql6QKt2oWT4J2
 Y+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=62Pu5sBR5nx/jUzaP/qRm1YBEm5frpGuQUSWypR3GX8=;
 b=ehG0KzAk02zeuYOOcpDXs8NT4gBLSThVuBQFOCmk4Y7G8rpBnrRsjwzRYXWt01J9Tn
 OgqnH0m13uKLahAxopsl4PlZW0U/mMAgP5sO1bGWFYYC1/n7ErzXpJT0MNPg9oIrkP+Z
 BLfgCxseRnbjDcvmLF1dIsa5jtoRRsKFZuYxKNfFiRuMtV/uDW26jv1YO6BfDS1ykzRX
 zcoCVBJOSP24NVfzICOguDhsR/xJd2tItrk6vHtTYvLHF9BpHeRaO2l/roGT+WtpeFOz
 O3t9o6q5zI1tS85F9TW6snYNuvk5BFZrU1x91GGQG3WTeuDo5he0WMj5Qb03OAdnKYig
 TZog==
X-Gm-Message-State: AOAM533ily9kmm4jNuibFADG/ANBt9HylNfw/gB8Pwq7gyJ5aPTCBWC1
 QLHVVl6beTxnAwpezr6HTR+HBQ==
X-Google-Smtp-Source: ABdhPJygrvsfBS/M4/vYZIOU5zvFy6kVfrjO6bL33p23bli+tiWmx4lQSag9GI6fhzBhpLNyE+ZAAw==
X-Received: by 2002:a5d:638f:: with SMTP id p15mr29029496wru.220.1615310549582; 
 Tue, 09 Mar 2021 09:22:29 -0800 (PST)
Received: from ?IPv6:2a01:e0a:90c:e290:74c5:b3db:b181:e284?
 ([2a01:e0a:90c:e290:74c5:b3db:b181:e284])
 by smtp.gmail.com with ESMTPSA id b15sm5378450wmd.41.2021.03.09.09.22.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 09:22:29 -0800 (PST)
Subject: Re: [PATCH] drm: meson_drv add shutdown function
To: Kevin Hilman <khilman@baylibre.com>, Artem Lapkin <email2tema@gmail.com>
References: <20210302042202.3728113-1-art@khadas.com>
 <e033540e-3a4f-3dd7-a1b0-d5a0241e845a@baylibre.com>
 <7h35x42qtt.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <875c606f-baf9-f92a-4820-39d3d7312607@baylibre.com>
Date: Tue, 9 Mar 2021 18:22:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7h35x42qtt.fsf@baylibre.com>
Content-Language: en-US
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
Cc: gouwa@khadas.com, martin.blumenstingl@googlemail.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/03/2021 18:13, Kevin Hilman wrote:
> Hi Neil,
> 
> Neil Armstrong <narmstrong@baylibre.com> writes:
> 
>> On 02/03/2021 05:22, Artem Lapkin wrote:
>>> Problem: random stucks on reboot stage about 1/20 stuck/reboots
>>> // debug kernel log
>>> [    4.496660] reboot: kernel restart prepare CMD:(null)
>>> [    4.498114] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>> [    4.503949] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>> ...STUCK...
>>>
>>> Solution: add shutdown function to meson_drm driver 
>>> // debug kernel log
>>> [    5.231896] reboot: kernel restart prepare CMD:(null)
>>> [    5.246135] [drm:meson_drv_shutdown]
>>> ...
>>> [    5.259271] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown begin
>>> [    5.274688] meson_ee_pwrc c883c000.system-controller:power-controller: shutdown domain 0:VPU...
>>> [    5.338331] reboot: Restarting system
>>> [    5.358293] psci: PSCI_0_2_FN_SYSTEM_RESET reboot_mode:0 cmd:(null)
>>> bl31 reboot reason: 0xd
>>> bl31 reboot reason: 0x0
>>> system cmd  1.
>>> ...REBOOT...
>>>
>>> Tested: on VIM1 VIM2 VIM3 VIM3L khadas sbcs - 1000+ successful reboots
>>> and Odroid boards, WeTek Play2 (GXBB)
>>>
>>> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
>>> Signed-off-by: Artem Lapkin <art@khadas.com>
>>>
>>> ---
>>>  drivers/gpu/drm/meson/meson_drv.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
>>> index 42c5d3246..693bb1293 100644
>>> --- a/drivers/gpu/drm/meson/meson_drv.c
>>> +++ b/drivers/gpu/drm/meson/meson_drv.c
>>> @@ -482,6 +482,16 @@ static int meson_probe_remote(struct platform_device *pdev,
>>>  	return count;
>>>  }
>>>  
>>> +static void meson_drv_shutdown(struct platform_device *pdev)
>>> +{
>>> +	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
>>> +	struct drm_device *drm = priv->drm;
>>> +
>>> +	DRM_DEBUG_DRIVER("\n");
>>> +	drm_kms_helper_poll_fini(drm);
>>> +	drm_atomic_helper_shutdown(drm);
>>> +}
>>> +
>>>  static int meson_drv_probe(struct platform_device *pdev)
>>>  {
>>>  	struct component_match *match = NULL;
>>> @@ -553,6 +563,7 @@ static const struct dev_pm_ops meson_drv_pm_ops = {
>>>  
>>>  static struct platform_driver meson_drm_platform_driver = {
>>>  	.probe      = meson_drv_probe,
>>> +	.shutdown   = meson_drv_shutdown,
>>>  	.driver     = {
>>>  		.name	= "meson-drm",
>>>  		.of_match_table = dt_match,
>>>
>>
>> Applied to drm-misc-fixes,
> 
> Could you submit this as a fix to stable (v5.10+) also?

It should be done automagically since I added the Fixes tag

neil

> 
> Thanks,
> 
> Kevin
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
