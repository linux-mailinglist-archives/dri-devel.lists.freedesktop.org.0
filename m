Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C12CF811E
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639C710E4F8;
	Tue,  6 Jan 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="UstZwbzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E26C10E3B5
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BPLGm772327; Tue, 6 Jan 2026 12:34:40 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bes49gwhe-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:39 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZe81H1BVOh7i7+wzDPvi6M/mraywCXKBt/Yxz0ts8yPzX+LS3le1l+9VQwzG5vBV2+nA8Dky+7NTOFWmJadaTgxPZPdJizUmevAd+zxUk/uERwhSY5kz29mZXq6Dt6ivaKTI7UIMMjkCt7OliAl6jfOKk33nMYQiQQIpQ3T0sXpwhVgHtf70fn+qwf9WyMoerhpPYxXaofCGss0kgLZ2HB5IW30+tqdC88U0i97bXBHm8KieF+Obp4rgYFKZejNWwxaEB9rfRbAefXFzn3/aQqaY30v801gSTRaePA6lxmQz7naUQq2Vyg68ylTcxrfDAjoDMqout0F8gM2NcQj9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDpxciJXyO/8myRrzb/hux5XbF5kx3rsILDuWraBIws=;
 b=ydGHzjnzHA5k4vnBEn14LyTXR7iqhBEcl0xJMpegQtMZO8Fhy0DpdhNt6E+SCeQxdUtAqPpwELiQemGqV2buMR9lbJ2y0sYtM890xGrZCUXh0hy7KlUbA7I97xGtKZVBr0zqQFQQGAODixgfTjJleHjsXeJBd+gqbC3lKHFZ/3XFdka8Mk7EedBZwLccAWhvOxql+0Coj9Awqi9uGuaFhaYGXMp9FXW+2DP2ToISERoOOCKRgdIFiENlROBogM8Wpt2h2TrfMYjKThOkHPvIacTwpGO1WyHHoJqfHKmLGfAt/B662ehKZcc1AKEE9jqKF50CQ767x509pckmlYjH/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDpxciJXyO/8myRrzb/hux5XbF5kx3rsILDuWraBIws=;
 b=UstZwbztBVaTGN2JV0sFlyD9NIVyxnvC4jvOjwU9LWLk5z1n2c2vcDMjT7QTOLDmFozqd2LWchPX2Eks//i3mxNr+H3+C4aKFH7cd8baZS7AJFnLyIf70MeZqAjbNLrk9P+wio86Ua4/kiT7dDog62Z2M9Utu0fWxVA+1ndwFLHE1/katfJIrHRhcs/qrwgw9VxBBfM2P/aq5nf9JhE8GNXN85TgXrY0JVfDHnwnha9GA4Hnhu9EUE6ur3QKI4LzjWml9HCK0hP79VHcljFiF2u/vF2Qis8z6FrSaRKXhHWNPkU3BaEaAFA40RwJZ0Qc5Vx1hKBSq/LEf5S5A2ZTCQ==
Received: from DUZP191CA0027.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::16)
 by GVXPR10MB8783.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:37 +0000
Received: from DB3PEPF00008859.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::36) by DUZP191CA0027.outlook.office365.com
 (2603:10a6:10:4f8::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB3PEPF00008859.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Tue, 6 Jan 2026 11:34:36 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:35:50 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:35 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:36 +0100
Subject: [PATCH v2 08/12] media: stm32: dcmi: continuous mode capture in JPEG
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-8-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB3PEPF00008859:EE_|GVXPR10MB8783:EE_
X-MS-Office365-Filtering-Correlation-Id: 9608dddb-045c-4c95-b25a-08de4d17921e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFuUzBVNVc2VWdwS3d3WUwzOVJDb3VnQ1AveElFK1BJdDVLQWs0TDh4TmhD?=
 =?utf-8?B?azhyOTdxSDZNQWM4OWkxMkd5dFZFY0dYRzFvamJDWXRtRWRxa3RYcWFwdklk?=
 =?utf-8?B?YTlqQ0ZyZmU0Qi9HZnMxbzJCQUlmTVdvLyt1cXNQTThIOTc4VEJzaHZtZ0E3?=
 =?utf-8?B?M2Ntb1hxZkd3blZ0Tnp3cHl4VXhnM0xsa1Zad01zMGdRSjN5aHFpVktFMkJy?=
 =?utf-8?B?R05GZE1Td3l4Vkxpemg0Qy9GQ1dZWmRzWDhtNzVMRXp6a0hDWWcyOWFqWVRQ?=
 =?utf-8?B?cVFUS0pNYUcrd29QQkVVeDVWMUMvRGdBWTFSY3B0NGpxYjlUZERxVWtQa004?=
 =?utf-8?B?ME94TFc2alFxc29RbTVpNkZHTXd1REJJK05CUmNQVFAyS3p4eDdvd3ZXaE9L?=
 =?utf-8?B?a3NQVFA1em5XZDExU2tOV1g1ZjRJZHRoWUVPTU5EZUtHSVBFODFPaWxSU0Fz?=
 =?utf-8?B?ZEVvTWltMkE5eWJrQjNoaWdTLzZYSm9wdFlsemNSbUcwUkh6NU93OWMzMUhR?=
 =?utf-8?B?Q2lXaWhlekcya1JibVVyQkFLakdPc29ZeGJLNTJIS2JkZTFjUnV2djBlTlZU?=
 =?utf-8?B?ZGkxMDlJaDVNQitINW5iRllWZFREQmcrUVI5cjNPY05TQmpja0IwbU54ZXNp?=
 =?utf-8?B?cCtCMGRMUnUwQ0tSU1pXM2FsQ3A2YTBsL0psdlRXbCtpV3VkNXBWVHJXNWxx?=
 =?utf-8?B?S0tzS2hvRWM5aEFqM1dyeFpBemptbEpxY0VTNlYvYzREUkV6ek84T2MydDVI?=
 =?utf-8?B?eklvaGdnc0hmTXI1bkYycFduZHVqcHA4ZWJ6K0R2U2pHZFA3Q0RtVFJySlJq?=
 =?utf-8?B?UDIvQ3B6c1V3U1BVT243aUsxTXp5Sy9mZ0hDZEkvZ240aDA1SG5YTjNyaFZz?=
 =?utf-8?B?MVhCc2UweUxmb2U5N3ovemozY0s2eGIwR1pNMXJJSTQ0QWpVaytNcEZwSEJ3?=
 =?utf-8?B?b0ZiUzRpQnZaN0xBYzJEWlYzYUdpbFI3UFU1R2J1VGdDanpWbzd5S2RsSzYx?=
 =?utf-8?B?b0pFVmIvUEJoWEhJNFI1ZG5NajRscjk1cWQ3cENXdERUTTdVenM0UVJHaWlQ?=
 =?utf-8?B?OU02eUwrVUYrcU1NR0d2Nit3WXh5THFOeVEwYllxTFZRdG81TnBHdk5RSkR0?=
 =?utf-8?B?a2owV3VrNXRxRXZXamg0QWdOdEdKMlVsU0VSWjR4RSsvS1RmallEQy8xRlhM?=
 =?utf-8?B?Q2pIcGR0aVhheUVDL1JaaXVTcUhyQ1RLMEJoZVVsdjI0cG5iTEh0Ry85Rys4?=
 =?utf-8?B?RlF3dDRUQVZaaE92OUx2cTZ6enRIcXRDVjlUa2hXNk5ZMHYwNm0yblBiYnZ6?=
 =?utf-8?B?V0Vid0dqUC95NG1pK0VOTEZ6bVA1ek5adlNqM3ZpZ0RXTkpHaytXQU1CdTZz?=
 =?utf-8?B?U0J4dmFkOXVtREhyaDg1b0QxaTBFNXlCS3pLNThjNnJQKzNJcGtOaGR4cENG?=
 =?utf-8?B?N0paZVBUYXRuemRibmRteXhYTnRoYmw0b3lHS3pFTVZ2TjQrcDIreUlDZUIz?=
 =?utf-8?B?QWxFamlWcWphQkF6Mjd4SXVqZkJUNUZEUkVPVFAwTzBOMWJwTGF6Q2tsakcv?=
 =?utf-8?B?bFVBcFRMZFFNaVo2ZnQ2d0lxVlJWUG1SVENmajYvOFVaR1RHZS9oQjkwZWVH?=
 =?utf-8?B?Q3g0NS9rSVVGV3U0WHVQWTdZYk8wZ1JoMFNqWVlzV0NtRkl1U2d4djQyNEM0?=
 =?utf-8?B?WWFyK3U5SVhlcUR5VEtIRkF0bVhaVHFlUGtaRVZqck9pNURHSnBiOVF3WXVZ?=
 =?utf-8?B?d2FOTkFERkZla2w0aFh3LzFPN2s2RkFrZ0lkRzR6eUgwejUraFRXci8reWdh?=
 =?utf-8?B?WFZtSXRVdVVrVHhzOUg5TDhyY2xFaXRHNUk0SmhkM0dwaWdZTlBHcVZkZDBN?=
 =?utf-8?B?c1pYeEFQK296R2pOWDZtNWRCbWlFZnN1U1luVEwvWjdpV01ScHlLdUkrY0F2?=
 =?utf-8?B?ODBpVEhDeS8wSkpkSTdxb3FZNTd5SzJnNzluZ0o2US9PU1JOQVl4VnhmMmJo?=
 =?utf-8?B?VmF6ZkJVaVF3eXdDL0VjRnpnaklSTktDL1V1ZHYrekxnVVdQWktjYVd1ek1l?=
 =?utf-8?B?cWxsTjNKRkwvL0puTWVPcWpPWVpvYXlsSW5ySVYwT1VrY2Nnc2ZvdUdxRm9r?=
 =?utf-8?Q?D5oY=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:36.3087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9608dddb-045c-4c95-b25a-08de4d17921e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008859.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8783
X-Proofpoint-ORIG-GUID: DI9gyhqlmpepAtKVkzcuq0TDzofof00L
X-Authority-Analysis: v=2.4 cv=SvWdKfO0 c=1 sm=1 tr=0 ts=695cf34f cx=c_pps
 a=kV4qmwoOnOjkUfa4RRfhzg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=YRgSJkVlcEML8Aj0wVgA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX3Fk5XEob+7KE
 LdI/BH15SoX/0bK+0uisvnb9KbPQhIvtBGx98A6oWSrVSgy3HIItw/Ip7jJgClqCqRZmncmN8jg
 zvhxZ/0mQfmDHY2O06sLrr3CpxOBELpFCFGowgdGySnMu5IXftF1XCNCnxxb2z10dwBZt7x33f+
 P6Ni2CJ9V2TzD78OLGZuOvFZo5/D7gEllZF9hkCVS9Ni0VrQykhavI08Pf8VpNkoJ8JtuATtnDX
 gQGh+dascG87VdbknLnfkOUciKa2Y/UbOHBEMif25JriZYMUHbAhacuRCyzR5w3QlUqxMdt6Kfd
 OQVLpHE6hLr+qP8KR3Kn9mdYN28a5BbViJ2Jhbs3+5c4JlcI8Lcs7GIIIKNu7MKMTs0eaKwIkCH
 oehIKIltxnCJ828mXgSidYsV+SU45Q2B8euQLZljapE45CKq8B6BsCCPDRWWLt3tz6oiLgwlKgY
 mJBJ5+Rikbxnn4s97WQ==
X-Proofpoint-GUID: DI9gyhqlmpepAtKVkzcuq0TDzofof00L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
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

Overall cleanup done allows to now have the JPEG handling
done in the same way as other formats in continuous mode,
allowing to achieve a faster framerate in all resolutions.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 6ca0ffcd97a3..97683daf179d 100644
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

