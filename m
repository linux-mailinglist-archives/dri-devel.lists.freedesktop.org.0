Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 065C1CF7E7C
	for <lists+dri-devel@lfdr.de>; Tue, 06 Jan 2026 11:55:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 602B410E171;
	Tue,  6 Jan 2026 10:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ADPlL3E7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0AF410E154;
 Tue,  6 Jan 2026 10:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767696923; x=1799232923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dk75JLP+L2mycExTcCeA0SsFHIShIkq/Ny9ezNsYBX8=;
 b=ADPlL3E7z5RvlgPBZ7HbmBWGuTXq60RNp5U0CqAyhfBqgjRngC0koSNK
 fcasUoK5lHTUX2/ZeK9mt+eV3aPpc4LppHFCg3whzItwTCMQyVCWv2qtM
 tTcraqZDCYLaDpShlHbgAuqYDfgf2lg+NNCgjU6QcbNW12Xzvid8KGHwW
 i7BvBjJoFFh4WDntPGkhq55yjj7ANtwdLWwdhZrCL+jbWeOWq+Ut4taYi
 ogAO840bVXN2JZjhj4wNSB5Q9yMcPdKCUVJuwrij9M9e84Jg4MQvYdw5V
 a2/Fg4u/f8Yue/9iT+coX9V67jHQnwG5O8KWQCG0zRuyVHHCDSNDLO9Kz g==;
X-CSE-ConnectionGUID: BAFbKJqLT3emZ86eaJ4sJw==
X-CSE-MsgGUID: ZzsPMoR8RBqz+UBa3VtvXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69103219"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="69103219"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 02:55:22 -0800
X-CSE-ConnectionGUID: p7YQtiF5SZy0Eo5lrlSoEw==
X-CSE-MsgGUID: EsDSOEfURRifhKwZXkERzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202252281"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 02:55:22 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 02:55:21 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 02:55:21 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 02:55:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KgXOhWL324DNHXDQR1/bBbdieSb35zVMrOKvOudxZt9pwxgJBr/EuO5/4B75X5UsAfvOQSkit3YDohnPYuSC97snMzu8ojTAUxLAEQCketolWKBCbv7+rlkaqhZPuVCVBL8psbT9RHZ/lE3wzc4LplJGBF0evyQEAxFRnO1EUN2bGxnqu4hvuaGjJKrZYNl5jtLJSvjAA2ylk5fWKGcfpiuMYlpZ3FLSVPTUFIeXN2c1US+IjwUYCdoIVGFpDtJj2MFm3mDZzvZDzawoLF0PYKdwg1FdOEvPPUXGZeKxPOEvlvdDe6kUBbcRz4lQueqQPz96Y5aPdPMDspuQ40EYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7M90SAmPznr8kZtUDL67Jh8Rp2QKbL9e8pqPa5xHBl8=;
 b=hGUA3yOP6jaKtHoQIJDzxBixulJHe7oDE6l2B6dTuVMjf5/oxDQ7EpkSlGy5eS1YkzZUKmvmI6ht34dq9p2tKAjY0sH9aFcqya9GgiDRGfw6YMp6N9cpiiO1fN/sDB93Dc3WmD5IFAEegXTZ1eP9sycQEojuk5Qg9p0HPZXxzynRyYNeZtgM7S/96uF3NVkID4L6Eg8ph0MLSKaQcKQ1iuYD3X39OaPDgTDf7rlNrCVZxVDqlmml9O3cpVbV375IrLwJBnnqP9i/fpe62vyf6Z40+UzC5jda3g1kSuIWu9vLKf58hGd3l76MNJRQUTb4GvcDeIIC7bCuGktqseV/gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 DM6PR11MB4595.namprd11.prod.outlook.com (2603:10b6:5:2ac::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Tue, 6 Jan 2026 10:55:19 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::8648:3a6b:af5c:b6e6%4]) with mapi id 15.20.9499.002; Tue, 6 Jan 2026
 10:55:19 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>, "alex.hung@amd.com"
 <alex.hung@amd.com>
CC: "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "daniels@collabora.com" <daniels@collabora.com>, "Kandpal, Suraj"
 <suraj.kandpal@intel.com>, "nfraprado@collabora.com"
 <nfraprado@collabora.com>, "ville.syrjala@linux.intel.com"
 <ville.syrjala@linux.intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH 02/13] drm/amd/display: Fix color pipeline enum name leak
Thread-Topic: [PATCH 02/13] drm/amd/display: Fix color pipeline enum name leak
Thread-Index: AQHccLbz3oApN9VWEkChVB2mKm+He7VFE/Qw
Date: Tue, 6 Jan 2026 10:55:18 +0000
Message-ID: <DM4PR11MB6360FBB6643165194DB9C70BF487A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-3-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-3-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: harry.wentland@amd.com,alex.hung@amd.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|DM6PR11MB4595:EE_
x-ms-office365-filtering-correlation-id: 3d0f4695-ad60-4f14-e4f4-08de4d121501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gpl1dMRCapZkkKTZXdCe71hBrKyKOWN+UQTba00WHQH9Wx7//y3cHFO0PDn7?=
 =?us-ascii?Q?34HCZQ+wNrqWkbDba9yyvE7YiwVEVS4UleLpbiuE1sh8omLibPk70Yk2dALm?=
 =?us-ascii?Q?llo56YAvF7gLh3bwovrXoKBlnQqbZiMVA1nYxJZaPPj8NaYwvKLhyQCuRdXV?=
 =?us-ascii?Q?0dW/ZaRpwfjjbrtHe6po0boZw1VO++V2+gx1fEJJa70gTGU5uC3p0YqFF1FZ?=
 =?us-ascii?Q?iCIgPE0aygTBI/CbniTUC8XxO3hjrBr3bQoyKmXlPnfSN3bL0hvJQL9RKsrP?=
 =?us-ascii?Q?gUZPFYJ5G7PC6I1TkGwr3UB2GTTp2cpgl0wiHZOyltlroTnatYlR21M4TAVK?=
 =?us-ascii?Q?vOqwgoHlAojMf1SREsOIKpDvtSeoDJYXznbtyCmU4CectyXHruQsHg2GtR00?=
 =?us-ascii?Q?bIv9S0BLNQcjP3l+P+UuteFNfWxMLtnKTzhtTID45Kyq4lJ/zqsq9BDiVNRE?=
 =?us-ascii?Q?ulbC5VGNO2vzkMwI4K8MDRB9DoS1xWBqq6y715BfqifumTApqw4bnXJU7jPf?=
 =?us-ascii?Q?jrJcl9MD9fW3zQ7he4eowUckpdm1KWsCA0htRALnZ7CMaANDGSbtKkejy/Hl?=
 =?us-ascii?Q?DdI65KIeH2stetoUDRma8YimTsaqns0gUYChmks8mYcE9FKZlsMRBx1ECa+h?=
 =?us-ascii?Q?WAwtEF0w2B4F/fyNFECs/OK7srWqisoKWHxxuqJolAxHJrvifWAgejyHHW7w?=
 =?us-ascii?Q?WGpuxrOSyL/emMMT31sov8pWG/IJ5qqKjhubJfTZZLT0Xf/84v1OUySfWCv1?=
 =?us-ascii?Q?zHWFPp4GsP+LY2YCCXfT8zxix5PcD6reZ05RzNIw13OQXPhYhPZr/ciuFt+r?=
 =?us-ascii?Q?6NF3wxU7LMv51BGW1+JtYf8rNEcUmiSoGypKt6sznsyR0TiySXllkDb5JA79?=
 =?us-ascii?Q?p0x5fkKuOxi8ZhgEkSJOQgis91LHgifgbcX4zo4hRzurvMc2S465AZmi9wKP?=
 =?us-ascii?Q?n/bllx9k04DMO3lVvdV7e24IYEpfFbbMhx/cDmMYUomwA/EMr/uDS6U34OmV?=
 =?us-ascii?Q?cq5p2Hrov5zNCahCXLjgaYVTBybRfDywTS0btJfO7csN6uNaXDZJUVrdmgDK?=
 =?us-ascii?Q?v97A8B3F818wQj2CBKY8N+1ikL3mQ4nEGlgMQi47DQy3Sf1fEyuNepQR6WEp?=
 =?us-ascii?Q?jvO1gD9JjVLpYTJx0YAMIxIwxnmLx/NI/UzfpxCd4uOrVwtvLihCDWC5xSyD?=
 =?us-ascii?Q?1XkMf5ukFer7NZ52ykfmWAlqSFSw7RRbSovYRZ89RB+f2TAXVs6gS2B6IcnC?=
 =?us-ascii?Q?nppk2YaplFccmPLoyvjuP9SfAuxyPDywLxAcbuKxdqZudGP1+zJnZl3ICoK6?=
 =?us-ascii?Q?kuCo7hNosDkK2y6gEttimqgvytjhmmZp2vepleH7+e8+L4PbMukIbtnRgc6F?=
 =?us-ascii?Q?4G0qYB2lCAJrW4rT3BtvBLxEHlpH0ybMHR9z+dnlnus9wDWmUlUBSqbHjzvB?=
 =?us-ascii?Q?zdpQ2rXLDambM3kSwomBfUJ/5a7QuRiQYGcLiC+qig7Y7MrG0wQbONovxzm6?=
 =?us-ascii?Q?+bM6VWQWUPoDmQcoLOrSqxUHqnLE+xSXbboU?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R+JsfaidhHfI7RG/TSY9v/FOeZl9ooIxDTYlI3JGrAZUNF0KApVgyHqV3Kmg?=
 =?us-ascii?Q?AOlk4A9pqSPSXZms3oqFVGH2zZu7QHdjs3Z9MXxmEF3VaW/LK7kfWrlVjXLq?=
 =?us-ascii?Q?vpkR+pmQUbud77xrDIvTzSJTDQYbGda3QM6kYeaV65msTUrw3SzIoJBIxSyc?=
 =?us-ascii?Q?/aJRIO07DxleEdnJZwXyYDKYcphimB5HD0QfJ+ler3me7v2YWyMcJ+0MUBaZ?=
 =?us-ascii?Q?6CaeFWlUQoPl//FUgNa4Qjy3PVv3+uyLezv4KgkzvGd8SlrpxtuWN3u95aVM?=
 =?us-ascii?Q?NBhv2H1UjjocHmaCngCMu1DcrZFoI9bw6sNmVVooZjVncHq0X4R8Atz6w3og?=
 =?us-ascii?Q?bjm9HJafTkVtjNsM7rcie0oPO/BnN+52pxfnTNM8tTn4zubgtuonotYdyB4J?=
 =?us-ascii?Q?TBh/oF0Het6WPqT8EvD6sWBs/L6vnwQCGf0zGFd+CYzuWNY7Eee3Y133DGF/?=
 =?us-ascii?Q?MeRbtUuhCq/y6/ebCGSMkLQW6eBG9+GJ0j6UZBPgvudKQZU5J5Jhqc4iFYtl?=
 =?us-ascii?Q?LQW/LAEWu/NzliAzoGaQNzGek32gKaU6Pvi9A6K3mf9NgjOwKAejagyvm9wp?=
 =?us-ascii?Q?1zFcNDIEWW4iIyX1DW45yZJZJZQn/1eSBuMSChjZZaL1KDiti8plGSCzGaHd?=
 =?us-ascii?Q?3YDE1P7pg2jThgEQyUTTvmcasp+impe5QsxjRnM7z3OijWcXtzI+9u49Z0N5?=
 =?us-ascii?Q?hJCIxexJmGSg8UBO9Ke2BZkJxJ2/5wdiCeTE3AoSoAMF6ojhDgWPW0mvkee8?=
 =?us-ascii?Q?lrr6cyVACGUZYmaHV+QKUSycPL79iwxx4/245NSsvPA4gTunC+aYQ7VHxfwF?=
 =?us-ascii?Q?fBwjmp6yLX+woO91XCGRcPxUqCVimWKZKv0CYss7HnvPqucVjM9yrJMyBdIu?=
 =?us-ascii?Q?0QWhi4hLtZQDncMDJI6V/fhecJhgSIWTWPzV5hYHGNymqFUhJuXPafodqDty?=
 =?us-ascii?Q?citbgtuj9Lu/hw27ONkt4YX+c3vGEozOlgVKuuhjh2zQ5yJCnqk4oGi4pj9x?=
 =?us-ascii?Q?/hzJ9E0hFg/asqlmv4JAa7aDSeuADb+pRaCLHPUaz1ASbrt86ulcuppew+1P?=
 =?us-ascii?Q?0GwJ2q4G00L3941oGy2h6+bs6JuSVZW/TZvjoPjB2zr958QJ4dQ1xpKilky9?=
 =?us-ascii?Q?wosmYsoAjyK4MDsSVAOdQaMd4pcatQyjYNSLH4VXps+bIxv2Lq+yxGxY4Oml?=
 =?us-ascii?Q?Ydg1tzqnfkfUnmer1JRZ2F1JgQJu537o3C4GWkQyHZQ4S4gNWLYTbGOMqbfq?=
 =?us-ascii?Q?+o/ncAYS1vzognyDgXcyIQ62CNlrpPwwS10q3gGSqdh2eZJjUOofcRwLhTDH?=
 =?us-ascii?Q?iqgXgAl85vWwn9z2vuiQlnB0JT/BHEGiA2sumK+VnZnIsQEPri3i5tr7PvC0?=
 =?us-ascii?Q?L9DKdjozMNIPY1yMvAEyAb/C71tonnkfvE1DnOi3qfHhXRSVktHZR65Iv9IX?=
 =?us-ascii?Q?Om9+kj63uWA8f6EIhnBdPBN0CkLa4VbkwQIEhGG31NU0IIVoo6P2Rm5NG06U?=
 =?us-ascii?Q?6VyeUtrTHLqlx86OAS9V/aJQ1aS8inaTvto/5Ikfmr/vVNmMEIhd6HECCInP?=
 =?us-ascii?Q?sRxqGR8IRlaFU4DeHXTa/HpGm15l2NoBolhNmXOIh8n3SpAiwHMAVTEX6K8u?=
 =?us-ascii?Q?u/Cbxdjfp8TwjORS4zctfv5b6rCAvRZCdrps3SKxnF3htMYUQeEiU19FBkV+?=
 =?us-ascii?Q?pKkp4QO3PSL8kanCYnaxq6dUZl735KWpWnH16TEUZY6KBbU+zgCSgFnQZnKy?=
 =?us-ascii?Q?ZuShiudLQw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0f4695-ad60-4f14-e4f4-08de4d121501
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 10:55:18.9955 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 44C+CctY8jnL6IxjpgURq5m8QmgV5UDo/miCRtCWekKQDeF+8QVakklYjbTeUt0zKccmFA9vsWVV6WQOM8qe6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4595
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
> Subject: [PATCH 02/13] drm/amd/display: Fix color pipeline enum name leak
>=20
> dm_plane_init_colorops() allocates enum names for color pipelines.
> These are eventually passed to drm_property_create_enum() which create it=
s own
> copies of the string. Free the strings after initialization is done.
>=20
> Also, allocate color pipeline enum names only after successfully creating=
 color
> pipeline.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

@harry.wentland@amd.com, @alex.hung@amd.com Please ack if looks ok to you a=
s well.

Regards,
Uma Shankar

> Fixes: 9ba25915efba ("drm/amd/display: Add support for sRGB EOTF in DEGAM
> block")
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c   |  4 +++-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 13 +++++++++----
>  2 files changed, 12 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index d585618b8064..a2de3bba8346 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -79,7 +79,6 @@ int amdgpu_dm_initialize_default_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>=20
>  	list->type =3D ops[i]->base.id;
> -	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d", ops[i]-
> >base.id);
>=20
>  	i++;
>=20
> @@ -197,6 +196,9 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>=20
>  	drm_colorop_set_next_property(ops[i-1], ops[i]);
> +
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> +ops[0]->base.id);
> +
>  	return 0;
>=20
>  cleanup:
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 2e3ee78999d9..7c4496fb4b9d 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1790,12 +1790,13 @@ dm_atomic_plane_get_property(struct drm_plane
> *plane,  static int  dm_plane_init_colorops(struct drm_plane *plane)  {
> -	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES];
> +	struct drm_prop_enum_list pipelines[MAX_COLOR_PIPELINES] =3D {};
>  	struct drm_device *dev =3D plane->dev;
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	struct dc *dc =3D adev->dm.dc;
>  	int len =3D 0;
> -	int ret;
> +	int ret =3D 0;
> +	int i;
>=20
>  	if (plane->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  		return 0;
> @@ -1806,7 +1807,7 @@ dm_plane_init_colorops(struct drm_plane *plane)
>  		if (ret) {
>  			drm_err(plane->dev, "Failed to create color pipeline for
> plane %d: %d\n",
>  				plane->base.id, ret);
> -			return ret;
> +			goto out;
>  		}
>  		len++;
>=20
> @@ -1814,7 +1815,11 @@ dm_plane_init_colorops(struct drm_plane *plane)
>  		drm_plane_create_color_pipeline_property(plane, pipelines, len);
>  	}
>=20
> -	return 0;
> +out:
> +	for (i =3D 0; i < len; i++)
> +		kfree(pipelines[i].name);
> +
> +	return ret;
>  }
>  #endif
>=20
> --
> 2.25.1

