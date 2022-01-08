Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5774880CE
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jan 2022 03:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBA810E22D;
	Sat,  8 Jan 2022 02:07:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr20066.outbound.protection.outlook.com [40.107.2.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B5B10E22D
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jan 2022 02:07:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dE0Bjyw072d9vPbFGeJKNxHeoDTpLQg5XpMIRP+GjhtNZRcOpZSESPsqDY1+mo05opIlpaA0TTNVBzhlYflVSp3sukOdtEcnMS9BLS3z3NROVPuAuONgorygZGVWsBKViB0XtEcmNlVKHBuIVFnT/YV3YeFlfm0SHxIhbobczDUhhbGj6ZZ5gg5J6cA9Gtk78M2MQkWtMgPC8lWmZGInTGoWO36UPYF7MTVSjqq6FdPybmCP2uisfX+1Ga6hf0PJJXCQwzPwJPhoqeMxSgqGi5pFtPvk58bF03XeY/HOXWHcekrVY0Qkr87AgdpCh4XyG6z6Duy+Px3LCz0N78mEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+scWIVR4jHo3y3nIzStTpCKFaaHWUnRMm0OP670WJO0=;
 b=eidcgC1yQOHB6PEFQYEVEXhNjKSTkAXpXg/H3ZW0IzwOOd+uYKpCfJrpDnwYQKGBHp4HexYS1Pol/wBrGrmeczFLocUjpWPGCYMhkJzKfMVmobS6hsoO3iQCYpy5EAOFD5JVCPMmo3zHGgJ+K8cMOs+ZkcBXRPW/ySuHc24J4oV2Hxy7cKMXHLP3UutZuVqOWTZAzKjPiMqu1Ccn2MVwwqjyWmXPlfiVBCIU4CIDbrQWLswC7u9rCGnToFkzEzcP6QxPgnxOtM99iDJkGhscqhT4+6J20b8MYTa/GP2RJiMmekbec64AWDhr+t6d3m7F44xZazGKHCmuRzeRoO7+aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+scWIVR4jHo3y3nIzStTpCKFaaHWUnRMm0OP670WJO0=;
 b=AK7/sQgWpYQ4ikX5YzdxBUWGDazfFwOSf67JN+OOkl5g0EYF83RrgIwcCtqK9aAtDWu2musE5x+GzdcWCbDJjsHo5sJDxlAhcLMZkxfmFVnMI5aJxdeXVAkHDxWEr26x/9CSINmkW2xWFMD2ZhZEE3ICi7qn+vOTARsuNAEjFyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM7PR04MB6871.eurprd04.prod.outlook.com (2603:10a6:20b:109::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Sat, 8 Jan
 2022 02:07:39 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4867.011; Sat, 8 Jan 2022
 02:07:38 +0000
Message-ID: <d4ae974f38d96bc02db6c137e622315388a99ba0.camel@nxp.com>
Subject: Re: [PATCH] drm/atomic: Check new_crtc_state->active to determine
 if CRTC needs disable in self refresh mode
From: Liu Ying <victor.liu@nxp.com>
To: Alex Deucher <alexdeucher@gmail.com>
Date: Sat, 08 Jan 2022 10:07:10 +0800
In-Reply-To: <CADnq5_PsxrYeZ+p5NbXRks3EaJrYNMN+vbUJkiKHZ4cf=x=dsg@mail.gmail.com>
References: <20211230040626.646807-1-victor.liu@nxp.com>
 <CADnq5_PsxrYeZ+p5NbXRks3EaJrYNMN+vbUJkiKHZ4cf=x=dsg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: HK2PR0401CA0017.apcprd04.prod.outlook.com
 (2603:1096:202:2::27) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 330d50a9-f640-48f8-8bf3-08d9d24ba540
X-MS-TrafficTypeDiagnostic: AM7PR04MB6871:EE_
X-Microsoft-Antispam-PRVS: <AM7PR04MB6871B866A78B22C773FFAD4C984E9@AM7PR04MB6871.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rKq59lnBM/WwazkOr5P9JGpO6e1gjuZ7TFbYsG0B1Py/xNV9QFUdneuLYIXocNCvtvBnTa+4uoZbTZbBMxGuNnK2xTcuY/TbzGgd5s17qFyo2GWA7uek6S67xLamcpRW2LhFvQ/4FscJMreR3EP9Nv+h7uWsnfvX5yRO6p+cWQk0E+AzEApJ3AcpQa0N0KV5/rWsgy6jik1WLSODR+DZnsXCpPqfdr3Ad1jtyhQvYl9EmdxS6zrC7esRfePNeDboK0P6MtsH0Aji4H6FV3PqqGTvRPxNHgpE1a3iBQLEC0Djvvvr6lIeQc/TdtSvoxxIFMqxe/+bg2f6u7mwq2sb8v8SK+O3Dh8p1XUdzXdYTbrsfNuAZJAYdQfTR4VL2p0x8UUdOzxOxIjA11oGXZEn25UJvZ8bmweDKt/YV1Inqh2Mx7HCjP3sKC6E/o+bkv+7Ggp8xCGVcyEgvyeLZuhGaIvazqyNU+cVYgDMOj+sTx6D/ZQrqgwKNr8ffRhJqKaRr+eIu3YeWFT775hKyFiQoj3STio8FZJ4aj9ub/fCBGCIyKPrQ6dIMifkmXXQ7NrjUspAvb8Bh9lpn2dKDomoCu+OJbrtYKX1+hp6ZAC2yCz8TfX6+uQlpwkssLo5YJjMeNCHrFgL5rIjo5XKJdivtcBSBUIbXhPxmdvR1T7Q90NsTcQKF6Act+wjmPHL0kPXlMS5ww+NB2Ux+qkVbxAsUyCH2z0FyMUFvRLg+oSHk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(5660300002)(316002)(186003)(38100700002)(38350700002)(6486002)(86362001)(26005)(2906002)(6512007)(508600001)(83380400001)(6916009)(8936002)(36756003)(53546011)(6506007)(8676002)(66946007)(66556008)(4326008)(66476007)(2616005)(6666004)(54906003)(99106002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXFIUzNQQ0VnOTlXcjJKT2o5cnVtYUR1a1VvbmRoTHBBb090WkFrWjgzYS92?=
 =?utf-8?B?d3dTdWVoRUpiTTdpaEcvMlBTSTJ6SEN5SFZMS0gzempld0FpVEN1RjVNM2Fn?=
 =?utf-8?B?TVJxK2pvblZ4S0lyVjJMbXh1Q2xCTy9zTktPbnQ4UWFqd2lnUlFwWEJJZ1Z2?=
 =?utf-8?B?UnpkZVd1RWNId2tuNWNEMzRrT1BvK3hBWXpob2NLQXhpMWNvTFRrc1RsSnE4?=
 =?utf-8?B?a1BicGEvc3F1YUJGbkEvZE9GM3pwV2F3THFGcTZaMmVrak1xOXNSQ3ZsWThV?=
 =?utf-8?B?MGJZUS9xQ2tYU3ErR3IxK2JpMWtMUjV6L1l1Z1NHU3dxVGtxQkM1Z09LeTky?=
 =?utf-8?B?eGs1L0E1ZWl4ZjFiUVZ2dDUzbFoyOTlRV0hxVDN2UjVVNjNWdGxscEx0M29I?=
 =?utf-8?B?NVY1NCtsVU14Y2xKSUZKcnk4YllmMUtSL0I5dEpTRmVTNHJpT2FjUTc2aldw?=
 =?utf-8?B?UmREc1VXYTAvVHpzK3IvVlRpWkczK0dmeXdHM3NnRm05RStiQjZ1akFHRW1T?=
 =?utf-8?B?V25SZ2ltYlA2amN2UW1oOWNvOHRIWkpvUDBCc1RiK2E2ZnNzT3Z2VnV6Q1dq?=
 =?utf-8?B?cFJNTldYSzYyRmx4cExSeldoSzM2TXkvNXNEVDFWTm1YUnBRdnRUTlQ3WnMr?=
 =?utf-8?B?ZHJhQ3A2MnNnZGRGZTlPL1FnaFV5SlgybWNFTVZOUDR5cVI0VnpiUGYzcWNW?=
 =?utf-8?B?T1pTWHBrbW5TSFkvTGJ5VWpTQ3ltdmkzQXF3QVRrZkUyV1U4aXFyMDNJWnln?=
 =?utf-8?B?d2NyRWtJZUZObCtVTmRMRUtyMSswMFdjelJkdWVqNFMwT0FuRFRHVG96eVhp?=
 =?utf-8?B?MXAzRlorSnNtTVpuN0tmdk9mYW1jYkFnMXl6TmUyRHZxaGRsY2E2Zm5XcWlK?=
 =?utf-8?B?K2I4VUdJUjNSaEJpU29VSXJmTERtd0VaS3g2cnpMRDgxcEtPYUlDb3E4VVky?=
 =?utf-8?B?RkwvRUFJdnRVelFvNkNnTExnM0V0WjMrdHVycWk5RldsWDNGZ0gzWVRVL3A3?=
 =?utf-8?B?Mml0Rks5eVJsM29HUStNSEhNeVZTVzJ4c2VxNEdkZXZrK3RiU2VDay9FY2d0?=
 =?utf-8?B?cUFBdHZiaHd0UW1DY2orSW5weGVETkRhbVh0UnI1S3A5dTBpM2d4dUZ6Tk80?=
 =?utf-8?B?ZEtET1lnVkVXVUxESHhsL0JZNlhjYk8vc2Q5dmJiT3llYUNOamVuTHhOVnlw?=
 =?utf-8?B?cjRoUTVwR2JvbUltOWVzSWtVbUVpczB0eFdidkRhSk5tVHVMdjJFL2tQdk1Q?=
 =?utf-8?B?QTJreTh0MjhHbkdjZ2dPSnBjbzdSSFNvb2tJUnVUa0k5TVhuYjY2SmdGbDho?=
 =?utf-8?B?cFV2QlRDVDhWcjkyY2Nkc1BlaFJRRk1pdXdBenZGZTJMZlNrbnJwYk8wdzli?=
 =?utf-8?B?ZWh0WkdsanJBV2l6RlZXeDdTWVhaSjNRcE9RQ1U1S2JnRTFqTjZKSnZQeVVu?=
 =?utf-8?B?K3kwWXFNRUU5eXB6ZVZiTDdFQkIwYzFCSGdQS0ZLbzkyaExGcThZdUR0MXZT?=
 =?utf-8?B?L2FMOThuQ1NIR2M1eGFLNWJINy9PWmpvMS9tSzBWeE9TNGx6WFRQSVQ0L2sy?=
 =?utf-8?B?VmpBZFpvVW1YeGlIREhGUmlrT0xocFJoL1hla3BrNlJPRGpWMGh2aDY4S2lw?=
 =?utf-8?B?L3h2UXZKM2xLa0xPaUVoWUREc1A0MytYbTBFalNDMTRVY2RHZDZMZ3I2eUtH?=
 =?utf-8?B?aEZPVUQ5dzN2Tjc5dlZsWlZxNFFUR3cyZG1iajlOUFVxVTk2dXJoR1M4N25R?=
 =?utf-8?B?OGxtV1drdDcrV2x2OWtRTHVnUVYwZGlOK2gwT2xFZ0RNTjlQRC96RjdOTHFB?=
 =?utf-8?B?SGYxKzVyVWJUK1lZWUl2TkF0SjM0YWgwSDk3REpNbVR0ZWRYREtsWmxBZjFp?=
 =?utf-8?B?ejRkU3ZoTm9maERhTEpjeDlZcFFkS3FpZEFNL2xweTV2SzJJMFh4RjBXWGow?=
 =?utf-8?B?enQwNHFFOEtjVjFJdTA3VnBPNHo1b0JpT3R3d1lQNlc1T0ZXck9LWmR4ZHlO?=
 =?utf-8?B?TVl0dy96VkRWVEFiSVY4dENybjdEVWp4cXlTZXZqZXMxOHNoSWV2K2NPNHly?=
 =?utf-8?B?blNnTkdFT2hSQWxndEk4QTM5ZW9LSVBoUE9KUDFaSUpIMnY0RDFiMWhjejdv?=
 =?utf-8?B?NkF6bWRjbmxENzBMektqQWVWZzhMOVVmbGo4VlJOT2ZTOTBIVGJVWDMyeDNq?=
 =?utf-8?Q?Or3qLC4DHnj03Pz/Nhgyixk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330d50a9-f640-48f8-8bf3-08d9d24ba540
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2022 02:07:38.8205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Rorh/o5098AzeKVsoUeCZp5cJCRKBO7CL+3OjFuPPJ2SRwT1LDIlrXRWeDDLTr9F6OfU5+I2VQ7cnrm5ajXmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6871
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, NXP Linux Team <linux-imx@nxp.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-01-07 at 14:53 -0500, Alex Deucher wrote:
> On Wed, Dec 29, 2021 at 11:07 PM Liu Ying <victor.liu@nxp.com> wrote:
> > 
> > Actual hardware state of CRTC is controlled by the member 'active'
> > in
> > struct drm_crtc_state instead of the member 'enable', according to
> > the
> > kernel doc of the member 'enable'.  In fact, the drm client modeset
> > and atomic helpers are using the member 'active' to do the control.
> > 
> > Referencing the member 'enable' of new_crtc_state, the function
> > crtc_needs_disable() may fail to reflect if CRTC needs disable in
> > self refresh mode, e.g., when the framebuffer emulation will be
> > blanked
> > through the client modeset helper with the next commit, the member
> > 'enable' of new_crtc_state is still true while the member 'active'
> > is
> > false, hence the relevant potential encoder and bridges won't be
> > disabled.
> > 
> > So, let's check new_crtc_state->active to determine if CRTC needs
> > disable
> > in self refresh mode instead of new_crtc_state->enable.
> > 
> > Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh
> > mode in drivers")
> > Cc: Sean Paul <seanpaul@chromium.org>
> > Cc: Rob Clark <robdclark@chromium.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> 
> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
> 
> Do you need someone to push this for you?

Yes, please.  Thanks.

Liu Ying

> 
> Alex
> 
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c
> > b/drivers/gpu/drm/drm_atomic_helper.c
> > index a7a05e1e26bb..9603193d2fa1 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1016,7 +1016,7 @@ crtc_needs_disable(struct drm_crtc_state
> > *old_state,
> >          * it's in self refresh mode and needs to be fully
> > disabled.
> >          */
> >         return old_state->active ||
> > -              (old_state->self_refresh_active && !new_state-
> > >enable) ||
> > +              (old_state->self_refresh_active && !new_state-
> > >active) ||
> >                new_state->self_refresh_active;
> >  }
> > 
> > --
> > 2.25.1
> > 

