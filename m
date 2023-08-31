Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5ED78E694
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 08:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9EE10E5AA;
	Thu, 31 Aug 2023 06:33:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E8C10E5AA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 06:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wcz8AYR7IFs/urqjOjWwrz40QXB3EYgGYI6013WLugY=; b=LPeCiYyVaL9RDl8PfIzFdtHCj1
 NeaX7JBkvqwlgozViZuKaLVAvtkmBYhYO6lZZuO5E5YSgTi7gAJQ0zJ5Y1qoR1xtLoAzbvoiES+8r
 Cb+qyaXwx5XOPuX0iqGhN/pt1hmApGjnuRyahbWW4n3+a798OAVnss6VMSi3w+fltyGng0nCsJqB5
 vDZuhy+Sz5vWitYuQJBg00XnnroHxc45bF40WP1za/9cmAOAxp4xYL+oCNo/7akzMZXT+bTcPhJJn
 MtXqjGRFWusP9j4o/W5SJlPhz8wcXco83K1H4r1FxfeUkrmDFO7E9tIRxksIELTd1q4ox/IPMjK5F
 Fns4XnTw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=[192.168.1.10]) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1qbbF2-000sID-1Z;
 Thu, 31 Aug 2023 09:33:20 +0300
Message-ID: <5f1bca1b-8deb-e677-521d-87d3848e22df@kapsi.fi>
Date: Thu, 31 Aug 2023 09:33:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/tegra: Remove existing framebuffer only if we support
 display
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20230825132229.1109445-1-thierry.reding@gmail.com>
 <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <f5ce7a77-ee3e-5186-dd8a-76c0bd794de0@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/30/23 13:19, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.08.23 um 15:22 schrieb Thierry Reding:
>> From: Thierry Reding <treding@nvidia.com>
>>
>> Tegra DRM doesn't support display on Tegra234 and later, so make sure
>> not to remove any existing framebuffers in that case.
>>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>   drivers/gpu/drm/tegra/drm.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index b1e1a78e30c6..7a38dadbc264 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -1220,9 +1220,11 @@ static int host1x_drm_probe(struct 
>> host1x_device *dev)
>>       drm_mode_config_reset(drm);
>> -    err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
>> -    if (err < 0)
>> -        goto hub;
>> +    if (drm->mode_config.num_crtc > 0) {
> 
> If you don't support the hardware, wouldn't it be better to return 
> -ENODEV if !num_crtc?

While display is not supported through TegraDRM on Tegra234+, certain 
multimedia accelerators are supported, so we need to finish probe for those.

Cheers,
Mikko

> 
> Best regards
> Thomas
> 
>> +        err = drm_aperture_remove_framebuffers(&tegra_drm_driver);
>> +        if (err < 0)
>> +            goto hub;
>> +    }
>>       err = drm_dev_register(drm, 0);
>>       if (err < 0)
> 

