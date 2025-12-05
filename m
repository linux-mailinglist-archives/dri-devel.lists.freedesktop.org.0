Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D974BCA84B9
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 17:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017E310EB64;
	Fri,  5 Dec 2025 16:01:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lnCmaPKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C221F10EB62;
 Fri,  5 Dec 2025 16:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764950467; x=1796486467;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kc8I8aaHph9lxF2IR4llbvNY/3cRYWfXJzcg8o2ORxk=;
 b=lnCmaPKfOF0ZwdH+ziuY8tfls9gkGFWaKDHc8IYsV3aHSA4XjjFPeM0M
 laF4bguYSmYCw4gnVUZSJ0vvR8eVaS5AcF2uvr7sw7zCuHcXMi1CfG5MM
 oqnlWuEo+KlqB/fpq9m5/i3lEoHP2DPqZmHN6UbaPlu3rwPW80JRbYEkk
 jUM+ZB009vB39WNcVNvCHn1znVlmJn/7ehswTe7FSAGGlKIcFrSOWrJSU
 hJNppJhUsYBt8yh0tqi4HRU43P3O5w8EPmTEepn1FzdKn3a6ldPS/CX3N
 T3HoINdjSKrq9HemJNv0Wuid0m3PMofi+q5nkQSKYR9KGic6pfrwwcFJU A==;
X-CSE-ConnectionGUID: OmwcZKKxRke83M4p5vo82g==
X-CSE-MsgGUID: s5z5PL00R9iGIq12Oqd1Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="54532094"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="54532094"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:01:06 -0800
X-CSE-ConnectionGUID: FcepSrODSSmvS4mKvvGU8A==
X-CSE-MsgGUID: t6ZtDti6Q4CDmhhImYyoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; d="scan'208";a="195770221"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 08:01:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:01:06 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 5 Dec 2025 08:01:06 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.5) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Dec 2025 08:01:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TuCrLiOFQDY/b6d84s2x9SdZnXW9yPVfvwcnMhtcr08vz6KOZA7X8qVE0M5HuyrGCvOzULLN4TOe/wXc5DkjbITfRZtxQH0maqTUUzOsIPHLAa1TZNMTlvPsP4GYS+PzHJCng5Ntgb06K6UhKfIT8td3gXX6Q6jFEj+RrPXyr50csBakdDUBgNXlSza/DXCHFZp1Y5Ju1+y5DH/ARoIALSmwPQ6YF4tGX0vHMA+0wYvuzw9M32Yh3bp28zQeru1AiDdGFeHZnR/cI6eFJMwLku43fyt/IK51mB9QsinF2lQ9cMNCnhAS3bGud/knHxIWNzYpBL99AV16HagdwDmFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BBDgb2uML/iWvKCurWEWF11vk3rDty/5XKp2BdMQH3s=;
 b=vbGJz9hkvFQXdYJxCY7TYI0KwDvXV4E9yWG3XrOY7w3Z6o+X80PhzryZW/HLaBl8/aGDDKUgWo2QgPhPB39YPEGkvlNErhfqU+O/hOwlxBq00upDO5vjTPJrvrsH3eHeUC+/vh3aTqs2Us33FmVnFOygX5DRa2X9N/KnnkzPk8GFlvbvTttrsbUfRoMbBCSdqiNli4QDGnDoWsv760ZVNmu7XiBcPPUTH12hXskHHXwIyW6Q7GuvCgRCnh+bSIvdz+GRQ/yysmAWTRqaVX0MD8VMGV2/tJ16SN2KWVV5YNBXzQt4pgDkXb0/R+1P9iDn6oLaIXyuibh2XOx+KrDk1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 16:01:02 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 16:01:01 +0000
Date: Fri, 5 Dec 2025 08:00:59 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: <dri-devel@lists.freedesktop.org>, <kernel-dev@igalia.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: Convert syncobj idr to xarray
Message-ID: <aTMBu3AbnDwMp27C@lstrano-desk.jf.intel.com>
References: <20251205150910.92913-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251205150910.92913-1-tvrtko.ursulin@igalia.com>
X-ClientProxiedBy: MW4P223CA0005.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7a6e0e-c508-4b64-cb90-08de34177cdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NyppHkdkA8N1BALi31qH1W8/O5uvxGxSlBY018nFZzweg0tyfCqwUKK0AYzf?=
 =?us-ascii?Q?VY27J5ahVUWxesuSy5M7N++KavA8gqJK4KOd7dNaCAW1Mg7Cnn8AaCWuqDws?=
 =?us-ascii?Q?y36ZML8X9UoO+CNbGQsUvXmX8lAXxtUkkp6LngWxZ8OnWT35bEW6Mo4tfO5d?=
 =?us-ascii?Q?bHiLA6nRL+RFg9VS5/HcualGGYDdp3nNssCN5mnTAmeTOgekELm7RTWf2f9v?=
 =?us-ascii?Q?ZhPoqhjPP07ChMltvVU2kucEA/8FaNkT+5g/GvjgiBaoa+FkwBIgw6tdA2jM?=
 =?us-ascii?Q?7PLMAFUQyNyb/so7Jnmu3BzkBRLcf0Wy82VZ5PmqPm+FYi5W9Hgsk+Q5AU3P?=
 =?us-ascii?Q?kPmRbvN3DymtA5XTu1bEdOU5w0s95+iJeeIxOysN1k4mLhWhuqWxqyJYfTOZ?=
 =?us-ascii?Q?2euRg0fFcmsatV+z4WtTtlEKodpxC7/JWpOVEcGQAEGTjgx0KbQs0f9teGKP?=
 =?us-ascii?Q?9X1xLH5mgFl28zWu3HroknbTLaN51uA9VzaQVM0/yExQHQd6cjME/6S2toJf?=
 =?us-ascii?Q?rENcVDuKpYUkll3uHyZrEM6lF3eWU0tDSwLtdeGqHkVB98u9I5n0PaDOQMdb?=
 =?us-ascii?Q?s5hT4JE+p77NAUv8EYEfmQpyn7UwR9oszToMUZzO+UB1A/qOlQ3gTwS78p1f?=
 =?us-ascii?Q?YCk/9VoIYqF4A8riA9E2i87QJHOn1m7TbPp9CJf/yMx9O8S9C39+0mNDEAiR?=
 =?us-ascii?Q?npgf85YxVfx/tmDX8yBRhJUSPx5uIWiyVo/0vWIlszv+HAhjWvJmQLrpqnsB?=
 =?us-ascii?Q?J92czbKuRGYP3N62Pv6+Yk9bxhNd4qimP5JZA1C3B4pNhYT7ctfMtPzQoTax?=
 =?us-ascii?Q?jbyhBduwJYEvs1aT2QiGsvT5dohFpSLsdSg2pFmb/Ti65WRq96PZyKLMZ4/O?=
 =?us-ascii?Q?S9jJYbwn3W1ftATTKeG+EQewTA4LTOJxBT5UBayN7FIJ+/djuZ2zGOtUl9im?=
 =?us-ascii?Q?hal8BgGRHJu5Kz1DbdFGYlu+yLol6776fIeepIx253Jl6qvUaaCQ996a1s3j?=
 =?us-ascii?Q?hhuJmOZJIhl/22MluqWCtCgzfttpl5svdszW3hlBDaulAoAbtOxh4+lrxgwf?=
 =?us-ascii?Q?r7R+rAtiIYexQc78PkMotyxlmppks/reEvuJ9JCG6zw4mVVhb78W76rSxo1D?=
 =?us-ascii?Q?tIUjhDXm1SJZX6kYYXJa9m/+34FaVJ0MPYq4Rx1jVrk7vNEGZ/JTjlC2J8gh?=
 =?us-ascii?Q?mIz2UpXGCz+XuNWXq9jvzknkwml2T+scNKMhYheCQexixXW1ytdr9KRU21Le?=
 =?us-ascii?Q?PXFoTJ4mpM8S/t31TgWSrnwjn7yfNPSami1WPqifyJdiAfMG3/4t6kKicUOn?=
 =?us-ascii?Q?OiqAwT1SRtodxB/QnSdskNhTFrg5DDAq3UgSzWcnbbeErAgRvSt42cwGtdob?=
 =?us-ascii?Q?cP2QGg173PZE0uPWB9zaUzTkRVm144clWZzlJC5nIJ3vFBhUdlZHF9I6vNSA?=
 =?us-ascii?Q?Dyp1+QSWR6wnUJWdh0xq37mges1F9ygP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LU6qKWXZtueWXhqUwNugm0adcFQ/EBEcyOzB95DVjGsaYDQU5xtdf7XUxoYT?=
 =?us-ascii?Q?zEu1zWhS+Adp1H2fkJ8qk7RAMK67dUxa+D3HQK4hafVxCLw1q3PbxViA1qG6?=
 =?us-ascii?Q?GXxps2d067jH/JHZrnLVnvqw2kuNDfdHMnPJ/i93lwo4xJO76b0+AoEn7Z2E?=
 =?us-ascii?Q?GwTDWmvB1ECBlaE/L+QvwMUgOHTFpY+t1QWE5hqdl15yMEOs9gg+2ra2gnG2?=
 =?us-ascii?Q?VSQtH7g0X/xmub3aOx+oyS+eTGbycEtVGp4lhy3DkhG1+pp8ptPKTTc1LSHB?=
 =?us-ascii?Q?d3P/ACa9uz1a7o4cGp7bFovE9hiYADdGFHNXi11deqU5gZdSzNk7Usln/btK?=
 =?us-ascii?Q?9GNIKTVeOVAa06+pMAx498s7t1Dr9mMC1Ywwc9KJ4BbcR/N8RFG8YPmHDear?=
 =?us-ascii?Q?txTmogPYgnIdKVC3i2++2XWZMUr3ArDT+7kCNLNdF37KFDtU1bTOjbzTnuDI?=
 =?us-ascii?Q?BM+LM4+cpRLCeagh1GIjAr52FhWk6w0Hdm2BqJtbYsLAzmKDHy6DPoegsfUa?=
 =?us-ascii?Q?ZoRyozQf259LrTHU28bndnUBGKRKV4jy0P7uFT2WJamkI+fCdX5/PuSE6uSs?=
 =?us-ascii?Q?fX/pd73jlMLTTNITF0slUd9bHp8+5WTdgeOAzDcjVxltrR27slmfOumnRsYz?=
 =?us-ascii?Q?+lppepu5K5Q6TbdYeQemvH7kvwPtLAKmZI6RPfzqfsr7E4qeUL5TkU+seVtf?=
 =?us-ascii?Q?eTzt6QblNrEZ+81y45Ly53WJClvDDIodyhVWTWYxui48WZ3bxKTcbCKw0+zh?=
 =?us-ascii?Q?dHVbYUlhqdmHwTsnaPvqvWYIdCzhUblTctgineOUl02YacVzv9m2DQte5nln?=
 =?us-ascii?Q?XraJOnooup3QuEnKDCFby1DhVFWmfGXztW9ptdyyIAi+NRAZeHZYyHvP92R0?=
 =?us-ascii?Q?CNoWQoSiXpqBhS1rhJlN6qOf0jdwsXuDziSdMNiVZ0Y6QrB17GRiCeOlWY9C?=
 =?us-ascii?Q?AhXPtPSADUCgtUAdEinLDJPF1/x2odb1SZegkwWVt3/PbxahP7Q+u/zH/d51?=
 =?us-ascii?Q?LtbtmeKK7SMK3rpaDG1WM3Idq+q8cITIWpU4hCwlu/DNCZNzzjpCLPWYTOZT?=
 =?us-ascii?Q?pwWySufmAhJz9eP5/veSCQk1vj0L2r1LrpCbDPrSaKlRz7GclEri5jq3h4N1?=
 =?us-ascii?Q?5aF+5IWI9yAYpcxwLYTyfs+JMzbtOUUcT2F/FPGEWRWzY1vuvbPoRGsXV9x+?=
 =?us-ascii?Q?IIImO003X3WdoOgjjT3ZEcyt4hwOeC1hghdjJnj/75PIqZq8ZUcpKK1JfBn3?=
 =?us-ascii?Q?6otSS6HK5jGFWZ7ijRPLPnMHYF/zZQmDRJ+Q2oDvc7AATzYDyw+TedkBLF/t?=
 =?us-ascii?Q?Dc4QaivghdHFcd5Ot5Zzdc+SqTbTAlovRJHXGuoWQqrHFCdATEL5LenQ7A4V?=
 =?us-ascii?Q?cm39mEskSChW4Mj4gFV6SKqhcP0uzhTXf3QrmIW1ZSZoDcp/X84DOk5RR/Jm?=
 =?us-ascii?Q?avSYxb5NbPHfBZSva03/8ezraMplb+UNQgxZZYtbiCbIg/fXlZMKUVXQSj22?=
 =?us-ascii?Q?vHL24UoRvsZkObgvhu3p+AwKMjjYC6qkviYySKX9UMDLq27hojnQrJu7uSKm?=
 =?us-ascii?Q?EI4EeYAECswDi8XMzsXoWorSM6iT2eAGrcfQunPgJ+CUIt5YgMEKqitgxTP3?=
 =?us-ascii?Q?bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7a6e0e-c508-4b64-cb90-08de34177cdd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 16:01:01.8630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3ce4ra7SFVfv33ZICZNLLbIAI4gRg1LLA8pi8eyl5EvdsM8zd9Uocf2HDBv3SVw3ULkbltWA/IdAy3Pc7K3EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Fri, Dec 05, 2025 at 03:09:10PM +0000, Tvrtko Ursulin wrote:
> IDR is deprecated and syncobj looks pretty trivial to convert so lets
> just do it.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: intel-xe@lists.freedesktop.org

Nice cleanup. LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/drm_syncobj.c | 65 +++++++++++------------------------
>  include/drm/drm_file.h        |  7 ++--
>  2 files changed, 23 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 0de70c8fbb99..06bb5c6c3f60 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -258,14 +258,14 @@ struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
>  {
>  	struct drm_syncobj *syncobj;
>  
> -	spin_lock(&file_private->syncobj_table_lock);
> +	xa_lock(&file_private->syncobj_xa);
>  
>  	/* Check if we currently have a reference on the object */
> -	syncobj = idr_find(&file_private->syncobj_idr, handle);
> +	syncobj = xa_load(&file_private->syncobj_xa, handle);
>  	if (syncobj)
>  		drm_syncobj_get(syncobj);
>  
> -	spin_unlock(&file_private->syncobj_table_lock);
> +	xa_unlock(&file_private->syncobj_xa);
>  
>  	return syncobj;
>  }
> @@ -606,23 +606,15 @@ int drm_syncobj_get_handle(struct drm_file *file_private,
>  {
>  	int ret;
>  
> -	/* take a reference to put in the idr */
> +	/* take a reference to put in the xarray */
>  	drm_syncobj_get(syncobj);
>  
> -	idr_preload(GFP_KERNEL);
> -	spin_lock(&file_private->syncobj_table_lock);
> -	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
> -	spin_unlock(&file_private->syncobj_table_lock);
> -
> -	idr_preload_end();
> -
> -	if (ret < 0) {
> +	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
> +		       GFP_NOWAIT);
> +	if (ret)
>  		drm_syncobj_put(syncobj);
> -		return ret;
> -	}
>  
> -	*handle = ret;
> -	return 0;
> +	return ret;
>  }
>  EXPORT_SYMBOL(drm_syncobj_get_handle);
>  
> @@ -646,10 +638,7 @@ static int drm_syncobj_destroy(struct drm_file *file_private,
>  {
>  	struct drm_syncobj *syncobj;
>  
> -	spin_lock(&file_private->syncobj_table_lock);
> -	syncobj = idr_remove(&file_private->syncobj_idr, handle);
> -	spin_unlock(&file_private->syncobj_table_lock);
> -
> +	syncobj = xa_erase(&file_private->syncobj_xa, handle);
>  	if (!syncobj)
>  		return -EINVAL;
>  
> @@ -730,20 +719,13 @@ static int drm_syncobj_fd_to_handle(struct drm_file *file_private,
>  	if (fd_file(f)->f_op != &drm_syncobj_file_fops)
>  		return -EINVAL;
>  
> -	/* take a reference to put in the idr */
> +	/* take a reference to put in the xarray */
>  	syncobj = fd_file(f)->private_data;
>  	drm_syncobj_get(syncobj);
>  
> -	idr_preload(GFP_KERNEL);
> -	spin_lock(&file_private->syncobj_table_lock);
> -	ret = idr_alloc(&file_private->syncobj_idr, syncobj, 1, 0, GFP_NOWAIT);
> -	spin_unlock(&file_private->syncobj_table_lock);
> -	idr_preload_end();
> -
> -	if (ret > 0) {
> -		*handle = ret;
> -		ret = 0;
> -	} else
> +	ret = xa_alloc(&file_private->syncobj_xa, handle, syncobj, xa_limit_32b,
> +		       GFP_NOWAIT);
> +	if (ret)
>  		drm_syncobj_put(syncobj);
>  
>  	return ret;
> @@ -822,17 +804,7 @@ static int drm_syncobj_export_sync_file(struct drm_file *file_private,
>  void
>  drm_syncobj_open(struct drm_file *file_private)
>  {
> -	idr_init_base(&file_private->syncobj_idr, 1);
> -	spin_lock_init(&file_private->syncobj_table_lock);
> -}
> -
> -static int
> -drm_syncobj_release_handle(int id, void *ptr, void *data)
> -{
> -	struct drm_syncobj *syncobj = ptr;
> -
> -	drm_syncobj_put(syncobj);
> -	return 0;
> +	xa_init_flags(&file_private->syncobj_xa, XA_FLAGS_ALLOC1);
>  }
>  
>  /**
> @@ -846,9 +818,12 @@ drm_syncobj_release_handle(int id, void *ptr, void *data)
>  void
>  drm_syncobj_release(struct drm_file *file_private)
>  {
> -	idr_for_each(&file_private->syncobj_idr,
> -		     &drm_syncobj_release_handle, file_private);
> -	idr_destroy(&file_private->syncobj_idr);
> +	struct drm_syncobj *syncobj;
> +	unsigned long handle;
> +
> +	xa_for_each(&file_private->syncobj_xa, handle, syncobj)
> +		drm_syncobj_put(syncobj);
> +	xa_destroy(&file_private->syncobj_xa);
>  }
>  
>  int
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 04cad0c61513..99c71ec3ad44 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -34,6 +34,7 @@
>  #include <linux/types.h>
>  #include <linux/completion.h>
>  #include <linux/idr.h>
> +#include <linux/xarray.h>
>  
>  #include <uapi/drm/drm.h>
>  
> @@ -320,10 +321,8 @@ struct drm_file {
>  	/** @table_lock: Protects @object_idr. */
>  	spinlock_t table_lock;
>  
> -	/** @syncobj_idr: Mapping of sync object handles to object pointers. */
> -	struct idr syncobj_idr;
> -	/** @syncobj_table_lock: Protects @syncobj_idr. */
> -	spinlock_t syncobj_table_lock;
> +	/** @syncobj_xa: Mapping of sync object handles to object pointers. */
> +	struct xarray syncobj_xa;
>  
>  	/** @filp: Pointer to the core file structure. */
>  	struct file *filp;
> -- 
> 2.51.1
> 
