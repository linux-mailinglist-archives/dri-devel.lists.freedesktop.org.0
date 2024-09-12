Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6769774AE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 01:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C128C10EC6C;
	Thu, 12 Sep 2024 23:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQ023UgG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6045210EC50
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726182555; x=1757718555;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wTnZiBF3OsWecLuci647FV3Jk2RHKPXVfp0sS8NtvPM=;
 b=FQ023UgGLghJC0xHmj4GZR/mww8DzwuRdfP0oOylXqmCqjRIeJupkfZj
 qc5fJb/oK7Mnvvu0NAV4+D/JgIw3+45w0LYcYYHmt/MZmdbFuYb0AXGdb
 YMETRsXFMuaP+NLiofg6Nu1312wHMRksKNqgLwp0aBmaIkHv5lrJAJbSe
 8KUT6j2rq9jagfOyHzqdbVbRCQFUh0ok44E7SZavxTchYaRyKGoeY20yK
 id4PBEtymtddzDKCM9u76B0W5T70nEwpuOi+7Y49+xZmvQeWHuuoj1Pmt
 YpsUNceIKoyeBAcsuG+KwcqQeVYUVdvI/ICWbUx4NYq9AoqkiMExLRyiL g==;
X-CSE-ConnectionGUID: 3nne9dqHQAaAFOFuPWEegw==
X-CSE-MsgGUID: NkrymsDaRxurVM7R2FX1tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="36447318"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="36447318"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 16:09:15 -0700
X-CSE-ConnectionGUID: qTNaNT57QbuqfhchMnSUTA==
X-CSE-MsgGUID: vFwjFwxgSrWTZBxRdr+hDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="72860976"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 16:09:15 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 16:09:14 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 16:09:14 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 16:09:14 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 16:09:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbsYkZ7zqBssI5iW7NCXQ50luQRJB5theWHYw+9uJ/nSchLKP0nMKsMKnvGI2ODI2ur2XDG2NuMnwZd0oHgwRG8cMJeOGz3UUPF9ocO68vEvtpidAhXKI4s1ZLgeiJS86ABS3IYmqWMJzKovV4HN9yHPMj9stfCD/dqoSelMP5kkErZ6Na3fEztZYmjrQL+bfbii4cLDzIYQLcwifPC5X9vN776ybgON6Ml3nfrfp4/HInvQ43lcZZEsfbnuTXc+l/bJtlNNAfmBkSuUSpkx/UZtYJmvqVfTA2S86RJvGjrgWxFMCgE/dX/OYPEGI0g8iHnW8xIphurLWWR9vEf9ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+sOCF8SxGA7uZHhs9/avxGoJLrP6Fx8QJFLjmaqZhI8=;
 b=O78HWFq6Unsdaf8aR1eNq3e9NV2mCRUQ2iBSEpH3+sYZWAOhwB4cUMDbNIz8I1KQR90+JLhTm4TfQUHLWwxq3SZIZAt8IhiVz3t8zwDKQ25mP4HtjpP4dvXKySmYVECIFebh4HdZfmCfFyPQx2a3gv42dRXyB9ZU0FyI6eazMGZAPmcD3HioOt2M1Z1pOyRIqaXdnJ4x0gDMrT+R1+pWfCYeQ01p6rwG2qAwrQarIcJy0lio5SzpjERin3QN7lNDtNEWsycy/y45mNJ5WEAHJqTT2pachvhwO5lLtPXoTfXpFbtL+Rcdxi6zM0dmiLuCPFRKatkAgtxQJgRQKYkkog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB7972.namprd11.prod.outlook.com (2603:10b6:8:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.28; Thu, 12 Sep
 2024 23:09:12 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7962.018; Thu, 12 Sep 2024
 23:09:11 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v6 7/7] udmabuf: reuse folio array when pin folios
Thread-Topic: [PATCH v6 7/7] udmabuf: reuse folio array when pin folios
Thread-Index: AQHbAplkOJGjjp2cgE2MOT46vlFIF7JRxdbQ
Date: Thu, 12 Sep 2024 23:09:11 +0000
Message-ID: <IA0PR11MB718505CD32E41064EFB0E7CAF8642@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240909091851.1165742-1-link@vivo.com>
 <20240909091851.1165742-8-link@vivo.com>
In-Reply-To: <20240909091851.1165742-8-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB7972:EE_
x-ms-office365-filtering-correlation-id: c1e387b6-6e1e-419a-5c8c-08dcd37fe9c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?amm7cURQ/aUl1FEP9ZTTA/dBxowHNATqwL3dYICZltG8VBOYNrwE0UnbIH?=
 =?iso-8859-1?Q?xl0kfYol8OOT38v8vd0rrej/XvbqKCm9c3JsT2C5lfQVaSdFBznc7TIFlS?=
 =?iso-8859-1?Q?/doChwIsd5flYsfzc82m8GN9MSywbo96sBDvIwGzbhwuxWGDlfhvb4HEcR?=
 =?iso-8859-1?Q?yI33lcrIcOjRY8ud2Kjv7rxifg886G/wvmesPo7E5jL5dqlzfZDuN+aaqj?=
 =?iso-8859-1?Q?NN+l2PP2Tdi5ybOGdgbsh/lXde8JrxouN290m8MuDqacou9nvDm1dUb7rJ?=
 =?iso-8859-1?Q?vLPzl5RCC41j7n2ZgX5ZsAoo0L/iouI99pEdafLH6ymRZpoPS+rNvrtGg1?=
 =?iso-8859-1?Q?f5KCj/xJExb2XGe0K6aJuY3CWgoj0XvEmH8cVOzSCRY7at45reHijcEzH3?=
 =?iso-8859-1?Q?cZw8ECPZTzegOWEKT8TnJVI/X0FPLqc9I1pwE1yiGQTdHhO6frZ09YXX8i?=
 =?iso-8859-1?Q?42VSxuWjOuIt++g/2Lv+Y+ioldixiqDFvbiRs9ZieNAprWCcNdVIXSyhLw?=
 =?iso-8859-1?Q?KKsJF3YnB9+CWB3UqmkE+kBd4LdWWarB0QTHqYEpcKdxMetA8D/D2j3lK7?=
 =?iso-8859-1?Q?FBN2IxgBrJaWb0zO1lB0Z44HK8qnWexH9kRBg3IydK0RcO6XvUn5dPl3+Y?=
 =?iso-8859-1?Q?W7Ta4q56dWMPv3VVFt5MHhy4ZobB7/uraNFnuZu74Xi19r4tXqXtYAC5JX?=
 =?iso-8859-1?Q?n/puO//7+7ztoUs8sKZUU3rgz7/7HpdIvrZcinBqKtl19dfWxTC36+iJUg?=
 =?iso-8859-1?Q?nwDbi22Zd83oHcuNZ2oDHM1sRceEBmD1SXuf+WTLpv4ojeKXyrxl+5DP17?=
 =?iso-8859-1?Q?7TDWbeQXT7jpdBnV5n9EeyXWcLfk1SpYN3u8QA/Ym/a1B95whVwzYZn4tQ?=
 =?iso-8859-1?Q?2frbVBFKCizT6cvfHVMvm+cMkUsBWoQ2NfM7eQZT2Yt+Z4gozBK2wcPNQc?=
 =?iso-8859-1?Q?0tIQRNVarGMqJe73dHAmWBqK5O3YV27TNF123ogNmfTPBlA/Jv3ZpQB2Xn?=
 =?iso-8859-1?Q?mwbnhw/4+csz2XBQEjSeKoqP92SsslglvpLZcIvYguzOP84vgSU7i2KABX?=
 =?iso-8859-1?Q?yLoR3lPulRNgtcOjtFm3mFGQfzHKWP9UHyXiJDMn4tNI6EpyalRoZIjay3?=
 =?iso-8859-1?Q?1nC4JdPcbMR38UbK8yp5kYu61xw0V2w11Nlltjim8IQ3/CXrYpxavSciv8?=
 =?iso-8859-1?Q?uYr+7XJODOk1pgqNU2O/XrTs/KeZn2MOhglPSypdrQJGib0e5/v8bX/fb7?=
 =?iso-8859-1?Q?cRbj9GeslsfcKWmJy/xQ93yWYTNZYe/oYdMkjIWt0dOO0GHxbDGn7Wz34v?=
 =?iso-8859-1?Q?hy4ElRzUGIcK+pi24QYAfAMenle8zDV9TcxXFX0gyFaI2ag4x7DeZMUXiq?=
 =?iso-8859-1?Q?POOXD6ME2IXP+aqnMY9Ex0wPFBTdyruSPXkEAzddIUAOFQwqgTBmJqPjbg?=
 =?iso-8859-1?Q?wgKFyv/i4ob0TPr18ZU5AN+zV8Htth6zt8WTkg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7e3+p5K98r+OGDW5SKiP2ne0HkL6EyWuV2jds2iE804myeLIz8o9hXUvhS?=
 =?iso-8859-1?Q?u548lSVrmS0vQM51V0c5Q6MXXcm32BW61svW58QqsDkb8uo5rRWTTK5xV3?=
 =?iso-8859-1?Q?yBFrTuykD1Cv8cycYR15QkXKpeqRHGc1RnUjV+d43xAmOgTqRiUjduGY/m?=
 =?iso-8859-1?Q?s2itzUcQie3J63/CMtl9G0w50iojLcaHHp5mQ5Q0IDnviyhnlTbExZpMOP?=
 =?iso-8859-1?Q?sqfUh8z8ICpiWhU8ewQ5sizExnkTjQMAgtA4u4qCYUJAH1ZnldUm+YBV1q?=
 =?iso-8859-1?Q?M1RTJueFwZfT6oPtL5/AEtbsW/VGmZU3kOH+XIbMSBCvWtZA6uRZtXVvjd?=
 =?iso-8859-1?Q?5PAlvl4u39FVgwD6bdZJeQr7WQicGZduD1Ayw6XVd2MnqHnHUsN77oKMsb?=
 =?iso-8859-1?Q?Im+dpOCTB9VGKc2LxMKGoGVLOwTBxdJmTzspvkl92N+DTQ3JmRYw5EgBC+?=
 =?iso-8859-1?Q?9KC7NX43XVdmR97jD64I1xQLW3NNOy4jNZAZwPM42A+9hGSY1+JKXWbzrR?=
 =?iso-8859-1?Q?4jxYemUDZXviE7ogptwla6B5tm8Tzdsn8ZPp3J9Ev6ngy//i3cEoWnAUbR?=
 =?iso-8859-1?Q?p+EZvA7glujsYrf7kt0cH5Erv+lPJvtNb4/4DwcNkwqGRK/M163yYKlVZs?=
 =?iso-8859-1?Q?jjKQPZJFJBOTCfHj0L79U3W/7wdcfAqkNsINUZAZK6IT72L9sxZrXA6MUg?=
 =?iso-8859-1?Q?lurb0bc9UjRlHt+L/0oh+wW7j3y+eV+96S+Z2MD3rzuvCtR3MwmV/pYg0y?=
 =?iso-8859-1?Q?Jbrav5i6fT9RxLrPSi6NUheI1gdEHwQtGc1ZBuZ/P6Ligu35LP23Y1BcAz?=
 =?iso-8859-1?Q?oX8/QLeZFlvPdwNm6ntgJnw/j5iOenjHSRWNGuBgbX/RGcUasU2f+quf1x?=
 =?iso-8859-1?Q?dFCUEhSHRfcWaP4PmLDaD6ADAfy/KlmmMqgrBztT1GhyIaAdf5veqeuxet?=
 =?iso-8859-1?Q?xhC6kayHfNsb5EjWzfECD3GK4DKru2QbHhNQHXInCtlnN2xIRdXwtelj/C?=
 =?iso-8859-1?Q?caTrtklKEznj30Ykmm1Fatt20alJFNtHHPx5kYkGXLsWYEq1hyaBGxjkOz?=
 =?iso-8859-1?Q?CPdAEKsm924CCKGP4p5AP0JxK596c2Nnuzf0KwB21+P2AlLqhEAJHKYQyV?=
 =?iso-8859-1?Q?bhpU6woby6+Tpaz+gVSAKsQiICK3JCjcF7NuDSpfSvSFbet3OzR6TuMD7E?=
 =?iso-8859-1?Q?1H1h7+imyzhYyLiV/l8SzUH9bkS72T37KpozVexEMgFb5XPVi29Pu0fxpK?=
 =?iso-8859-1?Q?woYO56kmXKrd2sskJDdYU0P1NjBalPcArE9XxWNJBbByLkMFW+xQScQOIP?=
 =?iso-8859-1?Q?u1+2EDpmFHplKg4iiorOYGrvVCeImT0j4S0fFea1uqH6g0PqalXJj0rR1u?=
 =?iso-8859-1?Q?UM45fPmxJgbb8mMmc4yUNdFf3r0tXVDx/ECbfIDZeHocw1ZfEsNh65BDJr?=
 =?iso-8859-1?Q?X6FswSQ/MDc3QEGso6tNaRIZ0nBNCQOPc0QtXIsj4LVNlSRzO6w6hdNxUz?=
 =?iso-8859-1?Q?RlqHGzCyd/DiSmwiKKeNpdnNXbpLw7D9QISjp2RGqUxKxITMXL8+Y9MKRm?=
 =?iso-8859-1?Q?dTbkWEkn/xUzTukl6f03K42wvJbYlK2oDVtIVStcn2Xh3GDuSeDUP44gui?=
 =?iso-8859-1?Q?+mmgyDeWK7UiYPaR+ZL4PxKJ9A1mc9u+PK?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1e387b6-6e1e-419a-5c8c-08dcd37fe9c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 23:09:11.5425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Co7DF5svWQicuul86/2V6/0WOpou+cWTENr5JEhXbnDJ4Cpf8n58P5sHw0P48VrsWpQY993u1dcA2Pw2QeZvVTlrW+lS7E1K0LLK5jRridU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7972
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

Hi Huan,

> Subject: [PATCH v6 7/7] udmabuf: reuse folio array when pin folios
>=20
> When invoke memfd_pin_folios, we need offer an array to save each folio
> which we pinned.
>=20
> The currently way is dynamic alloc an array, get folios, save into
*current

> udmabuf and then free.
>=20
> If the size is tiny(alloc from slab) is ok due to slab can cache it.
> Or, just PCP order can cover, also ok.
A casual reader may not know what is PCP. Please mention what it
stands for and how it is relevant here.

>=20
> But if size is huge, need fallback into vmalloc, then, not well, due to
> each page need alloc, and map into vmalloc area. Too heavy.
I think it would be better if the above two lines are rewritten to more cle=
arly
describe why or how fallback to vmalloc adversely affects performance.

Thanks,
Vivek

>=20
> Now that we need to iter each udmabuf item, then pin it's range folios,
> we can reuse the maximum size range's folios array.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 36 +++++++++++++++++++++---------------
>  1 file changed, 21 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 0e405a589ca2..9fc5d22d54ae 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -341,28 +341,20 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  }
>=20
>  static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
> -			       loff_t start, loff_t size)
> +			       loff_t start, loff_t size, struct folio **folios)
>  {
>  	pgoff_t nr_pinned =3D ubuf->nr_pinned;
>  	pgoff_t upgcnt =3D ubuf->pagecount;
> -	struct folio **folios =3D NULL;
>  	u32 cur_folio, cur_pgcnt;
>  	pgoff_t pgoff, pgcnt;
>  	long nr_folios;
> -	long ret =3D 0;
>  	loff_t end;
>=20
>  	pgcnt =3D size >> PAGE_SHIFT;
> -	folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -	if (!folios)
> -		return -ENOMEM;
> -
>  	end =3D start + (pgcnt << PAGE_SHIFT) - 1;
>  	nr_folios =3D memfd_pin_folios(memfd, start, end, folios, pgcnt,
> &pgoff);
> -	if (nr_folios <=3D 0) {
> -		ret =3D nr_folios ? nr_folios : -EINVAL;
> -		goto end;
> -	}
> +	if (nr_folios <=3D 0)
> +		return nr_folios ? nr_folios : -EINVAL;
>=20
>  	cur_pgcnt =3D 0;
>  	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
> @@ -391,14 +383,15 @@ static long udmabuf_pin_folios(struct udmabuf
> *ubuf, struct file *memfd,
>  end:
>  	ubuf->pagecount =3D upgcnt;
>  	ubuf->nr_pinned =3D nr_pinned;
> -	kvfree(folios);
> -	return ret;
> +	return 0;
>  }
>=20
>  static long udmabuf_create(struct miscdevice *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> +	unsigned long max_nr_folios =3D 0;
> +	struct folio **folios =3D NULL;
>  	pgoff_t pgcnt =3D 0, pglimit;
>  	struct udmabuf *ubuf;
>  	long ret =3D -EINVAL;
> @@ -410,14 +403,19 @@ static long udmabuf_create(struct miscdevice
> *device,
>=20
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
> +		pgoff_t subpgcnt;
> +
>  		if (!PAGE_ALIGNED(list[i].offset))
>  			goto err_noinit;
>  		if (!PAGE_ALIGNED(list[i].size))
>  			goto err_noinit;
>=20
> -		pgcnt +=3D list[i].size >> PAGE_SHIFT;
> +		subpgcnt =3D list[i].size >> PAGE_SHIFT;
> +		pgcnt +=3D subpgcnt;
>  		if (pgcnt > pglimit)
>  			goto err_noinit;
> +
> +		max_nr_folios =3D max_t(unsigned long, subpgcnt,
> max_nr_folios);
>  	}
>=20
>  	if (!pgcnt)
> @@ -427,6 +425,12 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (ret)
>  		goto err;
>=20
> +	folios =3D kvmalloc_array(max_nr_folios, sizeof(*folios), GFP_KERNEL);
> +	if (!folios) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
>  	for (i =3D 0; i < head->count; i++) {
>  		struct file *memfd =3D fget(list[i].memfd);
>=20
> @@ -442,7 +446,7 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		}
>=20
>  		ret =3D udmabuf_pin_folios(ubuf, memfd, list[i].offset,
> -					 list[i].size);
> +					 list[i].size, folios);
>  		fput(memfd);
>  		if (ret)
>  			goto err;
> @@ -453,12 +457,14 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (ret < 0)
>  		goto err;
>=20
> +	kvfree(folios);
>  	return ret;
>=20
>  err:
>  	deinit_udmabuf(ubuf);
>  err_noinit:
>  	kfree(ubuf);
> +	kvfree(folios);
>  	return ret;
>  }
>=20
> --
> 2.45.2

