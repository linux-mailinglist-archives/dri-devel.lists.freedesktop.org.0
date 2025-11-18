Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CC1C6795A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 06:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B110E1EF;
	Tue, 18 Nov 2025 05:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uuu6+0NJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8659610E1EF;
 Tue, 18 Nov 2025 05:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763444339; x=1794980339;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Spa/AjzIQnbJUIfx3WEx8B0mqGfQK1tefztAMx+FskA=;
 b=Uuu6+0NJaF8PTwDcTt6Aj2Fn+CoTh1+ND0vXZ6roPLxhwwPRPb2zfnOr
 GjM4gLyK5kC95dx3qkY0+SvQTNDmeI+mthz03U2Q3Tg41cwvFOcPV5A5d
 HJFLbqEKtVQcbujU1rFsSETDkJDgOuzqO8sSxXLR9ozZJJCp71IqQCGbS
 B9KU7FsLOOD3zrXKjoncg7Um/J+ecpx31aJv7+B5qrPqJHBTEV2tjTyvk
 30FrFpnmMFGlXchXsMM3xpT7JJv7PooM1G2yWwxkl1DsRlCTxFiF3RJHq
 SfJMeqiR6HAQe6gAkRrmu4OiiA+4b9ZbSvOn5KQ8OckRqNSEnTNKu5v7c g==;
X-CSE-ConnectionGUID: N/zbwIKZR8y0i9YdkM5n0Q==
X-CSE-MsgGUID: szRGsu4cTl2Y90TbZuCNfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="68060745"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="68060745"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:38:59 -0800
X-CSE-ConnectionGUID: 3mH+K3jIQFiecLIkPdibpg==
X-CSE-MsgGUID: v5sdzWO/THWxbwfrPZ/OHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="195580293"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2025 21:38:59 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:38:58 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 21:38:58 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.27)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 21:38:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H6cV9rVodvs0xMZcNuTWsA7MQOG1zaQ3emfbJmkwvApPaVa2rJJVcUoiFAEDZHSGOnThAyZiCQ0YxjCn2LyhibvqCkeOHQvwRfbrdKMhlGqWEu3M6Lf4VSZ/zVZyKDS4E5IDlAB833bnUIx5dFWgDKEk9i/qjhIN+U7TGNM3aiwISqC7MOwukUp2G/7bFtbnadWHUnFTT5ZXUk1hj6enMYsF0X4zxBEMuqNRTolmZK0qmXYdvOqh+bQKjNV7QAI0hECEzCRhj203UKt3XDyIuWhJu7FFSocE2L+7Cvi3iB+zbHsP4hZ4n1hLIE3axCpGQR762p1sRSZlAeFRbSC4gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Spa/AjzIQnbJUIfx3WEx8B0mqGfQK1tefztAMx+FskA=;
 b=uedA2EEAEPgEf19d76/khDQ1oVZdi+PYNuGTmmj3HITgn7WpM5T8C2fz3BrTH4sLSkXD9TBwWat6OegkmtTU4bm75c9TsILILzZtiIbprT4PdOKTNm/HzuCWmO2LfRDTLhA7eUFJjkRGB1+A0tUo/A0QSQGPW5+buj+ptX/IQUhNiNVIV2Eesk2jX/2cgX07xxhBjbvBzKwrjuh/vI3wrqO4SbfCeVDBqv5w0COly6I1cKVVQRywS4aXh/p2fPwOVPCuWmiTT7U+ZkTzb7129HVCMD3hyujZZHZLCqk+ZROpkhc+qt3mgDpkrYALWp5C8VPxLB4F3LnHoByojSH2AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ1PR11MB6252.namprd11.prod.outlook.com
 (2603:10b6:a03:457::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Tue, 18 Nov
 2025 05:38:56 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 05:38:56 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "Hogander, Jouni"
 <jouni.hogander@intel.com>
Subject: RE: [PATCH v4 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Topic: [PATCH v4 06/10] drm/i915/alpm: Half LFPS cycle calculation
Thread-Index: AQHcVJkdyyqcQMSjXEqMrrUQmDptFrT2o5AAgAFNxfA=
Date: Tue, 18 Nov 2025 05:38:55 +0000
Message-ID: <DM3PPF208195D8D0025C135A25A4F6613B9E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251113120119.1437955-1-animesh.manna@intel.com>
 <20251113120119.1437955-7-animesh.manna@intel.com>
 <DM3PPF208195D8D5E601C957C3894CE29C9E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D5E601C957C3894CE29C9E3C9A@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ1PR11MB6252:EE_
x-ms-office365-filtering-correlation-id: ccc959ae-9dda-44f0-9ab6-08de2664c3f1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NzdkUTdDWmNKK1QxUkk1bW4yQUJpSEdFNHJvOGE5a3dTc3lEL1FmNm9haUoz?=
 =?utf-8?B?T3NHZHlJZFl0Zm54dE01QU9SbnVGdDhDU2d3b3VLQUNaSkNwZlYyNU50T1Jn?=
 =?utf-8?B?VldGSkhIczloNlRqQWhCZko4REJSaGdnOVBDOEcrRFBqV0cvdHIyaGN3ZkJU?=
 =?utf-8?B?OVIyMWhkdFlPa1V4VXNPVGplOVgzSkVFVUd3dXEwcklEa3NWU204cmVlU090?=
 =?utf-8?B?a3o0ZmlWZUZBL09mYmdjY2ZDZkNxOTBONmVGcTVwRDhHNVVMY1UyNXlVSERt?=
 =?utf-8?B?RitFZ3ZGTU81RklReEpxcGxzRHNEWW1BenA2VEhGRUxxWXhlcEJSR0FsdTBy?=
 =?utf-8?B?Q3ZLT1QvZFpEemdPbmp6ZkZtcTVJVWdaYjJVY2c3Uk1KVHB4a05JZkdpRWFn?=
 =?utf-8?B?SXNVdUIxa3JRb214MEp1UU1PZnRrQkdsQ0VXRFNvYk43TUhpZW9uNkc0WEJ0?=
 =?utf-8?B?ODA1QWIvSzM4K1FMc1dSSGh0RDZaNG1NS1VhQXNDMVp2Ukpwd3JwaS9NSmFp?=
 =?utf-8?B?eEdWVU9SRWdlQmxkMTdCd254NDBwZ0JndWVoOGljeEk1aEl6RVZONStHQTBC?=
 =?utf-8?B?VFZZRW9SMHRmQUphaG83aUg3NVZiSnJyZi8rVWkza1BIUTMzenpOWTlLeksz?=
 =?utf-8?B?Rk9USEo0VUtsdlpEMFllWXpQREZqblo5N3hTWTJVcE8vZGdXLzAwSElUQ1BY?=
 =?utf-8?B?YmVsZ0RVbFo4blkvVFNkcUhHMXV6TGoxbzJKbDZhSnN4UnpsK1RkOXZPelov?=
 =?utf-8?B?S2RtY1d5QmlNclNqK29QZEdmNmpaczllYjZsc01KeUg2dDlGRUtDMWswK3pR?=
 =?utf-8?B?VjRRdC9FelVuSnhyYTBocmZuVHZKSDAxM2R1WnBRZ29aeHVxQnM1eUQwWFh5?=
 =?utf-8?B?YStKa0V3T1pPWEJSRDl3VDI4Y2xucUkvbGhEbEpiY05TUzZ5SUlZL1F1dlEv?=
 =?utf-8?B?S0prUk5mUGIwK0VUMVFiL01lWUQ5T0xHK3VlcjY0ZkJHcCtFQnNZb0kzOG5W?=
 =?utf-8?B?ZFBIVDZ6OWNiS1I2U2dxalJEeUZFL2cxZ1RLdWM2c2RCcThCVDlCNXVnSys3?=
 =?utf-8?B?Y3k0eXF1MFF1OC9ad1ZkZ3UxWVRldzhwWC9tTVBlTVdlb1VlNmtEU1VDWVZF?=
 =?utf-8?B?bmk1V2wzZE9Ba0E2Qng1M0hGS1NiWG9qUVhZblhXaGxncjVVOFgzY3B2dmdr?=
 =?utf-8?B?SUp4a3h3L2Z2OXEvUEV4TkFRc2hMa1NPRndSUnkvSmhvY0dYY0lkMmNKV0VH?=
 =?utf-8?B?cVRKa1ZUMjdMNGhqQnU4cy9WWU1JVDdGdW1JUkl4eUNHaHBnUjI3cG56L0xM?=
 =?utf-8?B?QjlFUWNReXE2dithVUhiUUZMWHNpRTZOWk9xOEZCRFBsNzc5dU0zZTNHdHlB?=
 =?utf-8?B?M1U1TS9kRERsUi9oc0tJMzYwOWZNUmRlQmlzNXBxZUR4Q3FMK0lUVDgxNHMv?=
 =?utf-8?B?SHRJRlVjbGhTVFAvTkZSVHE4M3dPSmxNamc5Z0tRMVR1ZFN4dU1xVVdCOUJh?=
 =?utf-8?B?N09DVUZQb2hMZHpmRWJaTi8xV3NjZmEyZUVyeXVqTXRzN0w0MHFvaDk4dW50?=
 =?utf-8?B?Y0VHaXFGY1hLM0I4TE1GdjhGTEg5dTJHTkQvRnN6UitjUG5pZXJvb0dyL0Y5?=
 =?utf-8?B?T0xFVFI0OUJpZUtYTWtWa2oydDcrY3l4Zk1pd3QreEJKbmhMNzJzMXF3akR1?=
 =?utf-8?B?RzdrYjVDUDUvdThUTG9qVFoxYzkyV1h4ZDlhdjU2SXlEL0JzVytlcDNQdWUr?=
 =?utf-8?B?cURzWWUySElyTzAvUXdWNnZ4bGRpZW41MXJHZGVtWHp2eXhjd3ZndlhEc3Qr?=
 =?utf-8?B?RFlubEJ2VFZ2dmNoR0dqV29VQ1dNQnFlRlJ4UjdYOFNzYW9iL3ZLRkFBQlo0?=
 =?utf-8?B?bUg0ODBFU3F1NnlsVkdodVdwWFBJelRSWnhrYXhpYU5FZXBITE1nelQ1dU5W?=
 =?utf-8?B?Yi95MkN5cmhQVHN2N2lVMTA1MmlXdlYwWWp4dXptM2pYZGpEUlNpd1dpZXRL?=
 =?utf-8?B?c25kQmpsRVZza1FGQU1oQmV5b0NLVGVhSGhxbStFZHI1MlNFRndqWGthQVZ5?=
 =?utf-8?Q?6+N1KA?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnBDSGtNTzkzUUM2N0RhQnhBVHgzeHd6Q2RxRHFRbHJrZzlPS25DUGd6UFAr?=
 =?utf-8?B?OUdZZmR1UThRZWY0eHBIZVo3NE9ibURKcWk3akp0WXc3Y0ZRTUd1aWpIS1Av?=
 =?utf-8?B?OHhGNEdOQ25yR2RjNnVaSXd4N0ZIeUtTdHMrQlVYUFBTdVhrK0JkWG9FT3pw?=
 =?utf-8?B?R2wwV01KQXR3d3ZZYTZ0cjZCZ01XOU9zbW41UDdscThzNUlGb1Y3Y1gwVld0?=
 =?utf-8?B?aXY4djNpK3QyTFYyWXJ4bkdGSXZ6YW91K0ZaenV5aTdydGRDdVp2QWVIbmc5?=
 =?utf-8?B?TGRWb2RkN2hwaWtFdnRSYmJZdG0vTkVpTU1VY0RYa2ZjdjFFdlZvNTN6UWFU?=
 =?utf-8?B?NWtHVmVodWlldVIzRGtQTm94bVE0ODJLNDl4cGI4MUlva09oUUlKd1h5VVhp?=
 =?utf-8?B?NnhGUE8xcm5tSU9VRzZqbEJ6algrVVlFc3JRSXlkV0ZxRkxsUWYrVzdIdGNk?=
 =?utf-8?B?TFNtTEJuUnFZZE82UXZCVVVnVk9VdWdBZVY1Qm9LUXBTVEFTZ2crTGNaNmtm?=
 =?utf-8?B?VHRiZC9SWHF6dFRGWFhNV21aU2g3cmd5UU1PbWNiWHU1YUEyUVVJS0ZsQlFY?=
 =?utf-8?B?NUpUZ3BoMUdhUW56VFo0MVBOUUIvcklVc1dNWkNUYm9mLytubWNhVjRvS1hl?=
 =?utf-8?B?dElpVGNMaHQzMitDMCtYK1BSSnhlWkEvNlYwbW4wTnp3cWQ1Um5KS0wvTnNz?=
 =?utf-8?B?b3ZCUktmR0I3UU5GWFZFaDdZNEhWVHpSb21ScTJsVlVMbkR4MjgxckNtUyt2?=
 =?utf-8?B?c1VDYjArcWdvRE5aOFo5NWR1QStiSndlQXllOVBiNmx4VFZkOS9YRWRtQzY0?=
 =?utf-8?B?amQ3NVUrZXpyTGVTQ0MvcmcvMmlSWFI5RjFLbzlmWlZoc0dOUlFLT0wzVFVt?=
 =?utf-8?B?bXU2blZVYVlOVGRLZDZ6NTNuRkZ0VGEyZWtkTHpkS283MWxMbUY4WXc2aXhD?=
 =?utf-8?B?LzN6dWVuMlNpZ29Cc0Fsd0xKRkI4bnMveUQrZkNSY3NhZU9OS2YvTEN0aEpU?=
 =?utf-8?B?ZlBOV2tqRHQ3aXBpNWJpU1U0YjE5TjNlYmZHQVRMeDM5aUtYTkxWb2x2RlJ1?=
 =?utf-8?B?UnBoM2lGaklhOU53R0pwUURTOVdxT2J3ZEhuUFBMS2NPSVBTMnVVd1BrYWh5?=
 =?utf-8?B?ZjhXYUk1RWtUckQ0ZEg1RlhCVHFjOXBRNzhVbUFMQ2hjbk92Q1U1ZWx4c2JN?=
 =?utf-8?B?YVFINmdzLzVIczQvNDlxblhjTmRZZm5EUU5xSVEvU28wOEpTNzRWeG5RT2Q5?=
 =?utf-8?B?bTV4dkdMYTJBZUdZcHFacDJxZTFkU0hML3NRSXY4c2VLR2V3MVFJcHYyNEFo?=
 =?utf-8?B?N0lYNTRhQWNaQjFOeUJQSE9Xa0dQRVl1WUVLeTJFZmYxRENWUTVMY3AwUWN6?=
 =?utf-8?B?Sk9JL0RxbTZEc3hSU09PbjNDdHV5UVJuSlFFaGJiWkh6T2pvMXF5RDgyNHFG?=
 =?utf-8?B?c3IreGxYbVRlQTBQYUo2RUoxeTRnUUJXVko1QWIvRDB5WDdoV1JTclJTSWZ2?=
 =?utf-8?B?SzNUc1UrR3poUDlKL2k2NTdCYndJdnFaY3Y0enhJSnBhcGZZWElYVWRRdTA2?=
 =?utf-8?B?Rm5SUlU2U3ZocDgwM256M0FvMWhwTG1MekhmTG1wREZEdzNmR1oxUC9oTjZI?=
 =?utf-8?B?b0h4elREOGNJT25lanFCMzdGRDQ3a3dvaVAzT0hDYXZmM2VxSkt1NDRtVHlu?=
 =?utf-8?B?dVNpL0xLTHZaYnNkcGl3bjlHQTBHYnp2YVBIMjRpYWtlK1p4dTBMdjdyM0pr?=
 =?utf-8?B?N25nZnFobFF5SVFQb0xQQytseXJIUVQvYWU2c0VUa25teHJUTVR3ZmtMV3Z6?=
 =?utf-8?B?WHVlTkRnQlhHT0w1M0xpdS9xZVQra1hWaFdqemdrYmhhNTdKS1creVdoR3Fs?=
 =?utf-8?B?ZkROSWRaOGwrZUdDVFA4OVQwNUtZVUQ1Y2kvWGxQdmhNYXdWMDJST1BGRlBR?=
 =?utf-8?B?VnFvUzlLTEFjdHkyemVTOVhpTk1XK1Y3SlM1TVRDcXJuQnp3SCszUURpeUh5?=
 =?utf-8?B?c3NqVkJFVU5HcUxuNEhyZ3BxVmRhWW5UUUdYMDFMTVdEVEtJazg5SGx1VHpC?=
 =?utf-8?B?N3BxSHluem1KM0pnaFBzT2VEbEQ3ZjRxbUtzaWhFbnNIRmVaaU5aS1NCQkJq?=
 =?utf-8?Q?1+wZRUT3ihH/NrMxxtNnIcaNY?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc959ae-9dda-44f0-9ab6-08de2664c3f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 05:38:55.8706 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7LEK9zJW2Qd5KJ2WhRqH+OD3qCYXdElRpWVK6wpNjJNdU5fFuO64AkIZVSB64b5IwCiWUstbrff6qSF0bqufvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6252
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSW50ZWwtZ2Z4IDxpbnRl
bC1nZngtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBLYW5k
cGFsLCBTdXJhag0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDE3LCAyMDI1IDM6MTYgUE0NCj4g
VG86IE1hbm5hLCBBbmltZXNoIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT47IGludGVsLQ0KPiBn
ZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmc7
IGRyaS0NCj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBOaWt1bGEsIEphbmkg
PGphbmkubmlrdWxhQGludGVsLmNvbT47IEhvZ2FuZGVyLCBKb3VuaQ0KPiA8am91bmkuaG9nYW5k
ZXJAaW50ZWwuY29tPg0KPiBTdWJqZWN0OiBSRTogW1BBVENIIHY0IDA2LzEwXSBkcm0vaTkxNS9h
bHBtOiBIYWxmIExGUFMgY3ljbGUgY2FsY3VsYXRpb24NCj4gDQo+ID4gU3ViamVjdDogW1BBVENI
IHY0IDA2LzEwXSBkcm0vaTkxNS9hbHBtOiBIYWxmIExGUFMgY3ljbGUgY2FsY3VsYXRpb24NCj4g
Pg0KPiA+IEFkZCBzdXBwb3J0IGZvciBoYWxmIExGUFMgY3ljbGUgY2FsY3VsYXRpb24gZm9yIERQ
Mi4xIEFMUE0gYXMNCj4gPiBkZXBlbmRlbnQgcGFyYW1ldGVycyBnb3QgY2hhbmdlZC4NCj4gPg0K
PiA+IHYxOiBJbml0aWFsIHZlcnNpb24uDQo+ID4gdjI6IEF2b2lkIHJldHVybmluZyBlYXJseS4g
W0phbmldDQo+ID4gdjM6IFVzZSBpbnRlbF9jcnRjX2hhc190eXBlKCkuIFtTdXJhal0NCj4gPg0K
PiA+IENjOiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbmltZXNoIE1hbm5hIDxhbmltZXNoLm1hbm5hQGludGVsLmNvbT4NCg0K
QWxzbyBJIGRpZCBub3QgZmluZCBhIGNvcnJlY3QgcGxhY2Ugd2hlcmUgdGhpcyBjb21tZW50IGNh
biBiZSBhZGRlZCBoZW5jZSBjb21tZW50aW5nIGl0IGhlcmUNCkkgdGhpbmsgeW91IGhhdmUgbWlz
c2VkIExGUFMgQ3ljbGUgY291bnQgY2FsY3VsYXRpb24gYW5kIG1vZGlmaWNhdGlvbiB0byB0aGUg
cmVnaXN0ZXIgYml0cw0KSGF2ZSBhIGxvb2sgYXQgdGhhdA0KDQpCc3BlYzogNzE0NzcNCg0KUmVn
YXJkcywNClN1cmFqIEthbmRwYWwNCg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2FscG0uYyB8IDE4ICsrKysrKysrKysrKystLS0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9hbHBtLmMNCj4gPiBpbmRleCA4
MTQ3MjI1NGFiNzMuLjMzNjIwZjk1ZWNjNSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2FscG0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYWxwbS5jDQo+ID4gQEAgLTczLDEyICs3MywyMCBAQCBzdGF0aWMg
aW50IGdldF9zaWxlbmNlX3BlcmlvZF9zeW1ib2xzKGNvbnN0IHN0cnVjdA0KPiA+IGludGVsX2Ny
dGNfc3RhdGUgKmNydGNfc3RhdGUpICBzdGF0aWMgdm9pZA0KPiA+IGdldF9sZnBzX2N5Y2xlX21p
bl9tYXhfdGltZShjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwNCj4g
PiAgCQkJCQlpbnQgKm1pbiwgaW50ICptYXgpDQo+ID4gIHsNCj4gPiAtCWlmIChjcnRjX3N0YXRl
LT5wb3J0X2Nsb2NrIDwgNTQwMDAwKSB7DQo+ID4gLQkJKm1pbiA9IDY1ICogTEZQU19DWUNMRV9D
T1VOVDsNCj4gPiAtCQkqbWF4ID0gNzUgKiBMRlBTX0NZQ0xFX0NPVU5UOw0KPiA+ICsJc3RydWN0
IGludGVsX2Rpc3BsYXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0K
PiA+ICsNCj4gPiArCWlmIChpbnRlbF9jcnRjX2hhc190eXBlKGNydGNfc3RhdGUsIElOVEVMX09V
VFBVVF9FRFApKSB7DQo+ID4gKwkJaWYgKGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgPCA1NDAwMDAp
IHsNCj4gPiArCQkJKm1pbiA9IERJU1BMQVlfVkVSKGRpc3BsYXkpIDwgMzUgPyA2NSAqDQo+ID4g
TEZQU19DWUNMRV9DT1VOVCA6IDE0MDsNCj4gPiArCQkJKm1heCA9IERJU1BMQVlfVkVSKGRpc3Bs
YXkpIDwgMzUgPyA3NSAqDQo+ID4gTEZQU19DWUNMRV9DT1VOVCA6IDgwMDsNCj4gPiArCQl9IGVs
c2Ugew0KPiA+ICsJCQkqbWluID0gMTQwOw0KPiA+ICsJCQkqbWF4ID0gODAwOw0KPiA+ICsJCX0N
Cj4gPiAgCX0gZWxzZSB7DQo+ID4gLQkJKm1pbiA9IDE0MDsNCj4gPiAtCQkqbWF4ID0gODAwOw0K
PiA+ICsJCSptaW4gPSAzMjA7DQo+ID4gKwkJKm1heCA9IDE2MDA7DQo+ID4gKwkJcmV0dXJuOw0K
PiA+ICAJfQ0KPiANCj4gDQo+IFRoaXMgY2FuIGJlIGp1c3QNCj4gc3RydWN0IGludGVsX2Rpc3Bs
YXkgKmRpc3BsYXkgPSB0b19pbnRlbF9kaXNwbGF5KGNydGNfc3RhdGUpOw0KPiANCj4gKm1pbiA9
IDE0MDsNCj4gKm1heD0gMTgwOw0KPiBpZiAoaW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRl
LCBJTlRFTF9PVVRQVVRfRURQKSkgew0KPiAJaWYgKGNydGNfc3RhdGUtPnBvcnRfY2xvY2sgPCA1
NDAwMDAgJiYgRElTUExBWV9WRVIgPCA1NDAwMDApIHsNCj4gCQkqbWluID0gNjUgKiBMRlBTX0NZ
Q0xFX0NPVU5UIDsNCj4gIAkJKm1heCA9IDc1ICogTEZQU19DWUNMRV9DT1VOVDsNCj4gICAJfSBl
bHNlIHsNCj4gCQkqbWluID0gMzIwOw0KPiAJCSptYXggPSAxNjAwOw0KPiAJCXJldHVybjsNCj4g
ICAJfQ0KPiANCj4gUmVnYXJkcywNCj4gU3VyYWogS2FuZHBhbA0KPiANCj4gPg0KPiA+IC0tDQo+
ID4gMi4yOS4wDQoNCg==
