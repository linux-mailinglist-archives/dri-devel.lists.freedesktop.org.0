Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKFJBxz3nmn7YQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:20:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77206197F95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 14:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD54010E791;
	Wed, 25 Feb 2026 13:20:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BrfYokdY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF14610E791;
 Wed, 25 Feb 2026 13:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772025623; x=1803561623;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L6hVGf+lbm7cQ8S0QFHCc9JhPTPfFv7VpbKLlAVLbvs=;
 b=BrfYokdYDi+A0au9RY8x9QrG7wUqVT6SGveZiIS55d9lUuWP0Hyo2aa+
 4V1QQzknkHlKK+Er7W+xV/5ZZT3dRQWNr8qC7FIvLCYQO93UoBLdlzcwV
 r/ivMsmX6630SNpqmDJ42l7zUrw8jVGGiCCtsgica5nF9ldgExLG3lj/g
 Vhh9vr5CRhQb02Ax9ER7Mr1jJnby/N0rsHx6rzn51+8mxZ/Gagu8wnqRA
 nhO7U32RU1a/9Y3NCx7JATVDPoUlYXCqsoyL4EsCkkSdiRkVw+aX3KmPR
 s7JNSkgwEFfcnGCuXRzNtEysjdanbyjGidc5va1++8RnvnDnIhdpojNKZ g==;
X-CSE-ConnectionGUID: AHuTMF5kSzWByQerXJ8t0w==
X-CSE-MsgGUID: K6xtRiloS2WmBViMS/i32w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72968551"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="72968551"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:20:23 -0800
X-CSE-ConnectionGUID: smU7TmScQ72KvXxlu+1gyA==
X-CSE-MsgGUID: Wzou02MTS7+5a6tJDmAvVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; d="scan'208";a="216368457"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 05:20:24 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 05:20:23 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 25 Feb 2026 05:20:23 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 25 Feb 2026 05:20:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G64cALOXcnU5oQvjLDVc1ACMc5LFXS0Bqt9nCvPTsuINDA2zFVpsGBcRLX9aV0mYAyVJQDNhcx2DsLEeoqfq/z40CvbLtD86J0XAC54EUZfCNDc8VK4mNrEJJKyitrSuEYJyoZMUdb7qPDgGw79fPUZvoJJOstuE0GD3ZGbKzL3zOjeHotN+E6dXulNeTfEiyGISoBHUR3veJuSOMmhRY2QZYuctKBi31E9n5QB8wkTpX75BVr4U/02qzqORbT1jrAzjPDM98PJI1eg6m9OwLSGn+LNMw0SErd2+WJkikFnDt5oMlYVCh+6CkHXCGXP63dK23A680TBfllhuYqrQhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DCrycjQU4LgJFbyTZ4+/SghOIqwW5LXPHvpdu20KPG4=;
 b=hKtlym/P/kkeS8XtohhdxR9xqODF+vpDVr0dsIGuIagn2MFnJ3+MUTn8dCzQf4jzMUATj73XalVP4bEWUiknlIwxsIjStIgLaz3lXgJxgSY3kL8mbJ3F9m4LZJgomyF3unLiYxqrjHWq4s5BxsSBTandFkPtAkl38KE4OPh4wCJyMtBwNcv1VpadU+feOI2e73GklPeMNhNqMuQgJkfMEvR+ctbpZhB2S0PcyhZIJlfpaN+IszuGM7FOlKUlk6IeuQU4kuY3J8ZDUaK/JZ+LBYgODNUQuprASe6jIDNNHlQd4Qsl/2fun7nX4PZUq+rq84ctAiTHvN+q3JFyXb5q5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18)
 by PH7PR11MB6608.namprd11.prod.outlook.com (2603:10b6:510:1b3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Wed, 25 Feb
 2026 13:20:18 +0000
Received: from DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c]) by DS0PR11MB8208.namprd11.prod.outlook.com
 ([fe80::ecb0:7475:84de:ca9c%5]) with mapi id 15.20.9632.017; Wed, 25 Feb 2026
 13:20:18 +0000
Message-ID: <2d64a00b-0506-4ec3-b056-b0b948926bde@intel.com>
Date: Wed, 25 Feb 2026 18:50:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpu/buddy: Introduce gpu_buddy_assert() for kunit-aware
 assertions
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Auld <matthew.auld@intel.com>
References: <20260224132506.2631528-2-sanjay.kumar.yadav@intel.com>
 <abaebf29-1459-4ae9-bc59-e46f8b7c767a@amd.com>
Content-Language: en-US
From: "Yadav, Sanjay Kumar" <sanjay.kumar.yadav@intel.com>
In-Reply-To: <abaebf29-1459-4ae9-bc59-e46f8b7c767a@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a9::14) To DS0PR11MB8208.namprd11.prod.outlook.com
 (2603:10b6:8:165::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8208:EE_|PH7PR11MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bdbc25d-a2d6-4eb0-b475-08de74709e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: PJ+icftYaW3YmAw73GIyVI4EzM/lpYv+EtT6BJA4rXl81lsL/1yJhaaX9pJiHnxggU83YFReyfNVbWtb08OkfQP915cyz3k2Xzg4MJ+ySBpldD7Nqt0XOLWLuauvZ83C5ba18coU3g4hR/onO/n63TV61ed9jNY9omKV6v4tE1Bdo43xEhRkS2GLLruT/nPKPZ4YTr/1+1u18BDKBVNCmAQPIX6ckSbHVX9wJZm9smq2QF/qX5ftYX7BBSAV6gr1jYgMNrqsDwrXRrgVpTDRCRtVak3/O1iAA/EQJITYhgqBH2/fILBEejMGY7+KbIiyjKWE6hPrV9aprmPSLlqyNPL0AZ5hzfSBQK0UzNk12l/ks0K8M2UpH21msKPYCTH2EghxJqZPyCMxvRVHvNHQXYJQAkgAeM5Mj2CSItVFAd7Y3caeyddMAxn1mixE3R/BHVGtrDgtGRaPAVP3/ekhvn3wGPo7Wg2z0llKykCc5aG3TtLpY5tUt9iNVSluoO6CL7Dn7I7plWBv3QWKZ+g/27PklzYLOuGFXxJDPxagCD3TzH0wuUBYL8AuW+ji/EB8HByArRfDUxWqKpegCAlo2eziYM/NcHK9XD5fK7LzM44sy54a2BRvpaS+tcDnQNO9XnTlottyqF7DY1XVhJs+Mnbxomj5LTGEZ7CnwHP5wdf+Q+AguHQPRIeWG1hJH2bZA6wnTYffdm2wZjC8NP2dKRwHhPPdmT9hyaWI4WnS2/o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8208.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWhBU0g1VzNhTmd5SXlmeTVROGtwSVVRV1RrVFdLeHRMZzVBVFBBVTJFaDdj?=
 =?utf-8?B?OExiVnRPbjROTW1hWklLOXlFdmdBdW9GaWJWangrY3ZDNURMeFdrL1MyNkhz?=
 =?utf-8?B?M3ZRTlhhSi9Za0IzekJJVjVXRzBHczdBejNyQ1JIclZTUUlIcTlzSDRmY0lI?=
 =?utf-8?B?KzBnWlllbDBDQ05EUHJKUGFwMVdRdjdVdDR2TzVvOHpUQVlQc3pDcC9JNGhj?=
 =?utf-8?B?RGdqNUtHYWhqeHhiUnZJOCs2bmxWMzQzblBJMnM4T25OSVZBTDhtWFdaVnJ1?=
 =?utf-8?B?QmRkTnk5TU5yWjg2TVdWSElISmRZazg5Q1dxeTd3dzJqTmk1aDB3ZUhxdkV3?=
 =?utf-8?B?cm94SXZiS1JIamF5VXBwODJDU0EvbFBEbEYyVmx5VFJVcDZsekZzdm5Fa0I1?=
 =?utf-8?B?QXo5bW84T1pJOGptOTdYMGFoQ2trNGJDa09nYmVOVTlGMXZiNGtQVWVabXNI?=
 =?utf-8?B?clZVWUVGRkg0UlVlZ2NabSt5L2RTeXlpNUlhOW9IYUtZUlVXWkVaNE1UU2Uv?=
 =?utf-8?B?RzdVaVVKUXhKQjVpM1p2MUw4NDlwb3JxSzlHSUdsNXJLdXcyTG9Gcjdha0x1?=
 =?utf-8?B?RFEyZ29jTEFKT0E4UUJSWjRyYVd6anhOc0dOYVlZR3AyZzl1WVJMbDNjMHhY?=
 =?utf-8?B?MkVzWFM4ZG9hTXpPbFEzM2dJS1lVS25memlXS0UxR1lDcWY2Zzh5UUd3REFm?=
 =?utf-8?B?aGpQVnp5TjB3cUxTOHZXWFRUb0dpWmNKRTBsNk4xMFFPQk5oOGJsVTR3czc3?=
 =?utf-8?B?UG9CYUhzSzJoaEUwY1ZOSVJ2ZkpHYkowc3hVU0tBWmdhU1o4Y1BydHIzZ1Zo?=
 =?utf-8?B?dGtld2x0ZnRjSWcxVGlGUjBFOUJES3pYdjc4Z3BueS9KYitEMzJWSXZZVDhk?=
 =?utf-8?B?TWlraDk1SmxWS01TUG5ySXJIZkZ6V0dWamNlZzZTQXVoVWNnTDJmc2EwcDBY?=
 =?utf-8?B?UzdQYkJhWDhyRzQvQlJYLy9zanI0ejN1K2RvNDNBMDMyS3Q1aXNRVzVUZzV5?=
 =?utf-8?B?RXJIbGhOTjRSWWVkWTMvUFlYUEZEL08waUlsdW82cFNkQnlITnNFVkJNTDFC?=
 =?utf-8?B?anpTaXRKN2hIY05DekdzekNzQlF6Yzd1emUzaThMWjFHWlVyUEZyOTNiVnE5?=
 =?utf-8?B?cDhFZExqYkVUMFFTYk14ZVZQY3JqZm12Rnp3Nk5MdHBra2tpMitPd1lQM2JI?=
 =?utf-8?B?VlpVS0EvTDhQMnpUeFVISUk2UEs0NG8vNnFvT1BBSXkzVmJPbnJZakh5OHJp?=
 =?utf-8?B?V3NKNmtFUklySkFKdm1qQkp6bWtMRGY2R3NmQzhrL21zSmJmdjN2clhMSnRJ?=
 =?utf-8?B?WjhMYlVmek5jYUhDbFh6bVA2RkZiQTJNYzdXZzQ2Y25XUjRxQVM0L2JyWE9I?=
 =?utf-8?B?cFJzOHVwZ1FWd1lIT1RpbUMxYVhSNDdmMjRNU2k3WEUrUnowWFM0aHNzWkhy?=
 =?utf-8?B?T0FvSk81UUJ5Vy9xZlVoZkVWTUU2NytFWWZYYjhEc0ZOTkZURUc4M2ptTVVZ?=
 =?utf-8?B?LzlyOHk4NUhZS3VkaWRpc09QUTRpNHBTUGtnWXVCYU83RSt6Tmh6Z01KK3NM?=
 =?utf-8?B?WnJ4VGtDZXZVRTQ1Qm85anpoenFqQmVwZlAwdlM3dVdYYXovamdrRHAyVy9y?=
 =?utf-8?B?V2k5RkplSmtaSVo3SnJPM0JXaFV2Zmg0WU90S1B6VDNYUk5SZ0hKNmRiSmMw?=
 =?utf-8?B?Mm9OVm1LWjY2SWpONHdKN3liNEtxZERZTWZzQ2l3MTZpbnB6OERFK0ZxT3JH?=
 =?utf-8?B?ZjY0MUN0b0JtTE9JZEFrdkh1Sm5yNmxmLzJ5cFdaVkxDa3BkdDhGM3Q3amJ6?=
 =?utf-8?B?MEpJbFRIODRlMFFsaFJrc1VHSlJldXVjQnNGYzY5OUlwL0NZNVVDRmlQL1ZE?=
 =?utf-8?B?SHllUk1IRkcreFZDOGdUNHYrL1VKbll5T1NjMEtSd2tJdFczNElvd2lkNWRx?=
 =?utf-8?B?cUVwMzdJb3FlMjVDQi9lY2E2NjR5QVVDTVhDTkMwSzhxdVdIc1RaU0RXa0x6?=
 =?utf-8?B?RjZtenB1dmpmazlqRlFyS3N3UWFwZXV4Uk9LRzRIVVFDVlNXdncvRk1ROTBX?=
 =?utf-8?B?QThBMjdpYks1clF0SmMzZXhVaTY2WXB4QUVIQzRkeHRWR3hBTHFWeitEeitq?=
 =?utf-8?B?QTNBK2YwbXJNSS9iQkFjKzJyOXVaVU9hUndUWkVHaXl5NEI3dlZndm5jOStX?=
 =?utf-8?B?R1FJckhDNEliZUNjVEkxMThWRXZid1RzY2VxbEl1L2s4K1NiZit5R3pGLy91?=
 =?utf-8?B?RjhEVWI4YUdnTVpzanU0NC9sbEg5QmpLMUREVEZJMEtDajhvdTVwRFZZcnlI?=
 =?utf-8?B?SVJOdEpQYXNIY2tYa1h5aGVwVCtWeWkxeUxCNURaQXJybVhCVjBsak5Rdk0w?=
 =?utf-8?Q?8Qm3tI+cC4ulTfjs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bdbc25d-a2d6-4eb0-b475-08de74709e88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8208.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 13:20:18.2353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T/uAbxaExTQtzXk0s4aJIQiog9hpiJoyX3PkdTZbTUZxCWNEVub5J+RD4ptYu1wOqFQ6mmpttl6G4f5OdWFmt6pBiXkwK4+SlSRzkAlPnMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6608
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sanjay.kumar.yadav@intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 77206197F95
X-Rspamd-Action: no action


On 25-02-2026 16:49, Arunpravin Paneer Selvam wrote:
> Reviewed-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>

Thanks for your prompt review, Arun!

-Sanjay

>
> On 2/24/2026 6:55 PM, Sanjay Yadav wrote:
>> Introduce gpu_buddy_assert(), a small helper that wraps WARN_ON() and,
>> when CONFIG_KUNIT is enabled, also calls kunit_fail_current_test() so
>> that any active KUnit test is marked as failed. In non-KUnit builds
>> the macro reduces to WARN_ON(), preserving existing behaviour.
>>
>> Stringify the asserted condition in the failure message to make it easy
>> to identify which assertion fired. Leave the WARN_ON() in
>> gpu_buddy_block_trim() unchanged, as it returns -EINVAL and the caller
>> already observes the failure via the return code.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Signed-off-by: Sanjay Yadav <sanjay.kumar.yadav@intel.com>
>> ---
>>   drivers/gpu/buddy.c | 36 ++++++++++++++++++++++++++++--------
>>   1 file changed, 28 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/buddy.c b/drivers/gpu/buddy.c
>> index b27761246d4b..da5a1222f46b 100644
>> --- a/drivers/gpu/buddy.c
>> +++ b/drivers/gpu/buddy.c
>> @@ -3,8 +3,7 @@
>>    * Copyright © 2021 Intel Corporation
>>    */
>>   -#include <kunit/test-bug.h>
>> -
>> +#include <linux/bug.h>
>>   #include <linux/export.h>
>>   #include <linux/kmemleak.h>
>>   #include <linux/module.h>
>> @@ -12,6 +11,28 @@
>>     #include <linux/gpu_buddy.h>
>>   +/**
>> + * gpu_buddy_assert - assert a condition in the buddy allocator
>> + * @condition: condition expected to be true
>> + *
>> + * When CONFIG_KUNIT is enabled, evaluates @condition and, if false, 
>> triggers
>> + * a WARN_ON() and also calls kunit_fail_current_test() so that any 
>> running
>> + * kunit test is properly marked as failed. The stringified 
>> condition is
>> + * included in the failure message for easy identification.
>> + *
>> + * When CONFIG_KUNIT is not enabled, this reduces to WARN_ON() so 
>> production
>> + * builds retain the same warning semantics as before.
>> + */
>> +#if IS_ENABLED(CONFIG_KUNIT)
>> +#include <kunit/test-bug.h>
>> +#define gpu_buddy_assert(condition) do { \
>> +    if (WARN_ON(!(condition)))                        \
>> +        kunit_fail_current_test("gpu_buddy_assert(" #condition 
>> ")");    \
>> +} while (0)
>> +#else
>> +#define gpu_buddy_assert(condition) WARN_ON(!(condition))
>> +#endif
>> +
>>   static struct kmem_cache *slab_blocks;
>>     static unsigned int
>> @@ -268,8 +289,8 @@ static int __force_merge(struct gpu_buddy *mm,
>>                   if (!gpu_buddy_block_is_free(buddy))
>>                       continue;
>>   -                WARN_ON(gpu_buddy_block_is_clear(block) ==
>> -                    gpu_buddy_block_is_clear(buddy));
>> + gpu_buddy_assert(gpu_buddy_block_is_clear(block) !=
>> +                         gpu_buddy_block_is_clear(buddy));
>>                     /*
>>                    * Advance to the next node when the current node 
>> is the buddy,
>> @@ -415,8 +436,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
>>           start = gpu_buddy_block_offset(mm->roots[i]);
>>           __force_merge(mm, start, start + size, order);
>>   -        if (WARN_ON(!gpu_buddy_block_is_free(mm->roots[i])))
>> -            kunit_fail_current_test("buddy_fini() root");
>> + gpu_buddy_assert(gpu_buddy_block_is_free(mm->roots[i]));
>>             gpu_block_free(mm, mm->roots[i]);
>>   @@ -424,7 +444,7 @@ void gpu_buddy_fini(struct gpu_buddy *mm)
>>           size -= root_size;
>>       }
>>   -    WARN_ON(mm->avail != mm->size);
>> +    gpu_buddy_assert(mm->avail == mm->size);
>>         for_each_free_tree(i)
>>           kfree(mm->free_trees[i]);
>> @@ -541,7 +561,7 @@ static void __gpu_buddy_free_list(struct 
>> gpu_buddy *mm,
>>   {
>>       struct gpu_buddy_block *block, *on;
>>   -    WARN_ON(mark_dirty && mark_clear);
>> +    gpu_buddy_assert(!(mark_dirty && mark_clear));
>>         list_for_each_entry_safe(block, on, objects, link) {
>>           if (mark_clear)
>
