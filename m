Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7F35EACE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 04:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2DC46E428;
	Wed, 14 Apr 2021 02:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3AC46E428;
 Wed, 14 Apr 2021 02:26:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q6/k7/tDdojq1rIWEik0C/NRJHTjJ8x+5RjEW2iEM+ZzWexIgPOtneoTP2yO1xxci+qf0KjrlZqUopill4HzWExN4e5KgnpCuQ9Gs+8f4Z6Mn/XasDvF40BzgVgMyfk3XOZLYUZ8DQFrosNLGLzofRmG4QqUFbLnUFhiuFkpIdZFow19n+mU2n9YJ51qiJPFDz0DeZphqj+xjE/MuKWKDPOBNjsXqrATNuwPHBzVeMbNz1Dce4WN8qoRth7CMLfM+dlT3HIkYqLIUQPcx/xSnrp7n6+ydP7eXhHaytK+P2aAfEm2xERYdIisby/84mX1M2O9hKHhOg85xXYas2oMYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31Vy1hhOdxQpWirKjy5VdaODRZLAwUiQKKMUBmsdCB8=;
 b=c95s9ID9F+fchzIlYmpzNhDh2Ua7VgGeLoG4qGYr8LLx1cs8aQOnqtswhvywXJ3bkVXR2cFj3ECtYrM1oeRjpF1hecOqv3IF2q4PHKLHqCYYWhAWAQfQvCf41JLXevEPRekGk469VMNstuvIdGs6kqmKlL+auaa8keRmYFyOzPNoGPfHga7nzlLYHS+gOr6Ajxb9Qpw6tzvV0/9PU1K5U6b2s5pktANcAl/fVCv7o2eeRKuYmhNLWeMVpfKYDukARpCO4UHsbM+sjEQlDr4zcHyElVYKlhtkwtgmGzr9vMmnIM0c+iFAFlZBbDFFkMjDtq1o4tKUs6zgz8bXPMEZ7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31Vy1hhOdxQpWirKjy5VdaODRZLAwUiQKKMUBmsdCB8=;
 b=jJDlLuOJKR9lwEIfvunigYm9qcy4A1Q3ZQr0MiHUGqo8EpENdlz3qII33MPS5W2jkhSOUtQ4q86qZnF+7rLkA4FS2jaRGNbw3+9RWmk8s2FDLbxG1wH9MuWN29/obIDKGZtfzyNqnwFsWNuz4dm4ZS/bYtfku7CV4OafGt5KQvc=
Authentication-Results: pengutronix.de; dkim=none (message not signed)
 header.d=none;pengutronix.de; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB6111.eurprd04.prod.outlook.com (2603:10a6:803:f9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.18; Wed, 14 Apr
 2021 02:25:59 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 02:25:59 +0000
Message-ID: <9395e1fde2725d4fe01c206d9172b8acd7cdf921.camel@nxp.com>
Subject: Re: [PATCH 05/12] drm/imx: Don't set allow_fb_modifiers explicitly
From: Liu Ying <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 14 Apr 2021 10:24:22 +0800
In-Reply-To: <83a41b2e9636cb6a790b23843c6d2628d02c6997.camel@pengutronix.de>
References: <20210413094904.3736372-1-daniel.vetter@ffwll.ch>
 <20210413094904.3736372-5-daniel.vetter@ffwll.ch>
 <290aef5ed13749d465eb19235aa87a2cef63dd2a.camel@pengutronix.de>
 <YHWk9V/4mu1lGFgD@phenom.ffwll.local>
 <83a41b2e9636cb6a790b23843c6d2628d02c6997.camel@pengutronix.de>
User-Agent: Evolution 3.36.4-0ubuntu1 
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: MA1PR01CA0092.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::32)
 To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by
 MA1PR01CA0092.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.17 via Frontend Transport; Wed, 14 Apr 2021 02:25:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16bda73a-eebd-4cd0-8c35-08d8feeca43f
X-MS-TrafficTypeDiagnostic: VI1PR04MB6111:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB611181E698E5875B6F60FCB3984E9@VI1PR04MB6111.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rluWpriTK1cI+PD2RxQY5cJwIBJXPauCdGmG2eL6zS6taCRYiHqlcxhBji6dP00XxgiPiIYfp2ok2oR7PCvb2/WU5Vr6oAkIaX3HcT1UmIxhiC+WewT5QSwmqf2cDsmFRPME2c0/gwmpv2zunPtAp6g3UzM7BW8wWEXRuqFOui15lbLI9dF4F4N2qUAGe40KnPqcC9vCtFCJPyj5Yc2IJu1XSyOcr0FBt8/ohcYMv/aVfvDVIc7T/K1SOIq6yDZc3H/1zYcGGIOZyfhQjIDo+VOi20yI6iSymQLcgov1KuAE2hLNIAZM19AqVgivMFezxP6AaVYrNwUXzceHaqtIIr9E+H7E8XXloR57M4hj4kgxmp9sDVVK3eqoZpIJyjimkM3NOrQTztgLHXh3CR81Qj15YYUX5jIvGup5DRCxKjlR8f3jKHfI7q+yyf6+T0m+SVH0Ex+BJnY1AiHgZ3PU4IZQNn8Uo1zwMz5PrPUHuwMkvi9ukt1G9qEpQoGX8e8XWQENFm+fDzU9yy2u19QbaZNja7/xH1+ovE2rpy0Q27kAlqj8l59mtLkeufvKnauythcCt6UgTNzIuYPIt/LdLysTpSqozmCMgprhHEY9GLRf8NUq/w1Cx2IwTUsgb4HR9QiDNk55J0RCqUgrloDNYRCQSPQDtZIzHegY42fnr2M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(8936002)(26005)(66946007)(66476007)(7416002)(36756003)(956004)(86362001)(52116002)(16526019)(478600001)(66556008)(6666004)(186003)(38350700002)(54906003)(83380400001)(38100700002)(2906002)(110136005)(4326008)(6486002)(316002)(6496006)(8676002)(2616005)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bTEvTzhwZkhTNlB6aU1DdjQrcDcrayt0TXcrQ3FMQmM2U1hkMG12aUhSVW5l?=
 =?utf-8?B?dWpwdTZaUTVqMnRrUytDeEMvWVBZcjJ1TFRGQm5iZnZLdmZXQWZuUmY4d092?=
 =?utf-8?B?YkF5cDByVXJOZ0FVclpMODhoSlovazFveEh5MjB6OU95TXZlbU1FVnd4N0hQ?=
 =?utf-8?B?M1A4YTNCTERVRzFXcmUvVnBINHBxQXJaQ2hlK1l0NkExZE95WUh1K1c4REZT?=
 =?utf-8?B?THU1d0ordEtnbDhjeEI3Rmc2cDNZVXZhVkt1cUNYL0hYSVcyTjcxaUVlZHJ4?=
 =?utf-8?B?MXdPSzZKOTlCRG9lV08vbTlhL3NCSkQ5TzN4SGhzOXUxK1Zab2RlOE1lbmdU?=
 =?utf-8?B?TTRyY2VXTkJ6dmFvWlZKNit3WXVNSGVKa0FmcE05b243REtSdUFNYVppMDVj?=
 =?utf-8?B?eHlQOGNsZGZ1ZlJvbVVuR01WaU9RSG1QV0VvRmhsRkZSNXNtMUNuSGhuNHds?=
 =?utf-8?B?aVlTZEk4UjQyR0lrSFdaR01hdEpiV1o0QzlPN0dPZTkyYStQK0FWWXpkRStZ?=
 =?utf-8?B?eWhEZHg0dHZOMUgzeDRrdGxDcFhqakhoR1owdVMvWWptYkV5L2d0eE8xUXdC?=
 =?utf-8?B?M0poUGRLYU9UZlRHWVYwcGNMWkovaFhweVRtZW8xV0pJSFloNGxZTk9mQXIr?=
 =?utf-8?B?YU9QQ01hRkZMeFRteGxCTHJSYXR5K3NnaVdYc0s0S1YwZkt5anRFVXBwTUEy?=
 =?utf-8?B?dFkxT0FGOHVEOHk1TVAyM24zdWxEUi9qVmdJVE1pNWNlZms3elZoZXJIbkJw?=
 =?utf-8?B?S0MvQURhVnAxVElUK212bWZwTVlwN096SVJmVUJKWDVnTjd3MDN5Yzg2aXgx?=
 =?utf-8?B?NGhRVTJuNnFqc3R2cFhVNE83cUxLaGxYRUZBd3gvSWlGaWhwQ09DNXBXc0pQ?=
 =?utf-8?B?bjdKZjZxWjlWUHdoV0dPdktTeFVsUEJ3REQ3YlZ1b2sxeGt0SnBBVUFFdWJa?=
 =?utf-8?B?QTBHazFQSFp3eFRrc3hBRXpUWjFwK0pQTFdVU3NjekYrMFdDY2o4TVFnbFlm?=
 =?utf-8?B?YjQzK3ZxUGNLLytJWnVLZ2VuT01zNVArU1ZlUzJBZ3lDV3dCRFRFQ1pnRzkz?=
 =?utf-8?B?Z0xLbU5scVpkZnR5QzVCdHJMSisvbVdzRWpzUUYwUlJUVy82TUQ1REdjcENh?=
 =?utf-8?B?QmRBVlZkSExYWVdTdnVkeXcvNFpVUGxLbkRFK2NWK0hTaHlnVnpWVlY4OGNi?=
 =?utf-8?B?VFBubGtmeUVGcFRTQ2o0ZEIxVnU0TlpLc1QrUUhuaHBEUEVxQUlqSEJqejNX?=
 =?utf-8?B?UWNqdndkTHBhREF1MmhOdDV3UExoTEtBajc4RldDalhuUC9Dc0R5MzJFRHQ0?=
 =?utf-8?B?NGZ3dFlLOTBVRnZMNzZGdGtNSzdid1Z4RG5GZWlmdk94OXhrWUtUWFpSdnNS?=
 =?utf-8?B?LzFWYnI0cDQ3WkdXQ3JCcStPaGdJY3F0Z1FEOTlMUmpkWEV4SDBSbGFuV3FF?=
 =?utf-8?B?WmF5K21Qa2tZWXd0VXNMRzVCWC81aythZXYvQ2ltck1RbUhvMzFrc3RvRitH?=
 =?utf-8?B?ZnFESDh0ZUQ0V1JBeW91TnNmVE5yK25uVWIvU0poenR1NUtBTmdHTE9sbGJa?=
 =?utf-8?B?OW9yR1B4cmtsMzh2ZGxoRU0xaHhnQ2pEOWNCK3ZrcWJiTDRIRzB0T1JoK2xR?=
 =?utf-8?B?REc2akZ4Smh0SUtyZC9hQlFSdFJqM2FuSTZDSUF0NmdCTkowUG9NZzkxWWNv?=
 =?utf-8?B?RkFnelpUUzVRRHhVTHFNM09FZmFkeFp3VlRRMXkxWjZrdGYvWGJ2Ujg3aE55?=
 =?utf-8?Q?WAsXOgkeqFsFXZ5oeFfvDCDmxDOrOUgkiVkA5rw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16bda73a-eebd-4cd0-8c35-08d8feeca43f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 02:25:59.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjllZvDr+0773X7HhOlneV+PGO2SX+zjYQtCcTc/Kr5xKIqhcgqJMg6W7JuuMNB+bzpkG90tIEx8ZJ7mg4ilHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6111
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Tue, 2021-04-13 at 16:14 +0200, Lucas Stach wrote:
> Am Dienstag, dem 13.04.2021 um 16:04 +0200 schrieb Daniel Vetter:
> > On Tue, Apr 13, 2021 at 01:47:28PM +0200, Lucas Stach wrote:
> > > Am Dienstag, dem 13.04.2021 um 11:48 +0200 schrieb Daniel Vetter:
> > > > Since
> > > > 
> > > > commit 890880ddfdbe256083170866e49c87618b706ac7
> > > > Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> > > > Date:   Fri Jan 4 09:56:10 2019 +0100
> > > > 
> > > >     drm: Auto-set allow_fb_modifiers when given modifiers at plane init
> > > > 
> > > > this is done automatically as part of plane init, if drivers set the
> > > > modifier list correctly. Which is the case here.
> > > > 
> > > > This one actually set it twice on top of what drm_plane_init does, so
> > > > double-redundant!
> > > 
> > > That's not true. imx-dcss and imx-drm are two totally separate drivers.
> > > Maybe we should move imx-drm into its own ipuv3 directory one day to
> > > make this more clear. Change is still correct, though.
> > 
> > Hm I greeped for drm_universal_plane_init and didn't find anythinf for the
> > imx main driver ... where are planes set up for that? Need to review that
> > they have the modifiers listed in all cases.
> 
> That's in drivers/gpu/drm/imx/ipuv3-plane.c and modifiers are always
> set on plane init.
> 
> Regards,
> Lucas
> 
> > > Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
> > > 
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > > Cc: Fabio Estevam <festevam@gmail.com>
> > > > Cc: NXP Linux Team <linux-imx@nxp.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > ---
> > > >  drivers/gpu/drm/imx/dcss/dcss-kms.c | 1 -
> > > >  drivers/gpu/drm/imx/imx-drm-core.c  | 1 -

Nit: Since this patch touches two totally separate drivers(imx-dcss and
imx-drm), it would be good to split it into two patches.

Thanks,
Liu Ying

> > > >  2 files changed, 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/imx/dcss/dcss-kms.c b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > index b549ce5e7607..37ae68a7fba5 100644
> > > > --- a/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > +++ b/drivers/gpu/drm/imx/dcss/dcss-kms.c
> > > > @@ -52,7 +52,6 @@ static void dcss_kms_mode_config_init(struct dcss_kms_dev *kms)
> > > >  	config->min_height = 1;
> > > >  	config->max_width = 4096;
> > > >  	config->max_height = 4096;
> > > > -	config->allow_fb_modifiers = true;
> > > >  	config->normalize_zpos = true;
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  	config->funcs = &dcss_drm_mode_config_funcs;
> > > > diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > index 2ded8e4f32d0..8be4edaec958 100644
> > > > --- a/drivers/gpu/drm/imx/imx-drm-core.c
> > > > +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> > > > @@ -209,7 +209,6 @@ static int imx_drm_bind(struct device *dev)
> > > >  	drm->mode_config.max_height = 4096;
> > > >  	drm->mode_config.funcs = &imx_drm_mode_config_funcs;
> > > >  	drm->mode_config.helper_private = &imx_drm_mode_config_helpers;
> > > > -	drm->mode_config.allow_fb_modifiers = true;
> > > >  	drm->mode_config.normalize_zpos = true;
> > > >  
> > > > 
> > > > 
> > > > 
> > > >  	ret = drmm_mode_config_init(drm);
> 
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
