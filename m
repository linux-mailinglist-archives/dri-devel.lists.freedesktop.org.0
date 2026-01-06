Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67900CF813C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 900DC10E501;
	Tue,  6 Jan 2026 11:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="crT32t7e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E66DA10E4FC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:57 +0000 (UTC)
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BUC17319528; Tue, 6 Jan 2026 12:34:38 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013033.outbound.protection.outlook.com
 [40.107.162.33])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4beub1h10h-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6rnCKVTVhMX5py3eVquu5roF5HYOMZJiFgq2Sl1xfH7SpGwvZW1BtRBK3zo3l1aUzACrILJnqTbBHfsqo6YNA377nu/0ebo6BjuMUFKWqPTszHCMUe714Va4Zw21vSAuUB0LFJ02tncGomwX1I6RInTOgRB0rcUFHrSWc6cV6RDStT1vWZkR4iXG0Ls8TgGqrYng8txlnIJFXBjcuZpzn54eEn6/lqnaZQKBdIQhiDQ9vbtEAVai9T7bAl8gIHK+COVQJ6GhD7apzALKI4zb2oetTd7I3LyP38lEaNc8JrGoLUvtWPGqgwNwJO+Eh95XwL5T6Id5Iw/EG8fLM6Ubw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lQZePj7zYhwGAju0+pn2UwdayhPk/mChpQPa8cuWXIA=;
 b=J8Ref+FrdZEfqO+gpcE6GZ8sGxXubT6yPCeOv9fFM0IBvKh57xwaYbnh7XfDRU9v0ao7unnOkyi+C/iIm7pP6MW9r+eWJeOFlOYgh4+EHPBlaPXPf3GUWvNXZYWUXI5+T6/gdbAa/OXmpC2D79IEYc9RmWELx4h/NDcZM2zmzg90j8sF7lpmHiQdsfeeiIcNR+DfbxnWIox+LnnDShJ+WSfkst8DMhtbvozv9hvxItvM90unRBMJZyIbK0V26b/mPxF2Qw7LJnKsHkx/8d+XUx72gnrXR4XhRfxvxs+D0gV+ZGPHeafgVQa4n325rcajVMS9cgLxhzaeui/eXIEkpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lQZePj7zYhwGAju0+pn2UwdayhPk/mChpQPa8cuWXIA=;
 b=crT32t7eg/yRvinvnH5uyZ2ri1SB5rqcavPn9VWrYH30urBqzA+GDHjW1Zh5R6RmHaZyG+neGNuSAB66MM+l2fHWHZlqXUnXQ4i9WeefWrVlR72j3ZpHn35e99cK02gvkWhnxUOHGvVhNmHICJBykOuTMr6pH7XYZ6UHPq3JjX4c4NCQzKCflRedcRq60XTv4ZRnBsBPJipuxn9N66Y/BgPngO87+iwVebphN2cfScM8r6KIpgZggwNS0QERAllpHfMg6q5lkJTHj/L5J3VH2LWJnfJOa0LYji0IPdiKW5UgNLGP1Aao9j2pkZU/Nv6VJx+nFeeenrNDwQdii8iF7w==
Received: from DUZP191CA0024.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::21)
 by AM8PR10MB4082.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1c9::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.1; Tue, 6 Jan
 2026 11:34:34 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::99) by DUZP191CA0024.outlook.office365.com
 (2603:10a6:10:4f9::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 11:34:34 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:47 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:33 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:33 +0100
Subject: [PATCH v2 05/12] media: stm32: dcmi: rework spin_lock calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-5-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|AM8PR10MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5ef195-aba1-4ead-699f-08de4d1790f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0VOQmFzZEZuc2dCOXR1Q3JhU1R2MzgrMDB4L2NoaFdXeWR1ZHh6YmFuS1FX?=
 =?utf-8?B?OUVUQWNjV1NKUkYrL0RTMEU4WDVTQnJrNXMwZ3hDUGkzanBoYUZSaDBTeU55?=
 =?utf-8?B?bURNbm9aSjZNRlpCK1BYSlUxTGw3ZDFOYUxkYTdFVWhOQXljSHl0Uk1LWktC?=
 =?utf-8?B?ZzlhRkpMVVRTMkYxUjVVZXFmQ0ZyWTJ2ZGNybUlwaXBDMERvWEVnbVV0TmRO?=
 =?utf-8?B?ZkpXaFlGSXFTNkl1QUtUeVNQSWFwbGRySE85dkVDeVpGNTYvTE9wdGo4blBH?=
 =?utf-8?B?TjB3RUtGY25iMHFnSW1rYzZuL3hLZGhSdE9Wck82UlVJM1Q0dVZhbCtlSjJ0?=
 =?utf-8?B?VDNPTU5URTZKZDdGRWJVMml1eXp0T3RjZHhteTJNUUxtYW1FNldTOUJXUWJl?=
 =?utf-8?B?bndrMHNjMTlzQmFORjliOVhZNVBUV1RrbUw4bDFTcHg5dkNFUG40dFBFMkRW?=
 =?utf-8?B?RU9HQkZQdmxmZDlhdmpZYVNvc3E1NjdmdDJYeVFGMnJ6WmhKMVJweXpJcU1Z?=
 =?utf-8?B?ZGx6aHVlRVAxWlZNdXBPZStoNkN5RHVGem5sY1kvVjd2a3NYSjRabzRYVmFY?=
 =?utf-8?B?ZmF2cktVMStMdVlibEViRzBuc29rYzd6ZW9KZVIrVkl3TFhVQVIrTTEzNElM?=
 =?utf-8?B?QWFDVnlEeWNVY3FPdzJOTmN0eWsyai9xS3l5eUxYTDJwUlljZm5vQnJ2bWRl?=
 =?utf-8?B?TW5vblBmMzBNZjNWblhxOC9BeVhUU3JkaWVoVTFNMGNjU3hLRnIwM1BoOTdr?=
 =?utf-8?B?b0pQNStJTnlBMU5CSFJ2dlZRWVFLYnUydGNwZHo2WDQ1M2lzZDh0dEV6SFhN?=
 =?utf-8?B?RWI1ek5EZHdVZkJWZHNVemJkcXl6cG5GOTJROXFvRzE4bk8wZFFmeGM5NnN0?=
 =?utf-8?B?STJJenE0K050ZGVWNzNHYzdmb3FwK1YwMnNHbGRBMjlSbXpFVlRUYXNaK0Jr?=
 =?utf-8?B?QWU4QlJHeGZjazlzckZCbk0yWjcyL1pzTGdxOTk5L2lUTjk5QTJCTUxLU3hj?=
 =?utf-8?B?SDFLUEw2b3E0L3JWUUppZmk1S0R1aUNFZWU5QStSRENOM09NV0NTL3U3MXJ3?=
 =?utf-8?B?ZUdVVU5LNHcvYUFTYTkvTTU1TmtKYnV3MWJwWkRPTzQySGs3VzFJUUo2VXMw?=
 =?utf-8?B?SHdwT1hHVE4zcjFpK1lVazdWeWlIVUltRGRxWUZ0N3Y0SVNrK1Z2ZWVQRC9v?=
 =?utf-8?B?UDNpQ0dRNkh2WTIxdFZOQ3liYXBpb1ZBVnJnQ3ZXUDNXVUU1RXEvc3BmOG1B?=
 =?utf-8?B?K28rVUxpNEpUVFhUaUxTRXVWaUVpSWRFd3VZQUpFeUlJeWlibkVGdE1PK1Yw?=
 =?utf-8?B?K05Rb040MlBNMlBnNjlLRE5Da1Bnd3E0bHFLM1FraXhnYWZsUVhCNTRsbzJG?=
 =?utf-8?B?Tkp0dVpmYjMwa2N5OVlPM2MvbUtHUlFQam5GMkZscXBXMmI5ajg1TTJtS3NZ?=
 =?utf-8?B?dHpKOFBrTU13ODFCL0xQanA2a05jaHhUSUhiSDc3Um1EVjFHRVNpaWNlNnBM?=
 =?utf-8?B?MkVrcThoUEhLVHlXaWpTdFNVZldNc0w3WmpRNWNNZncvMDdkaVlLNzRPZWlw?=
 =?utf-8?B?NW80N2Z3Q0x6L2h0bFVqd3JGdHJyd1JTSFZzSVVWUlBaRUdlckQreVNtR0lk?=
 =?utf-8?B?K0I5K0Ira0NhTC95cmNURGlTQmMzb1FwaEZ0VTI4ZUNLeGl2ZXFzYmk4UkFu?=
 =?utf-8?B?ZkZxRWRURS9KdXVQbXArOGZjSVlNNmpvQlpnTjNDMGQxUnZSdCt4SU5vaElh?=
 =?utf-8?B?QjRubi9kRUlqTUtRcXdBaXgwMkZHVHkyNTY5NUJWZndHZ0lRbjVCeHpwZDl4?=
 =?utf-8?B?alUvdG1vNkExa3M0SFNZSE12QXhMdXJpb2c5bG12YXJCbWliQ2lnM0RWNVFl?=
 =?utf-8?B?OWdpOXcyT1U3THpCOWwwVGg1UCtPSk9XM3AxSFF1WTc2Yi9ObXBqTVB2anpS?=
 =?utf-8?B?VW5jQjZ3dk5Xc2ptRTJIZmppTWV0VU5XbU5ZZzhjV0RFdjVPaGxWaVlzOXQx?=
 =?utf-8?B?M2xTL2Mwb1RtWGR6aW9OMkFzVjEwS0VDbFNuVFRmVDErYUUvVXUzcVJLU0hF?=
 =?utf-8?B?aVRCcFRoQjFFdnY4bWNpU0cyRzlBamVRSXJzZXhJWGlRbVY3QTcvOWxvWTJj?=
 =?utf-8?Q?n1HQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:34.3728 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e5ef195-aba1-4ead-699f-08de4d1790f5
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB4082
X-Proofpoint-GUID: WKa7QSNMzQCGav89e_dOUPhQXxGyMa41
X-Authority-Analysis: v=2.4 cv=LbIxKzfi c=1 sm=1 tr=0 ts=695cf34e cx=c_pps
 a=4znNAIdiiuCzO+DdkNTloQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Hb1iwsRhEjJoBOvffS4A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: WKa7QSNMzQCGav89e_dOUPhQXxGyMa41
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX0FOOGD3pH5VX
 Fez1ES8cXK1bj7TINEquTGcx0nAcYk01Ao27puID6P+jrOQwXry1QCSUGPrpz5SmH5cJX3UobqL
 xq4IGY5FglJ3geMUQwTenkmBN12rx4TlIvRbFNJZO5DTtJj49bmPppNvSd7pkvyqGKS2Qmu7ggd
 ZbgLviB7JH8hNi6JbZPedKkA58grX8zQjN8IjrdSu4GMWwQcqBORhp7lvIrFj5qS4YCZzPzT9X9
 HYfF7KBRkLqOHKqhOkrRg1u5PeTxyCcRULawnPftq/KzXsBWRuEXO8L4qVBH4IEy270N6K7x5aJ
 Ev+VN+Yf5XOFmsfX2pnYeT/D0sxaz5EFSyc0K1/zCzR+PbeByCEecTx0ZfkURwDedVP9a35Qmec
 /X+DOh6IVKLbIdOu/toyPN98OFvO0yepDgryugCP1BWkiJW8GULgm1eO7358Tcu0tAppD/GrLgl
 EUrnkftcz8G7i5NUHJg==
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

Rework of the spin_lock calls in preparation of the rework
of the data handling of the driver. Keep it straight forward
with basically spin_lock protection around everything except
dmaengine calls that might sleep (ex: synchronize / terminate)

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 20f5b9ab6a1c..2fec10d13913 100644
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

