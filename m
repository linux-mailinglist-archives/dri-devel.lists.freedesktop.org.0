Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4E84717C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 14:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8675C10E7A9;
	Fri,  2 Feb 2024 13:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UKnf5iC7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87C8610E069
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 13:54:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mU+ab20VO3Ym3+h/CU5Cgf1idZyWxPh4D2KbsezQg4tiTSuyAqYlp379J4J4t3EAHLn2sDO/QVlmOcADp63McpjkexujvOLErwA9QC1ouNmY6uGqP4wcN4Cd+dmGnT35QmF8LQzdWQAzQl6/eZn4xayq/4mtMpivzKSLGAXqIrIOJFbR8S30p86+9GN3BYjZoUJeQqawhYx4hiEaU794iNRWTfQSup3rgMDvhZOEufvAp5pGIfUrJYCW6wiKNAIeHcE1lZV6cZdo0FTDEK1KUYv/bEqPiHJOSkI2f/OUow85jozAiTxOVFQZg66B8qaM85Hr/N8c3oPPEP13IkGRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I+5xnfUXYiVibF+dHpsqNBmlECAVOmtDbgCjAWAAaQ=;
 b=ZzMCJr8ZBjRB1SxZARZ43MHusyU2wIROrFcun9XwWDjoIcZFY9guTGF9Bo5xL1kfjQRci1Bb0MMwNKEuc+UAlNDvyYVsrD+yimfsv1kMVWf0cMffhoMQlBBjIG58xbsZkg8y9WupJ7d2NuHN4TKj0KVM0W6hsmW1BekWN7RiWnx/lXoCLl6AHylycx30N1ipMOhzK865fm9jYm5vcpfFnMGj2ni4m363Ie8A7eRNOfe0ssdSSsGt0GE0YEHq+6tnpYWUgjOxdJTvAAmhGHbcpupvq76CArCWiJ3PyVQHPV9LhAFlC5UjOm658arSp0cBLCKHTwNIQxPlrHsQwc39sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I+5xnfUXYiVibF+dHpsqNBmlECAVOmtDbgCjAWAAaQ=;
 b=UKnf5iC7k25QebM8CP1mO8BN7zPql+q+Px0YPxfRMBu/MUCON3bol9jcqnfXB7BNbco+V8q/ktLrHhTjNW92VbPjIzrQODbGAqT2/rAgKlvvIk2/bX7xsKhI/yI1JjQxe7KltDSaF2s27s1yy6o3Jyvl0Y7P+bB4fz1kWhutAWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com (2603:10a6:209:4a::22)
 by PA4PR04MB7918.eurprd04.prod.outlook.com (2603:10a6:102:c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Fri, 2 Feb
 2024 13:54:52 +0000
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::6598:2fde:a297:aaee]) by AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::6598:2fde:a297:aaee%7]) with mapi id 15.20.7249.023; Fri, 2 Feb 2024
 13:54:52 +0000
Date: Fri, 2 Feb 2024 15:54:48 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/2] drm/imx/dcss: implement region request and devres
Message-ID: <20240202135448.5gidibw5lyxt6d6d@fsr-ub1664-121.ea.freescale.net>
References: <20240124111904.18261-2-pstanner@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240124111904.18261-2-pstanner@redhat.com>
X-ClientProxiedBy: AM8P189CA0013.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:218::18) To AM6PR04MB5333.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5333:EE_|PA4PR04MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: 74bc1fac-6eb4-42ef-a992-08dc23f68751
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KcyPaOaS1kmrXZVBRPa4/WZsT0wiDgt5GCGjbeNsSSFubPHxsTW4ikUAPqc0oELSOM4xXBu0FjKcYjvsFAADCTh0EjT8CF5u3dwK+01j7t7DQW2COd4tz/2epeLPN65yZIUL4zlQnJaYpHZN4t7nn5QlkPxAtuJG7ooYyJCIUpwpEobwOfIyeU1QdkSrR+ahZ3LlZgvhheAQ+/KkM+lWhtSDZUUSSI+mVi2gkOLUd/dodBx+M8EaYq8V+DLy29/CwvvpuKzzlyBS4PxisI2CUko8bl2ydfRGGmjfp78rARGFDu1dE7WnAbSrwWdbmg1g1a43sY/vRchUxXmf5hOJOpKYCKaGrpGDb5rW04K2YRoVmSnHBX2Dh17sGriHnjR2DtnG6DUmxGgpSqpaLQ4h8TN1uaSbb1CRn3XkCS3sTgEKUhj8Jl3mScfRnngjQzYqKnPm/9wGPcIhnDk+q6xRvl7DbwOTP0t1mXvlEDDnGkNtxK1vEtuJaMGsKmA1WUVeCdUDVkvnTApVKcvSw2czfnj2tHpeapM7No4DIW9YJm4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5333.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(1076003)(83380400001)(26005)(41300700001)(478600001)(6486002)(966005)(6506007)(6666004)(8676002)(4326008)(6512007)(8936002)(66556008)(6916009)(316002)(66476007)(66946007)(44832011)(54906003)(9686003)(2906002)(38100700002)(7416002)(5660300002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?er/pq+wUDzGrN+TAxVDjRvTfA+8ld15O6wH2/+biEvmEp5VAvW2LXRPviDSZ?=
 =?us-ascii?Q?nVisNBNM67COx4wQEu0Sh+eMHZfPbnJaNoNCV41+MzH770CPJ00My21Wq3/L?=
 =?us-ascii?Q?HR8BblLceDIi0OJCrtBTU01aIU8IcbO1rjpue9r9PSd65L+ewjVls+ddj27L?=
 =?us-ascii?Q?eAWxda/FekX9qpgXqUakapJSBvkEAdImMTLsQwh3c8TXfT4/trZTISz1Q0ZC?=
 =?us-ascii?Q?RdjdUk98gqPJ44CMSul8t0WdDfYOKdZFUqTvh8pNwTt0mYb1tE0q5Mzs51tP?=
 =?us-ascii?Q?VX14aJ4SW7XoFP4qRyvqinaPZQRJyrTB0JCzNgcdSC1+YAzBwSzAenJJClTi?=
 =?us-ascii?Q?Y2My+USbmM03CdvTp2tP53t4jl6b9yZPJeelUjETuskqkPRSyd5ji504xNoh?=
 =?us-ascii?Q?eRctDPC/om3Egic5qF4BuBi8tmKX/pVebmY8wFg+05Nm4XaC5vkMDmQWtHdq?=
 =?us-ascii?Q?ritzK2xcNT6Y5jIPIeXmt4zX/uffDx2McOcwfSeoGLST6G1rhLvAMmvzlEMF?=
 =?us-ascii?Q?F/DKzX0e3w8Wi3QIeY7V/QeXLZ+ERkhF0dx32FZPFY/F+l7TaFbYFstSjeSV?=
 =?us-ascii?Q?hkgOtAk5JWQ/4n3arhKGgDyvDufIMc1VQJ5px78tqgjcGsFoC9sMsWohOhSR?=
 =?us-ascii?Q?oEY8xbXvx1Ar98o6I3H/2c7ZjCsuTwcoCvEn/EIe9U/nG6cdGLLWINpsg1tN?=
 =?us-ascii?Q?ESIu7fZZQDGstsbrAFoGWJPVfxVN+8NULfn1PZncAuF2wmuomC187oe5d5t5?=
 =?us-ascii?Q?jNx6ycLMDUwsjxTVmMO4j62gwsh4K2ogIrRYRysXrj8xp63iA0AiO1UFaXHi?=
 =?us-ascii?Q?oF1ntcdQkFgNHOTXTFRG/OFE5BeX29tDJ9hPGFKjKcBgCiTUr6aOT2fNnzXH?=
 =?us-ascii?Q?OLO6cbudFnWp2NGjuJ1XojfzdFSQeWy2ejp8w3rk7VRgNUFOajZBzMT3VQr5?=
 =?us-ascii?Q?TuuEA/gGAFFceDklvEP/UMFLjTqDVNDUSFHq+fSb0VO86knVUp0Lzz0HoY+k?=
 =?us-ascii?Q?PB8JCINT3s4auHJugLAzVrDamYNeONu0lvNlVklXHb8OtGYPYCUG/hyZ8nj1?=
 =?us-ascii?Q?CL18PYyRdDtkE6NYx6AAeycTXHfE1/I9FvW90Pi1fBhyC7Hi8o2BzGX/+/DH?=
 =?us-ascii?Q?5ZWCMXKIAQXC7fZQ4pBM6nv0mvxSpTGLeOUtfPR50A28iQA9vvTHQVsDOsZT?=
 =?us-ascii?Q?HHHZfQKs/enZHgGpT7uIpAaJ4sPLJ8VKIz5oWfB6DTuZhffO0fxE+DLhrlZZ?=
 =?us-ascii?Q?n2kI2vXAPl3WPj885PM5duDc9Bjn+W9HbFDGhp2de5H9KKLspGbDdl3hsfgm?=
 =?us-ascii?Q?txER0/6kaRWMEow3skcpm9Xxp2CahB4S1/pI85Wh6A1WOee5iB2dlTWN0arQ?=
 =?us-ascii?Q?Fyqg7bRJYp/wJnGI/AewRdMhE93mIfAzJNcxYMPW/f5qdvRyuhGpXQjl+xQc?=
 =?us-ascii?Q?0Gt3y9t/UBi9Ed1tYUjKiOMehilL82P0sgy3rC91YPe+ED9+Qd9EW/T7UuWW?=
 =?us-ascii?Q?KeRwg6H6RXJTdcrxZpC5stzscnf04JUWf7P0HsTX0jdj+uOUL/5KBJCQK929?=
 =?us-ascii?Q?5nP8q/7waEZxkubkALNQoZbljle1quzcH38YnY4/96pfdpUj18q4kAd3JeJL?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74bc1fac-6eb4-42ef-a992-08dc23f68751
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 13:54:52.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RA2ET7dnaxeYeBYBisRY5UT/CJF5EoxBXIoJ+Tjjm/bcz2ogEhDRuLkvy6FoynTELi4ciG7vmX00Gj/HstupOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7918
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

Hi Philipp,

Applied series to drm-misc-next.

Thanks,
Laurentiu

On Wed, Jan 24, 2024 at 12:19:03PM +0100, Philipp Stanner wrote:
> @Laurentiu:
> Thank you very much for the review. I was indeed on an older branch. As
> Linus's master is currently broken for ARM64 [1], unfortunately, I built
> it instead against:
> 60096f0a77600ac2cc92b82fee279d1905576950
> 
> Hope that's fine.
> 
> 
> Changes in v4:
> - Add Laurentiu's Reviewed-by to patch #1
> - Remove unnecsseray struct device pointers from all touched files
> - Rebase against newer kernel due to changes in dcss_drv_platform_remove()
> 
> Changes in v3:
> - Fix build errors (missing variable, forgotten remove to call of deleted
>   function)
> 
> Changes in v2:
> - Add the region-request to this patch-series. That was previously a
>   separate patch.
> 
> dcss currently does not request its memory resource. This series adds
> that request with devres. As we're at it, it also ports all the ioremaps
> and associated allocations to devres.
> 
> I can build this, but I don't have the hardware available to test it. So
> you might want to have a closer look.
> 
> P.
> 
> [1] https://lore.kernel.org/lkml/45ad1d0f-a10f-483e-848a-76a30252edbe@paulmck-laptop/
> 
> 
> Philipp Stanner (2):
>   drm/imx/dcss: request memory region
>   drm/imx/dcss: have all init functions use devres
> 
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 13 ++-----------
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 14 +++-----------
>  drivers/gpu/drm/imx/dcss/dcss-dev.c    | 19 +++++++++----------
>  drivers/gpu/drm/imx/dcss/dcss-dev.h    |  1 -
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 21 +++------------------
>  drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 26 +++++---------------------
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 21 +++------------------
>  drivers/gpu/drm/imx/dcss/dcss-ss.c     | 12 +++---------
>  9 files changed, 31 insertions(+), 108 deletions(-)
> 
> -- 
> 2.43.0
> 
