Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19699D5AF6
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:19:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99E210E439;
	Fri, 22 Nov 2024 08:18:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IlX4DM/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3974310E224;
 Fri, 22 Nov 2024 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732263536; x=1763799536;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=TjAvefxy7TXZylVi3IXnbNtvEQUmthxEBoCdRwENmA8=;
 b=IlX4DM/ftL8/eEw56iCkLbmI1gV7D3QuN18qT+le2cSanbaBA4xS73/3
 odahOmXH/q86mQkSY7r5S1nV8ak+7Jbv5h7rc9HnVS0QBeivAVN6TlHSw
 q5eXWBwCysOIWDYsubFBXnOqFjBIkDjK1KATk1k1Nc/A6UO+LIUiMsfpn
 W/BLyQYHjn+g4J20cDFM9hwlOOSCosaDXkRb4qzYopWbGQpFYjjV48G7F
 Ijou5aiJ2UVG9lPrEdW/bkx7tg+7IPNxKiSj1ctwnFlVrjYzEd2l3X2UG
 E88T7tRXDFBq4q5VlX6n3K07fSWTXOpm1xSbJPvg8TZFeTe6JZbwaf0y3 Q==;
X-CSE-ConnectionGUID: vYov9Tr5TqytHYKyqXdyIg==
X-CSE-MsgGUID: uA94rkznTlmLPveFRp1ziQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="42922494"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="42922494"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2024 00:18:56 -0800
X-CSE-ConnectionGUID: yH8y2jyzRka39XHjqbJf1w==
X-CSE-MsgGUID: AH+CB3PwTZajIm+pqviPqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; d="scan'208";a="94953157"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Nov 2024 00:18:56 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Nov 2024 00:18:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 22 Nov 2024 00:18:55 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 22 Nov 2024 00:18:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy61m2EGip1Kv6sS4t1gGQmL0WZo0MGyZyGVcdpSVuaEbWeO6rcQu4URwIVQqY661vo7eUDTalA2FxFuiVXs/PhvEWbnhSnhcKX1ZYmNZyf1tRTBCeKfyvPM/x/KuqI6AxOTFwk6qSMgtEZQbhv5iw/cBY6wHBaL0PP4pZnRetJIUrE+/sS1x3tx4VyRVYUEdUqP32SrSUBYxSK8MD0rlQvXhJoqtHvbBUrRRVnxjPSksNUFGokwXV+ZBLWQ1sbHQZW/PIUt83R4vQrP1eNSTFsNXVbnNPBnYUZA1H4cBbOnukk2T+RqgibgTkmtiSjAc5Hej0NRcy1aUraXefaUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5aa2+5Tx/zDWWR1TF3frxNJXfhAJymus7WNQEaqrRas=;
 b=ycOFKl8AASKJF0/j2g9ub7nZVM02/jJaxtXsfQCFaqnnfATlA/M8fD1QT1NgYEoCUBYwyoJ8SzPgT4TKWqjZ3+kYq4yM2hqfk8tCMnisB7jb12aZUDcmm3kWDbV09fIaAqAd2JFNeSqeTLNoOEtuhNzeiJpoQM6exqDStd9wonUQlM0iEmwulHyHIc3AYnaP0AMqqx+N4O1CiuN/kdnQzE6nlRaC+1nOD9ndzYz9HwqKTBwZcv+SmYWEyOXtJ+pYiuG1eHEh/y4oRqzgSaXNGDUxXfyag43S18iWsDuXpNJAu/VuEnP3s8WodQh+TwcEFRfC86rw59EBoLAnO0e/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by CY5PR11MB6390.namprd11.prod.outlook.com (2603:10b6:930:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Fri, 22 Nov
 2024 08:18:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%4]) with mapi id 15.20.8093.027; Fri, 22 Nov 2024
 08:18:41 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Topic: [PATCHv6 7/8] drm/i915/histogram: Histogram changes for Display
 20+
Thread-Index: AQHbPBHywHPyMdnFrkepojCcF/9znbLBxdGAgAAHdkCAASVpgIAAAnxw
Date: Fri, 22 Nov 2024 08:18:40 +0000
Message-ID: <IA0PR11MB73074A02D43358C944B804BABA232@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20241121122603.736267-1-arun.r.murthy@intel.com>
 <20241121122603.736267-8-arun.r.murthy@intel.com>
 <SN7PR11MB6750748F22B5F4C6B1949A88E3222@SN7PR11MB6750.namprd11.prod.outlook.com>
 <IA0PR11MB7307C889E2B558CFE2632588BA222@IA0PR11MB7307.namprd11.prod.outlook.com>
 <SN7PR11MB67507FDB16D98414E2175E75E3232@SN7PR11MB6750.namprd11.prod.outlook.com>
In-Reply-To: <SN7PR11MB67507FDB16D98414E2175E75E3232@SN7PR11MB6750.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|CY5PR11MB6390:EE_
x-ms-office365-filtering-correlation-id: 6abe80f1-8297-4f17-f6be-08dd0ace45fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?pXV/Ty28rh6fLAbJuRvK39IDGLtzapNeH2Xo42zExlmGvJPUCP7fKdFEYM/t?=
 =?us-ascii?Q?RfK3lWEiXbv8n/S/iaVxU5JocL8nDCinm+4dvWNX2dyFHZiJpDtkxO6LvjCD?=
 =?us-ascii?Q?+VlG0LRl15CVEoAf4ISjTKmDZCSrCNCvptOtR9Jz3ARkGpiimXsyALhXhcis?=
 =?us-ascii?Q?7WeZi/SsJdAGUxI/ogA85zWke2mMOeNw21CBgj5Nc98q8ROM2eSsEp0Cab9k?=
 =?us-ascii?Q?4IDNKCOvVcHk9s5/l8rlMjnocmkFXpo/HJXSD+KA2tR7tP4BkraHf2HVUQZv?=
 =?us-ascii?Q?40jyZz7KlQnq72X8KZaPPbUqAu46DGYBoJoKHnXmdBEuXFIfUp7t8jpS8ntg?=
 =?us-ascii?Q?XlSyrqHDPXtC/4ELrUF1FW9K3n7d6wMynYcCMFnlz8ulrPyThTsndtjrw96z?=
 =?us-ascii?Q?V4ZDvEzt04jueu62EsrvlSSJ3ToIIWw+dpDCpNTdQuieIOugvuYnkmHUwWlL?=
 =?us-ascii?Q?KmVtJQ1ur668MRXCJFjDpm5tQ7mSVUMQMs3nPf6I6bb6BkKst+9WXeKJjuox?=
 =?us-ascii?Q?4UONDqSYGDWgZppcnaURcRGEjXxtze6P54KxFpEyiM/UDmttPs7Pd3vYl9LU?=
 =?us-ascii?Q?LGvmyhl/PhmRkmhoshcUb8M+DsYzhhMG11a9B2oo8W4gU0zOlj0ut7am0dsq?=
 =?us-ascii?Q?NsRpftyZ92cAentjSuQC93lNqirW0uxTQ7MORbcCdX75HR4h5Vz/SyGcupF5?=
 =?us-ascii?Q?O/m5hQ45cMRwkNI///Td/HtSuwZWlmcPUQTUxkdhyhSbtg0ZBQuxtA01DrND?=
 =?us-ascii?Q?xIuQlgQ5YFp4WLf1qVwfl7xK7givH2/fIjFxVMmFxJ57Z5xTEPHSDkqLWMmE?=
 =?us-ascii?Q?ZvNIoxAEj80xMS4pF7QhFvD1JHnREa6TjpMrbfdt5e9aWxeMAJ3nMQCdTH2D?=
 =?us-ascii?Q?WHr8mERkVcG+WmsSExzSe+n/6anKyrDF2nqAsNGGF4siwgzfHj3sKIrD/dni?=
 =?us-ascii?Q?+ri1f4MmfZf7OZrl5Lfn4EuE61iUPJ1qFT6cSqJwLwP16GLMhASefFU64V5g?=
 =?us-ascii?Q?7Z1E9w9ebbs7B12PlP0OWpmUIfZGs9ewKS1V5ZTjf8oIRIPeLKxqBcEt/3u2?=
 =?us-ascii?Q?4I0Sh8fJJ+jPn/fwFmfrJVzUJjvw+xuoBQhcOtlTdDKydXiszhvUb4+ModK1?=
 =?us-ascii?Q?rj/Aek51ZMZGJ2kzFako70B652wUMnsbd+nzoieDr1aDMFHO/8zPvxE8Y1Oi?=
 =?us-ascii?Q?K++HSsGWQvZBdMGoPSYjCE9nUMmtiaacpmK/DRCf9/3tXLvAnL/WmKHeHb78?=
 =?us-ascii?Q?6ErlOeXUlefNyD9V0/YemsRqAxlfvGiyh8EaOsSTGGPHQHTg10ur/W3plEwC?=
 =?us-ascii?Q?G0a/pM00f50oMZ7mR3zhKNGN2+r1lq5NOiuR35xS3SvLVAjfyKv/h5h1i2Cv?=
 =?us-ascii?Q?pXyUCr0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mbyDQayV0lraR9D+KT/84u7a1ktPmwdiHk4bXDbbaDZ35nLfjWHRt0BtUzIm?=
 =?us-ascii?Q?97TZr7y0+CLUvJEPAvpsc7mWsQf1gYJ/dhM+Gqz9x+kZ0oDkT4hOYFq5ptKL?=
 =?us-ascii?Q?vxttKAXIAAZUGtZxB5QYaTgXAImSXK7RRm4zkFXTFuDv2cHu4dB0H/rG1HtO?=
 =?us-ascii?Q?ixNYZO2F03PHXcz5bZvax0vbezjDiTbJxaoKtukNtsZmOHSS7WO2HEuR7Cjn?=
 =?us-ascii?Q?TTahbxHyfZaX8y6MB7G7DphPCFqpKN9eWPsyRu2zrZOHzSovSDj5kZedjLqf?=
 =?us-ascii?Q?YBl44QZn7/qDaPpK6ZJJSfIl01qzI7YTOczjqsGH8dcpAUuJB8IexHrpgvM7?=
 =?us-ascii?Q?wgQXZin4Zubfp4Glm7KMgN2V7EB4funCpiUHv/RH6wEqWXm7sRhvg0SDC9dp?=
 =?us-ascii?Q?6IcDD2DTasD5XQ+L/rfMU9o3NtB2Fkxlv4T2FghuDlRGtjx0K6NYuNiYoW5W?=
 =?us-ascii?Q?8bR8IV2xnc+daAL9EyDqnnE0/uUCAmJoA7gX24Mjr3QO+ILCJz4EuKTfxYV6?=
 =?us-ascii?Q?5ITEosxzNJ1fM29DGSN3mCkfI4auCz8GUlG+oUWI7PtS5t1fzWkyG2TSRFo4?=
 =?us-ascii?Q?sgiB1ly5LaoTOsZyz7Y3cwrM+1qLvwV5SM0mJaduBh7MDHiGewfXgNKaEI8m?=
 =?us-ascii?Q?keCEtmhgpmFV2knqZ1se3hx0TLJmzukCawy/9I0LGKGoQt4LU8g64Pm4FUvc?=
 =?us-ascii?Q?Bnlzir3oUp2AF2EXWEYZcDeGwWqk5xeCernb7Vyg+cSidKGERU/QRAPJKphw?=
 =?us-ascii?Q?9N6yFmtoNjTWwdsxZDmO18EwNzKxGbY0gCCI6qSgBwgOkB4DRiQyHSPZbkMo?=
 =?us-ascii?Q?4MrPjvN2asG+WSKlhL2vfYUOUIWsArj5Ac9xywHvwaqGhakAEYLngHKEiuaF?=
 =?us-ascii?Q?zq4xBGiO9USrf/un9L3+G0AZz++yjoHa+5QdT3bfrlCd1100qfqNW+8NtzH5?=
 =?us-ascii?Q?U2sRw1w1qy0odO06dSaeBboWucoeF56GI/49Wdjdm1swYJoaSXz1M71Uu56n?=
 =?us-ascii?Q?UqNk1sBwSfmSUx/YIr88oPzTDbb7yLa3aaiVZYmM5zZKpMab2GL12uOJ8eMz?=
 =?us-ascii?Q?UEvuJjcLO+Dj8yKNj/LcmLzwFLmMMQvyg7b0Wzb5dRf6GqCgd4TES/kewT+Z?=
 =?us-ascii?Q?3ZTr+ZotxvGR0wIMqEb7VKKjTLgqPHA0nBvMQztER3dC4r7y7JlWpW7QZufh?=
 =?us-ascii?Q?5aHRdIPLJ+SfIdO2YEvDTUuOOClYavOrrErISC4nLIv9WPRk2Jb4D8eQ7zOD?=
 =?us-ascii?Q?7FZdLPfJUC5gNeThL5qI/ndKhq+QP8GxY1W3pZb/KaWmTON0gi0trTvYnPXU?=
 =?us-ascii?Q?XoLxESt33j/u/GumByljd7uHO3mX4n1yKd02YrsvIDd3C9LjV2l5SVFVBdka?=
 =?us-ascii?Q?vrYlAcyb0gzVCCLIlQCQw0KZ5kxj/omTS6vLTcnUN743kIZ+Io433qD/l5NU?=
 =?us-ascii?Q?lyg/MuzhNQdKbZKh92sbVVU0l5EXK5sfCPNMOWwAQCNdTm/OeKJqrr9WF+X+?=
 =?us-ascii?Q?MahUm9wj3QaOet2wvJXri/SRfNVX0n5NGykgw5zmj2jpMVJMfMGwI8i2Lbfx?=
 =?us-ascii?Q?Rrqlr39k03MYsM8Wd77z1j2MoIs+54gFpicuL5wk/UC3GnGOudfugZDNPSpx?=
 =?us-ascii?Q?+/ZIk/BX09IIxvQx5+gZ+LIS0nxlqUjwcHznFq3QOA93?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6abe80f1-8297-4f17-f6be-08dd0ace45fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 08:18:40.9711 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YpX3dcox6bu/U7ggkOFSkPe55DvAQuORSZYBjRtIlIaVrubY9ysMo5aoli172x30iceGQDnNpoBdJqRIvdVuHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6390
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

> > > > +static void write_iet(struct intel_display *display, enum pipe pip=
e,
> > > > +			      u32 *data)
> > > > +{
> > > > +	int i;
> > > > +
> > > > +	for (i =3D 0; i < HISTOGRAM_IET_LENGTH; i++) {
> > > > +		if (DISPLAY_VER(display) >=3D 20)
> > > > +			intel_de_rmw(display, DPST_IE_BIN(pipe),
> > > > +				     DPST_IE_BIN_DATA_MASK,
> > > > +				     DPST_IE_BIN_DATA(data[i]));
> > > > +		else
> > > > +			intel_de_rmw(display, DPST_BIN(pipe),
> > > > +				     DPST_BIN_DATA_MASK,
> > > > +				     DPST_BIN_DATA(data[i]));
> > > > +
> > > > +		drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n",
> > > > +			       i, data[i]);
> > > > +	}
> > >
> > > This looks more clean according to me if (DISPLAY_VER(display) >=3D
> > > 20) {
> > >     register_base =3D DPST_IE_BIN(pipe);
> > >     data_mask =3D DPST_IE_BIN_DATA_MASK;
> > >     data_temp =3D DPST_IE_BIN_DATA(data[i]); } else {
> > >     register_base =3D DPST_BIN(pipe);
> > >     data_mask =3D DPST_BIN_DATA_MASK;
> > >     data_temp =3D DPST_BIN_DATA(data[i]); }  intel_de_rmw(display,
> > > register_base, data_mask, data_temp);
> > >   drm_dbg_atomic(display->drm, "iet_lut[%d]=3D%x\n", i, data[i]);
> > >
> >
> > With the above code snippet data_temp will have to be in the for loop
> > so as to get the bit mapped value of data[i]
> >
>=20
> Yes the  whole code snippet will be inside the loop itself
>=20
In that case I don't see any advantage of this over the present code.
If you still insist will do the necessary changes.

Thanks and Regards,
Arun R Murthy
--------------------
