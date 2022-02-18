Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A9F4BC2A4
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 23:38:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C3310EF6C;
	Fri, 18 Feb 2022 22:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46F5E10EF6B;
 Fri, 18 Feb 2022 22:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645223883; x=1676759883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/s1wabFbgc28mlABuCGVtAWgq4f+FmKnM0eC6Yos7Ms=;
 b=E2m4y/fRbiTXAHEB1u8ln2FCevFlnUzzrZV9RmyMMR0HRIVxMtLYKhPZ
 jbGuSdlEK5Ufu2ER4M3URYwdkxfAQZ+60dTdkmw7TEcWMKfKADhdsJACz
 sbAH5hT0rUBmUZ+KLm98X+iAId49j3Z/EiXIkCLTNO4FrX4HgUcSctl6z
 WAPTRmVH16uJJoU2kI6WP8eq7GyGN2BAmqtKFeAhw1A0OPA6QhGQBtueI
 T5zAYY2jXyPQpmY/e+wpSizYyvHgTTClclaF3PB+/6mVSJ0KEho/FgbiL
 7mPuxPLy3uWVqdn83htXEuptbfzL627fdsatth8kUpntaP9pCCc6KJt0O A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10262"; a="311982137"
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="311982137"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:38:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,380,1635231600"; d="scan'208";a="605679282"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 14:38:01 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH topic/core-for-CI] drm/i915/dg2: Add relocation exception
Date: Fri, 18 Feb 2022 14:38:53 -0800
Message-Id: <20220218223853.939464-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
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
Cc: bob.beckett@collabora.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Daniel Vetter <daniel.vetter@intel.com>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The move to softpin in igt is ongoing and should land soon.
Meanwhile, like was done for ADL and RKL, add an exception to allow
running the igt display tests before that conversion is complete
so we can unblock CI.

Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Ekstrand <jason@jlekstrand.net>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index f8f07d0bd83b..85f4808957b9 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -504,7 +504,7 @@ static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
 	 */
 	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915) ||
 	    IS_ROCKETLAKE(eb->i915) || IS_ALDERLAKE_S(eb->i915) ||
-	    IS_ALDERLAKE_P(eb->i915))
+	    IS_ALDERLAKE_P(eb->i915) || IS_DG2(eb->i915))
 		return true;
 
 	return false;
-- 
2.35.1

