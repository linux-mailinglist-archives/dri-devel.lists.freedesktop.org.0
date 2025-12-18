Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E42FCCD4F7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DFF10EAFB;
	Thu, 18 Dec 2025 19:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="P8lRchi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394410EAFB
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:01:26 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIhqgr3422640; Thu, 18 Dec 2025 19:45:05 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011044.outbound.protection.outlook.com [52.101.70.44])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4mg6rm8d-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:04 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qzbomVPO+DcP1h2stOZMNFYGwtq2//nGN+OcgMLl19laqlM/z+53TJFoJ2zFrxcvMlnLjcWobVNSLOo+6OeqRyVcjwa51ohLn+T3YiS0CE5KeaPtsSeaETPDynrSIz2OuvGUfGClQOG9yT5sR5ZTLpLXlD5K9ckJiayghmWElnG+n5VTwmMtLNa9KPAklaXnBNjIdza5xq1jAvgLeb0pQ9Hx/kQksxg3uwBL7I1zxWw++Qtkm3o50DgPU83iPzCJRJHZxKm0AYiHEV2VTy0jqHD1BZhtr0t9jt/uIqM2Kh1KHB4ZvjSTBToB1Fh9X7DNIixZ9wbTGRGUaZO68sOq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edakQd/ozZbMyFPppskNAgAEIqLCZXuxJrJLp52RW14=;
 b=AuMHxrYUbcrORveUcNcQNQT4muHbeCGOSteluotIel1cFE9gnhm3dgPBtlPceH7oNMGIjcdz10/7JQlN4wNrIWa6zsAKviB93MkS6MQSzkwcJSlJH8N11mByKqEk4pFRGoT9plA5bdB8HVKcmuF/P4UCYHRoj0v1lmZ/ygHw+Erq3uFc1hCA8BgX17OfwJRqtTw9ir+eqkUDNjtf0wfTAFJqZzwVrSOrvlXHLToYbj5Qg6IHQKNAneHfKBpMpf2tc2qyYpvC5zuPcnjgTUxJRbugOrHMVDXCOISZg65Bwe22KmH8WVU0DlQ4b/7uiqWUo1Sr6LPJWeEIKTFSb6zFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edakQd/ozZbMyFPppskNAgAEIqLCZXuxJrJLp52RW14=;
 b=P8lRchi7Wd7ewXR+JnKJNA0Mydk3W80HQs8YPRAtI3M1yZ+VCKs3wFpbgQQZULc7jL1NSKsHl0p14tDbYo2C6ZFiqZBZqUGyg6dcHySut31WfECl15tC5SPs/JTI83Ps03awgVOjzJie6uYpfeCaZtKxcRdBnnNfuUzOwDUKQzSWrEIE90PX++S6U8/24hrha7qDi9l34oEy1DDmz3sKe5nJwH6jcpQvDU9mk+M5LbLp4p22FyZif8Qkqm9gnr3HzsdVHc4qX5ABrrFXR+SrWBHh6HfN1oA+iYZUGSt+FDxg0RzP8MHzJPG7dOg5h4Xf3f2pv94gO/D43JY0RCFAkQ==
Received: from DU2PR04CA0063.eurprd04.prod.outlook.com (2603:10a6:10:232::8)
 by DB4PR10MB7541.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3ce::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Thu, 18 Dec
 2025 18:45:02 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:232:cafe::cd) by DU2PR04CA0063.outlook.office365.com
 (2603:10a6:10:232::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:45:01 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:50 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:01 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:51 +0100
Subject: [PATCH 11/12] ARM: dts: stm32: add sram node within
 stm32mp151.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-11-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|DB4PR10MB7541:EE_
X-MS-Office365-Filtering-Correlation-Id: 34c4ee51-cc9f-4219-2b30-08de3e658d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXRGR0RRSU4xdndSdStJQml2cFA5dGJOdUI5TzZiMUhZRHZ3bU1mTFZ1Z3Ay?=
 =?utf-8?B?N0c4MGVTcWI3SU5FZTlia09GbWE5cDhRa0w2NzJlR1ZtQk5jbmxBY0xpV09z?=
 =?utf-8?B?akhucTFsYk1XSWpNMDlPbWVFSEhaR25qUkRyTUtrZDVFVXRqZnRMRVF2UjRo?=
 =?utf-8?B?a1pVRHR6UUdwM2NVa09BWW1zMStaWE9kcEFDQmlVMk9rOHJqOWF0K01MZ0p2?=
 =?utf-8?B?M2xaL0VCeDN5ZWpkL2hId0Y4NW9NMTk3MENKOFZIN0s4K0dsdGF1WkdJK3oy?=
 =?utf-8?B?aTI0bVpiL2xXdGExMW94SXk1WklVTVVMR2dzZEQwSEpIY3h4YkM2eGtsRnN4?=
 =?utf-8?B?VDYxOVBSLzY3VDk5SHNBYmdxdnBMMlVQY1NoU1NoMVJpUStzdnRDVnpjOG9M?=
 =?utf-8?B?VHlMaUpSTFhxUnFBTkhYN2k2T0FBWi9NdTM5SEhuYjFVS3VwZTdPMGRXcTRn?=
 =?utf-8?B?eURmNUdpeW1hMXV3eHJldk1DY21BVFd0UVJkajFUcjhWVFdtOEtuTTVBQmw5?=
 =?utf-8?B?elhFQ2NjQno5WVdtYlZqNDlBblM3OW1pNUJkL2JqQmNnYTFYYUk4THJZSjla?=
 =?utf-8?B?MWpwVmJ0U051aU1HWXFuY1ova0hiQVhXemJNVi9iZWJLYXRzMWtGdFM5SVVE?=
 =?utf-8?B?VXh3TEUwcGJsS0lEdGgyZENqMC9xSk9CbFZuYVJSUENkY0MyeWY5eCtWam9z?=
 =?utf-8?B?aENhdTg3NlkzamhWSHpWK0NLS0hFS2JQTnZZUXd6SytXMEVMOCtkcnphZjIy?=
 =?utf-8?B?TGxUbytROGpXMTE3cks1THloTDF1QmkzUUhhODdLOWhLc09zdVZDclhtNEts?=
 =?utf-8?B?RnB6RTZvdWRISGdYUGplRTB0eEtPdDlpWVIvM0tPcXYzazFMMWE4d0sxOGo0?=
 =?utf-8?B?RUZhNXE5dTE5ejZUWVNVQitvYTdjTVNLME5PeDJkZWtYV2EweUMvMDBmcTl2?=
 =?utf-8?B?SWkyWi9jSTBSaGY5NDgxZkVIQy9GOUxBU0ltWkdNd2FPYS9qbFduQWNyM2hJ?=
 =?utf-8?B?T05lZm5JY0U5VFRscHZYR2hiMWQrdnlBS2NpQnEvaEpXZk84cTZLR2l1d3dn?=
 =?utf-8?B?djZpWFRDTEpsLzRIOWp5R3ZMOVdwMEMzcW96VU82V1ZOTGVjc1FtM2padmJr?=
 =?utf-8?B?WXJCODVOTEVNdUxYT1pxTFJyNUZjSXVUSGdweG96TGtnTkkyRUR6MUxGU2Zt?=
 =?utf-8?B?TmZFNUVRNExENUV1L0wzNnQ0VGpZMXZFWWIvTTlmRVhGVDRPY21XOTRXRnJu?=
 =?utf-8?B?UWl0bkFnZnBGd0RnYkQ2OUJHM2JGczAzV2tyOWs2QnpYU29oTHMxWU9ja0JS?=
 =?utf-8?B?MGpud1BLUElvV2JyeGttcXNWU1hybjVYWUU4S1hKZTdUZ3dKQ09rQWJCeU1K?=
 =?utf-8?B?dVVWSVltbEtmOUw5cUZWb1BXdnJOMmZKRHNtUmQ2d0l4TitDRk1TUjFLbm90?=
 =?utf-8?B?Sm4wallTNkRnK0FhQ1dld1pqRm9SWWJGaDY0UGpPQWdpM0M5aWprNDJ3UDFr?=
 =?utf-8?B?ZGJkZmR5N2Uzc3d6VlE0b2FzQnZ5RUtpcktaS095eEk5R01pbkJ4NjN6V05k?=
 =?utf-8?B?TnFYcm5zNWdRVm9idmppcDh1eXZicFpkeFd1VXB1RUh0Z085RUphb0lPQlRY?=
 =?utf-8?B?bzM2ZnF3UmxlUHNpS1gvWFpIaWFVRkgrZlV4MllOdkY3Zi9DMWFNWHY1ZGdw?=
 =?utf-8?B?UDJUckNsUno3SFVjSkNnVEI2OGxiMCtSZUROdjJDNmVYTGlhTUxhU1R0OG11?=
 =?utf-8?B?eFFGSW9nZkhMRHh3U1FLWVA2UHJBblo3MHd1NGlkUEpqWXJJS2t4VmJjNzZv?=
 =?utf-8?B?UHZMSDVJcnFIYjU5a2tJT1FNV2owYjJFSzQ5dkgwK29xb0M3V2I0WGhuSTVl?=
 =?utf-8?B?S3NQSnQxWTExS29ac2w5R0pvRytsckVjNnZvckFMcFFNcjA5YllGWG1UbDJy?=
 =?utf-8?B?TGpSdStyMlV5MmtwdGVyM2J4RzlTMWdPVnROTlJoVGwzekh3R3ZSZ1Y4TDRS?=
 =?utf-8?B?V3NGcEsySW91TUpLbTBhUVZCT1lnRGQyMlBwSjJ2WnYyNHZWTnJPL2pPSWxq?=
 =?utf-8?B?bjlUeUIzaEdNZFYrR2pMdmxjS2JYM0lsUEs0SzhtamNRb0c3TmJ1T292WndY?=
 =?utf-8?Q?ordQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:45:01.9587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34c4ee51-cc9f-4219-2b30-08de3e658d8d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR10MB7541
X-Proofpoint-ORIG-GUID: YIiPB4BMbSEklHdFb2RcbPx02h4gcLdF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX669JvTW5knBl
 uIkd4qWP93b+G1pqrkT/tmOYRAl7N4XWHDEchN5cmEWY3EdJ48PaFYGp2STPdlXjoBqA4Ri8FBi
 3b2VDmQWHmNaEAByHus2Kc2kUHBwfIZxGQUCGKmDdmhiTWwepHzJRGRtptmq0hF0gURd0gvyWEA
 KpT4OYi0A8GDSglGctvFfbi/OuZDRbKuOZa8YfepIGKZoflpiE9ZFuv5WaiTw2B7K8dgNjltGgB
 ClFjS2KrwOIv7nz3Gy7cA/vOYMq1C9FV6FtwFACvP9eS9lj1ufc1o7cqS0nxxxCFTRE4DGisSc2
 F5ETouxmLn1yRef8YoZA44vGTl/Iq2reUBVBKyRaVaYpq7YcPTOLXVwCvxg+Xd/YF0dQ8rze1yh
 1yO6+QRjFeQ94CBl8D4zUQksBA4tMg==
X-Proofpoint-GUID: YIiPB4BMbSEklHdFb2RcbPx02h4gcLdF
X-Authority-Analysis: v=2.4 cv=PteergM3 c=1 sm=1 tr=0 ts=69444bb0 cx=c_pps
 a=JfuMnXBgBKsvokzdHX+w6A==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=Ii93k9UUb-fL06yTcmEA:9
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

