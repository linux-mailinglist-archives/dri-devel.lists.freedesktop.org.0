Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A326E12BE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 18:49:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81C10E294;
	Thu, 13 Apr 2023 16:49:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E6F10E086;
 Thu, 13 Apr 2023 16:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681404579; x=1712940579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e16JYrNG13ZK09W8a6cvMfAnKuNMv4L12FVaChTOJe0=;
 b=akRz2JXpfMRtD20cuemNL/C0x0Dzw7BiZdZeLdXgM4xCmzI8Anlm7bxb
 DAUhZz9NU6/ve/iO3UnrKMv6KAcoSd0sEYQuh2njzEdeGmDBzvz2s9sQw
 nCAE1BJVVrgWE6LmS/kgEbqaPRyJ5PNqBum9L89Gc96v9EnHRlgoJXYMh
 Zhf4Nv6a9svApqDqOniYfpPy4GOfnOOAPlRDo4LEdWpJ2728aBqgvGyES
 Rf5ei4Ff2G259kpTkrIteaRIiAx3UnVSQ/yyF8FIweeIKEwbuTO6it0Dr
 UdqG+S9Ac3lYAHwytnaHIEUCAgpd82CpQvU778uPmo5L0umRyoGn2sMZy A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="342991055"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="342991055"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 09:49:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="692037916"
X-IronPort-AV: E=Sophos;i="5.99,194,1677571200"; d="scan'208";a="692037916"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 13 Apr 2023 09:49:20 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Apr 2023 19:49:19 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/uapi: Document CTM matrix better
Date: Thu, 13 Apr 2023 19:49:10 +0300
Message-Id: <20230413164916.4221-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
References: <20230413164916.4221-1-ville.syrjala@linux.intel.com>
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

