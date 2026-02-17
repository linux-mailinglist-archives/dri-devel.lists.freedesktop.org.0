Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +P1bJqDpk2kt9wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:08:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD5D148ABD
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D4A110E433;
	Tue, 17 Feb 2026 04:07:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C1wePOhh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA0610E431;
 Tue, 17 Feb 2026 04:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771301277; x=1802837277;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oAYbEnwPrbpOqHNTdzdZGmKhskcSg69LkTfh9JGnOvo=;
 b=C1wePOhhZiutuPAKUI1uFmvvD+TiAJ75c7YWoVvXmD9qFHDpcwni10UN
 qJCanAqAuOlr/Ns0UV/n8y8EmB6AnydWTyfXWsnH1GYfAFad0uYcGimeT
 X3mqu10ryiYCi8W/5yt/Pa+eJ4K00JFZ/5ejE9B+yH8O37Xhh35xUmbBk
 hV8xkUxbrfKIbt8UNs1fsj6VRJpZ2pETpXAdxFH0K016D7mSm7FLjZ8Ej
 LXqGhNpiX/1e6CLiEXTFZ+kpVoc2HiSVDukm9G/unAXXsZGiSX265/arY
 RltMxRVxVubR/kre68Xx4/4hhzSUuKX385Z7X4+SKdyeSXN0KXdQlApj9 g==;
X-CSE-ConnectionGUID: fuKBbk3XR8KWYgQ0Ojy/wg==
X-CSE-MsgGUID: GZgvHckfRnSyYCBfwCtoEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83732659"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83732659"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:07:57 -0800
X-CSE-ConnectionGUID: 0A6p9y89QSaPWe0q2Vc51Q==
X-CSE-MsgGUID: sfw8asqzTy+qpaIHPLuxIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="213868535"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:07:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:07:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 20:07:55 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.1) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:07:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IAUOdXsS6wWiAkn2bXeh2p1CsaJ42S95CDY0HxUHOVtJdYMRGS1FgwYm+c9x3Y6E3t4yslFrT6cVc85YRlpS6je66Q8ACGXqOapQf+dOb90qwoWcccB+pcGnUuhm4JOg2le9GUOa7Qmx1Bb5x+2BJKXROjV3Zg90r168SoZZsTPHPyFnqY451YDc2VRWe24HTM6SuRzbcfET9fh6senmhP7NryzflrUBIKEqHiuS0xKh46DPh1wPLFcF73NBrk+37KRzdbzcjp7CkbFMjuKncDJh0gICz2l35rWJZhqbRrupmh3yrm2chgWVH7t6Go8pD5GGWEpHrL2UsQc7bzp6Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAYbEnwPrbpOqHNTdzdZGmKhskcSg69LkTfh9JGnOvo=;
 b=DDJLfnEjhzV2jcC/LAX1jnthjb+nxcYs/B41NSsxP+J9SeOYwXYdCmiY5xPMkvx3g1NJHt4v1zXsoaThdvq8UiNzGLpGDMkN+9SLOtfnhZuqBRvSfJFK7vfBbmehQokuPwm0oI5h5CWYbGdYHLb3C0qEF+BBgevdjg+a8WPbx+OtrMjYCxkPoZAQ+VYnQV65nSrCuEGpi1/MFCRma+9BevBQ588KPxegEDtN3axBcppdZF9L+wlMwxJ+qQbb95ClFap4Q/xpGhY6CE5kF8H3xO5dcoAj0XweBsedi8mnFakSwLmQsCQAWLApEBIsp9jfc0qa2HBi74sonhK58xgmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MN0PR11MB6159.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 04:07:52 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::a3d9:7cb3:f6e8:1035%5]) with mapi id 15.20.9611.012; Tue, 17 Feb 2026
 04:07:52 +0000
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
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Topic: [PATCH v9 5/7] drm/atomic: Return user readable error in
 atomic_ioctl
Thread-Index: AQHcmmyF/wh7TPXY4k+bl1HdMVXKKrWAX11AgAXxPoCAAABUIA==
Date: Tue, 17 Feb 2026 04:07:52 +0000
Message-ID: <DM3PPF208195D8DC34FCB4CFBB50133129CE36DA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
 <20260210-atomic-v9-5-525c88fd2402@intel.com>
 <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
 <IA0PR11MB7307E0F361AB3076F86393D4BA6DA@IA0PR11MB7307.namprd11.prod.outlook.com>
In-Reply-To: <IA0PR11MB7307E0F361AB3076F86393D4BA6DA@IA0PR11MB7307.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MN0PR11MB6159:EE_
x-ms-office365-filtering-correlation-id: 3cb0c1a2-f064-4d08-d994-08de6dda1f22
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?bE0rM1JzRXhQVHY5a2hzTzB2aHlnZ3BqTzdYL3ZKL3Q5N2YzTGdhaHhzR1dq?=
 =?utf-8?B?MHJvZW5CWWsyQ3B0NUJLWXprdUhQT0VPZGowQ1IvQ3ArUmlKNjAyc2hnb29P?=
 =?utf-8?B?U1RKb254SWdBSDhCbEhhUXZqeUNaOUE4azRhckVJa1ZiUGdkVFNOelF4ZVVD?=
 =?utf-8?B?MEJNamJ4MXE3dGpMZFNMQ2VONjFPOTJZSlgwZTE5YjFsVEZJdU9RMEdVdml6?=
 =?utf-8?B?czF6TG0rZ3duR1Qwbk1lczVqRkpXK1o0Ni85T3lPbUpnamRPQm5CbEFCQW5I?=
 =?utf-8?B?VTVLakEyd3FXOTlNWTM4YkIzOHFnM0lIREk3YXBXUW1Hai9tOExmbXBKRzN3?=
 =?utf-8?B?NVJWZUFxSW5OTWhET3d1RStTbkhOL2RoRWJ1eWlXNlA2RVZIV0VRNkJwMlE0?=
 =?utf-8?B?cFA2K1BmSjZjNHNORVFMUWtnMHdoaDRlTHdzOU1NMkZ6eHk5RjU1Qm1wWkht?=
 =?utf-8?B?YU9Jc2d4L2VpeDJhVUFlU21TTGlHbE1qMUI4MUpyK2ZnU2gzdzIzQmhnaWdw?=
 =?utf-8?B?QjBoRlhMMFdnWG51REZrbnRRdVdrQTYwRFFuSXJtNXdvWmRLdkFuSldxOE9x?=
 =?utf-8?B?L3JjNjh6MUthTVN3emEwMUtwNzkxckJPMkp3L0ZVOUFMbDJIN0RvUWFoRExO?=
 =?utf-8?B?b1A3QW9JN04zL1ZCZHlsQ0ZiWWxqcDJWWldDY2I4TWJ1dDFmYm1zeEp0T0oz?=
 =?utf-8?B?Y2VvNjlDdVNuUEZOOWZLbkJLdVpoWTF3Njl2dCtLdWhKM2dqeTJiVmdLZjB2?=
 =?utf-8?B?NDFucXhLSEY4TzJUKzhneFJSWnBlUGVJd0JDaHpUVVlVQnBGWjlPT0xEcnFy?=
 =?utf-8?B?TVJEbVFzclJ6SHZ2WGhrV1JjSzVtYThXQm9CaDNWQ2JzK08rVW9qZXJMbnV0?=
 =?utf-8?B?WWpVV0JqSUlwY1R5MG1aNnBLcUkyWWxLQ2VJaTNWRGVpUktHWU5yb296YU0x?=
 =?utf-8?B?QitwWmhnV1puT2djVDg1RmdWbWFwZFdBMi81cWdqdTFwQnZ2S0xpRjV2M3k2?=
 =?utf-8?B?ZXU2Y0tERWNVcmd0YldBUkNzNGloSUpKZWZFK0YvaEpLQXIyb3pTWTBuckZa?=
 =?utf-8?B?LzFqQ3VMVXpNeVZVSjB0VGhpUlV6UUlTWVgvZG0vWE1WMmxCMHZueWZwSHBh?=
 =?utf-8?B?UWdKSGNIZHlJajZjbml4N0lycUh4RnU2UlpWN1FkWi83cTVDd2NIZ05qUXAv?=
 =?utf-8?B?akJ6U3VvNCtKT0lSYkNkd0NTcVZFaEpjTnBXaGJtWFE3dnB6UHFFeGxKeVk4?=
 =?utf-8?B?WlBPN1Q4TmNzaGhFdHVCb1I5RFRsRE5LeENkcVA3MzNIaDNXYW5UdGRiaTVh?=
 =?utf-8?B?aVFTUjg0OExuNmdKbnU4NXhNS2pod2EzbXlXaHdQRVNaSlgwODlOK0tqR2ZI?=
 =?utf-8?B?VlQzS2ZRN243VTU5M1RaZ2U1aVBYZTJxQlArYmc2MHp0dXJlNTVXdDB6eGUv?=
 =?utf-8?B?eWtvVVEvY1h6TjhGWmk3V1lFU2dYS2N1aEVocCtWemZrTFUwckgvVVM5Y25N?=
 =?utf-8?B?aU5LaXl0MlZBREp6VnRFVVVsdmxxdnJmRkFWYWtRVnNVR1p0enlUN0pJTUFQ?=
 =?utf-8?B?WVRWdnpGMi9iZ1ZTelpYRHRORmZmbTErY29abjNjSmNIQ2ViOFZXVlU1ZnBQ?=
 =?utf-8?B?K25mTUFPeUd5YkM0aFpiS3RNYStYT25VL3FiancveVQ2SzdydTV0UG00K3Np?=
 =?utf-8?B?ZEtpdnRTakRZMTZJb3ZzVWVNMnVMVzFsRG43REhqU1NNdkQ0S21QWDg5VldF?=
 =?utf-8?B?OVRnL1hxUHN5T01Ic01NSlBwY3hoZzVsZVVUWnVGV0xuMmV0d0ZaSUhoaUJE?=
 =?utf-8?B?VjJYdXNzbHE4c1JRQWxSanlHMHlEaDQ3MEdURW1MSXVxMVBRYnh0cTVGTE8x?=
 =?utf-8?B?ZFBOWFE1VW9TM2tLWStQSm9wenM4aVdEY1hrNVoyRjhSSVNPK1NYRTkyS3RN?=
 =?utf-8?B?Y1JnakxjRG82ak52R25KY2JLdlhhT041d3ltU0x3RytiWThLeUF5N0pveGVS?=
 =?utf-8?B?WVpzTHJtUVV6V0tzMDd1Qk1WZFE1dkNBd0Fib2FlZlpPMldYblIrWVIwT05i?=
 =?utf-8?B?OHp6TGgzQnJHM01xVlVDNGwyK1ZiQ08vVG1rYStnUDRhK2F3Y0RtS210RjdU?=
 =?utf-8?B?dzk2VVBGWFNoSFZ6VUpVWUw2Y053S29pOXlPa2lwbGp0NGlXam9NSjA2MjVU?=
 =?utf-8?Q?E0VQIdrgG4l0lOJjrqjWrGOF7rgzQBulRJHMlp4Wx3sA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YXpzdE1sMVlWMUk0S2EyZGVRbzRTYkJ3a0Rkd1BETHVEeU1lOGhhcDNTT1N4?=
 =?utf-8?B?eGFZQVBYZGJGWjZRdFBYeHpQTE15a3J1dnNxZ3NockZWOWNnd3pmY2crWlFZ?=
 =?utf-8?B?R0tSYmx6WVhkemZRUVhadXFQZloyN1ZqM1ZlK3dtU2owVGxrcXBKYlYzWFVy?=
 =?utf-8?B?aUpCcmVIS1ZVbGJuK1duaTRDTDBYS2ZZVnJIYjhPU1dwT0VVMkpVdDRxaEcv?=
 =?utf-8?B?cDJVY1JnYWxWN0t3QVNsQnkyWk9TWDN3Qm5tL2h1OXVGKytWVnU0djR1dXFG?=
 =?utf-8?B?UFVqMzZlM2VxaXJjYTlEZWNRbGdCMXI3MSt1SExQU3BLZ0JGaXA3d2RQSFl3?=
 =?utf-8?B?NGpDSXhMUVdScjVWT2R3WkVPVkl4TnZ5Ri9FZkV5My9ta1NxbDB2a1lidkda?=
 =?utf-8?B?alVXUzA5RlJ6TEgyWGNkeDJxWWlOY1J3ZVZMYUNFMjJSRWZORzFxTTdneHlO?=
 =?utf-8?B?UkFJci9oOVFvWCsvbHVrUnIvMVFuc2JXaXpacTZOL01iS0lJUlB0NE1qTklM?=
 =?utf-8?B?NlY4ZFVTczRXMWFvSlIyVEZrdVBGdno1SFFPQWdOMkhYaThDTHRMMDROMlVh?=
 =?utf-8?B?c3BFRVFIYk9makJ5VFBDWHpWNTM3N28wRURsM3hMRWNPSEFhMXlrSTdrNVg5?=
 =?utf-8?B?U1c0UGFFck1ORlh2dERQQy9YVm1Fc25YVmo0WjV5UnFRSmxxdFFNVDFJYzBU?=
 =?utf-8?B?K28zeU9WMUxjQVFOYmtJam5jb0xwUkJ0Y2ordUpFWThIeUxqSjNTc1RkbzJS?=
 =?utf-8?B?UGIraEdva3hRQTRNcU5ldGVPcS9QQVV3S1RVYksvTk5iRkVzeit3cGxvYXhk?=
 =?utf-8?B?WEpjTVdXSkZRK3hNSlhvL0FXSUxrdW9lZWJ5NTFtZUlTcHBPSG4zTXNyZ2xJ?=
 =?utf-8?B?SGI1di95MDFtOEZVT3hCSTVJOGNydG1Fb0hoZkdoeHp1d1E2UnJUUnhTeTdk?=
 =?utf-8?B?WXJoWFNteU0zM05JY25zaFdXRTZXK1dESmgwQ2FMdjlGNzkyUEZuTmZHUERz?=
 =?utf-8?B?RzNUM041eHd6NU9oZTdvcTV5YURXRy9yazJUZFQrZi95ZTIwRjd6ek9OMXZY?=
 =?utf-8?B?bUxDN0hncWlCQ0VyMFNzOWsvL3M5VXl6VlVTR1g4bHl2S2VQRlNsaUpoeHhY?=
 =?utf-8?B?QkI4Z0pMa05iZTc1WEdBb1FDUEhoM01FYmpOT1V5UXh6VmkxNFJaL0Fjc09h?=
 =?utf-8?B?SGNCakV5K2QvN1hiZUpqUlJCcFp5bVJhMTlkRmZYSjRkQWFjdlVCeUQ4emow?=
 =?utf-8?B?OU5MeTNhYVNlL1Jnd2h1RXVxL1hmWlZDMlV3R0xJVzJtQ1hhdU9saXM0ajF3?=
 =?utf-8?B?RENNRXJRdGw4cHRTeVBKeUtFN202MW1nektCdEw5WVJuQ1hweUdjaDMrUzRE?=
 =?utf-8?B?WmMxd0VyTnNjTTJjUURjWklJcUU4UDR0dUlSOERCUW51aEp3NTVNMU5sQ3k5?=
 =?utf-8?B?b1BXMzVOcVRQcllhd1dDbHNuTVIrTTI0dzJvMitUdXlaMTI0WlRYNnE3TG5D?=
 =?utf-8?B?ODdVQkdDUGpGbFEwRVBXTnZFdW5QT2wzZTNRWm1CUm1SVU5WWjQxcVhsR2dD?=
 =?utf-8?B?MEErM3NkNFhsdGFpeTlBQWlzR2E2MkVLR3g2VGViSEFCZko3T214S3ZTaGc0?=
 =?utf-8?B?dUhtQmxnZ2dLL0NpUnUrY2pvZGJLcHJ6S2V6TG9JS0V4UzNWcW0yek5jVGpm?=
 =?utf-8?B?Y1JQa3FvZkh2dXM4dStaRzJXcDZIR1hMQlI4QUlQV1lnc0lGU0hhN2dGc3hT?=
 =?utf-8?B?bGQzVFllT3hETzhlNkdHUEhNekxXV1QrNFM0TnBNT0QyVWtFbURlcHpUaFl4?=
 =?utf-8?B?S3NNQmVWb0FONUNad3hEZ3M3VVZIYjA0VVlQaFNYZU5xVXBtdjdLRm9YSHE5?=
 =?utf-8?B?UWx3TWEvQnhNZ21BRm1PVE9XK1JNUkJ6RWpNZlhoOS9PdU9MdFJtdyt4cGgw?=
 =?utf-8?B?UGhBSVJFSFVFaTMrc28rYjMydGdIcXpyQ29PN3o3N2lLT29EcFJHeWhNL29O?=
 =?utf-8?B?dlhMNmU3d0pFbjhWb05MeHBibzhOaXJKaGxEYUFXQTh1RXdTZkdlRzdKYWFl?=
 =?utf-8?B?cUpRWTZiM1BGU1pUSGFDeEpmUlhjZTA4S0s0V3h0MnZsUEErbEVLQUV4eGJI?=
 =?utf-8?B?Y0FFRmtmNGZ3bW9pSndYZC9vUG5RYnpjeXMzZEVqK0M5aWVZMStCLytYVkp4?=
 =?utf-8?B?UDE3VUFPZTRzMy9CZlBjZzFxVXNKOE51LzBSSlZyM2U0N3ZwOSt1Y3N0clBS?=
 =?utf-8?B?cEJGTE8xNk1RMlhacTBOTE5Sa1UrMnI4UUUwdUJYVmowL2t2YWFqRWNXZlBr?=
 =?utf-8?B?d0hnYUl3WVViUUhlRXovRmMzK2Q3UEhpblg0MlNFUVpDT0tXMTR3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cb0c1a2-f064-4d08-d994-08de6dda1f22
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 04:07:52.5704 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y71XdhRiI9BwGZq1QQkB7MZQQoV94hH6bQHyjcF3VrfvVXD08+oG3KsN9Gyj4zlOb9xJ8CDVjKUVASx/vJvrPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6159
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
X-Spamd-Result: default: False [-1.21 / 15.00];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
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
X-Rspamd-Queue-Id: 3CD5D148ABD
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTXVydGh5LCBBcnVuIFIg
PGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCBGZWJydWFyeSAxNywg
MjAyNiA5OjM2IEFNDQo+IFRvOiBLYW5kcGFsLCBTdXJhaiA8c3VyYWoua2FuZHBhbEBpbnRlbC5j
b20+OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPjsgTWF4aW1lIFJpcGFyZA0KPiA8bXJpcGFyZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Ow0KPiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgSmFuaQ0KPiBOaWt1bGEg
PGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+Ow0KPiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5p
bnRlbC5jb20+OyBUdnJ0a28gVXJzdWxpbg0KPiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+OyB4YXZl
ci5odWdsQGtkZS5vcmc7IGhhcnJ5LndlbnRsYW5kQGFtZC5jb207DQo+IFNoYW5rYXIsIFVtYSA8
dW1hLnNoYW5rYXJAaW50ZWwuY29tPjsgbG91aXMuY2hhdXZldEBib290bGluLmNvbTsNCj4gS3Vt
YXIsIE5hdmVlbjEgPG5hdmVlbjEua3VtYXJAaW50ZWwuY29tPjsgWWVsbGEsIFJhbXlhIEtyaXNo
bmENCj4gPHJhbXlhLmtyaXNobmEueWVsbGFAaW50ZWwuY29tPg0KPiBDYzogZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50
ZWwtDQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY5
IDUvN10gZHJtL2F0b21pYzogUmV0dXJuIHVzZXIgcmVhZGFibGUgZXJyb3IgaW4NCj4gYXRvbWlj
X2lvY3RsDQo+IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206
IEthbmRwYWwsIFN1cmFqIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gPiBTZW50OiBGcmlk
YXksIEZlYnJ1YXJ5IDEzLCAyMDI2IDI6NTQgUE0NCj4gPiBUbzogTXVydGh5LCBBcnVuIFIgPGFy
dW4uci5tdXJ0aHlAaW50ZWwuY29tPjsgTWFhcnRlbiBMYW5raG9yc3QNCj4gPiA8bWFhcnRlbi5s
YW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZA0KPiA+IDxtcmlwYXJkQGtl
cm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47DQo+IERh
dmlkDQo+ID4gQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT47IFNpbW9uYSBWZXR0ZXIgPHNpbW9u
YUBmZndsbC5jaD47IEphbmkNCj4gPiBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVsLmNv
bT47IFZpdmksIFJvZHJpZ28NCj4gPiA8cm9kcmlnby52aXZpQGludGVsLmNvbT47IEpvb25hcyBM
YWh0aW5lbg0KPiA+IDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29tPjsgVHZydGtvIFVy
c3VsaW4NCj4gPiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+OyB4YXZlci5odWdsQGtkZS5vcmc7IGhh
cnJ5LndlbnRsYW5kQGFtZC5jb207DQo+ID4gU2hhbmthciwgVW1hIDx1bWEuc2hhbmthckBpbnRl
bC5jb20+OyBsb3Vpcy5jaGF1dmV0QGJvb3RsaW4uY29tOw0KPiA+IEt1bWFyLA0KPiA+IE5hdmVl
bjEgPG5hdmVlbjEua3VtYXJAaW50ZWwuY29tPjsgWWVsbGEsIFJhbXlhIEtyaXNobmENCj4gPiA8
cmFteWEua3Jpc2huYS55ZWxsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGludGVsLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7DQo+ID4gaW50
ZWwtIHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXVydGh5LCBBcnVuIFINCj4gPiA8YXJ1bi5y
Lm11cnRoeUBpbnRlbC5jb20+DQo+ID4gU3ViamVjdDogUkU6IFtQQVRDSCB2OSA1LzddIGRybS9h
dG9taWM6IFJldHVybiB1c2VyIHJlYWRhYmxlIGVycm9yIGluDQo+ID4gYXRvbWljX2lvY3RsDQo+
ID4NCj4gPiA+IFN1YmplY3Q6IFtQQVRDSCB2OSA1LzddIGRybS9hdG9taWM6IFJldHVybiB1c2Vy
IHJlYWRhYmxlIGVycm9yIGluDQo+ID4gPiBhdG9taWNfaW9jdGwNCj4gPiA+DQo+ID4gPiBBZGQg
dXNlciByZWFkYWJsZSBlcnJvciBjb2RlcyBmb3IgZmFpbHVyZSBjYXNlcyBpbg0KPiA+ID4gZHJt
X2F0b21pY19pb2N0bCgpIHNvIHRoYXQgdXNlciBjYW4gZGVjb2RlIHRoZSBlcnJvciBjb2RlIGFu
ZCB0YWtlDQo+IGNvcnJlY3RpdmUgbWVhc3VyZW1lbnRzLg0KPiA+ID4NCj4gPiA+IHY4OiBSZXBs
YWNlZCBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfTk9UX1NVUFBfUExBTkUsDQo+ID4gPiAgICAgRFJN
X01PREVfQVRPTUlDX0FTWU5DX01PRElGSUVSX05PVF9TVVBQIHdpdGgNCj4gPiBJTlZBTElEX0FQ
SV9VU0FHRQ0KPiA+ID4gICAgIChYYXZlcikNCj4gPiA+IHY5OiBNb3ZlIGZyZWUgYXRvbWljX3N0
YXRlIG9uIGVycm9yIHRvIHBhdGNoIDMgKFN1cmFqKQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+
ID4gPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jIHwgNTgNCj4gPiA+ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiA+IC0tLS0tLS0tDQo+ID4gPiAgMSBmaWxl
IGNoYW5nZWQsIDQ0IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ID4gPiBpbmRleA0KPiA+ID4NCj4g
Pg0KPiBiY2QxMmI2ZWFjNGY0OTdkMmVkYjg1ODFkOWZiMGZkNTRjYmVmODI3Li5mMGMzZjA4MGY1
ZDY2YzczM2RmYmZhMjNmMw0KPiA4DQo+ID4gYQ0KPiA+ID4gMjIxMzIxOTNhZGVjIDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ID4gPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiA+IEBAIC0xMTk2LDYgKzEx
OTYsMTEgQEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiA+ID4gZHJtX2F0
b21pY19zdGF0ZSAqc3RhdGUsDQo+ID4gPiAgCQkJcmV0ID0gZHJtX2F0b21pY19jb25uZWN0b3Jf
Z2V0X3Byb3BlcnR5KGNvbm5lY3RvciwNCj4gPiA+IGNvbm5lY3Rvcl9zdGF0ZSwNCj4gPiA+ICAJ
CQkJCQkJCXByb3AsDQo+ID4gPiAmb2xkX3ZhbCk7DQo+ID4gPiAgCQkJcmV0ID0gZHJtX2F0b21p
Y19jaGVja19wcm9wX2NoYW5nZXMocmV0LCBvbGRfdmFsLA0KPiA+IHByb3BfdmFsdWUsDQo+ID4g
PiBwcm9wKTsNCj4gPiA+ICsJCQlpZiAocmV0KSB7DQo+ID4gPiArCQkJCWRybV9tb2RlX2F0b21p
Y19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPiA+ID5lcnJvcl9jb2RlLA0KPiA+ID4gKw0KPiA+
ID4gRFJNX01PREVfQVRPTUlDX0FTWU5DX1BST1BfQ0hBTkdFRCwNCj4gPiA+ICsJCQkJCQkJICAg
ICAgInByb3BlcnR5IGNoYW5nZQ0KPiA+ID4gbm90IGFsbG93ZWQgaW4gYXN5bmMgZmxpcCIpOw0K
PiA+ID4gKwkJCX0NCj4gPiA+ICAJCQlicmVhazsNCj4gPiA+ICAJCX0NCj4gPiA+DQo+ID4gPiBA
QCAtMTIxOCw2ICsxMjIzLDExIEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9wZXJ0eShzdHJ1Y3QN
Cj4gPiA+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+ID4gIAkJCXJldCA9IGRybV9hdG9t
aWNfY3J0Y19nZXRfcHJvcGVydHkoY3J0YywgY3J0Y19zdGF0ZSwNCj4gPiA+ICAJCQkJCQkJICAg
cHJvcCwgJm9sZF92YWwpOw0KPiA+ID4gIAkJCXJldCA9IGRybV9hdG9taWNfY2hlY2tfcHJvcF9j
aGFuZ2VzKHJldCwgb2xkX3ZhbCwNCj4gPiBwcm9wX3ZhbHVlLA0KPiA+ID4gcHJvcCk7DQo+ID4g
PiArCQkJaWYgKHJldCkgew0KPiA+ID4gKwkJCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21z
Zygmc3RhdGUtDQo+ID4gPiA+ZXJyb3JfY29kZSwNCj4gPiA+ICsNCj4gPiA+IERSTV9NT0RFX0FU
T01JQ19BU1lOQ19QUk9QX0NIQU5HRUQsDQo+ID4gPiArCQkJCQkJCSAgICAgICJwcm9wZXJ0eSBj
aGFuZ2UNCj4gPiA+IG5vdCBhbGxvd2VkIGluIGFzeW5jIGZsaXAiKTsNCj4gPiA+ICsJCQl9DQo+
ID4gPiAgCQkJYnJlYWs7DQo+ID4gPiAgCQl9DQo+ID4gPg0KPiA+ID4gQEAgLTEyNTYsOSArMTI2
NiwxMCBAQCBpbnQgZHJtX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0DQo+ID4gPiBkcm1fYXRv
bWljX3N0YXRlICpzdGF0ZSwNCj4gPiA+ICAJCQkJCXJldCA9IHBsYW5lX2Z1bmNzLQ0KPiA+ID4g
PmF0b21pY19hc3luY19jaGVjayhwbGFuZSwgc3RhdGUsIHRydWUpOw0KPiA+ID4NCj4gPiA+ICAJ
CQkJaWYgKHJldCkgew0KPiA+ID4gLQkJCQkJZHJtX2RiZ19hdG9taWMocHJvcC0+ZGV2LA0KPiA+
ID4gLQkJCQkJCSAgICAgICAiW1BMQU5FOiVkOiVzXSBkb2VzIG5vdA0KPiA+ID4gc3VwcG9ydCBh
c3luYyBmbGlwc1xuIiwNCj4gPiA+IC0JCQkJCQkgICAgICAgb2JqLT5pZCwgcGxhbmUtPm5hbWUp
Ow0KPiA+ID4gKw0KPiA+ID4gCWRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0+
ZXJyb3JfY29kZSwNCj4gPiA+ICsNCj4gPiA+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9V
U0FHRSwNCj4gPiA+ICsNCj4gPiA+ICJbUExBTkU6JWQ6JXNdIGRvZXMgbm90IHN1cHBvcnQgYXN5
bmMgZmxpcCIsDQo+ID4gPiArCQkJCQkJCQkgICAgICBvYmotPmlkLA0KPiA+ID4gcGxhbmUtPm5h
bWUpOw0KPiA+ID4gIAkJCQkJYnJlYWs7DQo+ID4gPiAgCQkJCX0NCj4gPiA+ICAJCQl9DQo+ID4g
PiBAQCAtMTU2OCw2ICsxNTc5LDcgQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3Qg
ZHJtX2RldmljZQ0KPiA+ICpkZXYsDQo+ID4gPiAgCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpz
dGF0ZTsNCj4gPiA+ICAJc3RydWN0IGRybV9tb2Rlc2V0X2FjcXVpcmVfY3R4IGN0eDsNCj4gPiA+
ICAJc3RydWN0IGRybV9vdXRfZmVuY2Vfc3RhdGUgKmZlbmNlX3N0YXRlOw0KPiA+ID4gKwlzdHJ1
Y3QgZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlIF9fdXNlciAqZXJyb3JfY29kZV9wdHI7DQo+ID4g
PiAgCWludCByZXQgPSAwOw0KPiA+ID4gIAl1bnNpZ25lZCBpbnQgaSwgaiwgbnVtX2ZlbmNlcyA9
IDA7DQo+ID4gPiAgCWJvb2wgYXN5bmNfZmxpcCA9IGZhbHNlOw0KPiA+ID4gQEAgLTE1NzYsNiAr
MTU4OCwxNCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdA0KPiBkcm1fZGV2aWNl
DQo+ID4gPiAqZGV2LA0KPiA+ID4gIAlpZiAoIWRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoZGV2LCBE
UklWRVJfQVRPTUlDKSkNCj4gPiA+ICAJCXJldHVybiAtRU9QTk9UU1VQUDsNCj4gPiA+DQo+ID4g
PiArCWlmICghYXJnLT5yZXNlcnZlZCkNCj4gPiA+ICsJCWRybV9kYmdfYXRvbWljKGRldiwNCj4g
PiA+ICsJCQkgICAgICAgIm1lbW9yeSBub3QgYWxsb2NhdGVkIGZvciBkcm1fYXRvbWljIGVycm9y
DQo+ID4gPiByZXBvcnRpbmdcbiIpOw0KPiA+ID4gKwllbHNlDQo+ID4gPiArCQkvKiBVcGRhdGUg
dGhlIGVycm9yIGNvZGUgaWYgYW55IGVycm9yIHRvIGFsbG93IHVzZXIgaGFuZGxpbmcgaXQNCj4g
PiA+ICovDQo+ID4gPiArCQllcnJvcl9jb2RlX3B0ciA9IChzdHJ1Y3QgZHJtX21vZGVfYXRvbWlj
X2Vycl9jb2RlIF9fdXNlcg0KPiA+ID4gKikNCj4gPiA+ICsJCQkJICh1bnNpZ25lZCBsb25nKWFy
Zy0+cmVzZXJ2ZWQ7DQo+ID4gPiArDQo+ID4gPiAgCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9h
bGxvYyhkZXYpOw0KPiA+ID4gIAlpZiAoIXN0YXRlKQ0KPiA+ID4gIAkJcmV0dXJuIC1FTk9NRU07
DQo+ID4gPiBAQCAtMTU4NCwxMSArMTYwNCwxNiBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdA0KPiBkcm1fZGV2aWNlDQo+ID4gPiAqZGV2LA0KPiA+ID4gIAlzdGF0ZS0+YWNxdWly
ZV9jdHggPSAmY3R4Ow0KPiA+ID4gIAlzdGF0ZS0+YWxsb3dfbW9kZXNldCA9ICEhKGFyZy0+Zmxh
Z3MgJg0KPiA+ID4gRFJNX01PREVfQVRPTUlDX0FMTE9XX01PREVTRVQpOw0KPiA+ID4NCj4gPiA+
ICsJbWVtc2V0KCZzdGF0ZS0+ZXJyb3JfY29kZSwgMCwgc2l6ZW9mKCplcnJvcl9jb2RlX3B0cikp
Ow0KPiA+ID4gKw0KPiA+ID4gIAkvKiBkaXNhbGxvdyBmb3IgdXNlcnNwYWNlIHRoYXQgaGFzIG5v
dCBlbmFibGVkIGF0b21pYyBjYXAgKGV2ZW4NCj4gPiA+ICAJICogdGhvdWdoIHRoaXMgbWF5IGJl
IGEgYml0IG92ZXJraWxsLCBzaW5jZSBsZWdhY3kgdXNlcnNwYWNlDQo+ID4gPiAgCSAqIHdvdWxk
bid0IGtub3cgaG93IHRvIGNhbGwgdGhpcyBpb2N0bCkNCj4gPiA+ICAJICovDQo+ID4gPiAgCWlm
ICghZmlsZV9wcml2LT5hdG9taWMpIHsNCj4gPiA+ICsJCWRybV9tb2RlX2F0b21pY19hZGRfZXJy
b3JfbXNnKCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gPiA+ICsNCj4gPiA+IERSTV9NT0RFX0FUT01J
Q19JTlZBTElEX0FQSV9VU0FHRSwNCj4gPiA+ICsJCQkJCSAgICAgICJkcm0gYXRvbWljIGNhcGFi
aWxpdHkgbm90DQo+ID4gPiBlbmFibGVkIik7DQo+ID4gPiAgCQlkcm1fZGJnX2F0b21pYyhkZXYs
DQo+ID4gPiAgCQkJICAgICAgICJjb21taXQgZmFpbGVkOiBhdG9taWMgY2FwIG5vdCBlbmFibGVk
XG4iKTsNCj4gPiA+ICAJCXJldCA9IC1FSU5WQUw7DQo+ID4gPiBAQCAtMTU5NiwyMSArMTYyMSwx
OCBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdA0KPiBkcm1fZGV2aWNlDQo+ID4g
PiAqZGV2LA0KPiA+ID4gIAl9DQo+ID4gPg0KPiA+ID4gIAlpZiAoYXJnLT5mbGFncyAmIH5EUk1f
TU9ERV9BVE9NSUNfRkxBR1MpIHsNCj4gPiA+IC0JCWRybV9kYmdfYXRvbWljKGRldiwgImNvbW1p
dCBmYWlsZWQ6IGludmFsaWQgZmxhZ1xuIik7DQo+ID4gPiAtCQlyZXQgPSAtRUlOVkFMOw0KPiA+
ID4gLQkJZ290byBvdXQ7DQo+ID4gPiAtCX0NCj4gPiA+IC0NCj4gPiA+IC0JaWYgKGFyZy0+cmVz
ZXJ2ZWQpIHsNCj4gPiA+IC0JCWRybV9kYmdfYXRvbWljKGRldiwgImNvbW1pdCBmYWlsZWQ6IHJl
c2VydmVkIGZpZWxkIHNldFxuIik7DQo+ID4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9y
X21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gPiArDQo+ID4gPiBEUk1fTU9ERV9BVE9NSUNf
SU5WQUxJRF9BUElfVVNBR0UsDQo+ID4gPiArCQkJCQkgICAgICAiaW52YWxpZCBmbGFnIik7DQo+
ID4gPiAgCQlyZXQgPSAtRUlOVkFMOw0KPiA+ID4gIAkJZ290byBvdXQ7DQo+ID4gPiAgCX0NCj4g
PiA+DQo+ID4gPiAgCWlmIChhcmctPmZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQX0FTWU5DKSB7
DQo+ID4gPiAgCQlpZiAoIWRldi0+bW9kZV9jb25maWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+ID4g
PiAtCQkJZHJtX2RiZ19hdG9taWMoZGV2LA0KPiA+ID4gLQkJCQkgICAgICAgImNvbW1pdCBmYWls
ZWQ6DQo+ID4gPiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgbm90IHN1cHBvcnRlZFxuIik7DQo+
ID4gPiArCQkJZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2coJnN0YXRlLQ0KPiA+ID4gPmVy
cm9yX2NvZGUsDQo+ID4gPiArDQo+ID4gPiBEUk1fTU9ERV9BVE9NSUNfSU5WQUxJRF9BUElfVVNB
R0UsDQo+ID4gPiArDQo+ID4gPiAiRFJNX01PREVfUEFHRV9GTElQX0FTWU5DIG5vdCBzdXBwb3J0
ZWQgd2l0aCBBVE9NSUMNCj4gPiA+ICtpb2N0bCIpOw0KPiA+ID4gIAkJCXJldCA9IC1FSU5WQUw7
DQo+ID4gPiAgCQkJZ290byBvdXQ7DQo+ID4gPiAgCQl9DQo+ID4gPiBAQCAtMTYyMSw4ICsxNjQz
LDkgQEAgaW50IGRybV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0KPiA+ICpk
ZXYsDQo+ID4gPiAgCS8qIGNhbid0IHRlc3QgYW5kIGV4cGVjdCBhbiBldmVudCBhdCB0aGUgc2Ft
ZSB0aW1lLiAqLw0KPiA+ID4gIAlpZiAoKGFyZy0+ZmxhZ3MgJiBEUk1fTU9ERV9BVE9NSUNfVEVT
VF9PTkxZKSAmJg0KPiA+ID4gIAkJCShhcmctPmZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQX0VW
RU5UKSkgew0KPiA+ID4gLQkJZHJtX2RiZ19hdG9taWMoZGV2LA0KPiA+ID4gLQkJCSAgICAgICAi
Y29tbWl0IGZhaWxlZDogcGFnZS1mbGlwIGV2ZW50IHJlcXVlc3RlZCB3aXRoDQo+ID4gPiB0ZXN0
LW9ubHkgY29tbWl0XG4iKTsNCj4gPiA+ICsJCWRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNn
KCZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gPiA+ICsNCj4gPiA+IERSTV9NT0RFX0FUT01JQ19JTlZB
TElEX0FQSV9VU0FHRSwNCj4gPiA+ICsJCQkJCSAgICAgICJwYWdlLWZsaXAgZXZlbnQgcmVxdWVz
dGVkIHdpdGgNCj4gPiA+IHRlc3Qtb25seSBjb21taXQiKTsNCj4gPiA+ICAJCXJldCA9IC1FSU5W
QUw7DQo+ID4gPiAgCQlnb3RvIG91dDsNCj4gPiA+ICAJfQ0KPiA+ID4gQEAgLTE3MjUsNiArMTc0
OCwxMyBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdA0KPiBkcm1fZGV2aWNlDQo+
ID4gPiAqZGV2LA0KPiA+ID4gIAl9DQo+ID4gPg0KPiA+ID4gIG91dDoNCj4gPiA+ICsJLyogVXBk
YXRlIHRoZSBlcnJvciBjb2RlIGlmIGFueSBlcnJvciB0byBhbGxvdyB1c2VyIGhhbmRsaW5nIGl0
ICovDQo+ID4gPiArCWlmIChyZXQgPCAwICYmIGFyZy0+cmVzZXJ2ZWQpIHsNCj4gPiA+ICsJCWlm
IChjb3B5X3RvX3VzZXIoZXJyb3JfY29kZV9wdHIsICZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gPiA+
ICsJCQkJIHNpemVvZihzdGF0ZS0+ZXJyb3JfY29kZSkpKQ0KPiA+DQo+ID4gQ29ybmVyIGNhc2Ug
d2hhdCBpZiB5b3UgZW5kIHVwIGhlcmUgcmlnaHQgYWZ0ZXIgYWxsb2NhdGluZyBhIHN0YXRlIGFu
ZA0KPiA+IGNvbWUgaGVyZSBiZWNhdXNlIG9mIG9uZSBvZiB0aGUgY29uZGl0aW9ucyBXaGljaCB3
ZXJlIHByZXZpb3VzbHkNCj4gPiBjaGVja2VkIGJlZm9yZSBzdGF0ZSBhbGxvY2F0aW9uLiBBbmQg
dGhlbiB0aGlzIGNvcHkgdG8gdXNlciBmYWlscy4NCj4gPiBUaGVuIHdlIHJldHVybiB3aXRob3V0
IGZyZWVpbmcgdGhlIHN0YXRlLCBmZW5jZXMgZXRjLiBTaG91bGQgdGhpcyBiZQ0KPiA+IGRvbmUg
aW4gYSBjbGVhbmVyIHdheS4NCj4gPg0KPiBDYW4gYXMgd2VsbCBjaGFuZ2UgdGhpcyByZXR1cm4g
LUVGQVVMVCB0byBqdXN0IHJldCA9IC1FRkFVTFQgYW5kIGFsbG93IHRoZQ0KPiBjb2RlIGZsb3cg
dG8gY29udGludWUgdG8gY2xlYXIgdGhlIGF0b21pYyBzdGF0ZSBhbmQgZHJvcCB0aGUgbG9ja3Mg
YWNxdWlyZWQuDQo+IA0KDQpZZXMgdGhhdCBtYWtlcyBzZW5zZQ0KV2l0aCB0aGF0IGZpeGVkDQoN
ClJldmlld2VkLWJ5OiBTdXJhaiBLYW5kcGFsIDxzdXJhai5rYW5kcGFsQGludGVsLmNvbT4NCg0K
PiBUaGFua3MgYW5kIFJlZ2FyZHMsDQo+IEFydW4gUiBNdXJ0aHkNCj4gLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KDQo=
