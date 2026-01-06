Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B74F3CF80EE
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA4710E101;
	Tue,  6 Jan 2026 11:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="BlX4dKQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E47110E3B5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:52 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BRiq1277694; Tue, 6 Jan 2026 12:34:38 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010051.outbound.protection.outlook.com [52.101.84.51])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bgn0fa6va-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoCTeviFCuP6jV7qAtWvc/KZ1NTV5I/dm+wU6m6AjUHpA/iXNu84xGIH2PvOF77Xo3JbNJa8Qvh5ygPOVqWn5pp61+Nfdx6ofBhh+bBhIfzzqM8dLV5LT5JbDL9FqEYI2JMj8PxLsF2kjRgVz0j1AswgmD7kDCVdH0andDQbKkd3kGwH04u52fLtfDzkTW+psQlUzgSz/IoqF6zBmxOf6V8x3NLjYIepz5nOZdbUhX4HsdPI1udud5O4fVyuO8ic/KKwC2UzSsiAlGgE9JaRenVNkAGFh/TA+P4ZSjQmxMAu82pzmeMd4AWoKlMe2lsHgO/yp/Y0Y0PdUEKW/O+P2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EXfe8OC0vBlaIXWnUWimSM54cBpWZKqn3tfeqcKpYb4=;
 b=iJE1AAUuy1ll4rB8mjrs6NhrxmbQLcbP34A39pIiTVEdPITTjL4O001CaaUYVvAbIbxP6zxX+4jJRxIEy9LsBUcdXBxARNxwRboSmp6Y2naFhvW7smI2nzCBovz3Z8lupnAB2E3VmcOOni5tg4vN7jYd21xfntb43AVcKlTeb+2q2AV3TtCThaD3BPCo94bjp32pYKZYUSIMm3jlCslJocjtCsSdfCNeZWU4cO9+1a0zc3WEus8+yGVB1VB40IDaQqxVKpsfq6JbdliJMN703l45MQGBaoVS4+PMxC1E2zGHS7vSSvV3Fs1Fs/B/m9jgiUkjo/GmPKOlHd4oiwqN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EXfe8OC0vBlaIXWnUWimSM54cBpWZKqn3tfeqcKpYb4=;
 b=BlX4dKQedLUVvznRAo5ewD1rkx/SnjeJSY4r1gRwQyJUWE+D2vkVpRrOioalIHetZ6H3H8+TFo+eUmpEO1VcvPUwkkZKxvP/97ZIuwCrtND8dVFP3CS4k9hg0L5w198+EjIbtkOOv1BKAenhpMn0ve9cpYh6pP6oVhlAPxNElxW91TU8qJpqJOpzmSUzqCwSgsfrHLqy+bWNCYWc9L6Ul2Eh3a+8TbQjZbN49pIxsN+64wOqh4M+uOLh3T7a/QM8tQwak9t8IKTuxKT5gjXHj76LAl0e6XCPh3qM01UxQQGzNo5UcOjb/8OxvAG4xEa+B7iugdLrOm2RPwMTRtcvPA==
Received: from DU7P251CA0022.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::24)
 by GV1PR10MB8605.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:35 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::e6) by DU7P251CA0022.outlook.office365.com
 (2603:10a6:10:551::24) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:35:49 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:34 +0100
Subject: [PATCH v2 06/12] media: stm32: dcmi: perform all dma handling
 within irq_thread
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-6-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885F:EE_|GV1PR10MB8605:EE_
X-MS-Office365-Filtering-Correlation-Id: ad699d62-3309-466b-0cb1-08de4d17916a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|30052699003|82310400026|1800799024|376014|7416014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXB1akEwajVJTWVvM0VXdm1jNk5aMzhpdU0wV1l1NWx2Y0dTNFdDN2Vjd2pD?=
 =?utf-8?B?R2tSWGZNY2RIMHNTZCtLQmlYMy9HSExOd1plM2xieTJKUjVNRmpRTnV6QjRq?=
 =?utf-8?B?bEVycFBvWmMvME9sYnRDOXZ5aWp3bmtQSlZXcDhYVk93aHNkSkdFTkNYdy9S?=
 =?utf-8?B?VlE2cmZ0aXgvSjNjd3M1TmMxMFlKT0tpeHUrdzBuM1ZSWEJiMVZhbmZqOUtM?=
 =?utf-8?B?bDNxQkV0OHNXTjh3VVBUSUgvRTZGcTU4cHBZdVprSnFHem5QeHBaK05VRHlJ?=
 =?utf-8?B?bm14Y05Da09ibnpyQzJoemx1anRsaS9TWlVTcXpLdUtpMG9oYnJxVW5EbGw1?=
 =?utf-8?B?NU1CZHo3S3lDUUhad2dydkt0UGZzWlRjQitndWdSUzk2UHRDalgwZWNCVzRr?=
 =?utf-8?B?SzkwdDZWeGNYWjU3Z0ZGOGNIcnlLRTdtUGlySERuNjEzMjFPclg5T3UrL2ht?=
 =?utf-8?B?M3p1cU0wTzlIV0syZVBZRm5iQlhiZHpaSFB5OWRpc0xnMlhtM3RPTU8zVnpu?=
 =?utf-8?B?bkM0MzBSVi8zZTZDTWVUa0NiRXhhUTRRSVR6TWxIY2RjaE9JNjY2L3VPZnhG?=
 =?utf-8?B?K1REbElQSHRGbHFxUGg1SFkzSWdPT3AyTnVFbjZ6eVYyR3k2WFNBdUVZL0lO?=
 =?utf-8?B?QjUwUTMyR3ViOTI3YXZrQlphdFU1ODIwLzFKWFNyRTdTQW55am9rcEIyeU5W?=
 =?utf-8?B?TGVXYkdZSWFWZTFlMjlpaTdRRG1USDNlamxLQkhUSmg3ODI3eS82T0ZhSEpK?=
 =?utf-8?B?QmRLS3VyN04rMVFtMStUUzBLemI1Z2NOc3FzRjhkV2dta1VLa2g0K0M5eUlO?=
 =?utf-8?B?YWNFYitDR0drRWN5bmJZWSs5VFBQcmJ1bm5TeDJWTk1ITjZSSGE4SUxTNzJj?=
 =?utf-8?B?SGRITjZqNVNOUG0yM1NuRHU1NTBGKzdHLy9NbC9QSWFoMGZHWEoxVE5hVTFP?=
 =?utf-8?B?eEl5aitlSWt5T1BuNVF4YnNnQUZwcm8raDRyNW83VXBNNjhEc1ZnMGNCa2FK?=
 =?utf-8?B?YjAzK0FacE5pbjczdit6eDN1VnQxZExaZUt4SWlwWVpVSkpyTldlUitablgx?=
 =?utf-8?B?eG5qMW02VTl0MXhyZkNzcnNIU3RlbG9WN1ozcHo2NmJnOHJPVjBmZ1RpeUNa?=
 =?utf-8?B?THp3dTBld3I0bzQxcjhBRjkzSzhENC8yNE1VazRjb3YvV1FqVitWVlgrSEFT?=
 =?utf-8?B?dEhWZmd6ZGs5S2hod21ybFFLaWpHY0gyUEpYNlpDS0djU050ZE9DUCs5UDlr?=
 =?utf-8?B?cG9Faks3TE1KWERDam9JN1ViVkdGdFJVNmVtUmZ4ekRWT0VvRlcyaUI5RDBO?=
 =?utf-8?B?NkF4VnFTbEJEVGkwNUtsdndyNFg1OXBvZ09IMmwvSEl2S09XS0UxSG1aYU56?=
 =?utf-8?B?ZERrUTVUaUNaam9veGJEQW9iUkdNc2d5enZvNmx1MG90dG1iY25vOHdpOFpH?=
 =?utf-8?B?VVp3TlZGblBGNGEyeXd4TytaWFByZVozaUdWd2YrWkIydGgvZkhvYXhwdXpC?=
 =?utf-8?B?RWhLZnhzUVQyK3Zub3c3ZVgya2RjSTBiWWVrRm5rMjg1bzl0RkFuSFhHejJm?=
 =?utf-8?B?SEo4aTlKcGJxcGM3RHl6RkdETU1NL2lCN3pGS0FyWmFuQmZtc2FPdXZTQmRZ?=
 =?utf-8?B?dlZUY3lwUzJabnpEN09kK0NRckFESXJLRDliTm1GelNYQm1NR3VQK3hUQjY0?=
 =?utf-8?B?NE40REIySkJpd3lVWkpBQ0djcVo1NS9WODhjYUdWRjlVTW9sUUFrWkZCbGxa?=
 =?utf-8?B?SFVsdE01NlltSUFBeGpXbWYvQnpmVFBnQ05qa0lpV1RZU0FDNCtqZCtCd2xH?=
 =?utf-8?B?SEJxZDgrSVBwcDQ3RjFKTFRDamV3QXFMbStBZWE5U2lRUGErWU13Q2RRWkR3?=
 =?utf-8?B?SXArdlFWLzJhNmJVL3Zqajk3RnYxVmhpYkhOODBFMTJldk4vMHhCZlFtS3lO?=
 =?utf-8?B?NmVjSU51RkVrWEFDcHM0TSt1cEdvOUtQQi9RYms4WEdqdXBQOUtxVDU4SVJ6?=
 =?utf-8?B?S2RrYlBOdFFjc3BVYk5ndzhmallUSzN2T2hOTk5zM1I4V1kyQkkrSm1YcFNh?=
 =?utf-8?B?MVRMM3lyUWFxa0F3RkYzRXBjcS9KSThORk9ubmZHdzcrQ3RYclh5RnNVSGhl?=
 =?utf-8?Q?ctUs=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(30052699003)(82310400026)(1800799024)(376014)(7416014)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:35.1375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad699d62-3309-466b-0cb1-08de4d17916a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB8605
X-Proofpoint-ORIG-GUID: -69JZuXz_5A21h4yzhKFdTQAeO7q9l8M
X-Proofpoint-GUID: -69JZuXz_5A21h4yzhKFdTQAeO7q9l8M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX8DE35o8uYqTN
 Ok9LJuPrkuMJoKQS8mbAQdLc4zTeWRIgEpYnttpVvFoiMI8RFUfCfAyZ+WCQdmnVz3rdezjDaYc
 qNH6aCfBxhN4ugLFCdBp6U899g2ZCSD5KGl1h19EXZMyMFPJfvTqzHRP3BF+VF5KN1fssCERTBf
 19jjuWDk7aBUxwg3UDwA0zheSOBcEb9S/rPJbZwjxegRKY5M8LF2xv1H74F1PYyMuAlxSQW1vhY
 mbHcvrIIUXaZPDW13tP4dGfcKjU1f0dwhi9m4mtH+ulamCbf8JQvC+QmJ43EZ2bLDpZhUi597En
 CDn7cnnGTbpepBlNPw2/SJBnlaRVtu5P5yENv04kHbn35CJ+1gsaUwxywmdOKfRYqb1QG5SoqFt
 cZHdI43Lf9oHfcvSH5nM89U/Zf46l7k3pySn8WeBH7mAPKq04ak8UWgi8XvD7NM3tw85Ar0jp+5
 gETIT02MWOTECu0pXDg==
X-Authority-Analysis: v=2.4 cv=XfeEDY55 c=1 sm=1 tr=0 ts=695cf34e cx=c_pps
 a=tirGsTo+S7nTr9XMcRGhJQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nsOEii-EWWlXnWlBJ3sA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
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

Move all the type of frame handling within the dcmi_irq_thread
handler and do not rely on dma_callback as previously.

This simplifies the code by having only a single path for both
compressed and uncompressed data while also making the system
more reactive since irq_handler have more chances to be called
faster than the dma completion callback.  Indeed, in case of the
dma completion callback, this run as a tasklet created by the
dma framework upon getting an interrupt from the dma and run
at a lower priority level than other irq handlers.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 97 ++++++----------------------
 1 file changed, 18 insertions(+), 79 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 2fec10d13913..66bb79038c54 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -227,8 +227,9 @@ static int dcmi_restart_capture(struct stm32_dcmi *dcmi)
 {
 	struct dcmi_buf *buf;
 
+	/* Nothing to do if we are not running */
 	if (dcmi->state != RUNNING)
-		return -EINVAL;
+		return 0;
 
 	/* Restart a new DMA transfer with next buffer */
 	if (list_empty(&dcmi->buffers)) {
@@ -242,52 +243,6 @@ static int dcmi_restart_capture(struct stm32_dcmi *dcmi)
 	return dcmi_start_capture(dcmi, buf);
 }
 
-static void dcmi_dma_callback(void *param)
-{
-	struct stm32_dcmi *dcmi = (struct stm32_dcmi *)param;
-	struct dma_tx_state state;
-	enum dma_status status;
-	struct dcmi_buf *buf = dcmi->active;
-
-	spin_lock_irq(&dcmi->irqlock);
-
-	/* Check DMA status */
-	status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
-
-	switch (status) {
-	case DMA_IN_PROGRESS:
-		dev_dbg(dcmi->dev, "%s: Received DMA_IN_PROGRESS\n", __func__);
-		break;
-	case DMA_PAUSED:
-		dev_err(dcmi->dev, "%s: Received DMA_PAUSED\n", __func__);
-		break;
-	case DMA_ERROR:
-		dev_err(dcmi->dev, "%s: Received DMA_ERROR\n", __func__);
-
-		/* Return buffer to V4L2 in error state */
-		dcmi_buffer_done(dcmi, buf, 0, -EIO);
-		break;
-	case DMA_COMPLETE:
-		dev_dbg(dcmi->dev, "%s: Received DMA_COMPLETE\n", __func__);
-
-		/* Return buffer to V4L2 */
-		dcmi_buffer_done(dcmi, buf, buf->size, 0);
-
-		spin_unlock_irq(&dcmi->irqlock);
-
-		/* Restart capture */
-		if (dcmi_restart_capture(dcmi))
-			dev_err(dcmi->dev, "%s: Cannot restart capture on DMA complete\n",
-				__func__);
-		return;
-	default:
-		dev_err(dcmi->dev, "%s: Received unknown status\n", __func__);
-		break;
-	}
-
-	spin_unlock_irq(&dcmi->irqlock);
-}
-
 static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
@@ -344,7 +299,7 @@ static void dcmi_set_crop(struct stm32_dcmi *dcmi)
 	reg_set(dcmi->regs, DCMI_CR, CR_CROP);
 }
 
-static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
+static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 {
 	struct dma_tx_state state;
 	enum dma_status status;
@@ -354,13 +309,11 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 		return;
 
 	/*
-	 * Because of variable JPEG buffer size sent by sensor,
-	 * DMA transfer never completes due to transfer size never reached.
-	 * In order to ensure that all the JPEG data are transferred
-	 * in active buffer memory, DMA is drained.
-	 * Then DMA tx status gives the amount of data transferred
-	 * to memory, which is then returned to V4L2 through the active
-	 * buffer payload.
+	 * At the time FRAME interrupt is received, all dma req have been sent to the DMA,
+	 * however DMA might still be transferring data hence first synchronize prior to
+	 * getting the status of the DMA transfer.
+	 * Then DMA tx status gives the amount of data transferred to memory, which is then
+	 * returned to V4L2 through the active buffer payload.
 	 */
 
 	spin_unlock_irq(&dcmi->irqlock);
@@ -368,16 +321,16 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 	dmaengine_synchronize(dcmi->dma_chan);
 	spin_lock_irq(&dcmi->irqlock);
 
-	/* Get DMA residue to get JPEG size */
+	/* Get DMA status and residue size */
 	status = dmaengine_tx_status(dcmi->dma_chan, dcmi->dma_cookie, &state);
 	if (status != DMA_ERROR && state.residue < buf->size) {
-		/* Return JPEG buffer to V4L2 with received JPEG buffer size */
+		/* Return buffer to V4L2 with received data size */
 		dcmi_buffer_done(dcmi, buf, buf->size - state.residue, 0);
 	} else {
 		dcmi->errors_count++;
-		dev_err(dcmi->dev, "%s: Cannot get JPEG size from DMA\n",
-			__func__);
-		/* Return JPEG buffer to V4L2 in ERROR state */
+		dev_err(dcmi->dev, "%s: DMA error. status: 0x%x, residue: %d\n",
+			__func__, status, state.residue);
+		/* Return buffer to V4L2 in ERROR state */
 		dcmi_buffer_done(dcmi, buf, 0, -EIO);
 	}
 
@@ -385,11 +338,6 @@ static void dcmi_process_jpeg(struct stm32_dcmi *dcmi)
 	/* Abort DMA operation */
 	dmaengine_terminate_sync(dcmi->dma_chan);
 	spin_lock_irq(&dcmi->irqlock);
-
-	/* Restart capture */
-	if (dcmi_restart_capture(dcmi))
-		dev_err(dcmi->dev, "%s: Cannot restart capture on JPEG received\n",
-			__func__);
 }
 
 static irqreturn_t dcmi_irq_thread(int irq, void *arg)
@@ -420,12 +368,10 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 	if (dcmi->misr & IT_ERR)
 		dcmi->errors_count++;
 
-	if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG &&
-	    dcmi->misr & IT_FRAME) {
-		/* JPEG received */
-		dcmi_process_jpeg(dcmi);
-		spin_unlock_irq(&dcmi->irqlock);
-		return IRQ_HANDLED;
+	if (dcmi->misr & IT_FRAME) {
+		dcmi_process_frame(dcmi);
+		if (dcmi_restart_capture(dcmi))
+			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
 	}
 
 	spin_unlock_irq(&dcmi->irqlock);
@@ -542,10 +488,6 @@ static int dcmi_buf_prepare(struct vb2_buffer *vb)
 			return -EIO;
 		}
 
-		/* Set completion callback routine for notification */
-		buf->dma_desc->callback = dcmi_dma_callback;
-		buf->dma_desc->callback_param = dcmi;
-
 		/* Mark the descriptor as reusable to avoid having to prepare it */
 		ret = dmaengine_desc_set_reuse(buf->dma_desc);
 		if (ret) {
@@ -818,10 +760,7 @@ static int dcmi_start_streaming(struct vb2_queue *vq, unsigned int count)
 	}
 
 	/* Enable interruptions */
-	if (dcmi->sd_format->fourcc == V4L2_PIX_FMT_JPEG)
-		reg_set(dcmi->regs, DCMI_IER, IT_FRAME | IT_OVR | IT_ERR);
-	else
-		reg_set(dcmi->regs, DCMI_IER, IT_OVR | IT_ERR);
+	reg_set(dcmi->regs, DCMI_IER, IT_FRAME | IT_OVR | IT_ERR);
 
 	spin_unlock_irq(&dcmi->irqlock);
 

-- 
2.34.1

