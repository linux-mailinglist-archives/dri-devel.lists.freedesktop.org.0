Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E977C0EEFB
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946C10E4D3;
	Mon, 27 Oct 2025 15:24:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="QUG2gxaI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B461E10E4D3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:24:20 +0000 (UTC)
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RECJSL2078326; Mon, 27 Oct 2025 16:23:50 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com
 (mail-westeuropeazon11010010.outbound.protection.outlook.com [52.101.69.10])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a275j12dc-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 16:23:50 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=isJmH3FJ41bEnhKYw3M06ftfFYPaDF/KDbfHCPc3633AXD3uPBIgHJA/GOXNuI3sns0alFrIaotlKqZ1Ed/I35auDvk/US3qPhFvs/VzElibWX/KsZa+gvg9rbtRe15lzC7ydYaY9mQ3oZLkVS0WR9tONPNXHHSRm4MGGLjkFM23JkkGF6eyeJkLgMq/8SkgXrHuTsW7nCSTEms8hg9uE5XKqOGkCDf7Fyu0ObfTyfjVo5ZjOiml6w5S+nbGg8W7OqQluef3rIdszQ37YyZtXAKS5w1hkKqx1GbDLDfl/fLDs+2aPIyipAiao6ReLI/x2Nxp04ptiXZdFGOPR1NV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGp4ywyVr3ARj/XaViYh9BGDzi5UhWqB+Os8c6/GJZs=;
 b=xmm7l5YH7k6wgOGcOQ5KR9l+atlV//4p3TQQJzdUAPt2fswW/VWRO47e2VJ04cr4otCjDtd8A9RFC9J7LoKHWagRQ5FmBGCsFNGgQUdBJBxJUFnaZMKxdIYfVkNCphqC2W1DcwlIjzhZUIDIhtM0dpo0QESp5WwiRY8YRFhvpvgaxP/KIXoYSl9QOLXC93n4Lbh7cEVosC6SaBIDAZvk19kvzLPJ0RGI5OQEsZX1YmekOIGpCxJpGEkPxcOe9eyJddfEkfk75CGHGprxYQdhc3vaveUGpcYXsKfrbAAGTPb5rDvikBo9vID394/59ygTytO/kLf6DE0GzFmMYYXi4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=bootlin.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGp4ywyVr3ARj/XaViYh9BGDzi5UhWqB+Os8c6/GJZs=;
 b=QUG2gxaI0TIwt1Xn5BewWXG+th9Rp5cyZraJtsV8GluSXSuhsnmdpGa9GfXu/+aO1AMpnIbTz0gGeCmoR02/3S5wN94MYe5yPhvUcnfnFNqmbUHDdtyAdGUaTF7N8p+3CP4QH+3X/O3pdWbq34faWMQen9DnVixMbyHQq4A1SeG+HUyAzCMpRsxKdWGuffF6VKRIti0tK2UbaEZxzym14EVXFD0W2gYdEuKWvdJNqO4U4sSQh2RaImQEnjtkRQyt1Tv1AvQ1L24OHD3ujq+1juM1PspZNx8Xa8YXIXcgH8aFj/HKc4BWIadm8a+E1YZDlN32QGIrCxqYO8S39ddV5A==
Received: from AM6P193CA0076.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::17)
 by VI0PR10MB8981.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 15:23:45 +0000
Received: from AM4PEPF00027A63.eurprd04.prod.outlook.com
 (2603:10a6:209:88:cafe::e3) by AM6P193CA0076.outlook.office365.com
 (2603:10a6:209:88::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.19 via Frontend Transport; Mon,
 27 Oct 2025 15:23:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A63.mail.protection.outlook.com (10.167.16.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Mon, 27 Oct 2025 15:23:44 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:21:30 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:23:43 +0100
Date: Mon, 27 Oct 2025 16:23:42 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: Raphael Gallais-Pou <rgallaispou@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Hui Pu
 <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/5] drm/sti: hdmi: add bridge before attaching
Message-ID: <20251027152342.GC1160161@gnbcxd0016.gnb.st.com>
References: <20251021-b4-drm-bridge-alloc-add-before-attach-v2-0-c17cc1bbff72@bootlin.com>
 <20251021-b4-drm-bridge-alloc-add-before-attach-v2-2-c17cc1bbff72@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251021-b4-drm-bridge-alloc-add-before-attach-v2-2-c17cc1bbff72@bootlin.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A63:EE_|VI0PR10MB8981:EE_
X-MS-Office365-Filtering-Correlation-Id: 98fc6dd8-76ef-4607-0395-08de156cd1a1
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nX9HnbcMibI0nF1iLJuIHX/ao7azA3IO/goJoeVCeXUJmbbF2Wrf3kWy551a?=
 =?us-ascii?Q?LWvsiuo3ySVq8up0bScoQ09Fslp6fbuxAOQxOSSKWw6Bnt5i10gCDBeA3/oc?=
 =?us-ascii?Q?EeA+RhnFQM1pYgGd7U7ln2INGm3Q6mtLc7D/nTj/5dunM9fPjdtcsN5mvEwj?=
 =?us-ascii?Q?Q4LmetODPZG39XzPZoFbzSSB8zo+nbKjbi++o4ptg1JihFIREEZoT1NTG79F?=
 =?us-ascii?Q?K5BEGhGvtmeuvfxEyKfRqMQAd5yR6HFnDKnK0oLOZS9w6Trrn25q+OFLi+Kj?=
 =?us-ascii?Q?3F+zJ0jR9bmJgBui5ryx7IRw7H0hkaYMNlZ5u6fyTM6gM6CCgt+9lsGOUedq?=
 =?us-ascii?Q?BD+tz6vwCfqne0XAQWAH3Uwe8PO8HHVlXlZDG1jXOrDEc9gS3xwQnx/jCfml?=
 =?us-ascii?Q?eOoVY3XvirtdnQJmpMtWdyBz95aSk7gudF2V+6yjs8QZqIuM4VRpdCOgnvyM?=
 =?us-ascii?Q?5ARVGFyN2hT0U1Icx9imAi3WzVmckbcLkTKQNhtE4XOBMZIyGfhzGm9jjm74?=
 =?us-ascii?Q?zEncPZktVdWfm1lzKFFmsZEQmkhY0j2lYho61XsB3+miRILYF1nijEiHZd4o?=
 =?us-ascii?Q?luZoXYdEY6DRe1q0Ne6ermVlHGiLtL95hCVRUFoJXnFKekPaPhnvY1bBjWHh?=
 =?us-ascii?Q?fi0jqYplFIYemlJLngDfyXTdRsDXucfIFpEkXsHQWQ1Ka+Kv69lpdosw/9ll?=
 =?us-ascii?Q?L2xMM9zCWuYm7DAp2Ewcow/oXn3Z2GKLGbPLH/4XBoazy1bfWDQSumW8iQa8?=
 =?us-ascii?Q?0lmYfOEsWg+4yH89vY+pJNdp9vPjT3T3ul9IGM5BPigi8xy0ELuIXLohvbhz?=
 =?us-ascii?Q?lVux1yvsl31WtvnGYLuryH763i+r0ig3ZjmuJHVsX2aW2mY1ztjWNYmzIm8o?=
 =?us-ascii?Q?phT0Jh4scvh4h5q5zkIE3m2f7IODzcendRHkdfsv8ShiJUNwWl0++GEdhGpo?=
 =?us-ascii?Q?bCoqPAcPrsAZYfK9WG2CLkT+3ACzaSC9RP3Y04xUGa1C5XdVyMry3bMq+czg?=
 =?us-ascii?Q?37pVGCGAEe1XIDVlmDJJu1Urm1QQr4xVVTfthk9BtU6rZ6JYcTXxhNidoFeS?=
 =?us-ascii?Q?3YusHAmt7yzIpT3CIhqPC+DgigKrKOiZCt0Ytlhr937rhsfMDoWT38PHDMY6?=
 =?us-ascii?Q?faHOY/skNwpGdUPuxsLdsff4BR151aL97UvTqaAaGYlXCa0vGRaGXPQ21jt/?=
 =?us-ascii?Q?iHT+esgzGjpYDGktAWDNURh54vmJQbI+Ioq5TZs1uIlrW/Yv9PYlsZ3Xjio+?=
 =?us-ascii?Q?Yjx2oxuLA3A/hl/whJi7gmVv+lkCpwrs3fiN7walVyfURzIzXhHpVtG4vS/s?=
 =?us-ascii?Q?tALr8dNwxO5h5vBrWnerm11eXLrz8qVwo8Di2KnK/0fzQdkqB1d3f28ox6x0?=
 =?us-ascii?Q?JDH+K7/XPgdpjm0wGLExktiSyfkOtalP+xSha7AviKYsTsvl2Oz4u8FedJ9o?=
 =?us-ascii?Q?/lww05KuG+FV767E5Gge3cu7UUbF9jCBHlZ+sBRNbQUOYYTJG39Np9agR7i4?=
 =?us-ascii?Q?ZmH5y+W67h9RXu+j2VpZG5w5jUDDyQ7l+Lb3?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 15:23:44.9929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98fc6dd8-76ef-4607-0395-08de156cd1a1
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A63.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8981
X-Proofpoint-ORIG-GUID: 0UIMPXp6ufjwSSlEGboaSHHZrwgAz3or
X-Proofpoint-GUID: 0UIMPXp6ufjwSSlEGboaSHHZrwgAz3or
X-Authority-Analysis: v=2.4 cv=GKYF0+NK c=1 sm=1 tr=0 ts=68ff8e86 cx=c_pps
 a=1mLpANhVl+IIdY2X1CxjjQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=8b9GpE9nAAAA:8 a=xDF-Kp9sGb9g2SqK7YkA:9 a=CjuIK1q_8ugA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0MiBTYWx0ZWRfX11gFnTCp/fAo
 HHPXx9mF6s+Z0AyJbt3jcxQhIjJCBQM4dUM009ZVz7U/NQJgXYfO5tJ/YMXNs5qpS+lG8JYTlFR
 eklSJw1qZtc4Ce2JY5GPYZN9iyP2/k5nzXzIQzeiqwTpKWuWSuZCI/OOJlvh7s93s8eTDJXeBis
 QJ49havXflmi+Q66/C5ODXSQRCSrPmkk5ITRmS9Je15UGi7Ucqq/YgCpnJ6XjOcT1Ab8dCRl0+u
 pFUDcf3JGC7ycHTFi4e4guNd/AkrLBbfaNSvkYWiNOXboLLLm9yVhai0sJKKodxnhgCJN4rfoTk
 ZvRf/N1azSHGaNcgLMN1nXle9kKqSV0kBQ1Hc0+hRQx8fD9xJRM9mBBW23hULFL68JNsdiDlNJi
 X6S4uBeB5+xGy5V1Z2ewjhh3k+OJbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510270142
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

Hi Luca,

On Tue, Oct 21, 2025 at 11:00:45PM +0200, Luca Ceresoli wrote:
> DRM bridges should be always added to the global bridge list before being
> attached.
> 
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 4e7c3d78b2b971f8083deae96f3967b44a6499cb..f8222e60b1e01afb6d93f816915f17056c060f22 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1459,6 +1459,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, hdmi);
>  
> +	drm_bridge_add(&hdmi->bridge);
>  	return component_add(&pdev->dev, &sti_hdmi_ops);
>  
>   release_adapter:
> @@ -1475,6 +1476,7 @@ static void sti_hdmi_remove(struct platform_device *pdev)
>  	if (hdmi->audio_pdev)
>  		platform_device_unregister(hdmi->audio_pdev);
>  	component_del(&pdev->dev, &sti_hdmi_ops);
> +	drm_bridge_remove(&hdmi->bridge);
>  }
>  
>  struct platform_driver sti_hdmi_driver = {
> 
> -- 
> 2.51.0
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
