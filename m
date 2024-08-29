Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76310963BC3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 08:40:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A1CA10E471;
	Thu, 29 Aug 2024 06:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CU6QI56t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE2B10E471
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 06:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724913597; x=1756449597;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+ltC/76vJGNftTCAvQDNF5kXucSgIVpDP4hJIFmWNso=;
 b=CU6QI56tUM6Hi4rqr85vPWo7n2x8bhG1iG+Vl6zW3pUsWqTGfyhx4wo0
 jh6PW6TRPrN8rM6eXAy9nwZ+KRf5vge29K86UMwBHnsacEn+ykruBB88Q
 /0IzgzrgKb4jvssJuBXABztzeSiDYJh3K6nwrWARLCxOt4kZDTl3k9V3p
 YgqKf/tQlp7+CeLbvkjqDj+fALXzUehhHW/tUyTCMvtlQGNQJpx41JgkW
 pOd+GtLXP66b4ykBL+ftchPZRX/0dHpUi5K9Azeat9gWes3yN+wPGpbQN
 D/bCuplKznH3KYsssrktdwGU3dDqJaFyUUkCRh28O9ZdG8qVExZ64y4Gj Q==;
X-CSE-ConnectionGUID: noKzEQ6oRDWmWEb8aLdVoQ==
X-CSE-MsgGUID: MB4/zEK9TNCPbXFJOc6NYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="22999040"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="22999040"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2024 23:39:56 -0700
X-CSE-ConnectionGUID: b0H8XCApSfit7uPzIoS34Q==
X-CSE-MsgGUID: R7ok2guNQX+8Xy0fUah41Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="94217015"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Aug 2024 23:39:56 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:39:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 28 Aug 2024 23:39:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 28 Aug 2024 23:39:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 28 Aug 2024 23:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOynm/V+M1rAokATezh/CspfW0L1VmRpvLT5pFwxKxpwrZJbM1hmhE3EZ0oRY8/s1XHwZGFYfzKVad6nErLmcxLoQdpL+N0AE3dBtg+L9jQYSVXZMp/NnE8pDqHdoy9Xhf2iXXxD8uPHnspHyzdUO9i7vmEP5queW4D4pavBDcl5IWZp++TmtJjb9oyBBT+nFSuRUUhnQw8tqz9PORUiMztMZelRQKwpo02gFOXqBLbafASlKfYUnHC1XLfb8pgM4ebw4ZGyVFMUr8GVJCsYWQu6PlpHbvaBx2qSsQz4cmc5XlF+GoWMOVr7zpIgu4pwixUf76jGAIT3W0cCTyRJvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BRvM+oOlvN9kOnd6z+UTtUCsZOWvVJ+KkXALSw5VRoM=;
 b=eW/b2jS1KmWDyFR7AzwSVl4CSj63fSdbBfNquNv2m/Ai5lm4URdudRnwTopEdXe7gZWLdFuO7t5N/Awe13ENPvqRMMYS7LmoeLz15LRTjftB+arV2IOAK8kDLHFTraDTt9VdV/sXXLGkATVjCjSQCBoZVZCCoIxwMn/LmMj32GZkiZmORv32ooBgGhxQ+f3hHwImRhacDUxFME1aoBdp13kQ294zzOcOomxVqoUCIkOXOVT5kFNWw3DvGLrAykRiyJJsXaoSH4bFpRJX9fQbHj6xqpAaWcgFlF7tTcSc5qPZkYXEtSBdhFbI0UxsMq4W1TEZoVA6p5MtCg9uOcPPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 06:39:53 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 06:39:53 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Huan Yang <link@vivo.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann
 <kraxel@redhat.com>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Subject: RE: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
Thread-Topic: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
Thread-Index: AQHa9G+cGPjUh04u60mr8mdm9lowS7I9NKsg
Date: Thu, 29 Aug 2024 06:39:52 +0000
Message-ID: <IA0PR11MB7185DF242D3F61BFE8429F35F8962@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240822084342.1574914-1-link@vivo.com>
 <20240822084342.1574914-5-link@vivo.com>
In-Reply-To: <20240822084342.1574914-5-link@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SN7PR11MB7539:EE_
x-ms-office365-filtering-correlation-id: ce9ce12e-adfb-4bee-fb1b-08dcc7f5637a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?qF6suvswT2weC1P1X+TP9Mb5WeCtawBz6JzWH6BvkbHAoWRcw7x506vuxS?=
 =?iso-8859-1?Q?OVD5HcoD3D98LfUrIrULMQ+LRz7XiW29I6tlSl7Wk5CsaS1+D2kwXE7bzX?=
 =?iso-8859-1?Q?QgEoPUZJ/jHYmROcOHKH+rY6KWh+1Fb5E/TxE3FJHhGiCJ3hDhi3Vm6ddO?=
 =?iso-8859-1?Q?Oyh701vauNhZFxKibFNe/eiKL8DU9kPFHwm5yLL3/B4kRyoYTKN5TSGh/e?=
 =?iso-8859-1?Q?sGkrSDznpuCFtLrCcxOQaPglGWQqNfpTvxot7yoxRvMCl3+GewSrspLiXJ?=
 =?iso-8859-1?Q?J4YR+eIiIO6xv34NuXLNLTClX8RKfuiBDC3EsJr1yTj+h5D3BLo5G8vBxK?=
 =?iso-8859-1?Q?QJSk1l4FXSmtFl/D81WyLWpnKGqjKgV47BZCaQpcXRT5o/0X78sY1IRD39?=
 =?iso-8859-1?Q?xkSAnMvNWD7NcX0eqcTdkluzoZp5sRiQ74pYvjLIpIUbrxxLyfDHHo8xTk?=
 =?iso-8859-1?Q?6VXEXJdt8YdpcFh4Wqz5ny0e9v/1hPLpswhy8v+tR3/3KT2h8FolWBjEVa?=
 =?iso-8859-1?Q?koG12zO85NX2qSnD2hIg4vMjSmY4ON5f2Yd/DKWE9xH1xOoZhlLxxJ+T6V?=
 =?iso-8859-1?Q?F/KsYYJ62t9xZlkCDYTJBMjNjGtBIOgSeR2hX7qSJGpL7+ciRN8tgiDyBe?=
 =?iso-8859-1?Q?WosfZRh/K0oNKDUYD4cQKUCMbEUH8WBWhaMbtS16ENiTrBl01HhMWg9szo?=
 =?iso-8859-1?Q?8cbIlBMJxip3Lc/bKV/nw0DDsDQWnD3pwwtMNxXayOQmKJR0xL5C8ncziI?=
 =?iso-8859-1?Q?69f+WMoB5SyhqIzIrSrRVLH1tPBcoDKJ2AwXrekBzjrucp40AmPc5h8b54?=
 =?iso-8859-1?Q?gY+x+VtOMfq5jJpbc0hQtixUpmR8QSJCODha+TpX08QPqQr+IwiP9VnAGm?=
 =?iso-8859-1?Q?cwOuQuAJ61LhwEF1XFkqO2eltgV505WQy2fL5SzlzFwgk5ys4FgG6ahvZ5?=
 =?iso-8859-1?Q?sWq/cm3+q575tggrnYl9WCsNiofXxAe+KnevPJmtYTuysvCqjVterwDPlO?=
 =?iso-8859-1?Q?oTeaHucPq7t04b1waoz0AeNCPWVS+js6KGu1HadI9NuerotOPk9r/IxCoA?=
 =?iso-8859-1?Q?smfxne7VkLwjZPKYu4LnIq58Pk8fhFg3zJh8KvwWrPvUTbZkU/7hJ8nEOq?=
 =?iso-8859-1?Q?q0VY2bO5J/uqQHrqUYZGXjceHscH/uJ8JM4Dj4WPtEZ/T7gsf2T9KEbEnM?=
 =?iso-8859-1?Q?ermavzxEZcw6QmJOpLp50GZOoQOQ9xdNeAeKOIWP4aQsXtJwNXMLYmMiKD?=
 =?iso-8859-1?Q?pwHY3HZhWQt6Rpm2pSbpIv21BYGWZ/HCx+h7HboHneKx96szR9Z7GsPNgq?=
 =?iso-8859-1?Q?430LK9ghzud5FAR4qWsXbWNJJ5jvoLeZtrjyysN0R5U+sRwUJ+vGnHkW/U?=
 =?iso-8859-1?Q?5gFcsrNvwR+7NI+MHp82OHbdE7jiGxO3Wa6VGh/cKeol3fDL/a/GMPHQFm?=
 =?iso-8859-1?Q?r7qzrk7ThQJr1eW0rmgF5Ez55yvzKjo+gESUwQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nSEezfp4lsVaESxe9CQg/g32/HOGN2AScn9m8j8+moW/9B395iQW0Un5IK?=
 =?iso-8859-1?Q?U+Uy4AxbLPzrKdIiFdRp+h79/i0toC+GQVb1r/4+izzhrK4vmSMPd8o8xe?=
 =?iso-8859-1?Q?l5Li3/K2f3YlPp/oixqRZhjYPwG5wbboNsKsaTG2moB4RoW0ZC9GlY0bKo?=
 =?iso-8859-1?Q?dgv2waigmguHO4BpzGjvBxDCU3spXCMMfnyydthDiDnTSG/L9vJzacLjqe?=
 =?iso-8859-1?Q?lcRXGUYvngvCsVHWv7TziLQd7nuBBjq4BWp4lvPXYZ3lKvC1YIULTO95W1?=
 =?iso-8859-1?Q?WN5snzplTxNSSmtuEAHdYxLrl12NYJSJoVkpfMitq7SND6GrkyuwlNwi7T?=
 =?iso-8859-1?Q?oo49Tl2kQJZEaz+rDtZdpC82qKQrb7kkV8+F6rUj1GaVLjBT4G4sC3KHMF?=
 =?iso-8859-1?Q?NrsqpYbQNitZ9pc4fUWGWlWplQsKY9bQ2SdNkNkYc7QKkge+xzW10vi2Nm?=
 =?iso-8859-1?Q?AZlFqGjgfmfyTsc6a8zupsYbj9rcIEbhNlDrxzohmbh951EcwrEkV0XJM6?=
 =?iso-8859-1?Q?8z3+MKUoXXtx5HhrrDN7YuposyQ04mhBiwrc9agecteggAs7Kt3AgDg0Et?=
 =?iso-8859-1?Q?L6yWCUOOJI9CkB/9LxKLpK5V3DsE9KvWnbXMPBR13JrFFnU9nhOI+CYcQI?=
 =?iso-8859-1?Q?RpZBbRZuFP/2Dc8uYeees1DHT76j8iusSR0iFSR80qupcDzMJctLNLjAoA?=
 =?iso-8859-1?Q?KO/aM4R9Dtun0ac0fVaaWclhvFiV/B7U1NeVYGglezL1WkXVWpzXncWgLr?=
 =?iso-8859-1?Q?pdzQ/E8hV7dCbXJ5K9DUflMMHiXS6cyotwBt0fP8h+VbWLc13s4wIK53Yu?=
 =?iso-8859-1?Q?fkmsz90i0PcoCCkJgo93vhdHBv9Ew9eyzp8BD67KqZINhnkdQkVcKIBdBF?=
 =?iso-8859-1?Q?nKzFNo+HSc3OWhfC2596Lr7MAP8iTjIhXleOZBnTfchXDK0tL8TL3GHP9r?=
 =?iso-8859-1?Q?es1EieamOd57np/bKOdSgJsNY2WjqNiruN1LNgwWtubYY2PavkD5pPR8iw?=
 =?iso-8859-1?Q?yD8Z4rVKnqN6U3lmlaDldJkVqVrYTPjKcBh7IHTomUMU3AwWxvX2DAh34N?=
 =?iso-8859-1?Q?xvc4fTgJ1dnzJ3kmKHIgDZ3GFWGTrrC2GQLHp+N7YNxL5vooezZF0yILVm?=
 =?iso-8859-1?Q?eeK2pwiycQfzuMxYap95I6mlxrj/8SgEuPKyU2O2keQNS1rNanA6VksjIB?=
 =?iso-8859-1?Q?HUkrMohYFF/NvUXY6ndlexs7fWdxBEJ+EuwVn2XW/jvFU/7Keau8X1OzPU?=
 =?iso-8859-1?Q?+JhEJNWbfHmhlE1ICR0SIH5dakcbVHAKKBL0tkJY4u4npoDkvbTJTxKMMY?=
 =?iso-8859-1?Q?ObS6YG5wVdE+7nll2H7J5zrxi5DAcJdzbShuZvRptweS5Naaf4SWTcoRO1?=
 =?iso-8859-1?Q?trGTpbG7XfBSydJ+8J9v28pab91RNe4FxPRCmxwG5zNEiWvlax6OcpX/ed?=
 =?iso-8859-1?Q?InsezYcIeES/7APetKnbW/HSJdqFR555CUSQZuL89uATC8rcZ6875ydMgD?=
 =?iso-8859-1?Q?QWEeOwkZ/r+vFmTRUZhP7hVVJ3QqGrIJhxZnFoCA1/5HyW5M59fSoQZOaN?=
 =?iso-8859-1?Q?1tiQH6w1VknC2QP2ZpQo+U5ZeiDxm490sMLkc65AqJcT9O5fAoHO0FOa7t?=
 =?iso-8859-1?Q?do/Q5cuv5FgS7T16FP6FLmvdlJCNE4WD/i?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce9ce12e-adfb-4bee-fb1b-08dcc7f5637a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2024 06:39:52.9159 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhDI411KNf7/w+149F9Q8coS3k47JRkk/AlVf8Y2FFPROEkdrXyECtGBiY2FaQfhGsxtLV1C7meiaUiKmvhb05pWKugPlAcvmvUR9W4IFNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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

> Subject: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
>=20
> There are some variables in udmabuf_create that are only used inside the
> loop. Therefore, there is no need to declare them outside the scope.
> This patch moved it into loop.
>=20
> It is difficult to understand the loop condition of the code that adds
> folio to the unpin_list.
>=20
> This patch move item folio pin and record into a single function, when
> pinned success, the outer loop of this patch iterates through folios,
> while the inner loop correctly sets the folio and corresponding offset
> into the udmabuf starting from the offset. if reach to pgcnt or nr_folios=
,
> end of loop.
>=20
> If item size is huge, folios may use vmalloc to get memory, which can't
> cache but return into pcp(or buddy) when vfree. So, each pin may waste
> some time in folios array alloc.
> This patch also reuse of folios when iter create head, just use max size
> of item.
>=20
> Signed-off-by: Huan Yang <link@vivo.com>
> ---
>  drivers/dma-buf/udmabuf.c | 165 +++++++++++++++++++++++---------------
>  1 file changed, 101 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index 0bbc9df36c0a..eb55bb4a5fcc 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -321,17 +321,87 @@ static int export_udmabuf(struct udmabuf *ubuf,
>  	return dma_buf_fd(buf, flags);
>  }
>=20
> +static int __udmabuf_pin_list_folios(struct udmabuf_create_item *item,
I think the name udmabuf_pin_folios() for this function would be simple and=
 apt.

> +				     struct udmabuf *ubuf,
> +				     struct folio **folios)
> +{
> +	struct file *memfd =3D NULL;
> +	pgoff_t pgoff, ipgcnt, upgcnt =3D ubuf->pagecount;
> +	u32 cur_folio, cur_pgcnt;
> +	struct folio **ubuf_folios;
> +	pgoff_t *ubuf_offsets;
> +	long nr_folios;
> +	loff_t end, start;
> +	int ret;
> +
> +	memfd =3D fget(item->memfd);
> +	ret =3D check_memfd_seals(memfd);
> +	if (ret < 0)
> +		goto err;
Please move the above hunk to udmabuf_create(). Lets just have pinning and
processing of folios in this function.

> +
> +	start =3D item->offset;
> +	ipgcnt =3D item->size >> PAGE_SHIFT;
I think it would be a bit more clear to have udmabuf_create() pass start an=
d size
values directly to this function instead of item. And rename ipgcnt to some=
thing
like subpgcnt or nr_subpgs.

> +	end =3D start + (ipgcnt << PAGE_SHIFT) - 1;
> +
> +	nr_folios =3D memfd_pin_folios(memfd, start, end, folios, ipgcnt,
> &pgoff);
> +	if (nr_folios <=3D 0) {
> +		kvfree(folios);
Please free folios in udmabuf_create() which is where it was allocated.

> +		ret =3D nr_folios ? nr_folios : -EINVAL;
> +		goto err;
> +	}
> +
> +	cur_pgcnt =3D 0;
> +	ubuf_folios =3D ubuf->folios;
> +	ubuf_offsets =3D ubuf->offsets;
Please initialize these temp variables at declaration time above. No strong
opinion but I am not sure if they are really helpful here. Something like
upgcnt would be OK as it definitely improves readability.

> +
> +	for (cur_folio =3D 0; cur_folio < nr_folios; ++cur_folio) {
> +		pgoff_t subpgoff =3D pgoff;
> +		long fsize =3D folio_size(folios[cur_folio]);
The return type for folio_size() is size_t. Please use that for consistency=
.

> +
> +		ret =3D add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
> +		if (ret < 0) {
> +			kfree(folios);
> +			goto err;
> +		}
> +
> +		for (; subpgoff < fsize; subpgoff +=3D PAGE_SIZE) {
> +			ubuf->folios[upgcnt] =3D folios[cur_folio];
> +			ubuf->offsets[upgcnt] =3D subpgoff;
> +			++upgcnt;
> +
> +			if (++cur_pgcnt >=3D ipgcnt)
> +				goto end;
> +		}
> +
> +		/**
> +		 * Only first folio in item may start from offset,
I prefer to use the term range instead of item, in this context.

> +		 * so remain folio start from 0.
> +		 */
> +		pgoff =3D 0;
> +	}
> +end:
> +	ubuf->pagecount =3D upgcnt;
> +	fput(memfd);
> +
> +	return 0;
> +
> +err:
> +	ubuf->pagecount =3D upgcnt;
> +	if (memfd)
> +		fput(memfd);
> +
> +	return ret;
> +}
> +
>  static long udmabuf_create(struct miscdevice *device,
>  			   struct udmabuf_create_list *head,
>  			   struct udmabuf_create_item *list)
>  {
> -	pgoff_t pgoff, pgcnt, pglimit, pgbuf =3D 0;
> -	long nr_folios, ret =3D -EINVAL;
> -	struct file *memfd =3D NULL;
> -	struct folio **folios;
> +	pgoff_t pgcnt =3D 0, pglimit, max_ipgcnt =3D 0;
> +	long ret =3D -EINVAL;
>  	struct udmabuf *ubuf;
> -	u32 i, j, k, flags;
> -	loff_t end;
> +	struct folio **folios =3D NULL;
> +	u32 i, flags;
>=20
>  	ubuf =3D kzalloc(sizeof(*ubuf), GFP_KERNEL);
>  	if (!ubuf)
> @@ -340,82 +410,50 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	INIT_LIST_HEAD(&ubuf->unpin_list);
>  	pglimit =3D (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
>  	for (i =3D 0; i < head->count; i++) {
> -		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
> +		pgoff_t itempgcnt;
> +
> +		if (!PAGE_ALIGNED(list[i].offset))
>  			goto err;
> -		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
> +		if (!PAGE_ALIGNED(list[i].size))
>  			goto err;
> -		ubuf->pagecount +=3D list[i].size >> PAGE_SHIFT;
> -		if (ubuf->pagecount > pglimit)
> +
> +		itempgcnt =3D list[i].size >> PAGE_SHIFT;
> +		pgcnt +=3D itempgcnt;
> +
> +		if (pgcnt > pglimit)
>  			goto err;
> +
> +		max_ipgcnt =3D max_t(unsigned long, itempgcnt, max_ipgcnt);
Is this optimization really necessary given that, in practice, the userspac=
e provides
only a few ranges? It can stay but please pull these changes into a separat=
e patch.

Thanks,
Vivek

>  	}
>=20
> -	if (!ubuf->pagecount)
> +	if (!pgcnt)
>  		goto err;
>=20
> -	ubuf->folios =3D kvmalloc_array(ubuf->pagecount, sizeof(*ubuf-
> >folios),
> +	ubuf->folios =3D kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>  				      GFP_KERNEL);
>  	if (!ubuf->folios) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
> -	ubuf->offsets =3D kvcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
> -				 GFP_KERNEL);
> +
> +	ubuf->offsets =3D kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
>  	if (!ubuf->offsets) {
>  		ret =3D -ENOMEM;
>  		goto err;
>  	}
>=20
> -	pgbuf =3D 0;
> -	for (i =3D 0; i < head->count; i++) {
> -		memfd =3D fget(list[i].memfd);
> -		ret =3D check_memfd_seals(memfd);
> -		if (ret < 0)
> -			goto err;
> -
> -		pgcnt =3D list[i].size >> PAGE_SHIFT;
> -		folios =3D kvmalloc_array(pgcnt, sizeof(*folios), GFP_KERNEL);
> -		if (!folios) {
> -			ret =3D -ENOMEM;
> -			goto err;
> -		}
> +	folios =3D kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
> +	if (!folios) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
>=20
> -		end =3D list[i].offset + (pgcnt << PAGE_SHIFT) - 1;
> -		ret =3D memfd_pin_folios(memfd, list[i].offset, end,
> -				       folios, pgcnt, &pgoff);
> -		if (ret <=3D 0) {
> -			kvfree(folios);
> -			if (!ret)
> -				ret =3D -EINVAL;
> +	for (i =3D 0; i < head->count; i++) {
> +		ret =3D __udmabuf_pin_list_folios(&list[i], ubuf, folios);
> +		if (ret)
>  			goto err;
> -		}
> -
> -		nr_folios =3D ret;
> -		pgoff >>=3D PAGE_SHIFT;
> -		for (j =3D 0, k =3D 0; j < pgcnt; j++) {
> -			ubuf->folios[pgbuf] =3D folios[k];
> -			ubuf->offsets[pgbuf] =3D pgoff << PAGE_SHIFT;
> -
> -			if (j =3D=3D 0 || ubuf->folios[pgbuf-1] !=3D folios[k]) {
> -				ret =3D add_to_unpin_list(&ubuf->unpin_list,
> -							folios[k]);
> -				if (ret < 0) {
> -					kfree(folios);
> -					goto err;
> -				}
> -			}
> -
> -			pgbuf++;
> -			if (++pgoff =3D=3D folio_nr_pages(folios[k])) {
> -				pgoff =3D 0;
> -				if (++k =3D=3D nr_folios)
> -					break;
> -			}
> -		}
> -
> -		kvfree(folios);
> -		fput(memfd);
> -		memfd =3D NULL;
>  	}
> +	kvfree(folios);
>=20
>  	flags =3D head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
>  	ret =3D export_udmabuf(ubuf, device, flags);
> @@ -425,9 +463,8 @@ static long udmabuf_create(struct miscdevice
> *device,
>  	return ret;
>=20
>  err:
> -	if (memfd)
> -		fput(memfd);
>  	unpin_all_folios(&ubuf->unpin_list);
> +	kvfree(folios);
>  	kvfree(ubuf->offsets);
>  	kvfree(ubuf->folios);
>  	kfree(ubuf);
> --
> 2.45.2

