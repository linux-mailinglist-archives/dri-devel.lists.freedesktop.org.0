Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4245F2DAB50
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 11:49:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42ADC6E1F1;
	Tue, 15 Dec 2020 10:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5D26E1FB
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 10:48:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAlx8u124259
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:59 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1608029279;
 bh=ouRZsQPh5tS1wwh9vZbM2ihw9Nw74/E+RlEtXdkFOtY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JlFPJb/YLziWIxbMB+QsBoc6V3evKyv7asJK/A8W6dr8uB84xpoDc5RFfn+Mhcrya
 fIN/F782DdZwFkRPrBZDgunIzLtuvKbPWLRKz7S2kO4Mm3Id+pgYDHcCjucrMFftid
 IQHNKStUOdBhgKr6H8UJ/o7Is8C5bmhY0HTf2iH8=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BFAlxcg001072
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 04:47:59 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 15
 Dec 2020 04:47:59 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 15 Dec 2020 04:47:59 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BFAkwai046467;
 Tue, 15 Dec 2020 04:47:58 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH v6 58/84] drm/omap: pll: fix iteration loop check
Date: Tue, 15 Dec 2020 12:46:31 +0200
Message-ID: <20201215104657.802264-59-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201215104657.802264-1-tomi.valkeinen@ti.com>
References: <20201215104657.802264-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: tomi.valkeinen@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the PLL calc function is given bad parameters, n_start/m_start may be
higher than n_stop/m_stop, which leads to the loops iterating through
the whole u32 number space.

Fix this by failing early on such cases.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/omapdrm/dss/pll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/dss/pll.c
index 241a338ace29..4c8246a3ded9 100644
--- a/drivers/gpu/drm/omapdrm/dss/pll.c
+++ b/drivers/gpu/drm/omapdrm/dss/pll.c
@@ -222,6 +222,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsigned long clkin,
 	n_stop = min((unsigned)(clkin / fint_hw_min), hw->n_max);
 	n_inc = 1;
 
+	if (n_start > n_stop)
+		return false;
+
 	if (hw->errata_i886) {
 		swap(n_start, n_stop);
 		n_inc = -1;
@@ -239,6 +242,9 @@ bool dss_pll_calc_a(const struct dss_pll *pll, unsigned long clkin,
 				hw->m_max);
 		m_inc = 1;
 
+		if (m_start > m_stop)
+			continue;
+
 		if (hw->errata_i886) {
 			swap(m_start, m_stop);
 			m_inc = -1;
-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
