Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D4385CA52
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 23:03:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B9610E583;
	Tue, 20 Feb 2024 22:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlZ8dFv3";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E7910E57F;
 Tue, 20 Feb 2024 22:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708466613; x=1740002613;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=JHhs8Qr5IVZvRDgQUhSn+X3bZWAo3ocw2ZY/BwMjD18=;
 b=FlZ8dFv3Md4fAVf0Wgrc5zj94+R6G/v1OM34bN7+e4EgJaiASdLSid9Z
 m9p62GPnphD8MGRzH0YI2reLCibWez0MP1x/FxDlhIPVr0ZWSVba21vhK
 OjJrbnkaC93+BJc+Cy5I+xsbDFFwp7YJ+Pe8meBZCkX8P7uQC97jNJnqh
 XJ9rZbWBGVMLXqj9CQoUdOTFj5L9S8p2P1LHbslLJJODkXA8rGnJjFe8N
 rrouVsR1thajH/oIHvffhJjB/5dQNzn5nu9g6GCh076oeiACL82KVc1Ee
 o/ImmsE8tMIzqEja5E7nsqQAXXsX0Mg2eCAGLA1nJI3hm2EDHBF18Nitr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="3070078"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="3070078"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 14:03:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="5266923"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Feb 2024 14:03:31 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 14:03:31 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 14:03:31 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 20 Feb 2024 14:03:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSzud46sMPtZXzzimN4Mky70tgchppSszYLjB6VQAhM3pDK0C86XhqcZxjfOVAbi6uXht9d38WJgdrvKH3KF2xNfcwwg0AomUiQj6GU2pExPojnR1oxtpND43yaRxCsBFRbXmyAoZZfZR7KR/UAFirytR1OmpfuTFexGKWYtBcjlD+LrCA5Sn72nUSv9xk7sRdJvINHlpGcQLqeBOPQXBjleiaEZo5iicpig4DFpLCmgLBFyPVeEvHOLDlYgx1SxkZ7grTMtCZH0KJrVveJo/h1NdA/GvNYesJPhzomBbXJidRW/8I9q8ROqNezRtyLdlBxaNAnBzQjx2KIzLjMGnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/Xk7vCZa4Lzfkv6684DUEQRxBPA+8I22i9BgrmEwNI=;
 b=WXYUi67fsxbz+0G1/1JxFa4HolH58SvYetz+Tux0B4RmM4OCSF2xuI1oZeTuNXcegK5I/sgp3Y+9Gm6lAOeo+EiSeiSEKRsiD7u3a5zfmU66QDbLGBJTqMG9TGhbMkCY/PTU81LhnMVhrrO+RcofjHr3Aw5c92u4LUisLx904jHeB19bAmpwUAFO7l1X1V0O8ojYaYdWh74tLHa/3mFzkribmei4gcRXuatsIx+ElrUqmTdJcRpdCKgoKKS90LdAwsM0LyE0j8wi2GzIcVH078aUKPkP3KqysRmI68kt1tfGcm4tQWOAPUTw4QBruJfpOj0qOAbKZ7Eo/okSu+OmJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5437.namprd11.prod.outlook.com (2603:10b6:5:398::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 22:03:29 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7292.036; Tue, 20 Feb 2024
 22:03:29 +0000
Date: Tue, 20 Feb 2024 17:03:25 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-GFX@lists.freedesktop.org>, <DRI-Devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/guc: Simplify/extend platform check for
 Wa_14018913170
Message-ID: <ZdUhrecbFSqPEZ08@intel.com>
References: <20240216183841.497768-1-John.C.Harrison@Intel.com>
 <ZdO52xFiDGrfJ_cd@intel.com>
 <2ed3c7f6-579c-4ef0-b15a-63350645ba35@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ed3c7f6-579c-4ef0-b15a-63350645ba35@intel.com>
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5437:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec96d0b-1f5e-4dc1-a906-08dc325fc500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /DLKO3qPHY+7w5YbizGVoZyco8ehP0wUQQGXilK5Jdfhsg9aiDEa664/FVsDdM6UTme8S+L8qr0Ky1q5gwfiHh6vLeUSM1N7c1vLLnX41oyLgV4KAW3KrQUGN1pk3AlUPm3blmkzIPgIHYLlKrZ6AeqiPXsy4toOAXuIKgYgXKx5Dx4VhToKpPQEiJtvHzjVTU1eLuQink4kxgzvqXD8MapgOwGVKcM9MZRaNn94LOUGlivBe4tyR1eJHLHmGm9LslttqvIyOmNVF40Zn2WBLHHN6qzi23LiFdG5rzNutwibJkAPgR9HK/OqwyPn4JWgFvBpZOadqLx2rKH29zRnQogefdIXU9kuAKVmihi/3jfgqxg0GHol5NaHyYS4LwwtmEtsAqGM0yNtitsbOGLrhPHtgWNNipnY4+TEd14zMRAPUCGvQnDZW5UdGGJ543/xfLb1u8tgXw/2c/2uJls9/ytDlRENKkjLKucygJBICxRcprqzQ11ljXnlaiEd9wjrkZGCAULZPNuaFbY6d6L2hV3OvWRoE5UzgoSpimv+oNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qmeVAgHcdZX8y8wXGfoyFZnECaLS03GCpDGBSN4NyqWYJ1cJSoNL+gkLQF?=
 =?iso-8859-1?Q?OQTWqTHLJExitl3dtkqGcKstyJTYDcdHaFsWzQeZHbkLVxMiHfryjMAjnN?=
 =?iso-8859-1?Q?wp9bEjOs2j2gz2sBlV+CUulpUINX/1qdf4cS7R/vMoc91J2graGxXjdzt2?=
 =?iso-8859-1?Q?xuVdSoJoBRlDcmCurnrMPuZ0F1ZiEZ/w+iJ2kyf+0dTVtm6hA4EDgrFRBe?=
 =?iso-8859-1?Q?IPyFjXjEjdp+Vaa5YIJLQEvsPJw+jeXo2DBypMkjQ/tRgL2/ndcX3DA3nq?=
 =?iso-8859-1?Q?RJMbdlcTMf9BFcLJ1rXQzcVE9CzKAMQ2vNHRIbaer8eoh3F4N2dyRreURU?=
 =?iso-8859-1?Q?d00cTdaKlNh4XV6zVZAwh0DBWfnyYyEsL3N5Be+noBuT462rf1NJu0pujZ?=
 =?iso-8859-1?Q?fiHtDvGCCmmLflVQd9hnTaFMdUbk2Pa54Mr1qGzXNFT28bM6vk04MgpIg4?=
 =?iso-8859-1?Q?XDreLx+Wb07e30JnN6Y+vTEbNmNg1tLG+M8+g5zA//7DQmNlHarvCqgPO7?=
 =?iso-8859-1?Q?W1PSWrwSncYbZ5gLmUlNzHnxAv9CArTuXshRNvTMLifqW6Z0hnfF43S65E?=
 =?iso-8859-1?Q?WNnEBwlJRmXvwNxzbKnt5b5RQZxZzWHSdA5q4ka8rtMdm5n/BjFlvDsofO?=
 =?iso-8859-1?Q?PCho8adHJqQBFBCcgpBzqDope1g3FC9ehyKE7FttMC56GvJxDG19RoFCOy?=
 =?iso-8859-1?Q?4oERwSxoXIrdGm70+evFLiuy5i6ZzvH+b0dStEcgPNjEV6qBN7BPuoXnB4?=
 =?iso-8859-1?Q?IBaHNrU+oJ7HbA5AxQfNrgPzFRRB6d2i0Xi6cUiyWjz363Xz+m5UPWIe/a?=
 =?iso-8859-1?Q?phn8TEFsCu/NpuUxPpWKb0boPdqkdminEl3v1gWIGX5FVU+SxPA7accs2h?=
 =?iso-8859-1?Q?ThgPqUr5Q2I5piVm+39o/unGxdC3UCUmz0Ui0TYk+p0uO6Xb09I2P1HDv+?=
 =?iso-8859-1?Q?G0QLAkQRIg/brmyVekP96BgpY7TXtPkAAjk+E67UmQy4HRP8Z3xghOBW31?=
 =?iso-8859-1?Q?RIIQeQorTvJXr+iJm2sJm192ypuC+JQBqTjpxMLWEFVBtrFSgQ63tUu4m/?=
 =?iso-8859-1?Q?WixqrfjeitUbZ7KMocIXuk6v5pmz3NRFgBqQRoMmx2Hz2gBOK+5ISJEXLK?=
 =?iso-8859-1?Q?tqdxhiuEkj6o3odOALoxk7KTq4Z4lNvNa1ZMWQDWRey/doX9jKFJNjhwSl?=
 =?iso-8859-1?Q?na0p4Yos78Y1iK+XD9TUf+GG1GjLDAql+gT0ydRhPtKM+Du1etYdoxnEvv?=
 =?iso-8859-1?Q?kZbp3XRaSxoV3rgYp0CreJxH61T4x3EXP9zOWaSPYzHjCULDmv4iTxnesr?=
 =?iso-8859-1?Q?ZBw2qEK8jStKrOiMZaD6C0cn9Oo+xVxsmwkNNAAqi9qS6Jf0J8HN28TW6r?=
 =?iso-8859-1?Q?U5NnfMLD5LhPApbtk4BuRjqtdnPaWqN9mC4RkQlTNOH6SbNHahStEKwNIc?=
 =?iso-8859-1?Q?UPL30H2hB2blyi/NSbChfXhI6uI2jxJoUGvUsZoeVZ+AEpxG5s4/Fb3En5?=
 =?iso-8859-1?Q?ts850OaSJ3xUsa7crC9CRZh0Ltir1Z1dSAL/mdXeDt2SMm4GGATWdHO30F?=
 =?iso-8859-1?Q?i1907kTCVfm4FHITfP63UOv2BChNl93jSUstxbWNh7hT/vJRpuIDH7Qqj8?=
 =?iso-8859-1?Q?6snsH7bivlXw4uIu7NwjXI7czlqH+YVCREon+HvqWEiGiyXx3H/tJo0Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec96d0b-1f5e-4dc1-a906-08dc325fc500
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 22:03:29.1563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKv9saPz07FbCNJd0EmgnMbaMMjv8exCKUleCDsUpnPkEbk+qA43U3PYHuFeG8+qDw2tWa0I+WtYst93aOkQ+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5437
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 20, 2024 at 11:52:04AM -0800, John Harrison wrote:
> On 2/19/2024 12:28, Rodrigo Vivi wrote:
> > On Fri, Feb 16, 2024 at 10:38:41AM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > The above w/a is required for every platform that the i915 driver
> > > supports. It is fixed on the latest platforms but they are only
> > > supported by Xe instead of i915. So just remove the platform check
> > > completely and keep the code simple.
> > Well, I was going to say that I would prefer a GMD version greater-than
> > check to be future proof. However if this code gets used in some other
> > new platform a new specific guc support would likely need to be added
> > as well right?
> There is no future for i915. That's the point. The only platforms that have
> the hardware fix are all ones that will only ever be supported by the Xe
> driver. So if such a platform were to be backported to i915 then there would
> be a lot more work than just adding a new GuC firmware platform.
> 
> And going backwards, the bug affects all platforms that have a GuC. So if
> any GuC code is being executed at all, then this w/a is applicable.
> 
> > 
> > Perhaps at least adding a comment in the code?
> Such as this?
>         /*
>          * Wa_14018913170: Applicable to all platforms supported by i915.

I believe only this first line would be enough. but up to you and feel free
to put my rv-b with whatever version you get.

 so
>          * don't bother testing for all X/Y/Z platforms explicitly.
>          */
> 
> John.
> 
> 
> > 
> > with that
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > 
> > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc.c | 3 +--
> > >   1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > index 2b450c43bbd7f..a3662edb42032 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
> > > @@ -321,8 +321,7 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
> > >   	/* Wa_14018913170 */
> > >   	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
> > > -		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
> > > -			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> > > +		flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
> > >   	}
> > >   	return flags;
> > > -- 
> > > 2.43.0
> > > 
> 
