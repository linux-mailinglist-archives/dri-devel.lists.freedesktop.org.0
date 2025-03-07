Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7C8A56EA8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 18:07:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1094C10EC00;
	Fri,  7 Mar 2025 17:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a0m0S3Qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7B210EC0D
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 17:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741367217; x=1772903217;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6fCMi8JFwnA1Yn0PE4O38TsDUa+IAa/kA418RXMiNCg=;
 b=a0m0S3Qy/pMR8TL7q6e3z9W5+Ep1oaVfMPgNccKttOzJdzFA5axsvU0t
 Q3/gbjiRA0S/gNqRRTC83tURoTDiBsUw3irHx6Ngz+zb1Wl3E3WKCcvM0
 0qqksXEEcylgjg53nDDE9UbHyKUZsWoEUbkj/7mG0JXTFrnbKXkR3EVUY
 7cgNHRmPlBbOocSqmH/wm1Yr9/cGoz2ogtzT+PI9TndMGNNCmECqFHn1I
 UHCYOoC2YRWmycbYfgexVz7HY/7BO5tU1pu2TE7jJnhOS6E6YQIczSAkL
 oeBw9TN05W6foichmDJhOvrYxYfpzZ/EJZNgGDQL8y4wDLUW7cTWtjrLE A==;
X-CSE-ConnectionGUID: 3KMxmbmgTWmDKmDnvtYFHA==
X-CSE-MsgGUID: IAghgahkTeqUdwDd63FLiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42131708"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="42131708"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:06:56 -0800
X-CSE-ConnectionGUID: TRRIcN8lS5q/cSN0BRHipA==
X-CSE-MsgGUID: 8DXuXMmiQ5Kh+S5f9LGONA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; d="scan'208";a="124290013"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 09:06:56 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 7 Mar 2025 09:06:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 7 Mar 2025 09:06:54 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Mar 2025 09:06:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOgU/E4IXF6blh3+DZr9IKZsNq5i0Gm0Q6CPgPxcFjKGotx5HOTIBtrtXfuaDKZ5c53oFKzQkufY/AN7/24zZ1Y4BF49yWqWzh7JuR2yKOSg40kdM3bTpnfYkfbzvQ6mzn7jPa9YZp3NOoMR3iNeTXCiK5wXYQJxdbc6g5zrrAdbYBYhcXSEcj1rNSXqXoLwLal08s1Dr8Ns86GwSc6OZqH5SHqetu8PCwIjy9cpLe+e2ncnXPOEsedx5b3bHqeS7y3nePf1NYEPB1toV6JEJfwzYEWFj9ygfGgkcf1uoChLIJ4ooL0HSoKD+GRLCoZadTzB4ECXXWoaaDcXwQgtKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QUps7IMX2ZUeIg0lpN1c3evqye+zIVAaqPbugEEWOAw=;
 b=DGtY/eSl9KktqkSbk/eRuPSEEmSteP1SgNnIzaTe/S+oK7JfsxLudH8cmhZUUgdJix+hLhNLabPNyGEMiDbx9pp7Pt8QezEVdGTlGGzhcri11vAYgJD9LELnDZwlmhUarrQZT11Ba/q8xNQUCw5zGPBs/kY5BjugtY7tzPzHTjaWw4YQUX9K+hJwzsQKJEyRtwkMrMtEnkMMAVP+bGnLDUCOIWqOT56vUwsamqdd0oMGUHd3tybkk5AfayuywU4hnxls+2S8SR7PFDH761r16dd5PdAa4GVDNe32ZFBUca/bKB2QyvocQa2NmzEI9JZGUnHct6kJQQGqb03LrhJLbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6935.namprd11.prod.outlook.com (2603:10b6:303:228::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 17:06:05 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 17:06:05 +0000
Date: Fri, 7 Mar 2025 09:07:12 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <phasta@kernel.org>
CC: Danilo Krummrich <dakr@kernel.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 3/3] drm/sched: Update timedout_job()'s documentation
Message-ID: <Z8snwOx7C7jzkt70@lstrano-desk.jf.intel.com>
References: <20250305130551.136682-2-phasta@kernel.org>
 <20250305130551.136682-5-phasta@kernel.org>
 <Z8oMSWulN0mF43aB@lstrano-desk.jf.intel.com>
 <0ff8b5ddce856a7d9f5ffbabcb220e345b2dcfaa.camel@mailbox.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0ff8b5ddce856a7d9f5ffbabcb220e345b2dcfaa.camel@mailbox.org>
X-ClientProxiedBy: MW2PR2101CA0004.namprd21.prod.outlook.com
 (2603:10b6:302:1::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 537c62bd-5922-4446-ed10-08dd5d9a58c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU5namVyNHhrVkxsUWJVbGN0aHlWMkt0WTUzZElTcHlHeEJ1SmpIOHhoS1JW?=
 =?utf-8?B?N0MvVUx1K1gyRUUxSHhIdVlGNUFNZkxXang5YkZoSUhtdVJOOFpWNzNNYmYr?=
 =?utf-8?B?bExObHdLbVpMRWxVb3JJeXFGV3VDOVZiS1o3eGpLL3NwYktWTmxaZG40WjJX?=
 =?utf-8?B?Q3dLUmd3Sm00Mm12OC9RRURCMEZUeGZ6VEhneVFCZjkrd2gwMDZNcU1rUjhR?=
 =?utf-8?B?UEU2VkI5UHYyZmFqMDVtVERNMSsvR3RBR0RwTjhVR1J2ZE5rTXpCdnV1YUpF?=
 =?utf-8?B?ZU9JV2JySGZUSEZtaC9XYU9JSkNLbFQ2VzJEN1FZVHdoNHNFbis0QktnTjNS?=
 =?utf-8?B?Ym02Rjk4aUFrTERQY2JrSTBmQXR3aVdwVDVwL1FKMFdBc1NaVldrV2ZSa1Vh?=
 =?utf-8?B?cUlGUXhoUXhBY1IxMDZDUi9JNERCN0pNTHp5NU04N1E0cjlHOExIaE5YblNQ?=
 =?utf-8?B?bWJRUkhkak4vanJaT3E3emZoZFJxZ3BGWFBObWJzMStDamd3UElpeU5PblR5?=
 =?utf-8?B?di9pM1VROTlTdE4yNmQ5ajhmN01LT01aSGNOWlZHd0JER0FBblppNHhaSXBU?=
 =?utf-8?B?Q2RGRW1yYzBuSXBUak84ay9ScThUMVBWcGpHV29zMmxra3YwYmc0cmhuY0FK?=
 =?utf-8?B?Ulc5Ti9JcFR1dnhsMnZ5Yk0zVThpd3pJNW1mUmNpTHhDalphK0dWeDZnQWJG?=
 =?utf-8?B?UUkzSFBNK3Z2MHNESUhabG1UdVlTb2RKbzl0ME5yNk5RQjRuN29iV3BCS0FQ?=
 =?utf-8?B?YjNFaU8vMFlZTjh1Y29LYjJzQWJDNXVQU0dCSm90RkMzSlBrL2VydjB3cHRN?=
 =?utf-8?B?b1NxU0YxOGp6VHVSRlNJN0FEYUpUUGo5MVdHNWhteFFkU2k5TjBpTnhnTkF2?=
 =?utf-8?B?Z2lXa2dGUXEraWVidG1STERKWlNpcVRPdDFjQ1ExTFo0ZnFaaHlRcEluMTNM?=
 =?utf-8?B?RkxrUXlpaDdmQzFDbWZVTnlnTGdYTmZGZHhuK0J1OGVoVnc1WHpjeCs5QnhZ?=
 =?utf-8?B?VlI5WURMYTdMdkNiVmlNRlFxMlA0OXBnL2dZdUpLbDhwT1RCUXlqbXJPNVJK?=
 =?utf-8?B?bVNtZEVieGo0QWxUWEJ2SCswT1Vtei9hN1F3SHdFdHB6Tm52MWp4azBqYjNz?=
 =?utf-8?B?TnFDMTRURS90YzB1RmxoVTBlRVFaOE45bFI1NWtBSnVyUmdyb0Zlc2hsYTN2?=
 =?utf-8?B?SGJPZzhVUmJqQVIzWjZ5bzc5SkxPaW9zVVBXNldLdG13Sys4YWZKcUlWdEF2?=
 =?utf-8?B?cU5Hb2s0ZVBZY0ZpZmp0NC95ZTBZVlF3VGNsSWFCTElUMDhaeEcwL3NVYUpL?=
 =?utf-8?B?VEZROWxaUmpjNXAzc1NEK04zYm8wWTA2Q0dWcS8zc0hENW5tdFVEU2dLU2pu?=
 =?utf-8?B?c2I5U2tuMDl6WFdHWnR3NXRUZGxpODdiWjRLMFBqSjhtbXluREY2SEM2Z0h0?=
 =?utf-8?B?ZElETHRpbDNpdzhWTUswTDNMb1NTMkxUbCtVa0Rzbzh6VERsSWlnY1JCVzNC?=
 =?utf-8?B?UEpaSVJ0S2syK1N1YlN1NENtbkJpRG44dE8rb2VCd282a2RUazZ4U1NKOHds?=
 =?utf-8?B?QjZ5Q0QzK1IyZTlFYk55LzVJZk1oWHIyeGQyQkVWdWhLTTQ3UC9BaVh0KzdM?=
 =?utf-8?B?Y1pvcGpRa2JpRHFqWkI3L21TL01EKy9zcXBJd0tiSmVaMWppTU9yNlpCcGxi?=
 =?utf-8?B?cEZVWXRBZ0NEQVRESVl6U0xPS3VyTmM4THgwR0N2RFN3Rm1uMGVqQWJzNEsz?=
 =?utf-8?B?RTNjM2U3REx5TlhiKys5VlE2R0F5K1RSK3RvSlZyZU5lOU02YW93eGRDRzBr?=
 =?utf-8?B?RU5tNWVmZUZpQW9vWGdNOTlONjhNQU0ySjZXbmdTeUVOT3pXNDEzaXB4VjBh?=
 =?utf-8?Q?ig6u3d2V3rBP3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWJ3b1dQT3dBZlprK1oyUmEySmNkdkI2WEtwdjhYMlpkZmw1TkdRajQwcTVk?=
 =?utf-8?B?OExmWm9rSS9mMUttWTBvRllNTjVrTnY2YzM2WUVkTGJDcWxydEtRZ2hlSFNp?=
 =?utf-8?B?SUFCU011S0tzTEt5dG9SMFB1V1VUVXlKT09aZkt2L3hNS3hrbDZCSkFqUThC?=
 =?utf-8?B?WUV1dTY4NEVRUnJkQzErY21OVEZadWo0OUVZQmdKWmdnRlU0RHR2TVNSQXlU?=
 =?utf-8?B?SmZEN2plNURFMDByZ1BBSWQ0RVQ3UnV3MmFBZmtNakJyMkNvMGtLeDhLM211?=
 =?utf-8?B?bm02YTBSUDY0VnRKcTcyTE9BYXZvcmFMeTN3dnBFSGpoSGpRL1MzVE5PdWxp?=
 =?utf-8?B?ODhOZU5DWjNTaWE1S1krZnJTYWcrWmhXUm9nS29ULzR6c1hWSWZtaU9saFV5?=
 =?utf-8?B?ZWd3R3ZYNE4wSUlYV1FETGcvM1BYWXkweSsxbjlWV3h0NGh1WU1jNlpDK2hx?=
 =?utf-8?B?KzNLNjdCQ1l3VExyRWswY3RoSy9iNUE0QXpoNENtcmZzYmhHR0hUQy8wMFFp?=
 =?utf-8?B?Q0pOQnQvTldoZ091N3BzZjNNaFYvTTVQbmhsU3FIVTlieWc3bGZ1U09MTzBn?=
 =?utf-8?B?dFlVMlIreGlDVk4yeHNKWkhZdUF2Zmllbm5lQW9qNXlueDVqZ3JhdkZ6THRX?=
 =?utf-8?B?dXVHUW9yeW9CR294RTkzV3ZZT1FFNWxvRjBiNnFCeDN3MVZWODB5ODlTNldH?=
 =?utf-8?B?cGZZcDlOVEhFVWx5ckQzQlBsQXJ4czV6M1dmWGpQZGVoMVF2RFpJWGlJNUtW?=
 =?utf-8?B?MTZISURLd0JocVRFY1pLRlJWRk5wSVlpUE11K2tHVHVsd3RuUitGdzVkNVdk?=
 =?utf-8?B?RTFFMXhCZzVjb2xRY2xoVDJ4dHM5VzZIZ0xKU2ZHQ3JyaDd3ZG52ZE1RT3pZ?=
 =?utf-8?B?U2xQTWU1QklyTlpzd2x2MkJOTm5nYy9TMkpDRFUyZ1prOGJwT0JyU1BtT01v?=
 =?utf-8?B?ZFR0bVRiMStvOEpCNGtBMUtla2JNb0FvengwWHlJVXVaa3B0anpNaHc3dDVs?=
 =?utf-8?B?ekgzS3FKRzhHeDdVV1RJdmdpOWt5NjVzMmNwQWhaT0tMVEpwTWlmTTZGYWF1?=
 =?utf-8?B?NWM4ZHpIYm9TZ1l1V3Fyb040MWRIMmFlVWkveVlUNnl3S2RaWlNyM1kyTzBZ?=
 =?utf-8?B?bG5zd1hsU2ZqNHUwZ1Q5Q0NNcnFiTER6cFN4bzVWOGJvak1qT0pLRGRhdXJP?=
 =?utf-8?B?Z0ZsaC80WGpya3BuV3ZLK05HcXdTYVNrYmxUVFJxUWw5Rkx2TzhlK0JITEFv?=
 =?utf-8?B?c2UwUzBTeUIvR0NidkRseVUrUExaWmJDQTRNYURRVC9VRnpIR2Q1MU0yL0M0?=
 =?utf-8?B?M2syY2hCUkFYMlhWbzAzcVhWQ1pTOVJ1Z2N5V2lndGZUTmlna3ZDVVB6TEl6?=
 =?utf-8?B?RHB3Uk9LVkREYlI4YlpyenpSMFJTUkpCckJhSXBCSXAwN2lHOFRlTGRUcDRT?=
 =?utf-8?B?Y3p2K2UxNXBSYTkrRlQ4c0lVUXRNdEdRcnhUaTBWSVFMQTFhNXlYQmwwMXN6?=
 =?utf-8?B?YmFSOEtMcE1LcFJFczJBY2JSbmVacWFmWGRyYmFUQ01yQTRHUno1WjRHeEdX?=
 =?utf-8?B?SVZzOTVXU2Z5VVdWOHlvUi9IdzZzUEZ6ajMvU0hoZ2hScm9tQldRSDRzWUlZ?=
 =?utf-8?B?NldBSjBuVHVnNDZMY2FnckdNY285QURHUGpKQ3hXNzZpVEhIVHYyc1lyYmo0?=
 =?utf-8?B?Zzc0b2lCOTdpeUtWaWxEbmNNQTdqTmtNcHJKY0t5ZVI0bGJrSmpEa1haZDFW?=
 =?utf-8?B?QjJDRE1KZkN3eHlMTDYzWlhzTDRzVHFSS1oxd050dzEvNkFRd2kvY1VCc2tz?=
 =?utf-8?B?eGszUnhmSm9YaE44VjBWb1AxZWpIUHJISWlNMXVobHZGRmkyUkorODJpNEZD?=
 =?utf-8?B?MWRyRjZsT3JhYVVoMHhKS05ySnNiN2wrOWp0ZU9VSzJEUkl6NnRqRHcrUVY2?=
 =?utf-8?B?RUorTUs4dEFRTzBHczhCSXpRSFlIdUpvYzVQOUV1cGR5bzh5TGtaNDRZV1Yx?=
 =?utf-8?B?ZVY0QjVKSzZaT2ExS3NoSGxGaHNzbzhRcGhmOGF3Tm5aRG51SGxrZHJNVm5X?=
 =?utf-8?B?WXBuTGtLRjZndW8vNExZUmRTenRzb0J6MERPQnV1MDhrdm42ZUFjNFpaU1FV?=
 =?utf-8?B?TzNhMzMydEF2R3d1SkdZMTQ2Vzk2Nms1ZmJVb1lyckRRUi9yWXBwOWJlRXE2?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 537c62bd-5922-4446-ed10-08dd5d9a58c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 17:06:05.3926 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHKrNaCGZXU9Htt5uvlq2aUjIvi9BHQrLwyihU8D0ptkBq/BLgy5qm7qLcUU7c3vWTejW1TyhzoLU2nwSUDGhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6935
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

On Fri, Mar 07, 2025 at 10:37:04AM +0100, Philipp Stanner wrote:
> On Thu, 2025-03-06 at 12:57 -0800, Matthew Brost wrote:
> > On Wed, Mar 05, 2025 at 02:05:52PM +0100, Philipp Stanner wrote:
> > > drm_sched_backend_ops.timedout_job()'s documentation is outdated.
> > > It
> > > mentions the deprecated function drm_sched_resubmit_jobs().
> > > Furthermore,
> > > it does not point out the important distinction between hardware
> > > and
> > > firmware schedulers.
> > > 
> > > Since firmware schedulers typically only use one entity per
> > > scheduler,
> > > timeout handling is significantly more simple because the entity
> > > the
> > > faulted job came from can just be killed without affecting innocent
> > > processes.
> > > 
> > > Update the documentation with that distinction and other details.
> > > 
> > > Reformat the docstring to work to a unified style with the other
> > > handles.
> > > 
> > 
> > Looks really good, one suggestion.
> 
> Already merged. But I'm working already on the TODO and could address
> your feedback in that followup.
> 
> Of course, would also be great if you could provide a proposal in a
> patch? :)
> 

I can post something. Let me try to get something out today.

Matt

> > 

> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > >  include/drm/gpu_scheduler.h | 78 ++++++++++++++++++++++-----------
> > > ----
> > >  1 file changed, 47 insertions(+), 31 deletions(-)
> > > 
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 6381baae8024..1a7e377d4cbb 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -383,8 +383,15 @@ struct drm_sched_job {
> > >  	struct xarray			dependencies;
> > >  };
> > >  
> > > +/**
> > > + * enum drm_gpu_sched_stat - the scheduler's status
> > > + *
> > > + * @DRM_GPU_SCHED_STAT_NONE: Reserved. Do not use.
> > > + * @DRM_GPU_SCHED_STAT_NOMINAL: Operation succeeded.
> > > + * @DRM_GPU_SCHED_STAT_ENODEV: Error: Device is not available
> > > anymore.
> > > + */
> > >  enum drm_gpu_sched_stat {
> > > -	DRM_GPU_SCHED_STAT_NONE, /* Reserve 0 */
> > > +	DRM_GPU_SCHED_STAT_NONE,
> > >  	DRM_GPU_SCHED_STAT_NOMINAL,
> > >  	DRM_GPU_SCHED_STAT_ENODEV,
> > >  };
> > > @@ -447,43 +454,52 @@ struct drm_sched_backend_ops {
> > >  	 * @timedout_job: Called when a job has taken too long to
> > > execute,
> > >  	 * to trigger GPU recovery.
> > >  	 *
> > > -	 * This method is called in a workqueue context.
> > > +	 * @sched_job: The job that has timed out
> > >  	 *
> > > -	 * Drivers typically issue a reset to recover from GPU
> > > hangs, and this
> > > -	 * procedure usually follows the following workflow:
> > > +	 * Drivers typically issue a reset to recover from GPU
> > > hangs.
> > > +	 * This procedure looks very different depending on
> > > whether a firmware
> > > +	 * or a hardware scheduler is being used.
> > >  	 *
> > > -	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > park the
> > > -	 *    scheduler thread and cancel the timeout work,
> > > guaranteeing that
> > > -	 *    nothing is queued while we reset the hardware queue
> > > -	 * 2. Try to gracefully stop non-faulty jobs (optional)
> > > -	 * 3. Issue a GPU reset (driver-specific)
> > > -	 * 4. Re-submit jobs using drm_sched_resubmit_jobs()
> > > -	 * 5. Restart the scheduler using drm_sched_start(). At
> > > that point, new
> > > -	 *    jobs can be queued, and the scheduler thread is
> > > unblocked
> > > +	 * For a FIRMWARE SCHEDULER, each ring has one scheduler,
> > > and each
> > > +	 * scheduler has one entity. Hence, the steps taken
> > > typically look as
> > > +	 * follows:
> > > +	 *
> > > +	 * 1. Stop the scheduler using drm_sched_stop(). This will
> > > pause the
> > > +	 *    scheduler workqueues and cancel the timeout work,
> > > guaranteeing
> > > +	 *    that nothing is queued while the ring is being
> > > removed.
> > > +	 * 2. Remove the ring. The firmware will make sure that
> > > the
> > > +	 *    corresponding parts of the hardware are resetted,
> > > and that other
> > > +	 *    rings are not impacted.
> > > +	 * 3. Kill the entity and the associated scheduler.
> > 
> > Xe doesn't do step 3.
> > 
> > It does:
> > - Ban entity / scheduler so futures submissions are a NOP. This would
> > be
> >   submissions with unmet dependencies. Submission at the IOCTL are
> >   disallowed 
> > - Signal all job's fences on the pending list
> > - Restart scheduler so free_job() is naturally called
> > 
> > I'm unsure if this how other firmware schedulers do this, but it
> > seems
> > to work quite well in Xe.
> 
> Alright, so if I interpret this correctly you do that to avoid our
> infamous memory leaks. That makes sense.
> 
> The memory leaks are documented in drm_sched_fini()'s docu, but it
> could make sense to mention them here, too.
> 
> … thinking about it, we probably actually have to rephrase this line.
> Just tearing down entity & sched makes those leaks very likely. Argh.
> 
> Nouveau, also a firmware scheduler, has effectively a copy of the
> pending_list and also ensures that all fences get signalled. Only once
> that copy of the pending list is empty it calls into drm_sched_fini().
> Take a look at nouveau_sched.c if you want, the code is quite
> straightforward.
> 
> P.
> 
> > 
> > Matt
> > 
> > > +	 *
> > > +	 *
> > > +	 * For a HARDWARE SCHEDULER, a scheduler instance
> > > schedules jobs from
> > > +	 * one or more entities to one ring. This implies that all
> > > entities
> > > +	 * associated with the affected scheduler cannot be torn
> > > down, because
> > > +	 * this would effectively also affect innocent userspace
> > > processes which
> > > +	 * did not submit faulty jobs (for example).
> > > +	 *
> > > +	 * Consequently, the procedure to recover with a hardware
> > > scheduler
> > > +	 * should look like this:
> > > +	 *
> > > +	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop().
> > > +	 * 2. Kill the entity the faulty job stems from.
> > > +	 * 3. Issue a GPU reset on all faulty rings (driver-
> > > specific).
> > > +	 * 4. Re-submit jobs on all schedulers impacted by re-
> > > submitting them to
> > > +	 *    the entities which are still alive.
> > > +	 * 5. Restart all schedulers that were stopped in step #1
> > > using
> > > +	 *    drm_sched_start().
> > >  	 *
> > >  	 * Note that some GPUs have distinct hardware queues but
> > > need to reset
> > >  	 * the GPU globally, which requires extra synchronization
> > > between the
> > > -	 * timeout handler of the different &drm_gpu_scheduler.
> > > One way to
> > > -	 * achieve this synchronization is to create an ordered
> > > workqueue
> > > -	 * (using alloc_ordered_workqueue()) at the driver level,
> > > and pass this
> > > -	 * queue to drm_sched_init(), to guarantee that timeout
> > > handlers are
> > > -	 * executed sequentially. The above workflow needs to be
> > > slightly
> > > -	 * adjusted in that case:
> > > +	 * timeout handlers of different schedulers. One way to
> > > achieve this
> > > +	 * synchronization is to create an ordered workqueue
> > > (using
> > > +	 * alloc_ordered_workqueue()) at the driver level, and
> > > pass this queue
> > > +	 * as drm_sched_init()'s @timeout_wq parameter. This will
> > > guarantee
> > > +	 * that timeout handlers are executed sequentially.
> > >  	 *
> > > -	 * 1. Stop all schedulers impacted by the reset using
> > > drm_sched_stop()
> > > -	 * 2. Try to gracefully stop non-faulty jobs on all queues
> > > impacted by
> > > -	 *    the reset (optional)
> > > -	 * 3. Issue a GPU reset on all faulty queues (driver-
> > > specific)
> > > -	 * 4. Re-submit jobs on all schedulers impacted by the
> > > reset using
> > > -	 *    drm_sched_resubmit_jobs()
> > > -	 * 5. Restart all schedulers that were stopped in step #1
> > > using
> > > -	 *    drm_sched_start()
> > > +	 * Return: The scheduler's status, defined by &enum
> > > drm_gpu_sched_stat
> > >  	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_NOMINAL, when all is normal,
> > > -	 * and the underlying driver has started or completed
> > > recovery.
> > > -	 *
> > > -	 * Return DRM_GPU_SCHED_STAT_ENODEV, if the device is no
> > > longer
> > > -	 * available, i.e. has been unplugged.
> > >  	 */
> > >  	enum drm_gpu_sched_stat (*timedout_job)(struct
> > > drm_sched_job *sched_job);
> > >  
> > > -- 
> > > 2.48.1
> > > 
> 
