Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210A3C20A1A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1919B10E9BE;
	Thu, 30 Oct 2025 14:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f1P/gJQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3115610E9BE;
 Thu, 30 Oct 2025 14:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761835044; x=1793371044;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=p2zeLnO7Qx+z2YR7KIc4utmLaDQDPaBPHpEh8qiuv8s=;
 b=f1P/gJQQv7vt3RrXIuIXzDY/wh23b12zbWQzQg5ynC3rKgqUAthJkddO
 kKvlW+2ybd90OOTbHPpO8G43NZ/XcNirltkOg6CQtzn5wW75t1EBbRVQc
 RBIkc7xL/npm7W+FvWhtB1+PRem/XCRqEekqyJiViW5/wRiCZxWxaUIUs
 cGCdu0LfUW3F8a4gil0bTZSR5uf210fzvWPM8+j8zphOQstm+MMOa6idg
 GHj3TCW7zCVUNGv9Ug1jtou7/8ailBHpVNPsa8DK1minblM7znzmHLhqh
 gQ6CPq072U3kjklX1OB9yQGmcb2AE/QSkKM5GPvXL+8WG5dpcuOVNKQu9 A==;
X-CSE-ConnectionGUID: dN2gXjdNQG6AsVQRuDS22A==
X-CSE-MsgGUID: 5geSf4vhSbiK/li9COeE5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="74655439"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; d="scan'208";a="74655439"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:37:24 -0700
X-CSE-ConnectionGUID: nZ2XSm9XRhq4KWgnfmLrRQ==
X-CSE-MsgGUID: Zj3DMXUqTe6uo8Reg95azg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="185851015"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 07:37:24 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:37:23 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 07:37:23 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 07:37:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p0cfyRHUKfjExurL8XYKLel/IRinFuB1tXrFfKyflS8z+FHw91qI3d06yi1ARfHOmyBhY0RwJMH1KXqMn3tlvbrcYlqp8xkPbI7D6N7a552N7AF51JzTTmz47mZGqIBfV3ufB0DvU7RZXbazK/6hJGR5Flsj1iAtnx7C7sOlgenw4+Osc1OKumKXfg/+H4IOeDB2CzDClmMFoy+F4p3Ue56gBxwSlE2FeI3B2DiwL4fmCyflNKXULYBv+8uekTpVL/KeHCdtQdY6ghwO1kOpgT2nvQWgcX2FEr2mzf1OPnc0IXVoHVU8Rn/tiUmmIlyjtTr/27hvlBnxc09w8Akf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=swWHCOZt91jwhtraTmX8IwegYtjsOEG99XF2PI17Blo=;
 b=dWhMZwK6mQpk9X+6fujGGtgO1Gk0WxMIcVSDE8ob8sm92CL9gXWiHRzyI/g5/fTTl/scJ/TtoYoMBznLdc5SjvjCfJM1U5UnabOAdcuACeQ1x8rcJLB12rMhnMdbhJxYct7FPa6ooKmkHMpanlWvdLrEz1NUUbIbQnzYOb38D69IQ2iSpObniqkDWxQuhdxBoQZyFgeQTIIKf26oMRiucNKz8iBrf89srmeIWBQhmf31imBEYXqDL7OmCnPkXJAl1/u102hBADtXn/doG0YDMmlpzzqBy9WSWGUW/B7e1RneIiRizJRI4vFNCFuOE+hN/7u1OU4ldYPJzTXq9uJhCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7209.namprd11.prod.outlook.com (2603:10b6:208:441::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 14:37:20 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 14:37:18 +0000
Date: Thu, 30 Oct 2025 09:37:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
CC: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>, Simon Richter
 <Simon.Richter@hogyros.de>, Alex Deucher <alexander.deucher@amd.com>,
 <amd-gfx@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, "David
 Airlie" <airlied@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, <linux-pci@vger.kernel.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Christian =?utf-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/9] drm/xe: Remove driver side BAR release before resize
Message-ID: <rk3bknl7gw2iaslzjc6hejijvevxyj5rt5m6ovqjxgu637mj2a@b723dlcpmvkf>
References: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
 <20251028173551.22578-7-ilpo.jarvinen@linux.intel.com>
 <3ts3e2fwom7inbu2kzrvljo5mm7wz5ruaf6daib6cf5tk3v4al@njzufk22tcsy>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ts3e2fwom7inbu2kzrvljo5mm7wz5ruaf6daib6cf5tk3v4al@njzufk22tcsy>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7209:EE_
X-MS-Office365-Filtering-Correlation-Id: a7c0ad72-0205-44a4-1575-08de17c1d405
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?6VNdKEG9Q32hDUNzgqaKziUg/SaDe2dHpNw42rsdwPd9iB+dxU8NWL5phT?=
 =?iso-8859-1?Q?l/pkzJxkM7jEuoyS/dvLqty1lOJgbU7SBHTwnQGlD4Tbf4Zvek9nEbp5Rw?=
 =?iso-8859-1?Q?BV1Wv1LcJ02F2PY1NhPQAlyZlcwN/w3IKSz9me191fjD1gSxp724m37r6f?=
 =?iso-8859-1?Q?ANJA5Bf44Z80uWyawOAww8TYKR/zFa03toBCWaebjHE5dmPq6q31n2ZHPj?=
 =?iso-8859-1?Q?fd22gCMOJkL7OvrfjSkSFRUBfU7FTtJvGQZOrWSBo8gAPsdo5zPdR+ioEx?=
 =?iso-8859-1?Q?4gG6Tz8+ErdXGkneFXnr/pUjsi/lGuwIMpCthLUqMZuyCPIO0fwdaY1PDu?=
 =?iso-8859-1?Q?aXNtJNpjtZqaVYiCP4MzZe6vhwoVeMFmD86zUdkzkxo8xQH9oRRsDd1f3J?=
 =?iso-8859-1?Q?g3G/DOHr5utkz6josy/z8IQRTkTVHHU0XtbaqCtj7uHPrmyaDeTV9Zcj17?=
 =?iso-8859-1?Q?RmEaeF3vpFR7t2nhmx/Zsy1WSaZXhTfc/ydqk/wyf1Xhoo834At5R3mH17?=
 =?iso-8859-1?Q?Pygu+n/9fklJENvCLFw/L3aVAUmxjfPrj7hFcJbywGj7Rd2ToGhq0kSpri?=
 =?iso-8859-1?Q?wjbCVn411C+D1JcQcNcbukfNxKbIoM+bNQqonesqOgYyqS3/J6+8A8ajtN?=
 =?iso-8859-1?Q?y6UNL/LgxSgtJ+Dc9P8uuNBJcJopkHhYcCQocf28HP32skCaiSOb3s6rPx?=
 =?iso-8859-1?Q?Z/qdmnGhLDDCO33HT+TVIX2KuhPr8/fkPxoR7WnqIB3y8sDQXZK16gknLo?=
 =?iso-8859-1?Q?+yoAmKrN681PONneLxCnwpSqChUhL7DY0wpxMdZsbHfzXkLtYjqFb6v36g?=
 =?iso-8859-1?Q?SUaEYMOePbMMRjVhS6RZkof+WI9JHVVRgJasi8UUGGrwVu3oguPnh/xU74?=
 =?iso-8859-1?Q?FOWzoh71q7uQ6QrA7r2CzfMPpJjpFTk/16GkQdg4zMafJWUi0iCZrD8MZc?=
 =?iso-8859-1?Q?SDCvwX/Cz/R4TjjOdRCpV7aLaH3a7f1k6+aMZczhBbsNQxehxpbr0r4mR2?=
 =?iso-8859-1?Q?Kyc/FG+LgsX4tFHRDeJwHiPsIEdhdvIHzP+TTJRi5PuyaZHaRhIj9ADh+K?=
 =?iso-8859-1?Q?E3GJlJHryMcKFIWJkBduAc6LUrB0Dzcec2AhGFrak+FqXqs6y/+Y+yUVyp?=
 =?iso-8859-1?Q?Uz9v3l5TK0tuEeJR7X3jRLpQrD5p4moLcXUL4I0puvVvsqxL2/CLYpv667?=
 =?iso-8859-1?Q?FGeqaIuhiVpCvvHRiCw645LbdUyGY3bOaQARdOtu1Ya4rPMGHhi3O2aZ1s?=
 =?iso-8859-1?Q?7hRB+K2GhJJkpSuhdrSy/jEiC0honwS185IYN2UOsdiBY6ytUySH+mOpEp?=
 =?iso-8859-1?Q?uzS6dUiWFkKBKsoVItEuV3vCDLtO6w61KP7idLbjvqMaJoeQKsCV2lP8gF?=
 =?iso-8859-1?Q?Jzpa+EidY2uClGotujFDDXegVAjjSVW44Qtnez5rppqzl2WhDGpBIi1DyJ?=
 =?iso-8859-1?Q?tO0FL+mATdZX7Cw2DmBUS+/OzM8sc9LBD5XdCnlvx/+mVMZHCCbzcnwE4M?=
 =?iso-8859-1?Q?nGUDFDw1MHfblgncJPiZJiAEjaZ0qX1/BxuSVwqZQerQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?pEkzPwAEczI3sexOMLNRa/Uabr79Q238j5scIuqYODKceGyix4baTTWVm4?=
 =?iso-8859-1?Q?kCqPxMCrMVY9XG+ZEQQ0madJRQQwXCZjqVz9KhTyOXf0TsIdWBmHB2tnb2?=
 =?iso-8859-1?Q?ZweLcr5TnP8UMLyiU9ZabhAOx4/u15G4KMh5UzYNFZnfuml0G8nzeQqnTD?=
 =?iso-8859-1?Q?GB7FpRwSaOgEymopg5VWL0VEaLMc6QrKeBA3YSLGbnagLJZSKwytwUAfhz?=
 =?iso-8859-1?Q?DdTzTEDQwhAVK9tOYBQsKYZOIQpGo6b7PhWMWE1rzgeIJJsE+6BJI1eaha?=
 =?iso-8859-1?Q?J4eJG9yUDG2saV27XeZLW5xjmfRVvmcHsSco2HZLa1dJRbZjvN8wIoBGxC?=
 =?iso-8859-1?Q?2KhOst7PP/LOpKYpjlcFnB4LnTKDvBLtTTi7P/v5E7tfbWp81YNGx7xUzQ?=
 =?iso-8859-1?Q?PLqQkwPYsuKII4kq8MndqpMPAbO93eY4W9UmhSo9QStS47ofXqw3oh0Hy4?=
 =?iso-8859-1?Q?PK+QCdQtew6tOCaGG/PayUzwa61JZy0PZR5potAN09875RARvu66co/+mc?=
 =?iso-8859-1?Q?wecqCnqTRzkfQuh1rFVN1+g5ih7DYypnuGPoCAUfESdr5akFespCM0SRGQ?=
 =?iso-8859-1?Q?tPyuYkMUlnZ4z44S4IoZGNf6PwY4b6lGwFUV6sWHXKU43YjTxaXVtd/16O?=
 =?iso-8859-1?Q?aFghOcCgbH85Xef3zDOzTJ/CuFeHIo/kYqflj+SV3kkYtcVzcuYboloS8e?=
 =?iso-8859-1?Q?sImecTu8hA9/78szjj0OL2x3YFHyCjt0I5jGxtqY7mwQULE8qDrBklJSXJ?=
 =?iso-8859-1?Q?TC4NTJQi7rh0lsOFpW7fOshTYMjjn3IuzORI1W7Wa5InpcV/HSVyGzuwRe?=
 =?iso-8859-1?Q?u1Y5l2+yaRUDfTbTrliwvtsyxL2lOtSrj/SQltqfIic5B9vgV8KeaXKXtO?=
 =?iso-8859-1?Q?Srih6M2tCxlIoDusaeTrQFENZLuXZIXLfCEAurQFIZ0ZzT/9QT0APtGTyD?=
 =?iso-8859-1?Q?wSeAFjABglivMnZbUdxKZYQqXFkRWbUW5gZYRB8vMI7B155T7jldSbjyY3?=
 =?iso-8859-1?Q?nookyXcFSYcr3YcMwdWhL0K+q0Ek/VrG56saemUpQ+RvNtRa7ETjSBSMmX?=
 =?iso-8859-1?Q?6Y+dW8b+snPum0e+V9qudmXMIvjXtMCJcZHyto2jtGmKV1pLiQ/XFbhDHG?=
 =?iso-8859-1?Q?d0tdw5mrbvFt3U+0C4kdXvuyB+MPszfVlAdw2OaHc2KteHxjbsY6RFKHqa?=
 =?iso-8859-1?Q?70lc1IhL/4Pef2eW4oX7NOciEgOmM3x+v6aWjlGsDrSv8kr8gJCE4JaybI?=
 =?iso-8859-1?Q?Sa9dVqMhDQmxZSzINzdvGod5MY+3qPW8ktlPgsdi9VInyo+kg0HrlsVCqi?=
 =?iso-8859-1?Q?WCDThDEmtoooceBMsRsrusdGDCZpXeaSQo7F8mdy7KNG7rC4+l7cxVD2m7?=
 =?iso-8859-1?Q?FKkMiJ16WybadjZBCDY5XtPtLmjKdYBdIUFuqogWY7WMS4T6kNKuVXfBMs?=
 =?iso-8859-1?Q?Ynr9odO9WHbLJ7m9QzS7/FouvNOYtFS978B8F5mpwYxMpmSKKso5UnRCyb?=
 =?iso-8859-1?Q?wzZ0WWudfHz4M5cZhS0YtNcoStqxuAaRLJRD3tU0LJTWn6SAwJHqeioIQn?=
 =?iso-8859-1?Q?AAkTv+YON/0WD58yzrJVHy/VPUfeaRB5NwjOktK/vZU/ufwScZVz92Zl1i?=
 =?iso-8859-1?Q?ntDsbcdfgNY46TwvIKi3vMue3bVxFEVlgVoGIuS3cUbdtenJqKFLhEHw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a7c0ad72-0205-44a4-1575-08de17c1d405
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 14:37:18.8385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5QWzF+cOvu+nvhpxkTqYmB0pBaKZWUFCv7Mwoool2M1l9LCY3bS1u6cBMCUO5icDfdOckfbM/PDzP4J+JN6zAA6ifPfHP1uWz7Wgm3Pwf0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7209
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

On Tue, Oct 28, 2025 at 04:24:04PM -0500, Lucas De Marchi wrote:
>On Tue, Oct 28, 2025 at 07:35:48PM +0200, Ilpo Järvinen wrote:
>>PCI core handles releasing device's resources and their rollback in
>>case of failure of a BAR resizing operation. Releasing resource prior
>>to calling pci_resize_resource() prevents PCI core from restoring the
>>BARs as they were.
>>
>>Remove driver-side release of BARs from the xe driver.
>>
>>Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>drivers/gpu/drm/xe/xe_vram.c | 3 ---
>>1 file changed, 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
>>index b44ebf50fedb..929412f0d131 100644
>>--- a/drivers/gpu/drm/xe/xe_vram.c
>>+++ b/drivers/gpu/drm/xe/xe_vram.c
>>@@ -33,9 +33,6 @@ _resize_bar(struct xe_device *xe, int resno, resource_size_t size)
>>	int bar_size = pci_rebar_bytes_to_size(size);
>>	int ret;
>>
>>-	if (pci_resource_len(pdev, resno))
>>-		pci_release_resource(pdev, resno);
>>-
>
>conflict with drm-xe-next:
>
>++<<<<<<< ours
> +      release_bars(pdev);
> +
>++=======
>++>>>>>>> theirs
>
>if we don't need to release the BARs anymore to call
>pci_resize_resource(), then the resolution is simply to drop the
>function release_bars() function.
>
>I'm sending that to our CI for coverage:
>https://lore.kernel.org/intel-xe/20251028211613.3228940-2-lucas.demarchi@intel.com/T/#u

CI came back clean. Looks good from xe side:

Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi

>
>thanks
>Lucas De Marchi
>
>>	ret = pci_resize_resource(pdev, resno, bar_size);
>>	if (ret) {
>>		drm_info(&xe->drm, "Failed to resize BAR%d to %dM (%pe). Consider enabling 'Resizable BAR' support in your BIOS\n",
>>-- 
>>2.39.5
>>
