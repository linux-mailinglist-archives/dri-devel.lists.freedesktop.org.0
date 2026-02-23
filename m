Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDL+ErG5nGkqKAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:33:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6763617CF32
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 21:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E87010E312;
	Mon, 23 Feb 2026 20:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jyc3CEhk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4E3A10E30F;
 Mon, 23 Feb 2026 20:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771878830; x=1803414830;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gb+qU7XX60mbg6mJmedUaEkeOozcTpsstZrZEvJI04U=;
 b=Jyc3CEhk0Tx2Yla1Ns4KGCVz0NhXbYqo4CEZS4uYsh0Kn2Bi0hoKO9um
 tqJXgO2VYuw3yNq/CngxsCqGgtCi/VEqcABInBXO/NKx9+FHhAZig/ihh
 VuhZ0V0HTqUbyjQPYKadNYFndX7q+XmN00SPsrnEmPE3ecEsTNg3vO7gc
 R+j4RbapOWn00gBRkfS7ES9D388ErshseK9Ze4toUdXNNXeUNhawFsxMB
 ByVe4sS6UeqB1qkO09XdB/4aWV8xeq4lZJ71sBDaLUUdXwaOPmevBqR+z
 vgP5Km7KTMIlKFHGayAVl9z+APD9tc9ADPeA3PgCu8T2mVdNRKCGbfwER w==;
X-CSE-ConnectionGUID: FvPj7J/VSzOz3lj6deL2ag==
X-CSE-MsgGUID: kr+BWtjZR4WUZAiki2FiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72950888"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72950888"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:33:49 -0800
X-CSE-ConnectionGUID: qWBbl18VTUmBIlXOC+4n+Q==
X-CSE-MsgGUID: eAmcY++qQCSaAD18Y0ftCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214902829"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 12:33:49 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:33:48 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 12:33:48 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.11) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 12:33:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1JZltHR8OQtmUj+SylCIp9/VCFlbfaWmqPMkAn7aqGu8rFrxf3hB3NHyEbvtuHM1BoCvkFlglbpTEA6LjJSkwO6hnEhnbjSQITQL44mFJIXIf3pigQyftCR+Kkem7f6ouURPVotNK9unrl6G6fvZRlGCxKlSYWStVglG136x06l8SinxD9c6r0wOO6gnphs0h2sQSMFwi4aUiliAVHS+J4mXNEMzRwkjftkqj0ZlEFicHaC9nMVHqxat0hpAJoANpmLwW0Tfey33/6hN9ld7gHpkZLao9ym8B04ZyEGtQ4CzTswMYB99YVfhEhWJx9BgBTTQ5pDVJNxQi1++j3Bgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jE8OpcvAIRpMndAlkjQZW0GymRrEl5npjrMHK8dS7A8=;
 b=Hj+VS0xtVhf8N4i4QyzsaaHHCnsgbJh3I/VU9CZq7dTNAXk9E3mXL+mgqoYa0aJOanj34cdi8a4CUhysYU0xJDErZa5Td7+mEbEsvsqB1yJcWym2kIPtljyoCnK4LmuwHP1EctyCz5i22Byna5Eb/QKXzO4p8yPKFYv8n94Zz6ZlLHf8L26qwb7WxEAWkdS3Om67afqXvjzKJpZFItCi1Vk4XhiY878Lad6nUQmFkB/2QGa2P0jf7GcC3JA/CliR99pWoqhubIw73zkDYEu3XfK+43LpHvB2rtRpztBflGni6OpcWoJEn1DSecFhM0vfrnKEP7X7d9owPMddvrlIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6360.namprd11.prod.outlook.com (2603:10b6:8:bd::12) by
 PH3PPF5AF05F6D9.namprd11.prod.outlook.com (2603:10b6:518:1::d24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 20:33:45 +0000
Received: from DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680]) by DM4PR11MB6360.namprd11.prod.outlook.com
 ([fe80::22d9:ae03:5db1:680%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 20:33:44 +0000
From: "Shankar, Uma" <uma.shankar@intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "contact@emersion.fr" <contact@emersion.fr>, "alex.hung@amd.com"
 <alex.hung@amd.com>, "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "daniels@collabora.com" <daniels@collabora.com>, "mwen@igalia.com"
 <mwen@igalia.com>, "sebastian.wick@redhat.com" <sebastian.wick@redhat.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Nikula, Jani" <jani.nikula@intel.com>, "louis.chauvet@bootlin.com"
 <louis.chauvet@bootlin.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: RE: [PATCH 1/2] drm/colorop: Preserve bypass value in
 duplicate_state()
Thread-Topic: [PATCH 1/2] drm/colorop: Preserve bypass value in
 duplicate_state()
Thread-Index: AQHcoKdZieIlGOLH5EC+oZWb/6TKNLWQxccw
Date: Mon, 23 Feb 2026 20:33:44 +0000
Message-ID: <DM4PR11MB63601E519B7477B12642B51EF477A@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20260218065713.326417-1-chaitanya.kumar.borah@intel.com>
 <20260218065713.326417-2-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260218065713.326417-2-chaitanya.kumar.borah@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6360:EE_|PH3PPF5AF05F6D9:EE_
x-ms-office365-filtering-correlation-id: 2f77cd20-7171-4a69-3062-08de731ad6fd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?mgriBisHZGTfgKBpNmtauzHaB/GfzIj+L20klmws1Va/EPWhp9B/ZVZfqE/w?=
 =?us-ascii?Q?T52PU8AV+dyECFnTyDvzv29a96mtHMlSLnmuAKKPD9tm53zy/DD/sfVWqhB7?=
 =?us-ascii?Q?ZPou4E6WxLIKchjY6t1XyQZ1+Y0xRbnT/aGd+JbVFpw8DoOPju/QKNdmhF0H?=
 =?us-ascii?Q?WXVx0bdmPA3TnkPJll3p0S+7C3anj37cyjHhbiIVBC9zN/g6YeSkqZP9Ps9F?=
 =?us-ascii?Q?6ILHrjbRX6Grb2VEopGjZPkXsRPVCdytDhxQHJEW3vPbVYFTCAdcj3H5dVCW?=
 =?us-ascii?Q?CJzyJIcnE5Jf0WMnxmw0HtWrhGdQY8KrHdzBjdweoGS8xZEVS0GHBGOC9cFE?=
 =?us-ascii?Q?V+vVVF2J815hQoVuEWtJTl8uD+e9Sy2bIcUXkb4GWAOEMzLreEvp5YsrS7dS?=
 =?us-ascii?Q?zlVgsd1PrT0+fiYHTR8JJKewkZRvMXUepdB5Dzmu9CSdTjDkKiaupyNkYXaC?=
 =?us-ascii?Q?NibnbCrh2rMZlhDV/8iouh37IvUYwyL7GrTRfR4INl3QAVO4ujl9LxEM7deN?=
 =?us-ascii?Q?vgMndtXrIvSDOPT0N+zgViDOIhJh7vBtb4neHXuEhOnkpgEX6WP4e8g4V+wj?=
 =?us-ascii?Q?OtDARvTTzB4GomXmKv+yhojdwZiVswgzbdQYK2DojC0fHj21slte2d3GitMI?=
 =?us-ascii?Q?4QsMAKv6El/AY4zjHoeVHIDdW2/Ifuks0CaoV7vCnsQNWRmbDnw46nKJWYTY?=
 =?us-ascii?Q?3ddY7l0AP4QUamc6Q5DHtcbAPTu0uXo6aIWNusuTPsIb2Us/PnqXRAJh5t/r?=
 =?us-ascii?Q?KrL4snkxwnNjA8beicLX8EcaPrRt0en1j0wAqo0FOfPoV6UEz4zL3OgzE4Hr?=
 =?us-ascii?Q?Gl/PFp/meLwvwrMBAcQDbXxN5TSNfGK8rJWsFw3MziHRLzqNuFcYF0pCDfY9?=
 =?us-ascii?Q?zK0XSrtn4dUVWZ5lZUvP002n195CG2wtkmbxZtNpd6yTMeFau2C8D79PSfPf?=
 =?us-ascii?Q?aWLSzgYej/D7C8sI8bb23wbpLc9XsBP3EM/ihxkQByUFOQPZNHbYPRzBNSBm?=
 =?us-ascii?Q?94qoHHFLaDLi5dEf8AF9RweP/icuIdU6txD5hrDQUgyVQ4CEa3ncOgpNaqFG?=
 =?us-ascii?Q?5bSjNpav4J2/nKEKQGDdIFLvMoQi4cmkNDDPsUbNZZJ/MX2vZD0BXSjTAdNM?=
 =?us-ascii?Q?LprTmxGO0bsgiV79PPwBqqbumwh2/gZ+WR1j7BumUw75aMhtv/RVt3zIhfsu?=
 =?us-ascii?Q?Qf/tfXVImh36iGZXtRG47bP+UnDuUgDP0ISFTZOE8VZm0KDNVTOSAJj0hUZj?=
 =?us-ascii?Q?BYQ0+4aS3TckD8V67L6S7Io7GYmB888lUjzdGmw2qggoCbvlJUtHmkP9KJvh?=
 =?us-ascii?Q?XTc3MkpFz0Fqv251cA2u1XSCSHFSy2zM3YUeAO8CwmnpvbDqhCZW4R/KUcTK?=
 =?us-ascii?Q?lkU2EF+6sWzpmtcIzG/dl3viPGzFu3KeCvQqkHEnjuJKpv0utFdrhOKqRTzQ?=
 =?us-ascii?Q?M0tMmrGyjlJGxoNmLXiaPsAF2naqTnxIuh9+EXtbOwh0EBGpJ4Z6UiSTxn+A?=
 =?us-ascii?Q?Rs10tKOPOtwDj0kRN+O1IqfMPOCy0ZC7gZXfE/clV2D0cMXzxMNxe5kKU7uC?=
 =?us-ascii?Q?EmX1O56XvjzLDLG1V4qP3RSLOvYr0Ak8t6fJIiifxm3hvAh+PfxaU2+XdCBq?=
 =?us-ascii?Q?2pGthOx72UWdidzVJttoWvE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6360.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?H8OZ6N5R42a/fKRcOBdo5FmvtHhUEEP5noPqrOFK1A0CShMnbaYmgbpcKu7l?=
 =?us-ascii?Q?NXYHm1lkTBU9dOlWo0ZOga29tcgruFTO/Ail9TptbJCm3tktXJpFYVQwtHQ0?=
 =?us-ascii?Q?dkbuMV3IDb/6Vyo3Uqbm20i0BkT9/Uzaw769gFh7vr0uB5Zp9xDknv6QdTou?=
 =?us-ascii?Q?4O1+4B5wrwZoY+0Q9ryZ9NnuDEypvQGlQUwkHW5jiDSv7o8g5+AVes3vzYtD?=
 =?us-ascii?Q?j9z6v8cu38s60PwRixuxkp25D8EOoBPu5xOf5Z6XSLC/Ci4lefeNOxvFQx3b?=
 =?us-ascii?Q?YLXnB+j73InprJc335U+/OOgkA1GoFugYAmLPOG7bJBQShI3bisyfwyFQ8Hs?=
 =?us-ascii?Q?e9cpqAsfV1Q+FzP6/mQvvA9F1c3kbUxhbq9003fJMtfy9X6CQYq8PYd5g7ei?=
 =?us-ascii?Q?pO8lB49iqluUeaLs4WVCSbD1iNUf24ikk2y/GN3gC3VQFV5udD3Fg6Q8WWIe?=
 =?us-ascii?Q?eKhhIDCdgXnD0zOTGKVnoMWjhdyYotEiwl6PeVX8b3LnlAErH8xgB9Whm2T7?=
 =?us-ascii?Q?65yfuhbZkjI0IAT9WFeSW3tln3ksaT69+qF+IryjfeYLOg3D58fcetEPWWSi?=
 =?us-ascii?Q?rT/sCnHT8ZcTVu8XyjcXnDaDEQ+rOAoCsZy5z50vKO4eiqcFeAggPU6tZldp?=
 =?us-ascii?Q?tuJkZZPyZXr13BU6OqLKiu5Hm5WX2IxTv05Z7R9Drf5kktaTMi3hKoNjutIh?=
 =?us-ascii?Q?Ooyy5iNmCgDDlG98C0wzAgdiiWTkazMxtUGcqboQRmjlyftQ8nmA9FQnDE1h?=
 =?us-ascii?Q?vKT8hg+TJ2bV/FSHgfzQSnY2E6ETJ1i1NG2bW0ayj7GKsqu+xWLuZDvsu2yd?=
 =?us-ascii?Q?2bJcFMov+3ad2gCG2OkaPz3iMrAWWuixIT28o86P6Zt50sqcEu9/30JRqy9k?=
 =?us-ascii?Q?yKRNhLm/qBilmALJz9ogXcNwrGZ+kC6nsKuKith1/nOgmnnRueDRPzL0miaa?=
 =?us-ascii?Q?9/FT3OWKXNS1aR5HTRI0D/g2v1nKffTL4tKJHhwPINH/Q2wHoUF6fvAeLFaI?=
 =?us-ascii?Q?VuqEapveoSmSkkZxvkLSMMsi7bf8tE+b0a1sd2m//vtGIPUcgqdoCnf+Ea9W?=
 =?us-ascii?Q?0Q5ZUzh0wDllf1H+2YB95VUrHPq7bVHo4/tlt2k6ifmhFE3vJYb2+kmF/+Y5?=
 =?us-ascii?Q?jsG/psGmqR/fGRPPgCtfGYjFg0yducWbHAlvex2EehhIpqgvObFO7kISzGok?=
 =?us-ascii?Q?q7jOAk3q4lTMNL/BVitZRW7/JnVYWrIqV9YrwqwrjGW4Z0EELujWUKklc1JH?=
 =?us-ascii?Q?CtnKjDrs8MCbhJMobiLlaC24NWhmFxiOQXSi+ewX04+1HxgW4FHCJsVmn1tm?=
 =?us-ascii?Q?HAEvymhEKPuZSQ9LMDgj9dqfSJOesap/kc4Lwaxcj/gUiuKKWYnBnY9917V0?=
 =?us-ascii?Q?HjoUt1dTido13YLaR7oYogbnkPILa8i1jKw8zL9sWvH1gOQ/IMHA05CoMW2l?=
 =?us-ascii?Q?OZW6R02sEAiUB4Bdjt7TAWRXqMQcMMf4U/bnI31lh5B+xonb9FH1l5eA01Go?=
 =?us-ascii?Q?xeh6a6ZWwEArkwdCM/EO2vCD14K3ML7k73etew2JYFLPLx8h+6Z0o+udSuKQ?=
 =?us-ascii?Q?uTbAXnZ3GHLorNM+okTxxFBK8xbkI4Jct+Pkw06jLQXXlP02vxHaX+odiRIa?=
 =?us-ascii?Q?sePJtdvqoFjHPDxGldRYjiEz5ppgI3wzRP3JDilypcfJs2yxfdKDHAvqY45G?=
 =?us-ascii?Q?2O8397tAfWvWRhFFJ0+1fzIYo1I0RUo6gIZCHAndKXARHHrx4XR8YvLeYEeh?=
 =?us-ascii?Q?KMY1HTBZKA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6360.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f77cd20-7171-4a69-3062-08de731ad6fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 20:33:44.6016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IBNPOslck1kS/BygZlQ8C3Yxf43B/YsE/c6BzlPL9cHLcNHMkdaWiez70+I7dYQ8+gC5RRbjYdbUK+e6ZRKj2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5AF05F6D9
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
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uma.shankar@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 6763617CF32
X-Rspamd-Action: no action



> -----Original Message-----
> From: Borah, Chaitanya Kumar <chaitanya.kumar.borah@intel.com>
> Sent: Wednesday, February 18, 2026 12:27 PM
> To: dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; int=
el-
> xe@lists.freedesktop.org
> Cc: contact@emersion.fr; alex.hung@amd.com; harry.wentland@amd.com;
> daniels@collabora.com; mwen@igalia.com; sebastian.wick@redhat.com;
> Shankar, Uma <uma.shankar@intel.com>; ville.syrjala@linux.intel.com;
> maarten.lankhorst@linux.intel.com; Nikula, Jani <jani.nikula@intel.com>;
> louis.chauvet@bootlin.com; stable@vger.kernel.org; Borah, Chaitanya Kumar
> <chaitanya.kumar.borah@intel.com>
> Subject: [PATCH 1/2] drm/colorop: Preserve bypass value in duplicate_stat=
e()
>=20
> __drm_atomic_helper_colorop_duplicate_state() unconditionally sets state-
> >bypass =3D true after copying the existing state.
>=20
> This override causes the new atomic state to no longer reflect the curren=
tly
> committed hardware state. Since the bypass property directly controls whe=
ther the
> colorop is active in hardware, resetting it to true can inadvertently dis=
able an
> active colorop during a subsequent commit, particularly for internal driv=
er commits
> where userspace does not touch the property.
>=20
> Drop the unconditional assignment and preserve the duplicated bypass valu=
e.

Looks Good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Fixes: 8c5ea1745f4c ("drm/colorop: Add BYPASS property")
> Cc: <stable@vger.kernel.org> #v6.19+
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.=
c index
> aa19de769eb2..5037efcc3497 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -466,8 +466,6 @@ static void
> __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colo
>=20
>  	if (state->data)
>  		drm_property_blob_get(state->data);
> -
> -	state->bypass =3D true;
>  }
>=20
>  struct drm_colorop_state *
> --
> 2.25.1

