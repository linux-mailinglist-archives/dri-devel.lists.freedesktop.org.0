Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1746BD2CDA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 13:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B9E810E437;
	Mon, 13 Oct 2025 11:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fFrmjoQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B643110E431;
 Mon, 13 Oct 2025 11:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760355415; x=1791891415;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=c7zPjvArf6sjLqfBL7pZUjpnoBbAK19FmJwaGgBmszs=;
 b=fFrmjoQRMaNVb5GMLp4EJO0AzTyVumPb0aa3lN7/Up/79CrWB0jL3Je6
 J8d2fAxtPgl+Uq7MPxnw9RnRVWOFBZOBKmZ4AmmZFqYzhUgVgLK7wy4Wp
 n+AWF+OwQMW9ZOMb/qxkDh9orYFHghr1E9GfE/07r1sNgHdIGPSt0WVFN
 c/Cg6hMp+mSukrw6fANFmplkWrBY4BkfVEhvnGYtU6GncDLOX+ESEQu18
 8fMj5wxJ2BMyShOnPi8pPsC5TK6eXsb5ApOhXyrhfT+6O9Q5ngVqbY7l5
 nsoZNxFLiR6ktR6dxalYt1YsMFHjHkMWn0M9Cor1SbE8HW04KXFNu0nHm g==;
X-CSE-ConnectionGUID: UOo+BH+2QGC8zEWsdKjtXQ==
X-CSE-MsgGUID: qtyGMG8iS2W3EPcbDK5akA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62405468"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62405468"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:36:55 -0700
X-CSE-ConnectionGUID: FZEPJsVLQCeOw2NHyped+w==
X-CSE-MsgGUID: CQbTJ6lETsWp0szKuNduKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="182010395"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 04:36:53 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:36:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 04:36:53 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.42) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 04:36:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOtynCEQdOkWSioyNSyqKlLduudrwgGs3MJ3dWD5CJJuliwkitmqb10G8cixiwc84hayDZi7OQgPLjbO805gKfy++qvVkxRkOGRgyuFkdqSqiHWbfFG4Kf66fYz/nxS9snPaV2FxcZA6IR3CksSzjYWNAReHF8ZNimEK+xd/IbBiLWtNzu2d5ZTBH2MNoAid12rr4UAzZBdTEOzDNKnpLvixyQTfE7rHeU2PJs0hkODg+suDiES9yGB/5lNczcrMsP7A9wnSZkAQq35t9A4G1opkrcXsFdv10z8HnJMQS57Y+GsOvfpX4nujXwh4DkQz6cItFeJNhvNrtxm6sSQ7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIVDZeRA0W9vRDUB/GhrXCwLvuAK2Jp0BebN7nCP3GY=;
 b=CKzQBqNxIQv+W7frjHkrwTZAqngOeXlnHTk3cARLbF14XP2terrhXXsecsiOXgpDlq7cYPPCmgR+gbL/u+2ePyS5pIxgtGTv8FMKwrrD3e9eYcizgM4/Qt1uxiGyt2pzK4j7ujVsipvsyCI7cVrnhLv21jxgRoJNBI5JopwHr27gO4N70BEKrHbrNtvUVoGiSpj3sjxlAxVfdGcojd7f+ovmzFYVSrySSxDB1X3jpymDIlDxlH85uGnX4uXBxJ8Bi3/qQUKtya/SQQ2RmTyALcnR831XCXbdzmD4qrGr7QIQfI3rbhh9ihMc2gYeJmZeZBocUxwwfFQXOYcXVdtJLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ5PPF77ABF615C.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::836) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 11:36:50 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 11:36:48 +0000
Message-ID: <4ba6ce95-91d5-4d09-93bb-d50da1c11cc0@intel.com>
Date: Mon, 13 Oct 2025 13:36:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/26] drm/xe/pf: Remove GuC migration data save/restore
 from GT debugfs
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, <intel-xe@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <kvm@vger.kernel.org>
CC: <dri-devel@lists.freedesktop.org>, Matthew Brost
 <matthew.brost@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lukasz Laguna <lukasz.laguna@intel.com>
References: <20251011193847.1836454-1-michal.winiarski@intel.com>
 <20251011193847.1836454-14-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251011193847.1836454-14-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0307.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::8) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ5PPF77ABF615C:EE_
X-MS-Office365-Filtering-Correlation-Id: 36572f88-673d-43ce-eac5-08de0a4ccb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWg2dVQ3aUw3aHJJM0JVcEdqWlhaUHJTYTJ2SnRBRTFSNVZRZkU0WUpJNWxK?=
 =?utf-8?B?ZWM1RFA2VXF0V2d5RXBzQ2xPc1QyaXIzTThzUUF1VHl6MUtYUkZ6Rm82b0tr?=
 =?utf-8?B?YVNBcWZURWhZTG1hZU1pREhlcFpWWU55alVPNVpyY2pTZDNvNzh0NkJSM2JE?=
 =?utf-8?B?cEFKMDl6QmVtdklOeUphcU54cTBUcjJpeHpBc3lVRUlxUWFSa3FwYS9XSkRp?=
 =?utf-8?B?YTNuOFNZUm96Y3FQSG81SUh3U2xGMllRNXNyczhYa3JTQWVIK0Ryby8ya2Q2?=
 =?utf-8?B?T3hzQ2JlMHJFZDR1REJ3UWpneTlLYTViZ3pHMkNGdDI5LzlqV1E2cUx4bkRE?=
 =?utf-8?B?YXdXak5ERnM4aUFZNWxFVURUbHA5V0hyQzJCUDY2a1NlUUl6UXJYTElqRllM?=
 =?utf-8?B?WnR6TSthQ281bDR3SEJ3eC9oOFNheDVubm00c0hrV0dTZExJMXBaYjhlYWJY?=
 =?utf-8?B?VUNxV0hPUndVN21IZWhlNXhha1JpOEZwQjliMlVVbzZ4bWFnN3grZG5DQWVQ?=
 =?utf-8?B?bTFnaW9ka1FhQ3VHbjEzYUVrQVlqckdLb0hiem1NNkV2ZFV3NENzeXhJeWth?=
 =?utf-8?B?cW9QWTMwUmlZZm5wVjFpQTJ6RHVycUZMRXc3YlhlWmoxbGxJN3FIRE11K2Z1?=
 =?utf-8?B?bE9yR0JQTExsd0lIZ1FLZklONS82TzBzL0ZBdmNvRlA3SHBCdFY5TG50MjRW?=
 =?utf-8?B?T3dySHFqUVZGNTlicGIvc3RrUURSUEtLUnVVYlZQTkc2VklPWGNPMVh4cmVr?=
 =?utf-8?B?TWZkWWpYNHJNc3JScHppekFWUVdWaG53ek9KUVpOSktZQlJ1aS9KcDBNZXRO?=
 =?utf-8?B?Uml6NklFYjIyekMwb1VNM054V2J1YTloTm1mSUZrQ0FNM3N2Qk5TeDh3b1pB?=
 =?utf-8?B?RmhUYy9BSGpneHFYakpuTWJxMVZOTGZMdkVWZXd6MHBHdGZxTlN1QXRiTDd4?=
 =?utf-8?B?WmJVQUNjcEk1K05FNE1Cb0ZaNUptZ21PYnZvd2I1M2s5N21BbUZ2Zkk5dXF1?=
 =?utf-8?B?YTRUR3hYeXg5Q3VCYlNSTktDOVdtbDBDNGdlNGs4SEJqSmdtREtMWXhUeWRq?=
 =?utf-8?B?RC9oWU9CL1o1Q1RnWkF0WXFUSThoMkUxVzhLYmRjbWVnK2NFL2JwalM3a1kw?=
 =?utf-8?B?aEZUcUt4NVNaOENUTll0YlRzRjdSM3ZOMlVQYXBHRnhkV0xHVWNYTGJ1Qktj?=
 =?utf-8?B?UWNTdlNPMDNmNGxCQk9TTVU0elh3dE55SUFua3hFRGdubThDQW9FWk05WWlJ?=
 =?utf-8?B?VnVQOGdkeFlhdVM1dG8wRnNjRjVseDF1UnhtMm8wZGp2c2F6YjBRZ3ZXSVQ3?=
 =?utf-8?B?WHRQZ0ZsZnpQOVRiVHVTZWxjcUpnVk5Qdmc1dWd2Y0cvNnAvUEpKc0tJUUND?=
 =?utf-8?B?d3BQNXdyOUpqOENLOUVPMTdqSEhVcGFHZUsyMkZNbVdtU1Y1MWpjQ2FTWVcw?=
 =?utf-8?B?UG1rUDRyUWMwQ1ZjSUxYRjhPSU1BMnZmUzZVVG9iVWt5eEhFZkpVYUEzS2cv?=
 =?utf-8?B?ellkZEw1bWJhTXFNbDM1Tm9DUStCbm1NaUkrdmQyUFd4QjdNa0xIZWdnRndE?=
 =?utf-8?B?ZktPNmxsZy91cW11WGZCZkFHWnRSalQ2MlNWOXpudE5hOU1WeUZxU3hFcVhW?=
 =?utf-8?B?SW9uQ1E5RlEyK1o5UDcrTUthOVIzMDBKbGNubE1vQXY5V0dCTm1pUlpTSUhS?=
 =?utf-8?B?eTF4b0VsekhKd0NNdmhmalNmMlBrNFJQY3I2N1VXQ0ZpWURUeWpUdE0vQ0FZ?=
 =?utf-8?B?Z3lTQ2RVQ0NGNG9uMzlyc0dhYnorSGc5cjd1RVNPUFV6dUJ0aFM0TE04bG1o?=
 =?utf-8?B?KzBYVzVjMzdMc3FxNUhBeFdWdUJ5QXNFUStCdDNicVpjeTRWWE5ZTUY2VGdO?=
 =?utf-8?B?RWV6ckcxTHBiRk5xMGRNUi90WW9NVTBscnFkbUxXaGZFRmdKbGF0RFh2MGtS?=
 =?utf-8?B?d2U1bzh3YWZ6MWU2V1AwOUdUSlRGbW5GbU1XNVhEVndhN05hZkI4WklzaDk3?=
 =?utf-8?Q?ZxT3gpD1/yGUoHRNuwbfBS8eDvPx8Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjdTaDExK0ozdHlPSEZ5SHAydTFsTDArU2VpNnJvb25nK1A2cjkyUzhEZmZm?=
 =?utf-8?B?T0MyS1BtbGVVdGgyMVc2cUFOZ3dLcFJrb1lJdGtOYUg2cGdjOVVVWk5sd1VC?=
 =?utf-8?B?SWJRd2hpTFVRR2J1M0JPVG1aZjJIcWZ6bUhIVWcwMHdLOGpLU0dGMmcra2JZ?=
 =?utf-8?B?bGs5bHFZUTBvK2hWTVZMTHljRVI4ZkJBSVlxSjlCakoxNk5TajVORnU3dm94?=
 =?utf-8?B?ZndzYmVGZzFRaitxR2FOdFIyRHZUOFVqcENCWFVrY1B2REN4amtFWU1oeDZv?=
 =?utf-8?B?cFc1MlF3dTRFV1J0UWxubU8wMG9xaWhhZi9aME1jZGNzUGRIWFVrb3BSSGtq?=
 =?utf-8?B?TlJVK0Y5OGkwVHIvRjRNUmJFVmV1Tk5TaVBURkppNmxEc2FqSHpqWnAvOWQ4?=
 =?utf-8?B?a2JaMHdNZDhiOWJCc1NUdkNQUW1BYnFOaS9vRnZqdzByTXhoNi9lTHkrakx0?=
 =?utf-8?B?ZWlUYnFqWmFUKyt3dnd4bHN3Rm5VemUxWTc1KzQ5b3BHYko1SFZ6dS9jVnhv?=
 =?utf-8?B?R0o4SndHbFhockpwM3V3Qk8wWG9XcVdxSnV3NTdyd1FnU2o2U1dqVmVWdVNx?=
 =?utf-8?B?K3g1Qk0yTGpGT2pXWVg1MmJid29VaC9qNWxVNWp5aXBrUzNvVEhUL1lHNEx1?=
 =?utf-8?B?UWlQL3pBaDVEUkJTZHlyVWdEalV5ZTdUYWVYeWFOTXFuYjlRZlpqOXVCQXVu?=
 =?utf-8?B?MmxOdWtMeHA1NHlVdHp0L1A1NklTdUUrY1JkOGJ6L1YyUHdJUzlzSTdUTVBT?=
 =?utf-8?B?aENicFB1UC9CUWdmeDVoRGRjUFZhQVlTd2Q3d0l6cFVEOVVXU1EzTHczL2wr?=
 =?utf-8?B?b1BWSzk0bFhmTElCTTBRT0hzYyswcWtTd1ZoRlQ1bXd6MU5VOEVMRU9OWjRQ?=
 =?utf-8?B?VjJDSThVM0RDMXNCZEJYTFFibGdiUnladDUzbUtqbEdvNW1iWjBTTDlHd0Nh?=
 =?utf-8?B?Tk1uTTJxbWJkdkVNOHRha0Jid3YzZi93STRnMTQzaDJVVSsrV3lBemk0Q2cw?=
 =?utf-8?B?Nk1LQ0tOaEQrOStMRkdMa1d0c0dTOENXb2lScng4ZjJUZGVDNWV0VERXZDJS?=
 =?utf-8?B?YU5qQ3oyUnplQVFENHI0S3hSY2t1aUpUT21Mc01ZWjl2dFF4VkZIR0Y1WURw?=
 =?utf-8?B?ZEs5a0U0MVdSVUhJVzNEVjltYjFmQ3lQVHJaMjVaVkJIZ2ZxdGZRakt6WWRU?=
 =?utf-8?B?MzQ3U2MyQWVPSmwxSE8yYmthMlhqOU9xdWdBSVNhbHkrNnMzZzZxZ1ZrR0NJ?=
 =?utf-8?B?U1k2TTVnUWJUZlhHT2JvOENHQzYrRkloYUZxUVlSMHg3ZGdDNVZJSWVXV2Y0?=
 =?utf-8?B?dnNCRjhOWXpKaUlUS3VUN0V3R083Mm90MG1JeFdUMFNxVE16d0hIekNEbUZT?=
 =?utf-8?B?WS9sbEpyd1o4V21hRGV2c3F2SFBnUDV6Q3JrdkVjZG9nZ1IvcUpkUk1yUjEw?=
 =?utf-8?B?eUJpc1RqcHdVemNlWUFuSjJpWTFRTmg5R1FhRGFycnNMNWVqM2J3RDNya0FZ?=
 =?utf-8?B?a0VtYVgvbUdJNjI4VjR5SlRTam8zcG1ma3YzYUtoa0pLSlJrL3VwdWpMeUl5?=
 =?utf-8?B?Y3A3VkNOWmFJM2JOSkNzTmQvWDlEV0p6Um04Q05aVE9RYW16NDA3akNJMGp1?=
 =?utf-8?B?OC93VUFRNW5HbGlnY1dFV2lXNE1mb2RNd3dsNllweVBjSjFQMUY3RDdVTjZP?=
 =?utf-8?B?WWJ2ZGFNUUJmUnd3VzIvc1R5LzNLUEl6MmlrNW5CUS9VYXZHVTZEbzRBaGRk?=
 =?utf-8?B?WndqM1VhMmN6Y0Z2VXFKbzdMZ3JMbnB2LzROWEJUNy9KNld4bVJIcGFGNWs1?=
 =?utf-8?B?a0FnY2FYcG9paFF0Y1JWS3VmcGQ3cmhJbjFoTFU4WEpmdGFheElCZmZWZHJD?=
 =?utf-8?B?ZDFHTHJFeVRoakhEZWh5VkxHMEE4Ym03ZDVGeXpFRTdpbVd0WFFDNS9meGlk?=
 =?utf-8?B?ak1lOW1iV0dML3ZkVVZjdEtqM0lTUjJ2NWFkU2ZLR2lZUTZwR2hqbVRSR1hv?=
 =?utf-8?B?cC9DQVdGSkRYTmRveTdYUXI2eUtaS0NIcWF3R05rN21wRkI1VHpDUW1pMmkr?=
 =?utf-8?B?N0pJT2xxMEUyTXlYSVp4V2YzbVdXV2FwYnYwa09VTFdkU24ySGVYQTJ1T3lF?=
 =?utf-8?B?c1U3Ykg0SFlid2lTbzVPVkxTTmcyMXFSZXg2dVVTbjN4eGJkbC84cm5vU1JL?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36572f88-673d-43ce-eac5-08de0a4ccb99
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 11:36:48.5028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejdBJCXS/HhkD+WRPQFcGG/tgwpRI5dzPhX6Dxa/NSjpgc0SYSJ+UiuNynqdhdRLheGVkWiPJYwsmy9d+qkEbhCs3fP085kJgykhA09R/mg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF77ABF615C
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



On 10/11/2025 9:38 PM, Michał Winiarski wrote:
> In upcoming changes, SR-IOV VF migration data will be extended beyond
> GuC data and exported to userspace using VFIO interface (with a
> vendor-specific variant driver) and a device-level debugfs interface.
> Remove the GT-level debugfs.

this was already under CONFIG_DRM_XE_DEBUG_SRIOV for early bring-up only,
so if now it's hard to keep it exposed on the GT-level, then

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> 
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 47 ---------------------
>  1 file changed, 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index c026a3910e7e3..c2b27dab13aa8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -320,9 +320,6 @@ static const struct {
>  	{ "stop", xe_gt_sriov_pf_control_stop_vf },
>  	{ "pause", xe_gt_sriov_pf_control_pause_vf },
>  	{ "resume", xe_gt_sriov_pf_control_resume_vf },
> -#ifdef CONFIG_DRM_XE_DEBUG_SRIOV
> -	{ "restore!", xe_gt_sriov_pf_migration_restore_guc_state },
> -#endif
>  };
>  
>  static ssize_t control_write(struct file *file, const char __user *buf, size_t count, loff_t *pos)
> @@ -386,47 +383,6 @@ static const struct file_operations control_ops = {
>  	.llseek		= default_llseek,
>  };
>  
> -/*
> - *      /sys/kernel/debug/dri/BDF/
> - *      ├── sriov
> - *      :   ├── vf1
> - *          :   ├── tile0
> - *              :   ├── gt0
> - *                  :   ├── guc_state
> - */
> -
> -static ssize_t guc_state_read(struct file *file, char __user *buf,
> -			      size_t count, loff_t *pos)
> -{
> -	struct dentry *dent = file_dentry(file);
> -	struct dentry *parent = dent->d_parent;
> -	struct xe_gt *gt = extract_gt(parent);
> -	unsigned int vfid = extract_vfid(parent);
> -
> -	return xe_gt_sriov_pf_migration_read_guc_state(gt, vfid, buf, count, pos);
> -}
> -
> -static ssize_t guc_state_write(struct file *file, const char __user *buf,
> -			       size_t count, loff_t *pos)
> -{
> -	struct dentry *dent = file_dentry(file);
> -	struct dentry *parent = dent->d_parent;
> -	struct xe_gt *gt = extract_gt(parent);
> -	unsigned int vfid = extract_vfid(parent);
> -
> -	if (*pos)
> -		return -EINVAL;
> -
> -	return xe_gt_sriov_pf_migration_write_guc_state(gt, vfid, buf, count);
> -}
> -
> -static const struct file_operations guc_state_ops = {
> -	.owner		= THIS_MODULE,
> -	.read		= guc_state_read,
> -	.write		= guc_state_write,
> -	.llseek		= default_llseek,
> -};
> -
>  /*
>   *      /sys/kernel/debug/dri/BDF/
>   *      ├── sriov
> @@ -561,9 +517,6 @@ static void pf_populate_gt(struct xe_gt *gt, struct dentry *dent, unsigned int v
>  
>  		/* for testing/debugging purposes only! */
>  		if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
> -			debugfs_create_file("guc_state",
> -					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
> -					    dent, NULL, &guc_state_ops);
>  			debugfs_create_file("config_blob",
>  					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>  					    dent, NULL, &config_blob_ops);

