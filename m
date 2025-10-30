Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 879FCC1FFD9
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6C410E264;
	Thu, 30 Oct 2025 12:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="ERn9T1j9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1B3510E261
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:24:32 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59UC8BVI1825044; Thu, 30 Oct 2025 13:24:20 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com
 (mail-swedencentralazon11013027.outbound.protection.outlook.com
 [52.101.83.27])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a3be3qgtx-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 30 Oct 2025 13:24:20 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/a/P3tQcG++OmZ+H0DSCYVfbXmk2GmV3/s8tUA77fnT5v0dKPkkfWT9kMl+dE9qzVUaFEtOs7CY96gdtPGED9aPjfl4hi31KXPaA/IHy5tuU56g5dvvBKyM0WkggqEjkqVybbi8WejgAq+8fBJkHdwz+RhcdX4Y/LhNjSRPhn2S3d6Mr/qfupK20mrIoPv1Ilaa3wZrl7rrKwO5Ua7pO8Mo8KT78vEau7zIF53JW71gXYkCn71WTu55lO3JYni/ab5h+Lg4eeuZjzdJnA73YdS4uwN2pHJlwG3se5VHLItf8KGleptViA3mMeAhV29H/49fGrXnGgGQdjS/scppWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=teDJDBHEftBdK1FBmPC6vmdYq2a7Xmc7b20LNCbPoDU=;
 b=yR7WQmP9rgvtMTMcgVqw+tRBMdj8iowyPQZlxEjqbIGYSUWetyFtgmEfsmnJlPKY70tJmPIJdw3q+Pm3RcKXEWOoBNn2SuWChN0ZT4CVZrbjQrqcHFMKLGy77s+NnQHh9ZewIPpHCqp5bDoiyXe8d2xWfFM+TK4iurbGO1ycKxt5ZX1myNIfAjkMY1O3ISP1qNTZqxucQC76044HuGNaoYbaBDwRWJk7GDUbecHrCQBSArZsjthxmyHId5mTwkzWh4boxbN8Cq2E9Im3VwxAcYEJfYnpAFBVvzSUGi/WfQlH9DlZziFGy2X8UrCscESYxlM7/mkquEfipNkLemysOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=teDJDBHEftBdK1FBmPC6vmdYq2a7Xmc7b20LNCbPoDU=;
 b=ERn9T1j9G+M1FFYVQmClcMRQVPz6jrJupbhk/oyDDYHUaAYr9wb+5Ky1uYSHVgiWIr1NScUCJ5elfuWsxQk0xb2SXppCbGVVu4uR/Z3nbqAS5WYxiF16JUk7Kbfi/kxYWABNzNoqJB+9tuRN9ybE6ddewQateHC93sRI1XzRohBuspW1G2HNxMcLQQB+yKiNaC10vYDWV6rQ36KXC0vw0VOLOIEd1Zv/8jBFrfxMA4uA9Nn48nRd28fH5X803n3EElA0fiXWryZP6+7RKe4f/B8xOoLwhXeULq0g/WZy1FE7zb0w9Ut1jeKgw0iWnyPhAwLTQn9OtObDqGeBw3g0AA==
Received: from DB3PR08CA0031.eurprd08.prod.outlook.com (2603:10a6:8::44) by
 VI1PR10MB3677.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 12:24:17 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:8:0:cafe::fe) by DB3PR08CA0031.outlook.office365.com
 (2603:10a6:8::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 12:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 12:24:16 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 13:16:50 +0100
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 30 Oct
 2025 13:24:15 +0100
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Alain Volmat <alain.volmat@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Rob Herring <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH 0/4] STi device-tree display subsystem rework
Date: Thu, 30 Oct 2025 13:24:01 +0100
Message-ID: <176182689493.539115.10161158981199009293.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF00050A00:EE_|VI1PR10MB3677:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c83395-a435-4118-8a48-08de17af3e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|82310400026|36860700013|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QUM3WEFaQnE2c0VUSjluTjZodTl1Y2NVQXV0VDZuSGRKRGRDYnpOeUcwczg1?=
 =?utf-8?B?WUFFd2h1V3JldVJOQ3NxdzZPK1JqWlBzSGZsUExSSjlZcE1nc1JwZlZtYSs5?=
 =?utf-8?B?WW13eWEybWF6V3h6ckVaYXVTcEhnVzB3aWt1ZVZNd0RDckp5bTJwMmlVVFhq?=
 =?utf-8?B?UWlzeXV3OSswWGNaZy8yeU9waTNEcUNtTnRHOS9IYis2ZGZrNCtIanpmcGtD?=
 =?utf-8?B?eHhBeDFSaVB2OTVNR1dIM3gzT3ByR1JDampWNnVrMnJ6SGVkUzZpNnkyOUR2?=
 =?utf-8?B?amtKc3ByVW1mTStRMThic3p4TzZadnRyN05DY3BLTlhOa1BVUnJsZmRnYXd4?=
 =?utf-8?B?TXR2UWFYNDhUOVdUa3lMMFJKZ2JFV2hPYytZVkQ3d203VlNYYzhWNk4wc0VN?=
 =?utf-8?B?eXUzTjZ2cndXZGs5QXFEa2ExNHlYTlNkQy9OOWljSjhabnJTb3J4QWVRNHJ0?=
 =?utf-8?B?NEVpMFBvQ1pXVGRYRWhtMzg2KzJEMVNXV2hZUE1aNVhTYnF0Q01oS0V4SkNL?=
 =?utf-8?B?VEpITnJ3eklIRjdEeEVaVjk3STBrK3AwVTZjT3BJalJ5ckl6ZElNcGdmbGxt?=
 =?utf-8?B?SThxdWZyR1J5SUVWcE5LSVZKdC9adTB4eEVXWXlGL2JJZTkxbEpNd3V5cEhz?=
 =?utf-8?B?Tjhuc2hWNENlQUFacVcwaUo2MUtYQzdXYUoyaFJzUmxSQ3RSQ3poaU5zMXI3?=
 =?utf-8?B?RWJid0pIKzViRUY1bzBuZER4Y2lrL1krL2R1ck5EWXpuVmxOcytGNVJkYkYr?=
 =?utf-8?B?VURPQ2Y5bzdER1NQbHRvQ3NLOVVXUklVR3RNQllYOEIxMks1OXNpcXNJUTNr?=
 =?utf-8?B?SWJiM3cxNGkrQmdjbHl3T0RsUk01TjlvT3NoRFBkQVlFS3NqOGlqNHM2cjFD?=
 =?utf-8?B?UWdXS3lsZHNJS1hHQlNUcjVCUUhuQ3lhWG5GM1QwOXJqclZkN1dtcEhwcVBq?=
 =?utf-8?B?S1RMUmM0TEZuMFpHbXh0MDlsNVhkZWdiRlVlWkNnUUlYZmxsR24zN2J3aGVm?=
 =?utf-8?B?dkE0cjN4LzMvOEM5YzJrY0ZlRzQxdWtyMm9WcTZocFRVWm00RVRudkJIcWw5?=
 =?utf-8?B?aGdaZ1p0ZXJBMWVtOWFPeFUzYStncUtPOFZFdEFSYlY3QU9DZnMwaTNaQzhj?=
 =?utf-8?B?YTd1Wmk4UENZNVduZVI5bWlmNkVSVUdwVDFQZDd3WkdqSlQ1YzY2N2dhcnV3?=
 =?utf-8?B?ODNybUlFZzlUQTZQbFFldFVmVlduWU1mb2lENXpRdFplS2JXbzAyWHY3QVAy?=
 =?utf-8?B?MkowVjRSN3l3b04zQmFSK3FNSm9GaStTSDZOaUFkZ0NPZ09pcTBmUlh5QU5W?=
 =?utf-8?B?T2dNSDJTd3V5WmRleERNazdwZk1iRU1UTlYwMU5oeXhCd0RxUDRXTmZIODUv?=
 =?utf-8?B?Y2l1TzlGSExOOXFuUGJEV1hXdFVMckNJZWFBVUorZEVlcXAwV0JaMWRXMVc4?=
 =?utf-8?B?ci9LZ2YrcHVQOXVoTjRia2wzMk11WGhIOSt1TldBZTNIWFJwNDR0eEVMRCtL?=
 =?utf-8?B?R1ZQRENNSHk4MWFRUTcxMWpnRlNrY1paV3Y4RG81b2t3ZXlsbXVQcVM2eDlx?=
 =?utf-8?B?WTl4T1JYTHNUVWJheExJRzE0dXdKaXlaV2R1WGNkbkdtWDY2anJiZEVCeDdG?=
 =?utf-8?B?MHIwaHZSUmxGTzBYR2ZoVWQrNWFxN2NOZGhwOUd1WnpoZXJVRFBUcmJtRUFD?=
 =?utf-8?B?Z1licnN6VjdVMWhoWUkwMS9KRWt6R3BXdHc3d2F2ZWlQT0o3ZEVRMWhnSVRU?=
 =?utf-8?B?dFNOV0tVQmtHV2l3L3ZLTUQvWHphbk1zdnpoN1BJdWtKSzdZeS9DQzNLYUJs?=
 =?utf-8?B?WUtKYUZVNmhZNkw2NVQwdXlQaHFRcmtuSXM3R1d1L1lCeURhVUQ0aHFsaGov?=
 =?utf-8?B?UE9qVEg0aHNVTjNyY1VSSzNyd2J1NWNBYkJTZVphdit0bWgwSGk0NlZjU3kr?=
 =?utf-8?B?aGxhZUZpMkFIZDA3T013MC9yMDJZaW0yUmJlbUpCM0VqTEcrN2V1RWJaQ3Zo?=
 =?utf-8?B?OFoyWlBMcC9WdHU0aTNkZUlqVGxKM2RSS0pkVGxDQ0F4WDNLRVJUZks1akVR?=
 =?utf-8?B?dEdva2NwcWl3VUxRMUlraGlXcUUvR2l6WUlMaGlrK3lSUkVYejl5b0ZCcnZz?=
 =?utf-8?Q?zPXJ69k4QUwvXMXSoden3BgqB?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(82310400026)(36860700013)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 12:24:16.5323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c83395-a435-4118-8a48-08de17af3e64
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3677
X-Authority-Analysis: v=2.4 cv=JMU2csKb c=1 sm=1 tr=0 ts=690358f4 cx=c_pps
 a=djv+0Ku48OCssmBaYLPmMg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=0a06FGITD3Oua5La8VcA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: fPxzu2hogt7LAmj6RYknE3kBb26zMPHj
X-Proofpoint-GUID: fPxzu2hogt7LAmj6RYknE3kBb26zMPHj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwMCBTYWx0ZWRfX+GCa8zb5sWgf
 MV9e4J/LTcFm5lf8PzSx4585O8jiUkFeRlvKaLx8I3bKCBSrqwSwUUIzmjK3PO9C+4Llvw0R4Ie
 nUHbdB/T5PrvIH1FICD8ORYBbv34MgGIUWsf/LOAfOVLTxfHBvLX3pTu40TUFKJx9uw9eeFN1sj
 7yOtOlowdA6xJnaYaHMVGCEE9Fv1hZiwNkxWNdSGXOU9mJaDGbf+l7z76R8tY9q5JmOg2NLNC9a
 AAxL89UvsJ8pS6WRS1kKna5TRrEAwkwXkTBaLEsnsXLx6Z2UYZoCgxs6mb72DZy2zESc7aZSnOJ
 CsK0U6haGFB3V2w8WITcwD+mbBY6EPbC4qQzWfpn1fDqyA0/N7WKHBR6tZlVjV01XvuEYGu3Cuk
 6tQUgDHjNIbHru5xQTTJNlezzyOPRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300100
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


On Thu, 17 Jul 2025 21:15:31 +0200, Raphael Gallais-Pou wrote:
> This serie aims to rework the display-subsystem node, which was
> previously included directly within the SoC node.  This was wrong
> because it is an abstraction and describes how IPs behave together, not
> what the hardware is.  Instead, extract display-subsystem outside of the
> SoC node, and let IPs describe their connections.  Doing so helps the
> readability, and eases the understanding of the hardware.
> 
> [...]

Applied, thanks!

[1/4] drm/sti: check dma_set_coherent_mask return value
      commit: 76f396696efe702be3564a67f9d2136778f4713a
[2/4] drm/sti: make use of drm_of_component_probe
      commit: 94095f9cb237a933b9b652e60463f8050d36de36
[3/4] ARM: dts: sti: extract display subsystem out of soc
      commit: 7891011fbc9a5e0c07af7c032ba04a2e16587c2e
[4/4] ARM: dts: sti: remove useless cells fields
      commit: a66e078c339c3299e3fd7e564d85c3c36856b25e

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
