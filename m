Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A59AA7BF44
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603210E21F;
	Fri,  4 Apr 2025 14:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Hvh8oos0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011041.outbound.protection.outlook.com [40.107.74.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854B510E21F
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:30:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vm+IYcOl73c5U4AOzxD2FMOVDZtyYFoskPekxXMMVGQ5JWuAoG7/fhYeGSulVbAh5cS4Jmt59JCfpT78TghIow9Drq8KTbagkcbZzbZ9QMjmklRDIE9oBmEhIMRumSIzDC3m0xjYwimGxLyXL7gwUwBTkFHyk0Bi+9wMRvfRh++UPnsVnX8QJOGOwnhvt9UTYvGmf8THPwfW56tuke/5dlSXDT60LSgHVbi4FoExH7/fnhppU12eERisZn0/rvkkM+VokpooKErU9VUqBkADVacmI2HtGPDvBdDqu+iiKc0bBSiyvg+zYqOoxHxV+iGM56Ka+4HZ8tFlVetJr4MLEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNlfvbqok+2m5cuvtL9dwfC6fNMPEHj8gOIL+OCdat8=;
 b=n8TSkrBpfe/QHpDO4zNtdUteYNNRSGAvlR8MqrL2wIu5BMt3hFDi68jwmPKaIkCVk6WEDuDPaXMzT3i4DXodi2IWTwJxYgtd8frUy4meq3lEivWAxW1oxRirnt9ggvaaLxhleXM093qAe8hPdSJ/vhn9DKa2m1CcWkHILyCoPDMkuBb/ZuhLR6rc/yd6yZ3e4cOTImEpuCRRJUFm85Nft+GhOdrKjzlbitDclfsO9drytG+jMQDRuQxrhDCEWuBBii0dFIJM8o0wwefpt0pXz75DICm8FZ6O1ls334N6QbR6/TBjljkF8Df/LQExgOJQzXc9vjKtMXxELSGUIHim5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNlfvbqok+2m5cuvtL9dwfC6fNMPEHj8gOIL+OCdat8=;
 b=Hvh8oos0OgdLoebFU/2CPmZVhNbriZViU0RBcXAo7lZ+hQ9K0pOU2ocOBBxLQEQYrD6eklR6vBHz7taXFQqQUJAOW8YJVJXo3l/7FeDPour4ciKLvI/zfQbQTm4VIn0sIhFDtUwcg0rfMo0muDUt01aWjcn9vbV1viGYHYcmCEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9691.jpnprd01.prod.outlook.com (2603:1096:604:1e9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Fri, 4 Apr
 2025 14:30:24 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8606.027; Fri, 4 Apr 2025
 14:30:24 +0000
Date: Fri, 4 Apr 2025 16:30:07 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
Message-ID: <Z-_s7-LvSehOhYPR@tom-desktop>
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9691:EE_
X-MS-Office365-Filtering-Correlation-Id: e04e8ff9-fe0e-4b7d-0d20-08dd73853ca9
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FfP8y5BwB6ExTjin+y+VcY8W+IuJIndbELHo+rVaPcFDUEc1CHaqcoaYTuy9?=
 =?us-ascii?Q?0ZdQZso9bTn0+SyTVc1HBreHSCFiAbakTfHZyV02zvnWZSaAJrP9sT+LPo2K?=
 =?us-ascii?Q?sipUKCoepm5vCGi3NqJRZpAXUhE4/fZ15a134T8OJiC9w2GsWhBnPCJZdHVP?=
 =?us-ascii?Q?oxsCB/18hhNXXhlUAWbaHin5Yg5TVo1yyK8NgiMjCui6huesTTVxiv9WxOMc?=
 =?us-ascii?Q?M3ZsJtKvcTuy/RyGOXLcHq4GHZmjzq/8ei9lZi1Ju2tPhGgI57SErJnZgsOn?=
 =?us-ascii?Q?IvmMPOm82ZF7XCPzywAYs7Yhs85IVbPoZbJ/VrBquRITNGczWjMjwuqwEvAc?=
 =?us-ascii?Q?vzldAFnh3K+tVoag+8k3z2d0vZlnVSo1V/pnfUSp2hAUj/q+no8Ubw4+mNJU?=
 =?us-ascii?Q?uAcuh3DyS6Tzym4ONZgjEIsoTspLqcTOF70x4EnFLIsntgZ4TWLLQTlVl7si?=
 =?us-ascii?Q?j6jyMI9e3noM6tTxp3wr/7AmYJVRAxLpZvI+9wyWb9TSENc9wi1U6EZg/tsT?=
 =?us-ascii?Q?x/4HlLXLuFmaDz5a/jBLpKaoWu5G+0BZNLxodOi20EdT9vwTa7qANN1kBtVh?=
 =?us-ascii?Q?lYFdF4ggFtmgoeU8Or0ZuizHF05QSWf6mp74QA8En/8B4QN20zJCqmxWodhr?=
 =?us-ascii?Q?7vysFJ8MH00KUm1l2/jB6Ob1CGpnaR/isc++L611OlnOQWe8gdbFcUJVsZmb?=
 =?us-ascii?Q?MtXI0slglWtWvjOe1P+ZVsZ6PkDviQbmziM9hjsyMfiZ4oknomQT+XMLUG9I?=
 =?us-ascii?Q?0EWWzk32RZoWeOlMlA6o+NnipgD5WvESaFYQC8OPz6LVHuWdSC4P2etOdU9r?=
 =?us-ascii?Q?mDQX77y2ihe9nqktw/izV6nMTxMyOYuwNWXn/2TLH7cfFSaY80LWab/r8RjW?=
 =?us-ascii?Q?C/nmEibwjBS/XSMD17BM/F31olDCz7FwvUfyeAOKwiQb1QEdN4a/Bh4HF/FT?=
 =?us-ascii?Q?NgR/NDCIjKi1U8M1ZpU6zLNJoPgsKheJqJOH/sVDqIBHd3FsQKwWwKiwyWE6?=
 =?us-ascii?Q?GhDtc2+BjH0nLniyPmY972Yu76zht0Vt50jBh9uP4DbMO/VrsHmfFRNDLyet?=
 =?us-ascii?Q?Ed3efC3lvDg7b/yxBOso2lSU2psJO51SUIo3juOVDVVbE0+K4jP41EwLlGu9?=
 =?us-ascii?Q?5v8GuitHhGMYHhh1wYSaIj8Vvyt1ZQRmZhPcsijq6DTPOoTSGU1MShiR0Isi?=
 =?us-ascii?Q?VOfvClLXiSYri9xXEHXJgb08AQ4H1ir2TxkA0DaxyDuF/vQmVlpf4Eelrgu+?=
 =?us-ascii?Q?P4yK3mgNI7W6ufq/31/pAYpfmgSXK5/oB9hzKESzAxrBFhCE1uUHAJWnwNDB?=
 =?us-ascii?Q?jWg4LkXWBCkdnKMI3OhI5JB9/bTBcvUZj0cay+xq3EHetMsaPA1ybYE4pDYz?=
 =?us-ascii?Q?+PmyudvqFwqQK1mhzuiO2qr6HQyAQ/WwE2iW5GNwz2TkGX90Xm57QH3f/amp?=
 =?us-ascii?Q?e6caz43bZKIHkHZfyfaGjkuys1oaonQi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS9PR01MB13950.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YOEl0K8OlI94iSTklz13w1WhI9ZpCUigIMSBH9dh0IsOSmBgelJ4r1gyG7gB?=
 =?us-ascii?Q?ATKCBh/C3wDq4n4j8Rf5fcCsetp7K5wC7UvlNlqmgE3BdMAxO9Ew7gn+OfYl?=
 =?us-ascii?Q?tTWOQ4H3CKYMtaKfX4k4ZR2THKPiVYJ0FAxS5fMMa0uMKJ4CaX3UpGgBTbQx?=
 =?us-ascii?Q?eY7+dFLsVL+V60Wfn5L1pb3Vj2wQ2klQJsP8NToNAf4LtJkvQl9v6OUd0D70?=
 =?us-ascii?Q?b8WGF/GhEZszr1vr/NkRH0Bjp24me2ZlJ4gddpVCerwVgjYiUxyyU2Kk2NVB?=
 =?us-ascii?Q?a6CeQYXlU8zEJK1B0gv5Xm7F4AY+v3y2odIe3s6G87sgIeOPtjB4Mf98EQks?=
 =?us-ascii?Q?r6YtNIh/SafTxXmccM1jdel7jb+byXmpXFcENWxksOvWhzULP/9qnxX+/L0i?=
 =?us-ascii?Q?zjT3WxaSI92xvLShITL7iYO2JDL+jCqNpFt4tgjaiycCr7T/rUX8e0RnO7ph?=
 =?us-ascii?Q?dRE9dhwICc7tFgMoNg/zVREIWG0fWu8JYjJ9j9z9PF++bH2lKnq9lVMd7eb7?=
 =?us-ascii?Q?UDjVq0YdpNwjEeAUH1xasTlxKM3Xk13uuoJgkYQ6OPwRJurNcRF7RNw0T8zS?=
 =?us-ascii?Q?3p7lp4BtcbLiDdmx/MVQ0kK+DI7Lykza6b5uoJaOjhEuBsiyEpqwyNoSfu0d?=
 =?us-ascii?Q?jf7YOwYszcPml/Z689l7iIOoILVeujDgPHULJiZLYbzxa6x2LEVWJonvobGC?=
 =?us-ascii?Q?m4LgF/aULbFehRIpdNihtDja4+vx24Lr9AESy4lR6ozvGlWfz+vWNl1Xjx5N?=
 =?us-ascii?Q?fwc8V9dcdOPki8CYvBagAtrDwCIgy58GzFUqmaro6tLHZLcBGhEPryJ5jdHW?=
 =?us-ascii?Q?2pA6uhfClFC75tmcaK454Yh6a+RNEiWLM5s8PVa+hJ6ol7tcqIj4Fx8LCwiD?=
 =?us-ascii?Q?6FnDeNS07j+vlJQYTC9tp05iINM43zltCxPWTBM1Mk5zvd7BJt/U9IAHHMnm?=
 =?us-ascii?Q?+YzS5LNBcWIniJR78jnVWueOsLr6Tpq56M8PZ1c4OXcXGo+01QO8bAezjGB4?=
 =?us-ascii?Q?yyILQPr0/BGZOMXWnegszFymSeNVol222X10vCL1ikDYDBgISZ3I3kuw4UZA?=
 =?us-ascii?Q?0byKr77Or97bseJ5ngYfmnCUJ+9JiDjBckw+nVxX4RmSqAr2GJ1B4mGa0Odo?=
 =?us-ascii?Q?/QHfCZllJ8EK5yX3M4LkAREtH9aDBd2zXLGZXlOrcnjZnmveUdxq08zyPQIV?=
 =?us-ascii?Q?Sm+vBrG/m/ygqO9/s/a0PimLZ6UrgZAq+feRWLmPwFaCwawv/PAH89BkidRg?=
 =?us-ascii?Q?2DP6XrgFCtIMnILcxAj7eo10lo5zXbIVp8sItmD3EUhdh111HNGMTXRCSFdE?=
 =?us-ascii?Q?2wdcPsj/SSeaWWwN5en13hElIGfQLyBusp9hqWFWCf8TqsPncFJ8AnGCylOs?=
 =?us-ascii?Q?+3FCJan7wb2qa6A4x3OY47FbrtwWt6jr4LTXnZRN+hToeRvxiBTwo+0/gQ43?=
 =?us-ascii?Q?wgiOPSIXHLKqEKS/W7NFz678FB9JDtI5v7MylJhE+Z2Tk+spOEL5MXdKZllK?=
 =?us-ascii?Q?nzYtBGaRk01gFmqscCzZQVTKKJZ52YqS126zzV7FHVF/a/CzhR/clTU53sDK?=
 =?us-ascii?Q?YDXLTcrvrnym/Nl1+aCc6LmfQLYc99QXgJSDwSnpWJ4RKnnAnQZXoPCZjran?=
 =?us-ascii?Q?JQBhsYEUlBQfCiq8Axyx5QY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e04e8ff9-fe0e-4b7d-0d20-08dd73853ca9
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 14:30:24.5236 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YStW9BIjTukAO8uxei3+BRUjIjcx1ydOOY09KrNC2Om7QGqN2IiP0sQECoe7YC657hQAEj6MNMmU40ETsUfe6Zohk+J3KqFKbUkXjmAdaXnBzlqDo31uBQ2kmgwJR/g/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9691
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

Hi Biju,

Thank you for the patch.

On Fri, Apr 04, 2025 at 02:30:45PM +0100, Biju Das wrote:
> Add support for zpos, alpha and blend properties to RZ/G2L DU
> driver as the IP supports all these properties.
> 
> It is tested by the below modetest commands:
> 
> modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
> 37@42:512x300+200+200@XR15
> 
> modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
> modetest -M rzg2l-du -w {32,37}:zpos:{0,1}

Tested on RZ/G3E SoC DU using:

modetest -M rzg2l-du -s 55@53:1920x1080@AR24 -d -P 47@53:512x300+200+200@XR15

modetest -M rzg2l-du -w 47:alpha:0
modetest -M rzg2l-du -w 47:alpha:65535

modetest -M rzg2l-du -w 47:zpos:0
modetest -M rzg2l-du -w 47:zpos:1


Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> index 8643ff2eec46..040d4e4aff00 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>  
>  		drm_plane_helper_add(&plane->plane,
>  				     &rzg2l_du_vsp_plane_helper_funcs);
> +
> +		drm_plane_create_alpha_property(&plane->plane);
> +		drm_plane_create_zpos_property(&plane->plane, i, 0,
> +					       num_planes - 1);
> +
> +		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));
>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 
> 

Thanks & Regards,
Tommaso
