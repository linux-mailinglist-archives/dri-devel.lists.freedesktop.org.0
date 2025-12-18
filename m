Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E743CCD61D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D7310EB34;
	Thu, 18 Dec 2025 19:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="KND7E6I8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669CE10EB34
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:26:07 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIZYiE2966301; Thu, 18 Dec 2025 19:44:58 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011057.outbound.protection.outlook.com [52.101.65.57])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4780bqnt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:44:58 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PMIOpNbK8D/o/eV+wv/vHyl5Z+GdKigRnnoJopE05Vb4bMYs14MCEkM9k+URFhRbSnNzUcXvdrrV62kRyiXIF2tnW5m2jrJzH82VcydRWp8xN56qHDp8LidQo0Vz5FERmefLMjg1cGi6lgP18KMTHttH+11OJWt4aB7AuDkx/tJSULUGi1n1HNGgZQih8T/l3MBKEgOlxfYVbmeKA+xTDnSVAtO9D/dRGJEHeg+KqSWaTbUIWZWeYroQJ0B+CQANFRM4FUQDrbgAaQiQ6w+Dh7f6BXI4Z54eTnnMdSkYYIW2Xhg1jBSQCu/jZV6FHP2MIry59z21DxZHsjMHtWnhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQw5ZGOJqjrQXXLvWW5CVQe58fFuafpe+3De5k5+bbg=;
 b=KufIMoL/yt8yJmd3GiRjrwm28pxF8bW8nXESKwWDxmGgPFOa44KXdKihq0RDltfece14PHKKr8XrCVxIXPtnUYeNXOPzkYQtTgrrygN0NdZ8ltvSbCKQBinU2jEiCfLO31cGVAmKUV4hF/qI9ei/5+Vt5kJF6ZRJ4x2CO8jKiMYGEVjSrqq06nP3tIY+245GGoTDqA11xydRW1UKwB2k+XRXizhjN0oARCZcgbLHurjO6W3TFoywGv9qsry8jgVwpWVza7+Za/iAvhY9J5UAmUrh8Fay0DcXG6b6/tLHzEVIb5YQZl2YJxp+D/GTXi3xbpIpKT1/6uR5lwZO10YxuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQw5ZGOJqjrQXXLvWW5CVQe58fFuafpe+3De5k5+bbg=;
 b=KND7E6I85+3+wi2BVK4L9U3v56fItNr4vtjFCexiL02AMuLAmfaipTaxRS4yNV54tdg65ZWctu2fe7rU+v3N3VHhGfC3WJsD1dkEXF7v6z2+zb4NRn2masmPBbS8HKNspnuptZvRQ7MGdSXWVUQiCPo2LnyXsVXCxRH8agQTYUmKhy1m8apcQwqAlDoo0Lja8CocuThUaZ1zaFe++h0MN0pjc9jWQnBccWVkUXbg1rE44fDctbewmaighhEMxKj8+LQe0XpHMoVfFnAYBXtLYWfHF6BRetWRDVprdNyhtRe1dLbEOSdXSR/oEJ6YwARxcwA5npdSjg5+J7shHpSstg==
Received: from AS8PR04CA0119.eurprd04.prod.outlook.com (2603:10a6:20b:31e::34)
 by AM8PR10MB4067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:44:55 +0000
Received: from AMS0EPF00000193.eurprd05.prod.outlook.com
 (2603:10a6:20b:31e:cafe::4) by AS8PR04CA0119.outlook.office365.com
 (2603:10a6:20b:31e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Thu,
 18 Dec 2025 18:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000193.mail.protection.outlook.com (10.167.16.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:40 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:54 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:44 +0100
Subject: [PATCH 04/12] media: stm32: dcmi: stop the dma transfer on overrun
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-4-39948ca6cbf6@foss.st.com>
References: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
In-Reply-To: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-Originating-IP: [10.252.25.7]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF00000193:EE_|AM8PR10MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c8a5b7a-ad76-42f6-7929-08de3e65893d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejUzNWxCOWRnNDdUc3pJUlBqdWRCU2prbnVmblVMT1RaNGM1ZEgrRFFGNWVH?=
 =?utf-8?B?UTBzNDl4eWlVVjY5cE9Xd0U4ZTMyVEtyaURiZXNSd0dxMU5QaGN0SStkZlIy?=
 =?utf-8?B?cnZQdDdyZEgvMnpDZDkwN2FDNUI1dkZLU0xaTGtVVUhycDlTRlZGV2xTUHJY?=
 =?utf-8?B?RTY3NzIwWk80WXpMeHZQbzEzWXhrOWptcUcyN2dyUVpJbGtSVDJQU3QvZytM?=
 =?utf-8?B?bTVrY0xUYmFBVEtReGFwMFplV2NBbnpkRkgwSTNOaVRQWGZuZFpzcFg4Q29X?=
 =?utf-8?B?L2V3U0UvaCtTVTZpNmtEQ2N0NXBQdFVxSmptbnZWSFA0WFh1bHp3OURmN3l2?=
 =?utf-8?B?VzNnSG5PaUJJSnpoSlZyUzdqVnRabEo4NmloWEZNNkQra2xnd0ljbDRaN2xM?=
 =?utf-8?B?QUVHdGVVN0hnaC96L1ZTekVNZnF2b3k0U3kxVHF1ZFVNZE5XREZlQThJbVBM?=
 =?utf-8?B?djFJeVh4V0hnZVhyR2lnSmtreFplNkhKeVB5YUZ3d3FyVFpDaExYNzMzdDJ1?=
 =?utf-8?B?c2RoeHc4UUdxZWkzSTRNeXZWNFgyekZSeE9ucS9wb0h3T2h4WUxSUEdFbXpJ?=
 =?utf-8?B?d1lvd1VSWk5YTHB6S0dxNDNSU3ZjZW44VFY0c3A2MDMzdEZ4azMrYnd4UURY?=
 =?utf-8?B?b01uZzBHcm14RHZOSWk3Nk9EdGhFSTBJbUd1VDNkc0RSMmEra1BVTUxZdVI1?=
 =?utf-8?B?VEdaT3R4dlhXL2I5T0NMV1g3VWttYUhlRFJtajBhZXY4WUl1V3R5bWh0NXhI?=
 =?utf-8?B?N244ZmlZOE1vaGNpVFpJV3B5MnZjckV5Kzg1K3FjV1MyVlIrY0pybHdpbXMr?=
 =?utf-8?B?QTRNcCt0S1owYTlTUUtPZVl1dWNUMUFCb1J0R21RYVZyUDlzL2xhVjFVVUVp?=
 =?utf-8?B?eGhxOHhySitlcmJPSGI3Y2VuSzVLaWxnNkw3T1hRVzVrS3R4MGU0UmRWQ2tr?=
 =?utf-8?B?dHpyckYrV3JFZUZHNHRsSEpPYXgwcDQ4bjJyV0ZLejlMaGRuWkR0S3MvYWp0?=
 =?utf-8?B?bG9Hd2ZXT2tQTVlBQUFmTm5IMjdkWUF5MTVPQnF1V2dpVXNiVXhheEZqNmNV?=
 =?utf-8?B?cEpXOHpYazFRMlVoRnVDdlk1dENnQXYyOVQ3NWQwSVV2bG5sMXprU0Z1NVN3?=
 =?utf-8?B?eUNXaU9KZWZYL2hxRzJpa20xdWpRNk5tQ21SSXJOVXI1Z3dZbkx4b2s5MnJi?=
 =?utf-8?B?ZmkxZEZBdlduRlBqL3BkdHFUR3dOdFpYekt5eXEzemhKb3I4OVFXMllnaVNU?=
 =?utf-8?B?Y2NSMXJpeGs2dWNqQjFFNFA2cHd1WGQ0Q1A3L2YxbTZ3ZnRVdnhyUDkxQTZx?=
 =?utf-8?B?djdsSGVWSU1TNTducGs0bmFTbGFsOTAxOGJMOE93VHNHZVF6eGgzeVdMcThq?=
 =?utf-8?B?NFlEZ3NPQ2MzZlZ2Y0xGbFRGUFRaMHNMamZXODRyM1BFY1hBY1VxOE9BMCtm?=
 =?utf-8?B?aCtFNU0rV2ZiaUdVMFB3MVVEVG9lWkZvK1VTUDNSWmU3a0ZQbkFNdjlLb2JS?=
 =?utf-8?B?NVgzblFEbncxTEQyZUpZK3htQTlUeFdtNG1iNmJrN2NiY3VEaFZUamNkcnRw?=
 =?utf-8?B?SFZvUXVFYURhaFZVZzFiZm1oemRLQ2hOZEhRcUNEWlhXN1oraHVZNWU3N1g4?=
 =?utf-8?B?dmh2emwzL2lJWTVFS0RvRUc5aTNidHliSjMrbVE4NHdtQzJ0K2hMRGV0NWw1?=
 =?utf-8?B?ajNjWVhqVzM4bzE3VUs3NzJWMHMrYjBJSVI1NHBkeWhIZWZKZHloeHNGUFk0?=
 =?utf-8?B?NzhIbllua0hCMC9Jdk5ZK216enozRldmVG0vZjdBSWNmZGYvc3VzQ2w4am9E?=
 =?utf-8?B?UytUVTVaQWRtZm4vdGxtek5HdlkwRCtCRWRQeEw5aUE2VVI1bFg1N3ZZL2Nx?=
 =?utf-8?B?RUF2M0V0WndRRXJmT0NLMFFYditOSlBKVnoyem1BNWx1TU9wdy8vdkovSlFK?=
 =?utf-8?B?dFJlRmplc3hLNW9Rd3h4ZWNqY1lFeFhFZGtYMFRsajI1WUlPZlo5NjBBZlNR?=
 =?utf-8?B?TlJWQlVuMW9uOGxCZnlvMGNnbTBiTXMreGZ2OXBQNElhd29ZN3hDbTNlVkRt?=
 =?utf-8?B?KzlmLzVZdEg3N3lFSkxEcjZ4Q1d5c0FTdHdweGRlclZRck55NTJIM2RFZlRO?=
 =?utf-8?Q?8h3Y=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:54.7484 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c8a5b7a-ad76-42f6-7929-08de3e65893d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000193.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4067
X-Proofpoint-ORIG-GUID: 85Vz5fh-yAHkyhngLMKkNCt7GiX-_3Ja
X-Authority-Analysis: v=2.4 cv=PuqergM3 c=1 sm=1 tr=0 ts=69444baa cx=c_pps
 a=JS5Ex5ODQcMkTVofuE0IAw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=kBhef3lLaoA0UgAbMYMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 85Vz5fh-yAHkyhngLMKkNCt7GiX-_3Ja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX7u8pW34TKCWf
 HJ3aNyNOV7068Ir/6MXZQVT6LPIU8f4ghGMLyqc5z9/a6n0JTJ3q0rfcJhWpkuwSVsRRoV9jN1g
 +iMO6ngCzmALWVFnhAidGZHuVAj8xl+YBFF4pOVapl+jXTbaB4mkFYaryXSPFmQY262Qub4d8jg
 MqTVXBZdgxTyitBI7Ba8sN1RIRPUHMXj47yQ0JwXdOtMAtVvZ3PJJTfrCdSeRnDbx4ifJqWzvdd
 T1KQLez2mdOBeasycDbnXmZY364O86RQyBfvAfBkVReXcWmkkoV6vf9IHasyWds33vumRMYkbg3
 21yRl9p2YgxuvXVYbwxp9m+Oeq1W9VhP1lE9XnftgkMhqcEj7Nu7HVupR60bSbAjNcjyhW+x/Nc
 XYLhERPqYqof1MD0iSsZAFOchidPSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180155
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

Ensure to stop the dma transfer whenever receiving a overrun
to avoid having a buffer partially filled with a frame and
partially with the next frame.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index d8ef06bd7506..fa33acc34eab 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -402,9 +402,21 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 	spin_lock_irq(&dcmi->irqlock);
 
 	if (dcmi->misr & IT_OVR) {
+		/* Disable capture */
+		reg_clear(dcmi->regs, DCMI_CR, CR_CAPTURE);
+
 		dcmi->overrun_count++;
+
 		if (dcmi->overrun_count > OVERRUN_ERROR_THRESHOLD)
 			dcmi->errors_count++;
+
+		spin_unlock_irq(&dcmi->irqlock);
+		dmaengine_terminate_sync(dcmi->dma_chan);
+
+		if (dcmi_restart_capture(dcmi))
+			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
+
+		return IRQ_HANDLED;
 	}
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;

-- 
2.34.1

