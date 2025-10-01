Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90164BB1733
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 20:06:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FCFB10E101;
	Wed,  1 Oct 2025 18:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GSL6jijm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E44310E101
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759341977; x=1790877977;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=b/7qEIAoah8moJikvyWgeHq3ULfPIrIAVSurG9CXVaI=;
 b=GSL6jijmL2IQgj933GWzzGJ+m9ysa2uKsbS8clTj99s9nkFwO6DOn9HT
 guzKlisRhODebSySFKKGgcsXRwVtw7nxgVmnSWwICCI8/MeIrrOrZjS8O
 WEez6cL5GinHcFxWZNh0fTijAMIwsdPGsysnPhP3Bz4Zm+AXr08mP7USF
 32zG0cb6wpwYOTpCImbMLHowxfazUUkC2UwvJhViRI7ie/xMMXDRmwrS5
 FElhb2s9iGFIrgRzHXzOyuHFhE4Ec0Gsr0Hj+Gk2OugBcI9Jc0ZcyOuRT
 x6HwvIYaAON2mkg9EbUYLULhlWCVQE0OPpYcYt/T4lxmArIDYEwysaKIi A==;
X-CSE-ConnectionGUID: R0nH/AnlTFKEuTK3eKahwA==
X-CSE-MsgGUID: zFHRnLeSQVSUNR1NRbUpQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65447560"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65447560"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 11:06:16 -0700
X-CSE-ConnectionGUID: v4nhjBIHQLmCbHigwRvwuA==
X-CSE-MsgGUID: VnwmU3xdRqax7R+THbQhJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,307,1751266800"; d="scan'208";a="178463978"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 11:06:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 11:06:13 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 11:06:13 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.27) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 11:06:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwBl2yeKqhkorfYU9ntnwW2Zg8R40WbBr2EikQ0kucytNJYvw5+UwE/aHtTy2YQCFZwdcS9qCMtYyWJl9aQOmnVSDQFU2Cf0pX0ngScqZxKQV3eu28dBS6jO3SvkPBAmCpY/YLwrolc+2Add859MWD4amALIyI83Ajd26I68f46gWbWlNGcUdobZGBsuTmoWjDet146uCkMOBdCSMV/pQ01ebE8mALQetXXju7JRGhMcgI3MxsnSHjudebJLSJFtjrFXfSNYHrQfC1j8SnhAS2g/1v6RcBE9DCD+NNHaOd+wx1Ld4NUiNcjBopvZo5lgQovgCvPer20S994q5jsNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/7qEIAoah8moJikvyWgeHq3ULfPIrIAVSurG9CXVaI=;
 b=N1QksKcLMY/e8KQECsdtDIjHp8Pl9KghrKkUl1YCc9N0DwPeTzmS2zJicjVBHPElHOOV3fkhPsnsQPn33bSX/LyuYUr0cfTaq7PR16mhxBJ+q+k9mTSj//hZC3mN1Ere8eBY1dwxqgGp2QHchKod6hzpyjca4BYgloeJhH1pTIFI7KQ3TfvVPl38n6oGIWO4loVLkcSZ1AXG2GEdrNEWI9Y2YusAiZ0DMfVg4AyIFQcea6XBaZyy2NknFO449FHR+oVQ4OWth4NW6YELI7anhhMVGGG34JGh+iMbcResPLpjC4nlcHROnAADHfHI9I8Y0omL/ot8W5+znU/reakBxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5112.namprd11.prod.outlook.com (2603:10b6:510:3b::18)
 by PH0PR11MB4997.namprd11.prod.outlook.com (2603:10b6:510:31::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Wed, 1 Oct
 2025 18:06:10 +0000
Received: from PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773]) by PH0PR11MB5112.namprd11.prod.outlook.com
 ([fe80::b6b7:41ec:7dc8:773%6]) with mapi id 15.20.9160.017; Wed, 1 Oct 2025
 18:06:10 +0000
From: "Kim, Dongwon" <dongwon.kim@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
Thread-Topic: [PATCH v4 3/3] drm/virtio: Restore Virt-GPU res on hibernation
 resume via PM notifier
Thread-Index: AQHcMt/bovM9tMR1qE+dA93qVCn89bStlbCQ
Date: Wed, 1 Oct 2025 18:06:10 +0000
Message-ID: <PH0PR11MB5112A49643E56E74F2F04D20FAE6A@PH0PR11MB5112.namprd11.prod.outlook.com>
References: <20250924194755.1265531-1-dongwon.kim@intel.com>
 <20250924194755.1265531-4-dongwon.kim@intel.com>
 <40772acf-6a9c-4049-9c27-5fa4b1312aaf@collabora.com>
In-Reply-To: <40772acf-6a9c-4049-9c27-5fa4b1312aaf@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5112:EE_|PH0PR11MB4997:EE_
x-ms-office365-filtering-correlation-id: a304c063-6103-4edc-7769-08de0115338a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ancxQlo1dmJ3RHloVHlmSHJMNnZZaDkxbGoycnIyT2ZnUjh3ZjFnUHY2U3Vk?=
 =?utf-8?B?L2VmZEg2eDBYbmFBQW0zVS92bndTVU52d2VXb1lwSHV3NmtzMlJML2RWOEN1?=
 =?utf-8?B?Z2tyRzFJbzM1aGI1Tkw1VGVKSE45TXRMcUtiSytuMngvcWxVQWdEcDlwOHdK?=
 =?utf-8?B?OTRibUZpdDJqd2dyK09nT09KYkNwcGlWVStPZFR5T1VRYmNOek0vbDhSandS?=
 =?utf-8?B?RnF2ZENLM3ZoVjNNc08vWTVMcjJubVNzRWlLV2k0bXJoMHRZK2hOVDkvNm41?=
 =?utf-8?B?TTZtVEdPWWorc3ZLamtvTjlodk8vWDVDYVdlTEhyK3NSU1JFc2ZiNUxJOWxW?=
 =?utf-8?B?N2toZi9rcUpPM1lkSURtN0pIWjRVRVpkd3Y3MGkyQXZ3aW80RUNSMnl6RW1R?=
 =?utf-8?B?bkU1VFQyVCtzbzczT2xoQW0wV21ZdnpaekI2NXZ4cnJsUWhoaWs3WWNOYkVC?=
 =?utf-8?B?ZXh4REcvWUI0Vm5aSWlQSWxueU9JbkpuRi9BRXVkUWZVcnExS2lRZm01YUgx?=
 =?utf-8?B?b0tIdzJEaVlEaVZHcXE1b2plY1NETmlXeCs3YnZSWXNWaFZBdFVCVHdsdWFs?=
 =?utf-8?B?OWlabklERWg4dGZLWkZqaSs1RkdFM1N6QlcvTFBONFBtNXhUTVFha21Qb2dx?=
 =?utf-8?B?YVJXOWtWNit6bCttckpWc1JNaTIxaHJIWXZ0Mk4yNGFkMk9qbHFzdXUvS1Mv?=
 =?utf-8?B?S3FZU0ZFOFJwRnZyN3NZZHI5REZGU3pkNGlCK2pubTZudnhqVXFGbkxXNWQx?=
 =?utf-8?B?RXBUUmtZQkxvY1dlNW1NK3duTXNGSFJ3YlJsd2NMYlg5bStBcnJrY1JjVDVj?=
 =?utf-8?B?TXNuYXRIdmp0cE11WjJjQ0IwU3lIa1RpM0FyMjIrQ041TnR1SVgwSXh1YTVP?=
 =?utf-8?B?em1xTHJ0QmQ2OUFVOUFNa1ZqOVJFaXZwbmU4TldlN2J0TUNwNjZHTXpFeXds?=
 =?utf-8?B?cGtJRHZCb0ZKeHVaQkkvdVNVanpPbEpQTVZCMTMxVTlJakF6bXExbTBJS29z?=
 =?utf-8?B?ZVZhSFV4ZUlDT2p5Um1MWDlBdmFPUTk4QithWTRwT1Z6SG83TnFNTDYva2Z2?=
 =?utf-8?B?TXdNK3U2K01NeGgyVHVPZjJ3LzBuVXNjSUNqMEhIMW5RbStGaFUyOWt3dll2?=
 =?utf-8?B?RDlxak9VdUYyVng1QmFncXlJWTdIZXJINmRuUE5WamdYYi8yY1lQTWtxVFpx?=
 =?utf-8?B?dTYyeEl6TVBCZVduc2ZXSTRYcW5GZ1RDa3JFajM3ckFnZHlnQ1JrWnludUI2?=
 =?utf-8?B?YmpESkc3b0xhbUcwNHNQeWZaY1ZkZGYvV2h2cXRwT0JiQmJDYzhvK0MrVDY4?=
 =?utf-8?B?cFV4WXlsNXlCU0hMczRRWWozZlhXcXZWSUtKc1U0dGc3NlMyR0ZFdmYwZVhV?=
 =?utf-8?B?bWNJQ2tzc2lKSlc2RWRjZU9ic05keWpDT1U0djZJVWtvQnZxajZBck5LdEJ1?=
 =?utf-8?B?UmxSWWh5UkhNSVlEelR1cDRmbUVNUnkxa2NqbmwxRVF2QW4vdWpZeUYzVzFU?=
 =?utf-8?B?bFdYbUZnbWNhRVk0NlhQV2UxRUtJenMya08yNTIwNmZmNytRZ01lM3JxTzBk?=
 =?utf-8?B?ZldZZkgxZzJzRVdjZTg1U2hkU1JXb3lyc2x5MXdHTTQ4VHo0czJGcDBSck5w?=
 =?utf-8?B?VmlPUnVSS2pMYjVKZjZPd0FCMU4yeC9GTTRyMlZCdk1SR29YQ0tsZjJxL0FC?=
 =?utf-8?B?ckxuMGFEaDEzZDA3NDljaEh6WU1TWmRmdjVCc2lLaW52VWFqZUl6WmtOc3ZE?=
 =?utf-8?B?NVpoaGxlYW4rUWFkS0pJcmZEMWl0czRXZUVSbWtuNzJFT2VxbGYzTDcvZWsw?=
 =?utf-8?B?Y1N1UUFyL3dmcnpIdWJHMGU1dW5LdCtuNW5STms1YjNlR0hHMFZraUg3Q3lo?=
 =?utf-8?B?Ty9IemdGU005bHQ5Z2ZiMzhRcDJVdjY0ZU8zekI2Y0pvK25xcjJjMEJNVUow?=
 =?utf-8?B?WHF2ZVF2RjgrTkoyNnBuTkg1bnJaZUFFcEJRNUVBQzNXallNRlU2T1d0dk40?=
 =?utf-8?B?eWphdmM3b2grUk1TcCt4WDFOaHlJeFMzUDlaYnpXYW4yMUxOSW9iYWVQWUtj?=
 =?utf-8?Q?pBnaTX?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5112.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UGZmSXlTTFhOUy9WMzcrNXlRUXV3M0lFVnBlalgrS1ljWGUvOCszUlZ3TjBW?=
 =?utf-8?B?Y2p5ejdzblFKMW9CMDhrb1dNMUFzMkFJRUZUZDNuTXhDaWxnRWhJSVlXU3Vh?=
 =?utf-8?B?UVVsTVVLdGFhWXRCS3FETkNxNnpRZ3c3RGZ5WjN0ektCS3ZvQnVxSCtFUjFv?=
 =?utf-8?B?YVJHUmNkSU1YV1ppVERjRnZWc3B2cXlrNkFCWHBtejZ4N1N2ZUJjTHZyTDBU?=
 =?utf-8?B?QmdMSlRLVUpacjV2RHZQV3ZlamZsSEZTNE0yNmtCNDAyRlhpeWlNV1ViNjdT?=
 =?utf-8?B?WVoxcWJocy90OVlLR1Bkd29XZHJhZ1UzNnAyVHc1aEs5MUQ5UmZOd2swV2Nk?=
 =?utf-8?B?V0Q5dzM1bkJ2ZjNGVGpiVnZRVExxYUVHRnFGa09PVXhxbWoxMG5nekRMNXBq?=
 =?utf-8?B?azFlL0QwbDg5V3FJdSs4a3BadUYvR0FLdUxzL1B3MUhqMWdzK0xrREpqcTI4?=
 =?utf-8?B?QXhMeXpuMFZJUG1ibyswaU5pZi84QzA5NXR4Wk5CNFE5b09aVjF3YnFib0Uy?=
 =?utf-8?B?U1A0dE9QUXp3bFdHdldUZmhKRG1FNjNETVc4L2ZLd1NZRnlVR21lVEd1ek1I?=
 =?utf-8?B?azN1UEdhY3hJdGMyRHo4NFRaTFMrMG4wQlRJSDI3dUNodSt0eXM0MnlGZzhR?=
 =?utf-8?B?VHZlejhBYnprTlQwYWN1eDkwdUFSU2gxTXNzUjJFdVdYTzI5WnExL2pESnFS?=
 =?utf-8?B?Y3RWWGlZMElMM2RrSU1MUXdWMWZ1aCtVTncyOURtN2xjYXdKMUdzMVBPTzZT?=
 =?utf-8?B?dVl4ZnZJUmk0T1NFS3hNZm4rTC9lSERnektGdWpKM083c1cyWS90bVdaR2Jz?=
 =?utf-8?B?aGZyNzFSTUswQ3FFaTh0cXdEZ0R1cGJNT0gzZ1I4WGtHYzdFekw5ZEl3NG5B?=
 =?utf-8?B?VThBVENKSUM5NUFXc0dITnJjSHJ4OGMzeHJIMlRWaFdaeFc3NGhQSmRWRFVx?=
 =?utf-8?B?Njk3dnJjcm9qVmpEVHhOdHp4QUxaaUxGR2k3eGh2VS92YzRuY1UremxjeEov?=
 =?utf-8?B?SEIrTEVFNnpDSWFSZzhFYitDYk5ZcHoySzNpRWFKRk1KZ1ZVMXJFTGNNRVo2?=
 =?utf-8?B?d05tK24wTmRWMXVhZU5nM0JXQ25RMGI0aDc4elNFa01helE3NXlEeE16blpw?=
 =?utf-8?B?SW9JMlFoYmZEOWR3ZWZMY0c0YjV0UW41YnZuQTJtMlZqQW1LN2lKeDI0ZWJW?=
 =?utf-8?B?eXBmQkhXLzFjZXozL0RGSDJRSTZZTC8zTVlvdEY4NGlwekpIbmFqTHJyeTZN?=
 =?utf-8?B?RHpaenFXc2dDQVYxVVFodkQ0Y0d3bUxWUjVNMzRKd0RJbU8zSzZIT3JSaDRi?=
 =?utf-8?B?cjl4ODlVQjVOR3NBMldUam1Jc1pIaEdoejVYM2EzMU55cXVNeFhPTHFPQnRs?=
 =?utf-8?B?VWUvYmxmdEh2NFhtMXVFaDNnbG9GbmVDOGVFTmFxR1p5WlNoeDh4Q2VOUnNQ?=
 =?utf-8?B?MTZpcTdWSmtzVU9nR3ZYR0dCYUtabmZjZXFHaDE4dWwvZmRRL05mSGxWZVRr?=
 =?utf-8?B?a05SSko3dmVSbzZkbTFpb3cxQnRHNGZhdU1FT3hQTWtGYUMwRkp4TmpCdFZ2?=
 =?utf-8?B?bzVEcWVNbmRFaXVGUXEwT2hoZWVFd1MzdHFhVCtQWVpmYXo3NHB6cWhyMm5u?=
 =?utf-8?B?QzFKQ0ZISUI5TjdjRGdqcXpHdlUwSHlSbzhYSFdveUtMdVBWYlExWW9HdmF1?=
 =?utf-8?B?d1Nwa2dLeUN5QStwSThzdzBSbzl2SlI1OVZRUkk2ck9TbE5ZSXBIMHl2NCtx?=
 =?utf-8?B?U2RoZzdIZENiUGdwbE1EdkhsN1lmWGRzN3dpN3o1dHBNUVVuR0dJbG1seFEr?=
 =?utf-8?B?d21JcnVnelNTVWN1bFJQYjJ5NkdTUytoUi8vdjBpeUc2b2g0aWhtMHpYci9H?=
 =?utf-8?B?NWxrUVZPc245QkdLVnlhUDduYk5HdGhMbG9heXU5ci9FdGM4RHRMbkQ3TkIv?=
 =?utf-8?B?N3ZlMnhURS9TUGFQNktoYXBTc0ZZQUpuSXhFRXUycU91RGlKNXA0UWZlZGxp?=
 =?utf-8?B?b3J6VE1EeldLclJ6ZDVUS1U2dSthU0k5Ukp3OTlBQXZsOWUxNGkydkQ5Uitx?=
 =?utf-8?B?dUkvRUtsbTRsWnZuOE5tcmZ2N2NLYmU5WmxVd3g5OFRiNTRVcjhiSTNoYk1B?=
 =?utf-8?Q?kda2CJYh955+F62z/z1OEmQIq?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5112.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a304c063-6103-4edc-7769-08de0115338a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2025 18:06:10.3320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yvSRLuk4M3pS2Dcex49BYHr6IhqHYdJsRCftzqh3twwFQIsWIa0xwNUstQaD3Q3+mEbTj9J0uIynoJEHbPshRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4997
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

RG1pdHJ5LA0KDQpJIGdvdCB5b3VyIHBvaW50LiBUaGF0IGlzIGFjdHVhbGx5IGEgZ29vZCBpZGVh
IEkgdGhpbmsuDQpJIHdpbGwgbW92ZSBwYXJhbXMgYW5kIGxpc3Qgbm9kZSBpbnRvIHN0cnVjdCB2
aXJ0aW9fZ3B1X29iamVjdCB7fSBhbmQgbWFrZSBvdGhlcg0KY2hhbmdlcyBmb3IgaXQgYXMgd2Vs
bC4NCg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY0IDMvM10gZHJtL3ZpcnRpbzogUmVzdG9yZSBW
aXJ0LUdQVSByZXMgb24gaGliZXJuYXRpb24NCj4gcmVzdW1lIHZpYSBQTSBub3RpZmllcg0KPiAN
Cj4gT24gOS8yNC8yNSAyMjo0NywgZG9uZ3dvbi5raW1AaW50ZWwuY29tIHdyb3RlOg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfa21zLmMNCj4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9rbXMuYw0KPiA+IGluZGV4IDA4ZjhlNzFhNzA3
Mi4uZTFiMmNlZTMwZmEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
dmlydGdwdV9rbXMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9r
bXMuYw0KPiA+IEBAIC0yNiw5ICsyNiwxMiBAQA0KPiA+ICAjaW5jbHVkZSA8bGludXgvdmlydGlv
Lmg+DQo+ID4gICNpbmNsdWRlIDxsaW51eC92aXJ0aW9fY29uZmlnLmg+DQo+ID4gICNpbmNsdWRl
IDxsaW51eC92aXJ0aW9fcmluZy5oPg0KPiA+ICsjaW5jbHVkZSA8bGludXgvc3VzcGVuZC5oPg0K
PiA+ICsjaW5jbHVkZSA8bGludXgvcG1fcnVudGltZS5oPg0KPiA+DQo+ID4gICNpbmNsdWRlIDxk
cm0vZHJtX2ZpbGUuaD4NCj4gPiAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPg0KPiA+ICsj
aW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+IA0KPiBUaGVyZSBpcyBubyBuZWVk
IHRvIGluY2x1ZGUgZHJtX2F0b21pY19oZWxwZXIuaCwgQUZBSUNULiBQbGVhc2UgY29ycmVjdCB0
aGlzIGluDQo+IHY1IGluIGFkZGl0aW9uIHRvIGFkZHJlc3NpbmcgY29tbWVudHMgZnJvbSBOaXJt
b3kgRGFzLg0KPiANCj4gLS0NCj4gQmVzdCByZWdhcmRzLA0KPiBEbWl0cnkNCg==
