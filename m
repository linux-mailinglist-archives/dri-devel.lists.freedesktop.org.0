Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE3995979A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 12:22:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CEC10E8C0;
	Wed, 21 Aug 2024 10:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWP4B6BY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9869310E5E8;
 Wed, 21 Aug 2024 10:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724235736; x=1755771736;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=tZ/+TDcezNJfIrDS43UlOfNZ7SMws3zM5hnmVeyJmGU=;
 b=iWP4B6BYRjYbxD2cPFpjRLymNIY2Fa5+yNzPQFVXpn7OYajRI3ZUr3sB
 7/f31Zv6lEWpKkNx5afmUzcv4+uzmb3+Bvcvk/GdPq/ZnimtDhKOncO/B
 5j1krg1D/eqFaz/7QWVRHlZN+rb+R1Aioeplfw8GnySLVWrSN7CGmjv9e
 KV1g+MYSzomZrhbiGlvrbVitgIMkT2FuaDIAmu8EoBcQEN7mDMfO1vXwL
 5SVug74ijn+N8JW8CTbK8xFm04Rg09iINLlIbU+vXWvpEtWU7KdcHMSMv
 dEkUVLA+ml3fDgb2nfxkmSFRJjYqCMp7a2zUsaArwhpRNacoCftRCM8BJ g==;
X-CSE-ConnectionGUID: YlU4iRoNQvG+e3u+kFnp/A==
X-CSE-MsgGUID: tI7ij3fzQfyxyHkKTJ1mEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="40099307"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208,217";a="40099307"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 03:22:15 -0700
X-CSE-ConnectionGUID: KwApDjEySyiVzsHONvvoXQ==
X-CSE-MsgGUID: qT0ZjVbSQJS9oqdrO9YwGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208,217";a="61018739"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 03:22:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 03:22:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 03:22:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 03:22:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 03:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4w3ZeuW1PvHFw5GP1x0VRs2NpH7+fcfbSOpTJwXGoNEJRjZbgLRD32lm61fyrrd9HhxVrM6+EneKfXd/PBqeTRNBBBan3Zh8sxyB/cY9RZjYYunnXWsT4bRulv8f3I70R/nyBHWfUs5U0yIbPLqbpKEOEw2c9L2dbo0XIHoPXYztu2HQNfsvRuBnAHSWSFVimnMn5LsJRAU5VrSkFGDAOYKlV6Pwflxgl41V54/0i9pykDZvWs7/4pwPs84V5/j4xuL8LF7n+biviuWKvjCtDWxsVkFpaq0qpBBOETLMDUua1PHXrv7pdY0haM0vgnfuE57r+Ow9jGL8k8TVdS5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKFhSXJbyYAClheuRgEzxYYh58oD122PQGBq1p20gH8=;
 b=gb0lFSnS73qnx5xnFsHCprJUX+SYOLH8UHnygyQI4EkUQw/fuqZoff1GYSHBx9CbxbKnh6Bi8G6SKQAzy+/Ahzmn3VY1vZ80jnUstQo+wwyzWe0aho0CF0PvlhW3Q+h6BD1LfAjr3xlZmelPLXCac61bL7fvYJ6rjVsxM4zXe+Nc2GhIG6MI6WLoNwvV17ng3PQHls90KIfg1vwrt6NH8g+XS5tKjSQuflDNl8iRzSDoZ9YDbX/F51EzXWKrDlYWnVAXpiaLrWBZaswIgIl4i8BbJFCPR0O2sGiETjh+MhQGvYy3fTNliczLrMICjtUzskVeRwJXNWsEU5cqxc5hgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.19; Wed, 21 Aug 2024 10:22:11 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 10:22:11 +0000
Content-Type: multipart/alternative;
 boundary="------------VgL8K1WEk2iixdR780mroZ3V"
Message-ID: <bcb6dc80-2544-452f-bb6a-33ddba19e0c8@intel.com>
Date: Wed, 21 Aug 2024 12:22:07 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
 <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
 <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
 <b37433a5-a3b5-439d-9ee6-6c6260a94f13@intel.com>
 <02a383c5-db18-47ef-9118-72effd83a252@amd.com>
 <3f2c8223b92facfa99c760dacd116fa93afada53.camel@linux.intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <3f2c8223b92facfa99c760dacd116fa93afada53.camel@linux.intel.com>
X-ClientProxiedBy: ZR2P278CA0083.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:65::9) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|DM4PR11MB7328:EE_
X-MS-Office365-Filtering-Correlation-Id: e510b4e1-5999-4592-3abd-08dcc1cb1e52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0k3djY5cE1kRk1OMXNuY3NmSEE4WHZJQmtUZVE2WjBXdnozaTFlYU9NQUhz?=
 =?utf-8?B?NlEyUGYwT0RJVWQzQmZwNTQxbFQyWnM0UVNXYk9ZNWQ2ZXJKMnVSdTFUSEtW?=
 =?utf-8?B?TkJNcU5SeDRVR2dRc3F4aC8yRXJWQjh2TDRGeWs2cCtIZkdyNUExeklRTm80?=
 =?utf-8?B?WVoycUcxWG1sc2ZTTm0xb0tpK2ora1MrTnFtdThnZnlWa3YwOVhaRnZQSnd2?=
 =?utf-8?B?TGVvUHdWdTE2QUdpdVU4Q0JaVzBWMEVHek56Qy96OUk2N0ROcmRSUHFqUmhS?=
 =?utf-8?B?SXBNNzRZREJLaXNTUlZZNitZSjNERFlQTGFTbmRObjMrNXBzSHVGQlNOSXFr?=
 =?utf-8?B?YmVXK0E2Tzl4RGhORUFrd3pnYk5qMTBRRXVaaXc2Nk1RdnYyY2I5TTN6d01R?=
 =?utf-8?B?TGsrRDBjcnV5bXhyQm9XbXdkMnkrNXhmSE1BRFZPT1R1Z1dNVkVaTUhuaUx5?=
 =?utf-8?B?ZWZaY1UrUUtCTnhiMDcrTWxjSlQzSXJYeEkyMy9BYkRwK25PdHd5SjNGYzlH?=
 =?utf-8?B?Y3BMVUNtekJIbGRLNW1iR1RHbW9qNWp1Q3E1ZVh6eDN5MXpaZ2NONnBOdjR4?=
 =?utf-8?B?MkFVVXVtT1RRRlJSTTdTWExzTGc0RDFlWm1ZTDM1VGhDOGRQaEVlcjE5aEo5?=
 =?utf-8?B?eTA0VDZna3k5L0E3dGs5WlpjQjlTQW5uZGZiM1N6MWRzbEVrRU1KK1Z0Sis5?=
 =?utf-8?B?ZVBoelhzVDVBWUtZd1ZYV3hRUnQvU1JPNjhHb1FNZWppQ0JaRXhMczBwQmhp?=
 =?utf-8?B?LzNWbTNGZGJQRHJHN1hGOHVEOWcxN05VbEdPcE94VzJtZWFra3FhMlptdHda?=
 =?utf-8?B?Vjk5YXN5WHlLeG5JK0lhVjF4eUpiVitqanNhTjlrbEZoa0Q0MVhsSWF3cXlX?=
 =?utf-8?B?aWxqczR3VGFTaFIrM3EyQm1yc3dKZng4WlNxbWd0QlJxSkpMNUdYdDFLeFRj?=
 =?utf-8?B?eXo2dFlqeGZYZXAxbkxJL2ZyQW5aSnRiYXh1S2VINkJOWmpOSFEycUFQMlNq?=
 =?utf-8?B?NjJVT1d5Z3VjZ0E5YXdSaExVMHVSdGJycWFycDdNMmx0em9pYnVvOVRyQm4r?=
 =?utf-8?B?QUNQU3ZQQTFUN0E3NC9hanhKYkw2KzArbXNzdVF6aVIwUDdiMmJKeDB4V3d6?=
 =?utf-8?B?dER3VkdDUDlqZm1BeVpzRndaZlRQU09ZVlZvRWJxMHR4ZmxFZEJhQVhnZEFz?=
 =?utf-8?B?QVJVSlVWay9XcndiNUkwNTlzY25QbHJvMGdEWkREK2JHWVhtRVZ5d3Z2T0hH?=
 =?utf-8?B?QW1uRDdRU2FJTVJsMWdjVU5BTEVBZngybm1EbDBETVYxMUNsUUQzRUc3b1Z5?=
 =?utf-8?B?dE9wZjYvd1VTNk9rK0JLQ081ZEFlQVIwd1JuOHNoZXJkSzdqZ3UxMXhOdHg1?=
 =?utf-8?B?ckN3U1RMUGxWRU5BUHBDZ0p6UC95azh6Vkd3WnZxaUk5c0xMMXdTS1ovM2lZ?=
 =?utf-8?B?NmdMMWNGZkR6Q29yMElDWit3MVprNDhveVRlTFExK08rTDFuVisxSmp0RFdw?=
 =?utf-8?B?K1RNWWJXSHRXQW1VQW5NN21kOXk4UnNsVTRFR0w5Ry9XRDFvMktmUnV3Um8v?=
 =?utf-8?B?L3lWTnU2eTBrZGdJck5mRmxhWTlpT2t6bnNRSkk4THRYTVZ1VTl3RDF0ODE2?=
 =?utf-8?B?Y3RRcE0wVzlYMTZ3SEdJK2pvOEhSTCsyd3phcDhJcWRHWWRYWVlNVWZDdkFn?=
 =?utf-8?B?VXpJVzNDK0hZSG5NL2lkNWxiSE5DUXFUSmZHcVEzeER3TnFRRXVwQU8yVnJu?=
 =?utf-8?B?WnlvWEk0MStFZ3JXa0hUY0VRL1lKQ1ZTbWV2S0lDUXhBUFFheGN6akV2SUhW?=
 =?utf-8?B?WFJkRXFKcXpMSkdGWExHUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1ZEVGVOTHhkbEppMmhXS0lGa0R3NHpoaUhWS2VWUE8zWmtRdzVPYWM1Skox?=
 =?utf-8?B?UGIwU0dCZ1RldHJxa2tGd3ZSd05pU1hhVWRoSmJRb1BrVTlybEs0d2ZLTmdS?=
 =?utf-8?B?a0hRdHVVancwbXY5aVFIaGZLODA0ZkZ5T2w4NTFHNkY3L3F3a2NtWngzd2JC?=
 =?utf-8?B?ckdpK00rdDduaThPb2ZicFhISFlhUjhOUCs4TG10WmtpSlo5UXdTR3N3NERO?=
 =?utf-8?B?VE16MzE5bTRRTXAyOXRhKzZlbnBJYWcwcmdad3NjUDJoSlJNdE1kREppQUhm?=
 =?utf-8?B?N2lTNkwrSWpXdzg3KzBudnpadEljUDAvUHVZRUdaZnlHOFI3TDExTFMrdys2?=
 =?utf-8?B?RkRDVUhqTERhMEZ5T2JhUWticlp2bEZTY3lpUDZ6MUdCdlo2dmVUVGxCemNB?=
 =?utf-8?B?OVR4MVpyMnRKVTl5Qm1jNTFwaVlNMXJnS214OFNLY05uek5WLzhXbUlFVFdY?=
 =?utf-8?B?cFo3c2JZK3VvWU9wSG52S3BZbmphbGVVM1lCaUIrV0Q4OStOT0h5WkFCNksz?=
 =?utf-8?B?MzdNM0R0SlJieWdGbVhKeU1vOU1zeXgwVlJvQW1UNFltYldsOWFqekNJODA5?=
 =?utf-8?B?dGZXY2krYmx3NlByTHlzNUJSdE8yM2RpRVJIYnN3bTVhRHVlaG5XQWVXRVdN?=
 =?utf-8?B?bVVaQ1JUL2srZFNxOHBuWGExSzFrK3RzMUN4ekIvclpkM0htNFVnTlJpT1BT?=
 =?utf-8?B?Qk1WTGJzREFBWW5sc21qZUdyRGlvUCtNKzRXUEZLNXhrcTNkelhWWjlEZTVE?=
 =?utf-8?B?dE9YY05wam1sNjJ4dytUNDAxb21NZDl4QS81L0Y5cFJxdHpTdk9wZ1NyMFpR?=
 =?utf-8?B?bm5ZeUVDaFQxN2x5SG5YcVJqRG5BUElQOUs1L1BwaWI0Qk5iSy9FYW0vS0Rm?=
 =?utf-8?B?bWtUWWx3dlZIRUNlY1FsMnN2K2FmMnp4RVVuUnZJemo3MnZwR3JaTWFBeS9l?=
 =?utf-8?B?Sm13UWExUGlLL1pReHptQllEdEtvYWZDd0Vtak9tMk95TzZxKzk0U05FVU1Z?=
 =?utf-8?B?dEx3QnBLVXFRL0F1ZjRhL3c1TStpbUxmdm1Ycm44QkZmMVNCNUJ5WFZ6UU9B?=
 =?utf-8?B?a3Z5K2tqUkRFL2s4Znp2Y2EyNndUWkdBL0tzWDkxRUgzSTFTckVQTjF2RjN6?=
 =?utf-8?B?cVlMRXNBNStSc0ZqNW1TS1ZVUVFsY0Q1Z1RyaGJ4cVU0SUsyOCtKU3BIaXFW?=
 =?utf-8?B?UUxxN2tUVGorRzE5djN5R1pwU01JZzJEcTAyWjBPUjJYa3ZxOW5kdUdsWFNI?=
 =?utf-8?B?WHcwS2ZIRjc2UHJ5d3pJbDdXeWp0TU50VVllUHdZc1NYOEZDQlRUaE9QOXRi?=
 =?utf-8?B?R28rM2w0T1VmbWJqeE44QU8rd3dSWUhucldXSEFEaUxDb3JUd2pxNXgyTFYr?=
 =?utf-8?B?TjBHMmxMN21rM1pjRVNrL2FxbksycXd4SEhURy9HQURaQlg4NWlmcEF0Q0ty?=
 =?utf-8?B?SjBpU29hK3RrSWFTaDMvVVdVamlEa2krb0wyTUxQVmViOWthMlNFUDI2Q09G?=
 =?utf-8?B?ZmtGQ3JZRndFQ3hSczRFYzVtbDdQb0tISWZxS0xDR3VZN3hrdFdlSFhBM3B6?=
 =?utf-8?B?cGR0Q2VQUkFDOU9iRjIrd1FoeWRjbUVtSDYxOEJqM2ZrVHJRNUFrSmtFNnky?=
 =?utf-8?B?Z29SU1JGeWE4U3dzekhxV3g3RFB4aU9oc3I3bVpZNTJJVHFwSzg4SktKNDlU?=
 =?utf-8?B?MnpCVGlNSjVWUEJmM1pqMXVWNTVFYzN0SVZ1bDhsOTArWlN2T1NOaWR1VVhB?=
 =?utf-8?B?U1R1MXpldmUwUzJHbGJubVhwcmFuc2tHY3ByS1Iyc2ZmUmNxZ3luL2tBck5R?=
 =?utf-8?B?OVdRME92eGk0RDU5WXRDbWpuZFdwb2R1WVE4dGtKcjI4aHg4L3dRbEdwL2tY?=
 =?utf-8?B?aGU3NFh3Sk5oUEh6Ym1ONzhlUDFZNFBqYmpRUG01MXhkcll6Q2M4L2JBeUpB?=
 =?utf-8?B?MVhnQW1SMXZwYWZNcUxRNUx1NWZBUHBnUlcyRXNhQjkvZWlOWkp3K2I2Ykpr?=
 =?utf-8?B?TGFkbDFQOEMvNWhxQWh1NHdWUms3QWZvZXhTODJZUFJmN1FvOGp5bCs0dlVI?=
 =?utf-8?B?Zk01NG5rZEx4ODg4UXhMZ3hMYzIybXBrRVVRZVNRMThYaHBINTROdGgrdERR?=
 =?utf-8?Q?2Tlk+bTmRYWEEHswqDWiTrYYQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e510b4e1-5999-4592-3abd-08dcc1cb1e52
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 10:22:11.3362 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YVrKV4og/EsfDNQ6AnHse8U/O5W8jU5X0fqlwapQVM2Fy0CJCgQOYbuEVfmPXER6fND/+R5VUwtntGnyM5PuSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7328
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

--------------VgL8K1WEk2iixdR780mroZ3V
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 8/21/2024 10:08 AM, Thomas Hellström wrote:
> On Wed, 2024-08-21 at 09:47 +0200, Christian König wrote:
>> Am 20.08.24 um 18:46 schrieb Nirmoy Das:
>>> Hi Thomas, Christian,
>>>
>>> On 8/20/2024 5:47 PM, Christian König wrote:
>>>> Am 20.08.24 um 17:45 schrieb Thomas Hellström:
>>>>> On Tue, 2024-08-20 at 17:30 +0200, Christian König wrote:
>>>>>> Am 20.08.24 um 15:33 schrieb Thomas Hellström:
>>>>>>> Hi, Nirmoy, Christian
>>>>>>>
>>>>>>> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>>>>>>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can
>>>>>>>> set before
>>>>>>>> releasing backing stores if they want to skip clear-on-
>>>>>>>> free.
>>>>>>>>
>>>>>>>> Cc: Matthew Auld<matthew.auld@intel.com>
>>>>>>>> Cc: Thomas Hellström<thomas.hellstrom@linux.intel.com>
>>>>>>>> Suggested-by: Christian König<christian.koenig@amd.com>
>>>>>>>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>>>>>>>> Reviewed-by: Christian König<christian.koenig@amd.com>
>>>>>>> What happens if two devices share the same global TTM pool
>>>>>>>     type and one that does its own clearing. Wouldn't there
>>>>>>> be a
>>>>>>> pretty
>>>>>>> high chance that the the device that doesn't clear its own
>>>>>>> pages
>>>>>>> allocate non-cleared memory from the pool?
>>>>>> That's completely unproblematic. The flag indicates that the
>>>>>> released
>>>>>> pages are already cleared, if that isn't the case then the
>>>>>> flag
>>>>>> shouldn't be set on the TT object.
>>>>> Yeah, this patch is OK, but the way the follow-up xe patch uses
>>>>> it is
>>>>> problematic since, AFAICT, xe dma clears on alloc, meaning the
>>>>> pool
>>>>> pages are not cleared after use.
>>>> Yeah that is clearly invalid behavior.
>>>
>>> I was only thinking about one device use-case which won't leak any
>>> data though I am now miss-using the flag.
>>>
>>> If I skip dma clear for pooled BO then this flag  is not really
>>> needed. Shall I revert the this and usage of
>>> TTM_TT_FLAG_CLEARED_ON_FREE
>>>
>>> and re-introduce it after I get a working clear on free
>>> implementation
>>> for XE?
>> Yes absolutely.
>>
>> I though that I made it clear that the handling should be that the
>> driver clears the pages and *then* sets the
>> TTM_TT_FLAG_CLEARED_ON_FREE
>> flag.
>>
>> So if you don't have the handling implemented like that then that's
>> clearly invalid behavior.
>>
>> Regards,
>> Christian.
> I agree.
> Revert and re-introduce as needed, and obtain an ack from Christian to
> merge through drm-xe-next before re-introduction so that it doesn't
> clash with anything planned elsewhere.


Sent a series to revert the usages TTM_TT_FLAG_CLEARED_ON_FREE.

Thanks both of you for your time and patience,

Nirmoy

>
> Thanks,
> Thomas
>
>
>
>>>
>>> Regards,
>>>
>>> Nirmoy
>>>
>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> /Thomas
>>>>>
>>>>>> If one device clear it's pages and another device doesn't
>>>>>> clear it's
>>>>>> pages then we would just clear the pages of the device which
>>>>>> doesn't
>>>>>> do
>>>>>> it with a hardware DMA.
>>>>>>
>>>>>> Regards,
>>>>>> Christian.
>>>>>>
>>>>>>> /Thomas
>>>>>>>
>>>>>>>> ---
>>>>>>>>     drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>>>>>>     include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>>>>>>     2 files changed, 16 insertions(+), 8 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>> index 8504dbe19c1a..935ab3cfd046 100644
>>>>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>>>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct
>>>>>>>> ttm_pool
>>>>>>>> *pool, dma_addr_t dma_addr,
>>>>>>>>     }
>>>>>>>>        /* Give pages into a specific pool_type */
>>>>>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt,
>>>>>>>> struct
>>>>>>>> page
>>>>>>>> *p)
>>>>>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt,
>>>>>>>> struct
>>>>>>>> page
>>>>>>>> *p,
>>>>>>>> +                   bool cleared)
>>>>>>>>     {
>>>>>>>>         unsigned int i, num_pages = 1 << pt->order;
>>>>>>>>     -    for (i = 0; i < num_pages; ++i) {
>>>>>>>> -        if (PageHighMem(p))
>>>>>>>> -            clear_highpage(p + i);
>>>>>>>> -        else
>>>>>>>> -            clear_page(page_address(p + i));
>>>>>>>> +    if (!cleared) {
>>>>>>>> +        for (i = 0; i < num_pages; ++i) {
>>>>>>>> +            if (PageHighMem(p))
>>>>>>>> +                clear_highpage(p + i);
>>>>>>>> +            else
>>>>>>>> +                clear_page(page_address(p + i));
>>>>>>>> +        }
>>>>>>>>         }
>>>>>>>>            spin_lock(&pt->lock);
>>>>>>>> @@ -394,6 +397,7 @@ static void
>>>>>>>> ttm_pool_free_range(struct
>>>>>>>> ttm_pool
>>>>>>>> *pool, struct ttm_tt *tt,
>>>>>>>>                     pgoff_t start_page, pgoff_t
>>>>>>>> end_page)
>>>>>>>>     {
>>>>>>>>         struct page **pages = &tt->pages[start_page];
>>>>>>>> +    bool cleared = tt->page_flags &
>>>>>>>> TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>>>>>         unsigned int order;
>>>>>>>>         pgoff_t i, nr;
>>>>>>>>     @@ -407,7 +411,7 @@ static void
>>>>>>>> ttm_pool_free_range(struct
>>>>>>>> ttm_pool
>>>>>>>> *pool, struct ttm_tt *tt,
>>>>>>>>                pt = ttm_pool_select_type(pool, caching,
>>>>>>>> order);
>>>>>>>>             if (pt)
>>>>>>>> -            ttm_pool_type_give(pt, *pages);
>>>>>>>> +            ttm_pool_type_give(pt, *pages, cleared);
>>>>>>>>             else
>>>>>>>>                 ttm_pool_free_page(pool, caching, order,
>>>>>>>> *pages);
>>>>>>>>         }
>>>>>>>> diff --git a/include/drm/ttm/ttm_tt.h
>>>>>>>> b/include/drm/ttm/ttm_tt.h
>>>>>>>> index 2b9d856ff388..cfaf49de2419 100644
>>>>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>>>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>>>>>>          * fault handling abuses the DMA api a bit and
>>>>>>>> dma_map_attrs
>>>>>>>> can't be
>>>>>>>>          * used to assure pgprot always matches.
>>>>>>>>          *
>>>>>>>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm
>>>>>>>> driver
>>>>>>>> handles
>>>>>>>> +     * clearing backing store
>>>>>>>> +     *
>>>>>>>>          * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only.
>>>>>>>> DO NOT
>>>>>>>> USE. This is
>>>>>>>>          * set by TTM after ttm_tt_populate() has
>>>>>>>> successfully
>>>>>>>> returned, and is
>>>>>>>>          * then unset when TTM calls ttm_tt_unpopulate().
>>>>>>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>>>>>>     #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>>>>>>>     #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>>>>>>     #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>>>>>>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>>>>>>>     -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>>>>>>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>>>>>>>         uint32_t page_flags;
>>>>>>>>         /** @num_pages: Number of pages in the page array.
>>>>>>>> */
>>>>>>>>         uint32_t num_pages;
--------------VgL8K1WEk2iixdR780mroZ3V
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/21/2024 10:08 AM, Thomas Hellström
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:3f2c8223b92facfa99c760dacd116fa93afada53.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">On Wed, 2024-08-21 at 09:47 +0200, Christian König wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Am 20.08.24 um 18:46 schrieb Nirmoy Das:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Hi Thomas, Christian,

On 8/20/2024 5:47 PM, Christian König wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Am 20.08.24 um 17:45 schrieb Thomas Hellström:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">On Tue, 2024-08-20 at 17:30 +0200, Christian König wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">Am 20.08.24 um 15:33 schrieb Thomas Hellström:
</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">Hi, Nirmoy, Christian

On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can
set before
releasing backing stores if they want to skip clear-on-
free.

Cc: Matthew Auld <a class="moz-txt-link-rfc2396E" href="mailto:matthew.auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Thomas Hellström <a class="moz-txt-link-rfc2396E" href="mailto:thomas.hellstrom@linux.intel.com">&lt;thomas.hellstrom@linux.intel.com&gt;</a>
Suggested-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com">&lt;nirmoy.das@intel.com&gt;</a>
Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E" href="mailto:christian.koenig@amd.com">&lt;christian.koenig@amd.com&gt;</a>
</pre>
                  </blockquote>
                  <pre wrap="" class="moz-quote-pre">What happens if two devices share the same global TTM pool
&nbsp;&nbsp; type and one that does its own clearing. Wouldn't there
be a
pretty
high chance that the the device that doesn't clear its own
pages
allocate non-cleared memory from the pool?
</pre>
                </blockquote>
                <pre wrap="" class="moz-quote-pre">That's completely unproblematic. The flag indicates that the
released
pages are already cleared, if that isn't the case then the
flag
shouldn't be set on the TT object.
</pre>
              </blockquote>
              <pre wrap="" class="moz-quote-pre">Yeah, this patch is OK, but the way the follow-up xe patch uses
it is
problematic since, AFAICT, xe dma clears on alloc, meaning the
pool
pages are not cleared after use.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
Yeah that is clearly invalid behavior.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">

I was only thinking about one device use-case which won't leak any 
data though I am now miss-using the flag.

If I skip dma clear for pooled BO then this flag&nbsp; is not really 
needed. Shall I revert the this and usage of
TTM_TT_FLAG_CLEARED_ON_FREE

and re-introduce it after I get a working clear on free
implementation 
for XE?
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
Yes absolutely.

I though that I made it clear that the handling should be that the 
driver clears the pages and *then* sets the
TTM_TT_FLAG_CLEARED_ON_FREE 
flag.

So if you don't have the handling implemented like that then that's 
clearly invalid behavior.

Regards,
Christian.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I agree.
Revert and re-introduce as needed, and obtain an ack from Christian to
merge through drm-xe-next before re-introduction so that it doesn't
clash with anything planned elsewhere.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Sent a series to revert the usages <span style="white-space: pre-wrap">TTM_TT_FLAG_CLEARED_ON_FREE.  </span></p>
    <p><span style="white-space: pre-wrap">Thanks both of you for your time and patience,</span></p>
    <p><span style="white-space: pre-wrap">Nirmoy
</span></p>
    <blockquote type="cite" cite="mid:3f2c8223b92facfa99c760dacd116fa93afada53.camel@linux.intel.com">
      <pre wrap="" class="moz-quote-pre">

Thanks,
Thomas



</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">

Regards,

Nirmoy


</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">
Regards,
Christian.

</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">
/Thomas

</pre>
              <blockquote type="cite">
                <pre wrap="" class="moz-quote-pre">If one device clear it's pages and another device doesn't
clear it's
pages then we would just clear the pages of the device which
doesn't
do
it with a hardware DMA.

Regards,
Christian.

</pre>
                <blockquote type="cite">
                  <pre wrap="" class="moz-quote-pre">/Thomas

</pre>
                  <blockquote type="cite">
                    <pre wrap="" class="moz-quote-pre">---
&nbsp;&nbsp;&nbsp;drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
&nbsp;&nbsp;&nbsp;include/drm/ttm/ttm_tt.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 6 +++++-
&nbsp;&nbsp;&nbsp;2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
b/drivers/gpu/drm/ttm/ttm_pool.c
index 8504dbe19c1a..935ab3cfd046 100644
--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct
ttm_pool
*pool, dma_addr_t dma_addr,
&nbsp;&nbsp;&nbsp;}
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;/* Give pages into a specific pool_type */
-static void ttm_pool_type_give(struct ttm_pool_type *pt,
struct
page
*p)
+static void ttm_pool_type_give(struct ttm_pool_type *pt,
struct
page
*p,
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool cleared)
&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i, num_pages = 1 &lt;&lt; pt-&gt;order;
&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_pages; ++i) {
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (PageHighMem(p))
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_highpage(p + i);
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_page(page_address(p + i));
+&nbsp;&nbsp;&nbsp; if (!cleared) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; num_pages; ++i) {
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (PageHighMem(p))
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_highpage(p + i);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear_page(page_address(p + i));
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;pt-&gt;lock);
@@ -394,6 +397,7 @@ static void
ttm_pool_free_range(struct
ttm_pool
*pool, struct ttm_tt *tt,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pgoff_t start_page, pgoff_t
end_page)
&nbsp;&nbsp;&nbsp;{
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct page **pages = &amp;tt-&gt;pages[start_page];
+&nbsp;&nbsp;&nbsp; bool cleared = tt-&gt;page_flags &amp;
TTM_TT_FLAG_CLEARED_ON_FREE;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int order;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pgoff_t i, nr;
&nbsp;&nbsp; @@ -407,7 +411,7 @@ static void
ttm_pool_free_range(struct
ttm_pool
*pool, struct ttm_tt *tt,
&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pt = ttm_pool_select_type(pool, caching,
order);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (pt)
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_pool_type_give(pt, *pages);
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_pool_type_give(pt, *pages, cleared);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_pool_free_page(pool, caching, order,
*pages);
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }
diff --git a/include/drm/ttm/ttm_tt.h
b/include/drm/ttm/ttm_tt.h
index 2b9d856ff388..cfaf49de2419 100644
--- a/include/drm/ttm/ttm_tt.h
+++ b/include/drm/ttm/ttm_tt.h
@@ -85,6 +85,9 @@ struct ttm_tt {
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fault handling abuses the DMA api a bit and
dma_map_attrs
can't be
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * used to assure pgprot always matches.
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *
+&nbsp;&nbsp;&nbsp;&nbsp; * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm
driver
handles
+&nbsp;&nbsp;&nbsp;&nbsp; * clearing backing store
+&nbsp;&nbsp;&nbsp;&nbsp; *
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only.
DO NOT
USE. This is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * set by TTM after ttm_tt_populate() has
successfully
returned, and is
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * then unset when TTM calls ttm_tt_unpopulate().
@@ -94,8 +97,9 @@ struct ttm_tt {
&nbsp;&nbsp;&nbsp;#define TTM_TT_FLAG_EXTERNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(2)
&nbsp;&nbsp;&nbsp;#define TTM_TT_FLAG_EXTERNAL_MAPPABLE&nbsp;&nbsp;&nbsp; BIT(3)
&nbsp;&nbsp;&nbsp;#define TTM_TT_FLAG_DECRYPTED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIT(4)
+#define TTM_TT_FLAG_CLEARED_ON_FREE&nbsp;&nbsp;&nbsp; BIT(5)
&nbsp;&nbsp; -#define TTM_TT_FLAG_PRIV_POPULATED&nbsp;&nbsp;&nbsp; BIT(5)
+#define TTM_TT_FLAG_PRIV_POPULATED&nbsp;&nbsp;&nbsp; BIT(6)
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t page_flags;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /** @num_pages: Number of pages in the page array.
*/
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t num_pages;
</pre>
                  </blockquote>
                </blockquote>
              </blockquote>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">
</pre>
          </blockquote>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------VgL8K1WEk2iixdR780mroZ3V--
