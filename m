Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMJRDVFkgWn6FwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:58:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0516D3F20
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 03:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742EF10E313;
	Tue,  3 Feb 2026 02:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JFWVdytF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75EB10E2FC;
 Tue,  3 Feb 2026 02:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770087500; x=1801623500;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/TZVxYJwp3bSOWrLPp0mbSMK5RIve4IymJqXfOIK5g8=;
 b=JFWVdytFqakOckHkRt1aekkRjwa6aKxlgmVMlFpszFnurTviWtM2fgeg
 ULxgJe86dc3Ajyj+9dn8FrV6bCCUJCLYjnbikRN7EOCkjgtBc5yvTfgQa
 d7T5kSRiKtR3CfSlloy1+D6DI7c8ZQI9QxBOo5JXZ7xiyvsU5AaWbhNgH
 EKnKprnSrV69hMU5GDFoVbfIW3qzK1lWqXFAMVlhlntuH5LIy8Uhkeh9i
 2RPRl8fxOM6DMy7uqWlJZ0fFCbjBNsWL5zrvMGfyUWNuMw4PikGfNHjL6
 sw8ea/xFJ2GXdIxNYUUxm5JrzZUR077NjlH7QUjR5xe0Sj17RbCAVMfMu Q==;
X-CSE-ConnectionGUID: mtBAZDCNQEmfabyoMpnMJQ==
X-CSE-MsgGUID: R72mBXYkQY+4YQu0I+O92w==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="70975826"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="70975826"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:58:20 -0800
X-CSE-ConnectionGUID: HQJzyvEBR2qTIRody6ovvQ==
X-CSE-MsgGUID: t3G8XgqrS7y81UL269VPsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; d="scan'208";a="240743110"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2026 18:58:19 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 18:58:18 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 2 Feb 2026 18:58:18 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.41) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 2 Feb 2026 18:58:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IrlLsoFXqO+aorp04I14DOdNNjnJw/OxvdLyDZO5/Na7e4iZ5Dz7QHi0yKyU/KF93IJXyS4UY2CZOL89Xuv+jb+gS15EJu2+Eo1QvwH9sXa6ISFkmvKtlzOPH+NN0TzpBCssL48xvFcuAuvw4iSO+itAhxEvXnfAQwpjzNlTQLuKLgijY2/EI+/S42m/ceERcs5+R80itlrgh/QXV+XYtYvkJuncFOsaIKE5lofpVgAhJEZlc7ZaEgiDFG5Wreb+soaAJb7ic0GXFc9v4lvYGI5yOuzbeOAfM1T+bT7cW1rWIWmouaKAgei3bZfJkxomhL1WJufkzB3SCJAQWK5FtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TZVxYJwp3bSOWrLPp0mbSMK5RIve4IymJqXfOIK5g8=;
 b=yG2Oaedbz6xtBAhNLqoeE+3+DjViiaWQW438o759vNBtHvtteY9WGYKy40TpA8cbFYVYXXqV6PQWTPorXHOguEnGzywBUhynYgpXdwMnLambEejVee29yTg4hIzuP6BDMydSWbq42SmFJlyeN0HfwV9ZeXx1+u8J3qJj6K3kfAJT2+eS038ThdiD8SvE1d1Ba6PemLzfMcZEB3MFyZ0E2B9Jbs9KnBrD5w+I7ZSubiZVEJ+erftAcylS1grMN7zj+ZrBRE9+BedGpVCQ9toXEVCcBl4YBbPO9MyoXA1Yf/F1RYenTYuCIWNkJ2nGbnYmu8ru0aBbYCtVCrZfVUIyDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by PH0PR11MB5142.namprd11.prod.outlook.com
 (2603:10b6:510:39::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 02:58:10 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9564.016; Tue, 3 Feb 2026
 02:58:10 +0000
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
Subject: RE: [PATCH v8 3/7] drm/atomic: Allocate atomic_state at the beginning
 of atomic_ioctl
Thread-Topic: [PATCH v8 3/7] drm/atomic: Allocate atomic_state at the
 beginning of atomic_ioctl
Thread-Index: AQHckP0Fw2FL3g4zXkShIQeGY0BT/bVwTwdg
Date: Tue, 3 Feb 2026 02:58:10 +0000
Message-ID: <DM3PPF208195D8D039CE9CED15E2F03368FE39BA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260129-atomic-v8-0-4cb7b0faa051@intel.com>
 <20260129-atomic-v8-3-4cb7b0faa051@intel.com>
In-Reply-To: <20260129-atomic-v8-3-4cb7b0faa051@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|PH0PR11MB5142:EE_
x-ms-office365-filtering-correlation-id: 3db36b97-ca09-4623-4abf-08de62d01094
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?Z1VQRVk2Ui9uZmh6eG9xNld1VUMzTVdmWjV0STlYUmpCcm9ENk1wdHBBbXJk?=
 =?utf-8?B?aHJWekpJQzVmSm1IQnltMm1UOFA3dHgxR2d6NThBTWU1WDVBR0g0V1dnU2Qz?=
 =?utf-8?B?MVJ3ZEo3NVVOc0VnalZSN0Vxa0M3aW9VRE1mSUVJckxkakRJaFBCTzVUdFNw?=
 =?utf-8?B?S0Z1WmJvKzl3dEF6d05kK3o4SXBxeVc3V3NZM2Z0bjNGR3diTFpwL0RpZ2lp?=
 =?utf-8?B?Nk5zaEJPb3VtNVNaQ0pNWkxDTW5FdEhVdW93TXlYelZFdWlRNHh6bjh6VnNH?=
 =?utf-8?B?T1gwK3FWYWJUUzgxVGxaM0FrTFF0dFlLdE9lOWZPMU50QWdHczBacENsK1pK?=
 =?utf-8?B?cldPdlBHUGxQN2xjdVAxcmZ0WTVQbW5YQjR5dGZEZERCRFFJY2t5TU1QYkJV?=
 =?utf-8?B?dyt5WXEwYkc5aTZrYU9LNStpRUNLTFp2cUZIMWFmSzdRbnZQejFEaTVsdXpQ?=
 =?utf-8?B?ZE1EbHlwclVzNUFCQnZJU1VtTURVUjNieHEwaXZlMU9rSkF6cHB0dUlnekl0?=
 =?utf-8?B?Vm1aOXpFYWkvRUliOXhhVmg3d2wrL1FpcFY0aGJ1UkpmYjJiMkVwNnVXQ3h6?=
 =?utf-8?B?WlhJb2tNai82QkZhRXFIRlRGY3JxTUZtR2xJUGZ2WjU1d3NtQUpBYjNLb1k4?=
 =?utf-8?B?VkJ0cFFkMHMyeWpLTjY1d2FZQlZIYmtrQ3ltNmdXbS9IL0MxeEM3ODk4Nnh4?=
 =?utf-8?B?VVBGb3E4M0x4UlZjNlgvS0RRVjFOV05UR2JrTTNBWFoxeHFITEJ0dk1rYTN4?=
 =?utf-8?B?OXNxNzB6aWVrelVqdHM4em11eXFpOTVBSExselhmdnR3TWwwZzBtakk3M3BE?=
 =?utf-8?B?MVNOclVtaWdXaXIwMXQ1NzVGaWRyRS9jUDAzMGZCQVFPVXlVSDJwaitjNHJN?=
 =?utf-8?B?MjJBY1ltcDcxWTAzbC9seldCeUpqOGFOTDZVeVRVQnFkTy8vbDRWR3hwSGpx?=
 =?utf-8?B?d3RjaXF3dlhwajRkazJiRHlIY1lwUlRFcXFOSEl1RllPSS8wNWh4dmVrU2N1?=
 =?utf-8?B?RDIrZWt6bG1qcVpuQXVjeCtSbHhQbHM4Nmx2enFOaWFpUjJGbkN6TkhPK3o1?=
 =?utf-8?B?ZXk1WklIZHpXd0RqMFFOdmdpdSs1NEdQZ3FReVZ6VUNRekZra0ZQZ0liWTRz?=
 =?utf-8?B?Y3ZOMVcrSS9ML0JkWllzZVNXQXE4bkl5eGlmYkR3VzA4NUZ4U0JkVkxoWFJQ?=
 =?utf-8?B?czJ6bFlvbkNQSEFQSzl4LzZGaVRRdUc1K0ZwMGJmYjRvdElUQW5qck83Q3gr?=
 =?utf-8?B?aWgvQ1ErK0RuNHU5N21HRThMa2JmSEJiSE1WbFg0OWpVai9QQ09mazhLbGNo?=
 =?utf-8?B?cDVhbFdCZnNMWGNTSUJMakowejg2SnhtcXVjRVVsTGdNZURZQ3dGeWpkbExZ?=
 =?utf-8?B?Q0dzTUxWelRCVGZpUUpmWkZlYVpUMlc2UTZ4Q2xwVXdiRkVBdk9OdWVUSlBJ?=
 =?utf-8?B?dThoYjRHbURPQmI4SkRhMEdQL0xQeGU0WlhHYUFtYStIYklVNFgwMEpRY0VJ?=
 =?utf-8?B?QnJTYUx6Sjd5UmEzeVA1SS9XcHB1ZlhFRS9Fa3R0QUZmck1iOUFvWi9BS2tS?=
 =?utf-8?B?Sm5ubVFHc0hLRlI5WlZLbjQ4dVppNGg0T1Z0WTdXczN1bklCa25wNitrM2E0?=
 =?utf-8?B?WGJ4Q2hqb2tWOTFQamNHZkNSczFIY1FGbEJ5VUk4SjlxS010VHc3VjZQS1or?=
 =?utf-8?B?YWswQm10N2pLMTkrS0pYQTF0VHdrQ2k3S0ZEaDZmb3pCNnRMOGE2R0lDcjdi?=
 =?utf-8?B?VTRic1pEWURXaUhDY3hLZi95ZmVtRkt4Q1JiVXNGSWpUbnAyNUtZd2ZXWHA2?=
 =?utf-8?B?dExUMmpScEtQdk9HamVBWU5jQjR1NU1ZS1dUbjJ5NjZJYk56VnFoYkwzY0VL?=
 =?utf-8?B?K3BSNEdUdlo4aXppaDE3aWJtZjJxenV6U05ORE5kNk13YlJEWGRKZWMreWl6?=
 =?utf-8?B?ZzEyT0owMjduenRjdElIYnVpR3AydVp5RG9wU2hZV2Fkc0dwNzVaVEtwOUxr?=
 =?utf-8?B?ZnhBZ3RHZkpkNUdPUFpZclE4VGJyVUt1RWc1MFV4SklOYkZBMXRXNmxadTBD?=
 =?utf-8?B?cU5PdnY1bVJZY3dVRytwTjFRS3FKTG1kZCtVUHM4cHhDNGtRN1hJdTdxYmhv?=
 =?utf-8?B?aXpzeWNpSHpqcWN1ZWpSTDQwTmg1V0JlUS9UekUxTlZNYUNNbHlFc1FtblRv?=
 =?utf-8?Q?U9uNXLoJyNjGLMeAb4jlVq1WGfY05+cBkP931XBZXBkP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkE2TnBxSnNaUHZNSEhmTDk2M2hmN1RUSXpIWUVhQWJIM3gvQjFGVUtNVDlJ?=
 =?utf-8?B?L0xITVRTYTdsMjB5SjJrVkZRQXB0MThJMEJDTHV2bXo0aWhMcDRjNHF3UzdH?=
 =?utf-8?B?RW9ONVJHNVVoV3VIN1JkRVdZVXNmZFBLcTVIWHVOeWxNYTY0VStZbm9pYzh5?=
 =?utf-8?B?QXNqZUw4QkZzV2YzeSt6cllWS0dIdGtuWnVOS3VBR0diOGtkaW94dUQ5a2hw?=
 =?utf-8?B?NGJGWThTd3RVNnEzTm5zN3gvYlhZdklCN0J3VXdxRUhpTHRwQ1ZOazFZL3cv?=
 =?utf-8?B?bUlJakhsbGhKMytqOFgvQzFsS0RycWlVV0RrVmYyLzliTTRacFVPWVIzbDBW?=
 =?utf-8?B?Wm13blpXbmJiSkFkdTJpL0JlN2laWXRyS0t6VDVDK1hpTHY4YXRiNSs0QjlB?=
 =?utf-8?B?aWxJR2h1Vk1PYTlsS1RJQnlEcklVTFNEL3JmQjRVZm5aRXNjeEZKQWYzN3BK?=
 =?utf-8?B?dC9WMlBEQTNGSzV5MUFHQ2pSTXVJdTdQQXFPUDNZc09kandyMytFbGdybjl0?=
 =?utf-8?B?azFEbmRNY1cybyttK2dlanRiOHEyWFJZbXMxMVpMVWY0NUFyMmhYekhNV2dH?=
 =?utf-8?B?ZUFtZytCOWVvMHNmYXR4L1FlcGtvRzNzU04wUXRuK1ZVZDZhWnJrVER0ajJX?=
 =?utf-8?B?U0I3N04zWGlDMnh2MmNEdFA5dlB4UmQxeW5GSnVoR3RObmhsSklmNTVNM3Nx?=
 =?utf-8?B?eGxwZGw3S1ZMSjA0a0hRekF4Z05sM2VKRDVYdW1YVXlaUWllcm95MlBpV1VN?=
 =?utf-8?B?SDlCa09uR1ExM1Zzdk1WZ0pxRVFyZWNCQmNPanpscDhqMVlRd3JWY016NmR1?=
 =?utf-8?B?TmhPUm9iVW1lajdsSHA2SlZ5a1BOb3BQSFgzTkUxQURRQlh0bVp6YkNhckIx?=
 =?utf-8?B?Y3p6WGNNaEJnT1lWeDM4THdpUWs5VjFOOStTWi9JSTVxWDc3NWljOUpheHUy?=
 =?utf-8?B?Q1VFelJBUHhuUDBSNzc2cy9XU0RkaHFQUmwyT0JHcUlFZS94aFVHTmJWVFgx?=
 =?utf-8?B?RWZtZmRNNTlIZm9MTUd5ZTR0MVlsYXlZajZJMkd0NC83UVROeGV5ZTVDQUI0?=
 =?utf-8?B?bnVaTnI0QTh0d1dQRzBjZHFhdkR2SEU0T2g5STdNK2FmdVZ2VStZR1dVSHNZ?=
 =?utf-8?B?TUdSeEpSWGxlTlpvZ1g5SUNBdTF4VmFEb0QrUlZiMlViaFlsUVpUZk02TXNN?=
 =?utf-8?B?WGswUXY2NW1ibUVwczlsd25xMFVKeWI5eTlGNldZa0lYTVFUU3hMYm1UMlhq?=
 =?utf-8?B?b3U1UDA3T0hIYWI0M3JGR0I0QXRZNmxIS0g2TG93VzVLWW5PU3RlUE5aYWlW?=
 =?utf-8?B?T1Jqck9WbzlHeVhRNFlMQWtpTHZBMDArRFpsWXJIVGo0VndXMDVIWmxjVFBk?=
 =?utf-8?B?ZDhnRjVQUHdLb09yNVozNEdkN3NBVnBqR3ZTai9NYXkvdlhSREhyU0FmeWZQ?=
 =?utf-8?B?WkZOeVhidGI0Q0tpT0FXeng5MTZLT3NySWlsbjlzNHRReGdjZkh6MUpFOWgv?=
 =?utf-8?B?RTkrN1RlUkh5YzdhSWpYK3JURUU1UmwwV3FCK1l3dWF4VzBScmZ1b0haMFVw?=
 =?utf-8?B?SkZLU0h0d21CdGJIQkk3SDFtM3BoYm9NaStYeVIrS1ZYMXB1bkI0Y25rdkZN?=
 =?utf-8?B?ZFRDbUJoZ2dXUG5SaHV5a04wbkg4cjdvWFVuem0xRThpamxBTytrMStLbzA3?=
 =?utf-8?B?Uy9ibGd6enNTcGNPQWtWVzY1Nlh3ZXF2TDFaUEk3Zkxta0NHOGlDblZVMWkw?=
 =?utf-8?B?WmtmVFIyQ2dGOXdZMWthRmhyWmRXQ1I0aEkyOFMzNWF1aFFJUUF4cEVWbG5k?=
 =?utf-8?B?ZEczYnFET29VMnl1UStDNWZ5UldUbTMxZDVqTnNGaVZjZG5TMmR2SysraXgr?=
 =?utf-8?B?VjBLNWw0QjhkanZsSm9xcmlRVEsxSTBmM0VvNE00d1E0VlZKZUoxeno0ZjBR?=
 =?utf-8?B?ZEN6RVQ1VXFFaER4ZVM0MHNGSStjWm92Qk5QZENwKzVhajlnRXNwWHo2NHVX?=
 =?utf-8?B?blBoT0Q1enRyUU94Qm55THhlUkdMdzNkaVU1elJzN3h6ZHpSdlZiUHMvc3Z5?=
 =?utf-8?B?UGJha1JDSHN3VzZEdEdMcjhWL1dIaGhnYlg4M2FXaTczUFJmckRXZ3JvcHZq?=
 =?utf-8?B?OUR6K0Y4U2FuQUJHZmJIaitEdFQ3eDlvOVJjc1Ixdm1NZjFNVjZkajR6S2Y0?=
 =?utf-8?B?Wm1TUmJCRmZHWjRtSURYODMwd3RZeXJ5ZHhTQkVSaVgvZ0pLQVE0enR3WXBO?=
 =?utf-8?B?b1FUc1puVGo2bkJxMUxSN0JkcTF2VkZXQkhMYWEwd3hGay9wbHcyZWlZbURC?=
 =?utf-8?B?RkFna3RFcHlSSzJPVmI0UFBub1E5YjFyWnA2bSttd2tuTDZraFpvQT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3db36b97-ca09-4623-4abf-08de62d01094
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2026 02:58:10.3444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NjBWXkaJ7Q03rfp0lhxaTyIlA4kaVcmwOOs2jpdcS73/x/Nxsh1YhVHLFdh+uwV6//HlKP+ZTn0chps0wahMLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5142
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,ursulin.net,kde.org,amd.com,bootlin.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,intel.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suraj.kandpal@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: C0516D3F20
X-Rspamd-Action: no action

PiBTdWJqZWN0OiBbUEFUQ0ggdjggMy83XSBkcm0vYXRvbWljOiBBbGxvY2F0ZSBhdG9taWNfc3Rh
dGUgYXQgdGhlIGJlZ2lubmluZyBvZg0KPiBhdG9taWNfaW9jdGwNCj4gDQo+IE1vdmUgYXRvbWlj
X3N0YXRlIGFsbG9jYXRpb24gdG8gdGhlIGJlZ2lubmluZyBvZiB0aGUgYXRvbWljX2lvY3RsIHRv
DQo+IGFjY29tbW9kYXRlIGRybV9tb2RlX2F0b21pY19lcnJfY29kZSB1c2FnZSBmb3IgcmV0dXJu
aW5nIGVycm9yIGNvZGUgb24NCj4gZmFpbHVyZXMuDQo+IEFzIGF0b21pYyBzdGF0ZSBpcyByZXF1
aXJlZCBmb3IgZHJtX21vZGVfYXRvbWljX2Vycl9jb2RlIHRvIHN0b3JlIHRoZSBlcnJvcg0KPiBj
b2Rlcy4NCj4gDQo+IHY3OiBSZWZyYW1lIGNvbW1pdCBtZXNzYWdlIChTdXJhaikNCj4gdjg6IE1v
dmVkIHRoZSBjbGVhcmluZyBmZW5jZSBjaGFuZ2UgdG8gYSBkaWZmZXJlbnQgcGF0Y2ggKFN1cmFq
L0xvdWlzKQ0KPiANCj4gU2lnbmVkLW9mZi1ieTogQXJ1biBSIE11cnRoeSA8YXJ1bi5yLm11cnRo
eUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5j
IHwgMjIgKysrKysrKysrKysrKysrLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFw
aS5jDQo+IGluZGV4DQo+IGRjMDEzYTIyYmYyNjU1MTJhNGZhMWVkZjBhZTkwOTMxZmYwZDM1ZTYu
LjMwNDJlNmMyNjE2ZmIwOTQwM2MxM2E4Ng0KPiAzMGM4ODE5YTM5Y2Y1NWQ0IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfdWFwaS5jDQo+IEBAIC0xNTc2LDYgKzE1NzYsMTQgQEAgaW50IGRy
bV9tb2RlX2F0b21pY19pb2N0bChzdHJ1Y3QgZHJtX2RldmljZQ0KPiAqZGV2LA0KPiAgCWlmICgh
ZHJtX2NvcmVfY2hlY2tfZmVhdHVyZShkZXYsIERSSVZFUl9BVE9NSUMpKQ0KPiAgCQlyZXR1cm4g
LUVPUE5PVFNVUFA7DQo+IA0KPiArCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYp
Ow0KPiArCWlmICghc3RhdGUpDQo+ICsJCXJldHVybiAtRU5PTUVNOw0KPiArDQo+ICsJZHJtX21v
ZGVzZXRfYWNxdWlyZV9pbml0KCZjdHgsDQo+IERSTV9NT0RFU0VUX0FDUVVJUkVfSU5URVJSVVBU
SUJMRSk7DQo+ICsJc3RhdGUtPmFjcXVpcmVfY3R4ID0gJmN0eDsNCj4gKwlzdGF0ZS0+YWxsb3df
bW9kZXNldCA9ICEhKGFyZy0+ZmxhZ3MgJg0KPiBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNF
VCk7DQo+ICsNCg0KSSB0aGluayB0aGlzIHBhdGNoIGFsb25lIGNyZWF0ZXMgYSBtZW1vcnkgbGVh
ayBzaW5jZSB3ZSB1c3VhbGx5IHJldHVybiBpbiBjYXNlIG9mIGFueSBpbnZhbGlkIGZsYWdzIGFy
ZSBnaXZlbiBhbmQgZG8gbm90IGFsbG9jYXRlIHN0YXRlLg0KTm93IHdlIGp1c3QgcmV0dXJuIGFm
dGVyIGFsbG9jYXRpbmcgc3RhdGUuDQpZb3UgZG8gZml4IHRoaXMgaW4gNXRoIHBhdGNoIHdoaWNo
IGFkZCB0aGUgZ290byBvdXQgbGluZSBzbyBJIHN1Z2dlc3QgeW91IGdldCB0aGF0IHBhcnQgb2Yg
dGhlIGNvZGUgaW4gdGhpcyBwYXRjaC4NCk90aGVyIHRoYW4gdGhhdCBpbiBnb3RvIG91dCB3ZSBv
bmx5IGNsZWFyIHN0YXRlIGlmIHJldCA9PSAtRURFQURMSyBzbyB0aGF0IGNvbmRpdGlvbiBuZWVk
cyB0byBiZSBtb2RpZmllZCB0b28uDQoNClJlZ2FyZHMsDQpTdXJhaiBLYW5kcGFsDQoNCj4gIAkv
KiBkaXNhbGxvdyBmb3IgdXNlcnNwYWNlIHRoYXQgaGFzIG5vdCBlbmFibGVkIGF0b21pYyBjYXAg
KGV2ZW4NCj4gIAkgKiB0aG91Z2ggdGhpcyBtYXkgYmUgYSBiaXQgb3ZlcmtpbGwsIHNpbmNlIGxl
Z2FjeSB1c2Vyc3BhY2UNCj4gIAkgKiB3b3VsZG4ndCBrbm93IGhvdyB0byBjYWxsIHRoaXMgaW9j
dGwpIEBAIC0xNjE0LDEzICsxNjIyLDYgQEAgaW50DQo+IGRybV9tb2RlX2F0b21pY19pb2N0bChz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIAl9DQo+IA0K
PiAtCXN0YXRlID0gZHJtX2F0b21pY19zdGF0ZV9hbGxvYyhkZXYpOw0KPiAtCWlmICghc3RhdGUp
DQo+IC0JCXJldHVybiAtRU5PTUVNOw0KPiAtDQo+IC0JZHJtX21vZGVzZXRfYWNxdWlyZV9pbml0
KCZjdHgsDQo+IERSTV9NT0RFU0VUX0FDUVVJUkVfSU5URVJSVVBUSUJMRSk7DQo+IC0Jc3RhdGUt
PmFjcXVpcmVfY3R4ID0gJmN0eDsNCj4gLQlzdGF0ZS0+YWxsb3dfbW9kZXNldCA9ICEhKGFyZy0+
ZmxhZ3MgJg0KPiBEUk1fTU9ERV9BVE9NSUNfQUxMT1dfTU9ERVNFVCk7DQo+ICAJc3RhdGUtPnBs
YW5lX2NvbG9yX3BpcGVsaW5lID0gZmlsZV9wcml2LT5wbGFuZV9jb2xvcl9waXBlbGluZTsNCj4g
DQo+ICByZXRyeToNCj4gQEAgLTE3MTksNiArMTcyMCwxMyBAQCBpbnQgZHJtX21vZGVfYXRvbWlj
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlDQo+ICpkZXYsDQo+ICAJfQ0KPiANCj4gIG91dDoNCj4g
KwkvKiBVcGRhdGUgdGhlIGVycm9yIGNvZGUgaWYgYW55IGVycm9yIHRvIGFsbG93IHVzZXIgaGFu
ZGxpbmcgaXQgKi8NCj4gKwlpZiAocmV0IDwgMCAmJiBhcmctPnJlc2VydmVkKSB7DQo+ICsJCWlm
IChjb3B5X3RvX3VzZXIoZXJyb3JfY29kZV9wdHIsICZzdGF0ZS0+ZXJyb3JfY29kZSwNCj4gKwkJ
CQkgc2l6ZW9mKHN0YXRlLT5lcnJvcl9jb2RlKSkpDQo+ICsJCQlyZXR1cm4gLUVGQVVMVDsNCj4g
Kwl9DQo+ICsNCj4gIAljb21wbGV0ZV9zaWduYWxpbmcoZGV2LCBzdGF0ZSwgZmVuY2Vfc3RhdGUs
IG51bV9mZW5jZXMsICFyZXQpOw0KPiANCj4gIAlpZiAocmV0ID09IC1FREVBRExLKSB7DQo+IA0K
PiAtLQ0KPiAyLjI1LjENCg0K
