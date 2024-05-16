Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD658C7C8D
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 20:34:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C1F10E39A;
	Thu, 16 May 2024 18:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXgeIA4r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9085710E39A;
 Thu, 16 May 2024 18:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715884440; x=1747420440;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=cwri5U9h2axIv52Lt2DKFLQALbrPBxd/6lQmUZsRas8=;
 b=nXgeIA4rhuGSLyiXvahcfhflt8ykEOfwItNA/LoG+42K8GhzS7/a/oH1
 bMqgRE3zheoS/oSNDoBeHuXObpCaHKsf0L1SZcRKF0XqUatgOQDcI9AoD
 qL7AJiFZtvnDcdbGmE5PK3+BLMcCrUL9z/KvBHm1z9o/mToFNT2ik5aNq
 ofv+G7STDUcBMIXZgDDUIYfksu7UfxT1Z+03WZVjKCcxkUXjID93dUgYr
 /47GpXcya046aZS8A7s5++qnW33GK8GSoLcvPfdVLpLHrxUU9TgQ2okup
 0BoMLRCJi7HkXEh1Zu5jiozOZDZtpHIBSqi7XzJOKYTtZctVcoLr7z4aJ Q==;
X-CSE-ConnectionGUID: JWxfgEL/Q9m2QBQYAX7Zow==
X-CSE-MsgGUID: xgUAqsgOSwK/divV0xUqhw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="23433564"
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="23433564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2024 11:33:59 -0700
X-CSE-ConnectionGUID: /9SQ4GU1ShmnKEd3rfuJRg==
X-CSE-MsgGUID: 5CwP+VvrRVWmn2wWwfqlcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,165,1712646000"; d="scan'208";a="31526734"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 May 2024 11:33:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 16 May 2024 11:33:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 16 May 2024 11:33:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 16 May 2024 11:33:57 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 16 May 2024 11:33:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+j7Jmj477e3pEWI+qbvssGyWSPDzpmWDj8qZgCOzf9sL0MC9Q3DbBTYvqvqVlFltNP4xgp126PgoHuVJNlW5jdjb5CIbrzDTGJT+Lb+Q7Xx4xMHPGpcNkIEpMmIgxwdPDodEkAjat2Kb4V5383o+I8EvGQngsoxlT4x/HHSkbmlfKvRPcc39mZsk9xbCkxskN9G/vEFxG3eWgb9KjpULv6tL3V8bcSM8XJ8F8m0BhmV5LCtMpz+5PakxzLxRs3Xqhff9CWfYB//YBZWR0zVTNfp773TZebNu5lsr4v5PztSjD+2huhQjvsHVufTquwhzD4f2TcHfc16X5+GL8L81w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/AB9Hzf0Gp5TGy8wqJVUB04TibIYHsRCMPEDh4AkC2Y=;
 b=fkGbqwY/LSjDKAfY3QjcMflCiFkEj7qinCgyBdLCZYP2qg5598TKcR0UfhaOhowDzVJrRdW/EVQoa+vgW/UGIhFu977WDGVEwLQAZEHoKMkDHfNV8l+k8dGaPFfKZs0G+dwlcyc/feRVQhd1yIzPxq1iEq/VV1N2ntgTbgKAkkmBfghjmHqBoMnUs+nU1U4g4AJAUus/mimzwcZ/pFPmpfLI1gYAqxd6otaBxiYptNmTqIXpBuBFb8Q1nLDHFcW2u0S+s9JE17wQpDCYd/9lzArW4DSWzQreKB8FJt+UIWwAx8J/IrZxLrP4dY/+GEsJNc7h+r3qfOrak/Nh3Zxfsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM6PR11MB4562.namprd11.prod.outlook.com (2603:10b6:5:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.26; Thu, 16 May
 2024 18:33:55 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7587.025; Thu, 16 May 2024
 18:33:55 +0000
Date: Thu, 16 May 2024 11:33:54 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 6/8] drm/xe: Cache data about user-visible engines
Message-ID: <ZkZRkhrAZ+0K6MZe@orsosgc001>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
 <20240515214258.59209-7-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240515214258.59209-7-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR11CA0095.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::36) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM6PR11MB4562:EE_
X-MS-Office365-Filtering-Correlation-Id: 695a2a79-535f-45f8-9c7a-08dc75d6be61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkFaWENoOVNFQ2g0WWdtbHY3T3J0dXpUb2R0VGRnbjVoZXlnd3YzdnNmUnh5?=
 =?utf-8?B?emRoaitwNTd3aHVFZlJnZnAxVFkramNRQ2pRc1RJWXFyd09mcmE0Y091NzJk?=
 =?utf-8?B?bE13QzFXNEhqanViQnk3T0lWTDNsU1dqU0NJcVlQTDlWV1UwZTlDOG5jOWhV?=
 =?utf-8?B?YU9ZbTkxZkxCY2YwRHhIZVBZN0FycUxrTys4WGZ6Y1ZkY1Z4VEk3UGtzR24r?=
 =?utf-8?B?emNKYnFMT0ZiNDUrOVNzd1p4OXpyRG5mZ1hzM2dGQVZnY0RBM1ZiOUcwRito?=
 =?utf-8?B?RDlYU1lLRnFCT1ZUMEt4dFBhY2g0NG43Z2pLM2t6RzU2dFc4N1hqanl0VUhF?=
 =?utf-8?B?c21VMlZ5eW9EcHdoY2JpUWI5Q3lkQTZrOWR3Uk5YNXN2Y1h3WHp3aSswZk1E?=
 =?utf-8?B?MDlkNkZUWjBSOUFNTm10UVREZ2QzcnhHQkRqaUt4dlM4TnZVR1phZklKUGJD?=
 =?utf-8?B?Q2k4YW5BTTZlRzZzUGg3c3U5VFdOZnBybkJaNUo2MTN5OEJEaDRCRlpXQW9G?=
 =?utf-8?B?TjdmdWZPV3ZCcjBSbE1JeEhjdHlSTGovVXRHMEpxL0tpZXpoVGNDNEl0aTdj?=
 =?utf-8?B?U2x0d1Zqb3VycE01cTVSZGtra2NkaUM0cTdXcWFza3d6VzZMaVE0VW9tNE1z?=
 =?utf-8?B?dU9tdlpxZU5LV0xhOTIzK01JekxxYkJ4Sjc3aHM3dGZ3Rit4SnJBQXVzamtM?=
 =?utf-8?B?RE9HZXJWOWltOTJFOGVzeDRYWG1QQTFTQ1pKdXhsSjZKVVQ3dFI0dkdJV3lE?=
 =?utf-8?B?R2U4dkZuUGcwMUFFWnZMMit0RjZMM3A0Qmt3WGhYMnV1WHRqOFlGaGFJWGtN?=
 =?utf-8?B?N2taUlRmTG1Xc29nM29TZXBiZEEzbWhmRWoxb1hNNlgwSHZoOEwwb3BjbFVG?=
 =?utf-8?B?dlRKUjNhNDVHNkNwcGdFQXFhSWpPK0o2dENmY3BLYU5ibmxHOVJ5OFBCMVRM?=
 =?utf-8?B?SXpvWFNqUWp5YTFBYmhkUTNVc3RjVmEzU0wxMDg1elNweERKSVE0ejlaWlJB?=
 =?utf-8?B?Y3VDUmlIcENCU084K2pGNGtmWGloMGpKb3B3U1RQR3pWSmc5RG1rbGxiV1RM?=
 =?utf-8?B?Vm5OL3ovOVlzQk9ibnB2RDRaRldUemQ3R1Ixc0krL1BLK3Y5WFZTTkhZb0dN?=
 =?utf-8?B?WXBkZ3o5TmZIWnlKUlIvOWkvazhyZnoyaEZJQTJaYlM2WDJvQ3FhN0R1cDNl?=
 =?utf-8?B?TjlOQXd6aEF4Z3N4bmxXOTNKN0g0a0hUd25VaGhIZUtobWNoVVpndklWWk1z?=
 =?utf-8?B?QkxIZTRRZDBjQjM3VkxFYk1CODJGYVJybHk4Q2NXUnFlVVVmeXVzYkkzN1hu?=
 =?utf-8?B?bFNxZU42RCtLNWlnRjB1emJPZm5ERGVvbkttdm5LVjBJQnk5OHdKeksrVzhB?=
 =?utf-8?B?S0s4Tzk2aEtNNzFyQW9UaXoyanNVMlRlZHEwZzFEb0ZpN1dPditnVlk2QUlJ?=
 =?utf-8?B?RWpiQ0dlVWpPTGlQWlVuSFhQV0hVV3JicDR6dEZVUmJOSVp5Ri9lYkpwWUlZ?=
 =?utf-8?B?am80eXg5WWZHYlJwb1orNUd6eHB4d3NTdjdmcThUWVB5blhGZTJLc3VLQTdE?=
 =?utf-8?B?QmxiMTFyeUE5Tml2bTF4Rm1ybTRMdWhkbmZ2WENBTis4OTNGQ1R0RFU0Qm83?=
 =?utf-8?B?THNHK3RVZUJUcmk0akxZWktJYXZvaCtkdkhJMU9pK215NjlhQWlFWDN2QXBk?=
 =?utf-8?B?VTJLOXhvMEZjRVROTWJvSEhoSjU4bGlvS2ptb0VjK2ZTREI3S1d0aEdRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eUpWQUdHdnB3ZHc2NFBPZ1cwa1dldjVxNnFXV3N1ZWFlVW1ueGdJdVh5czZ0?=
 =?utf-8?B?NWR5UERNZmRTOG55SWlmdnNFN1ozK1Z4eWdMNk9mcXJ0bzMyS3NLZjJSQ2Z2?=
 =?utf-8?B?NlpQaHArS2JZM3hmakRCMDNTY0tsaE5lR3UySmFKaThzRVRCVm1TQXEvOG1l?=
 =?utf-8?B?SlZUUU5ZWjN6NksvRmJ3dlFvcjIxakd4NWppVFlrU0Y1WW9LaW9weTkrRnlq?=
 =?utf-8?B?dUNOekNqekdHSmVQMllMUVZidnhnczhpOGZ4WHhMdDNjNmptR1RBQTFyNkRG?=
 =?utf-8?B?dnBlWDVhVGNsWitxcmIrSmpKK3ZBbFJTQ2Rzc05yZXJSVHJ1eW1TWUZHV2t5?=
 =?utf-8?B?R2NVRVlWMDFyeVN1Y25iVyt2eEZNdklja0ZxMnJiMkptaDd4Njhmdi9BeUZG?=
 =?utf-8?B?ZzVqcUMvS0FZZ3l3ZHVsbnJOVmxKQ1NpTlRQSDNQWERrYVg4VUJsdTZyN3Ny?=
 =?utf-8?B?akpaN05hK210S3FObXdCcDB2ZzhObS9GcVVwSGVvLzV0eGN0ZkY0NnYxcUFx?=
 =?utf-8?B?MXpYZ1FtWTFpT3BVeEhXZXA1Y0FUcGN4YngxNkZHbDMvOGpSN0hwTFcwU3lh?=
 =?utf-8?B?SnFhenFKeGFvaXc3K0xtL0NIZ2YzdWUwbG4zQnpETmtuakoxdjY5VjJNWk0w?=
 =?utf-8?B?RUkzb0RjREUxWTE4REpWcWliRVlrRElielFpSnhpOUVxZmNzUDNjL1pOV1U5?=
 =?utf-8?B?Z2gveDdlaDI4U0czQTJtV3JCWStBZEhyVzRXNE5lcnNLeVVGNmVoUTdXK0M1?=
 =?utf-8?B?ZUNVdTZtQW03Tzl4cHpTdmhvbXVHbDhYTXBZYlNnRnJkT1ZxVWYydXZpWXUr?=
 =?utf-8?B?b0p1N1hMMk90T1M4MlZJdFE3cU5XZVBaRlBuRVZjK0c3dys5K0kyL1VzMHMy?=
 =?utf-8?B?UEgrckNyWUpYenB1bUlhYjdzVjlBVGFJbDBBNjhxanJWM3k0VFdrRStKL29l?=
 =?utf-8?B?T1F3VUlLK3dvamMyYndsVFliMEpaaWJtWnFwU0xBTkhFZWM1ek5uNFNWYzF6?=
 =?utf-8?B?cHlTSjlHVlcvanlmK0E3K0hyVVB2T2FDRHJuZzJKV0NTb0xKcTJqZ2JmaE5C?=
 =?utf-8?B?TC9FZEdTWDRxYWZwTG1vdUd2R09iMmZhQmpvY3NSdUNHN2hIQTV3dEhwWVhn?=
 =?utf-8?B?YmlTN2pWWFFYQ2N2Y2F3dEtMZ0hyb2I3a3NsRFZndXZkaU52aUFSemVCbCs1?=
 =?utf-8?B?SWFLL2ZrSUN6R3FRSWtQRGJUd1VHMTAvZzlYbVZIbnpmSVc4WGl0T0t6MTBo?=
 =?utf-8?B?Zm5Vell5UDVFaEFORTJyeXltYUszYUpFdUc0K2syMkZ1cnlGeE13djNvOHp2?=
 =?utf-8?B?b1kxQmhTc1poQlpjV05tb0VrQ1UxdXZrQ2M3ODVmV1pmcGVTZUVWVDlGaGVi?=
 =?utf-8?B?OGJoeTZUTTkzalNiUVNXc2tpeFA0TkFQR2wycDJ0UXJzWno3bjE0MFJtVGIv?=
 =?utf-8?B?WlA5U3E2QlpnWTdtbkkrTmRqZjFaTTVsbDloUEFSdUYydTgrS2h0WHBaN2VU?=
 =?utf-8?B?em1rODZqdnAvdHJTNGNJbkk1eW14YWZZOHFzUGRwQmlGQkJHcGNYNVgyUHlH?=
 =?utf-8?B?K1lCbUt6VE9FN2JTcUdoNVRtUUlhVjV4NHpDSXRxbDZjOGNlTGx4Q0h2Vmh4?=
 =?utf-8?B?a1JGQnRuRVUrdUdBNHFBYXp2TzJ1TzIyWk9ZdXp3U01tL0kxQTJ6NXkzRkh3?=
 =?utf-8?B?WnhLNzlvYlg5NEMrdUN1UW9BNGpHM0JRbGxLR1M2Y0YrZjBMQlZoSlNHeWpF?=
 =?utf-8?B?KzBhQWhScEVrNEE1TVdJaHVlRU9hU1pLNkRXTG1XNE00akEvOStBRTN3ejJk?=
 =?utf-8?B?eDU0MXM0Q3JOS0xZTkJpeThCNTlZR3VqWjZzckFvcnJGQllmellraUFGL2xq?=
 =?utf-8?B?ejFYdzhGYmNsZ2FFZ1A1anAvbmF5ak54TnJoNmNTWlB6a2xnTW51ZFY0RVJI?=
 =?utf-8?B?RG81c3hTNlhqS0VMWEJZZmkxNDFQQnpXN2lwMUxCam9EMDY2b3dhREdhMGEr?=
 =?utf-8?B?WGc2empWdUYyNkgyVjZNSDQ4ZFBsMGRoOXVqdTZlZnJRMXFvRi9Ua1FiTlpt?=
 =?utf-8?B?TFhxdWFuTTBVSW8wMzdpUDJTcERBbVZ1OEgvR0h5OW14L0lGMm44MVlnWmx5?=
 =?utf-8?B?ellYSTk5Q25uMjJYMnphZGxDbnc3cVlBRjVzOXFYc2FwVWZ5eFl6RzZiK2h2?=
 =?utf-8?Q?y9ZJRu/jmOyQp6RBI9DxU7A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 695a2a79-535f-45f8-9c7a-08dc75d6be61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 18:33:55.8344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsOYUcRDmznoXv96owaxAEnqo5gajeSZbbM8pSi3mqxc2iCeeA4QDBwzhM/qQr4rTXoWuSI7ngD6WQ5ejLOWi3Z5dLXuAvVauBPWlGwuvjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4562
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

On Wed, May 15, 2024 at 02:42:56PM -0700, Lucas De Marchi wrote:
>gt->info.engine_mask used to indicate the available engines, but that
>is not always true anymore: some engines are reserved to kernel and some
>may be exposed as a single engine (e.g. with ccs_mode).
>
>Runtime changes only happen when no clients exist, so it's safe to cache
>the list of engines in the gt and update that when it's needed. This
>will help implementing per client engine utilization so this (mostly
>constant) information doesn't need to be re-calculated on every query.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Just a few questions below, otherwise this looks good as is:

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> drivers/gpu/drm/xe/xe_gt.c          | 23 +++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_gt.h          | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_gt_ccs_mode.c |  1 +
> drivers/gpu/drm/xe/xe_gt_types.h    | 21 ++++++++++++++++++++-
> 4 files changed, 57 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index e69a03ddd255..5194a3d38e76 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -560,9 +560,32 @@ int xe_gt_init(struct xe_gt *gt)
> 	if (err)
> 		return err;
>
>+	xe_gt_record_user_engines(gt);
>+
> 	return drmm_add_action_or_reset(&gt_to_xe(gt)->drm, gt_fini, gt);
> }
>
>+void xe_gt_record_user_engines(struct xe_gt *gt)
>+{
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+
>+	gt->user_engines.mask = 0;
>+	memset(gt->user_engines.instances_per_class, 0,
>+	       sizeof(gt->user_engines.instances_per_class));
>+
>+	for_each_hw_engine(hwe, gt, id) {
>+		if (xe_hw_engine_is_reserved(hwe))
>+			continue;
>+
>+		gt->user_engines.mask |= BIT_ULL(id);
>+		gt->user_engines.instances_per_class[hwe->class]++;
>+	}
>+
>+	xe_gt_assert(gt, (gt->user_engines.mask | gt->info.engine_mask)
>+		     == gt->info.engine_mask);

I am not seeing a place where user_engines.mask is not a subset of 
info.engine_mask in the driver, so the above check will always be true.

Did you mean to do and & instead of | above? That might make sense since 
then you are making sure that the user_engines are a subset of 
engine_mask.

>+}
>+
> static int do_gt_reset(struct xe_gt *gt)
> {
> 	int err;
>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>index 8474c50b1b30..ad3fd31e0a41 100644
>--- a/drivers/gpu/drm/xe/xe_gt.h
>+++ b/drivers/gpu/drm/xe/xe_gt.h
>@@ -38,6 +38,19 @@ int xe_gt_init_hwconfig(struct xe_gt *gt);
> int xe_gt_init_early(struct xe_gt *gt);
> int xe_gt_init(struct xe_gt *gt);
> int xe_gt_record_default_lrcs(struct xe_gt *gt);
>+
>+/**
>+ * @xe_gt_record_user_engines - save data related to engines available to
>+ * usersapce
>+ * @gt: GT structure
>+ *
>+ * Walk the available HW engines from gt->info.engine_mask and calculate data
>+ * related to those engines that may be used by userspace. To be used whenever
>+ * available engines change in runtime (e.g. with ccs_mode) or during

After the driver loads, do we expect ccs_mode to change dynamically 
based on some criteria OR is it a one time configuration at driver load?

If former, can you provide an example where ccs_mode would change 
dynamically, just curious.

Regards,
Umesh

>+ * initialization
>+ */
>+void xe_gt_record_user_engines(struct xe_gt *gt);
>+
> void xe_gt_suspend_prepare(struct xe_gt *gt);
> int xe_gt_suspend(struct xe_gt *gt);
> int xe_gt_resume(struct xe_gt *gt);
>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>index a34c9a24dafc..c36218f4f6c8 100644
>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>@@ -134,6 +134,7 @@ ccs_mode_store(struct device *kdev, struct device_attribute *attr,
> 	if (gt->ccs_mode != num_engines) {
> 		xe_gt_info(gt, "Setting compute mode to %d\n", num_engines);
> 		gt->ccs_mode = num_engines;
>+		xe_gt_record_user_engines(gt);
> 		xe_gt_reset_async(gt);
> 	}
>
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 5a114fc9dde7..aaf2951749a6 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -112,7 +112,11 @@ struct xe_gt {
> 		enum xe_gt_type type;
> 		/** @info.reference_clock: clock frequency */
> 		u32 reference_clock;
>-		/** @info.engine_mask: mask of engines present on GT */
>+		/**
>+		 * @info.engine_mask: mask of engines present on GT. Some of
>+		 * them may be reserved in runtime and not available for user.
>+		 * See @user_engines.mask
>+		 */
> 		u64 engine_mask;
> 		/** @info.gmdid: raw GMD_ID value from hardware */
> 		u32 gmdid;
>@@ -365,6 +369,21 @@ struct xe_gt {
> 		/** @wa_active.oob: bitmap with active OOB workaroudns */
> 		unsigned long *oob;
> 	} wa_active;
>+
>+	/** @user_engines: engines present in GT and available to userspace */
>+	struct {
>+		/**
>+		 * @mask: like @info->engine_mask, but take in consideration
>+		 * only engines available to userspace
>+		 */
>+		u64 mask;
>+
>+		/**
>+		 * @instances_per_class: aggregate per class the number of
>+		 * engines available to userspace
>+		 */
>+		u8 instances_per_class[XE_ENGINE_CLASS_MAX];
>+	} user_engines;
> };
>
> #endif
>-- 
>2.43.0
>
