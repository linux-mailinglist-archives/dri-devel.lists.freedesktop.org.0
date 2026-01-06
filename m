Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064E8CF8130
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 12:35:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D7D10E4FB;
	Tue,  6 Jan 2026 11:34:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="My18B5LF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F64D10E32F
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jan 2026 11:34:54 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 606BPLGn772327; Tue, 6 Jan 2026 12:34:41 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com
 (mail-francecentralazon11013066.outbound.protection.outlook.com
 [40.107.162.66])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bes49gwhg-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 06 Jan 2026 12:34:40 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcaU3t7WLRxMCBH2a/O25PgJlcYh1O9lNku3lwjVZNJTHsEA8TXloxN8T2SHsHDOHNXrCX8T835BZ6rozCe7QqLc39ojlFwiNXuZ+bQdqsdiHcN7qHW6OzQqHq+sIlsebnef8ZiwoIgjxYC4dQGJyk1ZmElQtCfjW2dD5oGTUbVAy9lso9ylbuXWdwAUUQHzhoZ+jgrPT01F8nIdOAVgmqVblYMgFBxG8vhqOx1uqYtDC1PElw6yIsaL1RU0MFRzlGV5K5qhjG/Jyqzma3JzXK0z1mLuoWSxqgS0X9J4RPWpCB6mMrhpbuMtZ69/OiVZgRVEAJ7TXuV20H87YJL2XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edakQd/ozZbMyFPppskNAgAEIqLCZXuxJrJLp52RW14=;
 b=S2ZeZHtpILHFe8FdwLhuDtwRrYpPTFT/Wy/TIHPd+51Gt/VPPR6WtshLRLe2bZBERgHtxRFSCo0Y639KOO2HiXhIxikZyyfcW1HimuBnCTa2JJwR2TE//Eq/VXFniOLWy9gy6xAHBZrNEtdeiDRKz6vwGTzDyy+MnwoNJBBZ2HW3Tr+byO9/QCRzzOPNveIAAvAmq46wtB89e6ZlVbsDKvkxUi2ZpoItSsUkp9gX8HWV/1LGNizzswrL+ZFWg2x2LOJxfAKNLs0JXU7Ut751QOqjUNO5t8NkUQln9ISoC2vGlq0zpN7rXjwrf81RSRytHTls/9Y24bhKQjjhmANdpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edakQd/ozZbMyFPppskNAgAEIqLCZXuxJrJLp52RW14=;
 b=My18B5LFLY1JFgacYBYHKQSD4nWUwBTWRWkPkVC7CQEnXusWbp+snQw7Lk5si11P0HX3QQWIz20yWEbzFbzUdl+Lq7S0SD5wtM/hubmY/7mPVGA8pdjTNPGKjisBPGeLGVzkTVCLmokdb8n6g1DY3gqxPfHtIhZbUtIBzobJDAB5IZon6MfqqE2RLHmK0DQZ/k2F7iKEVvYaf5XrO6HdI4gZ9yt/OI4Lmj4CGicJfPu0l2oOcHFQycEfUzt0jyo9U9druIqNMQyOAy7/dDC7/6EQNm/BI/IjCy2KNAlBCZOp5JRG3RwCilUQcbFCfcbhfAF/1ZmOlXukyU9H3fpf9A==
Received: from DB8PR06CA0042.eurprd06.prod.outlook.com (2603:10a6:10:120::16)
 by DUZPR10MB8267.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:38 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:120:cafe::63) by DB8PR06CA0042.outlook.office365.com
 (2603:10a6:10:120::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Tue, 6
 Jan 2026 11:34:38 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 11:34:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:51 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:37 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:39 +0100
Subject: [PATCH v2 11/12] ARM: dts: stm32: add sram node within stm32mp151.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-11-70688bccd80a@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|DUZPR10MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: f17a9e51-9f4d-4394-1af0-08de4d179342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N01OMXNlYWQ4RGc4V0toS2tvbXdxSUdXcXlQcnF5SXRNeEcxakxBdVk2Z0lz?=
 =?utf-8?B?UGlpNE1HaW1FSEVURXNpT2RESHAydm5oRUZiQ0J6OUgvb1pIUVJOVEFRNE02?=
 =?utf-8?B?emNncmRXU0ZLT1JIakU4Z2dpcWdXbGxEVVZZY1RUVjdCeXdZOTdmd2s1Y2Fv?=
 =?utf-8?B?TllORnJ6aXp6RzZVTG9UT1h0WnBML1BqNTlzVitvYjRCRWJHN3NOdzMzT2VN?=
 =?utf-8?B?NUdlYS9rK1RqbVl5MUhxZ0NUcUdhZkFqQXM5bEFLQ2lGOXUxTVZrZUpESzJD?=
 =?utf-8?B?c2FJY1F1MTdwZnJSb2d0REtEbGZpaXZWcStZNnBvRS9YT3E1Y2dvUHNyTEJF?=
 =?utf-8?B?Y1hiL2ZkdlVMK25UQnlVcjJmeDkyYUhmNFY0WXY4QS8wczQrY1gvSER0cVN0?=
 =?utf-8?B?MGlXK0trdCswNnVaWk8xU2dvd0YzditRZVE4TC9oa2FvYW5nUWRWZlNzcUZ6?=
 =?utf-8?B?WGpJNm9wT2ZFNk0wcUFqNzFWQWNiN3YxaERwa0Y0N0phN05SN3haaVQxZVl6?=
 =?utf-8?B?a1BXZGpTZG95L3UxaU5JVTYvMWNnZUg1MVFyd05VbHhCdDZDSGhNZUFvQlRI?=
 =?utf-8?B?c3NoSEMyRUJnOGdDeGsxc0VTSnVrQXdSaE1lNW04Z0ovSTh3WDRlVEpFSGtM?=
 =?utf-8?B?dEx2Z3dFTzM3MFlzRmI2enVtYXFyQWRKWDNBOEhXQ1F1SXhrVGd4enBJNVFz?=
 =?utf-8?B?WDdEN2M2cmtSd1pNWW53a3UrdjdyVTJlM2REbkFMdDUvVHhmdFQyUDBab0ZE?=
 =?utf-8?B?UDJXWGZUOFNQUlhQdmdPd0xaVjF2QTFxalNKRUoybmhySlpGZENGT1BJZUNC?=
 =?utf-8?B?OStnWElCYXR6TDQzYlVabUg4S3ltc3hhOTdYQVo4M0VKNXJMOSt3Rjg4VDQr?=
 =?utf-8?B?VmFkNXUvWGpSM1NCUkx4d0JtcEVTL1U4SnQ4ZjhOSkc3bHJYMDZKSllYcmt2?=
 =?utf-8?B?b09CVEpqRUxISVR6cXA3a3lBaElTZzdoYmVWNG9vRnFvR2dDcmFIRlNWb0lh?=
 =?utf-8?B?SmtiNk5jamhoVmVnM0dBRmJwaWhFN0M2eXd2L04xUmdJYW1maTFyZlM1dS90?=
 =?utf-8?B?QmdMeWZITnJlYnkyTFJtN1dwWXhGekI3U0IrUXBSa0RCejVXYU9XK2thK1JF?=
 =?utf-8?B?VFBxMWovY1dzb2FnbmhHRnMvdFhDREJGOWRwRytjZjFKNWg4UU9CZDJ4V3ZR?=
 =?utf-8?B?MGdUdkNLT0Z4a3hhd3pFVFpXeW1nbzhvZ2tGMWNOKzdGaVNBcERDbThwdzBi?=
 =?utf-8?B?TkJzWGdwdERoNW1vSjVDVTBiMGtLd3ZvSXlXaUw4WjdLSmgrMlFSdkxtNUIr?=
 =?utf-8?B?Z2RDYU0yUElpeVdVeDlLekYvMGs2VkhoZlpSSmFaUmp1clFCM1ZBdzV5VUxR?=
 =?utf-8?B?SjRmQWtsOFM4OW1iN1VQKy8raEVOOWMyTzF3b25mY3VRNWRPVzdTZ3hycGVa?=
 =?utf-8?B?QXdGYnBBY0dWaDdpak1XSTN5bjA4WE1UL0E5NnZSWGIydTdscGhiMlpuK3Rm?=
 =?utf-8?B?bkt2UExjTUlSa2lxUmJtU2c3elFyVldMeGkrU2JPem1jWnJUcjd3L0I2Tk5x?=
 =?utf-8?B?eXFsL1M2bzlqT0RKUHJVY2Z0S3hSUGRwVkhUcVdzei9aOUNXWitBRWdSd1dC?=
 =?utf-8?B?RGh0UlpxeERBcUtNUU5STCt3WWpZa2FuM0piQWF3Vk1EVTVLNjZDTStLTEFv?=
 =?utf-8?B?dXlQRzA1M2E0NzdDbk9XdjVaUVJ1SCtkSFB1ZWxnZHJNalZWbVNocElzZ1Jy?=
 =?utf-8?B?QVd6NTJGbUc1VTNVS3plamlEYnAxaUlobHY5WW9oTUN6N01BeWNWNjRKM0NH?=
 =?utf-8?B?dTFLdVp3M2ZGTStIVUswdXNtdEVnZFJnNmg5bVZ0YUU2YWhmNVJXY3BuMUNS?=
 =?utf-8?B?OTRZUkliZGJ1SDhPSXdPNUUyVmM3SFYrUE9keDdBSXhiMWpFdVlDRXRaK2Ey?=
 =?utf-8?B?emlLWnFVRDd6aHd4eWptS0lzQnc3Y2Z4Mk5lNUVXM2k5YjlCMXA0L1UrWjdk?=
 =?utf-8?B?bmN5RWZlcWRvL3lySE4xd1lDUDZmRDQrUHZseWthcy9veGVYOGVlaThwd2VN?=
 =?utf-8?B?UmY4ZXYzQzREZDNnTXk2MGpMZ25ueElFZjBLa1hHOEpBVlhJaHltOEV5K3l1?=
 =?utf-8?Q?HzcA=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:38.2180 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f17a9e51-9f4d-4394-1af0-08de4d179342
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8267
X-Proofpoint-ORIG-GUID: kKXz_bg_5O760NSSpOLdtmYICvrHHfZ9
X-Authority-Analysis: v=2.4 cv=SvWdKfO0 c=1 sm=1 tr=0 ts=695cf350 cx=c_pps
 a=eA6Si6SkEuWiTqqkjrLcSA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Ii93k9UUb-fL06yTcmEA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfX9NhRftH25O4q
 +kBusgje//TOXcVqHb8Uh8lpqg2MdtxN0bI5/9yo8KDVN4I7ag/QRfqaqmWjL+xBePwR/9SCqkr
 s6Ezn6vNVgZlOFJLauxKwLr5qiIN5ffz09zeI6wvGPP0qIw84O4gSGzrPphOSxVxQDOjWEJ/LzA
 +ydP14XVyLYx6KZqeEJo3aWHOv7LrHJylo8J2brKketDuj/qN4dWM0aElu5B4lkbtNCIsVBZYI6
 yNKA4ift15uoO2blm2VxfxaRoQSTpyli8MnaXjDb4Kd5OFQvBCMLzNgFHrxMBR/78u6S1Jm36kM
 vvXZ0p2ElgZvyuaopHgNyXX9nwijG2/NKuktYtbLz1B+3D3fC8vciCikBPJAHYpxEujoI9XXeo7
 AZo26wurZ+jGtqlVbE6DZ62ADSlIw18u7uScBWO7XCWYYDKSEvXKxsY3bdOjDVgcQvbnvmeYx3+
 t7+DUAXnmBOV0hCqlFQ==
X-Proofpoint-GUID: kKXz_bg_5O760NSSpOLdtmYICvrHHfZ9
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

Introduce the sram node in order to be used by drivers
requiring SRAM memory space.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index b1b568dfd126..85cb0f16ca73 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -123,6 +123,14 @@ soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		sram4: sram@10050000 {
+			compatible = "mmio-sram";
+			reg = <0x10050000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0 0x10050000 0x10000>;
+		};
+
 		ipcc: mailbox@4c001000 {
 			compatible = "st,stm32mp1-ipcc";
 			#mbox-cells = <1>;

-- 
2.34.1

