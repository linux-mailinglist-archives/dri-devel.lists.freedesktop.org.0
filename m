Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D737FBF1E9A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B4E10E464;
	Mon, 20 Oct 2025 14:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9w9jzJT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F1A110E464;
 Mon, 20 Oct 2025 14:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760971709; x=1792507709;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IgvWdg2s4LaIhRp+iNUJ5nA6T85p0MtHWANwPi9GwP0=;
 b=Y9w9jzJTISxH4fGhkS37HI0lfqirQodKo5QxYCBkCaDD7d/4AIpxwpGi
 HBIZLYSK6tZYAlzmNVAojhw0nOXSrlKZsO9pCeOSwcjxY95gmG9eqxAZN
 S4C7KIW83cMrD9TON5UEtygIwOUEiYzgnkxItkCu4j7H/VP7ytzdGqdLb
 hEoYyijA6A9ZCfugYdV7Mc5pqH6JkVojdDqwAxyRTLE5lGPy802s15gby
 57P5d2M5SoQNU4fzwJIC3ZYSkVeISXvXgjQvsJKuXzNuNsGnD6/iWmWRM
 P/7+t+ESKgfsh9EhkOCXIehUEtqkTcGERaZIvYjtRSjdzGvYkgDQ3Dm3L w==;
X-CSE-ConnectionGUID: wqS0oZe6TySVa91eVLtxBg==
X-CSE-MsgGUID: BG2T1Q6zQVSDJKY+765sUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66950415"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="66950415"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:48:28 -0700
X-CSE-ConnectionGUID: aKBnOFg/Ta63mCAaJlIPeQ==
X-CSE-MsgGUID: PYwEB8QCSciJq1KfVKOHsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; d="scan'208";a="188632431"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 07:48:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:48:27 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 07:48:27 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 07:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KLmr/Y3P9F7FMZN8/HrHu26c7giAqPirlyLldkAY35HPTz/+m482egRLSmkbdLQGuT8bK3oXEPudVEHnO4IVYykEeJx37nwFeqSKCwFoPXQ7BFPi1/TjG2IJG7KpBVZMlKaDLwN5YV61wbHH4xt7s3q+ibHE46kh/KBgtdMuDFpxgpqOFfvAf/V56XoEv1qk89oHIVXsXBsJAFIuDo7DOsBK6MY6Xxj+XFSBKR5x1337yLRAKAZZUDnu9ZZN6DO3oiBmXDWSkGt9xCNjJmBqvBktM89yhuk5eSgI6rSlxQBKtrxoYlzyFDsE8+VI9h66kgSFwwJqebwNSRAIJGCrDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=09VHnmI8yIGHJAb7KM5vHBU27grv4RcbaGNYc9/sDIk=;
 b=h9llPhEkcVYiwv10ksmGTplg4aWhpystztIhhPwQDcV5i0y0KWvy7kbzcTOUdRD+flq03CXXTR/BHABlvUkcSlpQWYmG99FgVYtJkzuydAM6pZm+hi48jY5M7PwU8vtzD4pUiL2G1zhMtTT2q5tPMCSuqN6It1ctESdEGtP6IfTWFM8GUAOWd+9UvHrx4XDXL/DvOUVWsrsHSfi669UZxaUclQIbe1bt6kS/1KPgZe3D4PzMCurzFrWj3tyWji0YY74y3MqOqhraflxkM8h7QjXXOoWqg8/7DokU1iuy7fX+lVgIIoc2YNNl6FBnzbk1l/0Pt77EIh6G0NYiyKHBOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 SN7PR11MB7114.namprd11.prod.outlook.com (2603:10b6:806:299::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 14:48:19 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 14:48:17 +0000
Date: Mon, 20 Oct 2025 16:48:12 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Alex Williamson <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Lukasz
 Laguna" <lukasz.laguna@intel.com>
Subject: Re: [PATCH 02/26] drm/xe: Move migration support to device-level
 struct
Message-ID: <l5k2tpbcc5mfkuk3gulnqp7jdiwmya6jxh3lqxtj6rpzax3jfo@24fhxq7llbyh>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-3-michal.winiarski@intel.com>
 <d647da55-9b6b-40fb-95c3-53912fb07a76@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d647da55-9b6b-40fb-95c3-53912fb07a76@intel.com>
X-ClientProxiedBy: VI1PR06CA0174.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::31) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|SN7PR11MB7114:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cfe504c-4ddf-4cca-8efb-08de0fe7b3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1pjcDIxeE43VEJ5MlRUZXhMdzkybFVxYjNCdnFrejJhMzNZSzNFL2RhZnAv?=
 =?utf-8?B?N2RyUWxsZDdvVSsyV2ZWQWlBcjRNK2l6dkRTL1RwUzJieHBPSXl5M3N5OU85?=
 =?utf-8?B?NXp6MmdFWGNnQTlIMllRVG0rYTd0R3h0VVVvbVJhcnhtcTdVTmcraC9FM1dT?=
 =?utf-8?B?b3RVZkFPRGFYQzVncFJJd2RycGRwRVlUU2ZkSWJjOEo1dFA5MUdXZzcvRjcy?=
 =?utf-8?B?K21vK2s4OUNLaC81Nm1wR0VyWDhkZGUyQWt4WUVuaGlBek1kUUtaRk41ZHBM?=
 =?utf-8?B?blZscDhuMFJ4TnJ1WWJDMFJHaVB6SHUvOU12QTQ1YlkzOGxaVGc4bytBU011?=
 =?utf-8?B?aGFmTHdRNnVERFgwZGpscE8wclV5Z1I1KzhHdDIxdEJwNVVmOHpqYUN0RGtY?=
 =?utf-8?B?eS9SczBsL1pxcW85WlVBdWlMK251OXdqcERDemdnM1lhT0R3OW90OFhyYUNu?=
 =?utf-8?B?a3A1RFlEdFV4Ulk3MEZWNHRoaHFlcC9UT05COXdSRkVqTWpCRk0veWR1OHJH?=
 =?utf-8?B?akJJWFIybDBFdXlPQVdQZUNpM1VWMDcybzdtaldibE5Xdkp5Q2R4WUJhNGQ2?=
 =?utf-8?B?VGozTGJqdDJLK0J5TDlPKzMrRTEvVTVBeGk5Yk9iWUZoKytqNzEzeG5FVllZ?=
 =?utf-8?B?UVhSam1uUkd4UWpLVkFBREF3czhOVTJic0NMNktVdnJWUVh5WTdpbHBDdjVL?=
 =?utf-8?B?ZUVnYlVabSs4ZEI3cEhqam1kMjdNeXRURkowTjQwYUFQR2Z2K0dWRDN0Qlp2?=
 =?utf-8?B?RDhjcThZTHlmT1NEZVE4YTg0N2JhZTRaL1BTTndVdzRPWHljanEwSDJJaGdN?=
 =?utf-8?B?VWRUM1lUanRwTE05dEN0WDNrd3ZHb1lpa1pvWXdoODhJZVc4cFNTSmRyT1hM?=
 =?utf-8?B?MVBPdGgzSko2UDBDZzk4cUU0am5qUnVQd2hwQ3hDTjNqVDhaUzFPaTd2c0Ex?=
 =?utf-8?B?SzFsNlNra1hOMUFhQjk4MkhBcWZaRDAwMkhQL3F0dzl0VzBJWUduY0Z1OThD?=
 =?utf-8?B?TytkSEt1NVJvMkZnT1JmUi83aFUyVER1Z28xK1RyK2hvY1BralBSWG5JK0Ru?=
 =?utf-8?B?cGI3UmNwR29tdnBVZnEzS3FqcndFd2VOamdYRllVdXYrOTlmOVBtN0QxMTFV?=
 =?utf-8?B?WC9KOFRPeStxZDltU0dtb3dhOTFqdllObHp2cjVBSUN5QlQxaGl3R0E2WFJk?=
 =?utf-8?B?MmVoVHNaZ2JremtlRnhjeVpWQmdRS2lXb0JpTzMwQnJBSytkSUdTanNWU1Mw?=
 =?utf-8?B?WlJzU1RCdjY2K3RvK0JlYmxkTlNiM2tBbVBWeWtFdnBFMlova0dvM0dLd0pw?=
 =?utf-8?B?UC9uZUtJL1R2Ymg4RGZuNW92SGMxZDQvK3R6M1VWQU1BZldMdFV3Umo4S1Rq?=
 =?utf-8?B?NHY3c1phQk9OZVQxbUtucWN3WjBGSjl5c1lwby9nV3dqSEx0VmhQWTByaUh2?=
 =?utf-8?B?cmViYmRYWS9qS0xiSGJGb0FlUHNWTDZ1UmJLS1A2WVpSUHN2TVBWM3Z0bUxD?=
 =?utf-8?B?NkZlYXpTd2phVzJIeWFNWEtkWTdRYkhGOEhONldvZTd3NEhxMmUxa1VMS2Ju?=
 =?utf-8?B?YzJYZExFcng4WjZCQlVCUVFJSmphUGtUSndJR0pRbHB6ZmRHUDFGd3IxN3Fw?=
 =?utf-8?B?dnRlSW5EU2RqMFlnNVpHRU8vTklmbHA3Qmk5WE8yaGVBNXgrV0E5ZWRvNlNx?=
 =?utf-8?B?NDM5V1NoSEtjdGV6SkZ1SytJUlVBbUJ6YnV4VlVBeEJPb2NDU2ZZelRuTGFa?=
 =?utf-8?B?WHRzNHFIUkpZSExmZ25aZVlSK1lyZG1yTEJEbTNoR2w3TFpFdWhSV1BYNlZ6?=
 =?utf-8?B?czV6eTVuTGc5THR4MlNKcmZocU50TCtUdWJVYXVONTRuWjdRUjFiQ0d2R0RE?=
 =?utf-8?B?dUpTcitzZkJsNjJsc1E5UE8rYXJZVGhPdWVVanQ2eCtvOVVYMVd3RUVyeHRU?=
 =?utf-8?Q?YEIAGhBuC5zK02WW86KqyhB3L5AThkzT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHpmcWx0RmpoSDNjRGpYYXVWb3I0eUZlM0RJRWpoT2ZzcFo3RGVQdXd6V1VP?=
 =?utf-8?B?NnZGNDFaUDdtR2JKUHdHc05XVUtzbWlUZEZxdHVuTHgwbUlIb01TT2lkdS9u?=
 =?utf-8?B?L2xPbStpTTQ5MCtiQUcvTUQ3ZGJRN0h1Rlhtd3p5TkFZRStMREFYMXFKZXlH?=
 =?utf-8?B?ZjkrTzFDWGtoSnVZNnJsOVNvN1lFYWRBaEhXR1BBY2lVNXdodStLWFlpaVBF?=
 =?utf-8?B?dDBHbTlsNzdCeEtPbEpVbGxHbzU0Z2ErM2VZOWpsa1JNL3h5WXhuWkJNQUds?=
 =?utf-8?B?NUJVV2syNStEbzYrUFpqa2k4VWRyUmVNSXpaRHc2bzJZQUtWQ2xFN3Y3Vkl2?=
 =?utf-8?B?ZUJXKzZZdW54RlI4enp4ZW5SWVhUdkd1WXpXZE1CR2FiY202bnZWdnBzb2dx?=
 =?utf-8?B?REdPRnNKVDdBUkpoTHFVNE1jOEdUQW9zZXBzTVRDNHByNmU1RWxCM2V4bTly?=
 =?utf-8?B?WkVsTW5WeXVZa0ZJUXN2YVdYRUtCZnFLTFJSeFJiT2lLYzNkY2hsYjBsanhh?=
 =?utf-8?B?OVgrSkxwWjc1ODVnUHNydDRoTkhLOFd4R1FzbEFyaytrd0ViZi9QVS8wQnJC?=
 =?utf-8?B?R3ZGbHkvK2VUWFh1RGd2NWhLVCtEWWZoZlhKb2xZMHBqdzd6RU5qWmp5WCs1?=
 =?utf-8?B?ZDgwZEhueXl5dFpaTXNqMnBhSjRiekhGMnJtNkV3MUEzbk10UlhLbUhiY3Bu?=
 =?utf-8?B?WDNKdWFwNXYycTFLTzBuRGlldU1FbHB1ZW9HSFB1NVp0QkxYVy9VOVBURGJr?=
 =?utf-8?B?T3VaUHpiWDZqVVlZQ05NM3p1NThqNkw1ODZsRlQrU0dnQ2hLS2szQ0h3NkVG?=
 =?utf-8?B?eE9jbnJyclcxVzk0ZjlYOXBJR29JU2pqdDd1WFNHMGV1aktaeUM4cjhLNXFl?=
 =?utf-8?B?cjhNZmVyNFRUTEFCZy95akZvSWQ1eTgydXltQlFWNWtXRjBHQW9UQU1DYklR?=
 =?utf-8?B?WE9aTGs2RCtSOUlYdXRXVjlQMDg0bzJWU3VRRUt1UzNwT0xqWlB1NEZ6NGhV?=
 =?utf-8?B?bEdWSmtKNnNqTmphN2M1THRZMTJUSTZQNXl1bkEvdVJJTm5wSVFWWlpFbktE?=
 =?utf-8?B?aGp0MG13OUR5YXRPc3F3SDcwaWRzUW9rR21JYVk3R01DZy9YNis0SmZIdi9W?=
 =?utf-8?B?azNLMzRscVltNld4NDgyMWljU3R5ZS9xNFJNR21kL2tzVVBIOGxweVFUNUVV?=
 =?utf-8?B?M3V4eWZ4MkYwTm85TkZLUmNxMml1SFdublpwNVhUeDhVb1lwbVNGWFU4MzRz?=
 =?utf-8?B?ZzZ0eVE2NFhCMUk5L2VuK3BsWjdUSVhHMEtHaVhjUUFMcXZVQ1U2NGFhRmdq?=
 =?utf-8?B?Rk5UM2xOZzY2NnNkeXl0dWZGeDVUN2VBenhLdERQTkx5NGZyd0tkTXdFTjU4?=
 =?utf-8?B?SlRGbVF2NkNQTHpDKzhmNGRkNjBYSk5sd0RhNTluNVV5aGtZVVJKbHcyVkpU?=
 =?utf-8?B?bFR0MENPVVZMZFBUN1JMckE1TTlrOGxYSUh0MXRjQTc3Q3h1UXpWNEUvVFlX?=
 =?utf-8?B?K09rZ0U5WUI4NXZEbVhiQWlIL3ArR1FyblFCYmpMcUF1N3NwbHZkc2ZYcDhF?=
 =?utf-8?B?WkdPZFUyd0U3aUlRTm1CV205S0wwdk9JR1pSRXd6ZkV0Y2crRjVNbE5ISzVa?=
 =?utf-8?B?RnhzTDh6c2JmemducitHL0tabkUyeFZ4b2tYVTgxNGl1WkNvQUxWTVUrWWlu?=
 =?utf-8?B?OTNVZ1dDVVd6RWtPcURwMHI5Y3VLS3U5Q2JGejNxNjdrTXA1ZHVVSWthbmtD?=
 =?utf-8?B?bE42dUMzN2l1NzRLSHVmNTd3Ny9tUkZSVGRtUmFFS0JTb2dLVG1xeXhXQWdZ?=
 =?utf-8?B?cHo3U29DNzIzdGUxaUpFS0E5cS9zcy9nN2NZU29aN3pKQUFkT2w5MHh2OW1O?=
 =?utf-8?B?dUttQzI3elJreitBaEErNWkvNDhVTEF2N3YxL1NuV0dTamtGVE8yNjk2TE9Y?=
 =?utf-8?B?UEFPQktIUUZiMFpZeHc5QVQweFNSYTJDOVpiaEJQemVOd2JXK20reTVHQkhE?=
 =?utf-8?B?UzNFalJWRzk3K0dCb1BzamtrbjhoYkw4TXBUZm5yUGllRTZGQ2REWkg0QVdp?=
 =?utf-8?B?UDM1cXhDN3ZqOEZ3aThCcVc0bU4vMkpTV2FaWGU2MlQ4MXBKa3U4dWZFNUVo?=
 =?utf-8?B?bWNNeUlYYXZoNms0Z3NLMUdLSzMwYWtDSXdUcStZMnpSdjdia1M3aDVwbHZu?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cfe504c-4ddf-4cca-8efb-08de0fe7b3ec
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 14:48:17.7300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qx1ha7pdpFVJ+4VRXEq7lVy32EiwwAzekL+xewfJ973s/2DZUMKX8VJs8yacDbMx+0Ku9mg5wvVNSen2FjbJTZgtZ+w96RNXcJuYu6685hM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7114
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

On Sun, Oct 12, 2025 at 08:58:42PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> > Upcoming changes will allow users to control VF state and obtain its
> > migration data with a device-level granularity (not tile/gt).
> > Change the data structures to reflect that and move the GT-level
> > migration init to happen after device-level init.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/Makefile                   |  1 +
> >  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 12 +-----
> >  .../drm/xe/xe_gt_sriov_pf_migration_types.h   |  3 --
> >  drivers/gpu/drm/xe/xe_sriov_pf.c              |  5 +++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.c    | 43 +++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_sriov_pf_migration.h    | 27 ++++++++++++
> >  .../gpu/drm/xe/xe_sriov_pf_migration_types.h  |  0
> >  drivers/gpu/drm/xe/xe_sriov_pf_types.h        |  5 +++
> >  8 files changed, 83 insertions(+), 13 deletions(-)
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> >  create mode 100644 drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > 
> > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > index 84321fad32658..71f685a315dca 100644
> > --- a/drivers/gpu/drm/xe/Makefile
> > +++ b/drivers/gpu/drm/xe/Makefile
> > @@ -176,6 +176,7 @@ xe-$(CONFIG_PCI_IOV) += \
> >  	xe_sriov_pf.o \
> >  	xe_sriov_pf_control.o \
> >  	xe_sriov_pf_debugfs.o \
> > +	xe_sriov_pf_migration.o \
> >  	xe_sriov_pf_service.o \
> >  	xe_tile_sriov_pf_debugfs.o
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > index a5bf327ef8889..ca28f45aaf481 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> > @@ -13,6 +13,7 @@
> >  #include "xe_guc.h"
> >  #include "xe_guc_ct.h"
> >  #include "xe_sriov.h"
> > +#include "xe_sriov_pf_migration.h"
> >  
> >  /* Return: number of dwords saved/restored/required or a negative error code on failure */
> >  static int guc_action_vf_save_restore(struct xe_guc *guc, u32 vfid, u32 opcode,
> > @@ -115,8 +116,7 @@ static int pf_send_guc_restore_vf_state(struct xe_gt *gt, unsigned int vfid,
> >  
> >  static bool pf_migration_supported(struct xe_gt *gt)
> >  {
> > -	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
> > -	return gt->sriov.pf.migration.supported;
> > +	return xe_sriov_pf_migration_supported(gt_to_xe(gt));
> >  }
> >  
> >  static struct mutex *pf_migration_mutex(struct xe_gt *gt)
> > @@ -382,12 +382,6 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
> >  }
> >  #endif /* CONFIG_DEBUG_FS */
> >  
> > -static bool pf_check_migration_support(struct xe_gt *gt)
> > -{
> > -	/* XXX: for now this is for feature enabling only */
> > -	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> > -}
> > -
> >  /**
> >   * xe_gt_sriov_pf_migration_init() - Initialize support for VF migration.
> >   * @gt: the &xe_gt
> > @@ -403,8 +397,6 @@ int xe_gt_sriov_pf_migration_init(struct xe_gt *gt)
> >  
> >  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
> >  
> > -	gt->sriov.pf.migration.supported = pf_check_migration_support(gt);
> > -
> >  	if (!pf_migration_supported(gt))
> >  		return 0;
> >  
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > index 1f3110b6d44fa..9d672feac5f04 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration_types.h
> > @@ -30,9 +30,6 @@ struct xe_gt_sriov_state_snapshot {
> >   * Used by the PF driver to maintain non-VF specific per-GT data.
> >   */
> >  struct xe_gt_sriov_pf_migration {
> > -	/** @supported: indicates whether the feature is supported */
> > -	bool supported;
> > -
> >  	/** @snapshot_lock: protects all VFs snapshots */
> >  	struct mutex snapshot_lock;
> >  };
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > index bc1ab9ee31d92..95743c7af8050 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> > @@ -15,6 +15,7 @@
> >  #include "xe_sriov.h"
> >  #include "xe_sriov_pf.h"
> >  #include "xe_sriov_pf_helpers.h"
> > +#include "xe_sriov_pf_migration.h"
> >  #include "xe_sriov_pf_service.h"
> >  #include "xe_sriov_printk.h"
> >  
> > @@ -101,6 +102,10 @@ int xe_sriov_pf_init_early(struct xe_device *xe)
> >  	if (err)
> >  		return err;
> >  
> > +	err = xe_sriov_pf_migration_init(xe);
> > +	if (err)
> > +		return err;
> > +
> >  	xe_sriov_pf_service_init(xe);
> >  
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > new file mode 100644
> > index 0000000000000..cf6a210d5597a
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.c
> > @@ -0,0 +1,43 @@
> > +// SPDX-License-Identifier: MIT
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#include "xe_sriov.h"
> > +#include "xe_sriov_pf_migration.h"
> > +
> > +/**
> > + * xe_sriov_pf_migration_supported() - Check if SR-IOV VF migration is supported by the device
> > + * @xe: the &struct xe_device
> 
> nit: this will render better:
> 
> 	@xe: the struct &xe_device
> 
> but in other places we just use:
> 
> 	@xe: the &xe_device

Indeed - I'll change it (here and in other instances though the series).

> 
> > + *
> > + * Return: true if migration is supported, false otherwise
> > + */
> > +bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	return xe->sriov.pf.migration.supported;
> > +}
> > +
> > +static bool pf_check_migration_support(struct xe_device *xe)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> 
> we don't need this here for now

Ok.

> 
> > +
> > +	/* XXX: for now this is for feature enabling only */
> > +	return IS_ENABLED(CONFIG_DRM_XE_DEBUG);
> > +}
> > +
> > +/**
> > + * xe_sriov_pf_migration_init() - Initialize support for SR-IOV VF migration.
> > + * @xe: the &struct xe_device
> > + *
> > + * Return: 0 on success or a negative error code on failure.
> > + */
> > +int xe_sriov_pf_migration_init(struct xe_device *xe)
> > +{
> > +	xe_assert(xe, IS_SRIOV_PF(xe));
> > +
> > +	xe->sriov.pf.migration.supported = pf_check_migration_support(xe);
> > +
> > +	return 0;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > new file mode 100644
> > index 0000000000000..d3058b6682192
> > --- /dev/null
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_migration.h
> > @@ -0,0 +1,27 @@
> > +/* SPDX-License-Identifier: MIT */
> > +/*
> > + * Copyright © 2025 Intel Corporation
> > + */
> > +
> > +#ifndef _XE_SRIOV_PF_MIGRATION_H_
> > +#define _XE_SRIOV_PF_MIGRATION_H_
> > +
> > +#include <linux/types.h>
> > +
> > +struct xe_device;
> > +
> > +#ifdef CONFIG_PCI_IOV
> > +int xe_sriov_pf_migration_init(struct xe_device *xe);
> > +bool xe_sriov_pf_migration_supported(struct xe_device *xe);
> > +#else
> > +static inline int xe_sriov_pf_migration_init(struct xe_device *xe)
> > +{
> > +	return 0;
> > +}
> > +static inline bool xe_sriov_pf_migration_supported(struct xe_device *xe)
> > +{
> > +	return false;
> > +}
> > +#endif
> > +
> > +#endif
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_migration_types.h
> > new file mode 100644
> > index 0000000000000..e69de29bb2d1d
> > diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_types.h b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > index 956a88f9f213d..2d2fcc0a2f258 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sriov_pf_types.h
> > @@ -32,6 +32,11 @@ struct xe_device_pf {
> >  	/** @driver_max_vfs: Maximum number of VFs supported by the driver. */
> >  	u16 driver_max_vfs;
> >  
> 
> I guess you need to document @migration too to make it work

Ok.

> 
> > +	struct {
> > +		/** @migration.supported: indicates whether VF migration feature is supported */
> > +		bool supported;
> > +	} migration;
> 
> also can you move that closer to other sub-component "service" below ?

Will do.

> 
> > +
> >  	/** @master_lock: protects all VFs configurations across GTs */
> >  	struct mutex master_lock;
> >  
> 
> but otherwise LGTM, so with above fixed,
> 
> 	Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 


Thanks,
-Michał
