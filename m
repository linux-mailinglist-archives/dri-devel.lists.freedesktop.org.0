Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 027432D2AC4
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 13:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8539E6E834;
	Tue,  8 Dec 2020 12:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7966E0CF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Dec 2020 12:29:56 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTnfi064008;
 Tue, 8 Dec 2020 06:29:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1607430589;
 bh=s1EWE/SXUVeER6hkk0HRG9tRuUdyEyQIlfDmCa0tmQM=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=zWrShTYuAjhM8Vy/qqK0zmAqP7YKOCmAzzr6MU/v4JIP7cUb5gpy07kdNLfh2f+e2
 VHt2+wg0VUdek0GNSAG5BA+AnKvf0uG5Qbk7x+Pv6a8l6R/aUozcL76HvGblZiq2pp
 lLUuSCQtdz8kMoNVfOROWFbwZBpQKH2nvx9C09aA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B8CTn9X103274
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 8 Dec 2020 06:29:49 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 8 Dec
 2020 06:29:48 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 8 Dec 2020 06:29:48 -0600
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B8CTcjH095068;
 Tue, 8 Dec 2020 06:29:46 -0600
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Sebastian Reichel <sre@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v5 03/29] drm/omap: pll: fix iteration loop check
Date: Tue, 8 Dec 2020 14:28:29 +0200
Message-ID: <20201208122855.254819-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208122855.254819-1-tomi.valkeinen@ti.com>
References: <20201208122855.254819-1-tomi.valkeinen@ti.com>
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
 Sekhar Nori <nsekhar@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
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
