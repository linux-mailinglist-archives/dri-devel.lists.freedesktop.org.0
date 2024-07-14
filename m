Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28770930857
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2024 04:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B49710E05E;
	Sun, 14 Jul 2024 02:30:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ODDkPonl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E458C10E05E
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jul 2024 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720924237; x=1752460237;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ly1fmcHxitYAx4DR4QwklMhzX2zes8I7m8o82Tv14h4=;
 b=ODDkPonlqdKYSawOc83R0G5oa8iJkm38nQN65ENmGUH/lreItB6fiWF/
 4l669ZcyOjs2extYJlLAoRSGXU0+cxJAIgchJwmUSHNux/I74A6h/LYs+
 SR6vsY/sV+vy9tohy0JtiVsO7jjLmxNiE4M3SsW+Q+wn0zZa7id+auuSy
 6fRcpPqH3xHok0CNxArOCUWKxqi3k/hXKEBouK/L9gAGFLFVJ/SHftFyk
 vLcnzpUmYw5vR9/3n9qcXNOwF51hYThw7JHd6I/wsrB1oWzoyTTVVrjSz
 VBLN6WKvg1BcYDbPna2qr9YXfaCo9XIYnngojM6FFGzVXdAaAVNqXD8Hm g==;
X-CSE-ConnectionGUID: esx/sHLDRcyeiJ6HL0tVxg==
X-CSE-MsgGUID: SN9lG72mT36EalqI6Puv9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11132"; a="22095941"
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="22095941"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2024 19:30:36 -0700
X-CSE-ConnectionGUID: KRyBac0MQzS8d/gGEfKTMg==
X-CSE-MsgGUID: dSEEmvJ/QSu77uUj4tMudQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,207,1716274800"; d="scan'208";a="86778768"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Jul 2024 19:30:36 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 19:30:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 13 Jul 2024 19:30:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 13 Jul 2024 19:30:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 13 Jul 2024 19:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fC2KOP+g72w1BFk4bOXXzHdnFGR9nHqLcZq0rvM0V+tBkL3FeUAElhMOKkLccwV4aoPgWoDe4UwI08YbGxemeV0N1sa3ptSRPxzbjvKIUrbW94/ZE0CTNDfQb2fOTdXtcUBAr2iHC1DPW7tz/pMhoPz8p2/eyaDwHazmEH9looDqX7GerFO1h3xbAzknB0PhYJWx0M/jMifS4IHsraZotspa8WlsCsc0k1ifD98tQUnhG8yTJt1rU2MgyM77/DLNTENxqcPR6iaoQWPCtBOrf6AxqtAFCFjYSiNZ8UJIsq5VZ42a4LzppZY/4YQ6EHyAdRy0lN2lP2UHsjgnd+Vn3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPdXcICZT35uWLnuQEpy4lvKe4Spt6LfSMpw4heDQB0=;
 b=IWnoowLxIBqJVGhzJ/kMOQHmujxRmYMFsbtWyU458k3MUaRagYgbyDT6sZ5C5xUbH09JlJvsbwEg3i01pwSscri2KyKH7gewoTyQyW7gcO1Qud1yjI5pxn4lYD45jWUzloxGFlkJl5bKXUXeqpwLrZVD+GkI8yuu/ijArcbHlOAROCDVUDRbwh+BlqcLIDB8l+i+YsquuEj5LovT24SfSPsKKcaUYHMJZIEzwaFvIc3K4IIryIjGbtj5+jbVJTTK+yvhaEmVevUdPVxKW1DUyEIKfBekz/9gg16SgQzkt84lgShACzcZKF2sbh6BWALYZvvefRAz2aUbR/rqlnzAXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8401.namprd11.prod.outlook.com (2603:10b6:a03:539::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sun, 14 Jul
 2024 02:30:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7762.020; Sun, 14 Jul 2024
 02:30:31 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: SeongJae Park <sj@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 David Hildenbrand <david@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 Christoph Hellwig <hch@infradead.org>, Daniel Vetter
 <daniel.vetter@ffwll.ch>, Hugh Dickins <hughd@google.com>, Peter Xu
 <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, "Kim, Dongwon"
 <dongwon.kim@intel.com>, "Chang, Junxiao" <junxiao.chang@intel.com>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>, Dave Airlie
 <airlied@redhat.com>
Subject: RE: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Topic: [PATCH v16 3/9] mm/gup: Introduce memfd_pin_folios() for pinning
 memfd folios
Thread-Index: AQHaxgToxlMQ2CD6IEixCdEB+DqB/LHorVKAgAAJwgCAAApVgIAAD2OAgAzESoA=
Date: Sun, 14 Jul 2024 02:30:31 +0000
Message-ID: <IA0PR11MB71854CD7A12F710BB8C44A9CF8A02@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240624063952.1572359-4-vivek.kasireddy@intel.com>
 <20240705204825.109189-1-sj@kernel.org>
 <20240705142320.000b1e520b856b7c034bc829@linux-foundation.org>
 <IA0PR11MB7185570E3FCFAE3E7BDE7991F8DF2@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20240705155523.2f098948237715f8a0ffa56c@linux-foundation.org>
In-Reply-To: <20240705155523.2f098948237715f8a0ffa56c@linux-foundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8401:EE_
x-ms-office365-filtering-correlation-id: 81f29ff3-6a2c-471a-2ccc-08dca3aceeff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ALDq74RHSO5/BKuJ+F+CezuPqYXsq/QVkiN9U+yrQoiUdMflOyKcG0DspMn5?=
 =?us-ascii?Q?X1LqUDCogVTm8JN5Ynk1zDE5nNRFjguOudJ/4s0yD0BKe5ybvFwjQD+xG8dt?=
 =?us-ascii?Q?4ur0+a/rzpXFqBFyQGDr783VTc3Xr80eCZv7Tt/MffVA4IlWAIrYLCi5UK0z?=
 =?us-ascii?Q?eoQQMncRDckYre/ZnTVm8S/f6QSoKQtUzCTJNweHGIjeCAcPM5V0WWR7ynwJ?=
 =?us-ascii?Q?pIKxcgN5Lt6Ll88/jz544xou0TAvQPKEeO5MKNWlkQHxnSlfPQf2/S2NDO4z?=
 =?us-ascii?Q?XNaYLP0Xxv27apiEG/8Py9mlEVpohiRBTU7h+EBA2FYmnuj3vg6tMWyrpSyJ?=
 =?us-ascii?Q?g61Xac0tJpm08ZUdJB+BOtjAbLPLfjOL6Yyy5xMXR4mRxgtIA+VMQGnw0V+y?=
 =?us-ascii?Q?JE4g2cdSK0aZkL+RnBvweb6eqpKFLLZjUBcYO3GTuPwKtnIbyMyPDoDGGF4D?=
 =?us-ascii?Q?EiqFxIFSLNMy2IjYrZ+IyMVwFGZ3ApKgfpswJyccbuMtd4COnxfxN6+6ShaK?=
 =?us-ascii?Q?4MChNbla78GVGqQ1M7UweL0WmgafOENnprYzxhqCbtIhs0kHVxQjco7eEhVF?=
 =?us-ascii?Q?eAy+IayDXI1C/ARub/iJzdJcq1lxo8F6CfhdcoGKQjwuVSqnqxfa8uocBq6f?=
 =?us-ascii?Q?9NKghyrSSsKoWhfXDuUlCZUmn0nCexkQKv4NN+6PuNotZd4POoqq0V55pmMQ?=
 =?us-ascii?Q?JwFV/vsKql40XOnUeBHomZxQy254+GNlSz/5ERV0SafWuAImoTre3Wun56wQ?=
 =?us-ascii?Q?VMOwqpyxW1A4TDRVvbhUpCLsGs703sfkVwB23iA71IBwhOFOD4L0wHRfGQJg?=
 =?us-ascii?Q?1zMDeU62Xty/KD7KMjODv3k+wwIsl8iNbnEedK2S9sD8adyRcmtYABLHI/Id?=
 =?us-ascii?Q?z0dg4kDB8k22aDMrOL1wvHf7+Uche7xEOrYDrLrebFeLo4pXnkpsnRb87RzL?=
 =?us-ascii?Q?qiOQpasmhKvFdnf34mQYNzlI3uRS73QAIZFTGA6PW7lR2W2MaPEbdDIy0VzJ?=
 =?us-ascii?Q?ZhRkdRI+OoY5z7cs1lzUr9A1PcYlVIpvfrrXHjx0eRV5xkXArtE81OIGq4FD?=
 =?us-ascii?Q?/PeNSX7I9MweovsZkYcESOGTHOSHuneoqfCx0GT4JFJcO+A7ZPBdHIiuDqLk?=
 =?us-ascii?Q?kKUtjJx9jJldZQyRJpY2oAwvpGDNJjfeLMrIYfSxdOiEPaQvL29NeW5dCbpB?=
 =?us-ascii?Q?ed9UMnh/s3CyOfxp+M1efukqIbigsr7j0/qrg0qIXibMnOSdml5BJ46mQCRz?=
 =?us-ascii?Q?k/J+shqIBEk+7+rwqlpE16HFpoRHkbfBrY2/75OFtiil81hbGo4ZK43i1jQ6?=
 =?us-ascii?Q?1QTMLvT+2Iz4lr/HHZWQx8eLvgAGwmYgaYIaPlq/GuLKrmGIF+8koYwY01Bm?=
 =?us-ascii?Q?8nr8JvPfVIdZQriFPLsAGeA9vwIpCb9UG5GYfs+5y3R7B0SyXw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Tx+nhjL6p4DIB8THi3Z6uydQ5duYvEpJ8j/WwLRmKGrnCHlW/m9fQWFL8QFb?=
 =?us-ascii?Q?dgnmeNHxtYbvNecAnwHcR66c7TgiGk0hNEXFVooTcfO6NFycq/z0/MZ/f30E?=
 =?us-ascii?Q?T5wQDJmcKmS7BmVNkvLijl0T11Lg6/K0+3V12Cg9SU+ahh8UsugvPy70h2O3?=
 =?us-ascii?Q?GOOCZMBvV7GsZfEJDGFC8ozWckO4NmR8K0aWf+qMS7rxIbe5r7UfMd0Za8/D?=
 =?us-ascii?Q?4y1vMdWehHFQdz9CL2shtXnPtT3p5465cqH9AoiczKJghgPTq9xFE6P98gUZ?=
 =?us-ascii?Q?64j1pN+NSqvz2ixEQz3D561wim5Hh41pMey8/MubCWlBmjFh1pTJWGBJXo84?=
 =?us-ascii?Q?uMN+WeHBtmNcC1iqKc3p3Cp8sttBba55Qcs6IKnUCSt/uE/wpLVabj+Tu5rS?=
 =?us-ascii?Q?k/ZDRxGfE+g0Hyt7eVAcb0/cGxfLUmWrLQ1bJAYcBSNPc00DfjeLFcet9O95?=
 =?us-ascii?Q?vwUmnEJDzXm3Gt1H/PhN5uTHR8yldrkM/Xhg4mzExhz52P4vx76scwt6KoGJ?=
 =?us-ascii?Q?WxRUfxiUiBKEAiVeMFkQcPUp376yqUqoBnPhpLMilt4GYGLKXudXfx2qhJWT?=
 =?us-ascii?Q?q70MFhSnO2uGcscc2gzpM8zu1Buq16Zjg/MKH5jMgTeqCNgRJbFVfjAqM7nh?=
 =?us-ascii?Q?SCIeHStcZ3XEdkvqTVkwp9ogcvfhAQsYmT46dNfruMVBqIlIF11VJKfmhtbF?=
 =?us-ascii?Q?KG/RYWgCdtULIZ8LCz/f5irZSz5bRwSPgqFBK2MeXGesOvQzzD7Rm2O1xzU6?=
 =?us-ascii?Q?TnaTw784j6Pm2KiXoKey3P17vzrDf0UeHn2QHAo6P6iOAn3CAyKGgH9ipJGN?=
 =?us-ascii?Q?Xw+eokLDhaagpKocA/H/yCZAiK/nyR/ZpsoL4ovi9prx18VwIPAhvw1v+nzC?=
 =?us-ascii?Q?lNyo/PMV15qcOES2fSSl48kuJCh6hJ04z+N+SH25B/1Ia+4zF3TReXPtE+7Y?=
 =?us-ascii?Q?aELNgj6IG96juQKYEJbv9o2TIZ7HaZuIbWzkP74B6Au4ZhXHQTY7F9mhAjDO?=
 =?us-ascii?Q?LF986nSZsZNpZsUVfGg10L0G+GLo6pDltIvUqfB0S5Kx2NIKgEJztfvoHcfh?=
 =?us-ascii?Q?O1DALUgx9aFX/4g27JAuk4YxLFo9pE/K2YqM3E3CcQA/hPgK2/eCrXBe5X6F?=
 =?us-ascii?Q?G8ZuNnVLsAaonp0emia7SHOjX69Yb1JmvAlTM74Zzte1cPHbkzK0xEzK84ma?=
 =?us-ascii?Q?qgDXcRXeNngx41mbwX+8LGOG+VZzTzKPQx220IJ0A7v9OcoZjy+XjPzwlW6n?=
 =?us-ascii?Q?X1NzxtwhLa+wIBPxCGk0ab3B1bhhgRMjxv2/6W5+8cxLek+krLPMQnOgDF1M?=
 =?us-ascii?Q?yZDK8EEqDrTr3FzXG9XAKuTGPgeqYEmHqhDqon0P0IDKg+EmanN0JqX0b7U0?=
 =?us-ascii?Q?sNREUpaBT1DKBpTqzqM5x42HIPoev0sN8fzhm52VTrciX/gLkpzWZKtJZQz6?=
 =?us-ascii?Q?R9wP4zZPSIBOQcNNEfhV1gR7ui2w5L/OqxYv2026OSoJtZInrEXx+1EELqqN?=
 =?us-ascii?Q?xGZL5o1xHKfKjOTDKhTN69jxY7SiYmLs4ijb8mwpNlLCi8pPq1SmrjbfeiuI?=
 =?us-ascii?Q?Iwp0iMPTB2IBV8oCayz1oDsR922C6raEuTZav7Is?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81f29ff3-6a2c-471a-2ccc-08dca3aceeff
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2024 02:30:31.8540 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y41/KHFDo3U+t/y87gG53UHOVarpFCCB4ZIFE09p/2fJeiqeVNsbuGGZKk6qX4ZfF5yQ3lMc1+u3JNfQz5hP9k7VigZGWI4hUubTQPLZnZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8401
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

Hi Andrew,

>=20
> > Hi Andrew and SJ,
> >
> > >
> > > >
> > > > I didn't look deep into the patch, so unsure if that's a valid fix,=
 though.
> > > > May I ask your thoughts?
> > >
> > > Perhaps we should propagate the errno which was returned by
> > > try_grab_folio()?
> > >
> > > I'll do it this way.  Vivek, please check and let us know?
> > Yeah, memfd_pin_folios() doesn't need the fast version, so replacing wi=
th
> > the slow version (try_grab_folio) should be fine. And, as you suggest,
> > propagating the errno returned by try_grab_folio() would be the right t=
hing
> > to do instead of explicitly setting errno to -EINVAL. Either way, this =
change is
> > Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>=20
> Cool, thanks.
>=20
> We could do this to propagate the try_grab_folio() return value:
>=20
> --- a/mm/gup.c~mm-gup-introduce-memfd_pin_folios-for-pinning-memfd-
> folios-fix-fix
> +++ a/mm/gup.c
> @@ -3848,6 +3848,8 @@ long memfd_pin_folios(struct file *memfd
>=20
>  			next_idx =3D 0;
>  			for (i =3D 0; i < nr_found; i++) {
> +				int ret2;
Is there any reason why you introduced a new variable instead of just reusi=
ng ret?

> +
>  				/*
>  				 * As there can be multiple entries for a
>  				 * given folio in the batch returned by
> @@ -3860,10 +3862,10 @@ long memfd_pin_folios(struct file *memfd
>  					continue;
>=20
>  				folio =3D page_folio(&fbatch.folios[i]->page);
> -
> -				if (try_grab_folio(folio, 1, FOLL_PIN)) {
> +				ret2 =3D try_grab_folio(folio, 1, FOLL_PIN);
> +				if (ret2) {
>  					folio_batch_release(&fbatch);
> -					ret =3D -EINVAL;
> +					ret =3D ret2;
>  					goto err;
>  				}
>=20
>=20
> But try_grab_folio can return that weird -EREMOTEIO.  The
> try_grab_folio() kerneldoc doesn't even mention that - it incorrectly
> claims that only -ENOMEM can be returned. (needs fixing!).
>=20
> And if memfd_pin_folios() returns -EREMOTEIO then I expect
> udmabuf_ioctl() will return -EREMOTEIO to userspace.  And userspace
It is not clear to me if userspace needs to do anything in particular to ha=
ndle
this specific error. At the moment, Qemu (userspace user of udmabuf_ioctl)
does not do anything special for any error codes, and just treats them all =
as
failures though.

> will wonder "what the hell is that".  If there's a udmabuf_ioctl
> manpage then will that explain this errno?  And similar concerns for
> future callers of memfd_pin_folios().
Sure, we can definitely add documentation explaining this situation once we
agree how the userspace needs to handle this specific error code.

Thanks,
Vivek=20

