Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1DD697503
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 04:44:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E410E105;
	Wed, 15 Feb 2023 03:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2048.outbound.protection.outlook.com [40.107.21.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 770EC10E105
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Feb 2023 03:44:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B++HkO7jxsOnW7QXRGjdIbiM8BIHo8MgJNEIRxoTUJsidUp3Yzd3n6bdn39+Dj41BYzahLqNd+pZ61nhqtqn6fzFzwW/Ay3fFK+GUSvOdkNXFMbKqg7XUW2xGdUSh3qg9Uh3ZyaGAfyiojNEAOldCXH0pdF7NkrDiR+XAyX1CK2CDruChb3qxmsh50qwZ2kK8I8BrI8+BzMLys1kTq2Lud5IF5kdpRLNinG8gfRJsudX/uT/KllBq1dcwGAjTfen5yuoKOQX9ny8EumtDO0epC3cVgxSE6OMYv41V8M3hPQeWdGcYKE9JaA5WDuV7WaiewwYBCI4BRcT7UobacdxRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vDeYa4Q5U2x8Kgqq2QXjQP5aqSLh5Er5JBnfCLmWhVY=;
 b=NcolN58AVWL6EBCbUcshRftusLcId/sFSHlXuM58v+sxJKca896j1fy7QzLM+9zBg7mUm3qhLMgu9JMtdD6Odly/c8JszZAQmcgbydr2Uj5CNJ+9C3P1ucnIvNuooT/KXtWap3GO9Qh18jP3AqhivD5g1syt8B1iXJm7Ddy12JrjVXHNSwTbhs9fIbk+dD62bpOzeXQVUWsiQwNr947gNXUZBuJKcLfv4rnWg1rgiorQ0zp53wob8PlVyDaJTp+WoTE+SHxi38RXQCYYgYLkdTBwkao7Af7zpmCsK0ZcluQlDZNueIlc1LvlWs89/Q3XD3p7gLmTs0+hF+UhIe177Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDeYa4Q5U2x8Kgqq2QXjQP5aqSLh5Er5JBnfCLmWhVY=;
 b=YmPol2IENPm12ll3OIuiLWk6dOm4T3JqDn90ugcg7QQVTXMZZpw7AsTDmT+4egOFZFzna0BpdWAqwc/daJtn1wl+mHMiLHH13m7eFNjHmY9fW3wB2DR1EQQJ3d2dllxLrHCVqY0NazhTqA20mXc0Zgy/XMuHnHmXB1U7s7Lfut8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7552.eurprd04.prod.outlook.com (2603:10a6:102:ec::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Wed, 15 Feb
 2023 03:44:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::5725:92ec:f43e:f5fc%9]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 03:44:46 +0000
Message-ID: <444ef7e5cf1e6b046a2a7a7d1c152eb0bc3b739c.camel@nxp.com>
Subject: Re: [PATCH v3 3/6] drm: lcdif: Determine bus format and flags in
 ->atomic_check()
From: Liu Ying <victor.liu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Feb 2023 11:44:15 +0800
In-Reply-To: <1755644.VLH7GnMWUR@steina-w>
References: <20230213085612.1026538-1-victor.liu@nxp.com>
 <20230213085612.1026538-4-victor.liu@nxp.com> <1755644.VLH7GnMWUR@steina-w>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:4:196::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ebf298-02d2-40d7-0e4a-08db0f06faed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BOB+Kh0j2dhNFJGBVWWG4hK5GQA1LnVsDVvnJNT5NNeUYvvvZHguG4lqILkXfUI0TzOxvlhu5Hk+4iZCHYfT2iNeaXavSK1cqOcoVbz1SRtcV4gNeVjnwSVdw+ITJASb3dzz2KNxXbHgOLjeNEN1V4AfxcL3MQoDfMwbvF/W1LtFNb0XPOO8b3SEImJUD6hf0/AGiN10pdABsTqaifj/w4eK96LL/eOZ/T2zVDqZl772VweJ5uZdd9oQfE8dZHHJ2H4FkfmjHydilRU4jIyXlr7XP6PyVbCdajnq5K39JY96K3qyydnebHmiBRbCcwHhDejcyFq0XQuGW0RKu5GymBRBD2NIKKFh9raLg1dHQWnIJfNfzsZoYJTEUgf0BODGXzw4TcWnZNqjbeZYvRoo13JGgIc0IvGFIf2onqh1iokARyDIYhkMLhQnGJHUuIlWdFYOjBc1cwilS2Pw3zNSObc6pNpD6+RE91CoVScEI1t4gkoM7JXm+Qx8iB2LlinEm+vfmUb6IfTL+7Pk3E/hmVXv1pD05qFzE5QPNrzOEkNBrOhBNOwv4o7asFWfYMZy+X4BOWq7UFctuo7zV9hknrb7lTmprZKACHydC78Yd2qpMiG6CoGDMm2/S5fb2qRHteOVCCzsF6iqAsiNpl9P/gWB5VpiZ4B1rd6UsX0guGTqRFEfEYZgSqzpSyzDmD2W4rmiRJM+W3EClfs2dhqZZVuHTKwHDmP+1zp7m4UPli0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(376002)(346002)(39860400002)(396003)(451199018)(5660300002)(7416002)(2906002)(41300700001)(66556008)(316002)(4326008)(8936002)(52116002)(6486002)(478600001)(66946007)(66476007)(83380400001)(6506007)(2616005)(6666004)(26005)(186003)(6512007)(8676002)(36756003)(38100700002)(86362001)(38350700002)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2F6T0tGWDZ1aEhEMDlkWEdMQVZEanl6NENpTmRqWVA1RUlkVTA4T3FDS01U?=
 =?utf-8?B?RHg4UFY1bVFEZmlnN0hsRSs0VXZLazFzRXRsMk9nMDZpNllBc3J1N0JrVWZt?=
 =?utf-8?B?dmwydER1L0RKVHJld0NiKys4TGcwdlgwWW9zRXU1bC9uV0tWbTgrTDJ0bjdD?=
 =?utf-8?B?eWhBd0QwclRTWk5QMEt2SnY4ZSsyQS83MlBMSGowL0tIb3pPVzJUSUFJM2JF?=
 =?utf-8?B?Z3pMYWI1NXFhVTBkNnNPYXlyYWdIQkF2MGR0Y212bEMrb2NZS2c4NnlVOWpH?=
 =?utf-8?B?UEQwb0ovNUhub2tvNmNCcklXNTNpWEwyMGJRV05maEh6V0szUlRxUTFHenhk?=
 =?utf-8?B?anVmRU9XU0hhTFhEUUU2dG1aWkRwRndZb211NEVYU1UwWEI5MW5pWXZCb2dI?=
 =?utf-8?B?dEludkptU09ocjZKK3E5WmN0bDRGN0RCZ215UjJLdVU4ZTJ6Yno3dVJnQ1NR?=
 =?utf-8?B?QUNJbElXakZiZ2dUVnlmQk51WkRhWXB6YzVVdm5yaXg4WTZzblN1ZEdGVHBq?=
 =?utf-8?B?VGI1U01lVzhHKzloRmNCUzVKU2hMR1J6cFl4MHluNWNSaDhSRDJkeGlkMnd6?=
 =?utf-8?B?anlQWm1iSEpxRG5Ba1g1Y1U2TFkxSWMrcXZuN1UwOEdpQkV5c2g0Snc1cXh3?=
 =?utf-8?B?OUtwaVR0Wko3eldWOTRxYlBpVVllVXdPbmV2Q1I3Nm1idGM3WWVGT1RZWksy?=
 =?utf-8?B?TE0vZXhpQlJGbHZqTFozZFhBNkxSeGpsNkpGemFhL1lCMGJad29Lc1RsZE5o?=
 =?utf-8?B?WjR6MU5TdzVDejRCMitGck1DeHhCY2s1Y1ZFdGdaYmwxQ2V5L3Q3dlQ1dDFE?=
 =?utf-8?B?czFhMHJwSS9Cc2FIdHl0SCtsNyszUVRLWGk2bmQyQTFFU0NLZEFoRk9sWitK?=
 =?utf-8?B?eHh4Nmc3bU5oZGQwR3JHQTMvenBZQXR6NU91SEQ1RDlOUzZoclQ2TGZPK3p6?=
 =?utf-8?B?aDRBallJUzBzc3FycWVuTE9USzVJN1BPdkFSckNHTWxqOHVFT2dyTHF1aHho?=
 =?utf-8?B?WHl6WFY5alF5N1phZTg2U1BRTm5SMzRKSWRISitNVVBLM0ZLS3BseFFxQ3dU?=
 =?utf-8?B?aWxNbGt5SDYzdFdzdFIzZFdFbi9pNGpiMWNXRzEybGY2Y25BV1JHV3dkd0Zt?=
 =?utf-8?B?QkRJZEZ3UWtsQnJxSzRrYzNjeFdoaWtyOTYzY0JWV25YNTRISCtXVGllYllU?=
 =?utf-8?B?cTFaRzNtQWgrVEloTnI1L2pTRmRpTDJKaHVnNHFuWUt6QWZ5bkVmcUxVa3Rl?=
 =?utf-8?B?c3VXL0x2UzN3S3I5Zkg1bWdiRXllQjdGZGlYdnc2V0hiZXJGY2NZWnZTbmhv?=
 =?utf-8?B?RVM4UElNQjJvbjY5dnBlKzlObnhMZHdYK1pxU0RRQUZzSVZVRDZnTERZZlYw?=
 =?utf-8?B?T2RVUm4xaUlsQjUwWXBWdERLTXoyVkVoWHVPajNoS1lNQmt3ODVScjU1aHFW?=
 =?utf-8?B?dXNqQUpGN0lZdEhzV3BxZU54bkRYQS9iVEJuZ2hKOTVFNVU1WDNsZ0EwNHFp?=
 =?utf-8?B?Ym9vQnZIdTZVMEJJdWp0NUZDb3ZYTm1zcFI1TmJ1RC9odEoyNXVwdTFyWnU1?=
 =?utf-8?B?bkVtc1Jxc0U5LzZuVml5d2ZnQklMR3B3ZDFyYVhRaDBkR1ZYcDRVa28yTExU?=
 =?utf-8?B?MmpnNWMvSzRHK1pZNXFhNTZMWHBuUHc1NFhPY09JbW1HWjRGVGl1ZmxRLzFW?=
 =?utf-8?B?bUZ2UWlNUm1pWWZrOTNTanhnZVEybVJoeEp1bEVHbVM5eTd4ZUhDYlExZk93?=
 =?utf-8?B?KzNaYWdsbEdMSlJLdTA4VnZTMHhtQjY4M0NHUkU3S3FvVkxZSng4UjRNd2lo?=
 =?utf-8?B?TFlXYU95TlRhVks1V2NaSEx0Y1NpZXA5WC8zdkluMllsRWYrZGs3YXhvWnk5?=
 =?utf-8?B?UU4xZlZlc1JncTlKcGZBQk94ZFcrdElMaUxoNDJCajJzaEZsOVRMRjF0QSsr?=
 =?utf-8?B?QmxTUWRLUnVPNnpyejB3RVVQcnZqTTJPYXB4b09GdkpnL0c1VTNEOElsbDdK?=
 =?utf-8?B?ZTJVMFFmQXlrK2NYNEdYVDA4K200eTdlMTkwWUJMNWN2Q1E4TC96QkRvdnJ0?=
 =?utf-8?B?a2ZOc0VDbm1EMEF3dWt4RitRYU1yNWEyTmdLa2ZsZkM0ZTA2WjZ1Z2FYUVBX?=
 =?utf-8?Q?pQkHocyFx9ETktgE/ueDT0HDk?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ebf298-02d2-40d7-0e4a-08db0f06faed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 03:44:46.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AwV9ZP34/h+1Nj2p2nldM8OSj5zNV3cD81grFZaL7yG/6kPv/DJX5UuVonk8Ur/NWzJo9nEXRPW2L/Hf8Ke8Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7552
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

On Tue, 2023-02-14 at 15:12 +0100, Alexander Stein wrote:
> Hi Liu,

Hi Alexander,

> 
> thanks for the update.

Thanks for your review.

> 
> Am Montag, 13. Februar 2023, 09:56:09 CET schrieb Liu Ying:
> > Instead of determining LCDIF output bus format and bus flags in
> > ->atomic_enable(), do that in ->atomic_check().  This is a
> > preparation for the upcoming patch to check consistent bus format
> > and bus flags across all first downstream bridges in
> > ->atomic_check().
> > New lcdif_crtc_state structure is introduced to cache bus format
> > and bus flags states in ->atomic_check() so that they can be read
> > in ->atomic_enable().
> > 
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > ---
> > v2->v3:
> > * No change.
> > 
> > v1->v2:
> > * Split from patch 2/2 in v1. (Marek, Alexander)
> > * Add comment on the 'base' member of lcdif_crtc_state structure to
> >   note it should always be the first member. (Lothar)
> > 
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 138 ++++++++++++++++++++++--
> > ------
> >  1 file changed, 100 insertions(+), 38 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > b/drivers/gpu/drm/mxsfb/lcdif_kms.c index
> > e54200a9fcb9..294cecdf5439 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -30,6 +30,18 @@
> >  #include "lcdif_drv.h"
> >  #include "lcdif_regs.h"
> > 
> > +struct lcdif_crtc_state {
> > +	struct drm_crtc_state	base;	/* always be the first 
> 
> member */
> 
> Is it strictly necessary that base is the first member?
> to_lcdif_crtc_state() 
> should be able to handle any position within the struct. I mean it's
> sensible 
> to put it in first place. But the comment somehow bugs me.

The comment was added in v2 to make sure to_lcdif_crtc_state() work ok
when a NULL pointer is handed over to it.  The NULL pointer worries
Lothar a bit as we can see Lothar's comment for v1.

> 
> > +	u32			bus_format;
> > +	u32			bus_flags;
> > +};
> > +
> > +static inline struct lcdif_crtc_state *
> > +to_lcdif_crtc_state(struct drm_crtc_state *s)
> > +{
> > +	return container_of(s, struct lcdif_crtc_state, base);
> > +}
> > +
> >  /*
> > -----------------------------------------------------------------
> > ----------
> > -- * CRTC
> >   */
> > @@ -385,48 +397,72 @@ static void lcdif_reset_block(struct
> > lcdif_drm_private
> > *lcdif) readl(lcdif->base + LCDC_V8_CTRL);
> >  }
> > 
> > -static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private
> > *lcdif,
> > -				     struct drm_plane_state 
> 
> *plane_state,
> > -				     struct drm_bridge_state 
> 
> *bridge_state,
> > -				     const u32 bus_format)
> > +static void lcdif_crtc_mode_set_nofb(struct drm_crtc_state
> > *crtc_state,
> > +				     struct drm_plane_state 
> 
> *plane_state)
> >  {
> > -	struct drm_device *drm = lcdif->crtc.dev;
> > -	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> > -	u32 bus_flags = 0;
> > -
> > -	if (lcdif->bridge->timings)
> > -		bus_flags = lcdif->bridge->timings->input_bus_flags;
> > -	else if (bridge_state)
> > -		bus_flags = bridge_state->input_bus_cfg.flags;
> > +	struct lcdif_crtc_state *lcdif_crtc_state =
> > to_lcdif_crtc_state(crtc_state); +	struct drm_device *drm =
> > crtc_state->crtc->dev;
> > +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
> > +	struct drm_display_mode *m = &crtc_state->adjusted_mode;
> > 
> >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual:
> > %dkHz)
> 
> \n",
> >  			     m->crtc_clock,
> >  			     (int)(clk_get_rate(lcdif->clk) / 1000));
> >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Bridge bus_flags: 0x%08X\n",
> > -			     bus_flags);
> > +			     lcdif_crtc_state->bus_flags);
> >  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m-
> > >flags);
> > 
> >  	/* Mandatory eLCDIF reset as per the Reference Manual */
> >  	lcdif_reset_block(lcdif);
> > 
> > -	lcdif_set_formats(lcdif, plane_state, bus_format);
> > +	lcdif_set_formats(lcdif, plane_state, lcdif_crtc_state-
> > >bus_format);
> > 
> > -	lcdif_set_mode(lcdif, bus_flags);
> > +	lcdif_set_mode(lcdif, lcdif_crtc_state->bus_flags);
> >  }
> > 
> >  static int lcdif_crtc_atomic_check(struct drm_crtc *crtc,
> >  				   struct drm_atomic_state *state)
> >  {
> > +	struct drm_device *drm = crtc->dev;
> > +	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(drm);
> >  	struct drm_crtc_state *crtc_state = 
> 
> drm_atomic_get_new_crtc_state(state,
> >  								
> 
> 	  crtc);
> > +	struct lcdif_crtc_state *lcdif_crtc_state =
> > to_lcdif_crtc_state(crtc_state); bool has_primary = crtc_state-
> > >plane_mask
> > &
> >  			   drm_plane_mask(crtc->primary);
> > +	struct drm_bridge_state *bridge_state;
> > +	struct drm_bridge *bridge = lcdif->bridge;
> > +	int ret;
> > 
> >  	/* The primary plane has to be enabled when the CRTC is active.
> > */
> >  	if (crtc_state->active && !has_primary)
> >  		return -EINVAL;
> > 
> > -	return drm_atomic_add_affected_planes(state, crtc);
> > +	ret = drm_atomic_add_affected_planes(state, crtc);
> > +	if (ret)
> > +		return ret;
> > +
> > +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> > +	if (!bridge_state)
> > +		lcdif_crtc_state->bus_format = MEDIA_BUS_FMT_FIXED;
> > +	else
> > +		lcdif_crtc_state->bus_format = bridge_state-
> > input_bus_cfg.format;
> > +
> > +	if (lcdif_crtc_state->bus_format == MEDIA_BUS_FMT_FIXED) {
> > +		dev_warn_once(drm->dev,
> > +			      "Bridge does not provide bus format, 
> 
> assuming
> > MEDIA_BUS_FMT_RGB888_1X24.\n" +			      "Please
> > fix 
> 
> bridge driver by
> > handling atomic_get_input_bus_fmts.\n"); +		lcdif_crtc_stat
> > e-
> > bus_format =
> > MEDIA_BUS_FMT_RGB888_1X24;
> > +	}
> > +
> > +	if (bridge->timings)
> > +		lcdif_crtc_state->bus_flags = bridge->timings-
> > input_bus_flags;
> > +	else if (bridge_state)
> > +		lcdif_crtc_state->bus_flags = bridge_state-
> > input_bus_cfg.flags;
> > +	else
> > +		lcdif_crtc_state->bus_flags = 0;
> > +
> > +	return 0;
> >  }
> > 
> >  static void lcdif_crtc_atomic_flush(struct drm_crtc *crtc,
> > @@ -458,35 +494,21 @@ static void lcdif_crtc_atomic_enable(struct
> > drm_crtc
> > *crtc, struct drm_atomic_state *state)
> >  {
> >  	struct lcdif_drm_private *lcdif = to_lcdif_drm_private(crtc-
> > >dev);
> > -	struct drm_plane_state *new_pstate = 
> 
> drm_atomic_get_new_plane_state(state,
> > -								
> 
> 	    crtc->primary);
> > +	struct drm_crtc_state *new_crtc_state =
> > drm_atomic_get_new_crtc_state(state, crtc); +	struct
> > drm_plane_state
> > *new_plane_state = drm_atomic_get_new_plane_state(state, +		
> > 	
> 
> 							
> > crtc->primary);
> 
> While the rename to 'new_plane_state' makes sense, this is an
> unrelated 
> change.

I'll use 'new_pstate' and 'new_cstate' in next version. 

> 
> >  	struct drm_display_mode *m = &lcdif->crtc.state->adjusted_mode;
> > -	struct drm_bridge_state *bridge_state = NULL;
> >  	struct drm_device *drm = lcdif->drm;
> > -	u32 bus_format;
> >  	dma_addr_t paddr;
> > 
> > -	bridge_state = drm_atomic_get_new_bridge_state(state, lcdif-
> > bridge);
> > -	if (!bridge_state)
> > -		bus_format = MEDIA_BUS_FMT_FIXED;
> > -	else
> > -		bus_format = bridge_state->input_bus_cfg.format;
> > -
> > -	if (bus_format == MEDIA_BUS_FMT_FIXED) {
> > -		dev_warn_once(drm->dev,
> > -			      "Bridge does not provide bus format, 
> 
> assuming
> > MEDIA_BUS_FMT_RGB888_1X24.\n" -			      "Please
> > fix 
> 
> bridge driver by
> > handling atomic_get_input_bus_fmts.\n"); -		bus_format =
> > MEDIA_BUS_FMT_RGB888_1X24;
> > -	}
> > -
> >  	clk_set_rate(lcdif->clk, m->crtc_clock * 1000);
> > 
> >  	pm_runtime_get_sync(drm->dev);
> > 
> > -	lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, 
> 
> bus_format);
> > +	lcdif_crtc_mode_set_nofb(new_crtc_state, new_plane_state);
> > 
> >  	/* Write cur_buf as well to avoid an initial corrupt frame */
> > -	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> > +	paddr = drm_fb_dma_get_gem_addr(new_plane_state->fb, 
> 
> new_plane_state, 0);
> >  	if (paddr) {
> >  		writel(lower_32_bits(paddr),
> >  		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
> > @@ -520,6 +542,46 @@ static void lcdif_crtc_atomic_disable(struct
> > drm_crtc
> > *crtc, pm_runtime_put_sync(drm->dev);
> >  }
> > 
> > +static void lcdif_crtc_reset(struct drm_crtc *crtc)
> > +{
> > +	struct lcdif_crtc_state *state;
> > +
> > +	if (crtc->state)
> > +		__drm_atomic_helper_crtc_destroy_state(crtc->state);
> > +
> > +	kfree(to_lcdif_crtc_state(crtc->state));
> 
> Shouldn't this be just
> if (crtc->state)
> 	crtc->funcs->atomic_destroy_state(crtc, crtc->state);
> 
> similar to what drm_atomic_helper_crtc_reset is doing? This will
> eventually 
> call lcdif_crtc_atomic_destroy_state().

I think you are right.  But, instead of calling crtc->funcs-
>atomic_destroy_state(), I would call lcdif_crtc_atomic_destroy_state()
directly, which looks simpler to me.

> 
> > +	crtc->state = NULL;
> > +
> > +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> > +	if (state)
> > +		__drm_atomic_helper_crtc_reset(crtc, &state->base);
> 
> Is there a specific reason to not call this helper when
> 'state==NULL'? 

Yes, when 'state==NULL', &state->base would de-reference a NULL
pointer.

> drm_atomic_helper_crtc_reset() does call this even when passing NULL
> for 
> crtc_state.
> 
> > +}
> > +
> > +static struct drm_crtc_state *
> > +lcdif_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
> > +{
> > +	struct lcdif_crtc_state *old = to_lcdif_crtc_state(crtc-
> > >state);
> > +	struct lcdif_crtc_state *new;
> > +
> 
> drm_atomic_helper_crtc_duplicate_state() has a check for
> if (WARN_ON(!crtc->state))
> 	return NULL;
> 
> Maybe it should be added here as well. But then the call to 
> to_lcdif_crtc_state() has to be moved down.

I'll add the check in next version.  But, to_lcdif_crtc_state() doesn't
have to be moved down even if crtc->state is NULL, because 'base' is
the first member of struct lcdif_crtc_state and it's safe.

Regards,
Liu Ying

