Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D98928F44
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jul 2024 00:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E723010E04A;
	Fri,  5 Jul 2024 22:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bph8/Ebb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3697010E04A
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 22:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720217483; x=1751753483;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PFkAJJfyBJktdyqUv4BTL74wKbh7v5Jei6+QAs1Kmn0=;
 b=bph8/EbbpGpfhcqPbebbPpv7uM60oTsrsoIGdGPQ6f6QmdgLHYyUHnIn
 2jUwv65qnghhkqmCQPCBTqu62on4ZL8NXpCM4dkO/ZE6mk69khnf9AH/+
 1jwWNR/4nKIogf0cWRh44kD6IWr9NyEdOR/OXdrufIqaoJhQBwb03OAmN
 0YQHnxoF7SrJKo+xcfRjSdi+80UznCWHkdM7njLVPAER+DlbCPafAjZZL
 f9iGnIpm6tyHcP2d4vQtC7q/BBA7JH6WjRUBUUt3ExFSrheWJyqKUuDTl
 IiEq8jQn+ASv//qVw3YASKc50K56tjeG9gHEnjLBmWt3DyeLx6xw31ROn Q==;
X-CSE-ConnectionGUID: Y2QFjSL4Q/ih+jq6Tf6now==
X-CSE-MsgGUID: mQGSTZKoSMiXOPpKXWHBiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="17640836"
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="17640836"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2024 15:11:22 -0700
X-CSE-ConnectionGUID: knRXo4T+TOWwjXOkBKBJHA==
X-CSE-MsgGUID: S/Dgr07YQKqkBhU9m+Q2PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,186,1716274800"; d="scan'208";a="51394532"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jul 2024 15:11:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 5 Jul 2024 15:11:21 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 5 Jul 2024 15:11:21 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 5 Jul 2024 15:11:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AdB2HnKs9VIJCUIV8lZi8tnzE7KT6O4st+qY9PcFIvd/KpSPmJwxBvnCSQB/n8E3aHebRn6E5lqwLMEOXbk3MjlqUdcxa50LJbhX/3H5MC8rhfuZf83q7yntRHOqYLye7ysZXuHA+wNoydlCSJfT3kAYEGr7AxuLXDKldZ0W1z+vC+/1zk03PvlXuT3Ujyb0uOOoHgp/1Nx59vft8LpYVsRHnriSUpI5ffcixWYuJVEUoim62G1JLliJD0L4qmGrSXYApo74DX8aT6+vP9r8hYEwCf8pIkCmfcngwIHxa4McGwivaB2vosPPnl60SwCqQLpbZlGiVZzTWdi6QBqlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpuoViaNXNQKkwwt/biyF2A9KElLDgqTVM6iqQj0oAc=;
 b=KCM3RSGuomN0NF5On+rexOucZswosMpNCDqkDhKTRBazGdG2TgTc3SnW5vDqW7/6nDkPLZfOTI4SvbPE76AvvMM0wWMV6qjbH1hYsmC7fm3IAHbWLmYAMd/AggcS1EakzCSjpJK+sG4u3V849MFyzrNawIEKe7h3s9tGs+qIcplr20WHvNQul4mk+SSvAgyHfgK8Q1PPlt4xbLoQzsRF644qe01KdSoXhuQ8QX/Wn3DbxVCn7ZluCptoJSeoB+0Hf8dysnbVkSNoi6QQgSFtPjltpF09+BYOLfvqJque6DaED7XoPNuueQ0WXBDta/7tG6FYrLoofFlo+c6UJTFHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Fri, 5 Jul
 2024 22:11:15 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%6]) with mapi id 15.20.7741.029; Fri, 5 Jul 2024
 22:11:15 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>, SeongJae Park <sj@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, David Hildenbrand
 <david@redhat.com>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig
 <hch@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Hugh Dickins
 <hughd@google.com>, Peter Xu <peterx@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang, Junxiao"
 <junxiao.chang@intel.com>, Jason Gunthorpe <jgg@nvidia.com>, "Christoph
 Hellwig" <hch@lst.de>, Dave Airlie <airlied@redhat.com>
Subject: RE: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHaxgToxlMQ2CD6IEixCdEB+DqB/LHorVKAgAAJwgCAAApVgA==
Date: Fri, 5 Jul 2024 22:11:14 +0000
Message-ID: <IA0PR11MB7185570E3FCFAE3E7BDE7991F8DF2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
 <20240705204825.109189-1-sj@kernel.org>
 <20240705142320.000b1e520b856b7c034bc829@linux-foundation.org>
In-Reply-To: <20240705142320.000b1e520b856b7c034bc829@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB5993:EE_
x-ms-office365-filtering-correlation-id: 8ad9cb08-32e0-4475-c248-08dc9d3f62e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?P8G2cnGgXG/J7P4t4mCWtCvcKTmefl8gDbgl+xhgOFvQIeDX078vFdkccapH?=
 =?us-ascii?Q?vWvTwE14CjNmUKXKM/tRuHlimXnlTBl5XFoRpiT/dMf9m0Jqqs7KVngHGcMI?=
 =?us-ascii?Q?eU203Vu0HsCMWMhH5xBi2FLei/A0ZJ/l2qGPEh/l+w2Tcri9SPwmdZKXgt2K?=
 =?us-ascii?Q?EYNuLINMjDerUtgritlrjC6SXeuGosb9vYCs5QDr72A/yv6evFLZOXidFDDK?=
 =?us-ascii?Q?PCNYtdeVt2ONol2IVdSq7kFWvDQYaed+/2MBF+BLIp2UWi+Xk6pJK4YdqDej?=
 =?us-ascii?Q?h89spL/E8LXBzg/lrDHi95S3/xSkMYh84A/IzBGg09jsv1ZPOVtCWQn/6XZ+?=
 =?us-ascii?Q?RhZ+mKzuYi0yxm/uOkP6Qm9B/QP1eSAJzNs6gtdjYrz31/E+oaUvyfrcb9aU?=
 =?us-ascii?Q?jRhR4WVitaYiClRrfP2/Tmjh5q6Qnjakbgdx0C6FmzBKcIA06vzAGdwmZKU9?=
 =?us-ascii?Q?l3JR85OhWN5YoBIvvaFbXKPWqQQQBiBNSWX3ttPalKnuPSKeW8vEjoIUO5nn?=
 =?us-ascii?Q?h0toHnv8wTQzSmzQOBfgQNlr11v4Gz+eNMSKOAB9Ia7NOGoDgQlHyWuuukd6?=
 =?us-ascii?Q?odL5GWLKh34b7dhKDK+UWVVJ1IR6DPIT96yuHZEbraD2t2fD1egFd1KJO5bQ?=
 =?us-ascii?Q?VJoMG6C5RVkXvwsi1W//GAMHumOclA/cXGMNvGOilAA9xdJfKAJqjL8LJ+Jk?=
 =?us-ascii?Q?aM98uokZAqqkbCHfAjpCbQwJtKQb0r/UCgHcodEE10AlGzIhCcl0JvB9NtJO?=
 =?us-ascii?Q?rHbqP6NtUuRcSDIe7EJV6Z9s2J8MZ9BpUHsVzqj2p6sFBQguqh581bEnazaJ?=
 =?us-ascii?Q?8EZDYOc6tTUGZ24Tsxk08t45EQ613YQtK7PtUnZU+SU/YI827FswgOk10NpE?=
 =?us-ascii?Q?jSh/3D+3xhQN7cAUWffscNSMYrUK2hDCeUyNHDzsgKmWUgs4ka+FlBYQu5dj?=
 =?us-ascii?Q?R2DktvXSHBQpSTe1QRNv6y68EL0Y5wS+lDT4BSuozYJi2JQqtD5KrmDmJsoD?=
 =?us-ascii?Q?Lvo93XeYPXhMfoSFxhlk8WrG3SR/2DdyK916I6ZLa5Sy1bFMf01RTG1yKhh7?=
 =?us-ascii?Q?U4sZUjKqHlPtKxQ8yeytfo6NJ4I15xbRFWpTEjXGXXHVdN+xp18xb5Bq9NH4?=
 =?us-ascii?Q?vK/ks4Eyh7mBoAZGUKVuH9vS4hMRY1T+XDg2h4dYh6b7FCmHW+ffvLoS/FNG?=
 =?us-ascii?Q?mBAuh8cPRLcSk7agGuU0VeoUmxTKRdYhoCQXaAHV9ys99vuAwHus2G41mp1J?=
 =?us-ascii?Q?vTI0CnrNML73yYlGQtaPCkcI4UXlo4f9sDaO1goDK191nSpzoetQ4xqbjv0I?=
 =?us-ascii?Q?FPSX8z9V6RfIGzWOcQNmFPQhOuqHVktOCeKq3viz2fAm3z6w3v4TxvUkPzth?=
 =?us-ascii?Q?tLA/d3dFCrCoVIYPtHKz/kGxbT0hUgV8bhAUohhTYqmzhdxlng=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RIl78hrbb9LucvuoK6QHs0nzmg04kqkjABh77meL12UUniGujRrIZCTZarPE?=
 =?us-ascii?Q?gqicAwB6fPB01O/TtkA1hTkP8cGemfjhfZ9oR4TTnolVTvYQFo8wOTRgVkip?=
 =?us-ascii?Q?TovgO0BpJp9o1NOYvjzfecfWkUuV1ygtVMo+Ib1sObFR6JxQo8+uVdwv1pdk?=
 =?us-ascii?Q?4lGZYPG0k187i3vdqYMTfxEEnGCSCYuNTEktIYjVouqDlEjsdllmZlGjoK7N?=
 =?us-ascii?Q?fgsyKayEBIvixVJYQIDKokJbloNI6DXG0RNlHoIV0qPxyn5Pl4EUwlIK2EH0?=
 =?us-ascii?Q?bNnyxc5Cl5y5aKzuc+sFDDeO20umioYi6QFgF3kZ4piz0nskY37KzQktTttw?=
 =?us-ascii?Q?pVfC+hvGO3DXBMcOZ6Z2BYiRT5EmvyDED0N6k1jgCFgVzryqIIlWV5aOWE+u?=
 =?us-ascii?Q?2PaoQ3k1ZMdpqglkkWvdSNxxinAF3Qcytbhh2lnglOkt6H7gRRalqMetcU7A?=
 =?us-ascii?Q?H+7+/M03f9vR08c177H6zW6pd2LtxwKW3Z0mjYsJTObeEwl8EGMZsUQt2f82?=
 =?us-ascii?Q?svb6j+dniFbHcga/F2pR5+qvapRF+X9lPbXQsZ0gIjZHO2IpeNrDTgRph6ku?=
 =?us-ascii?Q?HPhdgMk4ixWpNnClACzf2gXIXkRlx/cJY+ZvPKwtDCXJYmE99l+Bz/askOyQ?=
 =?us-ascii?Q?uSDNtbLrXICKUZStfNmSg7rNvTbEuU2xP+b3Ep4thbETeOnP3x+BaEvQCj/7?=
 =?us-ascii?Q?xMgV8jgUqTDkZQ0cbbZ2TAZz/l8GXNMGZmBvlJG3KN7vMItMUh3OTcgzo99I?=
 =?us-ascii?Q?TZb68ziG+EsDfNEv7O+Rf10yAv+MwEIU7uF2yviTsA880KKAl83JTO0gQ3g3?=
 =?us-ascii?Q?WCFjtaxpFWbgXLTpFQgNSFjaw37cVLAY0z+AoJY53xtLv/oj1H9zU1TvqwDc?=
 =?us-ascii?Q?HJ6G26+sM3TUu5vSi0JuUniw1c/LC/vvnxwH9F4ibfCVSWe31925sdHew/6O?=
 =?us-ascii?Q?mF3CUskLgCuxj+080R9EF8CsPXwKk0ViI8VawZkcw5PglcRfLxslIHaNBALG?=
 =?us-ascii?Q?27G4TOFvMS6d2H7CG6x2fviZ90s64TF/TXjjF+nBdWZNQtZyiNs4k+bPhzel?=
 =?us-ascii?Q?aklfoDydxvSQUOrOXmlMXFJozej5vjZBttrNfd0IV6XDlDdxR0KSbbE3yzPv?=
 =?us-ascii?Q?KfRss0zOzjjKk8bbs+M1XpnAFr0bXw/CIC2ucADwbXyAsTGnbeO00xCxSuZs?=
 =?us-ascii?Q?avNz+U1rDIaRaLrDVQuFEsjypS6G3PaebugMDaoKDsx93I3+21Pz+kjMF/xW?=
 =?us-ascii?Q?jPdm4aM5+2bOAvtbtGvaX97AcmKgtsPNGDjdwi2P2H1JwhKavXHLviYRJShn?=
 =?us-ascii?Q?btOQ6W61sJu7BNSaYaCpR68KRPjQgDOrHjXXdTJw4cHja0f0QcArvV5n8iY6?=
 =?us-ascii?Q?jw/VHP1xOuAigXM0vxrOUDPG/bVsf0s2AVBYgJlhMZVTOgmQEgKojcEPqEBM?=
 =?us-ascii?Q?9gRCskTrVW1IqCMJV8vAlW+FeYGbWLZIeaqt0maVBcvRFvJ4rGJ5003IxpXx?=
 =?us-ascii?Q?jR5XBoazFSz4BmLamH0AkbHpQmuHaGgLeh5clT/K1PcSdrnQc72WTEKw18Yi?=
 =?us-ascii?Q?xteI+sG6eWGgmyrMC9OAj0J4pCN7uLQ5uB1D7MUP?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ad9cb08-32e0-4475-c248-08dc9d3f62e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2024 22:11:14.7427 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 87WBz6U9fZdB9Fa98w1riZdA6wq7IiH5eSD/eO2VYkszHAvBPv+3lj4ckeSYKWxuhLW0YJeC56lkPg9y8Q1ghUca6pGhBOSe1ARrkPrFyP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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

Hi Andrew and SJ,=20

>=20
> On Fri,  5 Jul 2024 13:48:25 -0700 SeongJae Park <sj@kernel.org> wrote:
>=20
> > > + * memfd_pin_folios() - pin folios associated with a memfd
> > [...]
> > > +			for (i =3D 0; i < nr_found; i++) {
> > > +				/*
> > > +				 * As there can be multiple entries for a
> > > +				 * given folio in the batch returned by
> > > +				 * filemap_get_folios_contig(), the below
> > > +				 * check is to ensure that we pin and return a
> > > +				 * unique set of folios between start and end.
> > > +				 */
> > > +				if (next_idx &&
> > > +				    next_idx !=3D folio_index(fbatch.folios[i]))
> > > +					continue;
> > > +
> > > +				folio =3D try_grab_folio(&fbatch.folios[i]->page,
> > > +						       1, FOLL_PIN);
> > > +				if (!folio) {
> > > +					folio_batch_release(&fbatch);
> > > +					ret =3D -EINVAL;
> > > +					goto err;
> > > +				}
> >
> > I found this patch is applied on mm-unstable as commit 7618d1ff59ef
> ("mm/gup:
> > introduce memfd_pin_folios() for pinning memfd folios").  Somehow,
> however, the
> > commit has changd the above try_grab_folio() call to try_grab_folio_fas=
t()
> > call.
> >
> > As a result, building kernel without CONFIG_MMU fais as below:
> >
> > ...
> >
> > Maybe the change has made to fix conflict with another mm-unstable
> commit
> > 02a2d55767d1 ("mm: gup: stop abusing try_grab_folio"), but forgot the
> > CONFIG_MMU unset case?
>=20
> Yes.  That patch didn't add a CONFIG_MMU=3Dn version of
> try_grab_folio_fast().  Maybe it should have?
>=20
> > I confirmed the failure disappears after further cleanup like below:
> >
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 46a266ed84f7..9f4902425070 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -3859,9 +3859,9 @@ long memfd_pin_folios(struct file *memfd, loff_t
> start, loff_t end,
> >                                     next_idx !=3D folio_index(fbatch.fo=
lios[i]))
> >                                         continue;
> >
> > -                               folio =3D try_grab_folio_fast(&fbatch.f=
olios[i]->page,
> > -                                                      1, FOLL_PIN);
> > -                               if (!folio) {
> > +                               folio =3D page_folio(&fbatch.folios[i]-=
>page);
> > +
> > +                               if (try_grab_folio(folio, 1, FOLL_PIN))=
 {
> >                                         folio_batch_release(&fbatch);
> >                                         ret =3D -EINVAL;
> >                                         goto err;
> >
> > I didn't look deep into the patch, so unsure if that's a valid fix, tho=
ugh.
> > May I ask your thoughts?
>=20
> Perhaps we should propagate the errno which was returned by
> try_grab_folio()?
>=20
> I'll do it this way.  Vivek, please check and let us know?
Yeah, memfd_pin_folios() doesn't need the fast version, so replacing with
the slow version (try_grab_folio) should be fine. And, as you suggest,
propagating the errno returned by try_grab_folio() would be the right thing
to do instead of explicitly setting errno to -EINVAL. Either way, this chan=
ge is
Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

Thanks,
Vivek


