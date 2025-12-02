Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 225E8C9AA9F
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B87410E5AA;
	Tue,  2 Dec 2025 08:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NGDJgbSs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2890510E0CF;
 Tue,  2 Dec 2025 08:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764663886; x=1796199886;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=m6gINFXR3NgCC2Ee/AzZuXaMD2wbj4RhCBbKS2eYs2U=;
 b=NGDJgbSsANG99JUiPV3IHDdA4vUUWYi9WGs1oNVtFnVRov6TBYJ2Hdcs
 azHq7RktueVMjg8OS6Ee3F4s7co5tKlNy17uEYAJOB06ESVbqY79gD449
 0khXYPcElPUbc4+9ZKURhS9lRbiJVuduCrOdru3KeooFFPY0nH8/fWazq
 La7xQp6V9yof7OfDLS4N4ymt4z4FBsM02JOoEGbgegyoYRtAY4v0S/3jQ
 A4MUZoPqbnoohHfpNSy3FeCS3s8f6kZxm2amlvK7cn9MKMzTU2IX3a796
 gnqbZFQ3Gh7wqqPNtDRosIWmNtw9uRgVuj5kiQjIqKx0uDOTFkNhI+J4T A==;
X-CSE-ConnectionGUID: zUskLRd4Q8eDTJyYVXyTcw==
X-CSE-MsgGUID: hF6VztXMQNW9PezbLsWdTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66335302"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66335302"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:24:45 -0800
X-CSE-ConnectionGUID: 55P5uGVZS0qit6+KmRfD3Q==
X-CSE-MsgGUID: 9JPTXUBkQyKktEPqJHy2Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="194748339"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 00:24:45 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:24:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 2 Dec 2025 00:24:44 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.3) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 2 Dec 2025 00:24:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RHhrfDk570LNw5FKtuTxHaz3H/T04BZ5xeRoFVH75xrfda/k5MJdL2afQgpZPeKysugv/P9W1TX5MIhCU8a/MVRQNevu4g/seUUqYO59cyQ8K+r6p/PBXeFoARVNnQhDo+DbnAVh0y5PYlwVWMuBDm6D0OwsHsTgztymkXz9k1Mvl45juqRxOzo2WKnTbeplQVmEN/vvQrDXNm0RNezKXHwvlVJ+rVt5LYcOhOHqW3ll3WvdOXN/KuyZP5n0TXSK9cNHa1mIlMXh9Bmx7b0HtV5YFAS9Ijc5NSUpoVYdla70DRQMhk+Ml7VtYhkSJ1djn+NEAfGbY7Sv296YnmEoPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqF0/yAPkhci/YDgssrHI6HoecOFne2pzZLhIvd6VL8=;
 b=HOu9Ciki47sXupYdDXw3tS1HRsn2Y3VPl/VNz8U9hE2GolAdJIY+61Bp7OF5PZd6o9gfUHSUAvzuKxsPU1naBABRgzKFtrom6zEvwUsa34FYkrMSAx9Xp7fVslqqGA1LxQ5s2GN/yJWU/VpwVdOhbuGjlsh04DiIqY0PD+L4JXnU3KmbYXmTKwQkr8/reN4VUfjHgXqsy5qlY8Zw2vwb4TECfQ2dmb0deWf7/KQ2hUGgNVVJPyjI47J06kf9xjA0UqOPkD6OIcXkz9iQg/lOuq7bSlLf0t7kho3Xvm26IW4Y80HNtp0grEXgQtcDy9jgYldsBM6jU/eydtKbpU6MRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by SJ0PR11MB7704.namprd11.prod.outlook.com (2603:10b6:a03:4e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Tue, 2 Dec
 2025 08:24:40 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd%6]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 08:24:40 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Topic: [v7 11/15] drm/i915/color: Program Pre-CSC registers
Thread-Index: AQHcYozHDqZ8Ucu/Ak+KJYpchMTHl7UMg44AgAGA87A=
Date: Tue, 2 Dec 2025 08:24:40 +0000
Message-ID: <CY5PR11MB63445DCDE616C4C99C21F275F4D8A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-12-uma.shankar@intel.com>
 <DM3PPF208195D8DA1980D5CD74E95BEA81DE3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8DA1980D5CD74E95BEA81DE3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|SJ0PR11MB7704:EE_
x-ms-office365-filtering-correlation-id: 2d4a0910-fb4d-4e80-2828-08de317c3d42
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?jG0/g/RQnoym61v7B44xeBfUJVkdFn+2LwMXe6kMZjhL2YznD7gSM5eqCDNe?=
 =?us-ascii?Q?V9wxtXlCAIErOMuHl0ga2zYu3U60rhRoz0Gxi4rKA50fZf752Vr5dkgB5obv?=
 =?us-ascii?Q?CAtBQGcSQyoCDCO/67LldPkCcXbfbOsMefbCDZdK+kkiD/aYUW+D8MF1HN+B?=
 =?us-ascii?Q?SEIDtjyb/NkN5GJb4s8FbEBRCjNeLqoEF6BI8pacLplCAfweeT9nAINA0K+F?=
 =?us-ascii?Q?0oH349P4Q+fw1fSGMdoSRCLzrLjjUv+58ooaWmlRbwG00lTCgCHEL7utXj0C?=
 =?us-ascii?Q?cIWW/ZWidzIA21M4RQu7RBSv1aqqETeKgqxSAJkk7srH8gS3rxqryx2nN9JF?=
 =?us-ascii?Q?1nMF3QZXGSTdrr/8IMDLWB0juSt/VYI5E0A9jDumv4/A1DGSL1bcx13eN3T0?=
 =?us-ascii?Q?OhPnwAdebbRQhFv5DH0dWYqtdvllm8Km2p8PMtkmvB9KIrH8TDTf83tZ5mkU?=
 =?us-ascii?Q?xDK8+OLuwXJd3d1Vd2AYfJPtMaOyvZ7BdEL+3tzZI8JK3x+yeesi2i/6ccwf?=
 =?us-ascii?Q?QMu/OfLRS4Jw7XyvXi9erOxwn9g2XiRLW18ssxJ8UAdOnyTEea7E16wTBLbV?=
 =?us-ascii?Q?pVm2hjUcYj0tYoAkGrbbivudPK2O2LGyg8VY3LNBH5d3nuf0jtm0JKYgba2K?=
 =?us-ascii?Q?Z5Fzc6HW/yQWXofq093ShvLmKGg5EMYO3FrdRjwmfvafIYLa7TjwvYgZ/gcb?=
 =?us-ascii?Q?uwm+Hxqp+N8dLpOK96FyQpZ5BH9zerFm1LeLcHWendiXjozSvJ88ttW9NjmK?=
 =?us-ascii?Q?C1ZOhUH3X0XNlsOd3bvKaTg4dOIlxb+9inQXcdwZ1kmY+hEOvCfHUdeACEoM?=
 =?us-ascii?Q?1hnqaWnh7nX9nhWTxhtozK7W4VOtFJCCeBE0uzJ2e2HbGUNue0ZXQ+ybdDeY?=
 =?us-ascii?Q?361KvW3yD8SMkFUNlbi4XkZuNyHvcCDkV7BNSwySdEo+xBqhOBmkc/EuGFAX?=
 =?us-ascii?Q?rHEbe3S8OwoEgmiGBBE8buXuxV3O2GkO6r/SuIpVB90ldd3cGvgiWAw3naHK?=
 =?us-ascii?Q?Ue3g+A2znjWXJxD6Bn8eGVXmOqt6cvTtHVNbzjradwWPeEVM9igCIKee6xjV?=
 =?us-ascii?Q?soZAGmAQLfs9X1fSSl8y+ZQ6iUdxqC4GfjQLasE3zktqbW+4XqF/QJXHlfVo?=
 =?us-ascii?Q?3pP4nYcm1J5c8/05KTO0VCD6Po5bQ4BJNQ2Aw8k0HGbXhwRmgzpvPLt+VIzn?=
 =?us-ascii?Q?iZcyeeggP6gagCB00riMLuuWXkdduTThamr3UEg2qP5sFGTNRtjqUBCtqmbT?=
 =?us-ascii?Q?5WUnHJvPYlO4qSWLNaiF6L5mRmAqAJhHFZH/BBSkiMm5GGL3BmOHhFaR2UD2?=
 =?us-ascii?Q?MkK7v4i7DvUwQnCFc1UyYr4iHcdkH0bJzrTfmXHeuJPXZx6W0pAOtYhNJRtI?=
 =?us-ascii?Q?37Nzl0KpgbFyFEjBOfnmE+ds2gq4JioPhHDB3FH/EqsN1fJOUJyl588v2cQq?=
 =?us-ascii?Q?AobzFAggP9HmPEjuOoxfXE1CYeqQzIt8I38oUGdStb5KyjTtKoSwTGNm+MoY?=
 =?us-ascii?Q?4Ct+Ff0ozwPAGyOpfBgI1Wn7fpLMKr0SzyDa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?BK1VOA0eEHyDNK/8YqptDPDG+lhXw97Rmz2BI5BWXm5EuTDDXhCYS7ahBb5a?=
 =?us-ascii?Q?qNS4HuhGpFQ3U88eBUYCPes1FrmAh4Hjfrv0U47GMNjTmNCfP8aMTS+ApnOH?=
 =?us-ascii?Q?LeqglsqD2UF7ylfY0asRjioB68Kz8ItOsKeXdkMkXxZgVtDQW7cBXOf8g09b?=
 =?us-ascii?Q?GIQAin+s6WN3Vk4rgCR5GrOkCiOAWsTCS1JqfOcnYL9EqwEL1vBTrxwVOIOE?=
 =?us-ascii?Q?NvADAXYGkKcWfKRkdNMvOrwO6Ht4L4LH2jL+1S0Qe7wi6Irvw/O1H++DVqvs?=
 =?us-ascii?Q?u0Lmlzc8B0RlpK8nHCJ2cvh9TIuCWjZevFREK19Jk5tgtX+BRQTy8SueVb9k?=
 =?us-ascii?Q?hc+KIBDJ9orIynPrZST5hp97/Oo13W0GLYontpilexP5Q+LGuPz0+L2SiwL2?=
 =?us-ascii?Q?Ld9OKW8aKHg7QNRYcuTJDNMqQrpsYQ9qgLhe9Z8UGY61unbO5w5RrsS8l63w?=
 =?us-ascii?Q?5Y+49gnZyMmbgHqyzv8k0CXFJ/IVum4Rr/1mE0Uv68BMR0LQyF6un5n1hTuM?=
 =?us-ascii?Q?mGYxfkhLawTxCdn8c544n+omY/agNj17ej7hjjoUhVINvYxJOIQeqSMVFC4Y?=
 =?us-ascii?Q?iEo5X62i14pL/+oyS6ixtUAjXn4Az+6q+WIzDUcfL2lotuhGADltMhofC4g9?=
 =?us-ascii?Q?JV8I4QKFM8akvdZ4U63Dc/YEviu8cWX9rrcX3Eo+a4m6pr2NyOJUMTseA3Q1?=
 =?us-ascii?Q?KSBSmEAuoiaKIiY92x8txMuW6UBlg/OSV3jjptOQf9uYAbKKOaWvuHwE3JLx?=
 =?us-ascii?Q?UPwjdbyOSCZPOnf/3hByFQC2d83HCj7J7N/aOQ0hCiqNnUZr3mCibuDh2imr?=
 =?us-ascii?Q?tUPMnODaimlvZ5pCGzCXkwB0R0BuBdhUhbjwIyT5yH0jO/Fp3Y8+dTWrKigw?=
 =?us-ascii?Q?h7Qo+I+hcINnhJEIY7W0FLuo52z5VOY7c+e1hu8XmCZ5J6EeBOGscJGjaAS6?=
 =?us-ascii?Q?AFhGBtBTAWWAcKTFURmNEhCJUJkwLY2CjQjIpXBWTAmiAvOz1LRgRRK8xpHq?=
 =?us-ascii?Q?bJLn+3Tu0ymqr5QkPC+jleR0JJjFmG58TOpmvI8YFVOETg8vjQwj7xF6p+vz?=
 =?us-ascii?Q?zg2MmAnpQ13lU4x3EL/geUyiq81scTgIVEnlou8m07HYPUpLiTB1jQZrSo5C?=
 =?us-ascii?Q?RPwIyC31L/YAMlFimu3R9CI/+o8u8YpFvTUTH2OTUlHTbJTTgEi4j9ZZtS57?=
 =?us-ascii?Q?mXUtaKs+IZpy8qPIKwD8ovjiSJbD/5iIMiO0dRbX6oKidGSBISTLfAaGEF73?=
 =?us-ascii?Q?0u0nwaNjeR+gsKJKau1lXIDmdhQgYFIhGFpkxvrg3sP81ZIdDXFn0EKE8KcX?=
 =?us-ascii?Q?YDC0h7zEKepoYBQS2cvYnTdaGz5qT24hJ6U5hjHWc3owO+qauhyZi/KI+5lT?=
 =?us-ascii?Q?lhFJK92jhxnYKooEIZc25Btld0Qq4udPorIZZxH99LqR/ysb4r/8eg1yWPvk?=
 =?us-ascii?Q?Rq4UFOhCz5vzLuGOh+fOL5CIvZDT4VXdpoeKguKqNBykpp+NbZXs76aL2eVR?=
 =?us-ascii?Q?7D1oylSJ1DEt3SkKClNKUv3nLM7DdwMzYbnFrMnhzkXVkoOTVYu9lbs56V5K?=
 =?us-ascii?Q?dsXU6M+TDa4DIIDh6AL874dbQgwNdbgefwGMyeor?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4a0910-fb4d-4e80-2828-08de317c3d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2025 08:24:40.5609 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DwyGkofagAhA+DvLJ+Hd6aO16bM/wo0RAOhIlpu3jHoYK2siZeIgDrQQiACtu6ilI8ZtTQydfIIAgfKYoiWoxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7704
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



> -----Original Message-----
> From: Kandpal, Suraj <suraj.kandpal@intel.com>
> Sent: Monday, December 1, 2025 2:55 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com; Sharma, Swati2
> <swati2.sharma@intel.com>; alex.hung@amd.com; Nikula, Jani
> <jani.nikula@intel.com>
> Subject: RE: [v7 11/15] drm/i915/color: Program Pre-CSC registers
>=20
> > Subject: [v7 11/15] drm/i915/color: Program Pre-CSC registers
> >
> > Add callback to program Pre-CSC LUT for TGL and beyond
> >
> > v2: Add DSB support
> > v3: Add support for single segment 1D LUT color op
> > v4:
> > - s/drm_color_lut_32/drm_color_lut32/ (Simon)
> > - Change commit message (Suraj)
> > - Improve comments (Suraj)
> > - Remove multisegmented programming, to be added later
> > - Remove dead code for SDR planes, add when needed
> >
> > BSpec: 50411, 50412, 50413, 50414
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c | 61
> > ++++++++++++++++++++++
> >  1 file changed, 61 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > b/drivers/gpu/drm/i915/display/intel_color.c
> > index 4ca359d68730..2a114d2964fa 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -3943,6 +3943,66 @@ xelpd_load_plane_csc_matrix(struct intel_dsb *ds=
b,
> >  			   ctm_to_twos_complement(input[11], 0, 12));  }
> >
> > +static void
> > +xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
> > +				const struct intel_plane_state *plane_state) {
> > +	struct intel_display *display =3D to_intel_display(plane_state);
> > +	const struct drm_plane_state *state =3D &plane_state->uapi;
> > +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> > +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
>=20
> Introduce intel_plane here and use that

I think its only used at 2 places, don't see any need of extra variable.
If no strong objection, I think it's ok to keep this way.

Regards,
Uma Shankar

> Regards,
> Suraj Kandpal
>=20
> > +	const struct drm_color_lut32 *pre_csc_lut =3D plane_state-
> > >hw.degamma_lut->data;
> > +	u32 i, lut_size;
> > +
> > +	if (icl_is_hdr_plane(display, plane)) {
> > +		lut_size =3D 128;
> > +
> > +		intel_de_write_dsb(display, dsb,
> > +				   PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe,
> > plane, 0),
> > +				   PLANE_PAL_PREC_AUTO_INCREMENT);
> > +
> > +		if (pre_csc_lut) {
> > +			for (i =3D 0; i < lut_size; i++) {
> > +				u32 lut_val =3D
> > drm_color_lut32_extract(pre_csc_lut[i].green, 24);
> > +
> > +				intel_de_write_dsb(display, dsb,
> > +
> > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > +						   lut_val);
> > +			}
> > +
> > +			/* Program the max register to clamp values > 1.0. */
> > +			/* TODO: Restrict to 0x7ffffff */
> > +			do {
> > +				intel_de_write_dsb(display, dsb,
> > +
> > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > +						   (1 << 24));
> > +			} while (i++ > 130);
> > +		} else {
> > +			for (i =3D 0; i < lut_size; i++) {
> > +				u32 v =3D (i * ((1 << 24) - 1)) / (lut_size - 1);
> > +
> > +				intel_de_write_dsb(display, dsb,
> > +
> > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0), v);
> > +			}
> > +
> > +			do {
> > +				intel_de_write_dsb(display, dsb,
> > +
> > PLANE_PRE_CSC_GAMC_DATA_ENH(pipe, plane, 0),
> > +						   1 << 24);
> > +			} while (i++ < 130);
> > +		}
> > +
> > +		intel_de_write_dsb(display, dsb,
> > PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
> > +	}
> > +}
> > +
> > +static void
> > +xelpd_plane_load_luts(struct intel_dsb *dsb, const struct
> > +intel_plane_state *plane_state) {
> > +	if (plane_state->hw.degamma_lut)
> > +		xelpd_program_plane_pre_csc_lut(dsb, plane_state); }
> > +
> >  static const struct intel_color_funcs chv_color_funcs =3D {
> >  	.color_check =3D chv_color_check,
> >  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3991,6 +4051,7 @@
> > static const struct intel_color_funcs tgl_color_funcs =3D {
> >  	.read_csc =3D icl_read_csc,
> >  	.get_config =3D skl_get_config,
> >  	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
> > +	.load_plane_luts =3D xelpd_plane_load_luts,
> >  };
> >
> >  static const struct intel_color_funcs icl_color_funcs =3D {
> > --
> > 2.50.1

