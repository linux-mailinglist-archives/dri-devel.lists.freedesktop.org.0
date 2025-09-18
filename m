Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6A0B85426
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 16:33:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D09410E1DA;
	Thu, 18 Sep 2025 14:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="RvIX2y20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A5110E1DA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 14:33:42 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IDH7Ix003888;
 Thu, 18 Sep 2025 16:33:26 +0200
Received: from osppr02cu001.outbound.protection.outlook.com
 (mail-norwayeastazon11013027.outbound.protection.outlook.com [40.107.159.27])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 497fxh1805-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Sep 2025 16:33:25 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL63/LiUqLI0AFSFTwjEwLpSJxUc78Pt/9OvaOOBNaqetf+DQYRWCShWCLoQWefY6zB2LiSjCmej07mTqlu+6qyD+auKjXTDFp19dGdNx962Bs/kiI1YFJp7qga5LZ8vIEu2uy+uJlcgbXYRH4ctZ5a2pZwGcJyvvg6jhW+cK+VeIAt8+JZf+/r2KwUT/36c69nHpEmPCJre5H2OPL3zDHYEYHx2zBGl60AcPsDhXL5k2rrBVsU+H4UV8OKJkyefHASUhxVkBodAM7hL9hLlVEY6XNHaDbIg1yevleYqgCAN3KWkrLsKVXtcPi2ChiO1j0/xPJCbm1z1OgQyS243dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4vhXqCTvf7X6GlOUXmF9fBp2K2kRDuE4XSUGDa4ACM=;
 b=RwYwqd98GyaFjTtGJBarijKEzJUAKhB6XHhQi6N5AinGvKSSkoqA3OMfCtQsJ6jzTV7NcyUnt73FJJY1hbZAPi8rfvxY3fYKaJaZomybU/RgtNA4/3BqVN9RCRV1Cs6Itidal0mBQa8DOUf1Om1RiTL7k/oIsERPcKBkenbp9S/h+Qr8aKMfjIw6n2/oDxe9eGVmXihuDkSNiBoyRrF1fxFCoshTkMPCWDJ1VWFNQsQrPH1NcdFxsGLmkM+Q3Mita6z770aQDbDy3UOXxjXt2f+Y8fL7cIzTZ5uuXVfOCsMBVJnOUffVTDDPh1tKKO/ba6iXJsReKrmIbEAnCb4nDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4vhXqCTvf7X6GlOUXmF9fBp2K2kRDuE4XSUGDa4ACM=;
 b=RvIX2y20wciYpvTGo3YAwDoRbdYc1PEZkHErqzN8OfgYR4JG5Qmq2eOkZF7IxC/M9tgZSseAI0BgmnBRmW/z3btkzw/VXZEQQqlwBp8VTQ+FClPDzVXmq1CKKBoekKmw90tDK1kZqjKTh1XGyF9/BffPhTIIFSMRCroSNH+FMGMhIhufpKMZVZvxG7pIpqIoG/mTvoQ1KYqEjfMcM2iA+A3vV4tu1Sg3ZbIFCitx0x8Ij9lFcD6tZtx2WgThl0ww42q9IhajNTtku6S0TITjzkK8DOvTyY8qQ4wWe1oGer7lyZNa3J6oPbVYgBW8bEXpvGy+fnIECWRTwz2ucb4XhQ==
Received: from AM0PR03CA0105.eurprd03.prod.outlook.com (2603:10a6:208:69::46)
 by AM7PR10MB3905.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:14c::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.14; Thu, 18 Sep
 2025 14:33:22 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:208:69:cafe::a6) by AM0PR03CA0105.outlook.office365.com
 (2603:10a6:208:69::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Thu,
 18 Sep 2025 14:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 14:33:22 +0000
Received: from SHFDAG1NODE2.st.com (10.75.129.70) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:30:57 +0200
Received: from localhost (10.252.18.54) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Thu, 18 Sep
 2025 16:33:21 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Date: Thu, 18 Sep 2025 16:33:18 +0200
Subject: [PATCH] drm/stm: ltdc: switch to pm_runtime_resume_and_get
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250918-drm-misc-next-v1-1-7b2742b2ba8a@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAC0YzGgC/x3MMQqAMAxA0auUzAa0IrReRRyKiZrBKo1IQXp3i
 +Mb/n9BOQkrjOaFxI+onLGiawwse4gbo1A12NYOre8cUjrwEF0wcr7R2oGCJ9d776A2V+JV8v+
 b5lI+1YgwH18AAAA=
X-Change-ID: 20250918-drm-misc-next-225da9d83998
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.18.54]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|AM7PR10MB3905:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a7a6ed-ed6e-442d-2755-08ddf6c051f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUJrc3huSjl2RDdmZURhWGhqdmFWNmNlTk1IS0hUUjFCZVkxU1FITW9WRE5r?=
 =?utf-8?B?UXFZaVFpMDF0RlNVZVdScXlCNUtQR2ZwTCtVM3ZUUU8xWTBhcGFKQkgwcWkx?=
 =?utf-8?B?eVBIeThsbDd3dFpzeEQyWDN1NXhnd1VIUFJKQ2tFdFI1RUordStTZ0psZi9K?=
 =?utf-8?B?TmxPblMra1R0d3d2ZkhsSUcvTGtpSkZuUWQ4YWIvT1luN2NPYk5LamVsZWpl?=
 =?utf-8?B?WDJlaGxEVXJ4dnAxN3RERGxQV284dVdvbVdLWEpobWxBVkxzOU8vUmgvaFN4?=
 =?utf-8?B?SjR0MGk2NXRDOGd3UGNWb1JQY2ordjFCNEdrRXRnTHcxeW1WZ2wvNyt5dXdU?=
 =?utf-8?B?aGtBSlo4RUx6U1BZdHgxUjQ4d1haeWtFa2xIS0h0eGdiZXNhMVlCVVBuVUps?=
 =?utf-8?B?a3JjbURVUjdsZTFVUmpMQkpPWERUY2xyRUIvWCt1OExCZ2ZNRUM4Z2pYSnpv?=
 =?utf-8?B?a3krSS9hRTl6NjQzUUFVS29QanAwekIzc2hCdDVkL1J5V0RObm9YekUxZjBz?=
 =?utf-8?B?OXRVREd5ZHpWckYxWklWeFpxYWJaeEVHcFdwTmRka0ZnZmY0TlBqMHBsMXpS?=
 =?utf-8?B?cjZMeDk3U09BY2JNT2gvdzJ2eVkxRmNJVmdramZBRW5YZHI0RmZlMzd1Qjdn?=
 =?utf-8?B?b0ZCdEc0TWhSTjlPalNoc0dGOW9GZ29sWWg1VnZUYjlBVktYeDcyUDA3bGsr?=
 =?utf-8?B?UEF6RXFjTi8yOWpwV29nR25Rb2FleDVPWTZpNVdiN3ljbjBlN2xXRHNoamt6?=
 =?utf-8?B?OXdpTmp0TGE5c0VkY3JlYzhSWXpNQ2ZKM0t4ZGRJUlZTcTNUV0dEOUFWSE94?=
 =?utf-8?B?bHhGcFgzb0Qwb3NjQzBySm44Q0N4TVVNajY3aGwzbldSVDhhMnR3UjVUVjhT?=
 =?utf-8?B?L21EVCs2WnB6TjhMZko4eUtsZkRZc2JtUFVOdUU4SThhdWZLS0x0aDlHNmlG?=
 =?utf-8?B?Wjkxa2VpTjFwY1I0Mm1iMDdYUDFZejlVeVVGbSs0Sm02WUluNytPVTRabjBx?=
 =?utf-8?B?UDB6ZExldEk3L3VNNUEyRDJrN1NadUp5Q0xqRkM1WGhTdjZlMEJSOVNuY2hy?=
 =?utf-8?B?bTVPSmpBUHA3RzNxb1hPbTFlRys4MkNrVGJDckR3cHI2VDk5dnpGdUFYNUIx?=
 =?utf-8?B?bng1aURTeUduYmJMaTRBRkJUMmd5MS9SbFhUTUVCQzRUTnFITGJhWlVydDlG?=
 =?utf-8?B?M0gxNDFvWW1QdENKeUlzK0hBRU8yTDRUV29GR3A1MkEvZXJjd3pLWUtIVDRZ?=
 =?utf-8?B?bG1scjBsWms1TXAxcGFtaGt2bEhyYmpObHQwUzBSbVlUa0NiZE9EcUgraUhP?=
 =?utf-8?B?V1RDVjdId3M5UXhoUGVObU5FMGE3R213WGllNWRJR2hLTDVHRmJmM3dUZTJS?=
 =?utf-8?B?YnlENVhYT2pmb2QwNVg3OW4raHpEVitnak5aQk10V09CdGZxdTI5TGZnSmxh?=
 =?utf-8?B?cmRFNDBsZXYzaVNKQTA5eTBtLzM4MHBtOHRiT2VJT2VHOXYwemd3c2x3ODUy?=
 =?utf-8?B?c0FXTEpjK1h5U1RhcFduYWlTbjJaTGsyUTBBU0xnMFd0ZGtMaFRpdWRnS1M0?=
 =?utf-8?B?V2dLQUlhN1QrVjJXVDhLSEdDQjJmaTFvNHAzUUdUZmZOZE5mQzBncUQrUnl2?=
 =?utf-8?B?Sy96NHhmcEo2M3pmV2xKWFNiUU91UmVVQjdIRWRyVVZTa3FORXJ2UUErcFhE?=
 =?utf-8?B?bW83RWJTRUZ3Z1hxWWpNbUZLT3hRUnhidnNQWlg3VlVkSlFoOG1Qc3NjQjhz?=
 =?utf-8?B?YXRpajk4djQ1aE9DWHc3YnEwTzR1OUVBY2dKOTF0UEhpOU5FeFpwaDZOSWFK?=
 =?utf-8?B?QS8vczQxNlNXbGd4Skx6aUt6Sm91czNDd29oQ3ZYTHJSb2NrSFlPVUtFeEZt?=
 =?utf-8?B?MGxxajJoS3VQVDZuRVpnQmNwaDRBSVB2cVBYSS9xVmlXdU1NYUVrcHVnQm82?=
 =?utf-8?B?a1V1UkZ1Wk5WZ3ZHT2V1T2hsQldsRFVjTjZ3Z1AySHBHdmlSOXgxcnJjSlVS?=
 =?utf-8?B?QTNDTy9TMUxqcEZsYzJKSm5OQ0tQWGVHb253MFRYWW4xNzNNazg1WXFCMVZ2?=
 =?utf-8?Q?Pbov3U?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 14:33:22.4286 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a7a6ed-ed6e-442d-2755-08ddf6c051f0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3905
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX+bCGIrNLgJvC
 n7wk3FegZD89CdupIHGv8aYtS75dBQdCVYtqhFpxFemOJfc7mCzuMALSDjR2mxOd1UFf4zUth1s
 GKEBJK7LMaH7Yr8ycgSefLsTI4nE8W2U1XpgQ3psPW+fI8YMQNeruDicxncGvq7z+xLs6mUwDCt
 TzMQzqWzIrUCodo7bDjpSMuGu1Fy1cvUxXqP7e7WgJTKCxsRiO4xvo/ecVWmkQwO1/cyIBFSrxU
 zcAoHg3e2odsd8jWP7v8qDhWRBk7jHjpBxI4DfFVWh/oaczeT3TGNDncVLAIWJQf+tt4sNyrbXw
 BesQcqvu5L4HgMmvltQT3As+HYYgqepFuCTlTcwURb8Mzd6WAAxDshABfSpHJM92M5TUmWXUU4K
 2Od65Ma4
X-Proofpoint-ORIG-GUID: CJUAVYgK9iYoPxtk2ajLkwh8q_5lFrnv
X-Authority-Analysis: v=2.4 cv=aJLwqa9m c=1 sm=1 tr=0 ts=68cc1835 cx=c_pps
 a=G6gdhMNhEIa2rRoNLXB4Vg==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=qojlnMLHMOUA:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=8b9GpE9nAAAA:8
 a=xTi5VqLmas-pcsdGNAgA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: CJUAVYgK9iYoPxtk2ajLkwh8q_5lFrnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 suspectscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
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

pm_runtime_get_sync() error code is not checked if it fails on clock
enable.  This can lead to an illegal access to the clock peripheral and
cause a system hang on MP1 or a SERC fired on MP2.  By using
pm_runtime_resume_and_get(), the PM counter isn't incremented if an
error occurs and we can return the error code.

Switch from pm_runtime_get_sync() to pm_runtime_resume_and_get() and
check returned error code.

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
 drivers/gpu/drm/stm/ltdc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index d1501e86a5b1c3fd5e8791a2143616a66850a62b..5ce3fd205fd7bbfd8735535c0ba4a660d68d02f9 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -779,7 +779,8 @@ static void ltdc_crtc_atomic_enable(struct drm_crtc *crtc,
 
 	drm_dbg_driver(crtc->dev, "\n");
 
-	pm_runtime_get_sync(ddev->dev);
+	if (pm_runtime_resume_and_get(ddev->dev))
+		return;
 
 	/* Sets the background color value */
 	regmap_write(ldev->regmap, LTDC_BCCR, BCCR_BCBLACK);
@@ -941,7 +942,7 @@ static void ltdc_crtc_mode_set_nofb(struct drm_crtc *crtc)
 	}
 
 	if (!pm_runtime_active(ddev->dev)) {
-		ret = pm_runtime_get_sync(ddev->dev);
+		ret = pm_runtime_resume_and_get(ddev->dev);
 		if (ret) {
 			drm_err(crtc->dev, "Failed to set mode, cannot get sync\n");
 			return;

---
base-commit: 0bf37f45d5c472aebdf32da64775cac1110c085c
change-id: 20250918-drm-misc-next-225da9d83998

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

