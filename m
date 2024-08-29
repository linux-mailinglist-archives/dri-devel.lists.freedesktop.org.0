Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10249963BE0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0491310E475;
	Thu, 29 Aug 2024 06:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QORy45rK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BA110E475
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724914062; x=1756450062;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/GWS3d87CbPpjVlXJSa2MJcJ71uanLuEgNpxfIPBt8k=;
 b=QORy45rK8u9c7MWoea45ZVtpqcDmTGuMCoUaRXN/bPsjYcvgkXOXhoke
 ajv8hlUYmem9YMr7x4oWIab0TVOjChIQn6OelvkWHikXIH2qZOiJlx2Dd
 D5PfoUz1VajyTr9maYVdmVMCXH+JWfSdRNONC+xXMznwAutkNlIjSYX5c
 zcTPoy9Jvt8T5QmCITt0bHznfOjocgJEKazP3Fxv7AAsNVDy96mvdtb4Y
 R+GyYomJO9eNTEBDEj+EynBe78VfwJXk+Q2HTtsUtxMPps8uDNyj8NpiD
 uYVfdQ2prsL39tUuRSRXYjwOpLcw6uUOu3fAPMTHicOkAzTnm2m9hj2LV g==;
X-CSE-ConnectionGUID: 8f3yYgwHTJGeOPYcLfJCUw==
X-CSE-MsgGUID: JK/ZOJz5RWa1W4ihq7Zghg==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23616483"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="23616483"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 23:47:41 -0700
X-CSE-ConnectionGUID: ax8eRf97Qwu7J6LVUiW76w==
X-CSE-MsgGUID: gPPnEtzwTmuPRSNVwF7dvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="86686925"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 23:47:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:47:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 23:47:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 23:47:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xz1C41NFIT1nPg+oa1E5+OoSWNaF7cCjfxouSeVmHd9SYHadGFZ3rS7GQJkiVkARtCUulyxjRwt9qTh65LlPmw4NBqp1OvVGh5/DLO7cb8fO7a3eLe2nx6gCtAlN5j0PguitfLxvh+rvGbzb/CcvFPBVE+cGbvR+NIjVRm5+byLVMe5xdMAfR5hAyfgBbK4lvjtRTvOoP+3hOUqPMC8GmHhna9EZ35F0P9exWKtQ/fX5GASdtX28OvcB1K/Ifms1aha8BnaHfsMzEEbVefwlLk7yfxzlV0UmvCVLU6/OZxC0kpZtFE+0Jf9PdKGGcui8VeUfbE92RCERP5+5JYW5xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LHE5dT52TJqk/fD7O4P3kzD/wwwemvx1LLRht/lVnTM=;
 b=S2jksHMmfex71CXeIUF3HyDqJ3p/Lwq5KyekvmiUsS4He/U7z63rEULRznExf7aNARAEraBdzqlPabScOKTeOR6DsuFTE9dtzCKeLhbGdPamDc8mbMQdx2SHizP2jGXIu8DbCcN/fYZmLROY2rzlOaIadEHKbbzO6eBp38lTn97Ti1+BmnQmPs6CUbE6IWcBwkUquu6TAUI6fFykgoGjPHuqIwPiGDRPMhm5m+sIh7tmfjAK4heH9FcBFIEnrlO2ez4NHxkHie7vURUuczLVfCwAh9cSl/i/Motti9/8NKsoQqtMcXKPuH/T81QSuREKjvikQ5AXdDir2EESd+g3MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DS0PR11MB7336.namprd11.prod.outlook.com (2603:10b6:8:11f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Thu, 29 Aug
 2024 06:47:32 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:47:32 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
Thread-Topic: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
Thread-Index: AQHa9G+deH0FBpLvQEORVlJbc/oBDbI9NMew
Date: Thu, 29 Aug 2024 06:47:32 +0000
Message-ID: <IA0PR11MB718586A7B051D53490CF51B0F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-6-link@vivo.com>
In-Reply-To: <20240822084342.1574914-6-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DS0PR11MB7336:EE_
x-ms-office365-filtering-correlation-id: 12351e01-8766-4800-a2e4-08dcc7f67593
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?c3ck20yCyjrlb9Ok2/bb6QzF74EEYZipgqK/qUaIfsiNvszWjO+LbiRplf?=
 =?iso-8859-1?Q?XhFtDkbmRzpY/LhJk6sV7K9LUCdvTW28DijKLK9sRjYCwY2v9xRMDfTTov?=
 =?iso-8859-1?Q?V6sRt3Auyy/FcXVkikLtLv9AE2tn79zxoj64+XQC0FtwqkmuG/8StfgUZj?=
 =?iso-8859-1?Q?Tb69EMGqEIwf+B/oClBHPg/+rjt89RgEbQzC+JSeW0JQL7vK80P+P291UF?=
 =?iso-8859-1?Q?ZOpyxmmDyfGk5h52MgDnycEa8RZNK0tj8HUfoXxjIS58my38uOBjoniFid?=
 =?iso-8859-1?Q?2XgurMKvpPGuxgU3LAKUrr+tfIBx0vfq6rwWDyt2i4uJQAxT7rzGUcZQO4?=
 =?iso-8859-1?Q?h5tG3oZXZhcFXpx2HT+GPrdNZcj7nNWDs85vL5RZ0qhBYPzXx+gTcLE5Yd?=
 =?iso-8859-1?Q?ru00VWPWRuSo813f1IsvwVF3MHHwYC4W5E0ihMr2QR+wshifmpziEoTMHS?=
 =?iso-8859-1?Q?svemK1aq1NtwV1CP9qFqLk0J8bsjFzbXdjtNIfWDjHjaiaFQTt5NPF10gK?=
 =?iso-8859-1?Q?Q99KUDJnlDaI9NXpJXfwyFaqGiDLAoEbdmLb4SHWOIGpcZb2wzKQfPXFXW?=
 =?iso-8859-1?Q?JOof7SCDxEcJxcQ8B9oSQOUkOrNNgEDxkja/lGdinkg2cL1xvpAtVZ3M+X?=
 =?iso-8859-1?Q?rsIn8tEFFBOSTyMFiMO1X24erQ5fp485S4Z+oac8Lty+Vx4Wwc2o17kf0t?=
 =?iso-8859-1?Q?Htt/Jqm19jyaXnkwJ2Bh3Og4O/A5En4QVWk+i8xFoSnRPCPU+SpgULr7Es?=
 =?iso-8859-1?Q?0p86J1yDGkpa3tOD237I1uFu1prTP1NjYltpyMB1Iilw6Sf5OoFPMMYrZF?=
 =?iso-8859-1?Q?jhV9vKbfB7EMsW2HIB+UcOzyiOvbIAfZmtJe32Iel+Lz8DarZ4ctjsvsh9?=
 =?iso-8859-1?Q?NOTlmghBguCvqqXPOSNwHWYOueSyakyT6fh6pAw51evj+nZjZ/HtAz4So5?=
 =?iso-8859-1?Q?7vFS1O+284mt3SYwfWnMJqW8RLIRq1d/pJwrgFuMkvLahf185y3skKbqpQ?=
 =?iso-8859-1?Q?l+6UMs7ixU36RuPCoCwRtzF2n0hkpcU3MI5XR1MEUswp88+8gPHTwDz68L?=
 =?iso-8859-1?Q?hpUedmF2qdEQXhkJRukkEfwEUzwUILJ+KLN6uihKvvWW3llBoFNx86l5/Q?=
 =?iso-8859-1?Q?IAeW20snDgX4R3irTdoNmU56GBKJmQM/WRZ7owdHDZdUT8axxgULEP0F2X?=
 =?iso-8859-1?Q?xAuOoTKulIQdg5RyjGhSx+0lnyMkRdIT+veO1UGDRqfuiunIjgDluUTA+0?=
 =?iso-8859-1?Q?0MAUhydVVMXAiObNIv9OOxZulz8YJGMMyAHEx4Av8DEHb8LqIkmxcy21yy?=
 =?iso-8859-1?Q?S63EB8L/wGFZd4XVjIBLjWM+YVeF42j5zAVDcV/y/bJkUFRydP0QxwPt6d?=
 =?iso-8859-1?Q?VspAWyZ+qxCLO4CLHjERAIjO1/QeCYR+cAZ2gQXcC9TXPPAVFmqLnhoj++?=
 =?iso-8859-1?Q?LhZiihuJ2uL+kGAs06vLv0AD4rdlsWEp9/DvjA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?QojMbSjcxsoXleErFY+SUctzOCZGn2qDy6xvWpczSyIEpj1YUB/yvKuvki?=
 =?iso-8859-1?Q?oP56psRomJtAcDjJUj5zZ0K5icsl6NHzc3cbrn/xu4wqMCYNnA9RyIZrpK?=
 =?iso-8859-1?Q?mdnhFVDtqotPSVLGrForPCaLoc2pFwo7oF9NgWsIdkjeSACoUchdDMMPmy?=
 =?iso-8859-1?Q?lOi4hmFE5IGkAWa/hlDFx2PHqO7RDz9m6ojXM+hdCPj2a5Gdt0qlG26El/?=
 =?iso-8859-1?Q?ZVHDv3pYYx67IE0QaOzUHpwhTSSFrKlCn0iFGQq4uty5NBt8usWD57+rX2?=
 =?iso-8859-1?Q?9mWjhry9S1g9z0qiq52+DWZ1SNVJtJNLve3p5WA8SfGxswLMHJD3V46fgR?=
 =?iso-8859-1?Q?kEZZK5kLVOaywef1Kcp9FfsZ2ymU/tXXmETpgf3p4rktuJnS963x+EuO2k?=
 =?iso-8859-1?Q?lAfEOYeiKGNPnIVajYuaw1dQkCmRHWQfDNil4yk2rg27QGgD+7Eu2PzhyQ?=
 =?iso-8859-1?Q?bgv69KlGESX36MKKbs6/gSS1hn+IalR4PMSod1qIjdI9FmASWsD7Zpp+TV?=
 =?iso-8859-1?Q?8y7X96iKXCzJg+qHNZzL76Pzmz7EhSw7xtcgeTzn8ejUJ7Tb5NbBzq8uhb?=
 =?iso-8859-1?Q?1NCrUcFK1Sut/3jVsNi8DaIjVVTMU0mdrZBflMEMZtW/OhqP2shYA7w/YA?=
 =?iso-8859-1?Q?EMRak5VWLFamqGsPGPAIdE0jzDHCt1k1ziGIqqCGzxSr1tSCoBjEJaG7z0?=
 =?iso-8859-1?Q?xJxysXY98Z1gEHoOdCnZ3O7VwRt76aQ45ZnGqE18HKIHBaRVTRTOJUVz5u?=
 =?iso-8859-1?Q?/PxQMpUt/VRyTrsyDv8zzOjGPZM+CgMiLqqytu/N6yOqD+MMvtzBK7+ROF?=
 =?iso-8859-1?Q?9KrSjpAr7u7J7G/EsZjW0ZI5Zkq2gW6FuwV1OOAN7qiRvuAwTnArkqgDlS?=
 =?iso-8859-1?Q?ykq1qm6VTP8JF+sAsCbqSAB+I9xTEoGtUqobvFJkdxzqfBbz+yJQtJ4zXc?=
 =?iso-8859-1?Q?zjo5pFmT3sFiR8ORUySn2/XMq7DYYs8zvACB2wYjsg4438DYtCU9Gu8Enh?=
 =?iso-8859-1?Q?T+pcb/1+NrjyYpqAQd/GvmLxZ7PUVup+4ccP9iDVn1sZDegpm1J7HVrgNF?=
 =?iso-8859-1?Q?QcX0A+d5B+Y5swvpJLzp4bLuDGL3VoCTB7IJYhQzZlm/mvHvPHHxnIecYh?=
 =?iso-8859-1?Q?XsU57lMlHUzhxWR1yv6lR+wZyiO6Ei7LDb8G1B4FBjJX+hjJgDCK13DE83?=
 =?iso-8859-1?Q?6mcvMuGSqaZNpqwtU/34hcrjAwgNRog9XRtG9d6NOewi4KLFepeV/ieoPh?=
 =?iso-8859-1?Q?0M220yxM08cQi4ZK0Qwfv9io1+PszvKQuRCN0fwYm1tDXri08jnxwziGx7?=
 =?iso-8859-1?Q?Wa3+R9EIUWwqvN0G4SxQRLgFBBzm0Y9zRpFL8XE7+Fj+5WI9qU3MXiEzu8?=
 =?iso-8859-1?Q?MuayENKXHCO+DlrBk28u0QBsxxgoC153JU5meUg49uuF5GBVaoBY+ryMqp?=
 =?iso-8859-1?Q?3d8Z5QOznApsb5YnAsW9khqO/b6mwl6Qi0q0QYtmEEcvqc8q1WFId7ztis?=
 =?iso-8859-1?Q?tydP6Ky51Pn/l59RRUB3Xu3AWqcWR+wYETykRt9Uadv3fGkBz68DIWPlm+?=
 =?iso-8859-1?Q?52B2g/0ro3r/Nkp/9DUyGnTSJPF10lE/s1e46Ikwm5wTyA86RGd5QGOVkM?=
 =?iso-8859-1?Q?gP05bZMTuVJO3ilpJyGdevrPMKj5KalmW+?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12351e01-8766-4800-a2e4-08dcc7f67593
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 06:47:32.8043 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LKS9z8iPqcfNP2ljSaBDAThsS8daz01IBNvrw/St29XkFfyJ99m2LXYi5EnagFZ7WUAgQo7TwjNOL5ASFCf7JbAti+4NlAqTK+54L8yAFI4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7336
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

> Subject: [PATCH v4 5/5] udmabuf: remove udmabuf_folio
>=20
> Currently, udmabuf handles folio by creating an unpin list to record
> each folio obtained from the list and unpinning them when released. To
> maintain this approach, many data structures have been established.
>=20
> However, maintaining this type of data structure requires a significant
> amount of memory and traversing the list is a substantial overhead,
> which is not friendly to the CPU cache.
>=20
> We actually don't need to use unpin_list to unpin during release.
> Instead, just use a folios array record each folio is ok.
> Compare udmabuf_folio 24 byte, folio array is 8 byte. Even if array need
> to be pgcnt*8, may waste some memory when use large folio.
> The access of array is faster than list, also, if 4K, array can also
> save memory than list.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 80 ++++++++++++++++++---------------------
>  1 file changed, 37 insertions(+), 43 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index eb55bb4a5fcc..a45cec1f82b3 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
> dmabuf, in megabytes. Default is
>  struct udmabuf {
>  	pgoff_t pagecount;
>  	struct folio **folios;
> +
> +	/**
> +	 * Unlike folios, pinned_folios is only used for unpin.
> +	 * So, nr_pinned is not the same to pagecount, the pinned_folios
> +	 * only set each folio which already pinned when udmabuf_create.
> +	 * Note that, since a folio may be pinned multiple times, each folio
> +	 * can be added to pinned_folios multiple times, depending on how
> many
> +	 * times the folio has been pinned when create.
> +	 */
> +	pgoff_t nr_pinned;
> +	struct folio **pinned_folios;
> +
>  	struct sg_table *sg;
>  	struct miscdevice *device;
>  	pgoff_t *offsets;
> -	struct list_head unpin_list;
> -};
> -
> -struct udmabuf_folio {
> -	struct folio *folio;
> -	struct list_head list;
>  };
>=20
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -189,32 +195,12 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  	return put_sg_table(at->dev, sg, direction);
>  }
>=20
> -static void unpin_all_folios(struct list_head *unpin_list)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	while (!list_empty(unpin_list)) {
> -		ubuf_folio =3D list_first_entry(unpin_list,
> -					      struct udmabuf_folio, list);
> -		unpin_folio(ubuf_folio->folio);
> -
> -		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> -	}
> -}
> -
> -static int add_to_unpin_list(struct list_head *unpin_list,
> -			     struct folio *folio)
> +static __always_inline void unpin_all_folios(struct udmabuf *ubuf)
>  {
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	ubuf_folio =3D kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> -	if (!ubuf_folio)
> -		return -ENOMEM;
> +	pgoff_t i;
>=20
> -	ubuf_folio->folio =3D folio;
> -	list_add_tail(&ubuf_folio->list, unpin_list);
> -	return 0;
> +	for (i =3D 0; i < ubuf->nr_pinned; ++i)
> +		unpin_folio(ubuf->pinned_folios[i]);
>  }
>=20
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -225,7 +211,8 @@ static void release_udmabuf(struct dma_buf *buf)
>  	if (ubuf->sg)
>  		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>=20
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
> +	kvfree(ubuf->pinned_folios);
Move the kvfree() of pinned_folios into unpin_all_folios().

>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
> @@ -326,9 +313,9 @@ static int __udmabuf_pin_list_folios(struct
> udmabuf_create_item *item,
>  				     struct folio **folios)
>  {
>  	struct file *memfd =3D NULL;
> -	pgoff_t pgoff, ipgcnt, upgcnt =3D ubuf->pagecount;
> +	pgoff_t pgoff, ipgcnt, upgcnt, nr_pinned;
>  	u32 cur_folio, cur_pgcnt;
> -	struct folio **ubuf_folios;
> +	struct folio **ubuf_folios, **pinned_folios;
>  	pgoff_t *ubuf_offsets;
>  	long nr_folios;
>  	loff_t end, start;
> @@ -351,22 +338,21 @@ static int __udmabuf_pin_list_folios(struct
> udmabuf_create_item *item,
>  	}
>=20
>  	cur_pgcnt =3D 0;
> +	nr_pinned =3D ubuf->nr_pinned;
> +	upgcnt =3D ubuf->pagecount;
>  	ubuf_folios =3D ubuf->folios;
>  	ubuf_offsets =3D ubuf->offsets;
> +	pinned_folios =3D ubuf->pinned_folios;
>=20
>  	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
>  		pgoff_t subpgoff =3D pgoff;
>  		long fsize =3D folio_size(folios[cur_folio]);
>=20
> -		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> -		if (ret < 0) {
> -			kfree(folios);
> -			goto err;
> -		}
> +		pinned_folios[nr_pinned++] =3D folios[cur_folio];
>=20
>  		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> -			ubuf->folios[upgcnt] =3D folios[cur_folio];
> -			ubuf->offsets[upgcnt] =3D subpgoff;
> +			ubuf_folios[upgcnt] =3D folios[cur_folio];
> +			ubuf_offsets[upgcnt] =3D subpgoff;
These are unrelated changes that should belong to the previous patch. I
suggest moving this patch before the codestyle cleanup patch.

Thanks,
Vivek

>  			++upgcnt;
>=20
>  			if (++cur_pgcnt >=3D ipgcnt)
> @@ -381,12 +367,12 @@ static int __udmabuf_pin_list_folios(struct
> udmabuf_create_item *item,
>  	}
>  end:
>  	ubuf->pagecount =3D upgcnt;
> +	ubuf->nr_pinned =3D nr_pinned;
>  	fput(memfd);
>=20
>  	return 0;
>=20
>  err:
> -	ubuf->pagecount =3D upgcnt;
>  	if (memfd)
>  		fput(memfd);
>=20
> @@ -407,7 +393,6 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (!ubuf)
>  		return -ENOMEM;
>=20
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
>  		pgoff_t itempgcnt;
> @@ -442,6 +427,14 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		goto err;
>  	}
>=20
> +	ubuf->pinned_folios =3D kvmalloc_array(pgcnt,
> +					     sizeof(*ubuf->pinned_folios),
> +					     GFP_KERNEL);
> +	if (!ubuf->pinned_folios) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
>  	folios =3D kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
>  	if (!folios) {
>  		ret =3D -ENOMEM;
> @@ -463,8 +456,9 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	return ret;
>=20
>  err:
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
>  	kvfree(folios);
> +	kvfree(ubuf->pinned_folios);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
> --
> 2.45.2

