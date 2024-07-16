Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECD69333E4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 23:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F5B10E8F1;
	Tue, 16 Jul 2024 21:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QuFd98k/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC3810E8F1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721166840; x=1752702840;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ALviWIP8Zx31E9yBUPlt2u5em0CPIjU/X8xHmVQzCOg=;
 b=QuFd98k/7Q01CJ9vshiUEUSKepktOqyx+LG6rbw5CD9jwUFpMAyJXjxu
 2spkxim0PtMKBJim5fPDwnrJCaqBaYyHYGbxZGWKeY29A4vrAfpRhgV4s
 3ui/HgK/w8fddeuF+fJ1HWKuU0jbsm35YXSRev0aXl6B1j99UJYFznGkq
 EVKvX1beTOK7G98y74wah4OZHhLNShggtv7SbL2t4ZgoMdres0a30Bxdq
 vS60687vwoj7JIOtpAdPjXlvk2wluhlZYJPeElGtWgjvl4rLXTVniSbwK
 XZxMzb55k5SEP+55O/mKkTxoq2lA7J4DHrGLNpsdH1lJgWaNPgZPod/iE w==;
X-CSE-ConnectionGUID: GXMqqzD8TRS3iJ8eApXHVg==
X-CSE-MsgGUID: 9QA3xvWRTuG/3EmUkBUhxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="44065089"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="44065089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:54:00 -0700
X-CSE-ConnectionGUID: gf3C7rULQMyUHGFVV40k2Q==
X-CSE-MsgGUID: gSJuIT9OSPqIWRBH7PMwrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="73367852"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:54:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:53:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:53:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:53:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vLrb7IcPWlY4SduIN5ItinEdKqIwC0EoSBq72Dce9Q3EZ1X9MSM1q03lfJ9XbBM21k8ABtLdBU7Zus0YWGz0VV0jtaVcm7P+VpwZCZuQ+Vuf5gmpojkzOMRCSSi2xGM3JN1WKsq5iOKrQ+fpBEnWQ6fMsxDPM9fanRTDMN25FbSLc/3zHCN9+uDNPPvf1H5RjDM8nfaKYHLzCfeexVNRRi2cYSQnme1uDewAo9PZKWwCCmJOMFsas8oa4JgRIEALqfakrhUGaV5QybJYGqp6W+tPLFwwFDh635LMv5mQz4fCyueVLPDwP58lyqaIU8e++/9+jOVLI78XzYW2jQXMkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEvEK7OTu7ih//VbTG/jQFZcVi2g9MzofdYP0rMZvIw=;
 b=mlsdlnNrrE2bEiVO3K2ocuzAIj2kGjZ82HehECK3s5DMkZy3qC9KQah4cwXjq2B/HxAkk9QqMSLffkucN9EfPd1uJ82QTDEuuXMYUHD3PsqANzYm4aVAimg5bDWvLnZHsKWcMzDvBQO2sIsroGKazC1VUkPjoP8t5wjhSKn9W+wHQR5Z+7mDy8iLY/aWAShZ1/fxI3M00VKTjFugQgHyGDXqCVd9Y8ehhFrwOOaJJ5FAg6TzE0p/94A4W/w25YY0qC4jA4chxHbfjXA9Pl23WsQnw7t8meMojVj4sNtfW1Sxpw8MwwscK8u/b4RrQKamDMNgQ8cY5lNuJLYUO0AYow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.23; Tue, 16 Jul
 2024 21:53:56 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:53:55 +0000
Date: Tue, 16 Jul 2024 21:53:08 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/amdgpu: use GEM references instead of TTMs
Message-ID: <ZpbrxAyVTdhkJZ9O@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716123519.1884-2-christian.koenig@amd.com>
X-ClientProxiedBy: BYAPR21CA0013.namprd21.prod.outlook.com
 (2603:10b6:a03:114::23) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 17659087-df7c-47a3-1412-08dca5e1ca16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?hGn40iTam9Lm2fcvOp4C727BAxZiZDyESxRa2PgVIWwHZuMZoM5j3drl6b?=
 =?iso-8859-1?Q?xWWtvLY+7JbSucAZdJn66B6qzwHnUm8TxX787y6D1iD9/1mkzfNKXrx1jV?=
 =?iso-8859-1?Q?4NEYGm03HNElQpur1PYWJx55R4v8biVUEgNbHU5mGOEU8loEiE09Vps+EG?=
 =?iso-8859-1?Q?nrroWC5kwxzT55rI8cis8iMuLhws0YlcJfYgiQ5QEXPDuXcu1vyU45+ERA?=
 =?iso-8859-1?Q?VsUjc+EDv++z9ehhFX/RVuGUlVivbUeYBp5aHgj8yBM8nWaIAClOBnuEtZ?=
 =?iso-8859-1?Q?YAaCPVVujotHbjKfxEK7SQC1Xar6EXjkFQBj5zck2VQSEwc1C4HnI/Xr8N?=
 =?iso-8859-1?Q?76MrowNem6Yv93fE+S5u9L58EjHm60EOKzoSQGb8Q7tHakE53GkKup4fjd?=
 =?iso-8859-1?Q?ZRz9+mYqvKhRhGSoOTdzn7JX1ExWC34afhMz/eLXf+d7o5Emj3QdfYZESh?=
 =?iso-8859-1?Q?NWMcK5o7zMph2ACwD5wCxxObiQlwEV9kNhQNIRjkesq11YLHnhjHNT1ghu?=
 =?iso-8859-1?Q?EN/MBuihQg/BttMRxpPaTwH6+ZymlEEGjQVJ3YnBva9Bol+Es78jCu0zlS?=
 =?iso-8859-1?Q?E4AMMP9p3/jGPTT1a+bhk1NSKXimu+d0vB1zEi/NHbG3W5kpgVKB+tjc1c?=
 =?iso-8859-1?Q?P1B6dN8tLOPX+jA32Y9nttYC6Yg2XM2TOob0PiSVrbnC69xbZTDAvwJm3r?=
 =?iso-8859-1?Q?pwvuRpsteMVCphOSlLxJCVhtwmCit2f6HyzJM9HXCjnbLUsM8kKgeaGCPy?=
 =?iso-8859-1?Q?YoXk69uJSS9ESM5hW9C4WkLrmcqdyiSW+iedjCs2/dn8N5hNV6aeOw0DNS?=
 =?iso-8859-1?Q?3mRRd4mHm9MbICdmQPy1Sl21I5NlZisw1adDF9d8ud1LyoztazVa4s9usk?=
 =?iso-8859-1?Q?ETNx7IQjonLbXbX4s8B6Un29TUbRMYRXvGH/3BHJ19DR1Lcyi6drykp/5m?=
 =?iso-8859-1?Q?s1PvMrBCmhuAN/TBv6Aq54PSKs0417eqXJLrbptOT2WTsbx2m+sODgCkZI?=
 =?iso-8859-1?Q?MqOk/kGk19I7G8BWZeF4ShXAbd7+wrrGXVReSjxvMK0OQMKSulWJs3pAw4?=
 =?iso-8859-1?Q?tSY8hOisHdWTwLqyH68228UdOHFaG2CfHiEAcNz3+lhM7BKaGMCNAQmiwA?=
 =?iso-8859-1?Q?mISnMUlsGlka0ThXTBpFK0NUNwGaN5HnqyFCkkY+h0WqoPBCE3Jji2EFFI?=
 =?iso-8859-1?Q?pdWokk4ADwhIuhh1f0+cQqSK2/H+by+vxymBJOLvNa0hL/zFSW8oF0YL9Z?=
 =?iso-8859-1?Q?o7y1UH9PVF893gYS++7eWbrOImYteufdiy5BO+SyW4EYoJtWcoU6HPO2Gw?=
 =?iso-8859-1?Q?eYWfaaqKwX6kbVT0sm7OxY/qV9D+joQFMlUa+1JJfeA2Ylust3XuFRmSDW?=
 =?iso-8859-1?Q?SR0Ipj3/q9g+5HaiuwiCoP/yfRBdKpCw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?AEObkPsJsTD2VjcRn0I5ZmJywu7dNg77QYhI62KTx6UnJYwfKYo/3dV7if?=
 =?iso-8859-1?Q?MEQJsgctMRTUsaFMHXjnVQdbSkcK/fFsX/PtaK+ZybEzKbbKN985LHv6kx?=
 =?iso-8859-1?Q?qeGZVxRMgcULtMA/i4VFA12napfI2xhnt2Ok5cVxobxq+tjw8+Ifl6heLt?=
 =?iso-8859-1?Q?hiWC3o/6ku6KRpIgLSxBn85lLW5wF0IisBphThc4J8fABymVK+hVTLu81n?=
 =?iso-8859-1?Q?PK6j3VhWZXWLy2UWEci9Ih7Cws7oqacp8LkH7d0UQJiN4uJkIwwZtwRek5?=
 =?iso-8859-1?Q?XM5RKLtsVBbniFR9iWWVeUD2T1gJJhQwCOS/BpKzGjmlHzkWYeVUlmL5Mu?=
 =?iso-8859-1?Q?+Ln+ntd9csEVZCKcT1KIjPVwdmT8uc4ndKSKoGgfIrQkLo7Ns3d9vIHpD1?=
 =?iso-8859-1?Q?zUMAMZWudqPjFVDwJ5qQAMedXkq4XrNbfwizdVcJbvC4Iu0WBFA1vXhGYE?=
 =?iso-8859-1?Q?mkZemSi5Z+eTu1quL+benN6n2WKyrfWANJLDg9pE4/S6qvzwRDK0UvvR9p?=
 =?iso-8859-1?Q?BIs42QQCwVwKIeb2kkqHYSI4NP75aHQh/hw0CKOeRPlwnClJT6J9XMq07u?=
 =?iso-8859-1?Q?rJ/NhkzAzMZojfuRrBxStOkClBAyLg2fdtI3hu23ajSNp2AJu9FM9gwDJK?=
 =?iso-8859-1?Q?GS50hVYFswlBg/pdQgbMja65OVYPwVyAJeIf3XhSUgJPKj2ZH5pEu7HJDC?=
 =?iso-8859-1?Q?pKu45yvAPPLDKBlljbhqFAfp15/omxsFl78x0OaBGJQZvI78gQ43RNEA9u?=
 =?iso-8859-1?Q?aGfeYX5Cf9WCZkxO28imKhC7ldz2JhqGMBNengdGyKdPDTs+4c9xomfPbd?=
 =?iso-8859-1?Q?+lxn/FTPddmlD9n/4ShJR2MDQVVyz62sMDoEy44Hvoe7CjsZNcgTHkILQF?=
 =?iso-8859-1?Q?0/M123uwIXctb/IfKJkqMeNnfwT/OvWwJdH1AMWs0cveZaTkkhu3tKTc9Z?=
 =?iso-8859-1?Q?LKL+vFCYWOfIR+bhG1MoAz2e53snf3US/x6sWzVV7BcCuzKTJuRp4YUMZJ?=
 =?iso-8859-1?Q?vGIyAyxxw2aeqmYcdcqow/NZrW/xukcFvU3qDbpBEwGXKXF8iXuWYGns07?=
 =?iso-8859-1?Q?x9KE9xBWOtpT1q/ojnoeoK1qVLDKe0ArlG1tUpPz5qLoQf+dGyRSmlD7Yc?=
 =?iso-8859-1?Q?uo/dd/TAoHDz/PqrA/BvOr2blu7F9RzXHtrUia+iGZz+nhlQ8FuEY66up7?=
 =?iso-8859-1?Q?21Jzm2rGf8dq2X+JzwsOW6YYlQxjJafY0QknNjP+f2ElR7Wzzbc1GgIp8C?=
 =?iso-8859-1?Q?v655/7MERsxZRc4tCN0nAO+LA6oEHLS4uLPMLgHVQ/as5gs+oFVn8j5N5L?=
 =?iso-8859-1?Q?EB2ixD3LiNpavUPuH+lCIfFTu1yApaWhKivsoS1pIdyCOTp7BfNrkD1AyX?=
 =?iso-8859-1?Q?33DcBMlhh6/9/MGb8UEOus4pOom4YWVvgPEUmAXOAV74UfV+2V+RlBGbuz?=
 =?iso-8859-1?Q?DgNc50M4cQsjTBahxsFX71EhbHKraTKTTmvslTmZGLmfwRU+/wu79eD6dA?=
 =?iso-8859-1?Q?Z9/HvisknuX7cdj7YyFXSGfH7Q4c9YE4eRhKdEYNuaCMh46L1mcOJud4AJ?=
 =?iso-8859-1?Q?sT+c6CcS/CTVGb6ejYadQTnYLI4Ul1wHECK94LCylsNXlj4cEfNlLNaEwi?=
 =?iso-8859-1?Q?sK71DfMpcHjwlS1LStRhGUtyqtRTPXjmZOMgXidgRK1yFT+Y0LCjNDDQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17659087-df7c-47a3-1412-08dca5e1ca16
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:53:55.7367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+LTauhf5YgbKm5BMsBgq60n7BMhosK/lcWixiXvkQ3OLnyD20NMg9nH9Cvrmt3IP3FAdmQ58eMmHsz/Zu86+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
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

On Tue, Jul 16, 2024 at 02:35:11PM +0200, Christian König wrote:
> Instead of a TTM reference grab a GEM reference whenever necessary.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 8 ++++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c | 7 ++-----
>  2 files changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index 67c234bcf89f..6be3d7cd1c51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -87,11 +87,11 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
>  
>  static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>  {
> -	struct amdgpu_bo *robj = gem_to_amdgpu_bo(gobj);
> +	struct amdgpu_bo *aobj = gem_to_amdgpu_bo(gobj);
>  
> -	if (robj) {
> -		amdgpu_hmm_unregister(robj);
> -		amdgpu_bo_unref(&robj);
> +	if (aobj) {
> +		amdgpu_hmm_unregister(aobj);
> +		ttm_bo_put(&aobj->tbo);

So, this relates to my comment in patch number #9 about dropping the TTM
ref count. If TTM only uses the GEM ref count, could we convert this
ttm_bo_put to something like ttm_bo_fini here (also in Xe and any other
drivers with code like this)?

I think that might be cleaner.

Matt

>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 8d8c39be6129..6c187e310034 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -853,7 +853,7 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>  	if (bo == NULL)
>  		return NULL;
>  
> -	ttm_bo_get(&bo->tbo);
> +	drm_gem_object_get(&bo->tbo.base);
>  	return bo;
>  }
>  
> @@ -865,13 +865,10 @@ struct amdgpu_bo *amdgpu_bo_ref(struct amdgpu_bo *bo)
>   */
>  void amdgpu_bo_unref(struct amdgpu_bo **bo)
>  {
> -	struct ttm_buffer_object *tbo;
> -
>  	if ((*bo) == NULL)
>  		return;
>  
> -	tbo = &((*bo)->tbo);
> -	ttm_bo_put(tbo);
> +	drm_gem_object_get(&(*bo)->tbo.base);
>  	*bo = NULL;
>  }
>  
> -- 
> 2.34.1
> 
