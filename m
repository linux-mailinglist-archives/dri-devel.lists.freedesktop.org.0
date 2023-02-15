Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6A1697881
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FA910EA6E;
	Wed, 15 Feb 2023 08:53:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2067.outbound.protection.outlook.com [40.107.22.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5C8E10EA6E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 08:53:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OM9IIMAGr7JBzAfp0VY27Wi6hfBFxQENntkLbUC8VEsr5IUyZd+e9NtShOjI4v19BnjvdOO964jOQfHB7IC+dmvSNGHKmin1hzFSmg50PXHBnQsuCso90eweCkwvRH1osxtshfIBdtJFfrolPu/31FZFtBxsXBTahE/m67p0cO+mxbShghcAo3Oi3wz97b5K04iUkrD+pKFntA+8IyeHtmQM2MCBEd6w8tijybE1cpRFUuT3fKxXBbwZ02cr0hcpsGwl1GuD8F+FqwkLH3weByOKnD+qsoAv/Zfv2MpVwhvn1LLLhP1LIbSboZEIC+t2KHJNTlgR/pi1plTyjx+HVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/RobdagXr+ITKkW+ZDyR6P2/V7kHyYmDFRAyJ5xexg=;
 b=N88r9uYIXHaZtWREwZ9qi0k/6+4AqNIKDs1h18Nfr82Y5POszhwZ9k6jJvdLjESDQk1E6MbR904TFrNwM4zjOQGLZRJYqim0w8Lk7TpKBoxUYc7yIT5Yg1UBHXwS8I06wJg4HnE8WgdTJVXVJrS5L9/4/Ev744BvfafAdvG9RHU+IXb81fgA8LqL7R5jGf/TBhLf0qS2bRY1E0bRBBc2q6UXgizS9ykIU3eu3i1JSPDnfNtJVcRrJQU9RJyjhCqLsbOYHwPdllCqDLmROW1+A2Rue2W2T0QvEnyGz0yC2sl/Jej4ssnuKSDHP9UOtnoAVJWZdSf8OtJFlnmqXfWrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D/RobdagXr+ITKkW+ZDyR6P2/V7kHyYmDFRAyJ5xexg=;
 b=DHKg9Mo1Dm1Qk5k7RlDFtBmDOriURwbfuqluLBAaLr6GX8xcVVYt4h7XOh2SEsriZ1N3VIAzc6Ley/X+A5zJggvpSpSNoF7qJGugH6FssdMgPOlhf4mKpp2aWuOFocNEqjTf8hSrwt2AMtu2p4C9H/3O1Uyb4Yd6khehs7RHJgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DBBPR04MB8011.eurprd04.prod.outlook.com (2603:10a6:10:1ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 08:53:17 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 08:53:17 +0000
Message-ID: <f4a1c8eb57f15ed67ebe3effd6d6d9f54dbfb486.camel@nxp.com>
Subject: Re: [PATCH v3 5/6] drm: lcdif: Add multiple encoders and first
 bridges support
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Feb 2023 16:52:49 +0800
In-Reply-To: <1893357.taCxCBeP46@steina-w>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-6-victor.liu@nxp.com> <1893357.taCxCBeP46@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG3P274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::23)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DBBPR04MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f630b12-2ef6-4a11-6de4-08db0f3213f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77vTwvuXDvsNj3skakrLV7mWPIvd/WzIgGT1Drp0WCmk7X3nCbSn2YZ9MohoV36X+VRPgoqUIaGlFEe/43J2vy1s62bbJawKo4WVLlCI8KSZSWZmYPuL6tKQjd7AN832sFUYdGNOnDii7di41wKelE5sfH1g9gXTcD30d3eGV/X7U7g8sNgMTByrQuU3LyGdKbwtX6mJuTzkTz1vNbqdASADEydziF2ef9Ba7SBmHWYIH4bhuuTeKT9rO+ebXSe1d6HziKZKx4AVGYE2fLY0NJ3n9PEopVtgul5845dqXqyP3tkozYu/8HoS+l9LQBwx+3N0R0hYn8DLy34whvnV/33O8rCc6El4GNBepPOOYy6Z1Dm5ql7CuhRPpFEBnPSVOJ3bKcr0tk50cgFMtSs/+IeLFx/spcXsb+zDtGZx5mLtQahyszu3dM9pv02rUIvX2rofSSR0cXP1oICjgofdyUpfYEZVri2Y+4KZ0WuLKU1OpqEzilsZkRv3BDF2uDGIgJ4qSgYjm8oxr6C+UZiaRBM6YNlSTLRLsX7Bv/7BOItD5ZW7RPBilfMbm5u8XfZv8EIY4QgsYZcGMbED9AaQsHtsaUuqgc2pUIgQLKmQKtEmKoqlrQajARpp1NOMAFO310GsYVDY7AmeeiQb3vYQDZTVsBX8NNinljTkklVqHiKXty3RDKfhr+cADpAu9LuhDZdKHVSb/wPvjl+3l6CXkvqPfB9TY0UvaMyN5XB7uO8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199018)(83380400001)(478600001)(2616005)(52116002)(6486002)(6506007)(6666004)(36756003)(6512007)(186003)(26005)(38100700002)(38350700002)(41300700001)(5660300002)(86362001)(8936002)(7416002)(316002)(8676002)(4326008)(2906002)(66556008)(66476007)(66946007)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3FxaHczZUc1dUJ4ZlQ0NENnMFNJYjBGVitPSkxEbmlSUGI5R3llamtjMXVX?=
 =?utf-8?B?VmxMeEtiMU8rV3pBNWJNNmdmMTE4cTcxbFlTWWx5QTdTWlZMTnR1WWFxSlhJ?=
 =?utf-8?B?RjB4NHFtSDFYWmh2WVdRdHpVaUN4SHJXNTQreEt0dWE4enJvSFBqRGxBUm9u?=
 =?utf-8?B?TTk4c1JtS2UwOERmNW5yTW1SR091OEtLaEd6cXova1RIQVFza1dtVTVKTEoz?=
 =?utf-8?B?RWdNbTc4WHJIcGtnVjhPWGFBRm15NFVaejNWdjVnT08yU1RaejBHYTV2N1VN?=
 =?utf-8?B?bjZERWtWckhIYXpTL0VnWFpsVzhUa1crUEY0djI0c25lSmRia2ZDd3pybFh5?=
 =?utf-8?B?VTg0NWZHRlhzVVhsbDNPWXYrSm5ydDRuYk9KSzBUV3Vpdm5EcVdLc09Ua0hy?=
 =?utf-8?B?bldEM21COVpVeTE0MGltb1owUlJyeDBjMG9yekdYVVo2dGllT3gvc1RDVzhH?=
 =?utf-8?B?SnYySE5vVVFkY1BlcVZKeTVhdFRnVml6NzRqNkdCWlFINWliNm0xT1puNHU4?=
 =?utf-8?B?bktobXA5NTlISnhTSElMS05lbFNSOHZQa1FCYzhLV0FSN25VSnFOY045aFBk?=
 =?utf-8?B?MW1mdGdPb2ljdjVPSzk1RHM2M3p0NmovN3VFZC9xUWVVK0hINTZDSE8yMFBh?=
 =?utf-8?B?UUxPMmJQZ1Y3dHF1cUZsL2M4YjlnNk5GbHJTOVo5bkhWV2NaN0htLzhxN210?=
 =?utf-8?B?ZExvQlJIZnJHcHRZdDhBaUNUTFdJdmQvL1NaMzVVVHRmcXhhQkxBdHVUMDFh?=
 =?utf-8?B?Y0ZISTZpTDY0aUZpZW9TU0pTRUFvTFZMY2lyeWgyVXhyV2VzdkczVDR4aHNG?=
 =?utf-8?B?WW9CSnhSbE41a0V2Nkt2WW50M2tTamhiZWQzVFNNRnJ1eEl4TGRFYXN4aGJR?=
 =?utf-8?B?N012WjdHeFhiR3A4bmxCVWNNdWUzd3RiRDRUZlppcDRReHFIUjhlSkhpRnU0?=
 =?utf-8?B?aTl3cUorbjg3bGtOaStlYnZXOSswcGZIT3RkTVZuajM4bXhpZitQekswNmpn?=
 =?utf-8?B?Q0F0eW1xUDBFSXZMSWtaSC93R0VReHoyUUZpT2k3eWRwMmNkL2s1RzMrSW9s?=
 =?utf-8?B?U3U5RjR2MDFNNmVNd1hKL3kzbmh3NkljYXQwRnE1aEIzbnUvZy81SGFDa3Jl?=
 =?utf-8?B?TjUxOW1nd3VFeWxyV0ZIZUo0REIycm5UelhGYmVvaWZ5VGp2ekE5ZUE3MjlU?=
 =?utf-8?B?dUhRc0tjc2pvQkNsZlh4N0F3dWV0Q0tPWTdxSDE1bXZHRG9kdTZvUnIrUGlU?=
 =?utf-8?B?a1pHSDczUG80cURCRW03UFpiR0dQRmE3bmxvZ0hPK1RXaHRmdVBBS1QrWWFv?=
 =?utf-8?B?SjE3aHRlWEc0elR5S0tUb2t5WXNTL3NJNEhJL2RoVmV5Qmk3SkJSVngxYXZq?=
 =?utf-8?B?d1dvUTlOZUpqYXFhU0Y4UmhFRzdGdmVQcHFmTG9lczJsLzlsTHpQdTlTdmI1?=
 =?utf-8?B?VnJZYjdHNXFoeXh1d0g2YUpDcExMNkpFVCtZcmVlaVlMeTZjRngrL0tLaFN3?=
 =?utf-8?B?N1QxOUVsbDI5c0dXM1ExaU9nVG4rNFZ2SjFNK05mL0pGL095aDJ1cHZlY3dk?=
 =?utf-8?B?Mkx0MHhFaHVBdnowUi9qVEVjU2xta1RlZHN1SVpNVWZrNEhhMDhVa0FYZkVr?=
 =?utf-8?B?S25XK2twajJRWm5BTXNGb2JXUWU0dm9PaitaT0Zxa2JXUHNQazM4ZlV2VlJG?=
 =?utf-8?B?VEpBT2dRNTdZQllxVWZ5MTBtRUs0S0MxQ1l1eWh0MXo2c1ZFbDM0azlUSXdz?=
 =?utf-8?B?a3UvWWdiYUd0czhlM2IrQS9Dd1JDMDU2WjdrdEwzSGo3OXM2Uk5hQloxcThn?=
 =?utf-8?B?NlptLzI2TjhQUDZEbDgxR3BsRUxwMnFpczMrV1BaRnFmRnh0UmVOVGEvckdZ?=
 =?utf-8?B?dys1MzQraC84Z2g5TEtQc2x0NEpFanpVMHBWaUMxU3Q1MENQQTdNdllqZ0sy?=
 =?utf-8?B?TDA3RElUSDMvWHExRHNwSG1kU09CVGlVbmg0V09hQVpRbTFXRDRuNDFVWDVR?=
 =?utf-8?B?eXB3UTlKdzkvTVVNc2hZQzhZQTVXYUxwVFNxZGRFK0c2ZEN5VEMrNEcva0po?=
 =?utf-8?B?bWJCbVVlM21KZ21aVThXNWs1eElDZ3BoVk92eUNvU001S3FZOFlxbzlUMHBa?=
 =?utf-8?Q?IBdLTj+CrVtxqsGnuAHxm3Wh7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f630b12-2ef6-4a11-6de4-08db0f3213f3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 08:53:17.4476 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BoBBgtwqiLpn3iq8ObLrzffY7PV3sJ0v/+rwHo64Kav7BnQ945pQFMyx8UsSZyaxST3WM+UjYSw33E3shRW2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8011
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-02-15 at 08:54 +0100, Alexander Stein wrote:
> Hi Liu,

Hi Alexander,

> 
> thanks for the update.

Thanks for the review.

> 
> Am Montag, 13. Februar 2023, 09:56:11 CET schrieb Liu Ying:
> > The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> > simultaneously.  Look at LCDIF output port's remote port parents to
> > find all enabled first bridges.  Add an encoder for each found
> > bridge
> > and attach the bridge to the encoder.  This is a preparation for
> > adding i.MX93 LCDIF support.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> > * Drop '!remote ||' from lcdif_attach_bridge(). (Lothar)
> > * Drop unneeded 'bridges' member from lcdif_drm_private structure.
> > 
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c | 68
> > +++++++++++++++++++++++++++----
> >  drivers/gpu/drm/mxsfb/lcdif_drv.h |  4 +-
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 21 ++--------
> >  3 files changed, 66 insertions(+), 27 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.c index
> > b5b9a8e273c6..eb6c265fa2fe 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -9,13 +9,16 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > +#include <linux/of.h>
> >  #include <linux/of_device.h>
> > +#include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > 
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_drv.h>
> > +#include <drm/drm_encoder.h>
> >  #include <drm/drm_fbdev_generic.h>
> >  #include <drm/drm_gem_dma_helper.h>
> >  #include <drm/drm_gem_framebuffer_helper.h>
> > @@ -38,19 +41,68 @@ static const struct
> > drm_mode_config_helper_funcs
> > lcdif_mode_config_helpers = { .atomic_commit_tail =
> > drm_atomic_helper_commit_tail_rpm,
> >  };
> > 
> > +static const struct drm_encoder_funcs lcdif_encoder_funcs = {
> > +	.destroy = drm_encoder_cleanup,
> > +};
> > +
> >  static int lcdif_attach_bridge(struct lcdif_drm_private *lcdif)
> >  {
> > -	struct drm_device *drm = lcdif->drm;
> > +	struct device *dev = lcdif->drm->dev;
> > +	struct device_node *ep;
> >  	struct drm_bridge *bridge;
> >  	int ret;
> > 
> > -	bridge = devm_drm_of_get_bridge(drm->dev, drm->dev->of_node, 0,
> > 0);
> > -	if (IS_ERR(bridge))
> > -		return PTR_ERR(bridge);
> > -
> > -	ret = drm_bridge_attach(&lcdif->encoder, bridge, NULL, 0);
> > -	if (ret)
> > -		return dev_err_probe(drm->dev, ret, "Failed to attach 
> 
> bridge\n");
> > +	for_each_endpoint_of_node(dev->of_node, ep) {
> > +		struct device_node *remote;
> > +		struct of_endpoint of_ep;
> > +		struct drm_encoder *encoder;
> > +
> > +		remote = of_graph_get_remote_port_parent(ep);
> 
> Is it possible for remote to be NULL?

Yes. But, no worries.  Lothar said the check for '!remote' is not
needed in v1 comment because of_device_is_available() checks that.

> 
> > +		if (!of_device_is_available(remote)) {
> > +			of_node_put(remote);
> > +			continue;
> > +		}
> > +		of_node_put(remote);
> > +
> > +		ret = of_graph_parse_endpoint(ep, &of_ep);
> > +		if (ret < 0) {
> > +			dev_err(dev, "Failed to parse endpoint
> > %pOF\n", 
> 
> ep);
> > +			of_node_put(ep);
> > +			return ret;
> > +		}
> > +
> > +		if (of_ep.id >= MAX_DISPLAYS) {
> > +			dev_warn(dev, "invalid endpoint id %u\n", 
> 
> of_ep.id);
> 
> I would write
> dev_warn(dev, "ignoring invalid endpoint id %u\n", of_ep.id);
> just because the parsing continues but this one is skipped.

Ok, will do that in next version.

> 
> > +			continue;
> > +		}
> > +
> > +		bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 
> 
> of_ep.id);
> > +		if (IS_ERR(bridge)) {
> > +			of_node_put(ep);
> > +			return dev_err_probe(dev, PTR_ERR(bridge),
> > +					     "Failed to get bridge 
> 
> for endpoint%u\n",
> > +					     of_ep.id);
> > +		}
> > +
> > +		encoder = &lcdif->encoders[of_ep.id];
> > +		encoder->possible_crtcs = drm_crtc_mask(&lcdif->crtc);
> > +		ret = drm_encoder_init(lcdif->drm, encoder, 
> 
> &lcdif_encoder_funcs,
> > +				       DRM_MODE_ENCODER_NONE, NULL);
> > +		if (ret) {
> > +			dev_err(dev, "Failed to initialize encoder for 
> 
> endpoint%u: %d\n",
> > +				of_ep.id, ret);
> > +			of_node_put(ep);
> > +			return ret;
> > +		}
> > +
> > +		ret = drm_bridge_attach(encoder, bridge, NULL, 0);
> > +		if (ret) {
> > +			of_node_put(ep);
> > +			return dev_err_probe(dev, ret,
> > +					     "Failed to attach 
> 
> bridge for endpoint%u\n",
> > +					     of_ep.id);
> > +		}
> 
> Admittedly I'm not used to the drm API, but do we need to some manual
> cleanup/
> revert if some endpoints is e.g. deferred, but previous endpoints
> already have 
> been successfully added? e.g. endpoint 0 is added, but adding
> endpoint 1 
> fails.

I think the bailout path is safe, because
drm_mode_config_init_release() is called as the managed release action
added through drm_mode_config_init(). drm_mode_config_cleanup() would
clean things up.

Regards,
Liu Ying

