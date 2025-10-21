Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990B6BF4A8F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 07:45:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E3310E2C4;
	Tue, 21 Oct 2025 05:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fqcIHV8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739A710E2C4;
 Tue, 21 Oct 2025 05:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761025551; x=1792561551;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3yStUlJC1KfEJatCIVtl226mUZGnMu9eJNc6ChN7rgU=;
 b=fqcIHV8xbM8iPBNzV2837Y7Sr6bQhqLjb4u4j7YYKSKJbsIAEw5kNHEr
 Z3b6V8n5HDkQjU52mjz0DRP4WlV+I5lq+m0OJ6q07z26aO+rqrXhtlwjD
 cyi0O7+1YmWA8w+OplNZKoA0rYS8KuWjamgp8MXgdKt5BmXiInyZcO8x0
 qpPQOCs7A9L521nHSnGalufar5Jsp9SGTAAOqahUIDDysCXPj3pJ6Qn3f
 WTkj+lmTEOQUHllMmYmqgWBTWBh162Px0guvC/NuMWzedN+PtEJGbcnP/
 6dl3VjIkqn5hZbp7aLnXs3lT41c4qHt3oZJHvp58N8OO9y3gOlAPmsBd+ w==;
X-CSE-ConnectionGUID: NH0K+AobTKOBPBkTVWOTEg==
X-CSE-MsgGUID: xjqqwv7kRl+IE4d/w4u9PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="80584431"
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="80584431"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 22:45:51 -0700
X-CSE-ConnectionGUID: cYqkFEjoRieiK/lRdwgyVQ==
X-CSE-MsgGUID: pnB8QVLURCeYHOkOyMfXaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,244,1754982000"; d="scan'208";a="187916136"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2025 22:45:50 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 22:45:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 20 Oct 2025 22:45:50 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.51) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 20 Oct 2025 22:45:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zojjub71bg22LXzA9BpAX6ghW+0SAItkk33ItcpH4J2SAnRduAJuEyfHu0fUM87Ar2MItWhkScDDiXpCDqJGDRyLUHwpAAj/zPi09iJNgj9gBeXnY0sXVy2KmjGhHj3CqYP+U11TEJHioji3D2u3/WO8sBbvR17+IQzSBlHlO8XyK9R9ypKCpMqgE65eMzUnl/f6oCbzXx8Uhq9iWlpQWP+IxdE2FrCF7wEyjrRIa3zZTUN68v9Nmki2OTevAY9O8BQxOfiOS1kghYtBJgVUXVIL6Lwa0unRqvQDuIPSaY7XUTHVBw2ySoinZhezFAEPJrH2oq3ol8zRpHGAGrlrKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sCj1z2jrSNWDL1SuScf5AN828EJAyVl9KCv+lRHRXn4=;
 b=JXP5GDU8JoJlhfNvxu9kykWaB0rqtxbuylUXOj0h1Sni0qF/RGUyeshMTbVLQplOO7YeQ1uuAMijh3LUZ1RFuo53VT6dNqqTmE2pcXliLYud/e52nUxJWls5bsvip7oyLhr0i/UObNfi80Zu9sR5zb0tOo0EAGfU9uIVDznchA23No0DgnaLOK5d76X6i4d3KYBw8htJpjXhNEJcA6j9P8dDGlwROUu8cjZazezAv0ZaUQkr8amtZzpDqI1uTDzZcrZqRtUJvVgt5f9hNfV5YNmOHyw4ABYOl4+POVXDLdTtbUWGAncvf4tvCU41cKH2ekq1H1IOJXQ3azSyBas1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::84e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 05:45:47 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9228.016; Tue, 21 Oct 2025
 05:45:47 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Christian Koenig
 <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>, "Simona
 Vetter" <simona.vetter@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
Thread-Topic: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
 interconnects
Thread-Index: AQHcPNojyM5Ag60JRke2zNGq0ekHDLTKz94AgACy/yA=
Date: Tue, 21 Oct 2025 05:45:47 +0000
Message-ID: <IA0PR11MB7185F43DA66980266377755DF8F2A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251014071243.811884-1-vivek.kasireddy@intel.com>
 <20251014071243.811884-2-vivek.kasireddy@intel.com>
 <9d32258381ef46807e599e8e85e8ab94244c9a67.camel@linux.intel.com>
In-Reply-To: <9d32258381ef46807e599e8e85e8ab94244c9a67.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ5PPFBC9025319:EE_
x-ms-office365-filtering-correlation-id: 4ed6f275-0575-4553-23a2-08de106515c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ExSEQVq3WHj4J70y0EmMMlEMvJZHfxyPgxGhpsKkxIS+ETepEFON/vDNDV?=
 =?iso-8859-1?Q?Kcn54qGfz7GLWwunRIv1m2N7g/4QhtgnttMtEM1TujB/Rla/X4lNFLi2SJ?=
 =?iso-8859-1?Q?+8osWze++pcqZW1yMRbcl+h9v2rZ9t+c8rbSk+co8xHtaVjBz5/BBRML0f?=
 =?iso-8859-1?Q?ZnaFHe/oI3bY1umSM1O9mTg/0KqKZC+F3pkKisD1kPKmr0EnZRkOj1NSAn?=
 =?iso-8859-1?Q?IvxoJcz4CeBHfqXjpmI48sl6jpmWYUVlPcQZ80RHkz0oq9WU5vuZNtHYD2?=
 =?iso-8859-1?Q?HoW24ByQ6qaUacD8Pl3/7EsHOdzSa6++5cZF96HG2GygCoh3L/7t76rlJa?=
 =?iso-8859-1?Q?U3CyIyJbsTVZa6Zg9GtJc0bucreERou5KQ8O0WpU8GkbNAj0ykt09WJZ4U?=
 =?iso-8859-1?Q?r+BjXXFVx2Q7ksDkFtKFw7em1FKYJL3KSnsHxqfSKHwF6wZfGoG6edEXKI?=
 =?iso-8859-1?Q?v7YRmJulsMlxIWbVjlIcbn3kEhTkalenkl5HSWTLpe8MzBWNGThf036Yn1?=
 =?iso-8859-1?Q?jW8W4tn+bnb3irDQpS50Uv30KDwhnVhiaQT3mG/Ni4UhwTjIyMFeyaQQ4G?=
 =?iso-8859-1?Q?8S8h6T2QiK3LCXa7u79tSuHyObABNEmz94qOHcQAU9tBNb1rxEzNQEs5yU?=
 =?iso-8859-1?Q?NQXFMEETL6ZL6gQDSaU16hlYbObwXLeWuk84uCFp4L+jN4NGQJCbMZ/jMN?=
 =?iso-8859-1?Q?7ELRGTJcsxzK/SJcPpe1nG8QFbsuV1ewSWdGSZPAxqwe284o110A1hyr8H?=
 =?iso-8859-1?Q?NIWL6Slgq1h64r0WtaybOUnas9onSleuscfyxmwHj8OodtrkRY1rcyYWgA?=
 =?iso-8859-1?Q?lYsZ5lpFPQ7d/chyT2fR0Mbl381C3l1wOUBueYoVrcVwWVXaheAf8HhOJN?=
 =?iso-8859-1?Q?Hqia7pRNqTS4US6+eB+0ee+8f6+DTTNRSjMOPZbKYZRu7ckxAyt+cWoNYB?=
 =?iso-8859-1?Q?3t1x1jA9ymg0mzmI0zRxcFEpgq8C3f9c2s/PJI187XdyhZCo7zy7eAStkV?=
 =?iso-8859-1?Q?t1qxigaT1+S4PLmgMGrBN0GnJuPJYLqH22kz1stIgG0C9MsbzAhTtRiC1P?=
 =?iso-8859-1?Q?kJoix1ASTZXDiuOHXO5RuPFLWjCGs1Cv4yFqglJnqdoknei0Gt9lsG5VYe?=
 =?iso-8859-1?Q?SFUC9u0so7PK5RI3aV/1vb2UBPkW1M+0amT5f32LQZbmjOfO7URd6RGrn1?=
 =?iso-8859-1?Q?8KTHMON/tRXAZyfnnEJLJl0po4hsu4bwMe15it45gaqX56Id8BNE8Gku/2?=
 =?iso-8859-1?Q?6vW+djnIBI5ohlpunyt4EjoKVafOPXVwrsPjWGjPAYJYRsY0HpP9vhH+5t?=
 =?iso-8859-1?Q?RV5O5aOvCmQWHKM5fNQKKg4G91oO9OB/IRxMzYckj8Q2IXqo7VMENeYshL?=
 =?iso-8859-1?Q?D0M/m/MyndgTVqybcyNRBylk2brZ/wmscXTCx6izl4Act8N771/Ck46WqJ?=
 =?iso-8859-1?Q?bbwUuihhxzZfSNsbXYJDDhYYZ6Yta9kWBJ7dnW8qKIBPtFsk2dZGdhNTxU?=
 =?iso-8859-1?Q?+QO9WOLFvf6ySXLPyySyScr63xwkvy+wGW5wbqrC/UJ6WAvV+0dVh7Z6h2?=
 =?iso-8859-1?Q?ViUQdDOAhq3EsCQjHVpM2M4bQ+gi?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?8klo6LWNgI070VSKN1EfDeFxX+GQWMYlT5jPPCUsmU7x5jzk+8m3mf9Ym9?=
 =?iso-8859-1?Q?tDRREnY4RRFJQAzK3RPXiJ3svLZ775cwbZeVM+h7ArBjbdFtv0NwKcYw/Z?=
 =?iso-8859-1?Q?c8aaFZsSV1Zpj1tMncQcZwcNKqG4iv2J71AM7QixZOf2B/6WO19aGPsKGD?=
 =?iso-8859-1?Q?z7wqZH8thYcYXgpOG9r3mycQncDvYLizUyTt5WF5cvGLzd2STYG2MWVxqh?=
 =?iso-8859-1?Q?MrxeqdoaffTmi5wK5bG6bW5KyanJG2mObxxuIPRMFXaG0AGBqzuMBxsf8n?=
 =?iso-8859-1?Q?8KfZmGwbmumo1VRVygcJDizVeAA6x/5abAN6rEsaBB5ulIWOjsNLutkkFB?=
 =?iso-8859-1?Q?GsOifHr1tlisXoaSyMaHfVJrMgUuU92kaOcMmIYJDgmJHYvrvRz2VU4RxM?=
 =?iso-8859-1?Q?sAOJuXgYcTJ7jEO950bMhRJnL1wQoulrfMQ0gc1KLlURdaLjDDVk4bhtco?=
 =?iso-8859-1?Q?2qZxNgQYTIh9Xz1+9bWwXwSt7mNhpuGHaI3NoWt6R80wYjc+QS3OglzXJF?=
 =?iso-8859-1?Q?3ly/3DTjfQZIKaKvnD8GwxMNYaszRy4tuhPpfgxCTb9aPAa1bx0Dj59eW1?=
 =?iso-8859-1?Q?ffimlY/U+Y85iC6C/sc73LYuPaBP3qyNdbV+a9BRaiS6jiTwXHl5F33yG/?=
 =?iso-8859-1?Q?D88/B7QQZ2Mv1UQA1A5DNhxnSpRxLxxVYGOwfDERftQYNU9NvaAhonvS9B?=
 =?iso-8859-1?Q?5gXdDiYqFZqlDnN0Jpnp6lFxWSYDjhqFFxHnx+J1kMiRNIf+RJjVYNO5cU?=
 =?iso-8859-1?Q?g8HBnHwn5FI/jwyVqWhrqHXLgM/gXI27LOTvgHQ4GoEN7g18epb+oq18Ec?=
 =?iso-8859-1?Q?4aMX8OD5VH+zem6KMma1AYEDBgRwwibb8hNBIw8h67PbGGyIAqZh8b51+f?=
 =?iso-8859-1?Q?pMZaDAPVGvMfBuqnnv06J89WbNimuWiNCrizkvc2slAaovcchrTCOkOAJ5?=
 =?iso-8859-1?Q?gXPWtHrmyuKy4ocCQMWNzvN/qdcf2rG4JygIlOAXPRXPiFQjqLBZhKBXH2?=
 =?iso-8859-1?Q?aiard6AfmZ9NcJfL/5OWfTRHAXnC3bU4F2p3Z0e2RLFaO4MeyZ7mFkAq4m?=
 =?iso-8859-1?Q?QTuyqbq94ISdoUbYpC11GylACRcI3h2hih+NHsZBbRHJJlEhiEezGaMNul?=
 =?iso-8859-1?Q?RQVX63eL+ylcITJ5gciHeVXXrPPzHYmWBaHTgdSse0+mAXfSH4TSIXYpFc?=
 =?iso-8859-1?Q?Fy6f3L/SmkV4MnMb5KNwPeHBTx+XTn+eBz83xWF/0UpZeUYkSopKV+uWRh?=
 =?iso-8859-1?Q?XbPOKn8sBojdJ4B/AN+Qp+g2NRha1NfvRPJPANJ7MHHkyebQhbetHvXMEi?=
 =?iso-8859-1?Q?UtPKiuk32hxXknSoh4szGb0mxQ9eYxvgd7h9q6yJXUgWpslg7p9j2q0s3L?=
 =?iso-8859-1?Q?zUbHoYhC8Zi3DYi2IJ/jchs9VC/AZBVdajTzDsiRKDwmvcBPuO+wB7bDcs?=
 =?iso-8859-1?Q?69hGAvcuhaf6OcxYEJDVCTcnrDbp4AliiN1qmXko1BjfNfqs7fXMopApHz?=
 =?iso-8859-1?Q?VRoJVcPINvBJpgbA5UBIG+kfB3ybOZxktFkd0HYKrBLjGPPj5w8Mtq8bNN?=
 =?iso-8859-1?Q?76eguaO3HBvl6KY/+ToX7T9pbHon99SUBvX9mZk52a1u34k/V1itaznfM7?=
 =?iso-8859-1?Q?aUmyWffM3wCjEmhbv+mvtvYvtdetyuiOmL?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed6f275-0575-4553-23a2-08de106515c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2025 05:45:47.5328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g1xitQrq7QGs/4EBpvZXmhE7avqbKvczF1OYxiE9FzvJSIOy10DwVMZUs+iXIMPn+ouO9xjAXtO25KgJImKSQnkZTLCULqyXtj0/pRkVugg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
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

Hi Thomas,

> Subject: Re: [RFC 1/8] dma-buf: Add support for map/unmap APIs for
> interconnects
>=20
> Hi, Vivek,
>=20
> On Tue, 2025-10-14 at 00:08 -0700, Vivek Kasireddy wrote:
> > For the map operation, the dma-buf core will create an xarray but
> > the exporter is expected to populate it with the interconnect
> > specific addresses. And, similarly for unmap, the exporter is
> > expected to cleanup the individual entries of the xarray.
> >
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> > =A0drivers/dma-buf/dma-buf.c=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 68
> > ++++++++++++++++++++++++++++
> > =A0include/linux/dma-buf-interconnect.h | 29 ++++++++++++
> > =A0include/linux/dma-buf.h=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 11 =
+++++
> > =A03 files changed, 108 insertions(+)
> > =A0create mode 100644 include/linux/dma-buf-interconnect.h
> >
> > diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> > index 2bcf9ceca997..162642bd53e8 100644
> > --- a/drivers/dma-buf/dma-buf.c
> > +++ b/drivers/dma-buf/dma-buf.c
> > @@ -1612,6 +1612,74 @@ void dma_buf_vunmap_unlocked(struct
> dma_buf
> > *dmabuf, struct iosys_map *map)
> > =A0}
> > =A0EXPORT_SYMBOL_NS_GPL(dma_buf_vunmap_unlocked, "DMA_BUF");
> >
> > +struct dma_buf_ranges *
> > +dma_buf_map_interconnect(struct dma_buf_attachment *attach)
>=20
> Even if this is an RFC, please add kerneldoc so that the way the
> interface is intended to be used becomes completely clear. Both for
> functions and structs.
Ok, will add documentation in the next version.

>=20
>=20
> > +{
> > +	const struct dma_buf_interconnect_ops *ic_ops;
> > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > +	struct dma_buf_ranges *ranges;
> > +	int ret;
> > +
> > +	might_sleep();
> > +
> > +	if (WARN_ON(!attach || !attach->dmabuf))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (!dma_buf_attachment_is_dynamic(attach))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	if (!attach->allow_ic)
> > +		return ERR_PTR(-EOPNOTSUPP);
> > +
> > +	dma_resv_assert_held(attach->dmabuf->resv);
> > +
> > +	ic_ops =3D dmabuf->ops->interconnect_ops;
> > +	if (!ic_ops || !ic_ops->map_interconnect)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	ranges =3D kzalloc(sizeof(*ranges), GFP_KERNEL);
> > +	if (!ranges)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	xa_init(&ranges->ranges);
> > +	ret =3D ic_ops->map_interconnect(attach, ranges);
> > +	if (ret)
> > +		goto err_free_ranges;
> > +
> > +	return ranges;
> > +
> > +err_free_ranges:
> > +	xa_destroy(&ranges->ranges);
> > +	kfree(ranges);
> > +	return ERR_PTR(ret);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(dma_buf_map_interconnect, "DMA_BUF");
> > +
> > +void dma_buf_unmap_interconnect(struct dma_buf_attachment *attach,
> > +				struct dma_buf_ranges *ranges)
> > +{
> > +	const struct dma_buf_interconnect_ops *ic_ops;
> > +	struct dma_buf *dmabuf =3D attach->dmabuf;
> > +
> > +	if (WARN_ON(!attach || !attach->dmabuf || !ranges))
> > +		return;
> > +
> > +	if (!attach->allow_ic)
> > +		return;
> > +
> > +	ic_ops =3D dmabuf->ops->interconnect_ops;
> > +	if (!ic_ops || !ic_ops->unmap_interconnect)
> > +		return;
> > +
> > +	dma_resv_assert_held(attach->dmabuf->resv);
> > +
> > +	ic_ops->unmap_interconnect(attach, ranges);
> > +
> > +	xa_destroy(&ranges->ranges);
> > +	kfree(ranges);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_interconnect, "DMA_BUF");
> > +
> > =A0#ifdef CONFIG_DEBUG_FS
> > =A0static int dma_buf_debug_show(struct seq_file *s, void *unused)
> > =A0{
> > diff --git a/include/linux/dma-buf-interconnect.h
> > b/include/linux/dma-buf-interconnect.h
> > new file mode 100644
> > index 000000000000..17504dea9691
> > --- /dev/null
> > +++ b/include/linux/dma-buf-interconnect.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: MIT */
> > +
> > +#ifndef __DMA_BUF_INTERCONNECT_H__
> > +#define __DMA_BUF_INTERCONNECT_H__
> > +
> > +#include <linux/xarray.h>
> > +
> > +struct dma_buf_attachment;
> > +
> > +struct dma_buf_ranges {
> > +	struct xarray ranges;
> > +	unsigned int nranges;
>=20
> IIUC this would replace the sg-table right?
Yes, that is the intended goal.=20

> I guess Jason or Christian
> would need to comment on whether this is generic enough or whether it
> needs to be interconnect-dependent.
AFAIU, the individual entries of the xarray could be of any type that is
interconnect-specific and shared between exporter and importer.
For example, for IOV interconnect, I have picked struct range as the
type (to represent individual entries of the xarray) to share addresses
between exporter and importer.

>=20
> > +};
> > +
> > +enum dma_buf_interconnect_type {
> > +	DMA_BUF_INTERCONNECT_NONE =3D 0,
> > +};
>=20
> This calls for registering all known interconnects with the dma-buf
> layer even if the interconnects are completely driver-private. I'd
> suggest using a pointer to identify interconnect and whatever entity
> defines the interconnect provides a unique pointer. For globally
> visible interconnects this could be done in dma-buf.c or a dma-buf-
> interconnect.c
Thank you for your suggestion. I'll explore the idea in more detail.

>=20
> > +
> > +struct dma_buf_interconnect {
> > +	enum dma_buf_interconnect_type type;
> > +};
> > +
> > +struct dma_buf_interconnect_ops {
> > +	int (*map_interconnect)(struct dma_buf_attachment *attach,
> > +				struct dma_buf_ranges *ranges);
> > +	void (*unmap_interconnect)(struct dma_buf_attachment
> > *attach,
> > +				=A0=A0 struct dma_buf_ranges *ranges);
> > +};
> > +#endif
> > diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> > index d58e329ac0e7..db91c67c00d6 100644
> > --- a/include/linux/dma-buf.h
> > +++ b/include/linux/dma-buf.h
> > @@ -23,6 +23,8 @@
> > =A0#include <linux/dma-fence.h>
> > =A0#include <linux/wait.h>
> >
> > +#include <linux/dma-buf-interconnect.h>
> > +
> > =A0struct device;
> > =A0struct dma_buf;
> > =A0struct dma_buf_attachment;
> > @@ -276,6 +278,8 @@ struct dma_buf_ops {
> >
> > =A0	int (*vmap)(struct dma_buf *dmabuf, struct iosys_map *map);
> > =A0	void (*vunmap)(struct dma_buf *dmabuf, struct iosys_map
> > *map);
> > +
> > +	const struct dma_buf_interconnect_ops *interconnect_ops;
> > =A0};
> >
> > =A0/**
> > @@ -502,7 +506,9 @@ struct dma_buf_attachment {
> > =A0	struct device *dev;
> > =A0	struct list_head node;
> > =A0	bool peer2peer;
> > +	bool allow_ic;
> > =A0	const struct dma_buf_attach_ops *importer_ops;
> > +	struct dma_buf_interconnect interconnect;
>=20
> Hmm. Could we have a pointer to the interconnect here? Let's say the
> interconnect implementation would want to subclass with additional
> information?
Sure. I was going to do that in the next version.

Thanks,
Vivek

>=20
>=20
> > =A0	void *importer_priv;
> > =A0	void *priv;
> > =A0};
> > @@ -589,6 +595,11 @@ struct sg_table
> *dma_buf_map_attachment(struct
> > dma_buf_attachment *,
> > =A0					enum dma_data_direction);
> > =A0void dma_buf_unmap_attachment(struct dma_buf_attachment *, struct
> > sg_table *,
> > =A0				enum dma_data_direction);
> > +
> > +struct dma_buf_ranges *dma_buf_map_interconnect(struct
> > dma_buf_attachment *);
> > +void dma_buf_unmap_interconnect(struct dma_buf_attachment *,
> > +				struct dma_buf_ranges *);
> > +
> > =A0void dma_buf_move_notify(struct dma_buf *dma_buf);
> > =A0int dma_buf_begin_cpu_access(struct dma_buf *dma_buf,
> > =A0			=A0=A0=A0=A0 enum dma_data_direction dir);
>=20
> Thanks,
> Thomas
>=20

