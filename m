Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307EC0F168
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 16:56:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEFA210E4DF;
	Mon, 27 Oct 2025 15:55:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="lYSoskrZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1939 seconds by postgrey-1.36 at gabe;
 Mon, 27 Oct 2025 15:55:56 UTC
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DDA10E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 15:55:56 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59RDKT9K1936647; Mon, 27 Oct 2025 16:23:11 +0100
Received: from mrwpr03cu001.outbound.protection.outlook.com
 (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4a29hmgfn1-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 27 Oct 2025 16:23:11 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mH5BAcdSnAm0KamlRVNH9dVs0Lqu4xkYN8O+EDBx8tx13rJdKjU0C6pRf5sSwQS+1a/IlIHBWe1rIF933UJkB8MThH+Cx1PrBhi9zVe55z0fyn44V7Gk4EikJzEMJZ9DuIMkr8lqFEDtNIwolix7/FGlmjMCuZeqQ+2d5eb/unNhxvW+gvihQGHbx0EGhJeGcF8lW6TcPD6ulF5IceuaUBX9vQlaRU4ti+FjAdrjySLcS0exC3c2qSCDrI/RqdEKmKYIokRs+0x2733y5esLDqcPzHUJvdkL/BTV5cMxetDQ/07UIjIAX2TR3IoswFoDmAGuJ/7ZsV/o0icBOt0zug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LwDewJG1jO9rfxAYqsXD5ct8VMXYMD7vh7CweHxvtQA=;
 b=E52Gk+yD9UZv/644DzvjCNImTRT/363oApjGZHxyhDOetQz3VP2vdC+ub42E5WCmyZOnhaNM5kO2zOUSv9fFSWwQ5OPfluNM02OTbpGP5V9Dk+l49bFMQx5fgN2pc5wxwv/gKl9VFdhd8qcC68maSdTJXXZSF6B2VjM+ddbWoGDj6y6xI7Q6I/HNQ8IWgaFKjtJd7CAzuKlB2sxnyx8fhLOjRPUEGFP8Fejg7CILxBvCxgaPjv+U6kOYEldeIH46MWxLUGMwHwi0j2dXvMJqFdA6r+qLGpYGh2APLYeCmTURxbDkdOZZ3HAPhfpUHj0Hc2K/iAMW89d6UMEaZ8JgPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=bootlin.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LwDewJG1jO9rfxAYqsXD5ct8VMXYMD7vh7CweHxvtQA=;
 b=lYSoskrZwcx/ph0q7ncjE/qsQg7KpIlbgH5UjE9KuDt1Er4THqTwB+VekOfs6ClSLx0cMfu6W3P5WF8IfgvVPtOhtwgteKLHE4o7pUwILlr7/wHdSzjTFF/CZGhwFpYcMagyM7nSThVMGMHo2qriQQRSJsrnx33OglLtkDr2ruFcgpkt2O7dxckbJoVCxcFhmz9AUNjE2Jta/kuRYKsKwuTMpOPdt8KuhB0dhqEsLGp2lwLJhSPznxP+aqrvOlNgRaM9HFXgWU1v5d/j2QpPr7WhonGT8VYvML3RIsGL0o28SPhgoqtzLuKjDspMJVljQjEcTTUWNRNsFBe68J1zJQ==
Received: from DUZPR01CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::17) by PRAPR10MB5400.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:294::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 15:23:06 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::ef) by DUZPR01CA0104.outlook.office365.com
 (2603:10a6:10:4bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 15:23:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.7 via Frontend Transport; Mon, 27 Oct 2025 15:23:05 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:15:37 +0100
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Mon, 27 Oct
 2025 16:23:04 +0100
Date: Mon, 27 Oct 2025 16:23:03 +0100
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
Subject: Re: [PATCH v2 1/5] drm/sti: hda: add bridge before attaching
Message-ID: <20251027152303.GB1160161@gnbcxd0016.gnb.st.com>
References: <20251021-b4-drm-bridge-alloc-add-before-attach-v2-0-c17cc1bbff72@bootlin.com>
 <20251021-b4-drm-bridge-alloc-add-before-attach-v2-1-c17cc1bbff72@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251021-b4-drm-bridge-alloc-add-before-attach-v2-1-c17cc1bbff72@bootlin.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EE:EE_|PRAPR10MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: bd590295-9401-4e64-9a2a-08de156cba63
X-LD-Processed: 75e027c9-20d5-47d5-b82f-77d7cd041e8f,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QVKN5gZbiOZH0bGAh3d1S9ceT9TVS56R/dsBvkGZO2v1OJL7TijaNkRSyCXF?=
 =?us-ascii?Q?qrjUzeYGnRLChbjEJFQca1OpJ3/8ZNjPbTZELL6B2u3ElHBAUKrTvVVPTZMq?=
 =?us-ascii?Q?y6PACUg7ed56kZg+E7D6iFtylK2XLwit9NTgzZRGxfpPbViF6jt3ForWSolF?=
 =?us-ascii?Q?ATB2Zjn4ZcCArQZBO722Gm/K4crCatVng4X57MpL9eth74pItQnx8fnyNDuH?=
 =?us-ascii?Q?kZnHM/IDc/iZcVA2XChAlq0+Re3W+c5D3fyu/++/AmeNOXyzA0UF8YFsJJPe?=
 =?us-ascii?Q?3KVkwz/7YDPWBE5x6NJEHIayC6dCCXhkdfs5P9DT8YjAg3hYFsR09BauJIjy?=
 =?us-ascii?Q?RoxYI5Qqr+ILQ0TbpyQb1r/yADMWUA8jp9D/M7DrhvX7fBbM9n8VYJ0D4XGq?=
 =?us-ascii?Q?Q6O4hY+rF90vvX8TaGizum1eZWJv6jfJ71eeoxgDr/27TcCJQjgMMFKwr6tj?=
 =?us-ascii?Q?FGr7ZpUuMpKJJlvNDnP759VCQ5S4uYjQnd193SXwYtUKxIbn0aYHEwXKP6y2?=
 =?us-ascii?Q?94YlK51KM17x577BErVWolwPipLDHUSIvvj+3lhO4wIZwZWBdzDHUwJrKKBe?=
 =?us-ascii?Q?uRR3PaFjEzg9AsZh5ivJNN0Z28RCHpLJmok3SjdP8UxnuDl3pUgJ6n7A2eMC?=
 =?us-ascii?Q?79ByZP12uCOity/ibiCPkR9INrKOQwn1TeGsV2Yl5FtWpE2y1nzyHDeZkthO?=
 =?us-ascii?Q?9CB22pgptCf9gKvzxB4aH8kk6+MAysgA4l8kY1zbKPw4hJtGxZBsA2oocs8F?=
 =?us-ascii?Q?egkfPsbSzIetKmTdJASx4zVq7DPkC9K3KSPDeJ/uRzFC6DmnOnxT0efuNW/E?=
 =?us-ascii?Q?ZoGVLg9oihOu2cARjCdtwSCcowz4Ypdeq4y21mYVHIBFbdKnbZei8LRKsTMi?=
 =?us-ascii?Q?bdQixVX1snk2RgjPzpa+9ZpLZtNOK9+OnmAvrB+dDjoiD6Emn5d2moaYzAGf?=
 =?us-ascii?Q?w2nv4LD2m/39DM83V2SPetIcvjZ16URghkXQ2htiw6+BFTwWUw2+opuPm0aL?=
 =?us-ascii?Q?0IjzH31juIXiSS3rhb3Uj1vH4yOIlWrMX2qKo8aAF8SH9fjoRSmo5Rtt3Uo8?=
 =?us-ascii?Q?/Nb8uZwdA3KSc+U6FKd7EU17Sa5tbLxSutZkIIKgl6Dsq7IQceKl4ILIjHqV?=
 =?us-ascii?Q?otqhEC6w0R804gEYWdEUBJhR6kWb1cjQdd6e260CqMcXGIOEIiKgeQIpqvyY?=
 =?us-ascii?Q?BWt8FDhy74P/KB/dBAhnOGzakmU3L3r1a6GlBUBdBcpnVwpHWL7yt+7T3GGQ?=
 =?us-ascii?Q?ymQFHTwm+/FF3f3qy85w3WIsfr+t5bfI2pJU0eNOL/NTmHEUzccFSqWP/oZf?=
 =?us-ascii?Q?hU26Cy3Mh899+P6Pqx3oUaIavlqnh5abnndA3Xv39Mh0Eql4ZdaJ4FG3CAU6?=
 =?us-ascii?Q?aFMLNyM+qAvfADrxiFTbla9wks/+ermK8U2jAZJPE1aKSht8nNBYBQr/RVSb?=
 =?us-ascii?Q?2RnK2NyMNocVg8KhD717anYRZuv2946fYbJJNhrPam6OJx5N1Lbf8mtCm0fq?=
 =?us-ascii?Q?iK0g7P01qdiDPMdIENuZvU5m00isLmlJjzBu?=
X-Forefront-Antispam-Report: CIP:164.130.1.44; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 15:23:05.9565 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd590295-9401-4e64-9a2a-08de156cba63
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.44];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5400
X-Proofpoint-GUID: 5sTYal7Y39UAEV7na4W1BDNEK04MmOj-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDE0MiBTYWx0ZWRfX3ZO2yZmj1AGy
 vEm4Lh94B6nNU3qcgfDKIPz7dsZ2M14UnOSm8dKOjmzfMXoOkL+tcl9Rax4cDHRYK4xImUUI76D
 UPJ5/nlg/HDYAzrK/iEFX8GbWeS50jTYQgUHKsXC8ZEHGWmsSiYJf7ePcF+FWAEzGA9SHL7QPOp
 RfTsPOBbUV2MsUv2LpTQWRoCyh+L+dUznpmBiRztX/dw0lWmJAgbEktO9waRqQnq4/oA2bj2c1t
 cjhGKHn8W534mGdRkGSAcvPJZitHFXWpJneK3eAslmvg0BEAHdKKiXx9lCte44in7zJRBD6rdyU
 1SgWnbPQajy4xY2uCDMIOou3H9USrGoG1v0RILEQBoheubHNzeUEUN3RQ48qKj8nTJfRWd9ENT1
 9/GQexymFKSPwBpkM4otuV/zVrU9lg==
X-Authority-Analysis: v=2.4 cv=CLInnBrD c=1 sm=1 tr=0 ts=68ff8e5f cx=c_pps
 a=kV4qmwoOnOjkUfa4RRfhzg==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8
 a=8b9GpE9nAAAA:8 a=xDF-Kp9sGb9g2SqK7YkA:9 a=CjuIK1q_8ugA:10
 a=d3PnA9EDa4IxuAV0gXij:22 a=T3LWEMljR5ZiDmsYVIUa:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 5sTYal7Y39UAEV7na4W1BDNEK04MmOj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0 impostorscore=0
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

On Tue, Oct 21, 2025 at 11:00:44PM +0200, Luca Ceresoli wrote:
> DRM bridges should be always added to the global bridge list before being
> attached.
> 
> Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
> Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/sti/sti_hda.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hda.c b/drivers/gpu/drm/sti/sti_hda.c
> index 2c015f563de96ae58959801493ead870c49f70e5..b7397827889c94d6f8e8c2a48b09f06e29ceeaf7 100644
> --- a/drivers/gpu/drm/sti/sti_hda.c
> +++ b/drivers/gpu/drm/sti/sti_hda.c
> @@ -779,6 +779,8 @@ static int sti_hda_probe(struct platform_device *pdev)
>  		return PTR_ERR(hda->clk_hddac);
>  	}
>  
> +	drm_bridge_add(&hda->bridge);
> +
>  	platform_set_drvdata(pdev, hda);
>  
>  	return component_add(&pdev->dev, &sti_hda_ops);
> @@ -786,7 +788,10 @@ static int sti_hda_probe(struct platform_device *pdev)
>  
>  static void sti_hda_remove(struct platform_device *pdev)
>  {
> +	struct sti_hda *hda = platform_get_drvdata(pdev);
> +
>  	component_del(&pdev->dev, &sti_hda_ops);
> +	drm_bridge_remove(&hda->bridge);
>  }
>  
>  static const struct of_device_id hda_of_match[] = {
> 
> -- 
> 2.51.0
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Regards,
Alain
