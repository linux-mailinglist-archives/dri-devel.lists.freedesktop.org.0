Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1999BB5518D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Sep 2025 16:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A6910EC78;
	Fri, 12 Sep 2025 14:31:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="AUpzWx6Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com
 [91.207.212.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6905610EC78
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Sep 2025 14:31:29 +0000 (UTC)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CEE2da000795;
 Fri, 12 Sep 2025 16:31:22 +0200
Received: from duzpr83cu001.outbound.protection.outlook.com
 (mail-northeuropeazon11012017.outbound.protection.outlook.com [52.101.66.17])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 490ywn01hr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Sep 2025 16:31:21 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QRQHCIB8BaUd2lEPNCwGaPTe7F9yR5FjpIaUufjyIyQCIK78KgR04NVDnxhSEYBtwBhka28Bz5zxZQHzK9iFmVLHlU4v0KzfW2kyrBkgPakDI7tweAxfbRVNM+uCyPGZcFkdC6F7jJkkboHbt2zjreYgPrKcJm3b1wjlvJRNqNmQPD1Xg7Yc1Ey5doxo5omrvgv7G7wCK1tchrBqJLO8JX/pSdQ1gBpfaenLKE7uvs2G4/5TvkcsQBDr180SrEVOU5y3smYnEZ1lKeecmiMWUYKDQ6pSCdqMKPZd5H+O2lw0vSYdhAAS2Jsdp1cUzKjCnbumygbEI69EEuAGmntFZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kG3dMbrSCjPZAJZY6yvjuWjTonecD8kF2EDo6eSu8WU=;
 b=jtWukJ7Cmp+G7Gwm546MB7zWm7sP396FOZEyrsW9e27a3nXJXTXWzQcJmA/dTnopsxfsndbeP4W3JKUQxNZh8d1He44nBK6o6LfED+FNl6vb1mmsDBrfSGbPr320GcxZdzloQ/YlmtEqJG2Jo88e7uL4zjELxl0j7O8GedPLi86PyqlA/z53H5yX/rBBODRIADRoqj4Ts0fUEeeQTe7F4IeitXaRtkdTlZAL0sPVwpUbp3XxyaoyhSKPfnz72OSiW2Eg6QXo8t6z+ft6nj0o0UNu1K+6n27nVHAzPH/KjluFCgpWIkS/rTeLvs/MjS29/tx0iyT01v51WqJ1rsbz0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kG3dMbrSCjPZAJZY6yvjuWjTonecD8kF2EDo6eSu8WU=;
 b=AUpzWx6QDrY/ICQgNNGgtni6U0iO9dZ37td96Kt9mKNFvOPp4H5L/u/CBkayl70Ck0b3HC70Lo1y2PAePtZ3kWwoEm0nwiqgaoaYGOkfRTUYMDymtDkEkYdnNJIeMaBpj+q4m9wu+ikQNCcEpsDDW/pVJm5LW7QGjGZbbf402cC3c4gcNnirYUhRmZ2A9izxA3HnZvp7B+jSfTjvqhpRbOMaZuM83C81ubgmRVu7k3lp1qoFkolvzW4M/uBg607dMc+L00PDBZQ56UHWxMWcTs5scBCNDsMr5LBGyqkx7IbLSVQp2GB8VlzKQWGnMpUGp1SI4b5ED1IjzUgIxgpMVA==
Received: from DU2PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:10:234::25)
 by VI1PR10MB7880.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1bd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:31:19 +0000
Received: from DB5PEPF00014B94.eurprd02.prod.outlook.com
 (2603:10a6:10:234:cafe::c0) by DU2PR04CA0050.outlook.office365.com
 (2603:10a6:10:234::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Fri,
 12 Sep 2025 14:31:19 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 DB5PEPF00014B94.mail.protection.outlook.com (10.167.8.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:31:18 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:28:55 +0200
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:31:16 +0200
Date: Fri, 12 Sep 2025 16:31:15 +0200
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
Subject: Re: [PATCH 2/4] drm/sti: make use of drm_of_component_probe
Message-ID: <20250912143115.GB51602@gnbcxd0016.gnb.st.com>
References: <20250717-sti-rework-v1-0-46d516fb1ebb@gmail.com>
 <20250717-sti-rework-v1-2-46d516fb1ebb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250717-sti-rework-v1-2-46d516fb1ebb@gmail.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B94:EE_|VI1PR10MB7880:EE_
X-MS-Office365-Filtering-Correlation-Id: 6862ffa2-ddd0-4e9e-b26f-08ddf20909d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0Q0086YJ2P8uHSbTktLbuIOYcgJwsEAhBInisEQwyIHkU79/ljnxHr+AP4KV?=
 =?us-ascii?Q?1BMI5U+jHXHQ4gM8hgiIn0db++oxb5U19uj/P1Upz1HsnOadXDUTP496ZiLR?=
 =?us-ascii?Q?JxpUEXss4jiknphoc8M1G+mkiF8mnu8VlJ97GvkGs+y7xDyvIGAuzmWKDAvV?=
 =?us-ascii?Q?80Y+uxSimSF/d8VcbB5uvXjFLE/LCVmjWlb46sL8lAKM0URkXVwaLQt85esj?=
 =?us-ascii?Q?qsxWNIdiKFfn2MNMFivzdQFStYJQ1uK6i+AV6VmkNpdiBX2QOwUL/IATyoGn?=
 =?us-ascii?Q?/RqFVHgJVP8+dP8UGBzUn0yT5ow4Zjj6JDyrC3gdQrlprWahrC4nDFzLa+PM?=
 =?us-ascii?Q?1eCb811VWMOu+0d380MQu/ErHci6+pSP6MzBlTjNFWoa05qIZI++FkjWtFYK?=
 =?us-ascii?Q?ZWDogDwY1sYY6CGwCTgwrKeNVIGOo9T59xZkCOmIOKIRiJc+9LdR4DVqiWok?=
 =?us-ascii?Q?cCcNB07Gd/Yb6DM6rnYrSMmXElNeXAHeMh/cyXhLmei17ghyUVSR5LByIJRz?=
 =?us-ascii?Q?8yanL4qvWPWe2Hoai9mb04he9tZB+w9+Hjmp1kHqjFeqp0WVqy/cWiCFJ9wy?=
 =?us-ascii?Q?aXEk4IfHTv+SRXHm0H8fnvskH6V1TlAvJb+VNf1CHWoq21C55DijIFxaEVRG?=
 =?us-ascii?Q?3eWFERQi6rGmNH7pqddQUU9wMm+JDlDQOU3Vm0BH+4h5Rt0BgQmfQWoU4Y2R?=
 =?us-ascii?Q?Sz4khzkSMYyQZ1mUn1ngD6BY7OISa4hEFdi/IRV05qCc5dWj1k0ej5hPcSSa?=
 =?us-ascii?Q?ev88AgPAvEuhVPL7nrQjLARGxcm4oMvJq79M6JbQlbbpisfq69W+nhP+BVb6?=
 =?us-ascii?Q?INjr+COrn+5o6FZZIGyq2aLPdkrRMV7Sl+tJzttM29xbqYsbREjCOMinKHgF?=
 =?us-ascii?Q?/uA9zCY1dCbi/AsKqlD7MKVfm9E0T2Bqx+BaETTf3/OyTB9Xpe6Btdu6E3L/?=
 =?us-ascii?Q?H2dt2O7YUhu1Oswk/ErIKAydNdEnnLLlxjDaf+WBSzw/Z//lc6Z+mbuM2eyT?=
 =?us-ascii?Q?nOMD1NpeMj/1duXdKEEVUNEmMTNN07NwFwFyrnI2Bx4Rx6ojkClh6i7qMz8T?=
 =?us-ascii?Q?FxeYxKU+poFm/ZQ4zUQnyws7sOc6jQNK/1RKFw+nETI/BlSw+jYDnK0xJ+Ss?=
 =?us-ascii?Q?JduM99RzPx6OVZLXvKTzaX5ZZC5SepcQCjP1IcyBY8g6PcKlCubTdrz+6qPI?=
 =?us-ascii?Q?ab6VK3zQ46xOAq2QaOft69d6C9n92l8XtbJopu6YE4E8LHNxpnZ+DYfCUETM?=
 =?us-ascii?Q?SzLf9U0INXsciw4cOQyWfooAbdPfO11397wTWRXJUy5fQKwFdwVlYf5NxI3w?=
 =?us-ascii?Q?aSy29WQGwD1cu/5v1bnzc4GpknjeGN833OGOdTwui5urAcRnEud/b1I+7hWX?=
 =?us-ascii?Q?u7ACFrf21PFbbEX/Bi6akVhatFp8q1Ka/eFqgrVTfaCAwATqHaBDSjkDxaHf?=
 =?us-ascii?Q?ZUWtrwBvtVNQSSiE/T/sj08psPjjn85MPn/uv2vUvfyyZDGF/GPd4uW+MVKC?=
 =?us-ascii?Q?G0quYA1hAKx0LM//CN4vHL40V3iycAOq34mh?=
X-Forefront-Antispam-Report: CIP:164.130.1.43; CTRY:IT; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:smtpO365.st.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:31:18.8711 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6862ffa2-ddd0-4e9e-b26f-08ddf20909d4
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f; Ip=[164.130.1.43];
 Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B94.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7880
X-Authority-Analysis: v=2.4 cv=OaqYDgTY c=1 sm=1 tr=0 ts=68c42eb9 cx=c_pps
 a=oUsyovHMWMX2TMKlxUGg2g==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=n5dE7JB0mAkA:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8
 a=8b9GpE9nAAAA:8 a=CK9Fzvi9yx8q7dJ-SpMA:9 a=CjuIK1q_8ugA:10
 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: QzIrDWZ4B0RwIxoo3bklNieNJxcZBYYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA3MDAwNiBTYWx0ZWRfX3fnEDrMLTUZ/
 Nr4hfPqev7UuEQrfhiPRAD+uiYmIcKY3llgKycDtjdd2+Y31YAFplxzEuso+c5Jd28VJVlJsdMw
 28vVFzphVpR/JS98XdkttMI1g03O+jqTsyR4MTmImcs5fxLL7t2gAuVR6RaMEb6kEC6yXqM/CdC
 p45GBGPaC0LL+pqfsiycHJfSncpW/aCAFFRwHBS1eLnYUEmVbpiDU0G7uSO1aYoQ/XpAkkVbpTr
 i9pB9ZY8ly2uEGoWPG8rXONu4eIW8u2ChvsTTd5BJsFmVRZixgMsguf+KZkvscLVvT2M5rfrGVk
 7/PpprgrwT1q8V3bN6zOaCQgYoIfbRQ8mlbeAVFRVFv5M7RLk6dtdJEMRJrosKGXkMz5gXZadIn
 OVfGIZhx
X-Proofpoint-GUID: QzIrDWZ4B0RwIxoo3bklNieNJxcZBYYk
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

Hello Raphael,

Thanks for this patch.

On Thu, Jul 17, 2025 at 09:15:33PM +0200, Raphael Gallais-Pou wrote:
> Enhance the probing sequence by using the ports property of the
> display-subsystem node.
> 
> That done, it becomes possible to handle the display-substem node
> outside of the soc node within the device-tree and not have each IP
> blocks as children of the display-subsystem node.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/gpu/drm/sti/sti_drv.c | 13 +------------
>  1 file changed, 1 insertion(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
> index 42f21ab91957b38cb9aef012b6ee7f4ae1683edf..9d6a7c8fa0759c0b6fedf87169b18cff3684be46 100644
> --- a/drivers/gpu/drm/sti/sti_drv.c
> +++ b/drivers/gpu/drm/sti/sti_drv.c
> @@ -231,9 +231,6 @@ static const struct component_master_ops sti_ops = {
>  static int sti_platform_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> -	struct device_node *node = dev->of_node;
> -	struct device_node *child_np;
> -	struct component_match *match = NULL;
>  	int ret;
>  
>  	ret = dma_set_coherent_mask(dev, DMA_BIT_MASK(32));
> @@ -242,15 +239,7 @@ static int sti_platform_probe(struct platform_device *pdev)
>  
>  	devm_of_platform_populate(dev);
>  
> -	child_np = of_get_next_available_child(node, NULL);
> -
> -	while (child_np) {
> -		drm_of_component_match_add(dev, &match, component_compare_of,
> -					   child_np);
> -		child_np = of_get_next_available_child(node, child_np);
> -	}
> -
> -	return component_master_add_with_match(dev, &sti_ops, match);
> +	return drm_of_component_probe(dev, component_compare_of, &sti_ops);
>  }
>  
>  static void sti_platform_remove(struct platform_device *pdev)
> 
> -- 
> 2.50.1
> 

Acked-by: Alain Volmat <alain.volmat@foss.st.com>

Best regards
Alain
