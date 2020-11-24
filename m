Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B812C2642
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 13:48:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D036E426;
	Tue, 24 Nov 2020 12:48:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 548406E42A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 12:48:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCmEVe123828;
 Tue, 24 Nov 2020 06:48:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1606222094;
 bh=2NRaBWC8IqkA5KTlJmSxGek8j9vPfAbnozVdHgpeR9U=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=I+66OEKwmo+Vd1VTWEFpNhj9W9FyLSj1f8ki/0uQefppX4K0aZoMs1iutdcWks+xT
 TIz3UyE6kDuAaR4vdIonOIq0J2aeFaXOi4XHFlx8VONsF5qDLm1A6GtLyKPTm+RoZs
 dTHcI1DwZkM1PHb4gdU+K7uYQCrGSwE5saP5PVio=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0AOCmDo0109017
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 24 Nov 2020 06:48:13 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 24
 Nov 2020 06:48:13 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 24 Nov 2020 06:48:13 -0600
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0AOCjmpl040922;
 Tue, 24 Nov 2020 06:48:11 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, <linux-omap@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v4 58/80] drm/omap: pll: fix iteration loop check
Date: Tue, 24 Nov 2020 14:45:16 +0200
Message-ID: <20201124124538.660710-59-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201124124538.660710-1-tomi.valkeinen@ti.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the PLL calc function is given bad parameters, n_start/m_start may be
higher than n_stop/m_stop, which leads to the loops iterating through
the whole u32 number space.

Fix this by failing early on such cases.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/dss/pll.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/dss/pll.c b/drivers/gpu/drm/omapdrm/dss/pll.c
index 1212f3cc52d1..12926218c436 100644
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
