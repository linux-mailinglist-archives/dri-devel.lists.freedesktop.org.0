Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE6C8A4634
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 01:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD82610E176;
	Sun, 14 Apr 2024 23:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hi4oIKgR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6F410E14F;
 Sun, 14 Apr 2024 23:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713138175; x=1744674175;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CfqXTlMPpCPf0cXCb/UGik9UiuOXQbLB/rYvpzz6rmg=;
 b=hi4oIKgRQgBU67sSlzM2V5tGoJ8lkJbe/GdJ5W4hCi98m1f8s8oUSNap
 mXi4DUvUCl8FZBaDHY2kuxjy57st+I0PwG01z9DAeDDsTKpuzm5Wg5+VM
 UtWqoXKO8jhY8q0GoDqdIlyT7tUdTNVhL4RoNM3XT7OsPjLHxyr9KTOLr
 09InvB6iIzwAPUOZqiRnWaKvUe0NhmU2V7o4HkQZX86RN3oDRgWz/cdpS
 SeLuID2g8WMjttsygYeyi3qRhWZta6e1J26Bf2tfXCEjBsWqs5JsPZ3Hw
 T5YGQZrhUOi7c3GPmBs7ZOtHEC6cZnuMU7TZwkaScXCXwpSuzc+4isXM2 A==;
X-CSE-ConnectionGUID: 0AUSt6HDR8m3ldJQMxVZYA==
X-CSE-MsgGUID: c2YYmqWESSGYikOmjsyHew==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="25973963"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="25973963"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2024 16:42:54 -0700
X-CSE-ConnectionGUID: IvhlNFRqQi+ivL2IYxQnxA==
X-CSE-MsgGUID: UapjFBPOT/ydkgwlwoU2og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; d="scan'208";a="22323225"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Apr 2024 16:42:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 16:42:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 16:42:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 16:42:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsfCupmuDMdEkbe32QXD9m3/OJdf1Oko5j5SJ/xAJf/Fmfuy+zUYfTdafcJjjgX5u1VnnBxUh3vbE8KW6JyQjfLVHvN2c5Il1GEhJ4FGxHLxL80QsO0ojk37NdhBIM/3NKsX55jPfNbAISW7c/vJKo/R0tIOxiU22QZMrZbg4raLsG+9yihe1ljucWFqakYc+A6fEtaiz6HK3kp9e0Mv2+cakuAvBDP8OgIVkuA2ZFPJhoO4NSaM39GODs/NLTqWyKJidVF8v50RlvlT6jmJvLnD3aFosbAhfoevzGKiFwJiYg+sZ77GT1Qs6L6kKjF+Qnv5IhZeotnOvPJEbZcWIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBqmYmmKzQ3kRUsgOIKpiadAgH1891ePDkx83ykHLqc=;
 b=PD5vQZLQAsY28RJ+AFBSTcyFPNJBw5UhxkYfQ5lW+kexj/ixQG3RCc8c/J3cANhXyAw9ljf1efzlDQSuBrfpGhFO+agOTv7qMee5RKpFghRZx1xfp653NACTcIcudrseCnCusdGlr3y+5sgClZFFt1JxPV5fNaNXclGydjoOCh5nthEWWiojtKORx8wH+fD7fw3XklA/QZd5nGUwAwT/44S89msDAgQOOyGAiQsGN3LcI2KnEsyNeqS/uWwZSj7F43+ix4wGbgy/penOu18UBNUoA5imO0EuyQlm5qo7SJ/FLz/rK5KrmQfawihshDRElkhPPJAviwgw4JnujZfvvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7529.namprd11.prod.outlook.com (2603:10b6:8:141::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.49; Sun, 14 Apr
 2024 23:42:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Sun, 14 Apr 2024
 23:42:51 +0000
Date: Sun, 14 Apr 2024 23:41:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
CC: Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <intel-gfx@lists.freedesktop.org>, <kernel-janitors@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915/guc: Remove usage of the deprecated
 ida_simple_xx() API
Message-ID: <ZhxpqC9ynm34+00y@DUT025-TGLU.fm.intel.com>
References: <7108c1871c6cb08d403c4fa6534bc7e6de4cb23d.1705245316.git.christophe.jaillet@wanadoo.fr>
 <ZbGlqD6zyyp4DsmH@DUT025-TGLU.fm.intel.com>
 <a788ee2e-ee51-476f-8aee-aa344f221f9c@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a788ee2e-ee51-476f-8aee-aa344f221f9c@wanadoo.fr>
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7529:EE_
X-MS-Office365-Filtering-Correlation-Id: d4bd77c1-c6f8-4089-9340-08dc5cdc992f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IC+J3nnhK/7ihjdGV+GPWbHM9SIGYrk+DsPalIfNVWYUrcwjV4kQK2juWTG659NLIhTOYkGs+3S1ja9A6imIlsvZ+CZM1jUAwetgdFY7XYlsLyj+3COOGDcTuceQpLi2uXbFKqsqgIcvXVN8xtR+LYztM/r7/EXU8/2eWD1KrrWW+Tk9e3Mg+gXfNZi3c2TS0uLcMjJ7PhQ6UgARgPGKEJE4hFHWjfBtNcku6Ob5R4m/BBdJIM2hA14lLudzoK2mSRUsRXCxvOGkKVgf8Y11keVrJt5YPnthugTI8T815ayyXMSkX7tnVEp3HSSdvQh/D1BbONJnBA8hA7Lb8OiPYuex+cP0pvMNBVNTZeBLoW0Vu0UR9zQFoGC/gAhFm55UYALC8Sy5hZ73MD9drBdv+ImHmxU9K+X9847wI+ZRGSJR8jr4Yxz2EblA2Zz2tRcYNpFvpCOB1I1AuzbwAe/8yrhZ+70IITV05triuivmAq5i86MsBl2xOVeXU9bK7aXyRVu3Iu9+uCvYcH2kDMNHvwSuJZvUV7BiX/PMPW9eikvL0Rbn5mW6Lmfj5+TmlzIbXOdxnnFyZsfRMIxiWDEG6pUUAwp4JNFgKV3gm+pdxIu9/W/MmOHGAQx0OiXl/eaDLEIoKB+2BqxJjmgWGohMBSTkFe1swqa2jSIu30DJEog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PZV/BXBiQEnUZdw2te0o3953fBHRSP+Kc/La2DSGm6at78LxhZrTLhG9tx?=
 =?iso-8859-1?Q?T/p0NH8Hnv+NH5sfTGD86wMGg8uGDBo66sFwi62AjPYWsB71MhF1kyjpKX?=
 =?iso-8859-1?Q?JlJQlHyCxZwW36IEIjo6+wKr9gBjKnBD+U9Yj2N412tifRnnnh9EnPV2Ow?=
 =?iso-8859-1?Q?iutebm7vrkIOFhAFPn8cmXT0Zk+v8zLGjqrosfvwVY5Z/oLtUynSeQeisG?=
 =?iso-8859-1?Q?0Q449huZpQ4uJ/UKxdOrVXRQPDxBbiTJnWQ+hryTNIZeg+cC+8DPVgR/ni?=
 =?iso-8859-1?Q?rWxR/g04Z1oZl/0qa9/aa5tWGFEu0eR7ivSbeC2SjzHOuCotAh8hHWHUSk?=
 =?iso-8859-1?Q?JV7rf3x3kRFjoeo5KQpAHc58o2wkuPdzcrzDhxyhrmLjTylfdjaTpwE7NA?=
 =?iso-8859-1?Q?tYDr9t6gE/iaGK1nJLdAX2uWQDf/k7kKXkUrRgzoME5fP6Kn5RMjFNSKrp?=
 =?iso-8859-1?Q?Jn05oPDBK9CEtp6y0Jc66Bzu3+8T52tuEqO2vRJK899c0Q6PDyiKwsah9x?=
 =?iso-8859-1?Q?TdV46xZYrJH8Ta4Y/30fQ67RtU1kSswchZ6HibuGvmMdV5MiaawRwdCAXe?=
 =?iso-8859-1?Q?V2keX28v8SJHMjWritCLK5u+aCRSeYrF8QhojK1PhQqq55ukS9FTt0nd0U?=
 =?iso-8859-1?Q?WqihlkY3HZDojh39/YLR7ecasNBBaDmSpticvo25GEB1Hb4vt1joR6E8H9?=
 =?iso-8859-1?Q?5wsV6t56+fckJVVt5dFz9/wotb/lGdasU2KrwWWxFmnht3H18P9W0La5bp?=
 =?iso-8859-1?Q?5X/NdllUpFwn8HrvOmH3raVW0420Yz+w/4ryp8V8EVPptXxioyPkC/xGtk?=
 =?iso-8859-1?Q?v5U1jqSCBvzIQ9CKdhyejszKXaJRVUPHaEWzqgsdaxx+CfB+f+Su5MqCMa?=
 =?iso-8859-1?Q?mXz/Tmn+6DrzVjtv0vSC/Iks1/ot3Jn0bAjiO+1DgU8b8MHGqghbGuH/0P?=
 =?iso-8859-1?Q?Cy9ENAeGD5tS6Df2pvB3ix0JCrXAbd4xtuaLGpBx952iILC3q+ocqliP7m?=
 =?iso-8859-1?Q?4zk82Vb9gtd42W8j7aaWCq7AXUQY4nzFGmaOFmxHRxjTgObts+0JxlSZMV?=
 =?iso-8859-1?Q?7sT/LR0dSPsU2shB/NAV5qJF/rLMT8t5H7uw250zD6di3oQYOTvTnuQIWN?=
 =?iso-8859-1?Q?DWJ43n9xvIjEy7QnJ2eU4md8i+j3IoM0kKT/tbWFXj0Dx0DvB6qkBSWB0w?=
 =?iso-8859-1?Q?TVNjV9lXzDr4G3kiyeNR21hccj7de7fH6CferVKCs+ES0AAJCv7xHc3cWZ?=
 =?iso-8859-1?Q?59/yHlMc/V2DHdwphAwAGR+G6LWgBRzlERkucw4nxLDe/k2XO28Km0mXQA?=
 =?iso-8859-1?Q?bVt8IQhicWV2rg2T+QxIOaqkCYp9ZSH0vlEOu/3PPye03hIV8A4rIklOK8?=
 =?iso-8859-1?Q?VaG+Yo6qUmZe2+MQ5FMoWtzGqF5xZcH886vEKd2LM8WmNp9zzF8+cRQaK6?=
 =?iso-8859-1?Q?3cbhmsZ7iH6un0fd/s8RhR7Uw0kqGpN4WUaUvjb/DKvZnDTigf8uDWFpGQ?=
 =?iso-8859-1?Q?QspxmyO8MjemG4nSDXms2aUohymo4d72prbMo3LmcOQ62o3rudH/wkvqgO?=
 =?iso-8859-1?Q?q4SUWyMJkW6hl95UBs5nB5K9jwdXau1/F82+N7cTGbZWLIBBfvxUeXghmN?=
 =?iso-8859-1?Q?W4oWEgtKkK5E/MK4Qns6HQxemRdwO1FeOLdH1GVcwlXn1od7CvQqjJgA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4bd77c1-c6f8-4089-9340-08dc5cdc992f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2024 23:42:51.3813 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ChlNg2XwGViZ6ztID0nzi7bP71SGVSe5VW6dg3wKNTSK8kAkrJD5erZUEAaOz3dn6qqOW3E6l9pNtIqHP1IwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7529
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

On Sun, Apr 14, 2024 at 10:26:35AM +0200, Christophe JAILLET wrote:
> Le 25/01/2024 à 01:04, Matthew Brost a écrit :
> > On Sun, Jan 14, 2024 at 04:15:34PM +0100, Christophe JAILLET wrote:
> > > ida_alloc() and ida_free() should be preferred to the deprecated
> > > ida_simple_get() and ida_simple_remove().
> > > 
> > > Note that the upper limit of ida_simple_get() is exclusive, but the one of
> > > ida_alloc_range() is inclusive. So a -1 has been added when needed.
> > > 
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Hi,
> 
> polite reminder ;-)
> 

Merged. Thanks for the patch.

Matt

> CJ
> 
> > 
> > > ---
> > >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 13 ++++++-------
> > >   1 file changed, 6 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > index a259f1118c5a..73ce21ddf682 100644
> > > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > > @@ -2156,11 +2156,10 @@ static int new_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   					      order_base_2(ce->parallel.number_children
> > >   							   + 1));
> > >   	else
> > > -		ret = ida_simple_get(&guc->submission_state.guc_ids,
> > > -				     NUMBER_MULTI_LRC_GUC_ID(guc),
> > > -				     guc->submission_state.num_guc_ids,
> > > -				     GFP_KERNEL | __GFP_RETRY_MAYFAIL |
> > > -				     __GFP_NOWARN);
> > > +		ret = ida_alloc_range(&guc->submission_state.guc_ids,
> > > +				      NUMBER_MULTI_LRC_GUC_ID(guc),
> > > +				      guc->submission_state.num_guc_ids - 1,
> > > +				      GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> > >   	if (unlikely(ret < 0))
> > >   		return ret;
> > > @@ -2183,8 +2182,8 @@ static void __release_guc_id(struct intel_guc *guc, struct intel_context *ce)
> > >   							   + 1));
> > >   		} else {
> > >   			--guc->submission_state.guc_ids_in_use;
> > > -			ida_simple_remove(&guc->submission_state.guc_ids,
> > > -					  ce->guc_id.id);
> > > +			ida_free(&guc->submission_state.guc_ids,
> > > +				 ce->guc_id.id);
> > >   		}
> > >   		clr_ctx_id_mapping(guc, ce->guc_id.id);
> > >   		set_context_guc_id_invalid(ce);
> > > -- 
> > > 2.43.0
> > > 
> > 
> > 
> 
