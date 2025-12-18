Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232F9CCD3B2
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 752CB10EA66;
	Thu, 18 Dec 2025 18:45:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="jYL3RBU7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C2410EA66
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:45:23 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIHCQix3428017; Thu, 18 Dec 2025 19:45:10 +0100
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013062.outbound.protection.outlook.com [40.107.159.62])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4estj6jt-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:45:10 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B+91MYQTmexXXtK34S6sWhSHUYuE99ctarfgjkOJv4CuvrkpaDr8ZK8/vqRoUGhhRbVn1KK9nl4WT5RuJ8WEm3UWeob7yyeVqzOdiFCahMIdEtql1BqX0DkLVnE0Q8Z4+A32rPlmTEhb1UJKVRUurb2LA/wZe+YN1DvfWtHiL9qk/kY9DI2eJ28ozwxhnJJXtzzhpzLg2+eVghMOqm15neidHyc9fdfKWUuzow8TGXRJMpdauvX1/FKUelvSPgyiDMWxiEKG3a95nTb/O5BdRLTsQfClZoWFZx9vdJcBQiCaRSnfXxkC7tjo4+2zXqe7gaPCUPxeyx3RmD/ydYxwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ntl8h/8bWszmC95ym/6/+u5tx0J+S3z3nBACqGFnURU=;
 b=OwGAjFJTCzXDQGoL4wrh8vp4A6cBUR9ug/nXvHAX9m/1HBpe1+I4ZsYlqK/xjtnyUMX8ST9Hf4/7A0+/AfWd0JhULZFEXjCLp3RT/j7KCimZIgqEmjGKVCElZvW0NJLzWr8aBkZIrTFPpmSTyhXro3qnxPhTHUEM1+L4MX3GgvdQj7Bi4M0YDI1PZt3F1JHOGdnYX2Sd6rr5+rdN8EreBMfdAhzrB1CmaS/c10sRtG6KrKfhEHMteeFEb1aEIVmPap2CxhPDOxvsbYUo7RkdhsQyIk+Eo3+YlRkuoQkLy90Qmidr5hoqQp9H0JY6hYTHc91ElNbjyZbzzr6WfHPWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ntl8h/8bWszmC95ym/6/+u5tx0J+S3z3nBACqGFnURU=;
 b=jYL3RBU740WE2DWBzJqbUSe8E65h44+C9d1+Grqt0EYKa9On1WKsFRVUEbSOAQPvnHCz5B7X8TESRQgTn65TCEfwlEGyvQXiKEgB8nEnvayUE1Uk1MEAg0MVEF6KfReG9hWjUxKaGmoXXhR1z4fOiHdsBnrDT876wb6W5g8NvkAzPCX6jjon60HuAfnvEhz5nB2k3q177frt4QjDPcq1sDtwhy23KL9qeMP8nkFdCFvTg4B5RtWkidGbsNX77s2Buq8//bNy+9cQQqhrI85EjngRTO+XlyRtvu7tz2TJKlvKUyivXTyQGOObY1zf9eNlzMWNNFh73SA9JL5iccOV2w==
Received: from CWLP265CA0312.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5d::36)
 by FRWPR10MB9209.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:19c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:45:06 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:401:5d:cafe::c7) by CWLP265CA0312.outlook.office365.com
 (2603:10a6:401:5d::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:45:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:45:06 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:48 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:02 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:52 +0100
Subject: [PATCH 12/12] ARM: dts: stm32: enable DCMI DMA-MDMA chaining on
 stm32mp157c-ev1.dts
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-12-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000190:EE_|FRWPR10MB9209:EE_
X-MS-Office365-Filtering-Correlation-Id: 88828358-7ce9-4036-524a-08de3e658ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|7416014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDZ6ZGxBZFVDVThFRzdGZUFXV2lSdkRpWjRYZUsvcVhmbHpOV3Y1aU9uY0Zr?=
 =?utf-8?B?STJaZmc5S0N1N2RhTG01WnpkMVJwY1lXK3Q3SHlzL080K3lNalJrVGpJZXls?=
 =?utf-8?B?SUlPaEZlMzlhQUZzcEg1VTMraVM0R0pKTEI3dXNBdUMxcjhTazRBZ3NEd0Nu?=
 =?utf-8?B?STk2K2dPb3AzZC84WUVxdGFLd0RqN3FnTjF4emEyU1ZXMVRQVkFRTTEwWFho?=
 =?utf-8?B?ZTRJa2Vvc1hXblV6aitoL0x0SmM0KytCVXpNWXhOMk1tc2R5YWxHb1YvUlhP?=
 =?utf-8?B?WEhoank4eCt6bWl1MHJ4MDVnQ2JYeHVXa0wyK2M5eVZsOWk0R29TZFl4SFpX?=
 =?utf-8?B?SVRhUzU0bVlvR1U0c3ozSUdac0FlYlFuaEdkcm9lUzgvVnVIVkFWRENmUGh6?=
 =?utf-8?B?YXVKWWxaTE1mS1ZSWGJ4RWM3clpLWXdlVjJTZUI0bWFOTXg1V3kzb1NOSDdW?=
 =?utf-8?B?bXhHUmtpWDVuTjZpN3ZPVlRTNDNkS3IrdkVuejZjUnU1VXlWZThtd3puK1dZ?=
 =?utf-8?B?Wi9NaEhGL0FnMThhS1hqcENPWitJbXhSMkl5WHlDUUZ1Q0I1dXVXUkVIRXRF?=
 =?utf-8?B?MjhZY3AvTTNxblI0WW5SMi9VWWl1QThnZ2FqbmRyT2cxaXRLUWYya1JBYjhJ?=
 =?utf-8?B?NjhIVGErTnJ3QWpyUlF0eVRMbG9tRnRWVkFaZGEzQjhneGpBSTNKdG5SZS8v?=
 =?utf-8?B?em4yanZMT1dpLzVQbFZDSXlxeUhobmEzUCtycC94N2ZMaTBMRE1kS1I5R01G?=
 =?utf-8?B?TmQ5MDVheEVYbzVPT2h3QlpTejBqVjZvTWZBaGlObnRhVlVMb0pnUUMxU2dk?=
 =?utf-8?B?WWJOaEdOdWFLUWRuRWdkZFk5WjVWbStmMVBqNGd0YjlhNzBXR05xRndkSG56?=
 =?utf-8?B?Wmpod296REtzWEN0dVVhVEJhMFRJbUlocWNCRnVwN2tRbndxamlqQ29SWnZv?=
 =?utf-8?B?d3UydEdrdEZLb1Q1WlRVRmJuWXNnclh5SEpPMG43M2lBS21EUk1RTGlUQmVt?=
 =?utf-8?B?U0J2N3FzUTl3Q0x3WkpaVVc1U2pwODBnTWxBZVQzeUFoYkFWNm1qajZoYXJX?=
 =?utf-8?B?NytuWDB6Mk5mZ1ZCMmY2QWpYT2xCNjQ3Wk9Tam9FWWVoZzJ3RVNKQytrVHlU?=
 =?utf-8?B?bUtIUzAwWmlLaFBGNUlZT2RjbXM1QzNKc0FMbXFkVEZtdk5zNGs0TlNJRkg3?=
 =?utf-8?B?MDc5d0IwQ0EyUUx2bUNuYlBNNWk0bTdtZURMN04rMUdHNkVabWZZYzlvOXB1?=
 =?utf-8?B?QzlUdEk5RGJlcHRPNy9XTG1DM2NhbVZCbGZXaUZteVRxSHlOaWFXaGhSVlpj?=
 =?utf-8?B?MWdTT0F0K1B3bDF0SEsvYlRFMmJuK0VpYzVxdWxGWWx5dE0vQndHa3pOaGNP?=
 =?utf-8?B?SmZrMWpvTmg0RExWY0ZGMkVNcWErQTlyOXJWdExCVTFzSmVjdW85S0xJS2xU?=
 =?utf-8?B?bFZFOHVuY2hYL1hLRjdEdGNaekJzcUFSbHJYQThZOFRFamtHcGw1ZFVjRU1h?=
 =?utf-8?B?MHdCTTJuWlh1anltdkZZQUlIRWdWZWpDR3M4MGdHUGRCNE5xS3NNR29HRUpu?=
 =?utf-8?B?eEQwbXZyZHVwYzA1a3ZQT3kybUpVT1lCWVkwd3lZei9ZVENDSmJVVFZEOEo5?=
 =?utf-8?B?MTRJUWk5ZGhCVlYzS1I1ZTREY0VKN2ZnVEtDcmM4bzU4Q1hhR1RYTVEvZVpi?=
 =?utf-8?B?dTdIbk5PQ0ZHY1o0TE9KYzdNV3BDcURMRTNPVFFCczZ5K2o4YWMxVjU2V3ox?=
 =?utf-8?B?eHRDVFF5Z1lxdlhPV05ZWEc1Tk9Id1k0YXdHVm4xQ2VmcHVuM1M1N2tia0c5?=
 =?utf-8?B?RlFha1RMTEFjSXV3UDkremVDV1BOTnNBMWFHVDFBU3p5dE12TjRDRUxXcHhT?=
 =?utf-8?B?MThmN0ZqSFUyaTh3azFmcXN1SHpSbzUxSnlTL1dsZzlGcUE1eTNMVEdrRzhV?=
 =?utf-8?B?aDZ0elRONVgyREpKMXhXdndlOFgyTkVZN3ZUcCtrTEM1UFVNbXZiVFBjbktQ?=
 =?utf-8?B?bnR2TTA0elA0aG51eDhpY2JpeDQrR1R4SC93WnRRcVF1b2FRZUk3bW5SN1hQ?=
 =?utf-8?B?ekJyTTQ0bVZ3dVRvNlhOZXFtY2ZqbURHVFNMZlh1VGdNZmUxbUhBS2lhQU1K?=
 =?utf-8?Q?u0jM=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(7416014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:45:06.0006 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88828358-7ce9-4036-524a-08de3e658ff2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9209
X-Proofpoint-ORIG-GUID: _GqIcemEZKaduHEhpYUMAPU5z5I2_IF8
X-Proofpoint-GUID: _GqIcemEZKaduHEhpYUMAPU5z5I2_IF8
X-Authority-Analysis: v=2.4 cv=Htp72kTS c=1 sm=1 tr=0 ts=69444bb6 cx=c_pps
 a=U94nZbzxDQMx9bxMUwdN8w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=dGxqowV4S9dSpVGn0mIA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfXx+W8WpvEPNfo
 LE1KNvoetKt8kd26MzomZwDX3xMz8XSiUqKqQooEzqGgAY8mWkSPPPIp0tVoPsAn97/kg4i+clr
 aC2GNojPUklUjHyfhN6COlL2pPmkJfq8pSh7emhdkMs+f3Ts9EVnRtLJ3hketU54aHc6CM/ofot
 Pk8XQCHdbZWQQRB7jWM6wchhrzKht9u9pFL9aeoWZPhGGsGSBkQt7s9CFo+kCL8hQKLSMsYplTh
 b6S6pirJaNIXaRt2tCyVvii1pfgkUI2VmD7htBx3jwZT0J3uMBNmCKVbi3FKfrPM+sci6kQJxk8
 MHK7L9Pds4Sq0v9OIKe4l+t961S38y1jBT3/KpnHGp8SaZD9JAIYMv1TlfUGMdihIuZ1DItdCjB
 QYCqXxz26qW0NKisDW8YBVTqOiXXcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
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

Enable the DMA-MDMA chaining for the dcmi (camera capture)
in order to be able to achieve higher resolution.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
index 8f99c30f1af1..68b536b0c6ee 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ev1.dts
@@ -86,6 +86,14 @@ &dcmi {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dcmi_pins_a>;
 	pinctrl-1 = <&dcmi_sleep_pins_a>;
+	/*
+	 * Enable DMA-MDMA chaining by adding a SRAM pool and
+	 * a MDMA channel
+	 */
+	sram = <&dcmi_pool>;
+
+	dmas = <&dmamux1 75 0x400 0x01>, <&mdma1 0 0x3 0x1200000a 0 0>;
+	dma-names = "tx", "mdma_tx";
 
 	port {
 		dcmi_0: endpoint {
@@ -301,6 +309,13 @@ &spi1 {
 	status = "disabled";
 };
 
+&sram4 {
+	dcmi_pool: dcmi-sram@0 {
+		reg = <0x0 0x8000>;
+		pool;
+	};
+};
+
 &timers2 {
 	/* spare dmas for other usage (un-delete to enable pwm capture) */
 	/delete-property/dmas;

-- 
2.34.1

