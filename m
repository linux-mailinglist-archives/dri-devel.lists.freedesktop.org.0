Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B6FA33069
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8831010E980;
	Wed, 12 Feb 2025 20:06:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dcmngGSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FEBF10E97E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739390768; x=1770926768;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UrP4+S/PJRRzsNR6LIvFEhiK0LIXEoP6w6Tk9R2XVTE=;
 b=dcmngGSflN6VTQgLCm8nQsV9E3+zDl2oI/hXbtQ5hGgsOflfnRdgGSqD
 m4owDG4vgKrvqWKZhO73SFVTKJY8Lp5ZL5DU9fBUxM36dlJhw0m8zp0ED
 zzJwutuDbaiKXpAw9NAr9h0tPBpVTP0HtxLOsykNMES8Yl5EJ3aQQ626H
 CWP8i9JkwomcHKqnUQ8aOH3jkwTb6d0YMhG+4TszeTa0JWGaoTaBQrzk6
 EWaMV83S6NLfSgXB7Dc/dcNJLY3MSRq2bFcYTbbl43BgIuPoGdyacTmaC
 cJH0GJNJqP9/fvipXJwGdv+OKQWAAgv6QPCLz1RFQn7JZXVH2tcmLHJA0 Q==;
X-CSE-ConnectionGUID: ptEu/jcORbuW3CsMjcYQnQ==
X-CSE-MsgGUID: pj3/o3XyRGWSc0aLM9Ilsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50718494"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="50718494"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:07 -0800
X-CSE-ConnectionGUID: jRDc34lJSaiZwqpzTgQxng==
X-CSE-MsgGUID: J2U+vyrnTMK/DUoGZf9pkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; d="scan'208";a="118010757"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:06:07 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: linux-kernel@vger.kernel.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH 2/6] drivers: base: devres: Fix find_group() documentation
Date: Wed, 12 Feb 2025 12:05:38 -0800
Message-ID: <20250212200542.515493-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250212200542.515493-1-lucas.demarchi@intel.com>
References: <20250212200542.515493-1-lucas.demarchi@intel.com>
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

It returns the last open group, not the last group.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/base/devres.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index b955a2f9520bf..d8a733ea5e1ac 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -576,7 +576,10 @@ void *devres_open_group(struct device *dev, void *id, gfp_t gfp)
 }
 EXPORT_SYMBOL_GPL(devres_open_group);
 
-/* Find devres group with ID @id.  If @id is NULL, look for the latest. */
+/*
+ * Find devres group with ID @id.  If @id is NULL, look for the latest open
+ * group.
+ */
 static struct devres_group *find_group(struct device *dev, void *id)
 {
 	struct devres_node *node;
-- 
2.48.1

