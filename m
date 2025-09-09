Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D12B4A891
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:46:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D4710E23D;
	Tue,  9 Sep 2025 09:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K4tvXkfh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1E110E14B;
 Tue,  9 Sep 2025 09:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757411201; x=1788947201;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wjnu/ATCgO6xDivi4E6Aom6+5wu37CBIbfiKzNYjWUg=;
 b=K4tvXkfhiAEoH3gSGWMOq8zI0aVbjfx3JBoSenZotrSAVmcfXw0w+hF8
 M3CwaeXAuVhVA2zCfQ264sJ5jb5NXozwkeCyKym6VD+EoEJX27YTlhIwu
 Oh/ZOfeXxSaHGGxuq/uvou3oMDjNDyzpx8td4vVZxtlNyKp2wsbVwI3eo
 LVYhwZcvjOZiwAoEfj+z13wNx8MwOpwA0eUv/t7cEMft7uqKa/jtz37ZO
 TDtgfKUwNJ5jGPlqMhkAryxaU3RKMft7zDUlasme7v1W8+0H55Q+exO/k
 PAz5jLM42aZ0sSRgcoK/qBwaQ0WsRv+gbeNrGKxu3+wqLsNnCve9Yet7n Q==;
X-CSE-ConnectionGUID: ffOv3cI2Sha/Bsgzfm+Vbg==
X-CSE-MsgGUID: V8Bw+unCSdqo2oBCk/ODdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="63518260"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="63518260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:46:40 -0700
X-CSE-ConnectionGUID: vIIwZihrQkKy5l+ZvWQkQQ==
X-CSE-MsgGUID: 4KY5hk35SneYDQRAHZjbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172910976"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:46:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:46:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 9 Sep 2025 02:46:39 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 9 Sep 2025 02:46:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iT9rVa7t8CAmBMk5CrJR/kZDYGClbZvRNUc7nlsA6uWL+x6dURE34wQjT7RMVgDtls7jozWlP2FGQoVS/lgV925YisC1vlJbkW/BcUIOyUgpRoTM1KtWWzjA56T9nZF+1yA1XNy9ikPReWpwRZlcsUBjiVqj88iLAvadOhIiwl1tKURheMx3Hiv0TJieFNq48pAdWiXu7+TDwu0BUrZolRKFE/ynOlSDOsGamt9OssMihrfOakAoI8FLfLi7cKqVjhF2Ux8X+H8qlRgLYjvDD7yBtga4w4c3u8znfAe7JC+gCE/a5s3XK6y/Zq+S2J8TCno6S7r8yvyg1Z4QMqx73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ROFyi6IHbcLfRK5csOt+Eg082NqZAqbuOW5mX+v2T3M=;
 b=lj0eZ4F5mVqFeZoQGxp7f/2pJqr7i2dzPgXLJZ0XLqWQum6L21uqFyF9ot+SvxhKNYLE/7Cvcgs0brOTI2juZU8mX4aOukUMuzrm1egMK4OsUNltaa98SDy2ISVJ+8S57Kpec2yUogTlsgIMtb3S/CW4DqZybuXgUGuI5mkllKyIecp5uMgqZ1PGbfdGWcpEK/+v7QjqCRI1oGSMuNW1iJiIxl8RkzoUZezcpxdefr+JWzkIoEZdWIr8+JMhaig4lQlNEt4yIMq6iSC9YFXPC7Nv9BLhZD25jXZUvd2U/7gfzS9+nozCvWh45ZQ9wy3y1icUmZ/pK3MD5wQgSB2dNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5427.namprd11.prod.outlook.com (2603:10b6:610:d2::14)
 by BN9PR11MB5323.namprd11.prod.outlook.com (2603:10b6:408:118::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 09:46:37 +0000
Received: from CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b]) by CH0PR11MB5427.namprd11.prod.outlook.com
 ([fe80::a4c2:eb7b:574b:ab2b%5]) with mapi id 15.20.9073.032; Tue, 9 Sep 2025
 09:46:37 +0000
From: "Sebinraj, S" <s.sebinraj@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Badrappan, Jeevaka" <jeevaka.badrappan@intel.com>
Subject: RE: [PATCH v2 2/2] drm/xe: Add DRM GPU frequency tracepoint to Xe
Thread-Topic: [PATCH v2 2/2] drm/xe: Add DRM GPU frequency tracepoint to Xe
Thread-Index: AQHcIWkpDsLdS7l8TUCvH/StFFJE6rSKmAMAgAABrUA=
Date: Tue, 9 Sep 2025 09:46:36 +0000
Message-ID: <CH0PR11MB5427788941E6B4CE409369EF980FA@CH0PR11MB5427.namprd11.prod.outlook.com>
References: <20250909085919.168658-1-s.sebinraj@intel.com>
 <20250909085919.168658-3-s.sebinraj@intel.com>
 <36d9a9fa950f695a17f28ed48085626092583858@intel.com>
In-Reply-To: <36d9a9fa950f695a17f28ed48085626092583858@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5427:EE_|BN9PR11MB5323:EE_
x-ms-office365-filtering-correlation-id: 0d33a7cf-8bed-4f0d-9296-08ddef85c4f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?4ZNjrcL5A8+jUumISPhD9+c+qJHKkU8qnMeWE5I1Do8xjuX+qd0K+vPh+N5e?=
 =?us-ascii?Q?uoW/KbwRFeDAwolBkFc7ciQ0yJUYWaZQLKlkt4ZBED0Fe1yzxUaMETJxXot1?=
 =?us-ascii?Q?n+8y+r/Guu884CS96rjHpe9UIS/w9AtSYLbTjB9ZuPYl2OKOUKWyNMFGlLmX?=
 =?us-ascii?Q?DQfY93zQniiiUzzYGzYGySJ6mUd/mhojvMS442Crtp1qJtyQVqUmEFuL53AX?=
 =?us-ascii?Q?8crpU4wsdGUsPiXBeJCgGz5D4A8bpfR9WeT+UEvVkDHhBCDhUXeD7fZkxGUG?=
 =?us-ascii?Q?KW9kfub/RlJs8EgmhIHUhnXkIv1npfQ+ngpiIb0siq3KiunAueBsTzt6O7tJ?=
 =?us-ascii?Q?zUK+nCPy9ZP3z6XicCHMCM2zAKY22/KE/j2GlkgCS5XY1i16gvwb6LcXeexR?=
 =?us-ascii?Q?4dWaHpWF9Yw7xtgJrYe1f/R10l3UZhDo74IG+nbyk1dNk6IW4ZGS8XUZ1MDZ?=
 =?us-ascii?Q?2XstNeWYZZSDiR7ONSf/YUNE5TYIU53F90Sjp4rzDt8iKKh9dk4UZOSFXzH4?=
 =?us-ascii?Q?QvQBzskdh6RN0iK/rGN48UoPA7C8Nx5w0Ga+MUK7I+oqGGiWSLQ4VXGSCEn7?=
 =?us-ascii?Q?JAjGMs+/HwpWe6jzFZ946RhcLU3qfXn4PICcvG2/kx7K8v29KpF0df0fubHP?=
 =?us-ascii?Q?ehqifqcGUFgk6GOQKHT6vOP51QK/2xBxxH1ecEfuMXtP+P5HJIgug181UJZr?=
 =?us-ascii?Q?JT5m2dDs9tslNMaAAJiFkJ0vQGDBBfmN97KEbmAhI6L2sygfZE8FmlyhuiaB?=
 =?us-ascii?Q?0x/rVTV4uNDX+v76xjLvi2Ph7HwwJjwGtbCLIVgRcrk/51/dpVcKOoPc/NsA?=
 =?us-ascii?Q?BK+qYmuunkQNVY8GEuC9BHH/4EBl0ImrPnZ308H/QyahjHg29l2Tsqj0GraW?=
 =?us-ascii?Q?FQC4ocZLGLUoIHMWtiDEpzSZxiHrhAxwfZhNC4lSzp7kT6UaRsDk6aK5c4yO?=
 =?us-ascii?Q?GkwJe1pCit0NUqPk0okZgTWKJ9QOPXMKi07VEWggDEwLhG2h7pnPNj1sVhPO?=
 =?us-ascii?Q?NDQ6me9MpT15n948g+SVj8jmRqpS9pDET3wIdrmbPOMxdCbFQCqoV0QcWPSe?=
 =?us-ascii?Q?xp1fgiNNryzC1aKxDpvygZFl8Wi6KEJNj8xN9+qcmXFjqdKqxZL2QBTbvW9H?=
 =?us-ascii?Q?fnvlCjpdrClo649coTJYZKJ9YYxqT08TdY/hENK0ZBKum+aZq1GvaIwIsX05?=
 =?us-ascii?Q?Z8jQ9aWMzugmxNi7Udx5gPU+8UvzurkQGivOqlAY2m+bpXbHcyb4o4W14uP/?=
 =?us-ascii?Q?cx5RlXcVp45JgLawYCF63swv5Tpoyg7jpeuLnk5pbAJZSnt5J4PJeQ8lB45x?=
 =?us-ascii?Q?3hlrZsio34cygb2CtqZ4I/lzO9lCPBNtPT2bKF7QaULRaV2gxDR1yCBqrHen?=
 =?us-ascii?Q?n5advCDzNy2nJ3p9gEQcJAR3T6AT1KNlxDV2dFUNbe2IYTTJo9NaPw4lw1OW?=
 =?us-ascii?Q?M4Ykw3sgDdVGghftxkaVpBTD89+WwR+ImFrL0YhOKKWVt3CKAwmkAA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5427.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?edYbfmTvYjyDD+JhDTAxXxW19I4lWBGJyQJ9n7N/FXQB/OAXPkKUI4Difk5F?=
 =?us-ascii?Q?FMb0s0n5Dd2MzjAXwu/esehEXECZO33qilNUiMmm2fuL5v72CWN4CDHljwMf?=
 =?us-ascii?Q?yYRcrySZhuY5Ji66u7LpYBmasoiZ5LKw7vcXCDzQ8So1CK4pHLfnoDG0EWoI?=
 =?us-ascii?Q?KtrEhGI2PPuWJOuqmYzhPQuvTJlanwnKcyY+T4IT84TctT71QFISVIs4Ye0z?=
 =?us-ascii?Q?lQt3r/+A2eibZ+P1/TUjmHp5trw5IkXeOlwJnx6lnLpy8tgo/QbBkevkptd/?=
 =?us-ascii?Q?d1D+m6EqAK48g6eIZtg9RWfGnesTE1Xg56izSUbt+ikRNiOQMnyg4gtg/xf2?=
 =?us-ascii?Q?t5hMZJSLhUY6Z8dgGn22qlOTwY5OCj1D5daAYNnU0Abg8QXSwltR/zHhuWn5?=
 =?us-ascii?Q?THIi+WT/hm0AsLNgag9q3snfSTJXEjLHtYmUc0yLovDAqtPDedI6TfaFPYgL?=
 =?us-ascii?Q?Dhkut1tMNuvTAKGjYqW8ea1ydwZt1mgkapHZHNFo971IWU7nZn8lk7+4H7lx?=
 =?us-ascii?Q?/Z3U/IG/SzdNuExHldAORb2+VRgHINzVlpsdxDnN5SddTXUgfVW5usV5JKDG?=
 =?us-ascii?Q?RHwC8K2BmKxk/am+QVwD6ahfvvuR8M+K98usk9NDwEIPGem8eMbZ9Frd6+qO?=
 =?us-ascii?Q?s8pMgitFaq+Lj/75URykUVL/3uTcGOUWSh0Sm3kmDaB5QI1dPjfNw4fh+50w?=
 =?us-ascii?Q?tcEHdvrkrwrEeoxitT+nfxqgYt1Ykav4n1NAmxxCoJAdAlkoBUlrhij3wMJX?=
 =?us-ascii?Q?NIQUFNyUlq3MkGSvZtI42v8stAFervbNX67o8y9Vjs5GSDRyXILgyMUvgqD7?=
 =?us-ascii?Q?iH9Kp3Q6EB1TmuuyVGUyiyzDvWIRln8tdvtgB1bvbk2YvZ0MlYB7G4j5zhGh?=
 =?us-ascii?Q?NFKuyuEclNJZ/d2NQDkDGRsKvusIOus5091nFRWv1POjlZp65RWSQrBCn6uK?=
 =?us-ascii?Q?NmOWCRCV1pRUZ5mg2rvuxxGP9uHjLkbycBDxh+dHskbB/0vTfGPlmUCfrv37?=
 =?us-ascii?Q?ZAzRT5YjMTDRNlP/PmUcVPquqdZXXzEfF/L76/xsdsdxrayg4AvN4mb9wBhj?=
 =?us-ascii?Q?8LkEiyLaAGiV4bS8kJJK/2WRyy1Box279/TZPB0C7yVm35+3b6Nn8hwms8nu?=
 =?us-ascii?Q?pzkd9tH3V14FcsDBuyu4+VH8plmukjq+WxDaWk8GPRj39AfS5vJ/mMl1s/l4?=
 =?us-ascii?Q?ZdHHGkQQiYvVtTy9YC5F3hMV5/J1gh/a4lT0XqsJiUpt66M0kk9beAkepYr5?=
 =?us-ascii?Q?BqikFbMK2kmSykyz4oBH3gLagt0Z1jO19AzWBHYke1JMuLJoZ4+SakILTsdV?=
 =?us-ascii?Q?pF98NVlWQgPdB1qs3b5CNRyRwzYk3wRI3Xh3PkcuzGoyDAq49BxqW4dnutGb?=
 =?us-ascii?Q?2GcJHctea0J3RgSiYzdEedJXY3s4dolDkYVMijeb5AfzSY7ROrG1SbYdrckf?=
 =?us-ascii?Q?v8zLohmHfMa1AyMoiRADnaxMaJWP8c3wMQ2sIG4xRGGiQZozf+k+AbUCegXF?=
 =?us-ascii?Q?f+5J5sG4lFEgcU4m0TF3UCbibrKoywFB3lO9dnf/oF4eCjiYeEzUF0dCX1cz?=
 =?us-ascii?Q?KjgIdZ8DFf8exH4WHUwI2D6jxNVfbrZsGQvX1DcG?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5427.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d33a7cf-8bed-4f0d-9296-08ddef85c4f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2025 09:46:37.0150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FORbJldzkdAXcR7STsiLe/22dA0lLvDsGVTgLTjYZCAxTflxXlRcOL3tDn70FWd9JaFmyXm0AFEiQQp1rbwxfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5323
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


On Tue, 09 Sep 2025, S Sebinraj <s.sebinraj@intel.com> wrote:
> diff --git a/drivers/gpu/drm/xe/xe_gpu_freq_trace.h=20
> b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> new file mode 100644
> index 000000000000..f188d529ae60
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gpu_freq_trace.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * GPU frequency trace wrapper for xe_pmu.c
> + * This header provides access to the gpu_frequency tracepoint  */=20
> +#ifndef _XE_GPU_FREQ_TRACE_H_ #define _XE_GPU_FREQ_TRACE_H_
> +
> +#include "../drm_gpu_frequency_trace.h"

> This is a no go. You can't include drm headers with relative paths like t=
his. Basically none of the drm headers inside drivers/gpu/drm/ are for driv=
ers, they're internal. Indeed, they usually have _internal.h suffix to emph=
asize that.

> Headers for drivers need to be placed under include/drm/

> BR,
> Jani.

Okay got it, I will check and update it in the next revision.
