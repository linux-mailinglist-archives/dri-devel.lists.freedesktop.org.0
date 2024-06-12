Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 523899050E3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 12:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92FC10E151;
	Wed, 12 Jun 2024 10:52:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mm9vtmbw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCE110E029;
 Wed, 12 Jun 2024 10:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718189532; x=1749725532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F4N5YwobO/kaKtFHzTQKIWmSERz/CXMvVj5rw93SodQ=;
 b=mm9vtmbwa6Zgxpp22cb4dqhSOUVHMpwgyunwLmRygz4Fnd889d6D1LWX
 FcYRqO4hdS9yp/678X+D7vRiJ8gQPlh8owegF4NMwuKsWQ0xWcH1mCXwS
 dyUHkR895CM1KEI+CPWl66M79Lm0ncow+yO48eF7NaZIUKoVlRo458qhG
 Dqg4CFRHgzJDFckn7XRnuFtZOue81D1o2n7U5WoHApeQ39BIAEQn0wMwp
 1XFTqxYKzDh3N4yNiP8h2wDvX7GuvdnEmR5f/kY/FFreZ5bm4FZAanYxb
 4rr+tjTSem/cxpvSaS+iF2lkbw6PcPlLfF5TzLV8jykiCSynEFSmXdRiP A==;
X-CSE-ConnectionGUID: dm9hl3dZTMG5srG5eBf9BA==
X-CSE-MsgGUID: z0cl0eqKR+aGOz56vf15xA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="14819652"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="14819652"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 03:52:06 -0700
X-CSE-ConnectionGUID: 8QZ85/lETNGspvWMYaHuhQ==
X-CSE-MsgGUID: g0DRbbyxQ+6jJE1k+KKPQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="44315137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Jun 2024 03:51:54 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 03:51:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 12 Jun 2024 03:51:53 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 12 Jun 2024 03:51:53 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 12 Jun 2024 03:51:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1GCmSJ87ttA3kWFqMwnPHegbdkE2eUTYsgl/NsraSxT5GwZFhrV6jWSQCszQ8NmEZKtXZHypufPJtmmdnKa5zto1NxyrhTfjkuIeVeCak2bTu5Z3je0WBeyxexCPBLhwFfs1N65Y1l/EGXIDiH3CDas1ysPzsR4MxFjM6OVt2nTSgGe6ZQIG+vf00yrUCu6duJahlN5qXS95TrxQHwRQpoeqbdRsQvR3rKKE0KMArDIS1rM47S4DovB4JW49gJwbtuKWCqi6lth+gerCUG4sbPaovX6SFrFqPj6tZKWcyhMP37xD0ZOKe8YdkNKATtw0GYh/oaM1RTUHGA/fVEgIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABLgs7CaA0TAxV2hOaR7UJaa9wLQUFG0N0irfp2ejGw=;
 b=g4Xppq2q0ZPUSPmc2/+GeZbvFwZsXJyoZTAC+Ky6tZhprbzFg/mjpz4/5gOxcjMoCjBeQ1+mvDlQ1JhztgNCNJEhWH4b4B6bVAbHH9kSxN31p0ADNO0lMUIrJeWkIOpqj3uy0w5EGh1tLerTVF1kX5hPkR//6Dl81z4ONth+BXhRgY9N92TDxyXd1fZ127tHj8l2nvkIy9HfOndkTeJOwd033HKvBuLM0PHQCF/o5oWuQztY9dwknlGL8nA9LZxU+VvWuSo8pmQ2M0PnfhxI3ThcJHSU0TKGekv4uLeyZ6mJbmovdNEAOTX2K3bN+yHavqxqI1vaj0k35lGxDugq9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB6349.namprd11.prod.outlook.com (2603:10b6:8:ce::11) by
 CO1PR11MB4995.namprd11.prod.outlook.com (2603:10b6:303:9f::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Wed, 12 Jun 2024 10:51:49 +0000
Received: from DS0PR11MB6349.namprd11.prod.outlook.com
 ([fe80::ded2:b4b:4444:a508]) by DS0PR11MB6349.namprd11.prod.outlook.com
 ([fe80::ded2:b4b:4444:a508%7]) with mapi id 15.20.7633.036; Wed, 12 Jun 2024
 10:51:49 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Lankhorst, Maarten" <maarten.lankhorst@intel.com>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/3] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Thread-Topic: [PATCH 1/3] drm/dp: Describe target_rr_divider in struct
 drm_dp_as_sdp
Thread-Index: AQHavK6Hvg8LV6pUbkmmzeVPIG75qrHD8o2Q
Date: Wed, 12 Jun 2024 10:51:49 +0000
Message-ID: <DS0PR11MB63499693000AFF7654C1FD71B2C02@DS0PR11MB6349.namprd11.prod.outlook.com>
References: <20240612095433.323342-1-mitulkumar.ajitkumar.golani@intel.com>
 <20240612095433.323342-2-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240612095433.323342-2-mitulkumar.ajitkumar.golani@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: maarten.lankhorst@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB6349:EE_|CO1PR11MB4995:EE_
x-ms-office365-filtering-correlation-id: f4e9d6c9-d657-4084-c8c9-08dc8acda995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info: =?us-ascii?Q?PJ63vLdTYdC6K2AtSUxPCRAn1kQHQy7xsadUdh0KTWenKXLTfjijYY5yzs7Y?=
 =?us-ascii?Q?Agr84q+zrya8txDc5xSUkf4jFKHQ7VxjLQHYhJpJOw34SYq8h8wfXzUvoDKQ?=
 =?us-ascii?Q?VXsOn9X/sRKV95AxDpj/mRyZm1c6YqU/VqV93GAUmpGAkcEsmp5x0j7X93Ma?=
 =?us-ascii?Q?Zlk7WGoPsRRuLlUSXkGad9RQDKB8BTQ550PVGCmQAVs8/pHMXATCtFdD0eo6?=
 =?us-ascii?Q?lf8n0LQ0pcfEfCwhtMCRfBHK4foQUG39Bfzqn/yrK3qMEK3G8e+jFZqr7pvM?=
 =?us-ascii?Q?fxfIrww9z5HxzOOdsaKsNkciIHnAs6N3dAEnZSGwDSj2xageLQv07zeGjSaf?=
 =?us-ascii?Q?abYDXnuEaYZXHAbyCHAPXY05xxt9nM7FcZiPBHCmYxS37w7Ia1vF/5SGB++h?=
 =?us-ascii?Q?U1VbvprGmUNT/iG39vRzKoUkXHtrmDSw7hG73KUFV+3j+qI8YwhC08b+/FU3?=
 =?us-ascii?Q?6elH0Y5UL8KLNC+PSd3ASqydhQt5P8j8N6qyCz9jaBKUffkD6sY6VkkGs17z?=
 =?us-ascii?Q?/aKYgRicOMLmemuqkF0qfSSNv6QMayjmPBQhvnWpfwQiVOm9cO5rt8hVrT6q?=
 =?us-ascii?Q?jik1zu2FSOMk0RoJVkzNO5zEboNtfkKbnf2b76AukAvuJ/LM32k5QRq+Yw6n?=
 =?us-ascii?Q?O7y/X8XQmA1n1OMYsn/dA8upNEluI076FauS5PeE6pKics6ZvNhP0jbAwD2n?=
 =?us-ascii?Q?FjYc+NmQK9t4ZEva9qlVd2R7P6GWRfIXy3BF7zOqRcys2+RH99JZz075n3ew?=
 =?us-ascii?Q?Tzm3UQBbSST7xd6q25WdwHiPf/pl4fWw/4VZRK/D6+cSsssW22KgEYRxYuD6?=
 =?us-ascii?Q?LludiOE88HIgFxuQCnZfFdAmOVNoQs8xHvko1YMmgwGOr6FkXUi6pcl3tWJP?=
 =?us-ascii?Q?WbQtxNbLG5LQ+dLGg6GsjTs9oQ+27BIyhZmrasliUovgdlUZZCTcPVxHHIxm?=
 =?us-ascii?Q?YrPKkQzg+Qi74nS6J+5bd9glEjhz0pPo421nwh57bu93ZV/PGlhay/KdLb7R?=
 =?us-ascii?Q?gQB2ciZN/iPVJ0ctEdjOlJ3pOwmlp9cDfs8B3fYfwtihGbsVu98xEV6LhJDh?=
 =?us-ascii?Q?IfFU3wD52jcBHKEl7Nzl2mekkJXnMx3t0JROhPbzrnjvHImpJEYczBX/1Zbp?=
 =?us-ascii?Q?XFIWhHLv451XS1K/GMFpTG0O455AJgQRRlBKPsem2kbZx4KFJRfLlG/S/QyZ?=
 =?us-ascii?Q?/4ffxsFBxEsUPcevY202FRbSNxShVLO1tYkVINOIxmxS0Z3jgeDVyzPZUDSt?=
 =?us-ascii?Q?j2BvOjAWTpSo7shrOb9SKhscD0eVZvgrxABss9/KzCNlONLw1RVdKNOU0Wli?=
 =?us-ascii?Q?RGkMYPt9M7XGZmLP3bqiUKU2ECRnt/4GNwZcILTMjcJOd3BuxuC/btZQNzT4?=
 =?us-ascii?Q?K9D1eCA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6349.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230032)(1800799016)(366008)(376006)(38070700010); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+xOfN+kBi4uXVJVP9KBineQ22t0RTBGp9yIYsWUNDy0PR9c59B4EwlvnGQJa?=
 =?us-ascii?Q?71lOiXqQjzamuqKUzvdNZCs0Q53HEFd1W8nXMK/fBME4cRqYTWO1zbX8tckP?=
 =?us-ascii?Q?650GKW1t2ijT4SpdHohde4y1nRFchd7EM1L7EaQkoEhcGi6bW8NFobGvXMq1?=
 =?us-ascii?Q?P24vu1DeS6x70Kxo2Zkzj+hcx04tD5Gf68ybopsW/R8NCM3aKhB51eY9Oyny?=
 =?us-ascii?Q?Atim5/2hFwGuySQslYjTmZcyqWZ4WQVkn47NAIRiTQCbGTe+ghr4zyiUblc/?=
 =?us-ascii?Q?fEUy1qhr3zWVVmPGD6zEjICf0v4/JOV/1ZcQf/DgtMT5HrlRj8yehXONwORm?=
 =?us-ascii?Q?Ba4qaY0GCmtwh1piD/ljosXWJe26D+HMmkYwtq00QOw0ymFc0UJ/clIY/aah?=
 =?us-ascii?Q?uqqAZO2c0l1AJpPiBwhnzr1E0WVjvYIxkjawozlkuasZqoA42lrQ28XLcqb0?=
 =?us-ascii?Q?vhect0qztK+7Mc8+i/SPyoBVqqKkVdkUwCISHn4dRcWk7AY8+LVG36rTnmKQ?=
 =?us-ascii?Q?pBlyCvrfdKR9v+jpcV7oQ1Iz0RQe6jcDvelckZlHo19FwpHyiQ6EBap7zIPf?=
 =?us-ascii?Q?ynOYnBpHy9HVZWAms22LyPF6rjZX1jXMlZXulE1/pfFKjRNs++wBudW+4n+g?=
 =?us-ascii?Q?4UoshB2VGqCAbgFyLzj1ukj3qmQee2SLS15DmEWIl4LjQ1WCT8uDj7+y1N7k?=
 =?us-ascii?Q?MfdL4l/fGDH9QC2M/fjet2172HC2iw7GBMzetonLEcoycUpIEoOTJEdGOsiI?=
 =?us-ascii?Q?eUCEqA6JLseG6sHNYGb4ca/CDUpKjiEqlVtKOteVmIepsKGEpEW0L5oA6++Y?=
 =?us-ascii?Q?NWWH1INL9EVs5b5XZkPt9DtesGdkkrqoZdDsPKfc+/U0bJIBBeUaKHMbiaBy?=
 =?us-ascii?Q?HI+nhZkiWBHfCB7XlGOffM6HJ/kRAhzR2av1SVpxsgsrNhptZ6QHVBCufOpA?=
 =?us-ascii?Q?LnZo7H9GjuXBjTFHcDvW2i7s6bZaV2dmWgB+b5m6v/LrCtXsLdSp2wbeQl6O?=
 =?us-ascii?Q?Ved8aTLl0h5tEtkaxlRmq4rhzGU693cc5sv8YfSSzREFDWbPslOVpapXYIZ6?=
 =?us-ascii?Q?McWqJJnZG7lW8oNG9K6JW0blNUxaokg3rjkepI4TTPBebv6hIaHRv9nJ3Pxd?=
 =?us-ascii?Q?vkGW1JLu/iLH+b434oRGi14hW59mh7d2tYLSmf1oVwulw3Lkawqq7XcOqisG?=
 =?us-ascii?Q?iLPWVZcaCTFtLKyPesiCxU8zGVkBwT7VMj4+klKlMgiuHyP3Bz5yb4e+rpbH?=
 =?us-ascii?Q?0EwCpyoINz7BzFQqeUfngMxgr2X59AbwXVH19VcvC1pfZvvqe9IZsIk9zid7?=
 =?us-ascii?Q?d6jBsRkIQTSgDdG3txvshF6fF9AV9axAULzMo3NfAwKumad35hEVDEInvYIh?=
 =?us-ascii?Q?/8140ony+2Z83kqNo49hi1K40krm1IyjaRM/2B1IUQQxMslV6womd/I5bogB?=
 =?us-ascii?Q?/lHsj3AlFRYIFiglxT63W4Rw3yT3JPiSXewpnUgK9qb15WwADt9FaBNbVdl+?=
 =?us-ascii?Q?g2g3szQrrKIDtcdBDYOu8KR5+HMVAtv9Lq/HjcMsulhq87LURs6yEvXd80cB?=
 =?us-ascii?Q?YmzlgZzDatO83OPTe+Lkefk35Y2XD+NY3noVq26LzIKWeBxzvKRYFgJYspth?=
 =?us-ascii?Q?Eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6349.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e9d6c9-d657-4084-c8c9-08dc8acda995
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 10:51:49.7656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XBKNkzc6giLqBvmNfm4uMUo8u98B+PF2VU3TSveiZufNl2K3cdRwhZqtWwKr7ITHpiYiqObCLLV3axy6fX+9U6ud5h7oohqy/CaDihf+0IllTlnYVqpaLIiPEZxG3/NQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4995
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

Hi @Lankhorst, Maarten

These patch series has required fixes for previously merged CMRR patch seri=
es. Can you please help to ack Patch#1 (drm/dp: Describe target_rr_divider =
in struct drm_dp_as_sdp ) which is drm patch and suggest how we can get the=
se fixes merged to linux-next ?

Thanks,
Mitul

> -----Original Message-----
> From: Golani, Mitulkumar Ajitkumar
> <mitulkumar.ajitkumar.golani@intel.com>
> Sent: Wednesday, June 12, 2024 3:25 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Nautiyal, Ankit K <ankit.k.nautiyal@intel.com>; Kandpal, Suraj
> <suraj.kandpal@intel.com>; jani.nikula@linux.intel.com; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; sfr@canb.auug.org.au
> Subject: [PATCH 1/3] drm/dp: Describe target_rr_divider in struct
> drm_dp_as_sdp
>=20
> Describe newly added parameter target_rr_divider in struct drm_dp_as_sdp.
>=20
> Fixes: a20c6d954d75 ("drm/dp: Add refresh rate divider to struct represen=
ting
> AS SDP")
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Cc: Arun R Murthy <arun.r.murthy@intel.com>
> Cc: Suraj Kandpal <suraj.kandpal@intel.com>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
>=20
> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> ---
>  include/drm/display/drm_dp_helper.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/display/drm_dp_helper.h
> b/include/drm/display/drm_dp_helper.h
> index ea03e1dd26ba..7f2567fa230d 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -112,6 +112,7 @@ struct drm_dp_vsc_sdp {
>   * @target_rr: Target Refresh
>   * @duration_incr_ms: Successive frame duration increase
>   * @duration_decr_ms: Successive frame duration decrease
> + * @target_rr_divider: Target refresh rate divider
>   * @mode: Adaptive Sync Operation Mode
>   */
>  struct drm_dp_as_sdp {
> --
> 2.45.2

