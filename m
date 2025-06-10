Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279BEAD2F87
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581F310E48D;
	Tue, 10 Jun 2025 08:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T47CttIl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 676A210E48D;
 Tue, 10 Jun 2025 08:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749542997; x=1781078997;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f/CKjJBx5n7h7NEhZmyc84X/TrhuGKCMsrs1G+vmuDE=;
 b=T47CttIlgYcjaV4xlF1I7mGUx+gbfmG6X9krdFK3nJANTzx6TVv0e1wa
 KItxY9LX4Exyp0yecgvTOsjIZaN5XkWR5Sj7374p028EulnEquvjFj94m
 kIWLf0um05YQXFnl+hIjE9x6FK4guS1WLb1WpXHIXDdo9I1fKnylcVk+S
 TSx5Qz8NxaTjKhmBVA5e0LEB/VdxWT73q2TA4MtgaFh2J1vE7jggwIgpf
 BwJzKv+8TilenHGp8z76SY99GTgoVreS0PqgwzzyTWr48iRFxBGaU5aSp
 K6zLD8QwsWufIH9LnbKku2CpFbB0Bc5fJHD9NTpzqvdJ3NuNWBFDQGwSf g==;
X-CSE-ConnectionGUID: z0gx/dARRZuZu8/ZKFTEwg==
X-CSE-MsgGUID: JtLyZKugSf+M48gfxXnz6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55434892"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="55434892"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:09:55 -0700
X-CSE-ConnectionGUID: AsbFS78BTWK12DZNfrHPNQ==
X-CSE-MsgGUID: FLnMRkjvTpqpUXy9E7Nqsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="150599447"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 01:09:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:09:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 01:09:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.87) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 01:09:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zSHINC/VWFLuE399JQEU9zZkfJRc4o6Z0ea2oSCetgsCZsJ6lGj/EokX1G3rZbu1fQ8EdUxFZZzdY7fKP8IAVuodsKHXb1lDvP70Y6DJjSnNFq6UND++7Xdo+MGK6djjbKvK+SUpZ8+0gD1KD0Tovghn2Dav6cAMuunyW2f4GDglw9APIrsna1hgFs5ImovV4pdLhojLvvUsIjy1YSAFk6ysayPGRuDtmu9y3276DqgTG/OxWxbDd3gAoMvd6cKGozJxrWoEFmD7r2jIPfkQ1HWI51O6CLpqVGSq+J0MOZhAdSLVGOv/gaWhBtjAGutRI+q2oICJIF38y0vSr7uPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L4ePvxEuMW4cEJicSgsahxZDHXKOLiIo0xJ2NQcDxwc=;
 b=PJMLSCmRC4PTV7hR/v8mg1bCEtf7CaRkN/V0AY6I4ROREDnf5BQiC3k3AECtgchSV6PHb6g7fCNJL8ByPmiYi/raURPI+wfG4YhvdOu2bHPzjOuDpAusAZLJ1ew4EDwEpprJrj9lnDHS+ZiVzlcy5ikE/SNUevWYc60Djc7ozguh0QEGxX7PzOFYMQOPJJeWb0+2rtM2qbYfZjXLAtGnIlTvuTVx6QRa0kE2sN4U3fkSHILjKxJ8VldOhFQve0XNSrpZ3VLTIf/7GHPFpayZ0vJo0ZP07pYz3iR3rDGdMpyVHAdGUCZUnvKbsK0BqgWtWLxSxrjf12qx6OzhCgl2Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB7300.namprd11.prod.outlook.com (2603:10b6:610:150::21)
 by SA1PR11MB5947.namprd11.prod.outlook.com (2603:10b6:806:23b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Tue, 10 Jun
 2025 08:09:19 +0000
Received: from CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d]) by CH3PR11MB7300.namprd11.prod.outlook.com
 ([fe80::cfdc:6323:1353:350d%4]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 08:09:19 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Lee, Shawn C" <shawn.c.lee@intel.com>, "Yang,
 Simon1" <simon1.yang@intel.com>, Doug Anderson <dianders@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH 2/4] drm/i915/panel: add panel register/unregister
Thread-Topic: [PATCH 2/4] drm/i915/panel: add panel register/unregister
Thread-Index: AQHb1sJelAWfo27M4U2CnANiRwqbRbP8DjxQ
Date: Tue, 10 Jun 2025 08:09:19 +0000
Message-ID: <CH3PR11MB7300BA6615F69441C62DCB1FBA6AA@CH3PR11MB7300.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH3PR11MB7300:EE_|SA1PR11MB5947:EE_
x-ms-office365-filtering-correlation-id: 89966652-b031-4f3b-a8ea-08dda7f61a04
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?B6YKaaw5hgpCvTYFqWelslBIq+iomJBD5dCZc2+nFALPnXwRC6ePDWd4Mwk3?=
 =?us-ascii?Q?ca0UtYTgaO5w4t60kpIX+nQjn6zWHXZDW+4aRwa6DSbVhHR6Q6L4FMZmyVHt?=
 =?us-ascii?Q?v125kXrjDQxbrwSMhxNOiH/xWSk4AFluxkwJDUuwQ3Ro/MQMWjXuOkfjb4jj?=
 =?us-ascii?Q?r9fYmdOMCHihxfc/9YB/wDxg+8pV61fGhw2dTiJwCGVk5LrMujRcdS0zkeaf?=
 =?us-ascii?Q?9YXxNeYoDqRXkXgzPfn1cUmJYZzyTWHchGZ4yG9CByuQTIvhGlLsNiQpNanI?=
 =?us-ascii?Q?U4IeOe/j4YXkuJg6xIhekDCtYegSoLmFNd6fF3SczenauePG92qyPNaSH5jW?=
 =?us-ascii?Q?kSobWaBdQMRVVRiqAxom4fDQM77TdlCBxv0e4RRWHymDWfg4hpjnbV4HXBWz?=
 =?us-ascii?Q?1qLc5f6BwkiQkk+MKyuDH26BdeI1rBX4dl2PVy3ahGiCF87KsRLul/TZxJnd?=
 =?us-ascii?Q?jkWzC8h3y1mtJifhv79RniklbRa60+HWeFaxIzW/LhaHU3fzchIAXp9M76jV?=
 =?us-ascii?Q?RXLQrG+j/0vB6AFBW9SslaDPOBc8Z5LMlDzXR+OOm+A5xpa6sAsnsMVfngKq?=
 =?us-ascii?Q?Cih102Nv2uRdOdr6rcvsVrNl5ClloMLVkO3BI0qzRXpU/JgSU/6cIcq3cieB?=
 =?us-ascii?Q?iuSjqnWyBfiheOMDPmILwc6PMO30coQoyRK0TinMRINUL+zkkt8ZbNKhDC1p?=
 =?us-ascii?Q?daMGpNW6MIsH4fmhn7wTE8aqbwZsKxJYo7RzgnuYsAeoaMAAt3t2+GzNyYTY?=
 =?us-ascii?Q?Ug8lbTACCyENnivHaM4XhmZNKEDOF0u8m06tmXG95OkDWGK+Q4rv1QKoNRza?=
 =?us-ascii?Q?HANXhv1ffMAsVirLUIfDbX2/23Wk1EGdmpNRc+4oceSZWavHRQtW4Zi0Xudp?=
 =?us-ascii?Q?IyQO2E5sUM8OqD6uPoIsk5pTqYFXy+tVFcfDD8LwDBoJbMJtbnsV8+BauoQS?=
 =?us-ascii?Q?U/5/AGY/qSNnl3ewbIRsFgOmGFvWAtd39xXH7lw41akWretSRQEC8N5b56eh?=
 =?us-ascii?Q?5Mv09/8rNULzYY4rDqyczWIe+BOcHT3ZWKQFCrpyyVkM3wL2KB+KrGMds5+5?=
 =?us-ascii?Q?pS1q80p3/MN2bB+CrLx5K+jcF9aiF77DvCqoLyyZL5hT8RbLDbAODo+jfubU?=
 =?us-ascii?Q?IgvpQJMnzL8CLNk+NnCKSshiY6vmZGbZsnDgeC7QKzbQu3Ur89kLqeO2lrvj?=
 =?us-ascii?Q?HRCGUVTPeVsTPJQxPh6fvn3TEK7DviL1IsnMPqdMfleBEj4k5lYnygUa1blV?=
 =?us-ascii?Q?BLVj1Oj6SGwkjhbABSg3mW/8utquDfYkRNjrSPavp2j94nN5psXGi5LGGV48?=
 =?us-ascii?Q?RCH4fuYlmi/e6c1iOtLOoea5NSaQ5CSiiOtW4QAtSCb9terinrYp0DMuGuSN?=
 =?us-ascii?Q?SM53cmkZgFlZgY/1/63vZ0FRoeHovkNJPBhvBvu4gmXkkN6l2uc4dt909UE/?=
 =?us-ascii?Q?/M5xJq3l9m6hKunhkuIP3eHMnuCV/vht32V0zFijDfLGVwonNyKE1OOe0ad/?=
 =?us-ascii?Q?O3aYj3xig25ytvo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB7300.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?faThYyeuPhmkuc+7QWMgsy4RD+sDduyAltga3be+3WWQ/rv9CO+c3D6WRGOx?=
 =?us-ascii?Q?bzqSU0oiqw+ivbe9kkHbxOHsf5TzKVmltVQ+pW05OoE6L4Onw/ELuCOU+aD+?=
 =?us-ascii?Q?inLDqy37QxCFdrT5D1eQjglxhxJQ52+YJVTtlGSDRPmqEo1VNbF+NUUZMZ4b?=
 =?us-ascii?Q?o4R/CZOrBxxbLsDs8nwN9aSbS9+tTp17YychRv9USd6pb7dLHDhe4QfdsLP5?=
 =?us-ascii?Q?+BJMmm79dA9VmR4paZG5JKMmcKUIoIZCbkDgkzpP6VZnxNb9o/L39KRFSRbB?=
 =?us-ascii?Q?x0PTVwQT5CzXlCa5TV4V5wlACCVaJOmQOCoQSP17aombT2DFjASHlKjzLBy6?=
 =?us-ascii?Q?33fyGsJthNCU6yQXfNUm3pdinOL3LRty4+kkPIUE57g3+axQJ9EeVet7OFmN?=
 =?us-ascii?Q?2MNSlDl6rj5fMrZ6VTrcKGHByqZ65jeswPBTYn4KYjcrv8k69fTyBK4PM3SQ?=
 =?us-ascii?Q?wNyq9eihR09o5DdmQs30ossbVYggkke44YclKeUJvdgNzY8WQXTrQX+J5IWo?=
 =?us-ascii?Q?WIv/7Nt1LgqpJWCX3oD1JF0ofPZcQ/0CMnKmbQibG+c9yK68t5NWcIYwvKpG?=
 =?us-ascii?Q?kYbvECeKUsszgOOflbLruYYHNnmAOp+CwUF7pU2U2dMtyb/ADqw222p5QvoH?=
 =?us-ascii?Q?aOuxiTkzvT2b4LnylBXMA84Z0EADv18E3HPKYccuSh9wqG343pxvNuUlz5yh?=
 =?us-ascii?Q?3LY5SSCD3SgQ7KzPAZ7XGhlEtFEzwcLHAW49LNNb0F2G30ju1ORZPYtbToe0?=
 =?us-ascii?Q?LzQzVDLyMbZGQa3kn2A11r/RIS4ejoOeQdAEFM6pzy7bxg3GY7OUdWFFLHte?=
 =?us-ascii?Q?HfN/hYMcx8NR/OQi4RG/LRTTUIdjo2TUlvImHLyyEbkxPRy/ndcCCr7K+1qw?=
 =?us-ascii?Q?NTa8WUlXz3PT7PqWXAV+qtt03o+q4ZU1cAN0Gtn3h6lQqrsTh07k6xVWoz1c?=
 =?us-ascii?Q?GHgxa2Dmg72nTgeAzvhBhH4OAolC7gERBzpsTUFOEO8LbQ/dLBIFQzHVokKv?=
 =?us-ascii?Q?M5x5YWHotxeKRUM0XBLRSP/RciOofKB7yY9icGDze47u8u+py7MKMJa6sJj2?=
 =?us-ascii?Q?cZdKkgvrMEQouc/sicJxdPAPBMPnbe+0GQRBFffTndmkdJ/6rfAN8H1q6VX9?=
 =?us-ascii?Q?QuUOtraLGCCEaGqmjidFNZ5m4nFesaQfQzFGAZPyIKn0hQjDHJAOMupVDQi4?=
 =?us-ascii?Q?KVQXdfHYpp0eLfiSFzsWtn2VeMBln7jdTIXP9t7HtcD+AUE8wtllSx7IyNJe?=
 =?us-ascii?Q?8yVzCjgJTPNvkVjiFu0DZ8UnkbmITsqgFshXAd+FYpKnHlpwOiMAcOudRsUR?=
 =?us-ascii?Q?oBI3LxppiSkZKzACEXu5w8w9R7kweR3524SnMiGpWxdqdXo4QeNEqdm7/CPv?=
 =?us-ascii?Q?fn8BY0RbMw+dEBrViEYPvtV7nOJjl8zSyls9ZzRJrUewCrXwljmsLTeQczZr?=
 =?us-ascii?Q?29Ycu05GqAYSz1uEE/lYoincNkCtqqnSbZuIZAUE8LGXt/osEzxaSSERIsvX?=
 =?us-ascii?Q?ze4CKiIPCXM+Y3L2kjUwz0xmkWrB8jCrPaUjRGzINiGYCDnanV/Hx8egxVMn?=
 =?us-ascii?Q?v6dMvNOYUe9pHpuR9GlwDUDG6d9/ZEHZBbtEPVtq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB7300.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89966652-b031-4f3b-a8ea-08dda7f61a04
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 08:09:19.6570 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BB6g7bvUM8a9ljCld4dxvY7hFurKoBNEGVtsNER4qgIte0NqKRL4Hk83C9LO+1f3vZxQi+iJ2XkdukxGx8Xh7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5947
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
> From: Intel-gfx <intel-gfx-bounces@lists.freedesktop.org> On Behalf Of Ja=
ni
> Nikula
> Sent: Friday, June 6, 2025 2:35 PM
> To: dri-devel@lists.freedesktop.org
> Cc: intel-gfx@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Heik=
ki
> Krogerus <heikki.krogerus@linux.intel.com>; Wysocki, Rafael J
> <rafael.j.wysocki@intel.com>; Lee, Shawn C <shawn.c.lee@intel.com>; Yang,
> Simon1 <simon1.yang@intel.com>; Doug Anderson <dianders@chromium.org>;
> Maxime Ripard <mripard@kernel.org>; Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH 2/4] drm/i915/panel: add panel register/unregister
>=20
> Add panel register/unregister functions, and handle backlight
> register/unregister from there. This is in preparation for adding more pa=
nel
> specific register/unregister functionality.
>=20
> Cc: Lee Shawn C <shawn.c.lee@intel.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  .../gpu/drm/i915/display/intel_connector.c    | 23 +++++++++----------
>  drivers/gpu/drm/i915/display/intel_panel.c    | 10 ++++++++
>  drivers/gpu/drm/i915/display/intel_panel.h    |  2 ++
>  3 files changed, 23 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_connector.c
> b/drivers/gpu/drm/i915/display/intel_connector.c
> index 9a61c972dce9..2867d76d1a5e 100644
> --- a/drivers/gpu/drm/i915/display/intel_connector.c
> +++ b/drivers/gpu/drm/i915/display/intel_connector.c
> @@ -32,7 +32,6 @@
>=20
>  #include "i915_drv.h"
>  #include "i915_utils.h"
> -#include "intel_backlight.h"
>  #include "intel_connector.h"
>  #include "intel_display_core.h"
>  #include "intel_display_debugfs.h"
> @@ -153,36 +152,36 @@ void intel_connector_destroy(struct drm_connector
> *connector)
>  	kfree(connector);
>  }
>=20
> -int intel_connector_register(struct drm_connector *connector)
> +int intel_connector_register(struct drm_connector *_connector)
>  {
> -	struct intel_connector *intel_connector =3D
> to_intel_connector(connector);
> -	struct drm_i915_private *i915 =3D to_i915(connector->dev);
> +	struct intel_connector *connector =3D to_intel_connector(_connector);
> +	struct drm_i915_private *i915 =3D to_i915(_connector->dev);
Can intel_display be used over here?

Apart from the above one, patch looks good to me.
Reviewed-by: Arun R Murthy <arun.r.murthy@gmail.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  	int ret;
>=20
> -	ret =3D intel_backlight_device_register(intel_connector);
> +	ret =3D intel_panel_register(connector);
>  	if (ret)
>  		goto err;
>=20
>  	if (i915_inject_probe_failure(i915)) {
>  		ret =3D -EFAULT;
> -		goto err_backlight;
> +		goto err_panel;
>  	}
>=20
> -	intel_connector_debugfs_add(intel_connector);
> +	intel_connector_debugfs_add(connector);
>=20
>  	return 0;
>=20
> -err_backlight:
> -	intel_backlight_device_unregister(intel_connector);
> +err_panel:
> +	intel_panel_unregister(connector);
>  err:
>  	return ret;
>  }
>=20
> -void intel_connector_unregister(struct drm_connector *connector)
> +void intel_connector_unregister(struct drm_connector *_connector)
>  {
> -	struct intel_connector *intel_connector =3D
> to_intel_connector(connector);
> +	struct intel_connector *connector =3D to_intel_connector(_connector);
>=20
> -	intel_backlight_device_unregister(intel_connector);
> +	intel_panel_unregister(connector);
>  }
>=20
>  void intel_connector_attach_encoder(struct intel_connector *connector, d=
iff --
> git a/drivers/gpu/drm/i915/display/intel_panel.c
> b/drivers/gpu/drm/i915/display/intel_panel.c
> index f5c972880391..5ae302bee191 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.c
> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
> @@ -462,3 +462,13 @@ void intel_panel_fini(struct intel_connector
> *connector)
>  		drm_mode_destroy(connector->base.dev, fixed_mode);
>  	}
>  }
> +
> +int intel_panel_register(struct intel_connector *connector) {
> +	return intel_backlight_device_register(connector);
> +}
> +
> +void intel_panel_unregister(struct intel_connector *connector) {
> +	intel_backlight_device_unregister(connector);
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_panel.h
> b/drivers/gpu/drm/i915/display/intel_panel.h
> index b60d12322e5d..3d592a4404f3 100644
> --- a/drivers/gpu/drm/i915/display/intel_panel.h
> +++ b/drivers/gpu/drm/i915/display/intel_panel.h
> @@ -23,6 +23,8 @@ void intel_panel_init_alloc(struct intel_connector
> *connector);  int intel_panel_init(struct intel_connector *connector,
>  		     const struct drm_edid *fixed_edid);  void
> intel_panel_fini(struct intel_connector *connector);
> +int intel_panel_register(struct intel_connector *connector); void
> +intel_panel_unregister(struct intel_connector *connector);
>  enum drm_connector_status
>  intel_panel_detect(struct drm_connector *connector, bool force);  bool
> intel_panel_use_ssc(struct intel_display *display);
> --
> 2.39.5

