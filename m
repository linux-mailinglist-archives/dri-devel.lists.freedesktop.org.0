Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0A2CCD55F
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 20:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28E0510EA65;
	Thu, 18 Dec 2025 19:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="VYFKqA8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CE0110EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 19:08:29 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BIIgL8M3420424; Thu, 18 Dec 2025 19:44:54 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4mg6rm80-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 18 Dec 2025 19:44:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwbPQ84zBcPSqPskAc/Cw2hAMg8vZhtqmWTUIJTcpdafRbvRY/8qJH37AMaDQA4viQl7KXaXYRAgAglkEkINekyQCBe2+xbUwrD44KXbkt80QxsBtPyGztXuCzDf+uqEhoU3XVwgSxDklQrZRpop3TJX8z+Pipms6JXKtGd3hebIWf3n08BihBHdT2qESuL5YUdVmhnDM0H52veQ/W05tZc6fAcPXs4g+Y81OaV/It7IaYQKpkTlGb3ufYWobJmOFJGrqyNJDcKTuyiRh8TPzPmu5Mcr6ylT+0BWUt3Q9+OcNvD/0l2NC9YwnMXSBKCJ2t3xL+Ca9zBLzF/MZ+8yUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkRevlaxRqchM5JXCDcZAtAgkbwyGRitREDarFz8R+w=;
 b=kcQLe58Jy6fQaoUxxOxKjCSiFd5vSXcXIK+bhf8wKI/XJXETNDL6xDq2pOjrY45RAk4y5MU8seCbGsmNR/2nM8bzGF7s5NKOWfABChZ06exnFHPsMeRTmeAarQvTRQD8VdZTFwf80gW7BbHfnNankHoTAcLKk3hwHbQVMjtoRfRFzyLFIF9yO88oSk1IpM55p07Aoz/nGT8Lb34M+IpBSkfE/nIiC0WQNom3ELCId8LB8ZCm8VB8H5LE+DM8tX3Qr4rcQqLwx+C9yvL9B/9+55LUVkuSEtoOU0ytna92bmjKI7EV7jN63fbQeOvmli4EdXnHDk8EVkwAY+RYBwOtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkRevlaxRqchM5JXCDcZAtAgkbwyGRitREDarFz8R+w=;
 b=VYFKqA8QGckLYGdaJMI4LdlxTeO7/AUSCFp54D9rr74n8TsCf+alDWYm9b/1k8fNmua0DBNzs70/ggwhwJU/+HkGsrinPzQ9Uq/NWBNI8rZ/l/W3b8m8bzejtwa1Y6W3HPFugmrY0NcE8UBWP0xGrexHmLso4oKI9nmfFjemBm9RuK4JWZM3WQNGhnL/77dsxZUdm+WbJCqqWOefYJom3lyIJpDG7CrK0nuYYc4bNK+A/V38iSX9/zObjB2jylu2utTFqSse+ucz2ZjZM+ioxJO0hsysCxPkA05XJ/Xs8rOLonAcgFKX9vRfOSWc1t15UuM7fHsWCQ7Chc9xtHVhQA==
Received: from DUZPR01CA0244.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::13) by VI1PR10MB3184.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:12f::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Thu, 18 Dec
 2025 18:44:51 +0000
Received: from DB5PEPF00014B89.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::d5) by DUZPR01CA0244.outlook.office365.com
 (2603:10a6:10:4b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 18:44:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B89.mail.protection.outlook.com (10.167.8.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 18:44:51 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:45:39 +0100
Received: from localhost (10.252.25.7) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Dec
 2025 19:44:50 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 00/12] media: stm32: dcmi: stability & performance enhancements
Date: Thu, 18 Dec 2025 19:44:40 +0100
Message-ID: <20251218-stm32-dcmi-dma-chaining-v1-0-39948ca6cbf6@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJhLRGkC/x2MSQqAMAwAvyI5G+iCuHxFPBQTaw6t0ooI0r9bP
 A7MzAuZk3CGqXkh8S1ZjlhBtw2su4ueUagyGGU6bbTFfAVrkNYgSMFhlSRK9Diy0+QGq1RPUOs
 z8SbPf56XUj4/gMtGaQAAAA==
X-Change-ID: 20251213-stm32-dcmi-dma-chaining-9ea1da83007d
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B89:EE_|VI1PR10MB3184:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e210b84-d56e-4386-f6f0-08de3e658705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmhibzV2VXRaTTM3UzZSazFaVUNBM0FWVms0dVU2a3g1WFdLODNoT0hSb3Yr?=
 =?utf-8?B?Wi9Wd25ZRzAyZlkxZHFoaFVWa1RGZFAvUTNtZHk3QlVPUHM1TEJHcG5wMyts?=
 =?utf-8?B?OFFnREh0REN5Ry9PTk1tMjlLcUg4OWtmd1RpZVdmcXcwVmFjck00ZHdqdUJS?=
 =?utf-8?B?NVdaRzNQVytHalZXSys0dmVxM1B3NmwwUnZZSGxKS0NwQkJxL0F5Ky9vNGNs?=
 =?utf-8?B?U3ZMTXVDUlMvc3BVWk9lZkJVbFFpS0Rockc4ZllPb3JRK0x2MENDT29KZWhI?=
 =?utf-8?B?QUsybDM0Y294UzVLT2F5YXRMcms3RkJYV2hYajgwOVFIYkpsaU5PMXZoUkFQ?=
 =?utf-8?B?dE8reFc1U29LbUtSQ2lxV24vb00xS2U2cjNzWUc0Y0RvS3ZCK3RHSmxTYk5x?=
 =?utf-8?B?Z3ZDam5wQVJqT1hvY05BWVFrNHVtbFljajhZQlJtWVFNK0MxZjIrSHU4N0ds?=
 =?utf-8?B?Y2c3aGZXNHJPWGwzM0djZEVJTjN1QnFaeGxOTGdKQlpNYkxFdjM4ZXBkN3pZ?=
 =?utf-8?B?VTVMZm5VTTI1Y21zREJiUUVLdmhRV2ZGR0ZVRUtYZWwwT2UzdHo1dkVsenRE?=
 =?utf-8?B?RmVJckNiZVpLdXAxRTRUc3VpVWU3clNvcy94K1J5OGQ2RHlPVytFZDlxYzU4?=
 =?utf-8?B?V2xOMGdlNnlSUlNMdm56R2FVSXlPTFQzZVFqeE5VcXJMd2dVQkNMWTlqZXJ3?=
 =?utf-8?B?RVo4RzZ4d1JwTk9VeGd6MFhsVnhpdzh2RW1UQ0JFMXlrU2ZnTmQ2TXNCcTNa?=
 =?utf-8?B?aHRnNzYvWVV4Q1dUb0k1R0IxZTJkL0V5UzZGWnp4K2ZZSytZOFpsYjhCUG05?=
 =?utf-8?B?VUZ3VVAwZmhhWTNxbEtGeTlMdGRvOGpmejJYMmpidUhnMERtdWlIcnoxTWFT?=
 =?utf-8?B?eDBZMnd5MHhYaWtNeVRlYmlHaElwQ0t3V1VEWFJwZld0TTQzRFpnYitMdUhZ?=
 =?utf-8?B?ZEdrdG8xOE9IQkYxVHpuOE5lYWZxR2ZkNUJLcTN1SWJHK2RHNmtYL2dpVXVC?=
 =?utf-8?B?bk1Bb2x3a0pRWGhyQTF4Y3NVdldoLy9XNDV6SDlXWlNkemYvWk5qdU13aEdw?=
 =?utf-8?B?RmJaYldOcDRDSU9RMkNvZzgwaDVvVXYySkRKYWZKMkxKUU9JR3A4RDJwckF5?=
 =?utf-8?B?eHBmbG1lYWZWTUZaQU5FSmZlVFJ4dEVZQnphL014K3BaMkdYV0dCelB1eGh5?=
 =?utf-8?B?ZC9pTFk1WXQzN2ZnaWlabmRLVkRNYlBMcFNJeUExS0xwdjI0QkE0ZjhaYUg3?=
 =?utf-8?B?RGFZSm0zQ3JJMTlWTk9vUTdWUmxJWEE2ejlpOUNqbEU4RFR2WFluaStKb1VY?=
 =?utf-8?B?eVQvcFRzbjRoUXhLU05CRjkwMlRuMDFVb00wTUxiQTlVTkdBZmlkUlZsUExF?=
 =?utf-8?B?Yk16T0V4M2pRUVVSc2VTV0NNTFVrSjVwUHdQa2doa3U1d1ZZUnU5QVBYY0Ix?=
 =?utf-8?B?L2ZlOVE0R1kwU0FkQityMml0T2ZHUGtiZnRJMS9pRWV3dVA0NkR3bWdYekpH?=
 =?utf-8?B?ZkRzR3ZnaHhmenZrc1Bqc3F5MnYzUkZhdzAxeXlvZVV4MnZBaWE4eUtSdUFG?=
 =?utf-8?B?UVZXbHByZldiMDg3MWtxM2w2dDl6YTd3V2tyNEgxdTlUNUxFSkIza2xGVUh5?=
 =?utf-8?B?bUplcXN5a1NteHBSVHFKMUpJNDRWd2lWOFp2bkdWWG0zVkxKa0hGK1FtMHNV?=
 =?utf-8?B?SExmUTNKOHptSXdraFRySVE1NnNsTG1HQjE1MWNkUy8vN3ZzZHZkWTA3dU9Y?=
 =?utf-8?B?QTZZeXU0U3FDMEtnT1RRN1ppS2NUdmZMRWl0TVBDK1FrRml4UjRYRUQ5aXU2?=
 =?utf-8?B?TW5aeHhBanZxQitVWFVwR2xGa2xGaWlsaytTK0lyVHd6V3p3TWNDYzRoR3Fv?=
 =?utf-8?B?QXNrdlg1Ykg3djdqWndVb2NnMVVrRGY0WXp4cldCWVV6Y1o2ZGNjOHlad05w?=
 =?utf-8?B?bFkxSGtVVHJ4VWhYMXNrQU1kdDRaYk8rRmFQd25uWmtBNGkzay9UcjNvOW9S?=
 =?utf-8?B?SUZSbGttTTV4MUxjZkdXTFRQNUF0OXhHVlcxVGxaZnZiNkRCNWplWXNINVEw?=
 =?utf-8?B?bWNZNkZsVHJqcVRtRFNZMzZoSnVldHVnbXY5cEllenBVWlU3Z0tITVczeGlJ?=
 =?utf-8?Q?nUIQ=3D?=
X-Forefront-Antispam-Report: CIP:164.130.1.59; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 18:44:51.0000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e210b84-d56e-4386-f6f0-08de3e658705
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.59];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B89.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3184
X-Proofpoint-ORIG-GUID: sp_Nq8L3VuwPCa8EKeqKNk68TFIuug19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDE1NSBTYWx0ZWRfX/UqccOe3KcMm
 LEWch3bkG+wdR6A6QrLh9XqT6+6TGVFyGcjTq34BOIkeUwq7APbjy86GbruoHPOklEfboExiJPI
 2DQfyfOZWduKNafsiXq1Me9VY4+ZJwOcNVFLC9+dmPxM6JlCr1O+ukNKDhBlYtrLCykRUhYXbRa
 qGbd28EOnNZTOQEBJHMNBfyP9k0G5s9yJekZPnxKmsFq32A48WE7RFhT4xsatW4UeZRuJtUdOs3
 p2OHLRJJOTsMOMni/xGtvqs4eMzLm0KuimevkwZWVLqiyikraPt03pvhLInWAWkMEixwhFvQ3Ea
 GzTxyYVatA/cYg4jaAhD7Lw7QINNUmgnHGnSO1sGEWRhSMx0TMvxpRlK8lzIf3Fhg07ewj0lZJu
 zJoJJRIHD9AghCmT/AQ2L67JthWLWA==
X-Proofpoint-GUID: sp_Nq8L3VuwPCa8EKeqKNk68TFIuug19
X-Authority-Analysis: v=2.4 cv=PteergM3 c=1 sm=1 tr=0 ts=69444ba6 cx=c_pps
 a=5UuGrK+hT2lFrxBbkKlawQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=HjypFGx7bZcA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=U-LI-j4GL3itxkQhkHQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1011
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

This series improve stability of the capture by fixing the
handling of the overrun which was leading to captured
frame corruption.
Locking within the driver is also simplified and the way
DMA is handled is reworked allowing to avoid having a
specific handling for the JPEG data.

Performances of capture can now be increased via the usage
of a DMA->MDMA chaining which allows for capture of higher
resolution / framerate.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (12):
      media: stm32: dcmi: Switch from __maybe_unused to pm_sleep_ptr()
      media: stm32: dcmi: perform dmaengine_slave_config at probe
      media: stm32: dcmi: only create dma descriptor once at buf_prepare
      media: stm32: dcmi: stop the dma transfer on overrun
      media: stm32: dcmi: rework spin_lock calls
      media: stm32: dcmi: perform all dma handling within irq_thread
      media: stm32: dcmi: use dmaengine_terminate_async in irq context
      media: stm32: dcmi: continuous mode capture in JPEG
      dt-bindings: media: st: dcmi: add DMA-MDMA chaining properties
      media: stm32: dcmi: addition of DMA-MDMA chaining support
      ARM: dts: stm32: add sram node within stm32mp151.dtsi
      ARM: dts: stm32: enable DCMI DMA-MDMA chaining on stm32mp157c-ev1.dts

 .../devicetree/bindings/media/st,stm32-dcmi.yaml   |  13 +-
 arch/arm/boot/dts/st/stm32mp151.dtsi               |   8 +
 arch/arm/boot/dts/st/stm32mp157c-ev1.dts           |  15 +
 drivers/media/platform/st/stm32/stm32-dcmi.c       | 470 ++++++++++++++-------
 4 files changed, 341 insertions(+), 165 deletions(-)
---
base-commit: f7231cff1f3ff8259bef02dc4999bc132abf29cf
change-id: 20251213-stm32-dcmi-dma-chaining-9ea1da83007d

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>

