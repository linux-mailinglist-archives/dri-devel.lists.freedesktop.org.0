Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPAjHznpk2kt9wEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:06:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF4148AA0
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 05:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1721D10E16E;
	Tue, 17 Feb 2026 04:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWEd9q+a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1162B10E16E;
 Tue, 17 Feb 2026 04:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771301172; x=1802837172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IqQmtgTWMkEKbrUIFFKefUrwg8tNiy7Zrqgcjfq2pG0=;
 b=mWEd9q+aJ2XjRVxQEGd4/Go+7jiuoheWgXyW3VUIGWy4QDUs2bhTK9Jz
 bi4nmhR1cXvxOw73esmm3k9Kct/LREDXZcSRFjuRBceKG2M9K4b1v/n9S
 y6M32PkVj+AyxrLHFZW1TzadMbGY1hC+4e8PMpUnRntha9EphCXHDgZB+
 cvFxPbAiOW82G5+STgrxgtbB8xDWtHY3maTG+Yb2+SKQn8vRONCKbKTfd
 psqgK9SUSRqTOYfq56m5a5iNHku9NF9wrIYvNu0z5sVu9oQ+BnYsf2JH+
 rs5zYtZlKAkLOVFPsd+tT5SrYP3UGLsSLRAYuTUu7U01L4cm85iTdunVu Q==;
X-CSE-ConnectionGUID: L6NW+KAKSUmhTfMRj8oXrA==
X-CSE-MsgGUID: /B5O+bwzRJSfpl/bOcprqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83469116"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="83469116"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:06:11 -0800
X-CSE-ConnectionGUID: 9cnT8BokT6aC2eQbdHpxNQ==
X-CSE-MsgGUID: WBHpqHHvS2+oPWMHxlnJRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="244355732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2026 20:06:10 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:06:09 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 20:06:09 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.18)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 20:06:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttgOfrEfLk4SMrPfkX2LKs3wMFrNzTuTOZI6vRVeJrMDXFpojO8q2FuNeQ36RgBHegmd2Z0QMeTdU25Io2v+bbBna3eYZGfphjRtzFyP8kFWA3/7+KqjzYQ6pDJ0PyVmOKXiIwr7Vt9bQsw9U5ZPeQNhxOlZA3zx04Ta2yibAiwwEuemkPwQZHYvyxuv+tuH21+E/O2zAaGzwGMaleUvHIzQ1ISRWoniuV0wb/GifQjRBJjmEtZYbgFwSWEdy2agHyLU8nDEQqiRL4A8d+3sl3uAKZN0WZJs7VrnF1oVu0I2b5NwjNj9Sj+RT2Jsw86q7dnhdYB2zsIIqXvtK78YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IqQmtgTWMkEKbrUIFFKefUrwg8tNiy7Zrqgcjfq2pG0=;
 b=pWUx3gKi+G8BpEmC/zywx/y30FoOqT4GqwvMSPBRT9iNDOI6UVWXQFi0SEGiDIDhG8A5y8us/BqxAWu6/xcJH1INHo1Wj0TN+dBujr1swEsQkt7r2VW9dLKQ8D5xQGWr9M7yCW9w5sB285wHOU3y4iXZ7GI3V/28LZBJxezBpTy+w9rWy8M0wg6roXfoxrb1U0lq0sFUOLREb5sTTX+P8PavTubNFY6pnwTuTfoVZZwxAPrNtDjvOvKJWIOXxHr4Lg4BB0C9evWPf71YAhDPFnYoK9Yf/X4285K5g393UrKZ/DHl4NFUg2t0V1JkFZbc4xU8gyeCz7id6wJAHEQEcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH3PPF55C5E51F2.namprd11.prod.outlook.com (2603:10b6:518:1::d20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 04:06:01 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 04:06:01 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, Maarten Lankhorst
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
Thread-Index: AQHcmmx+YisAN8b+g0+grO2n7VLqi7WAYAuAgAXwKUA=
Date: Tue, 17 Feb 2026 04:06:01 +0000
Message-ID: <IA0PR11MB7307E0F361AB3076F86393D4BA6DA@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20260210-atomic-v9-0-525c88fd2402@intel.com>
 <20260210-atomic-v9-5-525c88fd2402@intel.com>
 <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DA23C85CF5B0645AABDD4E361A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH3PPF55C5E51F2:EE_
x-ms-office365-filtering-correlation-id: 20d10eb4-3607-4918-f7ad-08de6dd9dd05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?N1ZTeDJidTZyU1FMd1hNUEcvcXZDUHlWdE5pMzVaSloxNzZOdlgxVmFFRlUy?=
 =?utf-8?B?VXcrVTlDcnVETnlPV0tCZ3F6ckM0My9aUGY2dnZKSkZwYUsxNEF5Mm5kdDdY?=
 =?utf-8?B?aDhOdUx6dWlBaGtSVllrZ1h3eWNZdHNxZEpyRDFoSVM0VTYyZkt6dHM5L1Uz?=
 =?utf-8?B?UGI2enprSkQ0NlRQbUowbUo2YmR4TFZXTWRtVU15eWRwcFdoS05oT1ljMjhy?=
 =?utf-8?B?VXVRaXZ5blZsQWNvUTQyMU5XblpKbmJQMlQxcktKVm5JckhwTGY2YjNwSDhN?=
 =?utf-8?B?TTYwRTgvYTY1Ky9hTGVaYUFFeTFkWmZZcnpVVjh0VlJaV00zVGxRKzEwWGZI?=
 =?utf-8?B?WlhoZXZheTdwc1I2bzFHT1JPelg4RXNhL2huZ21uRUdJaGo0YlFyY0VtZ0do?=
 =?utf-8?B?aEVKNURkS2h5WmZSZzkyeDl4Q3psYkh4NTNUWEFKeHRIbUpmNUpQYVJBR2hR?=
 =?utf-8?B?OWtUZmVIZ0lIeWFMaUtsWm1yS056MjJJcVlnYW1OSnhoMElSekdpaUQzclVG?=
 =?utf-8?B?ZXdjbVUwdzAxNXd2ZEtSZERxUTc1cEJrNFk5ajVVdWpNNGxHclV0cjN0QWxS?=
 =?utf-8?B?a0xvaGRjVVZDcmxsRWZPOXJ0ejNudWpTVEJIN1hHT0drQi9leUtlYnhUSVZL?=
 =?utf-8?B?NDN5OE5XV1JrYWNoQmo4amF4Z0xId2FHMEMrcTBPNWZXdGY5TTdpUkEraHZ3?=
 =?utf-8?B?VndJN1ZlSTNYazhLTm5rSGUwelRkbnRCZU5vbkgrMXdYdk5EeUVvcFQ3WVJ0?=
 =?utf-8?B?WHI0dnQvdWtYTnNiSUFSSjdYZ3ZnWldTV2JWTitTK2hIblphckozU05LaGRP?=
 =?utf-8?B?cXArOWR0UFRLSy9FbGlzdXcyNGNVMmdldUhoRGFqamRLU2JvakkvRE9WeFdo?=
 =?utf-8?B?ajNWRjVQTFh3Uk9LaGo3N2llNVQrcmtNWDlEdjg5UGNEbDRRQzErLy9Ea2VP?=
 =?utf-8?B?Tm5NaVRTY0pOYkh4VDlMVGd3dEVBRFY5dHVaQkFSTmEraVhvMS9yTHo2L1RB?=
 =?utf-8?B?SFBHQVZMNmdFSHM5eVQwbG5PNkZaSkdNTVE0SnlFQ3pjR01EZU9TOEN6U1JB?=
 =?utf-8?B?WEdZV1BvcWZzQzlyQVNEb3laN0E4VkhUS0hWRVBVMWFkT0pJSHFuSmJDT21i?=
 =?utf-8?B?ZTZvb0lVNytPaWtTWWdVdHc4bXo5cVZMcXJQaVNiZ2JzRVdvQWU0RzVIWEo4?=
 =?utf-8?B?NHNnZTZDeFBwbXZvWVlReXd4L29BcDN0Vm9OUlRtdmhjUDJhU1BGRi95T2hT?=
 =?utf-8?B?cmdmUWNlamhDaFRLOVVoTno1Rjl1ZFh1eWRXR2RKNVpJZ3NYUjlNMEZRcmJY?=
 =?utf-8?B?QmdGTTFZZGc5UFMvb2ZTY3d6a2dMU24rOTlWbG9NSXRzSWp0TUtoQ1VQTE5m?=
 =?utf-8?B?U3RNTEtXRmhLcnlwYlJVbi8vWmlMT1FQQXYvWHo2MnN3eXVGZ1NySVUvdTdW?=
 =?utf-8?B?d2dWSDlaZXJUekhlQVNpSG9DLzV0TTVRN255L21vNEQzZTgzNTZXejZ0SlFG?=
 =?utf-8?B?M09CL0FuTGNqVk9wbnIrN2wxSEs4dUlpZDVrMEFFUXNMS2tsZ3JKN1F5MFVz?=
 =?utf-8?B?VHlPZFluSU9LTG9yeklrYlZKR0wzSWhXU2ZETnYrVHU3Nm83OXZ0QkdMeGsx?=
 =?utf-8?B?U0ZMak9WVFAvbmFHVE1sayt0NCs1VkpmRTVjZnkrcG9uOGQyMk16K3J3VFlv?=
 =?utf-8?B?M0Rrdk1KVnpIQ1NtMk50OU54UDVDUHdpR1k4eTFtK0xqNEk2Y28rSFJUU2l5?=
 =?utf-8?B?cHlZMm1Bd1dWSFNpdXlCeHlEWFpvYkwxYXdkYkpwNUpqVktxV0ZSTXlGYnIr?=
 =?utf-8?B?bkNTY1RLbGZ2YU1zT3BBUFFGck5DNHlZNlN0N252VVdyQm1xMUpjN3F3ZU1a?=
 =?utf-8?B?QWtQd2hWbE9rUWNpeWFrZXUwUW9FdmNWRGpKYlMyRzlTZStOVTYxeGF4VUFn?=
 =?utf-8?B?bkNaREtadHZBb1I3UHIrdnM0bXlGcU9PbnFQUUwrTmVJV3hGM0tWWjU4UFVE?=
 =?utf-8?B?ZnY0S2ZLaHpVWXN6L212emZGUGJadnlqcWJlL2YydGpFbFc5b3h4MmJOdklB?=
 =?utf-8?B?eHZ1QU5scmZWSFN1czVzbStMbml5Q1l0VmQvMENCeTFhL2Z2MEQzNHloU29X?=
 =?utf-8?B?WTc4MmxiYkpwNnM3WXJna0lpc3NpR1pRM3dBTklibzMybUpDbm56ditRNTV2?=
 =?utf-8?Q?QMXElNrFtuWsC5Ruhf2sahuZcZzB/0YVS7+OZSXuVOOh?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OURndWhQUjF5RXhpWVFXZGhJWVpyTitobjljZUkzdFkyQ1BvODZncmRjZ0FF?=
 =?utf-8?B?ZTRDeGRsYUVEY3d5ZzJYeEJUaVFwTFE3T01ZMVdnL1ZHMWc2N1pqU3I4alZx?=
 =?utf-8?B?WXNlQ1RGaGg2RFN5SGJ3TmlIUXBsdWppTjEvVDNyKytTS04yQmI2NU9TZS9F?=
 =?utf-8?B?bU1Ma0x4TzdXMGZyZW5oNnViQTdwelM3Zk5lS0RpZWpEemZ0ZWMvYjZKeU9K?=
 =?utf-8?B?WGNwcm1ZTi9aRUJEWGN0bmh1YW9abzg4azJxUlVMNVU5Z2tZaE9TNjlvTCs4?=
 =?utf-8?B?d2RCN0JXRlh4aDZ2aWlCZmVkaEE2UW1SUXhtUDg4SDRsamRjeTU1UDJEMm8x?=
 =?utf-8?B?VUI1T2M2U0lCVURCSnBOMjJ6OHZaOEpaR1J1Z3NpVkozVGxtbDVGNm0rS2NG?=
 =?utf-8?B?U0J3RlVnMEYxV2F3QkE2clVQY0hpNVF6QkNwZUZaN2tzaTZPWUZKZTdsQ2FP?=
 =?utf-8?B?SlFNTlZXTmlzZEdKQU94K3pWS24wRUZRaFpTOWlkdnBDbEJrb0JHaW5KV0Zz?=
 =?utf-8?B?d05yQ2ZiVTRzbVIxa2xkRDNtZ0E5c0sxWXZ3WUNnQ1B4OVFMekVOWERLdkJW?=
 =?utf-8?B?QnNZeFQzK3htblVWaCtYMnU3azdzRGxoN3JUQkpacWhmVzZvWmM5T2J2enVZ?=
 =?utf-8?B?cCtVOVRoYmVGek8yaXRVRS9Ddzh2dk5hYTNOV21FMTYwVW5HeWRGTjVGYlA0?=
 =?utf-8?B?Y0tlRW45M29sZFFieXgrdHdMNktMYVRIdEZEYVFQOUVDVEVId1UxSTBrNnVU?=
 =?utf-8?B?WEtkd2ZOQ3RYcC8wcjgyQ2FmRVhMOFNISnFsMUpJU0RjMEcyMFV1RUpDN3ky?=
 =?utf-8?B?NENydTlUVWMwUFZ4RFNFbm1Ra1VyVDhtR2RTUDdWR2dILzlpS3VtdVpvTlF2?=
 =?utf-8?B?NjFxb1l4ZVVDbFRjM2RGNGFDNzB6clg2Y21TaGxLQTUvWHhFOHZvYkhTVktC?=
 =?utf-8?B?SUkvUTVoMzB2cU9qd0NXM0RCeFZYeCs0dE5ZY2Fod01jUlU0SDlLeUhoQTZT?=
 =?utf-8?B?QnZibGpwbEFad3pia1h2cHMvZkphNVRUeTExWklKVFh0N1docHNDK2Fka3ZN?=
 =?utf-8?B?dXNISFNDSDFDN0Q3dE1RWWtuZC84TCtDeGJIRGhIL1hZWUMwU1NaempZVGVY?=
 =?utf-8?B?UlliOTY1U1BsSFpLR1BScVRCYTc5WUdsek1jZzhac0hrdkkrNGFlZnZ1RmVu?=
 =?utf-8?B?UFJsYkVBOUdFNjJ6VGpPand5MWRkbStsTzVDSjdZYzRZKzBxSkY0NUlDTGIw?=
 =?utf-8?B?VDliSG1DZ29mcFpldngyQkZuQ0IvNlFMdzZlWjA1OFJoNEhJV0daZUVnZGJu?=
 =?utf-8?B?VTBSQmZ0U0o1ditvbGtlM0NBTS91NEVvZWVtWU83cHNQNHllYkF6c3h1MWdv?=
 =?utf-8?B?ZGxDTWhJMnBJWGtqdzFQRmlFUm5zYTZmZUhVNEw5UUhzNGwvUEtRYUczNHdZ?=
 =?utf-8?B?clhNeHdJYWtubzdDaXpXcjBuKzhpODJRQm5QS0hGTUptdmx2NUhwY1ljem5a?=
 =?utf-8?B?Yjd1aC9ZQnBKbjRiSDl6WWZaTk9wcEpKNzB6Nkh4dHBCS2hraCtXZmtJRkhs?=
 =?utf-8?B?WWdlNWRWNloyRjZkWExKZzlMQlNZc2VmQWFMZ25JTGZIN1ZIT1F5WkRqN1JX?=
 =?utf-8?B?MDVDczB5MXVNNmlrWlY4UXhGVEM4VDU2RXhvdzRidXlMNllId1p0ZVZPYzdS?=
 =?utf-8?B?NnNrT040OUJYc2I4RHd0ZFRGaWRmMmhKSjBKMmpsUnNKY05NeDI0SGZlVW02?=
 =?utf-8?B?MjlpZzdtWTIwOWhJMWR6YWtCaWNZM1pYUFMwS1dVY29SYTZYYXJaVEt4dFRS?=
 =?utf-8?B?RzdBbGFVbEhiNXBhU0NNUkhNVUZFbnFSMjlBcXBpRm81aXk3UE4xcDZURXlo?=
 =?utf-8?B?ZTlYN1VLOGdLTXV4aEVpVXpIdEFjM0hKcFFOVkh6U2hjNy9WNGw0QW9XVE93?=
 =?utf-8?B?ZmNVbDdLMkZuTVNSaktjcWRPWklmTS9ETEJtTHlSZVVNT29WR01OcXNyNTJk?=
 =?utf-8?B?ZUlqakhqbVY4ZEJEbFpRLytNcU9qQll4NEZrb2dITEZMNkRaOXU2SGRtMTBH?=
 =?utf-8?B?TE9EZzl5Z1BycWJLSEVDRVdBb0R0Y21MeHg3VkRadGhCY1IxQWJJVk96MzZs?=
 =?utf-8?B?QlQ2MFFZMnRiT29PTjQ5SDZGRndCbjBUeVBJYXlZZzZyczRzTXFlK0xDZFFt?=
 =?utf-8?B?K0x3Zjg0SE5pZkxHUUZIZVVhMHh0S2NXWnhoYUVueXBNbzBZakRGeGdsM01y?=
 =?utf-8?B?QkNrNUNSSm1Qc0Y2Q0VZRG4zbU1SZERBWXQrMmI0MVJvYVNlSGtVOURyV0xr?=
 =?utf-8?B?Vy9nanFtOVZoZjNXakVpV3p3TjczaUhnbWEvSkQ3S003aGU4TGpSQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20d10eb4-3607-4918-f7ad-08de6dd9dd05
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 04:06:01.6640 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +TyiHnRFYWXqguxpRgvRWJk868oAOgw282rDKKoueIqFDnZtp5MjpK4urRCv49Ds2eADpNJmf+RdQ49g15pSNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF55C5E51F2
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
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 28FF4148AA0
X-Rspamd-Action: no action

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEthbmRwYWwsIFN1cmFqIDxz
dXJhai5rYW5kcGFsQGludGVsLmNvbT4NCj4gU2VudDogRnJpZGF5LCBGZWJydWFyeSAxMywgMjAy
NiAyOjU0IFBNDQo+IFRvOiBNdXJ0aHksIEFydW4gUiA8YXJ1bi5yLm11cnRoeUBpbnRlbC5jb20+
OyBNYWFydGVuIExhbmtob3JzdA0KPiA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
PjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPjsNCj4gVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwu
Y29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgSmFuaSBOaWt1bGENCj4gPGph
bmkubmlrdWxhQGxpbnV4LmludGVsLmNvbT47IFZpdmksIFJvZHJpZ28gPHJvZHJpZ28udml2aUBp
bnRlbC5jb20+OyBKb29uYXMNCj4gTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRl
bC5jb20+OyBUdnJ0a28gVXJzdWxpbg0KPiA8dHVyc3VsaW5AdXJzdWxpbi5uZXQ+OyB4YXZlci5o
dWdsQGtkZS5vcmc7IGhhcnJ5LndlbnRsYW5kQGFtZC5jb207DQo+IFNoYW5rYXIsIFVtYSA8dW1h
LnNoYW5rYXJAaW50ZWwuY29tPjsgbG91aXMuY2hhdXZldEBib290bGluLmNvbTsgS3VtYXIsDQo+
IE5hdmVlbjEgPG5hdmVlbjEua3VtYXJAaW50ZWwuY29tPjsgWWVsbGEsIFJhbXlhIEtyaXNobmEN
Cj4gPHJhbXlhLmtyaXNobmEueWVsbGFAaW50ZWwuY29tPg0KPiBDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwt
DQo+IHhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgTXVydGh5LCBBcnVuIFIgPGFydW4uci5tdXJ0
aHlAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY5IDUvN10gZHJtL2F0b21pYzog
UmV0dXJuIHVzZXIgcmVhZGFibGUgZXJyb3IgaW4NCj4gYXRvbWljX2lvY3RsDQo+IA0KPiA+IFN1
YmplY3Q6IFtQQVRDSCB2OSA1LzddIGRybS9hdG9taWM6IFJldHVybiB1c2VyIHJlYWRhYmxlIGVy
cm9yIGluDQo+ID4gYXRvbWljX2lvY3RsDQo+ID4NCj4gPiBBZGQgdXNlciByZWFkYWJsZSBlcnJv
ciBjb2RlcyBmb3IgZmFpbHVyZSBjYXNlcyBpbiBkcm1fYXRvbWljX2lvY3RsKCkNCj4gPiBzbyB0
aGF0IHVzZXIgY2FuIGRlY29kZSB0aGUgZXJyb3IgY29kZSBhbmQgdGFrZSBjb3JyZWN0aXZlIG1l
YXN1cmVtZW50cy4NCj4gPg0KPiA+IHY4OiBSZXBsYWNlZCBEUk1fTU9ERV9BVE9NSUNfQVNZTkNf
Tk9UX1NVUFBfUExBTkUsDQo+ID4gICAgIERSTV9NT0RFX0FUT01JQ19BU1lOQ19NT0RJRklFUl9O
T1RfU1VQUCB3aXRoDQo+IElOVkFMSURfQVBJX1VTQUdFDQo+ID4gICAgIChYYXZlcikNCj4gPiB2
OTogTW92ZSBmcmVlIGF0b21pY19zdGF0ZSBvbiBlcnJvciB0byBwYXRjaCAzIChTdXJhaikNCj4g
Pg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFydW4gUiBNdXJ0aHkgPGFydW4uci5tdXJ0aHlAaW50ZWwu
Y29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMgfCA1
OA0KPiA+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0NCj4gPiAtLS0tLS0tLQ0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgNDQgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pDQo+ID4N
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+ID4g
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gPiBpbmRleA0KPiA+DQo+IGJj
ZDEyYjZlYWM0ZjQ5N2QyZWRiODU4MWQ5ZmIwZmQ1NGNiZWY4MjcuLmYwYzNmMDgwZjVkNjZjNzMz
ZGZiZmEyM2YzOA0KPiBhDQo+ID4gMjIxMzIxOTNhZGVjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljX3VhcGkuYw0KPiA+IEBAIC0xMTk2LDYgKzExOTYsMTEgQEAgaW50IGRybV9hdG9t
aWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiA+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+
ICAJCQlyZXQgPSBkcm1fYXRvbWljX2Nvbm5lY3Rvcl9nZXRfcHJvcGVydHkoY29ubmVjdG9yLA0K
PiA+IGNvbm5lY3Rvcl9zdGF0ZSwNCj4gPiAgCQkJCQkJCQlwcm9wLA0KPiA+ICZvbGRfdmFsKTsN
Cj4gPiAgCQkJcmV0ID0gZHJtX2F0b21pY19jaGVja19wcm9wX2NoYW5nZXMocmV0LCBvbGRfdmFs
LA0KPiBwcm9wX3ZhbHVlLA0KPiA+IHByb3ApOw0KPiA+ICsJCQlpZiAocmV0KSB7DQo+ID4gKwkJ
CQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtDQo+ID4gPmVycm9yX2NvZGUs
DQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19BU1lOQ19QUk9QX0NIQU5HRUQsDQo+ID4gKwkJ
CQkJCQkgICAgICAicHJvcGVydHkgY2hhbmdlDQo+ID4gbm90IGFsbG93ZWQgaW4gYXN5bmMgZmxp
cCIpOw0KPiA+ICsJCQl9DQo+ID4gIAkJCWJyZWFrOw0KPiA+ICAJCX0NCj4gPg0KPiA+IEBAIC0x
MjE4LDYgKzEyMjMsMTEgQEAgaW50IGRybV9hdG9taWNfc2V0X3Byb3BlcnR5KHN0cnVjdA0KPiA+
IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiA+ICAJCQlyZXQgPSBkcm1fYXRvbWljX2NydGNf
Z2V0X3Byb3BlcnR5KGNydGMsIGNydGNfc3RhdGUsDQo+ID4gIAkJCQkJCQkgICBwcm9wLCAmb2xk
X3ZhbCk7DQo+ID4gIAkJCXJldCA9IGRybV9hdG9taWNfY2hlY2tfcHJvcF9jaGFuZ2VzKHJldCwg
b2xkX3ZhbCwNCj4gcHJvcF92YWx1ZSwNCj4gPiBwcm9wKTsNCj4gPiArCQkJaWYgKHJldCkgew0K
PiA+ICsJCQkJZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2coJnN0YXRlLQ0KPiA+ID5lcnJv
cl9jb2RlLA0KPiA+ICsNCj4gPiBEUk1fTU9ERV9BVE9NSUNfQVNZTkNfUFJPUF9DSEFOR0VELA0K
PiA+ICsJCQkJCQkJICAgICAgInByb3BlcnR5IGNoYW5nZQ0KPiA+IG5vdCBhbGxvd2VkIGluIGFz
eW5jIGZsaXAiKTsNCj4gPiArCQkJfQ0KPiA+ICAJCQlicmVhazsNCj4gPiAgCQl9DQo+ID4NCj4g
PiBAQCAtMTI1Niw5ICsxMjY2LDEwIEBAIGludCBkcm1fYXRvbWljX3NldF9wcm9wZXJ0eShzdHJ1
Y3QNCj4gPiBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwNCj4gPiAgCQkJCQlyZXQgPSBwbGFuZV9m
dW5jcy0NCj4gPiA+YXRvbWljX2FzeW5jX2NoZWNrKHBsYW5lLCBzdGF0ZSwgdHJ1ZSk7DQo+ID4N
Cj4gPiAgCQkJCWlmIChyZXQpIHsNCj4gPiAtCQkJCQlkcm1fZGJnX2F0b21pYyhwcm9wLT5kZXYs
DQo+ID4gLQkJCQkJCSAgICAgICAiW1BMQU5FOiVkOiVzXSBkb2VzIG5vdA0KPiA+IHN1cHBvcnQg
YXN5bmMgZmxpcHNcbiIsDQo+ID4gLQkJCQkJCSAgICAgICBvYmotPmlkLCBwbGFuZS0+bmFtZSk7
DQo+ID4gKw0KPiA+IAlkcm1fbW9kZV9hdG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtPmVycm9y
X2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19JTlZBTElEX0FQSV9VU0FHRSwNCj4g
PiArDQo+ID4gIltQTEFORTolZDolc10gZG9lcyBub3Qgc3VwcG9ydCBhc3luYyBmbGlwIiwNCj4g
PiArCQkJCQkJCQkgICAgICBvYmotPmlkLA0KPiA+IHBsYW5lLT5uYW1lKTsNCj4gPiAgCQkJCQli
cmVhazsNCj4gPiAgCQkJCX0NCj4gPiAgCQkJfQ0KPiA+IEBAIC0xNTY4LDYgKzE1NzksNyBAQCBp
bnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ID4g
IAlzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGU7DQo+ID4gIAlzdHJ1Y3QgZHJtX21vZGVz
ZXRfYWNxdWlyZV9jdHggY3R4Ow0KPiA+ICAJc3RydWN0IGRybV9vdXRfZmVuY2Vfc3RhdGUgKmZl
bmNlX3N0YXRlOw0KPiA+ICsJc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSBfX3VzZXIg
KmVycm9yX2NvZGVfcHRyOw0KPiA+ICAJaW50IHJldCA9IDA7DQo+ID4gIAl1bnNpZ25lZCBpbnQg
aSwgaiwgbnVtX2ZlbmNlcyA9IDA7DQo+ID4gIAlib29sIGFzeW5jX2ZsaXAgPSBmYWxzZTsNCj4g
PiBAQCAtMTU3Niw2ICsxNTg4LDE0IEBAIGludCBkcm1fbW9kZV9hdG9taWNfaW9jdGwoc3RydWN0
IGRybV9kZXZpY2UNCj4gPiAqZGV2LA0KPiA+ICAJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJl
KGRldiwgRFJJVkVSX0FUT01JQykpDQo+ID4gIAkJcmV0dXJuIC1FT1BOT1RTVVBQOw0KPiA+DQo+
ID4gKwlpZiAoIWFyZy0+cmVzZXJ2ZWQpDQo+ID4gKwkJZHJtX2RiZ19hdG9taWMoZGV2LA0KPiA+
ICsJCQkgICAgICAgIm1lbW9yeSBub3QgYWxsb2NhdGVkIGZvciBkcm1fYXRvbWljIGVycm9yDQo+
ID4gcmVwb3J0aW5nXG4iKTsNCj4gPiArCWVsc2UNCj4gPiArCQkvKiBVcGRhdGUgdGhlIGVycm9y
IGNvZGUgaWYgYW55IGVycm9yIHRvIGFsbG93IHVzZXIgaGFuZGxpbmcgaXQNCj4gPiAqLw0KPiA+
ICsJCWVycm9yX2NvZGVfcHRyID0gKHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUgX191
c2VyDQo+ID4gKikNCj4gPiArCQkJCSAodW5zaWduZWQgbG9uZylhcmctPnJlc2VydmVkOw0KPiA+
ICsNCj4gPiAgCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYpOw0KPiA+ICAJaWYg
KCFzdGF0ZSkNCj4gPiAgCQlyZXR1cm4gLUVOT01FTTsNCj4gPiBAQCAtMTU4NCwxMSArMTYwNCwx
NiBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRl
diwNCj4gPiAgCXN0YXRlLT5hY3F1aXJlX2N0eCA9ICZjdHg7DQo+ID4gIAlzdGF0ZS0+YWxsb3df
bW9kZXNldCA9ICEhKGFyZy0+ZmxhZ3MgJg0KPiA+IERSTV9NT0RFX0FUT01JQ19BTExPV19NT0RF
U0VUKTsNCj4gPg0KPiA+ICsJbWVtc2V0KCZzdGF0ZS0+ZXJyb3JfY29kZSwgMCwgc2l6ZW9mKCpl
cnJvcl9jb2RlX3B0cikpOw0KPiA+ICsNCj4gPiAgCS8qIGRpc2FsbG93IGZvciB1c2Vyc3BhY2Ug
dGhhdCBoYXMgbm90IGVuYWJsZWQgYXRvbWljIGNhcCAoZXZlbg0KPiA+ICAJICogdGhvdWdoIHRo
aXMgbWF5IGJlIGEgYml0IG92ZXJraWxsLCBzaW5jZSBsZWdhY3kgdXNlcnNwYWNlDQo+ID4gIAkg
KiB3b3VsZG4ndCBrbm93IGhvdyB0byBjYWxsIHRoaXMgaW9jdGwpDQo+ID4gIAkgKi8NCj4gPiAg
CWlmICghZmlsZV9wcml2LT5hdG9taWMpIHsNCj4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRkX2Vy
cm9yX21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01JQ19J
TlZBTElEX0FQSV9VU0FHRSwNCj4gPiArCQkJCQkgICAgICAiZHJtIGF0b21pYyBjYXBhYmlsaXR5
IG5vdA0KPiA+IGVuYWJsZWQiKTsNCj4gPiAgCQlkcm1fZGJnX2F0b21pYyhkZXYsDQo+ID4gIAkJ
CSAgICAgICAiY29tbWl0IGZhaWxlZDogYXRvbWljIGNhcCBub3QgZW5hYmxlZFxuIik7DQo+ID4g
IAkJcmV0ID0gLUVJTlZBTDsNCj4gPiBAQCAtMTU5NiwyMSArMTYyMSwxOCBAQCBpbnQgZHJtX21v
ZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRldiwNCj4gPiAgCX0NCj4g
Pg0KPiA+ICAJaWYgKGFyZy0+ZmxhZ3MgJiB+RFJNX01PREVfQVRPTUlDX0ZMQUdTKSB7DQo+ID4g
LQkJZHJtX2RiZ19hdG9taWMoZGV2LCAiY29tbWl0IGZhaWxlZDogaW52YWxpZCBmbGFnXG4iKTsN
Cj4gPiAtCQlyZXQgPSAtRUlOVkFMOw0KPiA+IC0JCWdvdG8gb3V0Ow0KPiA+IC0JfQ0KPiA+IC0N
Cj4gPiAtCWlmIChhcmctPnJlc2VydmVkKSB7DQo+ID4gLQkJZHJtX2RiZ19hdG9taWMoZGV2LCAi
Y29tbWl0IGZhaWxlZDogcmVzZXJ2ZWQgZmllbGQgc2V0XG4iKTsNCj4gPiArCQlkcm1fbW9kZV9h
dG9taWNfYWRkX2Vycm9yX21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9N
T0RFX0FUT01JQ19JTlZBTElEX0FQSV9VU0FHRSwNCj4gPiArCQkJCQkgICAgICAiaW52YWxpZCBm
bGFnIik7DQo+ID4gIAkJcmV0ID0gLUVJTlZBTDsNCj4gPiAgCQlnb3RvIG91dDsNCj4gPiAgCX0N
Cj4gPg0KPiA+ICAJaWYgKGFyZy0+ZmxhZ3MgJiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMpIHsN
Cj4gPiAgCQlpZiAoIWRldi0+bW9kZV9jb25maWcuYXN5bmNfcGFnZV9mbGlwKSB7DQo+ID4gLQkJ
CWRybV9kYmdfYXRvbWljKGRldiwNCj4gPiAtCQkJCSAgICAgICAiY29tbWl0IGZhaWxlZDoNCj4g
PiBEUk1fTU9ERV9QQUdFX0ZMSVBfQVNZTkMgbm90IHN1cHBvcnRlZFxuIik7DQo+ID4gKwkJCWRy
bV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNnKCZzdGF0ZS0NCj4gPiA+ZXJyb3JfY29kZSwNCj4g
PiArDQo+ID4gRFJNX01PREVfQVRPTUlDX0lOVkFMSURfQVBJX1VTQUdFLA0KPiA+ICsNCj4gPiAi
RFJNX01PREVfUEFHRV9GTElQX0FTWU5DIG5vdCBzdXBwb3J0ZWQgd2l0aCBBVE9NSUMNCj4gPiAr
aW9jdGwiKTsNCj4gPiAgCQkJcmV0ID0gLUVJTlZBTDsNCj4gPiAgCQkJZ290byBvdXQ7DQo+ID4g
IAkJfQ0KPiA+IEBAIC0xNjIxLDggKzE2NDMsOSBAQCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3Rs
KHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ID4gIAkvKiBjYW4ndCB0ZXN0IGFuZCBleHBl
Y3QgYW4gZXZlbnQgYXQgdGhlIHNhbWUgdGltZS4gKi8NCj4gPiAgCWlmICgoYXJnLT5mbGFncyAm
IERSTV9NT0RFX0FUT01JQ19URVNUX09OTFkpICYmDQo+ID4gIAkJCShhcmctPmZsYWdzICYgRFJN
X01PREVfUEFHRV9GTElQX0VWRU5UKSkgew0KPiA+IC0JCWRybV9kYmdfYXRvbWljKGRldiwNCj4g
PiAtCQkJICAgICAgICJjb21taXQgZmFpbGVkOiBwYWdlLWZsaXAgZXZlbnQgcmVxdWVzdGVkIHdp
dGgNCj4gPiB0ZXN0LW9ubHkgY29tbWl0XG4iKTsNCj4gPiArCQlkcm1fbW9kZV9hdG9taWNfYWRk
X2Vycm9yX21zZygmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKw0KPiA+IERSTV9NT0RFX0FUT01J
Q19JTlZBTElEX0FQSV9VU0FHRSwNCj4gPiArCQkJCQkgICAgICAicGFnZS1mbGlwIGV2ZW50IHJl
cXVlc3RlZCB3aXRoDQo+ID4gdGVzdC1vbmx5IGNvbW1pdCIpOw0KPiA+ICAJCXJldCA9IC1FSU5W
QUw7DQo+ID4gIAkJZ290byBvdXQ7DQo+ID4gIAl9DQo+ID4gQEAgLTE3MjUsNiArMTc0OCwxMyBA
QCBpbnQgZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ID4gKmRldiwN
Cj4gPiAgCX0NCj4gPg0KPiA+ICBvdXQ6DQo+ID4gKwkvKiBVcGRhdGUgdGhlIGVycm9yIGNvZGUg
aWYgYW55IGVycm9yIHRvIGFsbG93IHVzZXIgaGFuZGxpbmcgaXQgKi8NCj4gPiArCWlmIChyZXQg
PCAwICYmIGFyZy0+cmVzZXJ2ZWQpIHsNCj4gPiArCQlpZiAoY29weV90b191c2VyKGVycm9yX2Nv
ZGVfcHRyLCAmc3RhdGUtPmVycm9yX2NvZGUsDQo+ID4gKwkJCQkgc2l6ZW9mKHN0YXRlLT5lcnJv
cl9jb2RlKSkpDQo+IA0KPiBDb3JuZXIgY2FzZSB3aGF0IGlmIHlvdSBlbmQgdXAgaGVyZSByaWdo
dCBhZnRlciBhbGxvY2F0aW5nIGEgc3RhdGUgYW5kIGNvbWUgaGVyZQ0KPiBiZWNhdXNlIG9mIG9u
ZSBvZiB0aGUgY29uZGl0aW9ucyBXaGljaCB3ZXJlIHByZXZpb3VzbHkgY2hlY2tlZCBiZWZvcmUg
c3RhdGUNCj4gYWxsb2NhdGlvbi4gQW5kIHRoZW4gdGhpcyBjb3B5IHRvIHVzZXIgZmFpbHMuDQo+
IFRoZW4gd2UgcmV0dXJuIHdpdGhvdXQgZnJlZWluZyB0aGUgc3RhdGUsIGZlbmNlcyBldGMuIFNo
b3VsZCB0aGlzIGJlIGRvbmUgaW4gYQ0KPiBjbGVhbmVyIHdheS4NCj4gDQpDYW4gYXMgd2VsbCBj
aGFuZ2UgdGhpcyByZXR1cm4gLUVGQVVMVCB0byBqdXN0IHJldCA9IC1FRkFVTFQgYW5kIGFsbG93
IHRoZSBjb2RlIGZsb3cgdG8gY29udGludWUgdG8gY2xlYXIgdGhlIGF0b21pYyBzdGF0ZSBhbmQg
ZHJvcCB0aGUgbG9ja3MgYWNxdWlyZWQuDQoNClRoYW5rcyBhbmQgUmVnYXJkcywNCkFydW4gUiBN
dXJ0aHkNCi0tLS0tLS0tLS0tLS0tLS0tLS0NCg0K
