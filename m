Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED5eCFuikmnqvwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 05:51:39 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCF4140E20
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 05:51:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7800C10E05C;
	Mon, 16 Feb 2026 04:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OsOw2/Q0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25AF310E00E
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 04:51:35 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-482f2599980so30022255e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 20:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771217493; x=1771822293; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gfbNSZ0Cjv7uEpR3TUvJNrpdOHJt8bEzYAt9jyX7fc4=;
 b=OsOw2/Q0ZQHiiwaV+A3pj9lZcleqbSUBcvK/hBeIYSaYorbpr/+hELun7KGNfvJNJf
 86hNCh7R7qGvZvs4osCzmXkcYks9dol9IukFZogpoi2B4f8MwVQ3DrK5CqsjZ8LNNwNA
 xIk4DTPcVpp1Y8LCHhhzgnxwFNWv6+S2C6jxJYhW0m/5oUDQIXOQy5H7K+r77eaiWjI3
 XXiRAEM7tUj5ctUdWkc4BSvS/uqo6bk2r1WtCzEA+OR70EOfWhSJzeb1YrnYXcduSwA1
 2kJW/0XGI1bSTlZOAfI7OGMVEyO6kDqtB6C5B/GZxNbwYWbmE/EkRaVvSROEfrknmO2C
 naog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771217493; x=1771822293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gfbNSZ0Cjv7uEpR3TUvJNrpdOHJt8bEzYAt9jyX7fc4=;
 b=UP0hTbMrXHq5VUdd8DNcd460UCkNGgZR+wUKQ2k/OWsQh522hCXMSCsG5Oc+/r04pZ
 KMxnh4ZnyJr8UX/Z67BIIXBoR5da5rLoRv3TE2DUJE5f/IL3bmbxomJOITSeh28hId7N
 TZcJFN5tSrB1CmgP6Yx0Ag0ri3A9uEf/xqYDgI3h0JLvmpx6VghGCpFuslZR+QpiiC7r
 cT78Sc0MruaVayIa8ZpalSISp+0RFirmL2JPh08T02SCL0mYP9gM+cttSEzYV9NvirDf
 zpwTF8AwaTz1ol2zEKdJFbHjfdvkfGc5/6OIklbQkfnL6wUL2fkusmuvbW6hkkQaZADm
 HMBg==
X-Gm-Message-State: AOJu0YzCSxahmA1Lq69M4fhX5LTLMke4quQsaJ7BqCIRG7Rk5zb9J1eN
 zWhxkDT37yyq7N7umKC53tZi+VmVS9+S9ZQo5uMRCYH4loradFFEt9yQ
X-Gm-Gg: AZuq6aJloBo6p1i5OKtVXuFuPcB7Dsmpg3ZO0ZZ6U6Zms4e5+rpcl3/BK1awJQgAi36
 O+W6MWOIiREGk3R/hpWF6byMAuIs5ERhr1xk0MGfSTLsA4jKBqG1mpS4dG1FsGByPtpLVCHygu3
 cjOhpNCBgWL0k+LQ7wuO7CiIt5f0NPsIrfqpmV2amMIMnfc1r+8f3Y71gE89gTjQou/FekOZ8Ca
 nKYsdz62W8b3PpK+0mAhNdCLZG/LMbIlpqiO+8Jh1sfeUXFJ3r9W/I3DvYJ/IeyZW2BQG3SOmmx
 Ds9VGp147JCfmn58lHT0PGA88aiH9RQGJh5QIhfu7byMGIKJKwZNicGReKNOvy5DlCm1C17q+Li
 hiGfhDqM5GpLIbQopGx+Qb0KbzKTn8vybANhi1fSnHWPh3iHTmaSNzm33iYqFOYfGDa3mAuT7Q+
 +VZtIBH0tmXdPRdQhCfCA+JQMqI0aVnNDYSb5MFZtxmAw9dsvC+K4i4UpVYSxU3Nqs8kWXea/J2
 Ki3m0aKWRWObXa/FsxpUK7j1xkC7HLvZrLdszcVWV/AimuFVHBSw7gW4A==
X-Received: by 2002:a05:600c:4f4b:b0:477:98f7:2aec with SMTP id
 5b1f17b1804b1-48373a160b8mr176746765e9.3.1771217493331; 
 Sun, 15 Feb 2026 20:51:33 -0800 (PST)
Received: from groovy.localdomain
 (dynamic-2a02-3100-6670-3f00-a1f3-fb2e-d2ae-14c6.310.pool.telefonica.de.
 [2a02:3100:6670:3f00:a1f3:fb2e:d2ae:14c6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796acf5b9sm21514219f8f.34.2026.02.15.20.51.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 20:51:32 -0800 (PST)
From: Mario Kleiner <mario.kleiner.de@gmail.com>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 Mario Kleiner <mario.kleiner.de@gmail.com>, stable@vger.kernel.org,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amd/display: Prevent cursor bo's from being pinned to
 VRAM address zero
Date: Mon, 16 Feb 2026 05:47:35 +0100
Message-ID: <20260216044735.6814-1-mario.kleiner.de@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:amd-gfx@lists.freedesktop.org,m:mario.kleiner.de@gmail.com,m:stable@vger.kernel.org,m:harry.wentland@amd.com,m:sunpeng.li@amd.com,m:alexander.deucher@amd.com,m:mariokleinerde@gmail.com,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,gmail.com,vger.kernel.org,amd.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mariokleinerde@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7CCF4140E20
X-Rspamd-Action: no action

Why?

On some AMD gpu's in some configurations, the start of the VRAM domain, as
reported by amdgpu_ttm_domain_start(adev, AMDGPU_GEM_DOMAIN_VRAM), is
placed at address 0 during GMC init. This is a problem if, during a cursor
plane update, the cursor image bo, which gets always pinned into VRAM,
is placed at offset zero of the VRAM domain, and thereby at the
absolute address afb->address 0.

The display hw apparently doesn't like such a zero start address for at
least native cursor mode, as various checks inside DC are in place, e.g.,
high level dc_stream_check_cursor_attributes(), and lower level DCN
version specific cursor hw programming checks, which do reject cursor
attribute updates with attributes->address.quad_part == 0.

User visible symptoms of this are seriously broken mouse cursors under
both X11 and Wayland (tested with KDE/KWin, GNOME/Mutter, GDM login
manager): Mouse cursor flickers, is invisible, randomly becomes invisible,
or fails to adapt the cursor shape to the context, e.g., when moving from
a text input field to other windows, or window decorations etc. This makes
the cursor irritating and impossible to use.

The drm.debug=4 log shows DRM KMS debug messages of the form
"DC: Cursor address is 0!", and the general syslog prints errors like
"[drm:amdgpu_dm_plane_handle_cursor_update [amdgpu]] *ERROR* DC failed to
set cursor attributes"

I observe this bug on my dual-gpu Apple 2017 MacBookPro since Linux 4.11,
where the kernels early EFI setup force-enables both the Intel iGPU and
AMD dGPU. This leads to the AMD VRAM start being placed at 0x0 and then
causes massive cursor problems. On earlier kernels, only the AMD dGPU was
exposed, the Intel iGPU was disabled / hidden from Linux by EFI firmware.
This caused the AMD gpu to place VRAM start at the non-zero
address 0x000000F400000000, and the mouse cursor worked fine. I confirmed
with umr that the mmMC_VM_FB_LOCATION register of my Polaris 11 gpu indeed
read back 0x0000 in the lower 16 bits in the dual-gpu case, causing
gmc_v8_0_vram_gtt_location() to setup start of VRAM domain at zero.
I don't know what causes the change, but most likely the UEFI firmware
somehow triggers this change before main kernel boot - calling into the
VBIOS, I guess.

There is at least one 8 months old bug report in AMD's issue tracker,
reporting the same symptoms on other AMD setups, cfe.:
https://gitlab.freedesktop.org/drm/amd/-/issues/4302

So unless there is another more clean and reliable way to prevent the
cursor bo from being placed at address zero, or unless the display hw
is actually fine with address zero and those checks in DC are overly
cautious, this needs to be fixed.

Note that simply removing the "zero address -> reject cursor update"
checks worked on my Polaris11 with DCE 11.2 display engine, fixing the
cursor without causing any other obvious trouble. So maybe this is only
a limitation of recent DCN engine versions, or a pointless check.

How?

Add a new AMD bo placement flag which requests bo pinning / placement at
non-zero VRAM address only during amdgpu_bo_pin(). Use this flag for bo's
on the cursor plane during amdgpu_dm_plane_helper_prepare_fb().

I don't know if this is the best approach. It feels hacky, but it is the
only approach I was able to do and it seems to work fine enough.

If this is a good enough fix, it should be backported, but backporting
to earlier than Linux 6.12 might be cumbersome due to changes to the
amdgpu_bo_pin() implementation.

Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Tested-by: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: <stable@vger.kernel.org> # v6.12+
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c            | 11 +++++++++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  6 ++++--
 include/uapi/drm/amdgpu_drm.h                         |  7 +++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
index 1fb956400696..97131fc8fbdf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
@@ -975,6 +975,17 @@ int amdgpu_bo_pin(struct amdgpu_bo *bo, u32 domain)
 		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS &&
 		    bo->placements[i].mem_type == TTM_PL_VRAM)
 			bo->placements[i].flags |= TTM_PL_FLAG_CONTIGUOUS;
+
+		/* Ensure bo is never pinned at amdgpu_bo_gpu_offset() == 0
+		 * for VRAM allocations, as some of the DC code does not
+		 * like that, e.g., mouse cursor display image bo's.
+		 */
+		if (bo->flags & AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS &&
+		    bo->placements[i].mem_type == TTM_PL_VRAM &&
+		    !bo->placements[i].fpfn &&
+		    !amdgpu_ttm_domain_start(adev, TTM_PL_VRAM)) {
+			bo->placements[i].fpfn = 1;
+		}
 	}
 
 	r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
index 394880ec1078..cd7f53d3036c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
@@ -959,10 +959,12 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
 		goto error_unlock;
 	}
 
-	if (plane->type != DRM_PLANE_TYPE_CURSOR)
+	if (plane->type != DRM_PLANE_TYPE_CURSOR) {
 		domain = amdgpu_display_supported_domains(adev, rbo->flags);
-	else
+	} else {
 		domain = AMDGPU_GEM_DOMAIN_VRAM;
+		rbo->flags |= AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS;
+	}
 
 	rbo->flags |= AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS;
 	r = amdgpu_bo_pin(rbo, domain);
diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
index 1d34daa0ebcd..6dee7653c54e 100644
--- a/include/uapi/drm/amdgpu_drm.h
+++ b/include/uapi/drm/amdgpu_drm.h
@@ -181,6 +181,13 @@ extern "C" {
 #define AMDGPU_GEM_CREATE_EXT_COHERENT		(1 << 15)
 /* Set PTE.D and recompress during GTT->VRAM moves according to TILING flags. */
 #define AMDGPU_GEM_CREATE_GFX12_DCC		(1 << 16)
+/* Flag that BO must not be placed in VRAM domain at offset zero if the
+ * VRAM domain itself starts at address zero.
+ *
+ * Used internally to prevent placement of cursor image BO at that location,
+ * as the display hardware doesn't like that for hardware cursors.
+ */
+#define AMDGPU_GEM_CREATE_VRAM_NON_ZERO_ADDRESS (1 << 17)
 
 struct drm_amdgpu_gem_create_in  {
 	/** the requested memory size */
-- 
2.43.0

