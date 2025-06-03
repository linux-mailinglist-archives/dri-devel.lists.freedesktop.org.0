Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D5ACC88B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 15:57:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A55510E6A3;
	Tue,  3 Jun 2025 13:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SmzaBrAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9414310E088;
 Tue,  3 Jun 2025 13:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748959052; x=1780495052;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yRdXHJ55UJzG/PR1PVLV/GhxunGzf0m75fyJ8H3EUJU=;
 b=SmzaBrAOxR/tq9sJnF3FtIwamkgkVZIOTr3twSP/L8mHNTAfM1ObN2EP
 oT3SmvkTh7yIDWp40XO4A8asvC7w5qzLfmwiELTB9UtKlLH1YzAw0NC0G
 mneIHz/rgVw3qjluT0tN12rYGFcu7//rLDSnV+dw2QvYull7VYUXH0P4d
 imMy4zZR0LbsVjCLnShOZKz+WeNGsm9ffkzSZpGbPZdMIWABc+VQj9BHG
 SeDK1wonAjRwrwlfZXUhHSELHjlqfbOGSfFKAGmk0ktmDKODHiiwcjUBM
 aQ00nsnnV0ZErnBL3XTSJTnBtq+Z1RHJNwXUV3l0n29ShoshcUenmGOJ5 w==;
X-CSE-ConnectionGUID: 9MPBE1dhSwS4O8lh+/ormA==
X-CSE-MsgGUID: YzWakeZLTi6rqIOUQZ50Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="53628524"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="53628524"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 06:57:32 -0700
X-CSE-ConnectionGUID: iBCHGZ+ITxKqgv1tmCNcTA==
X-CSE-MsgGUID: qsHuKZpXTlCFplRsMcMh4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="149909785"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 06:57:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 06:57:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 06:57:31 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 06:57:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FNV7lFUad49/NTirhZfTedvQEDJ38AsFCeySSe7ylIyKy4GNwaWtVo9pIoVRC3KhNjiGFxJrx2HrIiBEi76HumkHi3+iWusF6KvL0ZlAHFSu4igwsx1b6l0zvjAsJqA5KR1+gN9iUmj/5JbjoGu6bHhHceZI458BD3hpxGXdMlE1N0FUyzzXn/xD5Ul/Z/qZFfzmubAVmKXHDwEkuYENLNo2szB4GGz9awj3L+b5r34etCaJ2lkc6ZA2HjJIf8XQujSb9QOk+dt4mjQ3JzogMGMTo+CTX0C43OnH0q8B80WQCmoQDHJbVuXtCGJERz5xqOuNDrqd0rmH8P4WVTBFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRWTzQItkCzNfH+JhLzRO313ohrBXIiYYuO6BPCqtJs=;
 b=j5wUeFT0eVVCy2Uc6PVojcFT+8aabKA7kZ+ZnXW5E9DR73UX8SrtuCuyT3EoOeERiPn84JXb3SF4e6y8broGgPihhFsWgLmqSJyo7S+kZ4Gkn/hvC0VK/AxWfKlWYUfQ4TkGIasumOyKaYpeZX6OFnDOXOI97Zzh1XrRM5l7MmXKlNj49zsEb2F9GQV+eQk9K9eNNUzpouVPZ+aMNnE8pB4vioBjAnLEV4dWLhtO3FNu358f7W8lKPB9N7tV+FnAGSDoCviq5Vls03snx8Jj4czax7g/lqSrYhBEZhSX6LexDZuAKnnKTZf+QkOow88cFlNdyyj6ncIyw59ccyU2aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MN2PR11MB4758.namprd11.prod.outlook.com (2603:10b6:208:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 3 Jun
 2025 13:57:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%6]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 13:57:14 +0000
Message-ID: <669ee9d4-82a1-4022-ab42-bf4465f56e53@intel.com>
Date: Tue, 3 Jun 2025 19:27:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 4/9] drm/xe/xe_late_bind_fw: Initialize late binding firmware
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>
References: <20250429160956.1014376-1-badal.nilawar@intel.com>
 <20250429160956.1014376-5-badal.nilawar@intel.com>
 <359f8288-480a-47f0-97e6-9bcda94cff30@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <359f8288-480a-47f0-97e6-9bcda94cff30@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MN2PR11MB4758:EE_
X-MS-Office365-Filtering-Correlation-Id: 915a042b-661c-4090-9a75-08dda2a68b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjBIMGhuYzZsQmZDL2ZoeWpvRFM5ajZIUTVrTFQ0d0FadkcyU1NiOGRYaVNQ?=
 =?utf-8?B?ZUtHamNHVmtYVGx0dFEreVJ1T0pvbnVIRFBid0kyVEpEd296UkY0S0UvQ3lk?=
 =?utf-8?B?N1VnVmRZMm8yekNhTGlPZTBLY000T0ZUekZ6UHpmTFArNVZ4RU5TTFczanlZ?=
 =?utf-8?B?SXpWSk9kVUJ4TE4vUUk2Lzl4UExuUDRrYmZ0NjVUTmJYb3hCRjFiczMwZCt3?=
 =?utf-8?B?RWhNSlB5WGJpdVZkS3NDdTZBTUpJSUtrTnRqRks0WFFLMWJRZGlmZnh3QkZz?=
 =?utf-8?B?UUlGNXhJNzl5OUV3RWhtcDhHZ2pCYlh6ZkxpNzVkUVhpVzA2QXQ2TW9obll3?=
 =?utf-8?B?NlhxbFVxOTZkZWNiMnBUejROZmdWeUFtYkcwUTRsNy9idTluU25QMFJIeVVt?=
 =?utf-8?B?VnVkbEl3ejdtbjNFNWQvcXpLa2N0Y2k2UVFYakRFL2JvOFlNQXEzdEVjZHNs?=
 =?utf-8?B?TW1xNlYxMVJvUVY4TGQ1aHZWMTR3c0FYM1B0Y1F5UTFzdXpwU0wvMmF3bzh0?=
 =?utf-8?B?Z3dTZy8raWVBNW5wQlcxYjZDYVFsNDMzLzZRT0NvSHpzOXdBbnQwaU55Zkpx?=
 =?utf-8?B?U3RyU3dvV3ZMaWtNZzJOMWR5Y21OMHBHQlRCVWUzUjhaaVNhaUNFSmpSZXNK?=
 =?utf-8?B?YTQ0M1o3b1dCeXozZVJjenR4Q1d1aktBRzVSOVpOektTYWd0UHdNeW8zcndP?=
 =?utf-8?B?bmNEK3UyYlRmeFQ3d2FRaW9CVGdRSGdCQm02T002eEFQYjNuWldOTDM4dTFY?=
 =?utf-8?B?VTd4c09LcURLT1dNdDlYRmVZS1k4R2Rhc0s2c2dJMEVjMisrKzVPNXpkdHZF?=
 =?utf-8?B?S1VxanBuQkF5TmJ4MndMZjdmcTVramhiT1Q5WFRBWVhpd0o3TXBUTEJLVlB6?=
 =?utf-8?B?QzJGMGdBNzQybmN4a0xzRFZKUU9XZDZVVXBtVndhcTdkQ1BHZ09SZjV3RjdI?=
 =?utf-8?B?NWs1bS8yRk5JNjlBS1htZ0twZnpUSTEzc0lZOGxxeDRocnNDZWFFanMzZE5Q?=
 =?utf-8?B?VUF1c1V3ZWhBKzd2V0hyK1JVQnVhU0VNaXorbnBzdktNVGN6bENlTU5ubGRS?=
 =?utf-8?B?Q1JGY1pLaDJFaVd1dFFXSXJVSkFFaVZKVzhXSzBxVHBVcFNsNDRHZjUyRG01?=
 =?utf-8?B?UTZUTkpUSEVRMCtvbDJuOEJBY3RXVWptRCtmaGdTOE8wcUhRTTVNbjB6SU9t?=
 =?utf-8?B?OHJmVDhYa1VTbWdGcVVHc1gwT0lXUkt2aE5iMGlvVUwraUFzaXRjTEVQd2x4?=
 =?utf-8?B?SWo2WHZKOHZ1NjlsZDNMQ1cxSVVTa1Q2YkRqNUVMbjRxRmpwaHZHSHBGZkhr?=
 =?utf-8?B?RkN1T2hKbi9QOTBiN0o1S3o4c2ZFUWxVdGJSdUZiZkpoL0xZWDl3S1QzUC9K?=
 =?utf-8?B?S09MZWR5OVhMQStrN21WS1REL2ZhSWpvcCtHVW81SEpHWlN5RERkRFZVWXNw?=
 =?utf-8?B?V1ZWZEpyU0R1d0RaWlU2NDNsY2lBa25UZ25SY0dKb0x4ZHBGbk9NRk0rbHg1?=
 =?utf-8?B?UmdtUWdVTHJ0c3dtOWpKbUd1dXVxdGFaelRDbGRpYnpCYS9iclZZMnl1TjFJ?=
 =?utf-8?B?Yy9RcDRsR2hNQWZEMFZZRk8yRlB4MzY3T3RFSVhBaXlaaW5hVElkL3dhbmZN?=
 =?utf-8?B?WkkyV1RpZmNjcUVQd3RjazY3QkN5ZGZMVzFDenJMN25jVVpzaWFvL2RQcWJi?=
 =?utf-8?B?SE85UHllSk1CUWh2M3JjbmgzQUt2NlRKQ2JCMTMxa1dEYUF1QTdsV3hpQ01I?=
 =?utf-8?B?UTFKVGk3RWlhdTdkWWtNYlVtdTZiSm5TRnJLS2p6M09QR3czQ2dzTTZ6TVhp?=
 =?utf-8?B?aGVVbURiRHVxbytQMU13bjdtQjFCOUVCRGd6TlBPb2dNN0pFVTJHQzdBbXNM?=
 =?utf-8?B?UnZKRlpRREQ3czlJMkkwbHJUUWJBcnQrbzVXaEg1YjU0ZGF1VTFLRm14ajRa?=
 =?utf-8?Q?wrMXUCX6cz8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmNoOVFja05IRmRhWEk4dTZURktjQnE5bndNbEk1OG9JQkF0TE8rL3ZrdXZw?=
 =?utf-8?B?allYOGx2NjFHNjZ1K3VOSUxrUW9qUlErZU5QUzc2a2lMdjQ5YWplZ3VXWCtV?=
 =?utf-8?B?WTJza2RwcDVGcmwrV01la1dKTVhlSDR2T01YSTlJZEROQVZ1UldFQU5WUjVG?=
 =?utf-8?B?NEdzMkQvcVpwSnYzNHFXTE1ZL3Ywbk1TRVNJNDhpL1J0eDJWa0FjTS9hYUdI?=
 =?utf-8?B?OU9XM2VBSGxkeDBKR3loZHlKN212ZUVZNnYvcU1FWXZ4cWxhUTR0eXJJVjRh?=
 =?utf-8?B?M2h0N2tVTlh6K05TOTFNZHYvbTZwMXBmR0MxR1cyQ0dDNURRQWpLZDRjc1Ur?=
 =?utf-8?B?ellOWVlPaWxtWnE3VHVtNTduRkgrYUxlZWxHaVZTNHAvcnp5dWJ6NWZmQTZG?=
 =?utf-8?B?WENVRWVseTRjMXh1UGN0MzBKMVJXSmM2bXZsV29QTnRZVHNwMi9xUnFIV3Er?=
 =?utf-8?B?TUEyQWZtdXNDamFLQjRtK1Bjd3dnRnU1MGlpa21Gb0syeEorWm1nMy9mbjF5?=
 =?utf-8?B?U0RhUE5JT3NuMnlsazRNdFVwTGVIMjN1ODBUVW9ISlZmSUlzeUc3VmdhR1h5?=
 =?utf-8?B?MXpNSWFRT3MwYkdra3RWWm0wUWhuUjZCd1RkdTRaeHZubzg5U1dLN1NDSkZD?=
 =?utf-8?B?Q1JIWlRDdThUWWc5SzYyWktIYTlOUWlxNlY1ZXBrN2duRVZkTVhRT3hpek0r?=
 =?utf-8?B?ZnZyck5kWEVBK3lxbzdDU0dYT1BjcWc5T2tndTJjRmI1OStEcXJpQ3dWTXFY?=
 =?utf-8?B?Y2d3MlNybER3RkRoRXZ0RkQ5aVVhOUFHU3hSS2N0Y1JndTF4RTJYTUdpYWRz?=
 =?utf-8?B?WThtVk1NN0NTK1VVTXJ4RTdnOXQxdGMxYlgxV0psdUZXODljVXBWeFhzTkdV?=
 =?utf-8?B?ditCZFBxTXJjd3dZZGxFQ3QwWjhaK0ZqS1VlZi9KaW1WcGM0QnpkUDNXQjZi?=
 =?utf-8?B?TGFLcmxPVk9vV3JjZUJwR2o0QlpiUjlEenNud0FhQ083d01qbGR3M1ltaWlx?=
 =?utf-8?B?YTF4cnVtUk1NRmZSWnhwNlRHUW9sMGo2aWpwYXYxcWVzVDFYdCtCWHRQNUpT?=
 =?utf-8?B?bFRjVWpYVFlwcHNlbGFlS3lTdzN4MUFOU0tMaU9CU3JuV3N0Q3FicE1jLzNt?=
 =?utf-8?B?Z252T2g1TjhkU0lzS2lJN2RLM0tSY2VaV0RONnZid3M3S1VhQ2t2WWVvQUNn?=
 =?utf-8?B?bkdteDhUTXBIaU5PUVpQR0VDY2VLaURidSsxUGdzS2VieWgzZkNhazhKeVJB?=
 =?utf-8?B?ZVM4NVNIVmRrWk5DbDF5bVJ3OENDUEpTVHh2VTM1UmgwT1VDRm5VTUFUeGJj?=
 =?utf-8?B?YjF4VjVYWG52WHEvYmdFNGV6SWRiU0tPRW9UaDE5TCtVOE5vYm80eGJHUWFW?=
 =?utf-8?B?R29qdWFST1FDVjJPalRGV0cvMnBURFBJVVdhL0FlZExQTTMvZ2NiV3Z3QWJi?=
 =?utf-8?B?UzJKRVZVNVVFVWJFTExmWGxxeDZINDR2VVRGUVZOcjJhdnlXNjF2T0VlZ2RE?=
 =?utf-8?B?RDA0RkJaR3RYYTZPK0N0em9lQVVsMWx0dllZSkxQV1BuV2ozaC9vQUg2QlJk?=
 =?utf-8?B?dkdDS1V1S2tveXJMK2JDRUhESStpaGVUbGQzZVYraFFTTlkraTlkS2pBZHR4?=
 =?utf-8?B?THE5Y0FWOGxEcjRPWEdDR3gxT2xSOHd3dnBFZW9tRkVibFlHY2c1M2RlbnlD?=
 =?utf-8?B?Y291NWVGTVlnMW1USUdHRFpqNWNRYkhKNVp2Qk5KMTRNcUdEMVFpdFRnZlZH?=
 =?utf-8?B?NWF4M21ldTRzc1FCVG9NMmV1a3VxdVJTL3UrK2RaUS84a0ljeStGWHJXVTVq?=
 =?utf-8?B?U2E5VTJEbEVqUUc5Z0R4bnoxK1BIVThpL1hsTEZkU1pnOFArNHlxakIwZGIz?=
 =?utf-8?B?cGhrenkyZkRZZnduYlh1eWVPeFRaR2dOVUZWeU0xYUM0WFNqbE9zazZMSDcy?=
 =?utf-8?B?cjdkRDRZQmRxdjhQdUNPMnhpY0JvcjJaU01CZXFhWDhRd2IvSUU5QmdZbU9s?=
 =?utf-8?B?Sm54VWVKZlhuMVNpNWc5WENjRHduT1NvbnIxUUNDM1I0S0x6NEFaTnpEL2VU?=
 =?utf-8?B?ZmZxcjVzZVRlRTlKcUxpYmYzRFY3RDJGUi9zck5naHlmRkZRTUJkOEwwS2pK?=
 =?utf-8?B?cG5Ta0hVaDU0MXQ0MFdmNU1YMm5qN05KKzlRam54RXBOSUEzamlSamZpSnRB?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 915a042b-661c-4090-9a75-08dda2a68b6c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:57:14.7351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kZSvey49NtF51T/t4U6hUsRRP4fncwzAc/S5A+HhSB5A0AOHKcfItZkph84hIaZ8z6jZOI+dLBXXI4gpANt3ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4758
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


On 08-05-2025 04:41, Daniele Ceraolo Spurio wrote:
>
>
> On 4/29/2025 9:09 AM, Badal Nilawar wrote:
>> Search for late binding firmware binaries and populate the meta data of
>> firmware structures.
>>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c | 101 ++++++++++++++++++++++++++-
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h |   1 +
>>   3 files changed, 101 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 86a7b7065122..d83864e7189c 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -892,6 +892,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_late_bind_init(&xe->late_bind);
>>   +    xe_late_bind_fw_init(&xe->late_bind);
>
> Maybe call this from inside xe_late_bind_init?
Sure.
>
>> +
>>       err = xe_oa_init(xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> index 7981fc500a78..297238fd3d16 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -5,6 +5,7 @@
>>     #include <linux/component.h>
>>   #include <linux/delay.h>
>> +#include <linux/firmware.h>
>>     #include <drm/drm_managed.h>
>>   #include <drm/intel/i915_component.h>
>> @@ -13,13 +14,108 @@
>>     #include "xe_device.h"
>>   #include "xe_late_bind_fw.h"
>> +#include "xe_pcode.h"
>> +#include "xe_pcode_api.h"
>>   -static struct xe_device *
>> -late_bind_to_xe(struct xe_late_bind *late_bind)
>> +static const char * const fw_id_to_name[] = {
>> +        [FAN_CONTROL_ID] = "fan_control",
>> +        [VOLTAGE_REGULATOR_ID] = "voltage_regulator",
>> +    };
>> +
>> +static const u32 fw_id_to_type[] = {
>> +        [FAN_CONTROL_ID] = CSC_LATE_BINDING_TYPE_FAN_CONTROL,
>> +        [VOLTAGE_REGULATOR_ID] = 
>> CSC_LATE_BINDING_TYPE_VOLTAGE_REGULATOR
>> +    };
>> +
>> +static struct xe_device *late_bind_to_xe(struct xe_late_bind 
>> *late_bind)
>>   {
>>       return container_of(late_bind, struct xe_device, late_bind);
>>   }
>>   +static int late_bind_fw_num_fans(struct xe_late_bind *late_bind)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(xe);
>> +    u32 uval;
>> +
>> +    if (!xe_pcode_read(root_tile,
>> +               PCODE_MBOX(FAN_SPEED_CONTROL, FSC_READ_NUM_FANS, 0), 
>> &uval, NULL))
>> +        return uval;
>> +    else
>> +        return 0;
>> +}
>> +
>> +static int late_bind_fw_init(struct xe_late_bind *late_bind, u32 id)
>> +{
>> +    struct xe_device *xe = late_bind_to_xe(late_bind);
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct xe_late_bind_fw *lb_fw;
>> +    const struct firmware *fw;
>> +    u32 num_fans;
>> +    int ret;
>> +
>> +    if (!late_bind->component_added)
>> +        return 0;
>> +
>> +    if (id >= MAX_ID)
>> +        return -EINVAL;
>> +
>> +    lb_fw = &late_bind->late_bind_fw[id];
>> +
>> +    lb_fw->id = id;
>> +    lb_fw->type = fw_id_to_type[id];
>> +
>> +    if (lb_fw->type == CSC_LATE_BINDING_TYPE_FAN_CONTROL) {
>> +        num_fans = late_bind_fw_num_fans(late_bind);
>> +        drm_dbg(&xe->drm, "Number of Fans: %d\n", num_fans);
>> +        if (!num_fans)
>> +            return 0;
>> +    }
>> +
>> +    lb_fw->flags = CSC_LATE_BINDING_FLAGS_IS_PERSISTENT;
>> +
>> +    snprintf(lb_fw->blob_path, sizeof(lb_fw->blob_path), 
>> "xe/%s_8086_%04x_%04x_%04x.bin",
>> +         fw_id_to_name[id], pdev->device,
>> +         pdev->subsystem_vendor, pdev->subsystem_device);
>> +
>> +    drm_dbg(&xe->drm, "Request late binding firmware %s\n", 
>> lb_fw->blob_path);
>> +    ret = request_firmware(&fw, lb_fw->blob_path, xe->drm.dev);
>
> Are we expecting late binding firmwares for all possible cards to 
> always be available? because if not (and therefore if this fetch can 
> fail) we should change this to firmware_request_nowarn to avoid 
> throwing errors
No late binding firmware will not be available for all card, as 
suggested firmware_request_nowarn here.
>
>
>> +    if (ret) {
>> +        drm_err(&xe->drm, "Failed to request %s\n", lb_fw->blob_path);
>
> Same as above, if not finding the blob is a valid scenario then this 
> should be a drm_dbg. Maybe even reword to make it clear it's not a 
> failure but just the fact that there is no FW for the card.
I will change drm_err to drm_dbg.
>
>> +        lb_fw->valid = false;
>> +        return 0;
>> +    }
>> +
>> +    if (fw->size > MAX_PAYLOAD_SIZE)
>> +        lb_fw->payload_size = MAX_PAYLOAD_SIZE;
>
> Is this safe? It feels weird to send a truncated firmware for 
> something like voltage regulators. IMO if the firmware is too big we 
> should throw and error and bail out.
Sure, let's throw the error if firmware is too big.
>
>> +    else
>> +        lb_fw->payload_size = fw->size;
>> +
>> +    memcpy(lb_fw->payload, fw->data, lb_fw->payload_size);
>> +    release_firmware(fw);
>> +    lb_fw->valid = true;
>> +
>> +    return 0;
>> +}
>> +
>> +/**
>> + * xe_mei_late_bind_fw_init() - Initialize late bind firmware
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno 
>> otherwise.
>> + */
>> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind)
>> +{
>> +    int id;
>> +    int ret;
>> +
>> +    for (id = 0; id < MAX_ID; id++) {
>> +        ret = late_bind_fw_init(late_bind, id);
>> +        if (ret)
>> +            return ret;
>> +    }
>> +    return ret;
>> +}
>> +
>>   static int xe_late_bind_component_bind(struct device *xe_kdev,
>>                          struct device *mei_kdev, void *data)
>>   {
>> @@ -83,7 +179,6 @@ int xe_late_bind_init(struct xe_late_bind *late_bind)
>>       }
>>         late_bind->component_added = true;
>> -
>
> stray blank line removal

Ok.

Thanks,
Badal

>
> Daniele
>
>>       /* the component must be removed before unload, so can't use 
>> drmm for cleanup */
>>         return 0;
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h 
>> b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> index 21299de54b47..e88c637b15a6 100644
>> --- a/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -12,5 +12,6 @@ struct xe_late_bind;
>>     int xe_late_bind_init(struct xe_late_bind *late_bind);
>>   void xe_late_bind_remove(struct xe_late_bind *late_bind);
>> +int xe_late_bind_fw_init(struct xe_late_bind *late_bind);
>>     #endif
>
