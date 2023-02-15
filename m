Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A0B697864
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 09:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17CD410EA6B;
	Wed, 15 Feb 2023 08:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2086.outbound.protection.outlook.com [40.107.104.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EFF10EA69
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 08:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F96SpeDNGQm1g+Zftjl7z4t8ZAaa9nGPu5ytZvyvQqbgnMoLB1Yb+9oX1OmegqH+Tu2WjIle2cSRYGZ2WVVLPb2mX/TLTCWdBjfYt4TxoQhQkH/myM1na7EkNoYTBvjjDhUQJ+SXNIC3QT1+EtqpJwF5EfHBY0bTabvOt4QaKLGGX7wp1zs4xghDMvFzncBIQHUksmCVKLb1iaBqF7mQtk075nf9+nQaXZ7BxxACKnj5qcTHAvrEpdk6IY/52/xbllrHDIwaDses6MUFbzuaxqC4T9EBBTFA1rVg//+dlDldofqd6fg2GnlmWjwkUpMuq89auW3u7o4Ts0lEoLWQbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOWFuV8HJVvJrD9M1sceX697/AmNyZadrWxh2tE+Gx0=;
 b=iuAjpCWEz5nmd+KGqCTTwMLWYmdBa9X7yJ0w0dC2gj1+X/s2AJIssb0d4hm6Fd85wnFaoiRAkAiD9lQvm8sSBwdYjjwsurNwkRKSgxYsdj/b20yS/cYIw9ylKla1C1+U4eCg3yqmkAQSJ2jiDE/+edKjVCTdoP778tFA2oSG6MsEDzG2+k1BEwI2I57c123W5suVlqxmgvGa7WNtcC4UilgEbTv1u6sTNWnkSxwelB+hm3n2yufSHa1FTTyZTwwEdJKknHsWIuMLy2KxdpN0qbXFWhv8pV9LMcD/KQYU+RyZIGzRY78GxwyEbAUVx/bdpT5Zv+D3fnjbrNbuQqKSkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KOWFuV8HJVvJrD9M1sceX697/AmNyZadrWxh2tE+Gx0=;
 b=fHKi/JNiM/VwrbFyVRNSGDy8mPUUqOUVsqdC/uypvdAFr9sj5+w9H5xYGZqSYmV8U/8x1tljn5ZDK7Qqhs3zL/wxfmchjFnEWqhQUD+Vx0D8RBI8iJSZ7NvMAzmval5bFTxSAAf04TnGNDJ8XWe60WKzFR6DGyHlJsbQ04EYVUQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9342.eurprd04.prod.outlook.com (2603:10a6:102:2a6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Wed, 15 Feb
 2023 08:41:27 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 08:41:27 +0000
Message-ID: <8ccdba247e1b3649af382b77039afa9d19bf81e2.camel@nxp.com>
Subject: Re: [PATCH v3 4/6] drm: lcdif: Check consistent bus format and
 flags across first bridges
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Feb 2023 16:40:48 +0800
In-Reply-To: <2148647.Icojqenx9y@steina-w>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-5-victor.liu@nxp.com> <2148647.Icojqenx9y@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: c8072d6c-eab0-43df-e4d0-08db0f306d50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iK2gVJQWFqR8WfQ8Ve86epdRNOrTnbCAoKds4FRRS/x2JqBMXvr37Qb2HmICn+mpy1s7FYNk0KahYJcWwZAyLHpW6O16i3Le7GzjxkLn3p1KZ12wFEtuMpuyxA03feAn4etTyzf/XMUYKjxboIwWgkMnN/IaeEG9BhLqnyjUpWIp5Nc5Vs+jKQD7+kFSySD8aNz1mpEPWwamlM21lIU5pY0FnwGfCQnyvhr3ZGkaJwc5hJvci1MFSZtfSeEArJCOSjHQ0NXKxaiznEnfVBfIBU8l6C/HvI+7IpuyXGJw88pZBIbJAHz93iqPFZXq07hFS4DxZ1T0cxLaKOcLIaEnY4MuTYl7SSBfV6Gy0Se85rBKgbp0wNVzoABrLu8jPRBqka6caZHXOQ3IP+Jf7KvNmkU8EVwjgOnLW3RQGRfVscjOOKE62SdxAq3i7Z5qJesg1CUV8aisNIsSJzV82w+W2BgskVTxBSEHxTwrDBzprqFOyJNVsLdkor0THaTEh/jZ4R/p55eegA5ZwzCr/YyuWR4QhfsjyjpsqbZC3aknpvpAr8Bz2AHIx6jvM5S7x7dE/pw535iFAwwcvNBfh7kmz6bIOx2T2VQBfVwXiFlKgiKSkidTQYSAXO5rBXgSdgWjeOOCPWUkTk6/5Am/d9L+ZYYaWsH8KwfaK9y8u2UhbdUfS2FZOSaDVDV+Gxmx8OTxxX7TU306g7fV2vNvP2cvOJi6aWOGY1ssQBf9+hiG+to=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199018)(186003)(86362001)(2906002)(36756003)(2616005)(7416002)(83380400001)(6486002)(26005)(38350700002)(38100700002)(316002)(66476007)(66946007)(66556008)(8676002)(8936002)(6506007)(52116002)(478600001)(6666004)(5660300002)(6512007)(41300700001)(4326008)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGRkcW5NRUVhZkR0R1BubTFETkJLbTZCREtXditzZTMxTFdMR3JyTDhiUk1t?=
 =?utf-8?B?ZGRDMnJScDkyMG1NVjlsRkN2OTlNM0F5N1l6UlZ3R1pvREgvYnRneVNEU0lP?=
 =?utf-8?B?SkV3NUtBTi96RG5ybmM5RzNoVUgrbStlb2QwUWJVbUNEOFpMWFE0d0pLZm1k?=
 =?utf-8?B?NE01VlNzaVJ1dGN1QXVmVUZUQXZrd2pmbTR4VktSSFFLOTErRXNpQjNEQy9y?=
 =?utf-8?B?d3huTUV5Y0d2SEpSbkROQ0o3T1VmRHhvU1dzNExFdEliY3VwQXdmYmU3LzJ0?=
 =?utf-8?B?VDRxM1NCaXhBNmZhcjBUU2pDN240S3FrdUQ4UkcyZ0haOGM1Q29vOERuNW9K?=
 =?utf-8?B?U1l5MzBzaVBDUXNHVStyNFMyWTZJUGlBRWRUQ091TFNLdml5T2c2a3pCUkJ1?=
 =?utf-8?B?QmU0NytORUsxUEJSTDlTTFgza1ZmTXZzakkzeWhGaVFtUGJQQnFidjBNaE9O?=
 =?utf-8?B?Z3MweHMvU0VWNk9RTXZHUFlaNUU3MXRrQnZNempNRXBDUXRvMkRQeHJCdE5B?=
 =?utf-8?B?ZjhWWHFCOVZTMVFkemc2RDZRSnZMVG9oQzVlK2s3Rlgyd3JBNVR2TFdaeTRa?=
 =?utf-8?B?T3YrR0V2Zm91Z0pVQWZFYTRQVStORElrUERLVjZvVG1kR3U0RHlua3dUOENJ?=
 =?utf-8?B?dU01cmIvdVA3bXlRd1lYWUx4VUI5YnQrSGhJN0FQM0ExcUdEU00rZGp2RzEw?=
 =?utf-8?B?ZUtNYW41dWpoeTdIYlpyOEFFbE1nU21qOXljQ3FiTWdQYzJrNG9iYXJ0UWxi?=
 =?utf-8?B?Y08wYUlycVVLTjl2ME8zd20zVGNPUXptdGdaa2xCVG9rTldrbzZIRXFuU2cy?=
 =?utf-8?B?c28yYXI4Tkh3S2RTRHZMT0I0R0w3WmRZNU92M1NNcU9vUnhDTmhiZ1BzYnEy?=
 =?utf-8?B?QmxHY1VFL0l6V2RzTE0zME1CWGlUTndlOXFvL0V5dFlvaVFxbkxzVVVzblR6?=
 =?utf-8?B?eVl0SlIwL1FqYW5Sa2F1STRQUnVjQndSeFVmci9aSjZidmhlYnR2ZzdtUEI2?=
 =?utf-8?B?MG84cm0zNHRkTERVR0JJc21RNFBCaXNwaU00S0tadUhSNnJTQVFtMUlvZUQ2?=
 =?utf-8?B?MzRnUmVEdGx4UmwzdGRoSkZqNXFsZWJCV3RTMWRNVE9pU3h2eFdoS1JPdGxK?=
 =?utf-8?B?dmJPTjErUnFXWjZmc0QrWWdLc1hhZURFS0RBa1N5ck1hYTJLVURTZ3lQQlNj?=
 =?utf-8?B?MlNKL3FUWks5bUhISmFkbFcrQVozSk5zZS91N0hta1J4VFBoTlRXUFZuSXl2?=
 =?utf-8?B?UGxzdWhkMVRpMHZJT0prNnk5Mjg2aXdiV3BFL3FFMDZqbkQyOHJJOU5EY01x?=
 =?utf-8?B?eXRyMkYrQndxbTA3OGVNZmdpNTJpOUhScEFyQzdBYmE5aCtpejhrZmNTOEti?=
 =?utf-8?B?RVpDdWtuSE5jWno2YklSY09ubjFTUVJMcFd4UU1wWW5iT0ZnbnhOeVNwZXZW?=
 =?utf-8?B?Y0txOUE1UmNjN0xqTnFVemhqRTNWY3NwWkFLUXUvalBoS0hnZ2NsVGxQUFlJ?=
 =?utf-8?B?Sk5TekpZcHBYM2NHTTRxNlNJWDAzOXh6a0pNeFgxYWZUWGV2S3RJVzBSbzRJ?=
 =?utf-8?B?ZU02K2F4Ri9kbXFuajJPbEpaZGpnYTdadXplSkRVSFBHSllwT2dyMjIvOUN2?=
 =?utf-8?B?NGxGNDNsdjc2RmpFZGVCd2xCQ0Q3RHZyRUJRK0R1eGVQMVZRb29YL1o2L0lz?=
 =?utf-8?B?Sk1ERUVNUk9pS2VGdE81elJRc0JlNmY5cWVWU0NZaFBScmYrZFdtMXJLUEQw?=
 =?utf-8?B?eU9qa3BXWmN0SCtYUGpIdnNGWW5uWHZQZ3dZaFVZNkh2bC9DUXl1ZDMwbnVM?=
 =?utf-8?B?QXhmTE82OVRHaUk2RHhFQTB3RFBDeFY4SU9xK1liTjFybDFyZXptR0x2M3pW?=
 =?utf-8?B?TlhVdGNCMXFDVTlML2pZV212aUZaOFJNRXE2d204KzcrOU41WndjMm9pMjdN?=
 =?utf-8?B?NVNqcThaWkpYc0NpNlY5aFc0aGZVYTlhTGJEM1g5b1IyVUFwbWYzN3ZrY3dG?=
 =?utf-8?B?MGNjcGlra3ludGZoWURGYmN5WU1Wc3E2N2xLQi9Ud1J4UmxVcTNDSFE1b3dt?=
 =?utf-8?B?MkJOL2Uyb2ZIaFcrWE0wVEtuOUVERU9IVFUwM2Yra1hWVzhobWNRb2Q5ZjFL?=
 =?utf-8?Q?mqPMKFD70zZUDLxTzH7GbhLfW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8072d6c-eab0-43df-e4d0-08db0f306d50
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 08:41:27.1015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mlx8eCRGdF7+8kgPvohakJRbtFy8K6tICEthj/75Bh7jnhj6RWoxNSFIS/H3tEcMpVnzjs190QzQPgfDx2gZPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9342
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

On Wed, 2023-02-15 at 08:55 +0100, Alexander Stein wrote:
> Hi Liu,

Hi Alexander,

> 
> thanks for the update.

Thanks for the review.

> 
> Am Montag, 13. Februar 2023, 09:56:10 CET schrieb Liu Ying:
> > The single LCDIF embedded in i.MX93 SoC may drive multiple displays
> > simultaneously.  Check bus format and flags across first bridges in
> > ->atomic_check() to ensure they are consistent.  This is a
> > preparation
> > for adding i.MX93 LCDIF support.
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> > * Drop a comment about bridge input bus format from
> > lcdif_crtc_atomic_check().
> > 
> >  drivers/gpu/drm/mxsfb/lcdif_drv.c |  2 -
> >  drivers/gpu/drm/mxsfb/lcdif_drv.h |  1 -
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 76 ++++++++++++++++++++++-----
> > ----
> >  3 files changed, 55 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.c index
> > cc2ceb301b96..b5b9a8e273c6 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.c
> > @@ -52,8 +52,6 @@ static int lcdif_attach_bridge(struct
> > lcdif_drm_private
> > *lcdif) if (ret)
> >  		return dev_err_probe(drm->dev, ret, "Failed to attach 
> 
> bridge\n");
> > 
> > -	lcdif->bridge = bridge;
> > -
> >  	return 0;
> >  }
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> > b/drivers/gpu/drm/mxsfb/lcdif_drv.h index
> > 6cdba6e20c02..aa6d099a1897 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_drv.h
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_drv.h
> > @@ -31,7 +31,6 @@ struct lcdif_drm_private {
> >  	} planes;
> >  	struct drm_crtc			crtc;
> >  	struct drm_encoder		encoder;
> > -	struct drm_bridge		*bridge;
> >  };
> > 
> >  static inline struct lcdif_drm_private *
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c index
> > 294cecdf5439..4ea3d2b2cf61 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -17,6 +17,7 @@
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> >  #include <drm/drm_color_mgmt.h>
> > +#include <drm/drm_connector.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_fb_dma_helper.h>
> > @@ -424,15 +425,19 @@ static int lcdif_crtc_atomic_check(struct
> > drm_crtc
> > *crtc, struct drm_atomic_state *state)
> >  {
> >  	struct drm_device *drm = crtc->dev;
> > -	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
> >  	struct drm_crtc_state *crtc_state = 
> 
> drm_atomic_get_new_crtc_state(state,
> >  								
> 
> 	  crtc);
> >  	struct lcdif_crtc_state *lcdif_crtc_state =
> > to_lcdif_crtc_state(crtc_state); bool has_primary = crtc_state-
> > >plane_mask
> > &
> >  			   drm_plane_mask(crtc->primary);
> > +	struct drm_connector_state *connector_state;
> > +	struct drm_connector *connector;
> > +	struct drm_encoder *encoder;
> >  	struct drm_bridge_state *bridge_state;
> > -	struct drm_bridge *bridge = lcdif->bridge;
> > -	int ret;
> > +	struct drm_bridge *bridge;
> > +	u32 bus_format, bus_flags;
> > +	bool format_set = false, flags_set = false;
> > +	int ret, i;
> > 
> >  	/* The primary plane has to be enabled when the CRTC is active.
> > */
> >  	if (crtc_state->active && !has_primary)
> > @@ -442,26 +447,55 @@ static int lcdif_crtc_atomic_check(struct
> > drm_crtc
> > *crtc, if (ret)
> >  		return ret;
> > 
> > -	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > -	if (!bridge_state)
> > -		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
> > -	else
> > -		lcdif_crtc_state->bus_format = bridge_state-
> > input_bus_cfg.format;
> > -
> > -	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> > -		dev_warn_once(drm->dev,
> > -			      "Bridge does not provide bus format, 
> 
> assuming
> > MEDIA_BUS_FMT_RGB888_1X24.\n" -			      "Please
> > fix 
> 
> bridge driver by
> > handling atomic_get_input_bus_fmts.\n"); -		lcdif_crtc_stat
> > e-
> > bus_format =
> > MEDIA_BUS_FMT_RGB888_1X24;
> > +	/* Try to find consistent bus format and flags across first
> > bridges. 
> 
> */
> > +	for_each_new_connector_in_state(state, connector,
> > connector_state, 
> 
> i) {
> > +		if (!connector_state->crtc)
> > +			continue;
> > +
> > +		encoder = connector_state->best_encoder;
> > +
> > +		bridge = drm_bridge_chain_get_first_bridge(encoder);
> > +		if (!bridge)
> > +			continue;
> > +
> > +		bridge_state = drm_atomic_get_new_bridge_state(state, 
> 
> bridge);
> > +		if (!bridge_state)
> > +			bus_format = MEDIA_BUS_FMT_FIXED;
> > +		else
> > +			bus_format = bridge_state-
> > >input_bus_cfg.format;
> > +
> > +		if (bus_format == MEDIA_BUS_FMT_FIXED) {
> > +			dev_warn(drm->dev,
> > +				 "[ENCODER:%d:%s]'s bridge does not 
> 
> provide bus format, assuming
> > MEDIA_BUS_FMT_RGB888_1X24.\n" +				 
> 
> "Please fix bridge driver by handling
> > atomic_get_input_bus_fmts.\n", +				 
> 
> encoder->base.id, encoder->name);
> > +			bus_format = MEDIA_BUS_FMT_RGB888_1X24;
> > +		}
> > +
> > +		if (!format_set) {
> > +			lcdif_crtc_state->bus_format = bus_format;
> > +			format_set = true;
> > +		} else if (lcdif_crtc_state->bus_format != bus_format)
> > {
> > +			DRM_DEV_DEBUG_DRIVER(drm->dev, "inconsistent
> > bus 
> 
> format\n");
> 
> Is there another way to know the actual reason the atomic_check
> fails? Maybe 
> this is worthy to be an error message instead.

No, I don't think there is any other way.  -EINVAL is what we can tell 
userspace about the reason why the atomic check fails, plus the debug
message if userspace wants to look at it.

Error message is not appropriate here.  Userspace supposes to try
another combination of output modes and hopes it passes atomic check.
We don't want to give too much error message to userspace.

Regards,
Liu Ying

