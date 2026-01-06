Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB6CCF810A
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB7E610E4F1;
	Tue,  6 Jan 2026 11:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="FiOq/CXl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D7910E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:55 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606B5OAY4053043; Tue, 6 Jan 2026 12:34:36 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bfdj5fes8-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:35 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FJUYMfrfLO3L6CMMNtMT/NcUMOtmI7uD4oWc/TscD936tENZdTj/YPQ9G8Z24XP3B/HHdCYV37QmfhrfQuAfRGUQhEU+XjuCephtF3DEKz0F0tgyIrP8ghFdp6mRRUpJsLyBS9trYVyYTGhJ9woQxeZLcFgGed+lql7r5B5NbdlqeRZkogRPfFeuExHYY9yakT9dxOEhovoF31zwiYr5Em22jfZoYyPbVEM9ekX4hjxFnzXEfkZlw7rlhxp8WPdDqikjfGuGbUDF17D9n5snHbGquWfrFESeUwW1b6Pn9vEBCNlxC3mhBVlekWEpJFufICBMmmxf+Ue76mLzPfYt/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SbyqUIQ04QRm997BwAzzZmv5EC5OG13hHeWiE3/Ldo0=;
 b=faJI4uIQN49+rY1CRCvjmJHw/1ZdcoXvFhcR/q/xeTafRcf1cUQzMYKkJUpoXQJ6IB3G/yEgQ4mmqhySzEILJt+mbkcEEOyDq3tPl468i6yazqM4o30JeS65RXg59jFy/Zltb4VEc1AEIbi5efeuCAJLx8kwaTVifz5sZwlqPzBXN9dw8+LjOZwXXeyX+zVa+8P9PvqohID/XLlJUxHqyWgyPe7be/Tm/gOrl2Qt/H3Uu7Qvf376L69Gk0dZUmiIWihsPuH71yAxULhb6RXYLJLgt8SkWUb3Azy+czoxCDT/kQ/wDWCgsPx5+A9bsFAQMVho4N5SGQcgt+9vk/fxuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SbyqUIQ04QRm997BwAzzZmv5EC5OG13hHeWiE3/Ldo0=;
 b=FiOq/CXl6NDC8hH+F1YI3/s0P5aLwEdUIoncRDPp+cLk9ixTcHst/qhU3GAqTWFl7qDabu11b6JJ+sjt/NBg2hbBABRaOagVYI3xe0F2QnAjMTDerwNvXwEMKaoUC0nQ7ocb7o+cS7yHoxx1udnraFPzlZyLibxXmtBzxyCGC2mJdLm2HW9IkDE8eirZE3gaZ4sxObkt5oABUc/JXdhL6T/A/em/MWXYLpxpvFmX99EkDxpyUKlIlpswMtQaDjtRo35g3O4SG2gl877HNdOacdQeQkFyc43PrNb5K1PExKqdtijlV49UyWkDgsRqbVu8vAotWR36l/7pNek0PgqmPA==
Received: from DU2PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:10:232::19)
 by PA1PR10MB9002.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:445::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:32 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::6a) by DU2PR04CA0074.outlook.office365.com
 (2603:10a6:10:232::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 11:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:45 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:31 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:29 +0100
Subject: [PATCH v2 01/12] media: stm32: dcmi: Switch from __maybe_unused to
 pm_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-1-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|PA1PR10MB9002:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f9ac0c-ffc3-4bd7-407b-08de4d178f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkxTWUtrMmhiWnpyWVZGb2wyb2lMOFZxcE1Ja01VOS9XQ0ExeU1YdExOWC9P?=
 =?utf-8?B?Qk1PSFpSWHZVcVpTcHFqVlRtanpwdzlSYWNmL3A2cmxxYXpUdkhtV1QxcW1k?=
 =?utf-8?B?N1ZoY3Q1b2ttYUxiWEdaRWRuSkVaSGtCMDdTZjFWMk4zYU53M1NyK3FuTDVH?=
 =?utf-8?B?OGpxajRGK05TeWwyRE5NRVVST0Irc0FBbXBOSDN5YlBEdXE5SkdOclpnaG5a?=
 =?utf-8?B?VndBVG5HZmYxNkJCNFdLYTA4OEUwbzZGbWtSUVJIVDFIaklXQ2wvakFKVW1J?=
 =?utf-8?B?bUpkVkw5OWR5ZkRjTGsxOG9GYWtmdkRRZUpMY3N4SEhNZzVYUU9WOC9ReFlL?=
 =?utf-8?B?QlpxYThEZGZrTlVkRVRKZ1NlMWpjRm56VzdQZUR5bXV6UU9USERNaVhzQk5L?=
 =?utf-8?B?YkhlNHdNdVdOQVFPWE1VNk9McU5XTkRkRURUcDArWjY2anpWOTNWSk52ZGZu?=
 =?utf-8?B?VWJoQXNwNXZST0RHMDFHRmhDdkRvRGJIb1pPQlYwUEJ5QWdpdXJLZ1BwUWl1?=
 =?utf-8?B?cFJJT054Z0U1eXBSa2hucHhIakFPMzZjUWltSXNJN2NmRGF4enFMSW1oOXJl?=
 =?utf-8?B?MWhEbExWL1IreFRkN2c3c21kZk5icVF0UlM2Qk5PM0c3SUVRWUt6K01GVk9x?=
 =?utf-8?B?MFI4Q0Ntb0IxUFV3Tk9oUmtYQWdNd3J1U3hlWitrUE42SWhGSVBiVnhXbVJw?=
 =?utf-8?B?dU5Yc1ZnN3JGbnRya01ZM3AxQVFhVFZ5dlM1WGltNjNjM1FFVk5PazRCL29v?=
 =?utf-8?B?cUJmN3JQRDE1bHBDdG9YaEJBY2p5L1dIaDZqSXpBc3RlbzEzRy9yNDlRcnFZ?=
 =?utf-8?B?ZmpvTGZkQmlFVDdiSTVXUllob1U5Y09qWWdXNWl1VENUd1RxNXdCRFg1czZJ?=
 =?utf-8?B?ZVRleUUrcjY1N0VydVQ5cSs1Q2J6RW1uaDlQeHEwWHBsMUVEdTZuYjZROVhF?=
 =?utf-8?B?cHhlWWRQQTdEeUhISTQxTmxjQkl3L3ovZWlkNHM1U1BmZHg4d1R5Q3ptWUlS?=
 =?utf-8?B?ZktubGp5SUZaaWprSFUwbkwyWWtzb3hNVmE2aXhndWVvVXVjTFQwaHRCU25o?=
 =?utf-8?B?ZkZUNXZodDZPODhiZ25UaVlSdjViY21IVjNKalBjamh3RXc1dWx6R254d2x2?=
 =?utf-8?B?QUdZM2JiemNERXU1WUNFNy9GWDlaeVFidk13QzlGVHZRNG5rbzFPK2RnUEZH?=
 =?utf-8?B?d2Zna0M2d2RQbzN4WlBNUXdZdjBycGZlMDhqS2U5NTN4Z0tIVlVTM1JXbDJi?=
 =?utf-8?B?NVpoY29tdE1HRTF5ODRuN3kxZ0tJQ0t3Q09XMUtQWFJObHI0bStCYkdkQWtP?=
 =?utf-8?B?QnJJdWdiV09pK0M2aHZSTzlibFhXQ2pSRkRDVlhkSlhtemdBZi94QmozbmxK?=
 =?utf-8?B?S0ZWM3c3RExUK0ZwMUFqdUpERjNySUlVbW51b3VXVlZQYTdEc2xhY2RhcXJ6?=
 =?utf-8?B?cXJyNTlBbGJRYkRqdDJiYS9WTnpHc21vdzlpY3ZrNUh5elVyaDEvWWJ0NmVD?=
 =?utf-8?B?bC8vZk4wd0RHbjIzcW9XbHVtVk4yT1dVd0haSjdROE9vbC9FVllqbXpOb3JV?=
 =?utf-8?B?VXZ4TktObU5VWGNQc1NCemx4bkpRS1hTTm90ZWlEc1VlVFdZWXR2TlBwV2Jl?=
 =?utf-8?B?MXIrcGJRZDBvTmJQZHI0VnRLVEpnVEM3dms2enk5QjF0R2RpemV2NExGSUg5?=
 =?utf-8?B?UjZlWFhhQXBPb3ZOSGVsOHZUbjl5RU0zekdVMllrdlhtVkdPbElsaUwvMjdh?=
 =?utf-8?B?aWt6MjBZVjFOVklEYXFtRmJhOU9oUi9paWFtb25HQ1ptZTh4UThpVFQzelg0?=
 =?utf-8?B?ZDRteldHb1F4WS9CRWJJcVZXUEJpSVRkdGMvL0dFWWVxWWN4V2RjbDVBbFBu?=
 =?utf-8?B?RWI3ekhuNldQeUgxVGhvL09ndCtwYjJsTVlMZllNMVpNbE1CdEQxc1U0dGJo?=
 =?utf-8?B?am5IdDRuN2xnZ2FobnJOSWRBWFZ4T25HKzlnVnFFYzZ4ajBxQlppUUpOUlRD?=
 =?utf-8?B?QVIyeVVlR2VkSDdJUFdhblAyeHFqNXY0S3Z3cjhoRUM3dlZ6d0NzYk5GZEVl?=
 =?utf-8?B?ZldZWnFJeDdKajAvdGJxNitUS2o5L0JTT2puYXJES1Z2ZVFId05MZmNZQys0?=
 =?utf-8?Q?JOuc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:31.9560 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f9ac0c-ffc3-4bd7-407b-08de4d178f85
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9002
X-Proofpoint-ORIG-GUID: 2jrYVPEwROQ0DaeFkdRrj_xoX-QcK6Md
X-Proofpoint-GUID: 2jrYVPEwROQ0DaeFkdRrj_xoX-QcK6Md
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfXz8X8Yzgq9cEL
 B3VKbdRSrDZH65w1UODJ/ZS37RJ12QAEDT6XbjE9QmDc4i6oTl16wBTEWTe4XQVNztcPjXUzwdy
 wd+am9ysByPlX1Fa0BEOV71uLODrfY2D+4Af7vNkYqjXlbzU9iFfNHJ4LJ8R2R58F4qPGYzsqob
 KpWlflXU4VZ7BVt89cHgLRHusTjUPBoY+cspNSmB1G2uG7oofBbQhhZdYqVEUsOQmE98tusTWXG
 ve9cnrp14Thr5AC/y83w5+TgCECp3mfcXfl1saMcETumcfkdWozxMX9h1/p78SDE9OKpQ8zVaM0
 BwXZ8boXSgEST/DiScuj/EDLxATw1mBovNAH3dxYLsSC7v/zSjaR6aMhwvk2uYPe8hdbCO/D4pc
 fIJeDGg9qPqTodAZ/IBu6AROKw45nawSz1OOi+ES+zIYFanHvOLpFSKsmc+uASgDrQ2Sen4cEqp
 M+f1YSbetpMQ1rrS7xA==
X-Authority-Analysis: v=2.4 cv=SMBPlevH c=1 sm=1 tr=0 ts=695cf34b cx=c_pps
 a=FKYJD1RPl6GH9gGrjlrj5A==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=iCF26HOSFX6zfGY0GUYA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less heavier for builds
than the use of __maybe_unused attributes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
Changes in v2:
  - use pm_ptr instead of pm_sleep_ptr use
    SYSTEM_SLEEP_PM_OPS / RUNTIME_PM_OPS macros
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b769..619b0d981211 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -2092,7 +2092,7 @@ static void dcmi_remove(struct platform_device *pdev)
 	dma_release_channel(dcmi->dma_chan);
 }
 
-static __maybe_unused int dcmi_runtime_suspend(struct device *dev)
+static int dcmi_runtime_suspend(struct device *dev)
 {
 	struct stm32_dcmi *dcmi = dev_get_drvdata(dev);
 
@@ -2101,7 +2101,7 @@ static __maybe_unused int dcmi_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int dcmi_runtime_resume(struct device *dev)
+static int dcmi_runtime_resume(struct device *dev)
 {
 	struct stm32_dcmi *dcmi = dev_get_drvdata(dev);
 	int ret;
@@ -2113,7 +2113,7 @@ static __maybe_unused int dcmi_runtime_resume(struct device *dev)
 	return ret;
 }
 
-static __maybe_unused int dcmi_suspend(struct device *dev)
+static int dcmi_suspend(struct device *dev)
 {
 	/* disable clock */
 	pm_runtime_force_suspend(dev);
@@ -2124,7 +2124,7 @@ static __maybe_unused int dcmi_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int dcmi_resume(struct device *dev)
+static int dcmi_resume(struct device *dev)
 {
 	/* restore pinctl default state */
 	pinctrl_pm_select_default_state(dev);
@@ -2136,9 +2136,8 @@ static __maybe_unused int dcmi_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops dcmi_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(dcmi_suspend, dcmi_resume)
-	SET_RUNTIME_PM_OPS(dcmi_runtime_suspend,
-			   dcmi_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(dcmi_suspend, dcmi_resume)
+	RUNTIME_PM_OPS(dcmi_runtime_suspend, dcmi_runtime_resume, NULL)
 };
 
 static struct platform_driver stm32_dcmi_driver = {
@@ -2147,7 +2146,7 @@ static struct platform_driver stm32_dcmi_driver = {
 	.driver		= {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(stm32_dcmi_of_match),
-		.pm = &dcmi_pm_ops,
+		.pm = pm_ptr(&dcmi_pm_ops),
 	},
 };
 

-- 
2.34.1

