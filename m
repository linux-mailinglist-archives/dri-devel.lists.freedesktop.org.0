Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F9EC965BD
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:21:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE10310E310;
	Mon,  1 Dec 2025 09:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIDjADdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDD1510E310;
 Mon,  1 Dec 2025 09:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764580896; x=1796116896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Jqpcc5ky39DgL+lhPel5DU20/JmTAqjlVM25o8dFtEE=;
 b=QIDjADdEy4lj3JLr9yQ28BroG7vEdf61HcmahcNg7MAsOgkRW2tS4tF0
 jm0zaTDvlhR5H1Gj+Ao5qBNIjhHUEMq3dqaaZzIvU8gqLLEvOvbpGiul0
 sFY7A7NWG7ljNm5jVsLk/MqzzL+onsTashxj8BJz24BXBvzP3B5SQ+HGS
 Xq0mDicdaj+DX0FW1+7eHLTs2SjXw6haMKkEKCS1RkIUE0ZzvNNFGdjZp
 m/8PQx9Uv6Vz/2mw2guttASOFDYA6b8pJu9jZFg+RSFuSfXwjOPMPWkv0
 Q4+Rg2EQbB0dglXlq6tJyh73DPIcmbQtc7+0ph8nNUh2G/MY2by5uB+N2 A==;
X-CSE-ConnectionGUID: bhw777/YR5KMARIVWztMBw==
X-CSE-MsgGUID: 4z/wKLQ/Rm2IcqNBHTF5Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="89163560"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="89163560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:21:36 -0800
X-CSE-ConnectionGUID: dsAT/Wo0RjibahlI0VLC0A==
X-CSE-MsgGUID: X3FzxKTiSw2H/qzByfdu9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193282802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:21:35 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:21:34 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:21:34 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.31) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:21:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nOVVUg43ZqNgNgDufJe97cSi5qf766AAF7KqPbvXL2HUdS2WqDHbCaZE2RO5YhXoz5/91HQqAe4zFmAXi1LIcIBsfYAisABBjxEbcq/VxNpIbphj96PrEo7oG/dRSRT6m4EuVzM/XRBQQcS4KmuyWUaVwExT4AdhQAjD9sVnafE/hEPNtU1TMl85W3iCOXp36Yp+qd45c4RLimfx6b5RkZ0pRWPzkX0p2mLxPcXdibNOJJJx7AX39sg9x3LCNGzFsS3HvEn7wr1KyLGxUvDBHl++ZQllck17ZfyzMTOAiD75WncsRQmyRRauInFqR3N1OJTF+ZjFiRtHPKa3M5Kc4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iiA0faLrZd4n3KC/8sc7brZlC4hBJp9PdUmKJ6VooY4=;
 b=byfLnFeY2AyTyhZkAXbmah/Nq8zmfE9rgpRTuJlimAylZC9CONuZGQ9OInhocteu4OnKMlJBMBo91Ym/F1vByM7fm3T4cnhq0vli6mrA7PlcBao6Kqx3xHyAuczOx1kx7N/ANs6u4i/up78tVtMnacqUWlb1i7LBCzv3pMCmyHrN7MDV41HgpL8mu5jqQeBc6RbNrgQbOMOx93VDfsItd0drDc7K+Qn8N/U33wXx3V/7XD7IaEeS5vnHHTYQSUfa+nY4iSIoN28q0EWl90UBrn2uaspD5wlzJlVT/Cb64O1gpXp3F/IFJHANmai+J6mbX2A04QpXtNCvLKWYx0K3CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by CH2PR11MB8835.namprd11.prod.outlook.com
 (2603:10b6:610:285::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:21:31 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:21:31 +0000
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
 <sebastian.wick@redhat.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
Subject: RE: [v7 09/15] drm/i915: Add register definitions for Plane Post CSC
Thread-Topic: [v7 09/15] drm/i915: Add register definitions for Plane Post CSC
Thread-Index: AQHcYozEHwEALqGodk6do8mRH9AS/bUMgkrg
Date: Mon, 1 Dec 2025 09:21:31 +0000
Message-ID: <DM3PPF208195D8DA5C1DD67D896747DEFD7E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-10-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-10-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|CH2PR11MB8835:EE_
x-ms-office365-filtering-correlation-id: 59b3e190-c4a1-4b6c-0247-08de30bb040a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?gfeA3/kvU2HvoBjf0kpjhiiSsA4VFfcCgygVSrC1zF99bybnTiIj53z9peao?=
 =?us-ascii?Q?frfFwd2vNLuFV1zqNGD0f+aaCHV3uU6sTALa26VXgU1EmqN2Gp2H8zsa5R8H?=
 =?us-ascii?Q?3MMDnsN8eeBNorY/kSJvwE64GaV3KK9dlhOkihlZKPuM+uofOnjVg3VgZaQZ?=
 =?us-ascii?Q?eH5f94D7ixARpJ90iBhZDqHBTs4/vhqyM2I9QKHwmBhWb8TCnh+ikJUgz5i6?=
 =?us-ascii?Q?0VRwbGHXBPj/pbJK9marqXqrFy6qpRJGcrZeSELj8gsTCScOLkbTJ1hU2nUH?=
 =?us-ascii?Q?dMG9VtIPOZpmK1fhcU1hYk5qMbw6R4bn3qE/ZOVOjdQk+zt5q0SZ+cuZFGm3?=
 =?us-ascii?Q?RURoVpL0Xf/2fV5fw3UxZBm9oorh4d9LRfsBU7m8ZfpiDC1W4xUZvd0QLXl5?=
 =?us-ascii?Q?BqWLk6yjf0SYCCYEhlJX3F7SKHziI4Nne1bKAykItDn+nuIheIIHMFZk1QlJ?=
 =?us-ascii?Q?rqgaUshmDdu9HIhHOIk54ZoB5l/hwtbe6z+PE9co3CL0CqabYSjLdfxL0VJ/?=
 =?us-ascii?Q?1odCgaGlHNUtTHZd5cNsAAwjNWQLewkAwwRSMBewaWClLiAiI0Cf3lR5gZhF?=
 =?us-ascii?Q?mqiVT8v0MHl1TLSrNYY7+TCxxqoxJoNWdy28/335A1Rvf2r34RJONxXwRXyn?=
 =?us-ascii?Q?r+3hdv9PgdKOSRfgwEWr+alI9YMlgG0Pu5hM742P1MsoR/xKdgxh3Cgok4TX?=
 =?us-ascii?Q?C0v2j8cMrvolW4hWSJ1yM86zw/NUnzoWwiJnIuPDP3l8RWQT3jpszyyD6DJ4?=
 =?us-ascii?Q?kCUNZd6EStGUpsl7UEJjkte7bwy/LtX5MNxARdvWjSrxnX4g1CASZp5+RMMp?=
 =?us-ascii?Q?OUwIsvQBGq1iE4HgcPDvcrwRFyc9l45ISO6wL5cm37M3i+NqPWgLBnjsniEO?=
 =?us-ascii?Q?3E1ZHu+2aWc6stdyoltgawrpsDZDXWtZ3loxH/qGsyZAK6wQ+EDb91g+AhVZ?=
 =?us-ascii?Q?/RtZgZAbcOycwgOHiO7EFY6EjcWlfS93X0DLGPsLB3mkoY2T7F0KI5PstP45?=
 =?us-ascii?Q?cKAKtajHCwfouFnxZ8s/8LUTraH3YMS5ge3W8md0ee40Ozs85G43O6Y3OjwX?=
 =?us-ascii?Q?QcQ/h80KB+TSyz2bSZtXXDdZGlLw4pGwkjc679YEl87IfGaQATQT60FEQe32?=
 =?us-ascii?Q?zCZQsPxOG3QbugUqwQok/HX1g6aa06oSBcemOJc6s9EGq7JG94rY9SUlGA/B?=
 =?us-ascii?Q?1HxItUfZ9L5oEdl+kTw2Uncv/++s3xSzmqRokzLe/Al5zqI0INtw+pFvpY/n?=
 =?us-ascii?Q?rUzJl60NMcZn5p9N6lVrp1AmROD1BRZNk0Ajt4RMDmDYO8VWOW/twNqsTqRT?=
 =?us-ascii?Q?McYZ7/tvYGpgG1mQKTmEbvPbiIgi7CyvToRAwwbswum5YiyKqGS1KgDleTG5?=
 =?us-ascii?Q?XsK39n1jBMPTYD2r4onVtMjJgL9TgwKrqx1Dm4lyrgz5xJwIaQctKJc4Cgw+?=
 =?us-ascii?Q?hAmqV0MMsFCXzxk0VDzR/2khmmHcvz60BLTaax6HokmxU0SR9Uxa1HtHNVbv?=
 =?us-ascii?Q?qqj7X1ITozUxky3tAwlZmFBOnk13zLFU33J4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xrUfCCUGJ8NDtpC7FLQiIHCmjD/xuaGsGj9Dd7YN4sjyg+fTLY3tRtmPTFmk?=
 =?us-ascii?Q?nlt9hB9ijmvMiohjujNL/zIJYPr9ZVYLaJGzg0mt6BlQLUw1ZQJMqQt9Tl5N?=
 =?us-ascii?Q?4VWMGItnnNEqidrz9HBIlwteG85C0bkpxs5i6kZ4FSy/D2Y3BWpZ8XJ0+HQT?=
 =?us-ascii?Q?0tHMFBy3xuTvDYTZqp5yDLGl6I0Df5Pw/9wuyLUYrhkgYsrimXGeF+NkIchG?=
 =?us-ascii?Q?HPbJMzMyRct1O83E7BkLxpEmIZXvPWToJ7uT/2uIVRNVLqg30AccZVajETv0?=
 =?us-ascii?Q?XssdtULb/n2lXTfhG3L7XhkvAgDoqvj+Gkynyi4kmifZqmovH0johRYb3o15?=
 =?us-ascii?Q?QoJasgsQXWCf6qtRrvuz1AVJ1XPq8jib8ZhDiImLGvOA8yoppYiGn22Pggrv?=
 =?us-ascii?Q?w07SlAZG+Z/T+2LDbOVHSD0ojdjIpgLcVqLJ1W0X6F5HIef3ccR7Nfx0xSUK?=
 =?us-ascii?Q?qtHZPoZzr3cXggoMWeEjvUcbO6wOprRAZ/01sZutwoJ4WJbhjjaJigd+DtTk?=
 =?us-ascii?Q?fGTIRIuWksv9Iu/qOwKfJxydWNhB/j0RVGWMH7FdmhTo5B7nwjZ9c8VcE1v/?=
 =?us-ascii?Q?g3xNiso/VVVVXIYlo9jLuGVOYRFWrtGTXB9MBmrmTCLZ2A5hyQN9jxD3yrzY?=
 =?us-ascii?Q?wy0RMdQ/bDNGOYB9xg+RgTvblkja/0WWw+uq9yvSVSRKXW+pZPxzig3hpIr1?=
 =?us-ascii?Q?5xPCOUoLMKB1MvfBmVtxCzRp9gwoAQEsX6CzARtdgmXcV2x1NmwNO7erqgqo?=
 =?us-ascii?Q?KTvkqp5r1qZWRcacEoSHfu4yks5sPNqVEFNhhmbzJrsCX5VGsBTTPWpXKo3z?=
 =?us-ascii?Q?Nv6VuPi3SlHI+UFpXmOWEtEmAvjBh5TADQVk0jZdGMkeeKfDWfW/4nrzNIk/?=
 =?us-ascii?Q?H0Y9kTcwC9r9o+6nvmX7n+x0cbwm/m++QGSNGewl31LSRhp6larvcDvIqxtq?=
 =?us-ascii?Q?gtwEQMYCR9dSsHiO84vWD2QENCxy93+tzL8PvFMD9K+nd0GJFeH/8VlPhpd6?=
 =?us-ascii?Q?C5s8ppUv2qPzJhhZQV1rBLDvJ1I4TjxWqL+ZUSnmu9QlaYLlyPot0jMd5y/D?=
 =?us-ascii?Q?16BmtR20QZS9ie+ghIZ8vhCg64j1WC1/LiyzTug7QKeEq+CUiuMyBnwvj/gk?=
 =?us-ascii?Q?CRF3GyRtynw7EgVyspf9kxR7OW4WoJqAh3/Kv9h3W+vl82rSQudU50FepWu5?=
 =?us-ascii?Q?K13k/ZlrkblwOVJBTFRNA/KUF2EQTy7vqNRYWIGpkuMot05Pkrari2EzSayi?=
 =?us-ascii?Q?GfQPKUSLtDSPN4Ja9QeTYWSstlf9RCNQ7S4xZVaa1QA/qVzu9N984M+1b4UZ?=
 =?us-ascii?Q?MwgjgT/dNyjQn6yg837eHlvyvTlVhaMnzl2++D0L4C4SbP1IbWFoi1fmuH1b?=
 =?us-ascii?Q?XzA2Ifdpd4AiNByHX1MmobEU1g/75VnqwcUmpUVkto0f/yTT/VaDXS1zCk5r?=
 =?us-ascii?Q?hMUYO3+B/T5mANBHmaIPIEP1RZzkna1tlfJ0N8wu31AjRCQE7V6FFpKfXr23?=
 =?us-ascii?Q?gdYuu7w3PSu7k8DIXiUOJywjfuPGYvD4bcP3hgrfCMgD9EoOXr/0fVQoz6PL?=
 =?us-ascii?Q?wMNa6kILnAWEWuXI1Z+6oB+0ZEEnu1RjBc2pER54?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b3e190-c4a1-4b6c-0247-08de30bb040a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:21:31.7572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t6Z1rsJttOIFj87+iifsGLnxZuWwEaa6npnadRSOsQkqJU5jMmjJEJBG0+M8+rGvxr1Rmg/iViV5Xbwwjcs/VQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8835
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

> Subject: [v7 09/15] drm/i915: Add register definitions for Plane Post CSC
>=20
> Add macros to define Plane Post CSC registers
>=20
> BSpec: 50403, 50404, 50405, 50406, 50409, 50410,

I think you missed my last comment this needs to be right above the Signed-=
off-by

>=20
> v2:
> - Add Plane Post CSC Gamma Multi Segment Enable bit
> - Add BSpec entries (Suraj)
> v3:
> - Fix checkpatch issues (Suraj)
>=20

Here
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

With that Fixed
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

> ---
>  .../i915/display/skl_universal_plane_regs.h   | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> index 1e5d7ef37f1c..6fd4da9f63cf 100644
> --- a/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> +++ b/drivers/gpu/drm/i915/display/skl_universal_plane_regs.h
> @@ -254,6 +254,7 @@
>  #define   PLANE_COLOR_PIPE_CSC_ENABLE			REG_BIT(23)
> /* Pre-ICL */
>  #define   PLANE_COLOR_PLANE_CSC_ENABLE			REG_BIT(21)
> /* ICL+ */
>  #define   PLANE_COLOR_INPUT_CSC_ENABLE			REG_BIT(20)
> /* ICL+ */
> +#define   PLANE_COLOR_POST_CSC_GAMMA_MULTSEG_ENABLE
> 	REG_BIT(15) /* TGL+ */
>  #define   PLANE_COLOR_PRE_CSC_GAMMA_ENABLE		REG_BIT(14)
>  #define   PLANE_COLOR_CSC_MODE_MASK
> 	REG_GENMASK(19, 17)
>  #define   PLANE_COLOR_CSC_MODE_BYPASS
> 	REG_FIELD_PREP(PLANE_COLOR_CSC_MODE_MASK, 0)
> @@ -293,6 +294,72 @@
>=20
>  #define _MMIO_PLANE_GAMC(plane, i, a, b)  _MMIO(_PIPE(plane, a, b) + (i)=
 *
> 4)
>=20
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A	0x70160
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B	0x71160
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A	0x70260
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B	0x71260
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe)
> 	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe)
> 	_PIPE(pipe, _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_1(pipe), \
> +
> 	 _PLANE_POST_CSC_GAMC_SEG0_INDEX_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A	0x70164
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B	0x71164
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A	0x70264
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B	0x71264
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe)	_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe)	_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_SEG0_DATA_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_1(pipe), \
> +
> 	 _PLANE_POST_CSC_GAMC_SEG0_DATA_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A	0x701d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B	0x711d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A	0x702d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B	0x712d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe)
> 	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_INDEX_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe)
> 	_PIPE(pipe, _PLANE_POST_CSC_GAMC_INDEX_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_INDEX_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_INDEX_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_INDEX_ENH_1(pipe), \
> +
> _PLANE_POST_CSC_GAMC_INDEX_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_A	0x701dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1_B	0x711dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_A	0x702dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2_B	0x712dc
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_ENH_1_A, \
> +
> _PLANE_POST_CSC_GAMC_DATA_ENH_1_B)
> +#define _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_ENH_2_A, \
> +
> _PLANE_POST_CSC_GAMC_DATA_ENH_2_B)
> +#define PLANE_POST_CSC_GAMC_DATA_ENH(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_DATA_ENH_1(pipe), \
> +
> _PLANE_POST_CSC_GAMC_DATA_ENH_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_INDEX_1_A		0x704d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_1_B		0x714d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_2_A		0x705d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_2_B		0x715d8
> +#define _PLANE_POST_CSC_GAMC_INDEX_1(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_1_A, \
> +
> _PLANE_POST_CSC_GAMC_INDEX_1_B)
> +#define _PLANE_POST_CSC_GAMC_INDEX_2(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_INDEX_2_A, \
> +
> _PLANE_POST_CSC_GAMC_INDEX_2_B)
> +#define PLANE_POST_CSC_GAMC_INDEX(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_INDEX_1(pipe), \
> +
> _PLANE_POST_CSC_GAMC_INDEX_2(pipe))
> +
> +#define _PLANE_POST_CSC_GAMC_DATA_1_A		0x704dc
> +#define _PLANE_POST_CSC_GAMC_DATA_1_B		0x714dc
> +#define _PLANE_POST_CSC_GAMC_DATA_2_A		0x705dc
> +#define _PLANE_POST_CSC_GAMC_DATA_2_B		0x715dc
> +#define _PLANE_POST_CSC_GAMC_DATA_1(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_1_A, \
> +
> _PLANE_POST_CSC_GAMC_DATA_1_B)
> +#define _PLANE_POST_CSC_GAMC_DATA_2(pipe)		_PIPE(pipe,
> _PLANE_POST_CSC_GAMC_DATA_2_A, \
> +
> _PLANE_POST_CSC_GAMC_DATA_2_B)
> +#define PLANE_POST_CSC_GAMC_DATA(pipe, plane, i)
> 	_MMIO_PLANE_GAMC(plane, i,
> _PLANE_POST_CSC_GAMC_DATA_1(pipe), \
> +
> _PLANE_POST_CSC_GAMC_DATA_2(pipe))
> +
>  #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_A	0x701d0
>  #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_1_B	0x711d0
>  #define _PLANE_PRE_CSC_GAMC_INDEX_ENH_2_A	0x702d0
> --
> 2.50.1

