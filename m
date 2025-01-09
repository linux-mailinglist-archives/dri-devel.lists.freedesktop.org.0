Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C950A080D3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 20:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCCC10EF18;
	Thu,  9 Jan 2025 19:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O3pOR4sO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E4410EF18
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 19:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452211; x=1767988211;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SBpw/af7Cq9B9MSCw6QrOhoweT5GF4OJbPcS9Ahf+50=;
 b=O3pOR4sOQfZLhh3aHdOePr3Da5lf2JTHibAQV0JL0RlpRxZFuT3QG8F0
 j5A2lU9/3UOLCqhvoMzaF5hBX26+nXnEwKL+g+STcP8ub/75DjEF9nVZo
 rS7WwwKYQG7whV0IMg1t3TIchfNXCa7aCmuakrzr17P99GJL7FVMmjGkm
 SmAbb+XQpGYrrRy6Ayw7/yKh0kUghObYIxmHzXYXc3D+aDZIW21fl9Af7
 TUCi5IBuVLJDJPSOxoAk1UZ+EkdfdzyJ8xx+Z6kz/yDTSyVYDJKPBuA6q
 O54TOAviDWgNrRdkx90MOu0eRiMZDKAoejbOyHq6bJWM4Hswb8ZtLIPnz g==;
X-CSE-ConnectionGUID: FtPQBrJ3Sv6ymT8wJD024Q==
X-CSE-MsgGUID: ZnVHrByRRzSpRjsXbjmIlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="47228078"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="47228078"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:50:06 -0800
X-CSE-ConnectionGUID: Ih2b+HApRmCY4ys0jZBNoA==
X-CSE-MsgGUID: gBpqYp9FSrykQ3sU1HKjjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="104025138"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 11:50:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 11:50:05 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 11:50:05 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 11:50:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ppin8VF9hcQGGWOV6oi1HGus7jJ7cCUaLHnBue9UGJkFRKKw2qaSrpO9jA1BtFrLv1eYlq2rxVKso4xaInA1JEYJ7yMo9loTQT1peZ3ZuHUkxHG9yCsV7XpWGRfGd4Ztx0Rmh3mN7W2EvV8HZUeJw8l6eh6B34ZI0ygYxrZHT6h3XKjZnQyFilQdafhOqqlB8OpbhuJj1xXsgvJ4GeU/R7AV4F8KoxLNHeCSMrrhOcg0LEarglp/N3iHTdS+EAxSkrmT3pA/O1SuHusPt87qPpUlQ7iKGwJjnnCY98lFIFBEtPHgr+WvB+H81ubhYtR/MP4NLwXZ6G3MfEJhLLB5jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhH8mu1x2Deyi0MfKMvlERH6ZEOhTgB3eqW+oSZ9AUc=;
 b=XPBg812d1H3XtPOJl8aeNP50bwOV7vcPnDWNuO3PO7fsjVjKBHTnINjaijTXALG4rotUOWqAF3hkiZZplnEkm7JG0diwRHfzPWPp27i7PpXK3W9Qt8QCGEHFciTvsraDoRkS/zoTAWwJqh/54Lz7xAxJrwnp8TERvoG8GNXtg0LD7klJyBktLnT8VI8cfYLw/flJR7gavSRqgR90Kuno4hwPDMpdMLQGNWbSe9JEkhcrkicuL0jumtzPhfFVz5RiY0nivFBbWFzQW+V/3yVUEqwSFD45rf0/po0j+NQmIM72pmfz6RAU7Kj0mGezc6t5rF/A25MaoS5f1nDElCKhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by LV3PR11MB8696.namprd11.prod.outlook.com (2603:10b6:408:216::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 19:50:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 19:50:03 +0000
Date: Thu, 9 Jan 2025 11:50:53 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Tvrtko Ursulin
 <tursulin@igalia.com>, <dri-devel@lists.freedesktop.org>,
 <kernel-dev@igalia.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Philipp Stanner <pstanner@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z4AonS1Yl1GgVjRu@lstrano-desk.jf.intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <Z3433G3-_aIMqJbt@pollux>
 <f7c333dd-6c6e-43ad-8879-8e9ccc374f5c@igalia.com>
 <Z36udQs86Mn1-T5p@pollux>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z36udQs86Mn1-T5p@pollux>
X-ClientProxiedBy: MW2PR2101CA0026.namprd21.prod.outlook.com
 (2603:10b6:302:1::39) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|LV3PR11MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 382511a3-9388-429f-f5ad-08dd30e6ceea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVdoMDhzSlg2Ync2RitqSTBLQ3d3RUFodDJHSUxrUUZadWdHMlVGSFhIVC9M?=
 =?utf-8?B?TjVmSlVIOFhWYmxTNWtmbWxCK1FyaE1KTVFZOGo1bnhVRXM2N2lmWnFpZWw2?=
 =?utf-8?B?T3dMV3BVTTBaenlNaS8wem15Y2g5WGk1TVZXTmQrUkh1Y3JIUStHcGZTQzdi?=
 =?utf-8?B?SGloeS94YlR3MklrNlQwdzdndVBaMWlWL01vbXR3aUFpVitWc0lPVDRuOTNV?=
 =?utf-8?B?azhJNWIyc2wveEhoOTA1bUV4a3VYT3FEdk96QUYvTzRXaE9TT3BnMkZQNVB6?=
 =?utf-8?B?QTBPbzVpVTdPSSthUnBhQXJJY2o3RzEzOG1HeFVyVENoNEhnMDF2dzBrQmZ4?=
 =?utf-8?B?U21UVVBXeXFpbU5iODhNRDVjTDVHS0xzNzVibXJyMlV5WnZaOW82Q2d2TEl0?=
 =?utf-8?B?N0ZzRXJjWDQ1VENNeGVaSldVUU4ybmFVQ3NLK2FEQzJvWHVISitSMXdWQWZD?=
 =?utf-8?B?eWFlM2l6L0ZIS2htVmJLbTFlYVN6eENlOGNvVjhGNC90aW9JM1VwWmx4OHpn?=
 =?utf-8?B?ZEpKamNRdUd1aDdaUUk4ME0wV1pIeDdja1dwSUJQODBFL2xvMFRVaVVBbUdH?=
 =?utf-8?B?d2JmTG9XMEJhOTJObTVUQ0RlK29hVU16dEFpR1M3ajU4bXVYalY1WGliVEdo?=
 =?utf-8?B?cWhYTTNqQ1paci9Va1dTclBsaVJnQmpNOHZqamN6S0M5Z0JwN0drZElJS09D?=
 =?utf-8?B?SmhRQ1A2SXZFRWVHS05GSG5jejdCOU1oRWJUR1NRdmV1Q3JoTytuSnF6K3hr?=
 =?utf-8?B?ZVVJMEJPa01vVHF1UjZGOFZkZVB2bHpQbmlmSTVzSW96QW1aeUVaL2g4Sk1l?=
 =?utf-8?B?d1BoN2tYTlorVDRoeHJYNU1YTWxEbCtNTmt2ZEgwb2Y2RnhiS1U0UkpPNTFo?=
 =?utf-8?B?TlZSbWdnUlBjT3NML0k2bUoyMHFveVdEVlJJUEd4V05pSThyNG5NcnNFRjhU?=
 =?utf-8?B?L0hSU1JlZXhRZmNCZ3VmRjRtRnBhTXF5T3Q0L3YwZE5FcWx4dHMyYVhhZlFu?=
 =?utf-8?B?Q044eWlPbisvV3llWHhIaWIyTEV6aHVqSFF4eTZQVXBwVktNR25lZ1o2VXl4?=
 =?utf-8?B?UjRmaVJMTXhuQkF1Sy9tOHNjQmxqZFdPamMvVnhHSDQ1OGdRdHFaQjRUUzQ3?=
 =?utf-8?B?MGJDWG4zckhsamdKSGltOEpQYzRVVGtKbHJaaFRIQ3JaTU9UQU5HOUJwSkFE?=
 =?utf-8?B?bnUxNVNqWnFPTEh2SVNvUlhoQTlQb1NqbVJ0YTNidjZhZUhEZHdPL25TQ1hG?=
 =?utf-8?B?UyttK0duWjRUYjlzUjlSVFZCZnlNM0tEWVdVUGJCYjFaWUYyK0p2U2o3ZllX?=
 =?utf-8?B?aThwdnAvR2FLNUJBYlRvOHlSSDZla2NZdjlBTzlXQURBZ2c1bVVaU1NNTHQy?=
 =?utf-8?B?dDBQVkx6OG5wOTg2OHRaOWt1RXQvaitTeHkxbmI4QjJLNkhkTUJMa2laTGU5?=
 =?utf-8?B?b3FhaHE2cEtDaE1KdzUwSWRYWWF0emRwaWQxd2gvQnZseXVFNmx6THpsSTMw?=
 =?utf-8?B?TTFmNHREcDNib3JlRW5iVWU0YjhrNjBpU0FkSk5QSFI2WGRTR0F6L0FGT0th?=
 =?utf-8?B?aUhrYTZFNmU5Q29OS1NVeUIwaFd0OWs5QW0ybzFqMWFqMXZHLzNiQk1iOU1s?=
 =?utf-8?B?SWRxOGhONm4zenVPTXlpdDNjVlVwdDRNVzVUeHA5Y1ArcUdZYlhVMHNVajZ5?=
 =?utf-8?B?Z0JqZ1pjaWJqamFsYWc2OGwrN2p2Ulhra3ByM0ZaMFVsa0tFcTlqOW5BZzJk?=
 =?utf-8?B?NEhodTdzaWtvV2xKM0hCcmdzNGZQK0F5QWltdCtKRjhFcmk0NGV5L1pUQ3A3?=
 =?utf-8?B?bDVackxHc1dCZnZ1Um0rVXFINDVPYnMvallUcUs0Umdjdkp4NUhwZTQwRFhl?=
 =?utf-8?Q?NCU9aHecXfV1k?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SnY5L29ETmg3ME56NlZ0NzJKdWVmT2Z1SEFneFRXRisybUpBdUdRYWRLOUVI?=
 =?utf-8?B?dVFhcVJnMGVFNGJNdTdUR0ZJSlBZM0trQ0FoZ2dGczFOZzBLUFkyQWtoUURK?=
 =?utf-8?B?dWZYV1BDVy9GeVV6UGV1Vms4bWpMc3daeS9BeEVDd2ZZeHJXOUhhaG1Tb21n?=
 =?utf-8?B?ZzRnUEkrS3IwSnpVMnJ2VGptUGorM2NSamhYeUZYaEptR0Joa1lNL0pqRzIz?=
 =?utf-8?B?ZFFPUWpjSW1jcDNyTGZVNmJuWll3Sy9DcGxmcDBPdUJTY1JMMS9BaTR0cFd4?=
 =?utf-8?B?RURDaGJ5SlRUakl6eHN3RXJ3QUUreXBiL21oZ01sOFFud1FNeWtTNnlOcUly?=
 =?utf-8?B?Y0M5dDNVdlpER0ZpN0NURXJsZUFJVSs0KzZNcE01MzZFR2NwN3FqQVBGb3pt?=
 =?utf-8?B?aktPY1dvYXkrWVVjcWdWZGMwWmVEVHJBckhRV0xFUzVQeGhYZXc3U2ZLRHUr?=
 =?utf-8?B?Q3BZM012dmJRVVIrWEFqbFJPZTdXN3dHWlRURDhicnBDVHFuU3p0K1k0a2F0?=
 =?utf-8?B?ZFF0eXB1VnZpeWNjUUFWV1dhUWtRZEF0N1RvTDlwdDNwM21EYWRHVk5DZ1Zo?=
 =?utf-8?B?bDY3NGhQUlhVN3MzY1ZwK0RNZVFVWlpoVllNOTU1SXoyMlBoSkZyYy9meHNV?=
 =?utf-8?B?ZnF4WkthZERPSGJla2gzRGtiRU1VK1loaXVqWUkxeHo0WlEwWWNpTEZHZnhD?=
 =?utf-8?B?MHphZlM2TWxQbkwxUmdWZmNaQlVSWE0xNkNQUldaLzdzdUd2dGVUOE9UZGZr?=
 =?utf-8?B?cWlsZmwwRzI0N2hhZnU2d2ZPcjVJNms1dVh0Mmd3U0hWaG9pcTZVUFhUakly?=
 =?utf-8?B?OGtIamNpeUJ4RlFUN2JScThBWEk4TTFJaDdVWjhZaHlyQmRLanFUT25mMGhH?=
 =?utf-8?B?OW9Va2x4T3JJQVlQNjJzVmYwekxhOUlDZHNOY1lDbTBRcjhDM0FuUWNuR1Bz?=
 =?utf-8?B?cFI1ZnFVcFQwbG5VcFM0dkhsbmFQZ2tuMHJxNy9tcVNlY0JWdWE1TUIwQlpw?=
 =?utf-8?B?WFJCMU9ZRUFLREZLZFhwajVhSXd6bjdTL0JaS1B4WlNqcEJ3cE1iU2tLOVpT?=
 =?utf-8?B?azhjWFlYYWUrck9DNk9Wb3pCTzJSc21sRU5vc2gveUI5TDlmVGZ3UTJVQ2NF?=
 =?utf-8?B?aDFnUlJsaERaUmthZmNYOThySnRmQ24vRndWRktmbk5WWlVGM25pR2sreVBq?=
 =?utf-8?B?NVh0bXVVcFZXZWgzSTduTHJMcWc1NGVvWk1QLytVOGVET3FKMWlPVTUxaE02?=
 =?utf-8?B?ZzNKWFZuOEV5ZXJNd1lSNFphbDIxWW5VRS9BejZSVEpDc0NBOEpUS21TeU5C?=
 =?utf-8?B?VjVRS1Q3UlZrakU1YU5ETWpqQU9OaTZjV3J3b3U4bXAxUE4rWmE0cDE0YjB6?=
 =?utf-8?B?STJwUktXK0haSVlOcUU3T1gybUVsQ1Q4b0ZBZEpRYVRPeFJmUVFPUWd2L2hK?=
 =?utf-8?B?bnpxaitjSGJ5TlZjZWdHN1k4N3FZR3RiLzhQVG1jcVB5R1NPbHU4V21KcGRw?=
 =?utf-8?B?OUxBczAwMlcwY09ya291d0UyNm5mc1hJTFdFYk82cEFvcTVGaVhGakxud0p5?=
 =?utf-8?B?NGc0OXNkSDdUUXoxdzNRUDJORjBUWkVmeGdGWHNOSmtmV20zcWhyTU5pSWph?=
 =?utf-8?B?VHpzMU52VkFCYzB1dnhFRStabHlHRldCOEVZVmFKSFBZNU9mUmY1UjJFUFls?=
 =?utf-8?B?QWJGb2wvQ2lCbXIydSswTFV0cXNKSUliTEVMalQ0V0ttMW1SRSt5WHR2a012?=
 =?utf-8?B?L2E5TjN4S24wUTczOTBRMGRFcHVjbFdwS00yU1VFc0xpRnhDVEZ5ZXVqbVBV?=
 =?utf-8?B?eHhKQWI5MnNuZ1RBV0k5VnNKKzFKOHRWOEJ1bHJjd00zdGp3SzBRaVA5cHo2?=
 =?utf-8?B?MnluRWd2bnljdkNPOTZkeTl0NEhVSnh5RGg2SlZ4akFOZ3VWRlhoTXJqTDFU?=
 =?utf-8?B?QVhZT3ZDOTYybUZRSTNaZWtFemlvRXV2Q0dCTTQ3cjVuT05mSk93VENGUW5X?=
 =?utf-8?B?OGV6STM3dWU0eCtZSkEzSVIyeEtld09zUGtrdmx3L0l6UnFIMTgxTVloQkxB?=
 =?utf-8?B?MTlGZjY4NXRyZ2t6aDVDSEVIc3djVmozRUUvOGhtc0Zla0Nzb0Fab2N2eVh5?=
 =?utf-8?B?WHNsYTJ6aUpSL2trYXhaSy9hMU5neWpDNjBsc3E1ZVZrZEZzeW8wTkpZTHJN?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 382511a3-9388-429f-f5ad-08dd30e6ceea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:50:02.9929 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auOb1WhvOOi3bQbcdkbU01tkBtAazzjEIa5xwH4Py+ajYvCSCzpkKFbx623OROMqJrmoYEcKITw3ar2gZxFB6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8696
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

On Wed, Jan 08, 2025 at 05:57:25PM +0100, Danilo Krummrich wrote:
> On Wed, Jan 08, 2025 at 03:13:39PM +0000, Tvrtko Ursulin wrote:

Hi, all.

Just catching up on this post holidays. A few thoughts below.

> > 
> > On 08/01/2025 08:31, Danilo Krummrich wrote:
> > > On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
> > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > 
> > > "Deadline scheduler and other ideas"
> > > 
> > > There's a few patches that could be sent outside the scope of this series, e.g.
> > > the first one.
> > > 
> > > I think it would make sense to do so.
> > 
> > For now I'll keep them at the head of this RFC and as they get acked or
> > r-b-ed I can easily send them standalone or re-ordered. Until then having
> > the series separate would make the RFC not standalone.
> > 
> > > > <tldr>
> > > > Replacing FIFO with a flavour of deadline driven scheduling and removing round-
> > > > robin. Connecting the scheduler with dma-fence deadlines. First draft and
> > > > testing by different drivers and feedback would be nice. I was only able to test
> > > > it with amdgpu. Other drivers may not even compile.
> > > 
> > > What are the results from your tests with amdgpu? Do you have some measurements?
> > 
> > We already covered this in the thread with Philipp to a degree. Tl;dr; the
> > main idea is whether we simplify the code and at least not regress.
> > 
> > I don't expect improvements on the amdgpu side with the workloads like games
> > and benchmarks. I did not measure anything significant apart that priorities
> > seem to work with the run queues removed.
> 
> I appreaciate the effort, and generally I like the idea, but I also must admit
> that this isn't the most convincing motiviation for such an integral change
> (especially the "at least not regress" part).
> 
> I'd still like to encourage you to send the small cleanups separately, get them
> in soon and leave the deadline scheduler as a separate RFC.
> 
> Meanwhile, Philipp is working on getting documentation straight and digging into
> all the FIXMEs of the scheduler getting to a cleaner baseline. And with your
> cleanups you're already helping with that.
> 
> For now, I'd prefer to leave the deadline scheduler stuff for when things are a
> bit more settled and / or drivers declare the need.
> 

I have to agree with Danilo here. Unless there is a clear motivation for
deadline scheduler changes, I'm not sure it's worth a rewrite and the
potential headaches of things breaking.

> > 
> > Where something could show is if someone is aware of a workload where normal
> > prio starves low. Since one part of the idea is that with the "deadline"
> > scheme those should work a little bit more balanced.
> > 
> > Also again, feedback (including testing feedback from other drivers) would
> > be great, and ideas of which workloads to test.
> 
> Unfortunately, there's not much I can tell from the Nouveau side of things,
> since we're using the firmware scheduler scheme (one entity per scheduler) and
> hence the scheduling strategy isn't that relevant.
> 

I also agree here. From a Xe perspective, we don’t really have a stake
in this since we use a firmware scheduler scheme.

Matt

> > 
> > Btw I will send a respin in a day or so which will clean up some things and
> > adds some more tiny bits.
> > 
> > Regards,
> > 
> > Tvrtko
> 
