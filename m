Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF1tNj5EoGmrhAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:01:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D31A6050
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 14:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763C10E921;
	Thu, 26 Feb 2026 13:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TdYBjMk/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE87B10E043;
 Thu, 26 Feb 2026 13:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772110902; x=1803646902;
 h=content-transfer-encoding:date:message-id:cc:subject:
 from:to:references:in-reply-to:mime-version;
 bh=rPu2NaCVP/KsSDnjqjLZvs11sTFUb+0RYv3PojwhdHA=;
 b=TdYBjMk/RxCkZ5krBIKa3BavtPmcrLrSEOVAS+HPvgt4KYeVCVyB8Vgn
 xn9EvSlpIT37jto8VH0UkU1GKGGcDg1UFBLIbnBOpS2MhMXtN5KDaKKtr
 dfY0g6CV2ytYt4L+zTmSpqG19i2GYi/ZpUhU92QZrKkiMlIceRFsB5Dpn
 T5fM0blBix3Z+bK0jtIEneIJh8RCOIygSiq0kd/oqrjvvnL6z8rFjYpRW
 nyahFhy/a6t79uOvMVXIoNknovXQn+mEjd+luisS1WKIHUlAoAwq4VgV9
 ucutzudMXtZClIqdEOj+bpfks7yzOdZp9SpXmmLI8ZSDq8xU1KuLoXoNP w==;
X-CSE-ConnectionGUID: M37gXCYVSCueHYgTf5CXmQ==
X-CSE-MsgGUID: xd1GmKdkT0C/TcfJcyhBBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="84627479"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="84627479"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:01:42 -0800
X-CSE-ConnectionGUID: v+X/GhubQ3eo2uMQd3fhrg==
X-CSE-MsgGUID: 4EAi8/3fQ8mKzCsqN+XS0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; d="scan'208";a="216577954"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 05:01:41 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:01:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 05:01:41 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 05:01:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZQP3dzUQMVg2+NsSHqrIzpW2Xu6Z2oouhFzUo5Q/z9xiI6R+c1u4F8sPTYgKSdGqcYskPrQeYGoEAX3acS9zJww19M4rkFAoUE9X39b0yA+zBRPJHssD+P4+fbIRaFPUS3ZrfKRJ6b9epV5oTT8rOAVnBCxqqFeJ7vWtT7IZG4zkCwADTY+6Mq3VRcWOwASxYWL0veNhC9Uk6/nhCzoIvqfl5Ye4L6KYSfM4Ytqz93rAimMoj+k4Bejprcyj1YB94g55WdSYxh4QSfFFTvKLweF/C0ibeB0qLYM6IDKpuaSpVCb3AkIepApzoSHc07H8oTq/kg54hA4k7J7/XkhAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=slz7F+W/il0jytWGc7A6qjIm+KDYHtwPfHm+eL9f7Rk=;
 b=tun+Af9DTFiwtuO/rk9V9NB2mOzukqCscp3g1pKEsqcjPrL8wLR1K7GTkA3XuaQf+7renJI5Ag0057HG8MKIk4qyraA48rqA+Ff1wHrd02ggitAMCQ6PaxlJzOaoYJBfxWWVj0wLVYedUPTa3HuY6lbVPp/T1ojoB7OTn5trXyz5ji79phDDhjHJqwnj2WWDwBpC/MqKJ1wYjhrb6Cl9xjUmF3Hi3/OXrA5y0VZT86QYcwfd8Jb9zkZadS1XcmeD0aOHNQVOa/7HCqyODW0uPIsO2SPWnGtW+TJLNixffaCY9IpcBH6lwcZXrH666QnvjP6WObJ4EH3OdpZnDtMkQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6909.namprd11.prod.outlook.com (2603:10b6:303:224::12)
 by PH8PR11MB6803.namprd11.prod.outlook.com (2603:10b6:510:1cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.11; Thu, 26 Feb
 2026 13:01:35 +0000
Received: from MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794]) by MW4PR11MB6909.namprd11.prod.outlook.com
 ([fe80::9eab:962:806:3794%4]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 13:01:35 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 26 Feb 2026 14:02:00 +0100
Message-ID: <DGOWW6DBLKYH.KA9WWZ0R3SGK@intel.com>
CC: Andi Shyti <andi.shyti@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Andrew Morton
 <akpm@linux-foundation.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
 Krzysztof Karas <krzysztof.karas@intel.com>, Sebastian Brzezinka
 <sebastian.brzezinka@intel.com>, Krzysztof Niemiec
 <krzysztof.niemiec@intel.com>
Subject: Re: [PATCH] drm/i915: Fix potential overflow of shmem scatterlist
 length
From: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
To: Andi Shyti <andi.shyti@kernel.org>, Janusz Krzysztofik
 <janusz.krzysztofik@linux.intel.com>
X-Mailer: aerc 0.21.0
References: <20260224094944.2447913-2-janusz.krzysztofik@linux.intel.com>
 <5887622.44csPzL39Z@jkrzyszt-mobl2.ger.corp.intel.com>
 <aZ8XaheEIW8Opb3Q@ashyti-mobl2.lan>
 <10397304.EvYhyI6sBW@jkrzyszt-mobl2.ger.corp.intel.com>
 <aaA677ZYYWJptOqz@zenone.zhora.eu>
In-Reply-To: <aaA677ZYYWJptOqz@zenone.zhora.eu>
X-ClientProxiedBy: WA2P291CA0034.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::7) To MW4PR11MB6909.namprd11.prod.outlook.com
 (2603:10b6:303:224::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6909:EE_|PH8PR11MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 6de74768-3138-4716-2412-08de75372bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: J1HUs3AQ46JZViHOKnOJvhatww8s64fHbJo+SWvpEwJVpRFOoAMq3uXqN8Q+L8U+/NgyLXRJiO4p/ZMVh2UXXWWmWszeZWdbru9KkNAgdaGqu5xsL0AxdWMu42Z4A83/MgtSmjht/e8mRJpQB9L3Sa+qWEOJY1AdtHkqIX/zBqGjMfHFOSjiRNIURqA2TcENyvcVwqudCu9I+3gw/0mS4f44g2m6r2kaYV87TvtnJ/FIKTkJIe2zgTV/twbdfQy/YjMX8BlYc+2YBA5UEPYPLywfHlyDNhSyLXmZIAM81qjQ0uoiiWPJjehNIp4iPs9OngTDtdcc5yNpsEQ9Sj+mUv6FgByL8Y483d+qRzfZQ5H5OeQ9OMLlwD2fG8L7xXPiR3PgP5Ev5PsDQrPkt/6sQ3OYeUwJ8eWZ3QmLWn8xZRcXzQ+8gCcbPWHSqqrI7+e+uwQYL/aERvAH9T/ld4jbrFY3wQL/MP0X28caihmsZ/fK/BYtRRugvzLN5NltIeHK9vfMHkS3bh9Nv0Ug2or+cQYI5dvJg2VygQ74tHfBumjhQzwV5AZ9hTEuLta0cKEVhP3OJgClAoU9QNFmEUGaRp0yseVfSHPYjlHx64ue1zJiYQv49moFle8REjwwSVKZAzBPRU1z/QCPDSeMFxXcmurXek4pyvAia5tbdLjmH71wkuS7+O4jaBRovVLb/v5gQtIyatyf0z8zvLHub0PA+cP7opKG6rxH4+XgiltxVfU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6909.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clVmS1NVTmNmYWNDc09ycDFtZ25JUVd0MVJrbW5LVG1hcHVOTUo1U1grUDgx?=
 =?utf-8?B?NEYwMFlsN2NqS2ZLeHp0cm5BTEVWZVc5eFRmSk4rWnVLSW1WTGZCUisrdmU2?=
 =?utf-8?B?M1hxV3FMV2JMeHBXdVJNemM0VTJwcldRa0pvYlNKTnphK0FONmJreE9GcVNu?=
 =?utf-8?B?ZUdYRGhCL0ZzblRYb3VIcGdrdjB3YzdSZDlNcmh2UWM1OGNVcGVVU0t5OU5U?=
 =?utf-8?B?aVF6Z0Fnb3ZtQzBGbEQzaDdxdGRDYUdYUW43ZFErenpyRnZJZk9adTVzL3VH?=
 =?utf-8?B?ZEtrS1RlMkQzdExyT3FUS2Jpekh1Vkc3NTVYdUdRZVFSQU9FVlVOVkw4eWZV?=
 =?utf-8?B?TmhWRDB6a3dpbjdtMGwvR21HNFFaTFRvSk9pMm5lZG9SanpFR0FkU3B1RGZE?=
 =?utf-8?B?ck9rWmg5clBLSW5RbElnVFJubVdkZHdxaDhUdXFzODA4MTN5VWhac3E1Wlhw?=
 =?utf-8?B?RXA4a1pNMEVIcGU2RENoeXluTnBXVWNIdGh4QzlndVMwU3hmcVdqTU9rcUZG?=
 =?utf-8?B?cVo4YS9jTXU3U2hlQkhIUXJJOHBwdmRpZjlFdjhxVjlVbkhCWGRuY3pWNE9U?=
 =?utf-8?B?QWlWNFZoZnNhcERPUTdGcjJFb1pWUDM2UHUza0l1Sk0rYkcyTDM0MDRsaEVz?=
 =?utf-8?B?ei9KelAvVUV1Y1dYT3dHaFZwL2pLQmpPdDk5cmdQYWVqTFd4Z2g1NndTejlo?=
 =?utf-8?B?ZnllMlFJeFB0UEk5K0NJa3BFWjRRdGJDM3NOcmlJWFdzbGMyYmRnWkEvMUNw?=
 =?utf-8?B?dFdaK1RLNWNtTzVkbzd5Z1VJQWtucVdPc0xpcUsxVEF3L204WGZBQ2hMRkFz?=
 =?utf-8?B?b3FxMW92dG1zam5YckRDRlNKL3k5RHowRnV6VjgyaEw1eWs0eFpNM1gySExu?=
 =?utf-8?B?T2ZuSStTbTgwZXNyRDcxSGlkRUN5bC92dEdMUGd2MSs2MEJwc2tkQXVzMTlJ?=
 =?utf-8?B?ckUwZ2F6TW52TTZ4N3JmNlBFcVhhT25LSXMyZ1ZSVDV0MTJVVGhrZGR0ZFJ2?=
 =?utf-8?B?bkdjYmx5aDlDZ1Rob1E0MmluRnJlcjNMQmJ5SnhYZ3RoUWpHRjlsMkVFRi9F?=
 =?utf-8?B?ZTBnTVlxVE5GSlNnWmx6ZDh0aGFlb1UrU0hoWklaNXRNaXowMVJMeXVKSzFO?=
 =?utf-8?B?QUJ3ekxQZmM1a1Y5N1lkdCtGbXVzbGFuQ2l1Qk1FWVJNYUQwUGpwTE56TzRu?=
 =?utf-8?B?NThFY1laaVRrRjI3MHlGYUg4Z1RZWEIwSmZqMGp2aytERkZhN0VKQnlUd3Uw?=
 =?utf-8?B?L2N2WURJZXFqQjZKUTJBQ3JpTi9mYzlpTzNmS0F5YlczVkZrclBUTXN2Sm0v?=
 =?utf-8?B?MFlneS93R2pYaDBoUXdmc2t3UEE5N3o3aGF5dUlFdmF4WDErdThEY1YxODN1?=
 =?utf-8?B?T2dxcHFMWjFGakRONUdFUFhTbkRsZkxQTzZZQXBnK2kxNC9vbWhwbGRmNDVC?=
 =?utf-8?B?K0hXemZoaDJBOTVnQXJMVWdKdDl3VmdBRzZsSHQ3RjQ0N1pQb1hoM3lIZkwx?=
 =?utf-8?B?RjRDOG1kWkVzSEJabEpLMm4vWUZxRVVBZDdTYTRLbFd1RU1jSzVpUENLcEVC?=
 =?utf-8?B?UTAvdXpxQ3JJM1FUR0xwTWpQdjYyRkFGY3hlYmlqUkVFbkpnMnR2MFRWQ21D?=
 =?utf-8?B?M29YMEZBeFNYVEoxUjBFOTQ3L29sUUM4NTJmUjVaSTljMkVEY0x3ZUdyMGJp?=
 =?utf-8?B?RTJaWGpiMVIzejRHWGM3bU9NUElYWkVYK1JHMTROMmNWd0lEYnZPUXdyUDJ2?=
 =?utf-8?B?M0F5MkRNZWl0cTFSUjRxUjVSSTVzVUtGUUdxMVE0NktKVHBvL29NZ0VCNmRZ?=
 =?utf-8?B?MzZCKzVHbStqTTcxbGJZOGI5TUg2M01jSDBpVktrb0Z6Y0VtWnNzUHptb1Z0?=
 =?utf-8?B?YXBaQVRRckZRVVIyQy9yV1pLRFBTQmxyVFU0ODJOZU45R2ZVZHZCRW5JWjhO?=
 =?utf-8?B?WExERXNQUWxlUHJPdTFkQVlaY0p2M1dWTVZhK21Kb3NLQjVWQnJtejh3Z3Ux?=
 =?utf-8?B?eVo1alVnUUNScG5Ub2Z4WHpmWTM5ZWY3a0hWaEpNUVgrTTBUVVNMUmlBbHRq?=
 =?utf-8?B?VUEwdzY2TEwyNWpuQm0wK3N1d3drZGN3TVZVTmkxS2JDbXRxMzFNRU5VZXZG?=
 =?utf-8?B?NzlyODhGVXJZZFBTTk9DbG9CckE4V0lyVGN3WlRZQlFKTlNwaDg4Mk1UYmJx?=
 =?utf-8?B?OEhYN2U1dTdsUEJjdDNLaVlXbHljNHlFTDlQQnFDdzVNNk1JVk4rTWdkZVFS?=
 =?utf-8?B?aG5maEl1Z0hsV2FsUnRWY3o2YTJGNEJicHdpY2VPOTVJUnUvN25CWkdUZ0Vs?=
 =?utf-8?B?UFZwbmxlR2ZySmpUdnJZLzlySDdPNmoyTHJrWVBFcDlzdlM0a1FWTTRQM0RK?=
 =?utf-8?Q?SJcylzkuckKv7LuU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6de74768-3138-4716-2412-08de75372bef
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 13:01:35.5149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ir3weJ6XabY1EYkskwep1PXI5Hchl2TsL+zed0goQmC4FGSAcX9q14tEsaqgZ704G/5BWQvCaLTYfHuVXH+pgUvJmXS9fJhgPykhvHl+qk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6803
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:dkim];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[sebastian.brzezinka@intel.com,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Queue-Id: C59D31A6050
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 1:23 PM CET, Andi Shyti wrote:
> On Wed, Feb 25, 2026 at 06:29:12PM +0100, Janusz Krzysztofik wrote:
>> On Wednesday, 25 February 2026 16:38:18 CET Andi Shyti wrote:
>> > > > For clarity this can be written as
>> > > >=20
>> > > > 		nr_pages =3D min_t(unsigned long,
>> > > > 				folio_nr_pages(folio), page_count - i);
>> > > > 		nr_pages =3D min_t(unsigned long, nr_pages, max_pages);
>> > >=20
>> > > Do you think the min_array() is less clear?  Let's see what others s=
ay.
>> >=20
>> > min_array() is clear, it's the ((unsigned long[]) { ... }) that
>> > iis nice and fancy but of difficult first read. But, as I said,
>> > it can stay, I don't have a strong opinion, maybe I'd have done
>> > the same.
>>=20
>> Would you be more happy with a locally declared unsigned long table,=20
>> initalized with those 3 values, nr_pages - i and max_segment << PAGE_SHI=
FT=20
>> statically, folio_nr_pages(folio) once folio is ready, then passed to=20
>> min_array()?
>
> mine was only an idea, I'm fine with what it is now if no one has
> anything against it. Perhaps, just a little comment could help
> understand why we are evaluating out of three elements (but we
> are talking trivial details here :) ).
>
> Thanks,
> Andi
There=E2=80=99s also a min3 function, but you=E2=80=99d need to cast the
variables, so using an array is ok in my opinion.

Best regards,
Sebastian

