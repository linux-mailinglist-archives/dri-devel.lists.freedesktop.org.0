Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B2A79FB9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 11:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BE6010E97C;
	Thu,  3 Apr 2025 09:13:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MmFBaLIr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F8110E97C;
 Thu,  3 Apr 2025 09:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743671582; x=1775207582;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xofB9wSZ1Y28B1u2UszQfaqjJwGNKseC/KiYOZmC2Ho=;
 b=MmFBaLIruTgZhKnj/9Qqz/YFxg0pPhhKLndMrJvLXUyPG/BZS8qEjEOz
 uNNNSmDviK2nn6UVrsdjb5R/uSxfkIHQGzrs7RfFKXoKW7QNjYTd6123D
 aClgPmVBh2vUrR/DdLQaJOnMr9/9912cFPmt4ogF+9S2XGAnHHG0c9AKt
 sPtsC6+BWZFd855QqoA0a1U8YNKOOTRvSL/Ug6LAXsdbIlSm0NBNp6a7d
 uj/bNLK3JLW/ePK4LRjjf2cXQrzrB9ul0GwDlUqETN/VynU2bSXKWrGJJ
 Q42qpDL7qgnaz0c9o1MCH56onLxpgC5nUEEF3RWXVP7m7LneAuuP4f3Ou g==;
X-CSE-ConnectionGUID: 6+ly7SKJRuyiLSYR2nXYOg==
X-CSE-MsgGUID: b9fd1FVNQfu0QeoAOCvZPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44961024"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="44961024"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:13:02 -0700
X-CSE-ConnectionGUID: O0Fyv+kbTSKVjrmDRJEVmQ==
X-CSE-MsgGUID: 8rYdEppATZKSzDHifm2zVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; d="scan'208";a="127448140"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2025 02:13:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Thu, 3 Apr 2025 02:13:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 3 Apr 2025 02:13:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 3 Apr 2025 02:13:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3xEJ3B7fLci3IQxuiGROe8WfrL8tX29AFycPHxbBt2/g4J8Gdh2t/cViK7cdIAdG6fJgMHD2vyfZDyR14el2d3oWJ/SL+1S3kOA4syQkPjJk38lSHNJ4RqzRqqWGcr6XHye2/YLbfeAicayArW+AtscE3rJ4XlI2XkcykpI+9UDe0F6Dtf35nsyz7Oyryifk9lTXRQGhsMRO/M6akEffoCfV9q404v3o9y+eHgFLuNOFQf8oy5YA/xLu5gIfjwqlcbvn2atUML1CmUHVtHdEG4d1FNywKpAYNdj5mC/FfylqYE4BQg1Sz7w7fBvm24S3VL9BXJH9w4lWkzjnSZ0vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qnTpfRoxin89oIqpK39f1mJN/7ydfP/to40dZCibKB4=;
 b=ra+DbhzTlLCIqcZJS7N/4Jjf5L12YGvieK8OJ5Fe251htpHFQczu1qehCmf+saGwoGbz/XX/QwmhKdIZbXlsW84AMxYUJC+V7kuFtl4nlvn+adEFTG0ERORSKeJDLhpNxBg3x5jL7nvYo5GtW+mNRI/LeT/XVxuJlp4O/H0L42xsysC5bFiXVwpkVcRZF2Pak1FMEgKf/aG5nfrR/mVuZkPRKK3DJoBkvQCkD70HWJDOE9u4XWXNS9F5Zn5/wbt96gC7pTCQ/8utH3UF0mHaLd5iE/iBV+w/WUN1FlWwe1MJHh7dJD14piFGwhfDYQceaYhJXMfWyzHHxAKlsgeedg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA1PR11MB8830.namprd11.prod.outlook.com (2603:10b6:208:599::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 09:12:18 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1e69:8fa2:c9aa:7524%5]) with mapi id 15.20.8583.041; Thu, 3 Apr 2025
 09:12:18 +0000
Message-ID: <c1b77ca1-1851-4e3b-be37-267388a7501c@intel.com>
Date: Thu, 3 Apr 2025 02:12:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/huc: Fix fence not released on early probe errors
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Alan Previn
 <alan.previn.teres.alexis@intel.com>
References: <20250402172057.209924-2-janusz.krzysztofik@linux.intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20250402172057.209924-2-janusz.krzysztofik@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR06CA0183.eurprd06.prod.outlook.com
 (2603:10a6:803:c8::40) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA1PR11MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: b0edf20b-0923-451c-73d0-08dd728fa1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V3hjY29XVk1GcXdjMEM1WEx5QkEyRzR1cjJZS1pVY0dIZGxtcnNPRmNqcThM?=
 =?utf-8?B?OHA0bDYrT0Mzdlh0TnM3NHJNZXY2OExvZUQxK3pXWWRMRFBxZjFmcGJzQ2hu?=
 =?utf-8?B?cDFJNWlCeGQ3RE4ySzREL3pGMzBKNmlFQVFmRzVJNEUxSXk3UVdENTJ6azRt?=
 =?utf-8?B?ZFR0QjFLTlA2b2Q0NWprSkZ0bHFFZ2JVYnVmMUkyV3pmZll4UFRLSm5OVlRP?=
 =?utf-8?B?dVQ2dUVDSS9PVG5rTlo2VS9rUXJPcXdKUjZjazkwRHo3MTZocVpiOGJHY2VH?=
 =?utf-8?B?SGdjYitQZklneXFpOFMrTUw4d0xDencvZzZ4MFh2TEJtMTE1OTl1cG1MZ0ZG?=
 =?utf-8?B?RnlnRTM4SW14YjJ1Y01aZzZGNUk2bnh3Z2N3VDg1d3VRQTVSZmgvU3pnd3A3?=
 =?utf-8?B?ckxubTBwL2RTdTh5cUltOUtUaWVkM0pwa1JRVWdMaTA3d0ZRanc5emE4NEgy?=
 =?utf-8?B?bHhiZ3FySkdRdjZYbThyR1A0cGs1bWx1N0YrQVFSMlIyWmY2UE1QRFp6RmNa?=
 =?utf-8?B?RVB5d2ZpSHJMMXUxUWZXelZLRkZuZ0JKUEdabE1GWTNJRVp1dGdmdHNpcmN2?=
 =?utf-8?B?YmRRRFUwMUlBM2ptV2grYzJMbElueWIwNXorTlo0M3E2YVFiTmV5bE5vRklm?=
 =?utf-8?B?V25OVGZzUVhsQkZHeGI3ME9iVEhXclNLWXBwMkR3RDFLQmlWQjR0aEIvc2Jj?=
 =?utf-8?B?WU5XYjYzWHFWeXJGRlRhbVhPdlhLbkZHekFTeVdKTEpkQ2FNd1k4ekhFSWZj?=
 =?utf-8?B?QUptVzd2UDNYdDJnN1FNWVNxYmxFeUdQVG9nd0xyenFSakFJRHlRMjhhcGdM?=
 =?utf-8?B?N01XQlFLMStTUmJtNk1pZzc1WU5ZSU9EQVBBc3hTdlBHaGhIK2xhTnVvK3RF?=
 =?utf-8?B?azdKQm1yTG1qQU55QnVncG5qMENuUWdaTnJxeit4VnArbndpcjBZTFdrK0FI?=
 =?utf-8?B?Z3gxbE0wdzNneDdOZjZRY0wwYWpjdUdWRFE0REhFRmxLNlZ5T1V0T2RzMzBu?=
 =?utf-8?B?ZXU0c3kvUDRZV1F6QlVteTIyZmh5SWJPMC94MEx0Z245TGdpSEp5VjBkaGp1?=
 =?utf-8?B?U2dWSnlJWXQvSllNZTZ0bFZmSXNtSk9jdTcrQ2c4MUlIYzh2UFlydVJmb3Vx?=
 =?utf-8?B?bHgzT0Q3V2V2cFN6WUFtYUZBYnhPZW9pV0dBaEl6WTVvUUgvbzNSb2pnblNL?=
 =?utf-8?B?am9LR1BqYW1tYWZqd1B0U01Lam9LRVRVTXhIMXlNSzd3MEllWDZ4NkRhOFFC?=
 =?utf-8?B?Mkk4TUpTNkFwYUFIZUpGaFo5eEZuUkMxc2RCT0ZtRG9YdWVXRzh5TC95eVFp?=
 =?utf-8?B?WXd2MytmamVhamw0a2E1eUh2SnYwT1I1S1l4cnh2YUVvbGhEMis1NW9FdjFW?=
 =?utf-8?B?VldtVFpzQ3p4R2liUUxxYmx3bGcxNTZnek9EbldjcmxIWmJpRXI3ZmFtQ0pz?=
 =?utf-8?B?dTV6cGtzdVRxYnZEbE1vdkhGSTBDNitLUDArR21sWlZ1Z01MM2ZEMUZEUzZs?=
 =?utf-8?B?NC8yWU1MdmIxTEcycUpuZ04vU1g2N3RTdi9YeW1BelNaWDZ1akQ3REdZMnpr?=
 =?utf-8?B?MVNzYXcrNkZBaWlXakEwTHRqTURJWk9CaHM1azV6YXdMMUUrbGlxb2ZENzB4?=
 =?utf-8?B?V1p6ekJ4UmUxOGFRYlpoeWY0dHgrbTBqMnhlb2pldTBwWmo1amJhdEIzMlFX?=
 =?utf-8?B?TjJtMCtvQk1MSVVRVlh3S1E3b2tESDhWU2NzSHNjZC95ck1iT09OM2FNNHBN?=
 =?utf-8?B?ZGtnRjNJbHhSaXl2eWdPbHQ3UVpFNzh2LzMwZ0VPYS9HaU1rRlVCa2xWNEE5?=
 =?utf-8?B?YlNBYW9ObS80dXlETDNrdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFo5eHBwMko2Z2lySTlWYUJxZWcrRDJpV3R5STB4TVlEVDI5TkdualVpZWd3?=
 =?utf-8?B?Y2FQU0pTb3dFVWNsV3Vsa0FGMElZM0c3ZmgzNzI4bzZpam1adDdQWUVzakZQ?=
 =?utf-8?B?dG1MOVg1aG9DY1pwTVdwYlVDWFBZZWhXRmpsWjQvQ2JvSWRWT2piVktITHRj?=
 =?utf-8?B?WVdMUzF1RW1xaGhVNHpsZ2hsTnhVOXhYdTZYZ1FDU0xxeEZOeCtMZkQ3cDdD?=
 =?utf-8?B?THJiOHYweUxzM0E3eWZCQm52aGdqcjJFZzF0WnVDZUo1dmUzR0xEL2RuYjJQ?=
 =?utf-8?B?Wmxuek1PajNFZWJVU2R1WU5YSCtGbjFOV3RyVU5HREpzcU1sakFsOWd5RGov?=
 =?utf-8?B?ZnQ0TlJFeDZyeHZqZnB2ZEFzNzVEaU5TK0tXczQ1cHZZbHZHT0puays3dXZ0?=
 =?utf-8?B?dnJpOVJkM2lYelBmbU83eEpvbFg4ZWI2U2VVcEVpNnljbWhXU2VHb1lrMGVy?=
 =?utf-8?B?UjVTa3JnWVVCaU9SVE1wT21GQ2FnT3NFNkNrWG03eXMxajB1ZnhVWDgvUHhv?=
 =?utf-8?B?eUw3QnBtSUw2bXFVTHpxVVd3djFldmhndDFWMTlsaVNxZjU3TU9DbE5ZQkdF?=
 =?utf-8?B?V2l6VzQyTFlvMUN6TDg1aTRlR3pmckNnV2RmTlJISUxOdEhObWNIS1haTzAx?=
 =?utf-8?B?UXA4ZHYxMFZkU0VQR09JM2kzOXdUcCtFRlNMVDEwdmhWdVFNOHAva2pTZEZH?=
 =?utf-8?B?MVdnQi95amNUb2drZjVvbnV2dEU2NnZEazcrbUV0bHR0MVRvK0dLS29GL1Vi?=
 =?utf-8?B?TWpXcWI4dURYYTRxb2JaazlQT0ROUDVxdnd1d1J0ckJ1cXYrRGhranBXL000?=
 =?utf-8?B?dVY4M05aaHhrQk5sUXJEbEhPZ0hHQXhCY3JhcHFOSUdmYUhCb09ueE5ZR0ZK?=
 =?utf-8?B?TkpEeDhsQXFLb2t2OGdLTG4rMmp0eG1nVWtidGhvVzRnb2pFYk1nbDVSU292?=
 =?utf-8?B?UmNLODdOME4xYW9iek1nekprK3JsazFBNnJ3c1BTYXZhbDcyR3lCakd5SCtF?=
 =?utf-8?B?dnYrMmNBTTVLRE03bGo5SVdyQ2o4T2ZxYVpIWHNUa0s4T2hTOWh3ZEdsSWR2?=
 =?utf-8?B?TnlDb1FYb29RcFFGTnE2SHQ5WVpkekFtNlZvTFBGak04TVRCaEQ3dlJ6OUZl?=
 =?utf-8?B?U2tqT2hYb0RKNU1VNDh2TUxDWmV4a1hlNkg5RXJEeFBWOUJVK0RuZ2tZNi9V?=
 =?utf-8?B?a0RmSk4xU1NncldQdDB6YWt1MnJHeXpiNHl3cW03ajhmU0NRSHlNdU5YeEJx?=
 =?utf-8?B?dGtMRGU1UTcrZFRWQVgwQS9IQm8zUlpMSWNSajhFZXk0MGFRMlVXc3NlUnFP?=
 =?utf-8?B?cFIxQkIrMFRNM1pVSnpHdVNVdjdWK1ZKVkhSYkhzZlM3OVMyMFYvRnhJcGM4?=
 =?utf-8?B?ZkxyUWNpNlJPNVhaVzhZQ3RkUzNkUjZoRXZlQnVFRTdnTHJPVnZzQTFKbDRM?=
 =?utf-8?B?MS91Q1ZuK0U5YVZscm1ETTczRzBoYmExbU0weVdYbk5tSHYwaHN3NXN3b0Zy?=
 =?utf-8?B?YmhRVm9CK0l5aFoySGZySUVvdU9sYWUrV3RXU0lnaEJiMjFOY3J1RGEwS05T?=
 =?utf-8?B?anVDd3VKeGhWTDBYQnF6WHFmcGFGdUdUMlR1b2tvbDJkTGtGRjlDOUhMb0Fq?=
 =?utf-8?B?MTZkdGlZcUQyczF0aUlMZlJMbmFTWWs3bWROeUk2bXZ2NThlcUx0bUszL3Vt?=
 =?utf-8?B?UXBjRFFSRGxJd3l0WjBoY2NaWDlDUk5nRnNkUFdkaWhnRTNvWXVlMnFZK3FI?=
 =?utf-8?B?dUo1cjBoL2swYUxpR1pIRHRFSDF2TjlVTGVZcmFZc0xyMFNpNVJnejdVcnM1?=
 =?utf-8?B?NDJkRXd1cDY5bmhML09hdENYMU4yYTJVREFoNjhaMXRNU0hDdE9Od2NMZDBM?=
 =?utf-8?B?cnliK3JRWEVFeTlKRDRwbGNURCtFU1lQekpqeFNtZ3l4ZmprMWwyNENkaUY4?=
 =?utf-8?B?bFlBZ04rbjk2SVpwR1VxSStQeklydHY3VVNQQkJlVnVNWFZOY0RnK2ROWE1V?=
 =?utf-8?B?Rllua3l5cTYyTVRtU2RMaTdsMnYxMHE3cEFJL1g4emZadGdsa1k0bmxoanFJ?=
 =?utf-8?B?a3BFSUtEWHFFTmRJV2REQllmYk9JKzh0TzlEZnpXNU1kUVBRUGMzaXhHTGN0?=
 =?utf-8?B?ZHhUYVY2YlQ0MzdhTFhkNEFFQXovSkVGeVZXc1phekZWTW1sNHFIa01xZTZU?=
 =?utf-8?Q?3ytvvwql0Beihnt8qWjAzPQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0edf20b-0923-451c-73d0-08dd728fa1d6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 09:12:18.0341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yheBQgBNvIUgPR8T8eE1st08RkMTO3zoy2cyC0OdvakFHUTuYydKI5AWtAGIRwrZ2sH/aty9LbaZbRlCqPhFPckye3bTYLFJC+wl+CmXK/o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8830
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



On 4/2/2025 10:20 AM, Janusz Krzysztofik wrote:
> HuC delayed loading fence, introduced with commit 27536e03271da
> ("drm/i915/huc: track delayed HuC load with a fence"), is registered with
> object tracker early on driver probe but unregistered only from driver
> remove, which is not called on early probe errors.  Since its memory is
> allocated under devres, then released anyway, it may happen to be
> allocated again to the fence and reused on future driver probes, resulting
> in kernel warnings that taint the kernel:
>
> <4> [309.731371] ------------[ cut here ]------------
> <3> [309.731373] ODEBUG: init destroyed (active state 0) object: ffff88813d7dd2e0 object type: i915_sw_fence hint: sw_fence_dummy_notify+0x0/0x20 [i915]
> <4> [309.731575] WARNING: CPU: 2 PID: 3161 at lib/debugobjects.c:612 debug_print_object+0x93/0xf0
> ...
> <4> [309.731693] CPU: 2 UID: 0 PID: 3161 Comm: i915_module_loa Tainted: G     U             6.14.0-CI_DRM_16362-gf0fd77956987+ #1
> ...
> <4> [309.731700] RIP: 0010:debug_print_object+0x93/0xf0
> ...
> <4> [309.731728] Call Trace:
> <4> [309.731730]  <TASK>
> ...
> <4> [309.731949]  __debug_object_init+0x17b/0x1c0
> <4> [309.731957]  debug_object_init+0x34/0x50
> <4> [309.732126]  __i915_sw_fence_init+0x34/0x60 [i915]
> <4> [309.732256]  intel_huc_init_early+0x4b/0x1d0 [i915]
> <4> [309.732468]  intel_uc_init_early+0x61/0x680 [i915]
> <4> [309.732667]  intel_gt_common_init_early+0x105/0x130 [i915]
> <4> [309.732804]  intel_root_gt_init_early+0x63/0x80 [i915]
> <4> [309.732938]  i915_driver_probe+0x1fa/0xeb0 [i915]
> <4> [309.733075]  i915_pci_probe+0xe6/0x220 [i915]
> <4> [309.733198]  local_pci_probe+0x44/0xb0
> <4> [309.733203]  pci_device_probe+0xf4/0x270
> <4> [309.733209]  really_probe+0xee/0x3c0
> <4> [309.733215]  __driver_probe_device+0x8c/0x180
> <4> [309.733219]  driver_probe_device+0x24/0xd0
> <4> [309.733223]  __driver_attach+0x10f/0x220
> <4> [309.733230]  bus_for_each_dev+0x7d/0xe0
> <4> [309.733236]  driver_attach+0x1e/0x30
> <4> [309.733239]  bus_add_driver+0x151/0x290
> <4> [309.733244]  driver_register+0x5e/0x130
> <4> [309.733247]  __pci_register_driver+0x7d/0x90
> <4> [309.733251]  i915_pci_register_driver+0x23/0x30 [i915]
> <4> [309.733413]  i915_init+0x34/0x120 [i915]
> <4> [309.733655]  do_one_initcall+0x62/0x3f0
> <4> [309.733667]  do_init_module+0x97/0x2a0
> <4> [309.733671]  load_module+0x25ff/0x2890
> <4> [309.733688]  init_module_from_file+0x97/0xe0
> <4> [309.733701]  idempotent_init_module+0x118/0x330
> <4> [309.733711]  __x64_sys_finit_module+0x77/0x100
> <4> [309.733715]  x64_sys_call+0x1f37/0x2650
> <4> [309.733719]  do_syscall_64+0x91/0x180
> <4> [309.733763]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> <4> [309.733792]  </TASK>
> ...
> <4> [309.733806] ---[ end trace 0000000000000000 ]---
>
> That scenario is most easily reproducible with
> igt@i915_module_load@reload-with-fault-injection.
>
> Fix the issue by moving the cleanup step to driver release path.
>
> Fixes: 27536e03271da ("drm/i915/huc: track delayed HuC load with a fence")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13592
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

I'm kind of surprised that this issue only showed up in the last few 
months, given that the code has been there for 2+ years. Did we change 
something that caused this to show up? I had a quick look at the patches 
merged around the time this issue was first reported but I didn't spot 
anything that could impact this.

Daniele

> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c | 11 +++++------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h |  1 +
>   drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
>   3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index f30c90650b7ec..9659e6a301e19 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -317,6 +317,11 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	}
>   }
>   
> +void intel_huc_fini_late(struct intel_huc *huc)
> +{
> +	delayed_huc_load_fini(huc);
> +}
> +
>   #define HUC_LOAD_MODE_STRING(x) (x ? "GSC" : "legacy")
>   static int check_huc_loading_mode(struct intel_huc *huc)
>   {
> @@ -414,12 +419,6 @@ int intel_huc_init(struct intel_huc *huc)
>   
>   void intel_huc_fini(struct intel_huc *huc)
>   {
> -	/*
> -	 * the fence is initialized in init_early, so we need to clean it up
> -	 * even if HuC loading is off.
> -	 */
> -	delayed_huc_load_fini(huc);
> -
>   	if (huc->heci_pkt)
>   		i915_vma_unpin_and_release(&huc->heci_pkt, 0);
>   
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index d5e441b9e08d6..921ad4b1687f0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -55,6 +55,7 @@ struct intel_huc {
>   
>   int intel_huc_sanitize(struct intel_huc *huc);
>   void intel_huc_init_early(struct intel_huc *huc);
> +void intel_huc_fini_late(struct intel_huc *huc);
>   int intel_huc_init(struct intel_huc *huc);
>   void intel_huc_fini(struct intel_huc *huc);
>   int intel_huc_auth(struct intel_huc *huc, enum intel_huc_authentication_type type);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> index 90ba1b0b4c9d2..4a3493e8d4333 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
> @@ -136,6 +136,7 @@ void intel_uc_init_late(struct intel_uc *uc)
>   
>   void intel_uc_driver_late_release(struct intel_uc *uc)
>   {
> +	intel_huc_fini_late(&uc->huc);
>   }
>   
>   /**

