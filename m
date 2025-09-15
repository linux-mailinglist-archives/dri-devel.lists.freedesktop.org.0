Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E85C3B57D09
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 15:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04A5910E4B6;
	Mon, 15 Sep 2025 13:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="Lw7RPPNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBA710E4B5;
 Mon, 15 Sep 2025 13:29:06 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FDIGbo019429;
 Mon, 15 Sep 2025 15:28:38 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010042.outbound.protection.outlook.com [52.101.69.42])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 495kjnmrsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Sep 2025 15:28:37 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVhe1zw4QVgQfw1ILD6tmgBeG2YGkzXWnTNId3XGJ8r2uAznKNxRgvbfBei3eFc5uItdHeDDD3qtyTCnWE5ulUup0pYR59y3yp0CRbIMHPY8PJgaLzObolga8hdfcnugUeF5IttEZXZl4tg97rMmf0BkNNtCNNd8mrPgh+fh1fEAkWnJ8pzW7fwOFPxJnlCiV5U9UZO/Gn32Gjm8tUkQHkT+5a7AD7u1XiKiH8HVpIwf9O7BVzvJ4XVEuv47oQLLLJ68YXz2wqvGAQyxR0goxdt3nv1RTt0prWIWRx3u6E7uLHwvrMhwGtIZNtApiPPOP7M70NfSvOfg056FjX8ZRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xURLGZAjjQQBCPYQuugUccBippYjNT0wEEWc2VORfsg=;
 b=kGAUYMxmO/dVs7citwooJtuArsiD8aGRVOvZxoq59N2qupbEFOj3YWoH8EgcXxHlpwTL2sB29BxUl9o+d/5lLfBCNq9giKgE9qwZc6h5yvgv0eNAnZev3MKuicksJ6yYWxJic1A1vsGnogbz2X13pG1COz95Y+6RTcTZvceK5tI9/94XG7a1D53MGAWTVNM3ELnOkKeI2WAtXWKDWXNfLx9StAlnQZEpw51VttXqQaPgGgZgVlNaWCUNHl1xaFly2DgPTVoqsetvQlY79Gpt66gwlr+vZ70yeuDYpWo3/eCVSHWIOa9dD0MVNTGTo/U33O3tQ6r4fGDvgeKTG63/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xURLGZAjjQQBCPYQuugUccBippYjNT0wEEWc2VORfsg=;
 b=Lw7RPPNvuHjnHaV3dQBEly/Ef1yUutQIuoILpawMmuTFcBxa/uWKO9UjNi2Z6wWu98nCtsHe1mTR5XfY/tb72j5ITOsXvIwO9z3qq53ZVGinigSkvxwLKYb1E/tRbLvjwSGcFg+ej+robJbTFvC4AJyY5Ey8XVq3FR0ed/41OQY8LQvjOF1T1FZb6vrtKYm5ZLPh1ejqP7/Jk5UF2rBhHCreZpWwDYIbhM1gvvM0rFpbUi4S2Clv/viIHcRX7qL2cQdsgzEouYGVVWS2j+slDM1GTqeYpttys95B3e2deJ1HKsPNclh9wOyGQop2n4SSXErELjZJfcJ9pWaD8HVBIA==
Received: from AM0PR07CA0006.eurprd07.prod.outlook.com (2603:10a6:208:ac::19)
 by DU0PR10MB5409.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:328::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 13:28:35 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:208:ac:cafe::44) by AM0PR07CA0006.outlook.office365.com
 (2603:10a6:208:ac::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.11 via Frontend Transport; Mon,
 15 Sep 2025 13:28:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 15 Sep 2025 13:28:34 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 15:26:11 +0200
Received: from localhost (10.130.74.180) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 15 Sep
 2025 15:28:34 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>, Yannick Fertre
 <yannick.fertre@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
CC: <linux-clk@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <freedreno@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/9] drm: convert from clk round_rate() to
 determine_rate()
Date: Mon, 15 Sep 2025 15:27:37 +0200
Message-ID: <175794279818.2497305.12426037384808947423.b4-ty@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
References: <20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.130.74.180]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A64:EE_|DU0PR10MB5409:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c9daf4-e4ba-4f60-fba1-08ddf45bc56e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHJwVkZXbUVMckYxNmNmQTNLbU5Fb1FOUlNzUDNxWFkxNzdqYzVuZ2VwS3dI?=
 =?utf-8?B?L0piYXpCTEJtMkIwMWNxbmVjWEE1eWN4Z0RzVUlFaUpDcnh2RlRoZy9JT21V?=
 =?utf-8?B?ZXd5dGdWU3JNTmlMSXB6TDB1SUFsMk9IMWk1MkhGSDErM2dqR3gvOWJtK2NB?=
 =?utf-8?B?S2VCRFE0SGVySXVETXJxSHVPek1HSFJIeUhkbVNRdXk4aGVrblZIVXdneS9B?=
 =?utf-8?B?V1ZvbGtLc3VVeEh5WmZzQ1dydUEyenovU0ZDdHVnK1dXdmxrVXdEMzlLMTJR?=
 =?utf-8?B?MXZZVHpGUXVQbjZuV2NXZUFzbUdiVnRvYklVRWJOOG9MTkxzZDFySXdnUkFx?=
 =?utf-8?B?eEM1RTEvUktwbE84TnQxVExLZ1ZwU1BEaHpFZmV4RkVzMG5PQ21iREFMYjhL?=
 =?utf-8?B?cVU5ZTRRYUMzc3hGMlFhT2N4WnloVlRoNnlCeEFyTjM0WnhwRVNBMGFiZ25G?=
 =?utf-8?B?ZEdjVk1nR0Jpb3Ntdzh1MVNidytlRVFXZVZpZ0w5VTYxVXVnR1N1NzJqSlR2?=
 =?utf-8?B?S1oycklVbm41MG5IQ1ZvM3FBRE1pYW1PVFIxdnNFSzMvcWVLYmhYcVdoVjla?=
 =?utf-8?B?YU45Njgxb0dSMERVR2RXR3F4cS9TQnZqT21tUmFkL2lBSUJFTys3QnVXbWha?=
 =?utf-8?B?cjZxQ1RraFFMQXVDOHV6b3FkNFQ1RmxYdEJFcjIwNCt4S25GZmRLcGtpS2xE?=
 =?utf-8?B?WS95MDZqcHJRbjBFTGxNdW5mN3l0MmFOMEczZFpndksxTmtWWEEyNUMwU2wv?=
 =?utf-8?B?cDZkRkR3dWVmQzJUWm5sNlNKc3J5NWdkN0JHcFpnMkN2RHJZNDdVWkJUQ0or?=
 =?utf-8?B?ZVg2ZXp1eDV1b043SENKV2NUbEVtd0E2MGlQRm5GSURSQS9Yck1aMHlnZUxa?=
 =?utf-8?B?U05hUjFIZit4ajdPU3hUQndkcElKb214OHRQajZCaWhteW8rTkRIelN4SC9G?=
 =?utf-8?B?cXU2d3hyaTV4bHE3dFMrSURoRXBuUkNZeFhhU01UOWtUSjVraXRtdDBGM3Zm?=
 =?utf-8?B?OWJvVVhSdGxRZTJEemxmeGtkL2kzTE13TEhsOFBwZUhXZHFtUC9IeU1tS1dZ?=
 =?utf-8?B?Y1d4dEZ6NlVodkZxTllGYUpoWEd2YlVBRzQyRXU1K2M1ZGs0ZFdOYkdMZ3ZJ?=
 =?utf-8?B?dU16Tk1Fa2dZejlpbGl3NklHem9tTVlNN0l6YU5XUUYxcEE5MUdrY3BraUdp?=
 =?utf-8?B?aFp0anZQWnVqc0RCOGljUEVieUNyWUVLQXZISWl4dHpHNHZDdW5WVTVFUVNk?=
 =?utf-8?B?TzQ4QnU1UTE4VE9CQ3F2QlRTTjdXV2F2VGVseGVSdmdiKy9uVnNEV3VtTm1M?=
 =?utf-8?B?N3k5R3FWbTM0ZDVUMUZJNnYwOFA2OFhZNDBkRTQvbFZ2SUEwalVpdkJqakcw?=
 =?utf-8?B?NGFueDYxaTc0OFRtNUc3bTFTRG83N0lwWjkyK2VUQ3lCYXRqdnpjTmUxSkpG?=
 =?utf-8?B?VVFtVGNjRzlSRkNKemhuRXB3eEo5YXlzbVo5TnJIaTVyU21FcXo5a0c2VEox?=
 =?utf-8?B?MlFpc0pQU05EV1o1NW9oRGwrV0xIWDMvdVBBQVg1Q0txTzllN3BpZnBiL2tw?=
 =?utf-8?B?NFJlT29ZeDdiUlhLcFZJZ2RZY0Q2ODVxb2NWVmMzT21tdDlhRmlHcGxYdHVJ?=
 =?utf-8?B?UFIwQ09PczEzQ0xKaHpDQzFCMGxCcE4zUDhodGxvdnI3MGpPRmFreWpGSy9y?=
 =?utf-8?B?bjJPdVdRbkY1eTFIYmJ3L2xCbFdWNGRBNWsxa0tJbFEwVWhCZkR5VjYvcVFk?=
 =?utf-8?B?V0dDZWlhQlpmN0dLdGhMM0tKc0pldnZvM2RRNWExM09PbEZtKy9qdW9ZWGdq?=
 =?utf-8?B?VGJWUUR6YzEzdHVQQWFRektVbTJoS3BubDVvQTJaeThVQ0VDYUpHZE90L1ZB?=
 =?utf-8?B?VG9IVytqbTVKc0pnSGJsVUV1M0JyY2VQRERpT3RlNEZqMmpld250MW81V29u?=
 =?utf-8?B?YWR6SVFHQ2h1L05TNzhTMlZnZHA5NFQ1ZXBRaHBqbVNMS1ZURE1yUzFsVU1x?=
 =?utf-8?B?RXlIbHNFWTd6RWQ1ZVArcHY5RCtFK3ZXWHh5ckRaT0pueWZwaWNhbHJZMC9Y?=
 =?utf-8?B?L294R05HV2VTejRwai9kQVdxSW5ZYml2MTJ0dz09?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 13:28:34.7625 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c9daf4-e4ba-4f60-fba1-08ddf45bc56e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5409
X-Authority-Analysis: v=2.4 cv=ObaYDgTY c=1 sm=1 tr=0 ts=68c81485 cx=c_pps
 a=9cf4UBy+eSfSr5bZysPU/w==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=XKbaJabmtZkA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=0a06FGITD3Oua5La8VcA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: pEIQtG2hyHKj2zodCEJR_6yZ0FrAwuz7
X-Proofpoint-ORIG-GUID: pEIQtG2hyHKj2zodCEJR_6yZ0FrAwuz7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE0MDAwNSBTYWx0ZWRfXynv6LxIVDVx/
 Md8SV5ruOU4qszyi2sDh/Q0/+sMunnECDSZGAc71h/mBzlUXAMEKFRgujfjRoACGQyMEqppdCy7
 iNFjVzBN/xuRPTs31bm4lYqaPUuast3V0+aI6YrqKIpWla6Ww+QeZi0M72OeI1gAQYyfgdg/QnB
 vm7L6KPnAlz7B5csFHn5uzkRRTY9P7KGJlLxFGYI4QusRnI/Pv4lYGVLSXMq7XmttK/7iZ9+Wjz
 PoSiFUVMPbu/sAGwVsvGZ0qK71EfU8PjGnrKWInctE4TJkEU+9oUcFjPrGtfTl4rscboiRQ0aQ/
 0S9gg0S5TblroLRoZHpBaaWa8pNGiN0pYrEUVYHeSBi8AgaTJmJnfgd5EWe33WuHb2Zt6bNofgQ
 rxPNp18d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2507300000
 definitions=main-2509140005
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


On Mon, 11 Aug 2025 06:56:04 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the drm subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v1:
> - Drop space after the cast (Maxime)
> - Added various Acked-by and Reviewed-by tags
> 
> [...]

Applied, thanks!

[1/9] drm/imx/ipuv3/imx-tve: convert from round_rate() to determine_rate()
      commit: 6a1977472f6be561aa613d0ee969cb7e268faf5c
[2/9] drm/mcde/mcde_clk_div: convert from round_rate() to determine_rate()
      commit: a3e12b9c84e25fc7b0e3ff1ea4ba17512a791386
[5/9] drm/pl111: convert from round_rate() to determine_rate()
      commit: b1a122f404d4467623f66b596f8aba0e1ca9d14e
[6/9] drm/stm/dw_mipi_dsi-stm: convert from round_rate() to determine_rate()
      commit: 5ccf442ecd419e90f9f74a708d41e56b684eff40
[7/9] drm/stm/lvds: convert from round_rate() to determine_rate()
      commit: 1dc50bc8a3f14789b76e58a4590cd4e9595d6e7d
[8/9] drm/sun4i/sun4i_hdmi_ddc_clk: convert from round_rate() to determine_rate()
      commit: 5c04f4812782e861166401458b6cf16dfe1be264
[9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate() to determine_rate()
      commit: a076fe9f126fbc0c52795db4ae21501e6f8fd03d

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
