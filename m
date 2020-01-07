Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4F9133CD7
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2020 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135F46E85B;
	Wed,  8 Jan 2020 08:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2120 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2020 14:14:03 UTC
Received: from mx0b-00128a01.pphosted.com (mx0b-00128a01.pphosted.com
 [148.163.139.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5AD6E0BC
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 14:14:03 +0000 (UTC)
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
 by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 007DZ8ot014189; Tue, 7 Jan 2020 08:38:23 -0500
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2177.outbound.protection.outlook.com [104.47.58.177])
 by mx0b-00128a01.pphosted.com with ESMTP id 2xawstxm7f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Jan 2020 08:38:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVBGHP+DQwreA1lcfCUAvNwtKZzwVP//JGkVycMa06J6lORo82taBcMV7l0EXXgUae7PTQJFhEFDeJhC6XjLjeLYsyeVxRzDhD/ftbR0qIib2xESryzFen67YXGrFCWbmCchklP5yMJo/Jx/GafHGAbfsupeOJcwjs//KnYoe6N7XkNZc44XavQ5aZU5JFi9O5B7W/yQF4DgMMqF20c3K0myENdoGEJ3TL0r6zMsizeTpaAMmXspjAGtEF5N0JvsRWMWzQkFAx6+ZsYD4tOd7Moj5+B+eAPXfQ8Ok2FTicGcv/V7dYAXOGdtcuQvGTYK6G9ZNjXoNigXsMxDsHQhIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTS5MjprULROAWlenvx7VJkfS5XKGVLfzC5afYK0ChY=;
 b=PI1mV0CqeLE0BnGeWEh0m3ij5GFNMPSotcuo+ZzdFHN3nGMgERBfq3QyqmYCyebih/QY1dO3CGwPkJNnrbfwJ54l5Mo7Stl9bjdPOEMbiOpIMBARvX/IqrwCSy3T2rXnZ/1wLUTme1JoOQ5m/6vSRl2coE3QADXvXFpLmBtkee9xyJGzWCAsqW4PCRC+/m2UwIyIHkzfv2mJ61AFKgOL/oWZ02boLDfRTfhMO4g73bvkZVzB8rrD+yS21xrqnOSKoGnrFOMKkWhIdji6IDG2B8fATGpPcj0r0MVN1hNdKNK9kFeY6JxncaXmtHB7zUso3isRjIYtEjs9v6PA0io7Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 137.71.25.57) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=analog.com; dmarc=bestguesspass action=none
 header.from=analog.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UTS5MjprULROAWlenvx7VJkfS5XKGVLfzC5afYK0ChY=;
 b=dICqBpKBBjVrXOrvt/+8Qsg70o1k4eq83HN0EGaDOLtkp1IHINGdlY0aiE0qiiNkiFqpvv5WFYhpVN9DGK7PrscxVHnwCNfMXRKVGU1Gq+JY3xI37au+Elt7SNMYrMs3xTcUEPljUCIpyEBauaDZE29TAsqmQWmLE6adgs20EIQ=
Received: from BN3PR03CA0093.namprd03.prod.outlook.com (2603:10b6:400:4::11)
 by BN8PR03MB4642.namprd03.prod.outlook.com (2603:10b6:408:95::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.11; Tue, 7 Jan
 2020 13:38:22 +0000
Received: from SN1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2a01:111:f400:7e44::202) by BN3PR03CA0093.outlook.office365.com
 (2603:10b6:400:4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via Frontend
 Transport; Tue, 7 Jan 2020 13:38:22 +0000
Received-SPF: Pass (protection.outlook.com: domain of analog.com designates
 137.71.25.57 as permitted sender) receiver=protection.outlook.com;
 client-ip=137.71.25.57; helo=nwd2mta2.analog.com;
Received: from nwd2mta2.analog.com (137.71.25.57) by
 SN1NAM02FT006.mail.protection.outlook.com (10.152.72.68) with Microsoft SMTP
 Server (version=TLS1_0, cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.2602.11
 via Frontend Transport; Tue, 7 Jan 2020 13:38:21 +0000
Received: from SCSQMBX11.ad.analog.com (scsqmbx11.ad.analog.com [10.77.17.10])
 by nwd2mta2.analog.com (8.13.8/8.13.8) with ESMTP id 007DcKkD017633
 (version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
 Tue, 7 Jan 2020 05:38:21 -0800
Received: from SCSQMBX11.ad.analog.com (10.77.17.10) by
 SCSQMBX11.ad.analog.com (10.77.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1779.2; Tue, 7 Jan 2020 05:38:19 -0800
Received: from zeus.spd.analog.com (10.64.82.11) by SCSQMBX11.ad.analog.com
 (10.77.17.10) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
 Transport; Tue, 7 Jan 2020 05:38:14 -0800
Received: from btogorean-pc.ad.analog.com ([10.48.65.146])
 by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 007DbflQ002280;
 Tue, 7 Jan 2020 08:38:09 -0500
From: Bogdan Togorean <bogdan.togorean@analog.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RESEND v3 1/2] dt-bindings: drm: bridge: adv7511: Add ADV7535 support
Date: Tue, 7 Jan 2020 15:34:32 +0200
Message-ID: <20200107133431.5201-2-bogdan.togorean@analog.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200107133431.5201-1-bogdan.togorean@analog.com>
References: <20200107133431.5201-1-bogdan.togorean@analog.com>
MIME-Version: 1.0
X-ADIRoutedOnPrem: True
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:137.71.25.57; IPV:; CTRY:US; EFV:NLI; SFV:NSPM;
 SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(189003)(199004)(186003)(478600001)(44832011)(54906003)(4326008)(316002)(2616005)(26005)(426003)(336012)(356004)(6666004)(6916009)(2906002)(246002)(36756003)(8936002)(5660300002)(1076003)(86362001)(70586007)(70206006)(7636002)(7696005)(7416002)(8676002)(16060500001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR03MB4642; H:nwd2mta2.analog.com; FPR:;
 SPF:Pass; LANG:en; PTR:nwd2mail11.analog.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b924af86-60eb-4cf3-2be0-08d79376dd12
X-MS-TrafficTypeDiagnostic: BN8PR03MB4642:
X-Microsoft-Antispam-PRVS: <BN8PR03MB46420A48C6AC5D1C2EF65D8A9B3F0@BN8PR03MB4642.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-Forefront-PRVS: 027578BB13
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j/1bEBrWZ3BtZQsiHqsgT5iAyV7tmCou4PfLmt3zCBHv6PTSOg931zxZPcmK+guaN0+1JBMPzgLfOlLQ6xObs2Y+X3av09MXtBMnI9beRBui91BXTamaIh5wJXzb6G2ltaC4POtLTEtHkgSzQ7WW6iH4dyv5IWuIg/H6AUTF/6gb29UeS899qQJf+qgZrMY8HUMQpE3sQaqEhXNH12E6QHkFKn4R99zssh0knLDrRSi597JuAIsADSWimMqdSKiG6vjgGSiOZ/hsfGGkVf6Lo5rUpAV9MQPwFYMwy40X7W3g6rk857ruFNpD5Bo4k0KjCK0d6WoamIn3jnVa6ipHgCZcMHRRb9ZfX3FBuLyxXGSznC/StwNWYST78sqQv7FjRVoqXbsJVHmb9FwLRfNDkyyubLX5Crzn2WHwcNfk6Qjh5j2HDBsoDht4YbNXL6x0iztj66ftWTPrbPoOlIV5WrxdOxrYlRWYm12g7remfn0j5o1lUhPZc9EkacnnvBQE
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2020 13:38:21.9323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b924af86-60eb-4cf3-2be0-08d79376dd12
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=eaa689b4-8f87-40e0-9c6f-7228de4d754a; Ip=[137.71.25.57];
 Helo=[nwd2mta2.analog.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4642
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_03:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 clxscore=1015 suspectscore=1 spamscore=0 mlxscore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070113
X-Mailman-Approved-At: Wed, 08 Jan 2020 08:12:31 +0000
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, wsa+renesas@sang-engineering.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 alexander.deucher@amd.com, tglx@linutronix.de, sam@ravnborg.org,
 matt.redfearn@thinci.com, Bogdan Togorean <bogdan.togorean@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ADV7535 is a part compatible with ADV7533 but it supports 1080p@60hz and
v1p2 supply is fixed to 1.8V

Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 .../bindings/display/bridge/adi,adv7511.txt   | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
index 2c887536258c..e8ddec5d9d91 100644
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
+++ b/Documentation/devicetree/bindings/display/bridge/adi,adv7511.txt
@@ -1,10 +1,10 @@
-Analog Device ADV7511(W)/13/33 HDMI Encoders
+Analog Device ADV7511(W)/13/33/35 HDMI Encoders
 -----------------------------------------
 
-The ADV7511, ADV7511W, ADV7513 and ADV7533 are HDMI audio and video transmitters
-compatible with HDMI 1.4 and DVI 1.0. They support color space conversion,
-S/PDIF, CEC and HDCP. ADV7533 supports the DSI interface for input pixels, while
-the others support RGB interface.
+The ADV7511, ADV7511W, ADV7513, ADV7533 and ADV7535 are HDMI audio and video
+transmitters compatible with HDMI 1.4 and DVI 1.0. They support color space
+conversion, S/PDIF, CEC and HDCP. ADV7533/5 supports the DSI interface for input
+pixels, while the others support RGB interface.
 
 Required properties:
 
@@ -13,6 +13,7 @@ Required properties:
 		"adi,adv7511w"
 		"adi,adv7513"
 		"adi,adv7533"
+		"adi,adv7535"
 
 - reg: I2C slave addresses
   The ADV7511 internal registers are split into four pages exposed through
@@ -52,14 +53,14 @@ The following input format properties are required except in "rgb 1x" and
 - bgvdd-supply: A 1.8V supply that powers up the BGVDD pin. This is
   needed only for ADV7511.
 
-The following properties are required for ADV7533:
+The following properties are required for ADV7533 and ADV7535:
 
 - adi,dsi-lanes: Number of DSI data lanes connected to the DSI host. It should
   be one of 1, 2, 3 or 4.
 - a2vdd-supply: 1.8V supply that powers up the A2VDD pin on the chip.
 - v3p3-supply: A 3.3V supply that powers up the V3P3 pin on the chip.
 - v1p2-supply: A supply that powers up the V1P2 pin on the chip. It can be
-  either 1.2V or 1.8V.
+  either 1.2V or 1.8V for ADV7533 but only 1.8V for ADV7535.
 
 Optional properties:
 
@@ -71,9 +72,9 @@ Optional properties:
 - adi,embedded-sync: The input uses synchronization signals embedded in the
   data stream (similar to BT.656). Defaults to separate H/V synchronization
   signals.
-- adi,disable-timing-generator: Only for ADV7533. Disables the internal timing
-  generator. The chip will rely on the sync signals in the DSI data lanes,
-  rather than generate its own timings for HDMI output.
+- adi,disable-timing-generator: Only for ADV7533 and ADV7535. Disables the
+  internal timing generator. The chip will rely on the sync signals in the
+  DSI data lanes, rather than generate its own timings for HDMI output.
 - clocks: from common clock binding: reference to the CEC clock.
 - clock-names: from common clock binding: must be "cec".
 - reg-names : Names of maps with programmable addresses.
@@ -85,7 +86,7 @@ Required nodes:
 The ADV7511 has two video ports. Their connections are modelled using the OF
 graph bindings specified in Documentation/devicetree/bindings/graph.txt.
 
-- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533, the
+- Video port 0 for the RGB, YUV or DSI input. In the case of ADV7533/5, the
   remote endpoint phandle should be a reference to a valid mipi_dsi_host device
   node.
 - Video port 1 for the HDMI output
-- 
2.23.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
