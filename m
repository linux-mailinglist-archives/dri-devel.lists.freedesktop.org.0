Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A08A0A4E3C8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 16:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25EA10E1CD;
	Tue,  4 Mar 2025 15:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tfom5hsa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F9810E1CD
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 15:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741102826; x=1772638826;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fowOwkKdqr+FLuqkrtzYLeLhnL8UedJWC5ozNDC5LWc=;
 b=Tfom5hsaEqwom8fTt1xaRMv+ZKvA+e0Mvb9GqG6KriLk4apSvvICjuZ5
 38W72f9P9azA+LEORGanyQ4Q16ZWY0PxGhYYHUxgOsp5h3cw2wZDVTkuL
 bOinfs4LAt38mzn+DsDJ7Mb+dffiujstYKv2QtKeswqqQxfzHM4sA988L
 NJGVcQirY4IU9ktTtfAAYhyO+zcS+lBwUVSvphcmUFX/tlRQSpB/SgTY6
 LTXTBPcGhQ9J1T6Ek5lkM6r+abxjiGBdBcq7laSWclJhp/PwdbVDq+5QX
 NbbfU2BngsOS4Wfs/WF5DZEZjY20T/f6W+iZnm80ipEedw1erJUjaGSMa A==;
X-CSE-ConnectionGUID: B4RIQiisRy2tPagcHzWfAQ==
X-CSE-MsgGUID: t+4IK1FsRF+8+Y/69WopxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41204054"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="41204054"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:40:25 -0800
X-CSE-ConnectionGUID: tSlFhdOiQZGGjWku9YXyaA==
X-CSE-MsgGUID: p5mUfJrgRpqKoCi3kGqVdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="119090007"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 07:40:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 4 Mar 2025 07:40:18 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 4 Mar 2025 07:40:18 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Mar 2025 07:40:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LPObu4fgpcODt98kr2JPMfyuL9FdkjwZ37m7/nzZAaMb19GmoUU4D6HGrT4B9OvfqEQcVwxX0vacnz/r2VFfWzKZUyASzib6sTfVVPAPrMpD3nQU20aX2dfrp+3/1SsuBwOUqNgVfmoWiQLmJyl6yp6TkuGq7mtx0ibhExKbTbTIFb+03+x8cAxI3t8J0lS3P0mPetsBSXhLZsqX3FFI9pnDPEdwohfZYQ/exHIRZaas9/lbqxPqc1hdV5x8gWP8ldoq/ZlnJWLlwOIua5zYZ3KLb40ndRquuvZAhCu1mWGdDSVGRZ0fsH3JzXNP1BJf766B5cjLiP049z+83LmLBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwhMlh3vo2ub/8eXSKGvASXYobD2ORX3Lxonr2v/BSo=;
 b=nIAYWUu3FoyTWe1b8odu1eI8qO5ajI90mfuHOrkGvnlDF5XNg5eGGOk2jCM1VmxOji+QExWG+TR5vk3mg7YStg3fcKRFUVAVlDrRkXfpZRBUmiRPduamwouB8NO6K6CYDhsbBVBfZZDIjDjrAiciEDsIdGffNHftXJZJuME6iVgMlU3tIK7sON700V8H6U6qfHWhBLrajSEn6NbLo86QWDTRn9nk/Xv4rhiuyDqpJjBrXfIRczLvip/G3WHu2s+EhFXUNLRv+qmZjCjBt/jaahraCsdaSDYyNLvwnIqE5f/H21pCIuY4qBjOIx38n5xXsokOVKUaWu+i2Z5lhLvVLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6714.namprd11.prod.outlook.com (2603:10b6:303:20f::20)
 by IA0PR11MB7281.namprd11.prod.outlook.com (2603:10b6:208:43b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Tue, 4 Mar
 2025 15:39:54 +0000
Received: from MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2]) by MW4PR11MB6714.namprd11.prod.outlook.com
 ([fe80::e8c7:f61:d9d6:32a2%3]) with mapi id 15.20.8489.028; Tue, 4 Mar 2025
 15:39:53 +0000
Message-ID: <8ad4e4cf-1b4a-4e08-b880-266399c3e5b0@intel.com>
Date: Tue, 4 Mar 2025 16:39:46 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
From: "Lis, Tomasz" <tomasz.lis@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: Nirmoy Das <nirmoy.das@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
Content-Language: en-US
In-Reply-To: <20250204224136.3183710-1-tomasz.lis@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0050.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::15) To MW4PR11MB6714.namprd11.prod.outlook.com
 (2603:10b6:303:20f::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6714:EE_|IA0PR11MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: b1006aa3-e692-4d6c-fd8a-08dd5b32ceff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkVpalhkWjllTjZKbmhvNjEyU0ZnS1VyQVRkREV2akV1V3Z0YWlmUjdEY0NH?=
 =?utf-8?B?WUJNL0E4ak9lYVRzU0xJd0hjQzJTUFN5ZjRIYjZLUE5ZVFNsbEplbzBCOWFj?=
 =?utf-8?B?UHBpeXYxS1R6ODJUZjk2L1ptZFFkZjVKeXlZaSsvY214UnFKZTMrM2kwUmVZ?=
 =?utf-8?B?MXFQNndCVVJaQy9lUzRNWVJyd3Ard3hGYXF0czBUbGJranMxd2tDZmovRVJt?=
 =?utf-8?B?TDM1czBFSzN4WnhSQk95YjJYd2ZOdGlpd01HYlNEeldicWtTdkw3NHRPQWZU?=
 =?utf-8?B?a3k3eWZPcDNlcGlaQzZqZUVpejhOYTYreGs3LzJiQ2dVaFlIS2tRZmRlYXRt?=
 =?utf-8?B?QTBEK292MXJGclUyVkJwelFSRENBdWlaVTlxN0trdnF0U045cE1KRXl4T1kw?=
 =?utf-8?B?d0Jra1BzZkhnVzhUNUNsM2ErMU1TZ3pHenZwaXJjTlR1NGNoNXgveXZsUjl6?=
 =?utf-8?B?VG15cWNhNjYvRm1pM3ZhM1RBUlFORXN3S0wrQUNpSzNTOExMeU53MndmWlhP?=
 =?utf-8?B?d1ZUZDJQQ1ZCajR0ZjRuTFRxb0Y2MEg0THNhZWpRRWJXU3RvbmpGREhRTHlE?=
 =?utf-8?B?U0tSMlRFSXBhK0x5K3BoV1ZRZ0ZNdTRReUlwYllvcmlyc2N4dVM5V2w5N2Y1?=
 =?utf-8?B?WElrTVd2anZ3aW51aEZNWGpYQ0J0SFRCUUVBKzhUZ1pNMUNBRnF2czV2RU00?=
 =?utf-8?B?cXhFdjVjQktFeklxWGh5QzlVSmNZOS9yY3F4NUJCQWRzeEJFNitpSjlqSXRz?=
 =?utf-8?B?U0xKczJVUlJGcy8vdWlHSDhnSjBUclUzVnA2NnFSeEppbDE4aFdvVWlWZ3ZK?=
 =?utf-8?B?elZNcUFYU1dXS08zM1RzekFQakkwZEl6djV6ZzBaRXpYNHhyQzA1eW5vRnNQ?=
 =?utf-8?B?VHgwM3dCTG5pa1h2akY1eWF0K2ltMEZYQW1WdVV6cmxWaEpLWmtWRUlXaUMw?=
 =?utf-8?B?cUxudkxrUkJ4NWg5dVdOOHQwNGNIdCs5N244Mys4NmVCcW02eWhUQUpPYldP?=
 =?utf-8?B?U21WYm1tR0x6cnVpWmJ0aXR5MTV1a3J6WmsvQ05qVlMyUDUzN0I2dm5jUWVC?=
 =?utf-8?B?TnZybFFlTWNWemdvSm5nZ216QmNzQjBuOXJNdEI4SXVnaWJ1MzJLVGtDQXJi?=
 =?utf-8?B?alpvTDJ4ZkRsam1YM05hSnN4QVV2c3NhSFN4RjUweWZZZ2hLZnJteGVlbFJk?=
 =?utf-8?B?ZEkyeGtXSGFzZUM1VXpsWFlHYi9UM0RVdHRHVHFNdERhZlY4ckF2RFlxRDFW?=
 =?utf-8?B?UU1ETW9tbm9vUVpZeXpFYnlMZzhDYkRacFVkYnE5Y0Z2OFdkTkh5dVJoWnRa?=
 =?utf-8?B?MzVJaWNvN1oyaUEwL1g0NkFVcVhMNGE3WWtZVzFnajhlbThneksrRDdYcXVh?=
 =?utf-8?B?S0JnNGlvaEdpcERtZXVqYUVXdUxDRkw1cDloZWQ1eWQyRlBMRFNQMktSMmdW?=
 =?utf-8?B?akNnRnFjc2tST0IwSGd1eUdsaTRFSlZDZEFiUkdWNUVJbGRLd1Vzd21oMG11?=
 =?utf-8?B?blZtci8xT2N0OS95cit2bk1RY2dQVjRiZ0dYMXFJREtaT3ZEcUVucEg4RTRT?=
 =?utf-8?B?ZzJrK1lxOTVPTklVczJNdW9lL2FLdkxlZE1ZSUhUcGhvSUxJb0JieGdXOUFS?=
 =?utf-8?B?S0pzQnJSMTI0Snc1QU9rZjA0YTdKVldWdlRzN0dlS0lpUUNETnkxcXI3Ly9p?=
 =?utf-8?B?ZGh0Y0NSMWdrcXhoTFNEQWtYSG14TiszMm02NTRIc3h1L1I4TVBjUXoyRHQ5?=
 =?utf-8?B?MHRsL01JVW1VcnFldnFOTk5qY2JDdTNYTDRmZjk1RzhidURud2h5SDBiT0VV?=
 =?utf-8?B?RlV6VGtCemM3aHNDWVdod05xREtGUFVGbU4rQnAzYUxKbnVEYVZKUGo4d0V5?=
 =?utf-8?Q?6qiP39fPYOzQR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6714.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDY2R1U4WlpxSGl4NkJsRGtXWllURERuY2E0S3M4Wm8rVE1YeVV0a3VJaUpy?=
 =?utf-8?B?T3UxamxqZTVnK2FudVh3UVZuZ1VIRUVYdWZ2QjJsWmFOR2dTdnNaUjFEeVUw?=
 =?utf-8?B?eXFZdHIwNXVPSHJmOFJFR1hWTTNqakVtcGt2Z3hObVZuQlBjVlhWS2FmZ3Ro?=
 =?utf-8?B?dmU1V1R6S0JyZXFGeW9ZbzFxZHlBRmRDcGo5U3ArSWwrKzRSQWpaOWEvejZv?=
 =?utf-8?B?Q0lwSk1YTmxYMWgrWTBRRy9sUldxQ3p1eTM4WWpVdU9mc3JwVmZUZTlxeFR5?=
 =?utf-8?B?dmduMEQwcCtZdXJjazdaVjFvQnBMcDVLUlQxWEF4OFRmUWV6YklWZms0Mk85?=
 =?utf-8?B?ME96WUNnTU5ISmVqd01pSnNuMmg4VUpvSTFVK20zT0pnVm1ud1hHNXBQT21V?=
 =?utf-8?B?NkYxY25ITEdmbnV6aGE2REcyTjB3OVJlNmZUN1BNOXVTd2hqQ0xUenJITzZS?=
 =?utf-8?B?MU16MGNVTEtFUWowV24zRU1UK2o4bDRLbzIvSDVKNEtwRjN3Zkx0S1VLdzcz?=
 =?utf-8?B?N0JybWRBY282RWJQRjF6VGkvQzhOOUNjNXYydzlESE01R1phQ3RFY01JWXow?=
 =?utf-8?B?cmdaNjJ4UzhaV2tQWnNueHVKckFZNHFFYzBSem5FSUJJTXFsdk5HZm5aWUpx?=
 =?utf-8?B?QTRFVE1Qay9LdHFTWmVGeHVrc2NtY2x4RFN2UXJqcjBvUUVFQlNlTytuMlEy?=
 =?utf-8?B?dXBlZTJINXRSYUp1dDc2aVhqbXczV0hMbGYwUERnMUx6MEUvaGdmTmF0dTNG?=
 =?utf-8?B?T3phOUsvdHdCUDlWNVZLa0pYZnhUeDVZbWhmUXphMzVrQjhCeHlEUDRtT0JP?=
 =?utf-8?B?dWMzdU5NeTE2YmUyVHpkVVRlWlRjK040Tm11c3NXT1BIZ2VzZm9TbVA0akVq?=
 =?utf-8?B?NnRFSDNIaFBLekZrUUY5VmgybFh6MGluR3hmZ3lSV0l2bzk2R1dhUEVGdGVs?=
 =?utf-8?B?WkV0UlU1QndTVDdwV1Y5M1JPV0NIZ0pFdkVYQ0wrYmUvU2JqNXpoK0xndmJw?=
 =?utf-8?B?YmVGWC8zWFlVOHUwWEJpcG12RUFtcGFaYTV1SmM1VXNHRHpiUnRTVThMYmNM?=
 =?utf-8?B?aFZyRUVESk8zaHB3TkFuU3Y2TGE5N3dRNHZMTG9KWTJQY0t5TDZnKzh1ZCsy?=
 =?utf-8?B?YkE3RUtvb0VRamJsK1k3S0pNTGNmdCtJaXlJWmJwUjd3cEU2RkxBTGdkaFN5?=
 =?utf-8?B?SW41ZEIrNmFWSlJXRmgxTU1vbUxua3crUUxDN3M3MHVoMXQ3K0pDSXpIVXdo?=
 =?utf-8?B?VWozSXRxNzluckRSZlNCQU5YYU5PeVVEUGg3VnIxcDdwMWxVeGpoT0xHVDYz?=
 =?utf-8?B?Sm9TWGRJM1o1ZytrVXZWVFJwaFhYRlh4eTBlUWo5UHN6aldIdXJWOW8yYVlv?=
 =?utf-8?B?SlV1VzZJNGhOam1mS29rL2pZNDRWYlllajNmMUNvOEZtVmRLNTZUazZGK3Z2?=
 =?utf-8?B?Sy9LamJsR3VEY3orTlNSY0JLZXpRZzZaN0svYWJva25NSHJycVhzRjVkdzZm?=
 =?utf-8?B?dWNBa0cvOFZtcVJDNmM0bHJueFhxS3lkWGMyUXRuYXRQc3ZYeE9tTGxlWC8w?=
 =?utf-8?B?RW5kOXpGTysrZWMvRlVvVE0rVlhGVHJqbkZmNnZNb1dya1RITEllRjRFLy9m?=
 =?utf-8?B?MFR5aHRGaktjTytBVFc4MmFKQW5RdktHVmJoRHQyVXdaTTJ6WnN0M0dtWFZI?=
 =?utf-8?B?dks5SDJCL2tmL0h6VlJUaWE0ODEzMFdOblp0YWs1YjlieVNZK1B2dmlycitR?=
 =?utf-8?B?M0xDaGlqdVJiZTEvdmg3bnpobUU0NTQveGxBZ2diUUlLMmdmOGVHVFErdmMw?=
 =?utf-8?B?blZEblptRFVnOVlZZm5IOTdiM05kbzBzYWQyWUpuOE02YVVyZFdzREFwdmNW?=
 =?utf-8?B?UDNCQkVsMjVrRTkwK1RYSkRmc2VMb0NKbHZyb1hyWG5xeGZiOFpVYXVtM3Z2?=
 =?utf-8?B?aDN0TmZEYzA0am14a2wra0JRNHpQdkY3bTREOGpRWnZoRXkzc1hQM1IrQjV2?=
 =?utf-8?B?eHU2THJSaC9NUUwwcWQ5SEZYOWVlZjdkTDFpQjhyNDJkMURtZzZxdlg1ZkxS?=
 =?utf-8?B?UDFsU0JZNzZOS09xektURFFOS1ZuVGhOK3NZT1hXWkdDRURDUFVaZkw1K011?=
 =?utf-8?Q?fLUmeCjH7c2ELLOfFZSQwN8l4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1006aa3-e692-4d6c-fd8a-08dd5b32ceff
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6714.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 15:39:53.7241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxzziOB6ouPtAL/ozTW3n+X8FLzKu0BjaDejfc2L7qQsx26sxiAhEZhjWBpeA7O/ntuYCn/ThVYrLbGtp/E0hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7281
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

There was no NACK, and no further questions/comments for a month.

 From that, we conclude that the proposed change is considered acceptable.

In case anyone disagrees, please respond now.

We are starting work on a series which will use the proposed drm_mm 
function.

-Tomasz

On 04.02.2025 23:41, Tomasz Lis wrote:
> This RFC asks for introduction of an interface which allows to shift
> a range managed by drm_mm instance without repeating the node list
> creation.
>
> The long explanation:
>
> Single Root I/O Virtualization is becoming a standard GFX feature
> in server environments. Virtual Machines provided with direct access
> to virtualized GFX hardware, in form of VFs, need to support the
> standard set of features expected by Virtual Machine Managers.
> These standard features include ability to save the VM state, and
> later restore the VM, possibly on another machine with different
> setup. For the restore to succeed, the GFX hardware model must match;
> but for its configuration, some differences are often allowed. Such
> alterations may include a different range of non-virtualized
> resources assigned to the VF, including global address spaces.
>
> If any non-virtualized address space is saved, as part of VM state,
> on one machine and restored on another, it may happen that the target
> range differs from source range. To shift the address space,
> currently creating a new drm_mm object is required, and moving all
> nodes to the new object while adding the shift.
>
> GFX hardware handled by Xe driver contains Global Graphics
> Translation Table, which is an example of such non-virtualized
> resource. Should this interface change be accepted, a series which
> utilizes this interface in Xe driver will be prepared.
>
> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>
> Tomasz Lis (1):
>    drm_mm: Introduce address space shifting
>
>   drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>   include/drm/drm_mm.h     |  1 +
>   2 files changed, 25 insertions(+)
>
