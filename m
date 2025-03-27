Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C034A72BB1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 09:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B2210E87E;
	Thu, 27 Mar 2025 08:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gkpASxUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57D5E10E87C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9sUozTRDpcXcE7/6GtuvYEBdIs1ipFo/7rGpFB5bHYM=; b=gkpASxUyZ9b5dHGQ5pPPkF0hQX
 FrFAWHdGF8oIcQsiUtr/T2F/Raa4rxgQIoVsJFEoYL2PWpsKEsqWCCNQ7HkpK3S07tCRf0uSWuwG5
 8CkNghTiVtBd/HpiDiudIob9Q0tZgT3wZDDxIa88V0hdDSMs4JFeNG5T8o2nIYXNLeKn1ZzPS+llQ
 btLBRzdI0MLn7zeZMDVyN0jbsDLyo5/A751g9+1mQSqEmrPv25OWZnCYCN/vUjuojcApebOLs850X
 z93FizixHtrQVtDhv30yLAjEgSIV0ZaRVipI4xT3UlyNVTIAx8LbsEJ7igl95ZJQf6klNCG/ZhQVU
 XSDp2RFQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1txiod-0078ko-M0; Thu, 27 Mar 2025 09:42:19 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v2 0/7] A few drm_syncobj optimisations
Date: Thu, 27 Mar 2025 08:42:07 +0000
Message-ID: <20250327084215.26662-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A small set of drm_syncobj optimisations which should make things a tiny bit
more efficient on the CPU side of things.

Improvement seems to be around 1.5%* more FPS if observed with "vkgears
-present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant to make a
definitive claim on the numbers since there is some run to run variance. But, as
suggested by Michel Dänzer, I did do a five ~100 second runs on the each kernel
to be able to show the ministat analysis.

x before
+ after
+------------------------------------------------------------+
|                          x         +                       |
|                   x      x         +                       |
|                   x      xx      ++++                      |
|                 x x      xx x    ++++                      |
|                 x xx   x xx x+   ++++                      |
|                xxxxx   xxxxxx+   ++++ + +                  |
|                xxxxxxx xxxxxx+x  ++++ +++                  |
|              x xxxxxxxxxxx*xx+* x++++++++   ++             |
|        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
|       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
|x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
|               |_______A______|                             |
|                             |______A_______|               |
+------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x 135      21697.58     22809.467     22321.396     22307.707     198.75011
+ 118     22200.746      23277.09       22661.4     22671.442     192.10609
Difference at 95.0% confidence
    363.735 +/- 48.3345
    1.63054% +/- 0.216672%
    (Student's t, pooled s = 195.681)

v2:
 * Implemented review feedback - see patch change logs.

Cc: Maíra Canal <mcanal@igalia.com>

Tvrtko Ursulin (7):
  drm/syncobj: Remove unhelpful helper
  drm/syncobj: Do not allocate an array to store zeros when waiting
  drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
  drm/syncobj: Use put_user in drm_syncobj_query_ioctl
  drm/syncobj: Avoid temporary allocation in
    drm_syncobj_timeline_signal_ioctl
  drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
  drm/syncobj: Add a fast path to drm_syncobj_array_find

 drivers/gpu/drm/drm_syncobj.c | 286 ++++++++++++++++++----------------
 1 file changed, 154 insertions(+), 132 deletions(-)

-- 
2.48.0

