Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88AB8FF6B1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 23:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F43410E109;
	Thu,  6 Jun 2024 21:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ev2LnrSI";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EF810E109;
 Thu,  6 Jun 2024 21:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717709139; x=1749245139;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+gLgIQ5Jp/Oz5iBolfp/zcpmj/D4fYFxAvc67lDYqRg=;
 b=Ev2LnrSIitrb0TixDgvMbqyv+gNE65pCw7V1xs9MUfh7evFnHrA/bSon
 qUzUAA10dgdcBXWCu7mELON0EeU5mxLhkC9du6djFL0XoZgpEQ/xi7cJi
 M3A1PgPXePSOeCwxnDHwQPbrU/v1MrRkKf/2pik2YrHum4hneuFNpWPAc
 hBwCaEuV3WcVPnyDVR9WZ3HMZF6EFKvKRWGC0S9s/Yd4DkLBul8w8fMMM
 x4qDbZi1fZKj2dd9thtJji3WFeN/YtBD+YR2IbB0Ze5FqH5nUPAjITdtP
 t0JiYv0/g+kQdai9BKxesIWuVMyife4PqXDAGLyTxvBt694eth36xjnSP g==;
X-CSE-ConnectionGUID: WS9sZXCEQDWEid41KtL4jA==
X-CSE-MsgGUID: 26OCmqmUTXCKXISxwfv5TQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25512488"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="25512488"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 14:25:39 -0700
X-CSE-ConnectionGUID: ATOzK2AjTpWsVbn+rhpF1g==
X-CSE-MsgGUID: 8NxX+4dTSNqSL3Z/wmsnAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; d="scan'208";a="75581487"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 14:25:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 14:25:38 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 14:25:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 14:25:38 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 14:25:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTtVYpY8sR8s7ie/Bpw9hvGllXQyXZ7EO4fgBovJ3ufXHsRG0rB0GkY9h75iQQ6k1Q4CRDvD6wOupDJoR4nB95NtLwyS2g6MGvDJ3oq6JNMKkvEHzSBfHHabhDvQAeSbbYYVdqcY/hnH5qASnV6pwagcseB+Z9JR+Y+jvh1MaYqWOVeq+nctZorqqRDBl3Kwjljq6WZMQdvddERQ4EDr5PI4OovEqMVBEhhh2yruEm8Wr9b/UUVZldHzOPW+WSSCT/4tqyL8Zzy0KCzs3C9DdrlzdcJxl0jrXcNR40y9IgjK699WfMVwqbctoYd02WrsapCB6PKDdy0DeVCl8guFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2McsWDMJXxaiIxSn0OV6jKqO3cre1tKxVUCtDj8BxQ=;
 b=AAvYPBPYs0G29LEA7P5iVOqHVGQ+0yrD91cGXq8CERZYv+xIqgmPZAGghiLs8JcgaLQQwJZT1qSNgU1E2rKMR4W4bT0RnRdiwsQbplfoKC+BKcxuXbR8DvnHWULqH4tJsp0I7V2h3Xdx/9CkWxrrSLr5/c4pUALdquPeRtcUQjoBvcAYHM9UbaUJzVxXhmpk+TMld8ftnTHJXQRMFYxmqMG5YJS5jJUfQCC03IQWBw0U4AtAi3JNieuTgMq1/Ctcw8IDJgVMq0l+x9QPYviqkJecmlyWKgKb0Pi7LMtOLQvtGTx7391JSIANvJsPtQbovH37uY20fXqzdm25azWr5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SA1PR11MB6758.namprd11.prod.outlook.com (2603:10b6:806:25d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Thu, 6 Jun
 2024 21:25:35 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::2ca4:29ad:f305:6fc0%6]) with mapi id 15.20.7633.033; Thu, 6 Jun 2024
 21:25:34 +0000
Message-ID: <a17a717b-f2c2-4b5e-8029-e844fb3bbbb7@intel.com>
Date: Thu, 6 Jun 2024 14:25:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/guc: Enable w/a 16021333562 for DG2, MTL and
 ARL
To: <John.C.Harrison@Intel.com>, <Intel-GFX@Lists.FreeDesktop.Org>
CC: <DRI-Devel@Lists.FreeDesktop.Org>
References: <20240528230515.479395-1-John.C.Harrison@Intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20240528230515.479395-1-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0007.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::12) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SA1PR11MB6758:EE_
X-MS-Office365-Filtering-Correlation-Id: 1009914d-738f-4d40-e0dd-08dc866f3360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlVNbnU3NWNtWUxwS0ozM0svQzVJM3BjSko4aVpqaFR3dHozNnJhQU81N1FJ?=
 =?utf-8?B?dDUreXJDREM4ellXdGxZQ3ptTVRpU0pQOUh1MXpieUQwbXZhUUp0WVppUzZJ?=
 =?utf-8?B?OEpJVjNITDhMSnFhc2ZXSExJS0VtR3JPUmI4V0ZWZkg5OUpqT1dUMGRXK0Q2?=
 =?utf-8?B?TFJiMFpiWVNzaHQvRFQ3L3E1RGlobmhBM3ZsbEpEOVJ1d1dDZmVjTUpUZWV2?=
 =?utf-8?B?YWprSS90TjB0ZTdyMnZoeXNOVGtvczNmZWVhYTYwYnRKZHQ5aVlOQjBic3RB?=
 =?utf-8?B?S1p5TVAwMG1PTjNZb1BMOVNzTXRWTGNWYXJ3TktWck53OTZ5Si9YQ0VOeGJN?=
 =?utf-8?B?VE9wOHdYQi9RUHY1Z2Z3VlpxNWxzZzU2a0VleWc3NXJnQ0hBVmdMK3B5OWlT?=
 =?utf-8?B?UmdZOVpFYVBJV0VUT2VyTHVldnJoSjZSdXZIanlPNmtKeHUxWHI5NWc4L291?=
 =?utf-8?B?bytrejlidGNMc3poL20xc2RTT0hPeHU0MUtQNnBRa08rRzl0aGRwbDFmZUN3?=
 =?utf-8?B?NitQU2NsK0UydktWWTVhSVZseXRpTXJqeUxEcURTbGg5ejZzZ0MwQUZuMUVE?=
 =?utf-8?B?WU9rVW5KR2F5L2s1L0w3OVZsZ3dGRzRGTCs2RW80bzN1MnZoeVMzTzRDVUpV?=
 =?utf-8?B?V0lGVXV2MmdoMUFibzFoa1h0QzBlRStpM2E4RDVKdENSWUhCSEQ1RlRCb0sy?=
 =?utf-8?B?NVNId3ZXMEhQTTJ2SUFZMzI4Q2Y1UWg3MkhJZHlhTTkvQ1Z0UUd2by82THVJ?=
 =?utf-8?B?VmIyWTc0UWlDa3BheE9BeVpsRG1XRjJDRE1NbmY3OEpjbFp3WnpQUzdpZGxO?=
 =?utf-8?B?THYyTGZ2RStUZGJYMlEwZE1VS2pzUnVybElpam9oSG5pTXM0Nll3VXd0dnho?=
 =?utf-8?B?QVRlS0pLV2piZW1ibnRCTXpjNGdxOUFqK2UvK0MrVTNFWXJDY3FxaWN6cGF4?=
 =?utf-8?B?UUJNWkJUTkJpNDV1QXZocDYyNEVtN0RleHFoTThSWFhOaEtJREszU0J0ZjFE?=
 =?utf-8?B?ZTQwUzlMMHpIMEJvTVVNQkNYaTdBckV4SnRhMlVDVkhjSFFoVEhwS2tyeU9m?=
 =?utf-8?B?UDZDSnVuK1pOc1BpbHRyVmNLYzNkc0tPQVhZdS85MmkzL3dvajhwRjJvbmtk?=
 =?utf-8?B?aFZMeTNwUTBIUUE2YUE1WkpXWGRoYnBqbDU4cW1iQVJaYWR3V2Rpd0prNE16?=
 =?utf-8?B?WVlnWjFmVGdpaUZPaTVyemZiOGhaMGJVU3UzZkthaGR2UG5HQ285akJuL0NB?=
 =?utf-8?B?aHBMNTgwZ3lHTFJSNFBSaTk4YnA0WnpuUDBJVlBvUGQ2L2lMOEZMbjRtdkZv?=
 =?utf-8?B?Vm5NdjVXTG1Ud29zM05RalEyNWxVYkI2MldEYzRPaGw0NlVBbHMyR2RkYVZ0?=
 =?utf-8?B?NWRUWkptVS9LVEt0K3FPRnNzRjYyQU9PanpjeDVBQkxIcTJnNGJGRGhhNTUz?=
 =?utf-8?B?QlJpYXl4dEs3bEt2UjVRcVRuK2lBczYvci9EYStTSDZvNmJLTmxsTGZmUTdi?=
 =?utf-8?B?WTJhUXBMUjdpZm4zaFpVbmp2UW9ndnZkOGxqZkl6aFRoV0hycFZNTDdEbFVB?=
 =?utf-8?B?aW0rZnRTK1NzdDhMMElYM0dMSkd1VWoycnY3c1ovYytrTEtwa3hXVEdvbUhw?=
 =?utf-8?B?RU9GMjZid2VhNXhySG10aVl4RUlZekZMNXNuUnVHOVJZNzI2TGQ5dnVoVEF3?=
 =?utf-8?B?V1VPVWdzaWRWNU9jcXpPOCs0TU56cUl2cXY1aDBTdWpWRHZwSkhkbnlIWDRu?=
 =?utf-8?Q?7KcdXruhohfNIHHeM9WWq4njANOBGMArs1owOON?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3pTN1ZScmxoaWFRK05oZUk5ODNOZ010Sno0NkdvZHlVUFUraHFRNUpGRitw?=
 =?utf-8?B?ZzNCbE9nc2hRb3BuVGlWeG9NdWRVT1RJUFRCbHNLbmpRbVZ6T3kvZ2c3dzd2?=
 =?utf-8?B?WDl4N2huYm9vRGxWcXdzdytVaklVNFk2aXkwbUZOeG81WGc2amYzME9pZ1Ri?=
 =?utf-8?B?WEIyMjhxdStPaEFqZHcxQ00wZEFEZENTYUs5elhQQlIxTndYcjc2dWV1cmZK?=
 =?utf-8?B?SU0rSEFERHFxQVJ5U0VuY3VZT1BHaTcrOGlZS0MyblpTcWc1MWJYNmVTVmd6?=
 =?utf-8?B?QXg1bm9vdXA5YWlmMzNMalh6bXF6emZJSVBZcERVd1FvUjVrVStNaS9jU2lC?=
 =?utf-8?B?dG1OOXJBMmNOVS9ZektoYzNHRVVpb0FHdGc5NHZ5aGZ2dm1KMFFtUFE5b3kr?=
 =?utf-8?B?cWhPb25qZnp5dkJpRXZtNXBiQ3R5WFlCQkcydkZVK3h4b05NWjJnbEhUVnNT?=
 =?utf-8?B?KzBHT0ZaQ0RPbmo5elpoQmsxZmUzRUJkTWg2Z0lsNVZtL0s1cHNOaUZUTzlO?=
 =?utf-8?B?U2VkaXdEUndYSHJ5UFdFLzJpSW9IRkUreWxTRFI3cE5aY3BWL0dRTHJNZWZK?=
 =?utf-8?B?dG1OTFJFSWdScXBLL3FhNE5WUlh5czlTWEcxcU55VGRSY2RXZjBQSTBnTTI5?=
 =?utf-8?B?QUpBYkxmS09FMy9FeUE3MWVCMm5iVWFvQnlpMmtMdE5MMjhyRWNuaU9ibUtM?=
 =?utf-8?B?cDdPblk5SWoxVmpWWFNheSt5SWZhMEhjR0prY1dJUDNhTnlRYzZMRUQ4ZnVH?=
 =?utf-8?B?WHQ4NkwzU05tZ0NBQTQ2c1RxY29JS2c0UHVuK2VzaUJBSFQ0S08ySURHQXZI?=
 =?utf-8?B?dkdhRDhaUTVtdFVMcmZQc2Q5SGZENmdndmMwbTNwRk9rOGtKazh6TFh6Ry8z?=
 =?utf-8?B?WXpxaWpQYUhkbk9nLzJ0bGlnQ3B2SlYvTXh3SjBsTGE1alpDVGJzZFM4SzJi?=
 =?utf-8?B?NHZIRjVYT21hMExCaGJrWGlXK3BLL1o2UzE3b2JSM2pwekZjRTBuNllWTnNh?=
 =?utf-8?B?bzc5SHJPTnNMdlA0aTY4OW5KT1pUdUNiSVJGRGV1VXpSS2lMTlhOdWxWYnY5?=
 =?utf-8?B?Mm5GYnpRbng0Q1ZnanRhUWVUVmRiSDZGQ05odjgvUGNYL3V6SkZEYnhDMGlP?=
 =?utf-8?B?b3hMdU5PSkNZOGlBb1pwQjFmKzJMMm16NUtNQVpMZWJDN3VET2FYNnZNL3VM?=
 =?utf-8?B?bnRzV0dPRERBNm1BT0FJK2tlMzZqWm5RcWVsTkhlM0dLTldqWlZVNTVzNnFQ?=
 =?utf-8?B?ZThDZGlHMzBPNlNYU3ZRWnJIRHV6bnhwOVFpQjlMME4rWDdpQXp4Snl0MWs2?=
 =?utf-8?B?bDNXZFVNcUlZbm04Z2RzWUhTMjhDU1VUZ3ZCNzcvZDl2MkpRVjgyb3Z2UEVs?=
 =?utf-8?B?bGdCVFNLKzR2UWpERUlZTW15b3hyNkhoOVU3dElHYkxyUEZMYVk4emU2Tzh2?=
 =?utf-8?B?S2MxNTUrd2pBdFJnRVBxamxmUkpiSGpyRnFVaHQ1ZFFoZlNKdW1TZkxlZjRI?=
 =?utf-8?B?bThlK2NrVWFTaW95dnRUU1hWWGZhbCt5Z3lqbnhjUmJPNVVTcmozYjR6ODFR?=
 =?utf-8?B?MzI1WUl4VC9ud3pwdnFKdjNGOTFGQ012SXZxWm1YK08zU05GMVpISWVVY0Fy?=
 =?utf-8?B?TjlLZkxsMEJxZTVpZVlvZjJ5RCt6NGttVTR3VGdvMEkvLzYrdlkzNHFvcFAy?=
 =?utf-8?B?bGtCa3FZTjNIK05hOHlBeTU0NTAzUC9yY1JQSk5iQlhEck56OXZJanE3eUIz?=
 =?utf-8?B?U0VBZkEwditDSWlKalo0WVR1QmJlMUtRbzdETzJ2UFRiRnNCU0tONzVrS2wr?=
 =?utf-8?B?OU5aZDVydnpiN1BWQWdxQTBrakFnbVl5RUxjbW9oeEoxNXJJaXFhUWs2QWJR?=
 =?utf-8?B?TUtCZzNXTitTclVST3VqdCtyZFQ0MWdlWVNVMEhjclZnUXJtd3REWENyUnJK?=
 =?utf-8?B?VGNGeWlEdUk0SitQU3NuUThpa20wekRGUVh5Q1N6SGczM09LSWhsY081NmJj?=
 =?utf-8?B?ZWxJN3BVcU1hN2VkaHhlM3QzeDF4NkwxTjhPd0IrTTJRdWRpM3NvT0RqTFJ3?=
 =?utf-8?B?aHo5a3JaT1JxWVh1ZHNBY2NORENhOWpSaFdCSmExMnFTMW1WbDhJZ3gwSk5J?=
 =?utf-8?B?NTFvZ1ZITzNjVzNZZkFJK1FTQ0t6OVcxbXZHMlR5TVk1T0E5Y0VjZXFlQmpi?=
 =?utf-8?B?YXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1009914d-738f-4d40-e0dd-08dc866f3360
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 21:25:34.3491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ny6jJb1OUhlPD4uwrUf6m/H2PqwS9SjqQjsF2mgs0SNUD4pOxy65bEbwL0AR6pPm7NInuLDUmkipTRrq7r8JNOGalO5DVRE6L19b0oWNbPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6758
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

On 5/28/2024 4:05 PM, John.C.Harrison@Intel.com wrote:
> Enable another workaround that is implemented inside the GuC.
> 
> v2: Use the correct Gen12 w/a id rather than the Xe version (review
> feedback from Matthew R) also extend to include ARL.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
