Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDD96DE73D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 00:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F97210E1D0;
	Tue, 11 Apr 2023 22:29:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA0710E1BD;
 Tue, 11 Apr 2023 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681252177; x=1712788177;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e16JYrNG13ZK09W8a6cvMfAnKuNMv4L12FVaChTOJe0=;
 b=h9m2orW1OEZ3joe8KSkyQnjbH+mepwljHKWm/jjmHhBfWpqm8CXCR+xs
 aiK22SUDzo6NnZtIZNBDdQtw9BlgPaITsa0LL5PMpOuyU9y7oVX77dIFu
 FK440pTzUVFlkRc1Q8BzzoQ0Xz5Jg110nT8NF5JMt3Qh37YFe9+kwVEwE
 +9C8QBV0dpClwRU8rq6Zme0MMxnFnK5zobPJ1aKsYJVqo8Est3Ne/CXw1
 Mbbwt+dtv/bcrxEty8VdWuO6raYDP2La3P1obYbQPi7cXjKgn3SgA76QP
 4rYL2u14FjbvMcwS7TNCMpFVYszOD77lJtmtW2gXirayh35LLj/L4tR4y g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342506221"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="342506221"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 15:29:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="753296797"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="753296797"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga008.fm.intel.com with SMTP; 11 Apr 2023 15:29:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Apr 2023 01:29:34 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/6] drm/uapi: Document CTM matrix better
Date: Wed, 12 Apr 2023 01:29:26 +0300
Message-Id: <20230411222931.15127-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
References: <20230411222931.15127-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document in which order the CTM matrix elements are stored.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/uapi/drm/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 46becedf5b2f..43691058d28f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -834,6 +834,11 @@ struct drm_color_ctm {
 	/*
 	 * Conversion matrix in S31.32 sign-magnitude
 	 * (not two's complement!) format.
+	 *
+	 * out   matrix    in
+	 * |R|   |0 1 2|   |R|
+	 * |G| = |3 4 5| x |G|
+	 * |B|   |6 7 8|   |B|
 	 */
 	__u64 matrix[9];
 };
-- 
2.39.2

