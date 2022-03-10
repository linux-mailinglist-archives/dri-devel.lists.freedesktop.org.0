Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D6B4D4346
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 10:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B17A10FDA3;
	Thu, 10 Mar 2022 09:17:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2109.outbound.protection.outlook.com [40.107.223.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7BA910FDA3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 09:17:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fMCLbDknTwot3pLHzVTMADzwMnV70G+IWCcsBc7kcdagYT6hqSyVVkbDe7LT6RFmGmbA0H8ydxeL47zWXvu0zp6BykDna8MRCziLuHgjNjrb2csm0HWCMNaARxlXnOjBL17JymqiXizUyWxZtj0sI4pbVbbkyZ37wWaz1c53wuV5xejD4zLz6l0rJQ/VdgaUismTlddOzhf9sZmvJdZLJvxtkNSnNae3hjgddNeYOrb8CfPr/anXXPFPOh8ANsm5rzJQM1bDFXC3ZucJTxefOXFBpdU8UFlwr6hKp89nfi44eWcwU1Nx80wGbSaEnxQPoMY74QpAh2QXr6TjgSWmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8cj0mrCMIs9PN+wOh0LAfWCQY7sBTjA3cZn7v7M0yE8=;
 b=F/c4RbhcSPb5ZGSIVmBUd9X6Z1wDIjwcMwPOrjVdxcgw2N/HLgGRR2kJRBSpq3CiYdm8NAoYwec7TSPN3+jb7AUo9MNxs+ZN6qgrDZ7WPjAaCd/K7W2OtQzG1UL8fd6+MMxReGzLw4nBR1ozmgkbETK2ckxBMaKfVolG/F0zCLzFztqu70LCTu872oJq6eFBGli4SFOAr2m3tgQ7jIz5eBsoRU/0pXq+xfsocy8qxSnwL5GisA/suoXr1I/SEc3Gy0sv7GmzW4ivHz9ognDn04zrvplpe/65zYNCnGryJz+tPTTgIArITn0HfCmAsD2g4ekF7A1mGTaMjgzNCehZPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8cj0mrCMIs9PN+wOh0LAfWCQY7sBTjA3cZn7v7M0yE8=;
 b=V7v5AZ271MY92kmPPGnKK/8GG0nRD0JAw0OHWLTBnmZ0AWPcIFTcEx9F1cNV2itQDW4O7xGnHnPy4/caa7+fus77IObZnhwb+mkaOnYXdlG4VG5uJRr1EYli8efZJhV2a+HYxQi4GAveqnvj8PvXdvNAuuEwlb4f5pwp/aPjBco=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SN4PR0401MB3550.namprd04.prod.outlook.com (2603:10b6:803:46::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Thu, 10 Mar
 2022 09:17:32 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::a865:6d10:c4a9:1142%9]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 09:17:31 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH] drm/bridge: anx7625: Fix not correct get property counts
Date: Thu, 10 Mar 2022 17:16:53 +0800
Message-Id: <20220310091653.1298588-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2P15301CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::23) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b51d5b2-d147-4eb1-6a24-08da0276ce23
X-MS-TrafficTypeDiagnostic: SN4PR0401MB3550:EE_
X-Microsoft-Antispam-PRVS: <SN4PR0401MB35509D5804A2B6EAE3E64A8FC70B9@SN4PR0401MB3550.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wl4LGflbF6LiQ/F59OXpEzJS9V/Zj33ZeMCCETmeEiRi/mhLfqZgLS7jqAmJmFDZY1jpTskrsXEac5yuv3qXHgXMype3wCcsu9ZI/Pzb3nwEpMJ5dPBU2ONglPe6WdnVCVnYgrVzV1OuE4owo1iQXaaTXodSwmCfvwW0BUzs45dnqSNGQrb5RRpgr4LYYYtHcS55UNQbw6FSwkodGYKquNN1d/tzLa6XvRQYkipyfxnt9Aw1byjhM6AOsd9JYUg8EpBIj+uzLWMKb6mY9ypDT7eNOTFVrnpV+xb9AZXBy9zIkRlKEPyiMnrs7gk2yFWrVEaZS6JdkqGlVw8wczv2Fhs6QkKhMxa0DcvuqahBVA0v8E7Tf7ndGYN+qadO+h0LmLeoEzVK+t4tkFpYX6QOqLnLHhhXb0psaXr6rZj7D9kINgTMY0isSBGTxPCM5yWi/4E6ZlN7kKR6hBTJhTyWvLGNPXAff/dke6Zsc33Imb7CXTwVUToWZNPwfeaM5OtbyPB1lJn93xO0/nZwgYiaBd9DmSgo9vom6blAsVWl61KFF9HhgKbvdzr+WCdhjflds4u4y2Lb63FO+5BylBo8igZRORXg5rPdziKH6tItOy+CWmKgCdOgsiG+x2/GtMvM8Io2J/LhtsoiNTUKo7hnaHXPzljriOnjmpHyKzwkMuYqIsJgoFZhXCEHH3CKBzhR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(1076003)(2616005)(7416002)(8936002)(110136005)(38100700002)(26005)(186003)(38350700002)(7049001)(2906002)(52116002)(55236004)(508600001)(6506007)(36756003)(6512007)(66946007)(66556008)(66476007)(6666004)(316002)(6486002)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WonV+jWFy1dkeqejCPnOtBcN+ZFMogCbuqF5p/Tu9dT5m+/e8CypC0pqGWGh?=
 =?us-ascii?Q?8GQE2J/zEBT0K2f3Uncnkf4nBRLxtJFiW5lAkj0i3Yvqj9hxYPCTeUAP5yq/?=
 =?us-ascii?Q?xF+Op8wt5rqwhtRi6qJ0GgIbjfAJitbYxpZxaFrpHLwmVOT20V26c3/iRR/Z?=
 =?us-ascii?Q?VkcbiEsYRjC5yL7ToiNUpz7XXkU0aJJrv3t8YW+HnuhEP91sckMaCaBfZufc?=
 =?us-ascii?Q?zRFfbJ5X4RwGQLtthFDlXULgPqmkVPk0/+ohgKomnsNmO6RiS3Y90fS24LuW?=
 =?us-ascii?Q?8SB2m7zGYZXeGeaRC3+zYrCD+MDoLPX2bPnScFRZSgh8AuxtoPKA4lueS1Nc?=
 =?us-ascii?Q?47rDfIrs+abMmndZU+TuG0sHIlHAihNnOYT7AqE+daENkuiq3GCJ7KccZZ77?=
 =?us-ascii?Q?OnSjB6ev8EJd+RXsqcoM1C/F0TxCE30F/4dfW8qmxwedSGj6XjVKRjozOD5y?=
 =?us-ascii?Q?45vVoYQyTPHmza6PPdqSJCESazcYE2fg18Y3m9Mz+fmlDN3bbXSkHu5Ccc/7?=
 =?us-ascii?Q?d36M01yWpvsd+PXbaFDbWkFUgCyLrSl0LlnS3n2AmtwF+ksN2VEIOcNUUAwU?=
 =?us-ascii?Q?zBfZTxNbJpfDECk6bg8o0jAgybIp2AKE4gCQlBryNh6ha3vd6QtgwJma4WtT?=
 =?us-ascii?Q?pdFwfOqH1f2Oyfuj/j5NLPkyVNdDENt9+xGTiKj4HzfrnrGsuWyAluhMJUUx?=
 =?us-ascii?Q?56D7ZLHQpDlmbQtbQ1aKO5qfoWlzwgGFnFBiQiPwlZAIkKaPpQq5wJaQuMMU?=
 =?us-ascii?Q?D3X6hnbusZmVfbs3aP2o5eJfj1jhJDluQy3SztVzusLQlcJg2LYeqQJNKzWb?=
 =?us-ascii?Q?VvNIoy3qYyr3l5nmpHgJ9byC6SJD19H1DW9gsO0Xv2L9EGW4GgheXg6UQlhW?=
 =?us-ascii?Q?glMcxP3825Tlzif3lUy/tNh2XEspsJmY8f+2tafA6PzS/plOSsl6kT1/RuQk?=
 =?us-ascii?Q?3yXUejCNnOvjHgJTsYzaJwR17DXcCehRRFblFmh/3bj6gjnXaOeWGJ8uFr1D?=
 =?us-ascii?Q?Olg2wZss+6XvA/G5241P6TJm8dqCDPau3MXYrFxPrZ/blkUfq86icAlRsDNp?=
 =?us-ascii?Q?uAUlYMWm/MFpomcdfWymSXwPqgTzpVdlWlll7keoqRcdl01k+Tmy+sT1dGoA?=
 =?us-ascii?Q?f6RGDReTVw3aUqqZcTa+FccR0rMGUTKS4A718HQTJlXIBpmXRCIyWbtmoNOv?=
 =?us-ascii?Q?ncSDU7ivpS1Eh0VygsSgnXUKyMoIRVP+IJcBAHdLy5JtEl69VFC7/nP1MnyW?=
 =?us-ascii?Q?xzdLMuwS2JLYM0R3vtO02z2S9mxwOpu7jbayFBS7YrNc9+AtGaqzwUWGaTq2?=
 =?us-ascii?Q?gIqD0M1fP6PVfqYucPh+6PHE7qcqM4x9u4CFuC83/qyoV1lt3IvXEpdXbdNm?=
 =?us-ascii?Q?7Won9Usfo+SYhpICeF8LurtXDW0hGkYirHEl9ArJ6x+/qltPxJt37z8JFDYL?=
 =?us-ascii?Q?ydDhROnO3eTqVuBAndN3P60/qJYMxQFSXUbV5LgUUA0YXGsJA/gPfnGG91qa?=
 =?us-ascii?Q?4uMgRO5z1/0zSNPT8sh/I4mVX3XkBYHNR1rWwe2T+TaUOzZ5L99I+WCRPK6Z?=
 =?us-ascii?Q?iswl/xEyb4ZBgKYrsJsARzbixphWEoffCkI4ULBLJnuvQigOHuGQE6CNOj0f?=
 =?us-ascii?Q?VRRtm2ERx3Y+N2u8Cxr9S+8=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b51d5b2-d147-4eb1-6a24-08da0276ce23
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 09:17:31.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jGDRbZRjgLE9Gi9TyxwCAgmCINN2rcEope4oIOFfuy2VmbXRRXm3NxpSCYrP7qw5VeeB0XsHCxV3+i7ezAtfsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0401MB3550
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
Cc: qwen@analogixsemi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, mliu@analogixsemi.com, hsinyi@chromium.org,
 bliang@analogixsemi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The property length which returns from "of_get_property", divided by
sizeof(int) to get the total property counts.

Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index c6a9a02ed762..87081d5b408d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1594,6 +1594,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 
 	if (of_get_property(dev->of_node,
 			    "analogix,lane0-swing", &num_regs)) {
+		num_regs /= sizeof(int);
 		if (num_regs > DP_TX_SWING_REG_CNT)
 			num_regs = DP_TX_SWING_REG_CNT;
 
@@ -1604,6 +1605,7 @@ static int anx7625_get_swing_setting(struct device *dev,
 
 	if (of_get_property(dev->of_node,
 			    "analogix,lane1-swing", &num_regs)) {
+		num_regs /= sizeof(int);
 		if (num_regs > DP_TX_SWING_REG_CNT)
 			num_regs = DP_TX_SWING_REG_CNT;
 
-- 
2.25.1

