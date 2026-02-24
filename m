Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCpwE2VnnWlgPQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:55:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51C41840D8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A4510E51E;
	Tue, 24 Feb 2026 08:54:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VKmPq+J+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF61E10E517;
 Tue, 24 Feb 2026 08:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771923297; x=1803459297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Q413n8DKwEsBNnj8GQz+bAayc0/nv/4TzqLp5XryWZo=;
 b=VKmPq+J+315R1UcPYAwi7t57OfqjwfoZVp++KRUMCHlS6wJ7l8TcuYQF
 EHpv8tqVPTVDAO221Y18DyohfvxPsFt8yQQLn3pfC34m7TBSw4BgJfZfe
 D9fMQhUrbrixiZAbuAi6+bo5tJudR1Ju/JmEHwgAZKsiaWWzkeUn+ug1X
 PlQuNIvTYPT04wSpWQu+sSUF4Ykvsue9CYfRnDI0Yt93T1z2RIfFugk6o
 XB53m0NFn1Lq48KGo0hZPW4cUAZ1CotFgRGv3DlWUtrBb9UEijRWIRifu
 u5YcXqntqP4gWNsPtteM+9dxdYfxehStIcwFFMyDw9Fm2qoL6i5WFm+OU Q==;
X-CSE-ConnectionGUID: ETpYnbW1SGShNMyzMb8aaw==
X-CSE-MsgGUID: OugWpyxKRni6g8RBL7HISg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83643301"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83643301"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:54:56 -0800
X-CSE-ConnectionGUID: c6q3KTbQQT2GeBI8TGA7PA==
X-CSE-MsgGUID: BonbQeLLR1qqP2HRRTDaDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="219333172"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 00:54:56 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:54:56 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 00:54:56 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 00:54:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mippLHDXhe/xpIb8vTbDPaEgo5+1cGfld4o1eUOTwvq91yK4US/vcrR4nDU1Vs3Yg5DUGH2tckqYzr1gN7w18vwVCiZ40wB9eghmuPw2/P9tpwe5Sj9+vMBIoivVW14myOtydM6iQIqW/b9SNZJCSpdFbS9H/GU8iuR6GfUkuzhSB7bRzcxgynSqe+0+BhUC2cELCpi1WvEOfktq8PIcm9yBuSSVoYmDFxqZ+jPKN43OKk5U/s4XMEVWTwvV0WNKSTDfxuUqRNxchuhNKHUOzU4GSf9Nrs6N8SP5+96Bgk7nytOxUtJDAHvHksfnquKry/8RQ32lpY8jYWwMoxf4Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhQ+8UKEa9trRzB0/BfDuB8Ja50d9bMs/k23J4CXX7g=;
 b=W+vxk8pWGHvvuegPgL6GEObea7KQa1Ypa0JVbcpkJNWB7Gk6aqmsz77fVxtKgeF63PTsqrmnQ2Udy4eM28yufvXl6HuuFWhK8a0+3Wz1yNqoGiAxAsi/9TlVH9oZJMZ6hgTFQtokYuksBCgqDXGCIEgRD1U85Vlf6mN+YRDJg9GQEJ11+JKK67us4sA58omHWOUPzlUM7LJJplniwMTRxEsDqwLlJhHjXewYq76yIJF+GIDLdAXMLLH7av+fiJl4WCH6fpDuGzLp9xp9EQ/1nqEfBNlMwuEcbZutn5tduL7RqV8JngZ8/dUAvak7+tEPSdu6vRNlEGBsRTSoJHed1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 08:54:53 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 08:54:52 +0000
Message-ID: <a6f1c6e3-c226-4aae-b8fc-64c3bac2f251@intel.com>
Date: Tue, 24 Feb 2026 14:24:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/7] User readable error codes on atomic_ioctl failure
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, <xaver.hugl@kde.org>, <harry.wentland@amd.com>,
 <uma.shankar@intel.com>, <louis.chauvet@bootlin.com>,
 <naveen1.kumar@intel.com>, <ramya.krishna.yella@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, Suraj Kandpal <suraj.kandpal@intel.com>
References: <20260223-atomic-v10-0-f59c8def2e70@intel.com>
 <1a4462b8-def9-4474-8382-6e99b7c8276d@intel.com> <aZ1OIDsVfFvyHUK5@intel.com>
 <5f04b5f1-744e-449e-9a45-00fd477256fc@intel.com> <aZ1lbnop84k4du6N@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <aZ1lbnop84k4du6N@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0035.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::6) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: e507fde3-357d-4e7e-2c1f-08de73825fd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rmpkc0U0bk5heVhlTC85bERuWHRadzEzTHppS3E5c3BrQUJ0MlNaeXFrSElH?=
 =?utf-8?B?NlRmaWdIcXZEY3ZqQm0zUDBHMnNuTmxjYWpMalFUUytoWHd2L25ZcWNhUGtD?=
 =?utf-8?B?b1c3Vm1HVFhZc3FKSHplQkRMUk85K0hVS1ZYVHFYMG5sZWw0SXNZb1pWOU1X?=
 =?utf-8?B?aFVDTmN0T24vanU0QVl4MmFCbVkyUXdlS3JhVnB1c2RWWndHYUZpUi9wK2xt?=
 =?utf-8?B?ZTFobWVBVDFNZGRnenhUR1ZDalJTN3o2ajRYMFh5cUxiY2UxL2hzeHlvamdT?=
 =?utf-8?B?Q1VsTFdxcjZkY0Y2djBmSnlHamtValhaRHRTQkRmbkRBYVYyNXZTS2NZUmtU?=
 =?utf-8?B?aWRoMWtFNlRnQVVvSXluOGl5SkFsT2NHSHJzZUpvUlRRTXQraVFMN2lFa0tl?=
 =?utf-8?B?Njc3bVNWTHlka0FZYXhjckNxbjV6VHBOQXJneHc3SFEwa2sxQmFsUWRKV1Qx?=
 =?utf-8?B?eE02cGFldVpvQjVkWUZ5VFZtMXRJMkEvT2N4cEJUaEMrUkU1RWxrOFRtdml5?=
 =?utf-8?B?OXR0bTdOL1dLS0puVDFJdWFwaFRoL05GY3FXd0hwT3BHOG13Q09Ec1hQUzlH?=
 =?utf-8?B?WkE5SGFUOFBRZzFlZnRVVnl6NHZra1Vzc1pUc0FKRk12NWYzcDJOS3V4cUFC?=
 =?utf-8?B?NG1rQlpWMnNUOE9qdElvclp0Y3A4WWd1TWdiV1NsU0IzSlpocWNvbCtDOExh?=
 =?utf-8?B?YStmUVNtNVByaXNrUFNzTjJ0V0I2Q3oxZERuS3RPQyt6MGVYQzhMNnFVYWJy?=
 =?utf-8?B?R3h1cFlVeDdDRFRKblB2c2RBNDRKK01BWUl5ZHBkS1Z2eTJtM3QxSnp6WUsy?=
 =?utf-8?B?MU1HOExwZithZ1FnVjFTSWlQa3h4dU5WNVdmRUVNSVVkL29PZjlLaFB5WUdU?=
 =?utf-8?B?dWNsRE5HSTF5Y0NKTVowOVQ1N2ErNkc2TkN2SllqaHNoNENIOVBNWktXdEdl?=
 =?utf-8?B?cUt4d2orZjNBWFZOZzF0OHA0UzRGUmd6YTAzYW1XcmFFZC9kN2RUSEZQR2x5?=
 =?utf-8?B?TytlcTVwOEgxeTIxMUhZeFlNSkxLenU1MVNSVGZ3WmJqZ0lmZHdqLzNYMDZu?=
 =?utf-8?B?TUs4UUNpdS9zRE1oTGVBT0hZUkxsaVJTSnZtbFdyckVjdTdLZ0xPTFllN05Y?=
 =?utf-8?B?TFZZYjdWQXFoZ2dZbzgxeUZVSXkvWEZLKzlxam9KSlBYeHJ0bTJOMk5zQTJ6?=
 =?utf-8?B?TDNxck5kMm9EUmVWSXcrek9GVTRlK2ZRSjBmemR6MExuNiswd2NZWm85YUFN?=
 =?utf-8?B?WVhMdXdtZC91b09EOENrL0dSUE5yS2JNcFJOM1hmdHp1ZHRhVG5XT2RsL3Vn?=
 =?utf-8?B?VG5KL095eFY5YzdwdDdpdkhrbUxVY3lFVVJCQ3VwdEErRnhmVTlXYlNrMzAw?=
 =?utf-8?B?ZjBuWUEzNUovTFVjeEpzc1Q1MHFLRmpVRXgzc011aVlXTmlnWDBGYjZGQ1FP?=
 =?utf-8?B?UjYvb1lVVFd4QnMwLzJxU1FROEtCeUo4cHlWNWNnWVdCRld6UStDZXZjV0tq?=
 =?utf-8?B?UDBBVWVub1oveWh4Sk9WTDZXNUVDallBUXdMeEpjbGJ1RElDeGhTNHdOZGVa?=
 =?utf-8?B?emsrME5haStlVHB1aWxGbHh0RmpHVjdudyt2dDlMbUQrcE1Kd1drTFNmMjVU?=
 =?utf-8?B?M2tLdmtnanJrUHJnZmJPeXQrVHRtT0pvVmF6T0JIS3F3WGZMUFd3SGNhTlV1?=
 =?utf-8?B?UEd4UUpjTEw5SUNmSC9IWHZnMzdJb3dkaW5HRmtMYUVMNUloZ0NlK0dIQVVu?=
 =?utf-8?B?OUo5OEQwblprMHZURldYNHdqaWI1aVBneWNpelpSTlBmdHVVdHZGQXFlRmlG?=
 =?utf-8?B?TWhhREJJNG9kdDBxMFdxSjZhdVhRb3FTVm9uazVLcVo3SXcyZmlzbE14MlJy?=
 =?utf-8?B?LzRFNTdKcE15SzdYbmdpQllXeTh2M3huZXUvTElBM2VCNFVkY3dRNUFIT0Vi?=
 =?utf-8?B?TXJoMHZKNXRpQVowTlVremx3SFgyaXluTk5VemxKTWdVb0RhSGpGSVFxQ29W?=
 =?utf-8?Q?ufJGW4aBZqt61aWlztj5HrfJ1eU0fw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1pJV0w1NTNySEpCQkRGVmtYeHJYSXZ2bGVCb3RrVlR3RVZZbC9xd2tSZXk0?=
 =?utf-8?B?L3lXS1c5ekpnSlp1NDJXS3lXbFRYaDJCN0xvVHA2T0RuWmtMRU1Bdk1sRDlo?=
 =?utf-8?B?TlIxV3VaSSsycmpmbjNkYjdBMU5naWtjZHRCR2Yyb1BzUlUvZWRYVW0vZ1pH?=
 =?utf-8?B?OVZpRkJjcThRTFppMmI3VmIyc0R3bHlaYWgwYlpJeXhrd3NpTUgxQ3RlWkwr?=
 =?utf-8?B?bGxKams0NnpsL2NGdE5YL0ZabWxVOTlKbmJ5QWxQdng2amJPSDBFT0xRKzVp?=
 =?utf-8?B?YVJRYXE2eHA0aDZIRGpocWNkL2FjWC84dFh0NDZETkM3aDJ5SnI3a01HOHp1?=
 =?utf-8?B?ZFBUV2J2bTBXZ2lOd3RnME8xNkZNUUtFNDlmZFBSVm9qWWFabkNRVU1jdTJR?=
 =?utf-8?B?elBneGV1emVuaVVqVnhpRjhlNmVpNi9JZ3dFZE15TFNMRGtBY3k2c3Uzd252?=
 =?utf-8?B?clpYVm12M0NPeW51MXhHejJkT3ZUSGoyd2FJRGovTEU0dmo3RnE4Y1BDMVcy?=
 =?utf-8?B?WFdWZmxVM0k3S0J0b1pST1BWWUQyblBpQjJXdmZDckRpL1c0MmZBeFgvM0ZE?=
 =?utf-8?B?eldGcFhidG1FbTlXN1FJZHp2cGU0VzFUMUZnU21uQXpEUGJoT2JRUm5RY0xE?=
 =?utf-8?B?Mk0rWnFoVHhSa0l4MTJieUdVM1NZakcwdkVmb1pZYmJNVDcwTFRHVnlPVm9J?=
 =?utf-8?B?YkRteitQMFNQYkt1Zis5TDlvelNabHdBNjRDZ1VGYjVxWEVUM01JRUhaSXJ2?=
 =?utf-8?B?QVV2OWtvRFlFaEgrVVhmN3J3eVByM3BmZFkzaGVXUnZwUVV2T05VeW5mRFFX?=
 =?utf-8?B?TENRbU16ZGR2SUtUb3Q3c01CQm95enFoZkUzaVBUV1pOaFJrQkpTRmRtcndv?=
 =?utf-8?B?cVhwR3Q0MkZBTDZ2WkJFUnRiOGtXb3Q2VnBBeGpqSThGUW0zZGpwc05BMGlJ?=
 =?utf-8?B?U0VERUR3WkFIK2g4RWlCMk9maGlDSTdHcVloTnZPV0dmWnJxWGZFSUZ5VkRj?=
 =?utf-8?B?R3RlaXVQMjV3YXNjZHAxZXFadHJtNk5RN0g2cmpPZGdNUDlYb0NvNGdsNHlR?=
 =?utf-8?B?NlYyNVJZNy9VNE5KMjJ0RDVkYy8ybmFzaU10eUM0eWZSWjJuVXI5ak1XRjdm?=
 =?utf-8?B?L2wrS0xqR2RyU0FpUUMrU1R5dkUyUG5nQjBJeDF1cm5aQmkxRkR3MHNKSExm?=
 =?utf-8?B?TmNpUU9ZOGZpRzFJamVjUnhEYXIxRXFMVDREblJCNmNJYzZFWTR0MmZOSmZv?=
 =?utf-8?B?eVZYT0lFcHV4eCs4WWhlY0szeXJxcUx4end1eXdRbWo2TjdRL1RMQUIwdm56?=
 =?utf-8?B?Ny9IczVvWUQ1aWFRQjJqQzRXQUZvaUJjUkluSTlTc0tYL0NSQ1JqT216QU4y?=
 =?utf-8?B?V1VaYURMc1ZDdCtDR1phTVN0OXQrQmtHZE9pbU51S1FWMk1IVDRjcktGZk5O?=
 =?utf-8?B?OUFDN2w3dWdzdTdVUGlIa1JtTW14OFgvc0VmelJEWW5aVGwvZTh6aUZhQkxo?=
 =?utf-8?B?WGgvSkVhcm0wYit0VzhDOVJCTTZFaGxUSTVZejlRRCtYdzlVZ2hGNkx2YWhJ?=
 =?utf-8?B?RGQ3Wm42Z1J6cVN5dWVtaGlJRXVCdHJVTE5mY2dQc2NOZkVUTEM4WVNtNGZx?=
 =?utf-8?B?Tm5zM2ZqdC9PTW9BakViZDE2MSs2WFZuYmZZNnJtNlFMZy9Pc0NQelg0Q3Uz?=
 =?utf-8?B?N1hsNlc5MHlYTFR6dzhZbC9xbjZ2MTRZVEVvbnJ2bHkyb1hXTEl6RE82NThC?=
 =?utf-8?B?WlFkUjJWU29ZQk9YWXQreVVQNDhkZFAvR3Z2K21jS2VDdFlOUm1DbThSbFJG?=
 =?utf-8?B?TXp0N09YTmg5WFo3Zmt3K1dqbUxDbVpJSHRCUmxmT1VBYm00aUE3TFpXT2tI?=
 =?utf-8?B?S3ZqeVo1cW1xeCtWMFNpR2ZLbmJyOEkzekF4dzA1aGNoTXQrSHJnclFubE5I?=
 =?utf-8?B?dTMvNWNVR1owbW94czhudnlnV2t0L1p2RU51a3lrOUVqbDlMelNYa2FEMVNS?=
 =?utf-8?B?L1JWUUJKam42SEtWWVdSV3huMGhRRkMwKzB5Rm9XOGFIRDdYQUEweDJHa0tI?=
 =?utf-8?B?T1lwK0pobDl2emlzSXZvUEZNekF1eVRaRk9ObDRyNGgxV3RUSExsMUV3NTFX?=
 =?utf-8?B?RlRIRzRjVEpvSk9IZUd1OXlWWklqVDlhNEVYcU1Wb3I5L0hBYzNGajlyRmdt?=
 =?utf-8?B?QnZFR2lBRXhROWtJekE0L2FNVzJsZ0xPMnkxRHp3V0ZiK3FpUXQxVnQ0WENY?=
 =?utf-8?B?bk55ay9MbElXMGZjQ0F5elBZQWw2VDA0K2VzUiswZUtvWGRJZGV5TzlSSWlj?=
 =?utf-8?B?dzBiWUZTN1AyZHNIbHlVc2M2MHA1VkR3MTF2eXZZOHFZaDFTMU1PRkRad2pX?=
 =?utf-8?Q?s6IwDpPA7Uj86YVA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e507fde3-357d-4e7e-2c1f-08de73825fd0
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 08:54:52.6819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoDjUUy2Teiwq0rl5ABMuhxnaGnpiKRrk7rdQaaru+b0mKgkfEgSH2njZ4SVxtGixVb3CG80qwVbOIdcTV555g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,intel.com,ursulin.net,kde.org,amd.com,bootlin.com,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E51C41840D8
X-Rspamd-Action: no action

On 24-02-2026 14:16, Ville Syrjälä wrote:
> On Tue, Feb 24, 2026 at 12:46:10PM +0530, Murthy, Arun R wrote:
>> On 24-02-2026 12:37, Ville Syrjälä wrote:
>>> On Mon, Feb 23, 2026 at 03:37:39PM +0530, Murthy, Arun R wrote:
>>>> Any other comments/feedback on this?
>>> Having random strings as uabi seems like a bad idea.
>>> How would you make sure those are never changed?
>> The requirement was to have a string for logging/debugging in the UMD
>> logs and KMD/display to pass the verbose information.
>>
>> Discussions around this.[1][2]
>>
>> [1] https://hackmd.io/f3bDn3kyRUalLn4LbMfCVQ#Commit-Failure-Feedback
>>
>> [2] https://patchwork.freedesktop.org/patch/666193/?series=152276&rev=1
> So the enum+obj_id thing there is perhaps the only thing that makes
> sense for compositors.
>
> Although I kinda doubt its actual usefulness to drive useful
> fallback logic because often the restrictions might be a combination
> of many things, and the kernel can only realistically report one of
> those things.
>
> Anyways, someone really needs to do the actual compositor
> implementation so that we could see how any of this would
> even work in practice.
Xaver is working on the compositor implementation for KWin and has 
commented[3] that the API looks good.


[3] https://patchwork.freedesktop.org/patch/696982/?series=152275&rev=6
Thanks and Regards,
Arun R Murthy
-------------------

>> Thanks and Regards,
>> Arun R Murthy
>> -------------------
>>
>>>> Thanks and Regards,
>>>> Arun R Murthy
>>>> -------------------
>>>>
>>>> On 23-02-2026 14:45, Arun R Murthy wrote:
>>>>> EDITME: Imported from f20260210-atomic-v9-5-525c88fd2402@intel.com
>>>>>            Please review before sending.
>>>>>
>>>>> The series focuses on providing a user readable error value on a failure
>>>>> in drm_atomic_ioctl(). Usually -EINVAL is returned in most of the error
>>>>> cases and it is difficult for the user to decode the error and get to
>>>>> know the real cause for the error. If user gets to know the reason for
>>>>> the error then corrective measurements can be taken up.
>>>>>
>>>>> User will have to check for the capability
>>>>> DRM_CAP_ATOMIC_ERROR_REPORTING before using this feature so as to ensure
>>>>> that the driver supports failure reporting.
>>>>>
>>>>> TODO: driver specific error codes are to be added and will be done in
>>>>> the follow-up patches.
>>>>>
>>>>> TODO: Once the series is merged the element 'reserved' used for sending
>>>>> the failure code in struct drm_mode_atomic is to changed to err_code.
>>>>>
>>>>> The IGT related changes are pushed for review @
>>>>> https://patchwork.freedesktop.org/series/153330/
>>>>>
>>>>> [RFC] changes for libdrm pushed for review @
>>>>> https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/450
>>>>>
>>>>>        To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>>>        To: suraj.kandpal@intel.com>
>>>>>        To: Maxime Ripard <mripard@kernel.org>
>>>>>        To: Thomas Zimmermann <tzimmermann@suse.de>
>>>>>        To: David Airlie <airlied@gmail.com>
>>>>>        To: Simona Vetter <simona@ffwll.ch>
>>>>>        To: Jani Nikula <jani.nikula@linux.intel.com>
>>>>>        To: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>        To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>>>>        To: Tvrtko Ursulin <tursulin@ursulin.net>
>>>>>        To: xaver.hugl@kde.org
>>>>>        To: harry.wentland@amd.com
>>>>>        To: uma.shankar@intel.com
>>>>>        To: louis.chauvet@bootlin.com
>>>>>        To: naveen1.kumar@intel.com
>>>>>        To: ramya.krishna.yella@intel.com
>>>>>        Cc: dri-devel@lists.freedesktop.org
>>>>>        Cc: intel-gfx@lists.freedesktop.org
>>>>>        Cc: intel-xe@lists.freedesktop.org
>>>>>        Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>>>
>>>>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>>>>> ---
>>>>> Changes in v9:
>>>>> - EDITME: describe what is new in this series revision.
>>>>> - EDITME: use bulletpoints and terse descriptions.
>>>>> - Link to v8: https://lore.kernel.org/r/20260129-atomic-v8-0-4cb7b0faa051@intel.com
>>>>>
>>>>> ---
>>>>> Arun R Murthy (7):
>>>>>          drm: Define user readable error codes for atomic ioctl
>>>>>          drm/atomic: Add error_code element in atomic_state
>>>>>          drm/atomic: Call complete_signaling only if prepare_signaling is done
>>>>>          drm/atomic: Allocate atomic_state at the beginning of atomic_ioctl
>>>>>          drm/atomic: Return user readable error in atomic_ioctl
>>>>>          drm/i915/display: Error codes for async flip failures
>>>>>          drm: Introduce DRM_CAP_ATOMIC_ERROR_REPORTING
>>>>>
>>>>>     drivers/gpu/drm/drm_atomic.c                 | 31 ++++++++++
>>>>>     drivers/gpu/drm/drm_atomic_uapi.c            | 89 ++++++++++++++++++++--------
>>>>>     drivers/gpu/drm/drm_ioctl.c                  |  3 +
>>>>>     drivers/gpu/drm/i915/display/intel_display.c | 25 ++++----
>>>>>     include/drm/drm_atomic.h                     | 10 ++++
>>>>>     include/uapi/drm/drm.h                       |  7 +++
>>>>>     include/uapi/drm/drm_mode.h                  | 37 ++++++++++++
>>>>>     7 files changed, 165 insertions(+), 37 deletions(-)
>>>>> ---
>>>>> base-commit: cec43d5c2696af219fc2ef71dd7e93db48c80f66
>>>>> change-id: 20250728-atomic-c9713fd357e4
>>>>>
>>>>> Best regards,
