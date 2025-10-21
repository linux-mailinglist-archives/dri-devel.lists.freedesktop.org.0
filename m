Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E4BF43B1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 03:16:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1602910E551;
	Tue, 21 Oct 2025 01:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e5VbLLgs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF9410E049;
 Tue, 21 Oct 2025 01:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761009411; x=1792545411;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=DhXB8dBTzwUabIvjTALgF044wi2XJ6+6emFz4Al2Jcc=;
 b=e5VbLLgsbU01i3JtBtKH0rOCYRIbFE9r30CCt9j7J6U9Dk30xLKWps1l
 D09kyYdOxG8o3PHT9Y4WBHPuXNLUvwaK6y8ZgW+f4a9F8eIt1bIkVbPqr
 kod9CIxVmmbGn75PUFd8Gx2xASZLy1zPgUxt13gWg32hm3x4ncQ5D+klT
 WAD/+TrKjk67mbGIP8zbny6NWJDo3uabiEszaibKkZh4xlDHmpgpaWLrY
 HP9nGYg5Urp7xEIiH4Dv8A9RWNrxpfDISfwqMCztxOHK+CDhKHQkaezW3
 QqmqLzUezJQh6HK5w88KQufQJnz+/IRBNAB4RzPcZdJrCEkpi2aiXyDnX A==;
X-CSE-ConnectionGUID: mrEyqK/VS6+vZhrIhJlWnw==
X-CSE-MsgGUID: 5dsqg3BXS6WC/23M7Kq8rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50704964"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="50704964"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:16:50 -0700
X-CSE-ConnectionGUID: 0jHqHDNvRD6tJMqz6qCnwA==
X-CSE-MsgGUID: 1tagV2AHSTqzUImCSAvYuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; d="scan'208";a="182613745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 18:16:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:16:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 18:16:48 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.20)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 18:16:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LQBgzyPpvLLKybe/RmVPAIRO5jLHRbtv/J8p8TGP/ecuy65OLuEfP4BmSIXHpyijAYeEu7YqDUWFa6/FMzeFvB8m6f5FWmQ9vRrWJN3+EJF40Cz1X8g9lgPkcm7ZjRXEhENxRFaqDYu5cC0nQZgkPitItFeTRpUV6Retac6K1yFIg6BnoalXMoFEXLwZJRyJqtd4uzlf3kZonC2ko2eDolOJteBc7AsoSETEhnasHFWH2xTpnBtXCAGIR/kfCpiCIidY6/YeOIle8tRIb6ULHpHtK3TArZLu56SCEdLhSoIqE0g7AW8k7TEGxN7Kxboi1WLTYPRlGGykJM5wYpBRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLQCbwV6gCxHKDGbIJ5sSlpvrdTUeV89VlpE00C7CXE=;
 b=IieylBYlErEq2d6r0hPDOHIniCgKGlPfyazywJ5WPLhU5XVpUFg3FvHNe4Rr67xgRlsPE58uokrMfYKncL+opzdoFLJUFMZHlSPRUFRAvs4IppmMc9aece85ZGu1bpoKl+sTHL6l9P07kD2XUkyVEeAuLYhH3mEIh7EI3MFoEaCHyuQ22gOODoPJ7ZnIeJXH/6HYqGF7CfmNej/d3gG3lmbGkS1IfOtInz1pNri2rWtmc/Dxg68C34cx6uqJs7+YuBEozg4/dgDGbss+5P4wA/8X1Vrq30cNi6fk2A03AK+kEn50e0Cz/Zi3yvyDQLv+d8nRnm54waTxdbqVYElJgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 IA3PR11MB8987.namprd11.prod.outlook.com (2603:10b6:208:574::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 01:16:46 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 01:16:46 +0000
Date: Tue, 21 Oct 2025 03:16:42 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 18/26] drm/xe/pf: Handle GGTT migration data as part of
 PF control
Message-ID: <lb2bjtwgsjjzi6wzbxqk4w74ytaovihod3kdmcvr2m4wffkjoz@tnzpdg3v7akl>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-19-michal.winiarski@intel.com>
 <07d33e0b-0078-4075-bc70-e09a8ec17a97@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07d33e0b-0078-4075-bc70-e09a8ec17a97@intel.com>
X-ClientProxiedBy: VI1P189CA0011.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::24) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|IA3PR11MB8987:EE_
X-MS-Office365-Filtering-Correlation-Id: 64ec6df9-ec35-4742-93cd-08de103f80d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVpMQnNQRi96VDVZc2tpblplTGYvNHJiVytZWEpPeGtaQTJ5SHZ4VHV0Y2xR?=
 =?utf-8?B?YnZTVnVRTEwrMWZtcFl3aGNuajQvVy9NQ252cHBDVzVvQUp3ZkJQL08wc3I0?=
 =?utf-8?B?N1pPVlVEWkQ4cHJSaXJQejVNWmFtNk91N1VqcVdBUjZ6eXdPakd5Ty83S1d1?=
 =?utf-8?B?RlRCNFdUUjFBcVpsd25JTGtGNUJBYzlLakJINS8vbHZMMHBZUkVwKzFPd1hV?=
 =?utf-8?B?SE1YUUpKWUpRbUdjdm5VNDRkbnZvUmVuUXNBMmEzUEp4OHZHbDZCM2ZYSVdO?=
 =?utf-8?B?WUZjbjFNcGZubmFxblVlckN2RmpQODQ5dGJwaFlHWVhwZWt6T3A2Q1lhRDNJ?=
 =?utf-8?B?NkRHTjlSaEJkd3RJSWtVMVZnQTEzS3ExV2RFdVF4YTg3TGs4SnNsT01URXpl?=
 =?utf-8?B?SzZJaWp3ek4xam9xdm4vQ05mZk9Hc3ErUzJoSHloWmtyUnc0VEVaclNXNlpK?=
 =?utf-8?B?bXFBdUxYMCs3dlVBWWdDajZDNnE2a3VVSTJTNDdoR1Q4aks4NjRZMEVOK0tY?=
 =?utf-8?B?UEtVMjdaWW1jSGNxT3k1VDRVS2ZHNTVmenp6RVZkZmt3VWRsQ1hlQ3pGY0dZ?=
 =?utf-8?B?dk8rTTRxbFNaVEdPSExBcGZFRmdrc3hQZE0zaERZTW5CRDJYbDFTempIUjd0?=
 =?utf-8?B?MEx0bWJNTjF0SG5HTm1SNDlGQkxXYW9JUmV0YUk0bEdXd1c3L1gyN0tqdkkv?=
 =?utf-8?B?OHk4VTZ2VXFORXdXcE1vK1kzYjVLYm16N01na25IQlR0dVV2TXFWbFRxdWt4?=
 =?utf-8?B?M2g4U2wremprMjU0bHN3aE1yajRMNG16OGRWL0FReDBmV2lteFNnNFNhbWdp?=
 =?utf-8?B?ekRONE9NaWhDMUNXOWVTRFpuSG05WmE4V3dhdEM2VXd0YTBaeWllTzY0aGpT?=
 =?utf-8?B?QWhsd0h1RHpaWFRUKzZ2YmN0OFBnWHV3aXRjQURHRkJ3SmRVcEd1Y0JXSEY0?=
 =?utf-8?B?c2lWNmc0Umd1M3JjOHRQL0wyeVljWHExcFMzdTRVSWFoSldmdzR5K1h2bHdW?=
 =?utf-8?B?ek5MUmZkS00rVmU2cnViWDdsVWt2VnZBQUNSWjVmZnQxR2hyVFlFNFlwdE5O?=
 =?utf-8?B?WURsTzJ2TjVOQXpoRzdTVnJFaE56OTBKY0IwQlJVN1orVFNUU2VaKzhBKzNs?=
 =?utf-8?B?aW9SRXZMQ2JURVQ3c094ZmV5dVNGZkFzN0RxbzNsTlcrc2pJSTh1QVlQRWdM?=
 =?utf-8?B?UTVwdlpSVk9vSzR5azdIT1FuR2NDMEFnSGV5RkN4WWRRdUdTVUtVNnBHYWcv?=
 =?utf-8?B?amN6aG9sd2Z6N25iMFlOWU5nNVRsa05ibEIvcFNUL0JGQ3JwZXJwWEZ4YmdI?=
 =?utf-8?B?Ukd5TmxwQkZJcFpiN0JXRFIxVTNja3FwVkc3Y1NmajZORjhjeFRTcldpMUs2?=
 =?utf-8?B?bm1ub0pPZkJ6SU4ram53Nms3TDdiR0lGam5tTFJ4RklnNUxRVXdWQThpMHlp?=
 =?utf-8?B?RWFsa2dPK0ozMVVzVXJ2VndjdjdqZnp0N1dxNXlLUnZJeUpuNUMvZHljYnU2?=
 =?utf-8?B?ZERJeFduTTFuMWZlWGFWaVRISnpNQUtHaGI2N09HZW9UMW93ZGVaNDdBVGlq?=
 =?utf-8?B?UVVId1kwMFR1YjdOL1pRUFozV0t1SlB5dHBhKzU3cU1HYjVBK0NxMjdmWkpm?=
 =?utf-8?B?Wjd4KzJCMEY4WXdOblJNUWdOemNkcmRPY05zYklSUCsyamNneWtiSnY1bk91?=
 =?utf-8?B?UnlTcWRiaTBzZEJIaUNJUFpaMS90bkNrSVBRS00xejgvZHZaZmUyb284R0Rn?=
 =?utf-8?B?L1lCRnBYOVNrS21uUDRzQVZzcGhsNUFNOUhPZ0RTKzNUcENmVnJtWUZ6OUJX?=
 =?utf-8?B?OHJjK1J3c3VOU2ViTm9QbUxuZjlob1lmcUdsMlQvdmxHRGloWDYrZ1pSVi81?=
 =?utf-8?B?bW40ekU3eDZqaG9zdzRoaDByNXdPdDQxUitJVGRtYXl4TFlmM3JPN3lOdHBS?=
 =?utf-8?Q?AeYp3D02okzKjREPzht2TCjZK8c+Z8fd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTQrNk95YnFsWVJZUmc5Unhjc1UzYkZOYmFHMm5UWlBGajlUY09OV1BZTDlu?=
 =?utf-8?B?c01pVWgxVllYZm43TzlSY0RTZVNNbHhrS1JZeGhIMkVYd0QvRk1ZQnBwMlE1?=
 =?utf-8?B?QlJReFF2elMwMGdMejREQVRHdTlmT0ZVbzFVb1FNb2F5N1NRNDErVzUwWmRG?=
 =?utf-8?B?UkFMMGdzcHFGU3pBb2Z6TFpSa0lTako1T09ad1RiZzFJRUlpYmpwUHBpMEZ5?=
 =?utf-8?B?R0s3dnRtQlRqLzBwZGRYeWt1UURRMllxcjI1azRVM2VHQjd4dFJ5K25RK2Fs?=
 =?utf-8?B?eEp5MnhTZzhZR29uL2pUSTZISTNjeW1KVU5CTGswMUNTRyttblBhMVlueFNL?=
 =?utf-8?B?WFlWL291a1JFWURqbFlNUXowc2hFNnRBTVRud1p5YjhKTTkrNHdHczd6NkFv?=
 =?utf-8?B?NTk4dUJRblNXcU95YmVMOXhFbnV2RTliU1Fvb2laQUlOZjVZcSt6bGs0eVE1?=
 =?utf-8?B?L2dXRFJJd1hjbGI2ZERGdlRSRXFsdTdCTTNvUjJGa3RoYWRlK3JLSHM4dUlC?=
 =?utf-8?B?OEo3SkoySlBCQ0RnMkZtL3g0Y0trcjdhcDltRXBKZ3FNMk1BUG5qakdFSW1L?=
 =?utf-8?B?OVJVVzhYMjYyS1BVVWJaK2FGcFpUbmYrZFdaSDZxak5UdFJ1d3Y2UUN4d3A1?=
 =?utf-8?B?M3JVTzROanFqcjlnRWtmWHpvb014TkRUSkxOUU9Ca1hOWFhaUDFzNys2QzFB?=
 =?utf-8?B?VWFUZWl5SFdJd3FQZEZPL3FhYm5JalFhK3B0bVhiSHhDaXpMOUx5dEN4NGZV?=
 =?utf-8?B?NjBzTk1sUFd3RGpzbnIzRnZUOXFkazJGamswZDZCRTk0MUZ2YjE3UUE3MDMy?=
 =?utf-8?B?aEZtS1ZqTk1uMFkrZCtVZFVwWmdoeWpyeEVYeUZrbWYydTRELzc4RmMwOFZ0?=
 =?utf-8?B?Ny9PTTVXWWNraHhjVDFRMlBSU010TmRweTE1RkFlSGFJamFDSDZVMWNnTFBt?=
 =?utf-8?B?OTlwZWJtczBuYStMcW8xTmxRbWlLRDhhN25xMDZER2RJbnNCRFRWMUZ1cThp?=
 =?utf-8?B?OWNFSGM0bGdFeCtQZzVvaXJ4QWpUREFRSC9Jc0RIczI3SGRvUDlqMVUwbFRw?=
 =?utf-8?B?dGxFME1xR2M0MjZyajdVUXhqWG05ZHhqWC8xUHAxb2RKL2trWUdIYU14Z1Jq?=
 =?utf-8?B?M2xNMGZPbHVvQ2JFZmU0V1c0aXdJMlJibGdlSlZXQlJ0OHFQWldna2U0Y3JL?=
 =?utf-8?B?M3RCK05vVGdoMCtqL3NiVDcyVi8wUVRpenFMQ3B6WnEwR3U2VXorZ2R1L1Fa?=
 =?utf-8?B?TjRVTWdITjdlL3VVL01oY0FkbXNTSVVLQTVleW1SRHFuZDljVUxxUUVBUlha?=
 =?utf-8?B?bnVQMjJpWUZWQU1DYmNOZ0kyblR3TldkVDJXZm1uT1NoRUNoekxUd0F2RVdR?=
 =?utf-8?B?ZWpPd1NCMmNZWktwNzdGcWlsVEViWUQvSjFqYWZybURpTVBXODlLSFBBeUdS?=
 =?utf-8?B?WDJ6MWcrL2w4bm9EUGxFZWpLeWtxUkVmV3Z5Um1ORHlPQkdkbXJtUDhvN1po?=
 =?utf-8?B?N2ppY3JPN1RrK3o3ZVNoYTB4VFZsMitETklWWWtURmM2My9ibjF6cXRvb2do?=
 =?utf-8?B?MFNWK3ovaG4wQlIvVkJ1cmpOTDVPeGRteFp1TzMxcjZyK2EvdFhEbEhYYnh0?=
 =?utf-8?B?VXp1NjlvUWt1dGRGOHRjeEpQZnpjVnRSUXUrMm9oV0h3OW5yWUV6bFF4d0pz?=
 =?utf-8?B?Wmp5RHo1SFFKMFZ5R1FkZmk4UWJoNWFFdHd3QTNuRnBId053WHNtNUNjOGxL?=
 =?utf-8?B?OGVlUHF0S3laSE5sVFVLNWNRVkJHTGtBaStSUEVsRHgzMjJTbU5aSHFZOEg0?=
 =?utf-8?B?Wm4zM2tmT3E0NFFXakhCZXlzRi9NY2ZvNTRmbDgzUThlRkRUay94V0s0RTBt?=
 =?utf-8?B?bWt2N3FLcW51N2w2S3htRjdZWDhIWmwyWVk2aHNMTHNucGNSd1E3enI3aWZV?=
 =?utf-8?B?alhpN3ladXc0QXNJZENxSFJQNDZORGhPQWNVb1lLK2lQeVJRd1VpRjhqT3Yz?=
 =?utf-8?B?NEVpalNhN29CTThCdW9PaVREMDBQYVpoeUFCTlg2T0RGUWw4d29oc2Zld3Yr?=
 =?utf-8?B?M2twL1Jrc0hsNXJHVVNaZHFSLzlkd3FZMDFVWjFhN05aN3JGSzZaV1M1bGdQ?=
 =?utf-8?B?bU9SSDVvKzU4Q25zeVJJYm82L2pHWGo5a2l5RS9rbWFGejZSdDFwQk1UQW11?=
 =?utf-8?B?TXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64ec6df9-ec35-4742-93cd-08de103f80d7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 01:16:46.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pp6yacirrX9j4Ovj2i90KrCQJUioLy9jaO/eQA5s8Neb7AdzxzzJxYz8Ccx1J7BKTXkE/aWMIAjAbvEAP2e0MtiAxY7VigRcKeTeXzkBoRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8987
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

On Mon, Oct 13, 2025 at 02:36:56PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Connect the helpers to allow save and restore of GGTT migration data in
> > stop_copy / resume device state.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c   |  13 ++
> >  .../gpu/drm/xe/xe_gt_sriov_pf_control_types.h |   1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 119 ++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   4 +
> >  4 files changed, 137 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > index f73a3bf40037c..a74f6feca4830 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> > @@ -188,6 +188,7 @@ static const char *control_bit_to_string(enum xe_gt_sriov_control_bits bit)
> >  	CASE2STR(MIGRATION_DATA_WIP);
> >  	CASE2STR(SAVE_WIP);
> >  	CASE2STR(SAVE_DATA_GUC);
> > +	CASE2STR(SAVE_DATA_GGTT);
> >  	CASE2STR(SAVE_FAILED);
> >  	CASE2STR(SAVED);
> >  	CASE2STR(RESTORE_WIP);
> > @@ -803,6 +804,7 @@ void xe_gt_sriov_pf_control_vf_data_eof(struct xe_gt *gt, unsigned int vfid)
> >  
> >  static void pf_exit_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  {
> > +	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
> >  	pf_escape_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
> >  	pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_WIP);
> >  }
> > @@ -843,6 +845,13 @@ static bool pf_handle_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  		return true;
> >  	}
> >  
> > +	if (pf_exit_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT)) {
> > +		ret = xe_gt_sriov_pf_migration_ggtt_save(gt, vfid);
> > +		if (ret)
> > +			goto err;
> > +		return true;
> > +	}
> > +
> >  	xe_gt_sriov_pf_control_vf_data_eof(gt, vfid);
> >  	pf_exit_vf_save_wip(gt, vfid);
> >  	pf_enter_vf_saved(gt, vfid);
> > @@ -862,6 +871,8 @@ static bool pf_enter_vf_save_wip(struct xe_gt *gt, unsigned int vfid)
> >  		pf_enter_vf_wip(gt, vfid);
> >  		if (xe_gt_sriov_pf_migration_guc_size(gt, vfid) > 0)
> >  			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GUC);
> > +		if (xe_gt_sriov_pf_migration_ggtt_size(gt, vfid) > 0)
> > +			pf_enter_vf_state(gt, vfid, XE_GT_SRIOV_STATE_SAVE_DATA_GGTT);
> >  		pf_queue_vf(gt, vfid);
> >  		return true;
> >  	}
> > @@ -970,6 +981,8 @@ static int pf_handle_vf_restore_data(struct xe_gt *gt, unsigned int vfid,
> >  				     struct xe_sriov_pf_migration_data *data)
> >  {
> >  	switch (data->type) {
> > +	case XE_SRIOV_MIG_DATA_GGTT:
> > +		return xe_gt_sriov_pf_migration_ggtt_restore(gt, vfid, data);
> >  	case XE_SRIOV_MIG_DATA_GUC:
> >  		return xe_gt_sriov_pf_migration_guc_restore(gt, vfid, data);
> >  	default:
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > index b9787c425d9f6..c94ff0258306a 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control_types.h
> > @@ -72,6 +72,7 @@ enum xe_gt_sriov_control_bits {
> >  
> >  	XE_GT_SRIOV_STATE_SAVE_WIP,
> >  	XE_GT_SRIOV_STATE_SAVE_DATA_GUC,
> > +	XE_GT_SRIOV_STATE_SAVE_DATA_GGTT,
> >  	XE_GT_SRIOV_STATE_SAVE_FAILED,
> >  	XE_GT_SRIOV_STATE_SAVED,
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index 0c10284f0b09a..92ecf47e71bc7 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include "abi/guc_actions_sriov_abi.h"
> >  #include "xe_bo.h"
> > +#include "xe_gt_sriov_pf_config.h"
> >  #include "xe_gt_sriov_pf_control.h"
> >  #include "xe_gt_sriov_pf_helpers.h"
> >  #include "xe_gt_sriov_pf_migration.h"
> > @@ -37,6 +38,117 @@ static void pf_dump_mig_data(struct xe_gt *gt, unsigned int vfid,
> >  	}
> >  }
> >  
> > +static int pf_save_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	struct xe_sriov_pf_migration_data *data;
> > +	size_t size;
> > +	int ret;
> > +
> > +	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid);
> > +	if (size == 0)
> > +		return 0;
> > +	size = size / XE_PAGE_SIZE * sizeof(u64);
> 
> maybe it would be better to avoid reusing the var and have two:
> 
> 	u64 alloc_size = xe_gt_sriov_pf_config_get_ggtt(...);
> 	u64 pte_size = xe_ggtt_pte_size(alloc_size);

We just need the pte size.

> 
> > +
> > +	data = xe_sriov_pf_migration_data_alloc(gt_to_xe(gt));
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	ret = xe_sriov_pf_migration_data_init(data, gt->tile->id, gt->info.id,
> > +					      XE_SRIOV_MIG_DATA_GGTT, 0, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	ret = xe_gt_sriov_pf_config_ggtt_save(gt, vfid, data->vaddr, size);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = xe_gt_sriov_pf_migration_ring_produce(gt, vfid, data);
> > +	if (ret)
> > +		goto fail;
> > +
> > +	return 0;
> > +
> > +fail:
> > +	xe_sriov_pf_migration_data_free(data);
> > +	xe_gt_sriov_err(gt, "Unable to save VF%u GGTT data (%d)\n", vfid, ret);
> 
> use %pe for errors

Ok.

> 
> > +	return ret;
> > +}
> > +
> > +static int pf_restore_vf_ggtt_mig_data(struct xe_gt *gt, unsigned int vfid,
> > +				       struct xe_sriov_pf_migration_data *data)
> > +{
> > +	size_t size;
> > +	int ret;
> > +
> > +	size = xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);
> > +	if (size != data->hdr.size)
> > +		return -EINVAL;
> 
> do we need this ?
> 
> there seems to be similar check in xe_ggtt_node_load() called by restore() below

I'll remove it.

> 
> > +
> > +	pf_dump_mig_data(gt, vfid, data);
> > +
> > +	ret = xe_gt_sriov_pf_config_ggtt_restore(gt, vfid, data->vaddr, size);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ggtt_size() - Get the size of VF GGTT migration data.
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: size in bytes or a negative error code on failure.
> > + */
> > +ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	if (gt != xe_root_mmio_gt(gt_to_xe(gt)))
> > +		return 0;
> > +
> > +	return xe_gt_sriov_pf_config_get_ggtt(gt, vfid) / XE_PAGE_SIZE * sizeof(u64);
> 
> this conversion logic should be done by xe_ggtt layer helper

I'll add a helper.

> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ggtt_save() - Save VF GGTT migration data.
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> 
> since there is assert, probably you should also say: "(can't be 0)"

Ok.

Thanks,
-Michał

> 
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_save_vf_ggtt_mig_data(gt, vfid);
> > +}
> > +
> > +/**
> > + * xe_gt_sriov_pf_migration_ggtt_restore() - Restore VF GGTT migration data.
> > + * @gt: the &struct xe_gt
> > + * @vfid: the VF identifier
> > + *
> > + * This function is for PF only.
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_pf_migration_data *data)
> > +{
> > +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > +	xe_gt_assert(gt, vfid != PFID);
> > +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
> > +
> > +	return pf_restore_vf_ggtt_mig_data(gt, vfid, data);
> > +}
> > +
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> >  				      u64 addr, u32 ndwords)
> > @@ -290,6 +402,13 @@ ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid)
> >  		size += sizeof(struct xe_sriov_pf_migration_hdr);
> >  	total += size;
> >  
> > +	size = xe_gt_sriov_pf_migration_ggtt_size(gt, vfid);
> > +	if (size < 0)
> > +		return size;
> > +	else if (size > 0)
> > +		size += sizeof(struct xe_sriov_pf_migration_hdr);
> > +	total += size;
> > +
> >  	return total;
> >  }
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > index 5df64449232bc..5bb8cba2ea0cb 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
> > @@ -16,6 +16,10 @@ ssize_t xe_gt_sriov_pf_migration_guc_size(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_guc_save(struct xe_gt *gt, unsigned int vfid);
> >  int xe_gt_sriov_pf_migration_guc_restore(struct xe_gt *gt, unsigned int vfid,
> >  					 struct xe_sriov_pf_migration_data *data);
> > +ssize_t xe_gt_sriov_pf_migration_ggtt_size(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_ggtt_save(struct xe_gt *gt, unsigned int vfid);
> > +int xe_gt_sriov_pf_migration_ggtt_restore(struct xe_gt *gt, unsigned int vfid,
> > +					  struct xe_sriov_pf_migration_data *data);
> >  
> >  ssize_t xe_gt_sriov_pf_migration_size(struct xe_gt *gt, unsigned int vfid);
> >  
> 
