Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE0CCD4BD
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C4DC10E954;
	Thu, 18 Dec 2025 18:58:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="RARgVzGB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A3D10E954
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:58:40 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIZMuw3409312; Thu, 18 Dec 2025 19:44:57 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011011.outbound.protection.outlook.com
 [40.107.130.11])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4mg6rm85-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:44:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JKl9d2h4bCId6wHD5HIwmkd+hTMwC1eu+iuCDTM15bTAnFf6fsvMiARYpXWGBX5Zp/jpNw2BBKHK0bxlsww9ik5utMN/TZ8tWkvw8ziEYoouNAfDh6U9+eW5dfBm5kl58Aaq88RZB4ipAwJu7sY2yJ974bWe4ofr8XnK2Y+Dx6ObyPYEtk59Rako3cjnwh//HckGXpA3jtjnJIDoblfFTYWXwvdCF00DcJYNXxVtdtATIcHzCrAeOLRvmGMRhO4DmirMV6hzDgBs/DDeA/H3DHCJqvAN67raIHL4Td2CH4/fJfndC/0gyK4r08CluRSijSlyv6ZmV/5rDhNs5V6tZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f10oU54HXOe95fUz6M9HEbyC1yC8wGptZeh+Me95Fs8=;
 b=EzJIT17HPe9H+tMxA0Da2XSXlxdEngisTtX22n+5O/e9UD6hSUevvfwALpAWn48cgwPjzIcbHGkYTDSzQJsXk8dM3aNbJTz+lGQclVi5t9eK+QxL2uciG05YPpG4jjj6LFZFwDprAn4xMpGBd3OfhirEHhYpO0OziaMIv/LdJ/E2EmHtOF2fuEPZ3/mYnJO3W9MF+aiz/8TEBSoIn+BUmndYvLXUaTLFSkuxEmgPSCQKJcbwhMdsQqi5I3Dg/h07/4dDIGryI9aj1/ulx7i9DthEkL475m8M0LFIx8rBguUP2q6FTnLpvWP1RkkPWEmoN5+Nl0pd6P16uuH6aOPOCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f10oU54HXOe95fUz6M9HEbyC1yC8wGptZeh+Me95Fs8=;
 b=RARgVzGBHdrxxn5Ko4iwYQCzAuykHnlChKKEAs9vnyOJpIu0zUlqzjFn52iKM/RAo1hxdnWjwAzwnCDIvivibhfqQasRibDRNcTgapEDwR7Xzrtd5c3C49TpbrVu8ux95GRonU27swyyzXT1SOOQe3YsG3wiGJq6AN/vM91LVAAJBJiTooUQ/EwtZyflSK1m97zwIBvCjA5TI7lGkeWkHAAGv/HuQab+YXiQv0AEscUqtuaQecEC7ZQIPJkBWAQUGSublne+sPfdkTIxPtBP/f/qbw7IqpLYInDmzZfJ5HRpunkcKD4SEfMdmU9nWdjgNbDzx2Mpr5Un/UAvsYUJcQ==
Received: from CWLP123CA0186.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::15)
 by PRAPR10MB5348.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:29b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:44:52 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::b9) by CWLP123CA0186.outlook.office365.com
 (2603:10a6:400:19b::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:44:48 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:37 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:51 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:41 +0100
Subject: [PATCH 01/12] media: stm32: dcmi: Switch from __maybe_unused to
 pm_sleep_ptr()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-1-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|PRAPR10MB5348:EE_
X-MS-Office365-Filtering-Correlation-Id: 96da4194-13ad-43d0-13a8-08de3e6587a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVBMbjZ4dkRnOVVWNCtFZHhHTHltTWgzNmNSc1pKMlZlRy9rWCtuQ2daMjRu?=
 =?utf-8?B?a2V0c2l4WjROUHJjREZvVWZrank3N3dxVXZ1ZUpScmxabU9hREVQa1RkQS9B?=
 =?utf-8?B?MG9DblF1R3Q4ajF2Z21mMWVPeGc2SEJxSGpNQ2Fnajc3SjhmQnpHODcvSWox?=
 =?utf-8?B?Z09lQlZyWWJpcUU4WHljOUJPMU1PZzNXTm5aYTZKRlo1ZlRFcXZGOVFGME5l?=
 =?utf-8?B?eFNMMklRVFVDWVA3b2NJenI1WGtxU3lWMmFWTUYzZDkyWEwxSkZyZTU0QkVm?=
 =?utf-8?B?bytwMFY2a3dUeTRyVXNjc0M2Q204NzBMdk44ZkxLM1BhUDdFMlJuTFRwTjVP?=
 =?utf-8?B?dGdsc3ZNMm1FeXRGaUp4VjY5eTlKcmRCY2IvYlpEY3BNT2svVnZ0c3N6K3VW?=
 =?utf-8?B?dFhhQ3pmRVM3T2JQOUtjVmNjNTlCa3ZrcjJ4cU83TWl3R3NMMzR2T0lpbkVT?=
 =?utf-8?B?djFRaHNXTkJkNE5HME9mUXB2S2xrdmdIdk9uTHUzK3BoTWVuY0NvRUsvazFr?=
 =?utf-8?B?aTFPQVFJR3ZqNEpSVFZLL0dDRGtLZWFGZXFyczc2YWVDOGNzR1JCY3EvWFJC?=
 =?utf-8?B?NmlGQ3pNMXZWUUJyV0d5NE5NSTRLd1pQdmd4cmhPbnVrM3JmWTAwVXludGln?=
 =?utf-8?B?V1M0dVhTcisvYnBhaWpBVDFNdzVkdjdWMHk2WjFtVGRobmprM0xCOEVQSmIw?=
 =?utf-8?B?M0FoR2lYNWxwbjczUnRTUWhqaVVNR2x1SThCaXRFck5EYTNVTytGbHhqeTJU?=
 =?utf-8?B?NEpuL1prQTNsZWxDR2pVRVZiVVB0V2haaEdZMGJDZzl6MUlIMEZmSWZ5K2E5?=
 =?utf-8?B?aTA0dVZNUS9WSDVnckFieFVNY0FMcTkydW8xM240R2lSY1ZQSkU4MjhOUGhv?=
 =?utf-8?B?akorT25IVlY2Mkp3WE1VZlZDY2hGekxXa1lJTWk4OUJ5dHBBb3d1RHVxczd5?=
 =?utf-8?B?MlZyY01Ha3FFSGJJUW9kY0ZUYXRkNUU2VE51SDJQQWxlY0VIbWdGeWROV3ZD?=
 =?utf-8?B?MnFiY0JmN2pZR1NnS1gyMC9hYUlncFRNK3VhekE4R1piRmJteDY0bXpuUkpO?=
 =?utf-8?B?UjJwRnh5T2dDbm43aE1Bd0E4bXpXMHZvSmpiWEh1VDR1ajc0Z3lCV2Z0djBh?=
 =?utf-8?B?dFJ1N2ZVaDdxYVNvRXpWQjBNbXNhYmdydnBHc0FpeENoV0xxRTRUM3VRbjlr?=
 =?utf-8?B?Y3ZQelFMMmtUdjM3djBFQUhDYWM4WEpmYkp5Z3hFcFJJK25GTTFoNzZKWlhC?=
 =?utf-8?B?QTBrWWFsQlM0YmIrWHkxNm5MVlJDSFRuK2JJRzQrRjFOeHR0aVhHYkx1M01I?=
 =?utf-8?B?dDlVODYrK0xrOFdsVFdkOWV3WjBtaG5IajRQNHEwdUtsUWNScmtPTExNT3Zq?=
 =?utf-8?B?elJGU1VTOUJCbWJRNzVMNmJEWFgybXhrTHl4N2wxKzIzMzZ6SzRCMVhIOTRR?=
 =?utf-8?B?S3ErcWpINUJTblhSaWU4UUlWcEUxMlpkQktLU2JzdjF1S1VWeVhwNWRnVE5P?=
 =?utf-8?B?dlJGbWYwWUJQNmk3K2NOQVpUN2tGTkRoUGorejJ2aVVzT3BwUUVXZVg2aXBr?=
 =?utf-8?B?eFJpRFV2WHkxZ0UwTmg5dHQ4anBNeS8yeUJvb2hURGYySk9kbS84bUlBUWhE?=
 =?utf-8?B?VERDaFRkVVBRUzJVVTQzOFVoaG5ITVkzMjk3dCtjU1NNZ3JPOTl0Y0tHaTFa?=
 =?utf-8?B?Q0ZJbFdzeUFpSUgvazNwUk9ZUzRRQ1g4VVh1REo4bE05c29nNW9uNUkvaW8v?=
 =?utf-8?B?Y1ZZRXArMjZwdnY5N1ZoMU1sbTQrWUw2emRlbCszQUJ6ZDNtN3NLeDlPTGoz?=
 =?utf-8?B?OFNuc28vYjlEb2pPZWl6Q2xtRk5MUi9QcklkdU94S2kwelhrUG1ORXIxbjE4?=
 =?utf-8?B?d1hUWlZOTnJVak5kbVlxeVRmTmMxS0sxK0VnekRsUmdNWWF2bWRpejRLMkta?=
 =?utf-8?B?eGxnSGQxYk9yRk0zNk5yOVlmVXBqSzQ0aXp1eGZqQTNmWjFZT3YwK2RiMnVE?=
 =?utf-8?B?WHdwVGY0WWNmNEhwcmF3MDdHZU1GMnpWcjdVOFVmZmhwa0dOUUhMazFpcEJ1?=
 =?utf-8?B?RXNGNmwya1ozSVBYNkdYbytHamwySXV0eUk0ajJyendEaTREeFpSdm9neFlH?=
 =?utf-8?Q?GRsU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:52.0376 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96da4194-13ad-43d0-13a8-08de3e6587a0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5348
X-Proofpoint-ORIG-GUID: dYmsWtqBAWrssk-yXlISJyACo8WunHHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfXyNcou8enx3BL
 tV5jXbA5rSqnyWuU7YJ3bUhl5P/m0gjFqRKbR5wdyjJ7G8Uuf8MC85i0zDsrkP+pMZMFstWhWJG
 Hw6HIPE5rPr5aM0GD+5XMSbO8xEfyKeoftSW+H6rrAvpeg+S1WxP55QKwZ6wkYuWF8KWSrBs3co
 em9CWqs4cUJaCcW916dwRCrtYOGr3Fnb4wfbvzyiEurEdpoxL51fPb0UANwbtpKicf5fFbA1MIX
 W4raCTsYqzk7KfDp2PsD20YqY3j1zruMapTu790mzCxLrXOsdrzXuuIiAd0txprvn7oKfF9VXcg
 hGxOpgeTqpOI1pYrV0yFxZNcIR0yFAhAnANqM2RRPoMmjteR+KLxVEYmXbC0UcSGf+uZ+bSg3nK
 3N3m0Ar6AnBAH6HEXQT4hmNq0GsAUw==
X-Proofpoint-GUID: dYmsWtqBAWrssk-yXlISJyACo8WunHHn
X-Authority-Analysis: v=2.4 cv=PteergM3 c=1 sm=1 tr=0 ts=69444ba8 cx=c_pps
 a=PyuWNx0SgPbB4SnybF+ChA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=MFr3gt1Ubh-vhDcfcjcA:9
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

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less heavier for builds
than the use of __maybe_unused attributes.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 13762861b769..07b67eb5b9dd 100644
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
@@ -2147,7 +2147,7 @@ static struct platform_driver stm32_dcmi_driver = {
 	.driver		= {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(stm32_dcmi_of_match),
-		.pm = &dcmi_pm_ops,
+		.pm = pm_sleep_ptr(&dcmi_pm_ops),
 	},
 };
 

-- 
2.34.1

