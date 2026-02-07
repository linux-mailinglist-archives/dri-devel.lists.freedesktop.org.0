Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2gDjJw2ih2kMbAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 21:35:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 626BE107107
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 21:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0216A10E119;
	Sat,  7 Feb 2026 20:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="KroT1XXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0C110E119
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aABAViX/ttG2bkxhuhmtrbE1mxWIHnClv0RTG6gtS0M=; b=KroT1XXRXgfg7tifXo9uo/DcAV
 BmC61+2/chkt9S4UgNuqqhJdCbdiYRsK9cUeyLocwivQZEuWya1OUGQePXbPIRl+pihb8q8LH9goz
 MzYyTBfWQhOfGilkkY4qsthTFM545uO/vFMtYfvLZTcT3I5SoR+TpYXIRE45//ug3WFiTXMR7rbji
 YYONQFditdvMWWLjI76mNXRGNR2QjBNF6mu/d9nkY93Q5IGBAZ6+NL416YBOnM3ZHvNwBxZt+ai2O
 sISXX8UKP5V2dAS9j3NwSVFsLt1bQxl5CVQ2V7OZRnhdkVjco3Nw4k5Nftxz2LBf0NfCJi0fp4O8o
 piEyfDdw==;
Received: from [187.36.210.68] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vop1D-00FNp7-Mm; Sat, 07 Feb 2026 21:35:03 +0100
Message-ID: <64a6f534-b94b-4a53-ae7f-4171168837ed@igalia.com>
Date: Sat, 7 Feb 2026 17:34:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/15] drm/vc4: Switch private_obj initialization to
 atomic_create_state
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, kernel-list@raspberrypi.com
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
 <20260128-drm-private-obj-reset-v4-14-90891fa3d3b0@redhat.com>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Content-Language: en-US
Autocrypt: addr=mcanal@igalia.com; keydata=
 xsBNBGcCwywBCADgTji02Sv9zjHo26LXKdCaumcSWglfnJ93rwOCNkHfPIBll85LL9G0J7H8
 /PmEL9y0LPo9/B3fhIpbD8VhSy9Sqz8qVl1oeqSe/rh3M+GceZbFUPpMSk5pNY9wr5raZ63d
 gJc1cs8XBhuj1EzeE8qbP6JAmsL+NMEmtkkNPfjhX14yqzHDVSqmAFEsh4Vmw6oaTMXvwQ40
 SkFjtl3sr20y07cJMDe++tFet2fsfKqQNxwiGBZJsjEMO2T+mW7DuV2pKHr9aifWjABY5EPw
 G7qbrh+hXgfT+njAVg5+BcLz7w9Ju/7iwDMiIY1hx64Ogrpwykj9bXav35GKobicCAwHABEB
 AAHNIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+wsCRBBMBCAA7FiEE+ORdfQEW
 dwcppnfRP/MOinaI+qoFAmcCwywCGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQ
 P/MOinaI+qoUBQgAqz2gzUP7K3EBI24+a5FwFlruQGtim85GAJZXToBtzsfGLLVUSCL3aF/5
 O335Bh6ViSBgxmowIwVJlS/e+L95CkTGzIIMHgyUZfNefR2L3aZA6cgc9z8cfow62Wu8eXnq
 GM/+WWvrFQb/dBKKuohfBlpThqDWXxhozazCcJYYHradIuOM8zyMtCLDYwPW7Vqmewa+w994
 7Lo4CgOhUXVI2jJSBq3sgHEPxiUBOGxvOt1YBg7H9C37BeZYZxFmU8vh7fbOsvhx7Aqu5xV7
 FG+1ZMfDkv+PixCuGtR5yPPaqU2XdjDC/9mlRWWQTPzg74RLEw5sz/tIHQPPm6ROCACFls7A
 TQRnAsMsAQgAxTU8dnqzK6vgODTCW2A6SAzcvKztxae4YjRwN1SuGhJR2isJgQHoOH6oCItW
 Xc1CGAWnci6doh1DJvbbB7uvkQlbeNxeIz0OzHSiB+pb1ssuT31Hz6QZFbX4q+crregPIhr+
 0xeDi6Mtu+paYprI7USGFFjDUvJUf36kK0yuF2XUOBlF0beCQ7Jhc+UoI9Akmvl4sHUrZJzX
 LMeajARnSBXTcig6h6/NFVkr1mi1uuZfIRNCkxCE8QRYebZLSWxBVr3h7dtOUkq2CzL2kRCK
 T2rKkmYrvBJTqSvfK3Ba7QrDg3szEe+fENpL3gHtH6h/XQF92EOulm5S5o0I+ceREwARAQAB
 wsB2BBgBCAAgFiEE+ORdfQEWdwcppnfRP/MOinaI+qoFAmcCwywCGwwACgkQP/MOinaI+qpI
 zQf+NAcNDBXWHGA3lgvYvOU31+ik9bb30xZ7IqK9MIi6TpZqL7cxNwZ+FAK2GbUWhy+/gPkX
 it2gCAJsjo/QEKJi7Zh8IgHN+jfim942QZOkU+p/YEcvqBvXa0zqW0sYfyAxkrf/OZfTnNNE
 Tr+uBKNaQGO2vkn5AX5l8zMl9LCH3/Ieaboni35qEhoD/aM0Kpf93PhCvJGbD4n1DnRhrxm1
 uEdQ6HUjWghEjC+Jh9xUvJco2tUTepw4OwuPxOvtuPTUa1kgixYyG1Jck/67reJzMigeuYFt
 raV3P8t/6cmtawVjurhnCDuURyhUrjpRhgFp+lW8OGr6pepHol/WFIOQEg==
In-Reply-To: <20260128-drm-private-obj-reset-v4-14-90891fa3d3b0@redhat.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mripard@kernel.org,m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dave.stevenson@raspberrypi.com,m:kernel-list@raspberrypi.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[igalia.com:-];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 626BE107107
X-Rspamd-Action: no action

Hi Maxime,

On 28/01/26 09:43, Maxime Ripard wrote:
> The vc4 driver relies on a drm_private_obj, that is initialized by
> allocating and initializing a state, and then passing it to
> drm_private_obj_init.
> 
> Since we're gradually moving away from that pattern to the more
> established one relying on a atomic_create_state implementation, let's
> migrate this instance to the new pattern.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> 
> ---
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: "Maíra Canal" <mcanal@igalia.com>
> Cc: kernel-list@raspberrypi.com
> ---
>   drivers/gpu/drm/vc4/vc4_kms.c | 69 ++++++++++++++++++++++++++++++-------------
>   1 file changed, 48 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
> index e563c12109371619605d8e3f78b0f92694dbe5a5..f82c7ea1d74eeaa075296533a1ffe3561f197748 100644
> --- a/drivers/gpu/drm/vc4/vc4_kms.c
> +++ b/drivers/gpu/drm/vc4/vc4_kms.c
> @@ -83,11 +83,26 @@ static void vc4_ctm_destroy_state(struct drm_private_obj *obj,
>   	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(state);
>   
>   	kfree(ctm_state);
>   }
>   
> +static struct drm_private_state *
> +vc4_ctm_create_state(struct drm_private_obj *obj)
> +{
> +	struct vc4_ctm_state *ctm_state;
> +
> +	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
> +	if (!ctm_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &ctm_state->base);
> +
> +	return &ctm_state->base;
> +}
> +
>   static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
> +	.atomic_create_state = vc4_ctm_create_state,
>   	.atomic_duplicate_state = vc4_ctm_duplicate_state,
>   	.atomic_destroy_state = vc4_ctm_destroy_state,
>   };
>   
>   static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
> @@ -97,19 +112,13 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
>   	drm_atomic_private_obj_fini(&vc4->ctm_manager);
>   }
>   
>   static int vc4_ctm_obj_init(struct vc4_dev *vc4)
>   {
> -	struct vc4_ctm_state *ctm_state;
> -
>   	drm_modeset_lock_init(&vc4->ctm_state_lock);
>   
> -	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
> -	if (!ctm_state)
> -		return -ENOMEM;
> -
> -	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, &ctm_state->base,
> +	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
>   				    &vc4_ctm_state_funcs);
>   
>   	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
>   }
>   
> @@ -716,13 +725,28 @@ static void vc4_load_tracker_destroy_state(struct drm_private_obj *obj,
>   
>   	load_state = to_vc4_load_tracker_state(state);
>   	kfree(load_state);
>   }
>   
> +static struct drm_private_state *
> +vc4_load_tracker_create_state(struct drm_private_obj *obj)
> +{
> +	struct vc4_load_tracker_state *load_state;
> +
> +	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
> +	if (!load_state)
> +		return ERR_PTR(-ENOMEM);
> +
> +	__drm_atomic_helper_private_obj_create_state(obj, &load_state->base);
> +
> +	return &load_state->base;
> +}
> +
>   static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
>   	.atomic_duplicate_state = vc4_load_tracker_duplicate_state,
>   	.atomic_destroy_state = vc4_load_tracker_destroy_state,
> +	.atomic_create_state = vc4_load_tracker_create_state,

Minor nit: just to keep things consistent, could you move this hook to
the first line?

Even without that,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best regards,
- Maíra

>   };
>   


