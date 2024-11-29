Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A49DC01C
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 09:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D323510EDB9;
	Fri, 29 Nov 2024 08:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k5D9Foja";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC8E10EDBD;
 Fri, 29 Nov 2024 08:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732867235; x=1764403235;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eaDlPEpXiEXuCF92hAy3tQlJD5OyOjRMZ6an0zoiKLc=;
 b=k5D9Fojax04SsL5Dtz/jnS6H9iLs3mnAlwVCwjeTEGTSc6TtcbGvnEpQ
 adFoKJZ2BFDF7H1sSzTR/hDhXf3a38TPEp0p2Exe913WM8DhaIxYtBkLZ
 HO8fHTT/OZKQmFxciVs+rD5KWYhmDMTbnb3d93bRzCGxqBYoZRw/rehyM
 4J0906nkTgZzAWf/2+J+9TSTfkI/+cBWDJ7AdajfX9CaxlB2XgiImAe6G
 CCXjDOcoqv+P1cZtORFV0PT2eA0NZjpIMUBF6Mxe2Z/RlvOgjF0w98Mag
 wgb6CO86cSvDdQ2iUXfmqARXfMg8Z0Qo07gPdOSH92Cxq6OWmE5qwb7kg A==;
X-CSE-ConnectionGUID: od21RExwSf20ocgo9/Xodw==
X-CSE-MsgGUID: qlGfrxQ2QD27LY+LOq+6CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32466371"
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="32466371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2024 00:00:35 -0800
X-CSE-ConnectionGUID: Rly9s78rRFWD3ggZOcuTHQ==
X-CSE-MsgGUID: fUMLCRicQOO/p8Io89Sn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,194,1728975600"; d="scan'208";a="115705562"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Nov 2024 00:00:35 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 29 Nov 2024 00:00:34 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 29 Nov 2024 00:00:34 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 29 Nov 2024 00:00:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/Ufnxkc6Zz+tl2V/fPoZ6Axv3R6eAVwDkB/ULl3NPFagVmS+MhMdAaYqhCgJGTHf3BkQkE1THa9BtbsMdXBcq4c/AwosWwlgbz7D9SW0Dxt6W6C0fGO9F63Fy4MEmy7EE+gBMfY44Ymsl7jTtt3/QEdR7YcgtKj9prpEr76BRk15fvE1OOJJZkU2r+cIzxxJmSg36ztpqAPyLy3wEbJpILkwKfepW7FVnN0vyk2m86b6Gdw2AjtmNu5AjxWbuZBMQjRrIlwjiKMgQDmzv3xKS4Tv9uCeJGO038SLN1/KK1nZa/ZqvOF+hcozCNfbHh2PP4OFJyvad+kLj7NlWmk9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ma52lBYCz1il9p3eMpk598A36ZLGR11zf/TEqSPxzKo=;
 b=Q4V+NQHgxRTixOo2VZotCdAwbGjMn3M45lEKAulFObu4gwKQCA4+rGJi6dHidqqDGHt/opche/PeYRO4+byVUVrGp5r+ImN1WuWoHlfF8J/j42QiHnd/UsRMBmH9S1ifMISuKAn1TG4eZOHVw6WoJF0MSli4fE3DbjoQ1O45k8keILMhxjL7pk7Ozagv6WfPWwsc2AXxnaaNCQqgdNBT57PIH97uB8+Soa+aTDYIL/Kd7wSNq+SWoS3TG7MqukNocXJbD05E7rZiBhLX65mZgaHX6Xjh9dSvs7pG0j3Pr44l9ZEG7aN3rIAKyIdgLEz6SwP6owgkI/3GPteQojJMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW3PR11MB4633.namprd11.prod.outlook.com (2603:10b6:303:5b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.15; Fri, 29 Nov
 2024 08:00:31 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8207.010; Fri, 29 Nov 2024
 08:00:24 +0000
Message-ID: <09913faf-f70f-4deb-bc24-295796c8d0ca@intel.com>
Date: Fri, 29 Nov 2024 13:30:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/modes: Avoid divide by zero harder in
 drm_mode_vrefresh()
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, <stable@vger.kernel.org>,
 <syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com>
References: <20241129042629.18280-1-ville.syrjala@linux.intel.com>
 <20241129042629.18280-2-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241129042629.18280-2-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW3PR11MB4633:EE_
X-MS-Office365-Filtering-Correlation-Id: 66179722-c5e6-41c0-8317-08dd104be113
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UFB1TEJhb3daNXVISjgxb09nbExWWGxMRkhMeVBBZlZld21EQ0ZySFdsZGhM?=
 =?utf-8?B?Z0xNcENibjhKaHNVbURWK0tEeDVpczN6dzQ3OTdKT0wxd2pJVlltSFc1Z25Y?=
 =?utf-8?B?YWNiZW5MTWdCbFVGcGpEalFlNG1wK0Q5Y3RDQzBoRWJ6QjlIRzVSUXR0dy9S?=
 =?utf-8?B?U3cvbEZzN2pwMmF6UEh1UnU2ak5JWUZoRytPc05MeVk0VnU0VGdoK0lLRzZT?=
 =?utf-8?B?QjlwU1UrQVVMMjR5L1BrVWQvSEJITzU3TlpKWG1KVE00UU5BVjMyMUNnR2ls?=
 =?utf-8?B?L1ZzSjhBOEJyQkNNODZLM3hjenRmeXUwWHVwMTl6R3hIeFJycllXb2wxQyto?=
 =?utf-8?B?VXN0WXhmMll6cWt6U1FjeDk1OXdGRmlaOXJWTEdlSy9tem1ZWndtOEFyNllL?=
 =?utf-8?B?RTFlc3pUM0ZIUGQwUkgvdG4yV0ZjUkRLVHNEcGg4NGxpOVhHcVFGMEF1RnNm?=
 =?utf-8?B?SG9OQTJXKzNFdUtxRXdVUzRaUjgxbXZwL1ZoNmE3Yy9KUW9nYzJUODlLVmkz?=
 =?utf-8?B?R0tHNWVYaHB1YUl5RmNGY202MG54QUhnU2tCRFBScENPeDd6bUJMVkxaWUFI?=
 =?utf-8?B?a0VCZ1JzYnZLWjVpdEZMNWhnRGR6M0NRbEV0WEUxRkgzWU1EdmM3c2hIS0w1?=
 =?utf-8?B?RG9OWUs5RTFjSTZJSjlvZGt4UEh3ejMvSVhvaGxkd1lsTVRtcW1abWFPcDEx?=
 =?utf-8?B?b0RXcFBqTUNOVGhoSGpTcjM5TGRmdThFWWE0YjBkdFhHMDhVSFlQWFFkcUJP?=
 =?utf-8?B?WEJsRHVGaDZFb0hUaUZvRStZVnhDb0ZTT1YwZU8wVTA5TmwrZlluMG43Tit1?=
 =?utf-8?B?aDRMc1IvSnVqTkVYK0JjUk5zcEpQM3ZVMHJyZ2hoanFDRUhnUVRpOVRMNkdz?=
 =?utf-8?B?MGFQSDlpa1VCM0ZZOXZDMWdVeXdjY0xyL3JNcXJzQ3RpVE5YNkxQQk9SRVBU?=
 =?utf-8?B?K0kwek9vc0kwVEdLU1NDeDh1eW5mUjQ3dTk3OTFxU2hjZFFVSW1WSFZpM3B1?=
 =?utf-8?B?MThoMm8ycm5aV3VTSVVPaEZnYVY2bjU2NHdXMzcybUtKc2ZvSngrc2dGUmdh?=
 =?utf-8?B?R3dmckozYzUxYjF0anJjWEQvclVNT2JtbWxDL0Q4VGg3WTFDVDFxa3ZoR1pt?=
 =?utf-8?B?bk5tamxCOXpFN2E5eUhuWHg5R1ExQUtqZzRKR0xGSFdvYlRjNXdqcG1MME5H?=
 =?utf-8?B?eGgvaE1KLzZ6MU9tdUdJcmZvKzJGV3docjNVK3pJTkFNWGR2WW1XbGZwVUNw?=
 =?utf-8?B?cEtvR1VYZ3pXdk01aTkya2cvQ2FxZmExU0tqRzE1VVU5REJjcnZxanNSK1lR?=
 =?utf-8?B?MHV6UFJEWCsvbjA2dkpKclZiZmtNVGxIWHl4ZEYyVEc2SVNZTUNONDdwRTIy?=
 =?utf-8?B?aHVwaytHYno0dk1ncmZUNUw5MC9LcFlsVDJiMUxSRkUxcnFsdVM2OWN3U1k5?=
 =?utf-8?B?VzM3UkFQaWd5eFNSQUxBZ2Y0Q2dvaVByZzBLT2tHZ2FpL1JoN0ZZZXUzOHNa?=
 =?utf-8?B?cWRvSnA2akFZV2thUDIzVWY1UzFnZXNaTDdvQ3hkRkdnZ2tOaDAxQ2lWS3Ja?=
 =?utf-8?B?N2N4M1lCZklsOG5iSzFHVVdEWStJUU5NRy9HSmRQdzFlMEFyaHF4c1BtYWp0?=
 =?utf-8?B?eFd0SUpHSHp5UnJISDgwaC9lOFZpWTF1Qy9YYU8xbkZoWVN6N3FiYnFlcE1R?=
 =?utf-8?B?eWRFMnJZMmx0WW91RFdKSXhQVk84MXhOY3JXcnZxWlZvREZYMUpwcFVmOW9t?=
 =?utf-8?Q?txq2Vki5kdhbvdylBM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmJDU2VSUG1vcGtRMURCZ0t5RlFmdmxhcUIzam91RlcwMjBJcEN5QUs5YWJo?=
 =?utf-8?B?aTFqMVdLRmJKaHhISzQwczRCZHdhcVRvdkM5RW5peXcvNnV2cVc0d0RoeDA5?=
 =?utf-8?B?bnA3bjlvellUakZtMDRXdmtsNGhOSXlYTjR1L3c3alFuek5JMkl2VE5nLy9s?=
 =?utf-8?B?eGpYaTJmZmo0VW9oOWg5emJpUHVueHpNUzI5cUg5aytYOUdlVDVlSGlQZnJ3?=
 =?utf-8?B?aFE2NENyWUg2bjl3SGRnNkdQRGp0TWVtOVB0QTlmZW5mbWZmQzR0cWw1NnRn?=
 =?utf-8?B?cmJPQVRBSFBNc0dSMWFOTXRJSEZRWThocHNyOEVLNE1id2tOTTUvT2ViK0lX?=
 =?utf-8?B?Tmw2bFhqMUYrdW16VHpCWHlQZjdVa0RHbUg3bHRPZEhxR1FmQ2VpNERmMnZJ?=
 =?utf-8?B?aTFhOUJjNWNIZU0xTmdTeUw3Tlh1cmt1ZFFpaTNMbDVqSW83OEVJYnZnOEVz?=
 =?utf-8?B?R203Z2E1V25sVjFIdUVUc1VJNVVVRHpJM2JzWEN3RVA5elpWcHNBdm5MQUF3?=
 =?utf-8?B?czRRQmtDTnVqUDVzczdMbm1BdlRiODJQYkhTZTMwbUh1KzBtdXhIcUlUUEty?=
 =?utf-8?B?eUhxaWZVNGkzUDlWNG01aFd1aXg5TzVQQkV5QXl6a1JsVi9sWXN4VmhGcTNa?=
 =?utf-8?B?SXFZV2hVeDRZS2kxUmc0WEd5UTNEY21wMUNCejZNWk9uV0s1QUEwbVp1b2Zy?=
 =?utf-8?B?SGtiUHFCazZ5OTB2SG10TzRQSWlqUU5WdWQzRnpPblZYTk82cEhEczRLTUhK?=
 =?utf-8?B?U1psdUhsUkNDeWYxTW0zL1E0VHMzL2FCWUs2alZ4cVRpc2w4K1pDTHhkNHI0?=
 =?utf-8?B?OG5LODQ3VFptNWNTR241RGNSWnkwek9ocUVXWmcydVR0K3hIK2tNRWhpeHNO?=
 =?utf-8?B?R2grSXFtbHErMUVCb3NRbzRobjdVSlBkNFpRbXl6N3BOM3VtZzRFQWhBVUtj?=
 =?utf-8?B?ZmN0S3R2MUFreWt2eVYxd2h1OFN6OFFjTUQ3bnNsaHkrN3pBZjVpVHdmYm9O?=
 =?utf-8?B?LzZmQkRZVkszbStOa21MRXBlQXBLQlZQeVZzS0V0U1F4ZzZSNm8zb3JsOWw5?=
 =?utf-8?B?clo3UzdQWnFjaVpXUnJKY3d4dG9NazdZUTNmdVFSS0VsaFZCdlFzbmk1Z3dO?=
 =?utf-8?B?b1lpMDBSMDlmd3UxaHAvN0RNd3YzRGVFNnhzQ0xyRk5XTE1zZ0ltWStEWjg2?=
 =?utf-8?B?VmZTbVpIMHZneEVBVEl4ZHRXY0dPK2VvK01qVWlJS0pDbERqV0FLb1l3cDlr?=
 =?utf-8?B?T2RqSGQvTDhVRGVRUHVvd3RHbDdKSVJxajl3MmtrT25tdTJCSE9obCs2ZWtM?=
 =?utf-8?B?V0tWNW5Qa0lxV0JDM3pMSC90VUFrOFowUldYU3RwNWRFKzkya2VQV0tZK212?=
 =?utf-8?B?em9DUDJHZVF2UExyNStQdGN2eU1XUlZodTdFOFYrVWdBZDgrZmIzOWRnOVlP?=
 =?utf-8?B?NkNnRGs5UStBL2s2bkw3aHdnUFYyOU1RU21xTGFFZkIxajVrb1R1dkppUDhY?=
 =?utf-8?B?U2tGaGpJTXlIVCswdG9ZbnB1c25hY0lMd1F6aGFLTDdLZ09OamlHajgxOVBx?=
 =?utf-8?B?dTIrRXN5TGl3NFR0V212WGJYZ3k1VGJKQjU1SHc2TTQzME5sM2l2YmMyOENB?=
 =?utf-8?B?NTB5TTdQUVJlbFZ1RWo4amREbUs3dWZtUVRwc3NET2gyN1g1bm1Ic2Q1cjBF?=
 =?utf-8?B?SmN1eGJCWG1VblBVRWtFVWRhcVZZbGcyYVRnVnlNMzlBODRNRzcrTzZ6NU9a?=
 =?utf-8?B?aVJQei94enA2eHVZWVcrVlFZRVFySGJPRzlmRi9pbjRCV2NYcEc0Vnc3OGMv?=
 =?utf-8?B?cXN0c0V6RTJKOUNOUjNkNlU0R05iTFVoTzBiNWVxRVlDdGw3MHhjUmtsb3gz?=
 =?utf-8?B?ZTR0TkVyL1BoTHFicGliTXlxUzhjSGRRTE9Hc09jTDJ1YUpSMmdHbTVMbWwv?=
 =?utf-8?B?RWFtMTZzajBKbkxVd1lpeSt4RUhWRHI0bHJxc0ZFaDJMZUVpZkxKMUp2WVdU?=
 =?utf-8?B?K09MZ1dSU1AzL01OTkVuSHVDU2ZHTzdsNE1TSUV6TzVlbm1uU0hYSnJmZUlx?=
 =?utf-8?B?c2JXOUhiVDIxZktCWkZFOGtsU1dtcUV1ZFFDa0FCMkNHaWJWZi9ITG5TSWdB?=
 =?utf-8?B?N0pFUWJwRkM1UnZkQjFuL1kwRDBDNUs3bFM0WVNxd2hXRHM4Z3BPVFZ4dW90?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 66179722-c5e6-41c0-8317-08dd104be113
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2024 08:00:24.2833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7pZwA2mBpz24LKuK26Sc6s/EkoeOmFRGV3TSDW9GcgpuNzFLGK7VQPqmpYlxcdurXdy7YSsdLVIul6CF6ySsY3VSFY34o6zfjuYuY0N2dZs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4633
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


On 11/29/2024 9:56 AM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> drm_mode_vrefresh() is trying to avoid divide by zero
> by checking whether htotal or vtotal are zero. But we may
> still end up with a div-by-zero of vtotal*htotal*...
>
> Cc: stable@vger.kernel.org
> Reported-by: syzbot+622bba18029bcde672e1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=622bba18029bcde672e1
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/drm_modes.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
> index 6ba167a33461..71573b85d924 100644
> --- a/drivers/gpu/drm/drm_modes.c
> +++ b/drivers/gpu/drm/drm_modes.c
> @@ -1287,14 +1287,11 @@ EXPORT_SYMBOL(drm_mode_set_name);
>    */
>   int drm_mode_vrefresh(const struct drm_display_mode *mode)
>   {
> -	unsigned int num, den;
> +	unsigned int num = 1, den = 1;
>   
>   	if (mode->htotal == 0 || mode->vtotal == 0)
>   		return 0;
>   
> -	num = mode->clock;
> -	den = mode->htotal * mode->vtotal;
> -
>   	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
>   		num *= 2;
>   	if (mode->flags & DRM_MODE_FLAG_DBLSCAN)
> @@ -1302,6 +1299,12 @@ int drm_mode_vrefresh(const struct drm_display_mode *mode)
>   	if (mode->vscan > 1)
>   		den *= mode->vscan;
>   
> +	if (check_mul_overflow(mode->clock, num, &num))
> +		return 0;
> +
> +	if (check_mul_overflow(mode->htotal * mode->vtotal, den, &den))

Can mode->htotal * mode->vtotal result in overflow?

and we should add:

if (check_mul_overflow(mode->htotal, mode->vtotal, &prod))
	return 0;

Regards,

Ankit

> +		return 0;
> +
>   	return DIV_ROUND_CLOSEST_ULL(mul_u32_u32(num, 1000), den);
>   }
>   EXPORT_SYMBOL(drm_mode_vrefresh);
