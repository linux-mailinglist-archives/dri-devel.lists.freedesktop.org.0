Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE45652059B
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E9F10EE0F;
	Mon,  9 May 2022 20:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718D10EC42
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 20:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652126447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gNTeuuELA3k+mm60Gr40WBmjicvf+wfPyLcRV/GayX4=;
 b=iAtXXhWdG7/zvSmlWOvT1Zrr7SMLUyAYwOZ/iVukffhBeChk3gUxA0jDmsFrActnJ/R+tB
 xzfvPsly4hkI/XX/MrgBvtNa6iDJacfAYBGhYhhpisegjivg/QwDi+hD8CLwCn4qL2yJde
 vwitfZiw1Av8ICzryHuVK0mx8CNgyxE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-hAuAvThKOByzBwbEFnQGfw-1; Mon, 09 May 2022 16:00:44 -0400
X-MC-Unique: hAuAvThKOByzBwbEFnQGfw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso4637900wme.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 May 2022 13:00:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gNTeuuELA3k+mm60Gr40WBmjicvf+wfPyLcRV/GayX4=;
 b=iTqkj/dcYevwbAY5UJTxvHH+HxPRvX1pgFCCTLo0pozX91ueKhIhOms4qrNcx/o/Or
 J/xDsJ/W7uyOwNWBjgw0tpwMT74o+KvZsR1tILFG8KNM25KWhAvttZp7GKnwkjKNn4M+
 Cy0t92RhJ1XYj6673oY7SPty7aJ3b5N1Gr3QG40qT4+nQAJyDJ256OAtt+GbuTszyu3Y
 IHeUekkT1z9JD9n7xUN4Mk5LFEzViyqH+vJDyCROVW7VHVZXs45YRNid/IZGr6cuFQHQ
 OzZcNdbKc2xQ+ipIUas8VCsAcHBVYzKkLMoUBLnLsznHSPC2wMnXlcJaOnKAloKqFcwX
 lVXQ==
X-Gm-Message-State: AOAM532DFRy78hZmoTZrya0e7J+oa9jvE53VL0eL4o0FUPX+XyxjdSV4
 0hgPX7dz7p67I2xHOWvdVyQYuYAtvOHqKzS5sDCO7Kpa1hdwNzLXPQbkXaDjfYs9pr3It5G3HgL
 iB9CcRak9ks8Ei58YdXKzIdAvTRTf
X-Received: by 2002:a05:6000:1f0e:b0:20c:4fde:7e20 with SMTP id
 bv14-20020a0560001f0e00b0020c4fde7e20mr15545384wrb.532.1652126442993; 
 Mon, 09 May 2022 13:00:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyACMJm+r6tlK8VZGCgzdHoFW+ert1TBWVKzmQnKSqvFbAYevfQT5KjzCveN5b6GZInW/cO7g==
X-Received: by 2002:a05:6000:1f0e:b0:20c:4fde:7e20 with SMTP id
 bv14-20020a0560001f0e00b0020c4fde7e20mr15545370wrb.532.1652126442776; 
 Mon, 09 May 2022 13:00:42 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 o41-20020a05600c512900b00394832af31csm1280992wms.0.2022.05.09.13.00.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 May 2022 13:00:42 -0700 (PDT)
Message-ID: <2c59cd79-76d4-7829-e1db-88bc31396c8a@redhat.com>
Date: Mon, 9 May 2022 22:00:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in
 fb_release()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-kernel@vger.kernel.org
References: <20220505215947.364694-1-javierm@redhat.com>
 <20220505220413.365977-1-javierm@redhat.com>
 <753d0350-42dc-389b-b10b-4533ddcf32ac@intel.com>
 <1f788b8f-0bea-1818-349e-b1bc907bf251@redhat.com>
 <a339df59-9e00-c7cb-e33d-2ac626443639@intel.com>
 <3b7fe4fe-fdec-cef2-4e0e-309d9dc4a8af@redhat.com>
 <51254d3d-af8d-61b3-e8a2-8fd0e583e783@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <51254d3d-af8d-61b3-e8a2-8fd0e583e783@suse.de>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/9/22 20:32, Thomas Zimmermann wrote:
> Hi
> 
> Am 09.05.22 um 18:33 schrieb Javier Martinez Canillas:
>> On 5/9/22 17:51, Andrzej Hajda wrote:
>>
>> [snip]
>>
>>>>>> +
>>>>> Regarding drm:
>>>>> What about drm_fb_helper_fini? It calls also framebuffer_release and is
>>>>> called often from _remove paths (checked intel/radeon/nouveau). I guess
>>>>> it should be fixed as well. Do you plan to fix it?
>>>>>
>>>> I think you are correct. Maybe we need something like the following?
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
>>>> index d265a73313c9..b09598f7af28 100644
>>>> --- a/drivers/gpu/drm/drm_fb_helper.c
>>>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>>>> @@ -631,7 +631,6 @@ void drm_fb_helper_fini(struct drm_fb_helper *fb_helper)
>>>>           if (info) {
>>>>                   if (info->cmap.len)
>>>>                           fb_dealloc_cmap(&info->cmap);
>>>> -               framebuffer_release(info);
> 
> After reviewing that code,  drm_fb_helper_fini() appears to be called 
> from .fb_destroy (see drm_fbdev_release).  The code is hard to follow 
> though.  If there another way of releasing the framebuffer here?
> 

Andrzej mentioned intel/radeon/nouveau as example, I only looked at i915
and the call chain is the following as far as I can tell:

struct pci_driver i915_pci_driver = {
...
        .remove = i915_pci_remove,
...
};


i915_driver_remove
  intel_modeset_driver_remove_noirq
    intel_fbdev_fini
      intel_fbdev_destroy
        drm_fb_helper_fini
          framebuffer_release
              
So my underdestanding is that if a program has the emulated fbdev device
opened and the i915 module is removed, then a use-after-free would be
triggered on drm_fbdev_fb_destroy() once the program closes the device:

drm_fbdev_fb_destroy
  drm_fbdev_release(info->par); <-- info was already freed on .remove

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

