Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5751C3E86
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 17:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEB76E423;
	Mon,  4 May 2020 15:32:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1888 seconds by postgrey-1.36 at gabe;
 Mon, 04 May 2020 15:32:06 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.148.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899B66E423
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 15:32:06 +0000 (UTC)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id 1A7D9239864
 for <dri-devel@lists.freedesktop.org>;
 Mon,  4 May 2020 10:00:26 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id Vca1jVZYYVQh0Vca1jc1XS; Mon, 04 May 2020 10:00:26 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+1JYBdusNEcbfurXrebTZTOPT2a0N++LhWMXr79SGeg=; b=sE1pIwLxvKhX30ejPg28L6ami+
 g0vB8HKkCvGgT29H+zyump16lqlpqZRFS39S51Od7vXiOTcbVL+5tBXKEIVlsOfTvs9L9OKWn9Npn
 7cful0T6ESyw28FAh6q7IXZSZpJYdKlfDTTVfKDAKePEEHgog7P5Ra3luXvgE016QpfbiO3jvZqvs
 1zXhpGu9OLZniUEetyYACoHPk1Qk8u/C/8Sjttz3VdJVyN1vzx1O4QGsVIbVSsXlpZkRN0uNvuz+2
 fqGSbAFdu9Ur1oTdeK2mJFeCa706ViUEhs6k3NMlBsHaA3lSSkg42rdfxxLCnuanV76gvbkOZyTRS
 wUBaeR4g==;
Received: from [189.207.59.248] (port=60830 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1jVca1-003k6N-Cu; Mon, 04 May 2020 10:00:25 -0500
Date: Mon, 4 May 2020 10:04:50 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Subject: [PATCH][next] drm/i915/gem: Fix inconsistent IS_ERR and PTR_ERR
Message-ID: <20200504150450.GA20991@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.207.59.248
X-Source-L: No
X-Exim-ID: 1jVca1-003k6N-Cu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.207.59.248]:60830
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 9
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix inconsistent IS_ERR and PTR_ERR in __reloc_gpu_alloc().

The proper pointer to be passed as argument is ce.

This bug was detected with the help of Coccinelle.

Fixes: 6f576d6277ce ("drm/i915/gem: Try an alternate engine for relocations")
Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index cce7df231cb9..78fdbfd068d3 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -1325,7 +1325,7 @@ static int __reloc_gpu_alloc(struct i915_execbuffer *eb,
 
 		ce = intel_context_create(engine);
 		if (IS_ERR(ce)) {
-			err = PTR_ERR(rq);
+			err = PTR_ERR(ce);
 			goto err_unpin;
 		}
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
