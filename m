Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CB7C801D4
	for <lists+dri-devel@lfdr.de>; Mon, 24 Nov 2025 12:09:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EEC10E206;
	Mon, 24 Nov 2025 11:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="TWWz6X2t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender3-op-o15.zoho.com (sender3-op-o15.zoho.com
 [136.143.184.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B778912D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 11:09:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1763981664; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OIsVpKfcVrxSU2gzPLJqk4yb5n7XUPOjYH5M5eBioR6M5DdFWiT6gHDr1h8zIEhR4f44J1ATEVdfgnOe1kaKUqGpezXjfWQ/eukr5E0Mocf1ItegCe2YCzf0pnrqsCWLqzck1DQhzZSepzbBtL/KNi1HECTC1/0HaeAGzfZe9rs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1763981664;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Dy+F+hKCykPaqJ6R99BwSYKWm6GVFKaTddcik5k44gQ=; 
 b=khfuFXdODYvBWOi1dGP2MymOU++hJSqmOormJO3wN1Qzwbp435JFWx2yeGRh9CVC7EkeCU5CQbY+QbhysLWKjtpcXljBOecQPAJKBN/sZ2ZSpJpz+0PCoRXtaPmQMYnnSjzXLA1fFF+f1bicE857UIIXXknfqjVDs+Wk2S+FOEo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981664; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Dy+F+hKCykPaqJ6R99BwSYKWm6GVFKaTddcik5k44gQ=;
 b=TWWz6X2tNdnd4N9YxF4WFYuHszeONjtMZZTCUUMzJovjYlXCN4Sq8cCRMkWHGK0d
 kilQ7F9dcpbcQW2j1WrSa03sZZy06E++4HbqHQ/LkFzSRqKXw6OYmkfpK3r/K9NcQs3
 YuujuphId2JLDSGByTmnZGEjeM4Z04hDUjYyIEsg/PpqmzU2DnQYpyWwWoU5z83foak
 Y0G6quZTPWCwcepxWCCC8DWA3q6sfy7PNRbApu4f4K7JbDhii9fkueo18XtXLB6r3oY
 SaaZ3ott9UW2Y7RlIKcpgP2Gr4z7usV4lBIz2w9bLR4rH1IhgtQGgyfbM9zAXQ/TX9U
 0o/kOHVEyw==
Received: by mx.zohomail.com with SMTPS id 1763981662595209.19285309448685;
 Mon, 24 Nov 2025 02:54:22 -0800 (PST)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [PATCH v3 9/9] mailmap: map all Icenowy Zheng's mail addresses
Date: Mon, 24 Nov 2025 18:52:26 +0800
Message-ID: <20251124105226.2860845-10-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Map all mail addresses Icenowy Zheng had used to the personal mailbox
prefixed "uwu".

All these mailboxes, except the one of Sipeed (which was only used
during a summer vacation internship), can accept mails now.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
New patch in v3.

 .mailmap | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/.mailmap b/.mailmap
index d2edd256b19d6..f023a0c4e565c 100644
--- a/.mailmap
+++ b/.mailmap
@@ -308,6 +308,10 @@ Henrik Rydberg <rydberg@bitmath.org>
 Herbert Xu <herbert@gondor.apana.org.au>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
+Icenowy Zheng <uwu@icenowy.me> <zhengxingda@iscas.ac.cn>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.io>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@aosc.xyz>
+Icenowy Zheng <uwu@icenowy.me> <icenowy@sipeed.com>
 Ike Panhc <ikepanhc@gmail.com> <ike.pan@canonical.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@redhat.com>
 J. Bruce Fields <bfields@fieldses.org> <bfields@citi.umich.edu>
-- 
2.52.0

