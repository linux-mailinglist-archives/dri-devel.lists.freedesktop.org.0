Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CC17B0597
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 15:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D800710E521;
	Wed, 27 Sep 2023 13:38:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AD210E520;
 Wed, 27 Sep 2023 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695821934; x=1727357934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XfhUSK9oPOsrUCWTOO8CEEobRY0kofBmGLtuhYVzvzk=;
 b=BnbzveEYmOUigJOT1VLKcHF3jDZy4hshnFMvg10alSFOlTry0b3Vol8P
 5xEU5eCXDSRwJEji7YlP7/Tw/v9DYIwP19V5+mMoiCwXUXggYJjEVRttz
 1xMQC9+vaRiJv2B22yERYu3AG5eBAHr1BMu4chJ9L5Vez5W4gA+zoNLPY
 x0yyhRbqC2SkCW5Hy3XORduGu9AnJSzHKz8b0MGhjEXIsLqUeNG6DRyRq
 UX0AanLa+mHo1T3Cc8R+6wWo9ctTYxj8yT0TETNV+YJfdnUVmnGG0aNIc
 RLRcAf/ReWE1c0bYsdp8pPQfNBVqpiEIodgR6ZQ7cYnqiuQ1M1ghplNrJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412738601"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="412738601"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:38:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="752597175"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="752597175"
Received: from mscanex-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.204.17])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 06:38:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm: Do not round to megabytes for greater than 1MiB
 sizes in fdinfo stats
Date: Wed, 27 Sep 2023 14:38:37 +0100
Message-Id: <20230927133843.247957-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
References: <20230927133843.247957-1-tvrtko.ursulin@linux.intel.com>
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
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 steven.price@arm.com, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

It is better not to lose precision and not revert to 1 MiB size
granularity for every size greater than 1 MiB.

Sizes in KiB should not be so troublesome to read (and in fact machine
parsing is I expect the norm here), they align with other api like
/proc/meminfo, and they allow writing tests for the interface without
having to embed drm.ko implementation knowledge into them. (Like knowing
that minimum buffer size one can use for successful verification has to be
1MiB aligned, and on top account for any pre-existing memory utilisation
outside of driver's control.)

But probably even more importantly I think that it is just better to show
the accurate sizes and not arbitrary lose precision for a little bit of a
stretched use case of eyeballing fdinfo text directly.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: steven.price@arm.com
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index e692770ef6d3..ecb5038009e7 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -913,7 +913,7 @@ static void print_size(struct drm_printer *p, const char *stat,
 	unsigned u;
 
 	for (u = 0; u < ARRAY_SIZE(units) - 1; u++) {
-		if (sz < SZ_1K)
+		if (sz == 0 || !IS_ALIGNED(sz, SZ_1K))
 			break;
 		sz = div_u64(sz, SZ_1K);
 	}
-- 
2.39.2

