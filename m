Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BJKHpL6jGn5wQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFA3127E99
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 22:54:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EF010E660;
	Wed, 11 Feb 2026 21:54:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MZcqJ/9J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C1E10E660
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 21:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770846861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SI+sBRtkzJlBVk5fRANqyWyEonINF8qLvx0gBLbpWBU=;
 b=MZcqJ/9J4i5vNr9k1hb+9R+gpoasYPZgYK2IBDCncIzskKZqwf6d7Q4W7SCYuk5EPcOyhi
 yvMkawZpN0x6yh3pTrXABJDycGNaXuC5FC2hal5oClBbLNHu1GGcnBwXUBvZSTyeu+QQwQ
 pKP+4J6buTRuvMTPGR0ULsWp7zHsmvc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-HRdYidr9MNGQG-OgfsWwDw-1; Wed, 11 Feb 2026 16:54:18 -0500
X-MC-Unique: HRdYidr9MNGQG-OgfsWwDw-1
X-Mimecast-MFC-AGG-ID: HRdYidr9MNGQG-OgfsWwDw_1770846857
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47ee33324e8so23295535e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Feb 2026 13:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770846857; x=1771451657;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SI+sBRtkzJlBVk5fRANqyWyEonINF8qLvx0gBLbpWBU=;
 b=mluT7UgpVEu90+6PIwHeKaQHMdSuX7KHPWhqHVTFm/lTHyzD8GS8JoWOKo2/wULX7s
 GlhZZkyf5dGpWWaHv31QOqJtrHr8tj/5NVUUW6nzsSinwl5u+XeoUmKAZuqRZ56e1NdC
 RlQOi0K9PRL+4y+MMOXfKH436/FjaxhHRzn4A9yFfDFpG8BBtMHwdiHJXeKa4UE2zSv3
 jWWshvyWs3loM07tqsr2NBBZOXPfYMdEgiG6vlQDsu+ApXQtRpTyYjPTnIhnt9SJcS03
 N5pg/rVlRm2jErvDgrI+S3WLacFQFiClGG5TnBPoVCt3hxQpXTdZcgs1RdmCBYnOOi57
 jekg==
X-Gm-Message-State: AOJu0YyjvHI/FpRCMO3YRmrreOr3/Nqk7Py17HhuU+NpHjHZE06VI7Hk
 xNOLFUm3FUMHdaDJThyVzmXVg4uzNLXIQwGUjjCKVZBf2C5uzwUI+CJdQ+Y/8cDYPVlfLuW7EHX
 evIoIoptO6eeTseZSfdotez9eT8oqxTZCz+K8mJlIIbW7gPnXLv22EJgwA54bK49bloBBkA==
X-Gm-Gg: AZuq6aJ4lh88339cMmUXjwf1zGOUnja4oScc8u0vZo1K8Q5AaiAIuZaATGl0JuizZiF
 cZPKYv1Adba3f5BI9sXBMmMYyjmf4UOdfUW/wr6/2rTYMTQci5LVrut98wEjP7Ek8lIXitgam68
 y/X1MEyrToRMRE2pvwwAzDvkCTMpEK7rT1XzDXpLVE3LCGpqQMSzRPqFTu07/LFWVUywB1/75Z9
 7eQFLaNbVTDw6O0Qb6GNtiGlf+BtV4JBYrzXuW151kEXb1EhtbqLVvwItHixana8zgUrOLMxCuF
 0ZNRluzVDI0aqUV6mA6qvT32OvI53BUAzwstJv8H1bxhKKuTUbTC+3JuOsFs+5FOzXXF19VAucW
 ci/aHs3oaGu8v++JAV2ZujVneLVvdC3rSt093kurHPChg/36JLH3cvJGHpg+ekQ==
X-Received: by 2002:a05:600c:5252:b0:480:20f1:7aa6 with SMTP id
 5b1f17b1804b1-4836715a470mr429135e9.21.1770846856907; 
 Wed, 11 Feb 2026 13:54:16 -0800 (PST)
X-Received: by 2002:a05:600c:5252:b0:480:20f1:7aa6 with SMTP id
 5b1f17b1804b1-4836715a470mr428695e9.21.1770846856390; 
 Wed, 11 Feb 2026 13:54:16 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d5e0ed5sm141422575e9.5.2026.02.11.13.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Feb 2026 13:54:15 -0800 (PST)
Message-ID: <a5372b72-8dc0-4f2d-ad5c-086f3e75ee81@redhat.com>
Date: Wed, 11 Feb 2026 22:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/hyperv: During panic do VMBus unload after frame
 buffer is flushed
To: mhklinux@outlook.com, drawat.floss@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 longli@microsoft.com, ryasuoka@redhat.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org, stable@vger.kernel.org
References: <20260209070201.1492-1-mhklinux@outlook.com>
 <20260209070201.1492-2-mhklinux@outlook.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260209070201.1492-2-mhklinux@outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zctvKF9cIb6K0a8X8jBR8xN9btsX7F0ImNCtSsRVuhk_1770846857
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:mhklinux@outlook.com,m:drawat.floss@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:kys@microsoft.com,m:haiyangz@microsoft.com,m:wei.liu@kernel.org,m:decui@microsoft.com,m:longli@microsoft.com,m:ryasuoka@redhat.com,m:linux-kernel@vger.kernel.org,m:linux-hyperv@vger.kernel.org,m:stable@vger.kernel.org,m:drawatfloss@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[outlook.com,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,microsoft.com,redhat.com];
	FORGED_SENDER(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jfalempe@redhat.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[redhat.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1CFA3127E99
X-Rspamd-Action: no action

On 09/02/2026 08:02, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> In a VM, Linux panic information (reason for the panic, stack trace,
> etc.) may be written to a serial console and/or a virtual frame buffer
> for a graphics console. The latter may need to be flushed back to the
> host hypervisor for display.
> 
> The current Hyper-V DRM driver for the frame buffer does the flushing
> *after* the VMBus connection has been unloaded, such that panic messages
> are not displayed on the graphics console. A user with a Hyper-V graphics
> console is left with just a hung empty screen after a panic. The enhanced
> control that DRM provides over the panic display in the graphics console
> is similarly non-functional.
> 
> Commit 3671f3777758 ("drm/hyperv: Add support for drm_panic") added
> the Hyper-V DRM driver support to flush the virtual frame buffer. It
> provided necessary functionality but did not handle the sequencing
> problem with VMBus unload.
> 
> Fix the full problem by using VMBus functions to suppress the VMBus
> unload that is normally done by the VMBus driver in the panic path. Then
> after the frame buffer has been flushed, do the VMBus unload so that a
> kdump kernel can start cleanly. As expected, CONFIG_DRM_PANIC must be
> selected for these changes to have effect. As a side benefit, the
> enhanced features of the DRM panic path are also functional.

Thanks for properly fixing this issue with DRM Panic on hyperv.

I've a small comment below.

With that fixed:
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

The first patch looks good too, I can review it if no other step up, as 
I'm not familiar with hyperv.

> 
> Fixes: 3671f3777758 ("drm/hyperv: Add support for drm_panic")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>
> ---
>   drivers/gpu/drm/hyperv/hyperv_drm_drv.c     |  4 ++++
>   drivers/gpu/drm/hyperv/hyperv_drm_modeset.c | 15 ++++++++-------
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> index 06b5d96e6eaf..79e51643be67 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
> @@ -150,6 +150,9 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
>   		goto err_free_mmio;
>   	}
>   
> +	/* If DRM panic path is stubbed out VMBus code must do the unload */
> +	if (IS_ENABLED(CONFIG_DRM_PANIC) && IS_ENABLED(CONFIG_PRINTK))

I think drm_panic should still work without printk.
The "user" panic screen would be unaffected, but the "kmsg" screen might 
be blank, and the "qr_code" would generate an empty qr code.
(Actually I never tried to build a kernel without printk).

> +		vmbus_set_skip_unload(true);
>   	drm_client_setup(dev, NULL);
>   
>   	return 0;
> @@ -169,6 +172,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
>   	struct drm_device *dev = hv_get_drvdata(hdev);
>   	struct hyperv_drm_device *hv = to_hv(dev);
>   
> +	vmbus_set_skip_unload(false);
>   	drm_dev_unplug(dev);
>   	drm_atomic_helper_shutdown(dev);
>   	vmbus_close(hdev->channel);
> diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> index 7978f8c8108c..d48ca6c23b7c 100644
> --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> @@ -212,15 +212,16 @@ static void hyperv_plane_panic_flush(struct drm_plane *plane)
>   	struct hyperv_drm_device *hv = to_hv(plane->dev);
>   	struct drm_rect rect;
>   
> -	if (!plane->state || !plane->state->fb)
> -		return;
> +	if (plane->state && plane->state->fb) {
> +		rect.x1 = 0;
> +		rect.y1 = 0;
> +		rect.x2 = plane->state->fb->width;
> +		rect.y2 = plane->state->fb->height;
>   
> -	rect.x1 = 0;
> -	rect.y1 = 0;
> -	rect.x2 = plane->state->fb->width;
> -	rect.y2 = plane->state->fb->height;
> +		hyperv_update_dirt(hv->hdev, &rect);
> +	}
>   
> -	hyperv_update_dirt(hv->hdev, &rect);
> +	vmbus_initiate_unload(true);
>   }
>   
>   static const struct drm_plane_helper_funcs hyperv_plane_helper_funcs = {

-- 

Jocelyn

