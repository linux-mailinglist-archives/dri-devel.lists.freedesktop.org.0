Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1245F322DFB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Feb 2021 16:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D33556E9D9;
	Tue, 23 Feb 2021 15:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2D26E9D9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Feb 2021 15:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From;
 bh=kSsqliwiyWRvBbbZMCGSMXgrO6gyXnCzInEaxK+Cxb8=; 
 b=WE4jxzUrSq4glcaS2PeZge1u8jm0EbQq6DFCkzkNhwvYMW7WZx56cUoHc+XJWjFZPJt6h7qzBEoPT7bndMZs5uUFXFO17S1YmXO4nrRMKXadgIo+O8/pheqRZx3kvoxSoLxKRxXUp66hObvmnSx4QdYWoK67hE/pDe53oc8wMCOR/SP2aLJGXI27zNH4KiDXaV62v9NtHM9P/ndUFbih2eKrpekWsx5p65omMaTTwpwyT1vF8+okH/KzP6d1vTaE78f7swnHM8UIzsGt5R9efUrj9b/js9poWn7PdJCoQ27JG2vv2NTmwTaXJf8UXEF7nc6eA7yWZjldudA3CTPHiw==;
Received: from lneuilly-657-1-8-171.w81-250.abo.wanadoo.fr ([81.250.147.171]
 helo=masxo.routerf36dc8.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1lEZyZ-00036t-4o; Tue, 23 Feb 2021 16:51:51 +0100
From: Neil Roberts <nroberts@igalia.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 0/2] Fix purging buffers in the shmem helpers
Date: Tue, 23 Feb 2021 16:51:23 +0100
Message-Id: <20210223155125.199577-1-nroberts@igalia.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These two patches fix a problem with the madvise purging code for the
shmem helpers where the mmaping for a purged buffer wouldn't get
invalidated correctly. This presumably ends up as a security hole
where the mapping can be accessed from user-space to read and write
random pages from other buffers. This is currently affecting Panfrost.
The second patch is a v2 from a patch that was sent standalone.

There is a WIP IGT test for Panfrost which demonstrates the bug here:

https://gitlab.freedesktop.org/nroberts/igt-gpu-tools/-/commits/panfrost-purgemap/

Neil Roberts (2):
  drm/shmem-helper: Check for purged buffers in fault handler
  drm/shmem-helper: Don't remove the offset in vm_area_struct pgoff

 drivers/gpu/drm/drm_gem_shmem_helper.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
