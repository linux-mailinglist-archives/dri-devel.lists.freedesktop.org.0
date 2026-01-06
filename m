Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BD3CF8103
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B27010E4D8;
	Tue,  6 Jan 2026 11:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="MLmd4zv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6875210E4F1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:55 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BJHnE300924; Tue, 6 Jan 2026 12:34:43 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013001.outbound.protection.outlook.com
 [40.107.162.1])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4beub1h10u-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:42 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhVNJ0pCsptKWDbuyeDeysNtxx+0M1/sl7Oucwo7rvUQYQzmAdPVDyhPRWq7wY2+R6d4NCmGfipnXDRPXNG3eZ0i5qCEiab0jBtdt3UoxWOVg3MkDfbsKlxZhPoLMeKCYHsgM+0+wVHHihZotBIpt9iz9+IwTnwhS0+MjFn1icqcutFl1c7zdgzDK2aeQWJUhq9QFxJ2deP6AapkDr0M9Usj6ZtB4KyY13lkz57Y6DtwXGbXvsQlHy9baPkAGC0OQMLKFkM3ba8t+NUu2/Im7YNAMtFtBKEjCoA1SR5nHSIY1m9R/KQMcqkyaYXum9QugAAY0tK5YEbbTthwEcgdFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X34NpEAp6HqMkgQqAOi/Kj8YmWOEUyBd2qqfBt1h3Nc=;
 b=gLxwFqocSLyczRCmR6Z2vKKOGC05CsVOWu1auaZWAqSnnWxv0isiHND8I977vxukoi6uxKx8dCkcHdwjGvlYkhz3R9jOAbQfkkP7sDBHl3zJcvZRSZKm3zatYLuGvoFRLkX38zOLjq1HohEfJ5scn2LOSpXgpKQB1/DanRzfglFpO5kAhzjNfc+4IUl5StxbsMoL2kSFsr7h6+zSg0gH79MbJQWWkQAoabNpmYOYrTVP5owAaXb/69ER8Ur9GLF7D1FDbUedUmDouyv1xQv3/l+QVtEPycZVceei1kTOeAEM8iMemN5rff5zJzFyiVwndvW885L1/HXGO2JD3mvr5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X34NpEAp6HqMkgQqAOi/Kj8YmWOEUyBd2qqfBt1h3Nc=;
 b=MLmd4zv+lHkYmM5KaJrrV0Ij8Hkpn082aDhVIcJ1aktWIkeLkEtdwwZuX3lJoavcDSCJr2rro2c94TdzCzoXo+8fXrE0+mSxwLWQxSWI+bJ+x1CmFz6UcQ+lOg3exEACYOtzb6QAlfxQ+V9Zqu9ZQmApE+ZbOZ3S330oEMCTG31CrD6L4aOif7mH59uQZvcb0g2Ih+J45kapncKhgXnP4UqP6sZA584Zk1mrqfULieJ6BsX3lV2zPZocJ3V0s7HafzrdUESVBArmBtmHWwbzt1EoGk2XnZTSG5sHrWNGYRHvHeky1SiAcLG8NkW7AZigv20pEG02j6CSVfswCiAqvA==
Received: from DUZP191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::8) by
 DUZPR10MB8149.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4dc::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.5; Tue, 6 Jan 2026 11:34:37 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::1) by DUZP191CA0048.outlook.office365.com
 (2603:10a6:10:4f8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:37 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:35:51 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:36 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:38 +0100
Subject: [PATCH v2 10/12] media: stm32: dcmi: addition of DMA-MDMA chaining
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-10-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|DUZPR10MB8149:EE_
X-MS-Office365-Filtering-Correlation-Id: de25d141-0c21-4797-d8ae-08de4d179305
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eVRwZitLTXhnb0w3dkQ5emZkU1YybFVUSFhDMjRPNms1d216RERHNDFrcWUv?=
 =?utf-8?B?dk9WTm01b3VtTHNuU1FOSXlsd1NxdFRVcHRjNVQydmR5WWJhcWlRdzFKTm42?=
 =?utf-8?B?MTF2MFpTazFLUVJrUjhWZk5lYnZtQXdnL2VaWkI0Q3l2bzcrUTVHU2xLUGdG?=
 =?utf-8?B?UXo0TUJzeFovVVVLMi9GcGJETTR1WDRtT3BNajU0WHkzK3FjOUxRMllqb2xi?=
 =?utf-8?B?YnFiUFdyNFc0K1pRRVRuc1owZloySzB2M0RIOWREa1dKamY0anpNSHBoODJ6?=
 =?utf-8?B?YnRZbkNWQmsrU3laZ1YrcUlpbGR5eEloNnVVU29qMDRrUXVBaFhPUjl1N3RY?=
 =?utf-8?B?N1V1U1lTRzRkaVRFQ2R5dEs1S3IyYVBxQ21WMkVDUzJRRStSaFdVQ0xRWURS?=
 =?utf-8?B?cityeUVzTWhwekhCNlJtenJvTDZaMnRmcnNpSldSeDBrd3pNMU5SN2tjOUg3?=
 =?utf-8?B?NC84YTh5MEJxcWsrMnY5VDBrcXROZ0N1aUZJaFVSeE5NbU5wTE1hYmYxbmJO?=
 =?utf-8?B?cG9kaUo3Ykc0WEU3bEt4RVhqMkVnbzN5VFRNNzBXbGtoMnpXbHBoM01INmEy?=
 =?utf-8?B?S3V3dVo4Mzl0ZTdjbi90cnVpUFV4Y2p4VzZjN1ZqV0RiTmdkSmVvQTVLZ200?=
 =?utf-8?B?NDM4RkNtQVFybmdsWGVWaG05RDQ4RzY3T05YOXNLYXZUcmdwbitjWVFCZlpL?=
 =?utf-8?B?WE1TVjRtaVU0SmR5U0RpWkorK2N6UFhubHkrcXo3NTEram45dytKNkVtSzVp?=
 =?utf-8?B?L2pSUzNRUElRNjlJVUFLSTl0VlpBQmdsdUN3RkRMemt0cncxcm9DamZXU1ht?=
 =?utf-8?B?VkV0MlB1b0h1TlFiS092Rzc1NGMvNEpkTmFsVGU2MnVIdnN5ek9KTE54cXhw?=
 =?utf-8?B?Mlo3VllMcnVIdUYvQWY1YzE5TGV4ZlJ2WE9JTXhVRVZINGZDK1FZb3BWeDE0?=
 =?utf-8?B?aGVLZXUxR2hJSjNxMGUrY0VDQU0vV1B3ZGhUL0gwTjlWM2txZXl1UWVNM3c4?=
 =?utf-8?B?Si9iR1JIR0pUd0pOVk1xZzgvSTJxZVhLUDlubDUwOC80cXNsOFFDdmM5UTRa?=
 =?utf-8?B?eHpLdmVya3M3TXFDb3V2SElxVkNWbTRNQTNjSjloaTd1Z3VsQkNFZWo5MTlQ?=
 =?utf-8?B?MUhkM0JRYXJSL3M1Q2EvMFFnRktHeE5LaDdRZHNzMmVIZUZyTWtjRHZjNXFh?=
 =?utf-8?B?aWNkS1VhcUNrR2VaU1I3UElpV3YzeWYzbWRYU05DTi9qQmhGYU8zVG11bStB?=
 =?utf-8?B?MlQ5d1dXT1NjTFpwdTZJdW1pRlFGM0JranlOWG5IMGkwNGs3d3E5UmROTXdQ?=
 =?utf-8?B?d3REaFBDNFc3RG05b0Z1RlRMV2xqN1drOGxtZ0o2NDM2dEZheHgrc2tuVklJ?=
 =?utf-8?B?VFBIc2M2NlRpaW1kOUNpeGNKMUV3NlhqblZKVnJ3bzY4T1pLa0Fkc29Objdz?=
 =?utf-8?B?Tm9zaVRqR0ZxcklRdTBYNTR5cmdOcVJuYjlNU3JrV2NsTUZ2KzFta3BpcFlM?=
 =?utf-8?B?b3VQL09rWXU3VXBYT200MG54TWhiMTlsNTNIcUhFdkJ0b25zeVVmdU0zaUZ1?=
 =?utf-8?B?RGY5azh5MUliV1AwM3lOSitHU3lsR3dCVXFxSmYzWTcrbURVYVJQWFdnRUZU?=
 =?utf-8?B?dXRIdGFxeHB6bml5T1NJKzh2Wk1zSGVYOTdMcFlWdW9RMUNPa1lZQjhGMktJ?=
 =?utf-8?B?emFYeFBOcExTUmxBbVlpcWFtQk9JeXhDWUlyOGtHMjROb1pnSzhWV1llenFJ?=
 =?utf-8?B?NStLSDNIZ2liM1F2WDNSZDNHaUdEckdpVklkYVlScEhCSE1IWnZ1Z1F3Z0t1?=
 =?utf-8?B?aW1wS1Ztb3l1aEpzYVhTV0NyTkM4YUl3OHRZREhhMmI3aEMwNXA5bm05MkVC?=
 =?utf-8?B?RUhvdWczYTZJL2VXSUJpbkRPcVRPZytnY0dsd2UwUi9lQlh3ZkExOC9IR21o?=
 =?utf-8?B?bml5N1FRb1krL3hJVzJwUEdKVGtTbW5XQ0EwZUpJQ1I0VHl0aEtMVDNYUHhl?=
 =?utf-8?B?Y2pZdmxlZHlCenpiWEU0R2h1TmdnVk1yN29Kb2dUUCtRQkN6cm5ZUWxFdnRv?=
 =?utf-8?B?T0RoOW5mZE9vS2NTYmFmU0s3YzJpU3BoZWwreUZuVVNOYzA2V09STEVUT3pK?=
 =?utf-8?Q?Tlf8=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:37.8336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de25d141-0c21-4797-d8ae-08de4d179305
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8149
X-Proofpoint-GUID: pAbQulcRADjFpZAO9PLJRYGO4iQVwrbl
X-Authority-Analysis: v=2.4 cv=LbIxKzfi c=1 sm=1 tr=0 ts=695cf352 cx=c_pps
 a=T38ZVIHQc1O2jE0KAdCSkA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=lfp9Q9lF5-ry6RQ8HC8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: pAbQulcRADjFpZAO9PLJRYGO4iQVwrbl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX3GyS9OKOb/gg
 5ANwgJJQcJoW1sYB8nAaEyG8Wzl1VBf0GqJMg+JZRY8zb1zGdy5v9uDbluaPpiB89becjxwUlXh
 D3sdXbjjsRj/R5qnyAANH2UJSqJH0z2B3N4CiwPrX5JOJDvIIrAxLvrtD+JO+RPApnOtJ93HOAk
 NowMR+/f1clipxdQ6FMs/sowBCsqFzfRRsuzY3YVCspoxpUdBhnVLU3DTupptuMXJ3HbjNTOM64
 FgoSV/HD6ePdPoCgH0GEOvA3kjAmi95RVLli7cSaxiujB2HbC05+zBEKvj/8Oro235J4JxL8XjN
 b48mMe1zkSJHwUMm91OGBSUGikdGrgDzk83yMC+sRtGI4T3UfoNlXCrLcoRF7Jlwu+ZiARTPyLZ
 RPbDxvvsg2nMiqqx2Q4Br208pVbn1kjLpKvBayG1VILtegxHk2kA1MbenfXeJeClwgb4H5IU9BB
 +txN1RrGZY/GOia+Ofg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060099
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

Add possibility to rely on an additional MDMA channel and chain
the DMA and MDMA channels allowing to achieve faster capture.
Indeed, on the MP15 platform, the MDMA engine has an higher
bandwidth to the DDR than the DMA engine.  Relying on that
it is possible to capture frames from the DCMI IP into the DDR
by using two channels as follow:

  DCMI -> (DMA) -> SRAM -> (MDMA) -> DDR

The DMA is able by himself to trigger a MDMA request hence, once
properly configured, the DCMI IP can simply trigger the DMA in order
to have the data pushed up to the DDR (via the SRAM and a MDMA
channel).

This behavior is detailed in the document
Documentation/arch/arm/stm32/stm32-dma-mdma-chaining.rst

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 250 +++++++++++++++++++++++----
 1 file changed, 220 insertions(+), 30 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 97683daf179d..e5663fbe6422 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -15,6 +15,7 @@
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/genalloc.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
@@ -113,7 +114,9 @@ struct dcmi_buf {
 	struct vb2_v4l2_buffer	vb;
 	bool			prepared;
 	struct sg_table		sgt;
+	struct sg_table		sgt_mdma;
 	struct dma_async_tx_descriptor *dma_desc;
+	struct dma_async_tx_descriptor *mdma_desc;
 	size_t			size;
 	struct list_head	list;
 };
@@ -159,6 +162,15 @@ struct stm32_dcmi {
 	struct dma_chan			*dma_chan;
 	dma_cookie_t			dma_cookie;
 	u32				dma_max_burst;
+
+	/* Elements for the MDMA - DMA chaining */
+	struct gen_pool			*sram_pool;
+	struct dma_chan			*mdma_chan;
+	void				*sram_buf;
+	u32				sram_buf_size;
+	dma_addr_t			sram_dma_buf;
+	dma_cookie_t			mdma_cookie;
+
 	u32				misr;
 	int				errors_count;
 	int				overrun_count;
@@ -247,12 +259,22 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
 	/* Push current DMA transaction in the pending queue */
+	if (dcmi->mdma_chan) {
+		dcmi->mdma_cookie = dmaengine_submit(buf->mdma_desc);
+		if (dma_submit_error(dcmi->mdma_cookie)) {
+			dev_err(dcmi->dev, "%s: MDMA submission failed\n", __func__);
+			return -ENXIO;
+		}
+	}
+
 	dcmi->dma_cookie = dmaengine_submit(buf->dma_desc);
 	if (dma_submit_error(dcmi->dma_cookie)) {
 		dev_err(dcmi->dev, "%s: DMA submission failed\n", __func__);
 		return -ENXIO;
 	}
 
+	if (dcmi->mdma_chan)
+		dma_async_issue_pending(dcmi->mdma_chan);
 	dma_async_issue_pending(dcmi->dma_chan);
 
 	return 0;
@@ -301,7 +323,9 @@ static void dcmi_set_crop(struct stm32_dcmi *dcmi)
 
 static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 {
-	struct dma_tx_state state;
+	struct dma_tx_state state, state_dma;
+	size_t bytes_used;
+
 	enum dma_status status;
 	struct dcmi_buf *buf = dcmi->active;
 
@@ -309,23 +333,36 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 		return;
 
 	/*
-	 * At the time FRAME interrupt is received, all dma req have been sent to the DMA,
-	 * however DMA might still be transferring data hence first synchronize prior to
-	 * getting the status of the DMA transfer.
-	 * Then DMA tx status gives the amount of data transferred to memory, which is then
-	 * returned to V4L2 through the active buffer payload.
+	 * Pause the DMA transfer, leading to trigger of the MDMA channel read while
+	 * keeping a valid residue value on the dma channel
 	 */
+	if (dcmi->mdma_chan) {
+		spin_unlock_irq(&dcmi->irqlock);
+		dmaengine_pause(dcmi->dma_chan);
+		spin_lock_irq(&dcmi->irqlock);
+
+		do {
+			status = dmaengine_tx_status(dcmi->mdma_chan, dcmi->mdma_cookie, &state);
+			cpu_relax();
+		} while (status != DMA_ERROR && status != DMA_COMPLETE &&
+			 state.residue && state.in_flight_bytes);
+	} else {
+		status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
+	}
 
-	spin_unlock_irq(&dcmi->irqlock);
-	/* Drain DMA */
-	dmaengine_synchronize(dcmi->dma_chan);
-	spin_lock_irq(&dcmi->irqlock);
-
-	/* Get DMA status and residue size */
-	status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
 	if (status != DMA_ERROR && state.residue < buf->size) {
+		bytes_used = buf->size - state.residue;
+
+		if (state.residue && dcmi->mdma_chan) {
+			dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state_dma);
+			/* Getting full size residue equal to no residue */
+			if (state_dma.residue == dcmi->sram_buf_size)
+				state_dma.residue = 0;
+			bytes_used -= state_dma.residue;
+		}
+
 		/* Return buffer to V4L2 with received data size */
-		dcmi_buffer_done(dcmi, buf, buf->size - state.residue, 0);
+		dcmi_buffer_done(dcmi, buf, bytes_used, 0);
 	} else {
 		dcmi->errors_count++;
 		dev_err(dcmi->dev, "%s: DMA error. status: 0x%x, residue: %d\n",
@@ -336,6 +373,8 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 
 	/* Abort DMA operation */
 	dmaengine_terminate_async(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dmaengine_terminate_async(dcmi->mdma_chan);
 }
 
 static irqreturn_t dcmi_irq_thread(int irq, void *arg)
@@ -354,13 +393,15 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 			dcmi->errors_count++;
 
 		dmaengine_terminate_async(dcmi->dma_chan);
+		if (dcmi->mdma_chan)
+			dmaengine_terminate_async(dcmi->mdma_chan);
 
 		if (dcmi_restart_capture(dcmi))
 			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
 		spin_unlock_irq(&dcmi->irqlock);
-
 		return IRQ_HANDLED;
 	}
+
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;
 
@@ -447,28 +488,70 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 	vb2_set_plane_payload(vb, 0, size);
 
 	if (!buf->prepared) {
+		u32 max_size = dcmi->dma_max_burst;
+		unsigned int dma_nents;
+
 		/* Get memory addresses */
 		buf->size = vb2_plane_size(&buf->vb.vb2_buf, 0);
-		if (buf->size > dcmi->dma_max_burst)
-			num_sgs = DIV_ROUND_UP(buf->size, dcmi->dma_max_burst);
+		if (dcmi->mdma_chan)
+			max_size = dcmi->sram_buf_size / 2;
 
-		ret = sg_alloc_table(&buf->sgt, num_sgs, GFP_ATOMIC);
+		if (buf->size > max_size)
+			num_sgs = DIV_ROUND_UP(buf->size, max_size);
+
+		/*
+		 * If we use MDMA chaining, DMA is used in cyclic mode and the scatterlist
+		 * maximum size is thus 2
+		 */
+		dma_nents = num_sgs;
+		if (dcmi->mdma_chan)
+			dma_nents = min_t(unsigned int, num_sgs, 2);
+
+		ret = sg_alloc_table(&buf->sgt, dma_nents, GFP_ATOMIC);
 		if (ret) {
-			dev_err(dcmi->dev, "sg table alloc failed\n");
+			dev_err(dcmi->dev, "sg table alloc failed for DMA\n");
 			return ret;
 		}
 
+		if (dcmi->mdma_chan) {
+			ret = sg_alloc_table(&buf->sgt_mdma, num_sgs, GFP_ATOMIC);
+			if (ret) {
+				dev_err(dcmi->dev, "sg table alloc failed for MDMA\n");
+				return ret;
+			}
+		}
+
 		dma_buf = vb2_dma_contig_plane_dma_addr(&buf->vb.vb2_buf, 0);
 
 		dev_dbg(dcmi->dev, "buffer[%d] phy=%pad size=%zu\n",
 			vb->index, &dma_buf, buf->size);
 
-		for_each_sg(buf->sgt.sgl, sg, num_sgs, i) {
-			size_t bytes = min_t(size_t, size, dcmi->dma_max_burst);
+		for_each_sg(buf->sgt.sgl, sg, dma_nents, i) {
+			size_t bytes = min_t(size_t, size, max_size);
+
+			if (!dcmi->mdma_chan) {
+				sg_dma_address(sg) = dma_buf;
+				dma_buf += bytes;
+			} else {
+				/* Targets the beginning = first half of the sram_buf */
+				sg_dma_address(sg) = dcmi->sram_dma_buf;
+				/*
+				 * Targets the second half of the sram_bubf
+				 * for odd indexes of the item of the sg_list
+				 */
+				if (i & 1)
+					sg->dma_address += (dcmi->sram_buf_size / 2);
+			}
+			/*
+			 * In case of DMA-MDMA chaining, since the DMA is working in cyclic mode,
+			 * we need to provide two linked-list node of same size in order to have
+			 * a correct residue value computed.
+			 */
+			if (!dcmi->mdma_chan)
+				sg_dma_len(sg) = bytes;
+			else
+				sg_dma_len(sg) = dcmi->sram_buf_size / 2;
 
-			sg_dma_address(sg) = dma_buf;
-			sg_dma_len(sg) = bytes;
-			dma_buf += bytes;
 			size -= bytes;
 		}
 
@@ -480,6 +563,8 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 							DMA_PREP_INTERRUPT);
 		if (!buf->dma_desc) {
 			dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_sg failed\n", __func__);
+			if (dcmi->mdma_chan)
+				sg_free_table(&buf->sgt_mdma);
 			sg_free_table(&buf->sgt);
 			return -EIO;
 		}
@@ -489,10 +574,48 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 		if (ret) {
 			dev_err(dcmi->dev, "%s: DMA dmaengine_desc_set_reuse failed\n", __func__);
 			dmaengine_desc_free(buf->dma_desc);
+			if (dcmi->mdma_chan)
+				sg_free_table(&buf->sgt_mdma);
 			sg_free_table(&buf->sgt);
 			return -EIO;
 		}
 
+		if (dcmi->mdma_chan) {
+			size = dcmi->fmt.fmt.pix.sizeimage;
+			for_each_sg(buf->sgt_mdma.sgl, sg, num_sgs, i) {
+				size_t bytes = min_t(size_t, size, max_size);
+
+				sg_dma_address(sg) = dma_buf;
+				sg_dma_len(sg) = bytes;
+				dma_buf += bytes;
+				size -= bytes;
+			}
+
+			buf->mdma_desc = dmaengine_prep_slave_sg(dcmi->mdma_chan, buf->sgt_mdma.sgl,
+								 buf->sgt_mdma.nents,
+								 DMA_DEV_TO_MEM,
+								 DMA_PREP_INTERRUPT);
+			if (!buf->mdma_desc) {
+				dev_err(dcmi->dev, "%s: failed dmaengine_prep_slave_sg for MDMA\n",
+					__func__);
+				dmaengine_desc_free(buf->dma_desc);
+				sg_free_table(&buf->sgt_mdma);
+				sg_free_table(&buf->sgt);
+				return -EIO;
+			}
+
+			ret = dmaengine_desc_set_reuse(buf->mdma_desc);
+			if (ret) {
+				dev_err(dcmi->dev, "%s: failed to set reuse for mdma desc\n",
+					__func__);
+				dmaengine_desc_free(buf->mdma_desc);
+				dmaengine_desc_free(buf->dma_desc);
+				sg_free_table(&buf->sgt_mdma);
+				sg_free_table(&buf->sgt);
+				return -EIO;
+			}
+		}
+
 		buf->prepared = true;
 
 		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
@@ -511,6 +634,14 @@ static void dcmi_buf_cleanup(struct vb2_buffer *vb)
 	if (!buf->prepared)
 		return;
 
+	if (dcmi->mdma_chan) {
+		ret = dmaengine_desc_free(buf->mdma_desc);
+		if (ret)
+			dev_err(dcmi->dev, "%s: Failed to free the mdma descriptor (0x%x)\n",
+				__func__, ret);
+		sg_free_table(&buf->sgt_mdma);
+	}
+
 	ret = dmaengine_desc_free(buf->dma_desc);
 	if (ret)
 		dev_err(dcmi->dev, "%s: Failed to free the mdma descriptor (0x%x)\n",
@@ -816,6 +947,8 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 
 	/* Stop all pending DMA operations */
 	dmaengine_terminate_sync(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dmaengine_terminate_sync(dcmi->mdma_chan);
 
 	pm_runtime_put(dcmi->dev);
 
@@ -1824,9 +1957,9 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct v4l2_fwnode_endpoint ep = { .bus_type = 0 };
 	struct stm32_dcmi *dcmi;
 	struct vb2_queue *q;
-	struct dma_chan *chan;
+	struct dma_chan *chan, *mdma_chan;
 	struct dma_slave_caps caps;
-	struct dma_slave_config dma_config;
+	struct dma_slave_config dma_config, mdma_config;
 	struct clk *mclk;
 	int ret = 0;
 
@@ -1888,15 +2021,21 @@ static int dcmi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(chan),
 				     "Failed to request DMA channel\n");
 
-	dcmi->dma_max_burst = UINT_MAX;
-	ret = dma_get_slave_caps(chan, &caps);
-	if (!ret && caps.max_sg_burst)
-		dcmi->dma_max_burst = caps.max_sg_burst	* DMA_SLAVE_BUSWIDTH_4_BYTES;
+	mdma_chan = dma_request_chan(&pdev->dev, "mdma_tx");
+	if (IS_ERR(mdma_chan)) {
+		ret = PTR_ERR(mdma_chan);
+		if (ret != -ENODEV)
+			return dev_err_probe(&pdev->dev, ret, "Failed to request MDMA channel\n");
+		mdma_chan = NULL;
+	}
 
+	/* Configure the DMA channel */
 	memset(&dma_config, 0, sizeof(dma_config));
 
 	dma_config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
 	dma_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	if (mdma_chan)
+		dma_config.peripheral_size = 1; /* Indicates chaining */
 
 	/* Configure DMA channel */
 	ret = dmaengine_slave_config(chan, &dma_config);
@@ -1906,6 +2045,47 @@ static int dcmi_probe(struct platform_device *pdev)
 		goto err_dma_slave_config;
 	}
 
+	/* If we want MDMA, we also need a sram pool */
+	if (mdma_chan) {
+		dcmi->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+		if (!dcmi->sram_pool) {
+			dev_info(&pdev->dev, "No SRAM pool, can't use MDMA chaining\n");
+			goto err_dma_slave_config;
+		}
+
+		dev_info(&pdev->dev, "SRAM pool: %zu KiB for DMA/MDMA chaining\n",
+			 gen_pool_size(dcmi->sram_pool) / 1024);
+
+		dcmi->sram_buf_size = gen_pool_size(dcmi->sram_pool);
+		dcmi->sram_buf = gen_pool_dma_zalloc(dcmi->sram_pool, dcmi->sram_buf_size,
+						     &dcmi->sram_dma_buf);
+		if (!dcmi->sram_buf) {
+			dev_err(dcmi->dev, "Failed to allocate from SRAM\n");
+			goto err_dma_slave_config;
+		}
+
+		/* Configure the MDMA Channel */
+		memset(&mdma_config, 0, sizeof(mdma_config));
+		mdma_config.direction = DMA_DEV_TO_MEM;
+		mdma_config.src_addr = dcmi->sram_dma_buf;
+		mdma_config.peripheral_size = dma_config.peripheral_size;
+		mdma_config.peripheral_config = dma_config.peripheral_config;
+		ret = dmaengine_slave_config(mdma_chan, &mdma_config);
+		if (ret < 0) {
+			dev_err(dcmi->dev, "%s: MDMA channel config failed (%d)\n",
+				__func__, ret);
+			goto err_mdma_slave_config;
+		}
+	}
+
+	dcmi->dma_max_burst = UINT_MAX;
+	/* In case of using DMA-MDMA chaining we consider the maximum infini */
+	if (!mdma_chan) {
+		ret = dma_get_slave_caps(chan, &caps);
+		if (!ret && caps.max_sg_burst)
+			dcmi->dma_max_burst = caps.max_sg_burst * DMA_SLAVE_BUSWIDTH_4_BYTES;
+	}
+
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
 	init_completion(&dcmi->complete);
@@ -1915,6 +2095,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	dcmi->mclk = mclk;
 	dcmi->state = STOPPED;
 	dcmi->dma_chan = chan;
+	dcmi->mdma_chan = mdma_chan;
 
 	q = &dcmi->queue;
 
@@ -2023,8 +2204,13 @@ static int dcmi_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dcmi->v4l2_dev);
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
+err_mdma_slave_config:
+	if (dcmi->mdma_chan)
+		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
 err_dma_slave_config:
 	dma_release_channel(dcmi->dma_chan);
+	if (dcmi->mdma_chan)
+		dma_release_channel(mdma_chan);
 
 	return ret;
 }
@@ -2042,6 +2228,10 @@ static void dcmi_remove(struct platform_device *pdev)
 	media_device_cleanup(&dcmi->mdev);
 
 	dma_release_channel(dcmi->dma_chan);
+	if (dcmi->mdma_chan) {
+		gen_pool_free(dcmi->sram_pool, (unsigned long)dcmi->sram_buf, dcmi->sram_buf_size);
+		dma_release_channel(dcmi->mdma_chan);
+	}
 }
 
 static int dcmi_runtime_suspend(struct device *dev)

-- 
2.34.1

