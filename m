Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8428CF2BC9
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:27:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0534010E0E0;
	Mon,  5 Jan 2026 09:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AbiYdEC3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5013B10E025;
 Mon,  5 Jan 2026 09:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767605238; x=1799141238;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=21sfA13cr6QmnElXhlahKYkdS/dbC+5GZ0v1b/qFdmQ=;
 b=AbiYdEC3u0hqagdepKgagPsvim4/s2GT/BYjBoAPXUywjMvr+TQ1hXnO
 mVa1kCtrXUDtLGrT1+eCJ53HHIR5HnLZXrg0CsqhB0yfQfZ/IpxoKZ2w5
 IoE0jGp9O0wKv5LdiVB8l/rUpTK+/zpbnY/V03/JaJf4d+tFIgaV3LvE4
 vKJMqSbKlwYeMYdbluKPBF0ee+M/Dwgy27m+T/Cl/gkg5fDad3FAy+zAe
 EIm6V7bT7MDoi+JLYoWsd1ClpJPZY76GXYQddsBllDPpDXBBtbk2XTC1B
 1/ILtdGG5Cn0DPyLwrWEYjNW+ogp+zEZ1RjazZ7MGmo9+D7i3qWBRl+MT Q==;
X-CSE-ConnectionGUID: n8qlTf6PRZmRMwhJiDTewQ==
X-CSE-MsgGUID: 0bsiLxaqQHS1YXkhD9H2OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="86388178"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="86388178"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:27:18 -0800
X-CSE-ConnectionGUID: UPLohIi/TU+/zTedvLVHRw==
X-CSE-MsgGUID: jqgEPNCbQHKDBh/b3PZvTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; d="scan'208";a="202118541"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2026 01:27:17 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:27:17 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 5 Jan 2026 01:27:17 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.56) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 5 Jan 2026 01:27:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i2Y3pYA+Lfd5GKzX+xeb2pU0F2i12Ikx1IMtCFK0txU3AjdfBNlXZoPObo5Cj0L2fQVdJk6zz4PCxEN+53eB7WB/FgSdqbfj+lk7etAeZ7tGcCR7xCKKeR2H/yGE5u9LjE6D2Ni47ejmCjjg2U+dV3+JLkkOcQxeczhs3I9hveN9DYvaogdxJ7b7+wgu5dJEwm1s7HrzTSi87NbhYjN1kM5RjXnl/MIvn32D0MB06U2gs89zzX5PVoND0lqgx6fvJqVi/t9Cq3UrYZdihCPARHLhl4tZzVX4zlQ4ySbvIdX/RrwFsI5k5bNuZxPt+KEQtZgDubBHpOkxFkJP8+mAbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lWmVX/RvJH/Yyud3SdXh0DErv5cfmv7WL6w+TuxkFs8=;
 b=eYcfLi1XsQVugaow29OxDOHTrM3hrba4t91xtstwCs52Cpe2bOjWy1xe5XQYeSa4Lc7Il+AEoKNOsEjYoBI4kg8D6aDkdz1ZrhmxXfgsjzo73b9uVdIijrMJBrM9v1SNhqnrdIJisE8Q+oI7QSZFk9vw74I4ssylsZppGwxaOS/LzGPBgi187Cxn+pipuEHGzN2JwTCN2fAmyq3+MywwMDhBcTOXgVdwbgBmyTo/exhBBS7ZkuS6o3wsolLfuJrqTlIfst5nciEfIbZsiFW8y7WC7Ii0zh0IKzEOz20EcU01VcXKk+pmEaH2Bx5tfTE5ygnWtV/YHtk95MPgAQ+IAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SJ5PPFB8C3A0B7C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84c) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 09:27:14 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 09:27:14 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
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
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 12/13] drm/colorop: Use destroy callback for color
 pipeline teardown
Thread-Topic: [PATCH 12/13] drm/colorop: Use destroy callback for color
 pipeline teardown
Thread-Index: AQHccLcMvYYlMFrmdkCLPk/bjKpm0bVDaWCw
Date: Mon, 5 Jan 2026 09:27:14 +0000
Message-ID: <DM3PPF208195D8DF25828373088B24D1C0CE386A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251219065614.190834-13-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SJ5PPFB8C3A0B7C:EE_
x-ms-office365-filtering-correlation-id: 46211fcc-c0fe-40fd-5c29-08de4c3c9cc0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?R2YjRxokC94Lxy6vRBqfn5Gf69qcBP3Md5YnbMPcpwB8qiYWoEU7VlJoZX6M?=
 =?us-ascii?Q?ELKtVmLaKbYXehh7asO87aGgPlvbfSRrN7RGEjWbhGZxzCuRm6Yl0FG+0LN4?=
 =?us-ascii?Q?WGhwZ2rAzsERKuGik83Or7YpcQQzjx5K5LOyHaqA9W3/jZHpa1hkiGSL+lg6?=
 =?us-ascii?Q?ytVag2+p+kfBcFSp/vnyQ2wFiUJs6kskMvTFBSZo27NF3D7mPUqOGOklEnCn?=
 =?us-ascii?Q?RwQKgVAZjPGAmJ7RnDQ57B5amfuHG2x2Zoemwh6GFMjRHSyjjUxFKqxVmFuX?=
 =?us-ascii?Q?0a8vpBbYfcemN+zxchFt4ih/RhhK4GCqqAau0aW10pQdYmuQ5AviGdUrgLyF?=
 =?us-ascii?Q?DjE385OcCvmg9acfRx9K24RoJ0Q6mQ4KZJxw6CJQhYmT2xdQArXDIkDbz004?=
 =?us-ascii?Q?/fGTD/XQg28Dw6bWxew47Ojl37c9bxs5xCou+v9uqzivEN7TSmnldTjl3jne?=
 =?us-ascii?Q?18HtDtAOa3JEJyzU47ASljWpWIEeGA3P3good1amINXzOh0CEt26kqt+Pwz6?=
 =?us-ascii?Q?i3KOD3OJr/8/5WAh+Q2meX0z9DQz04MjoHF0kllnVZnDR2JeDtjJD4mpgwoW?=
 =?us-ascii?Q?uQZNjUguMXjFo4aUQf9qO8ZacnjITx5V42tAjcZWmGC7TsLgTiiz9XsFW4E/?=
 =?us-ascii?Q?Y4FbrKArcA+htl2CRWCKQevNvkmGIEHF5mejZbygZLM7Adhd3tXKm9rHqbbU?=
 =?us-ascii?Q?XJEqElb/xotH+NdmIwy+24LZiz2igND1LWPiJQoYn3e7IkD/cHpeIDG6xZX1?=
 =?us-ascii?Q?6siyk/Kd38wNQ+TZ2S5tqZRaAZyunsxVMOiFRi/laJJv5Ui+sf++whv04ipj?=
 =?us-ascii?Q?J7mbD7vsz+OXo3uCJDH2ZWFlsqrIVMZotiTI14Cljf4KIk/sWsx3uS4H9Qjt?=
 =?us-ascii?Q?ytRZNWTCsk+EbcNMjHQ4KrcEHGiaHgb5oEQpdXW4BhXsuryltTAEeFEXtKf4?=
 =?us-ascii?Q?sOGRionS6zncDz+v3RfsQoSjDLbQrvr6OUf+8dXKWswuYy5yIBxdL+vDXpyp?=
 =?us-ascii?Q?QoyeAICWNDZx34nlBxpLdWa3f5sNHsaTiuUweRrcIpgCoVJEDgMR7UprF0AY?=
 =?us-ascii?Q?faVW/mhnnFtvhZBu8PAvgEkaQnVZbM0PZyehY9lDQ31Q+z7QSlNexjil1uhy?=
 =?us-ascii?Q?++EYiUL3mAThl4byj5XMgGWKktKB9YBakxNiVrYDYsWMWtrCRNttkuKOm69e?=
 =?us-ascii?Q?zaxgxYDwX9MMrH6R88YpsrI8zkXlEQbDmsP2NeNeO1N9QLi/yFlQzO4/sMku?=
 =?us-ascii?Q?tS1GfQeotDpMOVI4/VuSBFG1Lp7Kbv57CZgonhasupVWiITfwAm0oUdvdvC2?=
 =?us-ascii?Q?k02QrN/M8mGlvEc8MWWDORuNwRYEk7Ty8hGDZbxleP+8UXgiDZkcsgtnMr3v?=
 =?us-ascii?Q?Y6cRVLFytvsyWeMTErHof7ihmxqNLhFdNm4xFW0eS3kd+bLWOrWq5jsminNI?=
 =?us-ascii?Q?VDlh6sk/rgtjn/ocU1mxy/eahBkC+FWwB3euhVrkkgE9AaPO1PKZbZXhvyyl?=
 =?us-ascii?Q?CgvQiFFa5LBSCx3Hd/JygJBPGIRcE7tADAuN?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i1dKxVbBQw8DjiLGk8VoNAIyWSHMHhiyrpe/e8/SGVeTtYitHnoK1ZyIfXan?=
 =?us-ascii?Q?/NrMoB1/wesSz0NETUKhWS9qQwOGHV8FHYpGYH7qYGcKnT1dvz5dil1ImLpE?=
 =?us-ascii?Q?4eT0wd/u5osDcC3FpsN3l3axBKeBjVb0aNDHdT/nQlpbgADWosk430uHG+Bw?=
 =?us-ascii?Q?0T7lz/WYz3uBGARc8YlAAftSIhRW+8c9M7I7opZgr6jbF85GNFRJnYbfTuWF?=
 =?us-ascii?Q?JJjVj3dYfsCLV4ptFtoRE58x49Z5zvCAgmdeClmWTPjj2nNyN0Odsi2HtyRe?=
 =?us-ascii?Q?prx3e80RDSauFpSblgmoitmzPVXjhQzUPZaqgZDq1+PVABhe0D4jnpMLmxoC?=
 =?us-ascii?Q?wE33BYDF73N2UoRiY0de0r6ogSQMNMLYNYTifZT97BAPfnJ5Rhf+AtcDNORZ?=
 =?us-ascii?Q?rYNhcVnLq6GLBw0NnVZ7030GF4riuN+JqJLDhHvUSn/Dztj+2YRtM4wvYBBA?=
 =?us-ascii?Q?jgL2h/D4fA0gvpiL0fbsExVFJWqQg/xT2v0vY9mf9cQjNAU1+AlIyozd4CnS?=
 =?us-ascii?Q?PFujBw+Whq04dE4fscGQsXyHWgr/Udmgpcb6Cd1xa6nzYGZZs52iut2u13x+?=
 =?us-ascii?Q?5dVvJURm9/D87Can1Aqh1B4NcXDa2f2VZ0iYGq8Txc/GThwh2Sq8uBa0hIXC?=
 =?us-ascii?Q?NAW6apKz7qc4x1OpsA414ABwt/rP3kPlkwQrkiyZkT85/jVEstOmDldysEtn?=
 =?us-ascii?Q?4XUaZsvkAzZPXO+UDutMxfjen9JJqGuLdA63bYNx/wWJhofTpJv3UjR8a0gm?=
 =?us-ascii?Q?UPADsXGycd6qRwmOV4P/NMvWHHur5rNuxtD089CNhJ5wQakwz6LC+eDNq+EP?=
 =?us-ascii?Q?4jR/eGNaaaWsBJBhobHCoAqkKQtEHrt46HIa4Bjiq2eT0EwlaksTiaxuyTXv?=
 =?us-ascii?Q?SgOM6/OvzdXv/l+fOOVsTp1dLQDka/lG1nyb5RNevKsmjLZCpMxTOb2JuxII?=
 =?us-ascii?Q?5nEPd/kkfCVHh4oY0OCU9UQtaF9MRuz3ffXWhjXaJuVPRTk4gycDpHQshtoe?=
 =?us-ascii?Q?0wwCmUGY/K4RX4tuf6jMMIfmtGjFyVuAyW8XmMymgNSeHfw7JFnkIAo1/Zju?=
 =?us-ascii?Q?+67Q4obeAnjVsJsqdnwwvOPl/BxIBfUfVj3/WKO12bpxeI8aZiVx7/cE3zPi?=
 =?us-ascii?Q?wyN4aKsP8qF+MMlTDk/SaVeYA4vSnznG+JfAQH8rf+Ku7yb948dlAdJno1D6?=
 =?us-ascii?Q?eVCAD8hIIa+qk/iHDNT1zyjBFFvItMWc6E90GUIdW/Q/YQD/l7Z6+zzkCO/k?=
 =?us-ascii?Q?ehYWAkDazsb4csR7AhmJHqReMCyGtBERpNQIvMUlUrdyhGHxYRLHBSt5Y/2B?=
 =?us-ascii?Q?ZNKd/rMf2J8nllIK64uKMYEcIfJpDis9e0OiYZk/U+qhB1j3dJDBNn6XRU4U?=
 =?us-ascii?Q?oTDbwQctkugFZDdGhrZ5OWFMVJTu1xObz1R9AayqW8XhIbTFyE1eW1po1Iro?=
 =?us-ascii?Q?K4pwJoV6ofgFAUXe4OvnSX9AqvuVbdlNctEWeqhLFBT/17UpH96e7oCHOuOk?=
 =?us-ascii?Q?l+lW/4KR2LHV/uYIaE+UIM8Nco6QqmQtQ0Zf54zh8a06Zzlye9CQDMG8tcIg?=
 =?us-ascii?Q?UCnfRQZXdkq5QaxJ0A1tGVga1xlH/8Ve2tLk3ekszPvdgKvHqT6XadPgS6OX?=
 =?us-ascii?Q?IPGBT/+ajPYOEXmQDFZIExw/rwRAtBXRiNQacES2DEtLCm2A2Wsz93hkSHIz?=
 =?us-ascii?Q?SRMh6N0grLL8syQodbPaqxvkMRRltl85LyOtjVn+K6bQlfbW1rHgQcdHbHe+?=
 =?us-ascii?Q?zkiMk1ydNA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46211fcc-c0fe-40fd-5c29-08de4c3c9cc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2026 09:27:14.4177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FJSAqUtEpdn/rZ0/GwPKoP9WKoJ2ApSiDeZ3WXTVDQMECQlW4In1YuTM52WeFoDHSCDBVpWX0fKSXKpeQHDRtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFB8C3A0B7C
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

> Subject: [PATCH 12/13] drm/colorop: Use destroy callback for color pipeli=
ne
> teardown
>=20
> Switch drm_colorop_pipeline_destroy() to use the driver-provided destroy
> callback instead of directly calling drm_colorop_cleanup() and freeing th=
e
> object.
>=20
> This allows drivers that embed struct drm_colorop in driver-specific obje=
cts to
> perform correct teardown.

LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index 4b27804bb0bd..fafe45b93ff8 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -205,8 +205,7 @@ void drm_colorop_pipeline_destroy(struct drm_device
> *dev)
>  	struct drm_colorop *colorop, *next;
>=20
>  	list_for_each_entry_safe(colorop, next, &config->colorop_list, head) {
> -		drm_colorop_cleanup(colorop);
> -		kfree(colorop);
> +		colorop->funcs->destroy(colorop);
>  	}
>  }
>  EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
> --
> 2.25.1

