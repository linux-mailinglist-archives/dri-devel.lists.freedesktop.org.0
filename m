Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0B697B45F
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 21:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F2510E4F7;
	Tue, 17 Sep 2024 19:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KPJcr3aS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1BC210E4F6;
 Tue, 17 Sep 2024 19:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726601684; x=1758137684;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=fI7799zJXNhH7uplNRNmdFAYvVQnDyMWtmHXiDyG9ZI=;
 b=KPJcr3aSq7nCpEngx9gMeDz5kmY8Nt3ydEyam/ZQ5ejnZov/Ct/sAaFa
 D0NByFmUofuIGwZcHyA6HVee7iLZkrduPKxSH9LkWtkGGOl23HVXzr//g
 DBswBeWBqINREDiifj0nnmjiQTwC0j8I3JNldIqWK7bJxLWj1A34bDW1s
 4FwAfvcOXT1T4OWCpkCNOUppV44DPG1a7MaukiQa0It4fnaaGAiNTq5Kz
 YoUYwKc6Uz/RMFJuL7Ezga3SiaA0PIvA2K6g7PwwS0X7HmAeLTYUs+ehj
 GuJ+e/T8qcDnucaVKcfDa+ySGWn5z1BJdUqkv6/x/OVvgl3mSNWkQA8+O A==;
X-CSE-ConnectionGUID: GZPpprLxRUq42D2cyG+9qA==
X-CSE-MsgGUID: QEshFr8RSLCfq6xGeZDsug==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="36069595"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="36069595"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 12:34:44 -0700
X-CSE-ConnectionGUID: aOr4UhkzSxu2IJY9OZ2GNw==
X-CSE-MsgGUID: 7RBQ1cAdSa+TmYJnaAVocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69165955"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 12:34:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 12:34:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 12:34:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 12:34:42 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 12:34:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cTIEXJTuOu6cWk3DWi54b+5ZTCoobHAxFXkzh4dcwYL0yFfQKSkYAS3KPyBF/e+pg+sIj3O6naHw5njnAy5Kr+UzisFUpOnR19QALLcN8z42dGktxzbeemX/1I3xUYx3Xy9PxbL+hfq37g9d5wsGrge874o3UPxYThszSOOgDU3iqiSOqKyEDBpEpHJOEmJM8Ys2D4JTDUctmeKDm3pPOu/rPHyjABajPDbloZUWzeOztA91X8xutKGZGh3EWugGABZFOsfLGET62p5ZwWh2aBh+hvCTVXrQjQyaCBmI7mjAhUAIPzEBzrwUqCb5yKGkL9PfXTqh/0+IqWz7xDDTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gs6HfJFo5VlFn3i4NcMn0XWXKyHjw2yH+MXPlCcPp+8=;
 b=rvNklhEF+ZckUitA+c/V1TdhKYOLnLoUbph67TPYPt7O1rCVG+U8BYwa9Zkbpt3RwJiat1UFDWXolhwnCpoe3DHEzbCDprPwmWonalxdD8tSyawNv9gWstDTZSQ5BJPoWCLrT2UPeGt0upqthZOwjl95FOXw2ltjYtBruea0PMBEoiw7GXFLXzXOzVlvzmMwAPdlGuHaG5P6ugcnCk0NT/FUxnfWOK/1KQrqEhjnmE9fXWjIgwIYPkIZXksZ9R+ALTX3h2iKHnDy/Uh3t/9KRbedkl7o77pEeiJBRIsBiG9bW+J7YnpU77DvO+wNE8I/6qmQHNBnqwppoZHHMhIRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by BL3PR11MB6315.namprd11.prod.outlook.com (2603:10b6:208:3b2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Tue, 17 Sep
 2024 19:34:38 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 19:34:38 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
References: <20240917124449.223206-1-vamsikrishna.brahmajosyula@gmail.com>
Subject: Re: [PATCH v3] drm/i915/cx0: Set power state to ready only on owned
 PHY lanes
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <skhan@linuxfoundation.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jani.nikula@linux.intel.com>,
 <joonas.lahtinen@linux.intel.com>, <rodrigo.vivi@intel.com>,
 <tursulin@ursulin.net>
Date: Tue, 17 Sep 2024 16:34:32 -0300
Message-ID: <172660167214.57276.12139169672475915963@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|BL3PR11MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: de5f5021-3794-4129-e8bc-08dcd74fc4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dC9kZFBEbGplRU9YYkpvMmlhMS9EeStVeVVSMjZZZDRNemJ1VitsOU9YK28r?=
 =?utf-8?B?SCtWYnBKUkQ3VCtGRVNmMEVoM0lDWThvQkx0VWo3RXBpQ05kVkhDOFhhVURp?=
 =?utf-8?B?N2hrT2FKeGxhLzMxRlliU0U4R0RJUi8xd3JQUGRkaHdRWWUyYU4rakpDNmFY?=
 =?utf-8?B?cXM4U1BoWXFjTTRCRW1obmd0cTdVMjU1RjJMM3FVYWZ5RWlrYldJRGlKK2Zw?=
 =?utf-8?B?dXdaVnJjSTBsb0phWGtSSlhqRFhhT1FKOTV4azZqeW4rUW1UYUhlYlVMNUU1?=
 =?utf-8?B?b3U5M0djUFVUUEI4STJNb3B6R0JqTXVFUmZDOEFGTVFORGxtcjd1SkhiQWw2?=
 =?utf-8?B?QlowMnZ6cWtSVU44M0Z4UGVEUnRoREJDYkZoVDZuTDhYQTFOdDNQL215cUVN?=
 =?utf-8?B?aVJ2VndCdW5FTEpsWGdnaG9VaWMzVDc1aElEK2JhQWhMZm03QXNHc2pvNk9m?=
 =?utf-8?B?V3NHUmFzWGlxNEl6OW8yV0d2NVpTc2hkUXdVT3BlcklPa29ZcEFQQlc3Nmpt?=
 =?utf-8?B?QmxPMkNDbDlvaEJXSnlOWGNMVWF5eXhnME5jNkx5aE9maWpoRU1SYUxmOGEv?=
 =?utf-8?B?azBWdUEyS3lnRU1xRFVHb09vSUhxVmtnMWkvTXZVMURhOTdWUEhFdWdoV2cr?=
 =?utf-8?B?VWt4VUxBZGpnemV2a1N3aTBXZHhzMnFsVjRtTkxBQlN3cjZsV3pDbDRFS2N6?=
 =?utf-8?B?TDR2RzV6aDFJQTYvbVd6b1pOS0txa2YvZVh1YzYyUlF5L094SEloQkQ1VHM5?=
 =?utf-8?B?Um9UZmhPVGxlbXVSZ2srTGMwcDJwN2MrRXJBalBEb2FlV0NYMDFnYVdjMjR6?=
 =?utf-8?B?RlQyTGNPVk5uUU92c25yZkdCYVNWdUs5WEN0TjlQaFhqa0UvOW5UNmpSL1NC?=
 =?utf-8?B?S054NklLZGlFUGdiYjRBc3YzcGttak5UdlI1MGErRDZsUWthem1Mc01CRUNS?=
 =?utf-8?B?Z29qVEdLV3B3aGFKbzloREpQWWNnbFpzOFg3N3pweEJBaGNESjVXM2pPaWNM?=
 =?utf-8?B?SXVKalh6dHhESGlZMFgrR1FxQW9GekhGc1pId0VqY2d0ZUpiQmw0cUtGaGpN?=
 =?utf-8?B?VnFUWWhrNnBOd09JZWUrbmVJTHNJUEJ2WjVPaXpkK2IzWDA5UTFZZVFvUk5N?=
 =?utf-8?B?VHhCYzlLR20vbFhTR2lGVHU3TlhqWHRIL2NaSGhuNDQxQ1RPc1hwS1V5dlhO?=
 =?utf-8?B?NjQwNUtHbnYyZTZzem1GOHFPU2dwMVNwTXZvSUwxblNMTStodnpVYys5N3hq?=
 =?utf-8?B?SlBLcU9ieUNxWGJheXBGQ2JtdzhCekxqQnNPV1RXQUhNQ1ZxaS9MZW1xUTl6?=
 =?utf-8?B?RDNEcmdLeFMzM1hxQjUzNUVOREpWUnljdzZLOXFKQ0VYQUxEcGI3VnVKcTdH?=
 =?utf-8?B?OGxnYWpqaEhGaDUxNDhsMzVYc0RFb0RPLy9JemdBWkV0WEVDMFl0bStnSWxq?=
 =?utf-8?B?MXoxeTdXRTlYaEhPcFU2bzJHTVR0bVNoL1RKZHpKVW9qWVZNWTBNK1lZN3NU?=
 =?utf-8?B?ditBa0xJWU5wZklRT044RVBGdGMzQ2RqZmJtaVA3VWl6eGlCL25rcy9QUk5w?=
 =?utf-8?B?ajJXRHdhYzlOK3JzOE93L0UxNXh6UU1QekZkN2wxTHlyKzJjbFJQNCtqRTE2?=
 =?utf-8?B?WHlPSWx3UXdmQ2hPbHY5aXFaSW1pOXdQb3VGbVN5OTFzSUszQXYwZk5LcmxJ?=
 =?utf-8?B?Tm4wcWlwMHJwM2lGK1FtNEZyZkQva0pXRlVVT2h4V0V4U1ltcmlMU3l0QkdI?=
 =?utf-8?Q?AeUB4wiz/oFcHoGevw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czV1UzZIdThCclJqOVFLbUFPZGZoNTMrNWgxdk1hRG9BdFJkOWpaQ1djMkJE?=
 =?utf-8?B?aEZmTFhzQUFoaFV1OG9TaHA1bFNlTVhpbkR3NDJKamJxcjdFeUpxbXdkeHJu?=
 =?utf-8?B?TWt3Y2RkNTMvUnZsbzYwSlk3WVVLMFVBZlRDN2Z5R1EvU3JjYVNROUlMVjQv?=
 =?utf-8?B?SmkxRjZScjZHaEdFUlFIZUhmbTNHemNoYjBZTlc3L01JaUFrYTNYalpqT1J3?=
 =?utf-8?B?S3lpL21INXRpVEZpVXZteXM1S2VzV3FrZDdtMlU1V1QzOXpreEVra1oxR1RX?=
 =?utf-8?B?V201MWQ5aXN0R0xSbTBmTmxOa25mRTBta2g0T0psUG9TZDBSQ2M2TDZhNWJl?=
 =?utf-8?B?SHBwenlQK0ZaR3kvMWtZQkhOTEVQTVRnVTNTRXhRNTY5U3hJaFc5R1dMcXdT?=
 =?utf-8?B?UHczOWF4ZGk4aTUxS3hIT2w1WVJVem5pYVZvcUNHcHpnVG5qeVZzU3NCS1Jh?=
 =?utf-8?B?YXRNeHB0aElCTU9TaHhXaktyM1FZUHU4bFR0bFB4YVR0ZFRkNE5WVlVSbFBU?=
 =?utf-8?B?ZVVKUkFaaUlxS25HY0dvQytVUFBieDhuTEhMNnZpeGZaU3JEckJQM3B2Yzgw?=
 =?utf-8?B?dDZDN01kc1dyRDNwcndsUFdqNUg1NGlGYXRXLzF6THF2RmYrdDF3dkdLRlc2?=
 =?utf-8?B?OUpmZWkxaER6SHV1R0pkNXY4TU5May9IREdUMWI4NUlpbnYzQWI5TnJ2RVlp?=
 =?utf-8?B?bU41dDVlOGN0V1A5ek9zY0VyalAvM2xUWGsrZ3ZVcmh1Z1JCVVJJdHZkZjBk?=
 =?utf-8?B?UytNU1U5cGEyVTErZFpqbXEvMEFSWE1oU2hMVlF6STdBY2FLeUY1V2VEWjZY?=
 =?utf-8?B?RHh3V2dYcHZOZk1KR2NjT2lCUGx1N0FqR082eGlqdTN3OG5oTEJPaWE4OVlI?=
 =?utf-8?B?M2RpWFh5SHZHNWZac0MySG91UjdrL0svY0JVbWt6QWlXVFpkbnpNdE1XWXZ5?=
 =?utf-8?B?eTZGZ3FscjlpcG5MMWxyRWpBbFZNeG1uK2E0OFc4aDhBemJaa2kxOGE4cGJJ?=
 =?utf-8?B?c3ZqYmtNWEt2ckdVd1JSQjY1VGEvTmd3K2dlYU0zT1Z1NEY0YjdsNVZhMzF1?=
 =?utf-8?B?c0N0a3FyaXAxbGRHZ3JBbVhtcDg1NDJFNHBYNTIycXVIQlJadkRETnppSU10?=
 =?utf-8?B?TEZKRWlSY054ZDhyc3pWSW5hUFNCS2UzbWUwa3VBK1ArQSt4elY2MkFic1Ev?=
 =?utf-8?B?RWJ4ZUhGTWxiK0hOeC9LOFpTd3JtSk9xWC9rRjN0Ty9NUlVxdmxCMm5MOEpN?=
 =?utf-8?B?MHpEUHl1WkFvYU0rVDR0akxuSHkxMjY5bUlSZWRneDhadHJNRHhZQ3AzL0E4?=
 =?utf-8?B?K0l2MEVVRVNzd2Fmb2F4Vk9VS1BnTzdRNkFMOStIazVweUlKNTJjUXhiRHhZ?=
 =?utf-8?B?SStxVHMzb2lqSUd2b2JtTmR3N2N0bURBL0RpNWZiNHJDeGdsY3F1YkZ3SmFH?=
 =?utf-8?B?bUFvQ1N3cmJIMEVqSDlWQ1BBZUNCeWN6WEtwcnJSVUhOeWI3ek9TRDFVcUZs?=
 =?utf-8?B?Tk9XMXZYSkhtTmxYL3YyYXdRN2w0dm9JTTdCY3RiM1AxMmlSMzhubWFweXZ6?=
 =?utf-8?B?TDlicjFaMmRhYlRMTjBxUjlLSXBhQzVDNGhETmtpTkNIS2ZkMnRwT1RlWHNM?=
 =?utf-8?B?NG1Ia05DR3hvUk5vM3FnR2kzZStjc3pvT2lwb090dGdabXdpaEVxM1A3NmtK?=
 =?utf-8?B?b29BY3paVGQ3M2s0azZ2aGU0ZGY3NERTcEtIckkyL0p5bE1XNXBLR3J0bTVJ?=
 =?utf-8?B?SHdMR2Zoemc5aDkvZVVURnJBN01RUVZQRm5IS0EwQXUyZWl5ODVVK29XeVow?=
 =?utf-8?B?L1hOZklCVkVLNVRKVFdrVk0zWW4vb2hxRnJLUDR5MmlTNjNxdHdleHU0SXM1?=
 =?utf-8?B?bVRKZkxRVDRiQ3ZUdHBGVk9VY2hKM2xuZ1dSRDFhWTBtQU12VGFDWDdTZXJL?=
 =?utf-8?B?eXB0Vm5vS0gzak5acndESVl6eEY2SmtlalpZSzhFQzJOM2wvdFVhUXJRdGxQ?=
 =?utf-8?B?SjdkUUZuanZsOVVGWnhFSTYyOHRweG96Q0k4S1FFUytMMU1HZ1ZTRDh0WmZm?=
 =?utf-8?B?Y0ozSlpZTUF3SUo3K3ZYMk95UWt4ajJrN2FHdk1xWm9tMFpiRTFrZjJVTXg3?=
 =?utf-8?B?QmFKUEhWYzBpcktGZysyei9xL0dzNW4zdHh1Uk11bU9Yb3dSME1LanpDcFM4?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de5f5021-3794-4129-e8bc-08dcd74fc4bf
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 19:34:38.5334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KHdVEgYbPOXQMRVp85exczsTMaFec3kC4el46AwB9TB+ImDnezNLUEiqss7tklC5OsTRWeBPIRp6QBR1CQkjRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6315
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

Quoting Vamsi Krishna Brahmajosyula (2024-09-17 09:44:49-03:00)
>In DP alt mode, when pin assignment is D, only one PHY lane is owned
>by the display. intel_cx0pll_enable currently performs a power state
>ready on both the lanes in all cases.
>
>Address the todo to perfom power state ready on owned lanes.
>
>Tested on Meteor Lake-P [Intel Arc Graphics] with DP alt mode.
>
>v2 -> v3:
>- Fix changelog per Jani Nikula's feedback
>v1 -> v2: Address Gustavo Sousa's feedback
>- Use owned lanes mask to set Phy power state to Ready, instead of
>  maxpclk_lane with DP alt mode check.
>- Owned lanes are obtained from intel_cx0_get_owned_lane_mask().
>
>Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gma=
il.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

For some reason this is not showing up on Patchwork[1].

[1]: https://patchwork.freedesktop.org/project/intel-gfx/series/

--
Gustavo Sousa

>---
> drivers/gpu/drm/i915/display/intel_cx0_phy.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_cx0_phy.c b/drivers/gpu/dr=
m/i915/display/intel_cx0_phy.c
>index 4a6c3040ca15..cbed53d3b250 100644
>--- a/drivers/gpu/drm/i915/display/intel_cx0_phy.c
>+++ b/drivers/gpu/drm/i915/display/intel_cx0_phy.c
>@@ -2934,6 +2934,7 @@ static void intel_cx0pll_enable(struct intel_encoder=
 *encoder,
>         enum phy phy =3D intel_encoder_to_phy(encoder);
>         struct intel_digital_port *dig_port =3D enc_to_dig_port(encoder);
>         bool lane_reversal =3D dig_port->saved_port_bits & DDI_BUF_PORT_R=
EVERSAL;
>+        u8 owned_lane_mask =3D intel_cx0_get_owned_lane_mask(encoder);
>         u8 maxpclk_lane =3D lane_reversal ? INTEL_CX0_LANE1 :
>                                           INTEL_CX0_LANE0;
>         intel_wakeref_t wakeref =3D intel_cx0_phy_transaction_begin(encod=
er);
>@@ -2948,10 +2949,9 @@ static void intel_cx0pll_enable(struct intel_encode=
r *encoder,
>         intel_cx0_phy_lane_reset(encoder, lane_reversal);
>=20
>         /*
>-         * 3. Change Phy power state to Ready.
>-         * TODO: For DP alt mode use only one lane.
>+         * 3. Change Phy power state to Ready on owned lanes.
>          */
>-        intel_cx0_powerdown_change_sequence(encoder, INTEL_CX0_BOTH_LANES=
,
>+        intel_cx0_powerdown_change_sequence(encoder, owned_lane_mask,
>                                             CX0_P2_STATE_READY);
>=20
>         /*
>
>base-commit: ad060dbbcfcfcba624ef1a75e1d71365a98b86d8
>--=20
>2.46.0
>
