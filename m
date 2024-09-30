Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9089A98A13D
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 13:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BB310E405;
	Mon, 30 Sep 2024 11:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ha5j6UrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FED010E407
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727697415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nxq6YZmkTM9jk+Ql7XyTn1VEIFUz8hPH0AWQSJCQvSo=;
 b=Ha5j6UrXk6kXrgntctokX7OkeALLTG0+Q52ZBCA19yoTsvgh31Hq4JVVLdCrRnHgKJrvlX
 Pe+crR3eBYipxpASGZDguhxtnYwMkd4tfZiN2gTQXqyOaJXySX4SELTWdIn8kwpn1xETW8
 tEMNuJVmRl4Ol+NIXExf45Jw52TR7QM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-486-3chHva9_NMChkTOrOquy6g-1; Mon, 30 Sep 2024 07:56:52 -0400
X-MC-Unique: 3chHva9_NMChkTOrOquy6g-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-37ccd7c3080so1802780f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2024 04:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727697411; x=1728302211;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nxq6YZmkTM9jk+Ql7XyTn1VEIFUz8hPH0AWQSJCQvSo=;
 b=G5YgBE2FlFbKUNzoMuNr3NkZub91VXnftpW18YJQFUhD3/p1BF7+pd+UCxH/VbdOMT
 oMrR7II3CumkZH9xRJpeVjHjl+u+t1Kf0mqICqGUFxodNjeC411n12K/mVEmxjXV+vBE
 MUz1kJTRagykQ1mKXE2wDjk0xmyhqSSPmMLD/JUzwkHbCbkXFj273DRtMCo1K+phGj1N
 WZ0XAIbt1+7IC/+s9X6HUnOm07g3JqKXMhD4koRGoVMBdkfSub/qF2ohhmvWp0PbNoH7
 gxrB8ma0vus6AUK6qrAT4QB/Fe/Pnb2HzlOFpj0Pz2+hZ8LViA2b4cqM3tV3B28p9nZM
 NBkQ==
X-Gm-Message-State: AOJu0YwmxT8opVq/cwNTxULoOvA94x90YJSPUk4tVqQcLBfMrjWcBqyg
 LY6FDuqm5BfO3dUJ8LEzIKWA8vCLHjx1gFXT8kn4sqqiV5IZ99bEzzOtHMyYSG4Y+QQsyR6G4AS
 jXm9WVFi2TbecBMrqOVZNq3YJ40+SwZTg9xGIIPWQlFOA3pg+sOXmJ3ra9HbFNb4x7g==
X-Received: by 2002:adf:edc9:0:b0:374:c949:836d with SMTP id
 ffacd0b85a97d-37cd5af262bmr6640398f8f.37.1727697410911; 
 Mon, 30 Sep 2024 04:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7Ker1ODfjeRHais1FUnX+sXBUh4Z2ptuze59c02C4GGacFQ0S5KBus9z41ehuRRQegeQBBQ==
X-Received: by 2002:adf:edc9:0:b0:374:c949:836d with SMTP id
 ffacd0b85a97d-37cd5af262bmr6640376f8f.37.1727697410459; 
 Mon, 30 Sep 2024 04:56:50 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cd5ef89c5sm8670536f8f.31.2024.09.30.04.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Sep 2024 04:56:49 -0700 (PDT)
Message-ID: <ce2af7cc-0b7b-42a4-a072-2c1d5a382554@redhat.com>
Date: Mon, 30 Sep 2024 13:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm: Add client-lib module
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
 <20240927144252.31813-6-tzimmermann@suse.de>
 <d4da8265-5bbc-44fc-95cc-385b6216b47b@redhat.com>
In-Reply-To: <d4da8265-5bbc-44fc-95cc-385b6216b47b@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2024 13:55, Jocelyn Falempe wrote:
> On 27/09/2024 16:37, Thomas Zimmermann wrote:
>> Add drm_client_lib.ko to contain most of the client code. Move the
>> existing client for fbdev emulation into the new module. Protect the
>> new module behind CONFIG_DRM_CLIENT.
>>
>> The Kconfig rules separate the DRM drivers from the DRM clients. A
>> driver can opt into the default clients, but the user configures
>> each client individually. To do so, DRM drivers still select
>> DRM_CLIENT_SELECTION. The option is now a tristate that further
>> selects all dependencies of the enabled DRM clients. There's
>> a menu option for each client. Enabling at least one client also
>> selects DRM_CLIENT_SETUP, so that drivers call drm_client_setup().
>> New DRM clients should depend on DRM_CLIENT_SELECTION.
>>
>> The KMS-helper module now exports handful of symbols needed by the
>> DRM client library.
>>
>> There are existing kernel options in drm_fb_helper.o, so leave this
>> file in the KMS-helper module for now.
>>
>> Amdgpu has an internal DRM client, so it has to select DRM_CLIENT by
>> itself unconditionally.
> 
> Thanks, I found a typo in the Makefile (see below), other than that it 
> looks good to me.

Sorry, this time with the typo below.
> 
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/Kconfig            | 31 ++++++++++++++++++++++++------
>>   drivers/gpu/drm/Makefile           | 19 +++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/Kconfig |  1 +
>>   drivers/gpu/drm/drm_client.c       |  3 +++
>>   drivers/gpu/drm/drm_dumb_buffers.c |  2 ++
>>   drivers/gpu/drm/drm_file.c         |  2 ++
>>   drivers/gpu/drm/drm_framebuffer.c  |  2 ++
>>   drivers/gpu/drm/drm_gem.c          |  2 ++
>>   8 files changed, 51 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
>> index 88b2ba55fe16..379fccf3a6ea 100644
>> --- a/drivers/gpu/drm/Kconfig
>> +++ b/drivers/gpu/drm/Kconfig
>> @@ -9,8 +9,6 @@ menuconfig DRM
>>       tristate "Direct Rendering Manager (XFree86 4.1.0 and higher DRI 
>> support)"
>>       depends on (AGP || AGP=n) && !EMULATED_CMPXCHG && HAS_DMA
>>       select DRM_PANEL_ORIENTATION_QUIRKS
>> -    select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>> -    select FB_CORE if DRM_FBDEV_EMULATION
>>       select HDMI
>>       select I2C
>>       select DMA_SHARED_BUFFER
>> @@ -209,21 +207,40 @@ config DRM_DEBUG_MODESET_LOCK
>>         If in doubt, say "N".
>> +config DRM_CLIENT
>> +    tristate
>> +    depends on DRM
>> +    help
>> +      Enables the DRM client-lib module. DRM drivers that need
>> +      struct drm_client_dev and its interfaces should select this
>> +      option. Drivers that support the default clients should
>> +      select DRM_CLIENT_SELECTION instead.
>> +
>>   config DRM_CLIENT_SELECTION
>> -    bool
>> +    tristate
>>       depends on DRM
>> -    select DRM_CLIENT_SETUP if DRM_FBDEV_EMULATION
>> +    select DRM_CLIENT if DRM_FBDEV_EMULATION
>> +    select DRM_KMS_HELPER if DRM_FBDEV_EMULATION
>> +    select FB_CORE if DRM_FBDEV_EMULATION
>>       help
>>         Drivers that support in-kernel DRM clients have to select this
>> -      option.
>> +      option. It selects all modules and components according to the
>> +      enabled clients.
>>   config DRM_CLIENT_SETUP
>>       bool
>>       depends on DRM_CLIENT_SELECTION
>> +    help
>> +      Enables the DRM client selection. DRM drivers that support the
>> +      default clients should select DRM_CLIENT_SELECTION instead.
>> +
>> +menu "Supported DRM clients"
>> +    depends on DRM_CLIENT_SELECTION
>>   config DRM_FBDEV_EMULATION
>>       bool "Enable legacy fbdev support for your modesetting driver"
>> -    depends on DRM
>> +    depends on DRM_CLIENT_SELECTION
>> +    select DRM_CLIENT_SETUP
>>       select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>>       default FB
>>       help
>> @@ -262,6 +279,8 @@ config DRM_FBDEV_LEAK_PHYS_SMEM
>>         If in doubt, say "N" or spread the word to your closed source
>>         library vendor.
>> +endmenu
>> +
>>   config DRM_LOAD_EDID_FIRMWARE
>>       bool "Allow to specify an EDID data set instead of probing for it"
>>       depends on DRM
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index c50443756457..419208b97f57 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -41,9 +41,7 @@ drm-y := \
>>       drm_blend.o \
>>       drm_bridge.o \
>>       drm_cache.o \
>> -    drm_client.o \
>>       drm_client_dev.o \
>> -    drm_client_modeset.o \
>>       drm_color_mgmt.o \
>>       drm_connector.o \
>>       drm_crtc.o \
>> @@ -144,14 +142,25 @@ drm_kms_helper-y := \
>>       drm_probe_helper.o \
>>       drm_self_refresh_helper.o \
>>       drm_simple_kms_helper.o
>> -drm_kms_helper-$(CONFIG_DRM_CLIENT_SETUP) += \
>> -    drm_client_setup.o
>>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += \
>> -    drm_fbdev_client.o \
>>       drm_fb_helper.o
>> +drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o

Typo: the above line is duplicated.

>>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>> +#
>> +# DRM clients
>> +#
>> +
>> +drm_client_lib-y := \
>> +    drm_client.o \
>> +    drm_client_modeset.o
>> +drm_client_lib-$(CONFIG_DRM_CLIENT_SETUP) += \
>> +    drm_client_setup.o
>> +drm_client_lib-$(CONFIG_DRM_FBDEV_EMULATION) += \
>> +    drm_fbdev_client.o
>> +obj-$(CONFIG_DRM_CLIENT) += drm_client_lib.o
>> +
>>   #
>>   # Drivers and the rest
>>   #
>> diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/ 
>> amdgpu/Kconfig
>> index 680a94c361ba..41fa3377d9cf 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/Kconfig
>> +++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
>> @@ -5,6 +5,7 @@ config DRM_AMDGPU
>>       depends on DRM && PCI && MMU
>>       depends on !UML
>>       select FW_LOADER
>> +    select DRM_CLIENT
>>       select DRM_CLIENT_SELECTION
>>       select DRM_DISPLAY_DP_HELPER
>>       select DRM_DISPLAY_DSC_HELPER
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index 549b28a5918c..864ee96e48cf 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -490,3 +490,6 @@ int drm_client_framebuffer_flush(struct 
>> drm_client_buffer *buffer, struct drm_re
>>                       0, 0, NULL, 0);
>>   }
>>   EXPORT_SYMBOL(drm_client_framebuffer_flush);
>> +
>> +MODULE_DESCRIPTION("In-kernel DRM clients");
>> +MODULE_LICENSE("GPL and additional rights");
>> diff --git a/drivers/gpu/drm/drm_dumb_buffers.c b/drivers/gpu/drm/ 
>> drm_dumb_buffers.c
>> index 70032bba1c97..7ed8f05a8d5c 100644
>> --- a/drivers/gpu/drm/drm_dumb_buffers.c
>> +++ b/drivers/gpu/drm/drm_dumb_buffers.c
>> @@ -95,6 +95,7 @@ int drm_mode_create_dumb(struct drm_device *dev,
>>       return dev->driver->dumb_create(file_priv, dev, args);
>>   }
>> +EXPORT_SYMBOL(drm_mode_create_dumb);
>>   int drm_mode_create_dumb_ioctl(struct drm_device *dev,
>>                      void *data, struct drm_file *file_priv)
>> @@ -141,6 +142,7 @@ int drm_mode_destroy_dumb(struct drm_device *dev, 
>> u32 handle,
>>       return drm_gem_handle_delete(file_priv, handle);
>>   }
>> +EXPORT_SYMBOL(drm_mode_destroy_dumb);
>>   int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
>>                   void *data, struct drm_file *file_priv)
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 01fde94fe2a9..dd847b574457 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -186,6 +186,7 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>> *minor)
>>       return ERR_PTR(ret);
>>   }
>> +EXPORT_SYMBOL(drm_file_alloc);
>>   static void drm_events_release(struct drm_file *file_priv)
>>   {
>> @@ -261,6 +262,7 @@ void drm_file_free(struct drm_file *file)
>>       put_pid(rcu_access_pointer(file->pid));
>>       kfree(file);
>>   }
>> +EXPORT_SYMBOL(drm_file_free);
>>   static void drm_close_helper(struct file *filp)
>>   {
>> diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/ 
>> drm_framebuffer.c
>> index 47e6e8577b62..761262529416 100644
>> --- a/drivers/gpu/drm/drm_framebuffer.c
>> +++ b/drivers/gpu/drm/drm_framebuffer.c
>> @@ -349,6 +349,7 @@ int drm_mode_addfb2(struct drm_device *dev,
>>       return 0;
>>   }
>> +EXPORT_SYMBOL(drm_mode_addfb2);
>>   int drm_mode_addfb2_ioctl(struct drm_device *dev,
>>                 void *data, struct drm_file *file_priv)
>> @@ -473,6 +474,7 @@ int drm_mode_rmfb(struct drm_device *dev, u32 fb_id,
>>       return 0;
>>   }
>> +EXPORT_SYMBOL(drm_mode_rmfb);
>>   int drm_mode_rmfb_ioctl(struct drm_device *dev,
>>               void *data, struct drm_file *file_priv)
>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> index ee811764c3df..07ae82e35517 100644
>> --- a/drivers/gpu/drm/drm_gem.c
>> +++ b/drivers/gpu/drm/drm_gem.c
>> @@ -1191,12 +1191,14 @@ int drm_gem_pin_locked(struct drm_gem_object 
>> *obj)
>>       return 0;
>>   }
>> +EXPORT_SYMBOL(drm_gem_pin_locked);
>>   void drm_gem_unpin_locked(struct drm_gem_object *obj)
>>   {
>>       if (obj->funcs->unpin)
>>           obj->funcs->unpin(obj);
>>   }
>> +EXPORT_SYMBOL(drm_gem_unpin_locked);
>>   int drm_gem_pin(struct drm_gem_object *obj)
>>   {
> 

