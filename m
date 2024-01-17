Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E0E830550
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 13:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB65010E677;
	Wed, 17 Jan 2024 12:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2077.outbound.protection.outlook.com [40.107.8.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2C210E677
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 12:31:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcZ5k++4gN2YAKtdm8ggzLBZBqRe4lTX5LPTuVpi00jg49w6+nkeLvriQtvZKneq4byaD/jVXNremUxv0LCJQkeYJiOgo1iDE19IX35saYTwykHOxO/vW7aDcZHHODLgg9nmd/Zhv8Cubr2BMiw/Bl0W7vlChK4IepipD5p2dxDQvC6N5jRnahQcUfIs5xBwa78DHnUjdL04+GU41erNeHe8ukZoKUGsAMaaIUJeJzChGPIMq+83oja77WhEmF2KweiPLAVjMQTYYe/pPLaLfkeFEk77Y1JsQE+1Dyy6FcmX4qtaTv9MtIKbipt9o6iH2n7sserLGBEfAZ0kyOCGPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37CJF9XG2sbshoLH8ZZsuUxeOFjJdczw9aBHmQLosjQ=;
 b=Xz5H1pGOs4GSbyBPHhtDX3CUnBYeQ1zSh/Aufeh989QeEJ/Qf8eCplF/0wG1bDgFHBmpqs1ylUvKVEjCkp6IeLz/+w7NwwmCQNDDlLImp5tmtETdO3aF/EKEcFPTvgLmZ0HXUlZc8OqJTgNKnK4fHG4LLYvOn/LfsoTrarM8IxEe4gokVlAFRGbhHbqhZCbXGtUUbbLUUkTTwHTFc/uP1fHYxy7VGM7l9lTvbOMpAq4PwZhuFiPkXjkQdSMOtKrBHOWnf2IC3v8AGr6sHJHv8rnjs4gK1aHADjHiJ1LMZfYarF7b9RXgb8D9fOVJxLTjXGzYvTPRuYI/v1k8B0DViQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37CJF9XG2sbshoLH8ZZsuUxeOFjJdczw9aBHmQLosjQ=;
 b=NHAKPmKz/hkc+fMPnTLlt5fVhIs625zRfWLbZpUr5zzCeUYFbpTh3Qflk5QTS29gLeJz4AFKEbnp3MwULFFKHZTc/lxwS7En9WcZdlMzsedEM9YpXNbUvue5hrc0EwWW0ASvr1MBmCC/x8gKsiVrPet+Ock2oZXK1uEFQpWJJUI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com (2603:10a6:209:4a::22)
 by AS5PR04MB9729.eurprd04.prod.outlook.com (2603:10a6:20b:650::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.28; Wed, 17 Jan
 2024 12:31:33 +0000
Received: from AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::4758:835a:b14a:ce80]) by AM6PR04MB5333.eurprd04.prod.outlook.com
 ([fe80::4758:835a:b14a:ce80%5]) with mapi id 15.20.7181.022; Wed, 17 Jan 2024
 12:31:33 +0000
Date: Wed, 17 Jan 2024 14:31:29 +0200
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Philipp Stanner <pstanner@redhat.com>
Subject: Re: [PATCH v3 2/2] drm/imx/dcss: have all init functions use devres
Message-ID: <20240117123129.nympgjpx7645eua5@fsr-ub1664-121.ea.freescale.net>
References: <20240111101346.15193-2-pstanner@redhat.com>
 <20240111101346.15193-4-pstanner@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240111101346.15193-4-pstanner@redhat.com>
X-ClientProxiedBy: AM0PR04CA0015.eurprd04.prod.outlook.com
 (2603:10a6:208:122::28) To AM6PR04MB5333.eurprd04.prod.outlook.com
 (2603:10a6:209:4a::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5333:EE_|AS5PR04MB9729:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a084bb8-8f0a-447a-7cbb-08dc17583d0b
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkJn6d95qTwXZxRU6YtU3RQ9RGtDJ94KppTPg2zYYEbMmeP01//S8xM5yJFFDlNdMX9eTu3lwApvy/ciPdAghi2fl1DuXnlZyXptgiyJWZB6de0TRVv6RtMaKQO5y2Zjpb6NvUNNuSwweWJr3jNyx8Ce4WKZh2gWL4hTDpWlAk3AsloziA83Nb3bW5T343UT4J4TBJFoYP3eXtZ6JGa/EjyqmYZangds4t1/528B2XGXEmmIaKIcwdeF0zmV8L52lx97vNxAt3HuV1ZDjXG2b6W4bdLD8j9nek+CyjGpnq43uoRX8s7MnmVghSSPii/mbxBVnwDCTOpju0n7vulovW7zu7uc6U5urUv19BRy7F7/ZgJjtnjs5ugB0+w0Xg2/JkKwrOXlvrIpGqIkkg7Novklxct1yFEpcltBGXqeQ4dGBOGMAmwGFx10wb8RJucSIlLJgSCUOjLkYPRjIcCiof5Xw5E6qPmsh37rOeOwwRQ6xLkD65eAD7FMixfQEYYBPwQZN153gEUcsrsvnau4ihQ2X2Gjql4n0Za1mBYg6HNnd1B5eimdpRGsdgJiELan
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR04MB5333.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(136003)(396003)(346002)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(86362001)(6506007)(6666004)(478600001)(6512007)(9686003)(1076003)(26005)(38100700002)(4326008)(7416002)(2906002)(41300700001)(44832011)(83380400001)(5660300002)(30864003)(8936002)(6486002)(8676002)(54906003)(66476007)(66556008)(66946007)(6916009)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1CSjCIaCmIJuW2zisYnB8JTaLtVYQ5A0V+OvOUZSKu+5wOIhMJPBTraFtrmp?=
 =?us-ascii?Q?0KYW016d++nDMz0kVtWMx3AdOtaM3ndBp2JNy1jcXJTRRDvS7iU/hlfj++7e?=
 =?us-ascii?Q?E4bA+uJmsrx1HFeJXdsuoPSxRLEtJkVNfhaUk2z85QBy03RnB2YEOg6K1uR6?=
 =?us-ascii?Q?4FeySNUbT0kntYi4ZTlk2z9V8ez4BB9Rq6kMmZe/eCimIUQCFvSuZOPqSgCY?=
 =?us-ascii?Q?au/gvc0Gz9vfeDUtRMsJiRmtf6P01dWXGB7xMumCAvdCYUvh6TRFrDj8dLjR?=
 =?us-ascii?Q?7tnoaKyr23eOUzl1mc7XSSbbXR4iCCZKvndKF1ZwioJYNiDGl6PSBpjmP0rV?=
 =?us-ascii?Q?8/ZcWOFqIo3oJERoyH4pYBF8FRF1eJzhWO+6P87mMeuUUFe+UpQf7hHtujaB?=
 =?us-ascii?Q?ASpNKPvupzL6jsEKsdaLnCAkTum5s/F0Kk16tmkTFbIvfjSkPboU+8eVTgXK?=
 =?us-ascii?Q?hBckYg9W4y0YdpkwydZh/hFRcpShCIOip0Io9uSp7OEy+eHT2QDhS97Bq8x7?=
 =?us-ascii?Q?DSb4TKAsZQEY2RooWYOFwJP9L39RMDrIIjkvycYBVzCLjh2lrH8E9JfHPdtM?=
 =?us-ascii?Q?fdbYoOAs3copMWUbcG/u3aWHYyTuApmu82tZU19TlLpK3nme+4n0SYZzgFG7?=
 =?us-ascii?Q?X51XhdobnhfYMzdOEx9vvRwBZLOWf471/upJPJuASdINt/VIc85sDEcY035w?=
 =?us-ascii?Q?H9QNWWrFCfXfYU0IthDBnANpNhAgIJhuh+KdbHFUwrLt52dpRXlJtd9m3dkm?=
 =?us-ascii?Q?roz2mf2gDFQOCTk4mT1Cd/nBGhkMqR09fCaI9ZCuB68X2SWO/ErdrvM9qq5t?=
 =?us-ascii?Q?md+5hcsV0pvMCd4M7Do+0TblDnOFyLYIxLhOSQE7D2iE5bO6ArWlC/IR4KS2?=
 =?us-ascii?Q?mK9MnHZSiffkxbzelfOFpUqy2ujRm+w50Mcox05tc7Ly9tmR7e0N/hYHG/5b?=
 =?us-ascii?Q?YcxB8QAYm0T+BHme5PO957khvAE4z8weFmK8/yQ63syjlFv3OtFihOeGyr+z?=
 =?us-ascii?Q?JfnU9B8mOXoYeT1x1wpmCiRjiFi4mj3lZAfqDu5aZq2m9EB4GPIlZh6/g4fy?=
 =?us-ascii?Q?Pus4EGGy2pOmcrMFI7aanDFaTOBmoUWiqevu87cEM/teyiqS2zGSvXwTY8lZ?=
 =?us-ascii?Q?/i3TY0bkDUN4J7jQGogEP0TVCUrVUfFa7qBIDlSi4v7a55+KnH4DUaomjkGm?=
 =?us-ascii?Q?hlfOZagLJ2dxZ9QixuDyHqWZI+SsfqBBkz1NImaQYLsD/gBCwEQ5VI6vVs3w?=
 =?us-ascii?Q?tfdYoKdZ7kxoaYkX/n+L3IatwelAaUWv6opXLMpPZgUmMiV72S+cntviXbND?=
 =?us-ascii?Q?RJ35PTQX9Fub7N6Za7nAhBtAEEwTE7LVqX/BqChm7TB60gXKPDa4LFrOuUHH?=
 =?us-ascii?Q?zOmHn/+LaiKUOz4xn77gKPxtzvINdQQuOk0Q0fzWPg6U8GKltFTqWr0Cl5f0?=
 =?us-ascii?Q?s9JJY+b1vpCMw7s6j+xecUQUI5uMuLNr9WvV2YmauVAUeiteDihbsQwvlFH7?=
 =?us-ascii?Q?iaNEb6YCudIzbzDoSwcXsCRz8xXilIaRYwkd/EoZlbBmeRYQQnuR1aPB50Ad?=
 =?us-ascii?Q?9fwoANLf41DBis6nWvcOzch0VAVn7cV6D10YilnevUYJSFhsydW3Wj57OHs+?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a084bb8-8f0a-447a-7cbb-08dc17583d0b
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5333.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 12:31:33.0313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2OzavjIYHBZqDJqTkUeQF/g8Dwj/KYuYyoa6Ghemm3UYxaKMd/QwKn955HTUSnFIX9oX/DXaKlOOAoG9w+PBvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9729
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
Cc: dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Several minor comments below.

On Thu, Jan 11, 2024 at 11:13:47AM +0100, Philipp Stanner wrote:
> dcss currently allocates and ioremaps quite a few resources in its probe
> function's call graph. Devres now provides convenient functions which
> perform the same task but do the cleanup automatically.
> 
> Port all memory allocations and ioremap() calls to the devres
> counterparts.
> 
> Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> ---
>  drivers/gpu/drm/imx/dcss/dcss-blkctl.c | 14 +++-----------
>  drivers/gpu/drm/imx/dcss/dcss-ctxld.c  | 15 ++++-----------
>  drivers/gpu/drm/imx/dcss/dcss-dev.c    | 12 ++----------
>  drivers/gpu/drm/imx/dcss/dcss-dev.h    |  1 -
>  drivers/gpu/drm/imx/dcss/dcss-dpr.c    | 25 ++++++-------------------
>  drivers/gpu/drm/imx/dcss/dcss-drv.c    | 12 +++---------
>  drivers/gpu/drm/imx/dcss/dcss-dtg.c    | 23 ++++-------------------
>  drivers/gpu/drm/imx/dcss/dcss-scaler.c | 24 +++++-------------------
>  drivers/gpu/drm/imx/dcss/dcss-ss.c     | 11 +++--------
>  9 files changed, 30 insertions(+), 107 deletions(-)
> 
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-blkctl.c b/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> index c9b54bb2692d..58e12ec65f80 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-blkctl.c
> @@ -41,15 +41,15 @@ void dcss_blkctl_cfg(struct dcss_blkctl *blkctl)
>  int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base)
>  {
>  	struct dcss_blkctl *blkctl;
> +	struct device *dev = dcss->dev;
>  
> -	blkctl = kzalloc(sizeof(*blkctl), GFP_KERNEL);
> +	blkctl = devm_kzalloc(dev, sizeof(*blkctl), GFP_KERNEL);
>  	if (!blkctl)
>  		return -ENOMEM;
>  
> -	blkctl->base_reg = ioremap(blkctl_base, SZ_4K);
> +	blkctl->base_reg = devm_ioremap(dev, blkctl_base, SZ_4K);
>  	if (!blkctl->base_reg) {
>  		dev_err(dcss->dev, "unable to remap BLK CTRL base\n");
> -		kfree(blkctl);
>  		return -ENOMEM;
>  	}
>  
> @@ -60,11 +60,3 @@ int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base)
>  
>  	return 0;
>  }
> -
> -void dcss_blkctl_exit(struct dcss_blkctl *blkctl)
> -{
> -	if (blkctl->base_reg)
> -		iounmap(blkctl->base_reg);
> -
> -	kfree(blkctl);
> -}
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> index 3a84cb3209c4..444511d0f382 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-ctxld.c
> @@ -199,10 +199,11 @@ static int dcss_ctxld_alloc_ctx(struct dcss_ctxld *ctxld)
>  
>  int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
>  {
> +	struct device *dev = dcss->dev;
>  	struct dcss_ctxld *ctxld;
>  	int ret;
>  
> -	ctxld = kzalloc(sizeof(*ctxld), GFP_KERNEL);
> +	ctxld = devm_kzalloc(dev, sizeof(*ctxld), GFP_KERNEL);
>  	if (!ctxld)
>  		return -ENOMEM;
>  
> @@ -217,7 +218,7 @@ int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
>  		goto err;
>  	}
>  
> -	ctxld->ctxld_reg = ioremap(ctxld_base, SZ_4K);
> +	ctxld->ctxld_reg = devm_ioremap(dev, ctxld_base, SZ_4K);
>  	if (!ctxld->ctxld_reg) {
>  		dev_err(dcss->dev, "ctxld: unable to remap ctxld base\n");
>  		ret = -ENOMEM;
> @@ -226,18 +227,14 @@ int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base)
>  
>  	ret = dcss_ctxld_irq_config(ctxld, to_platform_device(dcss->dev));
>  	if (ret)
> -		goto err_irq;
> +		goto err;
>  
>  	dcss_ctxld_hw_cfg(ctxld);
>  
>  	return 0;
>  
> -err_irq:
> -	iounmap(ctxld->ctxld_reg);
> -
>  err:
>  	dcss_ctxld_free_ctx(ctxld);
> -	kfree(ctxld);
>  
>  	return ret;
>  }
> @@ -246,11 +243,7 @@ void dcss_ctxld_exit(struct dcss_ctxld *ctxld)
>  {
>  	free_irq(ctxld->irq, ctxld);
>  
> -	if (ctxld->ctxld_reg)
> -		iounmap(ctxld->ctxld_reg);
> -
>  	dcss_ctxld_free_ctx(ctxld);
> -	kfree(ctxld);
>  }
>  
>  static int dcss_ctxld_enable_locked(struct dcss_ctxld *ctxld)
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.c b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> index d448bf1c205e..597e9b7bd4bf 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.c
> @@ -109,8 +109,6 @@ static int dcss_submodules_init(struct dcss_dev *dcss)
>  	dcss_ctxld_exit(dcss->ctxld);
>  
>  ctxld_err:
> -	dcss_blkctl_exit(dcss->blkctl);
> -
>  	dcss_clocks_disable(dcss);
>  
>  	return ret;
> @@ -124,7 +122,6 @@ static void dcss_submodules_stop(struct dcss_dev *dcss)
>  	dcss_ss_exit(dcss->ss);
>  	dcss_dtg_exit(dcss->dtg);
>  	dcss_ctxld_exit(dcss->ctxld);
> -	dcss_blkctl_exit(dcss->blkctl);
>  	dcss_clocks_disable(dcss);
>  }
>  
> @@ -190,7 +187,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  		return ERR_PTR(-EBUSY);
>  	}
>  
> -	dcss = kzalloc(sizeof(*dcss), GFP_KERNEL);
> +	dcss = devm_kzalloc(dev, sizeof(*dcss), GFP_KERNEL);
>  	if (!dcss)
>  		return ERR_PTR(-ENOMEM);
>  
> @@ -201,7 +198,7 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  	ret = dcss_clks_init(dcss);
>  	if (ret) {
>  		dev_err(dev, "clocks initialization failed\n");
> -		goto err;
> +		return ERR_PTR(ret);
>  	}
>  
>  	dcss->of_port = of_graph_get_port_by_id(dev->of_node, 0);
> @@ -233,9 +230,6 @@ struct dcss_dev *dcss_dev_create(struct device *dev, bool hdmi_output)
>  clks_err:
>  	dcss_clks_release(dcss);
>  
> -err:
> -	kfree(dcss);
> -
>  	return ERR_PTR(ret);
>  }
>  
> @@ -253,8 +247,6 @@ void dcss_dev_destroy(struct dcss_dev *dcss)
>  	dcss_submodules_stop(dcss);
>  
>  	dcss_clks_release(dcss);
> -
> -	kfree(dcss);
>  }
>  
>  static int dcss_dev_suspend(struct device *dev)
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dev.h b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> index f27b87c09599..b032e873d227 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dev.h
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dev.h
> @@ -104,7 +104,6 @@ extern const struct dev_pm_ops dcss_dev_pm_ops;
>  /* BLKCTL */
>  int dcss_blkctl_init(struct dcss_dev *dcss, unsigned long blkctl_base);
>  void dcss_blkctl_cfg(struct dcss_blkctl *blkctl);
> -void dcss_blkctl_exit(struct dcss_blkctl *blkctl);
>  
>  /* CTXLD */
>  int dcss_ctxld_init(struct dcss_dev *dcss, unsigned long ctxld_base);
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dpr.c b/drivers/gpu/drm/imx/dcss/dcss-dpr.c
> index df9dab949bf2..d6b2ad5e6977 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dpr.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dpr.c
> @@ -125,7 +125,8 @@ static void dcss_dpr_write(struct dcss_dpr_ch *ch, u32 val, u32 ofs)
>  	dcss_ctxld_write(dpr->ctxld, dpr->ctx_id, val, ch->base_ofs + ofs);
>  }
>  
> -static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
> +static int dcss_dpr_ch_init_all(struct device *dev, struct dcss_dpr *dpr,
> +		unsigned long dpr_base)
>  {
>  	struct dcss_dpr_ch *ch;
>  	int i;
> @@ -135,7 +136,7 @@ static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
>  
>  		ch->base_ofs = dpr_base + i * 0x1000;
>  
> -		ch->base_reg = ioremap(ch->base_ofs, SZ_4K);
> +		ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
>  		if (!ch->base_reg) {
>  			dev_err(dpr->dev, "dpr: unable to remap ch %d base\n",
>  				i);
> @@ -154,8 +155,9 @@ static int dcss_dpr_ch_init_all(struct dcss_dpr *dpr, unsigned long dpr_base)
>  int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base)
>  {
>  	struct dcss_dpr *dpr;
> +	struct device *dev = dcss->dev;
>  
> -	dpr = kzalloc(sizeof(*dpr), GFP_KERNEL);
> +	dpr = devm_kzalloc(dev, sizeof(*dpr), GFP_KERNEL);
>  	if (!dpr)
>  		return -ENOMEM;
>  
> @@ -164,18 +166,8 @@ int dcss_dpr_init(struct dcss_dev *dcss, unsigned long dpr_base)
>  	dpr->ctxld = dcss->ctxld;
>  	dpr->ctx_id = CTX_SB_HP;
>  
> -	if (dcss_dpr_ch_init_all(dpr, dpr_base)) {
> -		int i;
> -
> -		for (i = 0; i < 3; i++) {
> -			if (dpr->ch[i].base_reg)
> -				iounmap(dpr->ch[i].base_reg);
> -		}
> -
> -		kfree(dpr);
> -
> +	if (dcss_dpr_ch_init_all(dev, dpr, dpr_base))
>  		return -ENOMEM;
> -	}
>  
>  	return 0;
>  }
> @@ -189,12 +181,7 @@ void dcss_dpr_exit(struct dcss_dpr *dpr)
>  		struct dcss_dpr_ch *ch = &dpr->ch[ch_no];
>  
>  		dcss_writel(0, ch->base_reg + DCSS_DPR_SYSTEM_CTRL0);
> -
> -		if (ch->base_reg)
> -			iounmap(ch->base_reg);
>  	}
> -
> -	kfree(dpr);
>  }
>  
>  static u32 dcss_dpr_x_pix_wide_adjust(struct dcss_dpr_ch *ch, u32 pix_wide,
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-drv.c b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> index b61cec0cc79d..bd3f9d58042c 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-drv.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-drv.c
> @@ -51,15 +51,13 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  
>  	of_node_put(remote);
>  
> -	mdrv = kzalloc(sizeof(*mdrv), GFP_KERNEL);
> +	mdrv = devm_kzalloc(dev, sizeof(*mdrv), GFP_KERNEL);
>  	if (!mdrv)
>  		return -ENOMEM;
>  
>  	mdrv->dcss = dcss_dev_create(dev, hdmi_output);
> -	if (IS_ERR(mdrv->dcss)) {
> -		err = PTR_ERR(mdrv->dcss);
> -		goto err;
> -	}
> +	if (IS_ERR(mdrv->dcss))
> +		return PTR_ERR(mdrv->dcss);
>  
>  	dev_set_drvdata(dev, mdrv);
>  
> @@ -75,8 +73,6 @@ static int dcss_drv_platform_probe(struct platform_device *pdev)
>  dcss_shutoff:
>  	dcss_dev_destroy(mdrv->dcss);
>  
> -err:
> -	kfree(mdrv);
>  	return err;
>  }
>  
> @@ -87,8 +83,6 @@ static int dcss_drv_platform_remove(struct platform_device *pdev)

I think you are on a slightly old kernel version. The remove() callback
in the latest kernels returns void. Hence the patch does not apply
cleanly.

>  	dcss_kms_detach(mdrv->kms);
>  	dcss_dev_destroy(mdrv->dcss);
>  
> -	kfree(mdrv);
> -
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-dtg.c b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> index 30de00540f63..5c0f697587e6 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-dtg.c
> @@ -151,8 +151,9 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
>  {
>  	int ret = 0;
>  	struct dcss_dtg *dtg;
> +	struct device *dev = dcss->dev;
>  
> -	dtg = kzalloc(sizeof(*dtg), GFP_KERNEL);
> +	dtg = devm_kzalloc(dev, sizeof(*dtg), GFP_KERNEL);
>  	if (!dtg)
>  		return -ENOMEM;
>  
> @@ -160,11 +161,10 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
>  	dtg->dev = dcss->dev;
>  	dtg->ctxld = dcss->ctxld;
>  
> -	dtg->base_reg = ioremap(dtg_base, SZ_4K);
> +	dtg->base_reg = devm_ioremap(dev, dtg_base, SZ_4K);
>  	if (!dtg->base_reg) {
>  		dev_err(dcss->dev, "dtg: unable to remap dtg base\n");
> -		ret = -ENOMEM;
> -		goto err_ioremap;
> +		return -ENOMEM;
>  	}
>  
>  	dtg->base_ofs = dtg_base;
> @@ -176,16 +176,6 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
>  		((dtg->alpha << DEFAULT_FG_ALPHA_POS) & DEFAULT_FG_ALPHA_MASK);
>  
>  	ret = dcss_dtg_irq_config(dtg, to_platform_device(dcss->dev));
> -	if (ret)
> -		goto err_irq;
> -
> -	return 0;
> -
> -err_irq:
> -	iounmap(dtg->base_reg);
> -
> -err_ioremap:
> -	kfree(dtg);
>  
>  	return ret;
>  }
> @@ -193,11 +183,6 @@ int dcss_dtg_init(struct dcss_dev *dcss, unsigned long dtg_base)
>  void dcss_dtg_exit(struct dcss_dtg *dtg)
>  {
>  	free_irq(dtg->ctxld_kick_irq, dtg);
> -
> -	if (dtg->base_reg)
> -		iounmap(dtg->base_reg);
> -
> -	kfree(dtg);
>  }
>  
>  void dcss_dtg_sync_set(struct dcss_dtg *dtg, struct videomode *vm)
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-scaler.c b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> index 47852b9dd5ea..ed4d1eb9442e 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-scaler.c
> @@ -291,7 +291,7 @@ static void dcss_scaler_write(struct dcss_scaler_ch *ch, u32 val, u32 ofs)
>  	dcss_ctxld_write(scl->ctxld, scl->ctx_id, val, ch->base_ofs + ofs);
>  }
>  
> -static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
> +static int dcss_scaler_ch_init_all(struct device *dev, struct dcss_scaler *scl,

No need to add 'dev' as an argument to this function. You can use
'scl->dev'.

>  				   unsigned long scaler_base)
>  {
>  	struct dcss_scaler_ch *ch;
> @@ -302,7 +302,7 @@ static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
>  
>  		ch->base_ofs = scaler_base + i * 0x400;
>  
> -		ch->base_reg = ioremap(ch->base_ofs, SZ_4K);
> +		ch->base_reg = devm_ioremap(dev, ch->base_ofs, SZ_4K);
>  		if (!ch->base_reg) {
>  			dev_err(scl->dev, "scaler: unable to remap ch base\n");
>  			return -ENOMEM;
> @@ -317,8 +317,9 @@ static int dcss_scaler_ch_init_all(struct dcss_scaler *scl,
>  int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
>  {
>  	struct dcss_scaler *scaler;
> +	struct device *dev = dcss->dev;

Do you really need this extra variable? Why not use dcss->dev directly?
It's only used in a couple of places in this function.

>  
> -	scaler = kzalloc(sizeof(*scaler), GFP_KERNEL);
> +	scaler = devm_kzalloc(dev, sizeof(*scaler), GFP_KERNEL);
>  	if (!scaler)
>  		return -ENOMEM;
>  
> @@ -327,18 +328,8 @@ int dcss_scaler_init(struct dcss_dev *dcss, unsigned long scaler_base)
>  	scaler->ctxld = dcss->ctxld;
>  	scaler->ctx_id = CTX_SB_HP;
>  
> -	if (dcss_scaler_ch_init_all(scaler, scaler_base)) {
> -		int i;
> -
> -		for (i = 0; i < 3; i++) {
> -			if (scaler->ch[i].base_reg)
> -				iounmap(scaler->ch[i].base_reg);
> -		}
> -
> -		kfree(scaler);
> -
> +	if (dcss_scaler_ch_init_all(dev, scaler, scaler_base))

As I mentioned above, dev is already part of dcss_scaler structure.

Thanks,
Laurentiu

>  		return -ENOMEM;
> -	}
>  
>  	return 0;
>  }
> @@ -351,12 +342,7 @@ void dcss_scaler_exit(struct dcss_scaler *scl)
>  		struct dcss_scaler_ch *ch = &scl->ch[ch_no];
>  
>  		dcss_writel(0, ch->base_reg + DCSS_SCALER_CTRL);
> -
> -		if (ch->base_reg)
> -			iounmap(ch->base_reg);
>  	}
> -
> -	kfree(scl);
>  }
>  
>  void dcss_scaler_ch_enable(struct dcss_scaler *scl, int ch_num, bool en)
> diff --git a/drivers/gpu/drm/imx/dcss/dcss-ss.c b/drivers/gpu/drm/imx/dcss/dcss-ss.c
> index 8ddf08da911b..0a8320adc302 100644
> --- a/drivers/gpu/drm/imx/dcss/dcss-ss.c
> +++ b/drivers/gpu/drm/imx/dcss/dcss-ss.c
> @@ -82,8 +82,9 @@ static void dcss_ss_write(struct dcss_ss *ss, u32 val, u32 ofs)
>  int dcss_ss_init(struct dcss_dev *dcss, unsigned long ss_base)
>  {
>  	struct dcss_ss *ss;
> +	struct device *dev = dcss->dev;
>  
> -	ss = kzalloc(sizeof(*ss), GFP_KERNEL);
> +	ss = devm_kzalloc(dev, sizeof(*ss), GFP_KERNEL);
>  	if (!ss)
>  		return -ENOMEM;
>  
> @@ -91,10 +92,9 @@ int dcss_ss_init(struct dcss_dev *dcss, unsigned long ss_base)
>  	ss->dev = dcss->dev;
>  	ss->ctxld = dcss->ctxld;
>  
> -	ss->base_reg = ioremap(ss_base, SZ_4K);
> +	ss->base_reg = devm_ioremap(dev, ss_base, SZ_4K);
>  	if (!ss->base_reg) {
>  		dev_err(dcss->dev, "ss: unable to remap ss base\n");
> -		kfree(ss);
>  		return -ENOMEM;
>  	}
>  
> @@ -108,11 +108,6 @@ void dcss_ss_exit(struct dcss_ss *ss)
>  {
>  	/* stop SS */
>  	dcss_writel(0, ss->base_reg + DCSS_SS_SYS_CTRL);
> -
> -	if (ss->base_reg)
> -		iounmap(ss->base_reg);
> -
> -	kfree(ss);
>  }
>  
>  void dcss_ss_subsam_set(struct dcss_ss *ss)
> -- 
> 2.43.0
> 
