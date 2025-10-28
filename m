Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B65C137CA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 09:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98A310E5A9;
	Tue, 28 Oct 2025 08:16:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/wiHxGv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1CCA10E032;
 Tue, 28 Oct 2025 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761639414; x=1793175414;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bIQzvC/OQeBL1GtmQ2nO+R9mgKSPlG+SpqB2d+aD/DE=;
 b=i/wiHxGvmdlUJpdkBTnvOENe18odKBRyuIEXRTLwzpyhigwEQV3+9jIV
 vHDFZAyI5JPywn2ab80xsnYUeqHtVDsM3N0Ww98D5neGDQ3Q5SRC78A+t
 ShAz5WX6GK4cN2kbKbkMOMBgvbXfSWxy3+aRcSP9ltTPCa2ab63JjX590
 mM+XRFvb4SgSsMUmmK+if29pWxeTh6tWek8OiFM05W55wFyIdaboJbush
 GAl5MVBx6mQd4YPnTxEZBf24B+LhZj/E8ZPTeBJDHE9iclAp62U/i2310
 7GyBdQ9FcSGX2lCDdB9xRLUYB+tybY1P0HroLN0FCSHufu7ddAkymoG9S A==;
X-CSE-ConnectionGUID: XLIszpV3Rfa0ei4jdqGipw==
X-CSE-MsgGUID: eU0BeyBqT+SeO0u9UD9EtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67375610"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="67375610"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:16:53 -0700
X-CSE-ConnectionGUID: XkQgI6xyRtWrgMXpCT5nGQ==
X-CSE-MsgGUID: 5YjLeY8mSC+/GTx2M4oXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="189593146"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 01:16:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:16:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 01:16:51 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.39) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 01:16:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyCORNAE/my9XJSGYNcB6EMO1hQlCqzW5OVmKKAIn7770DbcqUZ9DYVNOc+h7ebo/GhU3ljoOFkyMJAZirp2MgBFJ8gaULLfsaX5mL1zRyAiZf7L5TQ78JbW5+lZ7oh3f+b2aS7A8IIbMXpyBzu7NJeosxkm2q6sB9xyXzwkBZH+UZyfV8bz9N+tzVY8SzssPLxdZzMFXNPvM4v3jdnfvY/FQNo/6oGxfxYvdKds2sbxBx/2+nHvlTukdMuCOZAAfQVQSmGQpgFHpMBw/8n2Sf1+feQ0GVQHac4udQoh9LJTs0kuhS/dl2evPa7aXWwjQQ9ZsZv6VcZpx/MD6GwQlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJvc7fCz0gIZ5mpUUM+bzLl5zKSCWN8qiV66vOGg/2E=;
 b=G941QluC4HESSQRj4EWYgYNitKtUzAf9Ff9SmLfukFVhngYRTe6hoCa4jZ/WIiOjajf8KW1n2I/2UlFTcDc8wTkl+K47RFV6svkzpsgIPtUc3V1DYhe068htI68/3AqJ5mf8fz7TnvVFqzGsMcCyi3wmS/4zgsB+VIa2Ui4NeKjCGa11llQgwoQIlxkF0h8qHT6thuLeZFLxBhe/4EzFaVzlRZj1kziyDA7LzZ0nb4EK0ZOH4/ugolqhXztc3iCG3gEvoR5LaLvseEdbO5v2HrpKfhziVVcGznUQqJEwoX47C/FB/HunXpZ/zJyJtyGnP4mIvdf3Zmi2Wqju1ITheA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by DS0PR11MB8136.namprd11.prod.outlook.com
 (2603:10b6:8:159::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Tue, 28 Oct
 2025 08:16:49 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%4]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 08:16:49 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Shankar, Uma"
 <uma.shankar@intel.com>
Subject: RE: [v5 16/24] drm/i915/color: Add plane CTM callback for D13 and
 beyond
Thread-Topic: [v5 16/24] drm/i915/color: Add plane CTM callback for D13 and
 beyond
Thread-Index: AQHb6zD3tumfrE6fgUmah1+IrW966rTX7+SA
Date: Tue, 28 Oct 2025 08:16:49 +0000
Message-ID: <DM3PPF208195D8D9984BB3FD920ACDF0A5FE3FDA@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-17-uma.shankar@intel.com>
In-Reply-To: <20250702091936.3004854-17-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|DS0PR11MB8136:EE_
x-ms-office365-filtering-correlation-id: 9ae1e3b8-cec7-49a6-ac74-08de15fa582a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ro7xJGZNHXei5sdJB7SqDPXWhvcRmtmGseQGUhpKD0r6C/hpp6+GESvKwbiC?=
 =?us-ascii?Q?7RT3o+CyAKl3Qjc6NZXU3A6u6rUeiXPRrrloxCflnXnHHa0k5xiKrt2bOOAm?=
 =?us-ascii?Q?ClWJb3zUjbeX6/kZCjyzJDqx7ys3HuP6UQatMe54TmX6/JULtZLrR2jKSRO5?=
 =?us-ascii?Q?NM88ujOrsI9PWPLiYDDZMSSuH9hTQe+kevTOIWuRdIw0EbD+7szWTbNDH6M4?=
 =?us-ascii?Q?FmzK+ATEBvOA/GH4BuJQQKdr8AqS5/34vQXqfU8OUc7C4CXR38mBRarPlNc1?=
 =?us-ascii?Q?7445RvHZ6FqXgDlU6gZ+xn2wBG9FzleQxcksN1ncLutDgb4TXunhJNwLFi41?=
 =?us-ascii?Q?UFDCY5vRE3a4bm7bay1qQMBZhv5u/eTW9gPxAnFwzUK0D8C1TWswjlcBgHtv?=
 =?us-ascii?Q?m9s+UirSC1F1hbcVDGDF4WBntpP66Js4xUWKp/lkzYz33/g3Y51GadqpUhhv?=
 =?us-ascii?Q?0AMR6Kyb5+FfqQdSinbT7dX8zgpK95AUq0Nz114FuvDbsJPstXwaKIK6RQFz?=
 =?us-ascii?Q?ZkasNVlUoVyQVTVWiDAcS+8u7waSBjYIICe3eMU5MEjqvTIQx73xeCitERnz?=
 =?us-ascii?Q?bPOJMJcBVABM9gwqJVHHQAydyynEcp3Pfh3h1gQu6LQe8PqHqC5X52Zo9ooy?=
 =?us-ascii?Q?W4Ri+zJW6BIXzFbqZ1mIQe5/Go4TXj3gbc50RC9XRVI1Qdvv4GYgej/3Pc4B?=
 =?us-ascii?Q?aLwufP5bAidetljFIXCFeOl0lzavS9uKyrZZb+EvP2H4tF0TmoQXSMP3acd5?=
 =?us-ascii?Q?msQtGMTWe9HoyBxIyIAv426OolYMTbSJlRvs+Tg3RP1DZie50yL4iK1s3Qa4?=
 =?us-ascii?Q?PAd4CWg8rN6s0yEttGnKktUJOnauaT7t4UfG92BiNNx274oAudvVQWg4J47h?=
 =?us-ascii?Q?W8lfV98YN+UBirII0QjSpFE3NZd8FePJKYJpE9eoCvL9CJ9bPTT6e9ek9Rla?=
 =?us-ascii?Q?DUxAD3Z920qSho6CmT4La2lxfff8ZF7hXk9ojSZlSUT23M6RbFRCB1wBekbs?=
 =?us-ascii?Q?Y0+Im+yxbOqKC8ytpNWvrlnIUXZKJ0dqjpLmstA8V39OMIbWMrksn5Qg//FE?=
 =?us-ascii?Q?wtdtRxOxrqosHqP8BdauCoNJqd7xJFQCXhJZRc85Dlsheu/iw5gLDZ9VNT7U?=
 =?us-ascii?Q?cCN/MJuCMOQrPzRppEJWIPFMIJ3Cv4QKm5lD1QIR589GKz5fan/ltg3dsf81?=
 =?us-ascii?Q?ygJmBW2v1NxFrgiqICFE4ErOg6LHKo2PJl/ZeCJylTBksJYgS7HORSCnyS32?=
 =?us-ascii?Q?iLkX5Jkc42NfMHEny0IznENi7FJpQSWNJnU8ep4n+OyCZnoxkQzPs9DbbyGW?=
 =?us-ascii?Q?yg4CN6KbjsVG2r5MJRtWQQVyxJM81uEaO2vTjJNSkyo6OoklNJ9ra6pZV1kA?=
 =?us-ascii?Q?Gpi3540DLPADr8OtMZ3xH1U+0qcFpJsW04yFXlfJM9P+gmFfx6RAvoefY91m?=
 =?us-ascii?Q?yBYWW2egvI84IOaJmOPJ40p1e6KAm1W0by/OgS3oMa220+m8EK/V20+J5sZ2?=
 =?us-ascii?Q?St+zAII9zwF6Uehg/nVB8luel0Dkt5tUotFJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZMCtSrNgBvrf2z+1CKma76MzEd1NsxJOgg4y/tPI24L/MlfChf2aGH32bVK7?=
 =?us-ascii?Q?cpszapFvL79D6j2ezKaxc3+AkyFSkg3CbUi5r5fuTf3N1Bp2Y+nAhU8ZOw4v?=
 =?us-ascii?Q?EKyfT6J2sv6js/B2YF02WiklLTUVFRGOmYnaqqII7ESAbo+J+f23qEa2rPog?=
 =?us-ascii?Q?IIth68ArP8Rt786alQ9y53LPwilrBAhW2BUuXZl7cFnKxZqlCBFCGWYMtifB?=
 =?us-ascii?Q?SN+LY5Dgw5YQVCtynKPOUQ4H9Uu4PwhQT74xIOvFfLWy0bRWBX6qS6MmDLtH?=
 =?us-ascii?Q?ueHarqpxFW5FKDMH5sC7FkHmXR5lu/ciWCZA0HA86O6e+523+8njBdU/N/Ug?=
 =?us-ascii?Q?VGgc2s2AS4thp2pf9R27H8wWOD3+MPQx2l4QOM5N1uAG2rInkwnlIomrH3on?=
 =?us-ascii?Q?gJm91MDzVPz6991ljNOH2WiBwQsza5Flsj9ScIGQvNnDVs00DmVhyrZFj0cg?=
 =?us-ascii?Q?GZSETSknyyzMYvxct6M662UBJzi5jii2kPQ68p3i+vM1e6R6qNCpScV9ZzhT?=
 =?us-ascii?Q?iTcw580MP2ImkT4AKNsYE9qxjNPA74OUOUqz4GV7rjHQDQ1UJK3OLoiTsyzJ?=
 =?us-ascii?Q?SNZrd/qKsX019vA2q7nd6xDklG/eq8jXTK9+2qAHfyfffpEzO2EUEoDk+Z4J?=
 =?us-ascii?Q?+K51Fs3csdWwZj+deu2WR9PunfGGd+VbKuotQ38ymtjraT8Og0XJqyuH33Ty?=
 =?us-ascii?Q?qVpq3GFAIkDH2nGEl+msgANwsljWOmJuNFgbhuLXJ2RK6OeypK5XZZPpzX5z?=
 =?us-ascii?Q?X1Eme8kOtR2VQDWe1efUp9wl+Vmbze1+I8cVLV5WQ6K7bLUxpQuEOcgxisXy?=
 =?us-ascii?Q?kyFwvYapYcUGcqv8TkIKGmH6ZO+zz+IxyysCtFF+L9mdNNvu0VOMfPwf5D0T?=
 =?us-ascii?Q?OOCz4W/AJjvtINHiy4RS168ki9OR+0E+CIR42txlmeLRYkgUo2fK36jGQZYr?=
 =?us-ascii?Q?tWCDFqAErKwSPsR0XY2/2+27Asc8mzN3uT7oPM2hY1GtWBw5D3i0TM2oJNh+?=
 =?us-ascii?Q?UO5QdDZlCo8QVFVvFHM8X4umz3WnxF/i68oYL59aST1lqqS2MxUDfKbz8Wc+?=
 =?us-ascii?Q?16Wy8x7c6mvtfcPomw54Flx9wf0pljOeLvocN+HqY2jt8gzsixuQJ2Mh3szb?=
 =?us-ascii?Q?cMu7GAoG/0rtZ8F0iFaR65qEtACIMVn0D1DVOgZ/mNzI243N6HaoouMCb06h?=
 =?us-ascii?Q?5DoGCKx3j78mO8qd74Qljf/Q0oNqLX+ZgVPCquEAbeold7F8B1ySnpzQrPt8?=
 =?us-ascii?Q?bVJZgqA4P/W232hYhd4DxJzMYPMwxN268J7B434txDl9x8b/hQ7oaMvIm3Y4?=
 =?us-ascii?Q?qLU6v6W6RjSRnrOAcChrUUPPafBE/tZ9K8VEb2h8xvv6j/SdTFvdbL10w9Eh?=
 =?us-ascii?Q?7yEKJ0oSCaqy6ObEfJ67hNYrIEZB1PT8qZk7OynFSIqJVldy8lk1KekXSDpS?=
 =?us-ascii?Q?FKO+mQiCTgRUijR9FXTk38GF0IiH/z+idBtZmtkNC/pc/l70w/0rWpdzkSZ4?=
 =?us-ascii?Q?Od8/IAckvLqJp9dvCUk+QmpRyZmDZJMtla28++Jz2QBWpWDN4tma+k0RiZzp?=
 =?us-ascii?Q?iER1mHvRn2QlLZuTKEz0lsXn1VrcqqJaZ0c3F07r?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ae1e3b8-cec7-49a6-ac74-08de15fa582a
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 08:16:49.7997 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgxBbYSbzLDG/gfYhGFteXJcmrDHMLMqbruvjRexSzscYuCe882ooSLhSRyQWqXuUElM1xn4OnHcrOceLrdTNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8136
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



> -----Original Message-----
> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Um=
a
> Shankar
> Sent: Wednesday, July 2, 2025 2:49 PM
> To: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; dri-
> devel@lists.freedesktop.org
> Cc: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>;
> ville.syrjala@linux.intel.com; pekka.paalanen@collabora.com;
> contact@emersion.fr; harry.wentland@amd.com; mwen@igalia.com;
> jadahl@redhat.com; sebastian.wick@redhat.com;
> shashank.sharma@amd.com; Sharma, Swati2 <swati2.sharma@intel.com>;
> alex.hung@amd.com; Shankar, Uma <uma.shankar@intel.com>
> Subject: [v5 16/24] drm/i915/color: Add plane CTM callback for D13 and
> beyond
>=20
> Add callback for setting CTM block in platforms D13 and beyond
>=20
> v2:
> - Add dsb support
> - Pass plane_state as we are now doing a uapi to hw state copy
> - Add support for 3x4 matrix
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 96 ++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index dcf7cfa722ef..25b992939e42 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -3846,6 +3846,101 @@ static void icl_read_luts(struct intel_crtc_state
> *crtc_state)
>  	}
>  }
>=20
> +static void
> +xelpd_load_plane_csc_matrix(struct intel_dsb *dsb,
> +			    const struct intel_plane_state *plane_state) {
> +	struct intel_display *display =3D to_intel_display(plane_state);
> +	const struct drm_plane_state *state =3D &plane_state->uapi;
> +	enum pipe pipe =3D to_intel_plane(state->plane)->pipe;
> +	enum plane_id plane =3D to_intel_plane(state->plane)->id;
> +	const struct drm_property_blob *blob =3D plane_state->hw.ctm;
> +	struct drm_color_ctm_3x4 *ctm;
> +	const u64 *input;
> +	u16 coeffs[9] =3D {};
> +	int i, j;
> +
> +	if (!icl_is_hdr_plane(display, plane) || !blob)
> +		return;
> +
> +	ctm =3D blob->data;
> +	input =3D ctm->matrix;
> +
> +	/*
> +	 * Convert fixed point S31.32 input to format supported by the
> +	 * hardware.
> +	 */
> +	for (i =3D 0, j =3D 0; i < ARRAY_SIZE(coeffs); i++) {
> +		u64 abs_coeff =3D ((1ULL << 63) - 1) & input[j];
> +
> +		/*
> +		 * Clamp input value to min/max supported by
> +		 * hardware.
> +		 */
> +		abs_coeff =3D clamp_val(abs_coeff, 0, CTM_COEFF_4_0 - 1);
> +
> +		/* sign bit */
> +		if (CTM_COEFF_NEGATIVE(input[j]))
> +			coeffs[i] |=3D 1 << 15;
> +
> +		if (abs_coeff < CTM_COEFF_0_125)
> +			coeffs[i] |=3D (3 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 12);
> +		else if (abs_coeff < CTM_COEFF_0_25)
> +			coeffs[i] |=3D (2 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 11);
> +		else if (abs_coeff < CTM_COEFF_0_5)
> +			coeffs[i] |=3D (1 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 10);
> +		else if (abs_coeff < CTM_COEFF_1_0)
> +			coeffs[i] |=3D ILK_CSC_COEFF_FP(abs_coeff, 9);
> +		else if (abs_coeff < CTM_COEFF_2_0)
> +			coeffs[i] |=3D (7 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 8);
> +		else
> +			coeffs[i] |=3D (6 << 12) |
> +				      ILK_CSC_COEFF_FP(abs_coeff, 7);
> +
> +		/* Skip postoffs */
> +		if (!((j + 2) % 4))
> +			j +=3D 2;
> +		else
> +			j++;
> +	}
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 0),
> +			   coeffs[0] << 16 | coeffs[1]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 1),
> +			   coeffs[2] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 2),
> +			   coeffs[3] << 16 | coeffs[4]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 3),
> +			   coeffs[5] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 4),
> +			   coeffs[6] << 16 | coeffs[7]);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_COEFF(pipe, plane, 5),
> +			   coeffs[8] << 16);
> +
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 0),
> 0);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 1),
> 0);
> +	intel_de_write_dsb(display, dsb, PLANE_CSC_PREOFF(pipe, plane, 2),
> 0);
> +
> +	/*
> +	 * Conversion from S31.32 to S0.12. BIT[12] is the signed but

You mean bit*

Regards,
Suraj Kandpal

> +	 */
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 0),
> +			   ctm_to_twos_complement(input[3], 0, 12));
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 1),
> +			   ctm_to_twos_complement(input[7], 0, 12));
> +	intel_de_write_dsb(display, dsb,
> +			   PLANE_CSC_POSTOFF(pipe, plane, 2),
> +			   ctm_to_twos_complement(input[11], 0, 12)); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -3904,6 +3999,7
> @@ static const struct intel_color_funcs xelpd_color_funcs =3D {
>  	.lut_equal =3D icl_lut_equal,
>  	.read_csc =3D icl_read_csc,
>  	.get_config =3D skl_get_config,
> +	.load_plane_csc_matrix =3D xelpd_load_plane_csc_matrix,
>  };
>=20
>  static const struct intel_color_funcs icl_color_funcs =3D {
> --
> 2.42.0

