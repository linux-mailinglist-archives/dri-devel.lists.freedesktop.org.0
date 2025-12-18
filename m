Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF455CCD391
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450C510EA52;
	Thu, 18 Dec 2025 18:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="ZGecTNh6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4B910EA52
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:45:13 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIMO2M2497196; Thu, 18 Dec 2025 19:45:03 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011002.outbound.protection.outlook.com [52.101.70.2])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4esu269q-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:03 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rXEp6C4zvwMu0SiEH8NXuqCpmKnf/EZ2xmM7gy4ob2XKKpDziDte/7aS/zwYxAW85vCzxo5peB/D2b7avhgct8o732w0xJUGD75Vp2bma8Iu/pCRQ9A9nSTujPZuUOwdEyQSOG8VWlGnqkU1CizrJ4zJgS4icXSEewP5Y0wzh48XYZ7y2MawdLNdzm5xbvxqZbMVcpDQhGxrOtB3X3a71i/23055xzkuy96nTMagY8sFXc45CUx1Nvx2aENRwlslm0T/qVNk5a8yBL4nKWh5VToJAkLElBc1opDPonTW5eq68dlGWA1nnvbwWzFHp53MYWdAbg0aLcLjnaFyorD8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwi+YOxPVrzZ35pWgxwgW0rV7IazagEwHuAo0Xbp2Fk=;
 b=hjtUvqale1WEMh3P20OmlWOxc88ykguQ9I5XsNcOLMhW0VJHItUClBs4bHtERPbf2B0/NYH9Vbff7LFoJeYaKTrA1gaB+MwirjwpCIhSkDN7DhyaZrdXH/K0dgSsZWKFqh7rD30xWvq56KJAs2RW9oSxVZ/nM6ZiJqNc5dd+d1oF4YbpJa0m71GcgVydT25akLUkG944xxArM0UwhzlAVSqM3zNZxhyWugvesCBePsW5D1zJbsFrL94Kcn41TY49Vo4aGD0TYR255BKUXYHbzVQWDwzf8hyJwpW7rrD8TgV0/PC2/o8JBQsTv0IAFo2scHD6H49vXU2U+dmVjN9tBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwi+YOxPVrzZ35pWgxwgW0rV7IazagEwHuAo0Xbp2Fk=;
 b=ZGecTNh6ndY7qxzMaRwMy6AlbJzbveImLyFQjWnhgZ5pQSAjlRt85oSA6bWfJy267N5+nn1pGCBUXQoC5qTlX/6R8wopkLORMQlMMPgd36vS/ZnxWh8mqEC/sUPMHtXvxSIRtXrTQbwqdJuDZ2XG91UtPD0Eh60tViGIZBxiqpkQkImC/xS8P9WUVYEu8zuiLQpZLaznKWmedMQ/DJtaCpLPGbeDEDiqO/ywO91TAs86yUDVaCJfhDoi5aGhhPEEIZ3qWn/1onkJFFwZtalgViEAvmgrZrVPKTeh9cRSkn0solhfkY0R4zhpjS5E0UkUFvDOPbKrUDZ4kcoOgeuwrg==
Received: from DUZPR01CA0063.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::13) by PAWPR10MB7652.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:45:00 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::5e) by DUZPR01CA0063.outlook.office365.com
 (2603:10a6:10:3c2::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:45:06 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:45:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:48 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:58 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:49 +0100
Subject: [PATCH 09/12] dt-bindings: media: st: dcmi: add DMA-MDMA chaining
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-9-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|PAWPR10MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a196484-e39a-4482-1515-08de3e658ca1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVZ6S3prMjIxOEZ0UG1WWGNPYTg3VTBPMlVKWnlxN0ZqRUpMMmtMQkJwSzMx?=
 =?utf-8?B?MGpDQzBmNVVLa2l6SlJTMG0rNFJLRDNrTE9ZNXlwNkRaY0R5d2ZiL25sZkJF?=
 =?utf-8?B?MGQyZ2tSMEJGYzlUc09TSkVvaXFyWDNYalhGZUhRTVRZVGtLbGpXczJZVFpE?=
 =?utf-8?B?UHJDUFdpL21NNXFSa0RpMjhTRTVSRlN0akhZTzZ5U3JEUVZldFpqVzdaalR6?=
 =?utf-8?B?ZzBhcm5zV3FpaElVTHBiT0dCR0FYMHFmUnhWMFUzR08rQittcmpibHFlaytK?=
 =?utf-8?B?Q3ZVOGNLRWVMZ2hxMmJGU3ZpbE1EeGpVYUVBSHpUS0hnUU95L1ljN2JiRHVX?=
 =?utf-8?B?RUJRWnYwSk03RzJscm9hZTJ1OHZBT2xhK3F2dFV2Q244M3lyb2czUUpnU3Rm?=
 =?utf-8?B?NElOc1FNK1B3M0o2RmpidVd2MEg2QUxEcnlRUXBqSndMT0hTalpZeHJweXlu?=
 =?utf-8?B?WTRVamJReFhrb2MrV2lCaHBwNUtPNnRGZ2dPZFZodGRlbEIrMzluZmwzL25o?=
 =?utf-8?B?dTFPa29tMG5rbU80L2h1c20yWXErbmR3QTVkM01MOXBrbTVmTVBpaUdId2Z0?=
 =?utf-8?B?ekpISDgrbFVDQ2lIY3pzN2Z5WlIwN0Y5N3ZrSmRkTkV6ZFVvNUh5bUFHNnUz?=
 =?utf-8?B?WjhLYVFiczJEaVpZcktJNVMveWVCYlF4ZHNreTMyVThCak41WEtMc1drRmtz?=
 =?utf-8?B?SEJqMkZ3SThwY05yL3JvOEJJVGxaMEdycE9IYUlOQ1pMbC9ucDlkOFBjc2Jl?=
 =?utf-8?B?MXpIdjcwWk5zVXV1YnA3cUlkV1U3QjMrKzRnVnJYaEthOUh6SUZUaXJjWk1E?=
 =?utf-8?B?Yms1LzVNNjhaUFJTRXdmYWYzbUs4bEphZzVtLzJocHRTeU9WSEl3TjRYREhF?=
 =?utf-8?B?UU1oc2dYMTZDU2xOdEJrR3A0TG5xcjEzS1A4UHZaRTVEcEQzZE9lRGJuSTNX?=
 =?utf-8?B?VHZCdDg5TWI4cm1ET054Z3pKVHRhMXNSdVpzeGJ4S1dxK3pBUFpRL3l1dmVY?=
 =?utf-8?B?VFJ3bUpRcUxmVU9GVTRtWVVkTlNSNUFlbHI2RlMvNmpuLzRuRFFWQWFrK1pz?=
 =?utf-8?B?TWhnbThJS2g5WnlaV3lCSEZuc1VobDNmNVl6N2VpL2cvTGtXUWRtbTNyZURV?=
 =?utf-8?B?SXhwMlVSTk5YMm1XOVV0U1Z1bk5aamt4SU03T1N1L0Yxd3Qzd0xKTWMvK2E3?=
 =?utf-8?B?LzZWQ2tSYzhaaUZEbzh5b2UxMllOWVR5NTVlN1l3NStXRWtOM1FhaUFJOVRt?=
 =?utf-8?B?bkJqdUFFdHl0bk5CWmg0c3FIeFpMZ1BpSityVFU3VHIwb3RBOUhoM3FENTF4?=
 =?utf-8?B?TFF4SDZUN041cjRSRWJZc051L1hJS1pvb0hucDZXUS9kYmJuTURvK1I1VUtD?=
 =?utf-8?B?UVZMNURGRkc5Z1A1Ym1Od0d0cW5pQkNobWZiT2JWZ005M3R6NVFEYXkxQkta?=
 =?utf-8?B?T2J3L3ZDRFBSMldSeS93ZUxxOXhaL012eXFzSmE2Z2kzV0FDZUxLak9BVlZD?=
 =?utf-8?B?NXdJZG01Mlg3VTg2Q29Ecm8xamRQWGQ0UkZSTGdkcXpBdzAzYm9ZN1QrcS8z?=
 =?utf-8?B?c0gybXVVVjU5UVJ4Q2Y3ZXJZdnN6cWo0VzVKUmZIWWRTVDVQd2Z5TVB5V2J5?=
 =?utf-8?B?N1hrdXlYQnF3UStJR293QW9uWExCNmtyeGdHbkMxQ3U0UmlDTHJ6YW1mYU9F?=
 =?utf-8?B?Z2JUZzRFcUNsV05JTlNPZGRRT3lvMXZkYmtrVDN6OFlUOElyNkRVZkNqdGJC?=
 =?utf-8?B?NFFHZVMzMlBwWVgvcFE0VDFFMFJkbXRXL0o0TDNkWm1aSHpCejJCck8vdXlU?=
 =?utf-8?B?OCtPTzRyUEhvbDUrLzJvMkNsK0g4cVlnYzRTTnZRM3c5QldYSmtsMzBscFdj?=
 =?utf-8?B?aXdiV2FZS3RWZS9JWmc3ckxWWGJXZDBlbjM4dEUvRStPWEhkTE9VWXRwT1Iw?=
 =?utf-8?B?MXQ1MEdzbGt1QU92enZmNmJqVUtpdlFUZ3Nya0U4UldyVFliQmZpT0NyeU10?=
 =?utf-8?B?Mk9nRHgvWEhIam13dDBHVDZYdFFwcW5tT1g4dEl5cjBxSWhaQjlpSzZpTG02?=
 =?utf-8?B?eTdkSHdIUkQzVklCVk1aaVNqYkV3bWwyRkZhdTJHMm1Md0dqa1B5SXNaaVpM?=
 =?utf-8?Q?69mU=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:45:00.4023 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a196484-e39a-4482-1515-08de3e658ca1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7652
X-Proofpoint-ORIG-GUID: U82Q1AxrxMnuOUkGV-98MfIvLs_SzqYu
X-Authority-Analysis: v=2.4 cv=EeLFgfmC c=1 sm=1 tr=0 ts=69444baf cx=c_pps
 a=lTC8IeES+PzMwLEJ9HO3BQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=GURmBasZJxkRD45z7HEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfXw/pagQwwjvkE
 4nnbf/osifnHLJoC/V/ewDLLYdeYN8ZK3QQcguqru/2RVqW05FqqCNiFirEiMQ9yOHtJDrbme6a
 8TL/SFvU06O/XAwuRQbUUGvIdPJ51b2WyLUFm1KTW56IHpbd/c/a+hPRqBI5GiuH8vQm3Ws9QeO
 0jpEXOiMD2NsZfFF/UGc6UMiaxG524TP5z7ePIXkQ9oZNyGMnnSdj4yEHX2BadOCQxjIb5F1+cQ
 chBIdKu8rQ/jUZb5WMZavziiwofnTyKTJEIeSuQCekjz/UPYc5ooZ3PEME27WgpL3E82iSn1IGA
 XIZG0xLJttyOX8cKvpQu4WInPlFfLbjMMJO9EFf6ApBNzc72NfkSxDB3e1KSApeaE/MNf+AN6QU
 /mNCSn56AubsGRJMj+u7K596BKodPw==
X-Proofpoint-GUID: U82Q1AxrxMnuOUkGV-98MfIvLs_SzqYu
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

Add properties update and new sram property necessary in order
to enable the DMA-MDMA chaining.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmi.yaml
index 34147127192f..ccaa2d0a2669 100644
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
@@ -40,6 +43,14 @@ properties:
     minItems: 1
     maxItems: 2
 
+  sram:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandles to a reserved SRAM region which is used as temporary
+      storage memory between DMA and MDMA engines.
+      The region should be defined as child nodes of the AHB SRAM node
+      as per the generic bindings in Documentation/devicetree/bindings/sram/sram.yaml
+
   port:
     $ref: /schemas/graph.yaml#/$defs/port-base
     unevaluatedProperties: false

-- 
2.34.1

