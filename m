Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D992FB3F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2024 15:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46D510ED09;
	Fri, 12 Jul 2024 13:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gfxQWCi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E759810E186;
 Fri, 12 Jul 2024 13:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720790734; x=1752326734;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f/XWNvR5hDHsUnuxLbS+umRk0t/X5OUMT015wrUqEp8=;
 b=gfxQWCi7ut0+fn8Mhj5EZ7LIeaegZ7rbfs2Lh5JJjQkBS94qBCZLglHn
 5GezhZebyWDxw23lBoR6mahkEXEDU0bJDZSIjOqukFJqopfrrSX+V9FTb
 x/p2Ew2m+rx0aGoZAIQyJebqBqwyIYJpFq4T/nqrJO8yLk77Eod15rbt1
 RVZX8wbm4kMzqO8/1v8rMlRGvhk7vSWoqoCbOZH+MKqfZ4+D2u2xzsb3R
 Sv7RZTEaMwkhXbrQHSH1sfn7muNKLuCmqaAy/JE4TZYZzrkP4XLsI4VyM
 GZ6cz00EiIF8xb7mMaAYa/g6WI5to3p8JfJiwOhKfNpxrjiA8a9doCxM0 A==;
X-CSE-ConnectionGUID: SN0OGNPQSOOtna/KDRWxbQ==
X-CSE-MsgGUID: 67TzKOV+QK2CsSISfG1rgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="18071579"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="18071579"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2024 06:25:33 -0700
X-CSE-ConnectionGUID: MzmBcERlTCK0NGEc8/7GRQ==
X-CSE-MsgGUID: 2DMcuoMBQOqPxhNQ9R9czQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; d="scan'208";a="48984944"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jul 2024 06:25:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 06:25:32 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 12 Jul 2024 06:25:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 12 Jul 2024 06:25:31 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 12 Jul 2024 06:25:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jMs2mQOYdkUSVkJoVXg50nGgOHzzyN+gsnNaTmTFUWrquhWKBtlhIVA6iCwAYQLb2uRD8rOJdR1COzSuKS2/Al9m70EBRnHD35MtzVWYQfSJyOG4uLeHlcLXiPSC5jd8JabsN3gyXva7V5Q85F/Sm1p11iGQFZl2+jA00WVEQKG3Gwlaa6sCHAQzh2FeY71TiX5C/RGFAThNnfCtU2dtQUGcJj+eGvoJDjt9iiY5XGbVLn5FMwNyEN0lvCn0ztket08fTU/Uk3WMv2D3ffONpydYW5vtSrQutsNH3XuFyZ3hg+Y/Qo5AXDxNVk5kYPbIPE5b47bD7MLPUszhI3zWSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1LX998wvHrnbIz6qsqQ0juGH91gC/KOvKdBQZxxK1UE=;
 b=y1FjK/QOSLGXMhyEJnwU6Tka/3OWtNbO+vVn7ku1DLb0yuf0J9DOvtps0iNw60hODt1MkbN9BngW34EyHoqszpj9461V8fFEsJK85y0+oRyFPXpVOl9TTKbLIILHznpQwiRcEEkYutASTSbnBe2L1ZQ+ECe5oYaEgxkj4Ut3O28G/wWkZnmXg0XLa+euxUHX508wxEh2LiR6A8QupvaLJzO5VDqdyro1mm+GmkibkpJ0f/w+lfLtaKSAI+rVp7m+uNStiHogj6Rj6W05+eyDf2vkyytLuWgwgzrbv94YRrXBBe0+vVEQBunMzqhmzm5mUPq+c2EPO96Z05nlZhqg2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 13:25:23 +0000
Received: from SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0]) by SJ0PR11MB5867.namprd11.prod.outlook.com
 ([fe80::dc4d:b84:3424:b7e0%4]) with mapi id 15.20.7719.029; Fri, 12 Jul 2024
 13:25:23 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "Wilson, Chris P" <chris.p.wilson@intel.com>, "tursulin@ursulin.net"
 <tursulin@ursulin.net>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Shyti, Andi" <andi.shyti@intel.com>,
 "Das, Nirmoy" <nirmoy.das@intel.com>, "janusz.krzysztofik@linux.intel.com"
 <janusz.krzysztofik@linux.intel.com>, Chris Wilson
 <chris.p.wilson@linux.intel.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Topic: [PATCH v3] drm/i915/gt: Do not consider preemption during
 execlists_dequeue for gen8
Thread-Index: AQHa062t9b0WHNH5wkOFQB2dDekqobHxt3qAgAAcC4CAATujYA==
Date: Fri, 12 Jul 2024 13:25:23 +0000
Message-ID: <SJ0PR11MB586743B1AF7DABD0F131E906D0A62@SJ0PR11MB5867.namprd11.prod.outlook.com>
References: <20240711163208.1355736-1-nitin.r.gote@intel.com>
 <CH0PR11MB54443CBE8B4A052419FFFD1BE5A52@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ZpAfyzKlqlMrd4nj@intel.com>
In-Reply-To: <ZpAfyzKlqlMrd4nj@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5867:EE_|PH7PR11MB6650:EE_
x-ms-office365-filtering-correlation-id: ccebfc88-d486-45d4-9b2f-08dca276159d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xQQrv0YpF08z3zQRkti6GC/E7aM7EXXCq6mthui6PmJ6W0krdoVFqr8jSIz2?=
 =?us-ascii?Q?9GaA18kI/z5+RPnxBsHxo81auDekYSCmVWXuzBxgNhp0AuxiG34us7vH1RCX?=
 =?us-ascii?Q?BGc5GxFD2gZVncZaYfjsFkGt0zEV5hylYl7Ies0pfPlHfrkkE6jIgug20UAh?=
 =?us-ascii?Q?u/qhDCOLQSNvl5MPlVIiAo9Zmuh9GJi9M6yCiAZ7NQVHX/dxHepMl4houNP/?=
 =?us-ascii?Q?BZ217Zw0jFPOKRPCVRoeajQqe1q2D3nQQR/UyUe8TPNu8VVgZdH4vG3TWvqy?=
 =?us-ascii?Q?5q6XrnhBUglEHr6ACNJQNp/9ng5BBrNicInP6mb1pDR7ufTKH7Kuiq0jTCfz?=
 =?us-ascii?Q?k/fKYwm/R8+WU2pT5LXw03iQ3sUJhvGJowDWTf/tAmSDZE+QzprpCSf7gHTZ?=
 =?us-ascii?Q?ws6qcove07GLB0KaPPLbevifuRteS2kSNhWi5/z635SK8tdY+kTDeiAm/IYH?=
 =?us-ascii?Q?MNhGjwvG7T1p+C1bJ6gbbrIdCv9HdJD/vUwm9VtxNhy0bVfV4XzJ7vSi9LSq?=
 =?us-ascii?Q?ws4nPSYqnKfSxR42QrA044zu1AKFDfEVt2SNZ0+lc4LT3tWbdgoXTMDO+AWj?=
 =?us-ascii?Q?00BI+0gKr+6kL24AtXSjRfz9Ny8kssR8LxvAmCaPkId7hJrZNMOBYLoM5eAl?=
 =?us-ascii?Q?HKQJD2Z/kvSiLbMNhXX8vVl8vb6XXUYAVl5sdSY5eGaeVTwxmiy1NZ7QVdrK?=
 =?us-ascii?Q?Lx3JXd29zlg/WI5hXnpJ4t5wR+8GhWS4LFvmE0gXQEHeyC8xFSifQPe26GYH?=
 =?us-ascii?Q?H+PV5DfI5zOoQTuAWVMI8tNnzDwnrQSSjkX3dxIYCC4WW7NbeSvf/72YkLLZ?=
 =?us-ascii?Q?MXm6RJCixrWg2K3zGVs6DIKcY6xPk2BKawdZkyl3MdpGFIOoIK3B5wV3ol09?=
 =?us-ascii?Q?hPibg7iFR/zc5lXx2LW2qlRJ9Vtyh91WRtT4LUmxnSazeMhMEia7GmrtFLnW?=
 =?us-ascii?Q?O/knTyDUy7+j1Kzs5b8xvtzsXS4fXsMx7vD5m8uUy5qEOjLF/hL5Mu4F055w?=
 =?us-ascii?Q?K1vEtyRG8OXzYTkGDFDPNXli6aAIe0XDCqsXqmUJzH7Pmo4wOBa4/RQBZbhd?=
 =?us-ascii?Q?U4rL2iw5oAiDJI+59tx2BNBmkPLezzPAPctQBq0x8itOqzWPHF5Mo/oDgyej?=
 =?us-ascii?Q?JvUL0iN65OpCLhb7ikiZAQWSy9NdotXWuuXxS5ALGheREoKlFBNdsv4n5f2c?=
 =?us-ascii?Q?2na9wP5koTrxTAOAf0wkjJcHtiUReGPqS7JNZd+KIImCyMddWbB4NSoRqZYA?=
 =?us-ascii?Q?13uUfigYVBmiGeWkrpd+ozp8kPORMUau03fuDk7hSRnxg3vRc0ReIuRDfJZc?=
 =?us-ascii?Q?XAelPIBSV0xiZ6QYiwm8iYEVOxGz12z1MkiagQxxrKXQQ91vo3oTT7FLnnFa?=
 =?us-ascii?Q?1/m1f/4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB5867.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GiVzWNb+IxgQusygcTgPCg/0WFLDFVr5GOov/PSlRg3iT128rzSUgj4X1oGE?=
 =?us-ascii?Q?JZrMzhOfJIfMS4gHoU4jWJOYNK9YBVE0tt7cFIYdtH6DsrBk56ehlU26NMzW?=
 =?us-ascii?Q?aNR90HiWlxxRYtjNgct1XvalZP/19ZbYazYQr8wuOhKIWmWy8oKxHNY4DOpb?=
 =?us-ascii?Q?fxfVWNBFMkJJ6asK2ZzGs9raZxNyEqW5cBOXr+ETLUunBXZX6qBs4o/DWtsS?=
 =?us-ascii?Q?/VslG6H+NIrcY8hkKbyEn8rEpmuFCiUVfsWo2TLCvIYpZt2T8CqhGIB1un1j?=
 =?us-ascii?Q?eQnMroENNpowicp4piRTVPqg7u+gmexl9o6MYqlYpVCO14n1+lF0wn1lhOt3?=
 =?us-ascii?Q?370kIv2FcsP0231WsXvFebzH9O90aWDJFegpOV7RxGB6/ntf+2q3BWPDfApf?=
 =?us-ascii?Q?+tmIAxZSi2TI8WOGal0kC59GqmKpXVGMuFhCj0Nj169WsKKt1rULLnuotXa6?=
 =?us-ascii?Q?HxikiM6nz/rdLeg8piBFlVcRUqHBZnm/A0HAOBUXby5EiSL0GxZczlWNQUm7?=
 =?us-ascii?Q?7T2M1oRl6nMgglz4VAOGUYj1TeVhcNEu1ZAXJXzNtLuQJWOoh7XfAhCqcMmg?=
 =?us-ascii?Q?5NH9+9oBysG4fv78NgK4VS7iLbdb7e1yf9rxN5fgrKlyPsYGivDzMGVIEVKB?=
 =?us-ascii?Q?DtJlEr/kLoLC5GXx/t77zs+wb9b6xhCRDiEIFOweHesKpHMHaitHAc1U3EVB?=
 =?us-ascii?Q?J1nND+VMr/7FrdDMEP/QkhaI76zTum5ZnkFVjfVeqCa6RAlH8n1Z1NLIwAIs?=
 =?us-ascii?Q?FIAweguOJbnqSePhnY+f6oJQBvvHGRG6u/XPTEkM/ncRNhp56AsNNHIq641V?=
 =?us-ascii?Q?6hpc6SMouN7Qd6AF9Xtv1H8UKqTGcrLdVNbz2e0mtoTkuVTjJf1I0fLxATba?=
 =?us-ascii?Q?x0YL5wOEOA4chefDMvTdM1DJcLse+LgP/AeSG8KCfQilBG9mm2B5q9nHdz7n?=
 =?us-ascii?Q?21fOcGQXs32Yh+jyu2JMYtlpPvs/GaG0Y0c6u05VSiG/dGzuf7X5Q/1eu/Yd?=
 =?us-ascii?Q?1jyiCo+bViwUiEg+dDriFJF+z8DetG4fubjo4tSos/fj1io3XN+iHdHrmlUF?=
 =?us-ascii?Q?TGC+Fj/qBa1SY2kta5r0WnBJAVC0xdj01ZtLu6II7J+5nw8r6sjUaOUKZ3b6?=
 =?us-ascii?Q?OJhEC7LsKT9TFdBggGYcJ0mO+QtrUOxVL9MEv/Twt/6m3Gv9rEPdLtPYw6y1?=
 =?us-ascii?Q?8D1gRM5m62r3Sht3PwPydEue3WJYnH+Mfzn+LmKXihD8Oxn15TDNW4/cLqam?=
 =?us-ascii?Q?eqKamhUwtObHwV8gLvx7T6d27SKuWv/QzVJshHY+BLEQgJA857BgYQLIiTLw?=
 =?us-ascii?Q?50zOthZmXmIeBY/pUhVTAeso7I60Anz2Ga90WpeSrl7N7uOJEHzMKjHkFAUL?=
 =?us-ascii?Q?3B1JSquXbPpoZCP8y8b3ZaouLy3gzLyS+6iil9s1IexSuNv8uzDirp2xOPCI?=
 =?us-ascii?Q?cKvO+GFcKZagxhZKYFKF8fOdihTs/QddERjmeLrmmnB7SW5oTpRZskqF4t07?=
 =?us-ascii?Q?/556IvK7kXJIDQVu6j6zAZuAdXwzSuWeWAWPN1zRmFqO9xGJS17ojeZ6Bz3F?=
 =?us-ascii?Q?6JvkJgEP67NTNGR+qgI9DLqrHxuklCGsAjSSL0t4?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccebfc88-d486-45d4-9b2f-08dca276159d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2024 13:25:23.2070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yyUp0KP9pJfS2Jo9q8Fjwqp5/7AjmuaoTk3wNucvA68fL4nP4hHVDUAax5odZjFKQYgkVoy6gVD2X4xiOhxvtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Thursday, July 11, 2024 11:39 PM
> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Wilson, Chris P
> <chris.p.wilson@intel.com>; tursulin@ursulin.net; intel-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Shyti, Andi
> <andi.shyti@intel.com>; Das, Nirmoy <nirmoy.das@intel.com>;
> janusz.krzysztofik@linux.intel.com; Chris Wilson
> <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> Subject: Re: [PATCH v3] drm/i915/gt: Do not consider preemption during
> execlists_dequeue for gen8
>=20
> On Thu, Jul 11, 2024 at 04:28:53PM +0000, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of
> > Nitin Gote
> > Sent: Thursday, July 11, 2024 9:32 AM
> > To: Wilson, Chris P <chris.p.wilson@intel.com>; tursulin@ursulin.net;
> > intel-gfx@lists.freedesktop.org
> > Cc: dri-devel@lists.freedesktop.org; Shyti, Andi
> > <andi.shyti@intel.com>; Das, Nirmoy <nirmoy.das@intel.com>;
> > janusz.krzysztofik@linux.intel.com; Gote, Nitin R
> > <nitin.r.gote@intel.com>; Chris Wilson
> > <chris.p.wilson@linux.intel.com>; stable@vger.kernel.org
> > Subject: [PATCH v3] drm/i915/gt: Do not consider preemption during
> > execlists_dequeue for gen8
> > >
> > > We're seeing a GPU HANG issue on a CHV platform, which was caused by
> > > bac24f59f454 ("drm/i915/execlists: Enable coarse preemption boundarie=
s
> for gen8").
> > >
> > > Gen8 platform has only timeslice and doesn't support a preemption
> > > mechanism as engines do not have a preemption timer and doesn't send
> > > an irq if the preemption timeout expires.
> >
> > That seems to mean the original can_preempt function was inaccurately
> > built, so fixing it here makes the most sense to me, especially if it's=
 causing
> problems.
> >
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> -Jonathan
> > Cavitt
> >
> > > So, add a fix to not consider preemption during dequeuing for gen8
> > > platforms.
> > >
> > > v2: Simplify can_preempt() function (Tvrtko Ursulin)
> > >
> > > v3:
> > >  - Inside need_preempt(), condition of can_preempt() is not required
> > >    as simplified can_preempt() is enough. (Chris Wilson)
> > >
> > > Fixes: bac24f59f454 ("drm/i915/execlists: Enable coarse preemption
> > > boundaries for gen8")
>=20
> Something strange in here...
>=20
> This patch is not using directly or indirectly (I915_ENGINE_HAS_PREEMPTIO=
N)
> the can_preempt()...
>

Thank you Rodrigo for the review comment. Seems like you are right.
Fixes: bac24f59f454 is misleading as it's not using can_preempt().=20
The bug could be from the commit bac24f59f454 as mentioned in the issue
But this change fixes the original implementation of can_preempt()  in belo=
w commit.
Fixes: 751f82b353a6 ("drm/i915/gt: Only disable preemption on gen8 render e=
ngines").

I will update the Fixes in the commit description and will send in v4.

> > > Closes:
> > > https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11396
> > > Suggested-by: Andi Shyti <andi.shyti@intel.com>
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > > CC: <stable@vger.kernel.org> # v5.2+
> > > ---
> > >  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > index 21829439e686..72090f52fb85 100644
> > > --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> > > @@ -3315,11 +3315,7 @@ static void remove_from_engine(struct
> > > i915_request *rq)
> > >
> > >  static bool can_preempt(struct intel_engine_cs *engine)  {
> > > -	if (GRAPHICS_VER(engine->i915) > 8)
> > > -		return true;
> > > -
> > > -	/* GPGPU on bdw requires extra w/a; not implemented */
> > > -	return engine->class !=3D RENDER_CLASS;
> > > +	return GRAPHICS_VER(engine->i915) > 8;
> > >  }
> > >
> > >  static void kick_execlists(const struct i915_request *rq, int prio)
> > > --
> > > 2.25.1
> > >
> > >
