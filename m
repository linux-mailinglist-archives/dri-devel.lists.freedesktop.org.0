Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C9EC18CAC
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:53:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38ECF10E714;
	Wed, 29 Oct 2025 07:53:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kx7Ufil8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC0CD10E714;
 Wed, 29 Oct 2025 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761724397; x=1793260397;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MI5TLfju4ks+0nf9fL2YDJj5M6jNpYFUZz+02ABSaKg=;
 b=kx7Ufil8wR3lFH7ALiooMXg0H7MaxySh7WQOFTZ9TQ3pbMybTAi8rH0a
 kiBjlHYb3N+oZLkTox3uLhh36wukdfc9nS6MNrrBx0hmx9DiXUvsmKNrc
 fSxoRAqNedzym+rD6XgQAN43smACYuZKMzyjb8xFQNoWwqRpZud6CNqTS
 Dq8D97th9nnKAh82cVd8M16GW6V72NW9iT44GuNviBtftUmlPWTINs2fs
 fFRTdLCO1rBrg5M2K99Ctw2KS4S6zzEkdTcdvJ8iWHA0JpVR++BtSRFab
 h64eeXdxYZDTCKX4SQjwQ/ila1CWvTE3UrqYhE2+JTJ/T3FWCH7IiXgwA A==;
X-CSE-ConnectionGUID: f+hG2/i7Tqms+pnEn94CXQ==
X-CSE-MsgGUID: /bvGiKt5SZuHUK3W+VqZxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63766278"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63766278"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:53:16 -0700
X-CSE-ConnectionGUID: gHK+AhDJRYm2GxZ9MUQHgw==
X-CSE-MsgGUID: WUsL1FEgROCGDVq1tNaIVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185218700"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 00:53:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:53:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 00:53:16 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 00:53:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cCY4YoYUH1rZgZBiebaywthSvzqlUb8prjRv4GzRRU+sMJGu+auTPUlK8FY3cAXnqDLUaQEiyYbkvPCM9vc2dPdXWQsvNiMNgGgcCJCMYPFuR8tK8UCltixqS1PQfGZge+0UwqWzOiDuDC/cnB0MlE7RoML3fRnjfllN091SpyEAP4PWVqlPCQjTZyI+LuyIC7/V4D7ZdhGLXVOd7vC4VVoMYxuDpmzjC+YzmtXLZ/OVZic/NnE2Cn2CuC1+0+gszZKfGjmMa6mD32jrcpkXsThGiZluK8oF2up1TFG+avt3G2b4SRYywrMeZL4+aTASrSsYFcokSvBN9YUTxz2UOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MI5TLfju4ks+0nf9fL2YDJj5M6jNpYFUZz+02ABSaKg=;
 b=SNgBjMnae9BrFSk14PaLoe5FcpcOVyCQmlzmsGkB5Pjy3XTnRj6kcudAj+byBYjPDDqORPU3Zbk61wIDxaaoja4LAnCphrDCuLX4b32AqIcL5kfbUgBYRcRfWDeZKJRHiqXU6j1ipdwGxgOZAAsTIjDOnm6H5FCQWeJzPXlMUNZJEO4IxxViH9kIJj74xRXAcTZHxMejMBNZhBxtyDzp4gb2X2WBAUt45LUTZMN6odIAs0Krdh/TslFsiumz+FDYhSkgaywO/OcNowf7j/Xaf9gsSC8v2R0bvfjv9sFVrPtjlTcimwy7lZVtrBNZRoJKyff4+W7F0d9rPt5AIFDN/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by MW4PR11MB6861.namprd11.prod.outlook.com
 (2603:10b6:303:213::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 07:53:11 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 07:53:11 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Murthy, Arun R" <arun.r.murthy@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 "xaver.hugl@kde.org" <xaver.hugl@kde.org>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Murthy,
 Arun R" <arun.r.murthy@intel.com>
Subject: RE: [PATCH v6 2/5] drm/atomic: Add error_code element in atomic_state
Thread-Topic: [PATCH v6 2/5] drm/atomic: Add error_code element in atomic_state
Thread-Index: AQHcOQD6DOHNNL7YVE6+sqpFnhYEd7TY34UA
Date: Wed, 29 Oct 2025 07:53:11 +0000
Message-ID: <DM3PPF208195D8D29B1B2E59786933E7FBFE3FAA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251009-atomic-v6-0-d209709cc3ba@intel.com>
 <20251009-atomic-v6-2-d209709cc3ba@intel.com>
In-Reply-To: <20251009-atomic-v6-2-d209709cc3ba@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|MW4PR11MB6861:EE_
x-ms-office365-filtering-correlation-id: 764a1547-4010-4423-d1f7-08de16c03560
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?SWpNQnBhUzlXWnR1SS94TFNiaWh5TU1vRUpkbmF0b3lTaWtLZ0ZkK2UzclBw?=
 =?utf-8?B?aVI0c2dESkQ3eW15dmwyT2NDdUxCcFAyMVpDRENwNUg0R0pMT1gyNmZiZVhh?=
 =?utf-8?B?OTBJOGlrTjc5TzdmMHdmQVdaSHlGbSthcDJ4elNUR0EwdW56bTcrY3BmYVhE?=
 =?utf-8?B?V1U4ZEgwc29qYTZ3QjBNV1A2bjl5V2RUNDkvdWpQeW9nWmlXWEl0bTNac0xQ?=
 =?utf-8?B?WGIzakZrNmZFWWt2UjZOWFpyRyt3L3ZjNnM1b2gyZmg3YSs5eDBvYjdyc25k?=
 =?utf-8?B?Y3A0aksrK3lYNExCY2I3NkJwSlZ5R3JuVXRPcU1icS95VTE0TjlsTFBUTGlD?=
 =?utf-8?B?VThUUFVyMVBzMXpoMmg0Uk5HcUg5bjhxODRzSjl6THBHV1F2eGZkczZXbWJ2?=
 =?utf-8?B?TVJJcVZLblBOZmxMbnNicE4yNDE4YVgzbEUwV3lTNWluYnJWaW95OExsWFA4?=
 =?utf-8?B?cDFpYnRkcm5RWWZlajBEQVBzKzBCMWVmUHhDcks2QjVQOXV5a0NjS3phSnE1?=
 =?utf-8?B?bXA2V0RVUjdob0o3QmRzeStKbnJWY0RBQmpzb2FFSlFUV1ZPWnp2NkZtR3Fl?=
 =?utf-8?B?TkdKZWZUNkhVWmFFbjZiOWFkTDN1ZXJCazFmRGdyS0ZqaUZneVNHWmVOVzBH?=
 =?utf-8?B?VG5EbUUzczNxMzR5UUdHTUN1TjJ6dXVjcUFkRkZUcmhsVjI5YUNiVUl5WFlt?=
 =?utf-8?B?dUR2WUxEZFlNYXlRNkdhUTBCZkswbkswWVI3N0JqcHAxSEtrdVo4TGJEVThj?=
 =?utf-8?B?bmRJVk9zL2pOcmpkTHREaHZiRE9RZXd6aVB0MGp2UVNKTWFVVWpRem9UMDIz?=
 =?utf-8?B?eWxEdHlkZk9wVTg2aUdaTHRDbDJacjVlM1Zxc2JBS2Yyb25DNHJYanI1Y1ZX?=
 =?utf-8?B?SFc0Y2lhekNBalhoRVZzWktaa0oySk5mc245Qm1vL2ZDSWVqdy90YzBsb01N?=
 =?utf-8?B?d0ZiRm5VMHVSNExMK0VpWE8vVG1kMHM2WGdaaFpQMDFRcStOTUs1bUxUMkVJ?=
 =?utf-8?B?V1RCTytPY2lmVXY4Q24xeFc2MU9uZCtEMHVzemRzN1g2eUV6aTRCZ2dSOWlR?=
 =?utf-8?B?SFJWaTlsclkza1lQTUpPMUJZM1VhdXoyZ1R3VGFZL3RmR0Yyby9IOGhSUFBy?=
 =?utf-8?B?QlBpdWxJL290VlcyWDZaWmpSNUM3NTJIc2RtOVArSU9QMUlJNmZZaHFnY1RY?=
 =?utf-8?B?OGlVanh2bU4wNmVEQ1VJRGpkbEg3bFNCTUxQTW1FZ2I3dGFQbHVRaGQ0Ykx1?=
 =?utf-8?B?Yno5T0JMRjlqUzhRVlZDdVdzamg5VXZnVkZ6bWY5NStGSnd0a1FsNHF2LzFT?=
 =?utf-8?B?a0FMcXdnc0Vmckt4NUJWbitRQ3U4Y3NsV1pjQlFZQU5TeDBoY0JtMDdjMStm?=
 =?utf-8?B?R3VneHFvbFdIUnM2S3JWOVIxWTlpR2RnaVFPVEdHRnBBYlc3aTdnbmNnbzZ2?=
 =?utf-8?B?amc2NXAweERIRTVyYVFVUHZlekVQRGNSdHo5R3hYVkxXUGd1ek5salhlQ2xW?=
 =?utf-8?B?VmJTcmFGRjhuMzRCcXUyT3lZbkMvdktnVmh4RkJRQXFXTko5THFVaDkzcTdm?=
 =?utf-8?B?UW1BUVpyVkFsaUZ6QzkxdzFxak1RYUFOME5MOThpSFJmZk91QjZWS2JPTlZy?=
 =?utf-8?B?V0FuK3MvRWptbFQvUlorY1FXRTA2WFgrWjN6aEZoemQ2MkZkSVJnaEZyYTVT?=
 =?utf-8?B?NGx4RG10RkpvdHdyLzNpaEZ5a2dtbk9RNE5GdWJhcUZsYjJhYzhMT09zZitu?=
 =?utf-8?B?bGpCZ3lxWFZpcm5NL3hRQzF3cjVBQUhkTzlyYVpqN3dscVZYZk54SU9GTEFS?=
 =?utf-8?B?alJEN3NXYWpLMzJqZHhOQ0xoQUhKcmJMMGNGYzRzRHdvbTZUd2JtMHd1TUJ4?=
 =?utf-8?B?Q0ZVS0M3aUpqTzdTblpmWm84ZnR4dlVaYVExNkgxSDROUUJFc21CZlExSllK?=
 =?utf-8?B?MjhKNVBqYWdVeUljYmhuT051ZU8yS2IrSDZlNDRjZnJnWnRma2RtenF5QU9x?=
 =?utf-8?B?czVCRmlrQWxMREt4NFRHRUplWXJjbGtiZ0FxSW95ZTYzaGY5TTJoR2VoNnVY?=
 =?utf-8?B?WTg2VkJQZ2J6ZXpDcG9vRGgvQ1ExVG9LZ2tjdz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WnBqSXBHRVFnZHRLT3krbWs0dU9iQjFrM0hWSXlQRlVrM01kMis1cFhSV1Ew?=
 =?utf-8?B?Q1RHQXZWOC9PNFBCeFQxRThoVGVsS3I0SUJMZnpHbjdIcm5NRm5XMTNaYnlm?=
 =?utf-8?B?NXNMcnkwNXlPdm5aanZlNkVhbjRCZXgxdTJWNnF6VDJSb3RkdVJGTDZpU0NU?=
 =?utf-8?B?TW52UFdyOU9EYzMxVG9sMTlvRUtUUkpPSWx0ZXlIeUV3bUtBYllhbmM3MG5j?=
 =?utf-8?B?K21iOFFIRlE1ZW0yL1JKK2poa1ZGaHVzS0Rvdi9YamJUYU53c3lZdWwveXov?=
 =?utf-8?B?TzFpNWFiYXdPRXMxZXhxSCtyeCt0UUZQY1N5eEJXVTk1WjRmOGhlZW0rcHc1?=
 =?utf-8?B?UEEwcXIrTTNYUkZ5RUhDTmhrMm5yYUVmS3B4NnlnMUJwcWpwVnpObnhxVHll?=
 =?utf-8?B?VW8raFUybGFNWGFvZUpYa3ZONEN0c3F3TzZiTGNOK2VCUVdZYUkrdVFLdUoy?=
 =?utf-8?B?RFF4bHQzbHdHdk9ySEdoL1lDMllVT2VGSytoaEVsOG5Vd1dqM0xPYnd0Njgz?=
 =?utf-8?B?V29uSkRqK2YvNTdrNjVId1drWEw2SjJ4aGlsR1REemNvWnBQVjVodDBlblR2?=
 =?utf-8?B?Y1IxOWc3d0UxeHRVc2JsRVJWa2JQQ081dWZ3cTQvOEttVVhkS2ZBSHhrMWM2?=
 =?utf-8?B?dUFsR2FiQXR1ckVRRFRVTldmbEVBd2oxeWxPU0tPQ2tqdGRCeWlzbTFXRysx?=
 =?utf-8?B?NU5kdWNHOGJJNkNHaXQxUTVXRlI4M0hjVFY1SXVOVitLTjhJaXBHdTBMVGNZ?=
 =?utf-8?B?cFMvL3lSL2RnVHh1cHJnOVFhRlFTVWtleEs5eERKSGJTNWRGaGxmNVpRb3Br?=
 =?utf-8?B?OGxQTEUyazQvWDZ1VzFjOCtCWDVtZVJDODBLaWhyc0djQVFkbXJsUVd1Tmgv?=
 =?utf-8?B?T25Xb1VOUXVtU0R5SW5hTFlSSkVoeGtySGhOc3Y1MngwZVpkU0xTZnQ0SlFM?=
 =?utf-8?B?SW84YWV6TWpoRnNIY0dUS1VUZjNQa3pvQXZYYXVBSTJnR1FzNzFINkNpT09L?=
 =?utf-8?B?VTgyN1FTYXRxOFlNcDlrZDhJWEk2bCtZbWx0SUtlZ2tWOEw0elZGa2toNitt?=
 =?utf-8?B?dXVvYVdvZU0xbFl0NUpNUmlPZ3RZNUVPVjBMYWUwVk1tN3JhaGgyb0RXOHow?=
 =?utf-8?B?NkkxS3ZrRWFaOTJGRGNyMUhaUkY4WGxEQXYrSW1pbHRlUjlvOVdrQjhxQmpV?=
 =?utf-8?B?SHdPTnlML2ZveU13WWgzRDAwb2lqWW1oa2U0VHBxSEZ1WXdkTmFNTXRhMUFn?=
 =?utf-8?B?c1lPY0VIcmltQ21UK2pzMkhZS0djc3lXaWdsaGc2ME8xVllOYkZQc1J3VjJK?=
 =?utf-8?B?Y29vL21VMEpidGZJUmlTclVvRC82NXd0anordHgvUXN3WFA0UlQzQ1J5WGd2?=
 =?utf-8?B?RTNxQzlIT1ViYzNoY09DeVhBcWpteFdzZTJsSWdHS2hsK2J0aU12Rm1LWkZB?=
 =?utf-8?B?RFFiaVdJRElQZ1h2QmtPaWV3NVVkUEdwTXRpaGxNdXFMTjNBQXRZQ2U4ZCtI?=
 =?utf-8?B?SmhkMVFsbm5VSjBRWVljaEJrKzhXSVU0elMyNllTMXo1RzNxZ3QyYlNTdTMz?=
 =?utf-8?B?Sy9rZVkzUTVuWUNvVXRSSVlFV0lneWozUHhOK3NMb01GQUYvSFRaMk8xdEJ5?=
 =?utf-8?B?dGYzc1NnSzNXSGlqUFhuLzYxbFV1SXh1NTQ2WDBqUzdIdVNmQU4yVEpKL0Nl?=
 =?utf-8?B?UGVrdGRJQmkwYlBjWUZsRHI2SVJNS0crWlZPM2p0VVdsR1B2Q00vS0xBbFZP?=
 =?utf-8?B?OHZZRWhuL0xCWFNCNXJmZEQ4MTllQVZneFQxeDNRanB3ZU9zMWtSQlB3VDVv?=
 =?utf-8?B?MUQyaWQwU25iNU1XVjZUL1F5UUZOUlptUktWMjZQZURwNUw2NE01bEY3S2pP?=
 =?utf-8?B?SENiVDI4ajI4ZDE4RzMrU0xQVTVHU01rM3A2MzIzeTR2djNiNzBSRmpPRjdO?=
 =?utf-8?B?ajZUMi9xOW9wV2d3V2plTVFMS1M3S3dJTGR4UDhZMmN1bithUmlaazRwZW9q?=
 =?utf-8?B?L0hXL0UzV200V1ZyK1FtaExtZ0pTY0t2R0V6RVdnR0lCM21UWDUvaTRXQXN6?=
 =?utf-8?B?ZnlnM2pRbElPRFVkdnRKSW4xaElMSkljdEp6SXRKNGk1cWlKNTh1NXQ0WlNN?=
 =?utf-8?Q?2oLA4w7Tb+BpEGRYtGJ+Xv0i+?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 764a1547-4010-4423-d1f7-08de16c03560
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 07:53:11.7885 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qP7cIVIld6kl9DZhw0cBG/kJ0n1iGz1R89fQVIHej2Bijt3eQFWRmbnLBHj461OKGj+TH/APitKgsW+kugdHjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6861
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjYgMi81XSBkcm0vYXRvbWljOiBBZGQgZXJyb3JfY29kZSBlbGVt
ZW50IGluIGF0b21pY19zdGF0ZQ0KPiANCj4gTm93IHRoYXQgYSBwcm9wZXIgZXJyb3IgY29kZSB3
aWxsIGJlIHJldHVybmVkIHRvIHRoZSB1c2VyIG9uIGFueSBmYWlsdXJlIGluDQo+IGF0b21pY19p
b2N0bCgpIHZpYSBzdHJ1Y3QgZHJtX21vZGVfYXRvbWljLCBhZGQgYSBuZXcgZWxlbWVudCBlcnJv
cl9jb2RlIGluDQo+IHRoZSBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSBzbyBhcyB0byBob2xkIHRo
ZSBlcnJvciBjb2RlIGR1cmluZyB0aGUNCj4gYXRvbWljX2NoZWNrKCkgYW5kIGF0b21pY19jb21t
aXQoKSBwaGFzZXMuDQo+IE5ldyBmdW5jdGlvbiBhZGRlZCB0byBwcmludCB0aGUgZXJyb3IgbWVz
c2FnZSBhbmQgZmlsbCB0aGUgc3RydWN0IGVycl9jb2RlDQo+IHdpdGggcHJvcGVyIGVycm9yIG1l
c3NhZ2UgYW5kIGVycm9yIGNvZGUuDQo+IA0KPiB2NTogQWRkIGEgZnVuY3Rpb24gZm9yIHByaW50
aW5nIHRoZSBlcnJvciBtZXNzYWdlIGFuZCBmaWxsaW5nIGVycl9jb2RlDQo+ICAgICBzdHJ1Y3QN
Cj4gdjY6IFJlcGxhY2UgZHJtX2VyciB3aXRoIGRybV9kYmdfYXRvbWljIHByaW50DQo+IA0KPiBT
aWduZWQtb2ZmLWJ5OiBBcnVuIFIgTXVydGh5IDxhcnVuLnIubXVydGh5QGludGVsLmNvbT4NCj4g
LS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jIHwgMzEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKw0KPiAgaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oICAgICB8IDEwICsr
KysrKysrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNDEgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2F0b21pYy5jDQo+IGluZGV4DQo+IDBmZGE1NjdjMzkwMDU3YjEwYmNlNjkxZDlkZGMxMTMw
ODA4OGQ5MmUuLjUyZWFjYjVhMTA5ZDFjMGY1YjAxN2UNCj4gNTUyZDlmNTE2OWY4ZDhmZWE1IDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jDQo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fYXRvbWljLmMNCj4gQEAgLTE4OTcsNiArMTg5NywzNyBAQCB2b2lkIGRy
bV9zdGF0ZV9kdW1wKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IHN0cnVjdCBkcm1fcHJpbnRl
ciAqcCkgIH0gIEVYUE9SVF9TWU1CT0woZHJtX3N0YXRlX2R1bXApOw0KPiANCj4gKy8qKg0KPiAr
ICogZHJtX21vZGVfYXRvbWljX2FkZF9lcnJvcl9tc2cgLSBmdW5jdGlvbiB0byBhZGQgZXJyb3Ig
Y29kZSBhbmQgZXJyb3INCj4gK3N0cmluZw0KPiArICoNCj4gKyAqIEBlcnJfY29kZTogcG9pbnRl
ciB0byBzdHJ1Y3QgZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlIHRoYXQgc3RvcmVzIHRoZQ0KPiBm
YWlsdXJlDQo+ICsgKgkgICAgICByZWFzb24NCj4gKyAqIEBmYWlsdXJlX2NvZGU6IGZhaWx1cmUg
Y29kZSBpbiBlbnVtIGRybV9tb2RlX2F0b21pY19mYWlsdXJlX2NvZGVzDQo+ICsgKiBAZmFpbHVy
ZV9zdHJpbmc6IGZhaWx1cmUgcmVhc29uIHN0cmluZyBtZXNzYWdlDQo+ICsgKg0KPiArICogUmV0
dXJuczogdm9pZA0KPiArICovDQo+ICt2b2lkIGRybV9tb2RlX2F0b21pY19hZGRfZXJyb3JfbXNn
KHN0cnVjdCBkcm1fbW9kZV9hdG9taWNfZXJyX2NvZGUNCj4gKmVycl9jb2RlLA0KPiArCQkJCSAg
IF9fdTY0IGZhaWx1cmVfY29kZSwgY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pIHsNCj4gKwlzdHJ1
Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUgPSBjb250YWluZXJfb2YoZXJyX2NvZGUsDQo+ICsJ
CQkJCQkgICAgICBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSwNCj4gKwkJCQkJCSAgICAgIGVycm9y
X2NvZGUpOw0KPiArCXZhX2xpc3QgdmFyZzsNCj4gKwljaGFyICpmYWlsdXJlX3N0cmluZzsNCj4g
Kw0KPiArCWVycl9jb2RlLT5mYWlsdXJlX2NvZGUgPSBmYWlsdXJlX2NvZGU7DQo+ICsNCj4gKwl2
YV9zdGFydCh2YXJnLCBmb3JtYXQpOw0KPiArCWZhaWx1cmVfc3RyaW5nID0ga3Zhc3ByaW50ZihH
RlBfQVRPTUlDLCBmb3JtYXQsIHZhcmcpOw0KPiArDQo+ICsJZHJtX2RiZ19hdG9taWMoc3RhdGUt
PmRldiwgIiVzXG4iLCBmYWlsdXJlX3N0cmluZyk7DQoNCkluIHRoZSBuZXh0IHBhdGNoZXMgd2Ug
ZW5kdXAgY2hhbmdpbmcgdGhlIGRiZyBtZXNzYWdlIGZvcm1hdCBmcm9tDQoiQ29tbWl0IGZhaWxl
ZDogPGZhaWx1cmUgcmVhc29uPiIgdG8ganVzdCAiPGZhaWx1cmUgcmVhc29uPiINCk1heWJlIHRo
aXMgc2hvdWxkIGJlICJDb21taXQgZmFpbGVkOiAlcyINCg0KUmVnYXJkcywNClN1cmFqIEthbmRw
YWwNCg0KPiArCXN0cnNjcHlfcGFkKGVycl9jb2RlLT5mYWlsdXJlX3N0cmluZywgZmFpbHVyZV9z
dHJpbmcsDQo+ICsJCSAgICBzaXplb2YoZXJyX2NvZGUtPmZhaWx1cmVfc3RyaW5nKSk7DQo+ICsJ
dmFfZW5kKHZhcmcpOw0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9hdG9taWNfYWRk
X2Vycm9yX21zZyk7DQo+ICsNCj4gICNpZmRlZiBDT05GSUdfREVCVUdfRlMNCj4gIHN0YXRpYyBp
bnQgZHJtX3N0YXRlX2luZm8oc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRhKSAgeyBkaWZm
IC0tZ2l0DQo+IGEvaW5jbHVkZS9kcm0vZHJtX2F0b21pYy5oIGIvaW5jbHVkZS9kcm0vZHJtX2F0
b21pYy5oIGluZGV4DQo+IGM4YWIyMTYzYmY2NThjZDA2YjEyYThkYWJhZGE3YzA4OGEzMjg2NTQu
LjIwNWNlNDE4ZGEyMmY4Y2JlMTBlYTMNCj4gNTNjNjI0NzFkYmI0MWFlMmU4IDEwMDY0NA0KPiAt
LS0gYS9pbmNsdWRlL2RybS9kcm1fYXRvbWljLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX2F0
b21pYy5oDQo+IEBAIC01ODksNiArNTg5LDEzIEBAIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlIHsN
Cj4gIAkgKiBjb21taXQgd2l0aG91dCBibG9ja2luZy4NCj4gIAkgKi8NCj4gIAlzdHJ1Y3Qgd29y
a19zdHJ1Y3QgY29tbWl0X3dvcms7DQo+ICsNCj4gKwkvKiBAZXJyb3JfY29kZTogcG9pbnRlciB0
byBzdHJ1Y3QgaG9sZGluZyBmYWlsdXJlIHJlYXNvbiBhbmQgc3RyaW5nDQo+ICsJICoNCj4gKwkg
KiBzdHJ1Y3QgdG8gY29udmV5IHVzZXIgcmVhZGFibGUgZXJyb3IgdG8gdGhlIHVzZXIuDQo+ICsJ
ICogRXJyb3IgY29kZXMgZGVmaW5lZCBpbiBlbnVtIGRybV9tb2RlX2F0b21pY19mYWlsdXJlX2Zs
YWdzDQo+ICsJICovDQo+ICsJc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZSBlcnJvcl9j
b2RlOw0KPiAgfTsNCj4gDQo+ICB2b2lkIF9fZHJtX2NydGNfY29tbWl0X2ZyZWUoc3RydWN0IGty
ZWYgKmtyZWYpOyBAQCAtMTI1OSw1ICsxMjY2LDggQEANCj4gZHJtX2F0b21pY19nZXRfb2xkX2Jy
aWRnZV9zdGF0ZShjb25zdCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3RhdGUsDQo+IHN0cnVj
dCBkcm1fYnJpZGdlX3N0YXRlICogIGRybV9hdG9taWNfZ2V0X25ld19icmlkZ2Vfc3RhdGUoY29u
c3Qgc3RydWN0DQo+IGRybV9hdG9taWNfc3RhdGUgKnN0YXRlLA0KPiAgCQkJCXN0cnVjdCBkcm1f
YnJpZGdlICpicmlkZ2UpOw0KPiArX19wcmludGYoMywgNCkNCj4gK3ZvaWQgZHJtX21vZGVfYXRv
bWljX2FkZF9lcnJvcl9tc2coc3RydWN0IGRybV9tb2RlX2F0b21pY19lcnJfY29kZQ0KPiAqZXJy
X2NvZGUsDQo+ICsJCQkJICAgX191NjQgZmFpbHVyZV9jb2RlLCBjb25zdCBjaGFyICpmb3JtYXQs
IC4uLik7DQo+IA0KPiAgI2VuZGlmIC8qIERSTV9BVE9NSUNfSF8gKi8NCj4gDQo+IC0tDQo+IDIu
MjUuMQ0KDQo=
