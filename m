Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A250CF79CE
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 10:48:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2421710E1D1;
	Tue,  6 Jan 2026 09:48:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c16wWcPK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5343910E1D1;
 Tue,  6 Jan 2026 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767692922; x=1799228922;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qhj/s12RQQDhs1B17CzaveE0aj/P6bV+PReRIEgWB2A=;
 b=c16wWcPKtoqx2qWW4THPtDyJCl1SXtC2dnDPOGd5VkBpDPiGQZfxmKHI
 GYo5jnXQ8eyK90PjJ5ysdJg4qg/W5KW867K5d6mG5vEoAj84DNgALuwGJ
 6+LKrMS1F/uXhG60DTsn/0u5OrgJO1PphIthVfMudhDSRiCFY1G0Jqkfa
 dkoEgsKCkFofmRBh99DCvGCdyFhdq87fSe4UwU/p/QAmlLZaW0Q0cewSO
 bHQnwsZpGVj/Su0DuP0+eWqicJikoPw3Q77G0eH/enktUwH22BSPKVDjc
 5rbRR0LqEyNQ1zPySgDA36q9jYw7FFw31EHUUS2eWM0YozqMVbckfUWiX g==;
X-CSE-ConnectionGUID: rUMDOlD/QNqIKuRJ9Hvhtg==
X-CSE-MsgGUID: fedTbTSjTMSfFAAI8S8fqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68799537"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="68799537"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 01:48:41 -0800
X-CSE-ConnectionGUID: bRxhsB00RmK3kyOllly3xA==
X-CSE-MsgGUID: Jd6vwV4ER1iCw/D2o90t/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="201842762"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 01:48:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 01:48:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 01:48:41 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.56) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 01:48:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P52xMD7XyiunZ3Cibn58q2kBCnMweoIy7cj5b2syO7alBa58uKVUFS0h1I6hE/BqEkrAf3ghM8tHTEjSuDJuSIaAJmWmWsFzoTmtpi0eJ6DxrmbsFczZYbwP4CQGtvBgiQ49S1kWMm8fHEWXMpQ5UQefcFx2SrJNJimms8GkZYDtvZMkbYRFlGOwdg3gxoIEFYY3KtlP9F3czFHq5X6meMHEPhwbZ+e9Bziy6DxNMRhL2Rz3F7OL+bzlyL4C7fWHPZz5CiVKTBqGwsvs6HIrJHN7+g2CKVtLQz7LbzBRW6zc7WXGs+X9gZ1CoB0+ejrjvAOh/4HH4s5QfprRZU7wvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6E0Tcm9Nx/gd/29qnXH2GKfEi1kf1v4d+/RczxtOKN8=;
 b=s9wFBa+HLpyrpHe2cEj5yyf7FXzZaVTDalFJoDMfV3x2XTh1ku3itqNberCQYLllgg/vAn9UMJH3Bzei1kNvo+PYNKIV0sIKEvzqZLP65YeSzs1kbkeRnbGXTL7ZHq0d/6s5blrLGgjBFny+GIWMlxZqY+shxANK4Dtwcj0qIZZm88t5Jdm/SzSOj7RU9GEse7Hm5cBjNlmwXCuxMC5szYGgojgsXbS8866RxUcCTy7c/iV28i3o492aJKPK/8AaI4JPmTlao410X8REig2dZeb4tYd7+wCTijyVB/fo2Xx7Xpz5DiXnSvfSVRGQeL3mpaNUx+q0KgjsWtXmsEaGMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6)
 by SA1PR11MB7063.namprd11.prod.outlook.com (2603:10b6:806:2b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:48:38 +0000
Received: from CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd]) by CY5PR11MB6344.namprd11.prod.outlook.com
 ([fe80::f6ad:9f7c:3812:8efd%6]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:48:38 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane
 color pipeline
Thread-Topic: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane
 color pipeline
Thread-Index: AQHccLbuHaN5HfvLeUKcKZLWZv4+zLVFAaPA
Date: Tue, 6 Jan 2026 09:48:38 +0000
Message-ID: <CY5PR11MB6344756DD911CE700A8DD27EF487A@CY5PR11MB6344.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-2-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6344:EE_|SA1PR11MB7063:EE_
x-ms-office365-filtering-correlation-id: b5d334f4-e7b8-499c-82d6-08de4d08c484
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?PrayAEI8LB3C6z/rWVmjYhCi40THQdZRmnauW1Oo5Rc9BS3WhY2cgehd9LI5?=
 =?us-ascii?Q?1yK5CkgPDiSO/XJ0CipxMN7CLOVNaUb2a9HF+JkB2nMLpe204sdI4b97Aqkp?=
 =?us-ascii?Q?+jMpmZ0P0WOcGky5Vr0x1iHprsySOihMEasb8pwEw60nvbQGi847qFzmdWk5?=
 =?us-ascii?Q?vUU90NNWwq5nW9LNpheI/azAbciprnD0u1H4FUFqqMT8fnt3WqAfCs/GSgSA?=
 =?us-ascii?Q?q4BftAL5g0c0RbJpntu5PPkXP+CSYuTSkU4N3O3urV7B6atphIWOCEn2TzKW?=
 =?us-ascii?Q?qlU/kP/UUyfTkpKrhU9oCOdHtTSMUT2BSQXSxYng4LNl7d77rNX+6OaXUFf9?=
 =?us-ascii?Q?xVJfbtC97ia/aR2Xu0WtucGqEBHsUSBSeXRR1gAbwimxH1LkloEOaqlbeCbE?=
 =?us-ascii?Q?rxwbOsEf737Y68ghut+/EEVQOodaCCBJ5vWg8wb/PsnONxftgttE8JNZWmwC?=
 =?us-ascii?Q?qWDMtDS9Q6c53teXeE4dmSjBBl8dXW4JSdpyk3mBCLGerbvERyFv2n5uuj8M?=
 =?us-ascii?Q?zWJRnJgF9zEeXCds5rZwxb+O82zVwY/9Z7/MeIEaKm/UHEUHujj8oZhjbWwh?=
 =?us-ascii?Q?0EUwN1AkxP/hdjqvw+8vTesJzS6ySwxX5UYpOUNN6M6XWivYoVcRpEtrFqZI?=
 =?us-ascii?Q?vYNy/xFIebDNnwz699Qt+TyJNgM1L6+R2mncaMnsqBAJeDN36XX1UHPmP6j/?=
 =?us-ascii?Q?TmjB9bt18iGKKEDthLvwZA454HsutYvXWlOdIFbsidVGOUD+psliU3mWIHoK?=
 =?us-ascii?Q?OQy1Y+UjiDYLyUxjyVHWwgZfiO5bIYCcdMlFHy64helZmwAPHjBaQSorl1nn?=
 =?us-ascii?Q?GPlNBEWWF3yMjXMZOZjJtvxrbSQc50gLv7328oomFWpRRnZC7ZRbgkeMwekb?=
 =?us-ascii?Q?nG5SZCkcIHxG9tOYtr+tT94Q6z5949TiIOltj0BIDrEkOsqERs1vICWfCBz5?=
 =?us-ascii?Q?ezvtoBIXLvf7yI+iqdeuh+dXqD0y9OY2wuS1TyvU0/N8QT4YxHkmQ4WH1Dgu?=
 =?us-ascii?Q?U82V2mFGyjx99vD0gjcgFN3oi9OlkcfnAV+gmmGpm3wQRsJNdfJXClVYygy8?=
 =?us-ascii?Q?2QmGsNCTZKuuJa3HnjBtgEXmpF67jYCDtwnM8i1MlTVPw2b4cfVco+wO/rQr?=
 =?us-ascii?Q?ny319aEkPxPOL1L/rbvWwx2S+vzhpZux8ZBp5Vesgsav3Cg61rPGPFNttUpj?=
 =?us-ascii?Q?+chu50TSxkNbgMGQNIG7mTnXTu3S8zi9KjEtlgVYniGL/T5h+gU72AfE+WB/?=
 =?us-ascii?Q?yAY8BFhFh4+nZGAbl+YkC4V+q7USNnlg7XaGJ1XdIuJulaYX11h4TX05ppxG?=
 =?us-ascii?Q?ZDDS80LdKO5EyKyszxLD8RY6T0W89V/Sx7UakzLoiaXkbLb/7iZ2m6PEV//h?=
 =?us-ascii?Q?qIThQyoIeGV2UBYaNB1xmIdNuOmoPLEfKVj678T5Msm2pQ1ld6sXZsNBJgRZ?=
 =?us-ascii?Q?LY2OwoacZszQR1YzN5MpF3cFfV2cQ8CtN5A4dGIJQWBydGnkkd19F5OGQ9cv?=
 =?us-ascii?Q?+Gjz0jjq1V4b2d7mpvkr1W1kt1yhAFFLjmtV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6344.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JWmieuUeTqle8ABTcMb3YUvKmn8DNQXzd3LmxnbZm6yTbWo4i8I7oGMMrbvf?=
 =?us-ascii?Q?Z9zpfF8a9iNNCxD1Di4s7ZuUOpSQ2QzxH5vaV38sRAoGpQaumPHCRYfuMNhN?=
 =?us-ascii?Q?QjDvE/GKM62rlHw3y0cw9WxPE0aseApRgNg2X3W7BURrvm7U1rjOepqMouqc?=
 =?us-ascii?Q?gdwrltIR2qc9cufuBRf0y6J9r1IWekoDD2+Ez1T6PMJnm820vjUkI3BhZ1JH?=
 =?us-ascii?Q?G+QlTZjCAID8QLLxDwonevl0p4HvdXsBWztkGqTow/rTiifrmm40gvqHJHUs?=
 =?us-ascii?Q?IXc/Dq3pPr+DhyBsk6jpS1eauNv/o5iO1TFYXbGZocjQRkGmgNhiVG1FWILJ?=
 =?us-ascii?Q?BdpnEF4N84ZOtYQktfQUIdHVJHim0Wc1R5QYzqFjpP8wHY4gpB7exhlGsUpL?=
 =?us-ascii?Q?eWSlpiDLtSxLSX1CCZu70sGUaBfkHwgbMnQqRUMEDBRafFhTokDvLebKaGqH?=
 =?us-ascii?Q?1YqMWmPdVCkYo7OqIWk7t9TAp7GVFCbA0GDgZJrabonnhZDPCoeb2MtEJcKc?=
 =?us-ascii?Q?AAi/vEb8Y1TLa0NgwiM0DKBPDlqu64hk/XsC90Sj1boDDcWgW1Wamkd56cKA?=
 =?us-ascii?Q?gT6ZT3q/zlg5HiP4eiXjEGfjntMuKvQACsqV5kLL18mIYNT+m3y2k8KkxILa?=
 =?us-ascii?Q?hDc9zmZWQBPVKiid5YWA566yv5y9xnhTogp19CVAiUTvWGvOpmojfKjz2X4Y?=
 =?us-ascii?Q?EdtfrTe7SreGPjYXcXui768QaaYhTY7Np9Ketkh6gOSMs75beFZZuU//tDt7?=
 =?us-ascii?Q?BSfC8EX02VgAmFGuMiLB+bua/WLrcfIC6qv+PmxXCn2QTl6FcsNiG2APQBEm?=
 =?us-ascii?Q?DPwamVDoZOvWfiOEpmygOea2JUPbHigaPbEak8+jaPi2SLdWVwUUPAUdwIdg?=
 =?us-ascii?Q?tB9Ao60TT9xTw8eOZypkzp3I3fgkdJb4d+ClGdIYC5CGC0T9ojUT6bVa/JnO?=
 =?us-ascii?Q?3G2ofzJE4f2v6zKTb2VB+UPSXK0m6Bf6+Qd9dJp+GBBAOx2Ms9Jw7nIurdvE?=
 =?us-ascii?Q?3TXdhySFihe9iVS9H8KtLyGb4K0wtaUnviiY8NBv0Os7alLfKiQHYC14jSH3?=
 =?us-ascii?Q?F8QZva+uH15kYyPZExM7RIzXtHCm2tYk20zlMGrzPftLkE9336BRNA6HdPF+?=
 =?us-ascii?Q?JkiO4Il1zVDd6xMUTio3mvRjrZpybj2GXIp9nRSnQx2vn/i54590iPesxBr8?=
 =?us-ascii?Q?8+GVgiTsiuBwZCJWk1/FQip+mTmckvrioVZVqpKpEKvhNNDM1AZgmSllkD3Z?=
 =?us-ascii?Q?2immqdX5+YLHcaEVqUYF0P2MLIFN1BZFyUta4o0UMElVhib8OvFybgUr3uZ8?=
 =?us-ascii?Q?YsAQqMIkE3pWl9hLr9hev2Vk6J4Tvfod9IrRc6kWT3LrmkYSQNO5c7PB/1zm?=
 =?us-ascii?Q?zjesDd26+43UiMF0o3IZPL1egtjSsKjbeV5XEJoLoYg+za0Gn0S23siNV5Uc?=
 =?us-ascii?Q?FGSZwTpzXRnTxZemqOJxK6KIKIET9NB5IW5rkPViTw0kuc7Ef+bSm/P9WHhG?=
 =?us-ascii?Q?/Tt5PoNeWx7gTAwJLTuwfMaoWoXin6io+3vLZ9vfVd019viG84wjciDSXWi8?=
 =?us-ascii?Q?WiM0nUmqJFuPojx+zGpPTBsCRXZy27abL/wQi6E8MByWbgTcE+vMAvHbNXJr?=
 =?us-ascii?Q?UUkarAoKiAOB1EFDUdGr/EUiurmN1Oj5euxrSJ3DXxHEP0nj6okTSUDHT2KE?=
 =?us-ascii?Q?z2qrZcwlrzEXdPwvij1hRxqg+h03OaTdUiBI0nhYgUgJifuiCLHAFmNU6a07?=
 =?us-ascii?Q?QhSyzZSpYw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d334f4-e7b8-499c-82d6-08de4d08c484
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 09:48:38.5050 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wmTcm1sBYVd6lAu+L2r5KVJvvDNdZQwjhVmkLSO6FIU9hQr+n73CPP7wiX2F/vetxIIIo4Gfr5+i+sgRCy/mOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7063
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
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Friday, December 19, 2025 12:26 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: harry.wentland@amd.com; jani.nikula@linux.intel.com;
> louis.chauvet@bootlin.com; mwen@igalia.com; contact@emersion.fr;
> alex.hung@amd.com; daniels@collabora.com; Shankar, Uma
> <uma.shankar@intel.com>; Kandpal, Suraj <suraj.kandpal@intel.com>;
> nfraprado@collabora.com; ville.syrjala@linux.intel.com; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: [PATCH 01/13] drm/i915/color: Place 3D LUT after CSC in plane co=
lor
> pipeline
>=20
> Commit 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline") intr=
oduced
> the 3D LUT block before the CSC stage. This ordering is incorrect.
>=20
> Move the 3D LUT block to its correct position in the plane color
> pipeline:
>=20
>   [Pre-CSC] -> [CSC] -> [3DLUT] -> [Post-CSC]

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Fixes: 65db7a1f9cf7 ("drm/i915/color: Add 3D LUT to color pipeline")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../drm/i915/display/intel_color_pipeline.c    | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 942d9b9c93ce..684641c8323b 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -39,6 +39,15 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	/* TODO: handle failures and clean up */
>  	prev_op =3D &colorop->base;
>=20
> +	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +	prev_op =3D &colorop->base;
> +
>  	if (DISPLAY_VER(display) >=3D 35 &&
>  	    intel_color_crtc_has_3dlut(display, pipe) &&
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) { @@ -55,15 +64,6
> @@ int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_en
>  		prev_op =3D &colorop->base;
>  	}
>=20
> -	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> -
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> -	if (ret)
> -		return ret;
> -
> -	drm_colorop_set_next_property(prev_op, &colorop->base);
> -	prev_op =3D &colorop->base;
> -
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>  	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, plane,
>  						  PLANE_GAMMA_SIZE,
> --
> 2.25.1

