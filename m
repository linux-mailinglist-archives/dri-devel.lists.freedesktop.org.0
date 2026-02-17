Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDFXJE0ylGkNAgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:18:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4477B14A4CF
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 10:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12EF110E4A9;
	Tue, 17 Feb 2026 09:18:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gnPNOZG3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED3210E4A9
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 09:18:00 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id
 d75a77b69052e-503bf474fdfso37226941cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771319880; x=1771924680; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iQC4QGyn7yz+oQacobtpM7v4lkiFx0ImzuBkcxsb/Rg=;
 b=gnPNOZG3ULLK/a0iSP751TOpnMRvnbPuHxvtV44xKyA8KQRuA551bkZ1KoBiPoeHin
 CSp/32M+jv/pojTUz8R0IT0vP+bUW1xyfSs/WOA0+UBsy4sZpCY4uM2gTI7UprJqBmlf
 enEU0DVBnuJKki1G+z0ORFxV7dxXKjVGn01+FJbWBkkVCLiwYMEDCAasXeijVBUpku+V
 IXgqBZvTFYthO9uW9pVy4KEH6vE++1ra8Xg4JQCUDT5GMleT0aknczRgLe6yIbcY6Uk8
 AC4QLVjjRIuTmUgpKaBGQqgwfIdvQmDaypeaMlNKW/obNpDk1cfw/HrBavWrdIw2hmZn
 il0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771319880; x=1771924680;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iQC4QGyn7yz+oQacobtpM7v4lkiFx0ImzuBkcxsb/Rg=;
 b=opFPQEJhEjWLhOO+aAyX3S2t620PfufuP+ESqNakbv3W4MACKm9dRSLBXJOQVvTWY0
 rM4fYpb58MakRxRlr1HBOra5ZivYttnTwh+1M5FGgw0dsAIEvqtE0ufXE/KafrLJ5L0w
 Lf5yBPOlZ7S7AMvwXKAVT108nDPoLyLpJp3YKdo9M2CbeYRxkAvfEeFfAAhCRn/fnBfN
 /STueij12U4TjqKDKh0qfrdVeAaprLBkJGURZ4usWcsJqE8VzFBgPZ8AFQzTgXeW+CND
 yzSzc0R/qEPBRCs7t5lDjCnzmg2uMoRWQdr7SPUH8m42ZoiKInc8jUMSZzf2nbhsTt+o
 FEww==
X-Gm-Message-State: AOJu0YztvjfKxrFl+oUDA5iaVwcD1uxWGvYvS+ZSUCBhXisgfIOUI1K7
 bnh3EEPTxKVWq/qyMe500NZ3Jd5qgMdRdCnhhlmLUEB4kQgcbkL9F6yY
X-Gm-Gg: AZuq6aKcKxwBIvN65xFfChZ/1KdQlGskdzS3stMkLSye7LWAwP5CZCpeviLnmmO8ZfF
 Wu+zMkY3LSQplLe7vQF26c3YvoAuUHr2N6ztWACskjl2L8GOLnZLXdNpt7Hnd7KoeyP5YtEvIZF
 AqtiN1iEdJMX8BdbEeVuUNrdqTIeJ3wATEfvdbVNr9fMkakL6E7EZZLKoBBTsMl0/DA8ehr3D9e
 1FhBU0nM3DdTfcc18/aZ2hDR290EzQyNK2SqH9OmWSkX/9P0/eOxr+FcZ3TzFmWaHxRi/q2wOSQ
 WI1DFE73f6EGPbUEsk2Q7AIoGJn6MgE9ttf99je57vA1JkNkK4NNJzm4lsZQ3G0rDXA+K78YpaH
 JxWE316j+I8PWc6mav0Ff9gmFLLtsyb+ywJEXMruBmUh0Msh0iQt82gvz74R/yiKsPV5OMqx94I
 YQkGLtnlFHR0qTU+1++9YKGCHnBtGOAOLVKzhwMDq9UGSIPkHSgin2LQ==
X-Received: by 2002:a05:622a:4d0:b0:506:98c9:a3e5 with SMTP id
 d75a77b69052e-506a6a4c880mr163726741cf.35.1771319879599; 
 Tue, 17 Feb 2026 01:17:59 -0800 (PST)
Received: from [10.254.121.53] (mkmvpn.amd.com. [165.204.54.211])
 by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-50684bc39e6sm174448991cf.31.2026.02.17.01.17.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:17:59 -0800 (PST)
Message-ID: <285b8a06-9b61-4a92-8b4b-206537d10dbb@gmail.com>
Date: Tue, 17 Feb 2026 10:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Prevent cursor bo's from being pinned to
 VRAM address zero
To: Mario Kleiner <mario.kleiner.de@gmail.com>, amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, stable@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
References: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mario.kleiner.de@gmail.com,m:amd-gfx@lists.freedesktop.org,m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckoenigleichtzumerken@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,amd.com:email]
X-Rspamd-Queue-Id: 4477B14A4CF
X-Rspamd-Action: no action

On 2/16/26 05:47, Mario Kleiner wrote:
> Why?
> 
> On some AMD gpu's in some configurations, the start of the VRAM domain, as
> reported by amdgpu_ttm_domain_start(adev, AMDGPU_GEM_DOMAIN_VRAM), is
> placed at address 0 during GMC init. This is a problem if, during a cursor
> plane update, the cursor image bo, which gets always pinned into VRAM,
> is placed at offset zero of the VRAM domain, and thereby at the
> absolute address afb->address 0.
> 
> The display hw apparently doesn't like such a zero start address for at
> least native cursor mode, as various checks inside DC are in place, e.g.,
> high level dc_stream_check_cursor_attributes(), and lower level DCN
> version specific cursor hw programming checks, which do reject cursor
> attribute updates with attributes->address.quad_part == 0.
> 
> User visible symptoms of this are seriously broken mouse cursors under
> both X11 and Wayland (tested with KDE/KWin, GNOME/Mutter, GDM login
> manager): Mouse cursor flickers, is invisible, randomly becomes invisible,
> or fails to adapt the cursor shape to the context, e.g., when moving from
> a text input field to other windows, or window decorations etc. This makes
> the cursor irritating and impossible to use.
> 
> The drm.debug=4 log shows DRM KMS debug messages of the form
> "DC: Cursor address is 0!", and the general syslog prints errors like
> "[drm:amdgpu_dm_plane_handle_cursor_update [amdgpu]] *ERROR* DC failed to
> set cursor attributes"
> 
> I observe this bug on my dual-gpu Apple 2017 MacBookPro since Linux 4.11,
> where the kernels early EFI setup force-enables both the Intel iGPU and
> AMD dGPU. This leads to the AMD VRAM start being placed at 0x0 and then
> causes massive cursor problems. On earlier kernels, only the AMD dGPU was
> exposed, the Intel iGPU was disabled / hidden from Linux by EFI firmware.
> This caused the AMD gpu to place VRAM start at the non-zero
> address 0x000000F400000000, and the mouse cursor worked fine. I confirmed
> with umr that the mmMC_VM_FB_LOCATION register of my Polaris 11 gpu indeed
> read back 0x0000 in the lower 16 bits in the dual-gpu case, causing
> gmc_v8_0_vram_gtt_location() to setup start of VRAM domain at zero.
> I don't know what causes the change, but most likely the UEFI firmware
> somehow triggers this change before main kernel boot - calling into the
> VBIOS, I guess.
> 
> There is at least one 8 months old bug report in AMD's issue tracker,
> reporting the same symptoms on other AMD setups, cfe.:
> https://gitlab.freedesktop.org/drm/amd/-/issues/4302

Wow, impressive debugging work. That is a really good catch!

> So unless there is another more clean and reliable way to prevent the
> cursor bo from being placed at address zero, or unless the display hw
> is actually fine with address zero and those checks in DC are overly
> cautious, this needs to be fixed.

I don't know the DCN block that well, but I'm pretty sure the assumption in the DC code that the cursor address can't be zero is simply incorrect.

> Note that simply removing the "zero address -> reject cursor update"
> checks worked on my Polaris11 with DCE 11.2 display engine, fixing the
> cursor without causing any other obvious trouble. So maybe this is only
> a limitation of recent DCN engine versions, or a pointless check.

My educated guess is you just missed some check, explicitely checking if the addr is zero would make the HW more complex and that is usually something HW engineers try to avoid really hard.

In other words you usually have a separate "valid" bit in a register somewhere instead of the HW checking for a specific value.

> How?
> 
> Add a new AMD bo placement flag which requests bo pinning / placement at
> non-zero VRAM address only during amdgpu_bo_pin(). Use this flag for bo's
> on the cursor plane during amdgpu_dm_plane_helper_prepare_fb().
> 
> I don't know if this is the best approach. It feels hacky, but it is the
> only approach I was able to do and it seems to work fine enough.
> 
> If this is a good enough fix, it should be backported, but backporting
> to earlier than Linux 6.12 might be cumbersome due to changes to the
> amdgpu_bo_pin() implementation.

I strongly suggest to follow Alex workaround for now, but maybe add a big code comment explaining why we have that.

Regards,
Christian.

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: <stable@vger.kernel.org> # v6.12+
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c            | 11 +++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  6 ++++--
>  include/uapi/drm/amdgpu_drm.h                         |  7 +++++++
>  3 files changed, 22 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 1fb956400696..97131fc8fbdf 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -975,6 +975,17 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
>  		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
>  		    bo->placements[i].mem_type == TTM_PL_VRAM)
>  			bo->placements[i].flags |= TTM_PL_FLAG_CONTIGUOUS;
> +
> +		/* Ensure bo is never pinned at amdgpu_bo_gpu_offset() == 0
> +		 * for VRAM allocations, as some of the DC code does not
> +		 * like that, e.g., mouse cursor display image bo's.
> +		 */
> +		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS &&
> +		    bo->placements[i].mem_type == TTM_PL_VRAM &&
> +		    !bo->placements[i].fpfn &&
> +		    !amdgpu_ttm_domain_start(adev, TTM_PL_VRAM)) {
> +			bo->placements[i].fpfn = 1;
> +		}
>  	}
>  
>  	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 394880ec1078..cd7f53d3036c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -959,10 +959,12 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		goto error_unlock;
>  	}
>  
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
> +	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>  		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> -	else
> +	} else {
>  		domain = AMDGPU_GEM_DOMAIN_VRAM;
> +		rbo->flags |= AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS;
> +	}
>  
>  	rbo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
>  	r = amdgpu_bo_pin(rbo, domain);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
> index 1d34daa0ebcd..6dee7653c54e 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -181,6 +181,13 @@ extern "C" {
>  #define AMDGPU_GEM_CREATE_EXT_COHERENT		(1 << 15)
>  /* Set PTE.D and recompress during GTT->VRAM moves according to TILING flags. */
>  #define AMDGPU_GEM_CREATE_GFX12_DCC		(1 << 16)
> +/* Flag that BO must not be placed in VRAM domain at offset zero if the
> + * VRAM domain itself starts at address zero.
> + *
> + * Used internally to prevent placement of cursor image BO at that location,
> + * as the display hardware doesn't like that for hardware cursors.
> + */
> +#define AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS (1 << 17)
>  
>  struct drm_amdgpu_gem_create_in  {
>  	/** the requested memory size */

