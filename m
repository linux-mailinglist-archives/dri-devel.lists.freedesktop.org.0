Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLCDNjxTqmnhPQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:08:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D81A21B606
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:08:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4204F10E31F;
	Fri,  6 Mar 2026 04:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YLB+9tgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DA910E31B;
 Fri,  6 Mar 2026 04:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770103; x=1804306103;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=O1uIEdQIu56oMB6ojjvRq+3OidiIV42ZYRPQxdJ8t5E=;
 b=YLB+9tgkm28olDDa5wNMUiYj8arULT0V0ElJMQWcmfZX6SvB4oNOH6FW
 KtQf/EvC2R4cg2z5w5IYVjqo4LDNS2wL3QQkKpUgfHJOnq+QfrkUXG7ZU
 MgqelQvRE4bPbwaY30CMX5m2KNYAjjtJZbQgn5X+yZ9zrUt+A+u/OEp+9
 9yuTil2OskmJCK+DGpcawC3V1g0DVdFptW2gP4AZma4aa1U03Ba3w2AYy
 ZAfYy7BlGGMaYVYXA6Gt8j93vFfhk73oVJyfYXVCf7YKOLoYJleBRWGYQ
 OXIKWAhqpDEeouDyDCARWYe5cihDDjIBcGhkD7D6cCxe5+OziwfRHDeA+ w==;
X-CSE-ConnectionGUID: rgHJT9j1Qf+/32cepHliLA==
X-CSE-MsgGUID: 2RmojJbaT/qN5/j71rNG0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="84585060"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="84585060"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:08:22 -0800
X-CSE-ConnectionGUID: VeI3a3zuRESGImPmGQuTZQ==
X-CSE-MsgGUID: KExhxjuzRL2SHgz8DUwQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="216679594"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:08:23 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:08:22 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 20:08:22 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 20:08:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3s0i8uxmpVbg1r9SkweqjI0J1qMKNWaTr1JrIX6PWOwYdT+1a4coFXOVH1a6Ju0daZGnJjezfZAjQ+5FUjVOpZTz/wVV2af+/y+UjAEeqs3gWWSNkJuCJW2XhfM0FHe7K0JzQZazEHQWqhisAEFbD+8WJP5Fs57MqWp1qHN3FGue8wBlJAodXorAtSNKcBYpMn5kwGCTBLHSAPMMKyxuW02wS22Y3e5vijs2mlp8DRCl9f6FEWwO6UPUvWWJfzZzcV9T53OGF2T/dh71VKPIRCWBq9MmUGqnXQLi0ezWPvrTOcAbcpSE001k5Ut9v/EnwmeetiWA0GjXaxYlTPL+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6cov6x8wD5/fKlllIHB1P8NWjN3gVf993auadlSW28=;
 b=yitP6vItAi/mbKh3suAFdpHJbw9tVB2p1BzqT/47R7AAytVt83UpFjNpXCuZqNzt0M4MbihlbkusGaxcoua6//b8+yp289a8Ryr1SUqi0MaazyXI+7I7cAHQfexTbcqm2FR9UQlwNYhZCJdnWHkzlAqDx2q2r7cucsUQVSR0oMUK3XL5K7Bv52+bOrdXmKqJGx1SpkXXzjXZrbcWTvIWm30aZ+6wKjnlsBHBDi/mOjqMdsE/2SpKySxzkbJRkhaa32JgG2GRYIZIdahrWEhzalX5OylClyGiVfmSHHoegzUSen1oZHocBMKQ1ikCoiOltLGYkpHgHJsR/NMsM0Z+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:08:19 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::9d4a:f89:f548:dbc7%6]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 04:08:18 +0000
Message-ID: <42ff911b-f60c-4e75-9a51-495394ed432e@intel.com>
Date: Fri, 6 Mar 2026 09:38:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] drm/display/dp: Read LTTPR caps without DPRX caps
To: Jani Nikula <jani.nikula@linux.intel.com>, Imre Deak
 <imre.deak@intel.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
 <33d050c09290955321f01d61166e7763b6db2e77@intel.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <33d050c09290955321f01d61166e7763b6db2e77@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0112.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::15) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c2a6a1-d7f4-4f57-ca3c-08de7b35ffad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: GGQYQxNRPAr6jfLGpJXI9wzaWEYA6KErHoOKLkW80EF3pTLKh7NqUjaBkae39BtSDF9H65nUemmve06ymASUVpOCR1+6nsUFcYWpkX1aaHUYgKuRqQ3/9EqIdWSReCTkGbN2PgYmMZMdJwuhgosTBnh3GLABgdJOuNmNlAjrnm2naJM+zGLEpSjQBr2INlWdloj3aWvb3V0j/0qRO1WnG7HrVG9j/rFJ7KL6c4l9rldg/uadUB4NezZgpTJFBDY1Mm4O/8d6ptDyoDZRSE34gG0OudEhPDcoekVdoaBqnhkAZzfH9Y2Inmw5RwQShDsi0LsHtl26ovCdXEyWtrm0etAuASmvdguSXWBPi3DhzpJ2djjqvqtOrBKcEVkfm5N2rqsZ5udc57wNkMaFRu/YQIxhzDKMTbIo3Vz7hUud+mOHZdQnlWaYLF5Sb81ZDLBM2LJiz5gbae/LAcugoU9IW7pCPLavpB635bO9R9KHU20dcphiyn1+qxuWzpX3xLXICCda70Yah9dncJETM+KgmIRjFluChEwRZdVXQBCoGc7jJ11Ki1o1TXggpo8o8rpYu/bKIE+7zxsf4WpnTOO9bA1h2qlVbbOIlfJZKowUoHo5tzkNWnte5yqyf5kesRhDEjjKqA0uskfTQZweCjAz0ZXs6U7OqnFYTaCh+wTuLZHOuSgljPkQXq0Dq6Mevaid
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEt1bmpBS2hoUFJNVTBaOEp5NkxtR0N4KzNiL2NQMzcrUklqdG16dUZhQkNL?=
 =?utf-8?B?SndmdFFwSHBFYnBFYndjN1ZYbkdYaWlzYU5JWXU4TGsrcU53U3JQYmt3UGVQ?=
 =?utf-8?B?ZnRSWDg5bmFFSDZZVGtzZmVFdWxsOXJYL25Jd2MvREg4L0dTZGNmeFJZaS9h?=
 =?utf-8?B?QVE1T0ZGeU1xQjJyK0ZzcnNYSFVVOXFUOTNDZS9FZDVrOXlhWjlndlFYMktn?=
 =?utf-8?B?RjA5Yk9JTk9qRVFMSGhBS3Y1ZXNRYnIvWStQUmVYYTEyWTdxalU3TzFxMmdT?=
 =?utf-8?B?aVBhWGhHb1JBSWkxYkhPZDJVQWxYZ0VOZ3JMRG00SFFWcGZwUHRycjZxdGoy?=
 =?utf-8?B?SytXL1JZU0poMnNpWE96dkhPcUx6Skt0NFk1dkRBdUg0elJKeVRvM04wQXRQ?=
 =?utf-8?B?S1dCaTBCaDUzTWRnRmp5bUtyajYrUTlmY2JJMFZPbEtyNXQ0RzhvT3VYNVhs?=
 =?utf-8?B?WTdTeUJJdmZOS3ZLVVNNc08rbnljNVJsZFU5YnlXT0FVOWNaMUE1Uml4UHdW?=
 =?utf-8?B?eUJXOElqN0FTdU9uT2JPQnhOUUNkTjJ0TXNxYVVycGh4REpYejY0bTM5ZktU?=
 =?utf-8?B?a0U3dHQvdEkzbzBVUnNGangwSjVjK1dsdWU3QUJXdDBMVGhJVFN4c1UvMFpZ?=
 =?utf-8?B?Q1BXVWx5QlZxQTdLRVFQV2JZVURDZ3pUOGRsUURxQXhFWExaVGd0VW01SXp0?=
 =?utf-8?B?eGIyLzgyaHh3UkYvL0I5bG5jRWRtR3BFdkVaTzlzb3p0Ui9pdXhUMmwwZE5K?=
 =?utf-8?B?c0tyeTBCeCtVcnlPdUtFNCtwSGtmTU9McVJ4b256c1Y2TWRGM0pDeDNKcTZI?=
 =?utf-8?B?RzNNbDlPM0dZSGlJcDNUeDRHOE1LS0IyZU9vdXNuVlZOSVlVZ3hIOHhUSTZl?=
 =?utf-8?B?bzBHRCtST0JKV2dtRU90V0JLek16OUdBa1NhWmtNaXkrekRiZGJvbWdBTmxD?=
 =?utf-8?B?cytiSEF4ejhraitUeFRJYkZ2MkVzUGRvblVvNTVSemNYVmphRHNLRmc2WWlJ?=
 =?utf-8?B?bGllSDZsTnRjam5PWTRJR1JKQVNHUDgycmZmbUVqKzdPSWtTRGVROUZPNVFq?=
 =?utf-8?B?M2tXSmg5MjMwV1VHK2RKeU1USjNkTThyY3pMeWRaS2x1V25wdmRJSkkxeGgz?=
 =?utf-8?B?VDhza2hCZ2VTNlNNbU5pOGJLRzA3aDhVaEhsVTB2RDltZ3J5bVFGZ2lwakUv?=
 =?utf-8?B?WWxtZ0huanU2S2hXZTdjaFQ2eU94TjdwVXhrMGhGcW85KzhzWFpFb0RIQkQ1?=
 =?utf-8?B?MTlQT2k5Wk5jQkVuQ2RtR0NZOFVnODhLZU5reHFQcHBVa1dlSU5FOGEzRWIz?=
 =?utf-8?B?QUYrOGd5T1dJQzhEeHhwall0c0dUT0NHRGlzd1pCQzlDTXBLWEl2SWtHZXl2?=
 =?utf-8?B?b2pBNm42UmNwWXU1cVp3SEF6SUdpR09qWUJWRlJDaC9aalQ5aVdFcXQrY29l?=
 =?utf-8?B?STlTcnhLTE9RSzhPaWttQ2lJbnliK2NRbTdGRm9RT0NBY2MzWFZZNHdrdXUy?=
 =?utf-8?B?Nnd4ZTJrSWU4dGVUNFl0aTk5ZkRITlF1clZOZmtMKzFIZ2ZXcU04K2QycHl5?=
 =?utf-8?B?UHZPSnIzVzNLSTlZYWNyWGhOdnF2bjZSVklrUEc3VG5waDZ1SWo0R1FBdnNK?=
 =?utf-8?B?Yk54L21iT3l6TzcydTducFQrRGxJWmk2bDdkYVZXWThTSFNyZFdZT0JRZGdr?=
 =?utf-8?B?aW5vN1Q5ZytidjFkRDRTdlMzcmpQUm5EckxWeVU2WmM3b01ZZmJUdFNET3h1?=
 =?utf-8?B?YkFWa0dSK1did0E0V1d3YWwzWE5zaWhTVnBWMzNWTTVLQzY1MGVzb1lQUkVn?=
 =?utf-8?B?OFA1bkx5aWQ4SEd4ZUJGY05jaVhDM0s1NUhPT0w4andaSHJ3WFVBSzczVGlZ?=
 =?utf-8?B?WGlPSDIxN1FiNDdISWt4N3h5SS8rL08rem5xSlN5dTUzQ2EzRHNrcFE5RlIv?=
 =?utf-8?B?UWwxQVZSVFowK2h4b0ovYUZlMmF3SXdOUlNUVVhjUk9FaFF5UHFoaFdsUWNn?=
 =?utf-8?B?dUppQmZXb1c1MlBtWDQ5cHovZFhFSlB0czlMTXUrdFFQeHNYTkd2bHJrZ3Ji?=
 =?utf-8?B?SjVtTWRQUmNoN28rVDlKUEMyVWRxbVZiWXJtcmJMSjhwejJ4aEdVZFhzczVi?=
 =?utf-8?B?dHpIL0g1VG1qbkFidWZOM0c4Vy9Ub0E2d3BQSmdEM0h0ZVhObFBpaitXWDJG?=
 =?utf-8?B?b1ZKd1hRZTdxSjNrWVpmaDZocys1K0Q0WEpIMUhrNVF2cVBqVC9NOEpubXl1?=
 =?utf-8?B?NzhCQW1GaUlKOGJEN245akZkdm10dWtNTHJHKzVacVRQakZ6WnV6dDFsd2o4?=
 =?utf-8?B?V1AxU20vaXE4cVlYMGRoUGIrenFYa0dkaWJoVWNMVktPNUc4QWk2dz09?=
X-Exchange-RoutingPolicyChecked: EzpJADnGfKTdq4Nm5LFoZ3LoI5RtuvkLJ4A4Ap9nmehj4gBhV6rE8QjAeKZqw+qGG2prZFCCAORaN8sLfV2W8gRnqObKP9tT5/2VK2pnJVpxe8JBaYOi9kieb4c8AGOFLQF32KKu1neoKteDEJtLmBLLLZ4poDguZzxevbCIfsfqmR6rgkgcDycKhwknvWpzBAlBK4k77H41o09nD5k712FLogqkgpbKICJFxe3NQORAZrF13F9t6TaINNEC0PgRdITHwakUBUka7zfY3QgQapUuBSvRP6OzZlVlvi5z2t0Z3s1tASFepS0YwQPr30WYzMVSrZpj39aNz2UozKOBmQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c2a6a1-d7f4-4f57-ca3c-08de7b35ffad
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:08:18.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tH2FfZ76PrwIN1aw83HtegKuozXHQd0LMLvcoo0yZIoMkTeaMd0nGaxv0gqtn3Q9s4v6vX9Ew4RUoQHSeN/48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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
X-Rspamd-Queue-Id: 8D81A21B606
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

On 05-03-2026 14:48, Jani Nikula wrote:
> On Thu, 05 Mar 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
>> We at present have drm_dp_Read_lttpr_common_caps to read the LTTPR caps,
>> but this function required DPRX caps to be passed. As per the DP2.1 spec
>> section 3.6.8.6.1, section 2.12.1, section 2.12.3 (Link Policy) the
>> LTTPR caps is to be read first followed by the DPRX capability.
>> Hence adding another function to read the LTTPR caps without the need
>> for DPRX caps.
> If the spec says something, why are we keeping the function that does it
> the other way?
Sure will remove the other one!
>
>> In order to handle the issue
>> https://gitlab.freedesktop.org/drm/intel/-/issues/4531
>> of reading corrupted values for LTTPR caps on few pannels with DP Rev 1.2
>> the workaround of reducing the block size to 1 and reading one block at a
>> time is done by checking for a valid link rate.
>>
>> Fixes: 657586e474bd ("drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities")
> You're not calling the code being added here. This can't fix anything on
> its own. This is not how the Fixes: tag works.
Got it, will remove the Fixes tag and just provide ref to this patch for 
getting to know the issue.
>
>> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
>> ---
>>   drivers/gpu/drm/display/drm_dp_helper.c | 63 +++++++++++++++++++++++++++++++++
>>   include/drm/display/drm_dp_helper.h     |  2 ++
>>   2 files changed, 65 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
>> index a697cc227e28964cd8322803298178e7d788e820..9fe7db73027a43b01c4d12927f1f0e61444658e5 100644
>> --- a/drivers/gpu/drm/display/drm_dp_helper.c
>> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
>> @@ -3050,6 +3050,69 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>>   	return 0;
>>   }
>>   
>> +static bool drm_dp_valid_link_rate(u8 link_rate)
>> +{
>> +	switch (link_rate) {
>> +	case 0x06:
>> +	case 0x0a:
>> +	case 0x14:
>> +	case 0x1e:
>> +		return true;
>> +	default:
>> +		return false;
>> +	}
>> +}
>> +
>> +/**
>> + * drm_dp_read_lttpr_caps - read the LTTPR capabilities
>> + * @aux: DisplayPort AUX channel
>> + * @caps: buffer to return the capability info in
>> + *
>> + * Read capabilities common to all LTTPRs.
>> + *
>> + * Returns 0 on success or a negative error code on failure.
>> + */
>> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
>> +			   u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
>> +{
>> +	/*
>> +	 * At least the DELL P2715Q monitor with a DPCD_REV < 0x14 returns
>> +	 * corrupted values when reading from the 0xF0000- range with a block
>> +	 * size bigger than 1.
>> +	 * For DP as per the spec DP2.1 section 3.6.8.6.1, section 2.12.1, section
>> +	 * 2.12.3 (Link Policy) the LTTPR caps is to be read first followed by the
>> +	 * DPRX capability.
>> +	 * So ideally we dont have DPCD_REV yet to check for the revision, instead
>> +	 * check for the correctness of the read value and in found corrupted read
>> +	 * block by block.
>> +	 */
>> +	int block_size;
>> +	int offset;
>> +	int ret;
>> +	int address = DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV;
>> +	int buf_size = DP_LTTPR_COMMON_CAP_SIZE;
>> +
>> +	ret = drm_dp_dpcd_read_data(aux, address, &caps, buf_size);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	if (caps[0] == 0x14) {
>> +		if (!drm_dp_valid_link_rate(caps[1])) {
> So you first read the whole thing once, and then in some cases read the
> whole thing again one byte at a time?
Yes, this was one option that I could think and the other option 
mentioned in the cover letter, i.e read the lttpr caps, and then read 
the dprx caps, now check if DPCD rev > 1.4 then re-read the lttpr 1 
block at a time.
Another open would be do we need to address this issue and add a 
workaround in the driver as the DP2.1 Spec says that LTTPR is supported 
only from DPCD rev 1.4 onwards and in this case the workaround that we 
are trying to add is for a DPCD rev 1.2 panel with LTTPR.
>
> Everything about this smells like a quirk for a specific display, not
> something you do normally. We shouldn't have to have two ways to read
> the lttpr caps in the normal case.
Agree adding this as a quirk makes the code straight as per the spec and 
cleaner.
>> +			block_size = 1;
> What's the point with the variable?

will replace with a magic value.

Thanks and Regards,
Arun R Murthy

-------------------

>
>> +			for (offset = 0; offset < buf_size; offset += block_size) {
>> +				ret = drm_dp_dpcd_read_data(aux,
>> +							    address + offset,
>> +							    &caps[offset],
>> +							    block_size);
>> +				if (ret < 0)
>> +					return ret;
>> +			}
>> +		}
>> +	}
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_dp_read_lttpr_caps);
>> +
>>   /**
>>    * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
>>    * @aux: DisplayPort AUX channel
>> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
>> index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..def145e67011c325b790c807f934b288304260c1 100644
>> --- a/include/drm/display/drm_dp_helper.h
>> +++ b/include/drm/display/drm_dp_helper.h
>> @@ -755,6 +755,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
>>   				const struct drm_dp_desc *desc);
>>   int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>>   
>> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
>> +				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>>   int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>>   				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>>   				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
