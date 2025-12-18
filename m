Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D24ECCD49C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 19:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79C3F10E54A;
	Thu, 18 Dec 2025 18:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Dc62nWbY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 735 seconds by postgrey-1.36 at gabe;
 Thu, 18 Dec 2025 18:57:17 UTC
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156DA10E54A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 18:57:16 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIhqgq3422640; Thu, 18 Dec 2025 19:44:56 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com
 (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4mg6rm86-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:44:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQo+mY6RNJmoLjRkw2xUwTjEPz3HfOVesnVdaipLzgidY5prOhH9UZ8SbE80EwKXqe0Hd/jxD/8IWnYv0efa7/zIONwYrWUWiu6aOnP2sR3JylkFaIzbWomlsR1a16aOCZdjP6q4WPYobWRDpYxFn6dfYNrJ6OiN3wGmYXLsnveGJpOkP0JT3HYmi0iDT6A64ulaH0bYTa7MNAmmEY668F+reLTieZz9pOi7nAA7YjDzDPodQwBDBAXqPeKGqh+Oj592ljeIsrUkmdwp5jBcqXiNzTMH0bHgh32IWI8lkt0W6tP7xA2lsxhvUORNVM0M96T8Oo5sqrXMcPxzk02p0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SvrCPTT3Syi7OrXe8XbtdtZNxIAy0YeQQhrUHiGXE/k=;
 b=uVyfSLttHlTScdFxdDmp525TvtB8chc7PuEj8V18+HADbnNkRrJwK7eFRt+W4v1NEACs8JZcPX2xYGXybfUSCaK0aoxCBOdPvv8A7cCO0f3i6bpiUYZT3+25KO1Xt6g6RlbYlqu889LQiemX1PDCLY1rP4AIPgKKvSH1pu58V1ISFofXXzFXCxIV5+ZKJlFMYtOeGWY8jSAUzpqiS7sxpzJOOmbChwo041owGoGPpMCRlLH/oBaVYTEJUO8OJMLtLnK369jVVkTnviSpxDyjjJrWJq4H5rJ3eV346LRJCbQ0g16iZINV7us5gesWd2IBhtw+wiQJmURrv7v6gyJMPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SvrCPTT3Syi7OrXe8XbtdtZNxIAy0YeQQhrUHiGXE/k=;
 b=Dc62nWbYDNS+9uHhTHTAVgLSGm7XHsAgMgnOZv7NOk+aEnDV5YIbC5AnyIhjBnZsLDKSMupq+dGt9fwhV+YgsPeDQfZXePssffuf7y6LKc4gZkEcSR14a66gvCToBEg/+50qc29l1fnc2KurNrMZO3VoaAorQfLO4rgaaOkuEQe4nQVp0SGEdeGO5SDWIVG6ktz20qFezA3FmZPbT1sWtiAa2zBjofxyr0IhMjlySbyfASTmy3Cb9b1E4gTKh+RSSRLgSjkXDaSS2wIQ5QkZUOozavj5jCLr9X0R8GhX2tPsBFOAqnGEbLxNc9xjNQW4pOxh+u9dRKm2m1k562CaoQ==
Received: from CWLP123CA0176.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19b::6)
 by AM0PR10MB3635.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:153::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 18:44:53 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:400:19b:cafe::d7) by CWLP123CA0176.outlook.office365.com
 (2603:10a6:400:19b::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:44:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:38 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Thu, 18 Dec 2025 19:44:42 +0100
Subject: [PATCH 02/12] media: stm32: dcmi: perform dmaengine_slave_config
 at probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-2-39948ca6cbf6@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF00000195:EE_|AM0PR10MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: c7bccc9e-9472-4326-473b-08de3e658842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZTVrUkFpTDBMc2VSVGxRYmxVeUdmaTVWZEhKTHdzNlJ6U0g5VkJpNHlkM0Fl?=
 =?utf-8?B?V3lHVE9XTUtaa1JmZTBuRW5ET1JtZ1Ixa2Y2bnNSbkdzaXNvdXRJRjl6c09J?=
 =?utf-8?B?YmkycUY1Y24wQUY1V2hROWg4V0d6Yk8yUE1ocFFOY2l2dEl1ViswNjI1VG1X?=
 =?utf-8?B?YUV6M1hsS3FldkI0T0VGRmxBdDNzaGxtUTRNbFFyY3hydnBxQVIrVzRLYTZX?=
 =?utf-8?B?d3B0bk5FQTVnaFZiNlBvdGREckYzVUFUSy9JeEhSMXJXVTcxVVhabERGRGt3?=
 =?utf-8?B?TXlqVlNCcGY5Ukh2NEtrY3FHdHhTRFZ2dDZ0NGgySER1L1FDaEF1QitJYzRO?=
 =?utf-8?B?MU9PVERtTStlY2tyeUx0KzRoSVNjZVV0azhySVVUOWltS2FzWTBhRFVjZS9O?=
 =?utf-8?B?S21xTVlOcmp0SzM0M0U3NGpCaUFibitWZzFLNk9oVWRqU0VtbjRMQTlJWkRS?=
 =?utf-8?B?dmsvcTErQk0zQWwwV2U3UnBCMFJXQ2llaU5iSTM0L3Q0dTVKODBETzhyOERl?=
 =?utf-8?B?NHhqY1BhYmUxMFUycUJ5eENXV2JkcEJPbWJyLzRxUmcrVE9qcXdVNmthc2tM?=
 =?utf-8?B?aG1lWExWcmVDVGlDejV4NFFka013Wk91cGkwVm5sYmU5OUR5NFJoT2xMaUJW?=
 =?utf-8?B?VjZsdFhsS2l2a0JIa0lMVU9VMVA5ODFydHNKOFRJODBGMXkwTWlYV0NJdVhp?=
 =?utf-8?B?QUZVT2MzbEpWRi9aeTIva2ljY0ZNc0ZvTWhHeDBNYlV1bllyMG9wMzVBVFZM?=
 =?utf-8?B?aHF0Wmd5UVoxbm82MGo5OWh5aHNvRExDTjM3S0hXOUkvWnpNdVdCNHdvb3JL?=
 =?utf-8?B?VTVjSlVRUjdRUW5vT3BYQlRBQW41TXlHa2VqOGUyZWY3WEtEZEQ1VFUzWTgz?=
 =?utf-8?B?UnlaZ2VzYW41a09wTE1ET245SEJYVnR1Y2pmTklwOENSNW56NWs2WmhmNkww?=
 =?utf-8?B?NzhnM2t2Q3FIOVE0bHJOZit1aTRrL0RrNEY4SkwxeCtPdXJtQWw3TkRXL1VX?=
 =?utf-8?B?dkx0NVFIU0lYbkxvcHh6NjFZREhqTEJoQmJhelhTS3Y5SE9nblc5Qm5wNFp2?=
 =?utf-8?B?aU8wNVpDbnZrVzNUbFAwZnQzQnBSU1FEMGhrbXRxT3E2cEp2L3FkaklGK243?=
 =?utf-8?B?Z1N0dFR3U1lHR1RSSWFJU1JiNkJSSjdYUFIyMllrR3FXNXpqUFhhZFRtODcy?=
 =?utf-8?B?WWR1ZlNvWXJiaFl2Mnc3NEYyUUV0NEI1LzZ0ZG5kUjhDQ1JUTzR3VjdwUWVt?=
 =?utf-8?B?RW00UjllckFWbmlxeGFJRkU1b2pRMW83OTltbWpUYzdyMmxFTUpCcnd3WEhl?=
 =?utf-8?B?Q1JLODAzUERaRHdHRStzVWRhOW5SUzBNRW9MR3B4RUt5TEtyN2lxOGV6aEdS?=
 =?utf-8?B?TmlMdXlybmRpY3d5VW9tWmhwTGFsb2J1Y2c5RWZhdUpzK0E1Vm5TeGJ1ZTN2?=
 =?utf-8?B?cGtzVlluM1NrYXVwa1NPTkdHS1dPSzZmZHpHY0p6cTI4ZzdkbUFIeEpLMDBX?=
 =?utf-8?B?cnFVaXdKS3pqNFZtckQ1b3JhemRsMG5QUktoQ1kzYWZKL1JuTEdTRkZheGkz?=
 =?utf-8?B?ZHBNNGdONC8yazJyQldrYUlYcHg0V0RSU05qaU1VMTdmTFJrbE5GeTN6dFlv?=
 =?utf-8?B?R3ZaV21IZkFyT1NqclRCT3FOK2FZNU9ocVRYV2llcmJ2Nmw1dWkxRlRTMmRC?=
 =?utf-8?B?S1J6RE03aDlRRlpTbGdWaVZsTC9uZEtGbWZXczRGaXZKemFOZHlZQW52N2tP?=
 =?utf-8?B?WnlEUlRrMFVHaFhLVjZUcXF6d1Bsb2JiQURjK3hIOFB4dGpnbU9xYUo5ZXNl?=
 =?utf-8?B?S2dYRjIwOU5JSzZIaGpaNEtEYWJLM2lETUNzT3cxLzdSTGVsRDl1Rk9EYzRO?=
 =?utf-8?B?N0VJREw2czlXbEdmQzFwcFoybUZqVm4yWmlrdXd2OHlKa0t6Z0tYeEI3K2Fr?=
 =?utf-8?B?SVovRGs4YXU4RnFyWFVINXQ4TEx0blNtK2UrVXhEd1R3alhSUUxBeHQ0blJi?=
 =?utf-8?B?bUhwSUZoMEN0dXljUVcrYUZHQnRWdldkVXVHckd0aVBTN3lFTFVieER4RmJl?=
 =?utf-8?B?VVVVUGpOZkY2T05wTlRnNlk0eGJWU096bE1SVkQwSTBNVXlTNFF6WE5EbEFV?=
 =?utf-8?Q?K+Uw=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.60; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:53.1013 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bccc9e-9472-4326-473b-08de3e658842
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.60];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR10MB3635
X-Proofpoint-ORIG-GUID: IP04yWkM6qqxw4S8J48ANldrl1DDdcyL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX79agg+PgkopR
 Io99cZjoLW4dqytx5Nk1OCGrXrQu6YioTW9zo9ZnwN8Gn5GugxOmgWfDgRG8cc1UiOXAT9bkU6M
 nVSUxOtxpFnFOixcTtzBuzlK2SF1kfeb7BoZcdk948NHi+zov6fPOUl1ZoTVgOBM56O9mbAitvx
 wFW/8mydD1HzQ15TfbKWw66cabz2Hrgi2rsO9ksacqQiPifFqTY1typsNZxWgUSBnLozvkR+tse
 e97GCOaQ1UGx9NWA9HeGrPxVrxiBIPSXlBqmIIDVMQUNMkQyvXJk7ekHaOp18xQUiYIPxG3Tjyy
 Fwqp9ur28JSrvgC/v9EikB2m56UUMVUTaltv75lhOgjHMseauKABHTifCcx9l+AcTiz8oLAsP4+
 eTPcVN8ZjEygFHHsJg8i+bWTOGqb7w==
X-Proofpoint-GUID: IP04yWkM6qqxw4S8J48ANldrl1DDdcyL
X-Authority-Analysis: v=2.4 cv=PteergM3 c=1 sm=1 tr=0 ts=69444ba8 cx=c_pps
 a=EUj2RJeRT8nt7VZrk89mWQ==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=JtklpnBJFm0c8pyAJu8A:9
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

Perform the dma channel configuration at probe time right after
the channel allocation since this is fixed for the whole lifetime
of the driver.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 32 +++++++++++++---------------
 1 file changed, 15 insertions(+), 17 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 07b67eb5b9dd..27b283474096 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -301,23 +301,6 @@ static int dcmi_start_dma(struct stm32_dcmi *dcmi,
 			  struct dcmi_buf *buf)
 {
 	struct dma_async_tx_descriptor *desc = NULL;
-	struct dma_slave_config config;
-	int ret;
-
-	memset(&config, 0, sizeof(config));
-
-	config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
-	config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	config.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	config.dst_maxburst = 4;
-
-	/* Configure DMA channel */
-	ret = dmaengine_slave_config(dcmi->dma_chan, &config);
-	if (ret < 0) {
-		dev_err(dcmi->dev, "%s: DMA channel config failed (%d)\n",
-			__func__, ret);
-		return ret;
-	}
 
 	/*
 	 * Avoid call of dmaengine_terminate_sync() between
@@ -1888,6 +1871,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	struct vb2_queue *q;
 	struct dma_chan *chan;
 	struct dma_slave_caps caps;
+	struct dma_slave_config dma_config;
 	struct clk *mclk;
 	int ret = 0;
 
@@ -1954,6 +1938,19 @@ static int dcmi_probe(struct platform_device *pdev)
 	if (!ret && caps.max_sg_burst)
 		dcmi->dma_max_burst = caps.max_sg_burst	* DMA_SLAVE_BUSWIDTH_4_BYTES;
 
+	memset(&dma_config, 0, sizeof(dma_config));
+
+	dma_config.src_addr = (dma_addr_t)dcmi->res->start + DCMI_DR;
+	dma_config.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+
+	/* Configure DMA channel */
+	ret = dmaengine_slave_config(chan, &dma_config);
+	if (ret < 0) {
+		dev_err(dcmi->dev, "%s: DMA channel config failed (%d)\n",
+			__func__, ret);
+		goto err_dma_slave_config;
+	}
+
 	spin_lock_init(&dcmi->irqlock);
 	mutex_init(&dcmi->lock);
 	mutex_init(&dcmi->dma_lock);
@@ -2072,6 +2069,7 @@ static int dcmi_probe(struct platform_device *pdev)
 	v4l2_device_unregister(&dcmi->v4l2_dev);
 err_media_device_cleanup:
 	media_device_cleanup(&dcmi->mdev);
+err_dma_slave_config:
 	dma_release_channel(dcmi->dma_chan);
 
 	return ret;

-- 
2.34.1

