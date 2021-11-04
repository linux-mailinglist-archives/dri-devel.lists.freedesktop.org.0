Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D08444DC6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 04:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7957B608;
	Thu,  4 Nov 2021 03:36:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2097.outbound.protection.outlook.com [40.107.243.97])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D337B606
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 03:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8Eh/N2U5AuLOQhoH/YWQBEDnxrgP9HcwXeks9KQBFaUiCXV5zjMBdanvBo4CZDDTsbgmtErfsXTd/cjVguPYTKaMRFYyrBgYbdeq1XUWGxQW/727z3v6SXX/eG/oErnkUb2qjlX7GXDekyRZwnj6mTaxuG/7jrzWWZ2RbgvxaKmdPlQhzlAm9RW6vhj2ic6xl9tauUlu/5Wch5ZYNoiL1bQka+ooCfAbSo4gZrjCBYZADMxDZhf+J3kqWY7IQQrAPiyYEF44u2Cby2PrDJoXZhX2/uDt2HeZB+4Aa/kwhADS/EpDSaN6gIIccyPAkmzmUtp2NiAxDyBBb6P2XfGjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hcXEx1GPvsg6ED0t33FFSJvqci2SrnctcPjfO/WKyiU=;
 b=f1lbAvGPJM2ZGlNRqxUEX7KRvybpY0dsDCmSysotzyGI59abXmLA6mSDbIpSnqez6G51cQkjdlFlbvnE4oF0TIUtu2rNRGrlkTxA8RILG6q5H/TH1ASmpOcmJt45IHYoK/c7wN+lQpTFsjPdi8+EVlYd4jX2twd6lazBodFfHNo0fyO2hEe8TUvuhGw/nLZ4rCPNCbsjlOJVguZ04KkX45zssr2xs3ToVu7JSKb/aaowwm29COROf1zebJnaqUFJnMkrRFGrp5Hv53VXdIUO/R6Wi7GiYWzeWfFhYmQtZkxz5VpLbFByZjGzeT+16hs8ErziMVsiIYaWk+LlgmqSfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hcXEx1GPvsg6ED0t33FFSJvqci2SrnctcPjfO/WKyiU=;
 b=DqZStykXcKH/bbIuDGB2NyaMS8ak0ksPHiUTeZPQwWKTBJc5eDZ2XjEybtjWVh+w+gnTfiQQoETLw8xd+yRa4hijpKq204l7IoEYQDT/P7WlGl7e4PjtlDbkK1hq0IGgRzaZRyWxqPkEM+yLKsXpaPI3lmybwLpnwNe5cmFoHAs=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11; Thu, 4 Nov 2021 03:36:17 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.011; Thu, 4 Nov 2021
 03:36:17 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com
Subject: [PATCH v12 2/4] drm/bridge: anx7625: fix not correct return value
Date: Thu,  4 Nov 2021 11:36:09 +0800
Message-Id: <20211104033609.2634452-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR06CA0016.apcprd06.prod.outlook.com
 (2603:1096:202:2e::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR06CA0016.apcprd06.prod.outlook.com (2603:1096:202:2e::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.17 via Frontend Transport; Thu, 4 Nov 2021 03:36:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fe66a4-c235-4002-b760-08d99f4442b1
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-Microsoft-Antispam-PRVS: <BYAPR04MB4277DFBAF6C5CB5B65FEC5DEC78D9@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:813;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kwrbheBp0RRqmU3g3Y+qB3vW0pcQ7W1j8EESWseSYpSbJ/kaU/twFr2e07gTsR+vLvnQTvG8ogBDkU0s4Nvq91BUw5KhOPkbY+5hHHaoVhzuR148X/gNiUjtdPvFLBjPL5SSi/RAZP6hfog50A91NLMH5PhovMbv8Al4dKaPVp6e5TmQGsAFJgHFCsRwIR1R4qY5V0Iys+e4arjurIAEW9+1EIF0kmvVuJtDpdxmmExYbm0ks4wDb2vtamV34SQdtoaxzIAh8IZafCMm2ZHCXHiaWDuN+tE3d4RZB68a9DusZgl83HFMgdQ53+Mi/vwRu9rL7puLF7/zzcXqeKhIrld8txpEo4nNejnQTw7V5fCu+wzAdgxECbyDwpeTODNS/rZ5oSuk+Gj326cvWdQGYS5yWGW+BSwHxSYAe3Wr3WbgxRyMzOYhLNNlwGUziO+svsn/V3pqGk7Oi7rJzaWGhnQCKhmfwONVXcu3tu7DoL0e4ilpZAW3X6Wj8tqIC9ax0U/ausjv/E9uX6MN3Fvte4yBy5LXNxax8uZGmaAWiW6IuP+Nd7bGsZKDFKkWuf33x4N67wYUt1z9w1+AY5fpVOCbwpNmrhDSJxY1dnXwUw8V0oxC5svVPrlsEAmD9jM0qrO5XH/RmLNn0BLsRsqzKDXNVRX4PHLlV+bSoE/qyT374GJ+LgJs4VZamnnnjRAblZFYbRhSSykBgONkWqidxdThxu4S2DvlhSga81mtKZo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6666004)(186003)(26005)(8676002)(8936002)(55236004)(36756003)(921005)(86362001)(7416002)(83380400001)(52116002)(6496006)(107886003)(6636002)(38350700002)(38100700002)(1076003)(66476007)(66556008)(4744005)(6486002)(316002)(5660300002)(4326008)(508600001)(2906002)(66946007)(2616005)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?II+LejYBx8TBAs+MRqI4ZABvGj4/oea9MB0MH900/l8os0n+2Cj63bgj/i6k?=
 =?us-ascii?Q?rT30C1dDQ1/+tq3DzWgfkpZjooTSPCZUKJ/IxGnn4SxDV+sKAV0FJ8PmN3+3?=
 =?us-ascii?Q?4ON9K9JzmHrcjo0A5p4GTF6aYzEzSMJHoT0qU4gKA4oQIXTj3WwhZoT5xkXz?=
 =?us-ascii?Q?IAQrkmqSvZnpGMmRtsmHX+nfyV5i7/JO90I6WXVectczB2Ns3IwC5hNvRxAQ?=
 =?us-ascii?Q?G/tEjbh5P9hpytGwAGAvnQsrey6837JfSqdv2c1BoEwxAhekG6xJcEmGoZW0?=
 =?us-ascii?Q?BNrHR9Hc0CQpIq8Tt/PBJYpac5EvkTGbxhwRgJcVIXL/RtC9xcFP5DTpYcmY?=
 =?us-ascii?Q?iywmw5v9UIyLjyIZKcNrLTPbbvnrdkzJq4vjScJk4RlvhpctZqRLg3sIKLow?=
 =?us-ascii?Q?+gxsWvU1JG+M0sgW7PLX1IxnTMJcOlfdq6BEUVHTQ6hxmZZFj6P9+eQ9jJ1u?=
 =?us-ascii?Q?ASAt3neRNv4je/j3pIl6yXnXGC0yLdCD/qkNSA5EwMtSiZKZa4rEr4HYCGfs?=
 =?us-ascii?Q?EKuC4+oJ4/OCv/HwEPKtlfVDhlQgIZwbDyu0sCcxOFWOcU2EVOKz9xa1ds/T?=
 =?us-ascii?Q?W+MB3TK4azcZHi3XZXo5GHqtaZfaZ6AH02Dn03xbCUzWFTdzQxPIivVdCHFW?=
 =?us-ascii?Q?BvS3w3e5opJzfL3HIfZN+r8n4/ygmy4WyTkzE1obpLh+ZQ4GA6Ka19BUdEvb?=
 =?us-ascii?Q?BnfDaiu3lKXznmcxk2eL3vNG9UlanByF+vBrL4Psollnz1k6Ygr03MwaQJ/L?=
 =?us-ascii?Q?OtrMiOKXUktDJclePH0kpcrUZcj0dflw6+ja+BVFchrkEWY6Knp4Ulp3TEQA?=
 =?us-ascii?Q?LsP4yUA0AIwyeCs35t8NQI4tm5aXPhG7hGfXfVBt3LAweAmwJo3uxJwLPthL?=
 =?us-ascii?Q?1beePZ02JVYJRcaOuFB4dAOC12FG1ohvV6Aiz6+HixnSwdlE3UmRvNvMK8f0?=
 =?us-ascii?Q?OZtlk1pZZ9ENCJD8RkvcZxXRrGKZ0WdC1rK4p33kC3MSSWzWeQ+oIxtjFyFO?=
 =?us-ascii?Q?wWIbX4w6pcYxG/CnMCSQeZ5a9uCcvZj9fq4oxnSnfwCQoDtDlMWAMOItl/0L?=
 =?us-ascii?Q?wfnThba9fbqSOFOEo70gdNfcvxO58UXSkhPrmCSqavOsxaYosLRV56qn64eu?=
 =?us-ascii?Q?957uqtbbfmM02ngyWMMjfJujMkPb9OhDZy/1cGRtYF483NbzBGTLlOSrBOq6?=
 =?us-ascii?Q?/K3aOCQh/FjnlcZlar8cqUTCHfOhf4rc5Zi54mbHa8a2JunZ7OMJPqbi0kyu?=
 =?us-ascii?Q?uoxrCQl3lj7/q/TMi8HXIaLVMONVpjoPTmH5zHav2OavJ1Hd0CQcR4v5ECtG?=
 =?us-ascii?Q?SkvZ74P07LOSAzacFivY+DOy+5H31rCKQM0LsjwKJ5Kc3SSuS8/Jl+8KNCg/?=
 =?us-ascii?Q?QDDzrnME1z61Q2CzePhBVPpc3/aBBKCtJVh1O5cN8/rsTxlK7J/PMTDb8kSN?=
 =?us-ascii?Q?dPM0+ovQ092C4e3jxFqAsUZiTsNH6e9PGEkcyjusahBj7fOvam8z0hfrfUMN?=
 =?us-ascii?Q?IT74DTKxuoUHw762UbowmCrkXxtWApKm3+/0TIP86uJ/MEEZzmH4g/0UWqmh?=
 =?us-ascii?Q?lP+NTteoaIKzCA4WOvN1aIwxAhKWYFy3TU7naBIwy5DReSGR96lOT3sEqvnF?=
 =?us-ascii?Q?nByT5ysiQXsQKE1WJAmraSs=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe66a4-c235-4002-b760-08d99f4442b1
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2021 03:36:17.6167 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPtRunVBlBdHbQ5jLZFhEE5zHNphlmCLaQRkK3FcVAf4ChokYXaf1ohYA9V3x8HL6Q2ULFkCMjdd5o3rLyM2Rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some time, the original code may return non zero value, force return 0
if operation finished.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index d0317651cd75..f48e91134c20 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -191,10 +191,10 @@ static int wait_aux_op_finish(struct anx7625_data *ctx)
 			       AP_AUX_CTRL_STATUS);
 	if (val < 0 || (val & 0x0F)) {
 		DRM_DEV_ERROR(dev, "aux status %02x\n", val);
-		val = -EIO;
+		return -EIO;
 	}
 
-	return val;
+	return 0;
 }
 
 static int anx7625_video_mute_control(struct anx7625_data *ctx,
-- 
2.25.1

