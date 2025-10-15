Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 313E0BDC9BC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 07:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484EE10E042;
	Wed, 15 Oct 2025 05:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mhHLbHmV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67A110E042
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 05:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760506651; x=1792042651;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YUg5u1siGMavR0/88pOESd/Hd0ukD8yVQ1g3ovNxVSI=;
 b=mhHLbHmVN5MN8+NG6gVYos+Cy9QLNRbxQDyYSgdqhD5d3ABGac6VKx3d
 Qo+psbaKcdjV5Zo0KOcVLsNSbx/ALU7hmXwK1YidztdaTCLr/ImmOXuFY
 4s+bN0aWATza28Crnee4KsQt+mshl7WtVNcWi6XSvYx9LzgeUYsnYlf2+
 aOHR+92zTSAy7vsE9h/JHfvcLfdBxcCBlJa2pxYlZEnEG684MgnNVSdOb
 nJXkfBovblbQ5B9ZlPugCU+vkh//NBJCriSG9qFonw0UWK8rQv0N7GU0F
 XMiiLFH0d9BxevsBG9PoqgyxYKJ8oJs5Aq/u47JIH253aiq/94kbHo9RB w==;
X-CSE-ConnectionGUID: YheWzMDxTwCLGgqj8sPsiA==
X-CSE-MsgGUID: KJOeRAWTTt+Afj1/eExvuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62584542"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62584542"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 22:37:30 -0700
X-CSE-ConnectionGUID: om2FB+SNSoq86cs9znuj0w==
X-CSE-MsgGUID: qq6cAV58Qri5/QDYjiDK8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,230,1754982000"; d="scan'208";a="182021135"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 22:37:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 22:37:28 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 14 Oct 2025 22:37:28 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 14 Oct 2025 22:37:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wYbVu7HysbJTyUAhAj+Nl3qpAPd2A2Y++yTcnr33VL8Hd1salEqQ0+0TCTaoJPYH2ikKdXRXhWHC5Mfo/fMeM5jE/bQ1xZLYzFWgbNLRBz/BCFuHwGxhDjSXCjMC255qmiyZKIQhrFqXJoFjWOUsuo2FzNzlXs102LM3glage0wdjD2WVoRBN8wOGV3+vMtJKzxCrnqD37XPzjxCOfM93Hi5Az/SqVfmvtCe0detG8YTJG0lxoXdtp779EG5O1Nc4DMj0dBtnyqyTuNsEjbuPiQJZ+3vU0RzSmydYFt3R8rmxlyYp3P2rjdp6JDUgJv6P76yEE33kUyuZEhktP042w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sbOSaRwchsK6F8XKlCg2qjjwXhUQComFoLL+2i3hYjc=;
 b=ijmHEfbeMe6Fzi0ZD5SVhbgtgVvB8jjHZ6kqWsMgiveGjVIVddUVpjRpEyPF59QV4Fi2xWzdmDoOV2Pr6Sg8TGqDxeMYlm5GDfg3DHvR5fwBY4iBdGGNt/PV1NUhOx8fR1H+ni3Z9U5GQAdVUqs+FGDtUKodUZq80KQmqg+BJJ9oVT/Q7uy8sbsyrWKaWjUXLXCjgwhwGxYtaxVxAG2uehtWOqWz1xWvw9HN9sPGqljNV9TgmZmQuyrApLKTayBcn2iUYTSC7Wobv6r2NnQTdbMNQBipBHkTa6TaPYY871qFpw8xVRI1m2rf24+NL9YehwwJTAWKsNAgMFGjOkmc5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7177.namprd11.prod.outlook.com (2603:10b6:610:153::8)
 by PH8PR11MB6708.namprd11.prod.outlook.com (2603:10b6:510:1c7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Wed, 15 Oct
 2025 05:37:26 +0000
Received: from CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105]) by CH3PR11MB7177.namprd11.prod.outlook.com
 ([fe80::271b:c621:d244:6105%4]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 05:37:26 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "airlied@redhat.com"
 <airlied@redhat.com>, "kraxel@redhat.com" <kraxel@redhat.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "gurchetansingh@chromium.org" <gurchetansingh@chromium.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/virtgpu: Use vblank timer
Thread-Topic: [PATCH] drm/virtgpu: Use vblank timer
Thread-Index: AQHcOFTh4O7Et3uiykydidDxo4mQL7S4trEQgADdw4CAAJRHwIAA+HiAgAPmsoCAAMJHAIACVYIA
Date: Wed, 15 Oct 2025 05:37:26 +0000
Message-ID: <CH3PR11MB71771983D6F3A6E567E1904AF8E8A@CH3PR11MB7177.namprd11.prod.outlook.com>
References: <20251008130701.246988-1-tzimmermann@suse.de>
 <IA0PR11MB7185D91EB0CD01FD63D21AA7F8EEA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <dd80279d-5469-42db-bfa0-7b9ee3323bc9@suse.de>
 <IA0PR11MB71850152C033B443032AA519F8EFA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <76e2a961-1d3a-411f-9cb3-625be048f4da@suse.de>
 <CH3PR11MB7177EED8239AEBF875AA3389F8EAA@CH3PR11MB7177.namprd11.prod.outlook.com>
 <8fa40ad3-b848-4cf1-8515-7dbe05bb3136@suse.de>
In-Reply-To: <8fa40ad3-b848-4cf1-8515-7dbe05bb3136@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7177:EE_|PH8PR11MB6708:EE_
x-ms-office365-filtering-correlation-id: b86800ef-9eb3-4351-bbb0-08de0bacec64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|13003099007|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?yUuocWG9p51ABF6v2h8KfVCixSQS6P3zZ+azUPlktKgoPUdWcL2jTW1ger?=
 =?iso-8859-1?Q?W6Kts14syiMKkIVcRwIx8cQC0CR3BOYbQJv1VS83dvHXEL/b/hhaLT3idj?=
 =?iso-8859-1?Q?WZjZfCREoF2ZNJUM1sTkJUm8XhrkPNaEjqdNVrtiRWv3WT0EPaS7b7QpDv?=
 =?iso-8859-1?Q?mooQy4GC4h6VOHBCDOG92ww/tu7xsYXil3cAVKR+H8jFZb5+/6+JWFyali?=
 =?iso-8859-1?Q?MQLXpyJSEcaYWdn/rZpn4tpAfwwxNAyP+OWpWDzOfC6xWlxUGTd1Dz6ubT?=
 =?iso-8859-1?Q?Bqun20A0MM5wgx/rlTTEdESINgeLSjQBj/2PmJPCOUs+cijwoM/viSmdfq?=
 =?iso-8859-1?Q?/7OgF3QW3/ingrPYXlIXXHOQ42CtjCJE3aeMxrpz5J58y4lH9ocwIcTE2o?=
 =?iso-8859-1?Q?Q+UIP4/fnzXncchJIgOJwK4xNBnNF28LcCXuPIrgNBPJJEttKGFsePcMLf?=
 =?iso-8859-1?Q?i110/QcfN3HB2nzssU56iiiTmDrr3/ix4gNre8xaeMepHRugbOTJwB4ZHa?=
 =?iso-8859-1?Q?bAt3H7N2tqGKyCzcfbvXIuXsMB//jYtinUJR194NigFa46ToaPOgWtap4+?=
 =?iso-8859-1?Q?M7pTLY0MXFB4WfqFzDvYueQmMhVb/gonnYxGnnMjtHPDddV0D1KpUWNuvG?=
 =?iso-8859-1?Q?Ef+ynKT+DCpLPIQy1oFGFNQEY4za5vQuYnNhmosyDf/3lf9If/RjOMczZ3?=
 =?iso-8859-1?Q?fwg3J7Iws50dUzorf1VDE/uhnB9lovntyhKf6KkOeBq6W+4hLacfBLCrs7?=
 =?iso-8859-1?Q?KcJL04ihKhH4Uaa6tQ9s/vJJdDIo393/KE7x6eWQPZMtaqKdtYJP4mmn3C?=
 =?iso-8859-1?Q?c/HhBwxExLS92HLmNPajR1WB6Hf5Ewam9Pl5IWK7FH0JfWyiZPPMz1RW+C?=
 =?iso-8859-1?Q?PiHl1PLHkTc2WhTiM5vS5WwrnQj5wvhAQ/kCprEnf6tISzOy1aHKMB5pnm?=
 =?iso-8859-1?Q?bGjITFLDy4m6nOkeQuVjoC96cR5BUh4eOKJ3clRZDJbD095o8XHDomwnKL?=
 =?iso-8859-1?Q?5JL2BbFCYuDnOgdz6suQTX4eorjPaSIyT8uUPFJLnsYKIaeDQ/iK7BiG4i?=
 =?iso-8859-1?Q?4p3n+L/rU0HKIph69e9saz4Qo7LNEcwvapJ/6TFXIejB4SBwYxA5evgrTH?=
 =?iso-8859-1?Q?zqzU/Kv3ERSaGjpwxqv6Jj/hApuUVWHnkN/A5rvw97b0TG2inH4HHhV58Q?=
 =?iso-8859-1?Q?kxGhY3bVUzfIN30Cliz5X58EfKCvGxZdjrDnpOwhyiXOQ+5TEnNuMJKRv9?=
 =?iso-8859-1?Q?pFUN9uGcY84cUkI6t9p3MboYpPMvf1qNvNZMKms0kmYLmYd5J7WTgpFGap?=
 =?iso-8859-1?Q?XlNhhLjTas/mFHWZRyDBK1o0PuPIOvbkeEAqkQnVhOh9j36y48IJkdMXgW?=
 =?iso-8859-1?Q?Rq38k2wOTF9FQVnFDMepBinpGGmWZVqs9BrTrW8Wy14hzywUMhUCaH6z+G?=
 =?iso-8859-1?Q?B0tg3FEid8xTwWoXCLSeOPxVjBWEVRZJRMCFjcn1TFu22ZgrSoq0d5iQBd?=
 =?iso-8859-1?Q?B3bAhrjJWASssPzoDhm5EyiYyzW1WQqmrZ6QJV8g7i/w=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7177.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(13003099007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?J56YWkLS/j084LFlC9owNTp/lZLyCv1+bUHJM8dZiTmbsFXCC1Seabczev?=
 =?iso-8859-1?Q?ob3XEUg2rj/T3HQ+uecl6HMuIaOxA4oeap1Pw1wYIyxyN3pGehPLS+VMZN?=
 =?iso-8859-1?Q?8+l6Wm1S/CKph7GfbJYJuzMbHEX8fywuuGs3edqxELdlYiMRuZqQp1JmqD?=
 =?iso-8859-1?Q?asjLtgWuW5LqZhCaFi4EfAb9HDcULJVuevTiudt2bNpTK4T6JpCXkh5SGL?=
 =?iso-8859-1?Q?ceUUlAlk8AgLlboXSssVPzAte7Dub3h0X2Li8S3WZsunb85SWlxOSm00R6?=
 =?iso-8859-1?Q?dyVFsxms0AtLIU/2hZIPlUg8ECAqKF/a8QKCoFE88cO3o1x7a8Zt5upByK?=
 =?iso-8859-1?Q?HRhGzR4v3vPQfgD3lJBp7lzHoJ7/pgtQQmy8ZQcWqQNLCBmbpm0l3CHQf5?=
 =?iso-8859-1?Q?aG4NBbrnL+y3iin43ty5gwzfIEhuBWPdS3sZrSsgPKggXKluwZpnYNvSW7?=
 =?iso-8859-1?Q?SBwYgdlwGBwjTPuyunerf3urgurBS6PbPA8y17hE1YCIk2SCWoH4wNg/6N?=
 =?iso-8859-1?Q?I3HWkJwluHbOzo+lX6ZT9Pm8addyUM1RULeN/Cy32C8SzAfIsyvogmX/Ei?=
 =?iso-8859-1?Q?VULJ/qkfo8EnadbaBzFSbeYQR4SLQyozmCwLADh1vjPKlauz6zF3JGqAb5?=
 =?iso-8859-1?Q?FJU1nU9uHUtHKyPB4xEjU7yU3URAsFtIKMTNNqrtmG49cT5zfAR2dvCbD8?=
 =?iso-8859-1?Q?w7zrazzUnhxzrUJ1ovcWPJPIE8s+7L4bRu0o7JJFTmYcDbsiPJZ/h5S9hF?=
 =?iso-8859-1?Q?RKmdvjeBXtHEZ3C4SYuQG4sBOeaIq3KY90s8MrpG3Zn3UNvRqm1xAgTju1?=
 =?iso-8859-1?Q?G6MFLYFMA883KSdL9/VSbKGjiJgEwyS9/wZPh7ROS3SHQgCSGyLam0SDHV?=
 =?iso-8859-1?Q?wkO6qJziqFAzifCmBle0gLskao1FZhd33soB9DlpfgdBVCcyPuFxbL0qBI?=
 =?iso-8859-1?Q?vWQ+EwU3AjbjGSvMhYKbwTJ0447kXVy/ZTZvPSax850fYfmeFd+fXhAg+P?=
 =?iso-8859-1?Q?pxqA4vZXQ50YlnB7n6zGa/cPmyi0BTVbAUiybNhH6FruKSJOZ/9l5KQhnT?=
 =?iso-8859-1?Q?MzVQ2SW9C0QYBwsQLiw9aW6D11tY299IydjwZUZ6G38iN5133uY55kIvgu?=
 =?iso-8859-1?Q?dAkCiFNipotzm2wUwMQkN0ee2EXhKVdIWC2cK/4/+cYa6J/2ZpRewUnd0B?=
 =?iso-8859-1?Q?849sR005l316wfd406P4GhtMN0UhheZM/l2N5frxEVbNn4tLkLOm6IgWPk?=
 =?iso-8859-1?Q?aMcemcCityMAErFKelJ4KECo7RLDTXu3l78T18mct5OgjHeFLJToiAt3A7?=
 =?iso-8859-1?Q?2nfQvMB1WCwp0GJv1DUxTscO+ycHfybp0tTSTGcAnnIjlN/Q6pEwWSFkf0?=
 =?iso-8859-1?Q?S68SyBrrtJIdkUD0/9vAeDJ2k7Vzvt8g0mvAIIMG6PKe2PWyU+ZR5sdicd?=
 =?iso-8859-1?Q?YGJ2+Ou3zThtFSMRbMU0klT3JIS4uK2G0oblTl986sg0E/wFeQIZL4A2Io?=
 =?iso-8859-1?Q?n/dRXmrNbNnYkLgq1OOCYFlbyoc4rhCc9vqTWiDg7q5ZGKZvNOgqfQ+hOf?=
 =?iso-8859-1?Q?3tn62xos/+shIxCcxeLTCGfKlrP39V/dqtB5FIZPgwUKnucBM9GanoIkTi?=
 =?iso-8859-1?Q?lYukpDCowImy3BgLUa0BUfKTGvxmHxALbF?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7177.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86800ef-9eb3-4351-bbb0-08de0bacec64
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2025 05:37:26.1305 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6i4zDnyIefW3yjEr+WebrCTL+vvMgc9SPNos8IVqxXwUpVZuQcOy/V/eSDhVxcWMwLneHlrreLNjK1gOrIOHL0gJH9SxSI70RE/u6+1reKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6708
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

Hi Thomas,

> Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
>=20
> >>
> >> Am 10.10.25 um 06:25 schrieb Kasireddy, Vivek:
> >> [...]
> >>>> Because virtgpu did not initialize vblanking, DRM always sent out a
> >>>> vblank event after the completed commit. [5] It's not synchronized t=
o
> >>>> the display output. This means that virtgpu has always been subject =
to
> >>>> tearing and the guest always required to hold buffers until the host
> >>>> completed its display update. IOW adding vblank timers into the mix
> >>>> should not change the behavior of virtgpu. It just limits the output
> >>> As I mentioned, the output or display update frequency is already
> limited
> >>> when blob=3Dtrue, so adding a vblank timer would be redundant in this
> case.
> >> To summarize my understanding: virtgpu currently generates vblank
> events
> >> as soon as if finished updating the display. Which can be too fast for
> >> blob=3Dfalse. For blob=3Dtrue, the display update is (reasonably assum=
ed to
> >> be) synchronized with the host update and thereby rate limited by the
> >> host's display output.
> > Yeah, that is mostly correct.
> >
> >> Adding the vblank timer: For blob=3Dtrue, if a vblank timeout happens
> >> during an ongoing display update, it does not send an event. If the
> >> display update finishes before the vblank times out, it arms the vblan=
k
> >> event and the next vblank timeout will send it out. The vblank timer
> >> thereby makes events appear at regular intervals instead of ASAP.
> >>
> >> So why add the complexity of handling blob=3Dtrue separately when it
> >> should integrate well with the existing vblank framework?
> > There are a few reasons for this:
> > - When blob=3Dtrue, the most important goal is to prevent tearing (i.e,=
 to
> > ensure that Guest VM and Host are not accessing the Guest's FB
> > simultaneously). As explained previously, just ensuring that this goal
> > is met will automatically result in rate limited updates that are in
> > sync with the Host compositor's repaint cycle (if using Gtk UI).
> > So, given this, adding a vblank timer would not help in this case and
> > instead would lead to updates that are no longer in sync with the
> > Host compositor's repaint cycle.
>=20
> No that's not the case. With the vblank timer, the output on the host is
> still synced to the host's repaint cycle. The guest's compositor still
> waits for it to finish before updating its own output.
My concern is that in this case, the Guest's compositor will be made to
wait a bit too long before it starts its repaint cycle because the vblank
event was not sent immediately when the Host's update was finished
but is instead sent after the next vblank timeout. This is what I meant
by the Guest's updates not staying in sync with the Host compositor's
repaint cycle because the Guest compositor would not start drawing at
the best possible time (which is indicated by the Host compositor via the
repaint callback). More on this below.

>=20
> >
> > - Qemu (and Qemu UI) also works with virtio-gpu driver that is part of
> > Windows VMs where a vblank timer may or may not be available. So,
> > it is easier to support this case by having a UI timer/repaint cb and
> > making the Guest VM just wait until the update (or resource flush) is
> > completed to ensure synchronization and rate limited updates.
>=20
> Nothing in this patch affects the Windows driver. We're not going to
> remove or modify the host's repaint code.
>=20
> >
> > - Even if a vblank timer is available for a Guest VM (Windows or Linux)
> > its frequency may not match the UI update frequency, so there might
> > either be wasteful updates or too few updates. For example, if the
> > Host's rate is 30 FPS, but the Guest VM's vblank timer is running at
> > 60 FPS, then roughly 30 frames would not be displayed each cycle IIUC.
>=20
> If the host currently updates with only 30 Hz, it already does not show
> those additional 30 frames.
>=20
> The userspace compositor only sends the next frame when the current
> frame has been completed; as signalled by the vblank event. That vblank
> event only happens after the previous display update completed. (It
> should have rather been called page-flip event instead.) If the host
> only updates at 30 Hz, there are currently at most 30 such events per
> second.=A0 If we add a vblank timer, it'll fire at the guest display
> refresh rate (say 60 Hz), but only send these events when the previous
> update has been completed; which is 30 Hz.
Ok, as long as the Host's refresh rate is communicated with virtio-gpu,
which is then used as the input to determine the vblank timer frequency,
this should work. However, as mentioned above, I am still concerned about
when the vblank event would be sent. For example, let us assume that
we have 60 Hz as the Guest's refresh rate, which means the vblank event/
interrupt is expected to happen roughly every 16.66 ms. So, IIUC, we have:
0................16....................33................50...........

My specific concern is that if the Guest gets notified that the Host update
is finished at let's say 18 ms mark above, I think the vblank event would n=
ot
get sent out right away and instead would be sent out at the 33 ms mark
right? If yes, I wonder if this pattern would continue to repeat itself imp=
acting
performance?

>=20
> >
> >> Please also note that it's not just about compositors. DRM's fbcon
> >> synchronizes its output to the vblank period. If no vblank is supporte=
d,
> >> it'll happily fire out display updates ASAP even for blob=3Dtrue.
> > IIUC, the fbcon updates would still be rate limited in the blob=3Dtrue
> > case as the vblank event would only be sent out after the atomic/plane
> > update is finished right?
>=20
> That's not the case. The DRM fbcon/fbdev code waits for a vblank
> timeout/interrust to occur [1]=A0 but does NOT wait for the vblank event.
> To do so, it enables vblanks interrupts, waits for one to occur and then
> continues. [2] If the driver does not support vblank interrupts, it
> continues right away without waiting. [3]=A0 The fbcon/fbdev support only
> uses a single buffer object for a its output. Hence this is where you
> actually get tearing even with blob=3Dtrue. None of this can be changed
> much because of the way fbdev works.
I have not looked into fbdev/fbcon closely but I did test Gnome + Xorg
which uses the dirtyfb() method with a single FB for updates (instead of
page flips with double buffering) when there is no hardware cursor availabl=
e.
And, AFAICT, the dirtyfb() method works with no tearing when blob=3Dtrue
because it just invokes the atomic commit (drm_atomic_commit) in a blocking
manner, which means it just waits until the Host update is finished. I thou=
ght
fbdev/fbcon worked in a similar way.

Thanks,
Vivek

>=20
>=20
> [1]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
> 10-02/drivers/gpu/drm/drm_fb_helper.c?ref_type=3Dtags#L372
> [2]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
> 10-02/drivers/gpu/drm/drm_client_modeset.c?ref_type=3Dtags#L1322
> [3]
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next-2025-
> 10-02/drivers/gpu/drm/drm_vblank.c?ref_type=3Dtags#L1215
>=20
> Best regards
> Thomas
>=20
> >
> > Thanks,
> > Vivek
> >
> >> Best regards
> >> Thomas
> >>
> >>> Note that blob=3Dtrue is a performance optimization where we create a
> >>> dmabuf (on the Host) backed by Guest FB's memory that is shared with
> the
> >>> UI layer. And, AFAIK, the only case where virtio-gpu updates are not
> limited
> >>> is when blob=3Dfalse. Even in this case, there would be no tearing is=
sues
> seen
> >>> because the Guest is made to wait until the Host makes a copy of its =
FB.
> >>>
> >>>> frequency. If GNOME's pageflip is synchronized to the vblank, it sho=
uld
> >>>> immediately benefit.
> >>>>
> >>>> The GTK repaint callback is an interface for applications. How does =
it
> >>>> affect, or is affected by, any of this?
> >>> So, virtio-gpu is almost always coupled with a UI (on the Host) in or=
der
> >>> to display the Guest's desktop content (fbcon and compositor's FB dat=
a)
> >>> on the Host locally (Gtk, SDL, etc) or streamed to a remote system
> (Spice,
> >>> Vnc, etc). And, the rate at which the UI updates are submitted (to th=
e
> >>> Host compositor for local UIs) is controlled by the UI timer.
> >>>
> >>> However, in the case of Qemu Gtk UI, the UI timer is used as a backup
> >>> as we mostly rely on the repaint callback to figure out when to submi=
t
> >>> updates. This is because the repaint callback is a more reliable
> mechanism
> >>> to determine when it is appropriate to submit an update to the Host
> >>> compositor.
> >>>
> >>> And, until the UI's update is not submitted (and executed by the Host
> >>> GPU and signaled via an EGL fence), the Guest's update fence is not
> >>> signaled. We can reliably achieve 60 FPS this way (assuming the Host'=
s
> >>> refresh rate is 60) for Guest's display updates.
> >>>
> >>> Thanks,
> >>> Vivek
> >>>
> >>>> [5]
> >>>>
> >>
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/drm_atomi
> >>>> c_helper.c#L2606
> >>>>
> >>>> Best regards
> >>>> Thomas
> >>>>
> >>>>> I am not sure how this would affect virgl use-cases but Dmitry can
> help
> >>>> explain if
> >>>>> the vblank timer would be useful there or not.
> >>>>>
> >>>>> Thanks,
> >>>>> Vivek
> >>>>>
> >>>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>>> Link: https://lore.kernel.org/dri-
> >>>>>>
> >>
> devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.n
> >>>>>> amprd02.prod.outlook.com/ # [1]
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/virtio/virtgpu_display.c | 29
> >>>> ++++++++++++++++++++++--
> >>>>>>     1 file changed, 27 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c
> >>>>>> b/drivers/gpu/drm/virtio/virtgpu_display.c
> >>>>>> index c3315935d8bc..ee134e46eeba 100644
> >>>>>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
> >>>>>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
> >>>>>> @@ -32,6 +32,8 @@
> >>>>>>     #include <drm/drm_gem_framebuffer_helper.h>
> >>>>>>     #include <drm/drm_probe_helper.h>
> >>>>>>     #include <drm/drm_simple_kms_helper.h>
> >>>>>> +#include <drm/drm_vblank.h>
> >>>>>> +#include <drm/drm_vblank_helper.h>
> >>>>>>
> >>>>>>     #include "virtgpu_drv.h"
> >>>>>>
> >>>>>> @@ -55,6 +57,7 @@ static const struct drm_crtc_funcs
> >>>> virtio_gpu_crtc_funcs
> >>>>>> =3D {
> >>>>>>     	.reset                  =3D drm_atomic_helper_crtc_reset,
> >>>>>>     	.atomic_duplicate_state =3D
> drm_atomic_helper_crtc_duplicate_state,
> >>>>>>     	.atomic_destroy_state   =3D
> drm_atomic_helper_crtc_destroy_state,
> >>>>>> +	DRM_CRTC_VBLANK_TIMER_FUNCS,
> >>>>>>     };
> >>>>>>
> >>>>>>     static const struct drm_framebuffer_funcs virtio_gpu_fb_funcs =
=3D {
> >>>>>> @@ -99,6 +102,7 @@ static void
> virtio_gpu_crtc_mode_set_nofb(struct
> >>>>>> drm_crtc *crtc)
> >>>>>>     static void virtio_gpu_crtc_atomic_enable(struct drm_crtc *crt=
c,
> >>>>>>     					  struct drm_atomic_state *state)
> >>>>>>     {
> >>>>>> +	drm_crtc_vblank_on(crtc);
> >>>>>>     }
> >>>>>>
> >>>>>>     static void virtio_gpu_crtc_atomic_disable(struct drm_crtc *cr=
tc,
> >>>>>> @@ -108,6 +112,8 @@ static void
> virtio_gpu_crtc_atomic_disable(struct
> >>>>>> drm_crtc *crtc,
> >>>>>>     	struct virtio_gpu_device *vgdev =3D dev->dev_private;
> >>>>>>     	struct virtio_gpu_output *output =3D
> >>>>>> drm_crtc_to_virtio_gpu_output(crtc);
> >>>>>>
> >>>>>> +	drm_crtc_vblank_off(crtc);
> >>>>>> +
> >>>>>>     	virtio_gpu_cmd_set_scanout(vgdev, output->index, 0, 0, 0, 0,
> 0);
> >>>>>>     	virtio_gpu_notify(vgdev);
> >>>>>>     }
> >>>>>> @@ -121,9 +127,10 @@ static int
> virtio_gpu_crtc_atomic_check(struct
> >>>>>> drm_crtc *crtc,
> >>>>>>     static void virtio_gpu_crtc_atomic_flush(struct drm_crtc *crtc=
,
> >>>>>>     					 struct drm_atomic_state *state)
> >>>>>>     {
> >>>>>> -	struct drm_crtc_state *crtc_state =3D
> >>>>>> drm_atomic_get_new_crtc_state(state,
> >>>>>> -
> crtc);
> >>>>>> +	struct drm_device *dev =3D crtc->dev;
> >>>>>> +	struct drm_crtc_state *crtc_state =3D
> >>>>>> drm_atomic_get_new_crtc_state(state, crtc);
> >>>>>>     	struct virtio_gpu_output *output =3D
> >>>>>> drm_crtc_to_virtio_gpu_output(crtc);
> >>>>>> +	struct drm_pending_vblank_event *event;
> >>>>>>
> >>>>>>     	/*
> >>>>>>     	 * virtio-gpu can't do modeset and plane update operations
> >>>>>> @@ -133,6 +140,20 @@ static void
> virtio_gpu_crtc_atomic_flush(struct
> >>>>>> drm_crtc *crtc,
> >>>>>>     	 */
> >>>>>>     	if (drm_atomic_crtc_needs_modeset(crtc_state))
> >>>>>>     		output->needs_modeset =3D true;
> >>>>>> +
> >>>>>> +	spin_lock_irq(&dev->event_lock);
> >>>>>> +
> >>>>>> +	event =3D crtc_state->event;
> >>>>>> +	crtc_state->event =3D NULL;
> >>>>>> +
> >>>>>> +	if (event) {
> >>>>>> +		if (drm_crtc_vblank_get(crtc) =3D=3D 0)
> >>>>>> +			drm_crtc_arm_vblank_event(crtc, event);
> >>>>>> +		else
> >>>>>> +			drm_crtc_send_vblank_event(crtc, event);
> >>>>>> +	}
> >>>>>> +
> >>>>>> +	spin_unlock_irq(&dev->event_lock);
> >>>>>>     }
> >>>>>>
> >>>>>>     static const struct drm_crtc_helper_funcs
> virtio_gpu_crtc_helper_funcs
> >>>> =3D {
> >>>>>> @@ -356,6 +377,10 @@ int virtio_gpu_modeset_init(struct
> >>>> virtio_gpu_device
> >>>>>> *vgdev)
> >>>>>>     	for (i =3D 0 ; i < vgdev->num_scanouts; ++i)
> >>>>>>     		vgdev_output_init(vgdev, i);
> >>>>>>
> >>>>>> +	ret =3D drm_vblank_init(vgdev->ddev, vgdev->num_scanouts);
> >>>>>> +	if (ret)
> >>>>>> +		return ret;
> >>>>>> +
> >>>>>>     	drm_mode_config_reset(vgdev->ddev);
> >>>>>>     	return 0;
> >>>>>>     }
> >>>>>> --
> >>>>>> 2.51.0
> >>>>>>
> >>>> --
> >>>> --
> >>>> Thomas Zimmermann
> >>>> Graphics Driver Developer
> >>>> SUSE Software Solutions Germany GmbH
> >>>> Frankenstrasse 146, 90461 Nuernberg, Germany
> >>>> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >>>> HRB 36809 (AG Nuernberg)
> >>>>
> >> --
> >> --
> >> Thomas Zimmermann
> >> Graphics Driver Developer
> >> SUSE Software Solutions Germany GmbH
> >> Frankenstrasse 146, 90461 Nuernberg, Germany
> >> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> >> HRB 36809 (AG Nuernberg)
> >>
>=20
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>=20

