Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B289565BE1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3596C10F886;
	Mon,  4 Jul 2022 16:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BDE10E0F4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656932666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KGFeIbWlW1ILCPGgWjFFmuEvOy5XT3e1wvU13U4kX4w=;
 b=fKh8Oegn0uK5I779nZxl59fEoqKtOTTfeL5o033A6sOjHJvPoR3kdxjRcZTCX3z0CF/EYI
 5mLPBntx+axNp+4wfwH1D5JMmTTFsOOq7jwoK4EZKAhGCNU+2ZORubRwmNjaR/zy1cu+ft
 lhwsUDyzI2nwVl6K3zDy1aBhfGV0knE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-608-lJ8_HqLHOuavzdTBCQ3fGg-1; Mon, 04 Jul 2022 07:04:25 -0400
X-MC-Unique: lJ8_HqLHOuavzdTBCQ3fGg-1
Received: by mail-wr1-f72.google.com with SMTP id
 n5-20020adf8b05000000b00219ece7272bso1356139wra.8
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Jul 2022 04:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KGFeIbWlW1ILCPGgWjFFmuEvOy5XT3e1wvU13U4kX4w=;
 b=wc9fcwDHjUPhnJR97zYk4hh8EqEEiWOuMpqjX8APvpzdeVoLyEWvcBCwhpLN6b9H5a
 dXsnSWWGPQSwxiIPPx7vW8lxthSVr46V47tde05KmFjzNxslWahjrvhBbJ4gJXfnEJ/E
 vj0IVV3Wwx78lSYErtC5AF/mrEIolwSYdoOLzJcXAH8rJQRtYQGGM6G7tNZ4X1UZgbZU
 hLPjv2/8bYj22eT+YSD2RR7jVR2v6D4szYTdX/AZHrsZ/jLLQLhiGiVfI10GHElU190h
 90QCgKG5gvoQjR8VdpkRlY1efcO/MapKj9/GkvOKWr4tlBfCoLUUlHJo1zdV9nDRE+B8
 5wNw==
X-Gm-Message-State: AJIora9T1hlZ/ZL4qrsN+P0YlCO9bzO8g0iQKiOe7Gm2+Buv+lTWiCSm
 GReeJjl9s6IXXvDZu86Ua01vqErAT1kvnVANNMMErJi5PSL/aQrOHLMJ0XYRZ4rcWHLwkjqr6ZQ
 +1pASQxQ/WOAMoZvYgHhZv1p64Z8u
X-Received: by 2002:adf:d1e8:0:b0:21b:b7dc:68e with SMTP id
 g8-20020adfd1e8000000b0021bb7dc068emr25386641wrd.683.1656932664004; 
 Mon, 04 Jul 2022 04:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uC8pVOnL2C020eJ5sZKL3StC87b8SldI7PLS1G/8+wBNOr79faqgITskCpRG1BFWbIhw1SiQ==
X-Received: by 2002:adf:d1e8:0:b0:21b:b7dc:68e with SMTP id
 g8-20020adfd1e8000000b0021bb7dc068emr25386608wrd.683.1656932663759; 
 Mon, 04 Jul 2022 04:04:23 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b0039c41686421sm17712919wmg.17.2022.07.04.04.04.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:04:23 -0700 (PDT)
Message-ID: <fddf5ca6-77dc-88f9-c191-7de09717063c@redhat.com>
Date: Mon, 4 Jul 2022 13:04:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
To: Xi Ruoyao <xry111@linuxfromscratch.org>, Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
 <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
 <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
 <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
 <64c753c98488a64b470009e45769ceab29fd8130.camel@linuxfromscratch.org>
 <61f2e4e2af40cb9d853504d0a6fe01829ff8ca60.camel@linuxfromscratch.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <61f2e4e2af40cb9d853504d0a6fe01829ff8ca60.camel@linuxfromscratch.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "deller@gmx.de" <deller@gmx.de>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "lersek@redhat.com" <lersek@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Xi,

On 7/4/22 12:29, Xi Ruoyao wrote:
> On Mon, 2022-07-04 at 17:36 +0800, Xi Ruoyao wrote:
> 
>>> Yes, please do. Either with CONFIG_SYSFB_SIMPLEFB disabled and CONFIG_FB_EFI
>>> enabled (so that "efi-framebuffer" is registered and efifb probed) or with
>>> CONFIG_SYSFB_SIMPLEFB but CONFIG_FB_SIMPLE enabled (so "simple-framebuffer
>>> is used too but with simplefb instead of simpledrm).
>>>  
>>> I'm not able to reproduce, it would be useful to have another data point.
>>
>> Also happening for me with CONFIG_SYSFB_SIMPLEFB, on a Intel Core i7-
>> 1065G7 (with iGPU).
>>
>> Reverting this commit on top of 5.19-rc5 "fixes" the issue.
> 
> With CONFIG_SYSFB_SIMPLEFB and CONFIG_FB_SIMPLE enabled, there is no
> issue.
> 
> I guess it's something going wrong on a "drm -> drm" pass over.  For now
> I'll continue to use simpledrm with this commit reverted.
> 

Yes, we need to also cherry-pick b84efa28a48 ("drm/aperture: Run fbdev
removal before internal helpers") now that the sysfb_disable() patches
are in v5.19-rc5.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

