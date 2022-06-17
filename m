Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188E54F132
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 08:46:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D907511A675;
	Fri, 17 Jun 2022 06:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB04311A675
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 06:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655448386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+hQ4DbL4FBpOEp/E50yBIWWCZyfpTsZUOXGgMRiUx5A=;
 b=R584zAX/QY3XaCjUI1geZKTrymAfObLI+hdicI3YfpBReA1brDXpPw3+JlOctrYQUWDv2c
 CvomGJo4i/WhTms4PZ3wmyPV/M/nmKWDhS6uQLOm26merotxknMsLGtwY4bWtodxsN/EJW
 KxhbRmDRzbXJEnZrAXpdJv41J4D9+uQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-418-O1djBx9tPv2h7nXtGnlR4A-1; Fri, 17 Jun 2022 02:46:22 -0400
X-MC-Unique: O1djBx9tPv2h7nXtGnlR4A-1
Received: by mail-wm1-f69.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so1271277wmr.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 23:46:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+hQ4DbL4FBpOEp/E50yBIWWCZyfpTsZUOXGgMRiUx5A=;
 b=7TH44LpC6VtAGURZjRvPmQkcTLt/kztCvHuAM5by7M2GPuTRUwkqSiiCziLXEnCdhR
 CMjbOwNn16hOUabOGtIeWxQ8K8R+Gn8SvI/aI7Eo5QbjonPECAml8aZNGCBjP3mkoi6Q
 k5nCdqx6qX8basCrNMjgocRgvb1VGDLOcF13xpS0T3ryYvOW1/gq5SBWZz1ahlFaqCXj
 dOp5T8Gq87NfjhEK8IqBhp/iiJZePwaUaeESJj1dwR4I8icbQQKV5m3Iv3m1tbm5LVmO
 Ww7nJ6nDzL9eGwZYLaj9H/g1yYsQ9t1GNOBj/gODA9tcR309sju8H9PCCE5jBcu1GEpz
 4xXQ==
X-Gm-Message-State: AJIora8MzuardeH8sNvhGZvNmgCYq4DXxoKv+tQuZ+opERgzxaabVN8b
 ODU1/mVPN0sJZ9rNv1Bp5b5ulKj+kamqRfIQgJ/sUK0d5SRtlbX7DFPZR6xff5JWTqUPOj8AZZn
 g9VV1jFTi2m4ENjy+jFrsHHqq8G81
X-Received: by 2002:a05:600c:3489:b0:39d:b58f:6797 with SMTP id
 a9-20020a05600c348900b0039db58f6797mr8604229wmq.205.1655448381561; 
 Thu, 16 Jun 2022 23:46:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sQ/maUwRNsLJ+dTUUPQVEZ65LnPBk/IMQjAM9szqh0Rf1kxBOzJQNiJ8h903v4iEFev4ehFw==
X-Received: by 2002:a05:600c:3489:b0:39d:b58f:6797 with SMTP id
 a9-20020a05600c348900b0039db58f6797mr8604207wmq.205.1655448381308; 
 Thu, 16 Jun 2022 23:46:21 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003973a3fe4fasm4787183wmq.42.2022.06.16.23.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Jun 2022 23:46:20 -0700 (PDT)
Message-ID: <aa144e20-a555-5c30-4796-09713c12ab0e@redhat.com>
Date: Fri, 17 Jun 2022 08:46:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 3/5] fbdev: Disable sysfb device registration when
 removing conflicting FBs
To: Zack Rusin <zackr@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20220607182338.344270-1-javierm@redhat.com>
 <20220607182338.344270-4-javierm@redhat.com>
 <de83ae8cb6de7ee7c88aa2121513e91bb0a74608.camel@vmware.com>
 <38473dcd-0666-67b9-28bd-afa2d0ce434a@redhat.com>
 <603e3613b9b8ff7815b63f294510d417b5b12937.camel@vmware.com>
 <a633d605-4cb3-2e04-1818-85892cf6f7b0@redhat.com>
 <97565fb5-cf7f-5991-6fb3-db96fe239ee8@redhat.com>
 <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <711c88299ef41afd8556132b7c1dcb75ee7e6117.camel@vmware.com>
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

Hello Zack,

On 6/17/22 03:35, Zack Rusin wrote:
> On Fri, 2022-06-17 at 01:21 +0200, Javier Martinez Canillas wrote:
>> On 6/17/22 00:18, Javier Martinez Canillas wrote:
>>> On 6/16/22 23:03, Zack Rusin wrote:
>>
>> [snip]
>>
>>>
>>> I'll look at this tomorrow but in the meantime, could you please look if the following
>>> commits on top of drm-misc-next help ?
>>>
>>> d258d00fb9c7 fbdev: efifb: Cleanup fb_info in .fb_destroy rather than .remove
>>> 1b5853dfab7f fbdev: efifb: Fix a use-after-free due early fb_info cleanup
>>>
>>
>> Scratch that. I see in your config now that you are not using efifb but instead
>> simpledrm: CONFIG_DRM_SIMPLEDRM=y, CONFIG_SYSFB_SIMPLEFB=y and CONFIG_DRM_VMWGFX.
>>
>> Since you mentioned efifb I misunderstood that you are using it. Anyways, as
>> said I'll investigate this tomorrow.
> 
> Sounds good. Let me know if you'd like me to try it without SIMPLEFB.
>

Yes, please do. Either with CONFIG_SYSFB_SIMPLEFB disabled and CONFIG_FB_EFI
enabled (so that "efi-framebuffer" is registered and efifb probed) or with
CONFIG_SYSFB_SIMPLEFB but CONFIG_FB_SIMPLE enabled (so "simple-framebuffer
is used too but with simplefb instead of simpledrm).
 
I'm not able to reproduce, it would be useful to have another data point.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

