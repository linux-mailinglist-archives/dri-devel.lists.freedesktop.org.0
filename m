Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AE55499E5
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 19:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9AD10E732;
	Mon, 13 Jun 2022 17:24:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7834010E732
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655141058;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yGvm3qwPoTuLTdX5NWsaOkcpvKYLKtr/ysaBv6CZIVc=;
 b=TozptT0xEY1aP5OSkkSo+GH0XDUt1LkOJXV4DM6uNDVL4mSaJYLbvW0DZyVpgsA/Dvq3Is
 WLwkGpPNIt0kVF3ZtqJ4b46smEQSQJe9RTrbk3PHJPfgLgZ8HUElwMmpo10NuNAtS/fpd3
 X9RmSVuKXM08g1j+7ORIwJeImkhX7Ys=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-412-Pmcl3pY9Mb-h14StWBmwBQ-1; Mon, 13 Jun 2022 13:24:17 -0400
X-MC-Unique: Pmcl3pY9Mb-h14StWBmwBQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so3207908wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 10:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yGvm3qwPoTuLTdX5NWsaOkcpvKYLKtr/ysaBv6CZIVc=;
 b=IKG1fF9JL5WEUsIBvRwCI8D6zFW5lmvTZjgYeNPlJL+AlGESHHdPM8hbR4ksa+gI1l
 MDC3TA/Ys265cngjAEeOgU7QpPLLK3LB+HcQiaeL6WkTenr4sQBx52Xt15nw1+V4nbtS
 8bjZfiMGFp1TDJwsqNZk0cia6adFVMbDQEX7W3Fr5hSh0CoFipnS8fdtl/snhog+QA5y
 9SxHNmM0rMXrSXrXKSx8VIcVIvNl/hYxodwH7KluqojOQfOYUlPuxriWdt+schMQPMXW
 AKq2wgLN4DW6h7LifklcpZ6D06fjlfi6K5xmBumppBHwaI2cDC4QCITAf/Lw58gIZzC2
 Pw9w==
X-Gm-Message-State: AJIora8Ohx/zznVnU9jv2Yn+Y1Di59YBFv2TZvTjDtYprP6rKaRTLF+4
 CzaqKnBkn2JIkPKxKOa5EWG6Rm1JwRNfT1wZeU3SXIRIVCHk13l81hBglcF9/+nsQNITI2q6q1R
 5Eoj0i/mMtbDVkXImUg7dBMB01s17
X-Received: by 2002:a5d:5109:0:b0:218:40cc:a29b with SMTP id
 s9-20020a5d5109000000b0021840cca29bmr858414wrt.601.1655141055796; 
 Mon, 13 Jun 2022 10:24:15 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1umQvbmUV5kyQfsWQKm16COOgbaUu2gIG10MNTDJcGldHmXD3XO1wIjQhiRvT60PcbnoxxDAQ==
X-Received: by 2002:a5d:5109:0:b0:218:40cc:a29b with SMTP id
 s9-20020a5d5109000000b0021840cca29bmr858386wrt.601.1655141055500; 
 Mon, 13 Jun 2022 10:24:15 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 d5-20020a5d5385000000b00213b93cff5fsm9082661wrv.98.2022.06.13.10.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jun 2022 10:24:15 -0700 (PDT)
Message-ID: <bbddcf97-7ab2-209b-e777-1874557491a3@redhat.com>
Date: Mon, 13 Jun 2022 19:24:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] Revert "fbdev: vesafb: Allow to be built if COMPILE_TEST
 is enabled"
To: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220610085450.1341880-1-javierm@redhat.com>
 <YqMTI3yxmWq/f+Gp@phenom.ffwll.local>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YqMTI3yxmWq/f+Gp@phenom.ffwll.local>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/10/22 11:47, Daniel Vetter wrote:
> On Fri, Jun 10, 2022 at 10:54:50AM +0200, Javier Martinez Canillas wrote:
>> This reverts commit fa0e256450f27a7d85f65c63f05e6897954a1d53. The kernel
>> test robot reported that attempting to build the vesafb driver fails on
>> some architectures, because these don't define a `struct screen_info`.
>>
>> This leads to linking errors, for example on parisc with allyesconfig:
>>
>>   hppa-linux-ld: drivers/video/fbdev/vesafb.o: in function `vesafb_probe':
>>>> (.text+0x738): undefined reference to `screen_info'
>>>> hppa-linux-ld: (.text+0x73c): undefined reference to `screen_info'
>>    hppa-linux-ld: drivers/firmware/sysfb.o: in function `sysfb_init':
>>>> (.init.text+0x28): undefined reference to `screen_info'
>>>> hppa-linux-ld: (.init.text+0x30): undefined reference to `screen_info'
>>    hppa-linux-ld: (.init.text+0x78): undefined reference to `screen_info'
>>
>> The goal of commit fa0e256450f2 ("fbdev: vesafb: Allow to be built if
>> COMPILE_TEST is enabled") was to have more build coverage for the driver
>> but it wrongly assumed that all architectures would define a screen_info.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

