Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6678EC13785
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE6210E5A8;
	Tue, 28 Oct 2025 08:12:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bIvMNA6N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1F989FF7;
 Tue, 28 Oct 2025 08:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761639172; x=1793175172;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KMPi9ejhgd8zczkQ+8kFv5cjrNOVqy2Lb1B+Evoee5Q=;
 b=bIvMNA6NkXJnBb2lRwekZyxDaiL9eBir5oFsOi3iZuJP4fYR8BJpmeqo
 0D2yDwLcM03SVSRp+d151/K5taa9K4iaxLNbJsfHZoHA+vkXJIxdbfoMG
 pdf0Jovd6unlMZ4rsa+f3z+1fb4Olx8u92bBdBmTIKb72quSsUHvuqVr1
 ISDsBk8hMzGNLDhjeNEUk65OjA2T2QsIEhe6XBRTAtLbZxMudlviLq3h/
 LdavxQgQLM50YMf+K9V1P5vf3iwSxOFi8tkU1jbyCDsjTfGGJj6zfbsZS
 RpFzuEg2jwwNtu/DBFZOseElZS4bJhRFk5HsfiKEsU/ChBTjl5bNmSK4J Q==;
X-CSE-ConnectionGUID: nZAeUAYTSdWu37ZoC9MRSw==
X-CSE-MsgGUID: aTt9LjNWRd+zYgxC/uSUcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74019079"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74019079"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:12:51 -0700
X-CSE-ConnectionGUID: c00jorkdRsaIv4eHqHH5Bg==
X-CSE-MsgGUID: OhgMoPaqR8qAcO+VwZROpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="185172399"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:12:50 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:12:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:12:49 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:12:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGEatDMG5FjFdtyHPnT4AQQKO++znSEA2sNA3vE9eiomh0old+a2Oq8Eh1AwMWC/A954+gtgZS13FR9xxIuFI8rR2KmYjT9j8JHPmkQ8di2lUgrllJckvYJwTWp5gomUpNK3nVwz0xGmWVwsYHdiTdgrZWHGS8iltfZNpQkOh/lRyaQAYi2A1FdrZYdmkAudGJOagMks/4Yn+ce6rawBKX50iqXZG0GWGLznNj709Tzz/9ycYeL4EZ1B9uCovi65UbQzEmHrrUP1yNHHSLA0jYvThPgs2ueTsdVgTfOFbVe1crHC9QFaQMoVSiKf9u+NFQbyQyQCwa6HKxqqglnoRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0frqWw8BGwybqlpx+neZUThE5OogHexK3vBjvChlGtk=;
 b=xz/m5gdlZS5CBQr5iIEtOXb2bj4UwchfrtCO9WnNXP1UDJzPOZgywHrYblKVQ6Sl21c4F1gAgDGpPVZ1ILvtGpyEqCLjBfck14gDM9v5KnutGJO4B+XtiKawLnr5t9Agf5iFoENkLC/hQ8tM552tYT4WEOn5yd2PF5bTnXyxjDk7MDj0bbhlZamH6/nHBRwIZqfSufTQGv5a+KVP5cnIz1UwLuaPz+xkKfoczmvA+CcK+oOwnQQgt62KWMAzdwcKASk1azZjFzgvvCUmFgDGzo1t5MEkgwn38z6wfmw5FtIYf8JRnGtpRQn9dlhyx8KBM2PDUvAz7vwXmeX9E+cW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB8136.namprd11.prod.outlook.com
 (2603:10b6:8:159::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:12:42 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:12:42 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>, "Shankar, Uma"
 <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
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
Subject: RE: [v5 12/24] drm/i915/color: Add framework to program CSC
Thread-Topic: [v5 12/24] drm/i915/color: Add framework to program CSC
Thread-Index: AQHb6zD3hlSVzdqpU0+RorebNVCgNbTX7K2ggAAB8VA=
Date: Tue, 28 Oct 2025 08:12:42 +0000
Message-ID: <DM3PPF208195D8D2955A727287B465E3434E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-13-uma.shankar@intel.com>
 <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
In-Reply-To: <DM3PPF208195D8D76C03AC663B7B0B9465BE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB8136:EE_
x-ms-office365-filtering-correlation-id: 291f7f96-2d76-4257-31c9-08de15f9c4ab
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?1xVJOrzLOdJZZg0kFWitsU9maZ77qcMexrwevtQQVBF53pV/pyg2eI6P9J1r?=
 =?us-ascii?Q?J7t6oMmbpXuc81kLsx4xHX4tArNKD8S/zWUcNN9aPaOtnONep0slWHUKLv7X?=
 =?us-ascii?Q?vDv4riGjj9qfoxRwcUmDu9YQGZD0k9gLHVJYT1n85qNY1nTeBo+upH0e6RL5?=
 =?us-ascii?Q?7cW7M4oXD6Yxu0qxH77qsY7FkaxeoBWi05hXkHiYbev1L1iGW5oZaurSpsER?=
 =?us-ascii?Q?NPADt31s5DuwcPCN4LSIHvP4FZTv2R3tF68dlo9zmSPDL9z4akGcVSfbtXCW?=
 =?us-ascii?Q?pUD+uqeCtDN6VnLKErOseBNG6k+iK6GUQu15fd4v3mfMVxmu7kL1CGO2GBM5?=
 =?us-ascii?Q?Uf7OLNISzgIMh4lNt0BM81/IAnWhoN4418PrixgI8dqPDDjgpYRjTbRuR945?=
 =?us-ascii?Q?L3MHnNpTMfyaW3n/Ij5bNosB3Ilh53iQPdFF6LIuBTIyweKHgM+nAoxh6y7i?=
 =?us-ascii?Q?klDQDVr2rFGat9FkJUGtJIe4Dwx5yKhW3/j9bS6VHstiMZ2Bp1Jk7t4DFlgM?=
 =?us-ascii?Q?477xST0h1rcCIQlKoF9Z0PF7ZQo1EDkOMGm026MNM9dDVaUitvQkGmafpJak?=
 =?us-ascii?Q?ffA0dY+W1fgcFkEKP/WmFSbJtUW6P9Ead2Q1/bYMfILgjFz0mLIsplYEQZZ7?=
 =?us-ascii?Q?EbYk5xApebM8KUSfHeQ2No8t0bs/uQF6Ge8CHzuvADiqoo7mX4Jw/0TW6qJN?=
 =?us-ascii?Q?f93Amjzxm+RPH0xex1I9kQPluzueHolml9246mndhlLWqYewydaN1RQ+WFAe?=
 =?us-ascii?Q?xtWnSduPXyAv5BvAJZwHSXczdRDKUr8MSUz+G1ojGgQAeezZqvloMdt2Ltxn?=
 =?us-ascii?Q?TO4u1lGNfpriqBAy9/pXUcA5UO9TMk2P+qoNIXXXxge8EEVsVzZBo6LwRMCZ?=
 =?us-ascii?Q?nfSXZyG3y5wApYqFeWstm/vm+hexXUwnp83zsTXB/qBLUiTJjnTdjmY765dN?=
 =?us-ascii?Q?yMbHHRf2J/IGVqmfqsdnzwTguaFjDVXr1O4/Av3Bk0p9Yi36qB6HE5cG1jzj?=
 =?us-ascii?Q?5TfONXg0D4TvLimmYDDWFP5KmjAEQyCW0XAbApoYNYt9Ro+c5V7gSMQC1wVy?=
 =?us-ascii?Q?KE0EfWNH91haru5VSCvFiHj1lNAW1d5Hthmkj48BQ0S7vNOIqZWTfGLp6/em?=
 =?us-ascii?Q?c83PtcZlJXchKuPfj51XMOcc0HOjibc+sVSnAj9eEihCexK7evBu7i0qatST?=
 =?us-ascii?Q?B1RAmgfIXWjOJmWXunpfxwMqfcIji9v/zbmx32FYe68H+WSaOpmrucva50/j?=
 =?us-ascii?Q?qwC13XkhTeaEotgHk2ligqCtGnAWBWZpXGQvukZGGIDWT1PBIdvBVso7vhSY?=
 =?us-ascii?Q?RxxTkgDI+ODrt8pA6/9/FCfpTPl+sFRNUmdy+EgNExXA0b0Atoik9KaQqBlk?=
 =?us-ascii?Q?oBfh4q9kRvbxjo/LiQvfk9o9lXer3oR1I4rdqTnBdc5MXXJxgdcf//sUHiDx?=
 =?us-ascii?Q?kjzG860z/kszo1DbolrxG27gZ1AN4o3Rj2b0rFlPzN8F/A1MFembvVyMud4k?=
 =?us-ascii?Q?2UJz0VX7kp3jn3fW4Yg+4vWoAoIOtbr6dSxi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ML95dt4airQ68TA2aM6k21QVftZSSFya0p/3uuXz083swcHSYCORDVj3FR1U?=
 =?us-ascii?Q?8RYrPjfgXPoe+IChL60dAnE9Mmb0H+qpUZ3pacb/Pvvz1NATnJDb+SpOnOqy?=
 =?us-ascii?Q?jkiNXNdeM67QCdCZBPXxvv2ju9n8GJUAQNTvbQlGmHZyGwRqvrfKNuGBnk9C?=
 =?us-ascii?Q?SOcX3moSHAnuVMTJ6FGnw71CSN74WZ2EIC5ZouQb/fqIVOvvGVyoCl74L6Fi?=
 =?us-ascii?Q?n67srqfNr3vS+8RmX9UyMRbXg+0oA5K02J4xbbCRjvw3vwoY4UW8qbKjEhkI?=
 =?us-ascii?Q?frM0eylVDVLq9tMfz7tqSZLbn0VE8ydakU9mUp5Sqn6KYeIuHCc+Hw2mU+T2?=
 =?us-ascii?Q?unU4RD0cIGdmOpEW9IxPeV4zSt53Yg27OSTxYBO/oXKUG948vFHcpGT26Khz?=
 =?us-ascii?Q?oNYp+QeAPMOTCON/cpqLJXDLtdQCwD6gjnxuzxwMH6x7Mkv0aAyFLSfd9xsG?=
 =?us-ascii?Q?eOz09OOsK13G000RggBfwoRDRrPGW56wo24DPPEKHmwLFR/0zOiJuwZTxVnS?=
 =?us-ascii?Q?e0bvD5p77EQmyZEVDdwvPtz1LxDloj3TWbqtuaGDjba6QpO6xJHsmogtM4mz?=
 =?us-ascii?Q?QYIkVKn8tjEumMVF2cMUNtmusDFiKzxpKFe2Ak4a7UATn8bXGWpJB/NFkeUM?=
 =?us-ascii?Q?oTIAV7xkg2dT2f8LZ4JV4dSkcuBR7Ge65qjw/Zs+lq7YnyWHv9fy8AsA2wNu?=
 =?us-ascii?Q?aeiPOgtFWtapkoi5jqDWOoGXnBgqv+I30rKnMgb7Q/KbXJv45RO0diskYEvZ?=
 =?us-ascii?Q?mot7Xb/JcJM7SYEACshpeoNBv3Yq7B6DImJS8OA7pi5BcDpVcGHTa16Ff24i?=
 =?us-ascii?Q?GF0b+hXssX2tzVopUwdamJsXqRFKEkKXN+5FRz46lrY9NEoYkkwKFPFfGNmy?=
 =?us-ascii?Q?omzlhxZygvJ+TNmqmTsfavJN104nxWAfahPP2VsBLrawk+QpfoOUJ7z7pp16?=
 =?us-ascii?Q?wHuPS27aWIAiyz/bsU8xgBso9zvvaUBDgWbmvHE3HbPxg2BoCPIyyAlQhjxL?=
 =?us-ascii?Q?mQBJNL+hxszOaADRIFUJKpLKmNtdKTFwczjb5PISiG4t6b+apJEe1cM0TXzk?=
 =?us-ascii?Q?hReO5fBM6pD9qDnxp+6UCGksCWtJz0JNZP9nLamRgn01m4vloF/sx2sSnKBK?=
 =?us-ascii?Q?tjb6sNROlaexmL/HT/j6ObU5Ztii5WCJMPxcoI72a2MapkUVSMKf015s8Hih?=
 =?us-ascii?Q?DlUootB0rJQzhqZFLZ1VcGxi7LuB9+GJq2aN2PnZS6pnbgvhcoqPnz7B/R/Y?=
 =?us-ascii?Q?nxLFGZ7m5TDHdQke9rMkqp2SpQcClszM2nUiRvAxm+ZSZThSG9Zw+Flsq3Q8?=
 =?us-ascii?Q?uMJnQ7uCmgrQjPLrFE9Z5+xx+aGNTrBa8N26LhxXPE7m7nDO9MJmV/rYn/YH?=
 =?us-ascii?Q?KBlcX22o9KPJ+yvaimlcU+tbLlHcM0XaPFCIq7Q0f1f+bGLVr7av3obeo/rr?=
 =?us-ascii?Q?3KKEmdKh2cB3DwDpwHjOyAMWL9vKcth9SPoRLNtlsVxqX+i4KhBqF4KHNYOh?=
 =?us-ascii?Q?EFgJj5+MTKyt/BO4Prw2fVwPjKwblISGG72vzctnai8W14/Y3HZYKkoAbN4L?=
 =?us-ascii?Q?3eZ68kk/CrXZoSq3YqQuSPhnakxN5Bef8+ipVfDx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 291f7f96-2d76-4257-31c9-08de15f9c4ab
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:12:42.3256 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymnwr4M0kOZVr3sbbjwPkDbeHoYFaKGdLHl+cD49F1Y1g/Pgtm0R8c28HHw4O1JJiPEi7zD3q6vwEOBZd+2hkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Kandpal, Suraj
> Sent: Tuesday, October 28, 2025 1:40 PM
> To: Shankar, Uma <uma.shankar@intel.com>; intel-gfx@lists.freedesktop.org=
;
> intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; Sharma, Swati2 <swati2.sharma@intel.com>;
> alex.hung@amd.com; Shankar, Uma <uma.shankar@intel.com>
> Subject: RE: [v5 12/24] drm/i915/color: Add framework to program CSC
>=20
> > Subject: [v5 12/24] drm/i915/color: Add framework to program CSC
> >
> > From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> >
> > Add framework to program CSC. It enables copying of matrix from uapi
> > to intel plane state. Also adding helper functions which will
> > eventually program values to hardware.
> >
> > Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> > Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_color.c    | 14 +++++++
> >  drivers/gpu/drm/i915/display/intel_color.h    |  4 +-
> >  .../drm/i915/display/intel_display_types.h    |  1 +
> >  drivers/gpu/drm/i915/display/intel_plane.c    | 39 +++++++++++++++++++
> >  4 files changed, 57 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> > b/drivers/gpu/drm/i915/display/intel_color.c
> > index 363c9590c5c1..7c53572f729b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.c
> > +++ b/drivers/gpu/drm/i915/display/intel_color.c
> > @@ -3967,6 +3967,20 @@ static const struct intel_color_funcs
> > ilk_color_funcs =3D {  };
> >
> >  /* TODO: Move to another file */
> > +static void
> > +intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
> > +				  const struct intel_plane_state *plane_state)
> > {
> > +	/* CTM programming */
>=20
> Add TODO
>=20
> > +}
> > +
> > +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> > +					const struct intel_plane_state
> > *plane_state) {
> > +	if (plane_state->hw.ctm)
> > +		intel_color_load_plane_csc_matrix(dsb, plane_state); }
> > +

Also the functions above introduced seem to be out of place introduce them =
later where they are used.

Regards,
Suraj Kandpal

> >  struct intel_plane_colorop *intel_colorop_alloc(void)  {
> >  	struct intel_plane_colorop *colorop; diff --git
> > a/drivers/gpu/drm/i915/display/intel_color.h
> > b/drivers/gpu/drm/i915/display/intel_color.h
> > index c2561b86bb26..420d596dbbae 100644
> > --- a/drivers/gpu/drm/i915/display/intel_color.h
> > +++ b/drivers/gpu/drm/i915/display/intel_color.h
> > @@ -13,6 +13,7 @@ struct intel_crtc_state;  struct intel_crtc;  struct
> > intel_display;  struct intel_dsb;
> > +struct intel_plane_state;
> >  struct drm_property_blob;
> >  struct drm_plane;
> >  struct drm_prop_enum_list;
> > @@ -49,5 +50,6 @@ struct intel_plane_colorop
> > *intel_colorop_alloc(void); struct intel_plane_colorop
> > *intel_plane_colorop_create(enum intel_color_block id);  int
> > intel_plane_tf_pipeline_init(struct drm_plane *plane, struct
> > drm_prop_enum_list *list);  int intel_plane_color_init(struct
> > drm_plane *plane);
> > -
> > +void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
> > +					const struct intel_plane_state
> > *plane_state);
> >  #endif /* __INTEL_COLOR_H__ */
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> > b/drivers/gpu/drm/i915/display/intel_display_types.h
> > index 4b5124a08cc9..c709df0cea9e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> > @@ -634,6 +634,7 @@ struct intel_plane_state {
> >  		enum drm_color_encoding color_encoding;
> >  		enum drm_color_range color_range;
> >  		enum drm_scaling_filter scaling_filter;
> > +		struct drm_property_blob *ctm;
> >  	} hw;
> >
> >  	struct i915_vma *ggtt_vma;
> > diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> > b/drivers/gpu/drm/i915/display/intel_plane.c
> > index 36fb07471deb..cc8f3e15c82e 100644
> > --- a/drivers/gpu/drm/i915/display/intel_plane.c
> > +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> > @@ -380,6 +380,43 @@ intel_plane_copy_uapi_plane_damage(struct
> > intel_plane_state *new_plane_state,
> >  		*damage =3D drm_plane_state_src(&new_uapi_plane_state-
> > >uapi);
> >  }
> >
> > +static void
> > +intel_plane_colorop_replace_blob(struct intel_plane_state *plane_state=
,
> > +				 struct intel_plane_colorop *intel_colorop,
> > +				 struct drm_property_blob *blob)
> > +{
> > +	if (intel_colorop->id =3D=3D CB_PLANE_CSC)
> > +		drm_property_replace_blob(&plane_state->hw.ctm, blob); }
> > +
> > +static void
> > +intel_plane_copy_uapi_to_hw_state_color(struct intel_plane_state
>=20
> This should be intel_plane_color_copy_uapi_to_hw_state
>=20
> > *plane_state,
> > +					const struct intel_plane_state
> > *from_plane_state,
> > +					struct intel_crtc *crtc)
> > +{
> > +	struct drm_colorop *iter_colorop, *colorop;
> > +	struct drm_colorop_state *new_colorop_state;
> > +	struct drm_atomic_state *state =3D plane_state->uapi.state;
> > +	struct intel_plane_colorop *intel_colorop;
> > +	struct drm_property_blob *blob;
> > +	int i =3D 0;
> > +
> > +	iter_colorop =3D plane_state->uapi.color_pipeline;
> > +
> > +	while (iter_colorop) {
> > +		for_each_new_colorop_in_state(state, colorop,
> > new_colorop_state, i) {
> > +			if (new_colorop_state->colorop =3D=3D iter_colorop) {
> > +				blob =3D new_colorop_state->bypass ? NULL :
> > new_colorop_state->data;
> > +				intel_colorop =3D
> > to_intel_plane_colorop(colorop);
> > +
> > 	intel_plane_colorop_replace_blob(plane_state,
> > +
> > intel_colorop,
> > +								 blob);
>=20
> A break here why keep iterating if you have found what you are looking fo=
r I
> think I am seeing more and more reason to have a separate file as Jani ha=
d
> said Called intel_plane_color.c
>=20
> Regards,
> Suraj Kandpal
> > +			}
> > +		}
> > +		iter_colorop =3D iter_colorop->next;
> > +	}
> > +}
> > +
> >  void intel_plane_copy_uapi_to_hw_state(struct intel_plane_state
> > *plane_state,
> >  				       const struct intel_plane_state
> *from_plane_state,
> >  				       struct intel_crtc *crtc)
> > @@ -408,6 +445,8 @@ void intel_plane_copy_uapi_to_hw_state(struct
> > intel_plane_state *plane_state,
> >
> >  	plane_state->uapi.src =3D drm_plane_state_src(&from_plane_state-
> > >uapi);
> >  	plane_state->uapi.dst =3D drm_plane_state_dest(&from_plane_state-
> > >uapi);
> > +
> > +	intel_plane_copy_uapi_to_hw_state_color(plane_state,
> > from_plane_state,
> > +crtc);
> >  }
> >
> >  void intel_plane_copy_hw_state(struct intel_plane_state *plane_state,
> > --
> > 2.42.0

