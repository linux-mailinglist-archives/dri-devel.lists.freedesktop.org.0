Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 191BF94DA2C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 04:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270410E04A;
	Sat, 10 Aug 2024 02:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbulRrrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A126510E04A
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 02:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723257570; x=1754793570;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9xhyMMn/y7QElOuLL1X0NRfvQKnILJ4Sv2yjn+ngshw=;
 b=hbulRrrn6qndnMSozfmxtELpnezkDSx3GGQWHKJaVR61vC595YayVoQB
 PFWaTylQgnBVvCyF1smClKkLlrX8rRw3OGUpZFyOWta2zTvBIJHT8YQ1E
 t8BybaaesIG1xZ9ZasGdrshrEUi/cOLwDIkvyYMIAKNFeWhkdc5ukUwK3
 YVETD99aM+mc6JViWI77dosxTe73jUo1jrsHQDdHIowh5qHsm+p5DcWva
 maC9OG0OE/gTgI/B82yk0v3jtbXgB3SdvX297fCbVOguTHH/xVNGhRo0T
 M/TjG/F+rSIeLOlLjgpMWyZ8abCJ31pA5PlQYIj8krT27IV5EYjKw8lZw g==;
X-CSE-ConnectionGUID: bTrYf3NGQqyA02vjCTyguQ==
X-CSE-MsgGUID: O6I7Lso+TReL5s4goPaIcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11159"; a="32123184"
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="32123184"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Aug 2024 19:39:29 -0700
X-CSE-ConnectionGUID: DxHIppBXQlODke2xNwsvyQ==
X-CSE-MsgGUID: ZTuMzrWWS2a3+5lyXohoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,278,1716274800"; d="scan'208";a="95256718"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Aug 2024 19:39:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 9 Aug 2024 19:39:27 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 9 Aug 2024 19:39:27 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 9 Aug 2024 19:39:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVwVX0uB218Na3hdMu8VXRPJl2YlfurpQa0O2OqnS9ZI9fWBLo1H9A3tQB2mTwkZ7RDKfkwBKzS6uPYBBGoKcxX5wSCuC6rJh/A1uKu92PQxMcsQDPan6Z9sT5XQqV1z0RNxr2k/vrjPu6JAEJayfqmkUO3UxcltK7CbKi9MpeDWI7JRkBh/p9ISWPul62fAv6pbqFk0OX9XAhPYP5Vk1OQjFOwkZx06NE1VZfqxBf5g0ZyouJFt718QwQr79Ce4P5F+q0qEdqDYK7bxUoo61rnBwMc2LNFQG5PzU0oUuUcWu/W/dBWgljxkgcw51yjRMe6EuyXLLnuTcyal8O2D3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fvGM2V00Y31zRG+SdMFOuei1Mq8oWt9EunOW+PUhHRA=;
 b=YjF5DQyd1soZdDedVMpGlY2IdshXiTBOWDmbrYbh608a7GAuAyEi2c4Va3MLxO4PJE+CfKIhih85U6+lml76hjulEY6fpyvgA2ylaU++EUkuAAmC+fj7QiuX5afJO4KQIRFv/1oFH0vkzUX2gxpfMleAXmpRM5yHbStYwDcWb0hY5cQsWPd0MjUfVh74npeilqQQXB4wrwGz5YxgsdHeAEb9toBmvBuS384MIMvGWmqp060BpVWoamSIT/5nze7CnHOaBX2hAITvRBP5vHCQPw4FrCj3LtGFuv+8cTiI569JJn5GM+wq0v6kJ8T6gLUbdAmHx/2lA6iu0lFpK2PNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW5PR11MB5761.namprd11.prod.outlook.com (2603:10b6:303:195::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Sat, 10 Aug
 2024 02:39:24 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%3]) with mapi id 15.20.7828.023; Sat, 10 Aug 2024
 02:39:24 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v2 3/4] fix vmap_udmabuf error page set
Thread-Topic: [PATCH v2 3/4] fix vmap_udmabuf error page set
Thread-Index: AQHa5udCU1Ph4+EiKEurbLPwROJ5iLIeGvdA
Date: Sat, 10 Aug 2024 02:39:24 +0000
Message-ID: <IA0PR11MB718536A806AE4C4A6CB470B8F8BB2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240805032550.3912454-1-link@vivo.com>
 <20240805032550.3912454-4-link@vivo.com>
In-Reply-To: <20240805032550.3912454-4-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW5PR11MB5761:EE_
x-ms-office365-filtering-correlation-id: fd3bc371-fe50-48df-2986-08dcb8e5a5b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?iG91FIch8jRFiILHuuiZnVAF6Ifxxq9ltl4XtkxsQ7BnKN/6lUpt66XjpO?=
 =?iso-8859-1?Q?/eKcFVShQe8AxKasM0OJT/m9/wizd3W7QHGhuUX46ZcBZzZwC7yGPcyo6R?=
 =?iso-8859-1?Q?WAllAWI/yx4fu82ggfSPckGAX7kEKPLvne0RVwYfafLJb0ZtcgZT1j2SZT?=
 =?iso-8859-1?Q?ul4PDrd8+/u6ozWEpCYpT+dUfDZaKyXOg7FCai//3iJYFtYXvOjD+f8bUW?=
 =?iso-8859-1?Q?SAnmMrOPaOGrciSEVfNHLHlJa6qHmzHaoEAFhmpJh5FPdna8EleYeQh9jS?=
 =?iso-8859-1?Q?zkRwy+/scXUXB36wMLVleZTWOoljCqYMY68G9m/fb3LoA+S8X0j5dL3fET?=
 =?iso-8859-1?Q?9RVYAgok0ECZi3fcpOdbvSwyQ6f2Ob4wgQb9ZsT/U52KvBt72vwtSeOcWr?=
 =?iso-8859-1?Q?uYBye4dg2PJywq2admQWdCdOIyNWanei0xXMsYevHu3JXJhzFkdbJ2CsXZ?=
 =?iso-8859-1?Q?BGwE3R/H+Jajj34zxU6Ci6f6jnD2Pt9Wi3P4Du1BbsMmAcMUz+EkpKC2Jc?=
 =?iso-8859-1?Q?6F4cqeMuTIBQVDu/v7e7V044xnvk1VPzhQ9fNZd6erY1Mmc76dfxC4l/R2?=
 =?iso-8859-1?Q?3ChcNF5+WFPqaj51a5T2CNvvWRXGZ6pJ/bSXG0fwJpUTivxwLO/OpmqGfz?=
 =?iso-8859-1?Q?IlPIwzdUta0mFdNo6P/BA44qD6oSr9EOGG1ll8C1JcAqaMAP7SGkyG4l+z?=
 =?iso-8859-1?Q?o+SHPx7iFSJkINf+f182nVErZ7zPCyLr94eDoAp7JGBmYLbwB0LnFY9sQC?=
 =?iso-8859-1?Q?uHVWIuhK77Gvm7+dinQ1OfuAllhEUxB4/orC6qdbgjAZwc0K+oT0u7OUiL?=
 =?iso-8859-1?Q?G5Y47kxOlKaZPLF5JxcgapO4fWSeEBo1w0e8CKLW0HLHB2i7NWTFVBcYG0?=
 =?iso-8859-1?Q?xrD+qF2zetM9XvYK0M3LDuUpnx7pd4d59lRxS4Yv9m8+lo0Rk7q0XlLzXg?=
 =?iso-8859-1?Q?FdKmIKZ1y2pKZzRxK/HHB/KqEyNPR9rFUj/IoDQ8tThtcNPmRbzhqav8/G?=
 =?iso-8859-1?Q?vNG5mNaJ+7+jf2mJIazhGGHdevM0WR7ODIBgOopVNcr56US2k5Tli1CkDB?=
 =?iso-8859-1?Q?uclcZaPmC84rreTulH9ZrphGOB21XeIIJQWnZY1QJmvDQ21S6nXV+A7lWu?=
 =?iso-8859-1?Q?Cmvh9FCq6YvrphLwN/dGykr3LtwdvhVy51rq91DQUksk9Z6QvQo2Aqa8Xf?=
 =?iso-8859-1?Q?pgZ8wpcHrKGk1Rs5matzr9LgP53jsM+mJqbNn+YAGocKyvYxD2vKz3v/Ap?=
 =?iso-8859-1?Q?eSx2qyY+cbZUkkYArGypTo5/c/fDSq1s654KC2Ueazzaei/p1FeV5+vc5W?=
 =?iso-8859-1?Q?M3Jw42czoeCP8dtPW5NbPm4chbUdAMxyucXATNHxlIUzuFRkUz0uZgyCyo?=
 =?iso-8859-1?Q?U1S52koN/PlbJoRNjsQcZlpFUvQ8FlvyBab/fQr38jC6eCl0SxsL2c0L0b?=
 =?iso-8859-1?Q?qiYmpuLDoR6It2C+N/f9OPMD6/ccASZbVqFWxQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ysuwNt6RItgg5T4B6PngqCAiy2zkZ+++B5Pn1OsfdFU0qeXf67923QBYZC?=
 =?iso-8859-1?Q?Fawlu3k8tsx3ET5oX44JUNrhF/l2vm/NbDaLKolv7KIYTB5r9J4qf5v9zy?=
 =?iso-8859-1?Q?koxpOzFuM2uhatVPEYU9WOy2BoFR9TCbOiwqOQ8DFpDPr6AXeG/PE9Ridj?=
 =?iso-8859-1?Q?cwX7Pz+T0TlSH1Z5Pu+GffWEFKtc2NqKijXFv6DCOWxMv9t+9K2NlZ1G/k?=
 =?iso-8859-1?Q?P1LcEc7gORKU0iQny6XT6S2sVKkjnx9tNkN4yg7nMvcekql1SvkqBcpfOJ?=
 =?iso-8859-1?Q?p33jEJ2C/ezEX2IU17TlWy479bjYsb1SrktD6E65lfVsaAu313wqVPSzd1?=
 =?iso-8859-1?Q?X/i1hBVWRJ0ULAGDO0l67DrAgKd08gD2afvQUe8L4kZvsiS3ytxZDLKXbT?=
 =?iso-8859-1?Q?UHsabwQRTQEerAUVii6goq8tgsW0lIrLcfZv/3i2ZpPNG0X4GE0YOncfW6?=
 =?iso-8859-1?Q?OFbnjMWxubv9YrXOjJ1Xr/IozJIflYAhRNlodzUwGKzKzshUlfM1Cgnija?=
 =?iso-8859-1?Q?CVFFB4mWIXafHBTxaHdzBQaIaM1ES+T74p4IXoF3a63Pr118v/2Na5wdyJ?=
 =?iso-8859-1?Q?KzItUtcWoXomqGKgZLPJTvHsxtjHKzzc6OXgdi50n+hQkiuWsBLO25agQl?=
 =?iso-8859-1?Q?aKb2FZAKUsc18MSfaZqwFgmtZL1ZOr0N9/gNbuPcmmloEMG/NYnzJuv1ZJ?=
 =?iso-8859-1?Q?zr//rCSFhIsR+vKOCNxoB9Jj5Hqcl2HFhpDUepte08k/XWF6j3J7zig8e0?=
 =?iso-8859-1?Q?lXkDsePW5Ie5b/KBOsapeOGVjsg87mCRO39OWB8LuSqoD8UW28Aax4vZnx?=
 =?iso-8859-1?Q?jyI5tk5AA0wKzNz95b8WYvISprLSzle8xR8/3Im8y+R8Yk1Pynx8RvL/fV?=
 =?iso-8859-1?Q?p1+rN9yFJjhVOQd2qLG3RZlBpr6WtU+UrTGzqR+IA3waYDb5eAFk+XmQet?=
 =?iso-8859-1?Q?dusKoBYXx9/lv5s1Kmx1cy5mswhBTw2mq8M3lba+P1DqDdUc9U0KUcLPXk?=
 =?iso-8859-1?Q?yrF0SncURtCST0PIMA6735WEc4bsRuPYJ7iNVpNqrQBD4r2yI56CKJ3+OR?=
 =?iso-8859-1?Q?WVZTrt5/7J6v60On0RHXeHEqtPWeIFrGKZnOCZTqkni6HMOL4TN7VEt0kk?=
 =?iso-8859-1?Q?ftVWwaiscvoh4JzzOvdCIZsn+GrnDXPkZ8b77T+pb8Ai3XMnh0AUIRc2Uk?=
 =?iso-8859-1?Q?DPdM9uXyasDbWwA1xg8Y1w8BiDi2nq/wAa0ECHWRslX9akxn1EZIqrAyMS?=
 =?iso-8859-1?Q?QLiTXTqKSCfq6Mu1Nvoya65PRSO2A/9whNoLb0iuIHOJL1NHl7eumsmT7p?=
 =?iso-8859-1?Q?f0ArD5hQ7vR8voFU5YB/h60jYXNf8EQXvb+ySoreToUwndbLAL3WUDMItt?=
 =?iso-8859-1?Q?eZZLzj3oueBVIF002SqF4X5Xf3ma61kM2FJ+SXr3ssgfYlHA8taSW9Gf86?=
 =?iso-8859-1?Q?SFTnC8JsABDlQpdfXbeLXvjROtQ0/NLRgyBtpDtinuK2y/mgUFDJ4m1i85?=
 =?iso-8859-1?Q?sW+rdU6g2uHBApVrJVdyL0WaGdSUjKz0Cg64rn7sRWZjAx8E4HeMopQs+6?=
 =?iso-8859-1?Q?SnRpvW42U39mGk+EJblWeNoZxJ0O19nF4GP6BIpTV17owjePb+GbHOdlOO?=
 =?iso-8859-1?Q?whbzASb350dbkcE4FrsvHHF9DzIsS+TIPi?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd3bc371-fe50-48df-2986-08dcb8e5a5b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2024 02:39:24.6002 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7zpc3hq2SvGBkv4t++AuF0CBlm/ZllG4llqVbd4cAKbkHH3uVSefcWM/J0VcVaVOJYrduXevTqpO9plgQ4vgd+wH10jwWi994Mnx1TtKH+A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5761
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

>=20
> Currently vmap_udmabuf set page's array by each folio.
> But, ubuf->folios is only contain's the folio's head page.
>=20
> That mean we repeatedly mapped the folio head page to the vmalloc area.
>=20
> This patch fix it, set each folio's page correct, so that pages array
> contains right page, and then map into vmalloc area
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index af2391cea0bf..9737f063b6b3 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -78,7 +78,8 @@ static int vmap_udmabuf(struct dma_buf *buf, struct
> iosys_map *map)
>  		return -ENOMEM;
>=20
>  	for (pg =3D 0; pg < ubuf->pagecount; pg++)
> -		pages[pg] =3D &ubuf->folios[pg]->page;
> +		pages[pg] =3D folio_page(ubuf->folios[pg],
> +				       ubuf->offsets[pg] >> PAGE_SHIFT);
I believe the correct way to address this issue is to introduce a folio var=
iant
of vm_map_ram() and use that instead, along with the offsets info.=20

However, for the time being, I think we can reject vmap of hugetlb folios
by checking for non-zero offset values.

Thanks,
Vivek

>=20
>  	vaddr =3D vm_map_ram(pages, ubuf->pagecount, -1);
>  	kvfree(pages);
> --
> 2.45.2

