Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D76974A0F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 08:03:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA81510E993;
	Wed, 11 Sep 2024 06:03:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GHNEFd1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DCFE10E993
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 06:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726034588; x=1757570588;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pzh9C9CKCYxD/QnQIgSG9xqUHetQxMwPI3IZqoRrdl4=;
 b=GHNEFd1hw2TbRfCpoFXMS6O/yK1JNywD90jfiC9MJRN3V9Ux8dH5lBG8
 FGKAnG2TKWto2b30dByLxo/h5rbD6IH2JEY1IFzfyNqriNEL58GZjFnz+
 CxeQjXqsWLefySOMwWSydktpN/3UlqCscDmdJAx81uFSrccEnD0CTwWeV
 VGeNeTx+e7P5BjzWe3Z6Lwc3DFR/nCi2koLs4h2lZZ4AMzvjYe4NasgnH
 ETgppNl/DNddx9MDoPxQzlGnltxUEHvTsBvvIvQ37wy91VmBeRz4BZkzv
 +6ggH3XjIIPuhDuokqh1pkqUjzlD4HZQcLcBHLpeNEJNoAOwCvIaACT4A w==;
X-CSE-ConnectionGUID: Pd05NfdGTjeg9N+cEwv0/Q==
X-CSE-MsgGUID: 7tOea7sATlyxnbub1UmcjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24690728"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="24690728"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2024 23:03:07 -0700
X-CSE-ConnectionGUID: RUp+OL1DRlK4spJVepOhtg==
X-CSE-MsgGUID: pu89njvUTnaFxAjrkEr8Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; d="scan'208";a="98080211"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Sep 2024 23:03:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:03:06 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 23:03:06 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 23:03:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 23:03:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YndKsj4ZQ70bA0GYiEACVdjysPscPlw8b6bMaYTqMUBZuQ8CutI74l2xqDZ64Amei2RFzK9/nBvXRzFqQ7kXfkWI9oQvC0QpHQH/RqFt7yG4sawfzarWqfFuz/xL7+FM3ZDs7JmPBr1maZjBtEZOiR5EgVg3z7ce0Xhg4A2tO9NgLRADJyw4txGqqGKz0HYUwQlzFcZ8ECDnulqLmbJkVAHFzUD9WjpPNSDft1v8rcULpk3GoTU39Ri5pkPWfnVJDlO8ujWlPAfkA9trTUiu4520dERMRMmY2IZ2owRfCXOvnTv33p2vOIOR67hqGo03jkiB9z+fE8Wf+RseL7rAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pzh9C9CKCYxD/QnQIgSG9xqUHetQxMwPI3IZqoRrdl4=;
 b=lcbJEq+K2oOPR6Kn3CqHvPNMS8XbCXuQLks07xO1D8nBpuojoa2gZEqVCh9qKOwqSeZfUqAczdQSTd7+j4G2GpkO6EfZau4LVo9XjVoUjM6GTeo1r2D3Mcgp8l4DnT0VTozYMBBoPA+MMCXhcMi/9U/9SudCt4ldvokSWCLEsgb0iTRo4zvoCKm91zquaxZ6fYgDTUdhnQ5yB4Dehd/OhURvwLP40Bs5TTh3jEEmOdnNt58K03pmlAUMFTlGP2xSaQxaMkJiYsAKVwkgTfCIYtSAd+UarTDKP7e713fZBMPHbFOgf1Bv7c2ayC+hiuu67AkYI/cjB2jqq/MbF5nSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4677.namprd11.prod.outlook.com (2603:10b6:208:24e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 06:03:03 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7962.017; Wed, 11 Sep 2024
 06:03:03 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, Christian Koenig
 <christian.koenig@amd.com>, Rob Clark <robdclark@gmail.com>, Gurchetan Singh
 <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>, Michael Tretter
 <m.tretter@pengutronix.de>
Subject: RE: [PATCH v2 0/5] drm/virtio: Import scanout buffers from other
 devices
Thread-Topic: [PATCH v2 0/5] drm/virtio: Import scanout buffers from other
 devices
Thread-Index: AQHa7TgQukFz/tl7yUOepKFZm0Z2t7JRfiVA
Date: Wed, 11 Sep 2024 06:03:02 +0000
Message-ID: <IA0PR11MB71859017952FC002A75AE08BF89B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
In-Reply-To: <20240813035509.3360760-1-vivek.kasireddy@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4677:EE_
x-ms-office365-filtering-correlation-id: 168d0edc-666a-4999-cd12-08dcd2276596
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?MERJQm5UWnNsVXRlRFN0alplN2dhdHloa2d3Y3V3NkdrcG9DZW9UbUNOUXZN?=
 =?utf-8?B?R0krNmJIRlU2VUR5QUJWclZjWXVvMmxrdEg0OFNkRkYxY1gyM1B2MmJFQ3Qy?=
 =?utf-8?B?bUIxNVJlT0lObkprVGZ0ZnBzNHJtbnIwVnRTMGhrUFFMZXZxU0lVb2NUL1g4?=
 =?utf-8?B?U2xHSEF1T002UEdZd2NnQnN4aXQvZG1nVGQ5SXVjZWJLYmlZSEFJdStIUnBH?=
 =?utf-8?B?eUVHSG0weHB4RUlaaVhPenp6M2NxbjMwWnlPUjBKcE5CTzJURVBVY0E4TU4v?=
 =?utf-8?B?Q2NSSXJkS0JmTW9IdHRjYWtjdEJ4UFR1LzhUcDNLenVhaHlyZWZTV0JZdk9y?=
 =?utf-8?B?eVE3MC8wSnFqTlMxK2RNZHp1dys4d09neFY5ZHNIaEpHRlRTbTZLMVV6Z2h5?=
 =?utf-8?B?RFI1RG1ma1dJZmw3ajhGT2NQcTkrUThDNWcwV1VSVFY2dWdLVGZINy8zL3o5?=
 =?utf-8?B?eCtuenBVblV3R1J1QmM3QjN3NEp3d3dtZm5adytYT1JFSVF6TWducHRRNVNn?=
 =?utf-8?B?VGNXMTB0MGJZYWhCbkxqd0gyNzhySGRxc0lNS3JTQ3dqcDB2ckpmVzZiTHRD?=
 =?utf-8?B?MVFwdExFK01aMzIzZzJXQ0paMEtqSUM0T0gwOG85T3F0S29FZUJJUUxPQ0tt?=
 =?utf-8?B?cldjMmNZZkljTHoza09pUi9BYkFmZENlY1RYbmhNU1RSTUZ5amxjNG84dVdu?=
 =?utf-8?B?dCthMnF5OWZHY2FlRHd5RWNxR3psUDd1aGlrOTZBMDJJVzlDY05xYzdwRmJR?=
 =?utf-8?B?WkFMUnRJQnVjTG1XamJ4bS9VTk9zWWxNc1E2c2JmZi84cTM3Z3l0WkFianly?=
 =?utf-8?B?NjgvZEJNdjBUQUREVTFubFNia2ZrV2p5OFNveFR4N1ZUU1lKOWtHZTZxUEdK?=
 =?utf-8?B?RzJMYlUrRzA5YWNCV3MvcEQxSXQyY3JLY0hpMlgxZDFBT1k4aU0rdjJVM0lS?=
 =?utf-8?B?MHgzOVlRbFJEYWQxWVJqVkppRE1uei9XUnBPaXp0SFE1SFRDeUF3K1VVSXBV?=
 =?utf-8?B?dis0ZUtYYU5FaDlDTU9TOXVVdEFvYnFtTE9IYmU1QkhRdHlXS05DbWF5bWE5?=
 =?utf-8?B?VE1XRmxDek1EZm8xaWo4Vzg3R2hBQUtwbGhVb2g0SExJZFNvUHMyZDExNnB2?=
 =?utf-8?B?NXFZV0ZCeGFLWU52anJyZWp1Q21tWEt4QWZ3MDlyRjI3dVBXcDV1eGFIWGRF?=
 =?utf-8?B?RUFuVVhGRXo1QVBBRi85Nnl0NGZhRHFDR1RaTm1VakptbEF0UnQxMlZPZXZC?=
 =?utf-8?B?M1U5UzR3LzlnTFRIamZDYnBpUXh1NFkrUG82M25tMEo1R2ZMZzdrZ2pVMHFZ?=
 =?utf-8?B?RG85dk5uV3ZZcDBvOU84UWRvekh1QnZZMkNLdEpLVVBlYk1DWXNRRUxvR1Nt?=
 =?utf-8?B?SWlTU0t4OW1IaFdtbXZnSUFFTW8zTGpVQnNmNmpoamlpUWl6bzhUMnVRUGdS?=
 =?utf-8?B?RzFnSU94N0FPdnJFRjUyMVpLTm9mSnZJczVoVEN2bVV4c0lIU1ZuT2ZSWVpK?=
 =?utf-8?B?SkZmR0dtWXRBYU9JeWNJbTBOK1FicUh5ZTBsNitjY3R0MHNmSG5UUzFpMHp3?=
 =?utf-8?B?VWVGdVlpcXptd0ZRVzF5Z0Q0Y3l2QmlMQlg0OFRaREV0bWpwZmpYK1ZNaVVx?=
 =?utf-8?B?OGMvVm9wODVJck1NNW02M29yeWxLS1BJZTdiNWJZaEFiZU1YQmFpWGU0QWtF?=
 =?utf-8?B?ODBlaTk2OGZVRnZhQ1VHMGpqT1B6YmxjamhESlJRQXBsZlRLZ0E5dlRSQ05X?=
 =?utf-8?B?M00rci9ZUFl0WmRXSHRXS3VyUDRwY3A4ZnoyUkhmUDFsMHhsTXl5Z3FDdEZx?=
 =?utf-8?Q?PHA3gEUGUUEt6mcSMWrgDeaevswpcTwinKyQ8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YVpCSGVTVS9aaHpHaG1FZi9WYUh6VFhJWkZSUDVDbWF0YTgrWEJuYm5JTlJE?=
 =?utf-8?B?MngxZGM1OG9HVVV4L1VmU3JsMW5XdTUvRzhISmQzZFFXT0I2TTQvdjVwTnow?=
 =?utf-8?B?UXI4VVNnVGpDUXBmc2E2cC84ZHBOOEgyQ25paTJqYUVMS3BlRG9RcS84bTR6?=
 =?utf-8?B?N2o0NUlUdlJOZXZNZFpaUksrd3Nqa3lDUkRXTndSUURacWJFbHl0b21DQmg0?=
 =?utf-8?B?THBPVnd2M0puSE81ZWZxZFZ4Nml2S1ZqQ1pDRE8zZVJxRW9BQkNhUlZNN2Fq?=
 =?utf-8?B?YnlYcC9KR2l4UTNJVzVJd09mMlN0Tmx1YkhGbm91eXd6TlhldUhPVXJBQk9R?=
 =?utf-8?B?c1JwcW1UbEpqb1FRb0pLbXRvTjVpNTgwOWZxV1BpWHFDejFqaU5vbjNvZEJq?=
 =?utf-8?B?aUxuTGNGZ0lhVk11MXJ2VmNnSkdzUjBYV2hRaFdzY1dzb2Urem05anZEQmx3?=
 =?utf-8?B?dllMRW5ZN290VWdETi84TVQ5a0U0aEZMQVJpRG8xS0ExSjZoeExabW5iT00x?=
 =?utf-8?B?VlZQWE5QenVDb3h0NVVjUnNTOGdmM3QxZjU4WGFYYVdSZmhCT2Y5bVJkRnIx?=
 =?utf-8?B?cEhzZmd4NDJhdE90ZjhoOS9nYjVRcHN6dkVRbVJZVTl0M1ExeDhKcEtzS20v?=
 =?utf-8?B?L0IvOTczQ1UwYUJCZmw3U3Q1aUFUK0FqNHVjcS9RSzNqOWR4MG9MOGdWclhr?=
 =?utf-8?B?WXY5dEFYVUQwa2d4cXFHMjNNTUNZWkF5aEttaW1TcVdTMXgvdlFOQ0hMRnN3?=
 =?utf-8?B?bkVaUDd5a2N2T2o1MlhZZHQ5ZkJWOW51NXc5NDNrazdtc2k3VHRZdXE4WW1Y?=
 =?utf-8?B?MCtlUVNoNnIxajRVYUgxWC9vSVFXdW5Ld2lQdWs0QVZWeTV4aFYrSkdhZ01C?=
 =?utf-8?B?cURvRmFkbDF3RmN0SzhFelBuZ24xSVBYVEVybktwNTN5RzFBYVRHUXBib0hj?=
 =?utf-8?B?dExLTnJYY0hLTHlEUkxHbVB0Q3RpSHh2T2tSTytBNHQ0QTIvREM1anhrU2Zi?=
 =?utf-8?B?ak5JSE1sdk1aWW1GR0wra3BvVzBxalRvVW9OTjdqa0w4aktNaTJxbU00OG4x?=
 =?utf-8?B?STRRbU05NFBPcjVxYThuMWxDNHByVzdtdEptRjVLSDNsTlhqUDdvZUtzM0lm?=
 =?utf-8?B?aE5oWHFZcUIwZFphaHcvdmtlbUVCSzRhSEQ5N1lHNVY3WlZWRWZZdWFhSWZp?=
 =?utf-8?B?UmdXU1VQVzFpN0plMzlQMERlQVFrVXBuckZ0eFBRRjRXTURLZWo3NFhDTmR6?=
 =?utf-8?B?UjdNclZnaHkvQ1FsQkt4azNNUXNxQWsvZFgxTmgyS2ZQME1FUzNuYjYxWTh6?=
 =?utf-8?B?aUkvcHVmRVJ0dkNmT2lnKytrQWxBYjV1K3M2aVBYNU5yVllOeVdjUTlKcU42?=
 =?utf-8?B?cXlPeFdyTElJMTRleWNRalNWS001VVBKTXRYTGtiSDgxbmtsOUhraE5oT2FN?=
 =?utf-8?B?UTd2cXhZTzNwRjl5QlBrZXlYN1hkN3NyNWZZbU53cHFWc0FXWnRvejUzdmZL?=
 =?utf-8?B?cUNkbE9lTWM1TmdZQzdOcXBHanh0UytrNjFBcFNOWWxwZ3FQbWFPL3dJOGsx?=
 =?utf-8?B?K3ZpTDZ2MVJOU2pTOE5NdWxjRmVCYktBdzJqVHVDTVdma1MvU2lwazJ6ODk5?=
 =?utf-8?B?V055SlNFa2FrVmVOTGZsN2hJNnFla0UwMmRCbXNkMkIwQmw2cktVb0FIYWhK?=
 =?utf-8?B?ZzIzTVRKeXM3VmZTNUVMZGZ5Uy9SOVgwRkovc3k5cyt6c0UwWjJoV3Y4SEN3?=
 =?utf-8?B?YStDT1N5T1hlSGcyWE5aa1RGOGZybWFteERMVkZqbzJocldtN293SUIyMWpp?=
 =?utf-8?B?NFRkVjc0cUFENWFFa3l4VlV2TFk2cHdvUzdPaEJhT1J0YitISTA1V0pjN2hQ?=
 =?utf-8?B?ajEyZkNWVVkwZ2NNSS93aTRLU2ZZalVsblpoTG1YN2p2Nk5WV2VYTmhYbTBH?=
 =?utf-8?B?OUtLWXZPdzZxQkVKYzJPcWlDcDRYcnFqNjNDbFJKMVVuTi93Mk5IZjVZUkht?=
 =?utf-8?B?d2FyM0o4UWk1TXQ0azRXMXhpdkJ3NGpsNk02bTI5NldWWG5INmk2Qk84OFJX?=
 =?utf-8?B?bmJwdnhkemVOLyszeUdlQUtTU0dTT1BFNXJZek9TZ3BVWko1Q1RwQnVURW43?=
 =?utf-8?Q?YzEYfidLW4C0TOZfb4PIzNjtl?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 168d0edc-666a-4999-cd12-08dcd2276596
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2024 06:03:02.9103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tD7ak7Gu+w+9MrJa58C/5YXihuxPTWsbVCa09SfWvYk86VQZ7YAyZYSZrUm1oATwZ2auZL+faJ2/kZE8Xz+c3/BT9aG/9p3CPaQW6ATYED4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4677
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

SGkgRG1pdHJ5LA0KDQo+IFN1YmplY3Q6IFtQQVRDSCB2MiAwLzVdIGRybS92aXJ0aW86IEltcG9y
dCBzY2Fub3V0IGJ1ZmZlcnMgZnJvbSBvdGhlcg0KPiBkZXZpY2VzDQo+IA0KPiBIYXZpbmcgdmly
dGlvLWdwdSBpbXBvcnQgc2Nhbm91dCBidWZmZXJzICh2aWEgcHJpbWUpIGZyb20gb3RoZXINCj4g
ZGV2aWNlcyBtZWFucyB0aGF0IHdlJ2QgYmUgYWRkaW5nIGEgaGVhZCB0byBoZWFkbGVzcyBHUFVz
IGFzc2lnbmVkDQo+IHRvIGEgR3Vlc3QgVk0gb3IgYWRkaXRpb25hbCBoZWFkcyB0byByZWd1bGFy
IEdQVSBkZXZpY2VzIHRoYXQgYXJlDQo+IHBhc3N0aHJvdWdoJ2QgdG8gdGhlIEd1ZXN0LiBJbiB0
aGVzZSBjYXNlcywgdGhlIEd1ZXN0IGNvbXBvc2l0b3INCj4gY2FuIHJlbmRlciBpbnRvIHRoZSBz
Y2Fub3V0IGJ1ZmZlciB1c2luZyBhIHByaW1hcnkgR1BVIGFuZCBoYXMgdGhlDQo+IHNlY29uZGFy
eSBHUFUgKHZpcnRpby1ncHUpIGltcG9ydCBpdCBmb3IgZGlzcGxheSBwdXJwb3Nlcy4NCj4gDQo+
IFRoZSBtYWluIGFkdmFudGFnZSB3aXRoIHRoaXMgaXMgdGhhdCB0aGUgaW1wb3J0ZWQgc2Nhbm91
dCBidWZmZXIgY2FuDQo+IGVpdGhlciBiZSBkaXNwbGF5ZWQgbG9jYWxseSBvbiB0aGUgSG9zdCAo
ZS5nLCB1c2luZyBRZW11ICsgR1RLIFVJKQ0KPiBvciBlbmNvZGVkIGFuZCBzdHJlYW1lZCB0byBh
IHJlbW90ZSBjbGllbnQgKGUuZywgUWVtdSArIFNwaWNlIFVJKS4NCj4gTm90ZSB0aGF0IHNpbmNl
IFFlbXUgdXNlcyB1ZG1hYnVmIGRyaXZlciwgdGhlcmUgd291bGQgYmUgbm8gY29waWVzDQo+IG1h
ZGUgb2YgdGhlIHNjYW5vdXQgYnVmZmVyIGFzIGl0IGlzIGRpc3BsYXllZC4gVGhpcyBzaG91bGQg
YmUNCj4gcG9zc2libGUgZXZlbiB3aGVuIGl0IG1pZ2h0IHJlc2lkZSBpbiBkZXZpY2UgbWVtb3J5
IHN1Y2ggaGFzIFZSQU0uDQo+IA0KPiBUaGUgc3BlY2lmaWMgdXNlLWNhc2UgdGhhdCBjYW4gYmUg
c3VwcG9ydGVkIHdpdGggdGhpcyBzZXJpZXMgaXMgd2hlbg0KPiBydW5uaW5nIFdlc3RvbiBvciBv
dGhlciBndWVzdCBjb21wb3NpdG9ycyB3aXRoICJhZGRpdGlvbmFsLWRldmljZXMiDQo+IGZlYXR1
cmUgKC4vd2VzdG9uIC0tZHJtLWRldmljZT1jYXJkMSAtLWFkZGl0aW9uYWwtZGV2aWNlcz1jYXJk
MCkuDQo+IE1vcmUgaW5mbyBhYm91dCB0aGlzIGZlYXR1cmUgY2FuIGJlIGZvdW5kIGF0Og0KPiBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvd2F5bGFuZC93ZXN0b24vLS9tZXJnZV9yZXF1
ZXN0cy83MzYNCj4gDQo+IEluIHRoZSBhYm92ZSBzY2VuYXJpbywgY2FyZDEgY291bGQgYmUgYSBk
R1BVIG9yIGFuIGlHUFUgYW5kIGNhcmQwDQo+IHdvdWxkIGJlIHZpcnRpby1ncHUgaW4gS01TIG9u
bHkgbW9kZS4gSG93ZXZlciwgdGhlIGNhc2Ugd2hlcmUgdGhpcw0KPiBwYXRjaCBzZXJpZXMgY291
bGQgYmUgcGFydGljdWxhcmx5IHVzZWZ1bCBpcyB3aGVuIGNhcmQxIGlzIGEgR1BVIFZGDQo+IHRo
YXQgbmVlZHMgdG8gc2hhcmUgaXRzIHNjYW5vdXQgYnVmZmVyIChpbiBhIHplcm8tY29weSB3YXkp
IHdpdGggdGhlDQo+IEdQVSBQRiBvbiB0aGUgSG9zdC4gT3IsIGl0IGNhbiBhbHNvIGJlIHVzZWZ1
bCB3aGVuIHRoZSBzY2Fub3V0IGJ1ZmZlcg0KPiBuZWVkcyB0byBiZSBzaGFyZWQgYmV0d2VlbiBh
bnkgdHdvIEdQVSBkZXZpY2VzIChhc3N1bWluZyBvbmUgb2YgdGhlbQ0KPiBpcyBhc3NpZ25lZCB0
byBhIEd1ZXN0IFZNKSBhcyBsb25nIGFzIHRoZXkgYXJlIFAyUCBETUEgY29tcGF0aWJsZS4NCj4g
DQo+IEFzIHBhcnQgb2YgdGhlIGltcG9ydCwgdGhlIHZpcnRpby1ncHUgZHJpdmVyIHNoYXJlcyB0
aGUgZG1hDQo+IGFkZHJlc3NlcyBhbmQgbGVuZ3RocyB3aXRoIFFlbXUgd2hpY2ggdGhlbiBkZXRl
cm1pbmVzIHdoZXRoZXIgdGhlDQo+IG1lbW9yeSByZWdpb24gdGhleSBiZWxvbmcgdG8gaXMgb3du
ZWQgYnkgYSBWRklPIGRldmljZSBvciB3aGV0aGVyIGl0DQo+IGlzIHBhcnQgb2YgdGhlIEd1ZXN0
J3Mgc3lzdGVtIHJhbS4gSWYgaXQgaXMgdGhlIGZvcm1lciwgaXQgdXNlcyB0aGUNCj4gVkZJT19E
RVZJQ0VfRkVBVFVSRV9ETUFfQlVGIGZlYXR1cmUgZmxhZyB3aGlsZSBpbnZva2luZyB0aGUgaW9j
dGwNCj4gYWdhaW5zdCB0aGUgVkZJTyBkZXZpY2UgZmQgYW5kIGdldHMgYSBkbWFidWYgZmQgaW4g
cmV0dXJuLiBJbiB0aGUNCj4gbGF0dGVyIGNhc2UsIFFlbXUgb2J0YWlucyB0aGUgZG1hYnVmIGZk
IHVzaW5nIHRoZSB1ZG1hYnVmIGRyaXZlci4NCj4gDQo+IE5vdGUgdGhhdCB0aGUgdmlydGlvLWdw
dSBkcml2ZXIgcmVnaXN0ZXJzIGEgbW92ZV9ub3RpZnkoKSBjYWxsYmFjaw0KPiB0byB0cmFjayBs
b2NhdGlvbiBjaGFuZ2VzIGFzc29jaWF0ZWQgd2l0aCB0aGUgc2Nhbm91dCBidWZmZXIgYW5kDQo+
IHNlbmRzIGF0dGFjaC9kZXRhY2ggYmFja2luZyBjbWRzIHRvIFFlbXUgd2hlbiBhcHByb3ByaWF0
ZS4gQW5kLA0KPiBzeW5jaHJvbml6YXRpb24gKHRoYXQgaXMsIGVuc3VyaW5nIHRoYXQgR3Vlc3Qg
YW5kIEhvc3QgYXJlIG5vdA0KPiB1c2luZyB0aGUgc2Nhbm91dCBidWZmZXIgYXQgdGhlIHNhbWUg
dGltZSkgaXMgZW5zdXJlZCBieSBwaW5uaW5nLw0KPiB1bnBpbm5pbmcgdGhlIGRtYWJ1ZiBhcyBw
YXJ0IG9mIHByZXBhcmUvY2xlYW51cCBmYiBhbmQgdXNpbmcgYQ0KPiBmZW5jZSBpbiByZXNvdXJj
ZV9mbHVzaCBjbWQuDQo+IA0KPiBDaGFuZ2Vsb2c6DQo+IA0KPiB2MSAtPiB2MjoNCj4gLSBVc2Ug
YSBmZW5jZWQgdmVyc2lvbiBvZiBWSVJUSU9fR1BVX0NNRF9SRVNPVVJDRV9ERVRBQ0hfQkFDS0lO
Rw0KPiBjbWQNCj4gICAoRG1pdHJ5KQ0KRG8geW91IGhhdmUgYW55IGZ1cnRoZXIgY29tbWVudHMg
b3Igc3VnZ2VzdGlvbnMgb24gdGhpcyBzZXJpZXM/DQoNClRoYW5rcywNClZpdmVrDQoNCj4gDQo+
IFJGQyAtPiB2MToNCj4gLSBVc2UgdmlydGlvX2dwdV9jbGVhbnVwX29iamVjdCgpIHRvIGNsZWFu
dXAgdGhlIGltcG9ydGVkIG9iag0KPiAtIERvIHBpbi91bnBpbiBhcyBwYXJ0IG9mIHByZXBhcmUg
YW5kIGNsZWFudXAgZmIgZm9yIHRoZSBpbXBvcnRlZA0KPiAgIGRtYWJ1ZiBvYmogaW5zdGVhZCBk
b2luZyBpdCBhcyBwYXJ0IG9mIHBsYW5lIHVwZGF0ZQ0KPiAtIFRlc3RlZCB3aXRoIGdub21lLXNo
ZWxsL211dHRlciAod2F5bGFuZCBiYWNrZW5kKQ0KPiANCj4gVGhpcyBzZXJpZXMgaXMgYXZhaWxh
YmxlIGF0Og0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvVml2ZWsvZHJtLXRpcC8t
L2NvbW1pdHMvdmlydGdwdV9pbXBvcnRfdjINCj4gDQo+IGFsb25nIHdpdGggYWRkaXRpb25hbCBw
YXRjaGVzIGZvciBRZW11IGFuZCBTcGljZSBoZXJlOg0KPiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvVml2ZWsvcWVtdS8tL2NvbW1pdHMvdmZpb19kbWFidWZfMg0KPiBodHRwczovL2dp
dGxhYi5mcmVlZGVza3RvcC5vcmcvVml2ZWsvc3BpY2UvLS9jb21taXRzL2VuY29kZV9kbWFidWZf
djgNCj4gDQo+IFBhdGNoc2V0IG92ZXJ2aWV3Og0KPiANCj4gUGF0Y2ggMTogICBJbXBsZW1lbnQg
VklSVElPX0dQVV9DTURfUkVTT1VSQ0VfREVUQUNIX0JBQ0tJTkcgY21kDQo+IFBhdGNoIDItMzog
SGVscGVycyB0byBpbml0YWxpemUsIGltcG9ydCwgZnJlZSBpbXBvcnRlZCBvYmplY3QNCj4gUGF0
Y2ggNC01OiBJbXBvcnQgYW5kIHVzZSBidWZmZXJzIGZyb20gb3RoZXIgZGV2aWNlcyBmb3Igc2Nh
bm91dA0KPiANCj4gVGhpcyBzZXJpZXMgaXMgdGVzdGVkIHVzaW5nIHRoZSBmb2xsb3dpbmcgbWV0
aG9kOg0KPiAtIFJ1biBRZW11IHdpdGggdGhlIGZvbGxvd2luZyByZWxldmFudCBvcHRpb25zOg0K
PiAgIHFlbXUtc3lzdGVtLXg4Nl82NCAtbSA0MDk2bSAuLi4uDQo+ICAgLWRldmljZSB2ZmlvLXBj
aSxob3N0PTAwMDA6MDM6MDAuMA0KPiAgIC1kZXZpY2UgdmlydGlvLXZnYSxtYXhfb3V0cHV0cz0x
LGJsb2I9dHJ1ZSx4cmVzPTE5MjAseXJlcz0xMDgwDQo+ICAgLXNwaWNlIHBvcnQ9MzAwMSxnbD1v
bixkaXNhYmxlLXRpY2tldGluZz1vbixwcmVmZXJyZWQtDQo+IGNvZGVjPWdzdHJlYW1lcjpoMjY0
DQo+ICAgLW9iamVjdCBtZW1vcnktYmFja2VuZC1tZW1mZCxpZD1tZW0xLHNpemU9NDA5Nk0NCj4g
ICAtbWFjaGluZSBtZW1vcnktYmFja2VuZD1tZW0xIC4uLg0KPiAtIFJ1biB1cHN0cmVhbSBXZXN0
b24gd2l0aCB0aGUgZm9sbG93aW5nIG9wdGlvbnMgaW4gdGhlIEd1ZXN0IFZNOg0KPiAgIC4vd2Vz
dG9uIC0tZHJtLWRldmljZT1jYXJkMSAtLWFkZGl0aW9uYWwtZGV2aWNlcz1jYXJkMA0KPiAtIFJ1
biBnbm9tZS1zaGVsbC9NdXR0ZXIgKHdheWxhbmQgYmFja2VuZCkgd2l0aCB0aGlzIGFkZGl0aW9u
YWwgcGF0Y2g6DQo+ICAgaHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dOT01FL211dHRlci8tL21l
cmdlX3JlcXVlc3RzLzM3NDUNCj4gDQo+IHdoZXJlIGNhcmQxIGlzIGEgREcyIGRHUFUgKHBhc3N0
aHJvdWdoJ2QgYW5kIHVzaW5nIHhlIGRyaXZlciBpbiBHdWVzdCBWTSksDQo+IGNhcmQwIGlzIHZp
cnRpby1ncHUgYW5kIHRoZSBIb3N0IGlzIHVzaW5nIGEgUlBMIGlHUFUuDQo+IA0KPiBDYzogR2Vy
ZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+DQo+IENjOiBEb25nd29uIEtpbSA8ZG9uZ3dv
bi5raW1AaW50ZWwuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZnds
bC5jaD4NCj4gQ2M6IENocmlzdGlhbiBLb2VuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4N
Cj4gQ2M6IERtaXRyeSBPc2lwZW5rbyA8ZG1pdHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb20+DQo+
IENjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+DQo+IENjOiBHdXJjaGV0YW4gU2lu
Z2ggPGd1cmNoZXRhbnNpbmdoQGNocm9taXVtLm9yZz4NCj4gQ2M6IENoaWEtSSBXdSA8b2x2YWZm
ZUBnbWFpbC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+DQo+IENjOiBNaWNoYWwgV2FqZGVjemtvIDxtaWNoYWwud2FqZGVjemtv
QGludGVsLmNvbT4NCj4gQ2M6IE1pY2hhZWwgVHJldHRlciA8bS50cmV0dGVyQHBlbmd1dHJvbml4
LmRlPg0KPiANCj4gVml2ZWsgS2FzaXJlZGR5ICg1KToNCj4gICBkcm0vdmlydGlvOiBJbXBsZW1l
bnQgVklSVElPX0dQVV9DTURfUkVTT1VSQ0VfREVUQUNIX0JBQ0tJTkcNCj4gY21kDQo+ICAgZHJt
L3ZpcnRpbzogQWRkIGEgaGVscGVyIHRvIG1hcCBhbmQgbm90ZSB0aGUgZG1hIGFkZHJzIGFuZCBs
ZW5ndGhzDQo+ICAgZHJtL3ZpcnRpbzogQWRkIGhlbHBlcnMgdG8gaW5pdGlhbGl6ZSBhbmQgZnJl
ZSB0aGUgaW1wb3J0ZWQgb2JqZWN0DQo+ICAgZHJtL3ZpcnRpbzogSW1wb3J0IHByaW1lIGJ1ZmZl
cnMgZnJvbSBvdGhlciBkZXZpY2VzIGFzIGd1ZXN0IGJsb2JzDQo+ICAgZHJtL3ZpcnRpbzogQWRk
IHByZXBhcmUgYW5kIGNsZWFudXAgcm91dGluZXMgZm9yIGltcG9ydGVkIGRtYWJ1ZiBvYmoNCj4g
DQo+ICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmggICAgfCAgMTAgKysNCj4g
IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9vYmplY3QuYyB8ICAyNiArKysrDQo+ICBk
cml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfcGxhbmUuYyAgfCAgNzEgKysrKysrKysrLQ0K
PiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ByaW1lLmMgIHwgMTcwICsrKysrKysr
KysrKysrKysrKysrKysrLQ0KPiAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X3ZxLmMg
ICAgIHwgIDI1ICsrKysNCj4gIDUgZmlsZXMgY2hhbmdlZCwgMzAwIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pDQo+IA0KPiAtLQ0KPiAyLjQ1LjENCg0K
