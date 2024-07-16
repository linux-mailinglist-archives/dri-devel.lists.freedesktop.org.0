Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D989333B3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 23:39:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA9910E8DE;
	Tue, 16 Jul 2024 21:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UJREbuB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B479610E8D9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2024 21:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721165920; x=1752701920;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=/TqiO/ujKMYGKrCAmmA0++NIh4v+/S3SEK0GXuW5KtY=;
 b=UJREbuB+Rsa7HIFf4ZjWWh98hjBdPNHbjbHSiWEzChz7TVW8k1Gg6ySf
 cOzcnbjZvb2O7Ebbwp2Gb3PjP0/MbyAMCfJ0lUFQdocYj82bonDvX+jI3
 r7WeC0HOtru338le4uIoKPcbx5J7iPGeurv7+6GDkqrjz7CXJ3TNA3UfX
 gtbu4r1iD1xOEApR+/OZ77mXzwJ8pLZ3pzY7k5EnnIs4Q/7ufdxWKhUFR
 CEIRLmMyW8S/4ADt5T4qPON2KwlIleMnTyBKic2A04hgBv1PAzhwsZucs
 U8fHrvUY/q2lDm0dU5YFV03gSfecpE7wWB0KtkfAK1dQB1RBhT4uACTfN A==;
X-CSE-ConnectionGUID: e3OpscmoQNacn4acyl+HJg==
X-CSE-MsgGUID: 7OsXivIWRMCfrM5RQ7kdRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11135"; a="18770162"
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="18770162"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2024 14:38:19 -0700
X-CSE-ConnectionGUID: bVs4P/eoRFq/wXXu6w4aeA==
X-CSE-MsgGUID: dUalRGIpRDy8mljtZw98fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,212,1716274800"; d="scan'208";a="55312431"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jul 2024 14:38:19 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 16 Jul 2024 14:38:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 16 Jul 2024 14:38:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 16 Jul 2024 14:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEbpXLMPneQ6X6GcR6DejaTvEr/+Z44gZtqt2ftUjrlIagVo4ZjNX3mM84jo7GaJ8Pv4UqzNG+7YfT2FaXkXkMYGLbEQDqwAmeg21O5hwSnSsy8PDsnP0Rl8NEqKZQeSQSpN4pEaBob9P5EImfhw4gYNsLewy/lWUwVRTF++jvkkqye/Z5HJflXhXaKIS1TukMvvocEdnnEU+0jcEwJmXv1O8tG2xstf3PmNmatUczYUkBQC1MHCygIHAvVRZ9/WP23OgAycrM+shASbIHa5wOMV8+H864EHlcatzlIBr0HPPIFttS5IF4UPJtlMX/Te964HLY5v+pt3nMBNDKadkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqJQIGGI945XhBdJ9eJ/xapMiRyM+zY2ZFXyjKSu4ls=;
 b=X8THh88ex3Enr2ZqwrxXRJIFuMuAPhCp9YRk0fIGG92D17hFr6hmkkvkYX9e2g+IkADUw4O/asplS3AYZsfMS4gUJkrDUQAwKAh3k2CSCVKQJZbSp1Fdsc4DNzpQFUUA056aM9uVMBKoHfhtvcxE7UfH4HT/6tC+yj7yvE8g4l5NcKt/H7q2h4vzxFwUnWVDZ16Uz7YAJ/+aIWpjw0jEqa7GsfQyndIl1D+/PeTTY3G65gxivnyfKlm/cg4bcNDvRQrh+H+NaiRmoh8TsSSe3DpxgK/xE2RDmWSx4+HR4oifX/LcZ9zl7wOTeon5ro0SBRR4NfzAWdLODROJDZUozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 16 Jul
 2024 21:38:16 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 21:38:16 +0000
Date: Tue, 16 Jul 2024 21:37:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: <thomas.hellstrom@linux.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 9/9] drm/ttm: make ttm_bo_get internal
Message-ID: <ZpboGfzAI1wHTqS6@DUT025-TGLU.fm.intel.com>
References: <20240716123519.1884-1-christian.koenig@amd.com>
 <20240716123519.1884-10-christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240716123519.1884-10-christian.koenig@amd.com>
X-ClientProxiedBy: SJ0PR05CA0077.namprd05.prod.outlook.com
 (2603:10b6:a03:332::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 46176544-f719-4f82-c19a-08dca5df9a2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?DDfeJpzakxnw2t8VIAngOG8SlhNAWFpcGc/tjorTqoibe+eEyHGdxyCzk4?=
 =?iso-8859-1?Q?cke/e3diRHjHl5qG/gIkZZk659Brc7clZ70BPsMYgMur56KxBq8VkuzsFt?=
 =?iso-8859-1?Q?jVyxU0DYKwETnrPL3zmKtzSxDQ4eswBZxg5Zy4S/k2Q5SoM+aP4CCU6d9K?=
 =?iso-8859-1?Q?oP5w0bp/2ohXTB7AqYRLFDnKgwshWq2dOV8VsoKRQhfkiDt5sNnnKP+MYi?=
 =?iso-8859-1?Q?gjKqPtVQwyfFTRQg8QjOTc6h4dQ7lXv+ss3TtJjpcdSlfV0WzcSxALA5kg?=
 =?iso-8859-1?Q?rhzPrrFfEeYScHOKVShPu4/PGeuPuh3E1YGJa/WyLhawM8mT+hKuN+o+aK?=
 =?iso-8859-1?Q?fMyYBRZWsNMHtAQ8JHNOreXMd7hsxOwEyICI+w5pPIqLiEN4HfupcdZBy8?=
 =?iso-8859-1?Q?4RxZRL36Qp+dkBuL9fb1w0DdWh9C2pB1MRWHqA2qEMs2SZpSdtUdHo0VPk?=
 =?iso-8859-1?Q?TKuXlKzgUMaB4ApiGnNmEzN7ls6T/rZt/cQ2y/vidWahJRaVMVfVqlY/AB?=
 =?iso-8859-1?Q?Vt2rK1ZNuQPG7sBg9D70bNwm5UMX7mvM5AhQDYQzlacDH7fw8AiN5VFVgK?=
 =?iso-8859-1?Q?E5pmXqmcEmAzX1RSN0zI5Tpfw3zglQh8CIKjGcGc/I4FVMTrzuaDCWvNgJ?=
 =?iso-8859-1?Q?RrTlcWwoLwM47iIDaYynoB0eHlBoxmrybs0a0J/t9h+wJWCT/FGb9gK9l1?=
 =?iso-8859-1?Q?qoML615ImA2CObVod7fAWroZQPwUZFH7kU2fODls+/qfDjbyBNzAE5OxkJ?=
 =?iso-8859-1?Q?96tuOzzdDI5MtDiO5YKfaVgCD47KlYYZ7rcf9f/Sdpom3ymGVbb1XwC63C?=
 =?iso-8859-1?Q?eHx7Vi4lYmVWkIxHHLiYvrppwY20+RYaPXD2rH2iAS/fTp5UCUGdZ7CI8u?=
 =?iso-8859-1?Q?FklyD4OXX0RVDgxVfB+I3StJq+j2rfNs6xS4Syy5Eq6FashqxIOxcrtRyt?=
 =?iso-8859-1?Q?Xkah42uXTG6lA2PmAUC21p4mrizktirtJ7tf/8nznwW0aYDFtHwBbCF4z5?=
 =?iso-8859-1?Q?5GO7GdfUpfGPGF7m+VCuic6aZyK++4ie3BAm4LoNtpFKuF2vI3NhY7ldDm?=
 =?iso-8859-1?Q?bPEffDRYeKTCQtG3bFRoDmjBFZFXFBLJvqo21wAHHwqNg+AKjHuRaLGY8A?=
 =?iso-8859-1?Q?UpY7dkRaAWngQ/pDm+Y7ZCEYN56b2KT4EsEfN3YDiVeUMiOLXW+w422pfD?=
 =?iso-8859-1?Q?dX7uKtve+eoG8yxmvT9XoD7TBKNeE5B67NgZji+TtnnS371d2EKz9IQtkY?=
 =?iso-8859-1?Q?gBILkio3QSfwztI8QemzA0x0R8a+45x5hxnlnvztWe8xipa7fwtR4um4aC?=
 =?iso-8859-1?Q?i3xxizQeWjwdCuIzr7FufGyWCxkO5dyQeyU4p4bdiaiD0OZBA9Q6B0WNCr?=
 =?iso-8859-1?Q?oqQTQPPScxiZGwCkKQFBSubJ17AlI9JA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9O+SRLoofLFEhr8zTA0Yl7hGU5rucAEIWsEo3vCqssdS49AkMthC39juVS?=
 =?iso-8859-1?Q?YmAdXrwt1PP0+i5QAwA8EBqLKpw7auEKnBD/FjHwWqqksrZAAxaIO2uaWC?=
 =?iso-8859-1?Q?248joumtpWKQLwlPijlC0jziqDYEbWRaU9NeD/1CBSimraR7X8MPb8plK/?=
 =?iso-8859-1?Q?LuoOdoce7ELOUpQR5r5jGDJOjET8WehDkqRkdMAil59oD5n+G396PATCTC?=
 =?iso-8859-1?Q?g5cafJM6Tj9F+hftDR9w7Aagm2xdYsSj2Ja4bpCjaLvAbfVfQvDHe88xz5?=
 =?iso-8859-1?Q?5BZT290BX3hzrwJqZTcEVUy/+h8pyXdWenqm/KMTaDsQ9p+xrpIwOpZFrN?=
 =?iso-8859-1?Q?G9f3yCzvSDz9ES/tCLpgSZ6HzVH7mI/oCQ+gecId43mAhDGYweL4ScIgKq?=
 =?iso-8859-1?Q?MUdz3zfnag8vB2Ekj8NoexAxYdcFw9W+/hBkKWpZhXoABbaf5K1tJplW2e?=
 =?iso-8859-1?Q?OV9bBgGJyWfuFZbaqEwXSKWz1avzaXevsmpwMgi4fZ1HUZG8tB/Pp9kA4U?=
 =?iso-8859-1?Q?CPhXNmxxBB4iYkPz5elFIQPvQEfX3t8NE80oWtDzYUgjgPXYGD96ULeeQC?=
 =?iso-8859-1?Q?PIieAiq+/6yIfkW6qtNl+FNP1FEsVAxPeHIzxvHYgIuOswkuV8/76W/GX5?=
 =?iso-8859-1?Q?T+h3QfbzGLlkq9DimW0ItX97DSuKKjorxmUb8+05b7A/lumHOHAxXxUXsV?=
 =?iso-8859-1?Q?bcFjvft8cui5JCdyKFlwJH/diRxFTGslxqyx1Bq0J8Q+fxJno8SKIWO97T?=
 =?iso-8859-1?Q?bREgsqBQ06asDK593Ctz2+zqHG5gW7GwJt43BUZvTb3tauGp4bYUFU3TyU?=
 =?iso-8859-1?Q?l3WpO3QBHgKcRvnphY0qx/E4XORasu3y+yB26nfLQbU8sOrbUy9Pm6Lucz?=
 =?iso-8859-1?Q?B4yU6PlJEn2Lr9bTmuxg2QNvFiW/5wKuDpXGMhrohQ4dOxeazGpTzI+fBO?=
 =?iso-8859-1?Q?sMTGCDcQ8QbrkUUojpaqU1Pb+3NIQtGcmBXPS43sG9SH2BfX4t0T1K8wNM?=
 =?iso-8859-1?Q?qCeLgIWxv4C93hUtcSMwKcXJeud90m0f4qw7yrCDXBZZbaeMHZ+M0EvLUw?=
 =?iso-8859-1?Q?Q3pqM0hhIiQNDzGp/pQvSkKTsWoOIgHxzODSw4EG7Z7F5v3CJZiSyvE6xb?=
 =?iso-8859-1?Q?vQDEKXCmM0oOIwfyxjtUSFoBCwcdcYXrXSx2rSF7jwXdkJ9hlxOr0KrDdx?=
 =?iso-8859-1?Q?RQzFq8jCcUTpTgXE33deuRtBnWbFJjTGXE6zBL/+v1YpXvtft/f7xETZrb?=
 =?iso-8859-1?Q?0TAKE5PTvC7am5omdBxz1C2z+q5VERRh7Ob+lYxQfcozixFAx6I3EXTXyc?=
 =?iso-8859-1?Q?3t3T2Eutm7MS+e7azoSbk1QEPZla5DGGXNkMG9rnQkNwMXebvRtDeumHCG?=
 =?iso-8859-1?Q?0pRuSkKSpM9y/CNcqu3Sc9cIxbfvE+zxCDzACATRubh4Vtt3o79wZRj9DL?=
 =?iso-8859-1?Q?GikvHVPNlS9YdSUVyi4vjjJNRxNWtmVqfJZGbLXXZLqGRS+x/xASdRuSE/?=
 =?iso-8859-1?Q?XMyDQjuoBFJYnjF9AHSikKTOUeDv3qY/Ypj45AkUImAQoIp/xztQecvhaw?=
 =?iso-8859-1?Q?Vq/ooudwqsLLu2oNBTSItSbLy4kLe7+zBGiBWHOxYnK1VNv7HT+fkIZSvw?=
 =?iso-8859-1?Q?jlVceubqi8tBbNkWtYKwJos0ULk+DlWhMWxNy2Pazp1wtGy626SfKqyw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46176544-f719-4f82-c19a-08dca5df9a2c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 21:38:16.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NWi37UG67q0Upv4E5QVnSbfeRRLaD0JmzmweuqjerCk515EytMsWGBBuXueZnnHn93rNoSEkZNc5sXNsWj2aTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
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

On Tue, Jul 16, 2024 at 02:35:19PM +0200, Christian König wrote:
> Prevent drivers from using this directly.
> 

This is a good change. Early on in Xe, our reference counting for BOs
was flawed (and incorrect) due to confusion between GEM ref count and
TTM ref count.

Is there any way we can just eliminate this and use GEM ref count? I'm
still confused about why we seemingly have two reference counts for the
same object.

Matt

> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_internal.h | 10 ++++++++++
>  include/drm/ttm/ttm_bo.h              | 10 ----------
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_internal.h b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> index 6a7305efd778..9d8b747a34db 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_internal.h
> +++ b/drivers/gpu/drm/ttm/ttm_bo_internal.h
> @@ -27,6 +27,16 @@
>  
>  #include <drm/ttm/ttm_bo.h>
>  
> +/**
> + * ttm_bo_get - reference a struct ttm_buffer_object
> + *
> + * @bo: The buffer object.
> + */
> +static inline void ttm_bo_get(struct ttm_buffer_object *bo)
> +{
> +	kref_get(&bo->kref);
> +}
> +
>  /**
>   * ttm_bo_get_unless_zero - reference a struct ttm_buffer_object unless
>   * its refcount has already reached zero.
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 31ec7fd34eeb..8c1577d8793c 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -229,16 +229,6 @@ struct ttm_lru_walk {
>  s64 ttm_lru_walk_for_evict(struct ttm_lru_walk *walk, struct ttm_device *bdev,
>  			   struct ttm_resource_manager *man, s64 target);
>  
> -/**
> - * ttm_bo_get - reference a struct ttm_buffer_object
> - *
> - * @bo: The buffer object.
> - */
> -static inline void ttm_bo_get(struct ttm_buffer_object *bo)
> -{
> -	kref_get(&bo->kref);
> -}
> -
>  /**
>   * ttm_bo_reserve:
>   *
> -- 
> 2.34.1
> 
