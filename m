Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id laaIGgyTj2mTRgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:09:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 777D11398F8
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 22:09:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A4E10E2C2;
	Fri, 13 Feb 2026 21:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jQjUyoM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E9610E2C2;
 Fri, 13 Feb 2026 21:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771016966; x=1802552966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SxMYZ2Gj9LJ1bh1v/J4otcqYBewlNkMTN7cekr4+HJ0=;
 b=jQjUyoM0j5xsNVhIuEU2ptr/BR6XXZbH6E9YU6YdjiiuTvDuE05iqIQc
 Vh1YoyyRfAErLtS1HK3UBc6H5avOU2M0ULjQyxJnBdOatzt8rmku5bZr3
 jmI+UNPtqvfByTdqoAwoITWeCT/1ltNwyeBWyzwuM/WmhEArUS7IaO2Bx
 I1ddk4a+kHaTOSioQOqZJcYd1robADyYNieO/L/sRm4O/+q2Tdx3C6SUH
 p3XUI1HkYfGehYPqu3QY0epECSEGH6Yuz6wY5XCSHjbarWU7AwUGHuyEs
 eve7++dA995bu4+kRWP21mjPeX5v/JsSovrtkAIWMzVeE9JgSz/eBP0Jr w==;
X-CSE-ConnectionGUID: ygSK5AjsRyiEYKUKvmaEFg==
X-CSE-MsgGUID: zrVRZT/wSWWSq3jMA1bfUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="76051530"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="76051530"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:09:25 -0800
X-CSE-ConnectionGUID: SO0Ja/9zRj+hwZtNTr6pTw==
X-CSE-MsgGUID: QHJoIgWlRgOhGPO3eOklCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; d="scan'208";a="212121983"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2026 13:09:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:09:25 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 13 Feb 2026 13:09:25 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.56) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 13 Feb 2026 13:09:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLWik5IiDQFo5c8DQXT84Zd9sU5zdU0WGzGCou1mnA/ztplCVw32bTRydSvyKlXRQBG8n20krOXnsE0qcHAksyVpqgCKDplkis75d6EMX5FzLyvxsVzTl/iSdM8mqgNFLORcRoLElpQbydpfikX9NIyn8VsyZ8e//3fEkLFccSvZWsfxarEGNxe8cwf67p7IpxKs0qpn48BttVnkvVx8fLcjttwIYWxoHVJo/1HBrs2Zi02HjdlayY+of+BlqxMPUrN2lAHRo3N5KfA0N6jqY9KFykqJ8c9n1ZvFPJ8Djlnn5XJ1PFavpWo6czXrwq2QysRiQMBILNvxIiW6KMsHiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6P0pbjgrrAslfE5DqDpEqQG/DKSL191hauMaYqv+cQ4=;
 b=aRZPIygn5uFB46N3sC4LhMu27Nh8Ci37i14762t1FmgXb7GmYuGDwIn43lmbeXjjVA2w+/A+1C10APOYNk8je09i4RaEElQDdwAt5G7+9az3E3Bl8nri9LoZSG4L/YVTP/rPMMGN0lyHKHx/9Dl8Y7a1XgLgJaIJABFANzuNank/HZUFZv7gP1At7bu4xfivfgccv6wncvVwxTPNFZcjhKtPToY1zYJ+luJ7ySzLwMvPykdU/rbcvqzRqZq1pQZ9cbJBupZ7m0VoCRqZvpeYfFlL2IomOPC180y+E1ZY5oKP4C5ML0EmDZ/xFm0AylMo26vvXA711zQsfMjfDnqd1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DM3PPF90FB92BE6.namprd11.prod.outlook.com (2603:10b6:f:fc00::f38)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 21:09:23 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 21:09:23 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 Saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>, "Zhang,
 Jianxun" <jianxun.zhang@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>,
 "Jadav, Raag" <raag.jadav@intel.com>, "Briano, Ivan" <ivan.briano@intel.com>, 
 "Auld, Matthew" <matthew.auld@intel.com>, "dafna.hirschfeld@intel.com"
 <dafna.hirschfeld@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Thread-Topic: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision per
 pagefault
Thread-Index: AQHcl4hZw/gyPn7d80mj4ByaC+vObrWBKUaAgAAAuUA=
Date: Fri, 13 Feb 2026 21:09:23 +0000
Message-ID: <CH0PR11MB54442B65730E87CBEA3CED5EE561A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20260206164731.8395-7-jonathan.cavitt@intel.com>
 <20260206164731.8395-9-jonathan.cavitt@intel.com>
 <aY+Rk0CKsKcg9RZv@lstrano-desk.jf.intel.com>
In-Reply-To: <aY+Rk0CKsKcg9RZv@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DM3PPF90FB92BE6:EE_
x-ms-office365-filtering-correlation-id: 29083ea6-be36-4912-0ef1-08de6b4429a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?8g3Z5YsYZB5WQ58chuuSFETQ6Y/skz40SHHeKvxU4cwFjUpoXi82u5k+6WD0?=
 =?us-ascii?Q?LLcnHezo5M2pv2zu/55QCJT0dfXiNLE55xPnhpvjV34BO5ivtWoCBWwya7Kq?=
 =?us-ascii?Q?ujd6hsG3gOzJfPUbn7O4igAQatw2RzWRkPM2gI1FuBHCM9i8npJXQFrydLot?=
 =?us-ascii?Q?4FdGC/lR+sq+iC9LhAI9LaiNBrXwWH3VLKyqa5TVn7lhwcqdWxwHu7lejrA2?=
 =?us-ascii?Q?Rb6lAqtiUEOBgVqDFZoCbj4lXxF/tDaYBQGD52pKR48duTkedlP3+xzySQeM?=
 =?us-ascii?Q?M/ncL8SX52lid9Q0oQkdMSsMoL2M1jdSlVdVvpDpw04lzZ6lDmC/lKczEYh8?=
 =?us-ascii?Q?2lHki69Os9SRKV6PrZ71HT1hBc2K1QGpTPULm0tiPNY/7wDLAYgd37Yrj+Nm?=
 =?us-ascii?Q?CFkVHN/b2nuAVE7rmSi67ZvAXYacrHu7YKGZlnuJWLheefZuEdwx55sCXb5O?=
 =?us-ascii?Q?cRVclgd6bfAYM3oid/arBRQKavYSO8c46j009J8/Q3mmbRntl9y68BegBIad?=
 =?us-ascii?Q?xu1E34SqvdiDEr4fuh89vfw9QoGRACzXhPE/f+tW/Sh27lmQW0JM1Zn79pkA?=
 =?us-ascii?Q?qrL85tPk/gEUyR4flvi9mtL+O3H3MOcysJTNAd+Cd1lUHFefy1rDp3fyDsZT?=
 =?us-ascii?Q?dH2DrzYPYllAfNF1Yb/0X37X7JsPpgd9euSQnoH4aeqtAmntAbnGx3cRxwGV?=
 =?us-ascii?Q?o9h3XKamVxpM5Ec11NRDogz199GQtXXhtNHm2tCHrpaLzGUXTD7bQuAahc6/?=
 =?us-ascii?Q?+YN8oYPBSV80vZmn9IC4FxoUOOA7gAda8v/qZRtN/jmkXw48j/Qq3U+oG1F4?=
 =?us-ascii?Q?yOrM4LUT9DQl9F3sF98/0k/dWnE4sxIzeJApNmmFtZfa2P53oSQws9ZFL3wh?=
 =?us-ascii?Q?rdre3vYNjp7OGeEedTyIQu9ny9VuDoRbInX0ia68qRQ1IzqDK9kwa3kFXqIK?=
 =?us-ascii?Q?bEBNXhk2HcwBJvJJLENnDqDsUJrJwId7TT6agA52OJyzrsQibB3QyfUMGvlm?=
 =?us-ascii?Q?1S7RkdydA5KwgPwgvWspgNNJFeFarhXAhGq6k+JW+ulfZSwGM8PJ7AO0Ih9w?=
 =?us-ascii?Q?wXEb6hXRFbYqKnJlSqU6A+XR7gENAxR/MnViumtQ7sI/fL5HRbyNea9Bd0QE?=
 =?us-ascii?Q?g6qUQ/zaFFFlLV/YUSHOZhb+nn3rjwXUic5LNIdq4OINX6DfoxI21Wz89puA?=
 =?us-ascii?Q?ariLjP8pdsH68Mz+JF4HyZbEz336MDcs3SQWf2e/a6Gj2lTN53QNEje5CVig?=
 =?us-ascii?Q?7PP2P/ViN/qpSKtB7tFbpn8pmEirhoznIx1ObuJnDa8czjIm7vy5wl81WAyP?=
 =?us-ascii?Q?oDmkiLIUxoTsxGZ3Ihq//UhO7JWOf9h0jSnu6fwDCr4wKAJ3i0G1T+z9Jozu?=
 =?us-ascii?Q?HA2v7IplXDNS5Ql8UVLKlYeYRDtuOAD2/Ad2VgIDNJB4W2XEf4YnJisBvYN4?=
 =?us-ascii?Q?poWr+2EAW3i8b8kcezWxEKOpivlX/DclloSDbQsevqg9+SW88eGWjBysADXR?=
 =?us-ascii?Q?DA0IMLzrud4YTJ67jeAkfxcAfMsv7H0nJR0kUxmRwNhcW8cmm85UZaRvhsL4?=
 =?us-ascii?Q?N38huvK4JQScPjcYzvucuAgrhSUEN5Sd4bmK7BSV?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?EhEIEDJM5SgDisdip/2Ssras+0fGejjTgeKu9NqBWUV8cQPHU5DdsjTQN25z?=
 =?us-ascii?Q?V3a4AzDUen8tNObrZ6p0ZT1jCdkq4bB5EehV+BG++LYkFwCGh+jQPmoKgGNk?=
 =?us-ascii?Q?PsRFApy30wWThlI55qmv/3pJxw8i8JmdlGNdANQPcqpKK+TEUCD51agEv55K?=
 =?us-ascii?Q?4Ae5Mt1GcRsUkBBFsz2uc3F+hJ2roXFpKQyQkKDQotEX7H8tZk2fEXRlzHZE?=
 =?us-ascii?Q?DncrKz0yv5Y9Db3l0rEVC28+bhFAZ1Tc2XXJsgBmq1Aqtyc2lx1oZcz1/5wj?=
 =?us-ascii?Q?lyVLtoVZLfFuFS8PoQdAzOFF10k31C/S3u40u94mYJn1vO60Ofjl/mXo15xX?=
 =?us-ascii?Q?NWQub3C6dCsf9GTTOcRj554bqk/NIh+Bp+1EonW0xPQ0eBiHR08EfEIXLyv+?=
 =?us-ascii?Q?zqP//po0rqYIosuoAphAMMLlPa1iHtdFJO+5ZiwHqJknYMTncRPy9sDr06rj?=
 =?us-ascii?Q?GpyhLp/XNPPoiU91U6276xE0ASIuWlNFRU11BfMvnLzFcYcx0A2+2I6/2D6O?=
 =?us-ascii?Q?3HMksFVYAQB1QxqDc+rtAqerbE6eutpfd/Z6ZExfS/BwohARuD3n9hNM6zWH?=
 =?us-ascii?Q?1l8MnNkGWfevuH7+f4r/TOiTpan+K10FZHDg9EnHobmJcXLjDnSFbJZKQ1ZU?=
 =?us-ascii?Q?vMHZGC0KuYS+i+Pn9kGlKZXft0t3rpeuMQfhFXoA16g+7UIeIpYTdV4+2GUT?=
 =?us-ascii?Q?WXRsVH34a1KEWHjlbJg8Jn4A40nMxxFdIw/PiGXmz5WO/h7b9nk0AwNlIpUF?=
 =?us-ascii?Q?ZY7eirfCc1NAuO0AFAm6skVY3PDWSJKe9QtgydBkHDKUpyJk45XiplG9D7mX?=
 =?us-ascii?Q?E+Dbe78XXlffNfpJbO23LM4P0AHQ0BN0F3kGKUIFcCaROUcaU5mO6GPzXHmE?=
 =?us-ascii?Q?3Wks457T9ZCZTbNYvOH220pI33YfWw1O2I5y4+zKfZYi1rJCr9u2HA9e8RCM?=
 =?us-ascii?Q?yQYZZADgCl56MZ1XbJEup116AVVJuHDTcPjHK9jKEa9J7SoiNzdt1zzux98u?=
 =?us-ascii?Q?vdVDpO9oYVPZUYjD1ei5Xf3lcBvSNBI60GXFaaD1rr29m6cEbM1SDcFMPC0k?=
 =?us-ascii?Q?OmnAU1hxP8N+JOf/7hW1Xi/+mxcTmlLfy3HV+jOURh/nwxFStuuRIi16hGeA?=
 =?us-ascii?Q?M96MPlTIMUeP6AwJVLg/ussJuVE8bTSRwtR8WLfj7EQYVDPLQUZOb8WAsJPS?=
 =?us-ascii?Q?/C3ynWViBJy4YK5X+epsj1u7frwxMJwjSaCwmicTLrhdyO2zxyeU4VLMnBes?=
 =?us-ascii?Q?njm86408X+ZVZuY7+v25+VDlKoJyPcO/G/ILu44Cf2CgnhEYtoHCmvE9DD7I?=
 =?us-ascii?Q?VSS/GzfQFgzti08QaH7dQpm0oEZ7UJW0aFzGns6lUGvCi/QKJkUYUtdM7Mta?=
 =?us-ascii?Q?RVeARdRf8CDE1JTVQFjI8fD1Ng8AO9EvOnmeOIV3AiHUNw19sIND8GTlmLdv?=
 =?us-ascii?Q?dvBFGr1fFKuFJf0xuiNin6dqDdjzDK6qnVEOp+SRHbpAhbztJ5Z2PqgHEazP?=
 =?us-ascii?Q?f2bUhe8rCDUWMjgBwUbL/NhpMgFNgqxmY3PtLOYqXdYgKtEOkYM0W0dI/xdX?=
 =?us-ascii?Q?SdEYyjkhu723cAIclH4a5RzM5GZ7uuaiofwY8PrI3selLWS9o+2VGDnhXvi3?=
 =?us-ascii?Q?OB6c3VO4Skcp6ZKWUWu3E3e/8HJ5V0xug4WaOqeTwFZMpGZV8AuUxycrjCcL?=
 =?us-ascii?Q?EPNiRfC2U7vluJXuOB4yMXXR7HrUxtgkQMXGHOW7L3APJ0LmYhkSLIkkknOV?=
 =?us-ascii?Q?KrOuVqfCaOv6cH6zvgj5SfeNGNfA1i2iKHxptZKKjKneU3W47uASlylbGWB4?=
x-ms-exchange-antispam-messagedata-1: Dza44S/JD8FxGw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29083ea6-be36-4912-0ef1-08de6b4429a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2026 21:09:23.3499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2BxxTiFCt6S2MLv9uo7M035KQvPliNO7BWnoFF7D0OkItrWpZv8l8+vohRfTwf8gEr/eGkzKdhGt2p2EAw2Z//Ra1yDUjvGS8iq6sa4VhY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF90FB92BE6
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
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,patchwork.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonathan.cavitt@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: 777D11398F8
X-Rspamd-Action: no action

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Friday, February 13, 2026 1:03 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, Saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; joonas.lahtinen@linux.intel.com; Zhang=
, Jianxun <jianxun.zhang@intel.com>; Lin, Shuicheng <shuicheng.lin@intel.co=
m>; dri-devel@lists.freedesktop.org; Wajdeczko, Michal <Michal.Wajdeczko@in=
tel.com>; Mrozek, Michal <michal.mrozek@intel.com>; Jadav, Raag <raag.jadav=
@intel.com>; Briano, Ivan <ivan.briano@intel.com>; Auld, Matthew <matthew.a=
uld@intel.com>; dafna.hirschfeld@intel.com
Subject: Re: [PATCH v33 2/5] drm/xe/xe_pagefault: Track address precision p=
er pagefault
>=20
> On Fri, Feb 06, 2026 at 04:47:34PM +0000, Jonathan Cavitt wrote:
> > Add an address precision field to the pagefault consumer.  This capture=
s
> > the fact that pagefaults are reported on a SZ_4K granularity by GuC,
> > meaning the reported pagefault address is only the address of the page
> > where the faulting access occurred rather than the exact address of the
> > fault.  This field is necessary in case more reporters are added where
> > the granularity can be different.
> >=20
> > v2:
> > - Keep u8 values together (Matt Brost)
> >=20
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>=20
> See [1]. I'm going to ask that a u64 remain completely reserved in
> xe_pagefault, as I plan to use this in the fault-storm mitigation
> algorithm, which requires enough space for a pointer in xe_pagefault
> (u64-sized).

I'm not certain about the logistics of adding data to the
struct without pulling from the reserve space, but I'll see what's
doable given the address precision requirement...
-Jonathan Cavitt

>=20
> Matt=20
>=20
> [1] https://patchwork.freedesktop.org/patch/704578/?series=3D161560&rev=
=3D1
>=20
> > ---
> >  drivers/gpu/drm/xe/xe_guc_pagefault.c   | 1 +
> >  drivers/gpu/drm/xe/xe_pagefault.c       | 2 ++
> >  drivers/gpu/drm/xe/xe_pagefault_types.h | 8 +++++++-
> >  3 files changed, 10 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe=
/xe_guc_pagefault.c
> > index 719a18187a31..79b790fedda8 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -74,6 +74,7 @@ int xe_guc_pagefault_handler(struct xe_guc *guc, u32 =
*msg, u32 len)
> >  				      << PFD_VIRTUAL_ADDR_HI_SHIFT) |
> >  		(FIELD_GET(PFD_VIRTUAL_ADDR_LO, msg[2]) <<
> >  		 PFD_VIRTUAL_ADDR_LO_SHIFT);
> > +	pf.consumer.addr_precision =3D 12;
> >  	pf.consumer.asid =3D FIELD_GET(PFD_ASID, msg[1]);
> >  	pf.consumer.access_type =3D FIELD_GET(PFD_ACCESS_TYPE, msg[2]);
> >  	pf.consumer.fault_type =3D FIELD_GET(PFD_FAULT_TYPE, msg[2]);
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_=
pagefault.c
> > index 922a4f3344b1..a24de27eb303 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> > @@ -231,6 +231,7 @@ static void xe_pagefault_print(struct xe_pagefault =
*pf)
> >  {
> >  	xe_gt_info(pf->gt, "\n\tASID: %d\n"
> >  		   "\tFaulted Address: 0x%08x%08x\n"
> > +		   "\tAddress Precision: %lu\n"
> >  		   "\tFaultType: %d\n"
> >  		   "\tAccessType: %d\n"
> >  		   "\tFaultLevel: %d\n"
> > @@ -239,6 +240,7 @@ static void xe_pagefault_print(struct xe_pagefault =
*pf)
> >  		   pf->consumer.asid,
> >  		   upper_32_bits(pf->consumer.page_addr),
> >  		   lower_32_bits(pf->consumer.page_addr),
> > +		   BIT(pf->consumer.addr_precision),
> >  		   pf->consumer.fault_type,
> >  		   pf->consumer.access_type,
> >  		   pf->consumer.fault_level,
> > diff --git a/drivers/gpu/drm/xe/xe_pagefault_types.h b/drivers/gpu/drm/=
xe/xe_pagefault_types.h
> > index d3b516407d60..333db12713ef 100644
> > --- a/drivers/gpu/drm/xe/xe_pagefault_types.h
> > +++ b/drivers/gpu/drm/xe/xe_pagefault_types.h
> > @@ -67,6 +67,12 @@ struct xe_pagefault {
> >  		u64 page_addr;
> >  		/** @consumer.asid: address space ID */
> >  		u32 asid;
> > +		/**
> > +		 * @consumer.addr_precision: precision of the page fault address.
> > +		 * u8 rather than u32 to keep compact - actual precision is
> > +		 * BIT(consumer.addr_precision).  Currently only 12
> > +		 */
> > +		u8 addr_precision;
> >  		/**
> >  		 * @consumer.access_type: access type, u8 rather than enum to
> >  		 * keep size compact
> > @@ -85,7 +91,7 @@ struct xe_pagefault {
> >  		/** @consumer.engine_instance: engine instance */
> >  		u8 engine_instance;
> >  		/** consumer.reserved: reserved bits for future expansion */
> > -		u8 reserved[7];
> > +		u8 reserved[6];
> >  	} consumer;
> >  	/**
> >  	 * @producer: State for the producer (i.e., HW/FW interface). Populat=
ed
> > --=20
> > 2.43.0
> >=20
>=20
