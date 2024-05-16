Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDB8C7CB7
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 20:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3382210E4FD;
	Thu, 16 May 2024 18:55:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mAjye9IU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E9510E470;
 Thu, 16 May 2024 18:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715885742; x=1747421742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XcK+q7NMNZjpgstw15WG99I+bmBPxIHkrJXqEC7SO8Q=;
 b=mAjye9IU8y05DTeTBmvvNvbxJo/MXJiam0KhMj5vtYBIRE+nPPGNC7j2
 6udPJD2VLb6mY2YciwmA0q3Tx+A5Pw5YTiwg9DEHK8veCnjAmVt6bKUgv
 j9MrYwC4OXqT5HJue92VgAOdh2A4cPRmJBAWGQYyZP4Egj2SXo9LDyr82
 Z3Juz1xFJXG+M1zidQBZw6bXFXvMtjzXOa2h/an2ytc0qnR2UhcvrEPwF
 vtFkQeVObl4j4B6KqJh60Fg/A2H9DcbkFGcKMYViF86eUTHkIAcioXTPy
 X+SkwZ1IlJswRiS5iXyEUxIQin6+J7s4bqtx5qH9NelHnak60/3r4x7OC g==;
X-CSE-ConnectionGUID: YqGEv3inQ/Sj6G+nZe+8Dw==
X-CSE-MsgGUID: DzMQfQ8hSiarSX4AAmIVmA==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22701719"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="22701719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:55:41 -0700
X-CSE-ConnectionGUID: sW7AgLytQI+vACi+G0cAzA==
X-CSE-MsgGUID: PHbVqCJoRO+YlYJmAwZHVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="32137566"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:55:42 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:55:41 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 16 May 2024 11:55:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:55:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7ApbQNs7SdszTnhoMggVFUY0t8qGpxJsZfLQ2hkL7ansVIi2OBk8mf6Vfk8mbeEyLIUD6wX7FBrSWcaMRH7YrLcuNrAXGW1fZbBpRiUM1rUH9Uf/yKwRkvmf1il/MCm8ESqjxVFklTtbiDMcLD0KsyHAru5Sk+Vta+bf4z3pAmz/gceWd2N8i5PTE4j6DZpKBMXdNZkYjcc4MZXi8KR0wkuHg6Mbf/ks/UEXgSr082oa9jgo8hGkdrgO+enwxZxyRjpHKQ+x/B4ZyvKMgbfq2ekXU+TDP8EZDKSNFhEb0TFyhIDDuGORDZO17AmnjLtxzeztCDq/63Q/ni96VPkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwyL1MTmD/k3BdqqyQ/t11MrMaz+uiEPxTcfmfuu5L8=;
 b=nT5FqNylIwwyqQIVe939ldMEKd5cz5xgbHt89g9L6mfspJ6ldCCet1DoxSmMUH1sRdiZ6s3t2mnVkEkBg9pJ97HaJ1p2ifZS4QJQx/cpNnMDpz4UAHW7yZvFehFfrMbZt4MBE7RPa06UHit3C7GoUouEMvVnC6x+csjXEQHJoPszaN0xa9F9VfLXZbGKBV8aUX+F/9enw1fbjsgIYGmIhN9o2sQbzgV5SrGZ8J5WxjMVY4keLxm53wAMzu2LEU0HcuQ+qidhcI0ogctMeg6uYTkt52UU0eEHR8qMqe+F0Q2XrRBU/7qdeW9b2XThybNG2Dltu+Ot8wmnwtoBuCQerw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.28; Thu, 16 May
 2024 18:55:38 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 18:55:37 +0000
Date: Thu, 16 May 2024 11:55:06 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 7/8] drm/xe: Add helper to return any available hw
 engine
Message-ID: <ZkZWiholGBt0XHh4@orsosgc001>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-8-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240515214258.59209-8-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e845b59-6e64-4d59-f40a-08dc75d9c677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SW1INFZrZ3VER1h3YVFFSng1V05hckFXa09oaDNxR003bmxKd3lhK1pjMUhl?=
 =?utf-8?B?a1hnR3lvRUh4Q1NzdW15UmFEd0JMQ2NRUS9teEVMSXRHdkZGWGRRT0lHcnpt?=
 =?utf-8?B?cTdsYVMwNnkvNVJQK2tKTzRZdDNjRWZNVTJiaUN3RXFVQzNTbTlnS0ZjdUM5?=
 =?utf-8?B?c1Ywd1BzN3hqdG84NVZxRG84a0xjZDJGVW1qSGFFYk1DSTBuQmtVVDV1cjZo?=
 =?utf-8?B?eWIwWlVRUHFEdGkvMGpMd3Jpa2tiSHc5QWJMV1NTV2JZQ0U2aTVlbGQ5QXpM?=
 =?utf-8?B?bTRid1IvUTFpc1hYajNPWSt2UDBPT0RPUkxnR2M2TmtOeXFuQWRLNkU3WEJJ?=
 =?utf-8?B?WTVWUDU1cTg3M0w1RlBzVzU2R0Q0bmtIUk5WWU9XbFkzU1RYTDVrUkJpalVv?=
 =?utf-8?B?WlNWeXBYb1J0cjlnbGVpL2FKVjRTNzZVODR5OS9BbW1DblNYV1RDV2piNDVs?=
 =?utf-8?B?K2VvUEtlSVRCb3pSUS9iWlI3TkNCUnhPTFFnbnNHbEhkOUtsR0ZMUVJiU2Fw?=
 =?utf-8?B?dTJseEZQUEtBOW5oeHBka2dESmRETUcxNXBQcGlnR1NZM01QVU1WbjBtclFG?=
 =?utf-8?B?bVA1Ui96RU1VcGYwRWttaE1GK3g5ZTNkblQxb1oxS1U5TnhyeG5NWWVSYXhy?=
 =?utf-8?B?RjVXK0dGWktqTnRPSnN5SklPSFllM1F0Nm5aMTFibjN2Njlad0pjaE1sY3Bu?=
 =?utf-8?B?cm9hclJQVGNFclpxR3JJNzA2WjIrMDhaRFN2RUJwRDRMRVRnUVRMRk8rMHJs?=
 =?utf-8?B?VnR6OFVMRFREMmV2T2E5NUV1Q2NPTkpWYTQ3ZFo5OVVaYkI3UDJsYzUrNGUr?=
 =?utf-8?B?U3hJeXZMMmJGVnp6elZSc29USW1nZk5zaXIyYWhHbmZQT1NHWnlKVHkwU28r?=
 =?utf-8?B?L2ZyRDBhbUZIQ0VXZFMvMkg4bElSUmRKWXlhOUZvZVMyNU1sYXlNMi80ZTRm?=
 =?utf-8?B?VzlhMlBrOFl3RkJkcWZkdFRFaFArbHFlb3U4dEI0dmxiUG1Eb1U5cmJQQWVW?=
 =?utf-8?B?clBsUytsRm10VHFxcDFNT3A3R2xGQnNHUndHNEhMaUc4QzZHL1lFVllsQXUr?=
 =?utf-8?B?VWpQL2lNbGIvV0IydHJDMW9VN3d3c3Y5WW5Oc3NMUHpQUjIwS0t0ZmhZUHp5?=
 =?utf-8?B?Wm0yWGhUL1RRaEg3OGRDdGg5aUlpSXRRNFB3TnYvQmNiQVU5M004dmFocjAw?=
 =?utf-8?B?L05GVWJZWEhKeW5MaFdSNjAreURPdXBkU2o2bkRHQ2VSclhxREZ2c1k0dGs0?=
 =?utf-8?B?eDFIZWFPek55UzJ2V1pucmxXZ3RsdFVtdnRBSmxqTjkvZXpKd2ozc3M0YlNh?=
 =?utf-8?B?YkpkbFhaU2EwS1k4YkhHRWhHMHlGcHBNVVBudU1TS3pDNHNTd3AwSXdLblM1?=
 =?utf-8?B?VkpQVGxsSDNoMkxiYktSalBHYm9vK1gvWGh5OFRMTElWazZ5Z0FVUWR3dE1I?=
 =?utf-8?B?ZDdwK0QvRXFZdjRPS2ZUUitBK3Z2V2ZPWjhCL1JsbEZGc2pkaEhHMGdtckVT?=
 =?utf-8?B?OU8xbW01OWJEc2JvZFNoQzY0d0laRXFFUWZJV3pONEh1VW1ZR3pFbkxrUy84?=
 =?utf-8?B?cGlLK1lKalZsV3VneXh0U3FMbU1VdGNPSFVqSTVvRTFEV2FJalpLRGQ4Qkpn?=
 =?utf-8?B?eG5Fd3pHbzQycGhjT3pCK016OEJCaktjanBKQkd6ZkJ6eGlwZ3RmdjlyNzJD?=
 =?utf-8?B?UGNCY3BLekgxbjV0NXV3S3BMdzdseFFIQzlxeDQwOGtVWWlmMWZPZDRRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXYzSFNSOUdDMW4rb0I1T1hqYXpDaEJEclQ1RFNEQTU2UlYxOS9sWmdRaGpU?=
 =?utf-8?B?WDJLKzhPTVB3ZExPUFAzcDdGNWJwOVkzdGpYUUJ3WWdzYVFRMm5vc1gydkRW?=
 =?utf-8?B?bWxGMVN4UktERHJycFVrZldBVmdYT1V6Uys2cjJIbXFPZ1FxVWlvbTR6REhS?=
 =?utf-8?B?ak5SYVVKRDRDUDFVVUsrMHJ5REhYcjdzUllsY2twcFVYNHhyRFRSNXJDSjJ3?=
 =?utf-8?B?dGZXY0FidGdBd0ZBanV6TWVyV1lQdTVWc0dOYTBqT1h6U2pUNHhwU0FWQzlH?=
 =?utf-8?B?M0hQdWtZeGV0UXBjRVRtQWF4VmZhd3ZJYUIxRFNvbytOeWUwUXVyZXlZdk5Q?=
 =?utf-8?B?d3kwaWE4d3JGam9FYk5DWW1hOVdldStXYjk2QlFZT3lPYXA1VHJQNW1DazhT?=
 =?utf-8?B?VCttenNpMTJDY0xTNXVyM0VsZFk0Qi9DQzA1OUwrU0dzYTFvVzVmSWJ2Skp1?=
 =?utf-8?B?bGxhdFVWMW5pRmNBUWFSODZDa29pbVhXUXd2RUg1ekpnVUJPL2tyTjdFRUFa?=
 =?utf-8?B?OXpISXdCYjh5TGRnWXpad0dkQmZRalJNeXBPRVJTL1hyNEZybnk2K1F2ZFEw?=
 =?utf-8?B?dktrQXI1TkU4d3lKOUhFdmNMMFBpcDFWVXloWnZUOVNEcmRaVXdVTXVFV2Zk?=
 =?utf-8?B?SDBOVEZDNmh2YkNYRmZaMHhrR1JTZlltNndwaGJDV1l2Nm5uYkVmWTVrYmpS?=
 =?utf-8?B?dGx0aTlteitoNXk2NTVma3FFckpUWWhSQ3pmcGUxZng3Y0hRbFlUT3BLWmtP?=
 =?utf-8?B?UFZWRDJYV2JCTWt2U1ZXMlY5cGI2TTJBKzdPMWJuMVhXcWJLbWZuRk12djlo?=
 =?utf-8?B?dWkxNi93dTBQbTkreFUwTUVKLzFwaGpxOXYwY096aEtQaEoreDJUVGJDazJ2?=
 =?utf-8?B?SWw2YWpNcURoRXNaQWdFSlVvT21HL01DelFlMXFmZWZkakxXL3V5WGFlYTR6?=
 =?utf-8?B?aklzbngwU3dScS9TVkFJVG1TNy9VL1I5eGwwV0xBbE9aalJENnF2YmN4Z1hj?=
 =?utf-8?B?TUFQM2hlbFhOWGhzNFRvOHFrWnpPaThrWkZNektWa1RWR29iV09VZWI3dDFs?=
 =?utf-8?B?T1pFa3kxY00xQVdjTVE1UnBYQUpDTVhXcFk0eDBDdjVuV3JTWUlFNTRZV0ZC?=
 =?utf-8?B?R25ETVFneVdJZzZBbjEyMCtMa1h5dHRnbG03UjE1d2dQRDhLbzQ5RnJmSFRj?=
 =?utf-8?B?a1dvcFZ0bWV2TG1mUW9SdGtoeUQrZElUR1RMY0pMdEFmVk9lM1E4ZUo4emNh?=
 =?utf-8?B?eHpwcy9oTjZtbXZsa1ZtbEl6dUxHY29NSG8wZDErR3pXa0M1aU1oZWZJaTZJ?=
 =?utf-8?B?UkFxYXJIYzVJVHI5RExxczMwUytGdlVJQnVuNld5L2k4ajYrOFpwYUJmU1oy?=
 =?utf-8?B?NVlRRUpZVnNmeHBCR2IzZWlIb0xzK01qa3ppZEVKZVkva296TURGcWhQRjBK?=
 =?utf-8?B?RTRrSXlzaFJJOFRNZXp2R2d6N28xeGhzR2RFS0NsSXFYY05rRGJ3OGNEOGY2?=
 =?utf-8?B?bzNrNWdhaXJsbzZHdkYydlZIQ2lvWGJsbjlNUjkrR3lxWVp2bE5qNFlQOFFJ?=
 =?utf-8?B?M3JBWDhXTHNubGxqV0llVWdkc08zTTBIZy9TYkJxdS84YWlQMmZINkcrMkx5?=
 =?utf-8?B?R0ZSTE5BYUpIUk1IV2hHalpIWEs4bmlhL2NEcE1LQWZySVVKaDEzbDBZTk5a?=
 =?utf-8?B?VVc5eUxsL3BKc0x1YWtmZDlNK1E5bittQ2RFR0JKdTJOeEhraWFhQjhTYXVo?=
 =?utf-8?B?aDZWYkxWb21xdEZWVm50c25iS1VjTk5jcjhTTG9LMEtVeHNwOFd3WjVvMmVs?=
 =?utf-8?B?aXJrNHF1K2J4aGwwRkcwNjdiNzdaQ0Q0L1VFTVBmbmZIZFpmQ09TcTc0UnBO?=
 =?utf-8?B?MHloS3Jab2pXLzJaUTcwTTViY01OUWFteERuclo3K2VROE9rdlhWY1JQa21y?=
 =?utf-8?B?MXNOVjhuSGx4TEl2ckI3VDBWSmlpa0lOa2tGd2JidUJLWllPSXVERmZwbUln?=
 =?utf-8?B?VG5UM2VZaS9aK0dCQ0Y1R3JIbzF4Wi9lYWdrcTBHVnBhb21RQTE3dWJYK05D?=
 =?utf-8?B?QXU4eXVERGpxSVVYcC9IY1I3UitGRER6Y0R2YnBzVXFYT09rMFZYaVhwaVNi?=
 =?utf-8?B?bzFiQlFBb1ZxZGx0alJCR05rbEVJamJqS3VvajlSRjV5c2JFWS92NEs0ZFZZ?=
 =?utf-8?Q?NgvjiI9k6kRotBSII4qdVgA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e845b59-6e64-4d59-f40a-08dc75d9c677
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:55:37.9007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60CWKWWBmxSY3H6U5wq3TBXCpfYA+w+LLudw0UkvQuzPaga0fHrgE9R/y9dKj7BvN1Yi7PJ6637OZRlke8r0I5ZngaHXr2sHTEuG5ghOtFc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Wed, May 15, 2024 at 02:42:57PM -0700, Lucas De Marchi wrote:
>Get the first available engine from a gt, which helps in the case any
>engine serves as a context, like when reading RING_TIMESTAMP.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt.c | 11 +++++++++++
> drivers/gpu/drm/xe/xe_gt.h |  7 +++++++
> 2 files changed, 18 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index 5194a3d38e76..3432fef56486 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -833,3 +833,14 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
>
> 	return NULL;
> }
>+
>+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	for_each_hw_engine(hwe, gt, id)
>+		return hwe;
>+
>+	return NULL;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index ad3fd31e0a41..a53f01362d94 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -67,6 +67,13 @@ void xe_gt_remove(struct xe_gt *gt);
> struct xe_hw_engine *
> xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt, enum xe_engine_class class);
>
>+/**
>+ * xe_gt_any_hw_engine - scan the list of engines and return the
>+ * first available
>+ * @gt: GT structure
>+ */
>+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt);
>+
> struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
> 				     enum xe_engine_class class,
> 				     u16 instance,
>-- 
>2.43.0
>
