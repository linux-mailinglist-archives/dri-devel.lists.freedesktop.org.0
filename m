Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D830CF8121
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D6B10E4F7;
	Tue,  6 Jan 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="lLQf82Vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92F10E4D8
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:55 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BMtYW1295153; Tue, 6 Jan 2026 12:34:36 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010066.outbound.protection.outlook.com [52.101.84.66])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4besdksahw-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=njIyAjFTTsyWEB6ZLnWYTPqtwiWjDllPfvvuAkp9AmuI12zVU0fVlQpYkJIf788hZgFfRFWIVjAg6sCeggutrngzA/Aw3bHq45YoZ82r4Sq3Js9hr8evS+5Wdcg/uc2kksv3BoNNzu3BvjLC+9HSWTVwbg0olvpnaRySN1K7gEshgrSIAgJV67t1MBcIuLeykotSYj76aCNyAjTkSlOfAMT9GXYfQ5q4Hpc/bIfdnEfurIcCkTvXZgNPNIldy2HFMA6U/YwJCWNKF1+7rRljTn25NUdAUadIZjc/APheh+F4mT8tpocB5sy99C4RqwfCks7da/NpHld0Pk+06CSNyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCVULPQh5bKFkhJGdMdaWx+OsMExu77xGvNO5Z141/M=;
 b=nNo0kFaRsdTxi0eIdNIaeU6/92opWZQqpMotLDhspg/BcuwZYtylTlz2kMiw/yW8HF1NEZsK9CKMJDeAuwi5SVXej0WDROLGTmrw4ylJTG2ayuP2eXFSC5YnnB0Qc/BSAVPrKoix3+DvPBEI2lZuGln8I4sCqPMAGKnyTppY0j97WF0/IYt1gbTaK16Xv/NjDQFwQf92Umx+/0HPJntyhynf0obid7EcXBfg3HtT9CZrwUNMWOWxHSQYXLpQXAQSp0wYG4soUEK0Kg6ia+m4zmsj24LJZxyXdHADAa67mBLMg9eN0f4Zhi7DMwWqgXOCqwx1CBCqnurCyUZb1NdbyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCVULPQh5bKFkhJGdMdaWx+OsMExu77xGvNO5Z141/M=;
 b=lLQf82VkyCYEcE1N5CdFzmxksHLbGyMX4jRQDRUioakZVUHgvuloZ3YlKj46UKDon5baRjAoxnvuzbbiKqL0G7W4J19FFqrHXaQbjS8yQM6N33z5GIQb6+dYH26KAcbcg2pRPJ5d1DM0o+WpCVR+gceDJbFHMZGyGOawILiizZKjVg2uQcvAK+XiTD76nzxwRgUnLRQDspNWsxvAjiPQNfrSGOagNDav9fN/FC69Os8gc7mivPk/0SYPMjVpqqXBAlPoDnwBWTMY8yXXnljtNn/mBWtIJ/4rHmK7tlS89aspnu5eEVkN3XTXNjbgRXZp15mwnpNzdbUSok66j+RBhA==
Received: from DU2PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:10:232::8)
 by DB3PR10MB6785.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:43e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.5; Tue, 6 Jan
 2026 11:34:33 +0000
Received: from DU2PEPF00028D08.eurprd03.prod.outlook.com
 (2603:10a6:10:232:cafe::ce) by DU2PR04CA0063.outlook.office365.com
 (2603:10a6:10:232::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Tue, 6
 Jan 2026 11:34:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D08.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:33 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:46 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:32 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:31 +0100
Subject: [PATCH v2 03/12] media: stm32: dcmi: only create dma descriptor
 once at buf_prepare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-3-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D08:EE_|DB3PR10MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: b0356f7f-dcab-4888-54ef-08de4d179046
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXpuTmtZQ21XTEExM1FlVTNvNmxXK3Eyb211MUNVSE5acUJsTFNJZ05WeVR3?=
 =?utf-8?B?eUsvVGZpN3YxUjNzV0xmQmRxdlRyY0VNeTdXYXpZNVV5Sm13SkFMNG1kYUZ1?=
 =?utf-8?B?Y1cxS2tnRXhrVmRpaWtFTEJFaHdhN1prQmNYY2dncDAzeEdUN0g5NnRtbGRJ?=
 =?utf-8?B?a0Q1ZEF0YjR3MEhWZ0NCdEJaR2FjUEpydWt1elAwUjI0MkVGWmdYTFc4dG1L?=
 =?utf-8?B?T0JlVm5qYXV1VjNyWXl0Q2k1OGVENjZycElVYnlDcWVZQ0ZHNW5rbUtUWWR5?=
 =?utf-8?B?Nkw4VHd2dDBKNU5ySTZHL2JjWlVNRXU1bmY0QUtibmlmS29MdENQTThvd2ZJ?=
 =?utf-8?B?VzRKK2lUMzN6c1BoRkNhTnoxYlJNOUpkcDNPOGJpSXBEMWdpRXRDVkRUajRv?=
 =?utf-8?B?Zk5PQ21sWmNiUUd3VlF1RDVlZ1owT3VYTVhGZDZzU2hyWUVVT1dpMFZETVZK?=
 =?utf-8?B?MGs0aFF2RU9hT1dTNGo0VHU3NmdXUm9wWnhQTSsrMzZBZkNodGxRK2wwaGpk?=
 =?utf-8?B?WGlFN2JwcEhJRk5HcUFPWm5laG04U05GN3YxSVBtS01tdjB6aXQ3UkE2bmlk?=
 =?utf-8?B?YUFOYnhXWC9kWXlDZkRXQU92NG55bUJjak9sK2lFVG9CUmgyV0xDaExsMkcz?=
 =?utf-8?B?MFRvRnVrZ29tc2VQcU85a056clo0M1FoY3hadUQ5dGl5Q0w4RVlTSVJrTDdZ?=
 =?utf-8?B?QlIxRGMwa1RnUjBBblpWcDBWZ2VYenJPcVcyZm9yWThGNzVLWDdQaHIwUFkw?=
 =?utf-8?B?TWhhWnIvcnFUSHNVZ0lxc1orb3Jsckx0d0MxUjBUMHBpZmx5RjBQM0F1WDZQ?=
 =?utf-8?B?Y2JuOGN0Z1hXRWRsUzhaalZiREtVMEMwWEtwbzRLbWgvR1pNQ3JEOHdFVXJX?=
 =?utf-8?B?cG5EOG52NDNBa1RyUUhySUNkL25VUzlaYjBVVm42d0Z4R0VuOEhEeGNMODdu?=
 =?utf-8?B?U3pYak5QMUpya0NkUUJhZGZnMUdncU9zajlscGdTWlFRK0wwcDhLMWYzSERi?=
 =?utf-8?B?R2xneXNYUHVsVjh6ekEvSVZZSDJUby9uWDg4dEl1S1BKY2g3Z01kdWtlUUhm?=
 =?utf-8?B?Um1GS1N2eGtYanR0b09kK3lZaEs4cUhtUmppWTZ3Zmd4VG9rdjJaV25lNVVq?=
 =?utf-8?B?T2U0ekE1OTJteklpU05xaWpQck00UkxRZ1lOVHBOZkdBbG44UzNTL0I4ZWlG?=
 =?utf-8?B?R1hsZ0toMHpEbjRScEFYVm5ZWmt1WWpjZFpBb3BhRWIvREZTVzVKWUJHc21B?=
 =?utf-8?B?Vy9oMEhnRXltdkVxT1podkhyTTN1by9GaHhQNWcrMlNwS3pBa3IvQm5Ma0Vk?=
 =?utf-8?B?dDREampoZmM3TEMwRG8vTThia3Q3dkdTTkFlZ3lOaDlUZ1prZVprTHlHcUJa?=
 =?utf-8?B?SzJPYldTRENGNUZDQ2tFSktWVVU3am5sM1dQYkpWYUJGYXJyTnYxazB3ckRJ?=
 =?utf-8?B?SXVTQXg4UG4raHB0Y3VnYzRsVm5QemFYRTRWOUpiSjJkWE43TmdCMWJma0hB?=
 =?utf-8?B?WDhaRUVhOC84ME1CRVRJbXBhN00zTld1MGQ1MlFjaXFOSVQzTHNmVk1sODFm?=
 =?utf-8?B?RzdSQWc3bXlMOS9DMVlRUUVnTDJmd2xhTVRxYjl6bVRMU2hFbnRRN2N0djNI?=
 =?utf-8?B?Q2RkMEFPdHRLTXF4cGVhZGw2NEszZVBQU21JU2NSNyswS080aGYwSjN3U2FB?=
 =?utf-8?B?eklBNjNiYllDdTZSTFlmSTZQWFp5b3NYNHh0WDZiRUIzWjljNTVIV3lpemg1?=
 =?utf-8?B?MmZrL05IMEJHWk0rdHlzcnRaWExPU3p3U2Z1bk9BR094ZnZ3SDh2VXVrVUNB?=
 =?utf-8?B?bU5NK1ovS3pMYU91Y2t1SmFzNjZ1KzRhMDhTWkhpYm5rTGpwNkxPcHQwZmRW?=
 =?utf-8?B?MlUyYnlCZ0VKaEpwNVAzOXFLZFQ1NFB0aTA4Y0Y1cXJiZkdhNGJjZDBSVlh6?=
 =?utf-8?B?V3czQmtzTmRZSWliR1ZQMi9sOUlaZlA0NEZWSkhoZFhMTkJMOGZQOXRRV2FD?=
 =?utf-8?B?ZW03NG5rTldZdTJpZEZLY1ZTVWU0czBoY3greVBNaEUrdGZDdWVnV2RONlhj?=
 =?utf-8?B?RG1XdWV4aDdkdDlIblZmRGZ2YkZmT3YrMHBVVGxxVDFhM1J6b0lIL21qUVZN?=
 =?utf-8?Q?3jqs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:33.2141 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0356f7f-dcab-4888-54ef-08de4d179046
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D08.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR10MB6785
X-Proofpoint-GUID: EoZzsRh6N403OAM5f_uFfGbFc1tGVp6V
X-Authority-Analysis: v=2.4 cv=Vskuwu2n c=1 sm=1 tr=0 ts=695cf34c cx=c_pps
 a=24dgannMAzgWPct3t72ugg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=21WmIhbeWYpxcd-lmZkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: EoZzsRh6N403OAM5f_uFfGbFc1tGVp6V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX4HBzVGxN2GhG
 MCMCBMj8L8MMQAva7qFSt1PpuVqwGYZoaIXqj/jxE8aqrtQttPoM3kP31qCKlzyy3ws3RsI6rNY
 srardbgs/j8xj4V84tFfc6T3y+ajQZ/GYEG/H7hxomJAMTTp0IrH1f1GgVYBr4GFa5GY6kLecGD
 4fiTRfzMOaX5/hndvtaCKc3mhzlIbrzRADOUll2ALtNqzYdlVEJSLyK3UHpxhU1coCFQhmib3/k
 MYlrjledKxgz5X/SmizNbaUakm5Na5Zy77Zpaak702Srbzw6maZpRuu02fyKHX3FaTXXah7uUd+
 B0/Q0G3i727NJOyCxMq9kGGI/Cd1InE2vGUFvDQIYQHZEaQ3KRWAHZbSzkDIqNuglXg/dgPnZrU
 YrsPREvIms9YUpBVh/Vp+K3/ql0n+7QfqLxplRgc1MspF3wxVEOhbQDjj7RZbdMn/dA1HFn31Rk
 A6eDiLT0H4//zqjGVEg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0
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

Perform the dmaengine prep_slave_sg call within buf_prepare and
mark the descriptor as reusable in order to avoid having to redo
this at every start of the dma.
This also allow to remove the mutex used by the driver to protect
dma descriptors related piece of codes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 78 ++++++++++++++++------------
 1 file changed, 45 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 787c5d778db2..0874974bbad4 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -113,6 +113,7 @@ struct dcmi_buf {
 	struct vb2_v4l2_buffer	vb;
 	bool			prepared;
 	struct sg_table		sgt;
+	struct dma_async_tx_descriptor *dma_desc;
 	size_t			size;
 	struct list_head	list;
 };
@@ -163,9 +164,6 @@ struct stm32_dcmi {
 	int				overrun_count;
 	int				buffers_count;
 
-	/* Ensure DMA operations atomicity */
-	struct mutex			dma_lock;
-
 	struct media_device		mdev;
 	struct media_pad		vid_cap_pad;
 	struct media_pipeline		pipeline;
@@ -300,39 +298,13 @@ static void dcmi_dma_callback(void *param)
 static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
-	struct dma_async_tx_descriptor *desc = NULL;
-
-	/*
-	 * Avoid call of dmaengine_terminate_sync() between
-	 * dmaengine_prep_slave_single() and dmaengine_submit()
-	 * by locking the whole DMA submission sequence
-	 */
-	mutex_lock(&dcmi->dma_lock);
-
-	/* Prepare a DMA transaction */
-	desc = dmaengine_prep_slave_sg(dcmi->dma_chan, buf->sgt.sgl, buf->sgt.nents,
-				       DMA_DEV_TO_MEM,
-				       DMA_PREP_INTERRUPT);
-	if (!desc) {
-		dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_sg failed\n", __func__);
-		mutex_unlock(&dcmi->dma_lock);
-		return -EINVAL;
-	}
-
-	/* Set completion callback routine for notification */
-	desc->callback = dcmi_dma_callback;
-	desc->callback_param = dcmi;
-
 	/* Push current DMA transaction in the pending queue */
-	dcmi->dma_cookie = dmaengine_submit(desc);
+	dcmi->dma_cookie = dmaengine_submit(buf->dma_desc);
 	if (dma_submit_error(dcmi->dma_cookie)) {
 		dev_err(dcmi->dev, "%s: DMA submission failed\n", __func__);
-		mutex_unlock(&dcmi->dma_lock);
 		return -ENXIO;
 	}
 
-	mutex_unlock(&dcmi->dma_lock);
-
 	dma_async_issue_pending(dcmi->dma_chan);
 
 	return 0;
@@ -547,6 +519,31 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 			size -= bytes;
 		}
 
+		/* Prepare a DMA transaction */
+		buf->dma_desc = dmaengine_prep_slave_sg(dcmi->dma_chan,
+							buf->sgt.sgl,
+							buf->sgt.nents,
+							DMA_DEV_TO_MEM,
+							DMA_PREP_INTERRUPT);
+		if (!buf->dma_desc) {
+			dev_err(dcmi->dev, "%s: DMA dmaengine_prep_slave_sg failed\n", __func__);
+			sg_free_table(&buf->sgt);
+			return -EIO;
+		}
+
+		/* Set completion callback routine for notification */
+		buf->dma_desc->callback = dcmi_dma_callback;
+		buf->dma_desc->callback_param = dcmi;
+
+		/* Mark the descriptor as reusable to avoid having to prepare it */
+		ret = dmaengine_desc_set_reuse(buf->dma_desc);
+		if (ret) {
+			dev_err(dcmi->dev, "%s: DMA dmaengine_desc_set_reuse failed\n", __func__);
+			dmaengine_desc_free(buf->dma_desc);
+			sg_free_table(&buf->sgt);
+			return -EIO;
+		}
+
 		buf->prepared = true;
 
 		vb2_set_plane_payload(&buf->vb.vb2_buf, 0, buf->size);
@@ -555,6 +552,23 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
+static void dcmi_buf_cleanup(struct vb2_buffer *vb)
+{
+	struct stm32_dcmi *dcmi =  vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+	struct dcmi_buf *buf = container_of(vbuf, struct dcmi_buf, vb);
+	int ret;
+
+	if (!buf->prepared)
+		return;
+
+	ret = dmaengine_desc_free(buf->dma_desc);
+	if (ret)
+		dev_err(dcmi->dev, "%s: Failed to free the mdma descriptor (0x%x)\n",
+			__func__, ret);
+	sg_free_table(&buf->sgt);
+}
+
 static void dcmi_buf_queue(struct vb2_buffer *vb)
 {
 	struct stm32_dcmi *dcmi =  vb2_get_drv_priv(vb->vb2_queue);
@@ -859,9 +873,7 @@ static void dcmi_stop_streaming(struct vb2_queue *vq)
 	spin_unlock_irq(&dcmi->irqlock);
 
 	/* Stop all pending DMA operations */
-	mutex_lock(&dcmi->dma_lock);
 	dmaengine_terminate_sync(dcmi->dma_chan);
-	mutex_unlock(&dcmi->dma_lock);
 
 	pm_runtime_put(dcmi->dev);
 
@@ -878,6 +890,7 @@ static const struct vb2_ops dcmi_video_qops = {
 	.queue_setup		= dcmi_queue_setup,
 	.buf_init		= dcmi_buf_init,
 	.buf_prepare		= dcmi_buf_prepare,
+	.buf_cleanup		= dcmi_buf_cleanup,
 	.buf_queue		= dcmi_buf_queue,
 	.start_streaming	= dcmi_start_streaming,
 	.stop_streaming		= dcmi_stop_streaming,
@@ -1953,7 +1966,6 @@ static int dcmi_probe(struct platform_device *pdev)
 
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
-	mutex_init(&dcmi->dma_lock);
 	init_completion(&dcmi->complete);
 	INIT_LIST_HEAD(&dcmi->buffers);
 

-- 
2.34.1

