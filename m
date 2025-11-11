Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D49C4C9A1
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 10:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E210E523;
	Tue, 11 Nov 2025 09:20:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lS6Fl+ll";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D1A10E0A0;
 Tue, 11 Nov 2025 09:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762852818; x=1794388818;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8DdFDwJ6wmqQhP1mY1c4qhkCVUjiThhr5T4yUjQqowc=;
 b=lS6Fl+llWNS5Eq+APmxZT2lb1ojOjXIwGZePDay2wp0W2XdCvSLEkmNU
 Hu4yQkCyDzqzyq6Q0MSepnVFx5jb3hzEPhSL3fp2qPjwlF3KCGCgLkQto
 xOlEsiMF27qP2pBAvxSxa6F5xzqVN8XTkaV7sHkWR8VyXqAt8oZwJuSN8
 zIu8u5eAV+GWhhcb1jbz970hwST3HdGuOi4iumOLIFhAaw4kQ+MXomBu9
 SYqB+7I4D+TqWpGPu7Gd7mBEtBN+KDk/tfd27tLlIDdC/Z4FWArFa2RtF
 N6C9dZvJnC32ZpE9h/whHVo0cCswBql7apF/XvqoYaD4RYkHbkhi7oyrl g==;
X-CSE-ConnectionGUID: usrAJuQGQzq+tvaWVa1IXg==
X-CSE-MsgGUID: QtzZtZgTQbmHNMDxqiJQmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64820163"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64820163"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:20:18 -0800
X-CSE-ConnectionGUID: 9qjGFCK5QMS9ozETuSUSbA==
X-CSE-MsgGUID: LU9fHkLpTFqhxJfC/MBOjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="193034115"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 01:20:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 01:20:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 01:20:16 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.42)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 01:20:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUdRGfiRcH7BdqUOv6hhwu7q9PPue+QCXMiVIu/BLqdnSY36Urlcb2sTS6Rzze02YgxvLjWaMYR502KPq+owIwjHh/Fk4NayCXyOezor5R2tFWKaq49Y0rHd80XBGcELQ98bWhEcb9d3C3e5jrDwlvV2nSAlFeaKhgstAPaXc/1wYfLicG/InujJkSPcYPQLxHK3m4NfHZKHovZWxvPyO2DvxnvpZAPoM7ylH/EnIRG3a+wLNm9QeWzz7An1DuuLyYELRYfwwpUgGptluXpLSwI/SS2NsHZtcNEQk10UJwLdUpnaWIrp7KuEkI6LAWnTvhabK/vwKVg/ePVxWZ02Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn8ELOnBRTm58aT9TgXnh7eztKOWGA7yufAZ7HjQE00=;
 b=BhuuWT4U+OBdc9ZtAmnitwdC56uXFA3lYIenfODyrgQWFSRv5FNrgD2i8yMWT/d5ttd/xGTsqBIGSDQBkdav86K3k2btVkPoiYprRbqIntbXsk1KK8JZesUjZWAxQfrjWFqa1BpMmT+Qk/j7tvAwm94VVANomzxIvJd6UVyHlGtvrbIrG3HfZilzUrfnav0Y+iZzmkqpZItjQqRoHLG4zfmadQC82HLl1350qr5P6JUEU/XFmbuZjQMylqEmu190fg7toQDWAC559oT/6TkIcW9PKhiotbae3c4A2rzxUxL14hje6OOa9qx1/XbuN+cz2FMiEu5E1psPJLkK8vZyMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA1PR11MB6615.namprd11.prod.outlook.com
 (2603:10b6:806:256::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 09:20:09 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 09:20:09 +0000
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
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 02/16] drm/i915: Add identifiers for driver specific blocks
Thread-Topic: [v6 02/16] drm/i915: Add identifiers for driver specific blocks
Thread-Index: AQHcTk7l+XbmgxfeyUqirsUUEpbCw7TtO+XA
Date: Tue, 11 Nov 2025 09:20:09 +0000
Message-ID: <DM3PPF208195D8DB61C0CFC02CB914E3FFBE3CFA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-3-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-3-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA1PR11MB6615:EE_
x-ms-office365-filtering-correlation-id: 62dae036-a601-44d0-fe20-08de210382ca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?D8o0/t9iBLJzxUPvbSpbGZC3l85VqslhKO7Gs2xo0cF21TLN37muLPa2HKMD?=
 =?us-ascii?Q?JIQZK91fZtCJ2fhtBqrRzWa0Sa2KBUGdpwQjpFegfLT/w2u/5VjveHMpQK0p?=
 =?us-ascii?Q?s2RgacfVmrcrBJFzBCNEA/xK5QKtXif5fZ41Yj/vQDF3HuAOxvPj7RFGTb44?=
 =?us-ascii?Q?+4aeQRH5P0sHK6ZRO84qvpWdbRNVb6bFIm8sLqIUzYlchemT1y5urYfrcDhj?=
 =?us-ascii?Q?Aa/tTjB/6YpS+/1rBx2DlSaffK8qhZjtbD3NS8ZOJqVprQVSQHoxgiPC8UXy?=
 =?us-ascii?Q?aVIRmuMa+iewHCIF+b//kEN1RikCxMh2Plx+kiN7mrxPquE4WxbJJ+9K+mvB?=
 =?us-ascii?Q?2sbmPqmINmuQWbgpmxxOfcI66mNVhy5YyiRKdTqlrpYQqjDQfpbsFJxJfshP?=
 =?us-ascii?Q?CfAjTveiRgXlJeN4my8RQj9Bp4tqhODlJUSBYJ+l2AyuanSWrNqhAeiQFSMI?=
 =?us-ascii?Q?NwRbvPOxHukWAzfcTxJkJLElwINvPH8vL+SHmiGjArXAaMGwxiPGx4ktLoyL?=
 =?us-ascii?Q?7KEXmRkfzDh9DM0+qtnPN4CCR7B6kANOXXL5ZAEbCaCChd4sAOrEKaKcjpc0?=
 =?us-ascii?Q?GiGfyyja2tG0yFu0cNyNpFP+Q7BZZ914CS/wW90JOTltQaw6hykDkc7W8Ke3?=
 =?us-ascii?Q?HNr7bR0+lf4Dc9+OZ+jg9heqxDlx4S++/RnBo93OsY/msBTCASzXU24dx4sQ?=
 =?us-ascii?Q?e/o8nc8VMc6COLO5vKkqxb+OMJOynLenh2odzsxIZ/UMSWDLtkz1dCwPj53U?=
 =?us-ascii?Q?fQ3KacMT9Um0h0LOZJfYpz8j1jSULl92PLbsPLMeEy+EsGOnx9EY4qf6/3+/?=
 =?us-ascii?Q?LtzWnnnPWCJrPgaETzMIMrHX2xUyRrAxHv45/iLu9wMMDoMMDfjKEudMHPly?=
 =?us-ascii?Q?J0gt5wbwCK08pwgRlpgrVskoaphfuSd0sFdpJu99LKvcnUvuhOSHPEeWxQLS?=
 =?us-ascii?Q?3TUGDKdnzI68gsurCbckurLX1AhAQMnUuNV0AUP/KnOSHvP54EnHq614MYEy?=
 =?us-ascii?Q?NV+yMWnUtm+qXeQSV2FctVITDvvLkrRqvHgJTTtGLpDX6UJzYpN96VdcfR3T?=
 =?us-ascii?Q?6t9CCXvO00gy8RXJTPQuI4Xu9nlX837P6agWAWk5yUSwFwMZq7BYDn1tX66g?=
 =?us-ascii?Q?pMgJlhSPTBd0/ECbck3VZO3L4DiB5TcHiPzLQBaVbtdDqFGybGDcbMu0AVxO?=
 =?us-ascii?Q?4pOXNvMMjj3IVWH44h7hsRsgyo/8a1FY1pavW1AYnO+iDfc1Rxc89NxP0tmD?=
 =?us-ascii?Q?Wr0Orgexfx1+vDBXKA3wvQStIZFz08vfWa1L9GMd98gA8i0pb/krSvLMllu3?=
 =?us-ascii?Q?eXCUsZNO3YbVY5hkVAaz2/dINVgHtPLKWojl7NP3dYvzOXjyFZ6ezw5c3Q4g?=
 =?us-ascii?Q?W+4iEHWObzRESAhaIgWHwLw+w84/QTk32VbWs2gQTvJZciIN2JQVmTZ3HYvr?=
 =?us-ascii?Q?otVyBhPB0Nd5EWBh+40zi2DmkB1NpXLSNkOiLGgKqNc3VTrLRpJ4e4nHz3QO?=
 =?us-ascii?Q?hKWFMUBlVqHMn8vBhOSsotRGMWoAyxIMSSL2?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?66urJ59sVjsAIsPqyCL97Ev+RGU7omsgXpOH9IsWDBqRB6hyPPyiyBOvraee?=
 =?us-ascii?Q?N6pJWy7HdIOjXwjxYwVL4jg5G5AIGnAo7hVDpYibjgVqF1cxL97lH3xHOskP?=
 =?us-ascii?Q?WFNiXRpCi3k+1PG3jIunK4bDNTOfsdcZC0EKx6em45DjVaPSBh/DQqC/lYFE?=
 =?us-ascii?Q?POXIEctxUpMtauu2xvBNB8eLQL01qCtqykAYHtDOuwzo68IRMn7AV908z4Ve?=
 =?us-ascii?Q?m5zALDzYa8A8ogf0w+SmSLebSp0rgZG0Ptlk7SnAGemBRc6chsqsEppSI0HE?=
 =?us-ascii?Q?192QgVtG8S7a+riydf69NWViA8h7uwJD2NkWoTnPP85/UrnMJxUKAaQ8xA2n?=
 =?us-ascii?Q?6hEoZwBAnD1jXuFmCC+e4NBVXGNLf9O8pnYDebMfx/y1fqpbyrwV4N5stw0k?=
 =?us-ascii?Q?9w/bEO0yDpMy1cQI+bziYUeOm1xvYva4e46ap0qiB7QvxhtD2JzZDRvbww6Y?=
 =?us-ascii?Q?sTSZMQfaXSagDUqzkt41cej0SApPNNd5qeV7s/TGwQs8sZeBSLnJZrHBPiN1?=
 =?us-ascii?Q?03l0+8bgogDKB86+uQFMDbBL2LHkl4IM9R7SI9NZFeo/RbM7JkU6zUBZKpOG?=
 =?us-ascii?Q?AMg4GxrgfIt8HF8+R5syU38Tz3U9x0R46DN22dfNiFQQotXSCIKQMhrDgMBv?=
 =?us-ascii?Q?S1KoAde9bXp49HeFYEADPuI7rCoah45/eLLjAd5mTFuDoIYYiOkj1RBzXvRv?=
 =?us-ascii?Q?qA00PknWO+HRd4YiedQ6cznp/M2GNhu2SrzVJP9E/Jf4OKuOJ5OjIFYYWPTE?=
 =?us-ascii?Q?sNLHu7l1gtl730N2ZdYq4ghsOA3H/pxHvbaTBe3zcsZ11ejy44O3eiEjqOcZ?=
 =?us-ascii?Q?CRoCoCt5f1/OCjvaRsyaY+D9i4tmnOyLHus6++DY1KMg0iQaEVruimRQLFFa?=
 =?us-ascii?Q?phDSXfBGMiYF+2QjXXZKJkqbpjELNO/lGotNfVGano2B0Stj7KFJT0Oz/3jn?=
 =?us-ascii?Q?E1pH64pBg0cOIFaj4gA50YDmfbtnJHRSu+M+VKRzoC84Upg2Krd/x6vDa4az?=
 =?us-ascii?Q?/i3vGH4nTUGo619tEzU9ELAtWkFCOoimORnn5EjZypYFMjNeP6sloIvu5idk?=
 =?us-ascii?Q?DZU0uHDZUkOPxQYWfaV1D0Kml/A08ZaBOrcIBvg17T99+G3X7D1FFvJjzedy?=
 =?us-ascii?Q?4uIWciJumR0sdb7aQ42afuH81NWieNrnmhM1u6Upm76jVPVav0f40ScnyBp4?=
 =?us-ascii?Q?HXoFlpndrP4qjC1EH4coje50k0s7r8yS7miHgB1IBQNZHG09BxiJQaE5FbRi?=
 =?us-ascii?Q?Vp9qlZgQI3MZxof40Ub7yfgDxz1N6Ngsx7mvWcqIZdcvVyapsJ99N5RP42ky?=
 =?us-ascii?Q?IrmYSwj22YNdheSefQtHxi7tEWK8T9slOI0H0VzpSfr+J+GhOJKUV7c8Mw6K?=
 =?us-ascii?Q?BAM4D7fb5zxkqB2UJtBu70M4URsgi/JhUO/jACG2sNVd0pclIb9wJmBgZ1nL?=
 =?us-ascii?Q?acgFjLSIn6lSj0wOjSjW+MBcF+RJ/xqQdkGgo0wg3phs01vBLeyOYdWLH/rj?=
 =?us-ascii?Q?kXCep6mQsIHTjmtPrcLzYviSpaZn9M+4+3O2CeheEQxaUPSKHGXYBnPE6htZ?=
 =?us-ascii?Q?lQnU1eV4MPoSu1cQRUDQg0YYXv380CwDKa81ub1I?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62dae036-a601-44d0-fe20-08de210382ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 09:20:09.1694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EU/lnFFuplircjja7FmTV9vBlTzQqAvfTmhZdJJmIZcCb3t6y05yQkvkF4Ne9XGIsRw5XrjsXCUT/b58IBHBkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6615
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

> Subject: [v6 02/16] drm/i915: Add identifiers for driver specific blocks

*drm/i915/display

With that fixed
LGTM,
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add macros to identify intel specific color blocks. It will help in mappi=
ng
> drm_color_ops to intel color HW blocks
>=20
> v2:- Prefix enums with INTEL_* (Jani, Suraj)
>    - Remove unnecessary comments (Jani)
>    - Commit message improvements (Suraj)
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h
> b/drivers/gpu/drm/i915/display/intel_display_limits.h
> index f0fa27e365ab..55fd574ba313 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
> @@ -138,4 +138,12 @@ enum hpd_pin {
>  	HPD_NUM_PINS
>  };
>=20
> +enum intel_color_block {
> +	INTEL_PLANE_CB_PRE_CSC_LUT,
> +	INTEL_PLANE_CB_CSC,
> +	INTEL_PLANE_CB_POST_CSC_LUT,
> +
> +	INTEL_CB_MAX
> +};
> +
>  #endif /* __INTEL_DISPLAY_LIMITS_H__ */
> --
> 2.50.1

