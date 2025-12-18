Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BCBCCD38B
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:45:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436B810EA03;
	Thu, 18 Dec 2025 18:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="OmAtjF2V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF9BD10EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:45:11 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIEO9I2482379; Thu, 18 Dec 2025 19:45:00 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4esu269f-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GOxTLdbOGYeNyV5B1MHSCV77tJLLMThCKltXiJ555z8dPXu8LOR2VprEqDA4SE6eLWz8n4vZOAvh7zFOQe40W17Eymh67Jf2dTMvSRnf2y6JUILYpGN0/92lrUvRk1z5DGCTxEcIR9Ga3qs5Ssxl6M2DHfXm/SS436wBSG3010VYjIzj29hm9FPSlG18hnX2u6n4FGMiYV6gBTRrcyhIK2pudfMCx9Sha2F4zelnrs/gPGTwoKEotMPpP8IKJc/mzGLa/EYpnBkl/jf2Da6oQKSbmLjEo+IK2gSrSoMlvKGTLwhpw4ukPVGRC6FPkGbQz1LJmagDMHTqXrKnTd3FQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NUhMorOpZudwnimphd9TFfMmgy83L9UMNw6qeS3v8dY=;
 b=iMLcMZAlBQ+tsNI0GjwO71zwNy5Zjd9hbX6AHP8Dd9+SYOQpflJxgFUivbx9eJOxxWQz1lbviqvj7QUjZBeLaQr5N7cE7mInXjUtOil4kDvS/4f9Wtle+q0TjZigKrLKQHvYzyamVBgGR6TA4Phk6mGje6fjUuYmWqnmUeKoh7shf8bU8kWIA1CAgIU7WKH9gyqPkn/47r02ZzGQqksd5fDj0CwQgUobwuVn4/ENWAG1XwDy84WeJmmXaNzl5GD3e/MBdUaLj/GvKGT3/9LP4sC9ytiqX0d3GLs8XjjT/hwBqk3P6ZpskTo/Y5hxusv2HkMM0G7V695WAE/wRasSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUhMorOpZudwnimphd9TFfMmgy83L9UMNw6qeS3v8dY=;
 b=OmAtjF2VQDaCR7EIm3RQ+ksrRcBT7MpMBAExpgfqtwM7PZeO4x7l5iQzSywMTjG928B9weIMmw7Lf0DRXbb2c2lrpFa6OT96g2cVV863T9SVJwuRky7FnyG9HaDgIXya5Vjfo87dJfGvQPQ5A6bO8iqDh+bLRre50pyCTBQYOqQglcqU4rr0vH2etQ4I4QRVdWHuVgRHjN2DupbNXK/7eg4LQpEGrMU1N1SopdUvoLdJatvzWNXB4+KU9yaTmZF+UD/CdAQGlMzYtWIbeLv7v5DF2ey/2msaxYJ7Ev15gq511s8RE04LH03dPsVGHIa15gqIUO070cUanxHgB6v8GQ==
Received: from DUZPR01CA0310.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::10) by PA1PR10MB8896.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:445::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:44:56 +0000
Received: from DB5PEPF00014B8B.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::4) by DUZPR01CA0310.outlook.office365.com
 (2603:10a6:10:4ba::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:45:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8B.mail.protection.outlook.com (10.167.8.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:55 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:44 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:55 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:45 +0100
Subject: [PATCH 05/12] media: stm32: dcmi: rework spin_lock calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-5-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8B:EE_|PA1PR10MB8896:EE_
X-MS-Office365-Filtering-Correlation-Id: c4056c8a-d4a0-4e79-3c28-08de3e6589de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlpzeUw3b3pVNFJDa2tEbUdjWWw4NW9xaUsyeWxBRERTNk9OcnNQUng1bEZk?=
 =?utf-8?B?bmZ3bDJSWnF0cU04YzBrM01hb0lwcXRSRHU3aUZtVk05WWRCQVFhbDBQZTdW?=
 =?utf-8?B?WGw1U3l6eVJUZndCNFB4ZnNMOVc2VjF0b3hrbU5YSXZlZEFpYkF0Z0RmNWFo?=
 =?utf-8?B?ZjF5bDdublNzazJMZzZYM2tYYnB3S3FLNDNkNTJ4czY0TWxHSGhiS2o4Y01a?=
 =?utf-8?B?N2RoUmhaTFQ5bHRac3N1ZXNEVitVbXBVZ0pyT3dOdlNaV1NEOGF5VytNeVdx?=
 =?utf-8?B?dHhvWjdlK0pWa29LMkZNaGJXWll2QXlNNkFReXFnREJiZE9IU1h0aWZuUmdu?=
 =?utf-8?B?S3M1NFRVVTBMYmJUMUdRcytiRU10VEx1bEtsMkxqa0wrZTQvUzRtWHZpc0ht?=
 =?utf-8?B?Q05RVmhnNlZ6N3pZWnhycGRBeTlTbmU1cTZHSGthVjlOWFN5dkI3TG1aSE5Y?=
 =?utf-8?B?L2ZqMzl1Qi9CVjUrbnBzWTdZdU40TDdlMFVaUFhiRkdNb3Y5eGtzYlZQLy9u?=
 =?utf-8?B?aFE0V0ExWk01VmNIK2daTlAxci9VdjhNWWJGNUUxNGJkRnJVSHBkMDcrNTRq?=
 =?utf-8?B?cmFFUS9vcExFdEdUaFR0RDd2YnozaVdNa3ZxdVZCMnAzVzZlTTJabng0MFQ1?=
 =?utf-8?B?YkZiUXBqeGFmM3ZpN3VMdHFiU1MvQ2RxbmZJcExDV2ZFY011TnZTS3hXWVBs?=
 =?utf-8?B?bFlqdkZkUElCZ0dkbnAyMmV6U2d5WE4xV3hWOFBnOGlnSllCVkhKTWFkWlRh?=
 =?utf-8?B?SWc2blZXYzRSN2p5RGRORFM5VGdvL0VOb3I1NTZYU2RsRXRpdTBBc1cwZ000?=
 =?utf-8?B?WTg5a3RWY0lpdEpkcitYcmVXZjNNMGhwNndGNnVLcFZ6UlNhRUpWV3JkMzl1?=
 =?utf-8?B?N3pWTXNWVmlVNXNvTDVrdGtuaC9iV3BLcUxVNEcwaW9UUXEwOEozeE9tNFdt?=
 =?utf-8?B?TG9NcnV0OWNJaXhyWENTbVdBNThMMi9qdStMQVNJT01ieXBpdkpvMDk1NWdu?=
 =?utf-8?B?NnBKMCtuV1BxSUE4OFRjQk82SU1BdS9EQ1puYlZnRU01OHZ0UGRxRjUrMHhy?=
 =?utf-8?B?amV4WDFpQVhzT2c3RkVWZFljdXppWkdkazBkQ2YvYmo3T29rMUJTRkJpc0ha?=
 =?utf-8?B?cHlJZFk0RGtVR21BSXp5eFdWZ1lYUk1sMDVjOHVOZXRJMm4wNHl2T0E5OG9Z?=
 =?utf-8?B?VGNmc3hsdlJvMmVJdHJnU1pHOTdocGp4eG1KbDI2dWxCQlUwaWp4dERrTks1?=
 =?utf-8?B?VTFTUmphK0V0YzBuMHJKdGQ4NUtXcENMU0N2OVZlLzM4NXpVbCsxR05RVDVE?=
 =?utf-8?B?WWtpV2gvcTl3Qm55NU04eGI3UGFxVWl3SHdSN3h3MGJVM09hNndCZEVacmt6?=
 =?utf-8?B?K052M2JxUXRRbW9uS3doK3hjanMxVXU4VU1HTDJZL3I1U3VSVW5vZU5jOENa?=
 =?utf-8?B?bExmODVNdlMrb2M0VjY3WVI5Nld5SDhtblE5c1NLcU9HeGtvcytTY0JvV3pI?=
 =?utf-8?B?a3l5bGNRMzFzdGxHNHcxVW96VGcwWVdvTm53S3JVVU9LbXpZRU9QcEltSXdn?=
 =?utf-8?B?Ym9uV1c1OXVFd0dtb0pseFdUNjA2NUpTK24zUUJCZitQWnZ4ZVRNcGYxZlRh?=
 =?utf-8?B?MURwVUFwODc3MTVuSC83RUFJS0R3M2VlelZsVklkMjgxNlZ6YWJER2YvUlRp?=
 =?utf-8?B?NVNPM2o0QUFGTTF5MzlXZXFCMkdGMkhCQ21ud0N4S1N3R2NDTkluQ29vRGU2?=
 =?utf-8?B?UCtpZ3lyKzc1c3ZWTnNnNnJxaFJHL2FVMFhjNlI1QXYvN3N5djE0dXhIellW?=
 =?utf-8?B?b1FhOUFISHIrdURudmhMbS9pQUg2ZEI5aEFBWDhKVkl6YlB4UDg3ZFkzT0dD?=
 =?utf-8?B?Qlp1K3dXTmkvMkc2amx6aTZFY2F4ck9vWUI1NVIyeGp1emFRdmcxQmFyb1ZS?=
 =?utf-8?B?bGNpUHMwalBwblROYkdueFBmeHlJRG11UUFnenFFeXlLa21NdWJBbXpuVEZr?=
 =?utf-8?B?NXUvZGhWOTM3TUx0bDg5NXFUQk41QlFPeGcyLzRramxQNHNWVmNTcnlZdWZk?=
 =?utf-8?B?MHEwM2hkWVNHVUNsMHpMdyt6T0JlQjZaMC9kM2xWMUtCRS94dTd5dnpnNWNi?=
 =?utf-8?Q?H1Dw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:55.7806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4056c8a-d4a0-4e79-3c28-08de3e6589de
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB8896
X-Proofpoint-ORIG-GUID: 8qyDEvpxQgdExTz-UyfDJldFeS-ugzg9
X-Authority-Analysis: v=2.4 cv=EeLFgfmC c=1 sm=1 tr=0 ts=69444bac cx=c_pps
 a=VQBOJv1rf+3hTjaUELvlmg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Hb1iwsRhEjJoBOvffS4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX6aPtVD2MNScX
 1AYW3LDB/epkR/bg/Nuxx7veodmo3yRqtNSaA1kfXPD5qBE76lq0MRe7rvnvoa4kxPoG7s+uwal
 dqKb/YCdt+nts8gSkrSasAIcnA4z8XxKuL18sHxYXP64ICTPpjtmDkLBAJdKMq0D6iwDoR6Y+sE
 7hSRD5K6zLM36KhppjiZqJqp9xiYQoTm3vJRHjbEaNWIjGiaTN8Zb5cugB/DOjuq2VD4psVO4kW
 LogW8VOhAGBskgglvQiUoc84Q4cF3Tb7WBBRkYVTW3VpCMTFWSFqL/gvXD2+BbU/MhyKFrRXWac
 eEJSNnhhLIN6sPtso3nKxZ9Jlymj5d9DCpaGUoDD+tQ54ZM0UV7JEpH5WLfXM7vrBxxn2p4qZXr
 KFW6u3Y9m1sNqquAW7G8x67YXnFRsQ==
X-Proofpoint-GUID: 8qyDEvpxQgdExTz-UyfDJldFeS-ugzg9
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

Rework of the spin_lock calls in preparation of the rework
of the data handling of the driver. Keep it straight forward
with basically spin_lock protection around everything except
dmaengine calls that might sleep (ex: synchronize / terminate)

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index fa33acc34eab..1015f2d88f54 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -227,25 +227,18 @@ static int dcmi_restart_capture(struct stm32_dcmi *dcmi)
 {
 	struct dcmi_buf *buf;
 
-	spin_lock_irq(&dcmi->irqlock);
-
-	if (dcmi->state != RUNNING) {
-		spin_unlock_irq(&dcmi->irqlock);
+	if (dcmi->state != RUNNING)
 		return -EINVAL;
-	}
 
 	/* Restart a new DMA transfer with next buffer */
 	if (list_empty(&dcmi->buffers)) {
 		dev_dbg(dcmi->dev, "Capture restart is deferred to next buffer queueing\n");
 		dcmi->state = WAIT_FOR_BUFFER;
-		spin_unlock_irq(&dcmi->irqlock);
 		return 0;
 	}
 	buf = list_entry(dcmi->buffers.next, struct dcmi_buf, list);
 	dcmi->active = buf;
 
-	spin_unlock_irq(&dcmi->irqlock);
-
 	return dcmi_start_capture(dcmi, buf);
 }
 
@@ -370,8 +363,10 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 	 * buffer payload.
 	 */
 
+	spin_unlock_irq(&dcmi->irqlock);
 	/* Drain DMA */
 	dmaengine_synchronize(dcmi->dma_chan);
+	spin_lock_irq(&dcmi->irqlock);
 
 	/* Get DMA residue to get JPEG size */
 	status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
@@ -386,8 +381,10 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 		dcmi_buffer_done(dcmi, buf, 0, -EIO);
 	}
 
+	spin_unlock_irq(&dcmi->irqlock);
 	/* Abort DMA operation */
 	dmaengine_terminate_sync(dcmi->dma_chan);
+	spin_lock_irq(&dcmi->irqlock);
 
 	/* Restart capture */
 	if (dcmi_restart_capture(dcmi))
@@ -413,8 +410,10 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 		spin_unlock_irq(&dcmi->irqlock);
 		dmaengine_terminate_sync(dcmi->dma_chan);
 
+		spin_lock_irq(&dcmi->irqlock);
 		if (dcmi_restart_capture(dcmi))
 			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
+		spin_unlock_irq(&dcmi->irqlock);
 
 		return IRQ_HANDLED;
 	}
@@ -424,8 +423,8 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 	if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG &&
 	    dcmi->misr & IT_FRAME) {
 		/* JPEG received */
-		spin_unlock_irq(&dcmi->irqlock);
 		dcmi_process_jpeg(dcmi);
+		spin_unlock_irq(&dcmi->irqlock);
 		return IRQ_HANDLED;
 	}
 
@@ -599,11 +598,9 @@ static void dcmi_buf_queue(struct vb2_buffer *vb)
 		dev_dbg(dcmi->dev, "Starting capture on buffer[%d] queued\n",
 			buf->vb.vb2_buf.index);
 
-		spin_unlock_irq(&dcmi->irqlock);
 		if (dcmi_start_capture(dcmi, buf))
 			dev_err(dcmi->dev, "%s: Cannot restart capture on overflow or error\n",
 				__func__);
-		return;
 	}
 
 	spin_unlock_irq(&dcmi->irqlock);
@@ -812,11 +809,11 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	dev_dbg(dcmi->dev, "Start streaming, starting capture\n");
 
-	spin_unlock_irq(&dcmi->irqlock);
 	ret = dcmi_start_capture(dcmi, buf);
 	if (ret) {
 		dev_err(dcmi->dev, "%s: Start streaming failed, cannot start capture\n",
 			__func__);
+		spin_unlock_irq(&dcmi->irqlock);
 		goto err_pipeline_stop;
 	}
 
@@ -826,6 +823,8 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	else
 		reg_set(dcmi->regs, DCMI_IER, IT_OVR | IT_ERR);
 
+	spin_unlock_irq(&dcmi->irqlock);
+
 	return 0;
 
 err_pipeline_stop:

-- 
2.34.1

