Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEFBA7E525
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 17:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A570D10E4F7;
	Mon,  7 Apr 2025 15:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J2cDoi+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2F110E501
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744040982; x=1775576982;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 in-reply-to:mime-version;
 bh=ZGAQDiIkzkcIzXMvxCla26RufbXG24OWc0pEuBrJI94=;
 b=J2cDoi+ZnsTMXHOCQsDUn/LMfDib1/5N/EjIfRzsS5DKnu++SmNM9oFo
 xQpd+dlAyKX9FSGVRiKzldiKry+W0gWrZ4hSceU6ab2M7QaD4Sm/eKJwO
 p9KudobUWS5WtSJSOAGPKeL2oZnhkFZeMprwpTRMAoL8kpb4ODxtlQuDl
 ftP151DMyXDh+1tJlcdFPQDYutb+2YHHYUx0geyMWGZRucvfbqH4jRCWa
 /4yQTbr/yFvMFyftmQwJ9fuBDJfvWVl5G461+ACXVSvDZRsw+czgrSUW3
 zFSfuYSY/1RDmcPObhrjBdGGaP/wh5xr9ysXVeoGjRYHWY7NkjE1EHanP A==;
X-CSE-ConnectionGUID: 8V/mHWjoTae6yBXfsWmdfA==
X-CSE-MsgGUID: baGkLB8SQ+2mSwmbWaY7Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45555041"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="45555041"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 08:49:41 -0700
X-CSE-ConnectionGUID: 9UN9bt0hTMqXtISPD5GQcA==
X-CSE-MsgGUID: 5+K5ep0ISHSV8pXWgWJXLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; d="scan'208";a="158986656"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 08:49:41 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 7 Apr 2025 08:49:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 7 Apr 2025 08:49:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 08:49:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxH1TGVEXrJpCb3038gPno1CUiovX8ieA/uE7FeGVG6nKXA8hrkEqW0o33awxEu0TiWByRWPyRaUFPR/IWP+wwrkbMxgDKGqjV8+f0as6/oZ2SYNvgMBctwjajFl1j1GREAeptl1LtjqsiGiSq4nXWc/WdmBN8zvziMAlHvMUxkne09cjefuFArbdms16eWHp+H5m6WXdqd1qjVqcgb9JAcIxkaS8defXEb4QWRlbRMSHn54kdXY4sNWt6tfrm5OuwuyExUvgbJpnA7TD9T0SQyqYij4/8tSqvDYprUSuEN9qqe2ddTyd3kSHA6gi36Nr7vku0qkW1pO7i84+LBDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RtniXnvYfXVWDXNI6FJSH8pcbIpDH0jFa8HXvTxak1U=;
 b=HSn4HUB7agnDRyGOB11lOpEr7Gt4Wue6ZYA4YN15Aiczd4+gVTcst2wrZ9GN3IupjXOw7PASd7ujPONYgW7ucQQKqpHXpvVrZAncTnIPQEbeVsOdhMK7fFLtebtTlGgdaQFA/I7gO1nNPumhF8xHujydQOIZysRUBI5oGJNwNH9YtdnusNM8jmdAsh0G6IK015GEhCT8PprLH5oERrB4WASUcTxfmPm1TyzFhR0a9CJ1ubumXWC9llnRqwTs8Q+DuOlSw1wad9S2OH4I4IdwwSOY6hwxTkgHhZiDAMPuHGRPgDo8soVYqufQxEWu1bKaA4Y44BLWgfvmTtjJtEs4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by CY5PR11MB6461.namprd11.prod.outlook.com (2603:10b6:930:33::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Mon, 7 Apr
 2025 15:49:23 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%6]) with mapi id 15.20.8606.033; Mon, 7 Apr 2025
 15:49:23 +0000
Date: Mon, 7 Apr 2025 18:49:23 +0300
From: Imre Deak <imre.deak@intel.com>
To: Anusha Srivatsa <asrivats@redhat.com>
CC: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Joel Selvaraj <jo@jsfamily.in>, Douglas Anderson <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/10] panel/auo-a030jtn01: Use refcounted allocation in
 place of devm_kzalloc()
Message-ID: <Z_P0A9lxWD0aAdjp@ideak-desk.fi.intel.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
 <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-4-cdd7615e1f93@redhat.com>
X-ClientProxiedBy: DB7PR05CA0026.eurprd05.prod.outlook.com
 (2603:10a6:10:36::39) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|CY5PR11MB6461:EE_
X-MS-Office365-Filtering-Correlation-Id: b48a826e-2425-4c5b-0b68-08dd75ebc4c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6EC9fQxXCfTStYEH73Imj/QhNendIrYsnmb/REmpOfPqNYk0WYkc4uS/NkiE?=
 =?us-ascii?Q?L2BAItXnCf+4Toi1xMFQOFOdRBckakIbCwEIx8fbPpHywPSAPlYLfos+yuhF?=
 =?us-ascii?Q?mHN2GCSoq7puAZRWxNMJyzr2AaiN81XtnhjWXn5wkvjjjRYdiXF1Y3dMEC9W?=
 =?us-ascii?Q?zmDFdHAxfAKpZQQVGjAY0+M774w34M/YUM4NLtTcGDjWcUBfskivDtPbDrCl?=
 =?us-ascii?Q?34AqWz465rFdWZKg4h4mtlGeDe6JsMRzjksfllbmiV0VQPyWLDTFJAf7Y6bz?=
 =?us-ascii?Q?RXXG7Vm75G13BUE54EdiLekdxA0h53hal9gfNU+z9vUTPULbl1J8iyF/4bAF?=
 =?us-ascii?Q?uSV7eeSSSKAn0L3CwolySYpaFaPSi3ixI6GBDui8kOzv6IdTLZXD2XvzwjsW?=
 =?us-ascii?Q?9EhQMipNaVxXKM17ey9DdPRzz9TmRL+pDnJP8QUaC+eDkqXeVNIcwFlI0QrY?=
 =?us-ascii?Q?oZpj5durmcew5FYOEbvDS3PPaqHGtPLDO59yr9Sx/y9XlQ2SCSf4n+B5FsH0?=
 =?us-ascii?Q?njLg+q3xYobgCgyHWRh7SDofxoPLPMEENcEMNWxEtPCWr6hK8wPOD3bwCcoz?=
 =?us-ascii?Q?u6gXKcsLeNcdPxl3sopADjNcSJsV/ZqEvX7upnf4Y/HfNH8QXSgHrUDiDgYp?=
 =?us-ascii?Q?JihEdKKguKiH9duxWV5wpQlDGZW3Q6jEl1bDWmOmPeIlRtZXCzCf1K4BPExR?=
 =?us-ascii?Q?XxGCAvs16JnqlyocYKh720t6BUfnaT0KHNaFf04tmpCOGBWD0jwAk1z385MB?=
 =?us-ascii?Q?3TiUNXozEsyZ6qHumqFvS4MYfyrk/M1aHTq+M9NecYatV5YxAJVUh4/PDN7o?=
 =?us-ascii?Q?9In16qmJilJg7djoy911OVima1PRal6k/nuFvWi3lb+1mTkYKBjv/YQ3FH8q?=
 =?us-ascii?Q?scSbBFTjDv+IL8DXHA1r4u93CT/kax+LS691oANOM1McvDHHI7PznIMs9vFw?=
 =?us-ascii?Q?1O4dqKdO4bSI+FIwvhlFmdflKnty4bfqy3YT0I85g+4GxWUr6HGzc6voi82v?=
 =?us-ascii?Q?cU5fbl2FUUviRY6jqHaU3kvnWoXmgXq6c7jkV6EWhXFLgzlXQI8JSu1aMDNP?=
 =?us-ascii?Q?l1cVNZ+OC2BhOx0T/MLnfRxHX92dqnIAGh/TAuGwgz8THIYJPVLRtRpflWiX?=
 =?us-ascii?Q?dfciYFxgvdyhbQartWZ2UCJ4t3314ytg0Odutcl5qaec/ny6rKfdWEUctoV9?=
 =?us-ascii?Q?Qq0SBgg4jU7ri2zCxeWg5RL/0l4t0nO7O+Pf3D/Afn27QO82bQrDtAx7Eo6p?=
 =?us-ascii?Q?TA9xUZKNzaSn8vHT4oMfAEkEJWrBh1PZB4ywXKcOWVnu6c9iibLwlSlSksnR?=
 =?us-ascii?Q?W12mUc7oyHzS9/rTTD5sMvBfELFEE7UfRhAgCJo+8WhkeF4Np37J0vGp+khW?=
 =?us-ascii?Q?YK3Evni9Bz8pIPXgNlZBeV+2Clck?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b1Jl3g8Kz1jDQnaPpDC33P1x2glQqdFCMAx6GVVPtgWkFWuQG36k6ep3Zo7r?=
 =?us-ascii?Q?bDRpwcynQ5ADZv+pCoFr/+EQ60SU39XwUnEbWUAiPJFau5eMD+GNJFyenFsm?=
 =?us-ascii?Q?W6ItuAs/7x9RVRAPPA4V7TR7VsV+ftE6qPPcqvlFAfpI3XA2pAkQEoApW5mT?=
 =?us-ascii?Q?s6DGbo0LvIq42dHkyiGzvXIhPm6hwCVco7KiCGyMjb9hrTlOws2PFubRngPw?=
 =?us-ascii?Q?Es8QIMPw08U7R9/2tF7yxxKhoazGgcn78xAvSJ2F2qbJOS9sH5oLmnFcAKWd?=
 =?us-ascii?Q?AGaxZscJiO/UjEyKD8YG2O08Rd+aMREPLdbu8emDIbMLwqUCjH5gE78021Gq?=
 =?us-ascii?Q?bfCFjm4DADdmKJTuUieWN4KQ5HhghpZSQgJtCfL88tbePju4A9J0vyKs5Ijx?=
 =?us-ascii?Q?IPYVvYu5RzyP3MKMMgdUQ4yI4Q1AQCPh5iiEibgJPd0vf4N+luh19xwfQZ/R?=
 =?us-ascii?Q?a+163OmJd7Vgas74ZiCCRD6Trpu7n2C4omcNPxcaD6tiRJo82vQs6cVLLQJe?=
 =?us-ascii?Q?jPR7xAq+0dpsYwE3lVFd748AeyktcHB14cqx0lFNETAK8SX+dOCzm0zHf59Y?=
 =?us-ascii?Q?u9PruY9P4BhNEQHi/icqaXouf0smzLqX1uHIhwoyajvCM7rROk6tZnCQ5hDw?=
 =?us-ascii?Q?mxnATZVnLiWq7QsYa9bEUwmtAc1fsMa4vQcRHKbaexaHxIwboUYzRq4MO8JF?=
 =?us-ascii?Q?Wh1prN8b+Hfr069cd0FITnYoG7TFotg9pr+orl9Y+JqsRcFJmbhj2hKAMy0I?=
 =?us-ascii?Q?PZOWTBolDRXaAZt5HKpjVmYTr6UQxUU32Mos7AL9DncDib2iz07AE2YVi42v?=
 =?us-ascii?Q?tusOpJ91SoL943WBDvdU7kdENBCp/KBrgqF6eW+xzjqpSZUBG8bybOwphded?=
 =?us-ascii?Q?CvXAwmM0Lt4mO7VJxv3h038ihLh91Gr2x3OFQtZLg7GKP5ptB/UAXBNJ+Wdn?=
 =?us-ascii?Q?1zD2h942V6gmOyoB73UXGFnG+9np9swNjnQfNgeHADut+2yyGAV9sXSNcPHa?=
 =?us-ascii?Q?i8ooOMAEtNcpXkQ2LXyvsz60aadbXJqN2yKU17I8QNjAy/8MPn1mz8JdcPgI?=
 =?us-ascii?Q?jZQyQWUDhm0i7bGe4oBS5L+uojc2ed5rc/Gp1oEpZ2IdilFoDM8YbgVJ2ajf?=
 =?us-ascii?Q?xXAGaeekmwcjwfw6qg2LGhmE8HIEO7HmA2bRFh2aYf2kUMcNjmBkdn3bBphB?=
 =?us-ascii?Q?HrFiHtsh9LkE85F3YgN76Qtism+jvpz/xDbDWlZdvR1guWp7nuSzp3Jx/fCc?=
 =?us-ascii?Q?3SUGIBF26NWSMNnoa+4I+k72m8O0Fvhqh3dSqn/7YKu+p54+QfS8nVIdKQLs?=
 =?us-ascii?Q?CWS8jP5wSCOsN5/AVKVvFpCImNH1WSCWk5V/ExnNukNuFaF/nJQWnO8DQUyW?=
 =?us-ascii?Q?m9jc+UfjE92XIpimTzqgXflqz6JKVyDnegng//YB7gPWSaosCvuuV+4Z2SMg?=
 =?us-ascii?Q?hCDLf95jsPT076JX+5VQ71934VQbt3rgQNMz3QNnSy9L91rbv5eX0efwVhK0?=
 =?us-ascii?Q?IashFpop9T2E0DE/+BoWXWy7vSBKsXZz3EbSbx8wHGKM3jI8np+HcWU56jwZ?=
 =?us-ascii?Q?yK8JLlrOPvHfg6LainyVCVaHW3SiHd+RCgYRcgMF?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b48a826e-2425-4c5b-0b68-08dd75ebc4c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 15:49:23.7285 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dzGNOujIZXTmnmpjpIgHkiXV0L1I5IWUHf93F3JppKcbVoSda2kV+7X/PokU75qY65Bw9I94cv6NoNqyRdkxdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6461
X-OriginatorOrg: intel.com
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Apr 01, 2025 at 12:03:47PM -0400, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/panel/panel-auo-a030jtn01.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> index 77604d6a4e72c915c40575be0e47810c90b4ed71..83529b1c2bac2e29f41efaf4028950214b056a95 100644
> --- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> +++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
> @@ -200,9 +200,10 @@ static int a030jtn01_probe(struct spi_device *spi)
>  
>  	spi->mode |= SPI_MODE_3 | SPI_3WIRE;
>  
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> +	panel = devm_drm_panel_alloc(dev, struct a030jtn01, panel,
> +				     &a030jtn01_funcs, DRM_MODE_CONNECTOR_DPI);

This doesn't compile and (yet) it's pushed already to drm-tip. AFAIU
it's supposed to be
	priv = devm_drm_panel_alloc(...);

> +	if (IS_ERR(panel))
> +		return PTR_ERR(panel);
>  
>  	priv->spi = spi;
>  	spi_set_drvdata(spi, priv);
> @@ -223,9 +224,6 @@ static int a030jtn01_probe(struct spi_device *spi)
>  	if (IS_ERR(priv->reset_gpio))
>  		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio), "Failed to get reset GPIO");
>  
> -	drm_panel_init(&priv->panel, dev, &a030jtn01_funcs,
> -		       DRM_MODE_CONNECTOR_DPI);
> -
>  	err = drm_panel_of_backlight(&priv->panel);
>  	if (err)
>  		return err;
> 
> -- 
> 2.48.1
> 
