Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FA3AD0614
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:50:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012C910EAEA;
	Fri,  6 Jun 2025 15:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPTYQ7P6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0810EAE4;
 Fri,  6 Jun 2025 15:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749225053; x=1780761053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:reply-to:content-transfer-encoding: mime-version;
 bh=NPnJdUb7a5Z6xci37Vp4a6nn/bZGk4/DHTXjJJemHYs=;
 b=NPTYQ7P6wAZ1noiL6+zdo53naCoimE1fWYJYrNAaauNlEI92ttFGMmm3
 HRP8Ix398Gkafdxa/TLP/QUcEl23HjabbonXHoLfIY8HRmVXEXiC7gxqo
 qBMKOOZDx7up/Pmpwz3T7Errznm4awYigSMpMuDxOh+X0HNiDCMMXTTjC
 LnYMZZA/UBmqciCriEMfqegpX7zUYzZMKBzoPKW9b5GV/RgB/zUfoSb1t
 jZhJo47fUjVQ+YXMimMm6KAmrdxh8dJ7dN8L2KXDyycDPIsV/ovxhlDSg
 cNmOn4np/hoTJiSB7R8tbEvnyfxTgbgFgcEdXBl5xs4hiHst6PXwfqoR3 A==;
X-CSE-ConnectionGUID: swluMKDxR2+VKiwBAyy77Q==
X-CSE-MsgGUID: NTfbDSY6T4ue+rWY7FTs0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="68819885"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="68819885"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:50:52 -0700
X-CSE-ConnectionGUID: 8gZS/q4BR5CFiAr0r9nlSQ==
X-CSE-MsgGUID: LdgKNf/YSvGczPwBcWzsmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="176809522"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:50:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 08:50:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 08:50:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 6 Jun 2025 08:50:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ctygHHWUwQzgwld/P4OJq+BpLnWI9c3AdMmSfgVFN8LG/12baJDAu/vGt7rA7JlDjVlHz6XQyt5xq2i0uWW0XRtHh93Qa2Aph3zjFQ1mAb4Jr8i6xsb/eZhje/yz7WSXKj4K1TgdDkbXkJiKATP8I82mtLQF1dCWCzV/acw/xT4ZufQ9+tRo9DS2/iehVTfPyEs/uArXvH1L+VyZJskGp22ehZpkVMNVmROSzkrArFwwdBWgTFFT2kSViw2wQggns1+9rY8ImU6CvwI80nSr0WK0n2dHhGFJ6BwtFPEbFj6nxdH3BDnPQLgLFdSQOGwaqHqbsDcR8iG3loaKX0DLFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDN+jQmDHUYgnLyqJrh8BWUohBu45K9lyNvk5TLuJQg=;
 b=oQ+oZAqLAnTKg8VpebgNQOrewQzP0dbG9mlmWhf8nphF6X+rHyZTAI8ICfHxplCrDIGYALVqBJZ46ZLw0tnvTkMyto4QjY3tJ62VgosDWr92pNCtlx6o52H5q7PnkD36II0Me4e2T/CxRxa7ybbPZ/IN0SrR1f9DLHOo5whhjDWwrKUURuG01008h+zaqpp6tuz5J20Okg2qSvWM8fcTX7fAL44p6kq2b0pbrKc9dk9VAMFvilOVJVO8+JkzdSbZiE4q4Hzi825eUVmFLBmm9PdqqMbyMpIWPGRm+Y1axlwMSlUpqiTjKKNGSsD+A/wslcZ2xa7h/Lo6+uXhXuZcOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7578.namprd11.prod.outlook.com (2603:10b6:8:141::16)
 by MW4PR11MB7007.namprd11.prod.outlook.com (2603:10b6:303:22c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Fri, 6 Jun
 2025 15:50:49 +0000
Received: from DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c]) by DS0PR11MB7578.namprd11.prod.outlook.com
 ([fe80::ba7:2682:35a5:945c%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 15:50:49 +0000
From: "Lee, Shawn C" <shawn.c.lee@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Heikki
 Krogerus" <heikki.krogerus@linux.intel.com>, "Wysocki, Rafael J"
 <rafael.j.wysocki@intel.com>, "Yang, Simon1" <simon1.yang@intel.com>, "Doug
 Anderson" <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: RE: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
Thread-Topic: [PATCH 3/4] drm/i915/panel: register drm_panel and call
 prepare/unprepare for ICL+ DSI
Thread-Index: AQHb1sJZgMtNIrkmAkmgwAUY6QlrL7P2R2yw
Date: Fri, 6 Jun 2025 15:50:48 +0000
Message-ID: <DS0PR11MB75784970053D2946C4134FB6A36EA@DS0PR11MB7578.namprd11.prod.outlook.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
 <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
In-Reply-To: <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7578:EE_|MW4PR11MB7007:EE_
x-ms-office365-filtering-correlation-id: 4714e0bf-2c17-4f09-7a04-08dda511e876
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?AGUftS4O9Gndl0uGp5ifiYY7mlqohemfumWnhM2XvCTJKY+irap8b1egApzK?=
 =?us-ascii?Q?cbIlbPsiGP455qv7hNnbYDfpRGg5wN6h6K69HVmI7oX2srkCh8SMDPnUYWOo?=
 =?us-ascii?Q?6Zz/9I0KJAq5HFYningn9Xxj30lVUBDRjCDRFvy86M+/nDw6TeZnJ+4NGqDm?=
 =?us-ascii?Q?7ukQcZgr+UGsEOnALllp1o5FwNRWjmuvQGeW50PdE/bML6YYu3p0d7eH/QeA?=
 =?us-ascii?Q?K99JdM40XMUrsStcCt2q5h1j53mmaqK2JpM1HlkL0nbjJmYgwSM1lhwbR1S1?=
 =?us-ascii?Q?DadN2BvR7Xcih2k3ayjVpeZ8KlJD9dLKKzWlzV+7AhtDjs09gGNTSx5e3GTW?=
 =?us-ascii?Q?Xk5WA2zspGx28E9uJFkMvRzKPDlPAqKzLH/YC1YmO/mFyswJGg+pdLi4Wht7?=
 =?us-ascii?Q?HjSq1ChqnH5Gw6jFoc+J3PI1+gI0awGt8Son8SMwph74fH43DhkukX562DS1?=
 =?us-ascii?Q?E+pX8iBJYFRNWxFV9OF0k5ub25V/CMoXGgcBfiO7uAKrGhV8QGs+Cu9ZjsIv?=
 =?us-ascii?Q?IpiaccXlt1LyV240vqplp5Dr4zF3vpRuBrm2gdkJ0gJY6keLsBq0kpx07T+Y?=
 =?us-ascii?Q?DntjtsKvakScuV04QG+p9uX5VjxczzicAVr8Kh0WtL/8LcRz7cQas54vQN9O?=
 =?us-ascii?Q?TdfjPBJNTsvYWuB42Pya0+YUKCFxtsg/cOfLTPw07WuoaGxx6pDCHVqGPFwH?=
 =?us-ascii?Q?UAbwIDjfuRTpvu4joENGnmLEJqjn6KSzj/3v/53Q89YGFMZaWsgWuOoayCsT?=
 =?us-ascii?Q?tAwxZ/SygDeK9yWo+WoplFMpHlk2OkZYV8RV0XSF8uM+QSU0Ig0lmB38qvVz?=
 =?us-ascii?Q?gNgb8RERaRF/RnMn59XCxZZxMQDQVnI0TlF2B/KkAOUN0hM7hKMxWsNCSOK9?=
 =?us-ascii?Q?tTVBsEPbikCexoY2InnMAhMpBggXDwukSXfl9vOOfLq+K+/w7XAvzE/2PKkm?=
 =?us-ascii?Q?qCF3IRdGRki6GO1+roKNU+Flo/nKim8GKP12vSwNTjrA2US5+MhglbM3ay2a?=
 =?us-ascii?Q?KtUjk7UB1I/uRlYws1BB/QMvxE2+7M4/kpsZa0/zLHWnnBG3RVIPkHNOiKxE?=
 =?us-ascii?Q?iujct0SY6JSu62cZVj/p2QxovtZCTanI17qVi9h+l6wMxP6eskpTtrqEW1DG?=
 =?us-ascii?Q?J2/7jiGTzBbwnB04+//z9WA97TuGA//lQw8sSzmm0jh/tS/KNbxSr75TMRvc?=
 =?us-ascii?Q?lyqo3ZUbYv602yf4OruDmm77gsRw7c7dP9ihFk+YhJsn52gXpvFBdL+Razrm?=
 =?us-ascii?Q?O4r09T4ilKXvVH414u6vgacmtX1EtPqA8loMMeUXdva/PvNBglrI63cSh2gh?=
 =?us-ascii?Q?VImoMyyRUkaJWzhFhQ6pbtItR0TEWGqAtS9S+3Atx4KN9A9yLeKv49grw0y2?=
 =?us-ascii?Q?eorzISi56aOfOxMsn7lSTev8Tk81XHgRyvY1fqdKNF++SqCwueKzEuE7tBHF?=
 =?us-ascii?Q?kGJiUb4yDvDKH3MUsgfKQxZNMKxjuFoPoKNeEkR9bZym6O/MfHYW3z6GkG61?=
 =?us-ascii?Q?pG/Ijup0JFc5kVY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7578.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?duK6WUB4oJzbjET9OUh3+TEgY1+LYokdEL5FD2yqHPWXP28OMOg9dSTjQlJM?=
 =?us-ascii?Q?W52iRiuMskdfjKuZ7L2vH/m4rh9gLnF/gcVnhpwgSOwrMfr6Mn98tDsjIdhp?=
 =?us-ascii?Q?xBkx6yxxg/0rOiCJZCb79WhYKBWxd2SD2Z1ft0jazgKsn+htiqeRgQ3nidp+?=
 =?us-ascii?Q?L0fXo77mqlf2LQzzhquEwwW3cHigdaoHrFCsWwMg5cuWVgWXEKyVoxhdFqDx?=
 =?us-ascii?Q?napsFInB5IjQ9IDKISPyj3M/GwZpX9eqK7fNTtHZyBl+E+d0nE1S5SWcO9pb?=
 =?us-ascii?Q?O3slKmbRIwOwIPIQ98MxcAoQ35EoGxxavgPW4OMU4Y149R7Wd5AUQlMQjv/W?=
 =?us-ascii?Q?bQGlJ5nUpinmWw4GkX5Xjz9QxLIMl6eVbKh2KdELMUGgpvh41vKX1AwX+y/K?=
 =?us-ascii?Q?HaPL9X3RdfFKQlS1wdQRsXbw3ob/E41KFQRjMfdtRtmSJcNXMj+mI01nYNNE?=
 =?us-ascii?Q?vGtnGPG0wO5fqsA8P0BC1OtECi1uULRrEUIBGv+WX2RbTwgAS7QrGIgMhSFY?=
 =?us-ascii?Q?6Veqo4TOeFhL4hS5FfKt3jc4bV3j8z3sqECiCtmSH3vk3jnK2tiN72xueNru?=
 =?us-ascii?Q?uc/14W0djqZ6EheWviNtATZ7o0k06VlK/4apy5glhwPehMBSa5JB1Ff7rp2j?=
 =?us-ascii?Q?+l0njtSExaCUCwHqmeFQ1LBdyGrus5+pu6MIcL0Z89mJBA77hle3YnNogdb2?=
 =?us-ascii?Q?ud7eal+e4yttMdjIYrG3ciPNx6DrqaJWbq5JL0wsumhq/ZWAgVnKJ4VDqxZO?=
 =?us-ascii?Q?CuYpQhHutOpz0gbdMuZ50MTRJwVxZWzkIcpkcNI9rmtsh/Hl9ZIz46W03Rdn?=
 =?us-ascii?Q?r/LktEg6mr0Y7Nbj0bz6aTxJ8MDCYBBjmtj7WaDsKSw0a8OmGZvl5LSdSUWB?=
 =?us-ascii?Q?ZsiF45D9ozQ3+JVvjNNPX0CM7hr1atlSz6rsk6iqOGAnpaYD7yE+HIHceXuq?=
 =?us-ascii?Q?z9VZY/4NP8nj4+MwHPlgWv69TJG+XStia0mqFTnUaExSCWMulkNKTtDocci4?=
 =?us-ascii?Q?w6+5f9aL28qppUgmbVq+IJrGiC8UUMRK485+QWHO17kjEpb5n+i5IottxTZ8?=
 =?us-ascii?Q?Cg1/4uKJ5Ws4PoiDyWjZlBtH7F5OINT4JwHUtv8OvQCwcF9NkUQxTvBSEeLN?=
 =?us-ascii?Q?f5I9g4zTxCzhVls8ekxEac4vfmKDw/Krl49y0G4ROYtqN0uEF9HKRJr+rxKx?=
 =?us-ascii?Q?D4dRCNKMeLyRrUQAiUpmx6Q1Nm7ayFyH2X+bF3XvZR4yNsPSowxA/EkHMyg9?=
 =?us-ascii?Q?fFe540VtUhg3kOexaLRE/tAjHJlfE1nh5bQepb36gDwTq9PCmvAQnS1zMyby?=
 =?us-ascii?Q?VLgwPksqCcnXFBrP4/sDbdTX/GXOKiGUlMoSIGQKOw7r1kSzV9L3FNaoUS5c?=
 =?us-ascii?Q?LOXPRpnYyGy/+XgigIYy5Bg0wEya/gZODytOeCvud90euP6eb69fljlB4dDY?=
 =?us-ascii?Q?2JfMkVHnvA4Tni7iX/hrywcyIfsMIQ4SFYuI3KYrKkyU2tz2ZYO28V7MVR4W?=
 =?us-ascii?Q?qddVCB7T/ude+QMTYR3uBSPN+EofdLD3zjzOzUZqypchCrk5jNWrBxhBEFf6?=
 =?us-ascii?Q?DzNg5apHJqvnL2IKYz/uQyGUP3FYkBYLkVTFVUq6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7578.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4714e0bf-2c17-4f09-7a04-08dda511e876
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2025 15:50:48.9163 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WII+Euyj3b1raM9lq+mUHOMQsx+fzHKyCLVcshKsMzVHCd0L4dCGwpn3f3DeCfa3YfpJOA1mQdFQwJWUnwBR4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7007
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
Reply-To: "13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com"
 <13d15c1414e65ffb21944d66e2820befdab54e98.1749199013.git.jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On June 6, 2025, 9:05, Jani Nikula <jani.nikula@intel.com> wrote:
>Allocate and register a drm_panel so that drm_panel_followers can find the=
 panel. Pass the drm_connector::kdev device to drm_panel allocation for mat=
ching. That's only available after drm_sysfs_connector_add(), so we need to=
 postpone the drm_panel allocation until .late_register() hook.
>
>The drm_panel framework is moving towards devm_drm_panel_alloc(). It requi=
res a wrapper struct, and struct intel_panel would be the natural candidate=
. However, we can't postpone its allocation until .late_register(), so we h=
ave to use __devm_drm_panel_alloc() directly for now.
>
>Call the drm_panel_prepare() and drm_panel_unprepare() functions for
>ICL+ DSI, so that followers get notified of the panel power state
>changes. This can later be expanded to VLV+ DSI and eDP.
>
>Cc: Maxime Ripard <mripard@kernel.org>
>Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
>Cc: Lee Shawn C <shawn.c.lee@intel.com>
>Signed-off-by: Jani Nikula <jani.nikula@intel.com>

This patch series was tested on my local device. And panel follower works w=
ell on it.

Tested-by: Lee Shawn C <shawn.c.lee@intel.com>

>---
> drivers/gpu/drm/i915/display/icl_dsi.c        |  4 +
> .../drm/i915/display/intel_display_types.h    |  4 +
> drivers/gpu/drm/i915/display/intel_panel.c    | 82 ++++++++++++++++++-
> drivers/gpu/drm/i915/display/intel_panel.h    |  4 +
> 4 files changed, 93 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915=
/display/icl_dsi.c
>index 026361354e6f..81410b3aed51 100644
>--- a/drivers/gpu/drm/i915/display/icl_dsi.c
>+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
>@@ -1276,6 +1276,8 @@ static void gen11_dsi_enable(struct intel_atomic_sta=
te *state,
> 	intel_backlight_enable(crtc_state, conn_state);
> 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_ON);
>=20
>+	intel_panel_prepare(crtc_state, conn_state);
>+
> 	intel_crtc_vblank_on(crtc_state);
> }
>=20
>@@ -1409,6 +1411,8 @@ static void gen11_dsi_disable(struct intel_atomic_st=
ate *state,  {
> 	struct intel_dsi *intel_dsi =3D enc_to_intel_dsi(encoder);
>=20
>+	intel_panel_unprepare(old_conn_state);
>+
> 	/* step1: turn off backlight */
> 	intel_dsi_vbt_exec_sequence(intel_dsi, MIPI_SEQ_BACKLIGHT_OFF);
> 	intel_backlight_disable(old_conn_state);
>diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/=
gpu/drm/i915/display/intel_display_types.h
>index ed4d743fc7c5..30c7315fc25e 100644
>--- a/drivers/gpu/drm/i915/display/intel_display_types.h
>+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>@@ -37,6 +37,7 @@
> #include <drm/drm_crtc.h>
> #include <drm/drm_encoder.h>
> #include <drm/drm_framebuffer.h>
>+#include <drm/drm_panel.h>
> #include <drm/drm_rect.h>
> #include <drm/drm_vblank_work.h>
> #include <drm/intel/i915_hdcp_interface.h> @@ -384,6 +385,9 @@ struct int=
el_vbt_panel_data {  };
>=20
> struct intel_panel {
>+	/* Simple drm_panel */
>+	struct drm_panel *base;
>+
> 	/* Fixed EDID for eDP and LVDS. May hold ERR_PTR for invalid EDID. */
> 	const struct drm_edid *fixed_edid;
>=20
>diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/=
i915/display/intel_panel.c
>index 5ae302bee191..b1d549e6cf53 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.c
>+++ b/drivers/gpu/drm/i915/display/intel_panel.c
>@@ -463,12 +463,92 @@ void intel_panel_fini(struct intel_connector *connec=
tor)
> 	}
> }
>=20
>+const struct drm_panel_funcs dummy_panel_funcs =3D { };
>+
> int intel_panel_register(struct intel_connector *connector)  {
>-	return intel_backlight_device_register(connector);
>+	struct intel_display *display =3D to_intel_display(connector);
>+	struct intel_panel *panel =3D &connector->panel;
>+	int ret;
>+
>+	ret =3D intel_backlight_device_register(connector);
>+	if (ret)
>+		return ret;
>+
>+	if (connector->base.connector_type =3D=3D DRM_MODE_CONNECTOR_DSI) {
>+		struct device *dev =3D connector->base.kdev;
>+		struct drm_panel *base;
>+
>+		/* Sanity check. */
>+		if (drm_WARN_ON(display->drm, !dev))
>+			goto out;
>+
>+		/*
>+		 * We need drm_connector::kdev for allocating the panel, to make
>+		 * drm_panel_add_follower() lookups work. The kdev is
>+		 * initialized in drm_sysfs_connector_add(), just before the
>+		 * connector .late_register() hooks. So we can't allocate the
>+		 * panel at connector init time, and can't allocate struct
>+		 * intel_panel with a drm_panel sub-struct. For now, use
>+		 * __devm_drm_panel_alloc() directly.
>+		 *
>+		 * The lookups also depend on drm_connector::fwnode being set in
>+		 * intel_acpi_assign_connector_fwnodes(). However, if that's
>+		 * missing, it will gracefully lead to -EPROBE_DEFER in
>+		 * drm_panel_add_follower().
>+		 */
>+		base =3D __devm_drm_panel_alloc(dev, sizeof(*base), 0,
>+					      &dummy_panel_funcs,
>+					      connector->base.connector_type);
>+		if (IS_ERR(base)) {
>+			ret =3D PTR_ERR(base);
>+			goto err;
>+		}
>+
>+		panel->base =3D base;
>+
>+		drm_panel_add(panel->base);
>+
>+		drm_dbg_kms(display->drm, "[CONNECTOR:%d:%s] Registered panel device '%=
s', has fwnode: %s\n",
>+			    connector->base.base.id, connector->base.name,
>+			    dev_name(dev), str_yes_no(dev_fwnode(dev)));
>+	}
>+
>+out:
>+	return 0;
>+
>+err:
>+	intel_backlight_device_unregister(connector);
>+
>+	return ret;
> }
>=20
> void intel_panel_unregister(struct intel_connector *connector)  {
>+	struct intel_panel *panel =3D &connector->panel;
>+
>+	if (panel->base)
>+		drm_panel_remove(panel->base);
>+
> 	intel_backlight_device_unregister(connector);
> }
>+
>+/* Notify followers, if any, about power being up. */ void=20
>+intel_panel_prepare(const struct intel_crtc_state *crtc_state,
>+			 const struct drm_connector_state *conn_state) {
>+	struct intel_connector *connector =3D to_intel_connector(conn_state->con=
nector);
>+	struct intel_panel *panel =3D &connector->panel;
>+
>+	drm_panel_prepare(panel->base);
>+}
>+
>+/* Notify followers, if any, about power going down. */ void=20
>+intel_panel_unprepare(const struct drm_connector_state *old_conn_state)=20
>+{
>+	struct intel_connector *connector =3D to_intel_connector(old_conn_state-=
>connector);
>+	struct intel_panel *panel =3D &connector->panel;
>+
>+	drm_panel_unprepare(panel->base);
>+}
>diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/=
i915/display/intel_panel.h
>index 3d592a4404f3..56a6412cf0fb 100644
>--- a/drivers/gpu/drm/i915/display/intel_panel.h
>+++ b/drivers/gpu/drm/i915/display/intel_panel.h
>@@ -53,4 +53,8 @@ void intel_panel_add_vbt_sdvo_fixed_mode(struct intel_co=
nnector *connector);  void intel_panel_add_encoder_fixed_mode(struct intel_=
connector *connector,
> 					struct intel_encoder *encoder);
>=20
>+void intel_panel_prepare(const struct intel_crtc_state *crtc_state,
>+			 const struct drm_connector_state *conn_state); void=20
>+intel_panel_unprepare(const struct drm_connector_state=20
>+*old_conn_state);
>+
> #endif /* __INTEL_PANEL_H__ */
>--
>2.39.5
>
>
