Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FFA9AB5B2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 20:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E08310E6FE;
	Tue, 22 Oct 2024 18:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MYcb2jvC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75D910E168;
 Tue, 22 Oct 2024 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729620243; x=1761156243;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ElyFgg2JOO/tiShuPDm3VZmCZlZD8i4r8L1NotD/fFY=;
 b=MYcb2jvCRkdxQu9pBhcwSLKAW/ptzKqz98KABYXE8j8mTpBarC7CnBwO
 SHfDrbSmzOcbLqEMOi2ytRAfBwglHhl8l0WumUwxlaDHTxfOhMXoqJn94
 6sz83Bd+fNsBTkqA5yK9Tcefox5NSJcY/czWuDouzWjKtsc0Mxb5MbMz9
 IVKBqHWtZBvwvZUcqLUKgyksNs9/J/7jTC8Q/MBnruG6lvmKcKn88oIU6
 T5W1fAY71xuWl1I+mw4o7/jiiHg8roEq2vhpFWwk+34L72XVV+392x03b
 hXwqsXllpVkhSSqWkDhhuVzSMoe6ZOUF+R8MPZgXiVZZ5KwIcuAGF94B8 Q==;
X-CSE-ConnectionGUID: pbSxed7PSNKFHUwGsxA3cA==
X-CSE-MsgGUID: tuBDBIFnREWy3VPHf5TuEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29284374"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29284374"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2024 11:04:03 -0700
X-CSE-ConnectionGUID: jxk9/ttLT1unCeUXyBzeaQ==
X-CSE-MsgGUID: COtEQQnBQnSow8246ieefw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; d="scan'208";a="80756966"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Oct 2024 11:04:02 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 11:04:02 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 22 Oct 2024 11:04:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 22 Oct 2024 11:04:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 22 Oct 2024 11:04:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxr38QLz5PRkNdcif4fPYBt2iLCliu9NV1IWlGbFPyD0NjmgF8cpWB9KMbVSuEJExsmMf5hHMjBfRHfdsGGZLZUkGm1ZIbEU9LAs74nqwLSe0oM5eQYrqwnFUQmOLLZAS9BteBcOCHdIah2I3m3aWtl+wjI487X2tC0/KEq25CPYpBnTlRPop0V+VtEXeXJMgWjrxo3UM4UO2UQV5waEHpAq8xo5Dka0XaMI8rICKDbwwe2rW8INUaDdFb3cMotRECBjCeuQjOZ/2xpQcZxriQHwNDvt3GBcNbv7OQrSo2yYMxxcpJ3+l9x4ZIHYl2HD46q63ieSc6rRxJoA8AtKCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5/7Qqy4tISMdcb2WPx+mw3PgVWFsd6E/BF4YJFsoLI=;
 b=HHLq3Ee9gzrTwWVp0tAFYc8R0tna/eG0K0khMEXGjA6m4Jv1RuWGEW8ZvrEgyOlxLn2FL5s3yuDgGK3VIN/079Yf0QEdA0FGBBbGjQZWLgZYLJH3DleibPb5Dp6NsEC/UEafTNztiI6IFVsaNa/uARWOvfitVO9FAiiD0+8wFseZh76/9EJftetUQVflsDXA8rZ4yCndTEYRyYvijb54EZFDVepRIBJHteFevS7QRaNHA/Dkfw7s6lyVHvrPTEWplZ9vzYqJ3rvzn0lNd4kR62sBiCb0/opZ26fSNmKrrs5VGzfjo+8GqG5uGWZE3ZgU3YHHzm2pMYyAs0S7ZO9/ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 18:03:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 18:03:57 +0000
Date: Tue, 22 Oct 2024 18:02:49 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <mika.kuoppala@intel.com>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 6/9] drm/xe/display: Update intel_bo_read_from_page to
 use ttm_bo_access
Message-ID: <ZxfoyXvxKgsl+OC1@DUT025-TGLU.fm.intel.com>
References: <20241021211835.1675640-1-matthew.brost@intel.com>
 <20241021211835.1675640-7-matthew.brost@intel.com>
 <0dbc501e-c0b0-426b-83bb-fd07c8560876@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0dbc501e-c0b0-426b-83bb-fd07c8560876@intel.com>
X-ClientProxiedBy: BY5PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::27) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7258:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c929f93-596b-49d3-6d05-08dcf2c3e5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gn4otMXR8bNiEpf1n3jkEiR9YaqjeSBoIJlaWrNaKLyjpBNaiVga69qsBtFr?=
 =?us-ascii?Q?m6i8S3vHbviwD9Pqiy5DHVqZ0xiojBTbThNKDbDCBuMzyJCsEUePBtDgJtz5?=
 =?us-ascii?Q?7Av+mxcmBBKBKj0pMFVIAyALdAQjTfPwP2pmmMAMF1Adq15uOvtrkWq9LC5Y?=
 =?us-ascii?Q?UDbaRuulwd7ISLelcF0uZshKhXXozlcXR2tmAD5257UQ8lzqLkKQ0yQ15yMI?=
 =?us-ascii?Q?dESBb1kGdJ0PRj+EXN8Y5CGIEHx0T13Z5L2PmqWZgVILtu/rV1ZBxxKYRgm8?=
 =?us-ascii?Q?IdCNuVq+bcYMrT5kSKl2BbZ5FRglSAM74Ih+jJr9uLschPz8k1Tu8YRLVEhv?=
 =?us-ascii?Q?6BbBU/esvl5VmPcDxQFrTj39KQ55fjlQXtsahaFoNkshn8FZVI55Hbxh25FG?=
 =?us-ascii?Q?47b8RsFX4cbRNtayxSojOrjW8l3jfqEpzqsJtOMIOajz0oyoGpsEpMcK7rdm?=
 =?us-ascii?Q?7q5xA9s3cNC//rInzukpveCJ9yvLOOIrM6szbtQOl9UUhi990EkDzburEaBF?=
 =?us-ascii?Q?k9ZOGSLXUpyiQz/1FvW0AgUmf4XcMYx9IAfHmtbCXUZ1rHGcPttc3avHazpX?=
 =?us-ascii?Q?1f7WP6cd+UKhvNpLIzG2kZspOHBv2GknhyjYpHVTbdntunD3qR0u3FtaLi1d?=
 =?us-ascii?Q?cOUYMmvvjSxwtdnkNsLLjE6LnZwHV9H0tHyfBiC1asKuWRLAfknbBmkloLk9?=
 =?us-ascii?Q?Z2Okdz7i5T8IlPjScYNeGnJ+aClkVNlTz/7mxpcesTqSMCtP8W0nolNP1F9N?=
 =?us-ascii?Q?pGdKSJO1qZRx/uPlp9btxU2DubCUkwHENmXCzkOXmUvdF52D2KoJtEbKlbvQ?=
 =?us-ascii?Q?era+WMrokt3BCQYmraxosBKrEYekmzCQE3NZzuaXr+My4sL0U+bMpG9dtCqw?=
 =?us-ascii?Q?9HnySZmmEXV6fLPO/eLF7o6Iy6lKyIfVevv38vdjiSMBoTr5yL75RS4aYWIk?=
 =?us-ascii?Q?UmjI6X8oSbumpdaNq3ADXZHBFXbHYZSyczqB3AwLBrdbYfGhIlAaw6Fy2ULZ?=
 =?us-ascii?Q?+pm9nwRZ8RAVtzTfRnscObZvg8y9EscG0xgmTKdNX9ZYiL3hi1EHkypgTNN+?=
 =?us-ascii?Q?uEPgee/lETMS9G93ZHW7EFIwmWxuJHj3jKiSzxeX3sCyGi408HPv3EVhr2Ri?=
 =?us-ascii?Q?0o6l3IAxlr846JWOXiRnUrTEXhk1AkKP7fDQM+k90GgBqxFtuDVsy5QDunOM?=
 =?us-ascii?Q?tO3cyKYW19Vv0f3Sxk9eF/fOsm9JghA+6KxZMzfB6k6cGw+pzOsSM+mIijjo?=
 =?us-ascii?Q?JGSZJUZHh6u1ClFMGzO+EPa09Qok/aYl5/p0QCBZAJPafq5UGEVTG5PwaEsu?=
 =?us-ascii?Q?4iBMQLrbTPv8WI2jjjMecp0f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GEsVvQcW9cn962h2Wa1/DdYkIG8uDKJAyrUWpj5j2Mpr72x2h+tcywbRRw/T?=
 =?us-ascii?Q?Q5QPdwT3SzBZjMf6mpHdoGka/Y3s6qCp/bVYJ03/iT6iuPAtfhSnEgcbobzk?=
 =?us-ascii?Q?WW6sJTNlmqcMMXockxeSYWEaDi98CTeEd+sbzd8lpykk1sJQeg0OPNSG6XTV?=
 =?us-ascii?Q?I87XM6dCWQjNHGsk70Otky5Mq2DcytlFpcvlSWLK5kODSO5KBA+9oacaD+Ta?=
 =?us-ascii?Q?BQUBU7kysw4Y48BohIy9MzKP2IQBy09O3BbLa9asAo/LyZ4dt6z46sfkogaH?=
 =?us-ascii?Q?jk4rDv3Sqi6Vmfmksi9YjZTmz0JFfghK9GgcDxClPzWO5f4KgQHNl6Oure35?=
 =?us-ascii?Q?P9KyllL9yBpOGBMsxeJqRCdClkNfgzSA3ZrBgzyD1hXVzPPzjpdqCqX/ZFdz?=
 =?us-ascii?Q?tYDqyONCyXljLBPeCSI8nwC+OXwVrXdTtCKfpJffC+ENewneT4UidfbkVqrE?=
 =?us-ascii?Q?4+JnWI5NfqBolnku1yO73fwcOyqelREkMeDVYQ2CnLSGXPnyEM9mYvXiGHiX?=
 =?us-ascii?Q?61ZwLdM93p+zRf8+hIreWn0eyM+ntPGDltgwTSPKNZzLRul8QliYhnza5zRZ?=
 =?us-ascii?Q?BrxSYwfWcde9i+pzQP37BkQtGQSkaJQJANIl8xMlwsuTlvEJVfuvpKCXYRxz?=
 =?us-ascii?Q?aadLKes0ViDd0Bl6Upxyrib629wuvtx3nMyL44RbIIFmLueIIiwk+UBz+9pI?=
 =?us-ascii?Q?obUqXFe2B/97RABgMpFEd3nP2x/3u4QQo3HNfLNlyh+XGjMD5FzBLQyxCcx7?=
 =?us-ascii?Q?Jg7zy2piOy5tuOXfRt4wTtDG4bjWbwJ943BOkB6rlwsPr1kEYOl1JhKAZb61?=
 =?us-ascii?Q?W3hnmRTeOY33yRkb+RnglewGMBfubcXzD4uR6UAlaZkw+wkNPQo3u91ITq8Y?=
 =?us-ascii?Q?iu53ZL5J7w8X3Z4t262ZQXmJviX4ZSNqjDzMfGk2J3zVFDg2KRBY+9pypWTS?=
 =?us-ascii?Q?54skQb2ku05XJ2pSPu9vDDGr4S4EDcE0eFEzMPZCoPdhc9oJ2Rf8R8akryyY?=
 =?us-ascii?Q?Y7Mm00IgskA2hsbKQ3PFcZlsGpgvG5lL/GmlUyRzGOpnXPdJ+weEtcnCmzmA?=
 =?us-ascii?Q?3qdngbxlC6j4/1HC+vm9GnV8vNRRhz4JSvv6IuL4/bX90WSebNnsJILM6TWl?=
 =?us-ascii?Q?AUWUvTnjK8vkIgqc3rI9NlLf8OlBADVMZeCIMJiN6GoqDVdb+nH0nLaYfd0E?=
 =?us-ascii?Q?l/jxXZhoG38dNWBQCF2aJxmyiIermnevnMhbYieUErMaV+mV/6Wsexyo+eiA?=
 =?us-ascii?Q?H69KYYkUJYSKWAd1SokZFFqTfyIfm96bw3Q4CZWlG3nwcVapYuvvW+chSgs4?=
 =?us-ascii?Q?NTy6Rx7B/FZ5STdv9uB01jP2T0GUkm4quchdJKxxgdKzMye4ddiKnBDL8JPa?=
 =?us-ascii?Q?5KQ9Noz8H9piwuHs2MUZXGmSuaW/73tD9D9G0soK4ZfkKuk/D86kqSWstzTl?=
 =?us-ascii?Q?OaW6M8Qico4loTX+EvAuZbIFj9pAwKh9dYf0whxuB3r657fYmPY0PDQ44qu7?=
 =?us-ascii?Q?MFQe5b3DMjYr4lCVsfwdjADkkjtITTI2tIZ/0TjFgnQiUSOEDr7MH33P3otq?=
 =?us-ascii?Q?3LGHVuXWEq9Xt+QpC4p+eGRrZmcCyel1X+ajXOLaZbGpqVDzZnFkjuDLF7+R?=
 =?us-ascii?Q?Ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c929f93-596b-49d3-6d05-08dcf2c3e5fd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 18:03:57.2153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NRkp/5OfOzqzx4a7Vy5DeFuehKNkuNTmpX9rEq0zrNkJlOHoS11jpzQo/DVcLwjQ3A4+uIHpPHAXU5tSfzALlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
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

On Tue, Oct 22, 2024 at 09:43:35AM +0100, Matthew Auld wrote:
> On 21/10/2024 22:18, Matthew Brost wrote:
> > Don't open code vmap of a BO, use ttm_bo_access helper which is safe for
> > non-contiguous BOs and non-visible BOs.
> > 
> > Suggested-by: Matthew Auld <matthew.auld@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> 
> I guess needs fixes tag?
> 

I don't know enough about display but it is possible / likely that FB
BOs met the requirements that ttm_bo_kmap worked. Regardless safe this
way and I suppose I'll add a fixes tag here.

Matt

> With that,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> > ---
> >   drivers/gpu/drm/xe/display/intel_bo.c | 25 +------------------------
> >   1 file changed, 1 insertion(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/display/intel_bo.c b/drivers/gpu/drm/xe/display/intel_bo.c
> > index 9f54fad0f1c0..43141964f6f2 100644
> > --- a/drivers/gpu/drm/xe/display/intel_bo.c
> > +++ b/drivers/gpu/drm/xe/display/intel_bo.c
> > @@ -40,31 +40,8 @@ int intel_bo_fb_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> >   int intel_bo_read_from_page(struct drm_gem_object *obj, u64 offset, void *dst, int size)
> >   {
> >   	struct xe_bo *bo = gem_to_xe_bo(obj);
> > -	struct ttm_bo_kmap_obj map;
> > -	void *src;
> > -	bool is_iomem;
> > -	int ret;
> > -	ret = xe_bo_lock(bo, true);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret = ttm_bo_kmap(&bo->ttm, offset >> PAGE_SHIFT, 1, &map);
> > -	if (ret)
> > -		goto out_unlock;
> > -
> > -	offset &= ~PAGE_MASK;
> > -	src = ttm_kmap_obj_virtual(&map, &is_iomem);
> > -	src += offset;
> > -	if (is_iomem)
> > -		memcpy_fromio(dst, (void __iomem *)src, size);
> > -	else
> > -		memcpy(dst, src, size);
> > -
> > -	ttm_bo_kunmap(&map);
> > -out_unlock:
> > -	xe_bo_unlock(bo);
> > -	return ret;
> > +	return ttm_bo_access(&bo->ttm, offset, dst, size, 0);
> >   }
> >   struct intel_frontbuffer *intel_bo_get_frontbuffer(struct drm_gem_object *obj)
