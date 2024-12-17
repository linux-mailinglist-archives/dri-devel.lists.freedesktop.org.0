Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A999F4B99
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD5C10E966;
	Tue, 17 Dec 2024 13:09:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mzhEKDc5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C4110E40D;
 Tue, 17 Dec 2024 13:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734440993; x=1765976993;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4Fh1I6WMy3pA9xuqBedI2K6EneYRheiAL5m+3bUGKFc=;
 b=mzhEKDc5tmzeHpgs1jiOZ9QYsFmXgFvmV+MejTLeGGiaCgE9iCD574Am
 v0FqxifOm8AOGCOAPlRewIOnAwtp5ZjZ922ZNNYshFqyF7JwYF3w/f84J
 KGO7BWIZWkjOnoRpXg3TSuS4uOSR5m3qtr8ASl7EEEgRCVKUVFgF77Vai
 +IQ1gvG+z9CkOgJ+h4NmElu8c0/33a6q0mP97zxA7h3TchLnMWf9kiYeg
 Q2xng8dQ3SVsyEg9PGUPF8Q7G4vRYd7OSQ7Rrem6P3VVOhRQmSmswuXRJ
 mLV+LhlKkNqsDVJe0fkRHopFp7JSTQJLeaNBA5/mcn52/GXhfNQQo2ah7 A==;
X-CSE-ConnectionGUID: HG9dAbyVQf+hjjll0/uKgA==
X-CSE-MsgGUID: SP7XjNMDS1WdHkVvfqXGYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45558645"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; d="scan'208";a="45558645"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 05:09:52 -0800
X-CSE-ConnectionGUID: atWruN40SaWUgWIOuQJntQ==
X-CSE-MsgGUID: wpk8JEqYSyqK0oz18SCUyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134872757"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 05:09:52 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 05:09:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 05:09:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 05:09:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cjxh9BJjKdF1WeSu0l0rYSsjpkDZj0q06iP8AoOdHQ8/E60KVBoECv6q4AMLh/wODVHIaSFyklT7yVIWoBaUPjTCVvk0nL1xOmJ1D0dv463h9RH3Na2nljTmRXw6jKHJLZrcU3K+8+sGq9sFFsAnlJDNK/m0qDpWoZwBLF9f0IIJdFL4x9b04U4HdOVRqS8JjH863w/Vpu+2Jd7W6rnGh8ljWZB4O7ShAlaWfzo0768qnh2ksQwSiSmluruL6UrhEHGlPNWfB1MzxtBpB4hG+/W3bsCgeSkNa0Gsi6USVPYBXcJ1bBmVNWmJ4vAbenWhdlmVUrKoQIelbyT0xhPePg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyD9dQhHh6kSBkBNZ6DqS/zTbQkDT0o3UiNIDKS+cRY=;
 b=iOcYrQ7zAfMUPKrJREUPeUExDfFm6mbZUmWBViJ7m0BDsgqlPzRr76z7KsR3CgKHyNAek3eDP6nKh0k3tn2Nvx7FBkm/ip0oKISbwF2EPGk1SP9q9MTmsPArqR4LTvUFb9smm0hBw9z3QRwqtn5wFQzcCckCbmlNHv8j2QA+p7/EmlVZonq9L3HbIr7a4R5r//s5ZB2qMBjhASrrr5pnpdZBkPbxwIcawODdv5rkjxTq3ZVuoQdltZAW9/3WLylV+y9/KM0flRsWO8dcLgqjGM4sqVoA2Tc79R0v71shiC+/dFb98E/XDdtX1kk6c2M+Ks42wjiLajyvJOntXT5O6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 13:09:34 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 13:09:34 +0000
Message-ID: <8f5e6c4c-f9ca-4303-9e44-16df0aa8cef9@intel.com>
Date: Tue, 17 Dec 2024 18:39:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/cx0_phy: Fix C10 pll programming sequence
To: Suraj Kandpal <suraj.kandpal@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <uma.shankar@intel.com>, <arun.r.murthy@intel.com>, <jani.nikula@intel.com>
References: <20241216181554.2861381-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241216181554.2861381-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0094.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MN2PR11MB4760:EE_
X-MS-Office365-Filtering-Correlation-Id: 18cf36bd-d5f2-4a54-34ea-08dd1e9c0c8b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RE03azBMS096Y2RNNkVUcW0rbFE4SzYyVzgvZmxZSVlpVlh6YVF5Rjh0RHpK?=
 =?utf-8?B?YmZKN2hhakY0eWdJanJsbmt0VXVDdWVSNXFRZkNkaEs0V2VSVy9iZytxYzd5?=
 =?utf-8?B?aG12dGk3TUxHYTdzaDhPVlc0eFVSRlhNSjJsSDBCVmlzcGNvSFpDOXh4RGxC?=
 =?utf-8?B?L3gwSGF4amZzUEs0dXYzTTlLVEh3UVF2VmwzT21NVDB1TVpyekZnKzBLcnFJ?=
 =?utf-8?B?djdHVG4xLy9kOXRWWGk0dWhlVXBTQjVOeTBaSUNXVHQzeUIzait5ZC9iSFRu?=
 =?utf-8?B?cHIvakUvajVrS0dHT2I0OGdVbFArZHhOR0J2ZHk0d1NlSnVFRzBYTVE0ZjAv?=
 =?utf-8?B?M3FkdHB0Ym9pclF4K09PeE04NzZSZDVrSGY4WXNaZFgzak9TWkhRMWh6NHln?=
 =?utf-8?B?SElxMWZ0Vk9zSnhCZVJDdTVHbzFRblAzOG9TYWVqUUxNekJUZjh5WmFpY2pv?=
 =?utf-8?B?L1ZoZXVxSkVIc29VU3ZhR2RuWWY4Qk5YV2tBb2E4ZzBqaGJhVGllSnNORndM?=
 =?utf-8?B?V3dOYWZFSWxYVW5WSVpVWmczQmU3Y2x0elZJTlpiSzZVRVZ6SldJdzBmUXdF?=
 =?utf-8?B?OUZzaDJ5RlZRaHBGbG9CZXpTS2VZQWJ3bEg4enpxYTlqQk41OU41OXh1QVFV?=
 =?utf-8?B?UTNrZDJ4VlFyZU8zVTFvb1I3U2pabWRSamRKM2MyZTVsM01IclA1UUEwNHlO?=
 =?utf-8?B?ekUyKzQ3NDFTR2V3Q0Q1eUtUK3ZhNUg4TUtDQ002dDVZYmdHY09DYXo1UE1t?=
 =?utf-8?B?eVNoL2hYR2lXbXNjdnFOYVpZSm5uWVJTRFFtOHc0RGpLQTJRYWhpT2JudzVW?=
 =?utf-8?B?NDUrRWMvZUVnenRsTy9xYmowOTZNZTlvTmpPYnpEWUc1a3A1MVcyUEgwZ25m?=
 =?utf-8?B?YnBJME5icURnOHBmZm5QZ042WlpndVFYUS9qanhQaXdSalJHS2xoanFqUmdo?=
 =?utf-8?B?TlNzSStVZGxzNUd4TnpqMGZnL0xHVzFiN2FhOWIxSFRIaHRsRXpXSDY2NGNI?=
 =?utf-8?B?SWtqbEFEZmlyaVRSVGp6UWdNL1Q5VEVwaHZPU0wzd2ZJZFl4TFc4RVRUdFpk?=
 =?utf-8?B?aWE3bjFFSXJ4ZzJoUitFQ1lLcXUwV2dqaWRqSTJTWWNjRWIyeVYydXI4WldP?=
 =?utf-8?B?Sk1RQVBvZUR5VHJ4aU5xWWRoU2ZkemFxMnljNVZ0MWVqMUk4eFNxRzNrcUVQ?=
 =?utf-8?B?UHR1WHg1bERDbkhFM3RIUWNtYWE2ZHhQdFBUVXZoT0ZCcGgrUGsreFZYZkRu?=
 =?utf-8?B?TkR2RkdoWnFrS0xNd1dHU01oT0V1RVBQVGltenhPVS8yNC8wNitXTktoc0Nk?=
 =?utf-8?B?R2habFpKRVQ5SFRnSFVLNmY1ZmxkV0hYYWE1L2k5SC9WUEV1VmdHUkZjaWRE?=
 =?utf-8?B?OGtLSk9ZeTRUaWhDUkUrbEpsV0VDZlkyRFRCOUN4cDdPSXVuVGZpbVdBWHRF?=
 =?utf-8?B?VGo0dUZjN2dJd1pKSENBM1IyVUtlTXRTYjlaRW01aFFYb2xZMmRCZ3E4R2dw?=
 =?utf-8?B?Y1YvWmlVcmlpSWlCc0VCdmlhTlhmckFGS0NsSkZJZ3NwZkx4V3o2N0FMcTdR?=
 =?utf-8?B?RjhoeFhQM20ybFFZOG1jR04vbjJoNkxmV1N6MkR1NnR1K3ZJOTNYTXpXVzUv?=
 =?utf-8?B?UUY0aFRCUXRsSFV6ZGRUS0I3MzVEYlpwd08vY1p3S0tWaGNSNXViTzFJY0Vm?=
 =?utf-8?B?NE41Z2lvelJBd1VJaTgxSnU1UDcxWWszcFhDeC9LODBrNmNSTTFRTU9Gc1Jo?=
 =?utf-8?B?RmJCcjZJdDVMYUxBMjVlb0V4SVlQUTVDcytmblpjcTlEUmJ2VVNDVTN4L2FP?=
 =?utf-8?B?bkx1OW9FOHRmR29pNmRhQ0xnbWtVK29LK1hqQ0hoUkdlcXFXQ0o3c2tIRnJS?=
 =?utf-8?Q?l6ZLlomSL8mMe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjdibjBpcFNkWVN4YVluY0xYOVNxTVdYOXVaZmhKRFVTRjk2RVhIMGpLb1l6?=
 =?utf-8?B?dWplTVZTQ012MDZFcnlMZDB2QU41bGtRcFQ3QzRiajJwcitHQjBrSFBRdWFX?=
 =?utf-8?B?MGVlc0wzcXpPbHp3TTVTeVVkditrVS9pT281VnR5ZVlOM1NlVXhzUTlDTk9T?=
 =?utf-8?B?R0t3TlhjL3FtYzZvNHJoVXJQQ0pqUGZwbWtkMVdPYTl0TmR3THNYUWZEckZ0?=
 =?utf-8?B?UEttNEZ1RHJ1RUt0T3dUbG42anRtcmFyVDh4UldSbFozUE5BZTFiNUdpL2NF?=
 =?utf-8?B?UXBrb0UzcGMxWlNLaVZuV09qYWY1YWdZUk9rajJtQWpiRnVzS3NyTnZVUXgr?=
 =?utf-8?B?NkpXeFhxeXlOSGxSVmxxZEdvYm9KM1cweUFtOW5RSy93c0R0a1hZcVZ0azBC?=
 =?utf-8?B?d3hJdFZPMlVaMDdRL1JrV3dEM1IyVldzdzZZM01kcm45d2wxZVZGYUtESXQw?=
 =?utf-8?B?cTVxKzJpR3FzTWNBTnlMTWlzRmtXQzB5bDNMdEVqWk5ydXJYYUtEcnlmNGsr?=
 =?utf-8?B?TnorSWZFN1MxVTYzaUhpZ1JVUGszUDJLZXJQZS8yaUlLaHlRVVQ1Tk4ybmFV?=
 =?utf-8?B?QSs4OEpwOVY5aVFrRCt3RWFxUDFxbWd1a2dHZDhUTFZKYmJucW5mb0JMTng1?=
 =?utf-8?B?SVk1SkhkTGRNUURUSWRhalNESXRxWlpGaWpnMDV1RCszc0s0aTFEK3NrYUFa?=
 =?utf-8?B?VlNCQ1htR2xOQkMyTExjVndYWE1LSDl4NHp3ZzM3QXQ3Z3p4WFZyUzI5eUpL?=
 =?utf-8?B?Tk5yM0JEelFaRlJQaGFUVXJqd1BEd241RVJ1V0FZU1YzV1VtRDZPK1Nnb01R?=
 =?utf-8?B?QjhuNUp0QUVJRFBLb2w3NlgreThEVXdRVnBIakQvODdrbUh2bkdhU2dncTR0?=
 =?utf-8?B?R1NWZDZ2ams3MnI0RkJsU2NMZnNvWGZteHFGa3BiUW1TYkc5alpmQWUzcUJK?=
 =?utf-8?B?aS9IWk9nam9QTzlLeXFjZU1nRXdWeWQrQUN3QzN3V3pZdTVpT0hIZldDblNi?=
 =?utf-8?B?VHc4Yk4veFFPZCt2UUt6WE16L1g3Z0lCRExpL1ZjOC9GWFhBVEhFdURRU2k3?=
 =?utf-8?B?SzVHeEFjUTNUaE1pbnE3dDNJNWJORlBIRUduNlpGOHYrQVRYeUE1eXpzWVBQ?=
 =?utf-8?B?N0NYZHNOUy9ZYzl0TGxpeWxDdUhheFpJYkVNQmFsZ1FoQmVQcUVJVS9VNk5t?=
 =?utf-8?B?Wk02OENMNFhURWdwQk9sLzYycUh2SGl1T0FHaXNZT0lHNUx2d3FhS1d6K0RV?=
 =?utf-8?B?VWFhbzQwYmxTQnVRdjRlaU91cklQMFg0eitlaU1vcjRGcVVTS2xyMWF2Z1Zr?=
 =?utf-8?B?WldybGFHMUdZdGRReHM0UDg2dnBBODlKbUdhSHl1eG5jVVF3SEkwNWl2YVFi?=
 =?utf-8?B?THlqU0NONHNtbUVvb3gzM2FuSkRydHJ6U3VqOWJlaElFWjlpOVhCTTZCa3JE?=
 =?utf-8?B?bTRZLy9MckM3OHpBVFBVQ0REdHdGVnRZd2JNTGZ3TGhldldPMnNKZ3dEY3o0?=
 =?utf-8?B?R3p6RkRVemRiNHZHaHAyemREb0E4OHN4d05xZlpRN1dGMGFSRWd0L2lwSkdy?=
 =?utf-8?B?MU9zV1NvNk5iNHFub2ZJMmZQOFJzd0loMDJmREx2cDZpVFhXL0NZVHdiTXkv?=
 =?utf-8?B?Q3F6VDdCNXFqbmJnYUQ4T2JKTDQySW1MSG8yNklxNSs0d0hSWFA2SnBkNUNo?=
 =?utf-8?B?TTZEY3paUnNzRjVDSklpRG1xcFFrS3creHNUVloyNnhWRmFKbTh0WHFpd0J4?=
 =?utf-8?B?KzlVbmwxVkNhRC9OQnViMHhuWWVqd1JIUWdqVGZZaFEzd2VVOU44SlkxSDNL?=
 =?utf-8?B?YXd2RnpJQjZpZUtodk9pR1RaUytHbU54UmdhSTM2NXJNdi84ZmxIOTFqdkE2?=
 =?utf-8?B?UnI1bUxWL3lsVlF1NVVaempVTVhwemltNmtHdURoOXFidjhQckwzVXR1cXZy?=
 =?utf-8?B?TnVNMTdlT01pMzF5a2FCenR1TkFPMFNKV1lWeVo1L0pvMDNuTTFQV25LL25i?=
 =?utf-8?B?TGFBNEFUcmZRNnBDK0l1L1pjRE9SczcvMGtrcUNZdUJOWWROcDEzTFF2RGE3?=
 =?utf-8?B?aDI1Z2swWUR4c2p1S3BxL3BjNTdlaWRRbStTQVRDWEpmQ0xrdmdmdnJyOXND?=
 =?utf-8?B?RE5Ea2p6R2JPUEQrM1hqN1RNQjNwa0RqTnFiTFljbnhnbnFYckgrZitOY01U?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18cf36bd-d5f2-4a54-34ea-08dd1e9c0c8b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:09:34.1560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JKNIqqPWbYHfByRpjaJkgZawQiFQdGxkr+jlckmZxkv4LpEkP/zOCDCpbU/gkbM+INmTYBh7JVb/+/ob1mlLAJ4WEu86AwGsDfr7jWX+hck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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


On 12/16/2024 11:45 PM, Suraj Kandpal wrote:
> According to spec VDR_CUSTOM_WIDTH register gets programmed after pll
> specific VDR registers and TX Lane programming registers are done.
> Moreover we only program into C10_VDR_CONTROL1 to update config and
> setup master lane once all VDR registers are written into.
> Bspec: 67636
>
> Fixes: 51390cc0e00a ("drm/i915/mtl: Add Support for C10 PHY message bus and pll programming")
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Add the Bspec: 67636 as part of the trailer.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_cx0_phy.c | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> index 142de06818a7..5ebc90d210d4 100644
> --- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> +++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
> @@ -2117,14 +2117,6 @@ static void intel_c10_pll_program(struct intel_display *display,
>   		      0, C10_VDR_CTRL_MSGBUS_ACCESS,
>   		      MB_WRITE_COMMITTED);
>   
> -	/* Custom width needs to be programmed to 0 for both the phy lanes */
> -	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CUSTOM_WIDTH,
> -		      C10_VDR_CUSTOM_WIDTH_MASK, C10_VDR_CUSTOM_WIDTH_8_10,
> -		      MB_WRITE_COMMITTED);
> -	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CONTROL(1),
> -		      0, C10_VDR_CTRL_UPDATE_CFG,
> -		      MB_WRITE_COMMITTED);
> -
>   	/* Program the pll values only for the master lane */
>   	for (i = 0; i < ARRAY_SIZE(pll_state->pll); i++)
>   		intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_PLL(i),
> @@ -2134,6 +2126,10 @@ static void intel_c10_pll_program(struct intel_display *display,
>   	intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_CMN(0), pll_state->cmn, MB_WRITE_COMMITTED);
>   	intel_cx0_write(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_TX(0), pll_state->tx, MB_WRITE_COMMITTED);
>   
> +	/* Custom width needs to be programmed to 0 for both the phy lanes */
> +	intel_cx0_rmw(encoder, INTEL_CX0_BOTH_LANES, PHY_C10_VDR_CUSTOM_WIDTH,
> +		      C10_VDR_CUSTOM_WIDTH_MASK, C10_VDR_CUSTOM_WIDTH_8_10,
> +		      MB_WRITE_COMMITTED);
>   	intel_cx0_rmw(encoder, INTEL_CX0_LANE0, PHY_C10_VDR_CONTROL(1),
>   		      0, C10_VDR_CTRL_MASTER_LANE | C10_VDR_CTRL_UPDATE_CFG,
>   		      MB_WRITE_COMMITTED);
