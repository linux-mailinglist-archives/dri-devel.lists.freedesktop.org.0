Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D692C8D677
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3E10E7B6;
	Thu, 27 Nov 2025 08:50:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eAhlswM/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9CA10E7B9;
 Thu, 27 Nov 2025 08:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764233435; x=1795769435;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=iUtKgTXuMr4rooCEbHb9R96Blp7UfmX42pI3Ex4IEVk=;
 b=eAhlswM/meEbv1uqL8W4Vz4DkT0+JL0pLvEkBBES2erRl+EatFZYKmU1
 cWMd2KteYbeaSAAT5x5NsDMoFB5d2kCYbyb2Gb5m8Clt0hSZkFTbKXF/I
 L/orzCdjl9b1/HP31S5QdcFItjY5O4C+q30X2m/aGSK8h8wrYdOAttMwQ
 5c3C5WYbWSTya4KpMUaYLcwq9MLX7gvV2ILqnTLGORJFSe2RMoy4hcYkO
 FJrBqC+Auvj42epD0DW78fjhKx/C3wd5UeJFyWKei2ZjiSZ9qqeguG6oL
 zEWSOQ6YQKNJO7fx0uDSGpXYVepWXeE/OxQ/Zpws0zTX5C+WLmumlWhKf w==;
X-CSE-ConnectionGUID: XftMi60IR/iLqAfTlODWZg==
X-CSE-MsgGUID: WhRWI2TwR/KtG435RjuFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65284226"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="65284226"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 00:50:26 -0800
X-CSE-ConnectionGUID: bEDZlVglT3CiJMu+OveThg==
X-CSE-MsgGUID: 5dTO/OfQR8KrjK2ntCmFQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="193990154"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 00:50:26 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:50:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 27 Nov 2025 00:50:25 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 27 Nov 2025 00:50:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkoc8pD1Az4peaqY3Gj5bsSNQ+IWS2EvQBnKWxdb+voya1jwzS9Qw0HQ2O/VwxugsMpZGzXo9fdyf0AAWYjqPm9u+UqSXTC6c5k20MqO+xQQfMKS7yZSXNzwoeFwDJ8VPJ4mY0gdq8CZzeQfvWVxm+/JQjHDH5hJ/kT9Y+OuFPJFMtPrRgNW0Q/dLSnT+nJUk2BhgKIgqiFXqz/MFSdLTLBwiron1Z+6IsQJZhKBqkypIy/Tw/M+ltns1V7JCY5p5Ls/apmnwlkCQKiDRyRwHenu5FTs2htOt+vfo81pW5q43jA5L+3+I71Rpst6gvmZz1b9FRZ9mpM/NDUCLrNfTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y+fof737Gkjh8FnoJsKR4sTL+vq0eAiVYQ5v3YOlzoE=;
 b=kURyUZZXti4qjfsB2yBFmcSXHwSpqdv8cxvX/OjNisGgorOfIK0tGcp8CHo7qeNwYzLcoIG6QzPhtAABMWRSmJV3At3gzIttKIsVD6K7ePqvGyY63GtG4cEUNXoWlB6Tzp51a5aYowlJx7Dp2aIL1v6fLpEjH1l0rh/KBoqjARJEisR9mnL96zEHPYMvYR/ca9S8qvgJebW0jV+EOr26+hIIPduD8hj8pS107YBhH+r/nRPdC+x1hzsGL53BSL4oOwCjXSnRCBe5SD2usM09dKojAKDF6Nc0VhHDN4KmoyKpaQuowgDu2No7LJhiWKUo1o/gMmeMBdYuxmJo0fZMng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5057.namprd11.prod.outlook.com (2603:10b6:303:6c::15)
 by BY1PR11MB8029.namprd11.prod.outlook.com (2603:10b6:a03:526::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 08:50:06 +0000
Received: from CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc]) by CO1PR11MB5057.namprd11.prod.outlook.com
 ([fe80::3b75:a8d2:464e:30cc%3]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 08:50:06 +0000
Date: Thu, 27 Nov 2025 08:49:53 +0000
From: Krzysztof Karas <krzysztof.karas@intel.com>
To: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <stable@vger.kernel.org>, =?utf-8?B?6rmA6rCV66+8?= <km.kim1503@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>
Subject: Re: [PATCH] drm/i915/gem: NULL-initialize the eb->vma[].vma pointers
 in gem_do_execbuffer
Message-ID: <px4gshv546bmn3ta5depka4mjimqg6rcgwo6pba5u5gcknilyq@b5lxu37frqus>
"Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316"
References: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20251125133337.26483-2-krzysztof.niemiec@intel.com>
X-ClientProxiedBy: WA0P291CA0008.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::24) To CO1PR11MB5057.namprd11.prod.outlook.com
 (2603:10b6:303:6c::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5057:EE_|BY1PR11MB8029:EE_
X-MS-Office365-Filtering-Correlation-Id: 8920f504-496d-481e-bf4e-08de2d91f682
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlpzZUovNnp0WDR6WmUxcVluK3haaEEweEZrWnYvRFBvSG91RkFBdld2WVNo?=
 =?utf-8?B?aXBaQTB2N1o2Sk5iQkV2emU1RE9MNFIvT0Y1cmQxMVhnM0U0bjZCWXdkMmpS?=
 =?utf-8?B?YTV5S1dtZGEvVFdkamQ0a2g5Z2NSdE5oeHErMGVSY01rN2YvWDBSak1TRG5s?=
 =?utf-8?B?VnZ6Wlh6cnB3b0JPSTB2WEt0aE5PRkpqMFdla1hPWlR5U3pZelVURmlWcHV1?=
 =?utf-8?B?SWhYUE1kM29qNVJiUjA0b2RuUkgralUzWklzMURWTTRIUUlxNGJBWjMzUU9k?=
 =?utf-8?B?aTRFY2huNys0c0F5cE5RQU90ZGY4U3grYU5pZFFQSHBnaUpaMW41M2hic3NK?=
 =?utf-8?B?aVBQRkcyVUV2V1dsRW9DdG5yQ2dZejFFeGNKSzZSdStPNXlIS0t4U09xQ211?=
 =?utf-8?B?bVZHM3JaMnU5dWZLQTFidk1Rb200dzN1dGk1V243VXBOcVFCYmlPOU5ubWpQ?=
 =?utf-8?B?aS9Db0hWNWpqcHo3SEkwN3ZScmxqdUJZYVNCaGhTVE5MSHVEKzlvdWM2TUYy?=
 =?utf-8?B?WnpVTS96dFZ5K1NXVEJJTEZPUDhwWVZkVWhTa3RCR2FRUk9nSHoyT09LMEgw?=
 =?utf-8?B?Tlo4RjE0UUxtd0VZVzFCbzMyNksvajVOS1pucW9yMTFSQ1JwU2xZcHNjRE5B?=
 =?utf-8?B?R1BZYUkzY1hEbTJEOGRlajFpQTR6SkI2Mkc3K0cwdWxjMUc3YkhuQk5PTWU0?=
 =?utf-8?B?d3FxalQxSC9iVG9zSi9EclozTmRsUFR1VjRFYlo0SXhRL1ZIY3M3cng0cGh6?=
 =?utf-8?B?a1JRSysrOTVqYktkYmJzSTE1TVdHQXo4elQrUkJ6YkpzZ3pCRVhVM3dsYVRJ?=
 =?utf-8?B?ejZxT3cyNHZVTytuV3hyRjA5T1ZQdDhLUTQ3cDZXTFBBUWhBZnFtZGcvUlNJ?=
 =?utf-8?B?bzg1KzBaL0VnQU9kcE1sUENTVkFvSklQajY4bEtGdDQ5Ymk1cm4yU1QyQ2NO?=
 =?utf-8?B?VkVxMFhwK3gvb0QwZ3Zrelh3UXE4TTVNUW1Sak93ZU5tUSt0bTVLMzdXVU5p?=
 =?utf-8?B?OTdERjZSaXZENjYxaUN5UjBJckhqczBZQ29Kb0tjT1VQMm1HR3JuVXN6aFRY?=
 =?utf-8?B?MG0xa0hxb0VoNFNVU0dsWHVPaEVlbDdZQWFHTkVpS3ltUkp2bnlJVW5yN0Zo?=
 =?utf-8?B?b2EwZitXbUhxcFFVOEN5RXpIZXVpeGNRVGlqSzQ0TS9MOGxHcWd2NVhFN2ly?=
 =?utf-8?B?TDR2U1Z0Tk1VbDhlT3MvSzV1TE10RzIxZ3o3S0k3L2llbElHaVl6VXk3RGdM?=
 =?utf-8?B?N3ZkS0t0Y2dqTzBHQVN2RytXZlF6OG5ISTE1b2ZWUWdzNC9kaEhVSTZEN29R?=
 =?utf-8?B?dGx0dnd1VkdUOGtPKzYwa0l6aDdRYUo0T0FPWnl1RGJFRmNtOXBPbGJlTHVY?=
 =?utf-8?B?YjR5anpVTnFxRWtqZjMxenNJNEdudm96YU1iYlcvM0tkblU4ZGRYa1B6Tkhj?=
 =?utf-8?B?dUdMZDFoTjgwMEM5bGRKVldzc0F2UjB5ZTB6QkM4Q0hPZUJqaXgvNzJ0Sndy?=
 =?utf-8?B?MVVWUUk4R2ZuWmxTZ1RDM0N0eUFXRnVYWFhOT2s0SzhzVUhLVEJ2S1o2Tkdv?=
 =?utf-8?B?cUpKcU9xNzB6cDZERDNWaTZzeW5IbEpibG8vbVFLWEhiejJmR3pyQlpKVUda?=
 =?utf-8?B?ZWUrSFFWc2hkTHFWK2RET2pHZ0FVekdWZUtYcjdhbS9nOGFhMzRGdVdvVURX?=
 =?utf-8?B?a0U0UG85dTQwTnVSSVd6U2s3dERrb2lpZ0VzRHZhYm5BdFhqbDlhYUJ4ZnNP?=
 =?utf-8?B?TVJsTld5eHJvTnlXSVcrdHNSZzl6bEZzcnljbVY5SlFMWVVucmFMUHRqTjQr?=
 =?utf-8?B?MTNpVWVVc3V5SnFVK3Y4eGZaQmorZTUxa0lHSHdDU3h5ck9EQXpjMXMxOFZn?=
 =?utf-8?B?RGZyZklYc2ZTU1c5YVcyWStxdXJEVXRsNnl6aE1CV3F6aG9tN25Tdy84TEkw?=
 =?utf-8?Q?dJnAo5SwF5P0WndCSAEcslT0sxV4UQFy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5057.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxJckR6MjNxSEJIOUxLK1htM2l1YTlMNG14ZEUzNXpCTEFyRmt2VTh6QUtD?=
 =?utf-8?B?OXFQMmtpSndFRHorOW5ZM01PMFU2cDYxVERkNzVKYnNnZDhNdWJqTTRLR3Bo?=
 =?utf-8?B?RnZOa1JlakNxbHZnSEczbmwxYUQ2K0NGV2hPdnB2MENIWHhhMVFubGJtVnVJ?=
 =?utf-8?B?WGZEalJReGxaSFRUbWRlRnpnQmhwK05OSmdEWVJreWxoRFEwb1RvRjBCQ3dY?=
 =?utf-8?B?RFZwNlBtUEJFakphSURHZzBEQzA3dE9MMnJla1Yxb2Y3YkxLQzg0ajdXRnVz?=
 =?utf-8?B?Mk9nQUFBNVFRVEZTdkthZGdLRGJ4U1grTDI4dTgybi8wSEpneFV5M3Q3cnlK?=
 =?utf-8?B?WEowTW9jaDBDN09FUzhVa1lPamtRTVJtY0VHTlNqaHg2bVlBV3hQblJwVkgx?=
 =?utf-8?B?cDBweUVEanY3eU5qWEVaYjZ0S0ZLeGFyQzRCaVBwNUxuRldnWVhlUUdhcmM0?=
 =?utf-8?B?VWozeTRETlV3MExqRHYrTFU1SEV6T2VnQzdiTm0wNjFyUVF4aXRvL3pjK21B?=
 =?utf-8?B?UnBIakFhdlFxOXppTHdWNHUwWnpEYU1udkdmdWpLY1dtNFZMbTUrQlBNSVlU?=
 =?utf-8?B?Qzl0RGJqTXpnS0tzZFZ4Zmd6Znd1dWc1ZGlXeFBrV01XRkEybHBBNXdTY00z?=
 =?utf-8?B?MHd2bWxsYUpQN2Jkb21BTFNLTDRPK0FBRlFzejRUZWlLRW5CNTI2bCtFV2Ux?=
 =?utf-8?B?aG1VQUdjcmE0cDJyNFFSdDZVT2d5QlBiZG5iR3IzWFY1U3krcFltdDAyVC9F?=
 =?utf-8?B?K2F2UGJiQ2VCdWdBc01yQnREaW8wbDF3dWx5SFNORjlWbFQ4VWJIVkVaM0FQ?=
 =?utf-8?B?eVFMcDBhaDZxVDdRanlnNno1NzQ0K3JlRWhVSUVqVVFuc1FuWkg0ZHRyQlNP?=
 =?utf-8?B?V2llVXk0ajBBbS9HU3pOc0lYK2g2Q240Ykd3U1hmTjNUQ1FKZkRQa0xpdVc2?=
 =?utf-8?B?ZUdDQnR0VEZQdmlNWVhYZDdZR0ovZUNNK1dZUisySDF4SFB1WDNxdjUvWmM5?=
 =?utf-8?B?a1V2a0ZqK0Q5Z1hIWEtpMWtUWnh2Q2FJTW8rNlRFTlF2dUpDK1ZYMkc0NytF?=
 =?utf-8?B?MzRsNkNrU0s0bDVyZ002YVg0YS9lck1KUHdNaGdORHBjL0YyNUg5K0VxQU4z?=
 =?utf-8?B?cU5kcTdrd1FJbWZta004RG5lR25USFZvTUF0bmFzZXhkWDRiYVRwWWpmeHhy?=
 =?utf-8?B?c3YzN1RXZkN3Z1lvd3lKcHRIcnhFRzg3cSttckFBVEFUYUZ1cHpoVGVGc2VT?=
 =?utf-8?B?RjMyYWNLSnZXQ1BXTmVIOFVOUmhMK1h4UGlBYytYTk9lTzJFZU4yYXpkd1Qw?=
 =?utf-8?B?ODI4VXFWUnd2MEU3MkVuam42Tk8vQzJoNmY5R3FNSXBUS3ZyNTZtZnkrWFhq?=
 =?utf-8?B?ZnFlMitVS3JmUDV3VG5GS2xyQjg1WSs1YUhHQ0JaTzI3eEcwS09odzJFMjlJ?=
 =?utf-8?B?S0ZlV3YwSXhZWVgwbXdzNSt0ajNkQUc3ekc1MlNVamQ1WlU4Ym9SMUlGK0Nm?=
 =?utf-8?B?NmhsWjY4SFZCcEcwZElTZ2hGcG9ZU0RIMldjT1AzalRNUjBlOUg0MDd4aXhG?=
 =?utf-8?B?R3F3K1NnS3g4TlZGSkN4akdGOXZjdGxObDIxOTA0d2ZjajhJQXMzdFNTQUNi?=
 =?utf-8?B?UnV2WlBmRWtFWXN1SHAwZHdqKzA0VFJBOUdnWFd4WVAwREx5TTkvMjQ0SlJV?=
 =?utf-8?B?eUNlSTdrK3RnMlExZ2xkVS8vOGJwNjZKK1pzRVplTVRMS2dTOVVVcWNKQnB3?=
 =?utf-8?B?ZXdPaG9WcDUvNnRxVlVFdjZxa3NKejQzWWFaclJjK3I4YlRiMGRCWEUvZ2pU?=
 =?utf-8?B?NEJCL2VsendqNGg4VnVydDkyb0kvekFuM3dEazhJbU82NTYrSEU5N1lvRVRy?=
 =?utf-8?B?QWNheHgzVWdCOTBMa2ZBaE05SUM2VXNwVWIwRmQ3bitpeFllSVpOSE1GbGMr?=
 =?utf-8?B?SHpyMGl3d0o4eHNJWW9MZUJPMUQvbFQ2TVVQSGN3ZjRFTW9ONW9KRTh0MG1G?=
 =?utf-8?B?VkZpT3hMWFRaTzFrVDFFcUw1NjVkN00vSyt3Ulg2R2ZGVVAzdXJLOWFadStN?=
 =?utf-8?B?QWhBb2FaWmRQenVCSndReFhqc1VhWHJNMTFuTmJwOVRDZU1SanpHZ3Vva0Nm?=
 =?utf-8?B?WWszUHhoWmc1eVUwN0U3RFlWbTA2Zm5JNXRqVVlpdW5XeW5tb1JxcU1OS1Iz?=
 =?utf-8?B?ckE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8920f504-496d-481e-bf4e-08de2d91f682
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5057.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 08:50:06.4242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6NaaTHxSzvKY3VJ6lkCLoNaR3Xs7HrpsrE8vXIHkTyBj+YdY55zXf2le6KPkr9BSAcKkW9PfXVK7V9HbWd/IuaG2OXRY36ncCWhUh8XbYA8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8029
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

Hi Krzysztof,

> Initialize eb->vma[].vma pointers to NULL when the eb structure is first
> set up.
> 
> During the execution of eb_lookup_vmas(), the eb->vma array is
> successively filled up with struct eb_vma objects. This process includes
> calling eb_add_vma(), which might fail; however, even in the event of
> failure, eb->vma[i].vma is set for the currently processed buffer.
> 
> If eb_add_vma() fails, eb_lookup_vmas() returns with an error, which
> prompts a call to eb_release_vmas() to clean up the mess. Since
> eb_lookup_vmas() might fail during processing any (possibly not first)
> buffer, eb_release_vmas() checks whether a buffer's vma is NULL to know
> at what point did the lookup function fail.
> 
> In eb_lookup_vmas(), eb->vma[i].vma is set to NULL if either the helper
> function eb_lookup_vma() or eb_validate_vma() fails. eb->vma[i+1].vma is
> set to NULL in case i915_gem_object_userptr_submit_init() fails; the
> current one needs to be cleaned up by eb_release_vmas() at this point,
> so the next one is set. If eb_add_vma() fails, neither the current nor
> the next vma is nullified, which is a source of a NULL deref bug
> described in [1].
> 
> When entering eb_lookup_vmas(), the vma pointers are set to the slab
> poison value, instead of NULL. This doesn't matter for the actual
> lookup, since it gets overwritten anyway, however the eb_release_vmas()
> function only recognizes NULL as the stopping value, hence the pointers
> are being nullified as they go in case of intermediate failure. This
> patch changes the approach to filling them all with NULL at the start
> instead, rather than handling that manually during failure.
> 
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15062
> Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
> Reported-by: Gangmin Kim <km.kim1503@gmail.com>
> Cc: <stable@vger.kernel.org> # 5.16.x
> Signed-off-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> ---

LGTM:
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>

-- 
Best Regards,
Krzysztof
