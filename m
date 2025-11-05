Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E41C35A3D
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:26:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE29B10E739;
	Wed,  5 Nov 2025 12:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lN32HY8n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C9F10E739;
 Wed,  5 Nov 2025 12:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345561; x=1793881561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ueOJZdGGN5fjc9W7aKC3MPsOJr50b5ioYxe0Pg3zJ7o=;
 b=lN32HY8nb1iJcwqQ0T+eITBkM8PGnmPaQ4yGPKqQnpphu+NrEA6T95rP
 1OOh+A8ETtH9wgIYDc43qwleaFSZyOFbL7FTzHdUTqc37udX6ihwR/g0X
 0jE5BTD26E+yTLkB3ikr4PPLYBV4Y88T/G4hMdUSB05YCAu2mwD/AS1nc
 FpGcf5ROTa1yfyUPjlGlyB+ZAHZz9xJJCTGmFAskcxZnLd9amXw/HPont
 mD0lhOwdlZZ45yFgBsbecIUKgA7kUVIeAq4XgXbnioag5nMQjRFa/rGwj
 3WeUygMFwM9qDSUHBb7/jMAsyYgMlydECuvC6VrR/UICsKjS/qGTorpaD w==;
X-CSE-ConnectionGUID: Pv18yqIoTg+SbZ5YPrlzpQ==
X-CSE-MsgGUID: Nab+UWikQLGPeNM98RtIjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="81860386"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="81860386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:26:01 -0800
X-CSE-ConnectionGUID: WW6NuDQQTGGUrjyixhTP0w==
X-CSE-MsgGUID: iKUZ0U5gQzWqtiXxG1bzQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187133306"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:26:00 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:59 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 5 Nov 2025 04:25:59 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 5 Nov 2025 04:25:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+SM7tqS4QtvkmU3NEhMP5B6DSABpwHpGpI356rJDBMB3fGCMztXiCz2+HmDARkRaZEt5M1IIwmZqsSnHiGIO4kdH3JLPFA48f3ySTGfL5skfpdRTxxsRNUf/JSgM1jDHCRvdo+8iHfRPjeaZMjTUjh/l53BOCgH7S8Y1D9yE/sTDXYtuq63u5FwQuTNzxGWtFOZQPoCoA0mnPsQ42s8PO++ySTeuDWzaI7ShAgw37zDY2CaVCEDoTmCl6exfvKOQy3GxqotrC9TBRi4QPraOp6Isy0tFVlRslUNAwKsJUQlieW+yejYckVhqYNzkSUMTlJ/0hMHBqoFq4+GmT39xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXsUdfly9vbZRk5OHLrOKPwDNvnDOUgmJbx7X9Mbz4o=;
 b=S8TIKxQ8rTy0GjyBvrTXsUCopV97kI5Ih40voMefz6cA8xHyU1rNPic7mxJ7TaADofJJqpmbnKsNGKSnWdgeaIDn9oMXlkteWZRjNmAg5ipK0BVachm5TRWUWBmC6prh+VEkfetfdgFeAwKnSa9ZwNPjpT1gy4h2k8Z0DxZNxkeWNKdX5Y6GWAW4F5HQT8O0OF3vJzlpihGpLIk4Q3YzEPZOl0QwJqxXJXIsN3W5xSDbYsTXsnUjVETITL4Vvbga86zBamCdyBMTSvvS0dpwAG9NxatcEgXP861/hsBZw+vutCRCQFDb9IUj36sWuaLnBLdNMPgH7iaCDsJlXcnu0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Wed, 5 Nov
 2025 12:25:57 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9275.013; Wed, 5 Nov 2025
 12:25:57 +0000
Message-ID: <98ed5d7b-800c-4ee4-aae0-95a800feaed6@intel.com>
Date: Wed, 5 Nov 2025 17:55:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 12/24] drm/i915/color: Add framework to program CSC
Content-Language: en-GB
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-13-uma.shankar@intel.com>
 <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0179.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::22) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SN7PR11MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e875708-754c-4836-99f4-08de1c6678f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDJybGowbE5NODRTalFlOFVyTTRwblIveXdMUHQreGdOVW9NbEc4UEVZRWRz?=
 =?utf-8?B?NXpSMzlHVE5hZDdDSDVWeTRiT1pGRUJMbERLcW1QRFhXYVJuYW5XNTRscXMv?=
 =?utf-8?B?UkRlWkhNVUFFTVkwU05XNC9iSkMwaTBEKzBLZzNGUFZ5R1VUNWo4ektvWFFn?=
 =?utf-8?B?bnlTQ3NaSG5sdlE2U1ZxcWVwZzlLMVJMekpaTDFIejdFaEFLQTEvVDg4bnBx?=
 =?utf-8?B?cXNDc1pDenlnRE8zMkxTbkhlZnpraERHVEk4dDdyaC9TTG9yS3Rpc2YvcWI2?=
 =?utf-8?B?WjdOejFlc2Z3Y3lWanpXSUkzTXIyMTdvRVdnZnZaQmhrSXJGdzhrcjFqazd2?=
 =?utf-8?B?MUZXaVNjbVphbnF6OVRzanplbDZXb0V3aUVhZm1LR25zQUFNOUJPdGxITEdE?=
 =?utf-8?B?WlkyT1lWVUdvaGcyVkdBaFZPcFV1OVJBU1ZzR3hKUTNmTjQ1aGhlRmlvRG1n?=
 =?utf-8?B?bkhkWTZYeHhibkJSbG1XSUNTQTI0cVdtZUJZREJZTzd0UlZ2Y05pTG9JenlD?=
 =?utf-8?B?cUsvQ0IyOTRxLzc3MXBDU085UElSTWpWUlFWa3hsZ2dFUWpHdUtnU0RwaDQ1?=
 =?utf-8?B?RkNkZ3dzS1pWNzZ1M3BuQ2RXRmoydmtVL3ZlSllBU1Q5QjIvUllkbEZJS095?=
 =?utf-8?B?VlFlMytneGxza0EvVmU5NWdhWVZvNE5jcW8wMUlNTzBvSkxhU2JTdHZGRmYx?=
 =?utf-8?B?WDc3TkxYdWJGdnMwdXN3aVNrQTR2MUczaUJnWGFPRVNGbzVFNk8zSW1LOFdU?=
 =?utf-8?B?SU5sdkU1aitGa0VScWhERHczeVVNVWNBVUFQeUxaRUdWbG55ZkVlV09qOTRY?=
 =?utf-8?B?RVdIK0l0K1ZhZm91MHIxdTZYS2tTU3FqVmEybnRlZ2plaWhGVUk1aUFOWkg4?=
 =?utf-8?B?S0MxOUppWEtyNE4vbUtadGlmNUJzMmhsazEwTE9CRS9JVmoycnBENmZSRXBh?=
 =?utf-8?B?dG9XWnF6cXp2NWxyWUZOeVlnT252Zys5QTkxMnRFMkxOdVZLMHlOM0pCWUVh?=
 =?utf-8?B?dk5lV3FPL1pjVTZ1QmRUODRlaWlJT1UxS3MwdnpvTjNDRXZNbjRiZ0xFbUtn?=
 =?utf-8?B?VlhCRnBnajlEK3B5djdjeTNZa28vR1pvQjNGNTQzMkpDaHJ5U01LUll2Mkxl?=
 =?utf-8?B?K1ZPcGZlM2ZIL2tVTUNYR1A5Y29tNDB0dGdtMDc2ZitPai9uR25CMHVEZmJp?=
 =?utf-8?B?QzV2M1ozUzhXU0tvRkI1V0VQUHBYdUNqK1VOUmlQY1JpVHlwWllWY2hzRFBS?=
 =?utf-8?B?R25HQW9CWUNDMzRYL2FHS0ZvbFdtVlYrS0pIQ0JrWnNYMlRtb2QyTHBqUXJL?=
 =?utf-8?B?ZXFYZnZvVDY5aWN4blRESGR2R1lFK0Q3ZEFLTkJ2RXlxY0FUWWpLV2RYS0Yw?=
 =?utf-8?B?OFFacTJENUZ6TE5xL1pJUHg5TzJ6dndwT1JIbjhObTFrRzNCUStzWGlrNm5P?=
 =?utf-8?B?ZVdIVFYzNkZ6R0cwSkQ1SG5MMzJpYXA4dXNOOS9oWkRuN0pWa3puQXFFTFJw?=
 =?utf-8?B?TmRSV3prM3p4ZkJzYXZhcUFCby9nK3p1K1psd0NQSzZoaFlFRzVudGlhYVN4?=
 =?utf-8?B?U0xwbi9PWUdxaUNQVEx1QVpsOExVR2xqQUNUNVNBUVZNcW5ZNittM3c1Unoz?=
 =?utf-8?B?Q3dPRHlBYjhQV0IwTFJSZ1RBSHNZUXZxNGc5YUhJWGpHNWR0eUlYKytaTU5E?=
 =?utf-8?B?eHAyQnB5RmJ0WGxHRlNOSEovemw5MVdtTnhqWmZRVnhaTVNEL2c5QjFTcEJn?=
 =?utf-8?B?T1VhWkQzTTF6a2hXeSt5dVVRbGJxbGtQYWgwT2xSUnlQTzhNRHI0Wm1YaE1D?=
 =?utf-8?B?dEUyZnNZZFNwZmVteExvSnU0bmZJSzVxRHlJNzVmbG9SOGdVL1UwbW5UaEpp?=
 =?utf-8?B?ZVJOM2U5SlpjczhQYmVJUThURFRJbE82U3QrZEREMlRVSFVGZmtSWG1yUGIx?=
 =?utf-8?Q?lOUEfTuV/FNcrQY4nv4eT1k1AqunqFcl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnhCRFlNYmRrL21hUzl1MWRVdklHRDFZdXRhTnRhZ1NpYk9zRUxnZzk5ejBW?=
 =?utf-8?B?enZ3WWtNZWFjSXhEZ3R4dDI1TWt0dUdtSjZJVmZtZ2p5M21nMEdtMExuaXNL?=
 =?utf-8?B?U2Vpb0V5ZUY1dnpxUVRjNkdpYUg0aElOWGlNcW9lSmVsUm5FczNvcFZObVV0?=
 =?utf-8?B?dlZFc1dpeGl4Z2FjcUJLanFpMm1pSUN1VGJLOUtLRzZXRDB6WVBPaEV0TXNY?=
 =?utf-8?B?eW1mWVZIaklEMWZJNWMrUjhrdkRCcUtzZmZuZUxHTWVPbUtzdGtEdVdKZHd5?=
 =?utf-8?B?QUJ5YXRWUURMa3BITldROFI2YklJU1JtOVk2OEhBUStYOU5zUHdQaXNQNW1h?=
 =?utf-8?B?NTdqYWtOZnJVMEEvZ2hrRHpsZEtUbmxUSTJYeXlzdThFenUySjQvVkJnM3Zk?=
 =?utf-8?B?WUhiMUFSODdBTlMwU3k2akhncUlGbzlPdU1vaDZXMmQvZTlBOVVETzB5bThE?=
 =?utf-8?B?ZEFZYlRqTlA5LzdZZTlXa0RNbmw4UzdXS3BoT1pwbThpS09YaXdBbkdBOXZj?=
 =?utf-8?B?V3hJa3M4OUJVKzYzSnY0U0grRVFKUm1lVTJTK0IrR21iYTNQYkNvUGxPdVZD?=
 =?utf-8?B?c1hlK0xWa1RQMEtZRU5QZ2lIUzFiaEdJUlNvczF4TDZXcHczc2lFSDQ2Z3c3?=
 =?utf-8?B?Nm40cmNpUkhQcFl2N1Bnd0pBMkRNM0ZicGF6bjh3R0hDaCtWSWZPZ2h6aWxq?=
 =?utf-8?B?VzJZU0FFQnp4Tm1nWVFNc015S3ZZRHMyNjVzUzhDMWxOcmV6YVlMbjBJTlBW?=
 =?utf-8?B?T25YcGQ3MjZBV01EWVg0dEJRYXdUNWYvOTBzazRYUkdJU1F1WUNzNGVWMXU0?=
 =?utf-8?B?bmw2aDVaQWM5Qms1YXIxR3l1OW9QMW0vOUZqQlZKNTVuZGxxRlFOTEUzSVVU?=
 =?utf-8?B?ZWZVL3FPVjZGeFRMVDlmQ3ZBSW8wSlROTm1rcGg4N2hVMEVmVGtYMXp5TFhU?=
 =?utf-8?B?NjRCajJZTTBHdDlGdkJPYlRCbExhdDk5MUViU2JkTGhoa0Q2NGt1MHFyQXVN?=
 =?utf-8?B?T1hWUng2TDFjbU9pTkhZUHZrQmtOWGRiWHFicHY1ZVRTQTBMaTRwaytjTnox?=
 =?utf-8?B?dVFZMWNUbkVMZU9XcVFmZXBScGU2bk9IV2pLQUpVenp6dXJrZmorWUFzVW14?=
 =?utf-8?B?NTV5RnVxc0RYV2N5NmsxZmN6YXVvQTM2d2NySERMSE5qZ1BZenhjVWszZHFY?=
 =?utf-8?B?UWtYcUU5YVJSSlBZWVo3SmdvRm1qNFZkRmxJd3ZWM2dvMjFsS0NDbnE4Snla?=
 =?utf-8?B?eVJ6Z3ZNQUg5Vkx4MitycHZvNjBIMW83elFQRmt1Z0FwSzFabjZiNmtxVzE1?=
 =?utf-8?B?Z1JCOFlNcUlsK09sd2M4cTY1TzhkdTZqd3FSa3J2bzBGRnNwYTJidElIOWJ4?=
 =?utf-8?B?ZitqRjk0UW5SUWhNMzNkekZLNjUvRTNkT24xbnlTZjBTTEJqRFd5d3RuMTdo?=
 =?utf-8?B?bW5RblB3VlU0S1ZkZUo2NC9vQjdicTJZNUIvMzNOWm9SeVFCd1I0ZndTUXJ1?=
 =?utf-8?B?Zk9BZXBzclRuMm1OR1MrUjdZdWxGQmEwSUFOQjQ0b05Zek1FNWRBR0UyZ1R4?=
 =?utf-8?B?aW1QR2dMdVduZ3RhaXYvWVdSdnBURDYwZFFHbk5XMmlHeVYxSW5xQ0ZTMnln?=
 =?utf-8?B?aC9paFVzQllGL3J6bWw0dE9ubEJCdmlaeUdPVkhOby9kOEZacjZDUVdlWGFH?=
 =?utf-8?B?MHJzVFYyeExzd3N3Q3hTZU9vSnhpckQzbUpWbjlUQkYycnhISmJ4WDZVWDc1?=
 =?utf-8?B?d0I3ZHFva2d4SVRCYlp1bjYzVVdsWGdEay85MGRRSHJEd1VLTy9NWU12bHFn?=
 =?utf-8?B?b3dLSGpJdXViakVTZjFyRXdYaml6WTN5QkcySUlCdlFwcHAweWwwbi8reVl4?=
 =?utf-8?B?R1gwTFEzeG16R2FuL0E1OW05MGx1RmFaeTc5b3RINDlIRmNWWUFrdjJDTkM4?=
 =?utf-8?B?cXJ3TityZnFXZFlLWXpCNzNYa1pEUTQ0WWF0S1V5ajdDNHV0Y2NJdklwRW5C?=
 =?utf-8?B?WWRqbCs4QzcxOEJ6emlPS0JsUzhSc2tPeFBZUmdnVHRwN25LN25WdjhVQ3Ix?=
 =?utf-8?B?RzhZUnJTWEM2VDZlZk50OUkvK0d5eTlRajQzdFV1YTNRY1lCVUtMMzVEejMw?=
 =?utf-8?B?S2NrL2h1bDVmdlYzb3VFVHVLblA2L1MyNzdDNmNVR01qcE5NUzI1WFJOcWk1?=
 =?utf-8?Q?c3bzVL1mt8pt8+N8IfxaHzE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e875708-754c-4836-99f4-08de1c6678f3
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 12:25:57.7655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F8mF1dbSsgsfkurnwQZynKakzO35h4ZBC2APDSCDbvP/M9NMrlBawrQU4+LBaXincAigysv+eJe0Dk5wxm9skmQSEiLsISU0Rv8qL3XhhcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8282
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



On 10/28/2025 1:39 PM, Kandpal, Suraj wrote:
>> Subject: [v5 12/24] drm/i915/color: Add framework to program CSC
>>
>> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>
>> Add framework to program CSC. It enables copying of matrix from uapi to intel
>> plane state. Also adding helper functions which will eventually program values
>> to hardware.
>>
>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_color.c    | 14 +++++++
>>   drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>>   .../drm/i915/display/intel_display_types.h    |  1 +
>>   drivers/gpu/drm/i915/display/intel_plane.c    | 39 +++++++++++++++++++
>>   4 files changed, 57 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
>> b/drivers/gpu/drm/i915/display/intel_color.c
>> index 363c9590c5c1..7c53572f729b 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.c
>> +++ b/drivers/gpu/drm/i915/display/intel_color.c
>> @@ -3967,6 +3967,20 @@ static const struct intel_color_funcs
>> ilk_color_funcs = {  };
>>
>>   /* TODO: Move to another file */
>> +static void
>> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>> +				  const struct intel_plane_state *plane_state)
>> {
>> +	/* CTM programming */
> 
> Add TODO
> 

Ack.

>> +}
>> +
>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>> +					const struct intel_plane_state
>> *plane_state) {
>> +	if (plane_state->hw.ctm)
>> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
>> +
>>   struct intel_plane_colorop *intel_colorop_alloc(void)  {
>>   	struct intel_plane_colorop *colorop;
>> diff --git a/drivers/gpu/drm/i915/display/intel_color.h
>> b/drivers/gpu/drm/i915/display/intel_color.h
>> index c2561b86bb26..420d596dbbae 100644
>> --- a/drivers/gpu/drm/i915/display/intel_color.h
>> +++ b/drivers/gpu/drm/i915/display/intel_color.h
>> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
>> intel_display;  struct intel_dsb;
>> +struct intel_plane_state;
>>   struct drm_property_blob;
>>   struct drm_plane;
>>   struct drm_prop_enum_list;
>> @@ -49,5 +50,6 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
>> struct intel_plane_colorop *intel_plane_colorop_create(enum
>> intel_color_block id);  int intel_plane_tf_pipeline_init(struct drm_plane
>> *plane, struct drm_prop_enum_list *list);  int intel_plane_color_init(struct
>> drm_plane *plane);
>> -
>> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>> +					const struct intel_plane_state
>> *plane_state);
>>   #endif /* __INTEL_COLOR_H__ */
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
>> b/drivers/gpu/drm/i915/display/intel_display_types.h
>> index 4b5124a08cc9..c709df0cea9e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -634,6 +634,7 @@ struct intel_plane_state {
>>   		enum drm_color_encoding color_encoding;
>>   		enum drm_color_range color_range;
>>   		enum drm_scaling_filter scaling_filter;
>> +		struct drm_property_blob *ctm;
>>   	} hw;
>>
>>   	struct i915_vma *ggtt_vma;
>> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
>> b/drivers/gpu/drm/i915/display/intel_plane.c
>> index 36fb07471deb..cc8f3e15c82e 100644
>> --- a/drivers/gpu/drm/i915/display/intel_plane.c
>> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
>> @@ -380,6 +380,43 @@ intel_plane_copy_uapi_plane_damage(struct
>> intel_plane_state *new_plane_state,
>>   		*damage = drm_plane_state_src(&new_uapi_plane_state-
>>> uapi);
>>   }
>>
>> +static void
>> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
>> +				 struct intel_plane_colorop *intel_colorop,
>> +				 struct drm_property_blob *blob)
>> +{
>> +	if (intel_colorop->id == CB_PLANE_CSC)
>> +		drm_property_replace_blob(&plane_state->hw.ctm, blob); }
>> +
>> +static void
>> +intel_plane_copy_uapi_to_hw_state_color(struct intel_plane_state
> 
> This should be intel_plane_color_copy_uapi_to_hw_state
> 

Ack.

>> *plane_state,
>> +					const struct intel_plane_state
>> *from_plane_state,
>> +					struct intel_crtc *crtc)
>> +{
>> +	struct drm_colorop *iter_colorop, *colorop;
>> +	struct drm_colorop_state *new_colorop_state;
>> +	struct drm_atomic_state *state = plane_state->uapi.state;
>> +	struct intel_plane_colorop *intel_colorop;
>> +	struct drm_property_blob *blob;
>> +	int i = 0;
>> +
>> +	iter_colorop = plane_state->uapi.color_pipeline;
>> +
>> +	while (iter_colorop) {
>> +		for_each_new_colorop_in_state(state, colorop,
>> new_colorop_state, i) {
>> +			if (new_colorop_state->colorop == iter_colorop) {
>> +				blob = new_colorop_state->bypass ? NULL :
>> new_colorop_state->data;
>> +				intel_colorop =
>> to_intel_plane_colorop(colorop);
>> +
>> 	intel_plane_colorop_replace_blob(plane_state,
>> +
>> intel_colorop,
>> +								 blob);
> 
> A break here why keep iterating if you have found what you are looking for
> I think I am seeing more and more reason to have a separate file as Jani had said
> Called intel_plane_color.c
> 

We have to iterate over all the colorops in the pipeline/state.

==
Chaitanya

> Regards,
> Suraj Kandpal
>> +			}
>> +		}
>> +		iter_colorop = iter_colorop->next;
>> +	}
>> +}
>> +
>>   void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
>> *plane_state,
>>   				       const struct intel_plane_state
>> *from_plane_state,
>>   				       struct intel_crtc *crtc)
>> @@ -408,6 +445,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
>> intel_plane_state *plane_state,
>>
>>   	plane_state->uapi.src = drm_plane_state_src(&from_plane_state-
>>> uapi);
>>   	plane_state->uapi.dst = drm_plane_state_dest(&from_plane_state-
>>> uapi);
>> +
>> +	intel_plane_copy_uapi_to_hw_state_color(plane_state,
>> from_plane_state,
>> +crtc);
>>   }
>>
>>   void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
>> --
>> 2.42.0
> 

