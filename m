Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CA96EDA8
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:20:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4645310E9A7;
	Fri,  6 Sep 2024 08:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aP8jYyyf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F0810E9AA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725610846; x=1757146846;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=d3fJIIDY9OXVV0gOikeQU+AWbmVdSmL52ziimY05Me0=;
 b=aP8jYyyfPWnDJLQxySoNRjmSmdsDW/K7t2VHZXjvx29/0MWSVbXqQMuw
 FRO0DSkJfxW7DZ021151W24T0sVN+8NLXjxU+sQRuN6qe8KmIfBoc6gCO
 fvme9KUIQSqS7kQmEN9WdCFIQ7sq8tf+MSo4q/winzuAW6gECumbWBy3i
 QzapUCXbmHhFUFzwrJ9FWjf+UK22Gkqe7pCoP1+/jG7Yv/D2YL92Pud5H
 0AYDtE1eZWOei1/mW1dWyKiQgpEXmfJ4QZz21uG+8WyBwF5LD0CX63XCu
 IANAkfF4OlX73lbxtP0mwOSGxmWjZUTcTeAtuSumupRGvQPxxKdyusOSY Q==;
X-CSE-ConnectionGUID: L3GQD+zkRAKAXfoPsb0WLg==
X-CSE-MsgGUID: QBdLNAl8R1meP4r45Yoeew==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24509244"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="24509244"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2024 01:20:46 -0700
X-CSE-ConnectionGUID: 90v6ysnMTWm9msUT9IgRmw==
X-CSE-MsgGUID: 71fnS8nPR+WpiEbu07Nzhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; d="scan'208";a="66217689"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2024 01:20:34 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:20:34 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 6 Sep 2024 01:20:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 6 Sep 2024 01:20:33 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 6 Sep 2024 01:20:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JgQY+FDI1v5Bv+EBFzfgFI3Tsh6PbI4St5SKZtz2049/UVBZi9Lzq8bEYQbl3WprGiOKsI0EzD6T8edMwy+Cu7bQO3hUKsyPU0Wv4HleT1kUMe3R1DckBoZAK05TQ3pkKGEIZ8iqiReHDkk+k/XWIcKH83USjZHpjgeua5PnwnvIakczMeZxC97acrBynYVr+F36SmtqfLwudwDfa3LTLjJVKzc8ppICCRN/njVjVCc1zXfAR2D10pXJumtc5/suanXtfDd97udyYoAfyREa9mbBKwydUE3aiyPBqMFfDcSVUQn+f1VxgXy5jWQ9f2on83hayPZkfJSVtArnGcoSnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3m7/1NWJ7Anc72sHTuVKraljcHPZ294K1z1Em1gNm6U=;
 b=xhjtRFD+I5vYngYlZVxg0+wSXwPk/3yTXsJyijk6yLDDl1TYhlhtlukDyWavcbOwQCmAmWhu+RpFccGzOIrc18j/CA0MXwrbKRVBIPpFXVrOQtpn20XpBI2XqFwuuHp2fWrQXzEa8N13x/jRyLYs88gOpoiR1fc3KSuo9XbqXNcrev53eo4zXi5FoaMW4j5YV/DYLXmNKRo4YabLA/OrSZPvMEcGw2WjHarzm6toyXg/CmRl/Oc1BtXPsBoveq/JgRy9wWv5HfI7o9FB12eUf1CPMXa23+nIC3a2C8C7AdAKrmxRJDQVtZ6APfDDOSKnohAaciPG30KfzEr8lHAyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MN2PR11MB4678.namprd11.prod.outlook.com (2603:10b6:208:264::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Fri, 6 Sep
 2024 08:20:26 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 08:20:26 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
Thread-Topic: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
Thread-Index: AQHa/d0lKH408DeRCECG+644zyAez7JJdLFA
Date: Fri, 6 Sep 2024 08:20:26 +0000
Message-ID: <IA0PR11MB7185D06C33DEB9E1BC05EF95F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-6-link@vivo.com>
In-Reply-To: <20240903083818.3071759-6-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MN2PR11MB4678:EE_
x-ms-office365-filtering-correlation-id: caa5e22a-b874-4541-ad8f-08dcce4cc308
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?ftmQQeAre5zOp64G11jdh5I5OpvTpZVP2/Tdhv0cK1UOAMQDKCcXtgFLS+?=
 =?iso-8859-1?Q?Z2rMqpvNB2lCHOkdQC3K4SMT4oBPe+u5b+MpvACyXqPHomusPkKv8ehjtz?=
 =?iso-8859-1?Q?Uuk3Bhzij+tjbdoIBM/QMDBd8/tN1QXU9oxYAjxR3cczgPGMP9n7FODHqa?=
 =?iso-8859-1?Q?3Ws2TWu/QxWUb8s79GqDkKC8EgsOLkBVPJKK/sLdDm4Cmfq4ts1OjjDPcL?=
 =?iso-8859-1?Q?eYSV2crHFesmlv9tyzcaJw4CEvsGkB47LhYkd4/wUjBN4MVQ3HRXpMWBiR?=
 =?iso-8859-1?Q?NGCJqz+8lhzU9TnLdDJI93gEQadUZMIwIA8XuMZZq5QLXOcCWhZ+DZ2e9B?=
 =?iso-8859-1?Q?dsZBl4MJOY5SSaoY/qTkFYRdZoMQjvht0JKgrbeeRt8Ih59/tpMYaWNIo7?=
 =?iso-8859-1?Q?+JoSEzveQfRC4LvBG+NJMdq9pYs3nZI2Khz5djGNxtuYNu6n1H6Jsc7DS0?=
 =?iso-8859-1?Q?CZcL+EVLv1o3sbK1k8zltAb+Rs5NtGsLNk3ihvt4PEIhoZ1N4AnzbtBx/O?=
 =?iso-8859-1?Q?5PDQxmsstSMZPFc7i6nu2lkVHei2k8xrzh88aE5U+TIKBvNwQU42N39JFQ?=
 =?iso-8859-1?Q?xhrSU8bUl7yxs2OleVlcFaH3J4QIkG49kSUXtOX9WRTLHvARzd1LCVj89Z?=
 =?iso-8859-1?Q?HV2vuEQtSZbI3M6PKbLhSMS31GhlEqZJ3ttE5X9oCRxIfS2oa+In/oPo9P?=
 =?iso-8859-1?Q?wsY9My7ktPBjoIkUWCjpiyfY+pnoZzkK+QwGTK2ala3UtCwxL4IVC/rm2H?=
 =?iso-8859-1?Q?ebEPRJYTtY34W2dR+bjlCXt3InMpNU1aTCDWrykexn7cjt4FjItGTPs0XL?=
 =?iso-8859-1?Q?5vrE9nosdjCnL1EuMIcuMqo6RQXwTNqpIf270OY7lS9wDjM7dYm8heuLbF?=
 =?iso-8859-1?Q?TA8vMT9hunJLInQ4+3n6cTFbVv5y7mZlSa5npIIzBTzLkUUa7WSyFgc+2Z?=
 =?iso-8859-1?Q?3mnPsnYMMcuBIIDd/fxyKucKGfSwY22+ZqTV4/mG80F341glRMCxAuJQFQ?=
 =?iso-8859-1?Q?1mFyep47cNNE+grSn60m9c2VD5s4ux2WPRHuU2Y7Y5JEJl6VE3aumVICIU?=
 =?iso-8859-1?Q?O71+Xn7ncb4DqgtGqCFBd1Mr+uZ8A1CSjQcKK1pcz34Lq3cmPxQL596SLw?=
 =?iso-8859-1?Q?SXT1WygAYSous32yefGDhoTWi1krFbwuXK8RsPQcQc1AgIQymInZQakbz5?=
 =?iso-8859-1?Q?JZt8AztaQj2pyvVkY+nE/uMLT8yH9lmHEqcfXB5uqFeTSFl0qE1gxi2L/a?=
 =?iso-8859-1?Q?k9qzh9kHpGMqtCX3yAOusu69rgXpD+3JpXuQZUd0+8v1JSoiO0yGZ5oOly?=
 =?iso-8859-1?Q?fSyOBwYh8KonQcyz1sBitp+fJB1hZCY/wvPYBZifnj++rpHMmI1E2c/sID?=
 =?iso-8859-1?Q?H4yrzHz3jMWw9RUdYLdrTz48RCx8RR7JIBBhTQFE7JvHvWTKEM1amjAvQc?=
 =?iso-8859-1?Q?e1YmbZxl7+XLQGJtugWhviiquGyXqK4GFvNJJw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?BnaS8CkQE7W6Ok7w8rL4Oa+2/u9F2blVgXZJKBY+5OVVp29cp7G/Tbgg8z?=
 =?iso-8859-1?Q?A1V4jFsQVe+1y8oWg8KZyWKcXKXibPsUMJtb5wSELrcuq0lOw3/HBm3jHY?=
 =?iso-8859-1?Q?49roMtftXZg4MnOTIO+GYKH7xF+cwUEwPa6PuM8CwA4qD2ezCyMNx+4TqG?=
 =?iso-8859-1?Q?M8hjshEHYqjvQW2RokvcTkd2xLmLH/vk8EsQck0P78xCziLnm5szbXNQ2j?=
 =?iso-8859-1?Q?CyphOdPA2XS/C+ogW41R0zUTyRTPOl/5/sF0AE5KF1Z49wrJZtEDk8hQFY?=
 =?iso-8859-1?Q?4mkhMMUsgNcmTB74vWmkKM6ki9sBDWlRQ32Ws6x2wK6IGiPlKe3SpZHdP/?=
 =?iso-8859-1?Q?UHskqownSL9wgjpihtz2taqa0SypsyKFPUOMJ3l61hUVCFJs7yqtaX58nu?=
 =?iso-8859-1?Q?qXt7dBPRgNO2OB3700oVcTv45IE/c9HMx6E35uEMOnkygQDOF7CrLQJ/nD?=
 =?iso-8859-1?Q?azXXo1UjT+xK+dPDw8a0AaTVmsbhvJuqfEZ2XPb43+JK59Bz7E/47mYFnB?=
 =?iso-8859-1?Q?tZY73w+CNpZAksT3vkKB3BC5yaevS6TH2gAssZqIX7Dhs7InI0U3c9lVa/?=
 =?iso-8859-1?Q?qAVZ9fynHLTkyNgeJ/kW7Gc5zWYK6+EqwyW31GfyAQAshbi4myH0/uUNq8?=
 =?iso-8859-1?Q?ClZs2CAS1UJ+3HXAYIpf4ea1dRNjB2YulC63vFSRpE52vvJiZoAWvvTN6E?=
 =?iso-8859-1?Q?1EzmhA0v5KseMFAVBrZEVCv3p3LzGf9nP4vSe9frz1htxzA8H1HLi69E5d?=
 =?iso-8859-1?Q?dqTWhPZ9vMaJnZhXKabzkOUgfJtPmYGqL3m1Qsvt477zALm0Y7n0WcdicB?=
 =?iso-8859-1?Q?hj1fysBu9X3f4lU3MeqoU1eEw8BJzgD21+YMMahNw4pxym+WpoZByUpwn7?=
 =?iso-8859-1?Q?UnGyyaeXyDYOjdwJgZk555ZGWslTx9GdzaVjoyP0Wcfds2X/WGBcuWkjH8?=
 =?iso-8859-1?Q?VO4wpFI/Tb2nj7h4PLFmvfy3uoBNWB7yxBjqxJ4KNXeex7qsqypHGEdghM?=
 =?iso-8859-1?Q?brVOyCciExxmyE7tkCC9hBc/9C91z69VxIrwuScYb5+kKRN8azMPnlcx/O?=
 =?iso-8859-1?Q?RlmOJcPiBqXdpOxShEaBtf3+u9YbPOKCUxNUWPw07/YRIu5WTCEBCe7JEk?=
 =?iso-8859-1?Q?4zsowKgvPo7ANk+sUL4WglzZhPRpKvwWebAFFjfsezCo3oVaYcZkh5qIhZ?=
 =?iso-8859-1?Q?OG0hghxDjjIpfltbNhmPW/plawS218ooYRkV6y5W1SrjSt3Glcq7Duij6C?=
 =?iso-8859-1?Q?xLzkBMyr2EGnrRPPTzp0ttwWWYvRI3lQyzAH2umGazgQYOqWg137DebaQW?=
 =?iso-8859-1?Q?qQ7G5Bz9HZJifh30rYbh/ZWTihslRmU9Y6l0xwWRnzX+aeCRKWP+QfqYdA?=
 =?iso-8859-1?Q?XhNtMA9IfuHVjjR/xe7C3SbB4gPrKKMsCB8ZRBx3V++FhC+YJr/3KB8zuw?=
 =?iso-8859-1?Q?Navk0E5arNl3HV64lJMRLyI8QEWQ/ZQe3l0npJCOc4AX+8+/CPilvH20QW?=
 =?iso-8859-1?Q?cMDvckT1X0LJ+AXeDl26fn7KvZIRIejXvte4SWARe8TUsLGwW++iSDycdB?=
 =?iso-8859-1?Q?/wVZADtl6r2LcaPMKBMq7AzxI1yaLmMqd1c+/H2i4P2QVhB4sJ8+smASna?=
 =?iso-8859-1?Q?7EgtA+oQ6CWPdzWvALodN7IwFGiU3mF2J3?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caa5e22a-b874-4541-ad8f-08dcce4cc308
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Sep 2024 08:20:26.4103 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YwMRquBZS874ZBFZ5kajkuPvbYLZiuMug8ap8gAO6IiyTeS9WflgX/c/Y11yGJYWHpLx0+NGKHDhnUoc7t7TE/AipBKlDoXXB6fIH1/ipOw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4678
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

> Subject: [PATCH v5 5/7] udmabuf: introduce udmabuf init and deinit helper
>=20
> After udmabuf is allocated, its resources need to be initialized,
> including various array structures. The current array structure has
> already been greatly expanded.
>=20
> Also, before udmabuf needs to be kfree, the occupied resources need to
> be released.
>=20
> This part is repetitive and maybe overlooked.
>=20
> This patch give a helper function when init and deinit, by this,
> deduce duplicate code.
*reduce

If possible, please try to improve the wording and grammatical correctness
in the commit messages of other patches as well.

>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 52 +++++++++++++++++++++++----------------
>  1 file changed, 31 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index ca2b21c5c57f..254d9ec3d9f3 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -226,6 +226,28 @@ static int add_to_unpin_list(struct list_head
> *unpin_list,
>  	return 0;
>  }
>=20
> +static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
> pgcnt)
> +{
> +	INIT_LIST_HEAD(&ubuf->unpin_list);
> +
> +	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
> +	if (!ubuf->folios)
> +		return -ENOMEM;
> +
> +	ubuf->offsets =3D kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
> +	if (!ubuf->offsets)
> +		return -ENOMEM;
> +
> +	return 0;
> +}
> +
> +static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
> +{
> +	unpin_all_folios(&ubuf->unpin_list);
> +	kvfree(ubuf->offsets);
> +	kvfree(ubuf->folios);
> +}
> +
>  static void release_udmabuf(struct dma_buf *buf)
>  {
>  	struct udmabuf *ubuf =3D buf->priv;
> @@ -234,9 +256,7 @@ static void release_udmabuf(struct dma_buf *buf)
>  	if (ubuf->sg)
>  		put_sg_table(dev, ubuf->sg, DMA_BIDIRECTIONAL);
>=20
> -	unpin_all_folios(&ubuf->unpin_list);
> -	kvfree(ubuf->offsets);
> -	kvfree(ubuf->folios);
> +	deinit_udmabuf(ubuf);
>  	kfree(ubuf);
>  }
>=20
> @@ -396,33 +416,24 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	if (!ubuf)
>  		return -ENOMEM;
>=20
> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
>  		if (!PAGE_ALIGNED(list[i].offset))
> -			goto err;
> +			goto err_noinit;
>  		if (!PAGE_ALIGNED(list[i].size))
> -			goto err;
> +			goto err_noinit;
>=20
>  		pgcnt +=3D list[i].size >> PAGE_SHIFT;
>  		if (pgcnt > pglimit)
> -			goto err;
> +			goto err_noinit;
>  	}
>=20
>  	if (!pgcnt)
> -		goto err;
> +		goto err_noinit;
>=20
> -	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
> GFP_KERNEL);
> -	if (!ubuf->folios) {
> -		ret =3D -ENOMEM;
> +	ret =3D init_udmabuf(ubuf, pgcnt);
> +	if (ret)
>  		goto err;
> -	}
> -
> -	ubuf->offsets =3D kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
> -	if (!ubuf->offsets) {
> -		ret =3D -ENOMEM;
> -		goto err;
> -	}
>=20
>  	for (i =3D 0; i < head->count; i++) {
>  		struct file *memfd =3D fget(list[i].memfd);
> @@ -446,9 +457,8 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	return ret;
>=20
>  err:
> -	unpin_all_folios(&ubuf->unpin_list);
> -	kvfree(ubuf->offsets);
> -	kvfree(ubuf->folios);
> +	deinit_udmabuf(ubuf);
> +err_noinit:
I don't really see the need for this new label, but I guess it makes things=
 a
bit clear.

Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>

>  	kfree(ubuf);
>  	return ret;
>  }
> --
> 2.45.2

