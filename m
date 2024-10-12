Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7D99B5C3
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 17:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4710E176;
	Sat, 12 Oct 2024 15:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ut1lcEb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8C910E176
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Oct 2024 15:07:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49CF7C6G027028;
 Sat, 12 Oct 2024 10:07:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1728745632;
 bh=lJnqkgu2ok6exxc6zBrcXWh7XNo6vxYHtyLPQ+SH2MI=;
 h=From:To:CC:Subject:Date;
 b=ut1lcEb3HwFK+k3HQbJicxJzWpcZvyoTzU21DGU9RbW5UPPpfmtvMV1BxdrmR9Gm0
 RmksDdNGAgcZ8ueILLZAZ43azvq0FJrRmNm3YmiI8uzeJriqw/rBgzr9ciFNkkq14g
 WUj8NpPzrEgVMbV+CseZiWre5P+Uj5xjPj/4QMlw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49CF7CVO020063;
 Sat, 12 Oct 2024 10:07:12 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Oct 2024 10:07:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Oct 2024 10:07:11 -0500
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49CF7BUk114694;
 Sat, 12 Oct 2024 10:07:11 -0500
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <sam@ravnborg.org>,
 <bparrot@ti.com>, <jcormier@criticallink.com>, <devarsht@ti.com>
Subject: [PATCH 0/2] DSS interrupt related bug fixes
Date: Sat, 12 Oct 2024 20:37:08 +0530
Message-ID: <20241012150710.261767-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

While reviewing the interrupt related code and register dump, we found couple
of issues related to interrupt related register programming. Firstly, the
function enabling/disabling the interrupts was trying to clear the
interrupts which were not enabled in first place and secondly there is a
potential race scenario between interrupt subroutine and interrupt
enable/disable related functions as they both access interrupt registers
without a common lock. This series addresses the aforementioned problems.

Devarsh Thakkar (2):
  drm/tidss: Clear the interrupt status for interrupts being disabled
  drm/tidss: Avoid race condition while handling interrupt registers

 drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++++++----
 drivers/gpu/drm/tidss/tidss_irq.c   |  2 ++
 2 files changed, 10 insertions(+), 4 deletions(-)

-- 
2.39.1

