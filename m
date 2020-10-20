Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC457289ED3
	for <lists+dri-devel@lfdr.de>; Sat, 10 Oct 2020 09:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13A96EE8A;
	Sat, 10 Oct 2020 07:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [1.203.163.81])
 by gabe.freedesktop.org (Postfix) with ESMTP id 396C96EE8A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Oct 2020 07:09:29 +0000 (UTC)
X-UUID: 0c38d61dbfca452281c952de6b586ca2-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ANpEljZrqglc8EMQg/MmRI2i6NTOfGYjN7epVx7bN3M=; 
 b=mLc7pWV+4oru6y5/2DxA/aG8uOKd/fTYXdSIvvFC0a1mP9g71/Y2wkjqgOM8X2uF2j7YqrAxiq80iQBxp2TvH7Uj0UUh1BavjvkE2QDOOY7ycL5UTC686VWeY8KobFvyqfDur7wTiWdW6PVQIgenWR3O4Rm1U9PUoyc1FsfZw9I=;
X-UUID: 0c38d61dbfca452281c952de6b586ca2-20201010
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 122230117; Sat, 10 Oct 2020 15:09:21 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33DR.mediatek.inc
 (172.27.6.106) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Oct 2020 15:09:18 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 10 Oct 2020 15:09:17 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [v4 PATCH 0/2] fix scrolling of panel with small hfp or hbp
Date: Sat, 10 Oct 2020 15:09:08 +0800
Message-ID: <20201010070910.11294-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: E976FB5C5D4C68B5ED5FF64A5487CFDC6271ABC0676969679FADBA60D22808B22000:8
X-MTK: N
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Changes since v3:
 - Revert v2, for v2 will cause some bridge ic no output. the cause
   the video linetime doesn't match display mode from get mode.
 - Make sure the horizontal_frontporch_byte and horizontal_backporch_byte
   are > 0.

Jitao Shi (2):
  Revert "drm/mediatek: dsi: Fix scrolling of panel with small hfp or
    hbp"
  drm/mediatek: dsi: fix scrolling of panel with small hfp or hbp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
