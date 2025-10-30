Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A532C1ED2F
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 08:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED22610E8E2;
	Thu, 30 Oct 2025 07:43:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="U/y38JhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 479C710E8E2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 07:43:38 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59U75G0D1052236; Thu, 30 Oct 2025 08:43:25 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com
 (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3jdnbpc2-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 08:43:25 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+yrTy7wAEfFA1e06/vUIhh17yvSNkfnSnxq1+wJekhYkWNYY4XZynVe9NdwVvuCyHiB0IwSAMPDURvLMhgHRs8qtohjUCljUWyN1nDMn+EfR4EfKAW3ba4wD7b2qb1HUVx8bRJYV2HzdkPxpjHbli+z2OClta6c45i3R2RNHzBtdYGL5tOm7UYf0aYfSryPioaKWOpVFaetFyoM3U+AfFiiUjqOIdihHVWTFoRZYvUFew1dik11W22hvUnz9gAHyRcdh2fec+wbQR/nHDAFLoQL4zm6n77+XC4qXKknU4DXV2lwl3Os4FfYvgPacDxQlGrQYHG1kq6GFba8oglntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MmBgcSCUCqBom9dBBE445H9WS8fm1z+v/XX5IOSEW3o=;
 b=YIV5oOPv5iSvhCf15BI3tBADuwzZsWaP1DEuSfTCCfgA3/GxXG4M/hvgBK3MMP2z9uJ7KTnsvR5dPoZHKHBsItyBEaQ878zVyCryjrUqouP2/LKm7xNP6ow+wIXAp51yikSY1XeSIPuaPyEtAg6brDKxZrhYDYygnlLung3fHxdPJv7uBCMG7Ild9Pk0q54a11Qj8x2DIyyUyLqRk0QMKlQREWX+/HWTe5v12F4RGaytMJ8+h/uQbPoJUsQZbq5s9vOHSowuinM+u3SrYnbj1kDQd78Cl0Ch4d33EwWyTIk3VH/4XMCxpG/mnm2HKb3A8lWNR/Vk2RdlLA5htPy/pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MmBgcSCUCqBom9dBBE445H9WS8fm1z+v/XX5IOSEW3o=;
 b=U/y38JhTS5bVsTyQhzILN7+lUDrkyTbCMqU8n+6mJ9ks/NX/KDYr07i3LyRYbhVgL+9qRH5Asq1FInHVTEHoBMMLaiwucTdeJKzwOy9N6eqCLpNW2LA9r0JWzOooEK71l7lrcacf2iUH92J5rVBEaGlkdLdpcPxELX+1HISxCuQM9EyF1cMdcWZA4IvK3iA+p4tHHxJUqrQGWht1m7SDnzMFqdSsA3jy419ROSPE9YoT+xNHbzt97lrGU0pokpInG8j28rYc0HyL1Tm+om89dLpj7SrLoKrGHifcgX0Gm91V58xmnETUHbolMyGpT/Y12aWU5dNcj6CwnLTImG0ktg==
Received: from PAZP264CA0159.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f9::23)
 by AS1PR10MB5165.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ad::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 07:43:10 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:1f9:cafe::12) by PAZP264CA0159.outlook.office365.com
 (2603:10a6:102:1f9::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.20 via Frontend Transport; Thu,
 30 Oct 2025 07:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 07:43:09 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:40:53 +0100
Received: from [10.48.87.93] (10.48.87.93) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 08:43:08 +0100
Message-ID: <282c7206-e72e-432e-b666-496f3e2ab3ef@foss.st.com>
Date: Thu, 30 Oct 2025 08:43:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] ARM: dts: sti: remove useless cells fields
To: Raphael Gallais-Pou <rgallaispou@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.93]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|AS1PR10MB5165:EE_
X-MS-Office365-Filtering-Correlation-Id: 23d016e5-bb17-48db-d61d-08de1787f8d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|36860700013|82310400026|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MkdiSGp5em8xR01nZ29tUTNVRVBmem9MOTNaK0hxb1dsUU1XVHV5RFpVRVlJ?=
 =?utf-8?B?dytXTm9vbmNadkJkNkFxQ21iTnlzVnJ4WEtjbkkwcjVzSWQ3MzNBbXFwVTBF?=
 =?utf-8?B?Mkp0QytYaXVjYzZMdTBmbDVSbUIwYkNHdllDc25SUzlRaXBDV0ZQT2IrOHhs?=
 =?utf-8?B?aGdHQnc4YW5wdzlaeTBSWlhaVFZkU0hmZXBGMmZKci91WWVyVnpBV1VBTFFm?=
 =?utf-8?B?ZHJsWDVicjJEME9NL2wvMUJ4MlFPdU0xZVVwU1JXYURxblRwT2tNRmVxUG9h?=
 =?utf-8?B?VXdUVkIyL2ZrMFgvdGpGUGtxbGFNNDVxMGdhZzFyVFA3Vk5Jc0lmQ2dYb1Ri?=
 =?utf-8?B?U1N3OVFRODdpMm8vYktvN3hGQ3hhVVQ0QmxjSnZrcjJRekUzS2dpMkthT0l1?=
 =?utf-8?B?K0pHM3VlY1dXMWxlcDd2WVVrRENhaDBMOTBmUzR1WnlqV0pnaFh0WWxjaFZ2?=
 =?utf-8?B?R3RjdUtHSEdpS2dIZDlRTWZoUDNwb0dlVmFnY2dWdDVzWE5zL09RbnVFbjh0?=
 =?utf-8?B?NXBxZDhTNmxCMngvMVJ1WTVKN2Q5TFNkRE0zaWo5NDlUU0xTaWhSOWg3aFph?=
 =?utf-8?B?OXg2SVZCVjcvY2FyOUlDZk1NVExObDJJUHJEUENITkZrSTVWUTlkalJPeVlL?=
 =?utf-8?B?dkorOW5UR2hYTWg5N0pHR1BiZmUvN1g1MlFhZDJYV05XTXloaDIzb05jQWdQ?=
 =?utf-8?B?VUJKU3dVNkhIdHFic0RpYnZCUEZ5SEVMbHRxQmRyQnlVRWtiL3ByWFJWVmV2?=
 =?utf-8?B?ZUUzenp1QWw2MDZHWlkzb1VidmdpTk1lUW9QVjIxa3o2ZENpL0ZGZ0xoZTdQ?=
 =?utf-8?B?TGFMVEFGOXJXWVhGcnZoalpPNGFxcjFJeXhZclhDcmxyZUJ2amJ3b04zWWR4?=
 =?utf-8?B?cEFPSlRiTWtUc0hocmJzcC9kVTJRS3dCemtvVWV6QmlwUXlpSnlwWnVjbW14?=
 =?utf-8?B?NktvOXUwc3NHQm10Ullxa0lLNWFFK3N0dHVsbTZ1S1FKbzFJTUY4T0JnY0Vh?=
 =?utf-8?B?ZlFaNDBTZVlVWDVieXZaR1NkUk9hbkM1cHRWQ1cveDJQVzF4VWJZWi9WUVFP?=
 =?utf-8?B?UVByYWtSRWF2RCtCMDkzRVJYaDBkL1pBVjhkek5sNkVRU3p6Y1Q3eEswaFJN?=
 =?utf-8?B?a2hXL3lEbFNpRXhuRmdjOGxoaERGZmo0WmxiN0FxWjRPZ05CZ0xoL1RGbEc2?=
 =?utf-8?B?S0pWRld2b2N1YlRwcVcrOXJZWFh2SjlNN3IwRFRMVk03UjhOUDdDWDNXWENP?=
 =?utf-8?B?Syt2Y2UrVlZSZmRVdHk5ZVhxNUpWWEp2ODNLQ2o3S0o2WTFtTFNwejdTNFlp?=
 =?utf-8?B?dktJYVJpbWFBSHN6dC9TTTZlS0pFWVJFSmhkYzVqK3dqekRib3NFWU5ES1dI?=
 =?utf-8?B?T1dLbXgrU2QyanRvVzJNVURteGRHSnNpakJRbmZFWkp6WW51R1lDZU9JbkNQ?=
 =?utf-8?B?UFpXTmhyRDFld3NqcHpYenU0R3d6Q2VGN3B3UFUxZk9QbmNtck9vRHYxZTNt?=
 =?utf-8?B?VlV4RUhUMGQ0YUw1blBsOWtCY3YvMFpmUWU3RXZHUHd3SHVtblJmYXRITFlm?=
 =?utf-8?B?S3lvSkZQMGNpT29sUE13LytXeXp6QkRNczJSMHhMTG5hYk9lNnVUbEQwR0dv?=
 =?utf-8?B?Ymk3L1d6dkZhVUcwMDlsajE3SmhOdXZrM3NxUGo3TEJzY2VRZDVIbnhBaVFT?=
 =?utf-8?B?dkxONFdXckpJekZzRzNXVnZoRXhmSHNaSzFkdFZ1R1htV1B2WTBFdzhndG8v?=
 =?utf-8?B?R3lNWHZucUdjZVRWejA1ZmEzZkg4a0RJVU1EYkVSUVBCenl1VUx5RG13N1Jq?=
 =?utf-8?B?Z1QyQTdOdTNuNDJ2L0tFS0tNaG1mTFRvMXhsQUJFZFhpRHR5NFdxSFMxb3Zr?=
 =?utf-8?B?Rm1yZ1JTOFdvNFNRV0w0elJGMjBjY0d5U2FFMGdLUHMrLzArd085MGh0aUZU?=
 =?utf-8?B?NUNmdE9BY0toQzZuU2xrL0xPVTVVMW1XeTJNdXo2bFVucGFmV2F6L3dBSStS?=
 =?utf-8?B?UEQ2RE4xT2g1aUt4NUJpck5Ta3JoUnBja0krTXQzVWxRY2hpOFhoRVZpQUlQ?=
 =?utf-8?B?NTJjZVhFTUdxZkNHYXBUQkN2YmRjQnIrT1JwamdqT0Q4Q1dBcFFidlBSUnlR?=
 =?utf-8?Q?w9Js5LnNxY1bqcupdm0RO94yE?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(36860700013)(82310400026)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 07:43:09.4691 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d016e5-bb17-48db-d61d-08de1787f8d4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5165
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2MSBTYWx0ZWRfXzzkdwQzbs7w2
 Emracmh0I5wgTfge1fpqkhSc/XYsE3zYKDtMe3rholCN5e79TP2EIPzieprGXT1v5GbIGj+ll/Y
 ALvqkvyWVtGRIgJLduTZz/ry7QUJnfFXjL7U0qmHD4q/iRL2ZdaNRxYjt3F3pDewpGDYFWPV9s+
 J0Ub02KswwZdBq2T6hpqJMGeDryCjjsoGTrX5RCo0pZ8C8dJCAuG21y9hC+NaQ3ZhoqVIKPHzZj
 dpIa7/8eswjHZSbkTYGS5Iw1kkPk5rM0CrRSsqGHndsvlMVkmiRUIYlyZhN76q9v2zj2+EPhw+K
 LIY/ASwmPLHxbzyAVjrNdghpf9pSEqgF55l4Un5F9q+fgckKRldiDA9xbs3UAX8Rmw9gGy6aT9z
 J0qGhkZAE6HsDRxYwim2hCYY/VSZ2g==
X-Proofpoint-ORIG-GUID: 3DFgNnI-kVnhS4hgmXwOPKul2bbfamcR
X-Proofpoint-GUID: 3DFgNnI-kVnhS4hgmXwOPKul2bbfamcR
X-Authority-Analysis: v=2.4 cv=O900fR9W c=1 sm=1 tr=0 ts=6903171d cx=c_pps
 a=74JFWqOLuPB2BmQB8CJ9ow==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XWp4PHTOCikA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8
 a=sh6T2Ih-f8sK8ep-gOcA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 impostorscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300061
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



On 7/17/25 21:15, Raphael Gallais-Pou wrote:
> tvout node do not need the cells fields. Remove them.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/st/stih410.dtsi | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
> index 47d66d7eb07a3d73d98b3e21d62b2253aa1171e4..07da9b48ccac16c25da546ace8e6ac5773c68569 100644
> --- a/arch/arm/boot/dts/st/stih410.dtsi
> +++ b/arch/arm/boot/dts/st/stih410.dtsi
> @@ -191,8 +191,6 @@ tvout: encoder@8d08000 {
>  			reg-names = "tvout-reg";
>  			reset-names = "tvout";
>  			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
> -			#address-cells = <1>;
> -			#size-cells = <1>;
>  			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
>  					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
>  					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> 
Acked-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
PAtrice
