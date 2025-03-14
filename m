Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10866A61D42
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 21:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062FB10E2C0;
	Fri, 14 Mar 2025 20:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dqgRBxY0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246B110E25F;
 Fri, 14 Mar 2025 20:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741985552; x=1773521552;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AFq1w1Exj1+pZfFPDzxjLye0ovi7MBpsxASgD42gK7w=;
 b=dqgRBxY0URwLU7XqTmVaY/M3gsdRKNg83TgUldWisxoqYxpQJamJ0apy
 56wYW901uzLQPc1N1qaOGjft9ZY8ao8/JHDpllXwjx035MeQ+aTn7mQua
 q8kMKznrV5Xvr7uARm7wnXrcK8pU4i1I07QnISg+UWJ+DJoQEGO0eHRVV
 JAuJguHMhPcISpUpqIzsZSPRHKkZNTHsxfQqFYzpW4TOD3bbgwNxUnpmK
 nQLUXN4SPNlZSpD6FXQjAzUYYlnCDdnmQE/vNEnKsK2+3Q+TbEYMCNaVz
 KLEZYnmdXQR/FDjx5r6Fyq6e0dO0VnpeugHZ5Z6ECJn9PUl/f44nnsmVO w==;
X-CSE-ConnectionGUID: 4a/ciObiTjyV+9v1lbUW0A==
X-CSE-MsgGUID: FkjHmMvvT8e/S1EFPVCGEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="43284795"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="43284795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:25 -0700
X-CSE-ConnectionGUID: x9CiEBmLS0OYPwQ+W4M8fw==
X-CSE-MsgGUID: p3wNQUBwS3+u9jDwaELxQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="121578437"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.246.206])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 13:52:21 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v5 1/3] drm/i915: Downgrade device register error if injected
Date: Fri, 14 Mar 2025 21:38:33 +0100
Message-ID: <20250314205202.809563-6-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
References: <20250314205202.809563-5-janusz.krzysztofik@linux.intel.com>
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

Commit 8f460e2c78f2 ("drm/i915: Demidlayer driver loading") which
introduced manual device registration also added a message that is
submitted on device registration failure as an error.  If that failure is
triggered by error injection test, that's an expected error, but CI still
reports it as a bug.  Fix it.

Suggested-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 6507dcfe4bf53..e0dde7c0fa9c5 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -635,8 +635,8 @@ static void i915_driver_register(struct drm_i915_private *dev_priv)
 
 	/* Reveal our presence to userspace */
 	if (drm_dev_register(&dev_priv->drm, 0)) {
-		drm_err(&dev_priv->drm,
-			"Failed to register driver for userspace access!\n");
+		i915_probe_error(dev_priv,
+				 "Failed to register driver for userspace access!\n");
 		return;
 	}
 
-- 
2.48.1

