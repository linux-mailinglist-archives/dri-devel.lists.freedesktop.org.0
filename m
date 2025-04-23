Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BED41A9A389
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 09:25:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C06D10E749;
	Thu, 24 Apr 2025 07:25:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79010E64E;
 Wed, 23 Apr 2025 07:37:58 +0000 (UTC)
X-UUID: d7167a20201511f0a216b1d71e6e1362-20250423
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45, REQID:33cd0147-34a3-4f24-984a-a4e121dbc89e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6493067, CLOUDID:dc5f91aaf089f4ed07a4a1a74b6f7ce4,
 BulkI
 D:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:1,IP:nil,URL
 :0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
 R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: d7167a20201511f0a216b1d71e6e1362-20250423
Received: from mail.kylinos.cn [(10.44.16.175)] by mailgw.kylinos.cn
 (envelope-from <liujiajia@kylinos.cn>) (Generic MTA)
 with ESMTP id 1662382807; Wed, 23 Apr 2025 15:37:42 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
 by mail.kylinos.cn (NSMail) with SMTP id 1E31AE028E9B;
 Wed, 23 Apr 2025 15:37:42 +0800 (CST)
X-ns-mid: postfix-680898C5-967027406
Received: from kylin.lan (unknown [172.25.120.81])
 by mail.kylinos.cn (NSMail) with ESMTPA id A3623E028EA0;
 Wed, 23 Apr 2025 15:37:39 +0800 (CST)
From: Jiajia Liu <liujiajia@kylinos.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nemesa Garg <nemesa.garg@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jiajia Liu <liujiajia@kylinos.cn>
Subject: [PATCH RESEND] drm/i915/pch: fix warning for coffeelake on
 SunrisePoint PCH
Date: Wed, 23 Apr 2025 15:37:30 +0800
Message-Id: <20250423073730.585181-1-liujiajia@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 24 Apr 2025 07:25:56 +0000
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

i915/pch reports a warning on a mini PC which has a CoffeeLake-S GT2
[UHD Graphics 630] [8086:3e92] and an ISA bridge - H110 LPC Controller
[8086:a143].

[5.608723] i915 0000:00:02.0: [drm] Found coffeelake (device ID 3e92) int=
egrated display version 9.00 stepping N/A
[5.608969] ------------[ cut here ]------------
[5.608972] i915 0000:00:02.0: [drm] drm_WARN_ON(!display->platform.skylak=
e && !display->platform.kabylake)
[5.608995] WARNING: CPU: 3 PID: 440 at drivers/gpu/drm/i915/display/intel=
_pch.c:126 intel_pch_type+0x1af/0xae0 [i915]
[5.609317] CPU: 3 UID: 0 PID: 440 Comm: (udev-worker) Not tainted 6.15.0-=
rc3-drm-tip-2fa6469c618d #3 PREEMPT(voluntary)

Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_pch.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pch.c b/drivers/gpu/drm/i=
915/display/intel_pch.c
index 5035b63a4889..469e8a3cfb49 100644
--- a/drivers/gpu/drm/i915/display/intel_pch.c
+++ b/drivers/gpu/drm/i915/display/intel_pch.c
@@ -125,7 +125,8 @@ intel_pch_type(const struct intel_display *display, u=
nsigned short id)
 		drm_dbg_kms(display->drm, "Found SunrisePoint PCH\n");
 		drm_WARN_ON(display->drm,
 			    !display->platform.skylake &&
-			    !display->platform.kabylake);
+			    !display->platform.kabylake &&
+			    !display->platform.coffeelake);
 		return PCH_SPT;
 	case INTEL_PCH_SPT_LP_DEVICE_ID_TYPE:
 		drm_dbg_kms(display->drm, "Found SunrisePoint LP PCH\n");
--=20
2.25.1

