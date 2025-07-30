Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F799B16203
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 15:56:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33B810E363;
	Wed, 30 Jul 2025 13:56:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fcuZXrYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF66110E229;
 Wed, 30 Jul 2025 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753883760; x=1785419760;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UBKFZ5WEHKxgQoGxeY+LnEC+Y9cSXNlwlHsRLbdwQlw=;
 b=fcuZXrYxQZmXfE6Vt45INNQqynkur9kho24J7bSyNHvcQvnZeAszDvsE
 wbi8XDTw6ih+DkMGYNDQxSh/R1AYYniGXSBgYGAymt2RBzIUwOEtIrVXv
 8GAh3xsWT3Y0JZFRWMbBhCaIiIAwlgxxOyX+KwOKcwPgt1VF9qmZNwcVh
 dsRZC5UTp3XRRAblb43+/Rq3K5Zfgxt25RDefrv7NydViMd3rn5foWRjQ
 P85HGSA6mVL1bsRBdY4TQ+TQI69rxQWtYpGfM7jCXHONvEuT5A0rAxU0v
 hchmLAXjcKyUlwk12OGJUen0gt9ZVzgUtv+13UjmLMdQQ+q7ORkhwtzyQ A==;
X-CSE-ConnectionGUID: Wg/g58+2QaqWoi9Tjxk8kg==
X-CSE-MsgGUID: vJU33pJERVeLA+oFPIGLYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56331855"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="56331855"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:55:54 -0700
X-CSE-ConnectionGUID: KgWkzETzQhOQ1aVqoXC7qA==
X-CSE-MsgGUID: v0t+G2wQT0e8pNwxYc+zjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; d="scan'208";a="162263121"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 06:55:54 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:55:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 06:55:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.80)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 06:55:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gVEIoaVOLrS2LuYSejxvVcSQntCiObvGCoPf+4Br/uKwebCkfHGzyKQS6yFtwgzAi+t/5z8LseGOr9HXFiAak8ZWv6CpwH7Kxz/ZKY1WuqUAs30I3Ucr1wndHEhS3uEWDcyH1/g0lwMe1DmyuIqGoDXC5SQI9ZgvpDMJwyUzQO/i3MbkaHYkYRjAhEyTFxKaWz7ltxY65VLE5ctqWcTY8pi9dhhe+AqsOg5QXbU3yaM6giSE9XhcNOzykZ/3/qgDoVEmErhH9R5TW2XX45lpYHweNAanXgyImOcO6Dyq5ovIFdc2wbawQxotmkezNKhNUeL/6x6XVEwuETXl63cdZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ZmFM/xjbH5xWamQu9hTbCr+igTh83QCW5gV/qYoUBg=;
 b=q+/gPZtg0kHzM1ASv8ZpJOl3cxoS9FVdXa/Gm6/O2vS9b34HM0Bz5hIPlvyeusDg+TqnSpZ/CPsGCV4mOxfoWnIG0GP+rgk8scloP8jIhppw90ZYGOR9w4oH89B6+lnyOhNZ+dxkR8cXBICB3UVXPxXrSAndLgLjE1xBD8QndeEpRU7J1LUNxUTbKPh5rbFDjkLNZxF6OVgFxWyCyvaq9WhrJk7bcLI7H+PUs/WPzgacbBUuIoTWRgCBNGZRvHW67ukHhRjqVIspR1ITBxa1Av9bOP83E5jKe8vYi6ysvIIJktqyEBVSeLLfJ3Y2pmJmkeDNAdjQtflZaENLx4A7EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MN2PR11MB4520.namprd11.prod.outlook.com (2603:10b6:208:265::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Wed, 30 Jul
 2025 13:55:18 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 13:55:18 +0000
Message-ID: <006d2033-a454-4ff9-a9e5-027bee7c3804@intel.com>
Date: Wed, 30 Jul 2025 19:25:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/atomic: Return user readable error in
 atomic_ioctl
To: Harry Wentland <harry.wentland@amd.com>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, <naveen1.kumar@intel.com>,
 <xaver.hugl@kde.org>, <uma.shankar@intel.com>
References: <20250730-atomic-v2-0-cc02ce0263dd@intel.com>
 <20250730-atomic-v2-3-cc02ce0263dd@intel.com>
 <d3362052-cb4c-423e-8598-d1f0d3618882@amd.com>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <d3362052-cb4c-423e-8598-d1f0d3618882@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0001.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::14) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|MN2PR11MB4520:EE_
X-MS-Office365-Filtering-Correlation-Id: b2785f93-797e-4d55-2904-08ddcf70b7cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFNacHFUYldrRzFXeFBCV0F2b0ZUTUlQSDhleUQ4bjJyWm1SODZia0swWlRj?=
 =?utf-8?B?QW44L2dNL1Y3NWhvZGJLUlVJNm5OTTAvb1Z1NU80ZGdCb24rZG9yeDFwUStJ?=
 =?utf-8?B?bFpEY21iN2FKcXR4SmlBaTJMSVl0U21YQVpaRG91clhweGtpa0VNTnNVRFVv?=
 =?utf-8?B?SlEvTXRHcThHMjR1ZEloZERhaGlEbEE1NGpEZjdsdjZDRnhBdVNITDVvbDZO?=
 =?utf-8?B?OXNYR2wyUlN4L1haSThlN0xlTmhKVDJvT3hwczdtS215b05iRXorK2hsd0dD?=
 =?utf-8?B?QkFIaVR4b25ORmorcE8reGhUc04yMUo3UVR6V1lBSVhFaG9LSy9CMWRLUGEr?=
 =?utf-8?B?SmZodnZBNTYwWDVWU1dEWUg3OHQwdTZPcklQWUQvS2dzb0ZOcnl2QU5oTnF6?=
 =?utf-8?B?aEc0eEh1L2dXb1RlNXNsOUJ5WWVpUTBtTFpsYkZkVFU4MjhtVmJEVDBMUUJR?=
 =?utf-8?B?Q241MFJPTEx4dTRhdzhJVExKR0xDTFZyTEJsdm9IZlMvNndwSHJKMkJwcHVU?=
 =?utf-8?B?WlJKRERLNytReUwwakxNRlNLdWdENzNTMnUrcWx0cUdCQ01QK1FXcDNncWxL?=
 =?utf-8?B?Q0ZSZ3l2SllMeUVLREVXaGJMVm5TdHpvYU1rRXVDSjlxLy9jR3h1RXpTdzls?=
 =?utf-8?B?TlNHTjJuUnFYNnlmK05ndVVYWERYTmYwZFdSVllmYmFmSUJ4d3NjL0RvU3VZ?=
 =?utf-8?B?ZjBhQTBuZStCeG56NTc4OVlHb0pYZnRaYXRMUExOdzh4d3l2cWZRZmdSOHpS?=
 =?utf-8?B?aVpNSHF1Tm85aFpOZk1aK2xuZDdhRDREeUxhUmJtSVY0K3VQSDY3RlFsMTNZ?=
 =?utf-8?B?U3BjeXZPS3JsVTF6dnVVVnRnaU83cWRzcVRRaC9DQ2tmbTArelNhZHI3SVNn?=
 =?utf-8?B?TnNXK1YvQlhDSXNCZmNRKytPNW9uQjlWK1lCa1J1aWpiaVBSaU4rMDdodlBs?=
 =?utf-8?B?UkRpMlZJVlNMSXFjWGd2R2lMVXFmaTc5UkhRZWIzTldoZnI5NjVBMGJ5dTdG?=
 =?utf-8?B?TVJyL2x4NmduM2hEZkYyTlNRY1F5b0tBYUVEUWkxMFBydW5hcVJleDBENFVt?=
 =?utf-8?B?MWV5OW5xRVJlUmdoMjRjaUFHS2ZGTkg2aElXRnZMOC9oT01HSXFJZjM4Mld3?=
 =?utf-8?B?MFJXODhUS0dib3p2T2N1ZzQ2N1h2SzZmRStQK2VURGNhUnl1VVF0UzFiRzE0?=
 =?utf-8?B?bzFSQUdiVjJ3ZWRFcXdiSGJWVUovMnZkU0Q4SFM2RjhsWlZPeDdyYmo1NTlK?=
 =?utf-8?B?MDgzMngzL0hGcXRUWWZ0L1JKcE4wTlVxYW84eWIwM1dzYXBGekRyWFhOQU5m?=
 =?utf-8?B?UTZCcFJaZ0UrV24vY2RoQW1LTytScXpQT20wMWJtMkdCOWV6NWdhV05Id1U1?=
 =?utf-8?B?dWZ0RnkrYUlDanpBTDZnVk9Uc0I0OFRaczV6TDdNRXJ3YlZqemZlQjNndzVu?=
 =?utf-8?B?QjF0ZWgzczFwc0oxcWtZZnJZaVJUdVRDNlpZaVhIYm9NSjRMeE9UWE9vNTdW?=
 =?utf-8?B?NEFZV3FvT2pFU2N1R2JhNzNoSmJSUTRGendxc0lJWlBzN0VnZHFrLzJnVndK?=
 =?utf-8?B?QjJJblJjMzI0a1FVUlY1WHZsOTNVM1BCTitLa01JQ28vdWsxWUpVVmxkZE5a?=
 =?utf-8?B?c2UvVk4zNjdrYXc0RXNqV3owMTVZUXJrOHp6dm1qaTJRV2xVL1ZwVUw4d3ov?=
 =?utf-8?B?L2hydVdQa0x2cjEvTWw4VkROYVJYSVdQaHAyMERDMlM1bkwwbURYV1ZGbnlq?=
 =?utf-8?B?TXg4bGM2UmZLL3RGTWxXVWZEL0dMeUNSNEgvZGNpaGI0VnhxNG1kSEw1ZExk?=
 =?utf-8?B?Vlg4YVRhbkw5ZmtJcXVVcktiVjY4YVRlbENqUTJGNTVtMWhna0NXOXdUUVFk?=
 =?utf-8?B?clBSaC8wV05KUUh6S0Y3THg0eDRBcmozbExkaDZCR3BSdVZCa05KMER2Q2ZM?=
 =?utf-8?Q?ksTmUV5+MME=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1U4ajhFNlRwM285dzg0eUxmck5CLzNFRXdwcEZSM2ExQzJGM29EcmxWdDVF?=
 =?utf-8?B?ODJIQU9FSjhvTFJCMCtJNTdETVA4WmUwTDFVVU9helFta0xlK0tzdUlVeUtH?=
 =?utf-8?B?US9MMTQyZndNNmJwOG8xdGNYN2FPaGM0eGh0NlJhVGJwQmtnckJtWnN0WTNw?=
 =?utf-8?B?YnRybkJ5TDJraDJRNE9GZUFmYk55WVlxUjQ2ZzFPZXEzWkkzOHllUUluUlJL?=
 =?utf-8?B?dlI2aG80RFIvZUY4QTNYZ3pCMXpZa01WbnlzMFVTWFFNUGV5a1R5OE93MGpY?=
 =?utf-8?B?OVhCSlJFRWNjOVcxcVJpcHFYOUQ4Ym5Qc0Zla2lORHQwM0FxOENCRm45TTdP?=
 =?utf-8?B?ZERBRnFiNFVHclZTM0g0ODFOZ29lcTF0eWgrc2dONWVhdzlBeEpKVEduc0Jo?=
 =?utf-8?B?ZVNZbEpCN0ZYRm82R3J1ZU8yUCt5bkNQWW1qN2pQN0ZTaVFpL1pjZXFoakFJ?=
 =?utf-8?B?L25FQ0xRaXRRYVppclUrQ3B6YTBXVEE3SXU1R0NwcG96SDU1KzBQZGpEbS84?=
 =?utf-8?B?YmJVS1V6NWMvL2FHUU5ObmY0dnM1WDVjSTRZblU3eG1YZ3h1SXA0ODhERzNI?=
 =?utf-8?B?bTc5TzVDOE5RdElXTVRUM3YxZlVRRFNyYmxCRjZnTDB1UDVnUGdiRGxKOUdE?=
 =?utf-8?B?NUJmNGZvSWhKUjBMY1JoaWN0cjVtQXFaWVQ2R0gyREF6czliNmpLZjQydFpy?=
 =?utf-8?B?TzVYTlh2c2hoaEdaRGxPN0djYm01dXZQZENIdTlVdWJibFZrWXBBenVmMGo2?=
 =?utf-8?B?RitDd2JlN290OUQ5TExXUXBac09oM1NFMXYrdVhxcGFwdnhTL3ZiV0RpM1hO?=
 =?utf-8?B?bkE5SFZxSnFTa0FDUUlxRTNYNEJLbXJQeHdYd3l1aGI2cGl0SUorRXZjelVX?=
 =?utf-8?B?b25xaU8xU1FtTi9hWHBmcTZhZGRUdjlGM3lPdHVJYVRQOHV0eTNjYlBGdTEz?=
 =?utf-8?B?RDVJS01wSzNZb0VxQUFMYzVCYUNLdEgzQW1qL0xwMVlQd3JIWVU5bjBNdjU1?=
 =?utf-8?B?NTZYcWdwdjFTSDd3OW12R29HMTNuZ09QU0NqMkl3bDRmUjU3L1BuVmlGK3Y2?=
 =?utf-8?B?ZWxRQjJ4MTRSaGdHWm9VVCtqS0ErNHd0c0ZBY1RtUDU4bk11VVZyRFFKcmpy?=
 =?utf-8?B?blAxNGU0UWU3UEVySUE2Qk45cFQyNTNOMmRlRU5hSk9RalpENnFiWm5zdk1R?=
 =?utf-8?B?c2g4SFowZWVEUU4vbUEyVk1PNFMxdG5Ta3lHVlFpRjJqYzlvK0RNc0U3a0dO?=
 =?utf-8?B?eHhBaG9yS1JnQmtHTjcwUWR0UVpXeWxNQUl1aEJNd0NDaUFYTmNHeVNVNGYy?=
 =?utf-8?B?WGduY2k3bVlwTWVFZlBCSVZtR0hRVFJmTWQ2OEVXbEVDb2NrRGp1TUFPdS9W?=
 =?utf-8?B?a2RsMHNGZnhLSTZ0elB5eGQ5WU1jdTRBaWNOdllJQWYrcHg4NFV0N2UremVI?=
 =?utf-8?B?SkRvbVdBNW9yRXUvYWZySTNHZTJkSCtzZ3N3T095OElxN1hGRXJ2ODZGRUJv?=
 =?utf-8?B?cjhNYzJqZm8zY290MjJ5RDM1SkJqaFcrMXhSdDI3VWlRcmdsOW5aSU1Lelp5?=
 =?utf-8?B?U29KL29aVUUzeXZYU2JuN0ZSV0RERUJLMk5ob3Vxa2VsRjV5a3dGdjdEVmlx?=
 =?utf-8?B?cmwvQzRidUpVRWhNN0dTcHpSY2h4clIwejh2SytaVm8yeVJPUUVFV2RsaEp3?=
 =?utf-8?B?SVA2WVNOaVNpQjhSZ3IweERMR3RkeC9OMlh0ckpiUHBJUUZkOUJGMElodTZN?=
 =?utf-8?B?ZEozMmtXeGRweC9QNnVqeXh6OU1WZEhwVDE0S0piaThmb3hJdTVPOG5Uc0pC?=
 =?utf-8?B?WXRQZTFpN1cyZFY4azVuaE83VnVFbkoxaGlDZnlnazVQSU1jZEhoYStaUnJD?=
 =?utf-8?B?akdlZnpidVN6cUIvVzlVUnV1U1F6MThqbnQwdG1jUWZBNlJXWEVIbndZQkFq?=
 =?utf-8?B?dTNkWE5xOXg5c2k2R3c0VU1XRVRzNCs2SjZOQ0M0K0xYMWJ2MTdHRGxzVHJK?=
 =?utf-8?B?VThKUlR5dG1DTzVWdDdtTzRkMHVDbGkydVREdGkvTGcrSE41UWlxZTZ5NGVV?=
 =?utf-8?B?UGZpUkpqYVgwVWhUM3JxaXBUelM2YnEwUzNKVXJmUFVQZ1hQcm5ibUhxWWk3?=
 =?utf-8?Q?mkyMM/chOt0ZcJRBVk8LaVtBc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2785f93-797e-4d55-2904-08ddcf70b7cf
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 13:55:18.7445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Q3m2I/SrvAAAcH0LvIFZdua1jLrD6Q5H1GZCPL23eKQt3hpwgw8pgNYZzgJxTe4V5AoMzkV26zu0eBFMx67BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4520
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

On 30-07-2025 18:44, Harry Wentland wrote:
>
> On 2025-07-30 06:16, Arun R Murthy wrote:
>> Add user readable error codes for failure cases in drm_atomic_ioctl() so
>> that user can decode the error code and take corrective measurements.
>>
> Thanks for doing this work.
>
>
>> @@ -1541,6 +1548,9 @@ int drm_mode_atomic_ioctl(struct drm_device *dev,
>>   		ret = drm_atomic_commit(state);
>>   	}
>>   
>> +	/* update the error code if any error to allow user handling it */
>> +	arg->reserved = state->error_code;
> Once we do this we paint ourselves into a corner.
>
> It's nice that we have this reserved field since it allows us to
> extend the atomic ioctl without the need to define a new one.
>
> When we discussed this at the Display Next Hackfest [1] we came
> to the conclusion that we would want:
>
> - an enum to show what is the issue
> - a string that can be logged to display verbose information
>    about the failure
> - an optional array of KMS object IDs participating in the failure
>
> We could define these in a new struct
>
> struct drm_mode_atomic2 {
> 	__u64 failure_reason;
> 	__u64 failure_string;
> 	__u32 drm_object_ids[MAX_FAILURE_OBJECT_IDS]
> 	__u64 reserved;
> }
>
> that we link to via the drm_mode_atomic->reserved field.
>
> Your approach of flags, as opposed to an enum, would allow reporting
> of multiple failures. Do we think drivers would ever make use of it?
> Normally check short-circuits when a failure/limitation is hit.
Thanks for the feedback. As pointed it would be good to have a struct 
pointed by the reserved variable, so that we can further extend the scope.
W.r.t the enum, I feel its better to have bit notification as we can 
convey multiple errors if any.

Understand that the driver at present will return on the first error but 
upon adding this user readable error code can extend the driver to check 
add the properties provided by user and report error at once, so that 
multiple failure iterations can be overridden.

Having obj_id would be a good one, but when the flow goes to the vendor 
specific driver, they may not have the link to the obj_id where a 
failure is occurred. But still good to have so that at the early stage 
in set_prop, sanity check failures can be reported with obj_id so that 
it would be easy for the user to correct them in the next atomic ioctl.

Will take care of these feedback in my next revision of patch set.

Thanks and Regards,
Arun R Murthy
--------------------

