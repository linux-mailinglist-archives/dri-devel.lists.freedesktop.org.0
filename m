Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF20CCD3C1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 827FA10EA6B;
	Thu, 18 Dec 2025 18:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="GvQnPFio";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE6910EA6B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:45:28 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIhHfs3002715; Thu, 18 Dec 2025 19:45:16 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013060.outbound.protection.outlook.com
 [52.101.83.60])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b3xb75qdr-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:16 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OFhtpUy7S/3bMA0g0dXnlWNg63kpbb9hS8DeeDabLmCmNopQ4GDH1RicoXJDDOHwCOZw43xYYWkVSliO4nVcjdsaopZGoQwDU4pIB9JDkOVUtIxbt663uWHqCP10Iyfy5EWxF8CmE6/WU7IRaUGTTKPmYXSBfN+9q0BbHDMNrJiXkuNBSgOFXgn4nh6PCJHeKLeTXV7VVCA8BLSmDb8zCRyEuC95R1Gz9wSnWfxny1uPGM/Y5zajQE6Z/K6bW/HrvBFiXcgruJ1ypUREA9vSz/i25bgx/55KnQkmM9mLp/D6S3czMsMdKQ7XnlmnWD9dnTHLfMYjaeWQVB/PEJ4IKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYO9BMFuAEBEi5Oq48LSgQ5DmAwbDuf1qLeYpoNCa7w=;
 b=KoFZLFTKaxwYVrj7gdJmElUnR8ZambkVqeGor4j1VgfMpSyd3qX2OlbWq4XPkH6D3CYQw5WW1ZUE1qYtDSKFa4wGmpzBhsWvqi7u/hgubtwEe260K49O86zSdJzhDYDvXjjuIYAdxgAUYV8rUHTBKVy+olmqYsFu5YZmPvT6b5KmwaQL7zP9VVtx/HvuVH1fJlQ/PpgEwiChT13FOZ95nlKCFo+gDPkV3yc2/NTEwlXYS6wlTs+F/fUjekb420VUJrwsiP3XLosgK8XRgzS+VPI5MENYq5D8d6qWY/G8/imzU8uJzCWc2cOv0SjQlf0wWW8O4chnSvexSPXUJkhTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYO9BMFuAEBEi5Oq48LSgQ5DmAwbDuf1qLeYpoNCa7w=;
 b=GvQnPFiozMspWGVhFjxngTbrku7HB3yO72xUOZKfemUMiOFhNmuIp+FPuEoDLtLOe7yfYooGPGFzzYBsw1LWLnBlEo+1pvE+ZQRDj26DsIx9DiOlmBlnYUMzKmDM1vJdnagPNFlTZUinLjQ1qUu/l6Qs/TSzpP9J8TodaLhJR66NpnPp6ZTBdt0bThZntaiwhntZhFc3oUZVLaVBsYhmhd5faMkAMAfeY5hXncWf1CRXX0YoXUTTTaAVIOJn/kBYNblfQkDP5ze+8gsoaA2YlaM5wYA5Yv0tEzZaeZAG64D3lHMAzTyuqroyUMzb9egxouReo/VjAJtjtlFCB2WfuA==
Received: from CWLP265CA0309.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::33)
 by AS2PR10MB7762.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:45:02 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::8d) by CWLP265CA0309.outlook.office365.com
 (2603:10a6:401:5d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 18:45:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:45:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:43 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:57 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:48 +0100
Subject: [PATCH 08/12] media: stm32: dcmi: continuous mode capture in JPEG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-8-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|AS2PR10MB7762:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c1f4fb-f06d-487f-cd29-08de3e658d81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVd3TWdaSHljeG11cVVKVCtqSnluMGErdm5DZDJkM2dqWTRneTlRaGd3WXdY?=
 =?utf-8?B?TmVXVnJtaDBkcm5FRGRUdVM5aytZZXpjTTJYelRWNXpid0NaS2IxcEtWTVhw?=
 =?utf-8?B?eS83WVVtM2FOTW1HQUJ1aVlST2ZsS29mSDJocWtoU2tWY24rMVNqUHBwa3hM?=
 =?utf-8?B?cHN5R3JDT1NHQUxHQ2pzTXV2akJVWHROaVRDUDdTTk50eHBOZUVtZ1MxMDBh?=
 =?utf-8?B?YW9LTzR0T2xyb3hROG9MLzYvSnIyUkJOb25QZElsNHF1UHdqNm9Qb2lLcnMx?=
 =?utf-8?B?cGRrTXpqVzF1SzNnTFRZSHNwaVliRG1UTmtpdzAzTzA5dkloL24vQUY4TWE1?=
 =?utf-8?B?VXFLc2JLbmpuOWcvcEI4UU9HQVJxeERRYmpXREtyZVo5UUo0NUY2N2lMTnpL?=
 =?utf-8?B?Z3FtZWg0SDVFbU5nMkFMVVdnVnpaUElMc1VVTmZQRER6TFIybXU5VzYyN0hw?=
 =?utf-8?B?TWxITm1hS0dxdHc1aGU3NzNZNGoxODU0ajUrajVVakRMYjI5Vm0vNVU3b0p5?=
 =?utf-8?B?NVBNcjF6NFdma0VNb09hTUZoU2pqUHA1dXUzRnNsUU9HV0kwd3VSUG5ZRXpX?=
 =?utf-8?B?ZE1zay9tcCtXMU1QL2ZoK0RQQmhPaUhwZXdHR2s4Z3M5Z1NtTVUvVEhqMHM1?=
 =?utf-8?B?YlJnTW5WZ3laUU5XQnZSQ0JyUEtYVEd4eGl0M3BNSUw0d2NqSktseVZCdVlW?=
 =?utf-8?B?N2s3OUcxZ056M0E5QXFwaDFQaytRRDRNYnkxcTNCcXZKbDFSUFQyRmVXUXFm?=
 =?utf-8?B?elpPRDFhZzFxYU5kTXdkbGZ6L3ZPaDkvcks2UXJFTHA2T2RxaGlMQWRFRzZ6?=
 =?utf-8?B?SVpSbVUvUFZCdUIyaHJtSDZXMFRqSDRUUi9pU0g1NU5mQmZXWGRiZlQzeHYv?=
 =?utf-8?B?bE9yUWRERlAyeGpVSWpSYmUvaW0zZ2dZVjhYRTc4U2lwcUZEV29LdGFJT2NS?=
 =?utf-8?B?STNNWnFBSEhOOHdEbGJUVUFvaXFTUnQ2ZFU4MlhndWE2bmhzRGF5RDNmVHd4?=
 =?utf-8?B?c0xMdWVDODgxeEt4MEFTdFlhWVpudnBXTjg3cEIzVWZMKytJYzJCRFBjb0Nv?=
 =?utf-8?B?Q002akNtSUFCblIxckJMdVhpbW02UHpIbjQ2Y2tRd3ljSWQ5K0xBNDJSMCs5?=
 =?utf-8?B?N2tYelk4dGU2U3BNb1J6cDhTUjZQUjFZeEF5eG1vN2s0YkxDZjZYc2NkQnFS?=
 =?utf-8?B?aHVtOWJONHcvQWpyTEJKdzNQQWtkVFp3RlpTZ0R2QXdodnZYeEJIU1ZPYTRi?=
 =?utf-8?B?eG5NSElEbm15STRjQ0RYN0xheTZYa2N4WWdMYmpXNkZ6ajlrd2VYd3VxT2xh?=
 =?utf-8?B?bXlBSHowOXRrUFlUZkhqaFNjeUcwS09tVW5qQmwzeEwvTDFrWStDT1l4cXpU?=
 =?utf-8?B?Zzk3REk1NjRkODg1aGhnWkU2dDNTcmYraEFqWnV0d3lWTzRzWWVuM0RVd2Nm?=
 =?utf-8?B?M1RzdDMvZUdONVVWdGEzSitiYnp5NWlON2xKWmJOTFFMeHRkRWdxdHYzNzl0?=
 =?utf-8?B?azRmMkhxcVpqV2ZZQVR1NERxMGR3N0tiNXd4R2ZtY2NTYUxYUlE2S0dhSDRj?=
 =?utf-8?B?T1I0bXlSdVNNQW5jVHZrdEU3OTJTSFhySUtjVkJKejA0czl5S2RNQmUxV0Nt?=
 =?utf-8?B?b3FEZ3hPVjBkdmNEM0xzcDc5S2tuOWl3YlRxeTN2VlNsYmZ2a2NSYWp6TG5Y?=
 =?utf-8?B?Q3ZkNUxNbzRmL3NFVThaYXJCS0pmOGxieXE3NFBYZTlvc2ZDeDhtcGZOc1lx?=
 =?utf-8?B?WC9iUVRuS0YzcXZWMTBBUDBCR0huK2x1RUVjTnlVOFRvTXU4QTVxYi90Rm9O?=
 =?utf-8?B?S09LT2tNeEZXdHVoejVXclhsUW9sR3Q1bUtBUUpiWWZHdkMwbnBTV1hVWTdX?=
 =?utf-8?B?amkyM2s0YjRnMVV4cDVsWEVnenpUWGU5dXJIcTRNUzdWalExeTR2L2t4L045?=
 =?utf-8?B?SHpHT1J6YVJiVCtUclFxaHdrSzZIenJsRFpEOHZoT1BmWWNQNWt1UzFQTHZu?=
 =?utf-8?B?WE9hSUtYZUIrN0tQdVlkdE9ZaHM0STl3TUkrQ1RRUjdaUnpwVHNodnZJeStK?=
 =?utf-8?B?OFJGVGpzaWprdjV5YmFiZXoxcjBZUklNaXM5cEg1allsTVdlK21TRUVUdzdJ?=
 =?utf-8?Q?kanc=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:45:01.9128 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c1f4fb-f06d-487f-cd29-08de3e658d81
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7762
X-Proofpoint-GUID: AIaJsCHl95tkrMmJ3HDpxOXv0QNV1AzC
X-Proofpoint-ORIG-GUID: AIaJsCHl95tkrMmJ3HDpxOXv0QNV1AzC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfXzaHT1H64qnCV
 nGNDm3Z2cC4+9NGdJfwJ4PS2nV2OGAjIktuIRr0rQToDTtZ4Iu+6N79O5MGqxqiZCgiw2OVrl4A
 a/leUwDQBMr69ehH84PPHMLdoWgs83PHhJnO1sRQkPPLdf9/+ve0NFzgMgr0swnXCW2wzn6SH/C
 f+4KBHE0PTHs1qsmNzaFKmVjpGJoqlA/LsbOc5sP7ScGbkc/jIVfm7Na07dNed1EKHRjo4xgHS7
 0tymHOnFGKpR6LULccT4TQEJ7jCAmbuN+tnf7nRxXteU1BLlbSYpW5SpGKg6DRyErH7Hmv/S2Pf
 o/mn2OvzSgRNytYh35euuiPJVDYD2LA7sEA63h/mVHW6KC1Dql1zSyifQthsYP3P7AAWmvAYcdf
 CcuFo+TCKNmYfHJfnx4OwEGnTER5Vw==
X-Authority-Analysis: v=2.4 cv=NZfrFmD4 c=1 sm=1 tr=0 ts=69444bbc cx=c_pps
 a=1PHydY8sO1AsXBlMK61GcQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=YRgSJkVlcEML8Aj0wVgA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2510240001 definitions=main-2512180155
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

Overall cleanup done allows to now have the JPEG handling
done in the same way as other formats in continuous mode,
allowing to achieve a faster framerate in all resolutions.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 25e95ba2ca84..4c0f8ed0f87e 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -717,10 +717,6 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	if (dcmi->do_crop)
 		dcmi_set_crop(dcmi);
 
-	/* Enable jpeg capture */
-	if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG)
-		reg_set(dcmi->regs, DCMI_CR, CR_CM);/* Snapshot mode */
-
 	/* Enable dcmi */
 	reg_set(dcmi->regs, DCMI_CR, CR_ENABLE);
 

-- 
2.34.1

