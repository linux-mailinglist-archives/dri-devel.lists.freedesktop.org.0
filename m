Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E185B02765
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jul 2025 01:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1552010E3CF;
	Fri, 11 Jul 2025 23:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Urk4hXSe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED3D10E184
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752275302; x=1783811302;
 h=from:date:to:cc:message-id:in-reply-to:references:
 subject:content-transfer-encoding:mime-version;
 bh=LnSRQnpil1yc8KCkxyLNYhvRM8f7v6tBix0eYifuE4I=;
 b=Urk4hXSeoXJiyKFX64DqxP7+oMqBZzpBleI+wdBlgCcJFvNJF2oMOzs1
 JxUuFVGZ6wleOXGYU3DIv5hJntUYPyrxlrLQrAo9wXialhyFF3By3Bepe
 crbib4k3hTXaZOVNxKaxZsZUuRmzFDXHHyH+WOacqFOO02iMFXm4rh+3k
 o+GsrwoPZR9hj5f/JZUMTVKljkowzy6yfW1WNNlzI7NdX3I8woIyGQsC/
 Xv5vkmF4Cwf42GhhuWx36qR7jSrCrL8XbOLH/3wA5/2ZdW7b1unQaaHf2
 RJZSXBFzlAATj9CAhhGX2/HnIVK1ZoZLl3xcNQu74+2mwleVDiCtoZni0 w==;
X-CSE-ConnectionGUID: 17DbBHMOTNeXvtJAYkR02A==
X-CSE-MsgGUID: yMn+jkW8RzKINamhHtOzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65275667"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; d="scan'208";a="65275667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 16:08:22 -0700
X-CSE-ConnectionGUID: 2rgacI5ZT2+wQnOuuPXk2Q==
X-CSE-MsgGUID: TNmgnFlbRW6zSkt1y43p+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,305,1744095600"; d="scan'208";a="156263239"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2025 16:08:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 16:08:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 11 Jul 2025 16:08:21 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 11 Jul 2025 16:08:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eg6OobsLRdDr6Fkm/Rp3VllKN/KwQIy1NIgK02ZWGRHe2dMaPWkNMKEys0K5awIJOZn7WAStfn3w5IMv6v486xVXMeYE3Pr4QlF0GOAEGlknkS9N/SjxswS7bsOG3wDknMGVg8EtoH7A58WorgCgPxqYx3aHjGPzA1/JFyPOEjcp0WERnrdIKcwdxJlTGddPe86jvWRp0bKsUcS3EinvSQZ5k1mgRHIs6GBVJzO+msov50uB2USwFDQ+/146cj+29dve3h6m8oySCJSFiO39uWyGdOs5tkGAhRnur4FXYMhnq+yy7xLSOLstjqLmeBjvc1muF8B/5YsTgQnyfBuxvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DwPpueauNlYaO+H0tgRZRF8QlJzQLEaWn2gU/cQ1nH8=;
 b=YXNqNzGc+N7VcaLOcJLSJNxDLJlGn6v++oHs0MAtc8u6mxNz44qe5nKpw0mzGul+gUYYnjPIn84Mu2AFfpGFfBoW4kSdJiMV4CNMi4KldxgsPbJhYMr9JmIxGIM+QXaU5W35MYdDNW2tP+yFatlpWcPhsFRRw92eobLT3Yfb4bBrDs6tM5IugVdhWoxZVCOL/ELm4y8ajRgfArNuWm4nRJXjsDYEmbzBI+JdmYVPvNrCjnCMwKIXfHF6O1uDP1n4OF2iDbAHdSFX3mj4Gs3GCrjs2e7CqS3RrPwPYPIa7X2XFmyJURIV9iK1e6k+mho3ljH+KycOYcrBierrK5UqEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ5PPF0F15BC42D.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::80e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.27; Fri, 11 Jul
 2025 23:08:19 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%6]) with mapi id 15.20.8901.024; Fri, 11 Jul 2025
 23:08:19 +0000
From: <dan.j.williams@intel.com>
Date: Fri, 11 Jul 2025 16:08:16 -0700
To: Xu Yilun <yilun.xu@linux.intel.com>, Alexey Kardashevskiy <aik@amd.com>
CC: <kvm@vger.kernel.org>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <pbonzini@redhat.com>, <seanjc@google.com>,
 <alex.williamson@redhat.com>, <jgg@nvidia.com>, <dan.j.williams@intel.com>,
 <linux-coco@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>,
 <vivek.kasireddy@intel.com>, <yilun.xu@intel.com>,
 <linux-kernel@vger.kernel.org>, <lukas@wunner.de>, <yan.y.zhao@intel.com>,
 <daniel.vetter@ffwll.ch>, <leon@kernel.org>, <baolu.lu@linux.intel.com>,
 <zhenzhong.duan@intel.com>, <tao1.su@intel.com>, <linux-pci@vger.kernel.org>, 
 <zhiw@nvidia.com>, <simona.vetter@ffwll.ch>,
 <shameerali.kolothum.thodi@huawei.com>, <aneesh.kumar@kernel.org>,
 <iommu@lists.linux.dev>, <kevin.tian@intel.com>
Message-ID: <68719960cc414_1d3d10056@dwillia2-xfh.jf.intel.com.notmuch>
In-Reply-To: <aFvTL6MUkVZrPoBS@yilunxu-OptiPlex-7050>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
 <f5958bda-838a-4ed6-84c6-fef62cd0b28f@amd.com>
 <aFvTL6MUkVZrPoBS@yilunxu-OptiPlex-7050>
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ5PPF0F15BC42D:EE_
X-MS-Office365-Filtering-Correlation-Id: 464d6e67-db3a-4ff6-3ed6-08ddc0cfd31b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3pQY1V6REJRR2trRitTNmpvenZPWFlXSllIcE5yamIzSXRzT210YWJtcVFK?=
 =?utf-8?B?YUZQUllRcFdGaXoyTE5UNFhuYlh2c21iUE1HbmRNY2xROTYrZVZ5S3V1MzAv?=
 =?utf-8?B?b1MzbmV3dXBxL0kxNEdhU3h6QTVPTXFRSFh0UDgrUmFLcWpmMVllSnJUZnd6?=
 =?utf-8?B?TWMzbHlGWGRzemVRait3QitKV1V5cmpuRzg0VzFPZEIxbi9TU2J4ZUZvN2pE?=
 =?utf-8?B?Y1d3MlovRGx0RmhaREpUVndDK2tFTmV6elB4blFhMEtoMWhGNVlPMEprZXlL?=
 =?utf-8?B?UmJWbndZUUFSTXlTSmpNRXprNXhkK1gyUzZKYkNyQmQzb2FRdjlIRGhtV282?=
 =?utf-8?B?VTlkTGJTbDRtUitYR3ZvZzZCelozZ05QNEdWWjMvVGFrMitHSzhqQTUzOW1z?=
 =?utf-8?B?aXNRNVhNazVDVURXcGdOVGRvdDVGVE1PM0tGNXFWRVl0cUpUQXd5T0RyQVVz?=
 =?utf-8?B?a1B2dmJlUjRQdWRySUtsbGJBVWtSNk8wQm42NjhlRFNEUVVTdU5nUWppbFJu?=
 =?utf-8?B?bE1MMkFkMElvQXVRK1ZOQ0ErTGEzb0Q3VkxBZTlxYkVuUEU1ZVNIckxLVUhx?=
 =?utf-8?B?SW1vc1NtODJLNDNhcFVZTVk5bWh3YWZPd3hxcXdqb3hGYTZYSlpUTzQ5UEo5?=
 =?utf-8?B?b2NVMXh5ZGpnWWdWV25YSEV1QzlvRzMvb2ZzRG5sU01Mcy9uYkRYR1lucVpQ?=
 =?utf-8?B?RVk1U0JkS3FnK0xMN01mRnlGQm1Ka3dPN2lkS05IMWpvcWw1K2RLazRUZVJQ?=
 =?utf-8?B?b3oxKzczZzZHdU9KKzhKZ1J3K0REcmt0OW1ud1JSUGV2YzFxQmwxWi9ZOGE3?=
 =?utf-8?B?T291bzhubVpJQk80MlVHc0d6SFRBclNoZ0Jod0QwZU1Oc0JoOGplN016NVBJ?=
 =?utf-8?B?NVV6WERVWHgvWEZreG1RYVFtazZpQW1xMDNXM0FhVWp5TXgwRloxSmw0Vi9W?=
 =?utf-8?B?ZkdrTytrWGpPaXB6OFlqWURnU2FXdDJzV0NYcitUb3ZLVFlqbC9lemJrbWkx?=
 =?utf-8?B?N3g1UUE0dWRvVENEeHgra0FhcW9kNXd6KzBPdi9ORS9henNlcWVPNlhURDdL?=
 =?utf-8?B?NlVMV3lRbFFWNmZuNWdzRlVXTGJhY052QzBUbStja3JIa1prYmxDZGh3a1ZI?=
 =?utf-8?B?R0x6YndmRWJsbWwybWNEVUVCWTNVbTJSOXRacTBIOUxPSGdPM3VXS3lmSWhw?=
 =?utf-8?B?ZDBpbS9lL09QaWE3R29GaHAvTzRGVWFJeU54b2MxczRvQTkrTVJsSVBVM2F4?=
 =?utf-8?B?TG42emRQMnFsSUZ2UE8xOGlzNEQ3cWJDVWFGWTZuRS82eEFWemFVN0FhWVlZ?=
 =?utf-8?B?cG9ZbmNoVGFJKzdRaE56THhRS2tQTGV6TkQydXhDZlJtZjJkVVBJSDRvcUUv?=
 =?utf-8?B?R1AyUWluckxkZEcyT3pYUUdzS0VNa0VWQnVRa2J6MHp0TVBvTmpzT0FiUG9M?=
 =?utf-8?B?a2txMnJtQ05vWjdWa25jMXIweHg5dXN1QlRrdnBpTG1hSGxWbUZqWDF6RFJZ?=
 =?utf-8?B?Y3ZLalIwQnZNMVVXalBvdkVUSXk2VmZRNGE4MkYzMDFXdmsxVnpEL3FiTWlV?=
 =?utf-8?B?a2FzU1FGSWFubE9NOWhaNkpmeTFQY1FTTDJsRzBYRzJiZjlMeS9MWHd6RU0y?=
 =?utf-8?B?WEg1aldCcnE4ZnNWb0RyeVBzaXQ1MGF3UVlyMnl4SmswUWtJcUVoWnpGcUZ2?=
 =?utf-8?B?L1JGWlI4ZUttNnBVRHZDQTRmcFBxSzdOL3pCMTYyYjdkQy9tQVdrUm9McWR4?=
 =?utf-8?B?VEIvWnMvNG9JVDFhSjkwRWczYkF0YjJyb3FOV2Y2cVJjUVU1UFV3L2NOTkRQ?=
 =?utf-8?B?SlRuWnNCK1JwUng0VzBYcThwRGsyZEtKMXgyR1JQd2I1NFhPVE9LUHVESVZ4?=
 =?utf-8?B?UVVSU0pYbHVsOGFjOCtFc0pKait0T3Q2UlAweHo2enFUdU8yTVk1UlhkZkpP?=
 =?utf-8?Q?mEAf+P6oEDfaEoNyP145+44+k11uIY3+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8107.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFU3ekxKdHNxQk9RYjhod0QwZ05MTUoyUE43MkhoNGxSb2NMVE8wQms1Ukda?=
 =?utf-8?B?N01CbGJsSFhSU2UwaHJHanJ6NzZWUTlCUVg4a1pLQ1U1UXJEYTZocHRMcnRh?=
 =?utf-8?B?UklQVW85TStod1NUREZaYU05YkJSYS8vNTNYK1g4YXlGOUNOVjRsOXhFOXJx?=
 =?utf-8?B?V3VaYUowM1NZVFk0eW9JVmtXV0hqeXlxK0pZazBIZTJoQUdKNThNWlBiU0JO?=
 =?utf-8?B?cG5CY3N5NWNXNERramZWSHJNV2dZRXBlTGZNK3kxcjRQNWxoZ0poTDM1c0sy?=
 =?utf-8?B?dkI4c2Q1elJRSGlBVE52cmt4V011eVJmSEhlb2pNbFAwQldzTXExZkFiZkE2?=
 =?utf-8?B?bmR4UTU5MkM0anFpZmdHNXV4cFNzQWpyK3hXWW9OVWRxczcwaUtMMDZlMTBo?=
 =?utf-8?B?NUdVMzdOOHJXZUMwL0RrbjR6WGxIRWNuRlptMnM4SHZBWVNvNWxQc2ZnUlZD?=
 =?utf-8?B?b01SZzMveU12MnBRS2MrZVE2THZhaEQ0dVo4RTVMQWJKNjBUUHVaL2tjWWdB?=
 =?utf-8?B?T2N4L0lNT00wZ3pIMzlBN3JDMU5BaGlZV243K1p6bHQvTy9BU3RWWDNoZ3No?=
 =?utf-8?B?bHZpTG1MRzBab0RkN3NvZjV5ZjRmZjhBS0tHeEJJRU9CWVlXbVJQbC90QU5S?=
 =?utf-8?B?cWpXUW1KNytKVUxLVUtpcTF0NzhZQkI2T3hvRGpmS3JGeU9JT1l6TmhwRUVC?=
 =?utf-8?B?bExjQmdvbkd3VU5YZ1ZtZWt0TlVMbE1ZaHVEZXFOVVFjRkZSaGdkK0FwMkpT?=
 =?utf-8?B?ZzFXNGwzNjNDbnFZbS9aVHRzcUh3ZHRHMXRIQ3FTeUVVVzF1NFd3VTZTNFVY?=
 =?utf-8?B?NkthQWV4VlNJMTUvUFdadkdVZVBYNkgyNlI3QVFIWmNOTGdmRVBmdHFGQXkw?=
 =?utf-8?B?ZlRYbXBSVXRTTUk3RTdMMVI2Z09Xb05kaWgzakZZaDNkZ3RQc3BCV2t2UFRx?=
 =?utf-8?B?dVQyQTNibVNVQi93UGQxSUNJdE1wWlpzcERmeXowYUVCNTRzbW5ZVzFsdU5h?=
 =?utf-8?B?VGlTMDNvSGdQL1hjNHR6Z2xKWWQrWjBOQlJ5TmJ4a1VrRVVERzY5RlRNby9F?=
 =?utf-8?B?V2tnaXJ1enZ4RXF1Ujd0eDA1V3h5QzRwaDFVbks4RUhmWnJ0NHUvZ3IxOElu?=
 =?utf-8?B?L1F1WXFqWWt1Qm1hTFVCMGZuczEwYlZUWFhleDIvZDRBcDBoM3BWdTlTb2FX?=
 =?utf-8?B?WGo4QjVpMWNNdTNNWE1OY3FGampXWkZ0QTJqc3RicUhmSTY1UDQyRWJEME9H?=
 =?utf-8?B?WkJITDlONVJBa250a25DVTFObDdpcUgrdEpqa3BHK1JKWWVPTVA5OUZpV3Iv?=
 =?utf-8?B?b0c5eGdpb1FuN1RmYkdrMS9WZDY3TzhUem9Hb1FSRit0N0NDMkVWTTVmMXRZ?=
 =?utf-8?B?Z08yc0ZHd1FKNlZzNm9SRGtqcWVBczRiMTk5bHZuM2dOVER0cTE5c2VlVG15?=
 =?utf-8?B?TWU1c3hnM2g3SUNwSmF3MEE1ekZPcGhEUUdac251VkpOYWNjZWpNN0VVYXdz?=
 =?utf-8?B?OVF3bklFSktXQjlqajJBWWZmcDFUUDdSRWFoMUF5eFdGSFBiVFFQVlUxeDM2?=
 =?utf-8?B?OFduVTlaU3JPZ2xlSXlWMzd4S1VoRWxRUHRlSTJJb1hsWDF0R2M2L1RYOWpT?=
 =?utf-8?B?MWk4UWt1OENQYkxrNkdKMTFkRVFNNzBVSTZJNFpVbXNKZlFzS2MvMGtFZUM3?=
 =?utf-8?B?enl0NUQvQVhyY1dzNnhyWVRCTGdWcjlnRU9OeHA4cS9YSTVCd1NGSnhqMEdk?=
 =?utf-8?B?WGVhdnkyOHdWaS90Q2NWSmVXYlpsWDFyU1cvY0g5c2FabFIvN01CMGplUUd5?=
 =?utf-8?B?ZlZ2TFNXZFZQY3R2d0FsTjhTcU1EV0RaT2VSN254ZmJtZ01sc09PL1FsUUlr?=
 =?utf-8?B?a3ZRVjVvZ0YvRVNkc2xvbWJlQVRjSEh1YzlCM0lnMU9YY05PMmxQQVl1c3Bk?=
 =?utf-8?B?ZE1NN05IT3cxT0xaMVFnZ3dDck5RZzlBYTNxQUdGamdnbnNSUWlnd0FCNVV0?=
 =?utf-8?B?cUVvOHdZRUNVeHczemVJSWM5c0ZBRkI3eUt6NWp6ZklqMTlsd1ovVEZCbzIw?=
 =?utf-8?B?VHprS1Q2N3FuQVlVd2JUSklRQWw0aWJSY2djdDZDRTlmUS9heVJIOU5GcXdu?=
 =?utf-8?B?YWVSZzhqVTdkZnp2OExBc0taUEMxY3QzNi91U2lzbDhsK2diTk1LM0pJM0F6?=
 =?utf-8?B?cGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 464d6e67-db3a-4ff6-3ed6-08ddc0cfd31b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 23:08:19.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Su4zYD34HSNhgFZbjV0crGWqOUMeX/4BOji5x5SrWbcQOFpSbiBKPhDV6hF3yqO8qhm+K9Nyqw+P5BwRz+FnveBSVdm8DVTCK/+mtQmC/UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF0F15BC42D
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

Xu Yilun wrote:
> On Sat, Jun 21, 2025 at 11:07:24AM +1000, Alexey Kardashevskiy wrote:
> > 
> > 
> > On 11/6/25 11:55, Alexey Kardashevskiy wrote:
> > > Hi,
> > > 
> > > Is there a QEMU tree using this somewhere?
> > 
> > Ping? Thanks,
> 
> Sorry for late. I've finally got a public tree.
> 
> https://github.com/yiliu1765/qemu/tree/zhenzhong/devsec_tsm
> 
> Again, I think the changes are far from good, just work for enabling.

At some point I want to stage a merge tree QEMU bits here:

https://git.kernel.org/pub/scm/linux/kernel/git/devsec/qemu.git/ (not
created yet)

...unless Paolo or others in QEMU community are open to running a
staging branch in qemu.git. At some point we need to collide all the
QEMU POC branches, and I expect that needs to happen and show some
success before the upstream projects start ingesting all these changes.
