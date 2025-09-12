Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5AB551B6
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057D610EC7B;
	Fri, 12 Sep 2025 14:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="unGQ3eFL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608F210EC7B
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:35:11 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CEQ0Fo018940;
 Fri, 12 Sep 2025 16:35:02 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com
 (mail-westeuropeazon11013025.outbound.protection.outlook.com [52.101.72.25])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4934xjuy43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 16:35:01 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mQMvNm4pdaulBdj2cqvJ5axPx/NBd5YtNp6+EG9Ekyl4VCpV5hK+NDjoJsJv64Lk5gQ3VbzGrm0wOjH9BABZP2yKnbr3vqE1kKNUkpMh2k18dtd+2mneEhixY7jMC/X16BJZaIY1AS4X5AZFA6QbTXd8Ur5SnkMhVDwo/CPtcTN9O1+6434HfS15qz8QfiBEDP90JxoKDjFiuwCBPB6pTHKUDZ04eCdE16sfJcoSOLMeojBmmYh8bH66JOFj6yCb12xMkiCAra3347UVOVaXJnZZuu45WjsH8VHgkhqI5MDEPq8z9AqWKb1xdWrTD7Wen1SEN3WDKQyOJ1L9vtvXgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WSoR4aFJ9pkew0Xis9VjKqBGgRJQ8awWeo4nEpimtZY=;
 b=ZtqaGJmdDy5bT6rfkIEo1cz228fArNbCke9H+YJUs04aW5n2Tst3ZyXph0YHlyHvaQJrUPU1/f6NUwzELDHDSF2YQ03DhEzRpLk5MeilM+gyhwY4hTai+XQpla2W62GIi3TNt//B8btSwxS+gwzcgzgmbPHUvRqbeLZ8mbGNOy3q5WuaTHz34gAiO4HcpGzz8dpc4F+ObIYvlcIuizeLo2O9Bsq33dFK3GcxxkZtgKo3hRo/6y/wvPPjnRjqkoU5PNtVFYGIykPRhDhwGTPNhcHRomN+eXxrCYmixCUg6WlpOhOXnBPLqsY64kjuTQmMtTWSBAAw5fmLbu6ztvasoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WSoR4aFJ9pkew0Xis9VjKqBGgRJQ8awWeo4nEpimtZY=;
 b=unGQ3eFLmoPOX0eanHoaDZ1vkJCeUemFLx5F+6vGSKg7l5SLi2UM/ahu7c9xXEr8Xgzz610/JlmnL/5A4jt/3GW2ec5em3fHpRQmRmPVA8HLhkblxNmU0Y5W3ZwY3oLZs8CcgEK2VxTH0fBWqe4c5YggKR1rJaSmNZhf1IOzpkrU3Si6VK+ZMsqUpHFDFCaq42xgKmoR3EvsuembxZD6aOtSW21U5DY7eCCcMPmwA9k5KnJxBpClkgKAfQbHKTLNZd2WLlXbZrumaRgJtXBd1KTp8gQirX31asp/A6LstrXQfCuNDz1ZggL3pyHE3O233TzhFG/NV8TB7aNtIGaelA==
Received: from DUZPR01CA0116.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::15) by VI1PR10MB3277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:135::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:34:53 +0000
Received: from DU6PEPF00009523.eurprd02.prod.outlook.com
 (2603:10a6:10:4bc:cafe::8e) by DUZPR01CA0116.outlook.office365.com
 (2603:10a6:10:4bc::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 14:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009523.mail.protection.outlook.com (10.167.8.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:34:53 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:27:45 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:34:52 +0200
Date: Fri, 12 Sep 2025 16:34:51 +0200
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
Subject: Re: [PATCH 4/4] ARM: dts: sti: remove useless cells fields
Message-ID: <20250912143451.GD51602@gnbcxd0016.gnb.st.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717-sti-rework-v1-4-46d516fb1ebb@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009523:EE_|VI1PR10MB3277:EE_
X-MS-Office365-Filtering-Correlation-Id: b19030d5-e736-47d5-b2ce-08ddf20989c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PZL8AVKrf79V6NrR/szb4YqxxIO6bsBgi7+fuOvITRhW4YcMd8skn352SNEH?=
 =?us-ascii?Q?gDXFJJOlbK/GxOiwVSTc4gF0DiAwSwO8NJnKfX0nk6SoYSRZN66t8ZTNOZko?=
 =?us-ascii?Q?zPKEMP5A5PljW7qsMs/QH6GiiQ0JF4pnGB6M21R5LWQhQ9KycbsaYmN/7q7T?=
 =?us-ascii?Q?sJqTQYGOfOMfAjT5vI6Ehk690ST3Y3NjzBipe+CtaP8Xe5NXuNqrZM4zaLf0?=
 =?us-ascii?Q?B2E2lDUHRQd3fGyk6WyDaZfrSILA+buVSOMgb3DYDGbtP9IMTiltJ1wS7AgT?=
 =?us-ascii?Q?k1bCs/FlafSq4PAX5JHvWYr4Ff/HfRiiXGsZugLmNiuLqzE5zByXGUDQ8vVt?=
 =?us-ascii?Q?DSJdsH4TgYhvjOynCN51iwuMVdkBqZIQYLHmFJDKUQToPwV2y0i/80Er3qnh?=
 =?us-ascii?Q?hgSbFKzab5Z8rosc2q1t1NkTWkkd6vkvseNEsOd/PY5GI6cwqUqLAc8VQ7xI?=
 =?us-ascii?Q?03TGBA1CfGBT6DX0vGG/X9NI67aLrbsXgh3h6TmQDhzlyKilA/TCCKs5Vz/I?=
 =?us-ascii?Q?h+e27rlR1RvB5+TmErwMFxwse5i+9H8JS2oWMbcHeT7d1W4jhHWCE64mCXIJ?=
 =?us-ascii?Q?3mZbXVk73pbFXZY1ERTGJGkGwUH7y+0I8JUwNKe5FnfpbWnsxnak5mi8PRgq?=
 =?us-ascii?Q?5OG03/ureWAijMGSIyY333PkIo95Y9cAnkTEhPkr3Z/h6zySqJpZG2qOyWI1?=
 =?us-ascii?Q?UuxVXBxzW+aU5luNb6PilxkCL9ij7QfG7LbaUMNJGb2UyEW5MvNCTEd0RVag?=
 =?us-ascii?Q?m6tL9wG2zAEz/woSArqeFeVa9a62esj2GEkvQulAzcLP8jsyBO2RTroQdjN8?=
 =?us-ascii?Q?SmAtB5MLkpjV+MwYEgGpKWMC20KPSpx4OgAN1MiBtPrB4QGoPEhVoXfgjFdF?=
 =?us-ascii?Q?9CJaruwnVybH+XeXJymfxCBHI+XjeVPzFg4b3w3YcY6MfRQIOVHM1ixHkPla?=
 =?us-ascii?Q?8QhvDCF+s7ChvgnPvs8I59sHhzCKOpTkKuJVMf/aPHSCAaX5jBZXTCswuE+M?=
 =?us-ascii?Q?ApaydF3mgg3PNzLfXtq7H2ZivRWa7VMEKcN+AR6QqtFEd/GFtEK56hwik3Sb?=
 =?us-ascii?Q?pidn9ZQHAFMCXvVP+zTfcvVBrzhLRxIoUwXabBynneCV1V2Iywu7/zdCXfKk?=
 =?us-ascii?Q?kqHVLDASJQgahdgXkU3HJteWIeAubFygcw5l8gi0S/rOMjtNegLKGgYAib+x?=
 =?us-ascii?Q?7SN1neIpqp8UINRFd3YnOKCku4AK+vL3/I7zOSY3sLqu/pk5S6kicC514uZu?=
 =?us-ascii?Q?81ynlxDS8Q9MFhRTthIAt+IUvIe4nh45BXg1R9q0AZ+NbbBfVOU9pGgiKfqj?=
 =?us-ascii?Q?1mToXkl1lyAnRUpgVkpbXRyoabFgNfjOJeAeih3m9PpBEdHCm/LcerWFB3wk?=
 =?us-ascii?Q?DTP0mRMDTFXAFM8R9zPbnjN5U3djIUHVrwKdj6S98nP7PaGoYh6REhguFbyG?=
 =?us-ascii?Q?8H13ZH6euTElFOhjqxCXK/6eZwatIzjcPBj23gaF9Y/lN5IOaY3xhsiSpPIj?=
 =?us-ascii?Q?GEoFTT7ew5VnoAV37J2/dX78j9wcq1BkoOac?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:34:53.5113 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b19030d5-e736-47d5-b2ce-08ddf20989c2
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF00009523.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3277
X-Proofpoint-GUID: _y-j3ujHytkgSBDX4TEWIJtymtyOSKwU
X-Authority-Analysis: v=2.4 cv=GuFC+l1C c=1 sm=1 tr=0 ts=68c42f95 cx=c_pps
 a=N1R3yzTlvQktUPBSMMKl/g==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8
 a=8b9GpE9nAAAA:8 a=2nX9vmnUPB4WSxzP3lYA:9 a=CjuIK1q_8ugA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NiBTYWx0ZWRfXzo2SLeJOMgzr
 kohkp4tDGmdf9nAHCe+0aE44a7FPC1HLn1GOK6AufUw97WpLHLkrc0omOSdF69hWuMqTAK2nQdE
 FmK3zfZJQyo5N+po4J/8dETVoQK/cXUdM4T24oleh5zY+zblnuaSPAPxa1wvTCHalVzQxneq6Cy
 EjdxuVQ3FIR6/0DKZsNZgoOehw6benoHHGfQsGmb9l1/TY1VHNEYEfVIMDRZ9iRWTC5otLmAyW1
 ayqVIjHXlW/rwp4+j8ggEC4YmoRWDr8RrVBiiTbMKLS24RhXgbC+iTWdCfhmqmRm+QHPlNUdBn6
 bkZShTvZvcipOCWihHRPE1JZCQR2MFl9QyDxTKZ4Zjtt25rpfckwn5tySRvP6XUByXXmbsSgOZy
 B0OVgNYo
X-Proofpoint-ORIG-GUID: _y-j3ujHytkgSBDX4TEWIJtymtyOSKwU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 clxscore=1011 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100066
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

thank you for this patch.

On Thu, Jul 17, 2025 at 09:15:35PM +0200, Raphael Gallais-Pou wrote:
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
> -- 
> 2.50.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Best regards
Alain
