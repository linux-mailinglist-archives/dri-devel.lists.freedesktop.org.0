Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B1E977488
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 00:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC2E10EA46;
	Thu, 12 Sep 2024 22:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fCb/w0RJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686F210EA46
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Sep 2024 22:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726181464; x=1757717464;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qX4SYDfL4JqJXgVG+UxBDac8ZOihcRklmLqm3/61TjY=;
 b=fCb/w0RJGOnMlN+wpOHT9xTMFLck7MNUdJcR4b/zEtII0N5C+amqCbRZ
 CnoYyaKWLszqXkFZufFcRFyZd2zJDBkPB1676QG53i4Rs79BbIc+QIkkO
 8OBVtUh5j097AEKTjWWicSNwqB89LqDcbmtlbu3kAxI3A28wlaRp1EokE
 FC4r7nCC8OCFi2mQMJbhHN1f+844yh542H+xqCfeBwajpeXpe1dUQZaXP
 IKD+1OUmJr5codhMytueFIxV+2DVhE5T/xS6BKmKGxcVosdQmgbI3CHdl
 Hl0r2BfSpjRQrDU2Qc6kUzszpIk6UmFkvogvk8jj4COPbgaUL9iSd2BvS A==;
X-CSE-ConnectionGUID: a3GsqANASsuPZgrqKuETAw==
X-CSE-MsgGUID: FfqyDNEpRiqMn149z64sEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28961727"
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="28961727"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 15:51:02 -0700
X-CSE-ConnectionGUID: PSxOVKUvT7mIjSWqVlXUDQ==
X-CSE-MsgGUID: 682emU9xTYK21Drm3w7WTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,224,1719903600"; d="scan'208";a="67701013"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 15:51:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 15:51:00 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 15:51:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 15:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVOef1jpuLtzaG3vqTXtZy9pZPZBuCG1yXa6GrUv3joaaFBeqmh5i3IWGXeTABQRd0auVdcj5O5U7yAnFzBm+DHP5FSYE5kzsjvZiiZWTm32E4oAuOgXhovJWnyqqsWZLDRdjM+1bMv6LYG5tI3WFYPgpH6D4d6hLirK/mW3sfQf0Jh3bHwA4KfCd1llzOt6Ji/cnHN4Z59NT/pw3VVSMwIWFTW5nRUN0oCq4+4hpeAVslsqqHeU1zCYY0w5ICBCmPqV6ZImJLEvKjIvgNqmlKnkfT1SNUIS75/8Jb0Y2eSQLqpoGEnhloiInL7I/W/d4LeubYaOB6wZXZlBwYlTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hAnNl4DKJ6Wcd/+rWwnt/jvGdLvft+xC3KAjdaxsQXw=;
 b=Eem7rSldDh14zUrjNjNhVFl4kcGT0mFAldFlZJxJZqjvicTiqwTQW2ixA42NzOAVlTNm61soOmXb9hFa0hqehP2FV7ARHKkcM1HEp9F3kxlrOpKZdyUnQg0WIqi9c/2p5oC8g86mZYS2w1U2JIpt2AihRn3xlk9HhKPxhB/lnQWgDEKTWKJRCQrfn7OcjwEkPQGPCtR7YXdrcuploAwuw0qCjXYreJj9lHIVUrgANwnrmO2gznwY9Ci2MPS+khFl9bZ13aSwww5SXZ1NOg7q9xa1tP7I5WuIgEfcj7rmP0FPrziNZFYaUqL42m1CZbEmK8RjKBKxGBDa1PlN4OS7mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SJ2PR11MB8324.namprd11.prod.outlook.com (2603:10b6:a03:538::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25; Thu, 12 Sep
 2024 22:50:58 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7962.018; Thu, 12 Sep 2024
 22:50:57 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v6 6/7] udmabuf: remove udmabuf_folio
Thread-Topic: [PATCH v6 6/7] udmabuf: remove udmabuf_folio
Thread-Index: AQHbAplk627cSAifF0eA0YramTc73rJRxcFg
Date: Thu, 12 Sep 2024 22:50:57 +0000
Message-ID: <IA0PR11MB7185919B9398B745C53C0C0AF8642@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240909091851.1165742-1-link@vivo.com>
 <20240909091851.1165742-7-link@vivo.com>
In-Reply-To: <20240909091851.1165742-7-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SJ2PR11MB8324:EE_
x-ms-office365-filtering-correlation-id: f7fa72be-b457-423b-7365-08dcd37d5d90
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?izdjdZlS9FY4+Alhw0xEnUz965MUGg3E0mD8Lt+bDMdzJ9VCsMC/PyBS4m?=
 =?iso-8859-1?Q?q35aw12sx6o7ejsr6BNxGOU66hBG4ufZwEe8UMVMioQr6rHrITAf21ij4p?=
 =?iso-8859-1?Q?Xy9GrAMQzhBmAS2ZlOUJYWj8nrACErTmxb1EWYsSN4C6Ne9OlvpF3YvPk7?=
 =?iso-8859-1?Q?CwlltXFtrjP6b+DwEaDwt0K34ZgAnZJRHo+CcNHqwPGH3URpkCmckXg/U6?=
 =?iso-8859-1?Q?GAQyC0OfFGtxgn8UOhylpSF1U1gIHdOvFd8XqX4wo10VvDPwDyB0Lzzzm9?=
 =?iso-8859-1?Q?vDd0W9J9eObA8BFuzfEIkakP5ttms1iqkncJiRl8nPCFBV2Mwwh4lbDMs+?=
 =?iso-8859-1?Q?OJ60xIgsOUV0UYBb1af3hG8KAeDLJksANr/mrILke8MoGMoRiiELxPKBlm?=
 =?iso-8859-1?Q?ac5/6bNSs1cg3h99O3cdfFTVW/TlJwuf7yz79FVDAjmcJNA8u7V7FdltHH?=
 =?iso-8859-1?Q?Er/g3HFXEsQnOyLoe2ImZoEq4IOpHSJ8ITQesjNgTnJPh8JhPyWELOBSBJ?=
 =?iso-8859-1?Q?axcZ0xsF7eJRucR+s9Z81U+Awl+jKwOzhpoJF2jYTN5zTBnHGKjhHNM4UG?=
 =?iso-8859-1?Q?kgnjyhEOd7OalkzXPZUYlZ4p9ATmzbBZqFMx6ymFLNrGrk1XRSm30W5tYL?=
 =?iso-8859-1?Q?favoklUz8jkWIy+5AV2PHcuSYmqCOsuQ8a1QEt5hDxIoVBudKmikuf3KHL?=
 =?iso-8859-1?Q?FMYMteabNbW+B4JsLg+gxaJHQKVr8sHvGBcboW6JoSAIt1v3W3APysid2D?=
 =?iso-8859-1?Q?3STGkaa53QycMeK/1MJeN/8BUaY3qaOtjlnMrJx2NJPQwBeRfcOyF9Cuny?=
 =?iso-8859-1?Q?f3fnsYsK4Nd1y44XYa7oR6UllqJT7GFfxevQStGjC82er7qwXAKmdDIFo9?=
 =?iso-8859-1?Q?T/YyAVn6ZC1IbWxWhqB5EetrshPPYzrYtlClUbLLXfWUMM9+CjxtVJdA6d?=
 =?iso-8859-1?Q?5f424M+fWzWCvhtp1eb9ZSliJH2dUMsshZXUa6VrRiIky5ENseqfoL7zmr?=
 =?iso-8859-1?Q?vQt3OibOgaRQ/POMK5QcB8JEyNKdv4QfsgT/Qor5KvbxxHHrLnYwR9+eUp?=
 =?iso-8859-1?Q?L3Te0kAFKu1F5Y84xA0BY2dGdatmJvvQxeC0XAJ5Rx2roVfCwXL01AfHsc?=
 =?iso-8859-1?Q?xF5ThyDEQc1JPD8awms71VkNF+KSU59LdBD6Je1RVXKrE+3J3OPcn4AffC?=
 =?iso-8859-1?Q?+ZJaVlv6LEQlz6shm5vAqzgLRo7ZKJ2PnCmVCNrdB2teVzxs15cLoXlYS/?=
 =?iso-8859-1?Q?oEJh41B1MiaBjcPB4E4z29te8A18hOWh5FU7V+MjbDaUqclxS+YBSquZWA?=
 =?iso-8859-1?Q?ISuipXDSaJ8sUheBEwyjlQdh/iqJ2lIRnpVaGBCi0M7OaUgGvMTOYs38MA?=
 =?iso-8859-1?Q?EGeXLbQN0c0EcUCeZi7E5xB6Ho50qv+Z13KFrlnQjc2qh5pvZmJVGCA7cC?=
 =?iso-8859-1?Q?vFK8KL4lHRvxKhX4/USVeCfRqTVTUuKSk6KPZA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?3HH0fSbl5seO3z62Gp0dMQfBMmV2VDX6ysi1XdUD/CAZ6Ad8WWq/6REG4B?=
 =?iso-8859-1?Q?5o6/9O9a8LuXAPa/2OTjJ1LdDtx3U5zaySP2RUeVnUTluNGFRz9IBGn5Ws?=
 =?iso-8859-1?Q?JCm6jNtxAymenzkC81Zs3IvHxbedaGyoE0jaGKl+yX65wPx3bWOryoKlFN?=
 =?iso-8859-1?Q?TV35kGyEv3J9bw/S+tZxkwNxzvJW7jufUWM1Eas7rlOcTOMJ+LPhmHVxuu?=
 =?iso-8859-1?Q?JuA72ZFsP4x4HYotIaq8mbMPX7asJuWhILeXJFwnl8Tb/+EAtewp9uCooK?=
 =?iso-8859-1?Q?tuEUkHvjms2+tCiJlgVybM7ojRXvNsi5ZJw5Q/07KvDwFq4ItTD9L4rJRJ?=
 =?iso-8859-1?Q?YfW1UbLN8WzhWwjLi7Lqe/PMzkiC7hLKEutmg6ZHpNMMYbvk6zRSLTIgXU?=
 =?iso-8859-1?Q?G3SMeoBfP7Sufx0uRIiGWyHurv51bsiC4q8YnJSakegn5vQbjFhDzx2Tmp?=
 =?iso-8859-1?Q?IqQl1zPGTI4188+iMKiO9VRfs+mewRA7Tmhe+shWXHDqooOS5MeILJx9qf?=
 =?iso-8859-1?Q?HRZfixtT/p9Ro67jkKsF2ghKxDY4cTcXiW5P8r8hFoKIYlCb8QXICSjThz?=
 =?iso-8859-1?Q?W0dDE6z/HJ4JCl57WLOrm2Jrq/vQHZIBKrrlTSgg48gv1DFbthCLrgLZOX?=
 =?iso-8859-1?Q?AJ4J4IrVE3gxqzMKyKRgrXtQ7Wze4Ibp3sUs78LwT1wkVfziLQyLYAzkNF?=
 =?iso-8859-1?Q?a+wwMpeHSlQgtTrHq7EuSTj0zfhD2rROZvuiJ7RYw3f6LmHruHnkyt4UQn?=
 =?iso-8859-1?Q?4jUaEgMrz2C70K0iyPzjSHhSPU9K6c690/3oS4CMDY+l4c/zw0YIQqbKc2?=
 =?iso-8859-1?Q?pTxPv7Sxf1mvkBzTv6QvqYqpqapkF6aKrtH7BPgboDovsiawdYvQPbSmez?=
 =?iso-8859-1?Q?7CQ8/ehjRlXPbWFPQax5d8rQIsPr0fbtd51FhXEbRATe4oDhCjUgSJb7qf?=
 =?iso-8859-1?Q?wt5BYPlCLcMjseqZUEhlw+wNkFIwT/mfJJdrhbNzC9PJpx8Q/m5hd5lHV/?=
 =?iso-8859-1?Q?GGmzKahas0rCKh4jRrbeNDjM9bU0ezEzyQB5IbvT5Ddy+TCrMKAoe3XEyA?=
 =?iso-8859-1?Q?GqY6EConMOiDDC3SIV3RJJWPklLbcIKyuWcU41up6k/tHSg1J2MJ7U2KY8?=
 =?iso-8859-1?Q?PZYpk1WwDytBGcFSE6Dgf9G99iByEJrSOqH8JDkRiRLVkeZvJz7KIrSZxH?=
 =?iso-8859-1?Q?kUzvwG7g+I72T6SPzBwJHm5rtkijXIzFeraaNt8jCFtqM243Azv9hZRWcR?=
 =?iso-8859-1?Q?zD7gAX7xO3KnlLkK+SrlrSc6fJi0SMJLRL9nY+uK1FnpXfZyuyKlkUDsm5?=
 =?iso-8859-1?Q?pAk1dsua/SoYb5Eo+5zqcOx7KAP78+2z+f48TQyuDIZZ86YIlSha6mhH8O?=
 =?iso-8859-1?Q?YgoKNu6V/YQJFBsx8B5K6dHHTkwg/uJOpgDkhAFyUM6dyK/YRsFDMeEIcP?=
 =?iso-8859-1?Q?homrcN6LWIXA328COxycwSI5Q/q0GkwiJ9kOzWuRhBXGLp90uaulHmVv2X?=
 =?iso-8859-1?Q?TOZLJK2HikHgxrmO16efU/B8iLkDWZjmeSUKbk/xin+db1DS5MLW2BTYNr?=
 =?iso-8859-1?Q?FnbDc03OGmjb06AHhQ3QeGlbk2l+XKF918Qw0eoAevQadC3Ku9GLhy2FHv?=
 =?iso-8859-1?Q?OQVYeYWNbedY8+hWRhoW3r/K73aEZh1rZP?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7fa72be-b457-423b-7365-08dcd37d5d90
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2024 22:50:57.3399 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HSy9zrUN8vMGtyWz+hh4PelSo1HLLU6rhHcg/Jvv88BdbKGAYpwNHoPUcsEdAVUOYQClytD/dvA2zz/Fmrrnv+Qs8S2TCMj9Ya+FLdwr6pg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8324
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

> Subject: [PATCH v6 6/7] udmabuf: remove udmabuf_folio
>=20
> Currently, udmabuf handles folio by creating an unpin list to record
> each folio obtained from the list and unpinning them when released. To
> maintain this approach, many data structures have been established.
>=20
> However, maintaining this type of data structure requires a significant
> amount of memory and traversing the list is a substantial overhead,
> which is not friendly to the CPU cache.
>=20
> Considering that during creation, we arranged the folio array in the
> order of pin and set the offset according to pgcnt.
>=20
> We actually don't need to use unpin_list to unpin during release.
> Instead, we can iterate through the folios array during release and
> unpin any folio that is different from the ones previously accessed.
Sorry, I didn't notice this earlier but the last few lines here do not
reflect how unpin works in this latest patch version. Please update the
commit message to describe how it currently works.

Thanks,
Vivek

>=20
> By this, not only saves the overhead of the udmabuf_folio data structure
> but also makes array access more cache-friendly.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> ---
>  drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
>  1 file changed, 29 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c2eda960aaaa..0e405a589ca2 100644
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
> @@ -196,38 +202,18 @@ static void unmap_udmabuf(struct
> dma_buf_attachment *at,
>  	return put_sg_table(at->dev, sg, direction);
>  }
>=20
> -static void unpin_all_folios(struct list_head *unpin_list)
> +static void unpin_all_folios(struct udmabuf *ubuf)
>  {
> -	struct udmabuf_folio *ubuf_folio;
> +	pgoff_t i;
>=20
> -	while (!list_empty(unpin_list)) {
> -		ubuf_folio =3D list_first_entry(unpin_list,
> -					      struct udmabuf_folio, list);
> -		unpin_folio(ubuf_folio->folio);
> +	for (i =3D 0; i < ubuf->nr_pinned; ++i)
> +		unpin_folio(ubuf->pinned_folios[i]);
>=20
> -		list_del(&ubuf_folio->list);
> -		kfree(ubuf_folio);
> -	}
> -}
> -
> -static int add_to_unpin_list(struct list_head *unpin_list,
> -			     struct folio *folio)
> -{
> -	struct udmabuf_folio *ubuf_folio;
> -
> -	ubuf_folio =3D kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
> -	if (!ubuf_folio)
> -		return -ENOMEM;
> -
> -	ubuf_folio->folio =3D folio;
> -	list_add_tail(&ubuf_folio->list, unpin_list);
> -	return 0;
> +	kvfree(ubuf->pinned_folios);
>  }
>=20
>  static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
> pgcnt)
>  {
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
> -
>  	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
>  	if (!ubuf->folios)
>  		return -ENOMEM;
> @@ -236,12 +222,18 @@ static __always_inline int init_udmabuf(struct
> udmabuf *ubuf, pgoff_t pgcnt)
>  	if (!ubuf->offsets)
>  		return -ENOMEM;
>=20
> +	ubuf->pinned_folios =3D kvmalloc_array(pgcnt,
> +					     sizeof(*ubuf->pinned_folios),
> +					     GFP_KERNEL);
> +	if (!ubuf->pinned_folios)
> +		return -ENOMEM;
> +
>  	return 0;
>  }
>=20
>  static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>  {
> -	unpin_all_folios(&ubuf->unpin_list);
> +	unpin_all_folios(ubuf);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  }
> @@ -351,9 +343,11 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  static long udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>  			       loff_t start, loff_t size)
>  {
> -	pgoff_t pgoff, pgcnt, upgcnt =3D ubuf->pagecount;
> +	pgoff_t nr_pinned =3D ubuf->nr_pinned;
> +	pgoff_t upgcnt =3D ubuf->pagecount;
>  	struct folio **folios =3D NULL;
>  	u32 cur_folio, cur_pgcnt;
> +	pgoff_t pgoff, pgcnt;
>  	long nr_folios;
>  	long ret =3D 0;
>  	loff_t end;
> @@ -375,9 +369,7 @@ static long udmabuf_pin_folios(struct udmabuf
> *ubuf, struct file *memfd,
>  		pgoff_t subpgoff =3D pgoff;
>  		size_t fsize =3D folio_size(folios[cur_folio]);
>=20
> -		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> -		if (ret < 0)
> -			goto end;
> +		ubuf->pinned_folios[nr_pinned++] =3D folios[cur_folio];
>=20
>  		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
>  			ubuf->folios[upgcnt] =3D folios[cur_folio];
> @@ -398,6 +390,7 @@ static long udmabuf_pin_folios(struct udmabuf
> *ubuf, struct file *memfd,
>  	}
>  end:
>  	ubuf->pagecount =3D upgcnt;
> +	ubuf->nr_pinned =3D nr_pinned;
>  	kvfree(folios);
>  	return ret;
>  }
> --
> 2.45.2

