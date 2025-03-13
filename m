Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2ACBA5F5AF
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 14:15:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ECAF10E88A;
	Thu, 13 Mar 2025 13:15:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d/9CRz07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9E010E88A;
 Thu, 13 Mar 2025 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741871747; x=1773407747;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NCOb0EKxtMdPjeiiKIxUHGT4BTjHqYmXTrPz8PmTGco=;
 b=d/9CRz07gPIh2dkhdXu4V5sK5klGxeU8Bx/2q7vP7yW/f1fCRKrKNXxz
 m9zGeMcO3TV6H0vNy40QTldlnyP6A/MNiNwcqyaKlU27drPRGgi4UA2Ks
 HLbVxPT41fkHQjS+KdmzRKuZecxiG9tUW6bsdNYK+qcjJZw+OYLglFCX/
 8y6tB70YE+PIMKC+FOlz9zy2oH0TAZsFksZ42CkMsVtPg8tTi6fOUsroB
 J5KgCj2GVzz8MegwAFFn9jqDuqCZM+NJg1qsJg+6H+gF1j1TaCzheTNqe
 1YYO+RXnC5La0Lh2T4+tDLb0B6f4kVGX6rm4K2kaprCuAgKbA1XGMWAFy Q==;
X-CSE-ConnectionGUID: hkhQzMB3RE+TRyNjWaQosA==
X-CSE-MsgGUID: 0WDgBnLKQKC/GSCc5dyD+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="54359004"
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="54359004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:15:45 -0700
X-CSE-ConnectionGUID: 8YqKX7JjSxKIRrojqrjfLw==
X-CSE-MsgGUID: 1Q8aiJMNR2GW4+ahtnIL0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,244,1736841600"; d="scan'208";a="120740565"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2025 06:15:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 13 Mar 2025 06:15:44 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 13 Mar 2025 06:15:44 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 13 Mar 2025 06:15:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L4aPdR4mQ5+YUgtPrm82TTF17CBLYdutj+E1xLAGxW0aRNBz9wWvMeq1r/1gkw8jnVSNzpilQQe+fmrj5q5v/Is0ZkJThVxJEWbe1PvtZZXgn6LlwmWxRPpquLTHIhM566yCIV1/cxGUyKEyI4TXinoPHHpq1GX5GaZ/rdJfFG5MJABbHq7JuAB7pBrhdLBD8HZNgrxXX/rN5BBRaoAnsMxYtWkqIzR8a9ubi44ArNV2j3FwXzKJ4zUdbgF1F9N4zeyR6TjqeEjGu1qPahOASS6Rz6sm6VG3uoa8lToEo+yOJn1ZmIrNByfjDQWs4d5o6p63a3Z25tVHfry9Gyjz8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltjePxoeB2OmJVVHoWjCimUjDzUF1aXVt824SI5vqDE=;
 b=bRyNxXGq666LfVqQo/6K4YeCw3XqP/A84H4s3WU8fSsGZOHeFAXb/23dR5clZ8BtQjLeXTdI+w1fQSRCtWXn0jx6PIKJ7do7wHonztG8xWtoqlcju3pR7Sgwpwr3zhsvLST2qBpGx5NhE7m5er+FQCBQeuKyvPqu9SzUcjpCiWdTKlKx2v8wUNjEaiOyaBsF98nDk9pZN81w7X+4YONvYLFrwWeK56b2FCSYo/0dMDHNJEPK8Cvwm/nOftKQN98uFPjeHNJRfc0aoR5Ig3EmdXzkhIMfqUxiJ/X3TynNWC3osf3p3hlYLvjQH0lL5/fXI7CMwam+Xz/Exp1EwwJ4AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB8855.namprd11.prod.outlook.com (2603:10b6:8:257::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 13:15:26 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8534.027; Thu, 13 Mar 2025
 13:15:25 +0000
Date: Thu, 13 Mar 2025 08:15:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 5/7] test_bits: add tests for __GENMASK() and
 __GENMASK_ULL()
Message-ID: <4ecfq73s45kkcihy6z5birbupszab7xoxf67267eiahcz6lmjz@qm72ktcfsbd5>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-5-b443e9dcba63@wanadoo.fr>
 <e5afhg75ry6km3hjmzbimonxc6qfl4vzma7ucv55h6iohrbmbn@xqmxfuvoinp6>
 <b65e5d8c-e7ca-4137-b697-3322e112fff7@wanadoo.fr>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b65e5d8c-e7ca-4137-b697-3322e112fff7@wanadoo.fr>
X-ClientProxiedBy: MW4PR03CA0166.namprd03.prod.outlook.com
 (2603:10b6:303:8d::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 52527da8-2cc7-4365-3da1-08dd62311e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+xOMIY08RIcnXE5jcxWS27uAsK8JBTgk60HcuUqrtTp3yOPGYUZ1qzttP9?=
 =?iso-8859-1?Q?zPop/OHijytmDvZxWZ/792dDAdgDUXvQKo8uZm+ApXsG5dWkqOSEiCn0XX?=
 =?iso-8859-1?Q?Xd6CCt26ktBpsysD/N1aE1W5fzrCzqLUKXo6+NYAfgBNtgIHb2rZKhcDMz?=
 =?iso-8859-1?Q?Y+27gx2xkteNrG4WyvUwprXA22A+PsZFAxy365Cuu89yZC8G+Ki3MbjFz9?=
 =?iso-8859-1?Q?7NYuh8akML9LuhejpO4iGVrAbHyfMKN6xKWeW17rs0qwgYjwD5UBeW5inp?=
 =?iso-8859-1?Q?19fiaXXb/ZKsnw4Hvg1Ca/rGAKkLL1nsLCHANlf42Fxp7xQShnA2TVuhnC?=
 =?iso-8859-1?Q?o0RtdmOwX6YaS0N3NvBlyeAK/qqJ4akVAfBDzFiVS0Qi5W3L1/EFKLotj1?=
 =?iso-8859-1?Q?tmpevUufIyDjxbh6pBHYX1ZDygvSVu/FdsnhQoYg8NAO7SjpCVyBm3mLhc?=
 =?iso-8859-1?Q?ejTJADprFtEjmLz9NuPEgnOuqy5VDfMMyFBU7v2hfLdv33rAIfmL/S1TLd?=
 =?iso-8859-1?Q?ooPyqo+UYhAMhbAHSmXph37k5UNfJkh/KjiSnpN1484DuAWPPtgdfmH7Su?=
 =?iso-8859-1?Q?1AEkOh4edFyO+H10pewbkTL6cUuhE3cnuZGedcGyQA3EhVgzALST2wMwdB?=
 =?iso-8859-1?Q?Z5Dg4UZBCkhev19vptxX6i3LLWue81Aif4Wp5XsoEAYeEiMFsVKMSL2Z0b?=
 =?iso-8859-1?Q?rZX9xKMT3sfrRFWO1YZ/ckjRi2dptSq9kXPbM+TEFCymoMhj3Tqyx+0RlU?=
 =?iso-8859-1?Q?LFfQjB9cbSw6tSbp9Mr7LH0v2iADVHwqQkYZY7ShuQ3d4uMLdPbOM1hoM9?=
 =?iso-8859-1?Q?qnp4oBvW/tz2373hmVojM+swhSAdwZk3CdEd+s+sqBASm4jHrwI4e2PHou?=
 =?iso-8859-1?Q?haE8p8e0Te+Vgim0cmO24Iv2v1el92r9EIUKKM3THUR9WBojMEMyicmCnu?=
 =?iso-8859-1?Q?Pke3U33zFFcnr36HvVbykS85vhB9AMKVO4vKqXD3WYvr5TpXJFQ7/rNuoE?=
 =?iso-8859-1?Q?di3NJRiPnX+r9PQStHTwd88WYwZ6q3FLyoHgJhMfxifRsUTQZXkTpR2Ix3?=
 =?iso-8859-1?Q?QXF5u6jZYkfgk/Qf0l6EdOTebN3i4mDlifpT65ahkAg49w2k5WurpiTw3U?=
 =?iso-8859-1?Q?4IdipGzjtMorzo0Yqt9LkU0arGPNVL1RYa2b5z3ywH9I3DCAHTWEqSY0ll?=
 =?iso-8859-1?Q?ry8jvyUz0ysP6SmPmUPherZ86z2Zty+kM4StR+Fq/nKVQEJtdlFmp3++L5?=
 =?iso-8859-1?Q?aaLvaUleR15xdjCjHayIejdX92VU+m7SwptwGD6nGz25w3d7L61mV0PcHA?=
 =?iso-8859-1?Q?CsgV080jHVxGLrqoA80NDsZiqbc3ZA24hgWIDkfZCK2q8khWqPpThy+RZQ?=
 =?iso-8859-1?Q?2rnSz0VOKxA1I5Wt8inNKqFyqlKIDFBhpiFTIAu95iWiGs1f2bbJF5PLl+?=
 =?iso-8859-1?Q?Cjz8fmq+AulmrUa5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Dq2tY3txEihdc4bt3liWoDtz7JmBuS1EeTPcycPJO5v7VQJ8oNOU4yqB39?=
 =?iso-8859-1?Q?ooerfBb7SZeTuOaEthM/WEzqkV7taQKuzSd1UhLS6L44fPpBuAWXKliHtf?=
 =?iso-8859-1?Q?V6PRtmqjCofI6hFSNSA7jt+RPHsHZxSTr1OCP9p45L8xHAVAe5BYsiQlsU?=
 =?iso-8859-1?Q?vp7CmJZUdvBLQ6xTX7bd2NX2g8klrOgwlv6s41ytM73X/NqsQ6AkM3qPxR?=
 =?iso-8859-1?Q?0R8LympMDmgivzCFTbpcQirYtvY9DQG4XpmShRxQf6dH3VyCbHSyr8aRg9?=
 =?iso-8859-1?Q?9AVasGQjY6zkXStAHytsvypik9FWCk71skxM4xQxSeU+B5LqkZCpen0cXP?=
 =?iso-8859-1?Q?OVcWOG85qgcWWsjrLOSjgx400lspJvLyFfuOOUpv9gWm0Kr6lnwwV6djYE?=
 =?iso-8859-1?Q?Pec7hJ2eC7/mkFhjc+w00KV61dh7QhIpsCDSEVSok9uuw1eWRqCBJpyu4F?=
 =?iso-8859-1?Q?kYv0ay/lxuvPtnNqxFIHeY3UtoJ5nsw7C6jBqEKZrPCXJ8JefRhLLs5ZJ7?=
 =?iso-8859-1?Q?Xn0hG1e3tKfJIrsugA6tmxqDvSaKdYjEYYGuAstFSuLjF6bqjcYh+6l4ZY?=
 =?iso-8859-1?Q?yp3qIZlfv5giPG8NU1IWHroTzVp55lfLlYoG4jsQxzMA/Wq06i0QSkNlAD?=
 =?iso-8859-1?Q?06dxksJ54FHkibuY7C9/TvMXJB8/+Oz8fH8Y/uh+nk9C7i9WZERRoLJr7t?=
 =?iso-8859-1?Q?EZhnd/99097nYQmnTJ7aR5vyNOkcYDAq8lOQaRWdLDIkXWM/zF1Hv2ugXe?=
 =?iso-8859-1?Q?SfUZV4OdUbqXz2Gauc4otvuOEbiRpdhQvOD4HIasNqNhX3eCf3lioTBQZK?=
 =?iso-8859-1?Q?fPj9mzQJE8syhrfHiDCdNaaIcVBCUlfmKR+eXCsPmPpRZjtFgZxIpH3SBa?=
 =?iso-8859-1?Q?gOrTBHwZRmmuudNKgpkh7PDUUyQ/fM7c0RqYqbkUHr/w3Ex9ibMj0braOG?=
 =?iso-8859-1?Q?XqjKWlk7oP/+bKxZ8bY8+cjFai7aOgi1EMUI2nZm3Rj5KGc4E/qcMKNCwt?=
 =?iso-8859-1?Q?N4HwCRF1333pTENkmR2gzRb6+Gwz3UyHBLqxeGzMAdW99nF9Wryf2TOjiL?=
 =?iso-8859-1?Q?nzwkqIo3ahzeGmMvX3kd+llWw0vOWGZjZeBWcgUpNG5OYYohp9ANuESpN9?=
 =?iso-8859-1?Q?VUoGWW69E0cIxIXtMu6/WLWd16/1zT26t1hLAVsv9ofcLbem5twtYLxUEp?=
 =?iso-8859-1?Q?A74KgssXgEuYymGEvRBkcHXRtLBF54mJ/tGdAN8f4qnm125hNsmKdj6APE?=
 =?iso-8859-1?Q?HHHLNGxp+0QfY/cpXUjAiVLLvVFq6amW7F2dq+gqr6YlQ2cwf1+Hih4+8i?=
 =?iso-8859-1?Q?wtPBANhjJMFS35qcoz1d0IjI2X2EysWJBEtc+gIiWIYYSzDdUsHE6LtjBA?=
 =?iso-8859-1?Q?bUM2a/zjLLK4PjFczEHqLQv4h8qRUIpBgIjWaOtHStQlFzekOnxe4Pnl6W?=
 =?iso-8859-1?Q?r8f8acq9y2ZeeJAPItzIbkrSM3vVCZEmWsdwKUatcpj+hUpz6NgAPv6o+u?=
 =?iso-8859-1?Q?SJ40JVVbGg38D5AVDmRfP1tMdfAfkE76XrGmKcYPNobyEtqG6s2qkyw9EO?=
 =?iso-8859-1?Q?F9oIlI55axSGrdzEvcN1MN8TlaeQYM6UtKiHUPcs7ViWFx1PCXqwgbRhFW?=
 =?iso-8859-1?Q?/WkYBVv6jZifgJIRcEfmrPMDt77fTE4SdYB5OWKT1Zpqnne5umvqxaNQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52527da8-2cc7-4365-3da1-08dd62311e39
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 13:15:25.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WMQeAdTnIxPqMNqPNRdBY3C0JEDyiMSKAkpN5GYzGYW92BmEaR4CWv7rldBRfaNbWpbEIpqee+gcuHcy7iyKrPO8zdgrZ/KNouANV0U9wpg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8855
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

On Thu, Mar 13, 2025 at 03:00:34PM +0900, Vincent Mailhol wrote:
>On 13/03/2025 at 13:13, Lucas De Marchi wrote:
>> On Thu, Mar 06, 2025 at 08:29:56PM +0900, Vincent Mailhol via B4 Relay
>> wrote:
>>> From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>>
>>> The definitions of GENMASK() and GENMASK_ULL() do not depend any more
>>> on __GENMASK() and __GENMASK_ULL(). Duplicate the existing unit tests
>>> so that __GENMASK{,ULL}() is still covered.
>>>
>>> Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>>> ---
>>> lib/test_bits.c | 18 ++++++++++++++++++
>>> 1 file changed, 18 insertions(+)
>>>
>>> diff --git a/lib/test_bits.c b/lib/test_bits.c
>>> index
>>> c7b38d91e1f16d42b7ca92e62fbd6c19b37e76a0..dc93ded9fdb201e0d44b3c1cd71e233fd62258a5 100644
>>> --- a/lib/test_bits.c
>>> +++ b/lib/test_bits.c
>>> @@ -7,6 +7,22 @@
>>> #include <linux/bits.h>
>>>
>>>
>>> +static void __genmask_test(struct kunit *test)
>>> +{
>>> +    KUNIT_EXPECT_EQ(test, 1ul, __GENMASK(0, 0));
>>> +    KUNIT_EXPECT_EQ(test, 3ul, __GENMASK(1, 0));
>>> +    KUNIT_EXPECT_EQ(test, 6ul, __GENMASK(2, 1));
>>> +    KUNIT_EXPECT_EQ(test, 0xFFFFFFFFul, __GENMASK(31, 0));
>>
>> why are you dropping the ones for TEST_GENMASK_FAILURES ?
>
>Because the __GENMASK() and the __GENMASK_ULL() do not use
>GENMASK_INPUT_CHECK(), it is not possible to have those
>TEST_GENMASK_FAILURES negative test cases here.
>
>I will add one sentence to the commit message to explain this.

ok, makes sense.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
