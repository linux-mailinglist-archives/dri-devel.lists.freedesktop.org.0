Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A77B551B2
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205BF10E0CB;
	Fri, 12 Sep 2025 14:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="wkEQarPt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D20988BE3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:34:24 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CDcVYO002119;
 Fri, 12 Sep 2025 16:34:13 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4929f1a9rh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 16:34:12 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=snzfP1BWcX7HrmoSz4/pRVUNtRCpy6xq76XxNE0RHFrnRmG6Bw6gwvChS6mMak8jXaf0MBVzhvfv5nHksgaCrZJR4JNkAGVtQ1Rk8InAYi2Rr63CqVU0TiZoi7KWzeu5pTKAc8RDeionkRmwVlGBASArT0NsdT5se8l58iHYqeWKfq3urrzZU/ZZsVOJrG3YKQ6AHnXkcaS7FSNGt3crGAddxYd6XUhBAvXwxz9omUNQ9zeNNaExDKE2wP1llCMje90f74qZR4IkdoJc31p6PZJ9dYHgzzqcSXQNwd3Ag+S567saRlR49Qd+0yMgTAkq8LtvpEPOtgZcxVWYNWsH0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fx6tXzpfMb2aG/zaacB+2MT6L7ymxGlSdRapHuHDHy4=;
 b=RjsN5Nzdiaw51gq0OQs2NOBZDmpjJxs6cN9FiCOxOUdG3vzb0KbFeVTI4nqjQodMmiv2NWJi4LeqnPsvTOk9xe9ErHhe0oJc3c3lct153MyqDG3//tUSrLg45EdcZiyIx+rErurjKGBgsWtScG36PvzkR00yXCDVbLfAqBQhZyPgUg0U5VZil/XTlU6cU8WL+hEtQi8fOPlfB3kWNierqTUjCHoEGactAK/KEm+Lkv8qTJqurVKhggjSAgSq1NZtZ61BzfIo9LyL20rLGELxPBvNSnn+xgImJ5CdAOMruWlnTZrZZNLpO8mUxp4NoZI6kXx/e0XPAjbo17cIzd921A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fx6tXzpfMb2aG/zaacB+2MT6L7ymxGlSdRapHuHDHy4=;
 b=wkEQarPtcIF8QHDHjmlw2mzaAGvDlTOfG8niAOGOStsKuh7tRthT/O/q5no8WnPaYXEphsBKQPfQ4pO+ywkiPezGUSxj1gjvQxmW5Fn7g5a4/RgfOAl8wnU9vOpys1g/RVRg3hx7SjkYJ99bhEP3zHf+4cb0X7LkORXvGhCy4RzmFfJnglzBQQArU72YiopzIVZglArusIybnnlfqHzr7Hvqz7yw2n5a7oHWDRfCO7p5viMrwHuGWWUqHsPHEcOW5yxn35q7ivkUTwR/09TqjIZ/pqUKU1iXpKDu2swNsjLo41WjDZJEXTJw4ngjoW0wR30X86EVLJATefVaqB3KPQ==
Received: from AM0PR03CA0031.eurprd03.prod.outlook.com (2603:10a6:208:14::44)
 by VI1PR10MB3663.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:133::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:34:04 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:208:14:cafe::2) by AM0PR03CA0031.outlook.office365.com
 (2603:10a6:208:14::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 14:34:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:34:03 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:31:41 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:34:02 +0200
Date: Fri, 12 Sep 2025 16:34:01 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/4] ARM: dts: sti: extract display subsystem out of soc
Message-ID: <20250912143401.GC51602@gnbcxd0016.gnb.st.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-3-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717-sti-rework-v1-3-46d516fb1ebb@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C708:EE_|VI1PR10MB3663:EE_
X-MS-Office365-Filtering-Correlation-Id: ca917df6-f146-4b8a-63d7-08ddf2096c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UTz0SGD1AwFgqCUiE12lZVkor53uRryQd/9Y11yIk8ezf3BLxinHDL0gIXTp?=
 =?us-ascii?Q?kECtjI1AXovk4qrsAUQMCl6DTKzVjWM8ytTkniqHRZ2DMRiCozNIdNtinIO9?=
 =?us-ascii?Q?Syp0O7VBQ0jAxga2piLLVO0YD9cxp37/ypUHb4Q8la+nOmhy8w97VX4DRApW?=
 =?us-ascii?Q?4ePKnqRvIwPLoOEsFgS/FjyixG4hLjaQWRBSqWy9MKlcPPa7qToYWIWo6K2T?=
 =?us-ascii?Q?mvTSIU1NZ1b9u7IEOpyDSCehj8kIAnlK4m30hot8uRyuEo/pvt9qtL+ub2Jq?=
 =?us-ascii?Q?5G3q0D/rpppihlnJwOeHUxomOBPAiicWyHUdKbPqQHrrKbtxvHmbqFajipnw?=
 =?us-ascii?Q?BtJ+YULcA7AeG/88Gz/BiBFKld5tVcQGktfAEnVTixenjLOvRBPre+gXzw+i?=
 =?us-ascii?Q?+gWbBZ2Um0sH05IHzHPDVt9LSAcNdzZ/PPSebax6RxnU+Z4XOxmqmPJkWGde?=
 =?us-ascii?Q?n1GRsPu9m/1dgtlkxIFsfZOKP1qGHmseqGhQr/QmpT2LD3EHeaPIj6Q338gk?=
 =?us-ascii?Q?YmpK/StFgH0ztFQyX/eW894NnyVLQZOs8fXyH0bpIOhQqSFcc8tmBimMM+aH?=
 =?us-ascii?Q?K4IgTcG0Ey5n78gUQfVSlG2cUh3HXdrpYjkX2BhSxbd/qEtTbF0UJxGZrztI?=
 =?us-ascii?Q?VP+IFS40ka4PfRrZgIYiivAuXkew0zgCL6/qePvXkk5cPky1AaaImZ82oR0/?=
 =?us-ascii?Q?JR99obF2qYXCfouB7IyWjlUPBHslnf9GWtvYbR9j0xa/BaoAjZLxjN1RnPHP?=
 =?us-ascii?Q?vibd+FUXUzE4MWtuefvSxeoXAJXkifs2zSeIeiVbF/IDWJqILh8AC2yXvG0M?=
 =?us-ascii?Q?IcSqrToc8J7al06qeiSasON2zxv338gHo9yAuQITjGVWYvzrG3cI3YfRq99+?=
 =?us-ascii?Q?UQ0Bs7i1dQKrA6JpH9pboMJMA0M+SdgphNNMhRF0k2eWdLojH9tUJtbT+Rlj?=
 =?us-ascii?Q?28BgdV99lMT5HkwSg4wnbaFSEH3nHe9Ok+peI4YZlB7Zic1PG1DUw8Z1V/D8?=
 =?us-ascii?Q?l26/I7M4KQKRSzjj7t3CsRy3ve5PZSK1oxkoMq+I8zIpby8nwfOOCxXCViG5?=
 =?us-ascii?Q?mN20BhHDIIz8K9zMEPRnmtD1gfbBIeR9ZLCAaGKZqJDYehWTKD1GHFDTyIE2?=
 =?us-ascii?Q?1yDH6YX+sDVBhASaZwaibXz374tLbJgNUZLzi0DPyutr8LxVdX1rJ44L6+VL?=
 =?us-ascii?Q?6+sJldzDdt2RQ28JcWdW05QtFpRmRfAijPZ5vTJBON5cNExjpycpN1EkWgRI?=
 =?us-ascii?Q?zrYheSUAi1t6jY/ZfaFFpgRb7Fe83VH7nZJquevQTFl5hPd/8ErVFGh6xtAh?=
 =?us-ascii?Q?NoUzfmwLOAq+2RjV+QtTiwS2hbSvGhO8oBhApjV8sdUl/ohHjl5ATDZBtGcb?=
 =?us-ascii?Q?jEjA8Su7qojfagUQXLN3BGnPClJVJoT1kuW0Wa3zCnV7o3lKrIBpdJdE9x6L?=
 =?us-ascii?Q?/rSlQ9f2Jf/mrPvyKZ6P0kATUVTsaL0f1fIXbVUXiILWna13+qcA8k13iann?=
 =?us-ascii?Q?HtjBCSC3PxWByFB/7aQSAYMxqabXiFVQkyNi?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:34:03.6970 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca917df6-f146-4b8a-63d7-08ddf2096c0c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3663
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68c42f64 cx=c_pps
 a=YRDmcPKYWw40vX7vQsDShQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8
 a=8b9GpE9nAAAA:8 a=Fogd_9c_AqE0UklwBAkA:9 a=CjuIK1q_8ugA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: Wn1f48zhwVJ4E5pK1Y3jVgUTjFdQiNr1
X-Proofpoint-ORIG-GUID: Wn1f48zhwVJ4E5pK1Y3jVgUTjFdQiNr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAwMCBTYWx0ZWRfXzGJoDq7eXIyA
 3h8cfbPMPPUrqnWR7DWLFzg1iiA4YQSdh0y89kBKB7WhdY75hsGoUVx/3fMRnaG6uChMH1YbDRo
 f2eWpRP5UkEcnEjeGIb98mCll0YuGq2S77ahrqpSjxftfWOFtxMJUzbI1wK+c9AVQml/AsSrFjy
 KyREevPA6LsN8ooh+J0PPvbBOB7VxEbwYsnlHG+TjFfKmWZzWIkhHTQQ2q/WAleOlKIK0nySRFF
 YKCLn8Sc0687Krpy8Zg2U74dVdFhJrtYsDlg2/Mt6onnIcsPcKd7Rrbbj7Vgp+ylEj344KsHIbS
 bXNvMLA5gXysvQ/VJrXBAkZ0fcte0rJknWNxffhAAReWvB/AfgEamOD9a2wxu6Cx4gW0alRUS2Z
 u1v4yHs2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090000
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

Hi Raphael,

thanks for this patch.

On Thu, Jul 17, 2025 at 09:15:34PM +0200, Raphael Gallais-Pou wrote:
> The display subsystem represent how IPs are interacting together and
> have nothing to do within the SoC node.
> 
> Extract it from the SoC node and let IPs nodes in the Soc node.
> 
> Several nodes did not use conventional name:
>  * sti-display-subsystem -> display-subsystem
>  * sti-controller -> display-controller
>  * sti-tvout -> encoder
>  * sti-hda -> analog
>  * sti-hqvdp -> plane
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  arch/arm/boot/dts/st/stih410.dtsi | 316 +++++++++++++++++++++++---------------
>  1 file changed, 188 insertions(+), 128 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/st/stih410.dtsi b/arch/arm/boot/dts/st/stih410.dtsi
> index d56343f44fda4e9e1de2e5efc86e2d984bad14b4..47d66d7eb07a3d73d98b3e21d62b2253aa1171e4 100644
> --- a/arch/arm/boot/dts/st/stih410.dtsi
> +++ b/arch/arm/boot/dts/st/stih410.dtsi
> @@ -34,6 +34,41 @@ usb2_picophy2: phy3 {
>  		status = "disabled";
>  	};
>  
> +	display-subsystem {
> +		compatible = "st,sti-display-subsystem";
> +		ports = <&compositor>, <&hqvdp>, <&tvout>, <&sti_hdmi>;
> +
> +		assigned-clocks = <&clk_s_d2_quadfs 0>,
> +				  <&clk_s_d2_quadfs 1>,
> +				  <&clk_s_c0_pll1 0>,
> +				  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> +				  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
> +
> +		assigned-clock-parents = <0>,
> +					 <0>,
> +					 <0>,
> +					 <&clk_s_c0_pll1 0>,
> +					 <&clk_s_c0_pll1 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 1>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>,
> +					 <&clk_s_d2_quadfs 0>;
> +
> +		assigned-clock-rates = <297000000>,
> +				       <297000000>,
> +				       <0>,
> +				       <400000000>,
> +				       <400000000>;
> +	};
> +
>  	soc {
>  		ohci0: usb@9a03c00 {
>  			compatible = "st,st-ohci-300x";
> @@ -99,153 +134,178 @@ ehci1: usb@9a83e00 {
>  			status = "disabled";
>  		};
>  
> -		sti-display-subsystem@0 {
> -			compatible = "st,sti-display-subsystem";
> +		compositor: display-controller@9d11000 {
> +			compatible = "st,stih407-compositor";
> +			reg = <0x9d11000 0x1000>;
> +
> +			clock-names = "compo_main",
> +				      "compo_aux",
> +				      "pix_main",
> +				      "pix_aux",
> +				      "pix_gdp1",
> +				      "pix_gdp2",
> +				      "pix_gdp3",
> +				      "pix_gdp4",
> +				      "main_parent",
> +				      "aux_parent";
> +
> +			clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> +				 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
> +
> +			reset-names = "compo-main", "compo-aux";
> +			resets = <&softreset STIH407_COMPO_SOFTRESET>,
> +				 <&softreset STIH407_COMPO_SOFTRESET>;
> +			st,vtg = <&vtg_main>, <&vtg_aux>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					compo_main_out: endpoint {
> +						remote-endpoint = <&tvout_in0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					compo_aux_out: endpoint {
> +						remote-endpoint = <&tvout_in1>;
> +					};
> +				};
> +			};
> +		};
> +
> +		tvout: encoder@8d08000 {
> +			compatible = "st,stih407-tvout";
> +			reg = <0x8d08000 0x1000>;
> +			reg-names = "tvout-reg";
> +			reset-names = "tvout";
> +			resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +			assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> +					  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> +					  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> +					  <&clk_s_d0_flexgen CLK_PCM_0>,
> +					  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> +					  <&clk_s_d2_flexgen CLK_HDDAC>;
>  
> -			reg = <0 0>;
> -			assigned-clocks = <&clk_s_d2_quadfs 0>,
> -					  <&clk_s_d2_quadfs 1>,
> -					  <&clk_s_c0_pll1 0>,
> -					  <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					  <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> -					  <&clk_s_d2_flexgen CLK_PIX_GDP4>;
> -
> -			assigned-clock-parents = <0>,
> -						 <0>,
> -						 <0>,
> -						 <&clk_s_c0_pll1 0>,
> -						 <&clk_s_c0_pll1 0>,
> -						 <&clk_s_d2_quadfs 0>,
> -						 <&clk_s_d2_quadfs 1>,
> -						 <&clk_s_d2_quadfs 0>,
> +			assigned-clock-parents = <&clk_s_d2_quadfs 0>,
> +						 <&clk_tmdsout_hdmi>,
>  						 <&clk_s_d2_quadfs 0>,
> +						 <&clk_s_d0_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>,
>  						 <&clk_s_d2_quadfs 0>;
>  
> -			assigned-clock-rates = <297000000>,
> -					       <297000000>,
> -					       <0>,
> -					       <400000000>,
> -					       <400000000>;
> -
> -			ranges;
> -
> -			sti-compositor@9d11000 {
> -				compatible = "st,stih407-compositor";
> -				reg = <0x9d11000 0x1000>;
> -
> -				clock-names = "compo_main",
> -					      "compo_aux",
> -					      "pix_main",
> -					      "pix_aux",
> -					      "pix_gdp1",
> -					      "pix_gdp2",
> -					      "pix_gdp3",
> -					      "pix_gdp4",
> -					      "main_parent",
> -					      "aux_parent";
> -
> -				clocks = <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					 <&clk_s_c0_flexgen CLK_COMPO_DVP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_AUX_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP1>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP2>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP3>,
> -					 <&clk_s_d2_flexgen CLK_PIX_GDP4>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> -
> -				reset-names = "compo-main", "compo-aux";
> -				resets = <&softreset STIH407_COMPO_SOFTRESET>,
> -					 <&softreset STIH407_COMPO_SOFTRESET>;
> -				st,vtg = <&vtg_main>, <&vtg_aux>;
> -			};
> -
> -			sti-tvout@8d08000 {
> -				compatible = "st,stih407-tvout";
> -				reg = <0x8d08000 0x1000>;
> -				reg-names = "tvout-reg";
> -				reset-names = "tvout";
> -				resets = <&softreset STIH407_HDTVOUT_SOFTRESET>;
> +			ports {
>  				#address-cells = <1>;
> -				#size-cells = <1>;
> -				assigned-clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> -						  <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> -						  <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> -						  <&clk_s_d0_flexgen CLK_PCM_0>,
> -						  <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> -						  <&clk_s_d2_flexgen CLK_HDDAC>;
> +				#size-cells = <0>;
>  
> -				assigned-clock-parents = <&clk_s_d2_quadfs 0>,
> -							 <&clk_tmdsout_hdmi>,
> -							 <&clk_s_d2_quadfs 0>,
> -							 <&clk_s_d0_quadfs 0>,
> -							 <&clk_s_d2_quadfs 0>,
> -							 <&clk_s_d2_quadfs 0>;
> +				port@0 {
> +					reg = <0>;
> +					tvout_in0: endpoint {
> +						remote-endpoint = <&compo_main_out>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					tvout_in1: endpoint {
> +						remote-endpoint = <&compo_aux_out>;
> +					};
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					tvout_out0: endpoint {
> +						remote-endpoint = <&hdmi_in>;
> +					};
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					tvout_out1: endpoint {
> +						remote-endpoint = <&hda_in>;
> +					};
> +				};
>  			};
> +		};
>  
> -			sti_hdmi: sti-hdmi@8d04000 {
> -				compatible = "st,stih407-hdmi";
> -				reg = <0x8d04000 0x1000>;
> -				reg-names = "hdmi-reg";
> -				#sound-dai-cells = <0>;
> -				interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> -				interrupt-names = "irq";
> -				clock-names = "pix",
> -					      "tmds",
> -					      "phy",
> -					      "audio",
> -					      "main_parent",
> -					      "aux_parent";
> +		sti_hdmi: hdmi@8d04000 {
> +			compatible = "st,stih407-hdmi";
> +			reg = <0x8d04000 0x1000>;
> +			reg-names = "hdmi-reg";
> +			#sound-dai-cells = <0>;
> +			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "irq";
> +			clock-names = "pix",
> +				      "tmds",
> +				      "phy",
> +				      "audio",
> +				      "main_parent",
> +				      "aux_parent";
>  
> -				clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> -					 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> -					 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> -					 <&clk_s_d0_flexgen CLK_PCM_0>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> +			clocks = <&clk_s_d2_flexgen CLK_PIX_HDMI>,
> +				 <&clk_s_d2_flexgen CLK_TMDS_HDMI>,
> +				 <&clk_s_d2_flexgen CLK_REF_HDMIPHY>,
> +				 <&clk_s_d0_flexgen CLK_PCM_0>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
>  
> -				hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
> -				reset-names = "hdmi";
> -				resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
> -				ddc = <&hdmiddc>;
> +			hdmi,hpd-gpio = <&pio5 3 GPIO_ACTIVE_LOW>;
> +			reset-names = "hdmi";
> +			resets = <&softreset STIH407_HDMI_TX_PHY_SOFTRESET>;
> +			ddc = <&hdmiddc>;
> +
> +			port {
> +				hdmi_in: endpoint {
> +					remote-endpoint = <&tvout_out0>;
> +				};
>  			};
> +		};
>  
> -			sti-hda@8d02000 {
> -				compatible = "st,stih407-hda";
> -				status = "disabled";
> -				reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
> -				reg-names = "hda-reg", "video-dacs-ctrl";
> -				clock-names = "pix",
> -					      "hddac",
> -					      "main_parent",
> -					      "aux_parent";
> -				clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> -					 <&clk_s_d2_flexgen CLK_HDDAC>,
> -					 <&clk_s_d2_quadfs 0>,
> -					 <&clk_s_d2_quadfs 1>;
> -			};
> +		analog@8d02000 {
> +			compatible = "st,stih407-hda";
> +			status = "disabled";
> +			reg = <0x8d02000 0x400>, <0x92b0120 0x4>;
> +			reg-names = "hda-reg", "video-dacs-ctrl";
> +			clock-names = "pix",
> +				      "hddac",
> +				      "main_parent",
> +				      "aux_parent";
> +			clocks = <&clk_s_d2_flexgen CLK_PIX_HDDAC>,
> +				 <&clk_s_d2_flexgen CLK_HDDAC>,
> +				 <&clk_s_d2_quadfs 0>,
> +				 <&clk_s_d2_quadfs 1>;
>  
> -			sti-hqvdp@9c00000 {
> -				compatible = "st,stih407-hqvdp";
> -				reg = <0x9C00000 0x100000>;
> -				clock-names = "hqvdp", "pix_main";
> -				clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> -					 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
> -				reset-names = "hqvdp";
> -				resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
> -				st,vtg = <&vtg_main>;
> +			port {
> +				hda_in: endpoint {
> +					remote-endpoint = <&tvout_out1>;
> +				};
>  			};
>  		};
>  
> +		hqvdp: plane@9c00000 {
> +			compatible = "st,stih407-hqvdp";
> +			reg = <0x9C00000 0x100000>;
> +			clock-names = "hqvdp", "pix_main";
> +			clocks = <&clk_s_c0_flexgen CLK_MAIN_DISP>,
> +				 <&clk_s_d2_flexgen CLK_PIX_MAIN_DISP>;
> +			reset-names = "hqvdp";
> +			resets = <&softreset STIH407_HDQVDP_SOFTRESET>;
> +			st,vtg = <&vtg_main>;
> +		};
> +
>  		bdisp0:bdisp@9f10000 {
>  			compatible = "st,stih407-bdisp";
>  			reg = <0x9f10000 0x1000>;
> 
> -- 
> 2.50.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Best regards
Alain
