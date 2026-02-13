Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DyNG9Dsjmk5GAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:20:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2D513463C
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 10:20:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE3E10E7D8;
	Fri, 13 Feb 2026 09:20:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SSFAHRHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843F810E7BF;
 Fri, 13 Feb 2026 09:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770974411; x=1802510411;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/uKRUmVwXiQnS7UZh9KPQYqpTNqLF9SUkzOfOuHjow4=;
 b=SSFAHRHkbyUB9WRu9/8Y7Pb2s2LXbSaD3yAY/a56d3LLFPT6lgmFKTty
 bh82TqN+VctlSDDmNsCc8riflPT5I/4MkrSQfMPv+azV/UV6DXrt8ccLr
 pawXUSSE2Qe+5OeuQUHrAluAZBe7L0SFVXXzfPa7ERAVx582Eg4CxHCF0
 oZUm6PhEnbRdzDaILTzMnLSwTKAN3uDpnKqT/KkZF+jeg/BqEKLsTNmuy
 /aoqvlEqDchKGW87aar1pXePGTFpM1iM77lZjlSPXuDDdwo0RseV/lbmt
 6SLkunCtzrPeXzoVyhrM+R+fXgrBaxfHheN8s8th3uw10z7pym24t4aJ0 w==;
X-CSE-ConnectionGUID: UrzmY1KQToqiCe5fWJ1Zjw==
X-CSE-MsgGUID: NKVFlachThiVq8vcEFolSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="74756399"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="74756399"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:20:11 -0800
X-CSE-ConnectionGUID: M5/PmdE2TnS3ROPaw8nTyA==
X-CSE-MsgGUID: IYl/tjDLSxOt7kv/x6Ys1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; d="scan'208";a="212036305"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 01:20:10 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:20:10 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 01:20:10 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.69) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 01:20:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sRKyVS4LJnUk+Vg9DDYFBrBYkWwJkxm1a+mVejnqxjTueSS+0uiajcijtsn19rF/hVfxpkfeFHbxIkzcKlqQrD1GyqLzOKPLwIvxClFmIs32nqfv/rSoluB6hNlp1EFhrBRodFnxrdizN5w7ikKJmJ8Yx4A2nW403VMi/ZQW0Aq2/1U4wMjJh7N+q327sWhnFsc8vt/8Emuaey0/bLykUxocKVji8T38bCxPw5GE1NKaQKRiGu9fITfXpt/XLGZeU0KsulVqiB1mjGjdKIsEK0EHlDP5fr/8elitJNzL/nTsU1GB+5CJvobuAPQ4FNwV1k2UqRXPAa/QrxxuV1NbVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uKRUmVwXiQnS7UZh9KPQYqpTNqLF9SUkzOfOuHjow4=;
 b=n4VEbsi3tDR9WqrDxSfH0WS0Wn5i3hWpDznAMZjdUMKY2ZxMfDahZazGAKo9B723yJlzrgOxuw5hODP6FqUdHDHQi0Xs8KRGL7qLwqJaiT8C/uwUE0LuNAnWvIYIR1tkMboVnKxnU1/fn3z14j/iqYYf5tkJuBf+ZsclGIxI6qo5itChxmwXCIPakOqlvCxWm4crYXTDyvC1pWRwIdqs2NDSzC2KrkWy5g1Z5HP+cPEuUZBjMegtKqr2Xy6MUixlmE1ej65QUumfz5lxcCuPBeR1N2Al3BGLnkbjWGfNM5GKHBBDmK8yT4SMu1T9l1mE/YCpz0fsgZaqbBSlYsmDRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB6148.namprd11.prod.outlook.com
 (2603:10b6:208:3ec::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 13 Feb
 2026 09:20:02 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Fri, 13 Feb 2026
 09:20:01 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Yella, Ramya Krishna"
 <ramya.krishna.yella@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v9 3/7] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
Thread-Topic: [PATCH v9 3/7] drm/atomic: Allocate atomic_state at the
 beginning of atomic_ioctl
Thread-Index: AQHcmmx+CPZYnl6F/UaJl3AnRYVtHLWAXonQ
Date: Fri, 13 Feb 2026 09:20:01 +0000
Message-ID: <DM3PPF208195D8D0F397CCA26459C0CA781E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
 <20260210-atomic-v9-3-525c88fd2402@intel.com>
In-Reply-To: <20260210-atomic-v9-3-525c88fd2402@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB6148:EE_
x-ms-office365-filtering-correlation-id: 3403662e-ef7f-4a48-07bb-08de6ae11106
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?dkU1dmlhKzBsSFBoM1U3NnR5MVJwZDliRWhjK0VhYWxsTVZFcXMwUWtLWmUy?=
 =?utf-8?B?SWxYRHFhVkdpdDlDeFZZR3Zzb1cySmYvOVFySjJqLzZZdEdBQWFWUjhsWGRH?=
 =?utf-8?B?dXZEZjAwaEJPTkFnMVJCNzNvcDZ5YXNiZjBibTBBNDllT2lCVVpvVXhOdWdQ?=
 =?utf-8?B?aStybWNzOXpyenJzRU9nYysyUzlkemg5V3Job0psVnYxRnByNlN1VmlxK3Bi?=
 =?utf-8?B?TjJSWFhWQmdSbFdwQUF3WWQ1TXdieXBPZXpKRVRsM2dPT212a2RjT3RnS3NN?=
 =?utf-8?B?SjNZRWpySU9kSWFEeFhwNlNib24vMFZZbmF1bTJ1eXhMWDFFaExUZWZVdDhv?=
 =?utf-8?B?bjFWWGkrYXJ6czk4OXZyR1dIdnNoRWVDZHFINmFuWWdOMW1GbjhES2ZxUHFY?=
 =?utf-8?B?a2VpMU9uMFJUU01ZY0pBZ0g3THhjaWg0Nm13WkgvSDJrVHNoSGtyVkRtcCt6?=
 =?utf-8?B?eFNrSXFpU0VSbEJuUGhWd29DT2tBUmRleWJZb0JNY1JuR3U3dmd0WFRQL3NU?=
 =?utf-8?B?emdkOGdxVGk5M3pzNEUvYWloeFhkSnh4aWxlZjlMUUVad280QkJORTdUWDlj?=
 =?utf-8?B?RVNnQ2M3MWt0dVdhYnZ6S2hobFRrZEtrY1Q3UUsrUmRqUXcxZG5NZld6bnNE?=
 =?utf-8?B?bTBBYmd6YkdFYVZEV0JPcEV2QWNxVnAwOGtLb2ZKZk40R2FUaSsvcWY0Q3VN?=
 =?utf-8?B?NlNScW5JUVVNVnpPUFlSaExHeElIWm5jK0dzZUNuYmZEWEJ0Tzh1OE9ZekFB?=
 =?utf-8?B?V3VNWkNIdUM2bUY5SXZYbDgyMUROTlhNUnBtMHNCemY5TDVvL3R0bEtRUEVy?=
 =?utf-8?B?bElXbnVKc1hGSko2WTJyYmFQSHpOOFhERVZ0YzRFWUMrRWQ2YkhKY0tRdXRY?=
 =?utf-8?B?TDhqOEk2dnJDVlZidzJzbEFJbFJ1TUtoNTAweWwzc3NBZE56UCtMazBDb3ly?=
 =?utf-8?B?UXVOYVdzcHRvampTRFdHVFJxZ1lYR3VDaWdZdTdacE90WEt1MThhZi9CSjAw?=
 =?utf-8?B?RVJPZmlTVXk0VFkyNjRtc2VKN3lhTXVNdFdmSElIdjlCanBNbFBxUkNrY3ZS?=
 =?utf-8?B?amRxb3NueURtcEpGenR4ZWlZK1pnSUw0UmVtcnpOT1FINlpaRHdVQnRQTzFX?=
 =?utf-8?B?Z1NsdEZDdFhidE85MWQ5cGlyQUpVWlRLUjlRbnhDVzVrS0hqaEdwaHdlVWlr?=
 =?utf-8?B?ZzZNVXVSVG80Q3Q4K2xMK3dhM3Yvd3EwM2FaSDNucFdqVEVvOWdpbWEvN1dt?=
 =?utf-8?B?NVBpWVlONWhpZUYxOVhhS3BqT01ieUFPU0d6SkVobk9mTVJjN2RWRHpZRnpz?=
 =?utf-8?B?REFOOWNZWWRYNVk2b1NDNFdobmFjelFQT2hRa0FCQnNBWGZla0JUL0Y4NzNG?=
 =?utf-8?B?OTluaWhvTFlqT1JjWjFldFl1RFFHRjkyRVBMK2RxK0RYVUxhMzRHaFgya1Fz?=
 =?utf-8?B?NWxyeTkzVGpTQmtJV003RUlPamF5emdqTUlLNzgzNDJ4VlZ1QjQzb2s5dXhu?=
 =?utf-8?B?MStVem9EeHZsU1BteTR1NEE5RVhCMFBnakkreW5iWm9qUGNwb0pZb2F3K3Za?=
 =?utf-8?B?dnVGS1pBbi9ENVFjYlphVy9CUVBmazUrZVIvVUZSVlpSRE5ITkYxZ0J5UkhQ?=
 =?utf-8?B?K3M5NkxFWXpwK0lJL0FhdW1PTm5rZXYvcCtoMTQ5TDNtcDVMUTUyTlUrRjk2?=
 =?utf-8?B?Q1ZVVVdzdWNJa3lLN0NEZm1nbjZrTGZ2SmRjL0lBS29pWUtjVSs2QmVBaW1p?=
 =?utf-8?B?NEQxanE1MnJENXZ2U3lVNm9RM1g0d0tNSWdTZE80dUN1RlVtWkY2SDRqS1li?=
 =?utf-8?B?Z1JsNzhrcTFoVUZVOFZtejVSWU5ia3ZXNGI1NEMwNXg4TXdBM0V4d3dVcW1Y?=
 =?utf-8?B?enpwZUVmQXJCWEdXWElRU1FETWRkY2orUyt4bk9RRUloYkZGUzBqaDdlYmpP?=
 =?utf-8?B?VmdLMlZJZmQ4SjB2WjRSdkcvRGtBR0JIUTNxOGVoamoveFdqakF3cEhKVEtT?=
 =?utf-8?B?SmNQblp6OE43UGJoQUtpYXlOTytYVERXcElBSjRmejE2RWt2bWk0VGNQcWZD?=
 =?utf-8?B?eENHZlA5TW5ZN2lEQWhvT2toMktZcGc4OFVWMDFWQVBYRGRWTHAyVEprM2VB?=
 =?utf-8?B?VVJPSEN4d3dnVHZwQzZkSVpiOE9waWladHlPWEJ1dGRSMnZMRTRYamlhK1F1?=
 =?utf-8?Q?PvcvhLAM2fLKF7uyGFpokUwichwCsS+UX4jRtSLZ3NSO?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VWpxd3ZqWmZnLzNub1pUTW81VDJLSWw3RjJxMGw5cHlEQlVpMU5SWWpWeWVs?=
 =?utf-8?B?MVFVbW4zWUJhczdHQzM4WTVWbWxJRndGQjlRLzR5dEtuTm84a3o2Q3h5SU5F?=
 =?utf-8?B?cW1wSjRLeTVhZzZnZE9Pd0MvL3BZeGtVcHQ1cVJIOGRKZlkvdWNPbmoxOUtt?=
 =?utf-8?B?ZTEvaGZCUkU4bU5ySFZ2Q2lzUFFndk1xKy90d1kybjFMdit1UUdtNWRlbzUv?=
 =?utf-8?B?RWI5QkprVWlxQUV5RTZBMTkwOUV0a05OOW1jRDZCcVJQUkIwRFovMzEwNnQ4?=
 =?utf-8?B?WUh6V0JRQmx0RU81QytESHhQM3MvVEdoNUNsTlhDNUtXbU5DL3YvWE1CZW55?=
 =?utf-8?B?SzdYa3psc1pPeDRDSzFDK3ozaGJMWnBmbHVJUFo0SE12MmNXaEVxSzhnRVF5?=
 =?utf-8?B?cEtBUFIwSVhSeG5Vc0JldDRNVDhXNjB6enVyUDJ0aXFHMlhNMk54Y3ZWa2ll?=
 =?utf-8?B?OHJEbWtsMDB4cE9DRk10dTExRXpUVm00aGRyQXl4UG9jejlhMTdVbkxWN0l1?=
 =?utf-8?B?aURwYzNKbXlLY0ZKeURxVWh5MXB4VFhNWWxiTUh4cVpKQk1KdCtTMkgxRVlR?=
 =?utf-8?B?STJmeUpuREtyRURvcFpQaGRHRFFMcGxxVGsyMVdVTllhcG1JYmN0ejA5UFRm?=
 =?utf-8?B?YnV0Z3BpUDBUNTFhcDdNVUZ6YnkxRG9tUnhkRi9hQjZYR1Y1bGtwMi9pWkJp?=
 =?utf-8?B?RkJHbUxwRlBuclpZRm5RcVE1ZXBybU5lTDJNTWl1ZVFvRWZVWTdaNjJJbEEz?=
 =?utf-8?B?RXVKb29GV3JtcFpIei9qTlRrS1B2VHdyUTdHcnNqQmhma3hpMmNiNkI4c3NU?=
 =?utf-8?B?ZkE3bE16MklzenFOdDhEMUUwZkcvU3dvU201UzVZNFMzS2EzclEyV3REQVRv?=
 =?utf-8?B?SFJiSDNaR1crRnUzSjZCMDlPd2RFVTg4MFVPc2d0N09NQTJ1cmRBQ0pUTlNu?=
 =?utf-8?B?dk51R2RuZklTQ3BjUExOb0p2SDNGelFMK21oQjRaaTl5WXVqRHZiaWw2R05V?=
 =?utf-8?B?QnZaZ0wvWEFsbm1qVDk3M0IxeXlHbjJIR0l6Mm9NTEhOeElWREwvdWNVcklB?=
 =?utf-8?B?RHhWMGZVN3ZpNm91TUFLNlRzSEhQVUJXSFkrOEpkSDg0YlJzYi9oLzNzV2hB?=
 =?utf-8?B?WUFBajFBS0g4SkxWMjlEWWJtYzVNYXhHcnJwdjl6MW02eFFFb0dFeHBkTTRZ?=
 =?utf-8?B?OExyMHVUOUR2NnkwcHNkOVYvWTJRb1Rad3R6aUMwUk9wYjluWG5VZVh6clhp?=
 =?utf-8?B?aStNRm9wTHVOSHRQTUNlalRUQ1ltMHFSR0JMNElyZlhVT1g2SFFoVk9XTUQz?=
 =?utf-8?B?eXJ0c0l3eXovQlBXYlA4Q3M5bXNqK0xvV3FQOXp4Z0lHck9ndVhrVVNmODdx?=
 =?utf-8?B?UlVubVZpOVpBeWVzY25hbW9NVkJZVVBFWXh1Y3RmTWxuWU1YTDNrazdLN0M3?=
 =?utf-8?B?WVZVQi90R3ZLeHNQVk55bk8xdHBPWWdQS0Z0dzBSS2tIcjVTMUdjV01YaEJq?=
 =?utf-8?B?dlFTOUtqdDdONlNqSXNTYitYYnk1cENhajkweWJYQVo2Q216N1hYQ01YNWM3?=
 =?utf-8?B?bnY5TGluQnN6NmNkSCtzWkVWOUUrdWNOZU1EcDZVWm1obHMvYVhvbG5zMXJL?=
 =?utf-8?B?ajExRDJPMVpvZFNXOWNkUU5PeVIxZFdtZHFTVEFsemZDUTZaM1VOSk5POXdE?=
 =?utf-8?B?MFpsaDNRS21sZGVIcjVpU3ZTL3dTMlAzRFNmSlZtVTFLeHd6clhyUVZxNnEr?=
 =?utf-8?B?bUtma1hjTnYrS0Q1NThGOWdUc2tmTmlrSUQ0cERLOE1JSFJBQ2daNk5GY2Q4?=
 =?utf-8?B?L0orYU9SVlRKZXN2NEpVd2NpYlBVY1Q1VDk5dllPeVZmNk1Xc1A1OFM3Tm51?=
 =?utf-8?B?V0ljR0VFdmsxNmNwTGNwdkZFZS96RHZncG9Za3ZmYVV1REYxbmhCVkxtSUpZ?=
 =?utf-8?B?UDUxOEllK3ZhWklJOFRQZXdwZzJyKzJTUS9wNHRwVGwwT3RiRkJhUW9adDNv?=
 =?utf-8?B?TjQ0R2YrK29CcWxYWnJZMEl1RG12ZFVHOFl6elkxV0VCWXFJY2g3QUVoV3ZP?=
 =?utf-8?B?T0EyRjh6bzVnNUNGdExXUzhkUWF2NE1xYnBSTXN6RTc0ejZGQjhsVjcwT0s1?=
 =?utf-8?B?NGMyNG1OcE9zWnh1Qm52NUxEcVNja3lsUmdLeEtWamx3bVZURS9WN3VRSFk3?=
 =?utf-8?B?dE9iK2NWSXlwbkxwc1UxM2NjQVFGRXFTdVVrczQrNWd5cTBreWtLVUorZ0dT?=
 =?utf-8?B?TThydmhPT1pKVG95SC8zWkZQRFpkNG9WUGloMWxCYWZZV0ZTeGhxZmtmK1Fq?=
 =?utf-8?B?QWl4cURpM2dFWFhGSFJOSC85SGVYNjY1VHgxM3FwOHhSSW9hbnZ0dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3403662e-ef7f-4a48-07bb-08de6ae11106
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 09:20:01.8845 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n2Zzb+keVw5/pw5TLOizTudKG4LJsDw4thkOp3Vy+vVxJswvG5fSYOiIoJKJQo3hrpwjiZWYaN0KWEgTp5NCTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6148
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
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[DM3PPF208195D8D.namprd11.prod.outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: DB2D513463C
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBbUEFUQ0ggdjkgMy83XSBkcm0vYXRvbWljOiBBbGxvY2F0ZSBhdG9taWNfc3Rh
dGUgYXQgdGhlIGJlZ2lubmluZyBvZg0KPiBhdG9taWNfaW9jdGwNCj4gDQo+IE1vdmUgYXRvbWlj
X3N0YXRlIGFsbG9jYXRpb24gdG8gdGhlIGJlZ2lubmluZyBvZiB0aGUgYXRvbWljX2lvY3RsIHRv
DQo+IGFjY29tbW9kYXRlIGRybV9tb2RlX2F0b21pY19lcnJfY29kZSB1c2FnZSBmb3IgcmV0dXJu
aW5nIGVycm9yIGNvZGUgb24NCj4gZmFpbHVyZXMuDQo+IEFzIGF0b21pYyBzdGF0ZSBpcyByZXF1
aXJlZCBmb3IgZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlIHRvIHN0b3JlIHRoZSBlcnJvcg0KPiBj
b2Rlcy4NCj4gDQo+IHY3OiBSZWZyYW1lIGNvbW1pdCBtZXNzYWdlIChTdXJhaikNCj4gdjg6IE1v
dmVkIHRoZSBjbGVhcmluZyBmZW5jZSBjaGFuZ2UgdG8gYSBkaWZmZXJlbnQgcGF0Y2ggKFN1cmFq
L0xvdWlzKQ0KPiB2OTogRnJlZSBhbGxvY2F0ZWQgYXRvbWljX3N0YXRlIGJlZm9yZSByZXR1cm4g
b24gZXJyb3IsIG1vdmUgdGhpcyBjaGFuZ2UgZnJvbQ0KPiBwYXRjaCA1IChTdXJhaikNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8IDMwICsrKysrKysr
KysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMo
KyksIDEyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX3VhcGkuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0K
PiBpbmRleA0KPiBkYzAxM2EyMmJmMjY1NTEyYTRmYTFlZGYwYWU5MDkzMWZmMGQzNWU2Li5jMjI4
YzlhZWQ3NWFjZGIwOWE4MGRmNWRhZDUNCj4gNDQ0MGE1YzE4MjI1NCAxMDA2NDQNCj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fYXRvbWljX3VhcGkuYw0KPiBAQCAtMTU3Niw2ICsxNTc2LDE0IEBAIGludCBkcm1fbW9k
ZV9hdG9taWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4gKmRldiwNCj4gIAlpZiAoIWRybV9j
b3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBEUklWRVJfQVRPTUlDKSkNCj4gIAkJcmV0dXJuIC1FT1BO
T1RTVVBQOw0KPiANCj4gKwlzdGF0ZSA9IGRybV9hdG9taWNfc3RhdGVfYWxsb2MoZGV2KTsNCj4g
KwlpZiAoIXN0YXRlKQ0KPiArCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiArCWRybV9tb2Rlc2V0
X2FjcXVpcmVfaW5pdCgmY3R4LA0KPiBEUk1fTU9ERVNFVF9BQ1FVSVJFX0lOVEVSUlVQVElCTEUp
Ow0KPiArCXN0YXRlLT5hY3F1aXJlX2N0eCA9ICZjdHg7DQo+ICsJc3RhdGUtPmFsbG93X21vZGVz
ZXQgPSAhIShhcmctPmZsYWdzICYNCj4gRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQpOw0K
PiArDQo+ICAJLyogZGlzYWxsb3cgZm9yIHVzZXJzcGFjZSB0aGF0IGhhcyBub3QgZW5hYmxlZCBh
dG9taWMgY2FwIChldmVuDQo+ICAJICogdGhvdWdoIHRoaXMgbWF5IGJlIGEgYml0IG92ZXJraWxs
LCBzaW5jZSBsZWdhY3kgdXNlcnNwYWNlDQo+ICAJICogd291bGRuJ3Qga25vdyBob3cgdG8gY2Fs
bCB0aGlzIGlvY3RsKSBAQCAtMTU4MywyNCArMTU5MSwyOCBAQCBpbnQNCj4gZHJtX21vZGVfYXRv
bWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAJaWYgKCFmaWxlX3ByaXYtPmF0
b21pYykgew0KPiAgCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+ICAJCQkgICAgICAgImNvbW1pdCBm
YWlsZWQ6IGF0b21pYyBjYXAgbm90IGVuYWJsZWRcbiIpOw0KPiAtCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKwkJcmV0ID0gLUVJTlZBTDsNCj4gKwkJZ290byBvdXQ7DQo+ICAJfQ0KPiANCj4gIAlpZiAo
YXJnLT5mbGFncyAmIH5EUk1fTU9ERV9BVE9NSUNfRkxBR1MpIHsNCj4gIAkJZHJtX2RiZ19hdG9t
aWMoZGV2LCAiY29tbWl0IGZhaWxlZDogaW52YWxpZCBmbGFnXG4iKTsNCj4gLQkJcmV0dXJuIC1F
SU5WQUw7DQo+ICsJCXJldCA9IC1FSU5WQUw7DQo+ICsJCWdvdG8gb3V0Ow0KPiAgCX0NCj4gDQo+
ICAJaWYgKGFyZy0+cmVzZXJ2ZWQpIHsNCj4gIAkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0
IGZhaWxlZDogcmVzZXJ2ZWQgZmllbGQgc2V0XG4iKTsNCj4gLQkJcmV0dXJuIC1FSU5WQUw7DQo+
ICsJCXJldCA9IC1FSU5WQUw7DQo+ICsJCWdvdG8gb3V0Ow0KPiAgCX0NCj4gDQo+ICAJaWYgKGFy
Zy0+ZmxhZ3MgJiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMpIHsNCj4gIAkJaWYgKCFkZXYtPm1v
ZGVfY29uZmlnLmFzeW5jX3BhZ2VfZmxpcCkgew0KPiAgCQkJZHJtX2RiZ19hdG9taWMoZGV2LA0K
PiAgCQkJCSAgICAgICAiY29tbWl0IGZhaWxlZDoNCj4gRFJNX01PREVfUEFHRV9GTElQX0FTWU5D
IG5vdCBzdXBwb3J0ZWRcbiIpOw0KPiAtCQkJcmV0dXJuIC1FSU5WQUw7DQo+ICsJCQlyZXQgPSAt
RUlOVkFMOw0KPiArCQkJZ290byBvdXQ7DQo+ICAJCX0NCj4gDQo+ICAJCWFzeW5jX2ZsaXAgPSB0
cnVlOw0KPiBAQCAtMTYxMSwxNiArMTYyMywxMCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJCQkoYXJnLT5mbGFncyAmIERSTV9NT0RF
X1BBR0VfRkxJUF9FVkVOVCkpIHsNCj4gIAkJZHJtX2RiZ19hdG9taWMoZGV2LA0KPiAgCQkJICAg
ICAgICJjb21taXQgZmFpbGVkOiBwYWdlLWZsaXAgZXZlbnQgcmVxdWVzdGVkIHdpdGgNCj4gdGVz
dC1vbmx5IGNvbW1pdFxuIik7DQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiArCQlyZXQgPSAtRUlO
VkFMOw0KPiArCQlnb3RvIG91dDsNCj4gIAl9DQo+IA0KPiAtCXN0YXRlID0gZHJtX2F0b21pY19z
dGF0ZV9hbGxvYyhkZXYpOw0KPiAtCWlmICghc3RhdGUpDQo+IC0JCXJldHVybiAtRU5PTUVNOw0K
PiAtDQo+IC0JZHJtX21vZGVzZXRfYWNxdWlyZV9pbml0KCZjdHgsDQo+IERSTV9NT0RFU0VUX0FD
UVVJUkVfSU5URVJSVVBUSUJMRSk7DQo+IC0Jc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsNCj4g
LQlzdGF0ZS0+YWxsb3dfbW9kZXNldCA9ICEhKGFyZy0+ZmxhZ3MgJg0KPiBEUk1fTU9ERV9BVE9N
SUNfQUxMT1dfTU9ERVNFVCk7DQo+ICAJc3RhdGUtPnBsYW5lX2NvbG9yX3BpcGVsaW5lID0gZmls
ZV9wcml2LT5wbGFuZV9jb2xvcl9waXBlbGluZTsNCj4gDQo+ICByZXRyeToNCg0KSGVyZSB5b3Ug
c2VlbSB0byBtaXNzIHRha2luZyBjYXJlIG9mIGNvbXBsZXRlIHNpZ25hbGluZyB3aGljaCB5b3Ug
dGFrZSBjYXJlIGluIDR0aCBwYXRjaCBtYXliZSB5b3UgY2FuIGV4Y2hhbmdlIHRoZSBvcmRlciBz
byB0aGF0IHdlIGRvbuKAmXQgYnJlYWsgYmlzZWN0YWJpbGl0eQ0KDQpXaXRoIHRoYXQgZG9uZQ0K
UmV2aWV3ZWQtYnk6IFN1cmFqIEthbmRwYWwgPHN1cmFqLmthbmRwYWxAaW50ZWwuY29tPg0KIA0K
PiANCj4gLS0NCj4gMi4yNS4xDQoNCg==
