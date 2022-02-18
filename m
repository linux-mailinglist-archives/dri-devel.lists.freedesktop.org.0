Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B18174BB646
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 705D110F01F;
	Fri, 18 Feb 2022 10:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C81BA10EF43;
 Fri, 18 Feb 2022 10:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178707; x=1676714707;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gu8XmegNYGrY6ZfGHaEb+MBL+2RJnYd0SA3O6y25cfo=;
 b=MLmAN+LqQbCSmuuybNkGC4Q5tKZ+wrkyug9UTybiQ3r7HFUJqE89dnfR
 rwLh40vnQ69LR1fe91GFtBElSo3/DLYBDBWT9hYatb3cwj/E2mxR03PYV
 doX7DURPYdsopdBeXGCqCy20o0qZBOcBvlNrW41qN2jnqEjralyV8lgIf
 fLBp1MBl2iXCahgoWI+pp5fobPlLgzs02CmGzbD6gwpCRThHgPsXktXk+
 I1eacqFTzuZ/uR2r+6Q7OOs02dwVSd2ppY9VnLTCrJmfvcchB7wl4g3Rb
 cC6xrIKdV7VA5ol5U/wUy0yvYgWv3LDDgvDk28yI+iseZx2hYsNqhx/Q6 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337541433"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="337541433"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="505338914"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 18 Feb 2022 02:05:03 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:02 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 13/22] drm/mtk: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:03:54 +0200
Message-Id: <20220218100403.7028-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..30f879e68a2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1218,7 +1218,7 @@ static int mtk_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	if (next_bridge) {
 		struct drm_display_mode adjusted_mode;
 
-		drm_mode_copy(&adjusted_mode, mode);
+		drm_mode_init(&adjusted_mode, mode);
 		if (!drm_bridge_chain_mode_fixup(next_bridge, mode,
 						 &adjusted_mode))
 			return MODE_BAD;
-- 
2.34.1

