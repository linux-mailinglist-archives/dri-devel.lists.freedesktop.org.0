Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F78C138C7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:31:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8A810E5BB;
	Tue, 28 Oct 2025 08:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LWXfd3Gj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6967110E5B5;
 Tue, 28 Oct 2025 08:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761640284; x=1793176284;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GrgvHKitdlf8zgLT2xtl5erARCsphGn02h5z4dKplW8=;
 b=LWXfd3Gj/VExs8dSWzmeu9jr9VbIiEqBCzq+xWuheuF4ncDvsKlyHZ11
 8VufvN3E3VrCgQPTkWrlGoVjTJjBv9+U2fGZPuhI06wdRU5CVvPV+mJ0b
 XYdgyFqsSpoEAL4dVyMjF/RDST2UnxnygnTLFGb22yJjVBcYYbGa2IeJw
 VPArbjY0YxYEFpqgt/gxhxYHPuydYR3BH5ALbeXDabu+vvvpe9ZBfWzAu
 gUVLjRIB9H52uETH0QmsmNcXBU7O21jCFzYNoCwgoVBv5fhWrBTrYS9w+
 M6asO+sfBnN42yCcGhtVDDEyanowpu9+Pn7R/EbvpnpKfSIgPan4BKpQ7 w==;
X-CSE-ConnectionGUID: +YTUu67DSGqHEFUXqAM5tA==
X-CSE-MsgGUID: m7eGz2Z7TneORggTrVF2nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75180374"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75180374"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:31:24 -0700
X-CSE-ConnectionGUID: R64iRNPZQgK1ZIIfdvs8HA==
X-CSE-MsgGUID: 4jUI0VNUSNaTxp6J/KN5Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="215941534"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:31:25 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:31:23 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:31:23 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:31:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoEaoqqo9KzlvcNJCrb+gWTdEkL6NATCfNTePWoTXMqccNux8u27KwLQRAK8KlulKTMNDGsycv5OKi6E75NtLeIVwGBz2KA9PQhjE2IoCe86xw2UffSZI3niZv3YMshjcU+o2z+ZVEaRic7LWnAL/1BSOjZudQLStEl05MUaGhn5UxTS9vZncQ/7QZ5Mazy2P4rNsn6hGYlXGovpghccDPNu/WxWhmtLmoz8uRp+8QJmxUAR1Lj02BT+DSGyqz297zM1ZCBxnD0ZFvfEvd9XbszEu2Q5fmb/DkVeE0unP3/opq28t6eSH0RAPCHXDYnx+P85pgv6GaL/rkVJV1jaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24G+LCCuHKqC8U6aosOdno/XFeX93/gNAw9EsC/wNK0=;
 b=a42Ngi5vQRu/fy0/Z/LcYGpLuKlnq2tRAtC8QUPuZwvOF1J7ChMipHjAQd9FstyuZnNm3AITuvcmo3kbS+IE/gqzsFHc0x4qr89WdcqJkIlWdZVd9UvFBgmkHk6aG7jrD1V0QiW5j8eNIdDMt/Tj3dNOZsfRfBE0N1GuTGvE2pMTiUTdk75t5uferZqS/N+SjJeJQCUCQDYVOl1LNFtWpQZZAEL0NCgl6ohuqd8F1p7JexasMAUfm/NB3a33pb7vEPAUwSavteCgkhVOohSpqThc3AolLP+WmEksdlJI0cPOeHNab/+TlBA6O90ROs9C/xi6Z5eJUYIFatDFDZ/QYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by LV3PR11MB8505.namprd11.prod.outlook.com
 (2603:10b6:408:1b7::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Tue, 28 Oct
 2025 08:31:21 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:31:21 +0000
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
Subject: RE: [v5 23/24] drm/i915/color: Create color pipeline with
 multisegmented LUT
Thread-Topic: [v5 23/24] drm/i915/color: Create color pipeline with
 multisegmented LUT
Thread-Index: AQHb6zEBUF+1zXDggEyBLteX5jbWErTX8/OA
Date: Tue, 28 Oct 2025 08:31:21 +0000
Message-ID: <DM3PPF208195D8D852D93A4290286B5EE98E3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-24-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-24-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|LV3PR11MB8505:EE_
x-ms-office365-filtering-correlation-id: 8d452fd1-8f55-48ca-ddbb-08de15fc5fbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?fZ+4AvPx9XCSYlPEz5bzNgFM2KVwCqdTAIsq4IAyC9j/LcGsdB1YmHJ3lhrg?=
 =?us-ascii?Q?BdNg0EdcLZu3lP8xmhOuP+EwWxMUU/xaX4MGZh5vsPKAkIH2jWG+p027Tm9C?=
 =?us-ascii?Q?fd2YCE1UibPWLxBJ1wLP+klQwAYvUJb5Z1Y+zr2Nn82XbzEln6AvU8g4N79e?=
 =?us-ascii?Q?FgZQoV3TLptxLePzSStBL+gqHXtaA3s7t3yJRUvbd9eXz+v78LkTjYAGKBqY?=
 =?us-ascii?Q?dcR+glNEtAxwuVPP50qVxU48adXgEf+m22nVhWQwbl7I4Svwnv7V7LMRGQ1s?=
 =?us-ascii?Q?TiMG3P9+RSn+z91vVhk2slKI3piN1BTTJspv6T4A4AaxoRIQ6H4vAJVYaHKd?=
 =?us-ascii?Q?yIp5QaEL/2SwP0HVJuk/mpBanQoJDDzkvvvVtw1qJU7bTGWSZNEt6UWH93yB?=
 =?us-ascii?Q?g6//JqWNBLPQiPWZRJpSTvqqsuXqVyUbwNDMFindUMdPNO8bEb/PQbRRLQPT?=
 =?us-ascii?Q?fyQnVKo/+XxDmKLGc99BHvtc0DDNicIdSId/Rg2dwa6AloxNvGSCiJd5igqC?=
 =?us-ascii?Q?3dztaJOvMoyaTIKCkylMLUkLfaToN3aPwEh5mwYk5hpmXA6zcTtETqpuKGq4?=
 =?us-ascii?Q?xKb27uZqGuC/tZ1F07Zjh2T8ag/rRtS0nHSC6aMNoSXIu1Hf+KBPlvZe1h67?=
 =?us-ascii?Q?cSO1mZfCiI/jDBS6aDTRYx1a9mYbo6ZDOZGg5sdbtHeGKGyUYcf2r9s3Fuim?=
 =?us-ascii?Q?K69OZM4u5N6jz7NOcXBmasp0NiAjeAO8GA5nX10LXy/y1s0h+ouN+xsiOFFf?=
 =?us-ascii?Q?sDWMHYRk8ECbcO60y3EDWNc86BZ2UeQmsvzeSlcppBooKjiXqq0WP2EXS4tQ?=
 =?us-ascii?Q?u9yoPPbhJ9EPiDyKX1jdAeMFBVUl8dgO2oYGAyffZE1eqi85W5bs4X0QJ5rf?=
 =?us-ascii?Q?oKFAcNxqpAQDqzgytGlUxedK5R88bueL9wJJjLNPf+11J/5iibTblq6ODM5l?=
 =?us-ascii?Q?7xdV9GNvGUgI9PsjHik18rkNnXumZ+VTzC8vIztXpXdnDjtxeO3Gy3on5t6l?=
 =?us-ascii?Q?jy1QaBlhoFv3vexv/5rAqyGo3fUMWClGH2O7hFLfOH35zIeEaELLnSWq9z7g?=
 =?us-ascii?Q?sQf+oO8yfc794+zPvA3d9f+poIKrROO6SFsyVhVHXKKyIzX/c7IGSmxNBm4g?=
 =?us-ascii?Q?izfa4OikbP0zT7ofLdQmZAWbXLP+TK7OCzwcr4AQong8TEKBRfFqVrhAb5Pn?=
 =?us-ascii?Q?cqDPIkojx8QBrqkOuSB5Na83j7Q7Coyf+19sjl2pDMsAWoaACd6kQc+I4p8W?=
 =?us-ascii?Q?qYALWvgT53Gi66vK7g7X2IRKBNuDiO/+ADg3d1PRUjC8ycQ1+K0HBZApBLXJ?=
 =?us-ascii?Q?gL0hA6uPVrd3ZSR0kg3Bt9XGHYb1mOjuVoCtoshltWLZO8crWl+HP3rU/zvD?=
 =?us-ascii?Q?0IMVOUbrH+jUqdG8rNdEmVlfE5t1HbUi1pXWrjksqXfqic+S8Xz8VtTkan3K?=
 =?us-ascii?Q?KR4uWDCjEOaqCip7XnMs/iID0ah/uPamZgVncA1OdLx7DfKg4RyA8XFkZWNY?=
 =?us-ascii?Q?W8l4mlaLdfukMmDNgb3oJ/Kt8PEYufFtC7/1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3lEZOdnYqkLvhaYSQYKGBV/qzbIEbUSQ5uJ2kpjt8R71VV13qJxpYFcrrp2D?=
 =?us-ascii?Q?+5ZoYM3BJ3fMmoPkFGXJKJLjYdmN6l7Z1WyrtBqgpjyap70NeJpUuy6PB6MG?=
 =?us-ascii?Q?g5Z+fN4O+wmC2HYUlrlEJSjRKw8TcubOlNkE6CJhVz/PaYYMv0wXU6nHMiDU?=
 =?us-ascii?Q?M9i/YHtMx7VzLJQI0C40mT9mpxmI89NnoUX21hMvt7XhN1h0bD1kp3miPGRJ?=
 =?us-ascii?Q?ZLYHBcwJoNcO698/uk5mIBOpppfbnBMTl2SkioOsbViRej7xCNTKkzFCDvGR?=
 =?us-ascii?Q?3x/f5yt+C/R1M3A75VHGLC8klqqaRjWEMYCreBNwOZTCQqTPmk+oXb0+EN2F?=
 =?us-ascii?Q?QcF+9wj72oFU8bNCIPKabCjI/r2xAd//1LoZAperUolJP66JmruhOPWqXPPr?=
 =?us-ascii?Q?2ygUR8HfEP8ZGx1BJgnL4XnBIA1SyriF93tuNBBpRnNWsAKIBCzRY8mGW9PG?=
 =?us-ascii?Q?UvjER3k5X/263llB4olwbjtglFrAmAbCxy0pNmGCWQQgBEikuQOohqkrSHu5?=
 =?us-ascii?Q?V/CDkj2mGYpU+LEnh5f0v1R/L8rjphG4OjCO+mtyE1tlu4SSPs2tDCw7FRWi?=
 =?us-ascii?Q?LC5U+igwsJe0IE4QSTlzWlM7W3FwFOLrz/CYKFFFZuWlhs1k3qavXb5EVfRV?=
 =?us-ascii?Q?4Vu3WEy+dBZRYIFSFJEbREGPQF9D8qUTSFyeG3tjWWy8rZT5EfdteHXaTCg9?=
 =?us-ascii?Q?Dhez3cm3osG7Yg8Qn5IUe6XJS9mMahr+dMfwxS6gulSadgn8/OZM4R+yCn1E?=
 =?us-ascii?Q?uf2F5+6NM1yUd2QBBH9XfiPG3mH6zisBlGrtjpxP80ke6OVAoPEtrdzQ6Jql?=
 =?us-ascii?Q?geYNlsL7YC91JSavqdTjRWFT/ngl96OsZAoIZta033VlF257wUNHUrhcFhzz?=
 =?us-ascii?Q?6LPH2VJE9FQrSWwP0MZcYoTWs2yJnROuBttwwbdRkv3DOqEuBsg4rRsDRQm7?=
 =?us-ascii?Q?winTsNODEQL42GQxbkvMqH/DmkvMNiuJa8X81l0jlUcZEUdxZOG0qb2I8L4Z?=
 =?us-ascii?Q?X1bJe4arWhePFLLCrOn1qcLDq1iz3vUUey4P6V1ohJeykhfqmXT7DjhFRhba?=
 =?us-ascii?Q?DLX8yeCT8DFcenhSOlz8aZVHWOTwGlHQ7ieBzDAkeLjIMJDAodv1tiIJKRt1?=
 =?us-ascii?Q?dIb4sQL1qZkvDoWwa8Y3Q+qaCNUSXv9Pev9H8DVfJzs9JLfU9TJEUFWIElJe?=
 =?us-ascii?Q?rOkdDLO8l3U7jog4WlM+g8RctyjM5ldzfh66luXSLtWXJ+w8pspqdR6jMP57?=
 =?us-ascii?Q?RC/AJTS4rXJHsdyO77bgYyLpB8Dw21b5Jtp9TAdCdLMG+cTFZdr//9cl614P?=
 =?us-ascii?Q?vmQu4d7Yb4WsmaYQFcPWHeuG5Hc05keD88LyBk5F5d1tyzoblRLGFlGDv5YO?=
 =?us-ascii?Q?aAcx9lJ1P78LQaiMm6p5SGkrR+YwzBGTDMCQ9dbiJGt7TEdsgi6sgsb4rA4B?=
 =?us-ascii?Q?5cL6I040/4af+KFa0/2RXoIQP/+XDBFfV53M6mAwZvcHbvjWZ94sp8pE7VS7?=
 =?us-ascii?Q?usYhmDtC4QSQAXuOiykl4yyE+aySusnS+wUffkj35/AJzGp44AmLMY8Zpoop?=
 =?us-ascii?Q?+yHnVSkXvl22wIb1UemLEXT5VdMmZ0o0z9ZJRWrQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d452fd1-8f55-48ca-ddbb-08de15fc5fbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:31:21.5249 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yWIrbQyRvjdeR9rfkd+vgTfhVyRGwnI80B/Wcwgv3Kfz+k/+sf2PDAanHzCR56/feSMW8Oj60ddKeAMEj+0Ebg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8505
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
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Um=
a
> Shankar
> Sent: Wednesday, July 2, 2025 2:50 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; Sharma, Swati2 <swati2.sharma@intel.com>;
> alex.hung@amd.com; Shankar, Uma <uma.shankar@intel.com>
> Subject: [v5 23/24] drm/i915/color: Create color pipeline with
> multisegmented LUT
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add a color pipeline with three colorops in the sequence
>=20
> 	1D LUT MULTSEG - CTM - 1D LUT MULTSEG
>=20
> This pipeline can be used to do any color space conversion or HDR tone
> mapping
>=20
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 185 +++++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h |   1 +
>  2 files changed, 186 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index 689bc4f4ce25..cf2e1e3653b2 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4311,6 +4311,139 @@ static const struct intel_color_funcs
> ilk_color_funcs =3D {
>  	.get_config =3D ilk_get_config,
>  };
>=20
> +static const struct drm_color_lut_range xelpd_degamma_hdr[] =3D {
> +	/* segment 1 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 128,
> +		.start =3D 0, .end =3D (1 << 24) - 1,
> +		.norm_factor =3D (1 << 24),
> +		.precision =3D {
> +			.intp =3D 0,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* segment 2 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D (1 << 24), .end =3D (1 << 24),
> +		.norm_factor =3D (1 << 24),
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* Segment 3 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D 3 * (1 << 24), .end =3D 3 * (1 << 24),
> +		.norm_factor =3D (1 << 24),
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* Segment 4 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D 7 * (1 << 24), .end =3D 7 * (1 << 24),
> +		.norm_factor =3D (1 << 24),
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	}
> +};
> +
> +/* FIXME input bpc? */
> +static const struct drm_color_lut_range xelpd_gamma_hdr[] =3D {
> +	/* segment 1 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 9,
> +		.start =3D 0, .end =3D 8,
> +		.norm_factor =3D 8 * 32,
> +		.precision =3D {
> +			.intp =3D 0,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* segment 2 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 30,
> +		.start =3D 8 * 2, .end =3D 8 * (32 - 1),
> +		.norm_factor =3D 8 * 32,
> +		.precision =3D {
> +			.intp =3D 0,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* segment 3 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D 8 * 32, .end =3D 8 * 32,
> +		.norm_factor =3D 8 * 32,
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* segment 4 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D 3 * 8 * 32, .end =3D 3 * 8 * 32,
> +		.norm_factor =3D 8 * 32,
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	},
> +	/* segment 5 */
> +	{
> +		.flags =3D
> (DRM_COLOROP_1D_LUT_MULTSEG_REFLECT_NEGATIVE |
> +			  DRM_COLOROP_1D_LUT_MULTSEG_INTERPOLATE
> |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_SINGLE_CHANNEL |
> +
> DRM_COLOROP_1D_LUT_MULTSEG_NON_DECREASING),
> +		.count =3D 1,
> +		.start =3D 7 * 8 * 32, .end =3D 7 * 8 * 32,
> +		.norm_factor =3D 8 * 32,
> +		.precision =3D {
> +			.intp =3D 3,
> +			.fracp =3D 24,
> +		},
> +	},
> +};
> +
>  /* TODO: Move to another file */
>  static void
>  intel_color_load_plane_csc_matrix(struct intel_dsb *dsb, @@ -4424,6
> +4557,52 @@ int intel_plane_tf_pipeline_init(struct drm_plane *plane, str=
uct
> drm_prop_enum_l
>  	return 0;
>  }
>=20
> +int intel_plane_tf_multseg_pipeline_init(struct drm_plane *plane,
> +struct drm_prop_enum_list *list) {

Need to rethink the name

Regards,
Suraj Kandpal

> +	struct intel_plane_colorop *colorop;
> +	struct drm_device *dev =3D plane->dev;
> +	int ret;
> +	struct drm_colorop *prev_op;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_PRE_CSC_LUT);
> +
> +	ret =3D drm_plane_colorop_curve_1d_lut_multseg_init(dev, &colorop-
> >base,
> +							  plane,
> xelpd_degamma_hdr,
> +
> sizeof(xelpd_degamma_hdr),
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	list->type =3D colorop->base.base.id;
> +	list->name =3D kasprintf(GFP_KERNEL, "Color Pipeline %d",
> +colorop->base.base.id);
> +
> +	/* TODO: handle failures and clean up*/
> +	prev_op =3D &colorop->base;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_CSC);
> +
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +	prev_op =3D &colorop->base;
> +
> +	colorop =3D intel_plane_colorop_create(CB_PLANE_POST_CSC_LUT);
> +	ret =3D drm_plane_colorop_curve_1d_lut_multseg_init(dev, &colorop-
> >base,
> +							  plane,
> xelpd_gamma_hdr,
> +
> sizeof(xelpd_gamma_hdr),
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	if (ret)
> +		return ret;
> +
> +	drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +	return 0;
> +}
> +
>  int intel_plane_color_init(struct drm_plane *plane)  {
>  	struct drm_device *dev =3D plane->dev;
> @@ -4448,6 +4627,12 @@ int intel_plane_color_init(struct drm_plane
> *plane)
>  		return ret;
>  	len++;
>=20
> +	/* Create Pipeline with Multi-segmented LUT */
> +	ret =3D intel_plane_tf_multseg_pipeline_init(plane, &pipelines[len]);
> +	if (ret)
> +		return ret;
> +	len++;
> +
>  	/* Create COLOR_PIPELINE property and attach */
>  	prop =3D drm_property_create_enum(dev,
> DRM_MODE_PROP_ATOMIC,
>  					"COLOR_PIPELINE",
> diff --git a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index 420d596dbbae..1808b64a6903 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -52,4 +52,5 @@ int intel_plane_tf_pipeline_init(struct drm_plane
> *plane, struct drm_prop_enum_l  int intel_plane_color_init(struct drm_pla=
ne
> *plane);  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  					const struct intel_plane_state
> *plane_state);
> +int intel_plane_tf_multseg_pipeline_init(struct drm_plane *plane,
> +struct drm_prop_enum_list *list);
>  #endif /* __INTEL_COLOR_H__ */
> --
> 2.42.0

