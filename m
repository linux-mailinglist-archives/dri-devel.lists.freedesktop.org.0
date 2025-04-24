Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E619A99EB7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA7210E6FE;
	Thu, 24 Apr 2025 02:13:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e1LNarzM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF2C10E6FE;
 Thu, 24 Apr 2025 02:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745460835; x=1776996835;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GenXERt2PCI7hkpqvlhXCdDvcjd5GDmNl+uQhG4RD6Y=;
 b=e1LNarzMVaTX6f8pRsNBfqDp+WkPAGFXn5O8t7hXt1dIMN6TG/WzCtUz
 IkPYKkKNhJ2hWFDGXzQXnqQv88Smru33sQViJlsaJT8synJP03OSo60ru
 FxQDND9HXFspWPtMg/53ZaUj6+1qckXJj/nrw40zLM0/HgF6I+rliTFN9
 AeOPPiEGmG3fQ+3/ALpHE9JYsVwBKJi8erkYOozX+J/wsBP+oJw5gPaIl
 0Xsozrdy5ApGgY6rOxx5mG5FA8jxgCQwF+fN+jmwIu9+F++eKSDHaQD+c
 PjbFyrTmbiHO2JcVVT/QmQw+BRHP2I4whH0PVkoO9XK6FtgjJrQfMzaWv A==;
X-CSE-ConnectionGUID: e2UwylA+SgKY69JxT6lhCA==
X-CSE-MsgGUID: ogvXML4XSxCNos9h2tedhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="47207378"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="47207378"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 19:13:54 -0700
X-CSE-ConnectionGUID: cLMqFyQOSGGMEdH911LxkA==
X-CSE-MsgGUID: a9uAzyS+QOeR9IWnPpy4YA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; d="scan'208";a="137650303"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 19:13:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 23 Apr 2025 19:13:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 23 Apr 2025 19:13:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 23 Apr 2025 19:13:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFi89luZKvVXetHORvJBV/Vdi58LYcqc5krofJ3EjhVJd3m4QiGNeZcofO8AKEsa8rc1TlxdvieALMhTEqQaE6VCfldXjllU/7NTj9V4jqpnOfGAOt8JEPDgsOvRQSKTscP1wPFgo1vcJR9ONhh3TjyeuPyknRhQHAFEgw4pvg9XCQHMED8vGNdGWpXMl38yYA/TFEhJPfCaeNhcIO6JOKaQoANkwcX3GGc54cV6jmbnXLVA8ZXPm4TGWKVdwUsuYoeUSUKiw0Cn2P5qQCWgL3IlL453z0G/36Ge4HIUpOtVu7vBRMabWrZRs7702lafFPFWoIKyoG5zy0wxme5S0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZnO4XSEDn0nBE+pDAkcLBkUMh46iG6Z8eLEbNkSWNjE=;
 b=lHPqa00lYlwlPOM+u4iQsD5ouN3aQXazGYSS/p7KuF2xNqXEdow0BTP4kh0JDFaKkhe4C1+jSTnyGqc9GMD3nVbkNaDGj5ooq8bOtNvazmBUckaZui+Ls6FxZMTE18WoIoXcXmbJtcd/B9I4YBZPBEdbBooWYtXZRZZBABvt8Zr0QwDJFHT70/dFvLchmVdh2csenFL5mqQn6YAKkfWsJWx4ISweQ+H+r7ZqhD9WnUFv4mFewTOyevRRRtZAuEwY5o9A+tuIIijpeDNMVUwtXW9Fjk5HX/WS1qXiKVkfdxOk5Hv+ZJJru35qgwC1OW+gYoT4q+9+4CUaMA2+I0u1CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.36; Thu, 24 Apr
 2025 02:13:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.037; Thu, 24 Apr 2025
 02:13:50 +0000
Date: Wed, 23 Apr 2025 19:15:11 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Harrison, John C"
 <john.c.harrison@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, "Auld,
 Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v21 3/5] drm/xe/uapi: Define drm_xe_vm_get_property
Message-ID: <aAmerz9SDyUOs6Po@lstrano-desk.jf.intel.com>
References: <20250423201858.132630-1-jonathan.cavitt@intel.com>
 <20250423201858.132630-4-jonathan.cavitt@intel.com>
 <DM4PR11MB5456D03B7FB2738D23D73103EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DM4PR11MB5456D03B7FB2738D23D73103EA852@DM4PR11MB5456.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 246bad7f-59f5-4a2f-3929-08dd82d5a778
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTU3bjZFOENKeWljVTllM3cxY3orakJzMEhFRTF3aExLRlV0Y1ljTktTdWFM?=
 =?utf-8?B?YklmTVpid0VOaVYwVHQ2cktYL2hKRmdCZFd1V1BrRDVXOEs4Z21qbmRDeWMr?=
 =?utf-8?B?NVFUaXNUZ1JyZ05zbVVzd0czMG1HMHBiWFRSODJXMHVTZytDM1V5V3ZCaWQv?=
 =?utf-8?B?Z2t5RUl4Z1dtMmU5T3AvSlZlblQxM0pzbHA2b3VUZXFCaWJsdnJmcFBlMkZ6?=
 =?utf-8?B?bzY1R0trWGppSG8yRHhERzBQZllKTUdoN2NOM0wzczVjaG9kOGNIMjRGSWFi?=
 =?utf-8?B?TDJmZkVvNDQraFhlckUvZHcvTmxaVjcydU1BL2g2RWp0d2FURVM5NlhyTVBY?=
 =?utf-8?B?S0NQTW9TcXNIU2lXOStRZVlhVkdOVTgzMmJ5VCtLNnJaYW9qdkd1T1Zra2V2?=
 =?utf-8?B?bWpTeTBpa3VmTFo2VjU2TzVFbWwvSVJiUFI5dldjbFZXZVgvcUU1aVJsMFdn?=
 =?utf-8?B?ZGFUa3hkNnpaM2pLbU1EU0VCanZiNDBiekZyQjFibVVBSFhsNWl1dDBaVDAr?=
 =?utf-8?B?bDNSMDZZNDJmZHMzek94bG1wOUN6YTdEZExQdTg2MmhrQk5zSGlXWm4wUUZZ?=
 =?utf-8?B?VDZtMTJaQVFuYUNuQW4wMDhVeGtXVDMxUkV3UlE2M1JHVFhVU0hiODhubmFJ?=
 =?utf-8?B?NmNHcFQxWjFhVHQwcmR3bVNFZ3FsS2hPbHo3UnZidHBTOXIwL2l2K2tnWGpu?=
 =?utf-8?B?OURiN2pYQzdlRXRpZkladXE5ZERCZHZNRWtEQkFCNjZSZHZmS29aZHhGYzJv?=
 =?utf-8?B?TUdYUGNBeWU1QnRzbStHNENzUldVUE41WnQwdW94dzhRZjBWT1hkT1BUMXNy?=
 =?utf-8?B?bEt0bGptN0N2cDY3YXAvSHNZVk8yNXVLdk9RWFlKNUxxZ1duc3VOdDJ2dUhn?=
 =?utf-8?B?cFg5dzQ5L0g4S3MxenJkQ1RVdzlHc2QwUVJQMlU3TDZKUXpJcUJaMURjQXh2?=
 =?utf-8?B?L2dHaUZlNkMrZkYzaHFyR1UzUkVSQVJLOFNLTnVUMGVhOW5OaWVIK3lqYUFx?=
 =?utf-8?B?ZUVGNjdpM2p0V1dtbWxDZVd5R3BoUWpLTkJNWURvVG1ZTDliMmpwQ09KbktK?=
 =?utf-8?B?S2x6dUFjUjBRVGo4eWNUcFI0UCtJR3BENCtuaEFWRlhJZGp0bjBranRSbURH?=
 =?utf-8?B?cHRFSWE4NWRPMHc3dDJpUUFXczFEVTdtUlk1SWYxWjZSeEVlbHpWN2Y4Z01T?=
 =?utf-8?B?TUVJZTNiZlFoNDhrMGp4cDFVaFhObU9FZWRnb04zMDd0YkJlQm1rZEpBYVV5?=
 =?utf-8?B?VUQxVUF1dXBkWjJJUUxFZ3haZ0JkbXhGZkxIbUpOelZLZzl3b3lGck90UzZN?=
 =?utf-8?B?bUgxSHFkV21reUxjWFdaRW1EbVRwSmhoTEpXaEVKUVFNUlpKWCtWVlFyWVdn?=
 =?utf-8?B?OXFFcnhsQzlTSWdLL0tSSzlyaS9MUDJZY3ppbjdYaDhDMW9Lcm0rWUV1K3NY?=
 =?utf-8?B?MWowOU9RUTdVVEJNK08vTFdLWHZuMTdBUW43c2dMOUdYU2pReDZuNER1V2s4?=
 =?utf-8?B?NkJMaVlaZDFnUlY1NEh3L2tJOEp0TWZaaDlmNThMVnN3T25BVFJNRW5OazRi?=
 =?utf-8?B?Z282VlpHZ0haUzV1SjluSDVWeGRtM3krUUFOZVZQcm5wZGdVblU1eEE0Y0RF?=
 =?utf-8?B?aUZmWjc1SmNXU2lXY0E2SG5kRUtsZTk4c0hWWGJ3N0NiUzd1enozU3pZR29t?=
 =?utf-8?B?OVpMdGhmUWRHUmVEWmxwOVlmY29uY3l0c1IzcERjbUVTZFpxMlc1dnZiM3Jv?=
 =?utf-8?B?U3oweU9VbHV3YzJpc0pQaEFaNC9sZHlodnE2QVlMaFRaVWx3OEo2TVFuZWZt?=
 =?utf-8?B?WmFQUllOVjBjbUFwcHNPODRHNEtkZnkxZVkrOC9iTTA5a0pIZkw1MUJBVGZV?=
 =?utf-8?B?RWdjRzJjZ2RUMjhSNC9iSVIrZWxkOXZJTlNXaFlmRm5yaytCbWtGd2RacXgx?=
 =?utf-8?Q?ptqMjTI2OD8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RCd0dGQldQTWJrdVlERUJ3ZDZCczVVUkRETjZlUk1kM3R2YXFnc1dDMkhR?=
 =?utf-8?B?cFM3a3hlQmRRREhlUzBxMU8rOXlMbFRYM1B0aVZ4V3VGQVVwRzFGWExvQUM3?=
 =?utf-8?B?MkhZU1lHdUQ4ZnF5Zkp6MlJla2xJWng2ODE3bWhtL1lZMXBmdkd2S0NiNDdy?=
 =?utf-8?B?b0ZQK1VsN25kckxSakVSYXlibWREajlLVFV2QmtQUFRVTm01NUhDQXd2Yi9F?=
 =?utf-8?B?NzNQcm5ORlQza013NWo2ZUZkNWdGb1hiSmhzUkMyekhoYkxFUXE4QWNTN3dX?=
 =?utf-8?B?TmJuREVMTVhVS3dWeWpvQyt3MGFMNWFjLzVZMmY2TUoxb3dBeDFleXBQZmNM?=
 =?utf-8?B?dWYzcjRZcU1BQ2RzQXZBVHpaaVVnRm5CY0Z1MjZSZ3dKaVlQdHFZaTgyOWJH?=
 =?utf-8?B?MlFGaGg2ckVQa21aNU5IdU1hUkxWbmdiTzg0SEhDd0pPeHlQb3RTbW8wQ1pJ?=
 =?utf-8?B?eDcyS2Fhc05FdWFvd0tyQ2ljODlNMEQ2Wk02SEdTV0c0TFhTZkNmUlVWSTJq?=
 =?utf-8?B?bzFrL3BOT3lTTitlNGYzQmRmcWNLK2hVT1JSNHFhTStyb0x2RWVPMk93Y3Z2?=
 =?utf-8?B?NWZETzY1dmVxL0FkbkV1VWVHVE1Mb1d1ME9HVmUyQ3NaT0ZmTFdFUFhrMEpG?=
 =?utf-8?B?ZmIyUlIzaVNNQjZNWm9nOXdRMllSYlU2UFEwQTdwNjNuMFdCWlN0R0NZazYy?=
 =?utf-8?B?TzZKd2VRL1NIdXBJZkordmlSZjBvdmZwZ3pTQmkzeXRKMXpXdkowTHF4cVEr?=
 =?utf-8?B?dERhdzl5Tm5PQm82emVPNldXbXB3TStoUnZSK0JzRGVYY2RaZzBKNzRlaDUv?=
 =?utf-8?B?cGhLVEZrVGlkYkQyYncrWGNyUk5zZXhBYmxmMitCMjBUOEVwL0ZMckMxS0Iy?=
 =?utf-8?B?cG5GRk1hQkZjZXY3UVR1MksrWGZWZ2Y5d2xBZnk4SFVBMk5vTGFVRXdlMGtn?=
 =?utf-8?B?UkRNZm4wbklzSyt0MmJFMURwS0h5SkhRTkdtTFRBY3J1Z3FrbENKaFJaQ0Q2?=
 =?utf-8?B?Z1BuV0NFRERxZkRIRzdja2lvTVRjbDdVeCtxQWlyOFlsL0c4WCtlOEdLbTdG?=
 =?utf-8?B?WkV2QnNDUFV0Skc0RDN4bjVKNnFYMHoxNG11Z1NwV0FsYnR3RHJXRm5UOGV0?=
 =?utf-8?B?dHRuZm9SWkd4cTN5b1Q4Ukh4ZVhGZ3JzYVk0QkIzTHdueTgzMitXMTlvUmRk?=
 =?utf-8?B?amlYYU1vN1B5bDFQZ0puaUVqRHhGZldqdWJ6c1NRUUhaeE0zTHFGelVyYklB?=
 =?utf-8?B?U1YxN2hFMEExNGd1L2dRWDFycEVSc2kzbmNSMGIxUklnc2JBTUdqVUpMN2Ey?=
 =?utf-8?B?YWZhYStmV1R2ZHdCWGJ4WHIxaytPUFltdDUyZkt5MHJRMFlxemZPMERoOHo3?=
 =?utf-8?B?aUNOcG0wdWl3elV3S3g5cVZiejE2aW1yZThVeHV3bmxOeDVTTTY5LzlGK1Ry?=
 =?utf-8?B?VEQ0U1FUbVVwcTNQQklvZFVPOFhSWVREUmRsVjZEU3UzT0NkUExWRGJzT1py?=
 =?utf-8?B?MHREN3g1VmMrNXZZKzNCSW4vLzNxejhDSHVOOW0rWi9SaXY4U2VPV3FmT1BD?=
 =?utf-8?B?c0M4bGhHV2ZieUx4dGxxZHRFV1ZZNzZQSWJuYWlzZ2JSZ29Pc0dzdWZQWVNt?=
 =?utf-8?B?aEk5S1cyUVprTHRmZGxPa0lHeFVtbmZqRWRrNmtLZ01jTWQ1VEtWWit6elg0?=
 =?utf-8?B?aURWaTQrc2lPRGpuUmpMY1dTVTRpYTJnY0VuelpuY0VHd1loMXJvMldMSUtm?=
 =?utf-8?B?U0YyMlhOL1d6b1JBUVJqMmcvN0tEM05QL0V2a1dlaW1TYkgvTnJlN24wdTMx?=
 =?utf-8?B?b3cvSGRDTXRZb1REbmRWRHphOFFIaGQybitFRFI5TTRrUHhYSVZRS0dYRUF6?=
 =?utf-8?B?ZDRhTlZlTW5xcDZsNVljWXZzMXZEdGlCU3FDc1hXNTlRc3BTVzdmWVIrUzJL?=
 =?utf-8?B?ZEh5KzYvVDRDK1dvc0ExQllmbFVEZG8wdEMwT2t3SXJGaEhHMXJ0TURBM2ZR?=
 =?utf-8?B?dGdLUjhHMDdVOWZVU2JRS2J2UDhDVjF3SklOU1lwRTNYd3RQUHFIL3E1S3Vn?=
 =?utf-8?B?MGcxV3V2ZHZMSnlicmtOVHhwY25pbkNMN2ZwWC9jTEZCTHVhTGVCSGhCVlhF?=
 =?utf-8?B?S3ppbnJwaEZvWmpFZ0p3K29rc1NiZEVVcUFqTkFlSjhLQnBta0pPbktQMUdT?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 246bad7f-59f5-4a2f-3929-08dd82d5a778
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 02:13:50.7630 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6msXXl9ttAgT1B+dNAORsneAOgwnMZIZ217dOHPeoLRnz8gjB3PZKWnYeM7QV97gIHbcCMNIhf4rnmDuj/AQeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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

On Wed, Apr 23, 2025 at 07:57:10PM -0600, Lin, Shuicheng wrote:
> On Wed, April 23, 2025 1:19 PM Cavitt, Jonathan wrote:
> > Add initial declarations for the drm_xe_vm_get_property ioctl.
> > 
> > v2:
> > - Expand kernel docs for drm_xe_vm_get_property (Jianxun)
> > 
> > v3:
> > - Remove address type external definitions (Jianxun)
> > - Add fault type to xe_drm_fault struct (Jianxun)
> > 
> > v4:
> > - Remove engine class and instance (Ivan)
> > 
> > v5:
> > - Add declares for fault type, access type, and fault level (Matt Brost,
> >   Ivan)
> > 
> > v6:
> > - Fix inconsistent use of whitespace in defines
> > 
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > Cc: Zhang Jianxun <jianxun.zhang@intel.com>
> > Cc: Ivan Briano <ivan.briano@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 86
> > +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h index
> > 9c08738c3b91..556fc360a076 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_EXEC
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> > + *  - &DRM_IOCTL_XE_VM_GET_PROPERTY
> >   */
> > 
> >  /*
> > @@ -102,6 +103,7 @@ extern "C" {
> >  #define DRM_XE_EXEC			0x09
> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> >  #define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_VM_GET_PROPERTY		0x0c
> > 
> >  /* Must be kept compact -- no holes */
> > 
> > @@ -117,6 +119,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_EXEC
> > 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct
> > drm_xe_exec)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE
> > 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE,
> > struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_OBSERVATION
> > 	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct
> > drm_xe_observation_param)
> > +#define DRM_IOCTL_XE_VM_GET_PROPERTY
> > 	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_GET_PROPERTY,
> > struct drm_xe_vm_get_property)
> > 
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1193,6 +1196,89 @@ struct drm_xe_vm_bind {
> >  	__u64 reserved[2];
> >  };
> > 
> > +/** struct xe_vm_fault - Describes faults for
> > +%DRM_XE_VM_GET_PROPERTY_FAULTS */ struct xe_vm_fault {
> > +	/** @address: Address of the fault */
> > +	__u64 address;
> > +	/** @address_precision: Precision of faulted address */
> > +	__u32 address_precision;
> > +	/** @access_type: Type of address access that resulted in fault */
> > +#define FAULT_ACCESS_TYPE_READ		0
> > +#define FAULT_ACCESS_TYPE_WRITE		1
> > +#define FAULT_ACCESS_TYPE_ATOMIC	2
> 
> There is the same definition of "FLT_ACCESS_TYPE_READ" in the "regs/xe_pagefault_desc.h"
> Could we remove the definition in xe_pagefault_desc.h, and change to this definition?
> Also for the access_type in below.
> 

No — I'm getting a little frustrated here.

I've explained this multiple times, both in the comments on the list and
in our internal Teams chat. The uAPI is an abstraction of the hardware —
it is not a direct interface to hardware-reported values in user space.

The reason for this is simple: if the underlying hardware changes, a
direct interface would break the uAPI. Right now, the values may happen
to match, but there’s no guarantee they will continue to do so in the
future.

Please, everyone, stop bringing this up.

Matt 

> Shuicheng
> 
> > +	__u8 access_type;
> > +	/** @fault_type: Type of fault reported */
> > +#define FAULT_TYPE_NOT_PRESENT		0
> > +#define FAULT_TYPE_WRITE_ACCESS		1
> > +#define FAULT_TYPE_ATOMIC_ACCESS	2
> > +	__u8 fault_type;
> > +	/** @fault_level: fault level of the fault */
> > +#define FAULT_LEVEL_PTE		0
> > +#define FAULT_LEVEL_PDE		1
> > +#define FAULT_LEVEL_PDP		2
> > +#define FAULT_LEVEL_PML4	3
> > +#define FAULT_LEVEL_PML5	4
> > +	__u8 fault_level;
> > +	/** @pad: MBZ */
> > +	__u8 pad;
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[4];
> > +};
> > +
> > +/**
> > + * struct drm_xe_vm_get_property - Input of
> > +&DRM_IOCTL_XE_VM_GET_PROPERTY
> > + *
> > + * The user provides a VM and a property to query among
> > +DRM_XE_VM_GET_PROPERTY_*,
> > + * and sets the values in the vm_id and property members, respectively.
> > +This
> > + * determines both the VM to get the property of, as well as the
> > +property to
> > + * report.
> > + *
> > + * If size is set to 0, the driver fills it with the required size for
> > +the
> > + * requested property.  The user is expected here to allocate memory
> > +for the
> > + * property structure and to provide a pointer to the allocated memory
> > +using the
> > + * data member.  For some properties, this may be zero, in which case,
> > +the
> > + * value of the property will be saved to the value member and size
> > +will remain
> > + * zero on return.
> > + *
> > + * If size is not zero, then the IOCTL will attempt to copy the
> > +requested
> > + * property into the data member.
> > + *
> > + * The IOCTL will return -ENOENT if the VM could not be identified from
> > +the
> > + * provided VM ID, or -EINVAL if the IOCTL fails for any other reason,
> > +such as
> > + * providing an invalid size for the given property or if the property
> > +data
> > + * could not be copied to the memory allocated to the data member.
> > + *
> > + * The property member can be:
> > + *  - %DRM_XE_VM_GET_PROPERTY_FAULTS
> > + */
> > +struct drm_xe_vm_get_property {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: The ID of the VM to query the properties of */
> > +	__u32 vm_id;
> > +
> > +#define DRM_XE_VM_GET_PROPERTY_FAULTS		0
> > +	/** @property: property to get */
> > +	__u32 property;
> > +
> > +	/** @size: Size to allocate for @data */
> > +	__u32 size;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	union {
> > +		/** @data: Pointer to user-defined array of flexible size and
> > type */
> > +		__u64 data;
> > +		/** @value: Return value for scalar queries */
> > +		__u64 value;
> > +	};
> > +
> > +	/** @reserved: MBZ */
> > +	__u64 reserved[3];
> > +};
> > +
> >  /**
> >   * struct drm_xe_exec_queue_create - Input of
> > &DRM_IOCTL_XE_EXEC_QUEUE_CREATE
> >   *
> > --
> > 2.43.0
> 
