Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AFBFF4B5
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 08:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D3F310E879;
	Thu, 23 Oct 2025 06:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxrJephG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8F410E00E;
 Thu, 23 Oct 2025 06:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761199501; x=1792735501;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=g2Jbmh+TfmCXFCobuTDJhu2NKHshyL7DCiGmOhBscAQ=;
 b=HxrJephGEZiehoIWcpIlRVZpGAgF2t37ErqtcXwR05s8JW294WPLuaZ6
 pMQfmfoIPty7mc6qB2RYf5gXz2L9g5hfCFFj2rh3ooj0+ypSkEMAdZLXt
 cQpHQI36EcA+U8OXNmrgyZjKv6+QMsaa0w67Cpz9umAbrEMPf0B6/lGJB
 wTumTL/y2t3H3tZ2HKJVxyKGABY/gvcL0ANsp6LWSs4RcBJJJzUn4LL8K
 v4HCSy0OvU9TYQewal+tZbibH55QYkqUaIXO8GocMlVVamefy/X7LxCxw
 xEBoFdIWAnQnGS2S6C6z9lqDAFQtwrMCXP6c7oj7m+uZBfA+gC5J1p336 Q==;
X-CSE-ConnectionGUID: ZmD+R+ROT2KeIklGjmvEhw==
X-CSE-MsgGUID: sXL0mFKaQT2VM+IKcExCzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63281392"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63281392"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:05:00 -0700
X-CSE-ConnectionGUID: 9op+yUSiR1ikYFEkJxHdcQ==
X-CSE-MsgGUID: L327EnITTGiL3MUjYiswsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,248,1754982000"; d="scan'208";a="183287552"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 23:05:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:05:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 23:05:00 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 23:05:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhSnTR2lk7lTNIRyWW0xGu2qhG0a1z2gcRRjwMxu/E/mn3H0vF+wJk+wOgxjNgeVO80/w635JEL0Rt5dUU56AlVF0cbmk9FkGKilSfA1iJSRNiR28jXEvTQqaZdG/IsDuZOaDS6SAxof2qDYIqo02BtIJyeeb30Hynx29g6XU1YhbIRZpenD4CGynjXIdq5ppytp9z1ngmyxERDprmcrEZYjkR72DnQOJWLSa7B1rFmHHW6zykZQdVB8t5OHyVyqgz64trjAXoNU7lzG6NIhp9SUXRfR3zZ8Hnl1zdXEkiV2dxW6VvGUlD81IZ4wE254TEd/T1FSCnFQw3uuI+jcZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n5Acq8EauiVDBVoiPsE/RwHlJ5ZTn+ZuJ5XrM/rDu9c=;
 b=KUqsAacTGa/J31wQlU5/jP8B5OVp3dGul3SYGHu+xEPEB9zFDmsyw2jU6cPv+GJOcEhBYnQ9HBC4wquEOniyjLShwLqcXOB5pVN2+qJU+EjT69D2r43RBrXghQVjQhru1FzQRbEiQXUwhHRGU4AaJHDL8wgJNcHVulZ6215s+I/dKC4/8CbJ3J1UXIm/g8mh1saqNoxasy1cpKwQXw1QFonxmSJt1dCA8tbHxiOmfG679+4D1BsicS9STsRUT3aQs+Afc2MHfEC+LcY/LgMAR2hzd2DzTs5HL+mdHEAmozxH5qJfdXEEeEtRntpvZvIkN4xY5mbZJ4WWvUPH494SMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA1PR11MB8098.namprd11.prod.outlook.com
 (2603:10b6:208:44b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 06:04:52 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 06:04:52 +0000
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 07/24] drm/i915: Add identifiers for intel color blocks
Thread-Topic: [v5 07/24] drm/i915: Add identifiers for intel color blocks
Thread-Index: AQHb6zDrO6mKH3CiZUGuIxR8EWFlN7TP7sEg
Date: Thu, 23 Oct 2025 06:04:52 +0000
Message-ID: <DM3PPF208195D8D31C50FCFFA341B3D690EE3F0A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-8-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-8-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA1PR11MB8098:EE_
x-ms-office365-filtering-correlation-id: 051b4cc4-f470-47e3-397e-08de11fa14d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ukOblEJiZVKtVb7a/uDRzkFfXSQmTsX6+NKTwD3nqlil7BS2tbLNFNPY8mop?=
 =?us-ascii?Q?4PXWnaAhbA9U9/zSJrhDlLJs/dRBfzSK095mV8A2j1dOzqumEWlnq3gTaEes?=
 =?us-ascii?Q?C1FlerTdDSEO7/Qc3qiypGiKqg5+hLAvTSrS+RBcQxa6mJti1NmRMBA/qyH4?=
 =?us-ascii?Q?zmqFA3yBZ6goB7Ht43GCaSZBi22EfV4mrAccBDEzzFBFMkodExmXhPu0raDo?=
 =?us-ascii?Q?Z6g2K9XzZrRNgyGYhCw6ZjK5JQVd1PPfUqirapagKV2BnqxmcDLJTPNDtL/g?=
 =?us-ascii?Q?wBoLzmx0AdpPtK6jem2ALykJhhLFYZJQuoV0Dt/FLSREl/RUEibCMcBtjebf?=
 =?us-ascii?Q?GY6gJNTMDQFrMeUjeiLZYaQCO3Vayy+BgWOliC58cNKfFFASH+R2zC66PoOT?=
 =?us-ascii?Q?PWI4Y4btSdlm9WajO609bIqtg9UPIsJune1nAHKN5ifU2h7d0vBXeejpXs/Z?=
 =?us-ascii?Q?is4TTZG1Il4udea/NCokd/+pr9HOmKjOrn6gJKOvL5ejzse1zdFUWROti8m4?=
 =?us-ascii?Q?1+23ZAn/okRJLEueivItzGhFUD3VuILJv8BGpZ7AnN+S5JgY5i1ZEAwEeZ8y?=
 =?us-ascii?Q?ZUXibhxdnwxT1df8DOijRknbFm8s98KR6eNshZOtD5st8mcwbyg0ARbRwDSm?=
 =?us-ascii?Q?d8R6d6RpQxgKe/yTfxhiwPxCrpW60sBSbRumC2ZTQRkq+/sYtA4MvprGdp4/?=
 =?us-ascii?Q?P9eN9sHLil4ObwLbMd7GbnrNQfQXJWTGf+6zEsqxaSF31cC5DBN2Kcr4lfR9?=
 =?us-ascii?Q?znGzvS2jsZzdKuDPpIPkYyRnGbQKk75lh4trqeIGrZTrPUxRbZfmyd1ioDFv?=
 =?us-ascii?Q?i0mtICUv1HWvqpfnFTPPmSTqDfODB4G85kG1+9KCpSWmSRsauO5rzVBaCsz+?=
 =?us-ascii?Q?/VeLfko0hP2WC4dgHe5Kcb34nJ7VoRbDXOZGYLyWGG/ayjKrrQdtfF3IrIFF?=
 =?us-ascii?Q?J+wi4muKjlYQu9gkJsCpZgfkW25yGCoQUYmA5QLuxNBW5sNOpLFjUFiaMbZt?=
 =?us-ascii?Q?bgmyMzm0gioeRf0MYRbIslXTfnYinbtDx0BaQTzBYXOsJL/rSvjC1ojPPuFV?=
 =?us-ascii?Q?q83WCbTbz2axEMJSaKB9PdCkiZ/cSygf/5QB7yPVDDl66UjixIgid/AIBFDP?=
 =?us-ascii?Q?QAMX8lfd0Qi1em2jo45SBPXIvev0HObiF+uLSbwwVty6AJzKRmTYW8/gny3s?=
 =?us-ascii?Q?qu+lo7h8i2xltzao2UOQBHd+ipD3Nr319zyRmUN3T1aHmtUu4xHzzwMnJluC?=
 =?us-ascii?Q?d1TgrCjhEK/Wt0CrFaqBEoyeWCySMYqofeDiJVUP4CTp7XOiQP9BY/Zxxgze?=
 =?us-ascii?Q?ZagxtU9K/dcx54/IwCXfvk9XRCZBtBg1hfaCkZV8LrgOkgimasyQYCZCvemI?=
 =?us-ascii?Q?AtZJ+HokUAJfugtHdT0Rm4vJiFts7v8ThiGL+y0wvaj95yvHSZIRMRz77auY?=
 =?us-ascii?Q?VAwMo+m+3DlCzvF11oCqWRF9QlWDrAoWNe6NM6We4NLFXcsiW+RU68BuwjJn?=
 =?us-ascii?Q?RQOD8iDP2XlZya9pXoUQk8KIqUlLbyrTwiwI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Fkex1sLcADBghvpr5omUM70xLSZKRaYz+cQ/Dgb7CBlLFjcoe7eDu2cado+f?=
 =?us-ascii?Q?qz0GEJRHVCBJgpJItqKTWGuwqRZrTXQ+UiedNiAagMH+fnFJWg10fsl5jHcU?=
 =?us-ascii?Q?9bd6OylZHXKREAUrV3mAbY6U5j+T3WPgeTLVEi4NT6Xy9HHVQZZxr0Hl1Sdu?=
 =?us-ascii?Q?6MJGssxkmlyQ9sdYwFOM0it/ij+DBZlbPjvi7H/Ccizhz9fdkL7jv0+7jyhD?=
 =?us-ascii?Q?eqHp1EKUOCN0God0bgsqmpkpNdGefzJk6+mArGFxKBS/G8+DwDuVzOdXLKJk?=
 =?us-ascii?Q?1+lIVCwG2dRq/mwqszQsnBrOuZ5wF5kDFWUoeq+nXaFLjbQyHS03MAnShHJa?=
 =?us-ascii?Q?hQIVcTHTeCwbRoLA8HNr+Vh8lPw/KQ6ql4HUFzSmeUQ1h4nB4Fa9K31Hzvp1?=
 =?us-ascii?Q?UP0ATmqGpOOSN5sulycbJJSs1+4BLfNxU6Bt921vlC3jjctY9bMSxtB9kzCn?=
 =?us-ascii?Q?8CYJwLR35atPxuR7rsutBcvoQNVkqpTqs4uJs502Y6D7yyrgDg8ur2C7DwcV?=
 =?us-ascii?Q?QR8BF1vuDfxXRiVSZvXEB9HpLypHZyjXU+PhhQR1zKiZ+aK/Y/mQ7fcCoctV?=
 =?us-ascii?Q?i7ScKumDfpxLaY6pLIAe9JoJjEwWbS3uQVhrzCY2tJErYcIcGKKcNWSMiI14?=
 =?us-ascii?Q?bZ1UGMmRHvpV7sPFAnAWQe78tS+1HHp5KelaITw0opAM9m8VYKuQtKou6a++?=
 =?us-ascii?Q?UlQmm32X93q/rcZR+JXIOMhmaEOOmm9dmuD1aTtFycH1RpnNF6eX2o/RLbB2?=
 =?us-ascii?Q?1N7UrFzjfF72/aByqs1iM7fxhnh6lwzebDaE3Bq1gYpaPiV8UkdmvJZ3G2Nm?=
 =?us-ascii?Q?OLwl9YrRpNx4v0yfQz/OeivhnX0agyK9lq7+qzJ//h/UNZe/7ZmpYW1sz7W5?=
 =?us-ascii?Q?QxiSZJ4iDBwfDcM9o6mHx2sd/oVYU8XmxTCl3MAAXejEcJLYfcWjpV7dYg3J?=
 =?us-ascii?Q?hji2C1HoHYppDEjqyLFtaCDTYbNSug1HJBtFDaHRabAUC1f8VHADWv5/6I4R?=
 =?us-ascii?Q?SGuhGx5Qn/hwy6uULaEv2FcnzOBqG7j9/yImcBrzopDje3EjJ6A0lUyA/JV6?=
 =?us-ascii?Q?LI+32PsVHxa3k4iGwH5Fflca+BanVe1gYKBWdVJD4ZlW7Z1CcgmD2FeiFUYz?=
 =?us-ascii?Q?dVJ//kz+YkgmeGaUiUWy3Z4gPoK0Mi+Sj11Ac3OqX5Ie+u6KwStSkvFQJYFe?=
 =?us-ascii?Q?sP0BsArPphQQcYB7KdsKA7g2uqObrZJO1C5iIARXNUDbFABM+lWIGjXX49L9?=
 =?us-ascii?Q?74zwoMF6Y/9eJy32qud/nOzMI8Tpc9shJ9P11wd8VBTxlnWAiFYw/r0of3lX?=
 =?us-ascii?Q?CS+4oGPlhY9QfN0yUkFNN9MVsFSyQw9qQVCTm91h3niQ6zH4+kSmz6Jze/NP?=
 =?us-ascii?Q?OwGjEpi6yy3Fa8twi7hvjBYvel3jxv4ShiDMicVq/LHCLoncIvPhiA3ZuEiM?=
 =?us-ascii?Q?sQGxd9/OJHxhcnhQ8z8Gn6LvkDpy5kWfrpyNVCNSkSxfwsJ0ytsuA62N0JZX?=
 =?us-ascii?Q?HRFyI5PxuY4MWfaVf9UBWXtyzDII54ULzBsfbXzhSlO95DMV2zDU8JNLTZbQ?=
 =?us-ascii?Q?/i6fbrC65XsSolGPfEwqJlWvcR8HbiltcR8PJCb0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 051b4cc4-f470-47e3-397e-08de11fa14d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 06:04:52.2001 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SSk/eILMMdQcnTfUaF+RNqjAR4NlCQd2fa71qaaKHspHHyUdcJfeSnrVp6iHiXa34aiV4gpZmL/VNHczDYRGuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8098
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

> Subject: [v5 07/24] drm/i915: Add identifiers for intel color blocks

So I don't think you need to mention intel color blocks here since drm/i915
Implies this will be used by intel.

>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add macros to identify intel color blocks. It will help in mapping drm_co=
lor_ops
> to intel color HW blocks
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_limits.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h
> b/drivers/gpu/drm/i915/display/intel_display_limits.h
> index f0fa27e365ab..97c960cc16aa 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
> @@ -138,4 +138,17 @@ enum hpd_pin {
>  	HPD_NUM_PINS
>  };
>=20
> +/*
> + * Intel Color Blocks
> + *
> + */
> +
> +enum intel_color_block {
> +	CB_PLANE_PRE_CSC_LUT,
> +	CB_PLANE_CSC,
> +	CB_PLANE_POST_CSC_LUT,
> +
> +	I915_MAX_CB

Make this INTEL_MAX_CB

Regards,
Suraj Kandpal

> +};
> +
>  #endif /* __INTEL_DISPLAY_LIMITS_H__ */
> --
> 2.42.0

