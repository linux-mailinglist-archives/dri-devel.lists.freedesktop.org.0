Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E67EB5517B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:29:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 637BB10EC7C;
	Fri, 12 Sep 2025 14:29:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="tr2bP+sW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E99010EC7F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:29:23 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CEE2dL000795;
 Fri, 12 Sep 2025 16:29:08 +0200
Received: from db3pr0202cu003.outbound.protection.outlook.com
 (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywn018u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 16:29:08 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TBjKQmvMxtGjDbShbepDzGCdKZRe64B8e/LB6oY7V67l69jt4CQDObaVEAMgwPMolKgk4KsL+OAkvnvV6JDERgKPkfw5PR6B54fV2RAvrbi4zF5erwzBCWOIY3pHlEad3SU3BZJ+hddUtFoR0DeUH6EswNXkrOu8cckTbueF68987DF6o3Olim0PymV4oJMgQDMSZ2nUIZQP2DXmreYICopuWlQR3tPy7UBYPbdyAQRHTMEcGY8wHf1vYOagVmZnsPMA8DaWFYzn0pdLhkxqMyzMYgNtK/k0dhhd4uDgw7rmqA6bScRNEItHKYCxNCTEaMl5XwmRTzPgody65W9eaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dbuXFtwa5tmv/6mu8Z/KTjEBxW5PdTNUt9PD2TQbGk=;
 b=jNJ9a726sM0nF6U371bbdfFLNfegr9KtdylDw8HyDg+4uPHHoCgMcE6F6bPUoCLpnQa+f7Z3hhlij+Ff1ax+nNPVBKiZHaOLP9Lxel12U/3xd8NZ7wvF5gcum68ZUahziLwtcFjALsoHaXhZbvZJKwRMmWWi0TpwgMZDBuvsnwsIiPtGrKkjt0gV3/p9Tu2S1oGKfPght/ZpNpLl0YvrVuDxs8rW6w8rgNOGs+KRppn48+OSzhlJaAszp7M6U6S6MCQ/OExrSP7KWbq0MdsIjXhz+PugavzKResZcchArP4o4tXQbwILaWEj47R4UFQMC8WMUn7VYCFITTdQdPiJ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dbuXFtwa5tmv/6mu8Z/KTjEBxW5PdTNUt9PD2TQbGk=;
 b=tr2bP+sWz3bYyfykt5sy8nBAx80F4DUl/eyRYAFHDuJpM850x6bXNd8OLY3ItVZua3fbQtJV3JgOzV3F4oR6D53PBt7e8/p3zxaZURjPg9XvFQw3QWPF07W8KNFlMimxgVEZTqA/s65qiF28y5T4wM5eB6w20PJ3SKKec2g8cJNEFSgo6X/eE/WLBUfKX2SkgEXhnxunWDeIDRxZoHZMJYmyU9oaIVv9gVbgrtaJDDjJP1x0vUF9jRbPZhi7BTa5e1lOALUsEpCuXK/uitY5WOi38YBJ7QL3SCE6SGC0uwQm53thqCH2sCor+gM2PY9MqA9jXxkvc6M1zd2ca3Ma8w==
Received: from AM0PR02CA0204.eurprd02.prod.outlook.com (2603:10a6:20b:28f::11)
 by FRWPR10MB9396.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:d10:1a2::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:29:07 +0000
Received: from AM2PEPF0001C709.eurprd05.prod.outlook.com
 (2603:10a6:20b:28f:cafe::14) by AM0PR02CA0204.outlook.office365.com
 (2603:10a6:20b:28f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 14:29:07 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C709.mail.protection.outlook.com (10.167.16.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:29:06 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:21:58 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:29:05 +0200
Date: Fri, 12 Sep 2025 16:28:59 +0200
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
Subject: Re: [PATCH 1/4] drm/sti: check dma_set_coherent_mask return value
Message-ID: <20250912142859.GA51602@gnbcxd0016.gnb.st.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-1-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717-sti-rework-v1-1-46d516fb1ebb@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C709:EE_|FRWPR10MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 93dd3445-89f9-43b5-23cf-08ddf208baeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VFUsPYOUlL1jH+TN3c6TUxKZEsBZdMbHYxBcLemJ3zkp9WVC0XkehYKJofV2?=
 =?us-ascii?Q?nw84CdF5iZaxACVbhRryBM78q+f4g/WLMz6i6Ps8diGxzir2HliZt3vDSnjG?=
 =?us-ascii?Q?JcdUkKwUPp0B4XhCrwQzZx8anwQCgaA/6jtEOsAHHGDAovE37TRekc5Y1Pev?=
 =?us-ascii?Q?QZVfMjakXassg+Jw97dddV6XTecQYPFnJDyKFCVmPFjj0J6autgJhOZRAUg+?=
 =?us-ascii?Q?U3v84DrkfWeZRBFeOb17DEzHUMTvvfh8SB8oK6dPsQmlI7s8zRPOigGOQ+KO?=
 =?us-ascii?Q?H4c2+7VQyCpUip5QaqcKKM0fCao43YTR/FvJjQib4n2Yn1QHvzePdkb8J/3M?=
 =?us-ascii?Q?nGj43UQzoBVIc5lF4uJAXDB6NJ7KwKAratHo1ypd9Z133JkB3AlPS95JFOob?=
 =?us-ascii?Q?XMaMOdRMN5la5vUxSQgYYlCMnN5f5r7TVmbdyEYwotTfyQsJ+a7RWkduWl7P?=
 =?us-ascii?Q?Y20DOdA1q34ROht0JmRh1FQhRFqWYfN4NaN2UqRFzyb5ZJnFfuym+8ztnB1J?=
 =?us-ascii?Q?IDP7cppsV/n8EjYka2oCHFx884NnjwnNont/TM7z+EmafPfBXHK6QVagxUMC?=
 =?us-ascii?Q?oVnAYDHotU5EiF+hMzcg6mjs8RFJ6rRLLykWaCIFU3zvYO7o+LMARAX599W0?=
 =?us-ascii?Q?eYOWEqRUljVBuENaV2+fchYg+aMsQKoeXeNs4b4e5D4KCZhdnrCtu68fMQGh?=
 =?us-ascii?Q?OXchPDuycJ2Wl/KjH6qxg0L+wwkSN21kbR4VIp12RPyCOxxnd+j0OZWO/hrz?=
 =?us-ascii?Q?0IlpQ6UAExg0IA6s/Mf88mAOS3hMZite1uK4mIUOijuY81yrazZUD76iG48F?=
 =?us-ascii?Q?l1WDQPjUI/5/ursnokwBomxs84OKbA3S/sj4sCOwid3U9q3GwbKvazkyay1A?=
 =?us-ascii?Q?yQ+L04X7HUWlLm7dWoG6cqHDMUSPYYMSDIHnH15rvBpJAQzBdkBU7PhVk+wA?=
 =?us-ascii?Q?4wEu8Ie2hxHXY/wilJ/dcfW/gbrDTqYdR5wuvgP9aA2V9t4lhOVGQi91W0V5?=
 =?us-ascii?Q?wPaifuKIdQflhNhi5f/DiSu0E2mwskCKBsMN0iAfP8wG2VRm412ozae/6ZTX?=
 =?us-ascii?Q?AOxX1qDNwNFC3g/hYnVIr+dQRbrJf3pXorWIqw+pNJqmquuEwNAYW5K+jii6?=
 =?us-ascii?Q?8yYj6NhZFVjPELzOOrYw9YgCdpR70vVGF3Eb20qrEe5T6DIfJqACYguQd7Xv?=
 =?us-ascii?Q?lr2O0fmPe5EkdRAaECbd0f0JGfEdX1BjKKnJFXjELs3DPEcpHBxcL+2XA/MK?=
 =?us-ascii?Q?WGEvMB2PiH1jmEtFSfgxePhrCUDAxV4m9IDKbdim0W376tkjIl+VtM9MV2YC?=
 =?us-ascii?Q?ZhVefTWSlQ2CMNjHkt8FIaW+MRyiloQiPueXG5kJtIZgXRxbBxBsKyLA9yMk?=
 =?us-ascii?Q?O7mhALFeSf9rHGJusqqBm6nA17cNSxhwwQnYP1cITNSL43zHfzOhJJJ5plB5?=
 =?us-ascii?Q?kGYjarePyjsSPB1vto9+eelEzdopbbJigm80hJ1CcsmRTF2CPgRlJH3N2CQo?=
 =?us-ascii?Q?BQUFxO5cwVdfrdsLlSrYYeGk5B/HgUszyIos?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:29:06.5155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93dd3445-89f9-43b5-23cf-08ddf208baeb
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C709.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR10MB9396
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c42e34 cx=c_pps
 a=m34DfEKy1giqG87zYWQzPw==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8
 a=8b9GpE9nAAAA:8 a=CK9Fzvi9yx8q7dJ-SpMA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=CjuIK1q_8ugA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 9bQLJ6MLkYKBR6u5sbiWstXlWB7fjmRk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfXyw673wxof1EG
 cnS+iXOXXwFI0qfEn/lm7au9lPf+cdb8RRcfPCKC7NlEDqiFpQpw7edZg42h2GLqeLJCWcGTjnK
 aQoqFb/jCs6mGMx0WV707G7dv16QETNCSMReOvLoT/rln9WpkmbNYUcXN24UV/52VYfFedyCkyu
 kFxwa/3dvgnDQDaUwbjJMvlvXTtsHQ3xlogOzhvd+67OrB7jg+7tBPuxEj8ntGpdiGmYMVpDsfc
 sVTAmK2mozHRBheIQ548W0PimACmotn9Zwf9jFPTfq4ExMGHqfoKJAbreSbNjmkd7S7CZSI0VXB
 sgCD9U8MwbVF4+rRzlEkzkIAINe5OIka5PkXsibP1mPF0ATS0hdT37niHKcfyqpjFr6AbO5miVs
 K2L8STZD
X-Proofpoint-GUID: 9bQLJ6MLkYKBR6u5sbiWstXlWB7fjmRk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 clxscore=1011
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509070006
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

Thank you for this patch.

On Thu, Jul 17, 2025 at 09:15:32PM +0200, Raphael Gallais-Pou wrote:
> Return value for DMA allocation was not checked.  Check it and return
> error code in case of failing.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/gpu/drm/sti/sti_drv.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 5e9332df21df0db30f10b7a6f5a41cba85c4f7ae..42f21ab91957b38cb9aef012b6ee7f4ae1683edf 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -234,8 +234,11 @@ static int sti_platform_probe(struct platform_device *pdev)
>  	struct device_node *node = dev->of_node;
>  	struct device_node *child_np;
>  	struct component_match *match = NULL;
> +	int ret;
>  
> -	dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> +	if (ret)
> +		return ret;
>  
>  	devm_of_platform_populate(dev);
>  
>
> -- 
> 2.50.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Best regards
Alain
