Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC11CCD4EB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9937B10EAB5;
	Thu, 18 Dec 2025 19:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="gR7Y+PJj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2366510EAC6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:00:22 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BII5SR03357073; Thu, 18 Dec 2025 19:44:58 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4mg6rm87-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:44:57 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqCXPCd5mGb8Ktgxd3sliDl0XnefZBsiuqq0bTIADFrln65iSEtmdgFaU27nHPWDhM/6AuvQoT4PhOEyX3XQ006zlQUvI5ytHWHvyHbiZiAY/13RiDkhXCo0b3rxXfEHM0Taiu0iq3pFy1o4Wfms2q4ACYlL+xG6fi+QkdIPjJwf0axBrFODVjDbIiXc7X7Qh2r4Wpq9ErCZTtjuxCMLqyBwhnBIGzgeywv9fca9Va0Qovxzoa/TgwH5XFNVifHoSbqRRHMfb/YCmUPWvvXCBlVX4HqMe3gvYzktdKahVwiq3kfqvDqbdHj9cxH7D5pBQG7N1Cq0PsipH42WpBm3jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TM4Tz9u9RNlHE5XWng+8LCPzhSpL+neKVILp5hLzoS4=;
 b=FcTsPDZFHjLlHzVn9PKdMmW8v5LmPo60o757Y21HNZNoNZL4EBjRs6YmxFgpR10XcCLsIJ3Hljoz4iWLGQ/EbdUlMVw4dTNMqfhkVqXfqGith+pZJpmWAMQMTba2ir+fOLNQkyAcOjYbf1YhhVQj0tw98vIo2KO9aXQygAOqdwYbEw+Tb+5Zdn/FUz+QfdRN8SIHMmzXjiAVTR5hN3L3pwLv0nq4fTj1Od7+3L5t+LT4x3NImGW0mhOxf/uSdW25vqSF6SRuns4eloNQoE+5tDpL6aw3zcU7dyg73wGdJoibusm5AAfk84B5W25o0jyGtAzt6pVdVZz76qvLFuksHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TM4Tz9u9RNlHE5XWng+8LCPzhSpL+neKVILp5hLzoS4=;
 b=gR7Y+PJjXSaskzBnw+9saXJG0ZUDNa+jgr5m7+E/uh4Pw1aSLNyFtlSm5YEXwY2Ca7iaXFZ0SWwBQsPiN1hI6fE9up3/3f0ChTxDhpdpMbjqbT4eIBd/kNNpL973+UICtzEQa6QLWzyYpH84Ldinqiob9CirN8dZ70lZTp/+e9WlCV+sd6mioxDwqrcmtZYQ5AJIgGZyFiucwaz+FDUtq2XLd00To1SBtVK18lVkff+uxHyQHORMuR5ywkmXUaqx/w/SmuQ4jnKJ/Xy7MahwQDjsVtNbPsSer1SNiqLwomyVdt284wUPC+nzXJ3Bm5HMIMuKNxi5vonwmL5FYAzWzQ==
Received: from DB9PR01CA0026.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::31) by AS2PR10MB6686.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:55d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:44:54 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:1d8:cafe::84) by DB9PR01CA0026.outlook.office365.com
 (2603:10a6:10:1d8::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:44:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:42 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:53 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:43 +0100
Subject: [PATCH 03/12] media: stm32: dcmi: only create dma descriptor once
 at buf_prepare
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-3-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AS2PR10MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: 20610976-a3ef-4b53-9e5f-08de3e658907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJCYXJiT1ZzZ0xhYWRIS1Z1TFNUQXRzSVlPRGlhZFE5dVJQeDErSkprUUdp?=
 =?utf-8?B?d1AxOHVaVWRLV1hGeXA1RzN5OUR2a1hPQmcrUEFwcGdXcDhmdlo1U3VONk5L?=
 =?utf-8?B?S1g0ekk4cUFRR2JuUER1R3loQXdBV0ZkU0pHU2lScU5WeGR4UHJxVWJLRSs5?=
 =?utf-8?B?R0J4eTZiMmNzOU9wYWJBZm5QYzh6OWErbUZGN1VwanNCbmZBSnZHT0hOY3Nj?=
 =?utf-8?B?SVJKSTRZRktnYVVjRkVlTnJKSjRZOXJxOTVQT2RlSHVTSDJXR2Z2VklCZkFE?=
 =?utf-8?B?ZkFkamQyT0NPRXRVazB5TDFCZjVIVERzbUlEamtzaFlOejV4aURsbDExeDdl?=
 =?utf-8?B?NElBM2poTC9qZ0JHVUdOL2hGTjRrZTdpSG9lK1VQNThCbG5aVmZtS3o3ZlJm?=
 =?utf-8?B?ODhHc2ZnMUlhY21YT29XWlZBZStNQmxadmo5YThxZk4wa1l1em5yZjVDSG5o?=
 =?utf-8?B?UGE0bXY0MEtoRW4rdmEycVU5YjNNOTVXUklWbDYvZnhsakx2UnkwUk42Z0pq?=
 =?utf-8?B?NEpnV0N3UWJES0JaTG5rZEVjRTlkcjB5OHk1SGJkTVlXR3VOSmNMdWpDd3pN?=
 =?utf-8?B?dkdQeUxLUmIyVXJMYlUzd29aRllOeWhUM3pHejQ5bktkQlZlZGZkd1JKcmRI?=
 =?utf-8?B?aEdraWczMzBJUThPTVM0eDk3VEF5NkdDZkhmNmsyYm14OU5xT1VXdVhYcVlS?=
 =?utf-8?B?MTdEUGNkRFBRbmliOWwwQi9yQWVuTTd4MWkzV1R5RllBNFdRdCsvOEFoZFlK?=
 =?utf-8?B?VzJPamdZUkdRSlRIdVQvRSt0d2cvbHJpUnhwR0hRaVJHZ3ZTcUVCUWxjMHlJ?=
 =?utf-8?B?K2F2OTZhVmJnR0ZDT1Y4SmthdHNkZXdwMUt1UnJGd3dGaGorSmdzSHBiK2ps?=
 =?utf-8?B?UVdQWVhZWXVSVXVaSEZtU080N0hkNDZ2WTh4eFl1dTF6cTE4Q2VlbE9MYWlT?=
 =?utf-8?B?aGNjZWNKNjQxUFBZd2JTM1d6NDlrRm1DWkE4R0ZPeXF2aFIvVlhSVDJIa0VG?=
 =?utf-8?B?blRmUE9tamNBaUJMZXhuZ211b25yYTZWQjNiOUxxVzdseC92ZFhrYXVjclE2?=
 =?utf-8?B?SXNtaFhGK1Y1eVFhenBiUkFMWjVpN0UxaFVZYkJ2UE1lTkkyLzEyem91K2dj?=
 =?utf-8?B?dnRDbURRalBtZjllL2JTZ2VoY2h6aDFDeDJqWVVKZWRMbElHY0Z3MUluRWtZ?=
 =?utf-8?B?V2F1cnJCaFJxRnM2cVNxd2hCV21hWXE3WUU5aDZqMVpHc3owQWU2WjBaSlVi?=
 =?utf-8?B?TjEweXNQdkdXeExoZ3dIUmRyZTgrekdpSThWKzB6SWJGZnM3RXBDRlRkWVJ2?=
 =?utf-8?B?bFVoNmlOTjFibzRvaHVJdG9xbXd5ZlhONDM5Q2dLcEdldlhvVXNrVHE0enZR?=
 =?utf-8?B?a3pWd0hveVJXWFgvTlhJNXJUUk1CQ2RmbW5SK0V1TnZ2cjhMY20zUHl6Y3Jz?=
 =?utf-8?B?RXl1RzJiNHR1N3FrNEhINHk3WE12VlpsRW1CMUloOUJQLytadnZJWjl0S0lO?=
 =?utf-8?B?aWpyZTJHcWZDYXVsYzRwWWM3NDRXVnhIaGxjTUNtM3kvc1RGL1B1SWN4Y2x5?=
 =?utf-8?B?WDU1TzNGZlFjMDhYNHFhNVBoanNDR3RoYUdQMEZuQTRzL0MxYzFOZ1RvT3g4?=
 =?utf-8?B?UWNWNmpvOUNoSnZVZXpNV3lYVk41dzJ3SEJlV3l3UEI2cTllTTU1dHB1M3RG?=
 =?utf-8?B?SDE4eXhtZFZkQTlJS1JTaUtPdjhtNHhZUHRKcEFuVHJsbm8xWEt4bXhFQUJZ?=
 =?utf-8?B?b0JQS05wTEhzeS9yN0EyZVYxU0ZocXV0eTBQdis2RDhEK1J5V1VxVEJYVUtB?=
 =?utf-8?B?NXNTczlkVlorb2c1QzNyMDhMUXlkYXpaMHJzY09FLzdMckFMTDFVZkRLWHlw?=
 =?utf-8?B?aGRCWDdHRWxMZHlIVENNQUxQaXJIcHVxVm1QRDF4enZBZXpqK3UwUGZnb0RM?=
 =?utf-8?B?NFV4bkMvUW9NVmhCOCt5dXdGWWUyRGFTa3FpL1NCVmNsNlR1dWF4SzYzY2dK?=
 =?utf-8?B?R2dkY2JLMm1MMURMME1uOXBJNVRQVlVhN0xVZkh4cFcxaUJXT0ZicWhXREtQ?=
 =?utf-8?B?cEtMQTNibzVFbTNRK3N3dmdDSnJTZk50dkgvd2xZMm5xbGVoU1AxbWo1c1lC?=
 =?utf-8?Q?y/QM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:54.3601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20610976-a3ef-4b53-9e5f-08de3e658907
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6686
X-Proofpoint-ORIG-GUID: TSpN2TMinF0euTiZM0gVdg486YEm0dfp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfXzHNPfO4M2bZy
 gGyZa2/zNXhKoOLy4EkucCyZHSmeog9+3a/L/rnzeksr97FjBiwrm+CL2OOyVzAANBd2KjqKb8b
 KtKYi+mgEGUOZ8m9+v8ej6QEkH+cFPIS20cStxIVLAmPH/r5vdldBOLp8vuhXbnwOaVJJYDEcnY
 KrgAWgh0j8s6IIb3zuD3QsWJEgUxKXHqAuW8mc5nMv2DfOhTmJxTv7LbxTFxO2j/s3WxXvjlHF+
 zE28zTe+aFe6+JRD8cqcYIIOPmVNHVe/MXXRm2wdcZKAmq4o86Ib9YE7ZLnk21VTwwgBgvUXFdL
 kuppPANMybaMSxWJhmtZg4be17Yo81X/twfKJEUUAECWSTx5K3ck43nuMb5HxDTrDesYMyRx7+P
 dzaXA2l9FZu+jsI7F5ekJkk0j4HwXw==
X-Proofpoint-GUID: TSpN2TMinF0euTiZM0gVdg486YEm0dfp
X-Authority-Analysis: v=2.4 cv=PteergM3 c=1 sm=1 tr=0 ts=69444ba9 cx=c_pps
 a=WBV7RGSj+lgSRdG7tN2obA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=21WmIhbeWYpxcd-lmZkA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
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
index 27b283474096..d8ef06bd7506 100644
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

