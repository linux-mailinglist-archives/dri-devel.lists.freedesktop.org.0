Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5864EAC2C20
	for <lists+dri-devel@lfdr.de>; Sat, 24 May 2025 01:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 127C510E873;
	Fri, 23 May 2025 23:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="MApWt5wi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1810 seconds by postgrey-1.36 at gabe;
 Fri, 23 May 2025 09:33:08 UTC
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 62B5710E7FA
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 09:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Eg
 FS/rW230blmPCo/88Tvv809uo+RDzoEKY/8wGd39o=; b=MApWt5wimIOZAalquO
 Dvc9tko7f2gt/7W6H+iKpXpcWCMovx44TS3hvs5hQmKZ3P1tUFVFeQ8Gr9owTlwu
 J7EboKS6Mo1ZXeBGuxGM/6/6L/0zlLa47mASt3/Gs4+DlmoJl9Un4PAvdvfais07
 +uhUAV50RXuBCfyzOcDJ/1SWM=
Received: from evb20.domain.sensetime.com (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wB34EgFNjBoK31rDQ--.40531S2; 
 Fri, 23 May 2025 16:47:03 +0800 (CST)
From: junan <junan76@163.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, tzimmermann@suse.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 junan76@163.com
Subject: [PATCH] DRM: Fix rbtree search issue of find_hole_addr
Date: Fri, 23 May 2025 16:39:10 +0800
Message-ID: <20250523083909.84517-2-junan76@163.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wB34EgFNjBoK31rDQ--.40531S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrtryDtF4rur43ZFyxAr1DJrb_yoW8JryUpF
 47G3s0krZ5Ka1rWw1IyFs7uFy3A3W5GFWxt3yDuwsa9F1v9rs2ga4Fyr13KFyUJrZ3Gr43
 WwsYgFyUCF4jyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pE6pBsUUUUU=
X-Originating-IP: [182.148.52.15]
X-CM-SenderInfo: pmxqt0ixw6il2tof0z/1tbizQNWsWgwMtVWOAAAs4
X-Mailman-Approved-At: Fri, 23 May 2025 23:25:09 +0000
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

I'm not sure if it is a bug or just for some special purposes in the function
"find_hole_addr", the original implementation is as follows:

static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
{
	struct rb_node *rb = mm->holes_addr.rb_node;
	struct drm_mm_node *node = NULL;

	while (rb) {
		u64 hole_start;

		if (!usable_hole_addr(rb, size))
			break;

		node = rb_hole_addr_to_node(rb);
		hole_start = __drm_mm_hole_node_start(node);

		if (addr < hole_start)
			rb = node->rb_hole_addr.rb_left;
		else if (addr > hole_start + node->hole_size)
			rb = node->rb_hole_addr.rb_right;
		else
			break;

	}

	return node;
}

I think that the "node" should be set to NULL if it is not the one we want,
please tell me if I am wrong.

Signed-off-by: junan <junan76@163.com>
---
 drivers/gpu/drm/drm_mm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_mm.c b/drivers/gpu/drm/drm_mm.c
index ca254611b382..9417911198b5 100644
--- a/drivers/gpu/drm/drm_mm.c
+++ b/drivers/gpu/drm/drm_mm.c
@@ -347,6 +347,8 @@ static struct drm_mm_node *find_hole_addr(struct drm_mm *mm, u64 addr, u64 size)
 			rb = node->rb_hole_addr.rb_right;
 		else
 			break;
+
+		node = NULL;
 	}
 
 	return node;
-- 
2.43.5

