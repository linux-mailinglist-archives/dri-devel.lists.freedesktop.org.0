Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D27CAFBA4
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 12:15:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3BFA10E36F;
	Tue,  9 Dec 2025 11:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="YdIEMjnY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4110E36F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 11:15:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1765278889; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=VhnsPR1rvAoVGWxtOAyZq1HIJCg2B1KjEIpPcmDWwu9iiHNEFksb0RIHkEFzII/DVDkXLLSlKwyw56/r2sEbHvG3EnOcY1gdsM3W6p14tYlkLY/EiBMy+3jZ7LVih8ol2JisVmboNHSzMe+pMy3UE+TYbI8O6MdO691+u69QfJU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1765278889;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=6/8dkdH3MgNUPOg0FM5uypg5HfcPpMsGkm1+bpgmHdQ=; 
 b=N4QuVvGYAtYVCh4EPxfd94UptzBXUW62ffbRe5ZZtPPEMnrXh/hxRF+4g2/BlxNtBbepnxMnsVMUazY8l+1SJYU1DbtFxBQIVuAtplJ4iQvIP8I3nOFEYxxOxFJsUiTGnUV3ZtcGa+/y6SFb3/lpErhjVX65KolNMTHCTmQkHWY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1765278889; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=6/8dkdH3MgNUPOg0FM5uypg5HfcPpMsGkm1+bpgmHdQ=;
 b=YdIEMjnYpE3y5Sfui5dALLct/hVlm/SKgagA0xTfOCT66mhSV9PME6EMa5zT+jVF
 WM1e9uay5ppaJyZ99LDlVhnNWaFyGPOeJUltlTCxSRgPnnvKCrPCAJeeVlTaRjzNk76
 XKIKcgT8ZzLcQzEkW7aT5UzJzueF5c7LWYKMgC4g=
Received: by mx.zohomail.com with SMTPS id 1765278888611450.7794900965429;
 Tue, 9 Dec 2025 03:14:48 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: [PATCH v3 0/8] drm/rockchip: No more post-atomic_check fixups
Date: Tue, 09 Dec 2025 12:14:13 +0100
Message-Id: <20251209-vop2-atomic-fixups-v3-0-07c48f0f1f0d@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIYEOGkC/32OQQ6CMBBFr0Jm7ZharCIr72FYtGWQJkCxLQ2Gc
 HcruHb5/+S9Pwt4coY8lNkCjqLxxg4p5IcMdCuHJ6GpUwbOuDhxdsFoR44y2N5obMw8jR6Zzhm
 xW8GaQkACR0fpskkf1Z4dvabkDnsJSnpCbfvehDIbaA748wv4Aq3xwbr39lTkG/FvP3JkeG3UW
 SjVKFL1Xduuk8o6eUwjUK3r+gHUl+3O6QAAAA==
X-Change-ID: 20251206-vop2-atomic-fixups-0c30e0980f85
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Daniel Stone <daniels@collabora.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3
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

I'm taking over this series to get it across the finish line. Original
cover letter from Daniel Stone on v1:

> Hi,
> This series is a pretty small and consistent one for VOP2. The atomic
> uAPI very clearly specifies that drivers should either do what userspace
> requested (on a successful commit), or fail atomic_check if it is not
> for any reason possible to do what userspace requested.
> 
> VOP2 is unfortunately littered with a bunch of cases where it will apply
> fixups after atomic_check - doing something different to what userspace
> requested, e.g. clipping or aligning regions - or throw error messages
> into the log when userspace does request a condition which can't be met.
> 
> Doing something different to what was requested is bad because it
> results in unexpected visual output which can look like artifacts.
> Throwing errors into the log is bad because generic userspace will
> reasonably attempt to try any configuration it can. For example,
> throwing an error message on a plane not being aligned to a 16 pixel
> boundary can result in 15 frames' worth of error output in the log when
> a window is being animated across a screen.
> 
> This series removes all post-check fixups - failing the check if the
> configuration cannot be applied - and also demotes all messages about
> unsupported configurations to DEBUG_KMS.
> 
> Cheers,
> Daniel

Changes in v3:
- Change the AFBC source rectangle debug message to talk about 4-pixel
  alignment instead of 4-byte alignment.
- Fix another eSmart->Esmart casing case in a debug message
- Link to v2: https://lore.kernel.org/r/20251206-vop2-atomic-fixups-v2-0-7fb45bbfbebd@collabora.com

Changes in v2:
- Dropped patches [1, 5] as they were already applied.
- Changed the patch subject to use prefix "drm/rockchip: vop2:" for the
  remaining ones.
- Fixed a checkpatch nag about commenting style in "Switch impossible
  pos conditional to WARN_ON".
- Reworded "eSmart" to "Esmart" for consistency, and to avoid drawing
  Tim Apple's ire.
- Make the hopefully impossible WARN_ON format conditional in
  vop2_plane_atomic_check still bubble the error up to userspace,
  instead of continuing on.
- Use dest_w instead of dsp_w in patch "Enforce scaling workaround
  in plane_check", to avoid a compiler error.
- Only reject non-multiple-of-4-pixel-wide framebuffers on
  RK3566/RK3568, as the other SoCs have no such limitation. (Thank you
  to Andy Yan for doing the research to confirm this!)
- Consequently also only WARN_ON if this condition is violated in
  atomic_update on those SoCs.
- Link to v1: https://lore.kernel.org/dri-devel/20251015110042.41273-1-daniels@collabora.com/

Signed-off-by: Daniel Stone <daniels@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
Daniel Stone (8):
      drm/rockchip: vop2: Switch impossible format conditional to WARN_ON
      drm/rockchip: vop2: Switch impossible pos conditional to WARN_ON
      drm/rockchip: vop2: Fix Esmart test condition
      drm/rockchip: vop2: Enforce scaling workaround in plane_check
      drm/rockchip: vop2: Enforce AFBC source alignment in plane_check
      drm/rockchip: vop2: Enforce AFBC transform stride align in plane_check
      drm/rockchip: vop2: Use drm_is_afbc helper function
      drm/rockchip: vop2: Simplify format_mod_supported

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 137 ++++++++++++---------------
 1 file changed, 62 insertions(+), 75 deletions(-)
---
base-commit: 4e5a9b630580faea139e9837b4fba666db6bd728
change-id: 20251206-vop2-atomic-fixups-0c30e0980f85

Best regards,
-- 
Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

