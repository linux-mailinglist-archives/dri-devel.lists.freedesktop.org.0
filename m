Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B998BCF80FA
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2321D10E3B5;
	Tue,  6 Jan 2026 11:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="ZZ7unsIf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3612B10E101
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:53 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BW9Sd327667; Tue, 6 Jan 2026 12:34:44 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013017.outbound.protection.outlook.com
 [40.107.162.17])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bfexpq4yh-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:44 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvKd8YggCPsA8AxiT95LsxVAiBYvKQrzG/wbE0DIJ+AibyYLEO7OHp3PmcXx2HL0DrIGCzB9M15g8sJezNBb9PUgDnNq2bJDHpU3v7IoH94JKIeQJ5dBxhJjfIzKB34H4YUDt5DAOdhFBtziQQza3r5g/cg2KPAiO8kjB4cRetMALq3EkEPZsEjLOVYspBEQpbHHpE7YUOtuBq8We0W/ySZNW0sXWHST6iZD7tj0Yb08IPzjTVM5QzawuuzjlrifoEXFzZ/tmOF5lSfcff0ko11YYlp5OamOapBZ+0YPknumyN5N9Buk2817G0qvGU2NRaYMV2AEW2Zl7WzaJLO+QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ntl8h/8bWszmC95ym/6/+u5tx0J+S3z3nBACqGFnURU=;
 b=s93Wa2wEkjjHmCC4qy7000PjJCVupK8Qc0JQQ9V2tcXiMUBzchmazqt1l6obdaizOMyVOg+qG2BMktfrVWLcKBC2OS+r0aNH+cWUtng9nJk5deFGoe7bdql9tS6GNetYqWcbCqbYo6Anzd7Vei9MbTOnHiKaYhhJLtIK6YQk4R2Pipkh/YXGelYPO4Zdx++Cy8FtCshCiiV+J/gc8oQq2J/tyTrkIGpnG/n8XlqYPmuNnnzcVWxqLJ6fquyabiLmX6qnuWA/n5/FCM2xalmks0qnFDE57L7z0TMyExeBDSMNnFppLzAMvDukGf62wodpBo4Lj8HssvNJR2s/a7AiDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntl8h/8bWszmC95ym/6/+u5tx0J+S3z3nBACqGFnURU=;
 b=ZZ7unsIfCveC/UnLEkCDn3drtEQIv1zw6qS5lslM08AYiwMviIuNpPPisgXJjrCTd3Kl/UWyYxG5MwRI430BQ4cM0ITW2z04kTpoSg19fQOTpNXeqAI0kPZv9l3GzdeYILBqZYitde/MrQKWj+TDdKhzIjU0kI3dCWA63X77muiFtoUa2StcZGBY+6axsww3VZxdkSyvlHH6a1/HSQwvVpaKhVqUCdUDx8h5cbrvKtovc+GgWkv70KR44x/bCS6T9bVYMyPh7xYvDeZ8dFIS7uXs+/bNDAocXSeqTyhLxsEy8qK2MmlfvDtGjGvf/SGh2YBfwDOnCCg29KlVqcz9jQ==
Received: from DB8PR06CA0066.eurprd06.prod.outlook.com (2603:10a6:10:120::40)
 by PAWPR10MB7343.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2ee::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:39 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::43) by DB8PR06CA0066.outlook.office365.com
 (2603:10a6:10:120::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 11:34:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:51 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:37 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:40 +0100
Subject: [PATCH v2 12/12] ARM: dts: stm32: enable DCMI DMA-MDMA chaining on
 stm32mp157c-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-12-70688bccd80a@foss.st.com>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
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
X-Originating-IP: [10.130.74.193]
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|PAWPR10MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 929f1ddf-4e30-4f8e-b92a-08de4d17939c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2FaSnU0eW0wUzJsalBVb3FrQU9pd0pLUW16OVRmYVpSNVNZSm9wMGhTVXJr?=
 =?utf-8?B?TU9hbUJmQ1N6WG5CUHduT0RxTmQ4SE9uSFBnU3hYRUtpdVNNT0NmY3VrWEtF?=
 =?utf-8?B?ZmNIaWt3b2U0emlOUktKM09qSFh1ZmgzMTg0N2FCc0ZPZWVmaDk0a3pjSDhD?=
 =?utf-8?B?ekNDaUp3M2xGeHpxTzlmWndnQjJJcldZVUpkR2hzRUpCN1dmekdmMWN1bmsw?=
 =?utf-8?B?eHBDQlFtUENFVDAyRE5vc0piM3FnMDlVR2NKRjNyK3kvc1UvcHVvNXd0MlRR?=
 =?utf-8?B?UDRMWjlEMnNhVTJzNG85cDY0eFRoSU5qeWsyTFBDQjNxSmlXSG0ySk0vYjM5?=
 =?utf-8?B?enRxYk9WVDFreVlHb09RSTZ0bzA0YTRQNkZhVmdyMDJmMVROT3d0NU9VaUNR?=
 =?utf-8?B?NTA0TDAyV2RXeWJvNzJQbVZmYlFYb0szYlFiK0M0a2l0S3MxNUNyNkZJcE9m?=
 =?utf-8?B?V1hxbHMyZzJ0cHNFa1F1SS9DWlRkK3diT3VMYVI1WW1xY2gxd3FDZkxpU1hs?=
 =?utf-8?B?SE5ZUk9LeSt4bkFNSFRWTkZHeC84NTZOYTlqcUN6UHBGYVR2S00rWHhYS3h5?=
 =?utf-8?B?VE11RE1HUld2ZnhoZGg3bHhycTJ1eFJEajdPVDlVeGkyK1BRNHZMM2V2ZWgx?=
 =?utf-8?B?QW5NdDR6VVVaSFhpRTAxSDdHQmtTZi9xQURCc213MGlTbXpoaEN2REpjL2th?=
 =?utf-8?B?WnlTVldTUVFGNEFpRFplV015OE9kajU4K1BwenFHTGhPT3BZQVh4VFhsWE80?=
 =?utf-8?B?UGYyNzlHa0pDdUQ4TmN6WTB6UFVmWEdpNHV6WU1nWEhDNVF0QmFwZkV3YllU?=
 =?utf-8?B?Z0hOQUpEbmpIV3dsR21iZU04STgyMk1jRnFDdTVqUEZqRjdnUmdoZHJucWx0?=
 =?utf-8?B?MnpsWWFxTTNoUXdaR2JIU3BoV0NHZkxRdVFQdDZzSU9Vbld2cXYzUnhQdmdo?=
 =?utf-8?B?aWg2dkQxcTFJMmkxU01jOWFHUjA4UUdGbDBieFlKVXh5RHBZam5nWXg2allI?=
 =?utf-8?B?MnNKeklIUHVxWnorUm1xRVpFNmV0K2dteVo0aWhTYnpNc2ZpZ0MrUlczVnYr?=
 =?utf-8?B?cCtveHZOOGk1ZUQ2Sms2WjlVaWQ0eVNoM3JYSUhWN2l1UnNwQTI0NXl0cGlE?=
 =?utf-8?B?N2hRa0RqdEZ4UWhvU3FsT2dSSzJaV0Y2UFdGTVJxL2swd2NhZE9LaHU3dVU5?=
 =?utf-8?B?ODVsK0lsNmRvWlNoT3lCcFZ4NXovWnRRZ2R6MFJ0eFFQZllaQkVaWkRiUXZ6?=
 =?utf-8?B?NWJ2Mm4vRHNXV1BZMkl2TGR6aGFGRGhGMEVSYXlQYTBJYk1mTEs2Zk1nSmNI?=
 =?utf-8?B?S2RHazVoU2pJZ2RmdWsrZmgvRnl4dS9Ucml3aDNHZElUSmpNYVNmakJKSUJD?=
 =?utf-8?B?YkNvVmZ6Tm8wYXdmdnQxS1R0RkpIVXNLTDVLWHRRa3lKaDdoeDJUbGlNdlBz?=
 =?utf-8?B?aTM5YW1uSGRnNVdnRXRGbkFsakJybW5TcnBEUExrc2tpZGFyYlQxc3UzR1lB?=
 =?utf-8?B?czN1QmpJQUszaDVaVmszRm5uN3l0THFBbjc4V0I3cXZNR3RCUXlydmtsWVZI?=
 =?utf-8?B?OG5GUkhobHByWm85RkFPSUkxcmxNMlk1VWREbDRjdGRiOWRNQU5lVFhmelNB?=
 =?utf-8?B?cXJrb3ptSG1QaitZaDRmN1JxUmROTEtxL01xYVE3VkswQjE5MmpXMDlRNUNF?=
 =?utf-8?B?M1Ewd0NBTTNxdUlEOHg4SlNIZEZuSFYrQWNtczFMczN5NE4yNGFFaWs5dnFQ?=
 =?utf-8?B?SDF5djRsQ0xoRnk1L29KSmxtWElPVjJhT0N3eFRoWXRaUXFXMXk2aWtiQmtD?=
 =?utf-8?B?STdLU3h0YzRYTVlob1Bwek0xWlhWZldSVmUzVzc5UE1TS0E1dTFoZXlwMVU0?=
 =?utf-8?B?L0pHS3JKbk0vcnVlTTF4L3BIRjRmclZvZkd2TlFWNm5Ib3J0d0tCMEhZcUwz?=
 =?utf-8?B?c0pWaklyUjFCSGd1UjZhRHF2R1hwWmR1TUtpdGQwSGJUV09oVnNKQVlVcVg2?=
 =?utf-8?B?bVB0VUNYTC9rNFZhQVZyamFDaGx3cy90cjM0enBHVFlLQ2t4L01TYmJwNElz?=
 =?utf-8?B?dkVNQ0ZBdUEvVm1BMUZVZVZxdUtMcjRiRWJNU1FaSUUwaFZwNTVLVjg4RGJw?=
 =?utf-8?Q?KVc4=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:38.8171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 929f1ddf-4e30-4f8e-b92a-08de4d17939c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7343
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX8CDLzJAYLffn
 hBFmN8WE3cQyfQxaPpY/kdcC7u15hsUj4fauVC4CkjyGS3kFW7K+kfPyEPfz5CHrzNzG9Q4+YSK
 vPAii8ELaPMxCWPUuOV0OEV9GV6cSaLNlmhOO6B6C3Db4VA/2XxFXtIgSpQRaT/es017VY1t8cU
 DYX+U9qcezPxwBON3zTexdvwH3Vav+PrAgRecBdAeKWb6LTcYGuoe36aH/Ip/7P7QWYqXGDTIqN
 OAZ0bmHYNzMgHuEegLIGvo1N4bJYt3MIx3pEgcyYOSt2NKMhrf7xTUrakOVnaEjtCjr+8C/NX0b
 LRWS5jVY+ruHmTV99KZh0tHwQq71U8I9sz1J76RjtRZAKkq+SvtE9H1y4yZttn+V78CU4qrz+S5
 sPh0GtToX/ctB/L0hGnLrW3D+ztIEv3uQukDXde9qYUXYu+i+zUpuvaYR7g6jLG0PkdnhKf1V0A
 jqAnUEOBQgETKyC5HdQ==
X-Proofpoint-GUID: i8DR69EDPM35k91mQxs1jEaD8Ctc8OUU
X-Proofpoint-ORIG-GUID: i8DR69EDPM35k91mQxs1jEaD8Ctc8OUU
X-Authority-Analysis: v=2.4 cv=UrFu9uwB c=1 sm=1 tr=0 ts=695cf354 cx=c_pps
 a=93V61PBNtaXlaj2+evPV+Q==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=dGxqowV4S9dSpVGn0mIA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060099
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

Enable the DMA-MDMA chaining for the dcmi (camera capture)
in order to be able to achieve higher resolution.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..68b536b0c6ee 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -86,6 +86,14 @@ &dcmi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmi_pins_a>;
 	pinctrl-1 = <&dcmi_sleep_pins_a>;
+	/*
+	 * Enable DMA-MDMA chaining by adding a SRAM pool and
+	 * a MDMA channel
+	 */
+	sram = <&dcmi_pool>;
+
+	dmas = <&dmamux1 75 0x400 0x01>, <&mdma1 0 0x3 0x1200000a 0 0>;
+	dma-names = "tx", "mdma_tx";
 
 	port {
 		dcmi_0: endpoint {
@@ -301,6 +309,13 @@ &spi1 {
 	status = "disabled";
 };
 
+&sram4 {
+	dcmi_pool: dcmi-sram@0 {
+		reg = <0x0 0x8000>;
+		pool;
+	};
+};
+
 &timers2 {
 	/* spare dmas for other usage (un-delete to enable pwm capture) */
 	/delete-property/dmas;

-- 
2.34.1

