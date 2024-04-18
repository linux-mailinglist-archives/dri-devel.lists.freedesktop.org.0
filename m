Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97A8A9C39
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA379113C8B;
	Thu, 18 Apr 2024 14:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=axis.com header.i=@axis.com header.b="BwpscZgx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FBB113CBB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:01:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJ5dolnsZHfE4UzHBrKiF2SNeOitgK0VR1FNzd3SQy/4x8Z4HDsfXfbK4KNQyMjbgwi28busqK7WUB5bBxTcvMTM7s0R/R7K8RCwfSZdug19WbPMordymr9X0WGTtHsjClSpkNlOwUsBT/i7DYb3lHxyfurXPeIdvBaMT1qw0MseE4BR2rJQXvjzl8h057aZa8OObl8ab4e0FC16XhZwaDe+f4NdTegGnNyqav6tmFh2avzaqKUwvjARHlfFcc9lu2+lrViPYk66womqjCwa+e7QgUATZrgndEW+Sa3vvSVwNyFU/MF6NkQMG9Eydq0P0sxkXjww3630NdAbrjlLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvDd4WZ/FXu6kJbvOJ1cc5VZdmsmYLjcGRKSXqgnvuA=;
 b=HgcNm2/vVM1SgLkFeLa8efiyxC3GeYIgqU23dvtyoeoBpca+CGZ2mn+uSn7WzZ62hDylRyE42MO7QRO0BjIB8jCx/ZXPX79PgdqAnWjpaLpHmfSoIEK+KKfeussUcN784XJgpm5BCclTMJFqvoG97bZDTgdLVym7BBUpiXTj42tS110fORiHl6hSwWjl7c7md4vf0wKrOQyCp3SfxMu/77bqaMZ2oCdvLue7wSyGwvi9hcVaUy598Bq/jlIKgDuyJt5YTTnobbYk4rQKGM+9okqSQSA7zwapfGdTheWfdT1ioeeZhryEmGhLhchNd84TDEoLDqcuHQmDzxgR1mJx5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=axis.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=axis.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvDd4WZ/FXu6kJbvOJ1cc5VZdmsmYLjcGRKSXqgnvuA=;
 b=BwpscZgxIEuabAkJTV77DUe7C0UlDrbGMfhgi/fs9rkvm96eXHLV++WXC/2DUyzcjD3h0E1eZHZrp0Zv8Pe4eOJJXPLL4ruLdSyYumhFXNgLBqAllXdy1JY/8v/RBM+niEUWgViHQGjDMLlAMb5pqazynaNm4FrVd+36cXQUYss=
Received: from AS8P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::11)
 by AM9PR02MB7041.eurprd02.prod.outlook.com (2603:10a6:20b:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.39; Thu, 18 Apr
 2024 14:01:31 +0000
Received: from AMS0EPF000001AE.eurprd05.prod.outlook.com
 (2603:10a6:20b:330:cafe::2) by AS8P250CA0006.outlook.office365.com
 (2603:10a6:20b:330::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.26 via Frontend
 Transport; Thu, 18 Apr 2024 14:01:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001AE.mail.protection.outlook.com (10.167.16.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 18 Apr 2024 14:01:31 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 Apr
 2024 16:01:30 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 18 Apr
 2024 16:01:30 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 18 Apr 2024 16:01:30 +0200
Received: from pc51235-2237.se.axis.com (pc51235-2237.se.axis.com [10.96.29.3])
 by se-intmail01x.se.axis.com (Postfix) with ESMTP id 309AC33D4;
 Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
Received: by pc51235-2237.se.axis.com (Postfix, from userid 3319)
 id 2CB8F4112992; Thu, 18 Apr 2024 16:01:30 +0200 (CEST)
From: Johan Adolfsson <johan.adolfsson@axis.com>
Date: Thu, 18 Apr 2024 16:01:15 +0200
Subject: [PATCH 2/2] dt-bindings: panel-simple-dsi: Add generic panel-dsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240418-foo-fix-v1-2-461bcc8f5976@axis.com>
References: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
In-Reply-To: <20240418-foo-fix-v1-0-461bcc8f5976@axis.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
CC: Johan Adolfsson <johan.adolfsson@axis.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <kernel@axis.com>
X-Mailer: b4 0.13.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AE:EE_|AM9PR02MB7041:EE_
X-MS-Office365-Filtering-Correlation-Id: ea1223f6-eb19-4812-f850-08dc5fb00ce3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6Kt+GqcWAHrOf+dnuwj2Bh/r10qiOp3KaV12YYzUF9/U912JAYVUhuCquMQO4Zdm+ZinrVNIqkKNspuiEnR72zvjAh8DlxGD1USmk8eK/aOgVUVPbXV3v/jzF1W7ahF3sVHjXbHV0cIVej/HatCcf6HASNWq1h4LPUyK19UJlb4mTWJE0P6m59Wl95+/toV4gJUO6rw0M/pnajxN510JqmprIYj9RJLQQt6TiCM6Oz6pLLWmAdM/dFE+QDRSoN2jbUL4rdzd+XW/QufUQkgFsB/OCOIKgGV6WhBFepWqcNOpIoFei9325jxXOb+M9OsTIKt3H3syTnYhwuWeBajiM0kXOdJzzqPKhXtI0nNMOpVbtKGAPyWZP6mWk0kZyXouYV2V3cdPsV+/9abxokh5Gh1J1fJ3h06omNyser4bUXI7lDyaZeHOxb/4e7KliFfMbfCOmnNAtZVP9+h0jA+IgwOyLQhuvt8B1bsrQ7UjnU1X0MEY5Vo8629EptXAj+5nK9476Z0YuCOw4btPKMntgQpML13nu+2/yY/J2AuXuOC/lOG4nw7UoQKFBerDhSJ7XSJ4/6xHqRxuwIIwkgpxUCI0Ncza7Qkx1GieJbDUFJ360nweaCfxJBhrOgD8nYrlBcB6GGYntnLrxyGj1BW3a6g7FnU4qKiEvQcKVtWEqK1aiSwmtgZhIK/UPyXuwUFjbhzWgMKb0D/U+lwMrFwAJiEch8yUQ16vf7OZyYPPnfoC6v1d5EwqZykiUEhZtnyrZGHSlmKDtI6PdTG1USZdGw==
X-Forefront-Antispam-Report: CIP:195.60.68.100; CTRY:SE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.axis.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(7416005)(376005)(82310400014)(36860700004)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2024 14:01:31.4292 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea1223f6-eb19-4812-f850-08dc5fb00ce3
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af; Ip=[195.60.68.100];
 Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001AE.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR02MB7041
X-Mailman-Approved-At: Thu, 18 Apr 2024 14:05:57 +0000
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

panel-dsi is similar to panel-dpi with overridable timings

Signed-off-by: Johan Adolfsson <johan.adolfsson@axis.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9160d7bac3c..4c9dd4f66a8f 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -56,6 +56,8 @@ properties:
       - samsung,sofef00
         # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
       - tdo,tl070wsh30
+        # Generic dsi panel with timing overridable
+      - panel-dsi
 
   reg:
     maxItems: 1

-- 
2.30.2

