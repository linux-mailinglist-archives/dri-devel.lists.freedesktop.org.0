Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1C7C96605
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 10:27:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D6A10E346;
	Mon,  1 Dec 2025 09:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDKMbOpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4327B10E119;
 Mon,  1 Dec 2025 09:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764581219; x=1796117219;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5PxTjrW5gk1098N5dfYHO+IVE7pb/3wu34J6C+m2G6Q=;
 b=aDKMbOpDU7YoOe4oAA92XEl6bMGJUyEQwnU0w6HemgDuNUNzp7hffHzM
 xg3yYGE5GSSjC9vaOu2aKsRJomgW0W8qm+q6gvGz8LE6tb3IA37qvDeFU
 GoEOP/9RQmZcxCvPkO8gtso5Rfk8PGKn88NOPcleQ5oI2cfgOiUliIWd4
 eLiw8VPmvxVrI2xTCS0dHvraLam+vnCCFmAkaKNyZf5eqUzWD9uW2Fi4X
 T5DLUVCNdsvur79x8fnoOhtmGyQaJInK1dVJQ+E5XmvD1YvPSwZdh7Ehd
 wfD0DVy8DjSS5OPi+pSf5/BSVQIRXifnAThWYJ8ZRdfE6bLGPEgNC1inW g==;
X-CSE-ConnectionGUID: YHzEz4p+RkOIelw++iCpfQ==
X-CSE-MsgGUID: xEWc6X68R+azcrzgrrqBvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65697272"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="65697272"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:26:59 -0800
X-CSE-ConnectionGUID: 2sAf0OSXT5Ccgv2WtBUKLg==
X-CSE-MsgGUID: sefDpRToQN2U36pN2NhT+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="224997865"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 01:26:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:26:58 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 01:26:58 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 01:26:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hq8gfoURrg9pd2ofv+OddMF8fVa65IObDWK3NqH72CzZCBX0ArVCguhsNUZ6VJMMPXARx3T7JIfLx9APcF3OTj7HGgPRxfGJ9y/7GyuFywoxpIbYRdNvAvcqMhDikp2lVx1EsE/IOvCnwKI020db7OyeBgPiY5umB+tSgUWZf6948HEKSJiOwf/tt5kXomiWn6Q6Ll/emsJVSrc41uY0eolWonlPVd3fJrL6OxydOEx5+4JsYmrusk7qeovuAY+YwbR5uyXfuc9kchQ/Wx3+C2YtUlYheWgLgl+C8uLLpQdZSLu/CbYMdmrxBWsC70lrxbxZRdwVSv5+AF4UOyDF1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mqdHMfqaqUX42Gl/FjdKV2rkA5ehOhuuMUZffowqE6Y=;
 b=vmgZ/ZbFcPqos+0dZjof5Jp7GSDwbx+uYBFsEZ0TNmz5AsVNB5iWoPulIrydRkF2qGlibuTUlTpKOkRZTrq0oDgWsAQ33ALOHul5bfIS1snuBoyd3PYGcKTJlsWwNQmePvyt3uSHdMSBRrNm8MIOdj1cZe02E7f9FQ90F2NcXrL45dg3oUq1k25lCSOBS9ihbxo6iL4BH8jDFrFRAOns69L8vuPkXczxG0aIPGPS01kJBk16TfsFiYj+PjthV1Zb3t24W2iq8Z6ZKWZ2Kpg7TVkWXIWZZ/xhTeJBRUvBCvn7Sq5u+yok/f74aLT7W6mql9wv/dc99hGejM+135xjEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by IA3PR11MB9111.namprd11.prod.outlook.com
 (2603:10b6:208:57d::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 09:26:51 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 09:26:51 +0000
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
Subject: RE: [v7 13/15] drm/i915/display: Add registers for 3D LUT
Thread-Topic: [v7 13/15] drm/i915/display: Add registers for 3D LUT
Thread-Index: AQHcYozPoz7aLszB50Gkxnr3R69Oo7UMg/cg
Date: Mon, 1 Dec 2025 09:26:51 +0000
Message-ID: <DM3PPF208195D8DA66EFCD6B5A8A85D2735E3DBA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
 <20251201064655.3579280-14-uma.shankar@intel.com>
In-Reply-To: <20251201064655.3579280-14-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|IA3PR11MB9111:EE_
x-ms-office365-filtering-correlation-id: a08c6fc5-b78e-43a6-9421-08de30bbc279
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?B1TRzc6PnPbIcqJP/B2nmJfqXI672brkFn0CzChQuAJbAzPrryUsRrbkJ+02?=
 =?us-ascii?Q?NeKrzHkHBbABw9FmaNvRZ0aAv0EimeYFZJPge1DiclUr+IGm1uYXQYuCGkae?=
 =?us-ascii?Q?UTnxC+bmYFFPZDbdSxF4tRyaNxJ0z1AF2stusrMbd3hxITEbWjoXmSTms1RM?=
 =?us-ascii?Q?qjmNcqSVw3gO3OwPOUQN2+Bb9yAo/eCQ4A00UXngZ0zXASjO+ULrpSL4UfWl?=
 =?us-ascii?Q?9eV+p3i8u9pBTARA0YZinJ9tbiR7vdnJZ9jiw6JxgFrFGBhV/XgQshflM/tj?=
 =?us-ascii?Q?jNpKJwWybD66TpuHQNGfypTmIF5T6q98q4m+MCr/XjaTXcNlB7QrSyoX1rdW?=
 =?us-ascii?Q?mvmfiu+MgjCnJFkeaAfmo4fU7wN7g+jXY7iugFFfQDXijWRE2RABFtdnvFB/?=
 =?us-ascii?Q?jirXfv9BxNk3HGwwyyg58H6kypRhDI9DgsEYTeQeXIHyzjQ0M+PXWta5Eh77?=
 =?us-ascii?Q?AdhnzBES04IQNDHvlpBwj0Bd4vxUOl86PP6jZT1+Iq7TBvG4pZZPfCJnjGyb?=
 =?us-ascii?Q?5eNMSCLfGx+fWSpoXifcIObM350AG1yMXVtN1/a22P0NIM3UF9U4RtMnFl9H?=
 =?us-ascii?Q?zZVBX0cbN14hcl45821QuYUwo7xjr4RfyRhBhifyACJqH40gVhEZB7TuKNOY?=
 =?us-ascii?Q?rctvIm8pb4hB+b3/+IT1sDXczDXJHz8C20dlWz3RnfM10KqbKVyE6libi0IL?=
 =?us-ascii?Q?DSLTPGb6L6smYG07o+ZMONYAFynjI2AwYRpGnejwEEp5gN39dZXFg2W5IjxO?=
 =?us-ascii?Q?qUBt1AqjVRn4KEoF33M9gNp/pMhK5jacwo74DkVq3Qt/vf8nLn46WbWDFnxM?=
 =?us-ascii?Q?knkFjJvEslrXpADVDEPwB69sC6lYfCWeUo+xsDH0Q0v2hIj0ji+eHkQt89Q2?=
 =?us-ascii?Q?MRlFFoqJTv5Y3feW0ovUZADumAK1z/H1fr2Eu5MQ9holuyrBbKNul+S6KCDm?=
 =?us-ascii?Q?VoNwrtJ8ZzXumXRj8NPREumqWQ0sknHFkO/H3+jGlYjbbbCDbaNa9Q+xiTLQ?=
 =?us-ascii?Q?0CqoyUrvCIUZ5JLa25hVF6KPP4e8NvnA7oS4p8WZR/rbuY2RNMOpkZgyQnuw?=
 =?us-ascii?Q?XB01sMCo9RDifoP18NlaVwgQR2DKawpXwZ1CtVG1icdZ7gqQAZJ4iXtcdKEC?=
 =?us-ascii?Q?CVsMixPpZs+zqIuQ415AW6YkRTMgdZprfZ63UBynZnuc7XcHzKba42RIrrvl?=
 =?us-ascii?Q?vLdw1kNXslfp0Gr39OTFHjWF1RY6HGdQ6WWcjWS0Cq9K2+b6fkzpfpw8+M1J?=
 =?us-ascii?Q?cclqJakVUK71soUnLwrGbQQZnBCb8WLKcRcOY48BLoInvUD+C7shUm+lYZBl?=
 =?us-ascii?Q?yiv+FEwShfVjPZREC16PBdwOIndqUJ29UhXZMw6oBfu1OnYoaPB79+h8aYJy?=
 =?us-ascii?Q?CQcxbE0uP854MvCKnxJnZoB+yCEfWsFiOxTDFz0qyfSIfApulD+BlbTLp3rx?=
 =?us-ascii?Q?d58yCCNqLwAH1Ybv4mRYxHAhJviCKq1HGqoiDUK6gRWV8YLZkllC5lFIqt5m?=
 =?us-ascii?Q?7p3gMTR8rxv9OnQ6wKq0LDrfB9w8yMxFh600?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JI2R1eOCZmtmC2nrQ8mu/68Ah9RucGXQAMgBLS0YfiP+cZmpd0em6PaOk0vc?=
 =?us-ascii?Q?ix75mkwYHwl/44Jg3E3NzPtl2nsyZJ0h61fBjC0B6m7L308l67zL1GrgaiFd?=
 =?us-ascii?Q?mtvvEnoy0CDBLCs4ksFHUB3gxoiVgkIxtU2QXZr6tKyq90k6Ge8ocUD7f1E0?=
 =?us-ascii?Q?qk4jNJfynf1nEv/o7+pMcR4HhuR33+wkBq4++9SqXvUIbK4ZPK1bx/umfMHv?=
 =?us-ascii?Q?LSBM4gen1jRW2l+xMYqiayp3NjOa68PbS84akcGwl1gCRYqFws2gjRLpFtIN?=
 =?us-ascii?Q?LCRTVkBkrn41nyzm6DVyu2aB7w0NJgoX4EO84anM5cAnzDKvCJqZvuXIwAJN?=
 =?us-ascii?Q?KeKwg95/hJcFSiMTNw59y5X3OXDTlQBzkCKHJsFAij550jV+yjm95xgbDu2I?=
 =?us-ascii?Q?MSIRBsePtOZCWY+F49uesw9yTJoVbho9mRVQncF1pDQnomVvesjYzQd8nvR0?=
 =?us-ascii?Q?ovQ5xvi26X+TRugwP+/kaC9F75rs8fDWtQI3QMqcY6K1+ZtrvsR3FZOeuATv?=
 =?us-ascii?Q?OFsWdw+LMyjBm6Z9zNhM9EpuuLUbuqreJm9aq/yJWeCTjSEwuK13zsmWtEfI?=
 =?us-ascii?Q?h38BxD0LUCfeg8hRGXXDjNRGEW+2Lja8+e5boE2kPHw/otsW63l3tGlaOYOv?=
 =?us-ascii?Q?lZuUY6qdkgbrKRxPS1BrmVXv4j/bia9y2Cr1s8BCmswusmOTt3EBQsHiZdEP?=
 =?us-ascii?Q?0j0o+q3OWvHDoxk414umFy9xlJg4X9IDwtq9YdKr8SJhgM6SEY3DzmENHeBj?=
 =?us-ascii?Q?J6iaAfA3X3lWcHGsEUE/1R5AntLonsv3sD/HhuHiDqW6C14z4B2PIVGJMw0D?=
 =?us-ascii?Q?fUwEuVYgj9AjeZD4Gab728AXJRBukGIdRgCzg9oJ7J+ejGJmPDWiI1fwhQcO?=
 =?us-ascii?Q?jA7najR3sWV9DrrJ7bLQa83ISCFQO23I3N13KqKQlKvJUKjwscRO4a4hHgYO?=
 =?us-ascii?Q?PmsYze6m83+GwktmwwuukIIxrvxEjMiO0qpZDH2W4uJkX+S8flDa4qaptV4H?=
 =?us-ascii?Q?f8wjtFs7tHfOSeXanj6hVBuDqMwWmA2vHMNqL4a5c+0X4znY5IwFBj4LWTiK?=
 =?us-ascii?Q?CiJBywjv5yuRdOoLmNBsZdqRBgggf6Qo00INVZPo0vdA6bZp5lDmXuvtGyum?=
 =?us-ascii?Q?F6AU2/jlnCgHiWRBPpvuUj8IQWr48vDwh3YfoaUXeQ/JqiJDfXbAGpNiOwFz?=
 =?us-ascii?Q?XfYPThgrVUrQ5te6hbnR1VBcQ4fwslg2HURNIOW1NaGrdFf0a9g0IEEyr0CK?=
 =?us-ascii?Q?TWzIX2CEDIqNhRd11rZTtfkRzdvbh4EaRTe+BJp505Im/G32Xp/xIcWM0pLo?=
 =?us-ascii?Q?7KH+PIn5y5ZBbrMukdw6PCuNDAtQMr1/HYjsY5WW1/0/DH1e3lwFhW96PVbx?=
 =?us-ascii?Q?ZgF1duNfNfykpslphBfbZXgYQoXbnSF6IxOXRqlJpYEHTHwNR8Hk5qh6cbss?=
 =?us-ascii?Q?8mM8R54vjE4ucZCKAfqoiaBL7XbQIAXL34qt/I/Q3+QeanGWG2aSSxmzW3za?=
 =?us-ascii?Q?EAEFfJJCds7OBDp+14y+skpgPhMx491351QQdXs7YcQjpn5VyXDmWjTh25BJ?=
 =?us-ascii?Q?7jrQVv9k9pMRsJigt/nk70O887fQWQkkQ+qYOiZS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a08c6fc5-b78e-43a6-9421-08de30bbc279
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2025 09:26:51.2843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IFSNoLcqRk81IPFFKal2BACtRBLmiXY4MzzyNQhJazMfKwlmnEw8MUbMEofrwokRE0PPhUoUGVT6pORJrzv2jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9111
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

> Subject: [v7 13/15] drm/i915/display: Add registers for 3D LUT

This needs to be /color
Other than that
Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>

>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add registers needed to program 3D LUT
>=20
> v2:
> - Follow convention documented in i915_reg.h (Jani)
> - Removing space in trailer (Suraj)
> - Move registers to intel_color_regs.h
>=20
> BSpec: 69378, 69379, 69380
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_color_regs.h   | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_regs.h
> b/drivers/gpu/drm/i915/display/intel_color_regs.h
> index 8eb643cfead7..c370b6029369 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_regs.h
> +++ b/drivers/gpu/drm/i915/display/intel_color_regs.h
> @@ -316,4 +316,33 @@
>  #define   SKL_BOTTOM_COLOR_CSC_ENABLE		REG_BIT(30)
>  #define SKL_BOTTOM_COLOR(pipe)		_MMIO_PIPE(pipe,
> _SKL_BOTTOM_COLOR_A, _SKL_BOTTOM_COLOR_B)
>=20
> +/* 3D LUT */
> +#define _LUT_3D_CTL_A		0x490A4
> +#define _LUT_3D_CTL_B		0x491A4
> +#define LUT_3D_CTL(pipe)	_MMIO_PIPE(pipe, _LUT_3D_CTL_A,
> _LUT_3D_CTL_B)
> +#define   LUT_3D_ENABLE			REG_BIT(31)
> +#define   LUT_3D_READY			REG_BIT(30)
> +#define   LUT_3D_BINDING_MASK		REG_GENMASK(23, 22)
> +#define   LUT_3D_BIND_PIPE
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 0)
> +#define   LUT_3D_BIND_PLANE_1
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 1)
> +#define   LUT_3D_BIND_PLANE_2
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 2)
> +#define   LUT_3D_BIND_PLANE_3
> 	REG_FIELD_PREP(LUT_3D_BINDING_MASK, 3)
> +
> +#define _LUT_3D_INDEX_A		0x490A8
> +#define _LUT_3D_INDEX_B		0x491A8
> +#define LUT_3D_INDEX(pipe)	_MMIO_PIPE(pipe, _LUT_3D_INDEX_A,
> _LUT_3D_INDEX_B)
> +#define   LUT_3D_AUTO_INCREMENT		REG_BIT(13)
> +#define   LUT_3D_INDEX_VALUE_MASK	REG_GENMASK(12, 0)
> +#define   LUT_3D_INDEX_VALUE(x)
> 	REG_FIELD_PREP(LUT_3D_INDEX_VALUE_MASK, (x))
> +
> +#define _LUT_3D_DATA_A		0x490AC
> +#define _LUT_3D_DATA_B		0x491AC
> +#define LUT_3D_DATA(pipe)	_MMIO_PIPE(pipe, _LUT_3D_DATA_A,
> _LUT_3D_DATA_B)
> +#define   LUT_3D_DATA_RED_MASK		REG_GENMASK(29, 20)
> +#define   LUT_3D_DATA_GREEN_MASK	REG_GENMASK(19, 10)
> +#define   LUT_3D_DATA_BLUE_MASK		REG_GENMASK(9, 0)
> +#define   LUT_3D_DATA_RED(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_RED_MASK, (x))
> +#define   LUT_3D_DATA_GREEN(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK, (x))
> +#define   LUT_3D_DATA_BLUE(x)
> 	REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK, (x))
> +
>  #endif /* __INTEL_COLOR_REGS_H__ */
> --
> 2.50.1

