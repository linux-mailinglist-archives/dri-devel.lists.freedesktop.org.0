Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C157ADDF3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 19:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD9A10E2B8;
	Mon, 25 Sep 2023 17:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5223C10E2BA;
 Mon, 25 Sep 2023 17:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695664013; x=1727200013;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yC+nPsLbYdVMwtnwCb36vxKNBfrFtKm6J8sxpq015/g=;
 b=ExYFlg76QvM+rLtxpj5j0xbeaVF7O60UKBSXCZxfUB+Gp6ZHotGKJfgz
 2PDDPwu/9X6VhqFPU7MuiQJFKRO9hIFmKKKB6DwF1l+bNg2cxq6DXDCh6
 S/XR2v7YUswzI2uKLgRrJxHZTQzWcxWJEqKkp6+qGTCtuieAs+g5rVN5C
 o72TFNRA9IPW1LL9W3YYA1oP9bSUfl/ZbYRnZTBVK35t9jTfRKfwfuE0i
 0pix3oQgG04OIowgO4hjMdXONha6GMzaPnNlOFyqUXqE4Za301OnZw4BD
 hG3vC8OgsNnXyNFjJpu40UIFFaspmsjtgr+36Hze8MRQuefWPk1Q0t7hG g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360698430"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="360698430"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 10:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="777754589"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; d="scan'208";a="777754589"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Sep 2023 10:46:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 25 Sep 2023 10:46:45 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 25 Sep 2023 10:46:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 25 Sep 2023 10:46:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fNxYHISHIaIzTf4XjT1gvg3JeW+atYIUwPsmdK0m66YU4S5V/9ELrD8v2iPnExlAQITC4K7Gu9D49pgChK2WiedYOo4SaM6L9vD0f97zeDz7e/kOZGgTuOb4Hl3j/rs5v268M72fl/UjBa9OV1l/vBe4VRC/Agu4EeaYt4Ww7GY6nQeWDjA3/qnoUNZ6YljWkehNyPCPtMHvcArxM++zNFiJq0JHDElj+wq44+VlXMLX/950XJ+ZPF8U63y6Aj/GhdI93GQG82jd8OyC9xUbJ6Ao2y8+SJ7c3HxolxpTtNivMQwo4cTUm2njoP7tlA7bcrz8QcK5uzl1Gc717M+OMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zv6iIlMYlQ6DIDzO5EZzkaUi5JoSezgpaWjn3EgkxHc=;
 b=XXA8GEksLzNPqQvXhcnwFzSLh402Bkd5n046RZ80TPQbDAiVrdo6pHhKdyEYTQhGu98265WbLTkdezQ+Am+1W1s5JEzoSDGRX/caW/RDHi79gWghocRlDT6OIwBx42EbBO9BORHrINpveGhKKP3vqmVudbGMK00XWOZcH+QheOdnU7rNGdWsTxLfSybSpMNy6XSjtIvJ5KUik/JJz0FabivQyUng00DoXy+KOY1r1Gfw48DNTmXMdO/BoXSeaeGtXeWGvBfBGQooBC9X+ExubyK1Luq3flJZupbobpqXD5oOEIlvufoVQ+ARPdTNALnuQ/ETldmL1aVSKWtuNtR6gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by SA1PR11MB8373.namprd11.prod.outlook.com (2603:10b6:806:38d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Mon, 25 Sep
 2023 17:46:43 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::4426:1551:a299:9a85%7]) with mapi id 15.20.6813.017; Mon, 25 Sep 2023
 17:46:43 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
Thread-Topic: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one
 level of dereferences
Thread-Index: AQHZ4W2+XAvZx4OCDk2fma/k2hmYVrAr6+UQ
Date: Mon, 25 Sep 2023 17:46:43 +0000
Message-ID: <IA1PR11MB63480D7CC408A0340BB2C777B2FCA@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
 <6692fbce07fbc03ad8785e6e6fe81fad4354e657.1694078430.git.jani.nikula@intel.com>
In-Reply-To: <6692fbce07fbc03ad8785e6e6fe81fad4354e657.1694078430.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|SA1PR11MB8373:EE_
x-ms-office365-filtering-correlation-id: 0147fb42-9595-4436-fbff-08dbbdef615b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aUh6/5/zRKNGqPpeHx6Uhlml2un7eaHtTIrIr+tGDx0ewa97yH8Q6QXH9lgpTIksfDNTsnbBIIY0MEf3HTSjtAXjg7skIRg/fQTNZUWR6S/+XvGl5SmnMVgWY4WsSgO6vq4qyi2EtfAnf66LrmRW2lmFjbQ2zPeCkb4U1+M0PKbchUHhGyaWDhBOxF5r56U2QsjAivHD71RFdAiBBpS3QVfSqqWqtZujlciSRJKik0X+nQDEBK2zlxLPNr1hrkHgottEH4ydVt/dy1ZPEfCHwLJ8Kv3hXpwDrzmlZC9UQLuYo4DVnRMGg0Ch4b+Ab1rTpAi2L9WwHTUadTdJHV1PNg3zxAjPwV58AptuGu6GtShqI+Itv9fOQHBKGehnLvYJQQtEpHko8n3RXeo3GhJbe8Xp/rupEOTrFMlASwRulfhgVFSteRDD53FE6HPa4MWSd/gZScrrwNMPrWJyLMtiuDMHgg9wM1mHK2jRPNuRoc7zRpi1QAqiDDYuSHrk+IYRLtVOO8H7oHeQHKpIjGgn2UBsdRq963aIx5DI8HyqQO1+EvuIREQy0oF5kjfkXuLwqS6Ot8oYNa+bVTwXIsJJjkJn6qpUWaV0jYB9jPIKbrh0A51f5MQOGhMJHeEyMv9+
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(396003)(366004)(346002)(376002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(9686003)(7696005)(26005)(71200400001)(82960400001)(33656002)(66556008)(66476007)(66446008)(86362001)(64756008)(66946007)(76116006)(55236004)(53546011)(110136005)(478600001)(38070700005)(122000001)(38100700002)(83380400001)(55016003)(2906002)(5660300002)(8936002)(8676002)(4326008)(316002)(450100002)(52536014)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oW6jQB3avOXe6P55QIrQS/6t5LRFswxSPXdr/tcyd0DVeytgB1SkrGZeFZVx?=
 =?us-ascii?Q?RnGX3oj0PMPuwtgSBjF09VwL7zHMFOEc7+u4hslU3AZlgFWkjZ7bsSZJ9skL?=
 =?us-ascii?Q?fZvSZv6TUh1e325drghIg48DabQh/5KHZxBLs7sJLi81WsZOt2XCiv+dLyCF?=
 =?us-ascii?Q?pSefftmQdCrihMbb7ksPYNaBWbcFl9d73QhKg2MjLyFLvsEbZhBwrK7PAxmv?=
 =?us-ascii?Q?zLybLC11LN2DRIa62ain13SV9KuIra6Snw8APURnquL0WgamIZFVD3YgzDq+?=
 =?us-ascii?Q?0ViiE6zNN1h6yPp++WMYPDaws0Xf2gBGM01QqtjM2Jmy5gzFUwUDgEy8+wlI?=
 =?us-ascii?Q?eWQ+w8CautaiuVORGhpb04bzk5rTsawNj7iLE5XsG/WshKk1XfL3ex91imxh?=
 =?us-ascii?Q?gJNh2kt7/Z5YcTW71eJoxzT6eIOe0w5JX47u8XaZ4hrrFKOJ1gALmwp7IdJY?=
 =?us-ascii?Q?2aqenjw82fxpsau19Pr6RxwOE4DTTHhfM9WaTO0LCI6g0DdqeeEnp4nIDh6i?=
 =?us-ascii?Q?t6RfWdMh/hsuKwVDQbCR1Pts1MRZdBzZrm/cToW5TSS2izBRuB00cpHMESTR?=
 =?us-ascii?Q?zKBx7cxVD6JMCuYMq2E/+qOvP1HJ2OJkeNq9pIVdo1KfHxsfLG6uuXlgyi6T?=
 =?us-ascii?Q?TE0t8WtdpP+5M1QXJ4ISFF4dM4efcMMx63MYd+4UFSy86oknNW5dIdwjaoXG?=
 =?us-ascii?Q?Xv3fyy1PiUr1bLwbuyAWU90SMrFjiViwjPV4rU+MS5XykujwhOHimqdrGyZP?=
 =?us-ascii?Q?1wlMGS38th/QSbdZgkpxSeO8E7Dq7VG/PwJ8Cwal9rsUo3F3ipNXT0Q4XHAM?=
 =?us-ascii?Q?mtBvPAIbI88XfToGE6fy2ueDRwQI/rGmcVnUdO9shtjTcPdTxcA9bI3KOYnQ?=
 =?us-ascii?Q?L3HOejlxOT+SGMLBOmRvJ4sVupwRfCjFSYQZlIlqXAeaPGGjNofWZa4lF2Mb?=
 =?us-ascii?Q?LU5F6K2ukUT4CWQHxul5zdqjmvhA3n3dEVQauFLBBAp+YrP5+OxmlIx6EoiT?=
 =?us-ascii?Q?2abuoxZguGD2MWukTieP3wYK1D2hR4m6tK+iIw0NDKN/syh/zyl/StmDNce9?=
 =?us-ascii?Q?XFL4TLtEf59bDt0N2MJ0BW9EEhGtnFfPoxCIx3UxR+VE2wK3PJGa80y7BY+U?=
 =?us-ascii?Q?EAxVn1zUW7BsxCoeu7v2hq0qI43xZuakQZS4go7npY1jHYbCVw0gDvrj4XN0?=
 =?us-ascii?Q?U8cQ8e5UFuIzRxg1JKHtmJKv41rsnmm8sK+Qic0SHuEFli27TMwYEdjc3yjR?=
 =?us-ascii?Q?TnIkwDWsOXCQvrvUlzZOB4mcmz2FZVFIui7ck7y1dFPIUi/+nvZuMpylFxoJ?=
 =?us-ascii?Q?mWNSgLA9c4mwKbR/DAJ30qpQGktLQBMczhSsIPyh/CQmvDN3bysTaVz20xbw?=
 =?us-ascii?Q?zNN7VcSG1dVoHi2yAHjPA0LVHfougQR44NpE0PEhK/1bC++1r8uKzU7f3Y+A?=
 =?us-ascii?Q?7LV9sSGwnwNjUCSMx+YI3C8Ae7MBHKSUeztELIcuvIico9DpVUBKQyButVKS?=
 =?us-ascii?Q?lcqlFsqxxnbpAEljvlQAoXFIu00LX6hvo6N9g+CIRJD+B0LoJ4yMK14zq6rr?=
 =?us-ascii?Q?eeRxveXszgcQ/bPGWtBgwGkkKZnRTDOhHWNNIs3l0pEArueVA/WHr8mZcTLR?=
 =?us-ascii?Q?3kx7wD7oepRQC+HtINu6y9g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0147fb42-9595-4436-fbff-08dbbdef615b
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2023 17:46:43.0915 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KmbQMOrJx6C5JilQVJT+5TO0Dbl3DI0FwT8/vKbwE+yXio2qQFkmNkDBzC5eY+n7PBtY0g4lrbo/F3/ULyRrJsbsDYkRzS6mLGuLhQm0CTzhza/ErpDVf+kmttirnLEe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8373
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani,

added comments in-line.

> -----Original Message-----
> From: Nikula, Jani <jani.nikula@intel.com>
> Sent: Thursday, September 7, 2023 2:58 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; Nikula, Jani <jani.nikula@intel.com>=
;
> Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>
> Subject: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one l=
evel
> of dereferences
>=20
> It's arguably easier on the eyes, and drops a set of parenthesis too.

Please consider providing a bit more context in the commit message for bett=
er clarity.

>=20
> Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c inde=
x
> 2025970816c9..fcdc2c314cde 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5583,7 +5583,7 @@ static void drm_edid_to_eld(struct drm_connector
> *connector,  }
>=20
>  static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
> -			    struct cea_sad **sads)
> +			    struct cea_sad **psads)
>  {
>  	const struct cea_db *db;
>  	struct cea_db_iter iter;
> @@ -5592,19 +5592,21 @@ static int _drm_edid_to_sad(const struct
> drm_edid *drm_edid,
>  	cea_db_iter_edid_begin(drm_edid, &iter);
>  	cea_db_iter_for_each(db, &iter) {
>  		if (cea_db_tag(db) =3D=3D CTA_DB_AUDIO) {
> +			struct cea_sad *sads;
>  			int j;
>=20
>  			count =3D cea_db_payload_len(db) / 3; /* SAD is 3B */
> -			*sads =3D kcalloc(count, sizeof(**sads), GFP_KERNEL);
> -			if (!*sads)
> +			sads =3D kcalloc(count, sizeof(*sads), GFP_KERNEL);
> +			*psads =3D sads;
> +			if (!sads)
>  				return -ENOMEM;
>  			for (j =3D 0; j < count; j++) {
>  				const u8 *sad =3D &db->data[j * 3];
>=20
> -				(*sads)[j].format =3D (sad[0] & 0x78) >> 3;
> -				(*sads)[j].channels =3D sad[0] & 0x7;
> -				(*sads)[j].freq =3D sad[1] & 0x7F;
> -				(*sads)[j].byte2 =3D sad[2];
> +				sads[j].format =3D (sad[0] & 0x78) >> 3;
> +				sads[j].channels =3D sad[0] & 0x7;
> +				sads[j].freq =3D sad[1] & 0x7F;
> +				sads[j].byte2 =3D sad[2];

Thanks for the code update. I noticed the use of magic values in this secti=
on, which can make the code less clear=20
and harder to maintain. Would it be possible to define constants or use des=
criptive names instead of these magic=20
values?

Regards,
Mitul
>  			}
>  			break;
>  		}
> --
> 2.39.2

