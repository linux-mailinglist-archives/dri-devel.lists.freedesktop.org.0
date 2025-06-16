Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80644ADB6EA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 18:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B12310E3F7;
	Mon, 16 Jun 2025 16:30:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cfE/l3S0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD5910E102;
 Mon, 16 Jun 2025 16:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750091452; x=1781627452;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9WMTXhKvF1+3cb3hV4x8fnq+yOPYOk8OmUlkMPAgL60=;
 b=cfE/l3S0SxEUZsO3Uyr/ibKtI4LGtc2bNw4qWHcPtCyJnFwlsSLgPejF
 fWMeQCEsDB4hvrcRK68gC5JXbGYcJOWylZjjRWurcdQvMAMBSQ0woXaSg
 xXh0bUoAd5Iet5Kl5P9RBUuzo/kiOPQB9cX4Ruvq7XZ3CvilRsVg/fHUG
 YY3RT/2ZP+fM3VehV+CHN6CBKgIhiY0o9o1ptGCigfrw1Nwf4m/Hj5/HK
 RXUmnDQBb6xUTl41GootaO2344H4PkNPDNj9oGk07XTc5BRsukCFqBzxu
 8s0xLDsGuZ8mtgYbViC6mw90tQFXZt5dzhfC6XuFGFsiDGUueV9nIA9Bw Q==;
X-CSE-ConnectionGUID: /mulkAnVTl63F9tEqZ9wFg==
X-CSE-MsgGUID: 0F9C1KqURDSAVnrymcAhbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51468803"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51468803"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:30:51 -0700
X-CSE-ConnectionGUID: PwiFn+uWQv2x0NDbW9KwRA==
X-CSE-MsgGUID: t890UTEnT8SsPqJ8HNubNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="171745463"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 09:30:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:30:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 09:30:50 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 09:30:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj7jRjb3TuirFz+WWcz2EyxSeat5hkUtafizuvHjI2NmdJfgAn9+QxE/4D057OHPnkKkgNNIBYy1SIiPUe9at4zmpoLyMVQve4yJ7vSnJzmjh4l9Jeb/zSerc21wh8LH4LsdLPAv9EUICvYBCWOcSMyxL/rPT69nSV4efjqbSw3qNG0GEwZetrHtFKGpThR902zoRIjhKJBcxKm1gW1/UyZlUVubMlL/j2l9IfCgwUvNnX0NeksjTqb3xPHm2y5R6w1JPugZYDTU+tkpUlEeEbL0s5J4nRFaLk6lwUTDALdl9r7xmaJwE3r+QtDVzlwsyKlV3oYextk6GMdM0C+xLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=muunl7+pyyf2PhprWVsyba6Hzzr92fMkKCaMmUrly4g=;
 b=AD3mo+RNjSJsONY44aykY6/ylRkI6jN7VoptosX0aqvGLAIaTg378xRzYp65m15hECxOTJj+IXs8K6W150bD1aMqiaFrolgKF7p/xURKk8DyPVH7zgYlujI9FFPRvoE63Moa8M/0tc17purmsugwzwjzWOmnV0dvT74QJuvSeuuwYePeTG9h92gSz2H4E+qUmMVnFHCozJIME+HNz+oKfIOmnJz2rkWaKoQ8eBvSojTHMfMrAFAtdEjSCGx1CNUwcMCccklsZYP9kDrPDe/DUIo9z6D+TfMQ+EasWFXzIr+7hE2XitcKSRHuvkxbKJ+stLHHcY9Y+pzZbFseRt1jIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA3PR11MB8988.namprd11.prod.outlook.com (2603:10b6:208:57d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Mon, 16 Jun
 2025 16:30:19 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%5]) with mapi id 15.20.8835.027; Mon, 16 Jun 2025
 16:30:19 +0000
Date: Mon, 16 Jun 2025 19:30:14 +0300
From: Imre Deak <imre.deak@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 5/9] drm/i915/dp: Implement the POST_LT_ADJ_REQ sequence
Message-ID: <aFBGlpcNBg2ovUb-@ideak-desk>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
 <20250224172645.15763-6-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250224172645.15763-6-ville.syrjala@linux.intel.com>
X-ClientProxiedBy: LO2P265CA0200.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA3PR11MB8988:EE_
X-MS-Office365-Filtering-Correlation-Id: df36d427-e353-46d2-372b-08ddacf31526
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?KJV+ghwdqsny2WDNuvCqz46iPmilOlFuSjeLoQALXAkrnv3L9sX62RV3a+?=
 =?iso-8859-1?Q?d5HmOx/XkeEQ3u2Afi7JWPVm//Jtof7ouroZVz4Pt/658r+d707AuKTTaF?=
 =?iso-8859-1?Q?mFGdHdf2Pzd1KbG9nc653rGOEnZ7QAy9xclRjejxrJ0jzu4hgf0cxELeQl?=
 =?iso-8859-1?Q?g1Co/5AYC7Al3gti78ClKyRu/3JIx9vskmvNaNAGafHGO84k5/DOpQN4cH?=
 =?iso-8859-1?Q?v3cDgWbtYAnLNlrlOR9TpdWwSjpd0Pi3NTNk6sP1oeXZemarhpQJhCvC1o?=
 =?iso-8859-1?Q?L2qI8QZ8hCXR/n1V1ZdNOq6NtD8Xow8XxmlqPpdYqeOpUPaPx8GJvp6oU6?=
 =?iso-8859-1?Q?WO0xHV4D51fNeU4PKsgxhlVu0F2zCMvnNb6qJl9KEwtp/jlchcbXWn8FEh?=
 =?iso-8859-1?Q?0ID7yNsWwfpSa67bUQ66WlVJepPMLoz8eqlHV/Qn4UjvsjMQ7POju1gZCZ?=
 =?iso-8859-1?Q?Y2a2bJKom2GqkYcTfggl0e2KkT5p/3i3dR8d1PQ9E0/dGcMtRQ42ppN7wj?=
 =?iso-8859-1?Q?CFTIzRes+WDIZVtwNk/o04aEJ/0vlgMaBYR24+SzooTyva3j8SwtWBaPle?=
 =?iso-8859-1?Q?So/xwsL7JsyPqx2mYfrMJ5EGXTo+5hrIdNhP6YQ+ALe9jZsxpWuIhONFyV?=
 =?iso-8859-1?Q?77sxhNWHJP2oM14dbOvwkeA/zMN00vRBffQLBsMYy2so46o/djHw3VO6++?=
 =?iso-8859-1?Q?x42RHhie282pPaNRBvrN1yCJ5UHxVj4Ev6I6la5wM/KjELZDevTg4mxBtD?=
 =?iso-8859-1?Q?2HyUvRN9SQ22M9VxDMoqCgJXxGEch6fPAt8WH+jMEv6/JkRxw/3B4IaAWW?=
 =?iso-8859-1?Q?kq1gm7mIJY+MDf1bAaE8GXjvZPtj51Cj08+TP/giJPtAR94vWFs3YFOS1w?=
 =?iso-8859-1?Q?zdUHBafFCiEsj9BnMqMUJxilrWqCSzhiFfuf6Dung09lvFTyEvjzvKu83B?=
 =?iso-8859-1?Q?WtP8Y8M0sO6LxuKAGLRWDUCjRSwUaKj25q0aZinTMbntn5QBtcTtRTUAHB?=
 =?iso-8859-1?Q?dXM7ILgWMHAG5JPmkK1Ofhrtj54MNJNJcEq79ioGgZL8OXIOVrj26taUrQ?=
 =?iso-8859-1?Q?szdR7Lkm2xpr67jVKKwEWu+t0Ay2pgAYuDvuA9qiyBj227IEgj5mqNQ9oR?=
 =?iso-8859-1?Q?2uZeD4WTbB7FixdJwRi3sPFPlfdq3H1jTZEkVFCWT3rrgNwwglx3O/m3/5?=
 =?iso-8859-1?Q?L1n73nTvnjc2/FCmqmcCdIQny4EbwOQW9Mdaj+mcjBc/DM/5gMj8QC+1Az?=
 =?iso-8859-1?Q?H1Hp/s+np3K3hwUdxShitghSdLkD4BYkmvSHMZi1CTUwgB4WxFiPZe15fc?=
 =?iso-8859-1?Q?nyJSdDr87GMHCwX7D/a6YrepwLAsW5cLfotmey2VZRZ/rPqUXN/pWhVO+B?=
 =?iso-8859-1?Q?g8Z4Uy1mT/uMK0hY6/Jg/pMpcDFf7g0liN8qcB1dBt7dX0Uppn9S1Foqfc?=
 =?iso-8859-1?Q?1RhKGQT10c6ZXJQZvaJ88nHo37sPs63FbCo1m5+2c+wz42HUypkQ3v7M0c?=
 =?iso-8859-1?Q?E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+b8rtwB04rJo3NbBOgwi8EcFNFJI6ykQUS68cWIvV9lQVI5QABHag+tQNV?=
 =?iso-8859-1?Q?VvbBhP6DHiapUwcgiXlr1JirlfhZtDv6JDyQ7QYmFhxA5hmdAeLHi65J5b?=
 =?iso-8859-1?Q?nrFHWOZicvRhJKiXQcgqVP3i+WsyfCJibDmMVnQUGve6z6HzzppQRPLSRB?=
 =?iso-8859-1?Q?k3J5HszN58aUOC1XI01LFR8g69jJUSM6Cq4NeLsd/1C4yp04uy4X3fA6ic?=
 =?iso-8859-1?Q?yeKKOsUKlcUo1UTyAq5qY+/ZZZEvF3ZymUYUg84NnFrDvdfDIEp9pT4CpF?=
 =?iso-8859-1?Q?x5kDb4tKX0mA7AH07+a/nG0VyZ25b0ZVPtvAoFvaldE0FpZTAVpEYfffKL?=
 =?iso-8859-1?Q?mIpi3LQ3yZ+APRnBot2U7OwHJ7MMcOvHlGT+6nEEkfEV5RjBNGElkr5H4z?=
 =?iso-8859-1?Q?zT9K0Qi55pXztvoBHQnVjCl9XHS9x20ggS739vtm6wrusx78dVdtSfV9yI?=
 =?iso-8859-1?Q?kYeApzyL0XeuHhB101m6/tinXwC1p4WKKo6YxDwezQiCcqMOezEXp+Qrlu?=
 =?iso-8859-1?Q?4F1l7hPkvfOuE/2XjDK/JoDt4GfrM319l5qc3HgYNoQsAhP1MgX7va5COt?=
 =?iso-8859-1?Q?/QfIMcMNXSTcDS6kE3rXs3AtoTCgvErPvIU0DWsjJ7bCE5BojXcN6H1SI9?=
 =?iso-8859-1?Q?4tYWPowsYmhCkPM4i4QaJHpj4cfFT3ILhruOZ+i6ck18b5tXEGSXSlS+W/?=
 =?iso-8859-1?Q?vtN2jzhmu+VK44pJjZdf6JBIdMFkk/2Pt+n3Vd00Bd4CAi7AcczmaA0cLj?=
 =?iso-8859-1?Q?symUr1UGIHyG5U7e4zNV16j6rsJSAdgChIrwwAQmmd8xiZZpqXYch9pP5w?=
 =?iso-8859-1?Q?XLKEcTJWFXrEZbQ1yEH1UMtPitWnQRwi/1sLz8JnHSrhrP7jlGmO5yTNUT?=
 =?iso-8859-1?Q?DAKAwPlUyNCY4YHODodo/LNRMeGdU/JuulBysc+XC8yw4ngAoa3Ib51uTF?=
 =?iso-8859-1?Q?kNJ+uGzyAUY4FRDxc5JPNbxRktwek0hmfwX9ojNeDonjlmTTDiWIWwRO+s?=
 =?iso-8859-1?Q?cKSUNbD8iyoBgz91bD6w2VQc5kuopJqqJs25K5QHjGW0ZqxAlSKKcGv550?=
 =?iso-8859-1?Q?RkS+CPqAn01CkeBAwlEM+CdIkBeM3hOvMSRyYVLU7ds26mJ/UTjVMM5Uji?=
 =?iso-8859-1?Q?fMZcs/h7LmuAmoDE2iKBRFid5geyyZts3pNu4tzfXtI/lH/PGASm9V+WDZ?=
 =?iso-8859-1?Q?DORbowGdtA8NxWZrJLR9yGXCFbmJgKPTqHjYDsXYdwdyqJqCjZ1uevo1w5?=
 =?iso-8859-1?Q?2wK4+VklWOhG5738cRNBL/seqVX/86HbLG/FtE4pg1iZU4bnPAYxMTlMXu?=
 =?iso-8859-1?Q?5y5NK0cAgu6KwLDY4du4t+9WHmJO0wMA6Q+Amz6TaTibM9OpgdH/nM0F2U?=
 =?iso-8859-1?Q?3osu8DXu05CzpSaGZ6QuqNoho7OehvzrU0OTy2/N3h63hUP8NzcJq63YIG?=
 =?iso-8859-1?Q?9IANElAN9rASkXvaKAiYegzTu+lKeM7AjrCd3Xlw/D2SCBaLed6IZRvYUq?=
 =?iso-8859-1?Q?unV057siXuqHt1f2y691MqATxPU8B3ce2ZqpOZwbZG1d8x8YdJtxcxqCTz?=
 =?iso-8859-1?Q?x9WtRmuwjCVVUOm/wJRxFmSqV4pkXEWxtDI0JJr1QhEn8/93ANS2t+/VNO?=
 =?iso-8859-1?Q?2zywPbeNAHOCR4jbR056yKDBMGCgJWp6Ei?=
X-MS-Exchange-CrossTenant-Network-Message-Id: df36d427-e353-46d2-372b-08ddacf31526
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 16:30:18.9900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l8SRZg8VcI/GFtPgWEXZPhOf12IzSG5mAS7UJ59DTCuU7plauAF21OAziXOSC/BrS/40TBC4vxxx2FqNiFTUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8988
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

On Mon, Feb 24, 2025 at 07:26:41PM +0200, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Implement the POST_LT_ADJ_REQ sequence, which should be used
> to further fine tune the link if TPS4 is not supported.
> The POST_LT_ADJ_REQ sequence will be performed after
> the normal link training has succeeded.
> 
> Only the final hop between the last LTTPR and DPRX will
> perform the POST_LT_ADJ_REQ adjustment. The earlier hops
> will use TPS4 instead since it's mandatory for LTTPRs.
> 
> start The sequence will terminate when the sink clears the
  ^ typo?

> "in progress" flag, the vswing/pre-emphasis values have
> changed six times, or the vswing/pre-emphasis values have
> remained unchanged for 200 ms.
> 
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>  .../drm/i915/display/intel_dp_link_training.c | 128 +++++++++++++++++-
>  .../drm/i915/display/intel_dp_link_training.h |   2 +-
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   2 +-
>  3 files changed, 128 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> index 2506996bf16d..8863fc2c44ff 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
> @@ -738,11 +738,14 @@ static void intel_dp_update_downspread_ctrl(struct intel_dp *intel_dp,
>  
>  void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
>  				   int link_bw, int rate_select, int lane_count,
> -				   bool enhanced_framing)
> +				   bool enhanced_framing, bool post_lt_adj_req)
>  {
>  	if (enhanced_framing)
>  		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
>  
> +	if (post_lt_adj_req)
> +		lane_count |= DP_POST_LT_ADJ_REQ_GRANTED;
> +
>  	if (link_bw) {
>  		/* DP and eDP v1.3 and earlier link bw set method. */
>  		u8 link_config[] = { link_bw, lane_count };
> @@ -764,12 +767,25 @@ void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
>  	}
>  }
>  
> +static u32 intel_dp_training_pattern(struct intel_dp *intel_dp,
> +				     const struct intel_crtc_state *crtc_state,
> +				     enum drm_dp_phy dp_phy);
> +
> +static bool intel_dp_use_post_lt_adj_req(struct intel_dp *intel_dp,
> +					 const struct intel_crtc_state *crtc_state)
> +{
> +	return intel_dp->set_idle_link_train &&
> +		drm_dp_post_lt_adj_req_supported(intel_dp->dpcd) &&
> +		intel_dp_training_pattern(intel_dp, crtc_state, DP_PHY_DPRX) != DP_TRAINING_PATTERN_4;
> +}
> +
>  static void intel_dp_update_link_bw_set(struct intel_dp *intel_dp,
>  					const struct intel_crtc_state *crtc_state,
>  					u8 link_bw, u8 rate_select)
>  {
>  	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, crtc_state->lane_count,
> -				      crtc_state->enhanced_framing);
> +				      crtc_state->enhanced_framing,
> +				      intel_dp_use_post_lt_adj_req(intel_dp, crtc_state));
>  }
>  
>  /*
> @@ -1087,6 +1103,109 @@ intel_dp_link_training_channel_equalization(struct intel_dp *intel_dp,
>  	return channel_eq;
>  }
>  
> +static bool
> +intel_dp_post_lt_adj_req(struct intel_dp *intel_dp,
> +			 const struct intel_crtc_state *crtc_state)
> +{
> +	u8 link_status[DP_LINK_STATUS_SIZE];
> +	unsigned long deadline;
> +	bool timeout = false;
> +	bool success = false;
> +	int changes = 0;
> +
> +	if (!intel_dp_use_post_lt_adj_req(intel_dp, crtc_state))
> +		return true;
> +
> +	if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, DP_PHY_DPRX,
> +					     link_status) < 0) {
> +		lt_err(intel_dp, DP_PHY_DPRX, "Failed to get link status\n");
> +		return false;
> +	}
> +
> +	deadline = jiffies + msecs_to_jiffies_timeout(200);
> +
> +	for (;;) {
> +		/* Make sure clock is still ok */
> +		if (!drm_dp_clock_recovery_ok(link_status,
> +					      crtc_state->lane_count)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			lt_dbg(intel_dp, DP_PHY_DPRX,
> +			       "Clock recovery check failed, cannot continue POST_LT_ADJ_REQ\n");
> +			break;
> +		}
> +
> +		if (!drm_dp_channel_eq_ok(link_status,
> +					  crtc_state->lane_count)) {
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			lt_dbg(intel_dp, DP_PHY_DPRX, "Channel EQ check failed. cannot continue POST_LT_ADJ_REQ\n");
> +			break;
> +		}
> +
> +		if (!drm_dp_post_lt_adj_req_in_progress(link_status)) {
> +			success = true;
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			lt_dbg(intel_dp, DP_PHY_DPRX,
> +			       "POST_LT_ADJ_REQ done (%d changes). DP Training successful\n", changes);
> +			break;
> +		}
> +
> +		if (changes == 6) {
> +			success = true;
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			lt_dbg(intel_dp, DP_PHY_DPRX,
> +			       "POST_LT_ADJ_REQ limit reached (%d changes). DP Training successful\n", changes);
> +			break;
> +		}
> +
> +		if (timeout) {
> +			success = true;
> +			intel_dp_dump_link_status(intel_dp, DP_PHY_DPRX, link_status);
> +			lt_dbg(intel_dp, DP_PHY_DPRX,
> +			       "POST_LT_ADJ_REQ timeout reached (%d changes). DP Training successful\n", changes);
> +			break;
> +		}
> +
> +		fsleep(5000);
> +
> +		if (drm_dp_dpcd_read_phy_link_status(&intel_dp->aux, DP_PHY_DPRX,
> +						     link_status) < 0) {
> +			lt_err(intel_dp, DP_PHY_DPRX, "Failed to get link status\n");
> +			break;
> +		}
> +
> +		/* Update training set as requested by target */
> +		if (intel_dp_get_adjust_train(intel_dp, crtc_state, DP_PHY_DPRX, link_status)) {
> +			deadline = jiffies + msecs_to_jiffies_timeout(200);
> +			changes++;
> +
> +			if (!intel_dp_update_link_train(intel_dp, crtc_state, DP_PHY_DPRX)) {
> +				lt_err(intel_dp, DP_PHY_DPRX, "Failed to update link training\n");
> +				break;
> +			}
> +		} else if (time_after(jiffies, deadline)) {
> +			timeout = true;
> +		}
> +	}
> +
> +	return success;
> +}
> +
> +static void intel_dp_stop_post_lt_adj_req(struct intel_dp *intel_dp,
> +					  const struct intel_crtc_state *crtc_state)
> +{
> +	u8 lane_count;
> +
> +	if (!intel_dp_use_post_lt_adj_req(intel_dp, crtc_state))
> +		return;
> +
> +	/* clear DP_POST_LT_ADJ_REQ_GRANTED */
> +	lane_count = crtc_state->lane_count;
> +	if (crtc_state->enhanced_framing)
> +		lane_count |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
> +
> +	drm_dp_dpcd_writeb(&intel_dp->aux, DP_LANE_COUNT_SET, lane_count);
> +}
> +
>  static bool intel_dp_disable_dpcd_training_pattern(struct intel_dp *intel_dp,
>  						   enum drm_dp_phy dp_phy)
>  {
> @@ -1372,6 +1491,11 @@ intel_dp_link_train_all_phys(struct intel_dp *intel_dp,
>  		intel_dp->set_idle_link_train(intel_dp, crtc_state);
>  	}
>  
> +	if (ret)
> +		ret = intel_dp_post_lt_adj_req(intel_dp, crtc_state);
> +
> +	intel_dp_stop_post_lt_adj_req(intel_dp, crtc_state);
> +
>  	return ret;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.h b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> index 1ba22ed6db08..33dcbde6a408 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> +++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.h
> @@ -21,7 +21,7 @@ void intel_dp_link_training_set_mode(struct intel_dp *intel_dp,
>  				     int link_rate, bool is_vrr);
>  void intel_dp_link_training_set_bw(struct intel_dp *intel_dp,
>  				   int link_bw, int rate_select, int lane_count,
> -				   bool enhanced_framing);
> +				   bool enhanced_framing, bool post_lt_adj_req);
>  
>  bool intel_dp_get_adjust_train(struct intel_dp *intel_dp,
>  			       const struct intel_crtc_state *crtc_state,
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index 167e4a70ab12..d937143ed10f 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -2109,7 +2109,7 @@ void intel_dp_mst_prepare_probe(struct intel_dp *intel_dp)
>  
>  	intel_dp_link_training_set_mode(intel_dp, link_rate, false);
>  	intel_dp_link_training_set_bw(intel_dp, link_bw, rate_select, lane_count,
> -				      drm_dp_enhanced_frame_cap(intel_dp->dpcd));
> +				      drm_dp_enhanced_frame_cap(intel_dp->dpcd), false);
>  
>  	intel_mst_set_probed_link_params(intel_dp, link_rate, lane_count);
>  }
> -- 
> 2.45.3
> 
