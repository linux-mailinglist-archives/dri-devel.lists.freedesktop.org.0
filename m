Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E1DCF8133
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D433910E4DD;
	Tue,  6 Jan 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="UuBUwto6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC84810E4DD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:55 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606B9J5m246075; Tue, 6 Jan 2026 12:34:42 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011059.outbound.protection.outlook.com
 [40.107.130.59])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bgn0fa6vj-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCCcyh4UImNiMgrsRAoxCiJ5kH1rVMQS6DAlWxWAN1qkWEZgcCac9OIGvJnwCFZYAznjSanEedT1TENOrMhyCMJHl4ALbT29hm1lD8BvC+AOA/JeadGxspiP3FUHm3eMfyQLzqxCVXI/lHnR/5f6VQ6Uyg33pzUav8YgrjdmtKvmbZUyHtbHoLrjG3vfQJyWvzTs4PVN1/SB0Z43udkH8rXI8XVH859VkAhcp402Lw35TVk2NrA1sF0gV7Q4JOnqYrRt7N20zQrZbTa8z3W00Jtv/uu86+AlLbeluGismunDq4vkl1odCuWgzY8ar7fVM31ntSkZxhtmW7Bm6g5O3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taaGgSDSjMKePbXs5KW2qPfedjyeB2T5t4LYlhXV/CE=;
 b=RKqfNlwMrfEN5S/kW3keCHb7UQNzOyzS2D1LWe2ewrHfJ35t6ABgfxXucC3WgArkiv4FNiQ1tATd1pMNKAWTM1biX3ryUHiDNN/kiW46L0rIGcZhgWZrG7kKozMe/z7ozMUZUoFG3Yd3OYcm2vK87mbwrz6C5wplxC7tMucGtcxOvMt4XFOVXyNPW3VkwwP8kL/7ffdHpvL29yzLGiIE/LHsRbXBvufm7bZIxP8Ycijt0I/GmJ1i1Cgosk26xkvn1PQglkWdeqeEzc9BMMgThVX9QMttLtWgVgwb3QsoKAztfWAx0FAdM5ailXPiiL2ZFsevh38gEhML92663WPLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taaGgSDSjMKePbXs5KW2qPfedjyeB2T5t4LYlhXV/CE=;
 b=UuBUwto6iVu8hq7sDq0gq4woVNonTYygCc4ZFwSYQgHo0Pn/rJU9O77XYASfjvTg9LB3Wl3GLMlhENaFeYAvEVDnF8JBiXKIefu87052zYjwAZmGU5yLvGDGGPHPJg91NrZus0EIiXnpMmYXTs9Z9ntGI8xAl5vdBxEsPLFdRiwKpB50Vijv0ofoFODRj6gGr83P578IXcUtBJhzULmNPPJqskhvZ6PIcOUD1mYHX/DZDZJyEyMV2/ksZ0ZyuvXkDbcwK/5oyqnv+95s+p6kcYxRphsVaqBgMR1iia3a7g7M4Q4oriBBmp8F09r8/RuSP7llgPyq5NNNek2LLSN+/Q==
Received: from DB8P191CA0006.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::16)
 by AM7PR10MB3479.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:139::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:37 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::91) by DB8P191CA0006.outlook.office365.com
 (2603:10a6:10:130::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 11:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 11:34:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:49 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:37 +0100
Subject: [PATCH v2 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA
 chaining properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-9-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|AM7PR10MB3479:EE_
X-MS-Office365-Filtering-Correlation-Id: c8413d1b-dbdf-4fd7-07cf-08de4d179259
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akd3MGhvR2VQd2pCL1ppUDVlZklmWU0wTkFOSjZnNDdjaVFwRU83a0dHc09t?=
 =?utf-8?B?TW5TSDM1Nk5TMnN1YzBxYXZQWGUwMVFXQ3ZFQjNzVzA2UitLczZ5cDFESTBz?=
 =?utf-8?B?bUpZUDJqdnh3K3QycGsvT2Vtck11cER2cTYrRTc3YVpnTHEvbVR4eHJxL0dt?=
 =?utf-8?B?UWRMUXEyRm9YYWtncjg4ajM4eWR0Zmk0TnN6UlFvTC9YR00rL0ZmSWEvYTVy?=
 =?utf-8?B?emFuOHJWMEwwMVcrT2o5MVFvY1N4c3ZleG0rRlk1WHc3SzNzLzd1RFhrcnVt?=
 =?utf-8?B?R1ZUZUY2cWVxMm5lUEh1K01aYytMSnZ3eWFIWk5UdGlBRVBLclYzM0FyNW5q?=
 =?utf-8?B?M01MWTRxWVJwTnF5RmNiUzk4SlhkanJGU3JUZElWQ3Z1MnFnNk93SFEveXE3?=
 =?utf-8?B?RHFXRG1Jd0Zlb093Y2tGMVplWW9QVkJuRmNpZXpEbG5vMzdzMjVjdXN0ZG9K?=
 =?utf-8?B?K1NLZ0FMR25PMEhnalBWb09xaWpaZzg5dUVkU3NObnZDanpHb3VFc1poWnRp?=
 =?utf-8?B?RytkRmFBc0ZLUE9OTCtWRnpWK0NzZXZONW94NTZXODFuQjhxNkorakpxZkl6?=
 =?utf-8?B?UEQ0OGZIRTJiQmpFM1drMVdWVXpxSHdzQVJueUJxQldwbHcvVFdmbCtQVTBC?=
 =?utf-8?B?WFJHdG9TSlVJOVBieHFYWE82djNDa1NkaS9wTXpKaWRUVlRSVTVqSjhGUkU5?=
 =?utf-8?B?VGZ0dVhDRmJJZktyWkRza2U2TS9VcjN2cDkxc1FTNXlHb01yUTBienNjbkl2?=
 =?utf-8?B?S2ZLMHZUR1NocE43TUFRRUVaVVUxNFc4NkxRdldhMGhwNWNxdGFjYVRaS3BL?=
 =?utf-8?B?MGFpWVVsZi9yVUlZQ1pKMkdkdHdtQnRjc29vSDNMZkE3VUcxMXVzdkx6clV1?=
 =?utf-8?B?dGJHM080S3BZcTFiem51YnBuKzFQdHllaWJFOFlRaCt2akxzcmVtTVJINkpE?=
 =?utf-8?B?dEtRcjdWOU91Y3VUd2VSRU9JcXlTOGNjdytiRXppSmF6cWRsK1lNYS92bFN3?=
 =?utf-8?B?cmh4TSsrbU1SNWxiTTJNeDN2MVFra1Rzc011aUtyRFpkc3lZNi9MUElxK2Rz?=
 =?utf-8?B?TzhXdFZGNUxOV0FjNnQwYllYSGpNSFJOUC84RXR5VFNUOU1uQXVlanJxdnlz?=
 =?utf-8?B?cHZNSVMzV3N2Vm9nczlqbitLUEQ5dDlQZ0ZDK0JBejBvU20vY1FUeEJkUWVE?=
 =?utf-8?B?Q1V6MThGWU5NRFZXSGdVVUxVKzdlcnZ2T3B1RlhyQzNha0JDWHlVM0REK0lB?=
 =?utf-8?B?d3JmbG5keGVFMlIwNVdtNFo3M1M5T0xZNGRHUFJKRHFUMVNmVzRZUi92RWo0?=
 =?utf-8?B?S0dMZThWRklPNkpsR1JYVk03MGFDV1pUTjBkTStkY2tySndCaUpoY3ZsRHo2?=
 =?utf-8?B?ZmFlR2VWb2tVKzk0NmdCSnVJNENVTEwxSE9zcXo0OGhVVXhHZW9CR0lsSGl2?=
 =?utf-8?B?Y3FlWnhUSE1nNVgrcDhILy9jMDFJcDJoR0prZE1BNXdGQlA4Nnh6NlJidGY1?=
 =?utf-8?B?L3p1UVVuVjZPVktncy9QNWk4YTNZK1VlU1U5ZUZwbzRuSEp2ckxBNnRwUHlL?=
 =?utf-8?B?WjJFQ1B4VnEzbmFaQ2Z3QkhBUE9JQ21hUUFsWjZ4M1J6cUk0Y0p3Nm1CTHMx?=
 =?utf-8?B?dnlmdEwrZXZGUm1SaFNtbW56WmZHZVZCV25NRmszV0k5VkMvWmowcVBkTHEz?=
 =?utf-8?B?Ty9Oa1ZwbkYwayszb1BDTFYxMXZISnlHQWlwQStFck5MWnNqNGxrNC9NeSth?=
 =?utf-8?B?YkRJR0JrQmtHbnRDS3gvcDBVRzliYVJnRXNnYkFVMUYxZUtzUWlPOHZoTHQy?=
 =?utf-8?B?anMyUUR4b0VEWFE3TUpLQk9ua1NQK2pwQ203Qm1tcVpOVlZCaTl2K2xlbEFi?=
 =?utf-8?B?Q1JjWTMyaXNoak5qOTBXaXRZa0M4b0E4NUV0YmZra0daZnhJZjBXWGVaU1ZK?=
 =?utf-8?B?ZmR3UlA2cjBKTFpzcW9IRFZIOEFOd1ZaY1owd0RPOGZENGtLOS8zeWlJTHhJ?=
 =?utf-8?B?M09FcnBIL3NZaDFxOUNwaURmYk4xcmg4cE5ZME5GVGc5NkNVZWU5ancxd0RF?=
 =?utf-8?B?TUZPWS9UY3N6UTR5TDNTcEkyL0dMRVBNMmlkdXc0Y1BFQW9ZcUFuVUtIaWFM?=
 =?utf-8?Q?FVEs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:36.6906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8413d1b-dbdf-4fd7-07cf-08de4d179259
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3479
X-Proofpoint-ORIG-GUID: R4Ce_V-i2VWfAfVlcBoOeZFn8Jo1MFsq
X-Proofpoint-GUID: R4Ce_V-i2VWfAfVlcBoOeZFn8Jo1MFsq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX4Jo338zb5NKs
 6HyylcoxPUAER1q0kTHfLixsbz96hZWK05tMlAuihbZfbc+s+xouHJsM/H/7kgGZK55l2uJ1NOr
 dnLDIIi4OtclHeKL/0HG7mWsYy3mHmvp8fjcDRZOOmGZFCmLu7R28WfkxntM3bfVydcqVCMnavp
 IyoARhlwVCVtAs33TLhVCHZK8xBHoNJDVKQiA6cw/EpWILwnIRm7d+7Y6clloSbVXVVdHTr4VNA
 AFKt15uvRlCyZBR5fSKq2f1gddJ7MGnPdCHYFsFyFK0JILum7JzClNaFsjYNwJU4C2PHjMxUbc1
 dIOCryt/+fYai1WA3PHw0VbBS5zyY9Uj8eUpTfJSd9bmAoXYsRuJ/x0FCGMoDu+6XDexC+gXJkD
 c7Vc19YbA+tSpCXwxefSXvmsCMulZ+EOK0jJtG1X/lbTeb3LP2QDQW008hHDmkE4u8gW1oAWRTh
 R7L6vOkIZQsLMlwZq8g==
X-Authority-Analysis: v=2.4 cv=XfeEDY55 c=1 sm=1 tr=0 ts=695cf352 cx=c_pps
 a=KdmdiZF57sCZw5A4EPOxpw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GURmBasZJxkRD45z7HEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
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

Add properties update and new sram property necessary in order
to enable the DMA-MDMA chaining.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>

---
Change in v2:
  - correct typo (phandles -> phandle)
  - remove explanation about generic binding sram.yaml
---
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 34147127192f..979360e9099e 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
@@ -27,11 +27,14 @@ properties:
       - const: mclk
 
   dmas:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   dma-names:
     items:
       - const: tx
+      - const: mdma_tx
+    minItems: 1
 
   resets:
     maxItems: 1
@@ -40,6 +43,12 @@ properties:
     minItems: 1
     maxItems: 2
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to a reserved SRAM region which is used as temporary
+      storage memory between DMA and MDMA engines.
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false

-- 
2.34.1

