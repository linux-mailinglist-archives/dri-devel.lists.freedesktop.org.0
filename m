Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EE298CE50
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 517E610E6B9;
	Wed,  2 Oct 2024 08:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwyBqymQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9810E6B9;
 Wed,  2 Oct 2024 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727856167; x=1759392167;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=88ifUmjb8CL+PXJVnKhpYvSuNsbU7/xtHrhWmXUMrlI=;
 b=gwyBqymQukfnMxnwSv5iAp34+MrVazsBoxqOMzpXI6bcv6LsjIt2/P5a
 R25/CjjWrwQ6flr5viubdCTqI560FqXTZ3H06bmFAoqJevLZPQ3OIkkGp
 YkReWRXEH9qefQAmYVgZVj9K4PJ4aonUbQThOYs4vUAMkWUVYgIeJZGif
 tOJqX4UkJupjTW8Ih18jQ/Uu8dsbi2JuKCXWHY6hM3WOFHPsfrmWEVIVn
 yHM15lmZocEvGsnjo9GBHSXHsS6pljBpY1WUOods/vYPiz4jnbb4FDktN
 h48PPqB/XXy0aM/ilb7Tn9vqXxtR9WqZ7NH59VxjN3CaufS+0P/uCDn5G g==;
X-CSE-ConnectionGUID: XD007zuEQU+OFU9qFQ1mgA==
X-CSE-MsgGUID: xXtf0SmhSWevR5GxwtJwwA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27188103"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27188103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 01:02:46 -0700
X-CSE-ConnectionGUID: RixmGgSlTPab7a0j/0ReKA==
X-CSE-MsgGUID: aRL6wnilTpeVsB0tuI+RiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74358725"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Oct 2024 01:02:46 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 01:02:45 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 2 Oct 2024 01:02:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 2 Oct 2024 01:02:45 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Oct 2024 01:02:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNkrB7LDGwk0Vb0R2D4qQG0cukpRbAt6WSJ6WpS9tP1+NhL8+TD2j6QmbKKVT4Hwhhu8FneFJImaIQ2fj4Q34Rs/PMv3YCk5eYg69i6VAPPd/YtILX1wO9vq6JDC/kzufCDUPxadEwrb/pC0OlO0EaufFOfo/wiEmcFF4h0mm2DYfMEOZMz8uvAgJcFjOi41XUSmdkWLrDv4wTg4+IMQ0IJc41wuyXJ5ueDXTDyF02/WMPIg6nqo8b4+2vzeg5WtyrePMkw1zsRypSL/yg30fIoCSw92/PdDWK4AzPVtJvfJZQheawoQ/XCrrL9332PyLDYvXckYycPh+NZizvfbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/oSDkxrRkJnxOYO10lmQHdiJhSIdxBmCJN3PVgF+fJI=;
 b=JT+qIcJzBPq6OGlgC8+rmUpBemfqK54pXpKt2MppBuEeczKYPbDfLb7JMcyXqvdT2XbrPzWZSeWYd8cW+hWcvDL2YN+Zwp8d/sMiEEbzh4yOQEdbVg2+VvvHpDrSM7VbDmtmUtU3XWmd+iZf5VobUu0wqxXg36Eg+GAwdeGqFDfwdv1weXBCBkcBFVuUiSP38aCoOtVhe0R1EHx7gSRGc4c0PdNtwQScWHUyf6dNxlkXg4B6c0RfB1swHAvE+iPLlt7Y068VCS8iGaP31HcWYMG21/OFpmjMwDwpEWgbczAfxHwluxwxhAbQwrs6pgKp6swPM4qVibqYKjX/JlpZJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA0PR11MB4654.namprd11.prod.outlook.com (2603:10b6:806:98::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.15; Wed, 2 Oct
 2024 08:02:43 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%4]) with mapi id 15.20.8026.016; Wed, 2 Oct 2024
 08:02:41 +0000
Message-ID: <37201309-7143-4c28-93d5-f74ff9022190@intel.com>
Date: Wed, 2 Oct 2024 13:32:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] drm/i915/display: Fix spelling mistake
 "Uncomressed" -> "Uncompressed"
To: Colin Ian King <colin.i.king@gmail.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <kernel-janitors@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20241002074903.833232-1-colin.i.king@gmail.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241002074903.833232-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0018.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::18) To CH0PR11MB5332.namprd11.prod.outlook.com
 (2603:10b6:610:bf::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA0PR11MB4654:EE_
X-MS-Office365-Filtering-Correlation-Id: cdbdfd0d-3abb-444b-088c-08dce2b89516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UUd1WnVsQmJWMjd0RFo0Z0VROUJQTmxEeVNUdTdsdWkwM1lkZFFLS1lpUktm?=
 =?utf-8?B?VHp2bjF6d0hwZnlTWnM4K3Y1YWlncUgwbUZRYlptUnNMN0dtcWdpMGJZVUF5?=
 =?utf-8?B?R3JTd0xFRVd5cnFydXpNTTJUKzBZb2RRNmdSTzQ5NEoxM2MyN2R0S2VoRnhs?=
 =?utf-8?B?aERyalpJVUlaVDVRWE43ZXlmUkFwbnVDR3JXa2VUYjJhYldJakVNMWdpT0F3?=
 =?utf-8?B?T2l0R1llOTdpQVEzNFBFRk1zRC85blFEaTFwSTcwV0ZlODdoZ0dzRVpZakNv?=
 =?utf-8?B?dmhwV2pSYzFBeUxHL1E1Z2JOeXJGbzFvVlRrTm1YMUdWUjhLRU91T3RkWFBP?=
 =?utf-8?B?am5DV2FEZkthMzJ3cVNyaXJodEZVaU0wSlVoYmJiSXc4TWRDK2R6TTArVnhV?=
 =?utf-8?B?OU82dXV1TUwxQndVMDVvV0tTMFNMTFh4emJOK3lnczJxMWtic3pHaVNWQkk5?=
 =?utf-8?B?N2ZXYkQvRXZaR3o5VHB6cDVnYVlWV0JMbU5HOU8xSUlKT1NaOE5SY1J4ekhZ?=
 =?utf-8?B?YitnbjFCejFEVm5NdW10Wi9YZzBrZWV6bUJjQmg4b1dLL3F4VnUvbGRLWkZR?=
 =?utf-8?B?ZkVzeURpWFlWVVB0SVFjU08rZDFVOTFvb0wvMzVEa1doNVdlWGRnbW15N2Ix?=
 =?utf-8?B?eXFBcmlSSEMyKzdva29BVXhGV3RTaXdCRjBnU0QzNWswNnYreWZQV1JIQng1?=
 =?utf-8?B?TUdHaEhOZkk3UDNGRUNTcjNaMTJVc2l0SFdxaEFtczBwWGFXVGRIVlcyS0tz?=
 =?utf-8?B?S0d1c2pnVlZjV1hBY0l1RGF2L3g3UFNVVmdDRkFDaFRuVVdwaFJ0c2VLd05Y?=
 =?utf-8?B?MHJ5THJUNHFlVDNRWTJYVFA0Z1Z4aU5tbHVubURNZkduZW9FcWRZcW9xTDUx?=
 =?utf-8?B?VzVxNGd4ZzVzM0plSTNnaFZKVGtjWWhBMWhZSVFwQTFsaXdWUndETW5Za3ph?=
 =?utf-8?B?ZVVXZ3dWRHI0WGJhdUNTNlY4dmdwWnh4azd0SWwvR3Y0WGxScXByV0JjaHJC?=
 =?utf-8?B?d2FsRFp1dUpkT1pQcGpZNlN2Qm9ZZ25CTzNzMzVNTFBrZkxHOTJpYmZpSHZa?=
 =?utf-8?B?Qi91YUR4cnhLREpKNXoraXRzV2pGaUM3dFRyQlZOUmZWS1RDdERkWVpESFZw?=
 =?utf-8?B?eW1MbW1vbDI2OTBYQnIwUEdDWUNHRlZoMGxzYitTb2F4eFIxalByY3didm12?=
 =?utf-8?B?NHRseFp6R0k1bDBJdnVQR0hOYzNwNWJ0aTgrZEt6WjNmT1RzanpuT3dtWlI3?=
 =?utf-8?B?d3JkakJxY3EzNlR5MW1KVjBrU1JLSW0vQWpJTEhFb3hkRDdaSDRDUXJITGhE?=
 =?utf-8?B?RWhSREdXMnRyTnJEeWtOcTRxRlRQRElxL1pYSWQ4d0E5WktZY1M0RWFVTU9R?=
 =?utf-8?B?d2QyQ0NZRTl0Vy9ZL2FGVlBhdW9WRXBmMlNyaW1pblJndXROVWFBYzZTUit3?=
 =?utf-8?B?YlIyN25pd1QzeXB4TzM3RXBsVU9nTFNwbDJVZ0loRTd0UGtjYmVPYWlHdDRa?=
 =?utf-8?B?a2c5YjFtQjhzSEl2TmI5TzNlanYveFNycTR5bDUxNHpXM1VTQkxuRmhtdVR1?=
 =?utf-8?B?cmFHdVV2aVpFQzdOdHFFUE5IcnRlNjV4UmhDUW9kNEV0ZEEvS285VnA4REhN?=
 =?utf-8?B?WXgvYkJxWE1xODlDYVoycm9EMm1IdzlIeHNqKzNrNm5YRzg3Ynlxc1RiTGhN?=
 =?utf-8?B?ZnRtM01sWmJWcmVjWEJjVm1CZFhSd1N2OVhrWVhDQXN4UDlqYmIyVnRqN1Bt?=
 =?utf-8?Q?1uDj6GdEm0lNga1sD5NkQQmLo8IRkrj1wcYQmae?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjBBZzMxeGIzTER6YVRPdlZaM1NGSFRSVWdxLzljNG5ub0VCb2dQUVA3Z3Mr?=
 =?utf-8?B?enRiU0ZCVWRVZmJVV1h1MEN5YUFuYkh6MHRBdlVFdVhKaWxGcHVOQ2hVTFYz?=
 =?utf-8?B?T05XSm1zYzVLREMwRGxKTStsbkRyS2pxbmJNeDdudGpxQ2ZTVU1GSnJoQzVX?=
 =?utf-8?B?ckxOdUU2WVdxMGw2ZzVQcHJlS2tJTVZBcXpLbnlhRFRhWFRNRWMxV0E5RnFm?=
 =?utf-8?B?NjVQbENhMGtoa0lsVHpzN2dqNmRZb0lnVjAyZGV3b0hxYk1VamloeCtLeU5i?=
 =?utf-8?B?L2VmRzBOSFNlOGloVmxlTkFtd2lwQWpUSTltVmEvZDZRL1F0TFhWRW8yRk5u?=
 =?utf-8?B?eEF3L0ZLU0tGWEFLZ2FKTDc3aWtiY3JVdmNqNDFYNUVXM2dIKzlrdHJ3YXhR?=
 =?utf-8?B?ZHR2QmZGcEpiNXBSWEpVQTFMdmRKdWt3S09nZU42dHVDVGJkeFVFdTRRVW1v?=
 =?utf-8?B?QlkrTXhFNHhVSWlkQStiWllvblREYithVlBrRDhiLzJmR2ZNVXorYTB4aWNw?=
 =?utf-8?B?V05sL3VZL09xR1FYYXQ4anZhRG1LTk83cUJYa1dGY2Qyd0VaRlAxR0pPendl?=
 =?utf-8?B?WitQRmFjMXZpZ1NzTE9YVGVtVHpFZHVnWVZ2cEdoaTFtMUNiOWc3MTR3VVNG?=
 =?utf-8?B?Rnh6Q1RwRi9lMndMV29UdXRkeWdrLzd0ZGJySzhXdzROY3JjLzVDbGZIT0lM?=
 =?utf-8?B?QUdKOVFuZ2NZVWZldHQ1SjhUeGtONVpqVEJFUHUvK1VTTkFNbnlFcDVDcGR5?=
 =?utf-8?B?cXZxYTBkbklESWpQTFdta3VzV1FISW5mN2pnUmNkLzVDQnhpYzc2Z0M5VStr?=
 =?utf-8?B?bVJGaWxnNmsyWE05Z1hOdmJJaVFFNWVMZTA3dDZkZmNTSi9tK2d0Zi9BcjNJ?=
 =?utf-8?B?N0dJVmFUbHRpSkhvVW9Sekt0cFBYY3g3QzdKQ042NktycVpETmlLQkxvdTlR?=
 =?utf-8?B?dHdlMEJsL2NwcFBwNXZsMWNUTDE2Sjd0dklJWVNOOXdycTN3NFJTeWkvcTdC?=
 =?utf-8?B?QVFrY3hJampydUp2RGhROTFYT0RoK0hrdWRFZ21CN1RjWlZJN2pEL3pMYTVS?=
 =?utf-8?B?RTZjbDdQS2dlYnZDbXprOUxKandLd3R1c3FaNDZJV0ZzWlluTUZ1REExTHVE?=
 =?utf-8?B?MXJ3Wnp1MFY1ZXhsRkRDVWxVQ2NGanI5RUVzbnJqZG0vUDdQY1pDcmMvWk52?=
 =?utf-8?B?MmcxbjdMbUJ0RjMvdnAwYWJDTGpDT29qTVJZSEpHODNpNFhScnR5RVJOM2dk?=
 =?utf-8?B?ZHFkd3RtU0Fpd2wwVlRMZy90MytCd3JhRnZiY3Zvc2FMOWFaM0lwQ0doNjNo?=
 =?utf-8?B?YmFlb1VhQkE5UDR0QmRha3ZOWHlkd0NoWjgyR016NXQ4RjBiTDBVeUlHY1pv?=
 =?utf-8?B?TWRYdGJTUitvSHBqOVZZZGJTdFpVNzNselFlR21xeG00WHBITFUwOHVlVkY4?=
 =?utf-8?B?NUVOY0taeGNYUFpRTVVYaFZXb3FtU012ZVFkMGt6eGhjcjVQcFR1a0VkSnVF?=
 =?utf-8?B?U1dicmNlR0drWnVlazgzQVlXN1NVcHZzSWllUmRMakwzeU9EaW5Bb2cwMjI5?=
 =?utf-8?B?Yk41NGxiclJXZ3pjcTdQUWVPUEtKb2tGNUNlb1kxQjhSZTAzMEsyWkJEV0FK?=
 =?utf-8?B?WE5WbnVkTGZVODZ6Z3NoWVllUWp2VW5GL3ptYnA2cnZhdWZuQ2crUWpVZThL?=
 =?utf-8?B?U0ZUTHBrK1lQQktkZ0tkQ0QyZ1M0ZXV0TUpRVFpXclhHeTVMaXRYeWY4UWtZ?=
 =?utf-8?B?VGxGT2U2RUkyeS85L0J1U3ZtZkh0OWlleEV6V3dwZ0lhTlBla1JHTllLOHl6?=
 =?utf-8?B?RUhORUxRVkdSTUdBVnQ0cURRYzlRNGNlMnpVcXJKNHJtT0RVK3FWTTBLaWZR?=
 =?utf-8?B?NlRYTmVGbThZZkJzSGtQRHRET21ZdUlMUFRIaGErUHljNStPQm9yemdSSmIx?=
 =?utf-8?B?U3IwNGx0NWJnbVdJU2ZwTmV1VWs2RFVWR2ttNGZEUTBrTU1PcERLb3pEVFkw?=
 =?utf-8?B?VjcwVnYzZmlJRGpObmlaNFVESWl1Y3dGdlIwdmh6WWo0bTFFcG5raVYrcHIw?=
 =?utf-8?B?MWFMTit6dzRZc0RuVWpGQmhLK3l3dzJ1Z0Nnem9xc3NsL1kzTG8zdGxEWmJW?=
 =?utf-8?B?a29MTjV4em5rcmd0TG9OQWRrdGhtSG1wTzMzaGJMa1ZqRGs0dGxKRE1Oem1t?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdbdfd0d-3abb-444b-088c-08dce2b89516
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5332.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2024 08:02:41.0088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: prouoWKWE+tmrkG48VwPH9OoSc5pIL5pGqcnvmBSKzLc5RZEVlq6NqJKePZDn7+U3WHgyssHpdsUGK/nBJzAM+w5G5mY+8KjBWZjyLG5e3Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4654
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


On 10/2/2024 1:19 PM, Colin Ian King wrote:
> There is a spelling mistake in a drm_WARN message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 74311bb9d290..a5057ee4cbe5 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -3811,7 +3811,7 @@ static void enabled_joiner_pipes(struct drm_i915_private *dev_priv,
>   		 secondary_ultrajoiner_pipes);
>   
>   	drm_WARN(display->drm, (uncompressed_joiner_pipes & bigjoiner_pipes) != 0,
> -		 "Uncomressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
> +		 "Uncompressed joiner pipes(%#x) and bigjoiner pipes(%#x) can't intersect\n",
>   		 uncompressed_joiner_pipes, bigjoiner_pipes);
>   
>   	drm_WARN(display->drm, secondary_bigjoiner_pipes !=
