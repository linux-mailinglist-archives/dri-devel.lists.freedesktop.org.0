Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F400C68303
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:24:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2589BE8;
	Tue, 18 Nov 2025 08:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G41pmYVI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7939389BE8;
 Tue, 18 Nov 2025 08:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763454290; x=1794990290;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MpGVZSF1edykD5vPyM+b9iq60E/Q12mZnGOzp60Egl0=;
 b=G41pmYVItfsQaKxMG3bXV+mvI+ssJjTIF2cGrqL3gWMHCISV2ECKM15q
 Tf241uRIkjqoVxecXAuziLUBqioTLjfVG4JC75bk/MgLiqWRMAC82lX7N
 PCbWeyHSjQleVu+QG1iwCsNvKg/tt/ffieKj0PTAU1S5ZZlq8ixr7SHUw
 sR/ncDhE9aK6lalIOHZS2vkr2rvfLJP6lZI3hcsQ+ZisZBsUbtqLUgvTW
 ljNwStdA2/+Jta0WU8Dm5iPxfTrTKwZJc6hDWhETaw3XORLOR0d2IdJqZ
 NHg4ueeF4to/cjoTTSDXbZlakBOmL93CmmVwOiuwiwVt2YFijDC3TkgRF g==;
X-CSE-ConnectionGUID: kLy5pQEuTw+zdBtBavC9IA==
X-CSE-MsgGUID: Cqi/aYgZSOu9Cjk0kFS3Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="88119195"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="88119195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:24:47 -0800
X-CSE-ConnectionGUID: mCwnWga/SLCwCOSzxqbAzA==
X-CSE-MsgGUID: 7wI1ESI/QHyAIRrFPUOBiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="221594758"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:24:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:24:46 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:24:46 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:24:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teKOMEfI7HO5rPQDCniScTqlcwVC0gMeyULq8qjCY4gxPQg/fV/PFXjwMHVOVmgBIy6ck/9P4NkASkaj5EXysRe18l9dlfENVVm157U+mfnadcbT7/eiKD+urZGPReslpORr4UX8tIUX8IOeX/sTt9ErCAlZDZHew1rZal3H9co4R/khT1pNk0BOOCPOYUaUzB2LtWi9HwXNukk9Ejb9ZcL7vxL5QZ0CfTenJAUnBo3Mqft7Uv4QepPtRzyuQ5ZaWoEwEn3R8AT7ds3LN0AOlwQ05utm74BNMq77ZzuZGFd5mmfOH7T51AuFryU9DgN/6KE2PZWNOIRlOzWlpEkEWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QclK43v54CYuwWReX7j0seetnY6Lb7VXVSOjWESaD+c=;
 b=Ps/+mBuD8Djc6GKtdA+VXVPuPcokuAJbLZdMIsdvr0puQ9/t5Xgm2/47pa6SDEa6DT10IYlXKmju9aC3eU1fOtnUk5lGmNK21cvS3Sj0hSZyxCmWO6RMLUHUYS1YRH06jmtWKv7QiUTCb/gUSzo2Fkef/h5mgdKRQEGNOjM4TuUS9MuQtACx7xjwUJfbKl2aEPb/7jRpCfK4C8sApaUlZ+IO4cu7drxRvp8CfDVLVu+6w2sRQWsRw1BKxOdFbIOillV/SbbanvRU6rf1qsaC0DJHWK7qPu5A6usxfpglNWwNP9Kn9Qfvar/jqTPqR2H19QYGZrOLqYH/KAdydrlKCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH7PR11MB7661.namprd11.prod.outlook.com
 (2603:10b6:510:27b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.20; Tue, 18 Nov
 2025 08:24:30 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:24:30 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 06/16] drm/i915/color: Add framework to program CSC
Thread-Topic: [v6 06/16] drm/i915/color: Add framework to program CSC
Thread-Index: AQHcTk7zt2LShTN6DESGhXZNTT/UabT4K1XA
Date: Tue, 18 Nov 2025 08:24:30 +0000
Message-ID: <DM3PPF208195D8DD135EB18FD08B152D983E3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-7-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-7-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH7PR11MB7661:EE_
x-ms-office365-filtering-correlation-id: c5659ce8-9620-42c7-86aa-08de267be567
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zG3zAmG9WBGanJY9BSrp42xOqkAv1jzDLwZWjtz5+f8xBm73azZKa5h+RLCx?=
 =?us-ascii?Q?TxttFzl4QQnP9HBZYuRBuNOKBvVcZ32ijCFZISigTJ0E8YSYCEgrxSruLcEN?=
 =?us-ascii?Q?KIHe7nInHUxdydhmyR8GV5DwbV+8Sb/vwTctz9ZbzLguqKp5aiIzmoKNnvml?=
 =?us-ascii?Q?MxWJAWqpw4BdgKfYFQqBZty8KCG6OzKdcWXOriDMDLumyLL6xFyzSTtuN/gm?=
 =?us-ascii?Q?/HIsNbwhxLBohnsrJ+kBBcki1Jou2pVEV05n2OxMnbjNaoSkIgY2huuVry3y?=
 =?us-ascii?Q?ShTgi6rI+ppMIDogm+DBg0Um4KZ0F4clzwe2Uv1Re/1KhaRjiA1sUOPzIlDb?=
 =?us-ascii?Q?xgN8CbwCB0kvBmNEA+Md3ovWKdw9OFIstNCShR6fwW/F9oOYeRAcvQigAHZj?=
 =?us-ascii?Q?MTlEWgIdexkhOwZ/S6rBeNf0ooCc21b3YbNY1yA6Yfoeg+aAS903DD+/NMJv?=
 =?us-ascii?Q?PojevRHNRUDNXBkR9rU++rUIu1yoVz3XcooqyMRZo+M/XSX+qhh4b7fPyVxL?=
 =?us-ascii?Q?kzfDNg8kc7d0swn+op+FRm0bX3oNE+QpV6UtdeysEF3CIGpmsM9t0pXmp3tL?=
 =?us-ascii?Q?tNP6q9Noy5yTUXCof4xPaMdyR5ZUN4XTV45bpPQYMPo+h44mZty03yC32yst?=
 =?us-ascii?Q?hVITxr3qW8slSO+ZMDWSN57N/9RkACEnzAeVNjmoAkoTDhreR/1FA9hIZsHG?=
 =?us-ascii?Q?K46NoXb49IbAy/hX12F/iozw4NE5nEMm38HV/Q9MgFqvGAmIi6olI/gb99aC?=
 =?us-ascii?Q?j3sVaaEU2th4jBu4D0G2kANHt25+Vl/jlj8mkT15MpNhUZZ2mJWBzWQc3UJk?=
 =?us-ascii?Q?Cd102nrQPxg+ttcWHb94fsLtfbc0USgjzIU81zJseVkHV+TiEs1iUvIfhMMG?=
 =?us-ascii?Q?KEEWiuvslqoA3gQmhDdT8/A5ONk8UkA7OCBF6PpQ7s3lSYr71zMQDyUkM62u?=
 =?us-ascii?Q?t9tOHZC/zdEMXowGaRBIgl/UjhvOpoGmCjjksV7cYf/JFrsbcSrfwgjr1gU2?=
 =?us-ascii?Q?WoB3XSNnl3htUb7jglNr3ZPleZdmY2Y8w2bVtyDvv+6eBHVkeeB01xyirAtv?=
 =?us-ascii?Q?pKBNHD3Dg35mfLoCRDW58rvC2dMBfSvCNC/RVqeFTURVr0QQfsub98EyUJz7?=
 =?us-ascii?Q?BUgQTWIJjTYJD2hoJjETD81DmVv44Gy6b0vROQtE6Lsr0Um4e2n8wY2L0Bc3?=
 =?us-ascii?Q?t+LHmxXomPlZiiq1lqf0fm4LxgXSafw5rg/A9QZrGOFEeLSJLNIkDZSvlmTb?=
 =?us-ascii?Q?DL+ydVfLPnbgEHE+4Baaa/T4TBOVRn3smsYZS0gJTWcRQpV5IyapAdWA0U1p?=
 =?us-ascii?Q?8GcboCv6yaxZ4qsfpHs/z63ePibLOCC/HjzmB4QVJVFKEJU0crIM6kAtDWz9?=
 =?us-ascii?Q?65ly2Y94F/JRBkJrJcCxk/5S/SjWb0XHfUc5WfxrrNHp2SgJrwgdCdeRiTj5?=
 =?us-ascii?Q?8ZXcyKzj03nT0BUUkrbFEaSX1+4ekaZNA0yeRcTX9JxmsSGMVIcUB/gnlk+e?=
 =?us-ascii?Q?mjydae4V0FKaBT+Aj+/Vj1VCekVYzti71XcT?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iwRVlM4/wi0s/euKOcx/ARXW3vOmN1Y6ayIM1hggN+BAfYHUjWFyMFvHnf0e?=
 =?us-ascii?Q?eM8mv0NVCtGXRVs4M2xi3IufDr9wsP6dyVH+6DOez1sCtPAH1ct+z73yLHXO?=
 =?us-ascii?Q?8kkNs3cEvBfEJNG/PlpTcZJxlqu1rNLROGMpQr1HSnC0bA8iAQLKS3wBZZpx?=
 =?us-ascii?Q?KViv0D7AFM1a+U6UsCH2Z0pGV4PLNUhZxz8OP3qoT2C4+57VQZcBejRWHWOk?=
 =?us-ascii?Q?PTrRcoKi9UQ7GS/puFS1Ak7X8I4TGXURamLqkiUWF/EtEcohkHBBzFHB2sic?=
 =?us-ascii?Q?0gZxIvvxOzt7rkkkMM/d/TptVpshhjF16F72D1jov8NEShnzWjBT1cR2Tfux?=
 =?us-ascii?Q?MGHgnUY3OGlXeIq8c5DxmRDIbLLYD21beyVZ3C7k/T2WssFhhkMihRErtLwm?=
 =?us-ascii?Q?QKKvqUxu+GFfzrgUc6j0AkTtiFMXamS9TH4U2Azc0KOsb97gLC8AFv+KuHmT?=
 =?us-ascii?Q?TQF10Zl0Gtt8MeYG3SKCu6qcZFn+vazGBKMpzCsA9wK9+1YoCIuoY5W6rTu7?=
 =?us-ascii?Q?x9nJddHOiqI/jlE/Bc6+umriLpX0itd59UjjR4gGQy5F1NU9VJB/IzJWpHp4?=
 =?us-ascii?Q?qzarnMB31YZAzhpydMnteed3P9jqQSK0xzfI7x9iqit+uJKwPp7YNqAwnnb3?=
 =?us-ascii?Q?ODqs3O4kKIlCZ1Rlz13fhLdXZo3Bk4eUYYA77T7HTAng4hvYq+izvJKI8+XK?=
 =?us-ascii?Q?cslqj2GTQPFbbRCSk026WQQGlc1nd8TokeZgZPjJHzdbFdY7iInjJmuGMlxf?=
 =?us-ascii?Q?s986CO9JBklKMnq8kHS7VAT5nKdzleqi1k6Cqcz5nSRhJ261bke5V7mEYCwI?=
 =?us-ascii?Q?akAAL/gxCT3CAxKpHYmL8pRTX+VQ8hq8+XyPdeEW7E5MdNQ+WC0tDra0cDWn?=
 =?us-ascii?Q?v0O4eNV+6NY6y2Gz4zIsVorFGubQA2a5eOlLQS9MO4hqcc4+HiTnE3GOyalF?=
 =?us-ascii?Q?S4YGG0QnnJyN6E7fLnqaGN6BYlwtFrzZBs4u8mS7Lke4VzAX7QgIU9/BgvLr?=
 =?us-ascii?Q?ReO5qyeA0xhdH83M5BTXeKShKw6h0A1KW/9Sij5sooKuMw+3jybmC0ghamIJ?=
 =?us-ascii?Q?i76cJ0cZ2xzum1p7bTXFk64sqQeADSqHUoYwNriFZNJNKcWUPkbul4n6nkH+?=
 =?us-ascii?Q?BlgaJz6iIO+qvDDSaU11eKY4RdeZqWSiv/s4CIiU12b+DvSQHHtXtS75NEhX?=
 =?us-ascii?Q?kneW3ehXira1guHhah+c7iE9HbMlp4hlZ6Do4PcZYHphkhVcuA6lnxvIaHqP?=
 =?us-ascii?Q?m1DOa66xZixiP8ZmqoFY4m8g8q9XNLlCmVSByymn7+TCKe/DHQGHhBkQ4XG9?=
 =?us-ascii?Q?oxpyKSK53+Q0xzJPw8M6ev+E/0jpgAH1Y1mA/JNIpMmj3Z7YG6pGgoSI4ibt?=
 =?us-ascii?Q?1mduA2XrM9DfMcPpImU2PYUwFBMeqBRMhdY/3IVix13fVOJyPuMHtmjZPYi5?=
 =?us-ascii?Q?Y4lZLW3TW4RJ6n5FImKsEDXh8R+N04uLaKuo79EmgYMBpb0lie/2Gn4S23+k?=
 =?us-ascii?Q?aPQF801ddtojEpuhXOemEjlQlaeIsfegHWtgsbjGg78WEthQtZUpVRnr3ii4?=
 =?us-ascii?Q?I92DRNwP5vLvZBr53CagtrrbfiBXxAXzDL57upiB?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5659ce8-9620-42c7-86aa-08de267be567
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:24:30.4759 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8IxPPYocA+9flUvjljSqAJhtP+l3gF9Mkt09AfVHYu4D64UgERNM8PLJdleQBiiZWJbqpfyG6AH86m2QSo/i/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7661
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

> Subject: [v6 06/16] drm/i915/color: Add framework to program CSC
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add framework to program CSC. It enables copying of matrix from uapi to i=
ntel

*UAPI

> plane state. Also adding helper functions which will eventually program v=
alues

*add

> to hardware.
>=20
> Add a crtc state variable to track plane color change.
>=20
> v2:
> - Add crtc_state->plane_color_changed
> - Improve comments (Suraj)
> - s/intel_plane_*_color/intel_plane_color_* (Suraj)
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 21 ++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
>  .../drm/i915/display/intel_display_types.h    |  4 ++
>  drivers/gpu/drm/i915/display/intel_plane.c    | 49 +++++++++++++++++++
>  4 files changed, 77 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 1e97020e7304..a45d348c9851 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -87,6 +87,10 @@ struct intel_color_funcs {
>  	 * Read config other than LUTs and CSCs, before them. Optional.
>  	 */
>  	void (*get_config)(struct intel_crtc_state *crtc_state);
> +
> +	/* Plane CSC*/
> +	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
> +				      const struct intel_plane_state
> *plane_state);
>  };
>=20
>  #define CTM_COEFF_SIGN	(1ULL << 63)
> @@ -3962,6 +3966,23 @@ static const struct intel_color_funcs
> ilk_color_funcs =3D {
>  	.get_config =3D ilk_get_config,
>  };
>=20
> +static void
> +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state)
> {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +
> +	if (display->funcs.color->load_plane_csc_matrix)
> +		display->funcs.color->load_plane_csc_matrix(dsb,
> plane_state); }
> +
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state) {
> +	if (plane_state->hw.ctm)
> +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
> +
>  void intel_color_crtc_init(struct intel_crtc *crtc)  {
>  	struct intel_display *display =3D to_intel_display(crtc); diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index bf7a12ce9df0..8051c827a1d8 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
> intel_display;  struct intel_dsb;
> +struct intel_plane_state;
>  struct drm_property_blob;
>=20
>  void intel_color_init_hooks(struct intel_display *display); @@ -40,5 +41=
,6
> @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
>  			   const struct drm_property_blob *blob2,
>  			   bool is_pre_csc_lut);
>  void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
> -
> +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> +					const struct intel_plane_state
> *plane_state);
>  #endif /* __INTEL_COLOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index fa39f3236597..d25f90ded71f 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -646,6 +646,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> +		struct drm_property_blob *ctm;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> @@ -1392,6 +1393,9 @@ struct intel_crtc_state {
>  		u8 silence_period_sym_clocks;
>  		u8 lfps_half_cycle_num_of_syms;
>  	} alpm_state;
> +
> +	/* to track changes in plane color blocks */
> +	bool plane_color_changed;
>  };
>=20
>  enum intel_pipe_crc_source {
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index 505c776c0585..a5d0f95a6f10 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -49,6 +49,7 @@
>  #include "i9xx_plane_regs.h"
>  #include "intel_cdclk.h"
>  #include "intel_cursor.h"
> +#include "intel_colorop.h"
>  #include "intel_display_rps.h"
>  #include "intel_display_trace.h"
>  #include "intel_display_types.h"
> @@ -336,6 +337,52 @@ intel_plane_copy_uapi_plane_damage(struct
> intel_plane_state *new_plane_state,
>  		*damage =3D drm_plane_state_src(&new_uapi_plane_state-
> >uapi);
>  }
>=20
> +static bool
> +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state,
> +				 struct intel_colorop *intel_colorop,
> +				 struct drm_property_blob *blob)
> +{
> +	if (intel_colorop->id =3D=3D INTEL_PLANE_CB_CSC)
> +		return drm_property_replace_blob(&plane_state->hw.ctm,
> blob);
> +
> +	return false;
> +}
> +
> +static void
> +intel_plane_color_copy_uapi_to_hw_state(struct intel_plane_state
> *plane_state,
> +					const struct intel_plane_state
> *from_plane_state,
> +					struct intel_crtc *crtc)
> +{
> +	struct drm_colorop *iter_colorop, *colorop;
> +	struct drm_colorop_state *new_colorop_state;
> +	struct drm_atomic_state *state =3D plane_state->uapi.state;
> +	struct intel_colorop *intel_colorop;
> +	struct drm_property_blob *blob;
> +	int i =3D 0;
> +	struct intel_atomic_state *intel_atomic_state =3D
> to_intel_atomic_state(state);
> +	struct intel_crtc_state *new_crtc_state =3D intel_atomic_state ?
> +		intel_atomic_get_new_crtc_state(intel_atomic_state, crtc) :
> NULL;
> +	bool changed =3D false;
> +
> +	iter_colorop =3D plane_state->uapi.color_pipeline;
> +
> +	while (iter_colorop) {
> +		for_each_new_colorop_in_state(state, colorop,
> new_colorop_state, i) {
> +			if (new_colorop_state->colorop =3D=3D iter_colorop) {
> +				blob =3D new_colorop_state->bypass ? NULL :
> new_colorop_state->data;
> +				intel_colorop =3D to_intel_colorop(colorop);
> +				changed |=3D
> intel_plane_colorop_replace_blob(plane_state,
> +
> intel_colorop,
> +								 blob);

These params need to be aligned with open braces.
Also I noticed a lot of checkpatch errors that can be resolved please run c=
heckpatch --strict
Resolve all of them then send the patches unless the warning or check is ju=
st unavoidable.

Regards,
Suraj Kandpal

> +			}
> +		}
> +		iter_colorop =3D iter_colorop->next;
> +	}
> +
> +	if (new_crtc_state && changed)
> +		new_crtc_state->plane_color_changed =3D true; }
> +
>  void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
> *plane_state,
>  				       const struct intel_plane_state
> *from_plane_state,
>  				       struct intel_crtc *crtc)
> @@ -364,6 +411,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
> intel_plane_state *plane_state,
>=20
>  	plane_state->uapi.src =3D drm_plane_state_src(&from_plane_state-
> >uapi);
>  	plane_state->uapi.dst =3D drm_plane_state_dest(&from_plane_state-
> >uapi);
> +
> +	intel_plane_color_copy_uapi_to_hw_state(plane_state,
> from_plane_state,
> +crtc);
>  }
>=20
>  void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
> --
> 2.50.1

