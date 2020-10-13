Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1A928CB64
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 12:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB58D6E2DF;
	Tue, 13 Oct 2020 10:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [1.203.163.78])
 by gabe.freedesktop.org (Postfix) with ESMTP id 883896E2DF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 10:06:33 +0000 (UTC)
X-UUID: aed1f1d00a444cdcbfff67dac4779764-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gr35+E9wzqD1OxifIpp0yw5HOLR0PL48ny+X5AWGPOA=; 
 b=odfnDU0iKJ67vy8izRz2evieWK3gDBUcvZzQ5pHhwbOdEN+rtezSJ6/mq10yYFHpfALTaLp+SeYxh2Y7Nkzqa0OfdWzaI5ZZxbSMCavtCGqlTc9O9KYHyq1DpYFOVl53nWU6sw0vV40bX9XENm7wPC4+aES1id/gnXfD311E5IU=;
X-UUID: aed1f1d00a444cdcbfff67dac4779764-20201013
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1192160898; Tue, 13 Oct 2020 18:06:29 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 13 Oct 2020 18:06:28 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 13 Oct 2020 18:06:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/1] fix scrolling of panel with small hfp or hbp
Date: Tue, 13 Oct 2020 18:06:24 +0800
Message-ID: <20201013100625.13056-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: C951D73D807948089F1EF863B8ABC438D1D86F1001F1BAEB1F78D927A0FBAFD92000:8
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

Changes since v4:
 - Merge revert path and fixup patch to on patch

Changes since v3:
 - Revert v2, for v2 will cause some bridge ic no output. the cause
   the video linetime doesn't match display mode from get mode.
 - Make sure the horizontal_frontporch_byte and horizontal_backporch_byte
   are > 0.

Jitao Shi (1):
  drm/mediatek: dsi: fix scrolling of panel with small hfp or hbp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 65 +++++++++++++++-----------------------
 1 file changed, 25 insertions(+), 40 deletions(-)

-- 
2.12.5
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
