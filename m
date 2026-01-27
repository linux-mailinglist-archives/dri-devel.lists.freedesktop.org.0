Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GJmClJVeGn+pQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:04:02 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2429038E
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 07:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322BD10E4C1;
	Tue, 27 Jan 2026 06:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DCht6LTN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB89910E4BD;
 Tue, 27 Jan 2026 06:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769493837; x=1801029837;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=i0ivp9oEqDDj940ahqY0QQlMcyhQbf18QE+cG3c7H3Q=;
 b=DCht6LTNwVMDeaHl6qFkBAY0turIjPHvKfcVidwGmsH9OUNCMIaspP/h
 K4oPuIj8aBOS61+bC3fkvBYBrFbwwRWjwB0n4jyAmjvXUtUJPMBWslJZy
 OyY7FyzrZKfjwjOjhjNke7bTPFDMm15/ubZElC4lYQEV1TW5angLOvuPm
 RpmpWSODXpTusReOb6NHUx/zu2cgUWCEX97jgRi2k7lHfCjynecLTKXQy
 0PvEOvjrj+ObyhETPa5bNo+6Y6W/9JKbZNAEj8fofDsrhV9PxPRQJuy1G
 yZl4eF29hmBbvvjYMV+KktIEHkR4sD3uZpt68xTjbf8N2JuhVLpmKhd/3 g==;
X-CSE-ConnectionGUID: DtM3AnlmRUitCblI70CaRw==
X-CSE-MsgGUID: eb0PH9P1TmOFj1ht2IT76Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70582263"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="70582263"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:03:57 -0800
X-CSE-ConnectionGUID: WmNMHBLuQIC0gqLA4+/XrA==
X-CSE-MsgGUID: L4COUfupTKC4V8M1ZLQhfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; d="scan'208";a="207119481"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2026 22:03:56 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 22:03:55 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 26 Jan 2026 22:03:55 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.10) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 26 Jan 2026 22:03:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cueBADZK8Y7RUzsu6V0eGsvTu2D3vQAyhY35xTvogdYLlSU+/opQC+EUkJV/stZXDIV5KQmq6Tp46jWAY1CUbWHy1PG2mMxzmFm3cu4agkfUK8NQ/9dLyPNKT5ksf+k0MDfJ++tJ8zRQq1WWtWOGKMtrQU5RUbGn3f1UGQfaa9oeUkh8zeIyXw2tnxhLiAF3hnWsQCDaZ9PNE0aYruIbBH8n3QDH76QNIm6JcMz42C5Z6S7EpEqdUvbXyIj82ILNUk4+pOS0j/bTbS8YAVERZ565Tv3Se3xxm/J3rK3qU2kwzL5uQztO9yEZdV3oyZ/ecSUZxTqZKqvL6vT3eJNXAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJZeYEP0mo5OcvPE7AuZlH/yDn+SET/V5lvZWu5sP7g=;
 b=vYVs6LlqjTcMb3zq4iVmMAnJhRim//M4sERFuAYK9q4p++GV1NPOpH1+ZFV8k+okXXxvN7Miykhzp56Avx7ce3XZmCcyR1iv3xabicm5blir6cOlIdljBF7a50AftjmcbEZ6JokRuT3PZThzgOELzot+A48dk84SW0wrw1bPqG1dMs0A7WlfMmIwcrwiclMAIYnJ/IaJhTgdFwpvwXdyoJFp3FXRG/kIaNmEX1oEAJqkzGCYGrjw1gYuDQG0l3BDZPTUM+GLFu9YrDq7Ue3oNbIr2p5LtNzR6wNfwjv9tKvP7I+i36yzOZKDWO+dWsrjPrzeY4NfYDnNK6VzG/GIVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM3PPFAB693A2AC.namprd11.prod.outlook.com (2603:10b6:f:fc00::f43)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Tue, 27 Jan
 2026 06:03:50 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::9f37:cb81:5463:300e%5]) with mapi id 15.20.9564.006; Tue, 27 Jan 2026
 06:03:50 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>, Christian Koenig
 <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
Subject: RE: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Thread-Topic: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Thread-Index: AQHcRvz4E9hXyspRBUGk9qxvPpLsUbTYR6AAgAFminCAAQoeAIAAh4hggIWnr4CAAfJrYA==
Date: Tue, 27 Jan 2026 06:03:50 +0000
Message-ID: <IA0PR11MB71850C389E26BC1AE7453552F890A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20251030134310.GR1018328@nvidia.com>
 <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
 <20260123225057.GH1134360@nvidia.com>
In-Reply-To: <20260123225057.GH1134360@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM3PPFAB693A2AC:EE_
x-ms-office365-filtering-correlation-id: 248d0f0f-e997-45c5-3efb-08de5d69d7d8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?u1GjatsDieemRWnP/1yG2QlE1mdXDZOxRVqXB2VulALoytmGwQUrfeBQe3?=
 =?iso-8859-1?Q?RMRHDPP3rRlNz0CWae1KTPqA1PWfeAmPjSxnYEtVlm+hpIrj+J4WE2jsOC?=
 =?iso-8859-1?Q?36H1TO6Wa4maDA/w+SCj3CWoH465aWYzPdRjmxxC5CUB2C7SjiWPz/bzHz?=
 =?iso-8859-1?Q?SsvT0BXBmaqcEycRKEEBfr6u8d8xsxUtVGowFCFXTWYOkQ66+J/mr00Yxk?=
 =?iso-8859-1?Q?5QRUucviFoSzRPGYPlwzGvpX1WNAdWQtcEN7WkU8KVfbXqdxRyehVwxEVb?=
 =?iso-8859-1?Q?dOaHNSJtdCP66uqj+razLv1XZVhQvDvfpYnsBYZL5bpacLsMspd2UMVZ/t?=
 =?iso-8859-1?Q?UbJYK80SoxjFbTl/Z6nBXrB8eTmw8PYdiEn/6beUwwoiUb2Yj05TerBTLI?=
 =?iso-8859-1?Q?8i2s7xi2kr+fHAKT98APP3PilFGjETtVGmHD5/d/06MNXCos/3oCjZb/fy?=
 =?iso-8859-1?Q?ZpFIGgUjyN5IU5I2yg96QSL2gNot+ndGqvBy//MZHtktGXQCK1K+0YhwcT?=
 =?iso-8859-1?Q?IGoIHFqujuEl+Y0zk1lDv+S7uE6J7rtuXZfl9FaktF+nGJXgJiaUhwrHU7?=
 =?iso-8859-1?Q?ymMmMmkflavaJHcvvOdMGlYlAV7xyVn5VoK6B9U9Gyxx+0UHSquXJJXaXv?=
 =?iso-8859-1?Q?szaO38tVROuKkkprc+yTDTafg9MLOcqSvusgX4L/XZ611FG+EJ/xEGZ725?=
 =?iso-8859-1?Q?04gvykyMVdiXW8cYLsE6m+hu9aDqxPGpKl2zQcytgJlEwT1op/8zjF8KQs?=
 =?iso-8859-1?Q?IOs8i13zWHerCW4Xp93gXVP/I5aLZhZHfV+rEDhBSTFJH64BJAAwDnIdIs?=
 =?iso-8859-1?Q?cSWR0Zip/6t26JHDkDvi2hzYQMz/rtnlsOaeM6IXdLckFkjNvh7sdzCYjC?=
 =?iso-8859-1?Q?OtIKB/uGZAd7Oma1owKrdnMlDgXmyC2isZCNrgMWsEcSsjg1V+LMg3rkbw?=
 =?iso-8859-1?Q?oLwxpqF5uSDbh24a1l0K91wzLSRxV7yggsHSrMlaMuc/kATh2H7a5M8Aga?=
 =?iso-8859-1?Q?XxZIYD0uh3DcP2q+iciGN31yVbc4LCdIo074egWZ3BYU6IazuSnqwSGJg3?=
 =?iso-8859-1?Q?HV77LspyDrbSWIzbUs5T5XY+Ud7HU4XdOCU9UuxKHWdqgFqRV4+8h6NVeb?=
 =?iso-8859-1?Q?Iwe5veTNiT8zJpqjGomXOlwokGNXLFHfyuL1uYoOI4YZoGsmkG3RZLpsIf?=
 =?iso-8859-1?Q?9CbtxsHeKr7GpeIDQZ1zqrtaJfJKxr5PuyskFPa1cBqrTdmyYQS87DSZDT?=
 =?iso-8859-1?Q?+g5TLSOEAOrIxL7z2qd5dMvxndx8TTzAc7R12VCU7Sgf+EQeyBCyHYp/GL?=
 =?iso-8859-1?Q?bqpQHCIKH9PYdy6gr1mAwjnXBBCzscF789EI5lvs4XhB7dy7PEt9BXC1oi?=
 =?iso-8859-1?Q?F/M7tXLYhdpObIuf6iXMHi8bPbKbGaRm+u468IGoRnEkxWbYDLoATwXd8G?=
 =?iso-8859-1?Q?c/yfR++JYEhSjp6JgkQKJ5ExCkVgwO/wpjRtOi6AfN7g1el2VIV8a1NtCg?=
 =?iso-8859-1?Q?r9Z4HZJQVgrAlIiwm9R6RftGlbMkIEiSv/hgjQMqOzI+p8sSNB7recyULb?=
 =?iso-8859-1?Q?VFZ3g8BOJSMgwrgp7GDiwMT7WyadHnPTM3MXQ7P1ClDYa+lpO6aFkpQRW6?=
 =?iso-8859-1?Q?JiHcpcaGx10f+fR5/t8tqSjLzvQDiqyj3V7YXjACbMdh5c7UmCdTZ+x8Zq?=
 =?iso-8859-1?Q?0eOqxWYLoUgU+HX+AfE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?dNiYG1yRBrh1L/m0zijnt7qndHzBcPDT+XnGCRqtdUjIkAyAvFVPaiqMWt?=
 =?iso-8859-1?Q?tbRR/Fc3eoZU5wDvMfzADk3lcnJ19qotufykGy6WJqN25J7ffshoxAG1G4?=
 =?iso-8859-1?Q?qgD1Pdpy63aUBTr5ogOU0oUBHhxoM5A1sAHpsvsN144ywW32CGvK+h8+lH?=
 =?iso-8859-1?Q?RFYDmiDK62MiQp1/vGd1/iMf59EasF6kJW70RxstPtbsZ3rYyhW1HXvbZ0?=
 =?iso-8859-1?Q?SElZ3SUCD8j/pm2AeyaD/a7tSTB2C8zHSv9aF9vJyTeoUhode7OqgxTf5A?=
 =?iso-8859-1?Q?8hRwS85nY6/L2XAtwZCa5t0AliUDBWVn4y/+ijD8N3zmdUsRkSwla9wnrv?=
 =?iso-8859-1?Q?vzZkTdJR+DXYd96KTJURYLKWgxsSXQ/GMMi7GbaRZosUaUJN3IHFXuWOrh?=
 =?iso-8859-1?Q?qMwhEHW1gsaoQvGhT4cYiZyUZ8o2BzBax5/wDXTwniiwLqV9sWss3gE2TR?=
 =?iso-8859-1?Q?LEqkntd9K2JMW71gcjey8NRWP0WXjt9X2dEFx5y4qgMJWLWMnqiXifkmxu?=
 =?iso-8859-1?Q?Q9yegMuYyi+/9QJoyO+RosDhHCJQ2nxJDnYzoVBONZMjz+dHI+dqsPHgUZ?=
 =?iso-8859-1?Q?ezfSRUaSgCf5JiyjS5BborGFM3IC3xrCXs/fnva4AmIKPc0luCvVxHGYDy?=
 =?iso-8859-1?Q?Amk9nJ45NqQT5gnG2jaCbyIxajpn4gZXLzfmR200v4Vk9x8t0Q2WTCSjiq?=
 =?iso-8859-1?Q?AMYe//yyE7yrq9CkOG8e2L58zzEt18ZjIO4yHh9R6rS2ZeUcS7llUOKumm?=
 =?iso-8859-1?Q?BEPVZ8RsZQnDUVSGKA2auO3W/v45COZ3U88kPf1MlkBervPw4B+CWmuldT?=
 =?iso-8859-1?Q?9C8uFUa80sp+kJ4b8HP8MC847HTdlJqW3snr83GvJnV5ia2bW57UMF79Mn?=
 =?iso-8859-1?Q?831ij7u8qRE3vJe93ya9dX70pwtntUVVfmHr1ekqCfvvQifXspX3pYjMfa?=
 =?iso-8859-1?Q?7rRqO9/TdcDH7eaisxdu2iI5Mb0u5syS1L62SAXcpeC3ke0Xh/aVYqbeP0?=
 =?iso-8859-1?Q?/xTl5DsagFgew7zoJ1Jy2psfW7F8W8wzmG3umYkLjuOuJvvxh+DpBhgAW7?=
 =?iso-8859-1?Q?dFIuSK4I3YW/DmbLm+u7i7qU6/WYymgvegObIkKMcut+WFF4IF/JuYQvSR?=
 =?iso-8859-1?Q?xS1ZHCc5KHrR0b+jRy3Fqvay4nav0v66N2yOWNSJ2yvXztdaedgSmy01RC?=
 =?iso-8859-1?Q?abBm4JC8B9pvXQlI9Y6u2omAo80OO8mLyH/94k779r52ciN0SwxQYj5WZR?=
 =?iso-8859-1?Q?bkaCLcm6+z9kIUwsv1noMF4A3B6K2WDkNwaCH0jyuVi4NQNJeHqor8kVdl?=
 =?iso-8859-1?Q?lY9PdnzupwXHa3SSriR0PCdzhZJFOQjuD68Jok6+1ThQhzNVwecNKJ0pi7?=
 =?iso-8859-1?Q?lYsiNRnEHQNdZa+ERxL6NkzpvoRMTahELe1KX8oz5isCn+MBUHrhDj5iXf?=
 =?iso-8859-1?Q?lJS77/7R++wtkg7qpYq87xF8DvWCOPLkBLJynwkuvanpoFesTFcRbQo+EC?=
 =?iso-8859-1?Q?lG40Mky5niliCxTk8rqPyegrLoD+8aPdT9yRg5Yk+SjNeNRTq3NopJRhgS?=
 =?iso-8859-1?Q?Ug69GarrUamkrThBcqFdDW60ug3vE2pX50PJl3S0ILF4fhHUVs4ISXXB+2?=
 =?iso-8859-1?Q?VoOi6EbsK8JJEubvALBhKtxZIAZrhx8fa0R5gqjUN1SXjagwI6NZxsYk1p?=
 =?iso-8859-1?Q?bOa0lggB5U/5RJ/Io3ZErQf7rd0oESsV2aXmVaK4NDFB4NQf5tPwTZ2Uf+?=
 =?iso-8859-1?Q?CFLI970OCcxIPXgmvO6OUBIMBHqkpOrB3j8K6mpvuwZexY0NWhJVmMZ9lJ?=
 =?iso-8859-1?Q?04ia4Wnfag=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248d0f0f-e997-45c5-3efb-08de5d69d7d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2026 06:03:50.7273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 33sa4yXnXDPTed/z2FKky5OF4WQI9eGMeHMJ2tSeuG+h9APsri0cg3uQwrcgcyxHSc5b55kTCS1UzoGxTRRSuAnosbZvAPUh6f9yWGSgtCk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFAB693A2AC
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,IA0PR11MB7185.namprd11.prod.outlook.com:mid];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.kasireddy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6D2429038E
X-Rspamd-Action: no action

> Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
> interconnects
>=20
> On Fri, Oct 31, 2025 at 05:15:32AM +0000, Kasireddy, Vivek wrote:
> > > So the next steps would be to make all the exporters directly declare
> > > a SGT and then remove the SGT related ops from dma_ops itself and
> > > remove the compat sgt in the attach logic. This is not hard, it is al=
l
> > > simple mechanical work.
>=20
> > IMO, this SGT compatibility stuff should ideally be a separate follow-o=
n
> > effort (and patch series) that would also probably include updates to
> > various drivers to add the SGT mapping type.
>=20
> I've beeen working on this idea and have updated my github here:
>=20
>  https://github.com/jgunthorpe/linux/commits/dmabuf_map_type/
>=20
> I still need to run it through what testing I can do here, but it goes
> all the way and converts everything into SGT mapping type, all
> drivers. I think this shows the idea works.
>=20
> I'm hoping to post it next week if the revoke thing settles down and I
> can complete some more checking.
>=20
> We can discuss how to break it up along with get feedback if people
> are happy with the idea.
>=20
> It looks like it turns out fairly well, I didn't find anything
> surprising along the way at least.
Great! Looking forward to the patches!

Thanks,
Vivek
>=20
> Thanks,
> Jason
