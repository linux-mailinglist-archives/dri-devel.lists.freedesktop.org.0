Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B381CCD3A6
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FFE10EA60;
	Thu, 18 Dec 2025 18:45:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="I3euPhxH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6D810EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:45:14 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIQWOA2504132; Thu, 18 Dec 2025 19:45:02 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4esu269n-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:02 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ke86cgQsgPU2G/KlBmstcWgI0bm9PVRRoFr5ERVWStbr5VIpS137VEnauCy7D7eMb94y/iFu+w2a5d1TIiCye2s3YLa3uzwCO0nwSLog9vSa2Jz9EMzyeFUx/ScDI/yXyd2bhlM0GrYROHbFXMvjyoJj26Nl/Q9SIRkHZX4okmSFCUIJjqMAvuzFYXNsg7NEF9ieDSzdD/aFgVZySBN0zkncivZgFUESrEcjtSz8elbz24vLNcEf0b+iLvAZyNfNfLjhoQIp9B+f7i4DbSTjlDFf5CEVA8UckcpWf+UbKntLcQ0kLnlkQxcoIQL+MvMDM2UaDnn5bSJ96DAH2dTlVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muSHh3KI6m9hVwhxmNS6rfIJgipi0u253tGfIeU5H+Y=;
 b=oRBEvCINIXaNBTde3wJZj3n24jrT/Y0mEanW9Yeuxot5qRz4MirIgE8KtdftSTNB65LNM457VfKvdcYmjyI047E46Fm+cro3KQvqeOEr3WW36z2QJ2taTmdR5bZDjwra/FubX9M9ZBPr5032ssB7wQrkM75QIAuyDE7nT26HsyvrvTB5pQejPaUHPdTRoI5rfis32qzTf7EmoFM+yaR54/fVIjWl8//7Jjj5eYjX/jMeFN3dNGvseblotQAbsnJkozDb37py8lpgLxgWX634NLta3mM/fkKAEKIJm3VnpdfZP97nLDrOpD5cnNTPs2cTuCUEhJjPRdDHE9LU45O9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=muSHh3KI6m9hVwhxmNS6rfIJgipi0u253tGfIeU5H+Y=;
 b=I3euPhxH0/SWlY/6MukXFsKxcgUs3/2bqqB8LRZqsci2lxbdSgdEvQBdER7lwF5stTZLdYZadBx0yeAHFJKilihDozE5CXCZ5rSCOXzogwYIQDV6jD6Jjf5tmmNpGl8BX81z2qMw/O7SGiOwB4cIkN8Ux3Aah9SNYpv957g1N9A/7xszZ1QLyEwszqAn+piU9HdI4AJCVqZgRaK88BxFTm0YZ4gq++ZYe6JOsMXVFIM81S9VYPI0F8pVuPCBk3H9EIAqwKf0wbZheskTDmpFukWNaDxtuwbg74cSTPszn0vgdInXesFCI1+SfChvrvsKsToFpeA+QyehfaLbODrL4g==
Received: from DUZPR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::15) by DB9PR10MB7995.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:39e::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:44:59 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::46) by DUZPR01CA0062.outlook.office365.com
 (2603:10a6:10:3c2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 18:45:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:59 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:46 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:57 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:47 +0100
Subject: [PATCH 07/12] media: stm32: dcmi: use dmaengine_terminate_async in
 irq context
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-7-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|DB9PR10MB7995:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd85864-a521-4581-7801-08de3e658bd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TFczbkYxV2hYWm5ib2FJWFQ3ODVySHRObHM1RHZkQ056dlJkU0pjd1BvL2tD?=
 =?utf-8?B?ZUM2UG1uN3Z6RW1SM0hxdHFRd2l4N1RXYk5jM1lvVDZqNjVGYmtmOFZJcC9K?=
 =?utf-8?B?TFBFSTRzNHg5aDlwUVFhdFBDeEh5UzB2QVBNRzg5anB6Z2psbldoYS91RC9q?=
 =?utf-8?B?cStYVVQ1bC9Tb3VVT3lCVFhibTBJbkt0cFo4bVZQdCthaGJCeGc5UnZMazEv?=
 =?utf-8?B?M1JxbGJoajJGcm9yZ2o1SzlHcm1WeDBRbS9RcjlwdmcxZVp2U2t0MENGamRS?=
 =?utf-8?B?eGh3R0hsbDkyMUZseDBkd3A3c2hkZWhidHlLaEFEUHRJSFZHWW5EdEVqVDE2?=
 =?utf-8?B?WEVKWmlRbVJ4WFhGYjdTNWVsYXkwTXRkZUZpVUFJREFkd0JhSFNnc1B3MWdn?=
 =?utf-8?B?ZHQ4Um5JK2QzZG1Zc0pnUzlFVlF4dzNyeCtXWGhndm9lTTQvU3ptalhtcThz?=
 =?utf-8?B?NWJIeGlxbXkzTFpNZW1UeTdZcS9XbEhrdXAwQzEyaWpFa25hQWlQTG5nUjh1?=
 =?utf-8?B?R1FWcC9wN3lUV0lHSHlRZE1KZDJFVys5UEVibVBYMGxQWkVSeHBuQzRMaWg4?=
 =?utf-8?B?TlNTVkNjSjI2QncwUjVkZzgzcmlBaVFSSDVjMzN2SzN3NEVpLzhCTHZxdUJE?=
 =?utf-8?B?ZU1UZUdROVI1dGYyTkQvMXZCQUU2Wk43RDRVWG41NThkNVQ0ZUE0UmpNQzVv?=
 =?utf-8?B?YWFDY250RFhBN1BBalBCdFlncUZLS1kzc3p6KzZIM1ZhNVR3cWNZZmtraUl5?=
 =?utf-8?B?WGpTelFiYzJmWHhBU1pKK0JUajFHY1lEdG41N1VMUkN5bG01WFU1SzZlSnQv?=
 =?utf-8?B?OS8ySjJIcE11bCtiTTVEOVpybFZyMFBVSGRiNEFZcUE4dmcwTHN0OWdxSDU0?=
 =?utf-8?B?NDJzUVh1UWlzeEhSQmVDYnhGWUQ3Ri9kSlJaUUVTRGFXYUZRWHNXclkyUkdm?=
 =?utf-8?B?WFBQRUV3ZnBNZ0lacGcwbUdpQ05CcnY4a0VTcDdIQ1N6SVN0RUZyaVF5bFNV?=
 =?utf-8?B?cDNyZER3YTlJcVlMcUpFV0JTVFg4UjNPSE5xaWVzMWF0d092N3lpODQ4ZlJB?=
 =?utf-8?B?bDJ2citBMjB3a04xa3l1VEdra2JqMWNYNEFtbEh0TjRUQkhDY0xyVFN0Uzhn?=
 =?utf-8?B?ZWUzemZzRXRhYzk3NURrbXRFTGUrcXVrUGh0SmJaRDkwOWxyMTNoUUovdkZi?=
 =?utf-8?B?NWRhT0tIc1pEMkE2cUo2aFc3ak9EVS9hbURpeC9TY2hiMjBkanJZOW5Wbm5l?=
 =?utf-8?B?R1pWeVRGZTIwOTczWVVLd0toS292ZlRtZzZCM0FmcjdhaVhiYWNFRXF5TVZm?=
 =?utf-8?B?Sm0rdTd0ZEhOMXRuNkdjK3c5Rnhla1JZSU5xUEVRUmNMT0k0NEhBNlJpZnFq?=
 =?utf-8?B?REZRWjdVK1lKTHNjS3J5WG0xSGZ0dkVQSUJSeTVrNno2UzU2YjlkSklsSXNp?=
 =?utf-8?B?NWhPSXRPZjdEaithRDdyT3NqL1lieEIxM3BwMmswRkw2WXpCSkVRaG9xWVRl?=
 =?utf-8?B?bFpUU2hvcWxwd0J6NGFmdUZLaUZXL3UwNUg1Q1NrM3dkNVJaQTFQVktsMUZo?=
 =?utf-8?B?L096b0xhQWV3V2FCcHBXU0xteTBFaHNDMk9RSUNIa0t5TXZlSjhjMXdzeVgv?=
 =?utf-8?B?dzYwcnFmV2tSSzd3am1zcmQ3azNGQW9lQTQxSXc0Z2U5OVBwanBQeHlucFVw?=
 =?utf-8?B?VW9HaXBqS1M0MWwwT2JsZ1o2cm5EZ0xuOGJ4b25Jc0pCM2kwNEZweTVpY2hT?=
 =?utf-8?B?MitjVm5rUDNVZFVwb25kN0pkSkxUbzNXZlR5Qy9jbEZmUFRYQmg0dTVxcGdR?=
 =?utf-8?B?TXBsS1BTcWt2Mmowa0laZFdFYXR6RjRRZjJJNEd1bFpCOHlTaWN2TlBMcTR2?=
 =?utf-8?B?Q2tYdDJtSXMvSFRQK3VZSDR3N3l3b2MveGhHQmVUUEZXVTRwQmVYUk5LNExa?=
 =?utf-8?B?SlR3eitsMW5aQ0JlMTdWVmhHNFhaOXFlOHU4ZnpXTVgwMzRaRUdXTEJCaGpX?=
 =?utf-8?B?Mi9NRkdkcDJkMnljcVR5U3BiUFZNeGJZQ241QjFYa2hIUVFobW03MnZLeFU2?=
 =?utf-8?B?TFI2L2dFcVF1dldCblB6ZWdDbEZVOFEyK1ZWTzdiU0lPTzE2SDFVbFlaQytq?=
 =?utf-8?Q?I00k=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:59.0799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd85864-a521-4581-7801-08de3e658bd6
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB7995
X-Proofpoint-ORIG-GUID: QHK4hNAkEVgc34QA2Qm1aLNkmtixluSK
X-Authority-Analysis: v=2.4 cv=EeLFgfmC c=1 sm=1 tr=0 ts=69444bae cx=c_pps
 a=gXrl5TodGbHmua8ggoz7cw==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=gAtnOOuIUh8xv9oTcPAA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX3YEtdtVDFjOf
 LzLk6WkcHGsX/VmXHV4x2VhGHZfIKzqjcwOLWberk2Iw9ET8UNpcOVFXda9aM8LOAmnNmJeouLP
 H+qWwcWOoz+VSPecp77R4gXLcCSXNj+1b8NfHgItR2vTUT88dlQXSyUgcZJwa3A7Y37SUa1DvVE
 avxiE8SMnlo15reGE8HIbOjRL2pNeDrSOoHL4SH1+10anYeJo6iaZljX50MrHF3l5fbF7Dx7Q9g
 bA8RUzFku3nF9SZg1wZ+rLDZjt0Bj5TGCUNOlDZJKmCPwVQu1sQfwUeAZv/CVRGGKjamskV3GEq
 F8kc54I+BSZ/xKDPCchhT1C0v/qxRKuOnlxkOwm5iVhe86RP435Q3b1agynSsICuRNP50pSePfQ
 YGEEjwx4LaM7sVKR5isv/dI5Bfx0Jw==
X-Proofpoint-GUID: QHK4hNAkEVgc34QA2Qm1aLNkmtixluSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
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

Whenever receiving an OVERRUN event or an end of frame, the driver stops
currently ongoing DMA transfer since the DCMI stops sending data to dma.
Not doing this would lead to having DMA & DCMI no more synchronized in term
of expected data to be copied.
Since this is done in irq handler context, it is not possible to make any
call that would lead to scheduling hence dmaengine_terminate_sync are not
possible.
Since the dcmi driver is NOT using dma callbacks, it is possible thus to
call instead dmaengine_terminate_async (aka without synchronize) and call
again right after a new dmaengine_submit to setup again a new transfer.
And since this is now a dmaengine_submit_async, there is no need to release
the spinlock around calls to the dmaengine_submit_async.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 06b66095844b..25e95ba2ca84 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -334,10 +334,8 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 		dcmi_buffer_done(dcmi, buf, 0, -EIO);
 	}
 
-	spin_unlock_irq(&dcmi->irqlock);
 	/* Abort DMA operation */
-	dmaengine_terminate_sync(dcmi->dma_chan);
-	spin_lock_irq(&dcmi->irqlock);
+	dmaengine_terminate_async(dcmi->dma_chan);
 }
 
 static irqreturn_t dcmi_irq_thread(int irq, void *arg)
@@ -355,10 +353,8 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 		if (dcmi->overrun_count > OVERRUN_ERROR_THRESHOLD)
 			dcmi->errors_count++;
 
-		spin_unlock_irq(&dcmi->irqlock);
-		dmaengine_terminate_sync(dcmi->dma_chan);
+		dmaengine_terminate_async(dcmi->dma_chan);
 
-		spin_lock_irq(&dcmi->irqlock);
 		if (dcmi_restart_capture(dcmi))
 			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
 		spin_unlock_irq(&dcmi->irqlock);

-- 
2.34.1

