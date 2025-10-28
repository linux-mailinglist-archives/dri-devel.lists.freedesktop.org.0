Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AAEC12E7E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 06:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E330910E354;
	Tue, 28 Oct 2025 05:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N9Oeftxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C46E10E317;
 Tue, 28 Oct 2025 05:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761627959; x=1793163959;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7po46SiM3f9PoEn3QOsim6OUOp3O8c3ZkOOdj8Q1XV8=;
 b=N9OeftxbAg3pAM92oeDD8Qm7KFZUQM0kzqTDf2vUfQhzB2Lj9u+eE+uU
 y/IF+Q7TxY3R1I+1FSt7SDU92Fc8eIoZSQoGJ4ooPxBXkYKcq1dcfUYG4
 QjMK9rq4JpV/tIgkB55LYiZdxFJPj8DsbhhRAce8AqGvjJEPTvDhg42PL
 a5GRzE9lrAK1f7fr9iKCHXElHmcF4MMxaYyHuJibcigQ2VC7qcvSv1D/s
 TR5zUqd27BiFvk7qleylg0pL76dSCK3KAhf4qI99xdFI93DB/2v01bBIP
 Dwc1IMCoFZzRKyqrRaczyEx4v+orzU+FTKz0J2JYmpQZmuY3AGzPZlq1H A==;
X-CSE-ConnectionGUID: DVCjHCTRTRCJJY2ByokaEQ==
X-CSE-MsgGUID: q8zVldlhS4ydIR65c4OrHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67362304"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="67362304"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:05:59 -0700
X-CSE-ConnectionGUID: Sb8s1oR+Q6WvLzur/y3V0w==
X-CSE-MsgGUID: wg4Iy+r6SQKZMQVapEdKbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; d="scan'208";a="185998284"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 22:05:59 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:05:58 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 22:05:58 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 22:05:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+NA51uO8+cjyTmt0/k+VCoPtGjZuOx8Xb1gG7QrTP0xCWFcrW+uMhqLZ+aqGtAFMbk/i2PVaLOubwcjuWbXUfUC5zhxVnlZ7Mg1ekeAYWHW8zQoZ/NILfkQRwdl6VOKl8qLgGfjNhwtlcuL/sJRnUp8TxcN8pCefMu4FX3rIViW/E6pEv28YAVh5lfvxgLZ/lAfl6henZohpefChTa6MxQ/yuIdEcVmfiggZScOMg5T0ODymEqkqEu3WB1JbJIpsXtgMR9JZcDZVOK/eq/KOnIkX8+XcbIAs1BPrr1CHN5VFCPcmb705jDFT98lPctb1XGGYV9ksxeppGN2LJiKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w7bqi+bLydh/i4Imsg1j6YMDiCDmxQL3P4GeF3Vbw7E=;
 b=IghQ6/LNKdRtvWgo6XMH1fbgI6vEwSajR+rGdzf9P8heFBgjOf5yNiAJUaM2nYKZMbfQZ6/JjEB63/6fgiI8RLrfP1viQvI51Q1CjvqUa2spEITBnMZAXrr1S2gwfCYwnfYa0yiDbOiEo2iapnlP7D0abEI0h5wM/cewJv/jzo7Evcw2BdNbDX0xB+9aUu4LRKDCQ1wZiA9utww5lx6xpsDYXBieiFeQTS8IR46frGnBtrV8+mm4Ci8bzHFhsRacxGAH0DL24BWSZZB0iQJbg7q5v9PEfXKhbKBkuj+qlAiXNVE6Bl+9I3HQ7fYu7J3uuWkvdEl5QviBRHEBHfDVEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM3PPFD83941681.namprd11.prod.outlook.com (2603:10b6:f:fc00::f55)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 05:05:56 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.9253.017; Tue, 28 Oct 2025
 05:05:49 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, "Jason
 Gunthorpe" <jgg@nvidia.com>, Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Thomas_Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: RE: [RFC v2 4/8] vfio/pci/dmabuf: Add support for IOV interconnect
Thread-Topic: [RFC v2 4/8] vfio/pci/dmabuf: Add support for IOV interconnect
Thread-Index: AQHcRvz6/onhZBrk1UCfBy3w/rHny7TWzzEAgAAPDtA=
Date: Tue, 28 Oct 2025 05:05:49 +0000
Message-ID: <IA0PR11MB7185DEE8A2CE81E3A9F86BF9F8FDA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251027044712.1676175-5-vivek.kasireddy@intel.com>
 <aQAjqFw6ElAJBmxF@lstrano-desk.jf.intel.com>
In-Reply-To: <aQAjqFw6ElAJBmxF@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM3PPFD83941681:EE_
x-ms-office365-filtering-correlation-id: 7ae66cdf-d3e6-4298-fc07-08de15dfa970
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?CLmG9uUqFKcr4dl9ZtF8sKpcZL0N+8Q6HqFp+xx2vOiLIRSMQ+emNsLweP?=
 =?iso-8859-1?Q?A29yPL2AT6EpKYQ6LPjmuDYn5vGjZymyTvxoraXO9Yk8Wo8rTcDBVDzYYq?=
 =?iso-8859-1?Q?K78mL44urpnnk24tVXvlzeEaLg0kBsCoILixu28WNPgakO+YCGBxMxL7uo?=
 =?iso-8859-1?Q?UqlDf3RojsHt1QNDinZIEvlS9pWASABbpBnlskulPchETJ6ygrqNrAV0D3?=
 =?iso-8859-1?Q?EaRhnjgL4DY639HT9OVjkS7juVZV6IYMRyaUaIyxzwliZFYIXHLi8Hk+Sb?=
 =?iso-8859-1?Q?eZCb6I7Yc6ZB7CiymHnrG9kD+XL8Erq00oJFrt5ueeL0uxgUS5hl4dvsQe?=
 =?iso-8859-1?Q?efxOSLLj36fOHY0y7G8FHE7TkOrOYZMt33hdIX0DSB9rVIDIHUfDVKAEN/?=
 =?iso-8859-1?Q?lfJUBP/zbaQmxnVAQK4sFe+6inzhW54QdF/fArsZpQbWOxhmDCQj0MjDvq?=
 =?iso-8859-1?Q?DJJVnLlXLOHecYnMb+JGlUhDoIMfl9+RJO6xr8x7D9be2n9IdlOp07zNgb?=
 =?iso-8859-1?Q?UtkNY4E9yHHXVf6NwsOuvYqJS7uDhldQ+DViQAnZto72nCXeOj73So2kGa?=
 =?iso-8859-1?Q?rEuwtjXgO8zc3Ftir9K5h2j/M3BRuaZNeEnUZzrYSK/KNifSbAlg7G1GUO?=
 =?iso-8859-1?Q?2sbXLyhwLRbeMwl7MasDzciUTxYH1des5o+2b5TxlwHGZfbfkRtc1twluJ?=
 =?iso-8859-1?Q?au6q2v6AtxyDPDdZ42hLKi25tviWHIxO0COj+RNIk1BklTezUOVExWevyg?=
 =?iso-8859-1?Q?zZadQWyVG26ezll5ec9L5NGKF2JWLJ39NOY8Z6vgAyN96oH8TA+XIvVlcs?=
 =?iso-8859-1?Q?j8KovooxC0//ZtG2+SPAIw7uZ62Qa4xuFcqQVlNQBv3/fH5eRN6DULXbAg?=
 =?iso-8859-1?Q?eBaCpPZD2LQvHbrdV/jhEoNMG0ucPaMOFJ8gr0wU9v9KZrCqkQol27QGE9?=
 =?iso-8859-1?Q?B+/5D7tCgdgeCfvq64vXdzqKO4dSai0+A/vmRGyrHAZvoE9DYVNGJp2lBH?=
 =?iso-8859-1?Q?wnN1j8dg5Xs6CcgjdYBCPhybpG86BbHUiAR3vwpcn8UVyyvZGDUndab1fu?=
 =?iso-8859-1?Q?xELXNbGSgwF92rq9qWsDizqYDQhJf6KRSnj8JcvXfQAZ7o84Ohu9R3G630?=
 =?iso-8859-1?Q?MYd3drMiTX3Cdw5B51nRNgyI1jD/QkoUixP+BCY55u8EK9zFJu/rCl7pYB?=
 =?iso-8859-1?Q?48E8yZJjMHEZFaKCcFB4rZg48Azx+9Wcn4VSvO9NNgtWZooVJkHT5EtOdf?=
 =?iso-8859-1?Q?hY61mGL7fcbmn9/nEJh07blstx6ISFkCaOnLLKr7ShvAvcwNDzWQBYA/4J?=
 =?iso-8859-1?Q?tahRBi4ZZHplk66i4t39L0HGifrS0nl73vo192lg3SdDHQAE76HiMQXb8W?=
 =?iso-8859-1?Q?wzFS8VKZfd/veJT8TV30Vvt2rnaeXOh5NX31707rKP5R9d1IZjS8gZb3wa?=
 =?iso-8859-1?Q?L2jB0UHlmLjN2En/cfZ3KNqXR1iL1yLhkJenyEMtwNqmLdrUxvhpPmyv84?=
 =?iso-8859-1?Q?dsACfwQbvtKcKfpBuF+NmnN01UFZc+j6Rf8hrAVX/waIz72x3//rKd9KZk?=
 =?iso-8859-1?Q?u4JhYGYk+nzfX0F8N2qdkjwiTrOL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?kTWj1HEHKLQ6v9UHf9+ElJpqFVolktGyA4gBulA2DSZieVkWO65p9VHeJi?=
 =?iso-8859-1?Q?G1GM4+8vlz3GntQXtjBMR0TvvPxoTGxxwk0bv1zLIqOsknpDCBQZ/coG1N?=
 =?iso-8859-1?Q?fsVvPxSpatTiBA6OS0mMHx6zxq9rrfTQVeAjEayQ3GjBExdkzL0kY2Od+9?=
 =?iso-8859-1?Q?+xGjDfZ1DTa3ITbEak1AeBMzLdlqDgZaVzGu2AWvvvNREG5v8wIRgIkFZ6?=
 =?iso-8859-1?Q?0WFJua3F+WVTa24uzzYmrY+Fwt7cACAbe3a7bZRuOTKWhLW7XbeuXwSsEQ?=
 =?iso-8859-1?Q?OanNB6Ycov93vJUiCkPFh4mZha4HptB77Hi2LIuASb05+EfoLJuXRhBshm?=
 =?iso-8859-1?Q?yaRjExGtekxMemTgxD6ACJENRnhSmueCOXV7wpyCL0Bp9DSOclnXUgIdJI?=
 =?iso-8859-1?Q?BrYOTXKJ3cqbKXEIUjw54RPBXsskn/rEJWBOqgewnaWzeMWyAZXimCGJZP?=
 =?iso-8859-1?Q?XKF+qCzVtQR3gjLyW8ONHlRWyzgo4ZEH8HMuNG5howeImA7aHBmhGmGIwd?=
 =?iso-8859-1?Q?fCRF9J7iRBTpvV2fZHFKCXbhsebYavcLTgFiAB9PF4X/aVswusLqH0peoG?=
 =?iso-8859-1?Q?xhOXfzU9zJNj/q8qqrXoHL/u9sXRLMwZsZuRSU0tUc2/DqXG6s6jTkwyXw?=
 =?iso-8859-1?Q?3KIwAJWmuUfJH+3xLy2eW5n62sfzAn2UhVh5JzddRIccp6+VfGtE+b3dAl?=
 =?iso-8859-1?Q?PY/AMRO8h2dVsymmozViIwFl+wbQgz31+MvxLpFFrYZcCFFRyGh54iAtxU?=
 =?iso-8859-1?Q?cbM+FXZcovR1MVuzwlRsXFJC2rEsuKWcoOJF2o6UNU7eIUdzLQ2AhtH0Fe?=
 =?iso-8859-1?Q?b7s4j33VSOZiESK0RVBYA01xPANM8n3XfkEPy3uWu2/k0/2+dv9H3wZvuN?=
 =?iso-8859-1?Q?9qEDu5lhZRu+EzSyIyw/RevlH0K/Qr8sqGxQn0E2xPEGz40p66dFzo+EvV?=
 =?iso-8859-1?Q?QsQzYAxETlUMO0wx9IqbSCg1OPAAm4VEpX07DL9UP7cLclE1TVdjDeZFLa?=
 =?iso-8859-1?Q?RN1TXn+ZrHy5TebTyiENWk+nL5cFQOOwGKdf63yLs8IjV0DFN7zsKuryhH?=
 =?iso-8859-1?Q?Ow4m+AG3VutrbJyfpflayaxlHico7653cTpDziuCEUPrfiwFhXrjEJdczo?=
 =?iso-8859-1?Q?s9Uflb4sTlmHOzwBEQ8a1uIiHzawUtqjAykb7m7J8xMceGiEo1GpTMhhvL?=
 =?iso-8859-1?Q?hGAz1LNvVitwWGP2m6W68oRKG6fPASJWgiD8YLWKVTKWsLlOkIgMKzl5uY?=
 =?iso-8859-1?Q?GiEs4f2O2aeS64mTc/fJO+l6pC7gMv34nLocErj3YF8nr9Y9f1iscUqH3V?=
 =?iso-8859-1?Q?Z1PbczWKplLkvz3jzVpv+ZZiGe7sBEdA8xW436rVggbo1iv55gfYrYGyF8?=
 =?iso-8859-1?Q?OrGUwjebpUWK6mm890qOMoZxg19mBrAzMe80onk8rdx0oNbGghwqfQLBqC?=
 =?iso-8859-1?Q?Yplxiys8EpkOmIcA+X+Cg8TBeoCjDwIweGXaVt8gDq37hGo9L4ts5ff/mv?=
 =?iso-8859-1?Q?rEbyozu/YEOKi/8a9iZqi95LznmTptoV45nWzbb5sdNPoY7vT+HH4AINf9?=
 =?iso-8859-1?Q?OO8GBU4sU+MdfXiHI020sFkQ6BjtopHS0gNaEpZ45mP2aCHRhrzGZ7QyMr?=
 =?iso-8859-1?Q?BWo4caoJ8dbTwks/lTYWx4PQ8lQQdZ3KWU?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae66cdf-d3e6-4298-fc07-08de15dfa970
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 05:05:49.7263 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rc+ZSkxteNALfUshmJhJ592RGncaEw8jZmxHtj79yn/GCta6vNhbehirjO0/xSAawC4UUlkvcZ9F33pomS3mJ6m2I06Cr5q3AGbQdDcpA2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFD83941681
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

Hi Matt,

> Subject: Re: [RFC v2 4/8] vfio/pci/dmabuf: Add support for IOV interconne=
ct
>=20
> On Sun, Oct 26, 2025 at 09:44:16PM -0700, Vivek Kasireddy wrote:
> > Add support for IOV interconnect by provding ops for map/unmap and
> > match interconnect. Note that the xarray is populated with entries
> > of type struct range. The range type contains the start and end
> > addresses of the memory region.
> >
> > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>
> > Cc: Simona Vetter <simona.vetter@ffwll.ch>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/vfio/pci/vfio_pci_dmabuf.c | 135
> ++++++++++++++++++++++++++++-
> >  1 file changed, 134 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/vfio/pci/vfio_pci_dmabuf.c
> b/drivers/vfio/pci/vfio_pci_dmabuf.c
> > index eaba010777f3..d2b7b5410e5a 100644
> > --- a/drivers/vfio/pci/vfio_pci_dmabuf.c
> > +++ b/drivers/vfio/pci/vfio_pci_dmabuf.c
>=20
> In drm-tip vfio_pci_dmabuf.c does not exist as a file? Is this series
> based on another series / branch where vfio_pci_dmabuf.c hasn't made it
> into drm-tip yet?
That file is part of [1] which hasn't been merged yet. The last patch in [1=
]
adds the dmabuf feature to vfio-pci.

[1]: https://lore.kernel.org/dri-devel/cover.1760368250.git.leon@kernel.org=
/

Thanks,
Vivek

>=20
> Matt
>=20
> > @@ -4,6 +4,7 @@
> >  #include <linux/dma-buf.h>
> >  #include <linux/pci-p2pdma.h>
> >  #include <linux/dma-resv.h>
> > +#include <linux/range.h>
> >
> >  #include "vfio_pci_priv.h"
> >
> > @@ -16,15 +17,132 @@ struct vfio_pci_dma_buf {
> >  	size_t size;
> >  	struct phys_vec *phys_vec;
> >  	struct p2pdma_provider *provider;
> > +	struct dma_buf_interconnect_match *ic_match;
> >  	u32 nr_ranges;
> >  	u8 revoked : 1;
> >  };
> >
> > +static int
> > +vfio_pci_create_match(struct vfio_pci_dma_buf *priv,
> > +			  struct vfio_device_feature_dma_buf *dma_buf)
> > +{
> > +	struct dma_buf_interconnect_match *ic_match;
> > +
> > +	ic_match =3D kzalloc(sizeof(*ic_match), GFP_KERNEL);
> > +	if (!ic_match)
> > +		return -ENOMEM;
> > +
> > +	ic_match->dev =3D &priv->vdev->pdev->dev;
> > +	ic_match->bar =3D dma_buf->region_index;
> > +
> > +	priv->ic_match =3D ic_match;
> > +	return 0;
> > +}
> > +
> > +static int vfio_pci_map_iov_interconnect(struct vfio_pci_dma_buf *priv=
,
> > +					 struct xarray *ranges)
> > +{
> > +	struct phys_vec *phys_vec =3D priv->phys_vec;
> > +	struct range *range;
> > +	unsigned long i;
> > +	void *entry;
> > +	int ret;
> > +
> > +	range =3D kmalloc_array(priv->nr_ranges, sizeof(*range), GFP_KERNEL);
> > +	if (!range)
> > +		return -ENOMEM;
> > +
> > +	for (i =3D 0; i < priv->nr_ranges; i++) {
> > +		entry =3D &range[i];
> > +		range[i].start =3D phys_vec[i].paddr;
> > +		range[i].end =3D phys_vec[i].paddr + phys_vec[i].len - 1;
> > +
> > +		entry =3D xa_store(ranges, i, entry, GFP_KERNEL);
> > +		if (xa_is_err(entry)) {
> > +			ret =3D xa_err(entry);
> > +			goto err_free_range;
> > +		}
> > +	}
> > +	return 0;
> > +
> > +err_free_range:
> > +	kfree(range);
> > +	return ret;
> > +}
> > +
> > +static int vfio_pci_map_interconnect(struct dma_buf_attachment
> *attachment,
> > +				     struct dma_buf_ranges *ranges)
> > +{
> > +	const struct dma_buf_interconnect *ic =3D attachment->ic_match->type;
> > +	struct vfio_pci_dma_buf *priv =3D attachment->dmabuf->priv;
> > +	int ret =3D -EINVAL;
> > +
> > +	ranges->nranges =3D priv->nr_ranges;
> > +
> > +	if (ic =3D=3D iov_interconnect)
> > +		ret =3D vfio_pci_map_iov_interconnect(priv, &ranges->ranges);
> > +
> > +	return ret;
> > +}
> > +
> > +static void vfio_pci_unmap_interconnect(struct dma_buf_attachment
> *attachment,
> > +					struct dma_buf_ranges *ranges)
> > +{
> > +	void *entry;
> > +
> > +	entry =3D xa_load(&ranges->ranges, 0);
> > +	kfree(entry);
> > +}
> > +
> > +static bool
> > +vfio_pci_match_iov_interconnect(const struct
> dma_buf_interconnect_match *exp,
> > +				const struct dma_buf_interconnect_match
> *imp)
> > +{
> > +	struct pci_dev *exp_pdev =3D to_pci_dev(exp->dev);
> > +	struct pci_dev *imp_pdev =3D to_pci_dev(imp->dev);
> > +
> > +	return imp_pdev =3D=3D pci_physfn(exp_pdev) && imp->bar =3D=3D exp->b=
ar;
> > +}
> > +
> > +static bool
> > +vfio_pci_match_interconnect(const struct dma_buf_interconnect_match
> *exp,
> > +			    const struct dma_buf_interconnect_match *imp)
> > +{
> > +	const struct dma_buf_interconnect *ic =3D exp->type;
> > +
> > +	if (ic =3D=3D iov_interconnect)
> > +		return vfio_pci_match_iov_interconnect(exp, imp);
> > +
> > +	return false;
> > +}
> > +
> > +static bool
> > +vfio_pci_match_interconnects(struct vfio_pci_dma_buf *priv,
> > +			     struct dma_buf_attachment *attachment)
> > +{
> > +	const struct dma_buf_attach_ops *aops =3D attachment->importer_ops;
> > +	const struct dma_buf_interconnect_match supports_ics[] =3D {
> > +		MATCH_INTERCONNECT(iov_interconnect,
> > +				   priv->ic_match->dev, priv->ic_match->bar),
> > +	};
> > +
> > +	if (attachment->allow_ic) {
> > +		if (aops->supports_interconnects(attachment, supports_ics,
> > +						 ARRAY_SIZE(supports_ics)))
> > +			return true;
> > +	}
> > +	return false;
> > +}
> > +
> >  static int vfio_pci_dma_buf_attach(struct dma_buf *dmabuf,
> >  				   struct dma_buf_attachment *attachment)
> >  {
> >  	struct vfio_pci_dma_buf *priv =3D dmabuf->priv;
> >
> > +	if (vfio_pci_match_interconnects(priv, attachment)) {
> > +		return 0;
> > +	}
> > +
> >  	if (!attachment->peer2peer)
> >  		return -EOPNOTSUPP;
> >
> > @@ -189,6 +307,7 @@ vfio_pci_dma_buf_map(struct dma_buf_attachment
> *attachment,
> >  	return ERR_PTR(ret);
> >  }
> >
> > +
> >  static void vfio_pci_dma_buf_unmap(struct dma_buf_attachment
> *attachment,
> >  				   struct sg_table *sgt,
> >  				   enum dma_data_direction dir)
> > @@ -228,15 +347,23 @@ static void vfio_pci_dma_buf_release(struct
> dma_buf *dmabuf)
> >  		vfio_device_put_registration(&priv->vdev->vdev);
> >  	}
> >  	kfree(priv->phys_vec);
> > +	kfree(priv->ic_match);
> >  	kfree(priv);
> >  }
> >
> > +static const struct dma_buf_interconnect_ops vfio_pci_interconnect_ops=
 =3D
> {
> > +	.match_interconnect =3D vfio_pci_match_interconnect,
> > +	.map_interconnect =3D vfio_pci_map_interconnect,
> > +	.unmap_interconnect =3D vfio_pci_unmap_interconnect,
> > +};
> > +
> >  static const struct dma_buf_ops vfio_pci_dmabuf_ops =3D {
> >  	.attach =3D vfio_pci_dma_buf_attach,
> >  	.detach =3D vfio_pci_dma_buf_detach,
> >  	.map_dma_buf =3D vfio_pci_dma_buf_map,
> >  	.release =3D vfio_pci_dma_buf_release,
> >  	.unmap_dma_buf =3D vfio_pci_dma_buf_unmap,
> > +	.interconnect_ops =3D &vfio_pci_interconnect_ops,
> >  };
> >
> >  static void dma_ranges_to_p2p_phys(struct vfio_pci_dma_buf *priv,
> > @@ -365,6 +492,10 @@ int vfio_pci_core_feature_dma_buf(struct
> vfio_pci_core_device *vdev, u32 flags,
> >  		goto err_free_phys;
> >  	}
> >
> > +	ret =3D vfio_pci_create_match(priv, &get_dma_buf);
> > +	if (ret)
> > +		goto err_dev_put;
> > +
> >  	exp_info.ops =3D &vfio_pci_dmabuf_ops;
> >  	exp_info.size =3D priv->size;
> >  	exp_info.flags =3D get_dma_buf.open_flags;
> > @@ -373,7 +504,7 @@ int vfio_pci_core_feature_dma_buf(struct
> vfio_pci_core_device *vdev, u32 flags,
> >  	priv->dmabuf =3D dma_buf_export(&exp_info);
> >  	if (IS_ERR(priv->dmabuf)) {
> >  		ret =3D PTR_ERR(priv->dmabuf);
> > -		goto err_dev_put;
> > +		goto err_free_iov;
> >  	}
> >
> >  	/* dma_buf_put() now frees priv */
> > @@ -391,6 +522,8 @@ int vfio_pci_core_feature_dma_buf(struct
> vfio_pci_core_device *vdev, u32 flags,
> >  	 */
> >  	return dma_buf_fd(priv->dmabuf, get_dma_buf.open_flags);
> >
> > +err_free_iov:
> > +	kfree(priv->ic_match);
> >  err_dev_put:
> >  	vfio_device_put_registration(&vdev->vdev);
> >  err_free_phys:
> > --
> > 2.50.1
> >
