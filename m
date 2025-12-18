Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E0CCD5B9
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:15:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 990DC10EB1F;
	Thu, 18 Dec 2025 19:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="TuWSvt+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8892C10EB1F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:15:40 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIZYiF2966301; Thu, 18 Dec 2025 19:45:02 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013013.outbound.protection.outlook.com
 [52.101.83.13])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4780bqny-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:02 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLYvl8NaR5R2AAoJ+nBpNCXchrLYBK2ldd6TC/v8W+SgezKxY8qVASk+7PZHRDaBFRiQTg/YnlH2o8WYHwOOB59D95JDH2ZVOaRJA9hDj0uzx/jQ5VWLN/l/hBH3iYut6IUPNkbuNKWec1Rr3wNfGxuDj406bfS7M9QfFXeqiwha1IjCJUEdxFoau8jDixU9wlow8wDtPONhQb2jFXfVaF9KV8F4cwMKXJlS1b+78Ddr6DpqCP9C76EDFsLgjkjkwKm0eAIDyuoN3iO0jF8JYREUUWz0Im+NZHx1YmofY4DAEh9M8B749NYJqr5yMCBfim4ebENaUS8yMSosd1vtAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XVVfvHiyipGb60bweJV5cOqnRrvPkbErYIN1XE1Ae4w=;
 b=GgDLs07KNCfivUCgyMecvsTtpd1JnsYffachX6wkhpy51zwk4+aaxilfLyyClEdOnxh1fPkY6w5mAZzr9w89lWKvV0X0aQWscVVgd8ldZffdSIHtToZfyBQ1CQ2lC79HbWz9x53W2Pv5L4rX2KSlNLAasjySxQsRUCL3ywAPzmOHsJCSeJfJ563vwPc0qh/zFYZUV5K9H21f3ZtZSdh89HAy3FZsIXaGwb+5xL2CLK1Lip8ZJinB21DipOiDzxXsMU7JmpAYgmDf8+HY3Jkhpwes9GmQIMlIUxR314wE8tq/cjUO2ZoXuIzN67/oBBP7JOblpZkJpb68CIIek70SDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XVVfvHiyipGb60bweJV5cOqnRrvPkbErYIN1XE1Ae4w=;
 b=TuWSvt+OT7V6djDzQ4jzAOeTjSr5O+poTXjcsbEhcjvZPvALaEbl+qfSRKaWaD+0HEkiSQ6yT7ALfgAZfdZHmrVGJBeKfpyLAeQvJa/IaRNVwSfQ1M0nJOQWfouQ2OwSAa86BjFYc72XH/jFd3fLhi4BzZL5hnjGMTmI5nnUAkPJpJ1LGa6QYdapokRtXYdxYcSELYSAUMS0HxH46KvUrbrL8wKFapFIIEO2XzT1fFgWHtyg+66CcFALiQIkOpXVcyWrEzsdCR1mJfu5MSmiRRP4AXXQH4M1dmYfPXbbEmOtGqbDc+OjPyj8FMsmOU9ItMOC4QDNLX+PsYvVYI/6Yw==
Received: from DUZPR01CA0072.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::10) by VI1PR10MB3725.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:800:138::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 18:44:57 +0000
Received: from DB5PEPF00014B8E.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::f6) by DUZPR01CA0072.outlook.office365.com
 (2603:10a6:10:3c2::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:45:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8E.mail.protection.outlook.com (10.167.8.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:56 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:45 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:56 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:46 +0100
Subject: [PATCH 06/12] media: stm32: dcmi: perform all dma handling within
 irq_thread
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-6-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8E:EE_|VI1PR10MB3725:EE_
X-MS-Office365-Filtering-Correlation-Id: 441c9188-30b9-48ca-36d4-08de3e658a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|30052699003|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QS9jdzArU3FWNUR3T2U0NzBXd2NBczNCazR3akZFRUdqNTRtditJWkhrNU5o?=
 =?utf-8?B?dk9UOTdDSUMzZjNZSTZDU3RaNDlSVUdweWhibUxFK0krRzJrcXF5K1J5ZjhV?=
 =?utf-8?B?eTBPdWQ3elRQUTJCTW84MXo4Qjl0TC80MXZ6SHRKdWorRkl0ZWp0eDV3aEF1?=
 =?utf-8?B?WFV4aGFzanFuZ203bjl0RFZRYjI0VzV4SDl4djRvekU2N2k5L01MS05GOFdt?=
 =?utf-8?B?UkNYU3U3WHFUeGRXdEZ0V3pHNU10THdjMEh0MFNJSkgyendBVkwzYk1YZ1ZS?=
 =?utf-8?B?U2R3S1JOVkpHQ2V6NCs3TG1xN3o4ZHJTUmtMQW9rVzNmQ3VlS0M2dDJZbmxU?=
 =?utf-8?B?NGdLY0FFZTVYNUpCZVNjS0xQQ0Voa0NpOUNWVHRtbmZwbHl4b0d6S0ZTSk14?=
 =?utf-8?B?V3h5OVVYZHJaS1ZOY0JpMkNlcU9WQldwSWdTRm5FZmlXaFArYVBNR3h2Zk1I?=
 =?utf-8?B?S3dyaCtzMDFCb1lkbW1OMkkwZVcveWR6ZFJDR1lNOGh1RGFNaW5BT3NYU0Rs?=
 =?utf-8?B?Wnp4ZjVlZmsyUTZpWGdvRndVRG5WWlpEWUxXZ29GV0pVK0F3K1ZpQ1dueTdO?=
 =?utf-8?B?dXJrcGFUTWRhSWZoYy9GY210QUh3VjkyTnRMY0NLamJUblFLTGxKNHhLRXRv?=
 =?utf-8?B?b0pjZW5LZkVKN3l6UzdoTjN3VUx5b1ZIYWdnYks5RnVhQml3a040MTQvUThy?=
 =?utf-8?B?RVpjYTkwVzg1TW1YbVZjc2xVbVEwKzBrS0hHYkE5Wks2WmFibWFvWVBMYnFz?=
 =?utf-8?B?bldJRlduZmZWREdMMVZ2VzQ0M1c4OEwxeEd0VGF3NGZydklWcjAzc2hONjkx?=
 =?utf-8?B?dTk0QWVBSTYwUmNLN2ppSXB3TktZSlJZbE5ydWpveVFveUxoelZPOERWNkpX?=
 =?utf-8?B?NnMxN3Z3YzhIbW1PY1lUOGM2OVRLR2E1Y0ltUGxBWFpOcStpZjZHNzNNYnFO?=
 =?utf-8?B?UjlsbEFqRytFZ2g0R1RaUVlLYW5pYW8wTFJ0dVg2WWw0dW1zeVNFeXhzVGZy?=
 =?utf-8?B?V0V3Vks2dUdkYUozc0JrMHRsWnFZbDIzdm81a3ByNWd4akZRM3E4MlpTWEZi?=
 =?utf-8?B?QTVacXQvZXoxcGF6MHIrYkZMNDBNMmcvcUhxV3VXTjlVaS80MVhKalhIaW5p?=
 =?utf-8?B?TzJwdm9qSXppamNkanN3cHIwU3hCQWtudU94Mmg0UDZteGYxSytRNlB4TUlx?=
 =?utf-8?B?VS9iU08wa3kwak5FcWhBYW1DSUR6ZkF1N2VHZEVqOFhaTEVWVmZsblVpdXQ3?=
 =?utf-8?B?UGhDVGpmdE5QcERqbDJoUXFBYkNZMHpJQmMvWDFDR3pvUXBGVHlUMXdvZW1V?=
 =?utf-8?B?NkZPaXJsRnBiWU1RcXVWRVBHMlYwWnhlR09nUXgyejcvOWtlV2V4M2pXYmdU?=
 =?utf-8?B?WWIzRkYxNHVuVndJNU9FaVZBNVM2QmNSc3RJYmFhK2dWTDUyajMvbmhCVWRY?=
 =?utf-8?B?VDFoVFJkemZQZ1NqUTNKa1JpdUVBd09TeW9VMHdlVG9GWXJlRTJDS0c2VUdQ?=
 =?utf-8?B?akVrcFNRc3JCQnVOS0pFZjVvZWhieG9RY0VtUzFqZG9QYmFORzhIVkhjMjYr?=
 =?utf-8?B?ZXp1U0lFOFRJQkNFUndpc0VWdEhUVldQamErZXBXUi9YcU9mdWxJeVVYamhp?=
 =?utf-8?B?cituZ0pneUtleGg4Um1BTmZpR2pjZ1JRTEh5Z3BRaHNCeWtlTmxxd1BnSzd3?=
 =?utf-8?B?Rkppc21TTUIzYWlNeWljWENzN3FGbTZZbjgrOXNCNVNYckNhbjZuVVNFTHgy?=
 =?utf-8?B?c1BYK1g3QXJNRlhqVkVHNElCajBjRGVoOHN3eGNVc2l2VmhHbE9iQi96U2JY?=
 =?utf-8?B?VDc2NFNIUW9aclZGbWtaRGp4Q2xPU1VoS0lNRXhQY3pRMzlOT1lGa2dEOVl0?=
 =?utf-8?B?TVFzWng1aVRJOThBdWF0d244bUErVkRDbzFMd2RBZVVYNkg5Y2p6VUZvdzJn?=
 =?utf-8?B?YWU0RWJ2ZEptcHBHNkZyd3d5ZGRsdEcrVFVYd3cwZVY1NHcwZDJEQ08vT0l0?=
 =?utf-8?B?Q1VXWG9ZWlI4eFlIV0RYR04rMWN0aFN5ZXpSQm56OUNXT0luQmhuMU4xbFY0?=
 =?utf-8?B?V2dkdkdPc2RrV0U3N1kxZTJoTHFEck9uZW1tY2dLUnZRVTF2Q21mZS9XZW1y?=
 =?utf-8?Q?2vhE=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(30052699003)(376014)(7416014)(82310400026)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:56.7984 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 441c9188-30b9-48ca-36d4-08de3e658a7c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3725
X-Proofpoint-ORIG-GUID: uEXg-rwSVvEGPjhrvY4a_qUClvJ0VCel
X-Authority-Analysis: v=2.4 cv=PuqergM3 c=1 sm=1 tr=0 ts=69444bae cx=c_pps
 a=o6HjI5Hdp4yHrPjNunzkWg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nsOEii-EWWlXnWlBJ3sA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: uEXg-rwSVvEGPjhrvY4a_qUClvJ0VCel
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX9Y6Imzid99ir
 6xyy0fJ40vIhrzuwLeQ7UQ+AK2jVOm43AZT0KZPdGuG1WgQyixCmoROWNihLULHf2g6mfBERzb4
 A+oF0QTOLg0bzin2Gs7QWmMc4kxpEP829k7iK8A87lXtLmN7l+jPjVQcg2vrL107ftidCeBdXWi
 gUKlJpgcQMwLJ0crfh3B835EtGI+QdWsctWFL3SFUvL9zdGLC2HLHAtC4UQJoY/zQX4h+T2xeZX
 clLBc5fH6A0uwy5yF2D7HGl085wtg/GW1IQbI4QQc57aX1Wlk0T/G/sO2DZB6aMI+uMKHXYPahU
 vyEeTBuowFHiQPSf/1wEvi/8u2orKBZj34sz9WhRPiwGX+fGSy3Txfl2TqkB4hkFCeW1WiHwCMf
 uApOkYfQhpSGZVEIak6Orguaq8N7Dw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
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
index 1015f2d88f54..06b66095844b 100644
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

