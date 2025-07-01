Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D44EAAF0031
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 18:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F089310E5D4;
	Tue,  1 Jul 2025 16:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJTEyzYp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCA410E5D3;
 Tue,  1 Jul 2025 16:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751388143; x=1782924143;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Acp+zR4qxi/5e+V7bQCK8tulljr2z8kD9zK/Q19C0N8=;
 b=XJTEyzYpfnpOoH+f9tJcwWm2oJIrrqalLWJ2TxumU8weCd40XF0fVAu6
 bhzxZDktAaMZlxvVGHbpkJkfzTf4FfrNVwX2o0FHzKRXGCQpNT32Pyr1Y
 K7AQMfLedae1w+JBVK/GZDBYqQrmANmmw0I7r+NyLzICShLNbsn2JHCAG
 BLmCu383OLVC0FnUppI2t+655EIwTvMEslEgwIIVJPddzJovWH7HnsX+m
 7HRb0zM6fAgnWr3oruK1htyUjxu62KNwEM5niE7ZGLu+iAEKA3SJCYVqW
 vGE/1Kle2V5V/T86FFs8sqbvZcRO7y/YudnAfy0xLxnv5cTzHnMDCMpVa w==;
X-CSE-ConnectionGUID: IsPqGNqJTYCpkhC670IzRQ==
X-CSE-MsgGUID: 4XkWAruHSaq5JfgZuT2/zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53785521"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="53785521"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:42:23 -0700
X-CSE-ConnectionGUID: 0q1Y5gTcTt6mIJbB/4tNXA==
X-CSE-MsgGUID: iT1bxF6FTgOrxrj7NMzuow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="153289702"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 09:42:22 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:42:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 09:42:21 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.82)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 09:42:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWG3+W/fAXMc09KHEnxJO2AyalkT/5b3tnfALVaq8Wucevjcxuyr9LRHffCypnox6uhzsXbMsVgMGYjrEPzHNcRrBNPEYJON/lW9eHOue/Vdnqh9xHwjaNT8HeeSUHyfCk9+LVPPihzRbeTlIlJtMLzM1aixDBQESuXuVqi+1hs67/AOPaOH+c5Zlmchdv1eMWAbbFkSuUyz64IHPhG82X50EWr9BpebIaV2n/RRD/namfUvcqUqZ1CDY0AWbGpEryr/o89BCWCr6O9Bc4E1a1E7m2MxjDaiE2iDMJppbrsN4qInvqU6pvdxQF/WexgR3a0TkjQovmujrRQ+x9Evbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1J84qo4O25m3jeFP1A0JkzrYcD1qkGVALe2H47eewk=;
 b=AeCuVsfhcLxNyXCMi3z2+glWtVcCHTsLJtEfpKSEXw7f5RcJPSlP0eLXwsBEoVk3rT/ZwnMloz/3RZ8ZMkbQSdqWFirSs+MyCxsDEQnptbC7TxPSwALC4BS9e/vYL7+JyP1XNzdbP66m58nqXtYzk4XtgRezhT3JM7I2k9HgsxYPEgphZewfeQPph0R5flqyNbXZpXhtgRRXdCmPkBWgbI8Cor2Jb56Q0lRniLC+BBH5J0+CscOQdYZm265euwcRgUkhk/U73CXv5MiJlLUae+b6ckj5w2ziU5SgqT1D5eH+e+1hvSl4EOpfT3agu/nxwdlSPWc0W4Fs9DY4inJstg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7002.namprd11.prod.outlook.com (2603:10b6:510:209::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Tue, 1 Jul
 2025 16:42:05 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Tue, 1 Jul 2025
 16:42:04 +0000
Message-ID: <c48b565e-73c9-4222-83b6-dc3597427db6@intel.com>
Date: Tue, 1 Jul 2025 22:11:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/10] mei: late_bind: add late binding component driver
From: "Nilawar, Badal" <badal.nilawar@intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: "Usyskin, Alexander" <alexander.usyskin@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-3-badal.nilawar@intel.com>
 <2025062834-scraggly-barracuda-7ea6@gregkh>
 <205cc43a-4254-4d27-9b4f-139006e871e4@intel.com>
 <2025070140-dad-jaywalker-0774@gregkh>
 <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
Content-Language: en-US
In-Reply-To: <eab7307a-d6a2-402b-945b-674e9c5f608b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7002:EE_
X-MS-Office365-Filtering-Correlation-Id: e5119646-2021-46f8-14d4-08ddb8be35fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUpEZ1hpdkovMk5HRnNvUDhqWmNUSFNSTUFWMDZNd0Q5RDNSd2xncGxEWmJx?=
 =?utf-8?B?M3JmREJyUzFxMkpqc3VTcFV2dzg2b2VRQlJ3c3pxWnV1ZGJPVysxVGh3TEtH?=
 =?utf-8?B?Mjd3ejNvOTNxbXRNT0FmdS83aFJhUnhFOGJ1ZnRtR1pZM3Mxb1EyeEJmaDhI?=
 =?utf-8?B?MXFMZzZ2Sm5QZjBxSXNYNUZYbkJXUHNTd3I3OUFRWU5oSzllQ0dGQ2IxQmpX?=
 =?utf-8?B?bUdURnlUa0V4RWQyek9EZmRucUJESVNDYlh1OUs5azcrY3E5eWJtbzA2dTlG?=
 =?utf-8?B?U2lUNDFoZ0diRmo4UnphbEx0OG5HNHFOcE9PUGo0MSt1NmlURm0xSy93dlFF?=
 =?utf-8?B?WUFBbXE1dmZYSjhyeGRsTzI4UTkzNXJBZzRIM1ZGTWdYQkk0ZjIxYlB5MENo?=
 =?utf-8?B?QWRlNUc4aVVmUmw4S3ZtNi9OODVOYmxtVG1tbEo0dGt3ZDNiQ1BtT3F4aVI4?=
 =?utf-8?B?ZTFEdDNXcXhFSmM5UnFhbXA5bVpkNXpMYUVuUTkrOW53VUJmeDNzSmRIYVNU?=
 =?utf-8?B?TWphaGZQNHdqaG1ZLys1bjVUTEZ0Zi83QkF6U3ArbjRqK2dJeFB2ZHAvT2Vw?=
 =?utf-8?B?UnBTTVlPd1BtLy9mSkNINE04MmIvZFRQNzNaUEU0TjJiWHFGYkMwc3BoU0Ex?=
 =?utf-8?B?VHh4a0J2NkVFdGMzMEhyTzlSS0ZNODhmVkE4cERlMElvb2ZMU0RGNUVNZHZK?=
 =?utf-8?B?dkc3a2tQUDY3dzZkeU96K1hYTzJVVWY2YWdhUFBPV1kweFp6Q05QeTNtTmhY?=
 =?utf-8?B?SzNmSWJqVEFEaHRSbEk4WjdjV1pPeE5ScWdWU3RsUWs2dEhLYXJZRnVDYk1G?=
 =?utf-8?B?WjJta3ZmS1pzZFZKME5QQ3krZDRLQis4SGZWQ2g5TTBHaEVhdDVVTzViQm5X?=
 =?utf-8?B?ZGhqOC8zcVJQWjEyOW94Umc3enBPVHVZZkdvU1B4ZjM0U2lIb0JXR0h4VWds?=
 =?utf-8?B?a2N1WEVQOXk0MnhVYk1Wb3B4dmdFRzUvMjFmVVJnbWxQL0I2MDFwWkZkR2cr?=
 =?utf-8?B?eW1paHJ2VjZpRGJIa0tqL2IxUVVKVTBBSEJYcGVMUDZjbjQwcDhiS280YU5N?=
 =?utf-8?B?VEhOenpLKzQvN0d1UUFMVVYrRW9ORFJDbUZ3YkJuWS9PcjVjSGJHV1kwUWNF?=
 =?utf-8?B?WFNCWkxaOGRocGFsM3IzMkttd3lPczgvS0xlZGxiZk5UR0R5UjE2a0Z1UHVV?=
 =?utf-8?B?R0RlSDNrRTRLNGhIcUF6ZmZFVFVnejE2Mm9OUmdoY09RRVdQWlNMLy9lOEFE?=
 =?utf-8?B?NU9KRXc2TzhvL2xqcDc1dmN4aXdjTFhNTDFla2lXZGVscWZ5Z3V5Ynp4M3FT?=
 =?utf-8?B?VGZubHZqOFNUZ3NMSUQ2RnIzNXV1enVJdnNpcVpzTUlPSDdjL0Ftek15dHk2?=
 =?utf-8?B?d0g3WFh3NTcyZUJaTjJHTlgrZDNnQnUycDJCMitKdjVhek5MbGl4YXd6OG9T?=
 =?utf-8?B?cmtvTW04Q2w1U2JyMFFDNmdON29GZU40amJ4YWhrOWFVU3J6K0tBUFlZekVS?=
 =?utf-8?B?bHVrbFdjbzJvWHpWUmdKaUQrM0xHTlJ3SDN1dTJTV1BobzNlbnVnSWNiZm44?=
 =?utf-8?B?K25vTXlLZ1lMQ0xhWU9WbGVmUExqWDhYRHlsc1EzM2tkQXZ5Z05jUjRZRkxo?=
 =?utf-8?B?dnJTUThkemplWjJMeUFkMHV6WTlEQ2hHS2NFTGJnQ2FRTW9Sb1RiVzFnZnZo?=
 =?utf-8?B?U09IREo0N1NKYWRLRTRmSGtkcDVNVnhwam1UZDNwTk5KVE9kVC9HdmErNWVn?=
 =?utf-8?B?bEZEUkFFODdJOTcyL0VjMmNnU2prSjBzTjZNSXhNc3ZEVDRDaTdFVUo4TzZp?=
 =?utf-8?B?Nlh3UXUzc2p5S0ZIZjZoMG9VN2NVdmhDejg1cWZ1dEdJQVllclY0bWVaaWJa?=
 =?utf-8?B?NnJBenkzbzYxc05aNDhjVUp3NWpQMm80M1BzazdzSFBTdVZUSlJVc1BlWXZp?=
 =?utf-8?Q?BhQopGFBu9w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXN4dld3SGFQbXV2dStrd0UzNnJTR2dSTVBqaStCbi80bFRwS05JcVN6RVdj?=
 =?utf-8?B?R0xHakVvMENHcnlUVGJhaGRsMnFHeUJ2NUJBVHFyQzV0OU11Q0dWY1hGNEgz?=
 =?utf-8?B?MWt5cWtZK1B6UzNsOHo1eVpGK1FqNFM4SnRRYWtUUEtCYmwyVmdZRTF2WUNt?=
 =?utf-8?B?cktQQWRqWFZ2a1pNdDFsTWpBMkdwVWJycGovREg5alBjZCtoVjZBbjgxUjEz?=
 =?utf-8?B?MUhQTE4yaGJ4a0ZLUGY5T0d5VllmUGtkSC9KSGhiMVJZQndtOVdXNGJTMWRj?=
 =?utf-8?B?ZmcxVGxudURyNlRSNVNPcy9tcFRSZVRadGYzcmx2T3djS3loRUorY05nNHMy?=
 =?utf-8?B?VEI4MmloVm14dGUyZlFESVVRekt3Z0NUQ3FVK29BcU5Nb0xNcDBvc1dQZHhT?=
 =?utf-8?B?QmNTUkdFVDE3QW9Fd3kzQlNtTGtQUVV2dGhycTVGVVp2YUdvUCtlNzN5MUxO?=
 =?utf-8?B?eUFKK3NyQ252clA5dHllb2FFdXV5UFlSdDFTL3ZQREpUNGFndHdPandZbitO?=
 =?utf-8?B?WWVDVHdlMWlHcHZpd1dSM3dLdVBGblg5K2RWS1VPT2thNmxUaTQ2WmpZYWdB?=
 =?utf-8?B?dkFWSmN0TVE1MTQzaGZKWXcvMnRvcVRpWkUybGxtd01TejNEWE03VStSQ04v?=
 =?utf-8?B?NDRkbTA0dzhmM0Q3ZnozcTRLZWgwa1ZPdVBhYWdyLzhjYlYvaVBNOVlWTjNp?=
 =?utf-8?B?ZG42VDdPWS9XTWo3d0tubG4rU3hOUFNMcXM4QWh0UkhHUHRUcnp2djBQZENO?=
 =?utf-8?B?d3BZTlh3Q1h0UmhHYkhqTXZCSWNZSTg5T25STnRMTVVRWGdxaFFMRmwzWSsr?=
 =?utf-8?B?SGZlZng5THp3T3BmZFhUc2ZaTFJLaEVITkkrcjBkczl1eG81NU9kYWhTQWFN?=
 =?utf-8?B?bVNyTnNYMXVNUkZLOGs0cDNHOUtnc28wb1dlM0NCSWJpQkJrbW5zM21pR3BM?=
 =?utf-8?B?dWlSVEc0ek5VOUVLa1I5WmtFRUtWTTVWQTAyeE41N0ZUam00U2NiTEhVL1RP?=
 =?utf-8?B?TGhreVFYZEtVRTBObjdvbnF0K2VKZVVlNTFuZm82dU5NSDcyVVlRK2ErRTRC?=
 =?utf-8?B?VW0wU1FqWkRxZEF0YTNZSFJ1bnRwaEpkeGNIVVU2VnUxTWFZWjVKWkpIK3Iy?=
 =?utf-8?B?WElsRFpQcU5MRVpYWmt6N3l4NFhJZmpVVjNFRFJCZXl6bFlaSTErVEdTd2hq?=
 =?utf-8?B?VXRneTZEVGtpZEk3VFpFbDJKM2I5Z2RtMVljV2pZNnphMEZMZVJKb3NyWHZ3?=
 =?utf-8?B?V0x4bHVjY2NCaDRsWGNHbzFrQU9DT3JoaEtpZThjMTZBaERJNDZ2WFBjbkRB?=
 =?utf-8?B?a1o4ejJ3K2RZMUt6a1dJSlBpdkNOVStXbnVvWGd3NjF3K1RqVVhJeUp1MlZy?=
 =?utf-8?B?WGY0bDdMalBXNWtQUjJlNlBjeU40dGlhSExQV0d4cDN1WVoyc0o1R3dPUHEz?=
 =?utf-8?B?UHNIVGk0NnQ5cnpUcVNNUzR3ZUs0eWgzcWNzOENXb0dxRVVYek5YdGw0THVO?=
 =?utf-8?B?Y2JkWnpicXRLRVNnUmhvdXlDQnpLeDlKRnJ5MDFTUTVKYno1ZzIvUEw1aEFH?=
 =?utf-8?B?Tkt5eC9CZE5OVkxUTjRDVkM4SDJGMjZjbTR6SFZ3dTUzS1hnaVBvNlZuamEv?=
 =?utf-8?B?S05WM3RoL21ESG04RlMzMVdia1lBMFFxWFB1aDlGaXp6WEhtT2duTUVzVmxO?=
 =?utf-8?B?bVRwUHZzTyt6VWljMHFlc1o4bDJDN05HYUYrc2ZRYlJ0eG1FTmF3U2xBTFRl?=
 =?utf-8?B?dnhqeHZVa0g3YmtVdFdhSWtyZlIvdTY5b0tZdVhJVTByT2pnU2RVQmRMOHBz?=
 =?utf-8?B?eDBZV3U3Tm12Z0YvZHVLa050aTBwaGwrNGZTWVpZcHpucnBHWjlRTEUvUTVV?=
 =?utf-8?B?cnJXWFd2WE5OZThQQitmQjN6SUtZZnlTaTJsUlA4YU5aSjduc0FLeFhVM1Nt?=
 =?utf-8?B?K09maWZFWVNiT21QL20rdFlic25NQ2NaNGlaaVJCeVJNLzRxWXY2TDZrRlBp?=
 =?utf-8?B?dEZVdVlwQUtQeWI3MFFwZWMvWXRVL0RCNkxEcG9VekJJNUhNQnB2ZytxamFi?=
 =?utf-8?B?T0wwMUVwWEtFeG9QVGdVTGVPclo1TXFWT1RGclBLN2t6WEVKSDB6S3RNY0Ev?=
 =?utf-8?B?TzRGR3FrcGZ0L3VFR1ZzbTdhaFYxSjVwKyt1OTBSUWJrWndTTnFLdDRhQVQy?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5119646-2021-46f8-14d4-08ddb8be35fd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 16:42:04.8697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2CTdEsZ3E8sCMiPgKPuVrnqHlGqEyIwrfMCF9Rcklc00OzXwWKdS7stZdMmOa6rIu1aUOcseRbpxgFSOX3dkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7002
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


On 01-07-2025 18:04, Nilawar, Badal wrote:
>
> On 01-07-2025 15:15, Greg KH wrote:
>> On Tue, Jul 01, 2025 at 02:02:15PM +0530, Nilawar, Badal wrote:
>>> On 28-06-2025 17:48, Greg KH wrote:
>>>>> + * @payload_size: size of the payload data in bytes
>>>>> + * @payload: data to be sent to the firmware
>>>>> + */
>>>>> +struct csc_heci_late_bind_req {
>>>>> +    struct mkhi_msg_hdr header;
>>>>> +    u32 type;
>>>>> +    u32 flags;
>>>> What is the endian of these fields?  And as this crosses the
>>>> kernel/hardware boundry, shouldn't these be __u32?
>>> endian of these fields is little endian, all the headers are little 
>>> endian.
>>> I will add comment at top.
>> No, use the proper types if this is little endian.  Don't rely on a
>> comment to catch things when it goes wrong.
>>
>>> On __u32 I doubt we need to do it as csc send copy it to internal 
>>> buffer.
>> If this crosses the kernel boundry, it needs to use the proper type.
>
> Understood. I will proceed with using __le32 in this context, provided 
> that Sasha agrees.

I believe __le{32, 16} is used only when the byte order is fixed and 
matches the host system's native endianness. Since the CSC controller is 
little-endian, is it necessary to specify the endianness here?
If it is mandatory to use the __le{32, 16} endian type, then is there 
need to convert endianness using cpu_to_le and le_to_cpu?

>
>>
>>>>> +{
>>>>> +    struct mei_cl_device *cldev;
>>>>> +    struct csc_heci_late_bind_req *req = NULL;
>>>>> +    struct csc_heci_late_bind_rsp rsp;
>>>>> +    size_t req_size;
>>>>> +    ssize_t ret;
>>>>> +
>>>>> +    if (!dev || !payload || !payload_size)
>>>>> +        return -EINVAL;
>>>> How can any of these ever happen as you control the callers of this
>>>> function?
>>> I will add WARN here.
>> So you will end up crashing the machine and getting a CVE assigned for
>> it?
>>
>> Please no.  If it can't happen, then don't check for it.  If it can
>> happen, great, handle it properly.  Don't just give up and cause a
>> system to reboot, that's a horrible way to write kernel code.
>
> Fine, will drop the idea of WARN here.
>
> Thanks,
> Badal
>
>>
>> thanks,
>>
>> greg k-h
