Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6261FB43D57
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 15:35:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 586F410EA37;
	Thu,  4 Sep 2025 13:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cYOiNtbU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99DD810EA37;
 Thu,  4 Sep 2025 13:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756992921; x=1788528921;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=kk/Fjv62mJMU/HGl9ob9uLi0XxmAd3TCLe3ZiGl3pPI=;
 b=cYOiNtbUBhdxqY3DUwjlqxaeJCsxNT81xxoRiWaOEGwRmOjsdcF/I7rD
 hzQ41rAOCOfiZ3PtAbJMgP0LGQ6TD3CsuhjBI9Hr/Eqgb4SoDi+iAINt3
 KI7T+om8o3QLFtT5lwotzwKHgLrgxEmDRuuEnoySD/Bb4cW0bHYSllU6X
 WEkKvs7CFrLjZ08QyU3FwtJFOJUQhOWpjjdGHNQrbMHqsQHJR9MUEfuVE
 rhlZQS3uE7RNHkQV/z0QbJMZQC75cTPSXZd/yGFGiJiIczGuDqKNsM8XL
 TxCrNeinYTKfl9a44lOJSV5e45MSoG837sfG1dAQRD/RDO4UA8qMNcdm9 g==;
X-CSE-ConnectionGUID: bgv/CJpYTRe+FDkDVmeH9w==
X-CSE-MsgGUID: 7MA68faAQgCp4OSCyK+8vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59441032"
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="59441032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:35:21 -0700
X-CSE-ConnectionGUID: nNtICQDwTzCaLNDqsy0Jhw==
X-CSE-MsgGUID: 0ygurhWxQ5uibEKqDbfKTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,238,1751266800"; d="scan'208";a="172001164"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 06:35:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:35:20 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 06:35:20 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.57) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 06:35:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JaZGvgSoVq0ft6EMXiydlYq4MzPKFaYpOyZD22jWmRglU/EO/YzFpmwBNtnARRiAsVosSgGYzUo64X0ZuFE+BIvLJ8Y29qdZ9lTLX4nDX8EUgLqze/SVPAcQKwQRWQiECbl84p/h9Z5YmBPa655PtLcUz5UswyfAR+9sqf8Psnph4yQB7cWk34F9nmEKw/I3yRfIUIrJKNB1E4777KT7eClxaTezAdlVn4XKkGby1ehbN/UiRz3nvddKNVFfFC5GJkfwA/E3ocVhdWNh9O4epxbuelDbnGADmXGQItT/c20OtuXocVxP0RiOSjPe1+CFQI/QWKqVdXz6SgGL6QblLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zI+6CCoWRijxz85pPd/gNRwpI8umfe0lUMPjZoOmiL8=;
 b=sauR3xUfZb8g5Jemoo8rXqWAIN0NuF+q7O8nQKs7FfNvuCgbCMvaeVdWfvqrCUcGANiXe+CeKaa2nElh2/lDHsnQvzRN9GB89HVxLeS0RsbqR53Yc39Low8EWNs1P/V1W9DWWbzlepE309CoEd4fj3Yjzb1tl+ifasNOgTwGFfWF3iTn28M4JSKnQitI5vf5mBLf3LpSVzAbnK2gP3K5F7iQhJPmwkqUM58AevqtwUFOAJwG/noKyW6Us5shZSm8eVSsKAceiEQ5K+GZAGifn7ktmAmHuVPOvZt87eiRuf649fpy7+70GybiFQFMwcaC/On0S7CYyFLCF01UrqldYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW4PR11MB5870.namprd11.prod.outlook.com (2603:10b6:303:187::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.18; Thu, 4 Sep
 2025 13:35:18 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::8900:d137:e757:ac9f%3]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 13:35:18 +0000
Date: Thu, 4 Sep 2025 16:35:12 +0300
From: Imre Deak <imre.deak@intel.com>
To: Wolfgang Frisch <wfrisch@suse.de>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 6.16.y] Revert "drm/dp: Change AUX DPCD probe address
 from DPCD_REV to LANE0_1_STATUS"
Message-ID: <aLmVkGAtcQ91jne9@ideak-desk>
References: <20250828174932.414566-1-imre.deak@intel.com>
 <20250828174932.414566-7-imre.deak@intel.com>
 <c9355591-0664-4c28-83c6-97eb2aa32982@suse.de>
 <aLcXufMj5C9FPqmC@ideak-desk>
 <01426301-990d-4cd2-a6a4-330f1bd20291@suse.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01426301-990d-4cd2-a6a4-330f1bd20291@suse.de>
X-ClientProxiedBy: DB8P191CA0017.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:130::27) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW4PR11MB5870:EE_
X-MS-Office365-Filtering-Correlation-Id: bc2b7ff5-5ba1-4528-99f6-08ddebb7e314
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Fj2+xXeve6Z4KugxE1s0J1E1mdN5T6PEOvP8bgXxcCizV0pSQ2vnE27LM2?=
 =?iso-8859-1?Q?WQiMHMTi+QSvJLYrUIjOqM5yN8ygBdmiz+Rr+K6lvfjDah6q53nahiVO30?=
 =?iso-8859-1?Q?eg5VBx+mFXtWevb9H+/as7lJmXsBkMWW+N0vEedMmniH+K525WOO6YenHV?=
 =?iso-8859-1?Q?ybYOiPCldfSpXnGrBBNvVQcKsoiEdyjzNIz0Rse0LRVlvAPrgWLkXZ7jMj?=
 =?iso-8859-1?Q?ZdnccCLt0d+zS3YSlYOEMLY4de6H7k24Ez4GDEWpROsi0g96Ff5Hq7n4fl?=
 =?iso-8859-1?Q?Iv2Th41xuZrzeSw6u6csc+jFFU5CVNo3ogfNF0jDEpWITj2VwhP05Al/s/?=
 =?iso-8859-1?Q?bgKeND/ziTO8iDOHCQ6+3MuzIE7y0SUnj/qkZ2NyYRvMwX5pzMH7VMHQ7t?=
 =?iso-8859-1?Q?vOGECZhnsd1GBaDjW4Q4x7oRAKJl07Yn5zvN+/J1ar1rJoZ7wbBVHYzjUj?=
 =?iso-8859-1?Q?KyWV+MThRq9w03zGkYTyB11kJL5all2rPByB3nrLzBrBpXR/33QWZHJOT6?=
 =?iso-8859-1?Q?Va/oA7s8vMVbnvHw5BdHwsZO4Pesjfmt7Py0AeGR6URcFGg43TP3HShzIP?=
 =?iso-8859-1?Q?CtpZqGwOncRw4YIObEumkT/v7MEHEU/B04uv8gIPv4QJEqUsuPH/N4TSZW?=
 =?iso-8859-1?Q?CbA9qD1EkFHuPy3tNYzN0niQx4m/m/gJxlUF5wXPbhW+HJbMIvK10DSBIt?=
 =?iso-8859-1?Q?NYSg1efhtjagNH/upP9tx8wPWz3+71ySkab6SZSC3tz4WcYPpXf0u26vc0?=
 =?iso-8859-1?Q?jjFgZr6FZhzO+6NRUFHxsLhtAxYV1nLz9w18gyO9ktxPTOV/CrzfIbalHk?=
 =?iso-8859-1?Q?kwebf1wwVa0JexrtNsxQJRXabz3vAf478EdvmMVJ6yuByahXzi5LNkiCqn?=
 =?iso-8859-1?Q?uRKd/p9SWjED3dLQ5RSvXsoIyTfKBFoV5tkRyB8Tf27itcildSHa5/XK5u?=
 =?iso-8859-1?Q?gMng6DHcnPEdUlHK1kuLTGWCZpz5qrtcPaSX5gkwyNIzi9tBtcSER/LjAt?=
 =?iso-8859-1?Q?DDlRcHn7DiC0vC5HPfAO7ZVS93P8ifaU83pX1mfjf2jxLttzwHtpXWH1p0?=
 =?iso-8859-1?Q?DM+1YJHBhMf7I/2dHSropHgN4hroTKMxNywx+D8LWbmL6t+aKcOV3B1hAq?=
 =?iso-8859-1?Q?/hWVEGUFLb+skkihUeU8yurGgrbtk5qw/RzfySfPs+vKhNYtQbKfUMsBng?=
 =?iso-8859-1?Q?SGXA4qXi+mA0QRhnE3RhLo/eCYriT0xvP70ZZn6c6l8pOXOT/EzKJKiBpt?=
 =?iso-8859-1?Q?Ifsc8m/df5NRuv1Wz3I/2ju1cVJlf/p6A68yVy3NtMYEaBzDledVfumSOM?=
 =?iso-8859-1?Q?aaUsTo9kEgLc5QXAWb/WO6vV+xqJMnKFh5AoX/gjodxs7LoYp5vmtL8ens?=
 =?iso-8859-1?Q?MPSmzEfixxJy4MTy128MfwdjLw24DassvI9vDsTN5ZpotdlaTceMQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YTFprSaxCxAHtfclOGT4i1MaD1p5GTSOiRwEdF6Z0QQSTgCC7qvwt4yJOS?=
 =?iso-8859-1?Q?mcOW4+/eXdUuHfDguN/lObvpPEdD+5jQ+egb/rnenqq8n5Y7V3gX+LWAjd?=
 =?iso-8859-1?Q?kPJb12nu5x3phnI7tO+AccdQn/cmMKVtJL6LSAI/80gn6g3PqJR4v8uFzL?=
 =?iso-8859-1?Q?JxmqYBJAqlNGwUAy/bdmLR2xA0MrJHwW/h2RU7dn6vnEVUAANLFv02MVNb?=
 =?iso-8859-1?Q?/z2z2OPrlHXXVOHDrLLBMqaG37g9LlLnyNJSrW7tNMwIeul+DDg8k9e5kB?=
 =?iso-8859-1?Q?wcWDCnY9p6xu4zA3cLZkHvg2kAQMnkeWArjJvW2auNbmzBXg1mspxl7gIf?=
 =?iso-8859-1?Q?zH/ibd+3+Agl7ym3r+JYtO33FongjVJlr125A92R5IFhXYE7TNt/g7vlob?=
 =?iso-8859-1?Q?pDa8n2rCbd8GGx9/u/m5JsajRJC5eZwPfHIhVbDOeB/CdxFW790TtcFeHW?=
 =?iso-8859-1?Q?YgTSI2J0PPXFFXfp4GEN98Qs73teQyS/4QTwRwyKnRMMw+YZ53a1ZDCQer?=
 =?iso-8859-1?Q?MwXmJCqhueEQsYPcmc4oCXDQCIT8Wn4FdZgPbI0rjG3AG1XM4nJQsPvTM+?=
 =?iso-8859-1?Q?nPKBkDUgSIykhbY8VX06Wv0AYLsFK9fW8n5ZUN/yKwyU0eqXujAjyIv9MR?=
 =?iso-8859-1?Q?+sefbqf5LYcY5t/i/C4kFx7B2gRuVvfqlpLCPYM63TFwcrYPOh97oADn//?=
 =?iso-8859-1?Q?949ns3/t5K6mSrORK7goHvoe92gfIoMym1mIhT2Rr8/MB7IuCfXCsHu9oA?=
 =?iso-8859-1?Q?ll5Lge+yEVay+J21BY3EyL5+ezATz+vGYZgYxsGNNz5y01J4zxeqyQ29MX?=
 =?iso-8859-1?Q?oblNWrnrM7prsoQ/eqei9w+mpLBxqSiCKQpwaH6sHUhGc7Gds0jU59X78L?=
 =?iso-8859-1?Q?dhYc4G4cdel0lmhrcWDohLE+LLgs8XUEpTaoD3bltHLL58xId4a5uhfBgc?=
 =?iso-8859-1?Q?jg9KbuR1Tj1bv6dPGqWuTjx7H+8q5SJhoRJueq50ZE57/YeYAGszFikvKg?=
 =?iso-8859-1?Q?lbiHM9eBJE4NHkU5L6xGIA06XmYS+63vYEiBS1LBXhlLMaGmTqnCL6xIQx?=
 =?iso-8859-1?Q?9Wpz9w4O3NbGjNQf9Nddw4WFFIr51ZE31SlCzEht4WxHBPtu3/PFqfNkQ4?=
 =?iso-8859-1?Q?iYNmzJjlP2xXYUgqWLHP5fakff1QvmG4PxLUakfps69dx4pbbn8HcjiVpJ?=
 =?iso-8859-1?Q?97UkTIu/4Wgkw940eaZN1vLLOqgDLDaorwu7dMDol5HVi99uHw0yVu3d7O?=
 =?iso-8859-1?Q?zLIs5WfEHci7fZoMmzl8k1U6mc8GOOfKQmLarz+NNknDHjUPWEZC8byqXZ?=
 =?iso-8859-1?Q?bejEMwhRr32OfOebN5QWhtvpV8GwfRO7l8lODZaTSUCCErbuNJRrgmDKou?=
 =?iso-8859-1?Q?4ISzamsmoI1OrHvG/lLjwrwHrjzZXi4fZkv8G3qXtYgxYUt/yMDTBBI71d?=
 =?iso-8859-1?Q?0uUmaIPdVTUV9aJOf5xYNrlckuDpaB5y8hh7DjMVNAAh8SsPXj1xk/yaqt?=
 =?iso-8859-1?Q?NKThafjh35cx55vA5wAlX2rDlkLnWZdk8VZH82iDYV6Uvxz9UtW2EyLGDX?=
 =?iso-8859-1?Q?AQwJMi+IoPBtrbH0sLxZzLEJJmR3EOzeGhE2MqHmY1sLNc7DB/KNTSnpSB?=
 =?iso-8859-1?Q?qUGLmJ35SrstGeabMKSQPRXAmT5hib5GpOpzS7iBd0qRX9muXG1TmhvNBP?=
 =?iso-8859-1?Q?ePh8LTj/HrK9oZiRSudasv+EVWR2kaiiZlPrGqKa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2b7ff5-5ba1-4528-99f6-08ddebb7e314
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 13:35:17.9844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0If9qTavDps9VMlmEsCrHHcmX78VeQH1MT1am6OyKCA1WTQeEEPsq+JO7PGAyjSuTAeKd4o7yLrkcp1QBEI+eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5870
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
Reply-To: imre.deak@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 04, 2025 at 03:20:23PM +0200, Wolfgang Frisch wrote:
> Hi Imre,
> 
> 
> On 9/2/25 6:13 PM, Imre Deak wrote:
> > This looks like the issue tracked at
> > https://gitlab.freedesktop.org/drm/amd/-/issues/4500
> Thanks! I wasn't aware of that issue being tracked already.
> 
> > The correct solution there is to disable the DPCD probing, which AMD
> > folks are working on atm. Until that, could you give a go to patch [1]
> > on the above ticket equivalent to this solution, applying on v6.17, or
> > the attached patch achieving the same on v6.16.4?
> I can confirm your patch fixes the issue on v6.16.4.
> > Also it would help if you could add a dmesg log on the ticket taken
> > after booting with drm.debug=0x100 and reproducing the problem (vs. two
> > other drm.debug=0x100 logs, one with the above DP_TRAINING_PATTERN_SET
> > -> DP_LANE0_1_STATUS change and another one with DPCD probing disabled
> > as I requested above, taken after booting up and connecting the
> > dock/monitor).
> Done. I attached 3 dmesg logs to the ticket:

Thanks for the testing.

> - GOOD: Linux 6.16.4 with DPCD probing disabled
> - BAD: Linux 6.17.0-rc4

This is expected, as it still does DPCD probing leading to the original
TBT firmware issue tracked on the above ticket.

> - GOOD: Linux 6.17.0-rc4 with the probe address set to DP_LANE0_1_STATUS

Switching the DPCD probing address to DP_LANE0_1_STATUS is not a viable
solution, as it causes an issue for at least one other (eDP) panel. The
probing should be disabled according to the following AMD patch:

https://gitlab.freedesktop.org/-/project/4522/uploads/5205fd4e2bdc396088836bafcac176b6/0004-drm-amd-display-Disable-DPCD-Probe-Quirk.patch

--Imre

> Regards,
> 
> -- 
> Wolfgang Frisch <wolfgang.frisch@suse.com>
> Security Engineer
> OpenPGP fingerprint: A2E6 B7D4 53E9 544F BC13  D26B D9B3 56BD 4D4A 2D15
> SUSE Software Solutions Germany GmbH, Frankenstraße 146, 90461 Nürnberg
> 



