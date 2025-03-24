Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD5A6DC6A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:00:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7B2810E42E;
	Mon, 24 Mar 2025 14:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ablk4Jbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E0E10E2FD;
 Mon, 24 Mar 2025 14:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742824806; x=1774360806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=ablk4Jbic8GNN93DswV2YSESrUo7m9UXHjf9qK4DP+U8c/4LgOUXgFYP
 uBxMV4R7wAmQx1Z7B9RWFHuG16Hpkp/cM4i3tO5OQ+XWDhdty1/UOmdQJ
 vixk2XJWKdbFRE9y5kWpa6IJA0PcMKJBrKwma7N/yGIrZZs/fMMnQxaf6
 I2MMIeV8L7hLQmmLQ1MjXTJXOCSrTLI5lH2Tiket7hKWsRMSg0SsHMJ5s
 nTAzZm8d4i4P6ULi477XzUCAoik1w+U/NpTGlxyCk/5FylNOJa3QM4ths
 /zcm7hh5gE8ePBJbLdrmhXaKuDtd/R2dFFVyaFkZp+AjnIdDfO6wemNRF w==;
X-CSE-ConnectionGUID: oQzBANVqRRGCWg2AwgrRVQ==
X-CSE-MsgGUID: 7pvVG2AWQdS9pP7qed6kxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43756396"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="43756396"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:00:06 -0700
X-CSE-ConnectionGUID: TME4nAqySF6eokKY9ZrthA==
X-CSE-MsgGUID: QXa6jpsiQia6ol9kmki1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124219662"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 07:00:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 07:00:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 07:00:04 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 07:00:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N53iO6F5vws8sph8BWQCNi7hLK8RpJLAF+V+Ll8Oru73ZmZ1ooWjYe+H2Mh590u11NIzVB0ivmhPidGUFdrlDY04O0eGk8B0x4a8BLu+3nzClia9oNxM99DaV0FqxlL/E56mWWzOJCzW/qGlF8PjX8eSNlziqhuxrd/oTI6z3jx+d1AVoestgaBypYcw1M/QdPX2YY1U5oa6vvlbUXyo778LM/e8hXrx2hl0SbzOelvkchYNI+2H350jaMX/LFQlA8K/IeOn4D4Jxn1ZuX2LfJumxkInNfDO+dwwIZTXC12v7uA9ErCGLUtMrhekyuLgJDGF/iAESZ3GXKrzLD/pTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kvAlzzV4qZzdRaMyXkl9CSsfRvnNaEtjCA9htczIKxc=;
 b=MQ7EzHU4RlosHcPWk3NSCHDdWUnTVio024V8PeF/U1govCZULA1nZlG8BiSA+SbHF8o6GO6Y102+OVqN0BO5T9Pb1R1oDtPSM6zul49GxA2yCoJMozE4K6R7Qlh1h3PdMB46Wc+OUcMWvHITbDA0uyOWd7mtm11Ah0O4wws4MoxhCophSGuexcde2B27vUZ31gbAGQdbscUVxSzs/B9xCaJxq5h1dFhdOvb0T1PEji0man68z6THbA3lUZILlXRR1gFhmBAKWT9+q4OnUs1Cv+0iMyXaurqWq/l438RCZ9JyMRWgb89wWeCinpQg7TI/lSxhjzfWXJbDuDSVjhCU5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5275.namprd11.prod.outlook.com (2603:10b6:408:134::24)
 by SJ2PR11MB7716.namprd11.prod.outlook.com (2603:10b6:a03:4f2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 14:00:00 +0000
Received: from BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea]) by BN9PR11MB5275.namprd11.prod.outlook.com
 ([fe80::d113:e69e:54bf:3fea%5]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 14:00:00 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
CC: Tvrtko Ursulin <tursulin@ursulin.net>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>,
 "Mehmood, Arshad" <arshad.mehmood@intel.com>, Andi Shyti
 <andi.shyti@kernel.org>
Subject: RE: [PATCH v4 00/15] CCS static load balance
Thread-Topic: [PATCH v4 00/15] CCS static load balance
Thread-Index: AQHbnMDyo2/H5PKdv0OdRIWz9WnlFrOCUGBQ
Date: Mon, 24 Mar 2025 13:59:59 +0000
Message-ID: <BN9PR11MB5275609E06CDE81E25645401E7A42@BN9PR11MB5275.namprd11.prod.outlook.com>
References: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
In-Reply-To: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5275:EE_|SJ2PR11MB7716:EE_
x-ms-office365-filtering-correlation-id: 9535f531-a706-4979-427b-08dd6adc2ad0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?FBpyg8t6VV+HUZXC1VdXK/JWeLb35scsKRlQglt4oBPIF6OR7EXM1OK2pxuy?=
 =?us-ascii?Q?aAsZAjP3Y9FgSYIN94DibT3oFYsL2zbHu0SCy4rZ3dyotlc2B23kAgv/ZhET?=
 =?us-ascii?Q?emHvdaa19K4AqxJDqCNIo7VwEWnsATCCYkJTQrSOY64HgoFeW9Z3386hQtIc?=
 =?us-ascii?Q?t8MSW0AtpaYT8ktjeVW0dT265dNHq4W64+LIKuRlQgNof5IzfI/tpGHg18Ep?=
 =?us-ascii?Q?t8Ej0tQ6xPKK10nfrk12SSqwaiqiPIS/VDiv4EQwvpkxXNjY1X8AFx4gkoh0?=
 =?us-ascii?Q?BFqLCroWR3fcbZd9dpec1Oo2FR7YcQw3UNXetmX8Ge+5TbXOP+uuK3rBX0S2?=
 =?us-ascii?Q?ZIPp1otQP3tW5eydT1Z+l+vfQdpXK3mdfhU8LHoSd6XJE1bHUvNAOGBNqIYq?=
 =?us-ascii?Q?4rhcchM0Vaxr2lfTRAAlTywqqOXGD5cC7SGKqyZAMrJPECqqCRvmlXP4FUg2?=
 =?us-ascii?Q?XmxnQi5k9BylQ89KC/DiL0j0lOb+LX+cwsU4HT3oLufnPg8DMsmTP1Xt2sVY?=
 =?us-ascii?Q?ktlyXiNIyGowFotgAtdzbXjzQq6fy88k9N5ZBY6mTTgybrMTmeTQo1KzdZSj?=
 =?us-ascii?Q?7e+ERcJPZIGFYTYRyhEtbKYM876HmJEG/gmufy/U0dDjCYJ48Fx5yX7YREp/?=
 =?us-ascii?Q?efRRrWOUmQ92izvhlxbbOpkDzwxguPN/8tQVc5vlzzvk11MjYJ6LOVObbGSE?=
 =?us-ascii?Q?Z1fL+emh4G3JPTwM9PJVv4maiT9NvRabDfDukWe7nCUVcyhk3EpPcMElXXV1?=
 =?us-ascii?Q?m10/1j6X4ptx127ckOYxg0mpqoN47IX7SczmOmtThHhFME+r9aU8qj7mQYsY?=
 =?us-ascii?Q?oLAi2+LOhbUq9eE8ORv38IJTRzUAf9MZycKn+6dST+Mb+sImgUE/nTUu+znJ?=
 =?us-ascii?Q?LsZFBU1bHipyEuYFDa734vNZPv6/IbEAc90XLgeutYKLiqtPtJo/DmKocq5O?=
 =?us-ascii?Q?8+nquhqpCSUlxOIKZ1Hlh6cbaccmlxzwshiQmxlu/UKEz1gkj+CRB5GupohA?=
 =?us-ascii?Q?xrqOFJh1iVIoOh8QuR7tsxa9QKDt+j5yI63bWLlXWmxBHieGfM3GMIOjym1q?=
 =?us-ascii?Q?sLjS9VzHtZrPAI3+bXt539hQxoyWt71TlCQbsxp4aMOclhIYMmb3/PHcYsuj?=
 =?us-ascii?Q?2JLLBtwfrJAv9pFe8y2NtgT8BTMFDf/i5/jhYGvrubebtu4RaUfOq1DkTwtM?=
 =?us-ascii?Q?cL7LOWCT73h3UNMeKF5aCOW0uysN8bdOI4A8Z6A9n5G3s3JehtwdJa0XqcTz?=
 =?us-ascii?Q?CkX2u+aI5EuJ5Bf354uw3b2qci++7bbTsUU37uZ5lwk6TM/e1vrFXwciNfGi?=
 =?us-ascii?Q?cSiAyEBVK0ohmspGfcrPmaTb9U11ur1IQql2wAOkEti2y6jA/2CEUgZT0slR?=
 =?us-ascii?Q?gcc1MrVOWdUPFEc0tNR3Zjn+NE0E8sE2rITQbsFCyaP5hgqQfUEeOrvCOVQr?=
 =?us-ascii?Q?nvH79bUl/xoVYgF149La/Lsv7YE3T1fs?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5275.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?em9ImcQc4oLu9fqoX/N0yNVHZNN2kpV4jrx48wSHbw/qVYz3dHdOeVUyPf5D?=
 =?us-ascii?Q?Jk3kJYE/g/zLbkutuCsrM9euQh0mXa6dd1I0OXuV8h331SZ/AQNsaWaecqbD?=
 =?us-ascii?Q?dzcjFJBkPGLH7IPROgvIljp31w9XxDjodQcmExITD7Pzhplmf4yh9BuiFasc?=
 =?us-ascii?Q?VZCEgY1FcDR4WdSIei5AQ8Q1K1OVVMUq6+8495zFTp/wXpbRWF/QK8Qf4RMl?=
 =?us-ascii?Q?Mik84HKkpSwmXvAxaeWvVZG90+C3wNKs7f5GjA0lcNhgBYLcGoTo+YcE+jTR?=
 =?us-ascii?Q?5PzQ1bfzzET4oYNz3giFlik7U+IeDe7t9Uq/tsW7Lf2a/AdeSQDo9ogsgTXg?=
 =?us-ascii?Q?7ll4Izl2P9QfowAHUEBA4pliP6eoyAbicLD5z2T4bRVeVko1XYGXnnlzE7f8?=
 =?us-ascii?Q?oRePVV0FEZcm1QczxTFMpGnhScJcYMt8P3maumrWk6hQaDjdrVoS5/6TjRii?=
 =?us-ascii?Q?brxAmtB0aJqHI0szEpjq0FK6IB67BE7jzl5wVwRmQho95qu5vI4YCbKqHfW8?=
 =?us-ascii?Q?kE2/PhGl3lnCJzq3Sy6W4kUfR0SHRQmvqP1G4MMTPr0hHcHFqtERSFe6DOpo?=
 =?us-ascii?Q?Lq/+P6Le0DlRO948JJfEg/lS6TzRFwJ4Le90MaSH4ikK3FKPtTV9DnL3BprB?=
 =?us-ascii?Q?Jq4TvKa/zW8ZPlt/SZnUjkwvxJfHQCrSpiRxMvV3+RvXs1gFhoIpD3iuLNgE?=
 =?us-ascii?Q?6VRFwa+ph/TtFRhdmSA2GkTH9S/FmulT17sizbPJdjL+QUXGOys2QUhXNJuk?=
 =?us-ascii?Q?3+N+Nb/g6U4mRfyz1zSCdcQfuCHNAk94zq+tTlSssm0OzhICicsV/Y65uCVZ?=
 =?us-ascii?Q?9iQ7FhlSmjTt3qeISgPPVjdgyru2X9AXCJdKPlbsAYIHNTEqDSZffxhglfxR?=
 =?us-ascii?Q?z4GAmPOdkVBelmgc6r7sH+LKOFbP/i5OCu4wzGm88xaa2f9TdiON5Zqoh4M5?=
 =?us-ascii?Q?jrIQVbNNCF8VpC5k2JhBgkCkAF/E3rkfh2eEiNFTbkGofUUa4VGLmKb3NrwP?=
 =?us-ascii?Q?HfO1EGVufMfNulRTaTiE9STky5FanH2MQ9Y39iMqeiuSLWOzmScJvJwrTe4y?=
 =?us-ascii?Q?WyQlxa3Mabt08Hkh1Fx1mCDSmJtDYtIyZZqQCP2OJp8BNgE5rQjq9iAf1+S4?=
 =?us-ascii?Q?ChC1/7owLWKv+iDEtGMxQ1Gndjvk9rXtebS7M/k2hP4+lHMLetn7MqPrib38?=
 =?us-ascii?Q?+kXAIggbnmxtjaSf3Fct2/40QDfNvCp6ir1SiN1pUSSfiOZvpb4W1E/vdZXD?=
 =?us-ascii?Q?7yXFjQT2wgZJqp43HV/5gMgrZ7mVM/g+v70odVN7EIAcjb/n8l9BdpVAJNqe?=
 =?us-ascii?Q?3LsgO+pjjVV3GsfSMcohJaVQ5sgs3CleiV8gPeh1ZECisU45Nf3G7J70qpda?=
 =?us-ascii?Q?Di2Q2+pABV5nzxl44g73xgZA5aMV8UC/cnbODjA2VjLTNub6sLGKPeGCk5hV?=
 =?us-ascii?Q?VKpqaZkTskHhBHoASwf8NvGXKX4XRZCzDRV4CVl34vrkRPnkeNoXJCwefaoe?=
 =?us-ascii?Q?N/M4xko7DQsngg2Tq2Yj5orrgtuI8xHKcu/OiIbvunJyZWKFGzO3rGl2ooJh?=
 =?us-ascii?Q?FWyh1pUX3i3f6E6Swa74YYf2TcF8TLzkcyTM42si?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5275.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9535f531-a706-4979-427b-08dd6adc2ad0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 13:59:59.9567 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fbDxfis0H/JcHHgl/CkELtBFXwOKjhtMZm28eSmFMlhXFfmn2PZ0M3TfjXiRHXSW0bdvYn1ktfqDZdXgu/Pxfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7716
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

Acked-by: Michal Mrozek <michal.mrozek@intel.com>
