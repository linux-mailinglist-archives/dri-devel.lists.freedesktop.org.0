Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A265CCF80F4
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCAE10E32F;
	Tue,  6 Jan 2026 11:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="WLOMIKVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B00B210E101
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:51 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BRebS318171; Tue, 6 Jan 2026 12:34:37 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013013.outbound.protection.outlook.com
 [52.101.83.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bfexpq4y4-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:37 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhrRkP/NGi7jD+YkgnKUxhxsmJnbZ7PhSs6zM9l9k5tGC/H7W+xDwIAFr3nsCshV2rc+55q/a0i1rjbUUxTa7ZKUmPTGyPNZy44FB7nsuqaoSWIf55yDhLN3ztiOBo+UzyWSH28oZyJunPNGFJVXFO+3qAVTVLNHkEj2TxzaaKH7z45qC8lOtcJgnBKL+9MNnLBWGjFSD4Xo0ilvdasIlgGof1WJqaV8cM2vtAIGsdJ+Guos2rCBwsOPCSZjCsdc0dA+kE3u6uIthZa04yhoB0SXnkYw4ooQMaeoPfPn5ZYuBBVYL7lRJ0/S4zAl4YqUvECDvsnWG5+Lu71USh87tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx62b6yl4ASjBhHGPdTWdgdkzuL0bke73EOQEpTqLZg=;
 b=Q1J4fDaM6XruQ8h8vLHzmjtyIEIDQhizeLhm6O1BKgWiv+gbSPrMmIIf6q5kwE0jpFkHGoaunjGXPyHSpMwKT9QMk0TqNmAS1kP22sZpEm/wiGMzu0zrwyu5j3C5Nct27PAZLt+AgBZPV17YN8a7AsV7K2lnJclaSDMz9jJgpQMSdQvYwbkSij+Pr1WXWx0aVUrQF85a8fk2G9msZ6KOgcjZpEWGzzgeXh2UHQEQZ9HBtxWN6H3vGfY+cozK9rOgZ/z0RgR+ifE3noRRbvQTqf99fCcqKkd2rEN6cGQbs0J2zYkg6YlFZ/Zr0Mtf0rph72R2ZrO2X7LkN0kM5NTk8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx62b6yl4ASjBhHGPdTWdgdkzuL0bke73EOQEpTqLZg=;
 b=WLOMIKVIN7bfAXW4i8KgwdSBptYRT6S/Qwgwc0/Fr5QqGLYDSCn9wNwpzCMBOKsxd8KABJgxdpBplgqRu1k7gtCL+DnCJLoj29AsFNmkcneeOGDc7Ubo4o8xjssIWdA/btUxln/Oz49h4w3EkLMBd6omN36HhUkP76UFmjwK2KLkKW51cg+Z/gqhV1mivez8YftqEXvye+Mf/oVOe4f+FRvSS8pP+WrGbrpQmxIxJchN4RkeDTI27hBXSPJBIk+0OkI0Z6jtYeAJfb/OQr50e7tbCF7TiaNUKKKzzlskKC63zpXEo09JBPC+9Na3WrWY1UNeZtTLeIbryiGUWmii2g==
Received: from DU7P251CA0013.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::34)
 by AM0PR10MB3313.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 11:34:34 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::f5) by DU7P251CA0013.outlook.office365.com
 (2603:10a6:10:551::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:35:48 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:32 +0100
Subject: [PATCH v2 04/12] media: stm32: dcmi: stop the dma transfer on overrun
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-4-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|AM0PR10MB3313:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cc89c27-f829-4a1d-e292-08de4d1790c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkJxTzc4VnIzSlpkeHlrTUZ2UzBjTWpjSEtGSmNUNE9BYmlVTFJXOUxpN3FR?=
 =?utf-8?B?U3h6UTBwTE56cVZIU0xKSno1VDBNK29lRDFuZTFZZ256Ymw1RW1vbnc1VW04?=
 =?utf-8?B?aWZ5NmROd281RlY1amxTRTZLaU5VTDRxNE1FaEhQUEVMdUFsbTZ6NldUSlZG?=
 =?utf-8?B?OVB4M01TaFkxbndhY1Nxd3Y0LzVsSFViNURwTEdBY1YyS09UV1Jma2JQKzUy?=
 =?utf-8?B?RmszZXBiWlI1bk9yVWY4eVg0Y1R4VHpWb2NLWXd6YzJRNjN4S3hkZjFHWnlx?=
 =?utf-8?B?Qit3UXlNN3lFVXVDZmg0UDRqdUZFMUh5SHZNUmN0eHJudUlWY0txb0x6YVhL?=
 =?utf-8?B?a0NVR3o5SlBOU1VjKzNnUmYzQktxbzVvNTlKOTBneVJRaDdZbll6UUtLekR0?=
 =?utf-8?B?R2YvbnhsenFaR2hrbEQ1QlBPZkhhRDNNekZxSDdYL2pETUpsRnFxT3RlZUdi?=
 =?utf-8?B?dXo2SGxiQVZnTXZUMEswWmpVUXFXRmdSREhwQ3dadmMzTVRtOFA1QzBIVllI?=
 =?utf-8?B?ZVFVcXlkOVp6eDJTWldSTVh6Wkp4Y2VzeFNyZUVQUjNabEovVnd3MGtWbVFy?=
 =?utf-8?B?NnZCTU1aZFdJU2VHSGNFaWIzVndmTm03dWdhTVIrMTNzaEtFSVJoOHRSZG1U?=
 =?utf-8?B?Qm85alY4QXNVKy9LaGRKWFQzNE5aQy95SW9NUFBBcnZGcWNzN3lDd3hMYzRs?=
 =?utf-8?B?cTYzWi82eDV4NHgwdi9mZTRoMStXUlp4OHBNLzBwMmVUY0JleDZRa2t1TFpE?=
 =?utf-8?B?S3NDSGQ3MnNPWFhSRFZiYlVGTWg5UDBla0ltdmduaEd1L1J1Y0lzTm42TVkv?=
 =?utf-8?B?RnpScEI5NDJ3WDdpQ3BHdzZiejJ3R3ZuUytia01NY01vQk9pWnVvMzMveDg4?=
 =?utf-8?B?N2JVZ1Vrc3ZOVlphM2c2L0FyNzJvNzV3OGlnaWlWK0k1OW44VmJUY3p1eGJx?=
 =?utf-8?B?bmlxQSs5c1NPK004clh2Y2hDQXlUbkhKMTllZnV6dDhTdk83QmpxZncwdHFG?=
 =?utf-8?B?YkRXcGhOaDBNWmVxREwxMDJobU9nSUJsam9JTkYwbjdTTTlqNVVrK2xUWlls?=
 =?utf-8?B?c3gzanlqbFVGNm12U0U0TlpzZlVXWHJ5WS9CNFVDcks1TWZvWEpFM0N2MjVE?=
 =?utf-8?B?MEVhd2RRQzRTbFJLaUZvWDlxN2VpQi95V2liUmMwaHNZbk5sMm1OOEx4Z1Rm?=
 =?utf-8?B?bCswYUsrS2g4N1Nta1Z5dUJ3L1NQb0pnczQ5dkVGejZ2UHppWDRpaFVqKzgx?=
 =?utf-8?B?elc0SDcyeTNZWU5zN2xmbVNERkE0UVZ1b2d3MS9YZkRnVGhzQ2Y5d0dnYlFW?=
 =?utf-8?B?RmNxTUFwc2Z1eFlOclgvWmxwajBSTUx1RWtWaDNVcm41U2dwVlcvKzRDdDc5?=
 =?utf-8?B?UlI5WUloVFoxTDRhRjYwY2pZdGpTRFhReGY3eEIvMWFtY1pVaytReXR6WWJw?=
 =?utf-8?B?ZFc5TXMySWlkMTRndXVnaHV1RFFDNWJuYm10aisvTjdDQzZzNDR0OGIwaDBK?=
 =?utf-8?B?N1FxeTFBZHhHbkRoV1pDcDlGMnlXWmlyNGppOGRXY1A5MmJ6QzlTOFZJaTZN?=
 =?utf-8?B?TEtXWGhRMkNlMzFraWZTVFpON0pzUXd3R2p6VWpyUmVWdmNXenV0YW5GNkdy?=
 =?utf-8?B?R1dsdnUzSC9mcXNldjB2Skx3TnVGd2lEMEFCZmV5UkZuL3FyZFV6aVZOdkQ2?=
 =?utf-8?B?czJCMGR0Yk91SWxLNXlRU0pGZ1R2cDFPUGJpelBoMHFpZHp0TGZBVU9HYVVt?=
 =?utf-8?B?b0w1VXFCR3E5VVV0TkRvU3ZXc2VJQUJURWZrQWJRam9WZlZHbmI4VXpPaXdm?=
 =?utf-8?B?UnoyaUUvdnhQd0FyREx0T2RRL1JZZ0pXeGJzTmVaL2xNcWdnMFRaOHp1VHlr?=
 =?utf-8?B?N3A3VjhXaDFwcGlEUnVSZ2ZGSGcvMERmSGxDTTBnSHlpb3ltejNMV2xZMkFT?=
 =?utf-8?B?eGNOa09xbmlsaFRJK082K05BKytRYXVOOVhpZUdhTVM3dFRVVDNZalE4TnFv?=
 =?utf-8?B?aS84ajNKUkJxNlhNeTY3WnpxU09GWktlbHhMd3lEWjVDUk90dGpDWDdDMFQ1?=
 =?utf-8?B?bmM3U0VZRTJJdmk5WjVGZXZJMFNjWFgvdEpLdVNJNURDUnRtVzk0SVJMb1Vx?=
 =?utf-8?Q?+5kY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:34.0735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc89c27-f829-4a1d-e292-08de4d1790c7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3313
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX/Uar43aFWMEO
 2GNaUCwiJwwILqx8SuLK2i5IGpMVQyhzFKfYVJMSLyDcjy8LnkyVMRzyFaSKsdcFDPLkSpVZq98
 8ArIQYMWL1HSoD9n5tVvfJbQue73w4hjs6Y7y02P4e0sUmI3UVXtljmcO8kx6PBi+H3xdr49YF7
 9tsPyO3i5cP2kglENPcDF+dvyOVgsNUOKJWqqi7JxHZAJzRg4NDCHq7fkE8fkpAHIhyBKYsF+Hf
 ekiBGZPMUR1MYLlq5KqbM+ep3m0prW25/Ryns1SLUdRkVdH5+N+0EAu8DRya+RKleyfeGah8qXO
 ai3hMyKjhAhUpdKZ5YEzq19ar2OOhLL+nAYUXoY1aB2GrLJYVNO8OTotNjWSsiDIDz9IYynZhax
 mOhmzLwaCEybj82+WIwDILugzxWbFhx8lAsEIFqogh0cd9RXIqMVPFvq2XRIXIU96Fw6zFDFVQp
 v9ZV4nqv2W8Ud3oItgg==
X-Proofpoint-GUID: -mKxx7IqavwbQ7cnveH2wPI5wkKTB0W4
X-Proofpoint-ORIG-GUID: -mKxx7IqavwbQ7cnveH2wPI5wkKTB0W4
X-Authority-Analysis: v=2.4 cv=UrFu9uwB c=1 sm=1 tr=0 ts=695cf34d cx=c_pps
 a=o6HjI5Hdp4yHrPjNunzkWg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=kBhef3lLaoA0UgAbMYMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
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

Ensure to stop the dma transfer whenever receiving a overrun
to avoid having a buffer partially filled with a frame and
partially with the next frame.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 0874974bbad4..20f5b9ab6a1c 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -402,9 +402,21 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 	spin_lock_irq(&dcmi->irqlock);
 
 	if (dcmi->misr & IT_OVR) {
+		/* Disable capture */
+		reg_clear(dcmi->regs, DCMI_CR, CR_CAPTURE);
+
 		dcmi->overrun_count++;
+
 		if (dcmi->overrun_count > OVERRUN_ERROR_THRESHOLD)
 			dcmi->errors_count++;
+
+		spin_unlock_irq(&dcmi->irqlock);
+		dmaengine_terminate_sync(dcmi->dma_chan);
+
+		if (dcmi_restart_capture(dcmi))
+			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
+
+		return IRQ_HANDLED;
 	}
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;

-- 
2.34.1

