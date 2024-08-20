Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44075958C94
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 18:46:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9985F10E457;
	Tue, 20 Aug 2024 16:46:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CvQHfJhY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F67910E44C;
 Tue, 20 Aug 2024 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724172395; x=1755708395;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vhBOzHpiPX4IXoBn2yHfn6ICumFPunZiTF5lCz1uS9k=;
 b=CvQHfJhYtJdCIummRmz322dK4TVbGrB6j+F0mLNjf0t9CZYAhVCRm/1d
 dNOASvZEwxIa+JF7yaYwA0B4NDpVh6BmCVtuq2GUMNkJ8skAl9ag9lDGQ
 Ik71DHw2n+MQGmLAApBS3u69xapj6BFgWExiuwQgxy9Uxhcg4ER8ydb1d
 xE1DGlOYCMtt3QzFB7XNP0r6+pKnVEFcuw+PA0UjXcMpcHYXG/R0ZevLO
 IVzs6Z6yq6MpipA82f6bi6UbpqLX7SGIwhccijAaIxiMuSfMUNtp3kUtn
 0gtFaCAPaw4ChI4Yd/F+C19BRcLgFZowO5kMF6fJuvWETHlDIgvB5heWc Q==;
X-CSE-ConnectionGUID: jbCUMVovTGazW+cCQD56BQ==
X-CSE-MsgGUID: Hf6NTBBvTYOLjAZDlBoBHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22371242"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22371242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 09:46:35 -0700
X-CSE-ConnectionGUID: C9Q5kP1hR9akbWy53qj9pQ==
X-CSE-MsgGUID: 6EifioRUTPePNbgMfvL1Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65485365"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 09:46:34 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:46:34 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 09:46:33 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 09:46:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 09:46:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bbUijr1gQJhCdqR5Hu3ylmmMmWWWIUI5pBxjfk1y5cYaz3bQFqsyWgaRVtfuumEOtDRBwxMoFLphPpZI9JahxVhM23+wuMYUyQSrdNtTvl7qW40RgD6wNjMrMu51w/0u3ruNBwbuhBLKWNdPf9nE8stdY7B4ToEYnF2jUINAzcZ9T1BahIYZk2rFcXKql3qBl+4J1hvZMIm3zD7Gr8UgPuPFCI+WWWO30v+eCtfHGQXwsloUmblw2NTQsSkRsExoaa4UDyWbFG76TikG7kQE0KTOyV6Z6Hgn4M4kmb01VfHn6Z47oNNo5zAf+atN0XwbvyHNHt6iH6TFg5/UGaectQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZGndTC0hW9xLdjgPrvvfXU4l3nBSBtI2Fn5ruU3mFIw=;
 b=JBiBSq3GYKaewudIRKnWBxQ39hOBuXY5tZ2Fey98JjSPuN7NfI0wIhwKXOfN1CUlTCJ5iL+G3Zm3V49oIl+JwcwASVdCUo2BPAkUvJm9nmreL5I9P4ZEHRJi5+SNu6rNNmWY5AXG4jjRE7znT5vNix+hh5/ZSZ/ud2CkqQqGgjqyjilu+YRHz6Mo9K6rY3Sqb3gJqx7cixMCQJXnPlUJo88Y+AUXr4mYDmXi4p2oxEKCJoZ+ib0IgE259KGpfME2A/dUk4SxBuLCQO54LIDxFaiasvR+UyTHtuxw7ZquqO8EkOoi+//Bu5nfrc0d5WU6NY3AWH5Q92KfRjXPGRELMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SJ1PR11MB6252.namprd11.prod.outlook.com (2603:10b6:a03:457::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 16:46:30 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 16:46:30 +0000
Message-ID: <b37433a5-a3b5-439d-9ee6-6c6260a94f13@intel.com>
Date: Tue, 20 Aug 2024 18:46:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] drm/ttm: Add a flag to allow drivers to skip
 clear-on-free
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>
References: <20240816135154.19678-1-nirmoy.das@intel.com>
 <a09a268099ef61c46cf53f0d8847a8f07caa210e.camel@linux.intel.com>
 <f045daaa-e887-4f74-8cc1-5df0d0fc2593@amd.com>
 <b48456effda2ac845e08318da404e2810c74bd64.camel@linux.intel.com>
 <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <b94e2ea6-569d-47bc-8e01-199b543b2018@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI2P293CA0004.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::15) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SJ1PR11MB6252:EE_
X-MS-Office365-Filtering-Correlation-Id: 091b5c5d-4646-4f36-7c7d-08dcc137a42c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFVmdThzL0RUdmxuYVAvUnVjUlRlZWc4R25hUjk0czNFMzdYejl5aHl6c1F1?=
 =?utf-8?B?VWNJdjVjaW1sOE9MLzZBRnBnVWtYaWIydHNuZU1WZ2tqcDMvU0szUGlKTkJG?=
 =?utf-8?B?b1paamFMd2NoYVRHcVhNSzhvN1JEeDVvRUhvUlJScFVyQ3ZOQVo2bGFaVy81?=
 =?utf-8?B?WndMeG94UzEyalI4RTZXSXZRSVJTNUVBd2ZqSllCakpKRzJhUkl3eDd0cUM2?=
 =?utf-8?B?RDEwc0pFNThnWmlmeHdUTnMwNG42bHErTVZZdnNWTkM4b2pZMENRRHJiTVBv?=
 =?utf-8?B?U0oxNDVVVnZkenA5NGF1NVYwMXV5K3MxTk0yWXU2TUI0M3BTSmxUdUJkR2Ny?=
 =?utf-8?B?Y1dITjFQcW02T3V5eVJlOHJma1grdTVwS1FFYmQ3Mko5dy9yZmIwRkpMdWt1?=
 =?utf-8?B?K2UvS0tPY3U1TExVOUFpb0hWS2piRUpndjhRTEZLUEI5dW1vSEw0QllCcURa?=
 =?utf-8?B?cDNZRVErSGt6WkJMT3hwekVMNzgyT2orZ0NKTm9hWHJhbmtQMnFZeFdRVm90?=
 =?utf-8?B?WFROMURSRnBGOTRia25seFFVVWlObE5jTE41bXBucGRWY3VKSmhIZGJvMlNM?=
 =?utf-8?B?VmVneituS0lMdERMSFd6WEVSUEN0bGlCbllITVJhd2pjdyt6K1R4L3RaWG5m?=
 =?utf-8?B?blBXMDFmd0NOTklvNFJYTElVMC9vdVFUWFg1UXpDZXlwNEwrSEhUMXdpZ2pv?=
 =?utf-8?B?Tks3SUV1ZkJNYTBsbWdycU4vSC9ZMDNMVENaZEFoeW5WcHpKbVh5QU94c1N5?=
 =?utf-8?B?bFBlZDIxYTlUTGFpUHVEaVR1WUtvSFpPbThRVjFENWl2NUZRQUVpSDR2VW5i?=
 =?utf-8?B?eUdvcmNzQjc3WnRMdGtaY3hrbVB1RTkyYVo5SzdqaDhyRnQrSDRWNVB3VSsr?=
 =?utf-8?B?NWxIeGpnaVhBQ0VLOGVGdTIrd0JpM1NFVmdXOGlJWU43RkJ5ZHpDK1BoejBL?=
 =?utf-8?B?NWxlbGtxSVQya1BlNFRoZHJsc2Y1T0tuenMxbWViU0RZZnFMRHlZZHRsYjd1?=
 =?utf-8?B?b0VuV29lQVdXODl6VGxvcEhtRXZIcVp6ME1VUHNWWjM1TUVZaWw2ZkRIUHlP?=
 =?utf-8?B?M0ZWY29GNmYxREprTDJpc3cxd1dsSmxCeXJsU0dyc2YwbmszVmxYbThCN1Ny?=
 =?utf-8?B?c3lzV0ptcXYvT3poRmUwMG9DNUg0MFQ5VEhFek5jM0ltT0xyUTRNNUxKandv?=
 =?utf-8?B?aGJmZVFTNWdpa01XMVBtYW5zTTNHZTl0WEV6TEJrVFJsVDYyeFN0V1JWK09Y?=
 =?utf-8?B?R29nbTB5K2RhOWFzclBPMWNiUVpGUDZtRXc5cWRqa3pzOHoyaFNVNXcvZy90?=
 =?utf-8?B?dVdHenJGdDBKVG1IdFIwK0JXSkk1Mlk3S3FlY3p5WEUza1F5dTgzSUdTa2xL?=
 =?utf-8?B?S2thdG95SDB2emFScFNQTGlsVzJxZy96TFoxTmp1NWVwTThubFVvYW1VWTRk?=
 =?utf-8?B?cDVSbkRHdU9ZU0pkUnNxOVRtT1ViVVhtTklwV1J1NHgrdEwvbS91bHBTR3h6?=
 =?utf-8?B?UmYwZ3psV1RwOThTcFpCQ0FPZzBhVmwrOTlrK1F2a3VjSDU5Z3dZWU9uN0ZP?=
 =?utf-8?B?VjJuQjNKUlYxMHAweCtsVVRtaHRaZ3p5UU1nNUEyUEV0MmRkUWNvcXZQRUx0?=
 =?utf-8?B?WnJ4R3h3TFVZdjZXNlpsN0wzRXdRUUowNTM3YlBkSFpHRTZObTErdmI1MnRF?=
 =?utf-8?B?aHFjb0x2L1pSckRSQWxJRkNIRFdmMThaZmhFbE1pdE1wU2lDVmZuMEhMOUcx?=
 =?utf-8?B?cVFFdkdiSnJSYTFwbEFZYkNpeE12QU9QVzluZU9aMTlMZHV5aGQ2d0NjZEdr?=
 =?utf-8?B?bTNoYUEzU29VK1pjMVhRdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEx6bXF3SFVDNHJhay9BSXpubDZ6SlNXTjZMdXp3eHdvK0hBRmtHR2lJRzZJ?=
 =?utf-8?B?ZkNiRE5RTGVDQk56WStGbUpRMEY4M01NYlZUQUpDUWhrWDhFWUd3enpqZkky?=
 =?utf-8?B?and6RXAwZFVhaXg2VHUwQjFvbnkyMGx2M0p2em54SUp1bllHd09GNWtYbnR2?=
 =?utf-8?B?RmU1SFVxZnJDa2N6SVZDdEs3RkdXVElNOHhQVVRDSytnOWlVMVNNaUNPc3hC?=
 =?utf-8?B?MklMVE9xOWdzWXZHYm9qekJhUGE4dE5PMVhTMlhvajFvZFpJRnlacGhNZk45?=
 =?utf-8?B?VktkeU5KNXpzNnFwN0JjZWtxTVZwTlFJclNzd3orNFFlSnpXdEFxK0hubmhp?=
 =?utf-8?B?ZGpYVXh3RkxkWk5nanpBWFZEeS9WMXVHQUFIWlBSUC9pa0xCSzBkU1JSUGN5?=
 =?utf-8?B?dHdOSVExaU91bDNoM0tEZllRTWZaMk8reWMxK0N4RkRUUjBiK3ltRy9IZWIv?=
 =?utf-8?B?SUUwTkE2T09ndy9jT2Vud0RwRnQvbzg0UTZqT2FWeGgrWVBoSVVxVFhiZmpV?=
 =?utf-8?B?YXhCTjFOSXJDYTFDQ0pyQW5FYTY5S3MzN2E4WmJ5bE50bk9CMzU1aEhZTUpo?=
 =?utf-8?B?Unk5WlhRRTlJeGxuWFMrZmVndnJYZmdPSHhrZXAyZDVob2taQVZvM2s2MWsr?=
 =?utf-8?B?Vnh6Y3F3Qk1aZnVGcjBucnIxcGhON3VnNHJKL0UxTnlaN3NmWXJsWnF2Yml5?=
 =?utf-8?B?N2psR2NZVWlMdit4UGFacy83TGN5QVdmRmlDajZ4M0poanZxWFVVQ3VBbWpi?=
 =?utf-8?B?ZVBFcVkyV3ZDUDdrQ0tHSHpnekszalJaTng2SFo3QS82K2ZBZHBmcmhITWYv?=
 =?utf-8?B?YzVkRndrZGxHUjZ1dUZBTGorSUFNWG1NUEpXak9JL3dCSWdjaURnOWpmdU90?=
 =?utf-8?B?MktBdUIyQU5DVUtwc2R6L3RFN0Y0TzdEQ0hmd3NoVFRuYTdyQ1Z6eTJPVXFJ?=
 =?utf-8?B?bFI0MXdudjNKTVVWaEtYYmVsZVhTazJyUHRWUXBuZE4xUXQzaFJZclZLNCtT?=
 =?utf-8?B?a1pkckE1YUk5YlQ2ZHJPK2Zwek1aOVMvZldZcHhVVnNlZnI4NjZwdko3Mk5o?=
 =?utf-8?B?TVZuVURNVmhVUFlrcUwxb2VLRjdVV2hWL2pDcEx1d3U1N2xXRVFPbTBaSVVl?=
 =?utf-8?B?K3F1dUZUY0gxRGY4Z3FvL05WT2NqYVRZdkR3SW1oV1hnMUVWYTNMcHI1Tyts?=
 =?utf-8?B?NnQ4TVdsS2JONkFKajF6T0FtbysxYnd6Z0ZLUk5wWTRFTnEyd1krajkzTTJO?=
 =?utf-8?B?QzhvRHBXbUtwZE4wRndBcmcyZGQ5SzhZVDR1TklPT0hVdVdGQUFHclRSNkFV?=
 =?utf-8?B?OFN6RDJmUlR2RUJvSVUwQmRLQ2dTdGU5YURBb0NoUnh3SWdPam13aEtYUGtZ?=
 =?utf-8?B?Qld2YWdSK3lkY3h2WDZuODh6SnprcTVheUh2ZGlCY0hETFhyeStndGZYTGl1?=
 =?utf-8?B?RE5ET20zTm5DTCtzR1FUREpzMWNpQVJJWjQ4WmQ4R1ZiNHNmZmpqbXJyQzNF?=
 =?utf-8?B?WFVlK2FSK1Q1KzU4N2o4NUFNU0VuMlUvQTc2ei9oR3NPMjBRTDk0N0pNT0hz?=
 =?utf-8?B?UC91dTBMTWRXNVhCTVRreHp2TFR4T3VlS1RYT3FGOHVSbEN2dkpRakhzajM5?=
 =?utf-8?B?K1BlQU9jdURzTU9zaUpkMDAwc2dGNWZIL1lBSWRwR1A5bGZtT0tTR0VMUlhm?=
 =?utf-8?B?MmkvQ3lXU2F2QnNGNkhuRXJpYjV5UWllbEVQckcwRzBNR0I2NEVnUlhMd1Q5?=
 =?utf-8?B?NnM0R2liZkNXSTlRM0FOeTJ3aVdmM3F3eGduajBGYkRUVVFXODdvNkxGSGJz?=
 =?utf-8?B?S01SdWV4Vkhad1R4SDRKUFBYSWpwY2tQYTNNa1pJdUJ0R2RNSlYvWmFDZmxa?=
 =?utf-8?B?Z0MwR0NWaDJPQW9qK0dscG5rYUE1a3hPNkxxRXJmTjNyZE5RNStMbCtvdnJZ?=
 =?utf-8?B?Q3B0TFFMeXhPVWVscklReC9kcjZGTExyWE1Lb1Y4alh0MlNkMjhxRVhqUmlF?=
 =?utf-8?B?ZldFaEJWOGx0ajYrVzBqWm1JWkRPTjdqMnRrUC9qQ0l1QW5OMWpQdnpZeVpl?=
 =?utf-8?B?d0REaHY4SWdCV3FhYWNlVEFIUWpNQ3hyTVQ3YmRpaWdjOVlyMFBVVTY1dzVQ?=
 =?utf-8?Q?mG5pTKEJm+TQ8kZ/m2K1TPPqT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 091b5c5d-4646-4f36-7c7d-08dcc137a42c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 16:46:30.4179 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +eUPUT2w9x1nG9k4WzSlDEv8tWd/hV9K5bHA6vdhdndjYlHDGaugGY1ixn24SePhQ463xC8gXNBAjV0iBOefPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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

Hi Thomas, Christian,

On 8/20/2024 5:47 PM, Christian König wrote:
> Am 20.08.24 um 17:45 schrieb Thomas Hellström:
>> On Tue, 2024-08-20 at 17:30 +0200, Christian König wrote:
>>> Am 20.08.24 um 15:33 schrieb Thomas Hellström:
>>>> Hi, Nirmoy, Christian
>>>>
>>>> On Fri, 2024-08-16 at 15:51 +0200, Nirmoy Das wrote:
>>>>> Add TTM_TT_FLAG_CLEARED_ON_FREE, which DRM drivers can set before
>>>>> releasing backing stores if they want to skip clear-on-free.
>>>>>
>>>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> What happens if two devices share the same global TTM pool
>>>>    type and one that does its own clearing. Wouldn't there be a
>>>> pretty
>>>> high chance that the the device that doesn't clear its own pages
>>>> allocate non-cleared memory from the pool?
>>> That's completely unproblematic. The flag indicates that the released
>>> pages are already cleared, if that isn't the case then the flag
>>> shouldn't be set on the TT object.
>> Yeah, this patch is OK, but the way the follow-up xe patch uses it is
>> problematic since, AFAICT, xe dma clears on alloc, meaning the pool
>> pages are not cleared after use.
>
> Yeah that is clearly invalid behavior.


I was only thinking about one device use-case which won't leak any data 
though I am now miss-using the flag.

If I skip dma clear for pooled BO then this flag  is not really needed. 
Shall I revert the this and usage of TTM_TT_FLAG_CLEARED_ON_FREE

and re-introduce it after I get a working clear on free implementation 
for XE?


Regards,

Nirmoy


>
> Regards,
> Christian.
>
>>
>> /Thomas
>>
>>> If one device clear it's pages and another device doesn't clear it's
>>> pages then we would just clear the pages of the device which doesn't
>>> do
>>> it with a hardware DMA.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> /Thomas
>>>>
>>>>> ---
>>>>>    drivers/gpu/drm/ttm/ttm_pool.c | 18 +++++++++++-------
>>>>>    include/drm/ttm/ttm_tt.h       |  6 +++++-
>>>>>    2 files changed, 16 insertions(+), 8 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> index 8504dbe19c1a..935ab3cfd046 100644
>>>>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>>>>> @@ -222,15 +222,18 @@ static void ttm_pool_unmap(struct ttm_pool
>>>>> *pool, dma_addr_t dma_addr,
>>>>>    }
>>>>>       /* Give pages into a specific pool_type */
>>>>> -static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>>> page
>>>>> *p)
>>>>> +static void ttm_pool_type_give(struct ttm_pool_type *pt, struct
>>>>> page
>>>>> *p,
>>>>> +                   bool cleared)
>>>>>    {
>>>>>        unsigned int i, num_pages = 1 << pt->order;
>>>>>    -    for (i = 0; i < num_pages; ++i) {
>>>>> -        if (PageHighMem(p))
>>>>> -            clear_highpage(p + i);
>>>>> -        else
>>>>> -            clear_page(page_address(p + i));
>>>>> +    if (!cleared) {
>>>>> +        for (i = 0; i < num_pages; ++i) {
>>>>> +            if (PageHighMem(p))
>>>>> +                clear_highpage(p + i);
>>>>> +            else
>>>>> +                clear_page(page_address(p + i));
>>>>> +        }
>>>>>        }
>>>>>           spin_lock(&pt->lock);
>>>>> @@ -394,6 +397,7 @@ static void ttm_pool_free_range(struct
>>>>> ttm_pool
>>>>> *pool, struct ttm_tt *tt,
>>>>>                    pgoff_t start_page, pgoff_t
>>>>> end_page)
>>>>>    {
>>>>>        struct page **pages = &tt->pages[start_page];
>>>>> +    bool cleared = tt->page_flags &
>>>>> TTM_TT_FLAG_CLEARED_ON_FREE;
>>>>>        unsigned int order;
>>>>>        pgoff_t i, nr;
>>>>>    @@ -407,7 +411,7 @@ static void ttm_pool_free_range(struct
>>>>> ttm_pool
>>>>> *pool, struct ttm_tt *tt,
>>>>>               pt = ttm_pool_select_type(pool, caching, order);
>>>>>            if (pt)
>>>>> -            ttm_pool_type_give(pt, *pages);
>>>>> +            ttm_pool_type_give(pt, *pages, cleared);
>>>>>            else
>>>>>                ttm_pool_free_page(pool, caching, order,
>>>>> *pages);
>>>>>        }
>>>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>>>> index 2b9d856ff388..cfaf49de2419 100644
>>>>> --- a/include/drm/ttm/ttm_tt.h
>>>>> +++ b/include/drm/ttm/ttm_tt.h
>>>>> @@ -85,6 +85,9 @@ struct ttm_tt {
>>>>>         * fault handling abuses the DMA api a bit and
>>>>> dma_map_attrs
>>>>> can't be
>>>>>         * used to assure pgprot always matches.
>>>>>         *
>>>>> +     * TTM_TT_FLAG_CLEARED_ON_FREE: Set this if a drm driver
>>>>> handles
>>>>> +     * clearing backing store
>>>>> +     *
>>>>>         * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT
>>>>> USE. This is
>>>>>         * set by TTM after ttm_tt_populate() has successfully
>>>>> returned, and is
>>>>>         * then unset when TTM calls ttm_tt_unpopulate().
>>>>> @@ -94,8 +97,9 @@ struct ttm_tt {
>>>>>    #define TTM_TT_FLAG_EXTERNAL        BIT(2)
>>>>>    #define TTM_TT_FLAG_EXTERNAL_MAPPABLE    BIT(3)
>>>>>    #define TTM_TT_FLAG_DECRYPTED        BIT(4)
>>>>> +#define TTM_TT_FLAG_CLEARED_ON_FREE    BIT(5)
>>>>>    -#define TTM_TT_FLAG_PRIV_POPULATED    BIT(5)
>>>>> +#define TTM_TT_FLAG_PRIV_POPULATED    BIT(6)
>>>>>        uint32_t page_flags;
>>>>>        /** @num_pages: Number of pages in the page array. */
>>>>>        uint32_t num_pages;
>
