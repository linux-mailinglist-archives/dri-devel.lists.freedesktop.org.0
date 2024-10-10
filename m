Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640D99853C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 13:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EC710E8D7;
	Thu, 10 Oct 2024 11:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="awVwpDDG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D8210E8D7;
 Thu, 10 Oct 2024 11:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728560579; x=1760096579;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wDaNLvoiI4DWa3QW8mAAk7qc7T+p7iwjqvoFXRK5/G4=;
 b=awVwpDDG5TcKhrMMctsQHW4Jzs2WAXvINjsS/X4vttz+u79UqANPR2Cc
 3udC6rd6NoZb0gwcR98U1YRmvufpudvkcKkMyB+kXv38ANSmhWvJrhlGC
 IodphszxMd2aV3IomHzsz5+4lumhbWdgVeWBBWrEy3X27GfPjiJC+NwzX
 439+6Ws2Es4UGCHJbT0bJ4knE5WyDZNVjRlif/p00SwCqPMnxrFzpKbY/
 DbyKXydb1Duc3Q9T2eyzpG9qqa41OrIRO8UOyKTCf3Y1JGI7ijLaooc6z
 8QjTger7mU9AWpZ05NbbGI4uB/GbDt6CAqgSHFG7xUS2PkYknjIFs10a8 Q==;
X-CSE-ConnectionGUID: /O6mLQtzSjmur97+j15WIQ==
X-CSE-MsgGUID: EolfvWJZRB21wlQk6pQNkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27856552"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="27856552"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 04:42:59 -0700
X-CSE-ConnectionGUID: 1yJghNruR2K8i/db/BFjOQ==
X-CSE-MsgGUID: CzNXjC74ToK0usyGFTn4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; d="scan'208";a="81368108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Oct 2024 04:42:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 04:42:58 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Oct 2024 04:42:57 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Oct 2024 04:42:57 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 10 Oct 2024 04:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RSVeFD9BYZRg3k7/ReKwmTTcyYPFpG6PNOevNmUw1L3g4+A8207sbf9EdjqBeUEJfyFMurE5x8rxMChJbRMNheKZbXWz2nhN2tNd9fktYiWJ0YrJS62Nmp04wVJkX9/eps/jUL51mgIYRmrn5pVk86H/nxDmxyYKdeZpCPXOs0ORdS46gXXm01BIJlWfwdADOo0SIj/wYgsJn6gF/pKDaz5xM+x/hBVVQFYU4jhp5OvO1Hn5SSQqoZw82UIDuSgOILRgTSnxlFJPa+tG6cwjh9m1fr7G5UcToH8/yEATPkhKnH1AnRP3r26/0Ul3V4yk64RI4QhhzBeKGcBF2EIWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E8y1d+P/JEWBs7Xsscf8ENHtOs/t2EdGj1+wG5EycC0=;
 b=ijotzHEX1BfJT1oY8uMln4+aQ+TwCZvZoEvLFka4mWplRoRJqdf5QCWJ27g1z7DHQL5AtKMWF/R379QVi2lX0UsTi9wV70yRHw2KhVou2zMMn1obGIyyJTEknLrAYnM7Tu/cEsaXvpJZIy8/JY0NzbhqoGIxIIDbyrBtPAR+r3wz0jaOW+E2tmYdsY+f/a0WGpWbNwW33HXoZzr5dvWRRFPIfaEW43EA3paOXWNBAe7YbXS57ZSPlzy32I9xPxJ+DJEM1fnmaiuS7np1hj/gQX4nbm2i1tLsz0i/fOIHfNMmm9Umm4dQFFmcmcEfQiph+om29eL5LuOp6RBLEc59+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.16; Thu, 10 Oct 2024 11:42:55 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 11:42:55 +0000
Date: Thu, 10 Oct 2024 13:42:51 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: <linux-pci@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Bjorn
 Helgaas <bhelgaas@google.com>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=
 <kw@linux.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Matt Roper
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 3/5] PCI: Allow IOV resources to be resized in
 pci_resize_resource
Message-ID: <gisgytply7pyvbcsx76bmcd4qx6wkvf3wqwksfacrzx7c5doz2@rqwfi6vpamzj>
References: <20241010103203.382898-1-michal.winiarski@intel.com>
 <20241010103203.382898-4-michal.winiarski@intel.com>
 <4c783170-930f-945f-a2b8-8dc3a111d13e@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c783170-930f-945f-a2b8-8dc3a111d13e@linux.intel.com>
X-ClientProxiedBy: WA0P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::20) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2f6dc8-6767-4742-bb74-08dce920ae0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlZGYXlXR2dWQmtQR0NmMHE2OXQ5TkFvK3VXNDBFT29FdnQzd2FLMEx4VnVN?=
 =?utf-8?B?N3BENVg4MldKcW9zM0VwZFMzdjlrUVo4bVEreG9yb0Q1UFllc3phVUpraGE0?=
 =?utf-8?B?NEJXUlJYdS9XU2ZMUVNyRDZIVVFVZDZBSzU5QjQvNERoMHJzbjlwckdvMkd5?=
 =?utf-8?B?dkdKOEdUUXNBV3J5bDFnVVVhT3dLM0pCdks2T3B5REZGMnFidzFZWmdndFg1?=
 =?utf-8?B?QThxUWhyZGNUbkFNWmVBTWNsdEd5Nzdqc2R5VnR6Wkl3TVhFWjNkbEFWRmVY?=
 =?utf-8?B?NXpyZngzbWZVQ1I0TjQxMmFxcWNkU1ZYdVZnS2cvTjZxaDQ0bEVTa252dlZl?=
 =?utf-8?B?WHlJRDN0ek5hcU1xZ2FrRlhiMEhoczR1ME51UDFZWUVBN0d5dFgrNGU5WEUy?=
 =?utf-8?B?UVdWcXlLc2RmclVnUjRERDAzVllHVjlmZkVSRWgxblJTa2d5VmVDME1LeGhM?=
 =?utf-8?B?VmI5L1JFL1hZaEVXRHJyRlV0YkxzSEhVdThxTk96dzBvWDZnYm1pbXc5NEVw?=
 =?utf-8?B?ekpud0NtYXIzOFgveGlXR2QwNjNqSHgyM3hHb0xPc3IvNmFoR2pNMlB2bDdt?=
 =?utf-8?B?cW9GRVFOZWoxazhpZmMxNGJ1NTRoOXh6U1kwaDdoMWR6ZDZRNmdvb2RLQjZI?=
 =?utf-8?B?aEFTSkdTWXN1cDlVQyttNG94ZDVEM3puMUJjQkhzVTB0SGFaUmNkZndITHNW?=
 =?utf-8?B?K2t4N1JLL3R0Ty91VU9GazZmUHpTbHc4dE1EMGE3cVIzNk54TXlJVkpLUzR1?=
 =?utf-8?B?OEUxYlVjTWdjM2FTZ1hDdDZqaUpuU3gwRml5VS91cEd6ajV3ZzhSVWc5QmNw?=
 =?utf-8?B?dW9SRnUwZ2ZBZ2JPREc3T2VtVW04S1p2NHZCQWFxZ0lzYWhaU0F2Z2ZlY1Av?=
 =?utf-8?B?VVlodDY2OXZLemVmakk4RlIxNUt5aG5QZlgxN0VDTTFlZGdwbTlndWJ3UHZZ?=
 =?utf-8?B?NlhVb0c0ejQvUG5URnhpOUVDRWxFVDJBVExlN0p2d2dvZkVlU3JaaXBQWjUy?=
 =?utf-8?B?S0xjZHNIdkozeU40N1VCVXZOVHBoSmVHbWdsNktib3F4M251RS9rVE95aU9T?=
 =?utf-8?B?NG4vT1ZuZXFiNlBzLzVDakZMazRPVzRyOEJkczJhZ2dLMGVWY2hhdktHWmlz?=
 =?utf-8?B?OVdDOVVkNW1LYys1a1owY0tzdUw2ZmVVR1pFc1VWUXhsclJ5bEMzM3NGQ05R?=
 =?utf-8?B?aks3NFdIUURZb0puNG5VVEt2dEJrRmorT2xZQlBEOHVYeTRZRzk3VnJEcTR5?=
 =?utf-8?B?WGh2Nkk5aXRIemNQTU1DaFkzZSsrUVhEOEdoS2hmOUVLTStGUzI4YjJLSnFG?=
 =?utf-8?B?cFB6WnZyc3BxM0VHZm1QUnA2Y0ZnaVBnU0l6V2U4VGN3Y1hpdHgwdHdnYzUr?=
 =?utf-8?B?Mm9Xa2JablpwZXNuNUdUanlhNXR3T092ZXRqMnRUUGpDcU1jRmdtM2g2bUsy?=
 =?utf-8?B?RWpyQ3p4SG5lY2ozV1RjalRvd2l0SlBYRTVDUzhUMHNscWFWRkFzam9TNHU5?=
 =?utf-8?B?emlZaFpGUmhKVzR0NE5Bai90MkJjZkV1N1dFYVJoWXZ6QVdyM251aVdKM012?=
 =?utf-8?B?UVQ4U2h6NnhMb1hOMXZweSsrSVd6TU92Zzlabk9QcEtMTFVtQ1hhb1UxQmpi?=
 =?utf-8?B?NE8wY3hGbURhZ3VMbHpuNTZJbmhEY3hNOG5YTTJVd1dNYi9TZExLbWNCUlNy?=
 =?utf-8?B?bjhkZHcraHRpUkpaRjR2RHMwNVhqREwyVVFMNzZWMFNqTHBsRkp5emJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWxKb1REY043dGRNK2dRV01RMTJXaEJTUFE5MVRJSlZMMzJDWmtiTHYydE1z?=
 =?utf-8?B?d2J6cGZSMHpSRUJSNmZDWUVyMGt4M0EwUlR6K2xYSW14VDFTc1NHL0hvZ3I1?=
 =?utf-8?B?dTM0Y0hOVVE3UzNwdlA1b0NVbHZXMTdqK1J5K0tsTVJmWHdjQmV4M3A5VTJp?=
 =?utf-8?B?QVkrMG03UmZMelRMZnBldXpkb215VDJhYVY4N1lsU2FFRnl6RzZKeUdtL1Zy?=
 =?utf-8?B?bE1aVFR5NjRMYldMRmtNWFpRc1NaeTRTZ2Z4RWQyTkdiK0hVVEdhNTloQmVK?=
 =?utf-8?B?eSs0Z2x6OS9tdVdnSHIvV2Q2b3ExY3ZvNDJhMG1xSVgxQXhheTNna0NMUnRz?=
 =?utf-8?B?K0hDMVVNSkxnVVdpd2hRcWJzcnZaclhkbmFIdG5kLzl0WFM5UFlrRmFQUTZE?=
 =?utf-8?B?UmdlQUFMMytlTDMrV0NMaDU2ZDlZOCtSaDBzd053Vkc4MmdvZExnRTJ2YUV5?=
 =?utf-8?B?WXplZnJKaFdmUXpDWWdiT1BtM2Q0TU1JbStuVVU5QVppaFN6L21jUWF0dmZv?=
 =?utf-8?B?RGFjckNpRC9VL2VYTnlZRVRkazRScmo2OXZiRC9DRlAyWFY4Q2NpbHFjc1o3?=
 =?utf-8?B?bzRQcE82OWp3VUx4T05raTZpaWlodi9KUURxaEVjRmxOMEtJYkpmeS83Y1o0?=
 =?utf-8?B?NEFvVzN2Ym9vdENwYWUxOHRSNXBmSWxCcmh6SW9jL25uU3JWckJTcE1xOEFq?=
 =?utf-8?B?aXhTMUdpYmFQTWZIMnZ1QWUwTW9zUnN2RFJoSXNzT3BVdVZYMmFXdzgyZkNZ?=
 =?utf-8?B?WWV4dWFXK2Y0cERIUjhXSWdFSkJEdG5mbjZkWUJoSHZGbWhIUGNkem51SkxL?=
 =?utf-8?B?QTk2N29ZYVJmTm8vaDh0WlM1ZjZHYmxObkpNNUU5L3BhUjJQY2lxa0NKdHhG?=
 =?utf-8?B?d0tiNlJ4WFdIMUdBUEdkc2tSb0N3K1NlRER1UGpXYk84dnNvK2lIbmUzS05t?=
 =?utf-8?B?a2QzcGdka1k5MlFoM01ETEtEb1RWRUFLMWxpWCtZQU9RcmZtZDNid0ovRmlC?=
 =?utf-8?B?RXd0RXNqTTVRb05vVHBqRndtVzNKTFdMMUorSXpuZ3dPcUpFaGJHUlBXSlhS?=
 =?utf-8?B?Zys3N1pBZ3RUdHhuN3FOU2FrNHIwNmRibjJHbHgwZ3lsYkM1V2RJRy9vR3Rr?=
 =?utf-8?B?b2tiaVk4cS8vdUpwajZoY3h2bDZ0ejUxRFM1bDd5eFArbFA4Uitkbndhb1I0?=
 =?utf-8?B?KzBKWXBDMlFUOTFWS2RxczRXVk5INk1aZFROQnExWFd0KzhHRWZJcVFGbUI5?=
 =?utf-8?B?azM1WjlPdThYZkQrT3g0VGhyTnBtSmlaUnJza3Zsb3RWTWxIUUExV0R2YmVC?=
 =?utf-8?B?ZDZ5aUhhcUluQ294RVRGZ0xuWTRmQ2NPbUlrQnREb3FtV3VkWmdJQkVKWG9L?=
 =?utf-8?B?WjJkYWtwWlgxNU5Ub1ZwYzR5QWk5V0lMZ1FYSkw0ZFEzdmlJa3ZFZXkyRk5R?=
 =?utf-8?B?YWEvUUFqVmxIdC9XWEQycU9vcG4yblBBTzNzNWxOSWs1TkxEcTVHNkwwNmlQ?=
 =?utf-8?B?RkVPN2FISkt5TkFKd3hLblpOOWpzYmg5aTJKa1ZMS0VlWUx6ZVE5YTNVeEMy?=
 =?utf-8?B?aDJNUS9KV09mcmNiUnBqRUpkQW5tMUdwa0dWdEwyVCt2ZFAyeXY2U3NDQ0Uw?=
 =?utf-8?B?aHFNOHBuMkFCSXcwbk9rbXNCVitnemd5REhyTU51QXUrZUl2anNpQnBRTy9N?=
 =?utf-8?B?Tm5Gc0l2ZGtaL3Y5S0pLZDRQemo2UmFTTSsrZHBLRjJyL1ZPMERlTXNDZTlB?=
 =?utf-8?B?bXZQL1haczRpL1MxMG80ZUgzSGNOLzQ5U0ticzZtdHNhNDlFSDhrL3l4b0Vt?=
 =?utf-8?B?QUdtaXMwbEdHU3BXekhmUkp1bnZUNnBvejFpRCtxRWE1RjY2STJvSTlKWkxO?=
 =?utf-8?B?cmR1cStmSXB0cERzREFGN3Ivc01xdjBod3ZCRlVvSGpNZkhKankwY3hPUlUr?=
 =?utf-8?B?VW5XeGYvRGwrWmlYZDBMZGdGOEUvS2NTMGZtaFZvUjZPNnBNS3VxUEJkMzZj?=
 =?utf-8?B?azdJVjY4Z1dtTDRMd1FuZElVamNQUVkzbjN5eDlrb0dsR3hNWTVydW1XQWhS?=
 =?utf-8?B?djBPUzVNZHNjSzI3M0xJRkdFVk1mbHM3bjB2dGdsbFNJRnNhMy9HeEFYWWFH?=
 =?utf-8?B?QjRkYU56Tm45UWsrdGZrdXp1SGl5YXVuZEsvOHA0dnVxY3NFTk1VNysrYW9C?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2f6dc8-6767-4742-bb74-08dce920ae0b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 11:42:55.0834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wkQzcT04iMmjaCqYgGwUNCdJaqQLg/NrzhOpp7rqLac30zuxxFMeSOvZp5dqTsKGUAWJr90phymGKX4CN9YdsTClmMchoUn5mD/8t0pD0Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

On Thu, Oct 10, 2024 at 02:17:11PM +0300, Ilpo Järvinen wrote:
> On Thu, 10 Oct 2024, Michał Winiarski wrote:
> 
> > Similar to regular resizable BAR, VF BAR can also be resized.
> > The structures are very similar, which means we can reuse most of the
> > implementation. See PCIe r4.0, sec 9.3.7.4.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/pci/iov.c       | 20 ++++++++++++++++++++
> >  drivers/pci/pci.c       |  9 ++++++++-
> >  drivers/pci/pci.h       |  8 ++++++++
> >  drivers/pci/setup-res.c | 33 ++++++++++++++++++++++++++++-----
> >  4 files changed, 64 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
> > index fd5c059b29c13..591a3eae1618a 100644
> > --- a/drivers/pci/iov.c
> > +++ b/drivers/pci/iov.c
> > @@ -154,6 +154,26 @@ resource_size_t pci_iov_resource_size(struct pci_dev *dev, int resno)
> >  	return dev->sriov->barsz[resno - PCI_IOV_RESOURCES];
> >  }
> >  
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size)
> > +{
> > +	if (!pci_resource_is_iov(resno)) {
> > +		pci_warn(dev, "%s is not an IOV resource\n",
> > +			 pci_resource_name(dev, resno));
> > +		return;
> > +	}
> > +
> > +	dev->sriov->barsz[resno - PCI_IOV_RESOURCES] = size;
> > +}
> > +
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	u16 cmd;
> > +
> > +	pci_read_config_word(dev, dev->sriov->pos + PCI_SRIOV_CTRL, &cmd);
> > +
> > +	return cmd & PCI_SRIOV_CTRL_MSE;
> > +}
> > +
> >  static void pci_read_vf_config_common(struct pci_dev *virtfn)
> >  {
> >  	struct pci_dev *physfn = virtfn->physfn;
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 7d85c04fbba2a..788ae61731213 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -3718,10 +3718,17 @@ void pci_acs_init(struct pci_dev *dev)
> >   */
> >  static int pci_rebar_find_pos(struct pci_dev *pdev, int bar)
> >  {
> > +	int cap = PCI_EXT_CAP_ID_REBAR;
> >  	unsigned int pos, nbars, i;
> >  	u32 ctrl;
> >  
> > -	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_REBAR);
> > +#ifdef CONFIG_PCI_IOV
> > +	if (pci_resource_is_iov(bar)) {
> > +		cap = PCI_EXT_CAP_ID_VF_REBAR;
> > +		bar -= PCI_IOV_RESOURCES;
> > +	}
> > +#endif
> 
> Perhaps abstracting bar -= PCI_IOV_RESOURCES too into some static inline 
> function would be useful so you could drop the ifdefs. That calculation 
> seems to be done in few places besides this one.

I have a version of this series with helpers for conversion in both
ways:
pci_iov_resource_to_vf_bar (which is this one)
and pci_vf_bar_to_iov_resource (+= PCI_IOV_RESOURCES)

But decided to leave it out for now.
I can include it in v4 (or send it separately, depending on the
direction in which this revision goes).

> 
> > +	pos = pci_find_ext_capability(pdev, cap);
> >  	if (!pos)
> >  		return -ENOTSUPP;
> >  
> > diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> > index c55f2d7a4f37e..e15fd8fe0f81f 100644
> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -584,6 +584,8 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return resno >= PCI_IOV_RESOURCES && resno <= PCI_IOV_RESOURCE_END;
> >  }
> > +void pci_iov_resource_set_size(struct pci_dev *dev, int resno, resource_size_t size);
> > +bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev);
> >  extern const struct attribute_group sriov_pf_dev_attr_group;
> >  extern const struct attribute_group sriov_vf_dev_attr_group;
> >  #else
> > @@ -607,6 +609,12 @@ static inline bool pci_resource_is_iov(int resno)
> >  {
> >  	return false;
> >  }
> > +static inline void pci_iov_resource_set_size(struct pci_dev *dev, int resno,
> > +					     resource_size_t size) { }
> > +static inline bool pci_iov_is_memory_decoding_enabled(struct pci_dev *dev)
> > +{
> > +	return false;
> > +}
> >  #endif /* CONFIG_PCI_IOV */
> >  
> >  #ifdef CONFIG_PCIE_PTM
> > diff --git a/drivers/pci/setup-res.c b/drivers/pci/setup-res.c
> > index e2cf79253ebda..95a13a5fa379c 100644
> > --- a/drivers/pci/setup-res.c
> > +++ b/drivers/pci/setup-res.c
> > @@ -425,13 +425,37 @@ void pci_release_resource(struct pci_dev *dev, int resno)
> >  }
> >  EXPORT_SYMBOL(pci_release_resource);
> >  
> > +static bool pci_resize_is_memory_decoding_enabled(struct pci_dev *dev, int resno)
> > +{
> > +	u16 cmd;
> > +
> > +	if (pci_resource_is_iov(resno))
> > +		return pci_iov_is_memory_decoding_enabled(dev);
> > +
> > +	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > +
> > +	return cmd & PCI_COMMAND_MEMORY;
> > +}
> > +
> > +static void pci_resize_resource_set_size(struct pci_dev *dev, int resno, int size)
> > +{
> > +	resource_size_t res_size = pci_rebar_size_to_bytes(size);
> > +	struct resource *res = dev->resource + resno;
> > +
> > +	if (!pci_resource_is_iov(resno)) {
> > +		res->end = res->start + res_size - 1;
> > +	} else {
> > +		res->end = res->start + res_size * pci_sriov_get_totalvfs(dev) - 1;
> 
> I wish Bjorn would pick up my resource_set_{range,size}() series [1] so we 
> wouldn't need to open-code this resource size calculation everywhere.

Yeah - that looks useful indeed.

Thanks,
-Michał

> 
> > +		pci_iov_resource_set_size(dev, resno, res_size);
> > +	}
> > +}
> > +
> >  int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  {
> >  	struct resource *res = dev->resource + resno;
> >  	struct pci_host_bridge *host;
> >  	int old, ret;
> >  	u32 sizes;
> > -	u16 cmd;
> >  
> >  	/* Check if we must preserve the firmware's resource assignment */
> >  	host = pci_find_host_bridge(dev->bus);
> > @@ -442,8 +466,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (!(res->flags & IORESOURCE_UNSET))
> >  		return -EBUSY;
> >  
> > -	pci_read_config_word(dev, PCI_COMMAND, &cmd);
> > -	if (cmd & PCI_COMMAND_MEMORY)
> > +	if (pci_resize_is_memory_decoding_enabled(dev, resno))
> >  		return -EBUSY;
> >  
> >  	sizes = pci_rebar_get_possible_sizes(dev, resno);
> > @@ -461,7 +484,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  	if (ret)
> >  		return ret;
> >  
> > -	res->end = res->start + pci_rebar_size_to_bytes(size) - 1;
> > +	pci_resize_resource_set_size(dev, resno, size);
> >  
> >  	/* Check if the new config works by trying to assign everything. */
> >  	if (dev->bus->self) {
> > @@ -473,7 +496,7 @@ int pci_resize_resource(struct pci_dev *dev, int resno, int size)
> >  
> >  error_resize:
> >  	pci_rebar_set_size(dev, resno, old);
> > -	res->end = res->start + pci_rebar_size_to_bytes(old) - 1;
> > +	pci_resize_resource_set_size(dev, resno, old);
> >  	return ret;
> >  }
> >  EXPORT_SYMBOL(pci_resize_resource);
> > 
> 
> [1] https://patchwork.kernel.org/project/linux-pci/patch/20240614100606.15830-2-ilpo.jarvinen@linux.intel.com/
> 
> -- 
>  i.

