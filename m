Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AD7D1C97D
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 06:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC1E10E5A9;
	Wed, 14 Jan 2026 05:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MXZnNwUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06CB10E127;
 Wed, 14 Jan 2026 05:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768369035; x=1799905035;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nNqFRQ0yRlf3Vc5QA2UZIoykWvKo4ebuj/ceWaSg1h4=;
 b=MXZnNwUyUGWS4Tx2oXRX6xjPcaehoddwzUTwX9xJGDL2zSNAlPsFQ1l+
 nP2vL1uHIphm/IulFafoxioEz3gcwoOeUpy2gzQruZxZuDEhB+9pDHqx5
 YHD7IZD1XBIYU76kV7iVu+hUXgKjR2PZOOEhl9bdOTi/+iDWiBoOfhtsN
 WEHPNQDNHTHCc0aef1KlCiynwbxg8JteCG9NPJh0rFsiUz3WvJBikJZKl
 kq9saacaMDvN1xrTC069yplkkuv1YTZPcHo2WF2BbEPCZqkqIPBY554hR
 X6x5p/ukGUncUDsexwG0gTIFfg036Zej33XecXXbcP2QnG/wvfgBNjQ2O A==;
X-CSE-ConnectionGUID: Tg0r3vY1Tgq6WTWp9djOfA==
X-CSE-MsgGUID: oNi4Aa0QSZCwyqeeRqWjTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="87245068"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="87245068"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:37:14 -0800
X-CSE-ConnectionGUID: q6k1sHazSx6zcYeFcairVw==
X-CSE-MsgGUID: NQZoOmy0THu2kJ+r+HSJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="242120336"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 21:37:15 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:37:13 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 21:37:13 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 21:37:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZeMlo/FUz+HIwWjQTY3ek0nzBzP3cH/SAsmROyQUWkuPiM8aCYXBghjh15a/hCaBNa4fSRk3cCrkj6zDD2SgaDz3jTTjuYFkgxr/jv/BviKNShXvFgFtjKrTaCn8fQ97WKxmroq4UHJQffhjpJg3EsWIYx+JW35QlB4qw1F57dkjkKCIOqLO/BJppFSmAJyUSoFGYHKZvHknq5FNZ5c/REWxVD8KQiZnrSo0iQ4aA4kTfyOPoxJPrbBeeCuNU83a9enHtZ1OmIXyWsUCbGGMn7kF9WaktX7/YM9oXVpJKhajTj0kOSZVc9s0ovZ5vLEGHfvoo4yDDiRlRStcJvBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=At4A3FD0WDiToG/hy9iTJvPenkOGM1o2YiRX/3z6zc0=;
 b=OjxocRKrkYAQbUr+IXvopGv+n8zlAE27cN7jcSkI4fkAhd/CEF48jayrZ1Z2hgCeBmzmBL/YlxI+kce80xaFRL0GCxC0Qn+EFEwqDnfpy/RhImV959910fLmUaT32i6dZJ7LdfwSXFE2REPX+RXt69ScH2LnZ0hKtFNQImvJ7Iunwquo8VWhAhC/q7xxoWTsDmEPQyCpJAXk3n7HflR/ONvveYDfim9TbC63swxRL1JfAyzi8ScZjRmoza8XldjPKYCGV/L45Ftov7u9bCiWerQc3lUJrJgmaezXz4UGaphPybBvOvVKzqkwdsivJrFyYqIUf/pbXtDwCNGcvRDvGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by BY1PR11MB8055.namprd11.prod.outlook.com
 (2603:10b6:a03:530::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 05:37:06 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::7cc8:75c9:22c6:3c66%7]) with mapi id 15.20.9499.003; Wed, 14 Jan 2026
 05:37:06 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "louis.chauvet@bootlin.com" <louis.chauvet@bootlin.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "daniels@collabora.com"
 <daniels@collabora.com>, "Shankar, Uma" <uma.shankar@intel.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3 06/13] drm: Allow driver-managed destruction of colorop
 objects
Thread-Topic: [PATCH v3 06/13] drm: Allow driver-managed destruction of
 colorop objects
Thread-Index: AQHchHo8xjDIIww/IUS4PZ12hD6DxLVRJmSQ
Date: Wed, 14 Jan 2026 05:37:06 +0000
Message-ID: <DM3PPF208195D8DEC7C0B5F2A05CE68ACB2E38FA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20260113102303.724205-1-chaitanya.kumar.borah@intel.com>
 <20260113102303.724205-7-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260113102303.724205-7-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|BY1PR11MB8055:EE_
x-ms-office365-filtering-correlation-id: d355e6cf-87fc-414e-f471-08de532ef40d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?b0nGocjUc9ZOSFZHhPgPzNFLYprDa7zP89TqQlpSesQ3m+Gmudcg6teFuvXM?=
 =?us-ascii?Q?i2ZjRHcbsgImqBpJvCF0vAi+l3ePBZqrts4nfY+icwkD/b1dhct946vVjwRr?=
 =?us-ascii?Q?wxZU44pvMUxbFQA6zcOqSPp9AEIzb5FJe+2IDqRMKnWaY1VgyDhrDdHTjPXo?=
 =?us-ascii?Q?DNSFQ46ybTYKHCdm1T+XhS8ygnKtG8qF17C363k61lrYMzy1PdXvMBacggsV?=
 =?us-ascii?Q?C2TQQveIlYGdG8RaEe2sKE1BDGqA6RXT3CcRa+O4UdUI/CaRwDf/DR3UVxqf?=
 =?us-ascii?Q?kbpSUHioeqSS6fPIuHi3/hff/2lHV3+bgIu5kDNbswBQPLRq+81h35DGLZ69?=
 =?us-ascii?Q?vkjKvCDoOrQXv//sXauzHNOSeNvJdv+BmXzefBMNdsS3AI5RuYETKwgBOMaf?=
 =?us-ascii?Q?XH7zPZ83v04npe+nkbZKjXVLc2teetwKqh3ADU6vTnmpgcTuNddiNn5DFhi7?=
 =?us-ascii?Q?quG1CtlrVSzKfEcdYz1tC+hCQRSEfYNrdiJoolleGXxn+SE4l06PommaV9+8?=
 =?us-ascii?Q?o1dL7CMJw5C1i29b+/m9l8joBw5eB9iJwHKNB9LoMUb28yjdbf7nS2J43pgg?=
 =?us-ascii?Q?PPUgQoxvncnuyGsZgqkEKRGKg6Jp1/GuUz38B7+RkzW9uysMcnINz6aILl7j?=
 =?us-ascii?Q?Qtr0U+7v9KcrPINixvlEtMMYmLATN3kzVGgvyzdNGobH0CA7NKwFEc9391eS?=
 =?us-ascii?Q?yPPPucnZRo3hhFrQsxGcaEQ3FzwIvApBvhAH5S6QPk2EVBX3eNi335+XBQQl?=
 =?us-ascii?Q?1W8tCSN2UEH0KXrje/wVF2pf6M5QV5EBIwctmTr2FqS/8WOlD0CqtOwFmzXW?=
 =?us-ascii?Q?4ac0J0HPN/IaYbCX/Ok25eCL3J4lVUVTHvLRz10/1i3E+KVB8hpZvcCrz7MF?=
 =?us-ascii?Q?BQM49vYErBUKxcKPfUAmrpRu6Ys3oc7KzSw8x3q1XxUzCi9+5IJkdZEqaszp?=
 =?us-ascii?Q?44/24pwqrtrPoNgkJ+c9KqTW0azs0b+z92s7gE4JvlFbfoit8cddSRq72Dx9?=
 =?us-ascii?Q?+E2iaIHpZoNQPeTZPaNYAs03TTRrHy1XIJXwTNkrsx6hTe9g66Q5mPzNrAVq?=
 =?us-ascii?Q?cn8HECEnqWfM1CcVSZYR8pGj2n605WW7yWpvhMU3HaWGXkeqaYplf/Cna/Zo?=
 =?us-ascii?Q?3XS2n8SXvPlUlhEIu9JcKXeFrhB/XcqzhQtE5TULPxTUmGKXpQqyoeWYT5ZT?=
 =?us-ascii?Q?qMQmQ7Itc9546U/k6RoGGnvejZMqLeivc5tXMQii4Uw9HDrZSUIWu0vLSYlp?=
 =?us-ascii?Q?urD7jOLZhQgVeLSPdk2Upt3qkS6gCric+MkZbob4KbfONNtXzp/ClN4/P3Mt?=
 =?us-ascii?Q?wrvxjZr9wg/uEuk46N+LiGdw+GzbG+D8bnNCIX4ig04Wj/lZsX1ZYXfZjHII?=
 =?us-ascii?Q?UYGMDNM/DCETYRj5mRdKHvtyIY0jeWcbk88KEQPXYncFZpZ9dJXpJ/hmDoA6?=
 =?us-ascii?Q?FW8rd05GUArioMKwS8xk4M52b0NqTT9+agy0YWNs9bWJiJ2E4U5aQTRIfVqq?=
 =?us-ascii?Q?JKkpDh8aBvKFZozkc/x84h4bL+ExO9KUd0OP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sXG88YgmsUdnRffwQrJvG6wsy/JfMU7H/Ocx8MxzINB1ikS1zpS7zJdfOmPb?=
 =?us-ascii?Q?o9UvSO8rvDFgOXyArcPojQUrzYOjJmIsYUQVZEyh9BABivLuV5CPg2f9j5rN?=
 =?us-ascii?Q?P90saUBAuejTCr3NFm956VkYxrKIH+WtoAWSjiavzH25vUwsrgJL6NBFdGr7?=
 =?us-ascii?Q?J601K11gjseZ3oRQ3JZ7djJ9/Z/Jn26l5C35xiy/NfQRkwGIO/OSFE7nFN/k?=
 =?us-ascii?Q?HpW2ukl1ppwWYaBu/4C4En++AoApZ2pCLuId1Xy/8ywmtVHZEIGvPAdSxVgO?=
 =?us-ascii?Q?07bTdMlfUj+o9AIs0DqqUppnE2e/NdFkQEEHF/Nh0L78sI7hW4njQPa169u4?=
 =?us-ascii?Q?+XLIYzs74syNC1K3KAs0IvUyXysCbM6ZA3aoJ0iOeVfNk2Kaex9ssCL+WtxJ?=
 =?us-ascii?Q?VwTpMWvub8NSo4iNTgQOc7XwA/y6b4JWw3WBuSB/uOKHSS4gECuyxbBj3Nga?=
 =?us-ascii?Q?csUju8p0c1tkL0pT6RW6WJXGjpER8DBPtNBbYKAxAP9SIr3uZNdDi8rE40Uz?=
 =?us-ascii?Q?Zis0isw/sZzS47m+eZLHedJGm9gJo7+Tz1hEow0g3n6JiolRi1MR4A0YgXBS?=
 =?us-ascii?Q?dKXsgYMncMT7fy71mUjVX9zKX8O8oiaD8MyQLRvNktdP4iHOwo/vlcMrfOLN?=
 =?us-ascii?Q?1eMBcrQabg0zaOiDf7IhC1JG256KCkCSzz3O2AEZws0W19uu+PKicukN6QJw?=
 =?us-ascii?Q?hkwyMBGNKa2OjOslgLIkcxyP5qN7Cy9lzXA3JdUzv2VGViNrGKUu39TmFk5r?=
 =?us-ascii?Q?L1gxicI/6X/hTwHCzONp0JoFJq2Y0VJoqEWlG8KpveOeJg3oQ0Ffh/K8oTbw?=
 =?us-ascii?Q?eyea1J2CsobsCyZIyLQ3eE5rew/z2YtaW6C+EX5D2a0kGB/SZp/hN8YQTfNW?=
 =?us-ascii?Q?+rKLYzW2Et1CDXE3JrNhN8bwB9NMr5OJeMmsBepUjSUxkWM1bUIs/senRzSJ?=
 =?us-ascii?Q?uglnKdKleX0gbPErbxYvF8B9GfQm7y+hZRf0uE6dsgavxFxMfaeqPe0KOfWh?=
 =?us-ascii?Q?RYCZLW3FP+L8oo+edtNu8SOedmqbKvNh1JkjWaYS1mO4/JS5+XyyAmfwiOri?=
 =?us-ascii?Q?lvRLsvnjrbLqG1VkSqugt5+S0HIlMBNi06MKPyyCPVa9KN3v/WDWI/mTNw1u?=
 =?us-ascii?Q?Qhj4Cy+Zhu1eNBcKa6KfCNKKdBM2+MuFWHlmqG5JFK/0LU0KqTrpRp1veSwA?=
 =?us-ascii?Q?LIWNnknGniPRyCt5VdVjL4pARlWFu7mQt+Pw797/JDqS2bt4J4NbPn3ay/QE?=
 =?us-ascii?Q?wotSH4HWkVY9+1jcQ7MmcsDv/0XHIUoNc/F/YGXaACDF3RhqrxfpD1DrhgqQ?=
 =?us-ascii?Q?hlnAsY/abOOJ3FuM6bXv/6PJetHAHvFFEweV7/2pm4q7gVtFQ/E7BsB4yu5R?=
 =?us-ascii?Q?bGxgkYXaZHzf68yRif+4k+ocFGUhhvlj+J8PFjSS0yZ6hMyciuLFTuw4PYzB?=
 =?us-ascii?Q?zKKFz//U9v6Wc9Le0r0zySuTG/f2RrdMOHPC+F5OK3+aTmHRKJ3rWodOFqFP?=
 =?us-ascii?Q?kQl3qH5+CNXtouSV5jpwCveLrVxEHnuyb1aTUmgwWwEuvcZkEi46goWwKx7S?=
 =?us-ascii?Q?az1zlM54LnzevgsJuFaStdxIS6evf1XiiByvNxkcal6OJ2kIHC52XRY5zPbk?=
 =?us-ascii?Q?PcBQZh7qfk4SFank1ZFkjj2mRyCPkGNdzN5VGXlKcHBnT8FBMDWdr8AReqDH?=
 =?us-ascii?Q?FXtYyFB3BmY+UTvFe6dhjtRWKNyxy9Q9H5Atg88FPIt1icc0ZaE49cSdt1pR?=
 =?us-ascii?Q?bEOmEPEwyA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d355e6cf-87fc-414e-f471-08de532ef40d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2026 05:37:06.0749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TF0mHFPyI5G7GDXCnPUGKBqQqLkOugDLs12wO2QU3WP3uxHQqIihp8haZPQf8iwkyErla82/fI1q6QstOT1ISg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8055
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

> Subject: [PATCH v3 06/13] drm: Allow driver-managed destruction of coloro=
p
> objects
>=20
> Some drivers might want to embed struct drm_colorop inside driver-specifi=
c
> objects, similar to planes or CRTCs. In such cases, freeing only the drm_=
colorop
> is incorrect.
>=20
> Add a drm_colorop_funcs callback to allow drivers to provide a destroy ho=
ok
> that cleans up the full enclosing object. Make changes in helper function=
s to
> accept helper functions as argument. Pass NULL for now to retain current
> behavior.
>=20

Just to point out checkpatch asks us to use u32 instead of uint32_t

Regards,
Suraj Kandpal

> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> ---
>  .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>  drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>  .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>  drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>  include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>  5 files changed, 66 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> index a2de3bba8346..dfdb4fb4219f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>=20
> amdgpu_dm_supported_degam_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_mult_init(dev, ops[i], plane, NULL,
> +DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +		ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> NULL,
>=20
> 	amdgpu_dm_supported_shaper_tfs,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +		ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> NULL,
> +
> 	MAX_COLOR_LUT_ENTRIES,
>=20
> 	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  			goto cleanup;
>  		}
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane,
> LUT3D_SIZE,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL,
> +LUT3D_SIZE,
>=20
> 	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>=20
> 	DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  		if (ret)
> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>  					      amdgpu_dm_supported_blnd_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct
> drm_plane *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane,
> MAX_COLOR_LUT_ENTRIES,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, NULL,
> +MAX_COLOR_LUT_ENTRIES,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c
> index c226870fde9e..2bce29176ab3 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list
> drm_colorop_lut3d_interpolation_list[] =3D
>  /* Init Helpers */
>=20
>  static int drm_plane_colorop_init(struct drm_device *dev, struct drm_col=
orop
> *colorop,
> -				  struct drm_plane *plane, enum
> drm_colorop_type type,
> +				  struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				  enum drm_colorop_type type,
>  				  uint32_t flags)
>  {
>  	struct drm_mode_config *config =3D &dev->mode_config; @@ -109,6
> +110,7 @@ static int drm_plane_colorop_init(struct drm_device *dev, struc=
t
> drm_colorop *co
>  	colorop->type =3D type;
>  	colorop->plane =3D plane;
>  	colorop->next =3D NULL;
> +	colorop->funcs =3D funcs;
>=20
>  	list_add_tail(&colorop->head, &config->colorop_list);
>  	colorop->index =3D config->num_colorop++; @@ -218,6 +220,7 @@
> EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @supported_tfs: A bitfield of supported drm_plane_colorop_curve_1d_in=
it
> enum values,
>   *                 created using BIT(curve_type) and combined with the O=
R '|'
>   *                 operator.
> @@ -225,7 +228,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags)
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags)
>  {
>  	struct drm_prop_enum_list
> enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>  	int i, len;
> @@ -246,7 +250,7 @@ int drm_plane_colorop_curve_1d_init(struct
> drm_device *dev, struct drm_colorop *
>  		return -EINVAL;
>  	}
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_CURVE, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_CURVE, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -303,20 +307,23 @@ static int drm_colorop_create_data_prop(struct
> drm_device *dev, struct drm_color
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for new colorop
>   * @lut_size: LUT size supported by driver
>   * @interpolation: 1D LUT interpolation type
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t
> lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs
> *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_1D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_1D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -354,11 +361,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct
> drm_device *dev, struct drm_color
> EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>=20
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags)
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags)
>  {
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_CTM_3X4, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_CTM_3X4, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -378,16 +386,18 @@
> EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>   * @dev: DRM device
>   * @colorop: The drm_colorop object to initialize
>   * @plane: The associated drm_plane
> + * @funcs: control functions for the new colorop
>   * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>   * @return zero on success, -E value on failure
>   */
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags)
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags)
>  {
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_MULTIPLIER, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_MULTIPLIER, flags);
>  	if (ret)
>  		return ret;
>=20
> @@ -406,6 +416,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>=20
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
>  				 struct drm_plane *plane,
> +				 const struct drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags)
> @@ -413,7 +424,7 @@ int drm_plane_colorop_3dlut_init(struct drm_device
> *dev, struct drm_colorop *col
>  	struct drm_property *prop;
>  	int ret;
>=20
> -	ret =3D drm_plane_colorop_init(dev, colorop, plane,
> DRM_COLOROP_3D_LUT, flags);
> +	ret =3D drm_plane_colorop_init(dev, colorop, plane, funcs,
> +DRM_COLOROP_3D_LUT, flags);
>  	if (ret)
>  		return ret;
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index 04af552b3648..d3d73d60727c 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>=20
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +NULL,
>  						  PLANE_DEGAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -39,7 +39,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct drm_prop=
_en
>  	prev_op =3D &colorop->base;
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
> NULL,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		return ret;
> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
>  		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>=20
> -		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, 17,
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, NULL,
> +17,
>=20
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  						   true);
>  		if (ret)
> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	}
>=20
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
> -	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +	ret =3D drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base,
> plane,
> +NULL,
>  						  PLANE_GAMMA_SIZE,
>=20
> DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); diff --git
> a/drivers/gpu/drm/vkms/vkms_colorop.c
> b/drivers/gpu/drm/vkms/vkms_colorop.c
> index d03a1f2e9c41..9e9dd0494628 100644
> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane,
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
> +	ret =3D drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
> +
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
>=20
> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct drm_pl=
ane
> *plane, struct drm_pr
>  		goto cleanup;
>  	}
>=20
> -	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
> supported_tfs,
> +	ret =3D drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
> +supported_tfs,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>  	if (ret)
>  		goto cleanup;
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h index
> 3056f3f02597..bd082854ca74 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>  	struct drm_atomic_state *state;
>  };
>=20
> +/**
> + * struct drm_colorop_funcs - driver colorop control functions  */
> +struct drm_colorop_funcs {
> +	/**
> +	 * @destroy:
> +	 *
> +	 * Clean up colorop resources. This is called at driver unload time
> +	 * through drm_mode_config_cleanup()
> +	 */
> +	void (*destroy)(struct drm_colorop *colorop); };
> +
>  /**
>   * struct drm_colorop - DRM color operation control structure
>   *
> @@ -362,6 +375,8 @@ struct drm_colorop {
>  	 */
>  	struct drm_property *next_property;
>=20
> +	/** @funcs: colorop control functions */
> +	const struct drm_colorop_funcs *funcs;
>  };
>=20
>  #define obj_to_colorop(x) container_of(x, struct drm_colorop, base) @@ -
> 390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct drm_device
> *dev);  void drm_colorop_cleanup(struct drm_colorop *colorop);
>=20
>  int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				    struct drm_plane *plane, u64 supported_tfs,
> uint32_t flags);
> +				    struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				    u64 supported_tfs, uint32_t flags);
>  int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -					struct drm_plane *plane, uint32_t
> lut_size,
> +					struct drm_plane *plane,
> +					const struct drm_colorop_funcs
> *funcs,
> +					uint32_t lut_size,
>  					enum
> drm_colorop_lut1d_interpolation_type interpolation,
>  					uint32_t flags);
>  int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct
> drm_colorop *colorop,
> -				   struct drm_plane *plane, uint32_t flags);
> +				   struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				   uint32_t flags);
>  int drm_plane_colorop_mult_init(struct drm_device *dev, struct drm_color=
op
> *colorop,
> -				struct drm_plane *plane, uint32_t flags);
> +				struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
> +				uint32_t flags);
>  int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colo=
rop
> *colorop,
> -				 struct drm_plane *plane,
> +				 struct drm_plane *plane, const struct
> drm_colorop_funcs *funcs,
>  				 uint32_t lut_size,
>  				 enum drm_colorop_lut3d_interpolation_type
> interpolation,
>  				 uint32_t flags);
> --
> 2.25.1

