Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E70B8C9170
	for <lists+dri-devel@lfdr.de>; Sat, 18 May 2024 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7E610E121;
	Sat, 18 May 2024 14:37:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MiV7J7Gv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC810E121;
 Sat, 18 May 2024 14:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716043048; x=1747579048;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Q8rK5CZXiFtvPo/mRUXZ+zRfdV6sE1spJUIQlVhF50s=;
 b=MiV7J7Gvc1hn2U3DcGAkWeHlAJ3OTvrd8tFF/efrt2qp/g9paIdaoZGD
 CicCgHsVTUWmwpGr7rGduxJnAPzjLIBjtSecSfFr1OtMvbse+9tNGz03P
 P0G848xdGwHlaiNnGFWME8KITcFL2h579xDyulBamWo1mrNrRaWjcu+h0
 hL+77jEiDZUZ+R+HxwNz5Q53TbtW4n8mHA4D6bqV+RpVRzGy22Bo0K5Bx
 FSB8j1xHMZh19RFEUlGcxMAbddELNdnEUY9UN+k/6mwLMfHh0rxNsuOX+
 qYdaaidOalNtGfzy5N/qWq3UGoFQg0jz6NgRXiNkJkM50vbNqfSMKA3Fd A==;
X-CSE-ConnectionGUID: l6ZvWCUqSdaQASnYwr9OHw==
X-CSE-MsgGUID: Nz6vZD9ZS4K7JNsRJUy7sQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11076"; a="12343412"
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; d="scan'208";a="12343412"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2024 07:37:27 -0700
X-CSE-ConnectionGUID: 87WB6G5ZT5e9KJnwcWcp1g==
X-CSE-MsgGUID: g9XDv/wXTvuah7wOhvTZSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,171,1712646000"; d="scan'208";a="36591334"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 May 2024 07:37:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 18 May 2024 07:37:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 18 May 2024 07:37:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 18 May 2024 07:37:26 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 18 May 2024 07:37:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WoNDivvfPPOTseAJlmOm1Eqmnv6HquxTC6YioaoPGNbto8joG5E/qgGD3dooxAj1nKBuNduwCJqDDWXDpIW5cw3P/Xj9lHnrj6jKrCThS7xp3YNyw8jPFyq23cggc/Rz4B5MnqA5DcNNT2OF0l8G/I/sAMUI3pw952MkIFhwpN9JPW5ygIR/CBZoUwxxxnaCn0TrTkSvWYOMwBqtX5ahbgGJ5WpiNxkijIF05UqVp3JDkYyTJ9awnjwKuL3yufOIR/sbI6eFEPVsFV7UqExFPDxWBfE0fW9o1K3RtlKsg08hsKKm7GsTQX9jd6DFMb+Xla5gJI6AjxZJKy7f9lo/DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JC4yPetC+esl/ejPx921qZWODlAufSOnSnCYR+FuZ7I=;
 b=LHOiiXy+ulE4b4tai09dpUlB0SjZqIOzy2bCs/yWAXRM835L7bTKCAuS72AdstHahb7nlCOFAig8kQZNIuRn5yvRo6x0SWtBgGuIB0qA2cOqZfqNf1tqiW2A8UspJIf+AxDWa0r96hXPyedlK11/2Hy361XnG8dcg4zBCIX+tyv5UfvKQJm2TpZbQHB8C9mCw9QxHK2NzrZ0CGiQ3fU3/64n4OlVdhRgnijhLYECIi6cSfIp6ZITqUvfjWqg32AIOBkaSv7d7NxCxLEjxvPVOAr09oYI5MWRuNgU3N5oIaVTuDh4gLeb5oPPraWnNeK0w1Oq4KQLXJeIcztaIre21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS0PR11MB8206.namprd11.prod.outlook.com (2603:10b6:8:166::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34; Sat, 18 May
 2024 14:37:24 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7587.028; Sat, 18 May 2024
 14:37:24 +0000
Date: Sat, 18 May 2024 09:37:20 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <dri-devel@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v5 5/8] drm/xe: Add helper to accumulate exec queue runtime
Message-ID: <fuzcf5ntgkfnsgxovqj67sknsowk74gikec6wtdq45dj3zbnab@m7suetcohnfa>
References: <20240517204310.88854-1-lucas.demarchi@intel.com>
 <20240517204310.88854-6-lucas.demarchi@intel.com>
 <20240517224022.GC2343622@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240517224022.GC2343622@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS0PR11MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ace2cc8-3b28-48a4-8aee-08dc77480836
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KR4OQ/6m7NeoW1gMyHgLBMyTRqA3fQtVNcfkuJb4CVSjCw0L0qwimBJ8FLtQ?=
 =?us-ascii?Q?B5IcK5xXImtv+dosi0xaV8+TL+prMLwFSr1dTMkxqT4EfJOeCXWCOi0W+eau?=
 =?us-ascii?Q?67C4TDH378PipFEpWJkpiWUHsegSot3orZ6kRWHz34D/y/ZNSYX4nuVgLo/B?=
 =?us-ascii?Q?QDFlTLPm4tqY9RztkuNhCv4a02bszIpx9kXzqRlgUAjfgbrqsgv+ls9uQ32M?=
 =?us-ascii?Q?5pKkjoo6Oyhlu+PSrgRsFB9GB32GMqnn4EYseYP5dWpEBoKtrH5+/71qQ5Mm?=
 =?us-ascii?Q?knlgH3W7DZtly4H/m0Zh3FjAXjcKkf0Yt9clfSKKv136Emvxvvs9JeBVHfMd?=
 =?us-ascii?Q?PpTJ3Ch0w6w/IJA9pduECcU5iQ+O6daG4aFC+rkKahxOQKzUh22Ljsln38DU?=
 =?us-ascii?Q?RS4m4wfTrRCLemjeyxOCrolotBCeldKOmHMTnCN1enRsI/spOgcwKWArfnag?=
 =?us-ascii?Q?0pJCyeAe1ClONy8DU0mDatK6zJX+MEFdF+pFgj8a5nhATJBN18rLWsJeFsrd?=
 =?us-ascii?Q?F9x/43FpT9bd79rXFw3p8uOMzrmGddFHpPZ9XKjUUmrm74BBuh77Kogq+T7b?=
 =?us-ascii?Q?kN1xjicC/x1gvM8wuguTbiCVQ3jqMp8iwflC1uRHRjysI9HfmKP/6rt8mSge?=
 =?us-ascii?Q?tZNjes4JSPaGp5kJ31XhcnRRLzGwB7evdeNPfuGRrdm/uNhpxkfLqgA/NLPm?=
 =?us-ascii?Q?TskpAPShAF+YdQjh0h3LQgU/IhfVNZ5+0/NGnljqQhTvAhUwaTR7WIPtw5dH?=
 =?us-ascii?Q?krm78FR+GBfKvccn+elNeDy9sXVY3a8byd4Z3EGcbbv/HTHvGJZlo0P+BzHg?=
 =?us-ascii?Q?+x8n0JNnxPgukCYahUxZuCxOTASlR0hw7jXfTaugOVutJiMwub5Iy1Dz5ocs?=
 =?us-ascii?Q?s1JJ0LoTI/4EX9N0RFhSDyK7k2TkkpPerRYBEbPhGPHsFok6bW87EMAOHnzM?=
 =?us-ascii?Q?22+qznx+mSDHbMUkaZSbAa3iGsHgpP6WnygOjYeWhT6sLrL/K53LVPSu3Tw9?=
 =?us-ascii?Q?MQTbWlxJXHNL0Cy59VmnXjkVjNqyrQXcMYexkWrWhPAi010Y/afLVsTWMH8y?=
 =?us-ascii?Q?AOKiQSEiDhgy0vVlLjoY+bi2O/lgscUMi1I401389gQF9tBoFfVRCxy+fQUe?=
 =?us-ascii?Q?o+O4QozaAdNFCVoQDRH0gcHmf5qchDOuGN0GcX+yrulaMLdxbA8GhBMEIe5H?=
 =?us-ascii?Q?mAl3UT9mjCXOZ0JCubrJkEBrEp6zNTOaZA9Q65n5f3ZKanlXDm9USUv6h5Et?=
 =?us-ascii?Q?FbfvhOUiSw3w81BzWwvshJBryrM1aQripEbYCvu//Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bcMCo04dhA9wk3qRu9onPa+1Tg3rTwTDAoxrqD5aKnTVabrN+KLOmEUAVxBC?=
 =?us-ascii?Q?hJzDaETjmM15vDOMpZb1e8GcBdGQA/7Nd/KADDECQvcR5ueyp6pKD3Qyx4oR?=
 =?us-ascii?Q?Wc3sIv3UXhsQMNtAoiByCReWY4OYHahz/pT0b0RPWRZmvjmstUkDv8npdFzT?=
 =?us-ascii?Q?hU0bO2pTF4zq/kb7aHPQbQmYCA/th+UQJjQseRfkeKF6c/KIUV9+wwhUhh+4?=
 =?us-ascii?Q?6iAXaOmJJDs/sVbIYq2dsKpMI7TgwMhuiSYn6CDULlC6Kvg/5Z/a3WY7lonH?=
 =?us-ascii?Q?MrwJD7vP4e7iYMt9SgiVZfiJ1z56bBkFqRQAobQ0iF7igJhGHslCzK/5lzFv?=
 =?us-ascii?Q?Bh0VT8eVxF9p5UiuBr2IpjJ08rcG0AvKffLQl+25LKgnvRRjPj1zgD1uZ5FF?=
 =?us-ascii?Q?6DMkmsoPy8part95kS/buk2u2E8V2RsLUeQJ9/Ck+va0oi65+EqgaNxR0vTS?=
 =?us-ascii?Q?Z1zhF2zPAuQnhbllM8mvWTqLIbDsqEfyFB2115MkUKWMCS35VMhkD2lzVT0q?=
 =?us-ascii?Q?Mj0SmYwIcy3a30kEWBGD/Lilm0sOdHFPHzvJ3e+WsLV1Vucth91zBVQVuHV4?=
 =?us-ascii?Q?TgVGz/F9Mye2ZyGzaKvk92rk9S/6QIJ50IQuvN1WwgJVEl4B5/p0jsYRzKrj?=
 =?us-ascii?Q?WUPLkPHOotH7mB5LjWMzJnxXc0Zlj+MlmwKeGCn6aTX1LpKwJzA+eR5BpD87?=
 =?us-ascii?Q?nn/vdMZ3ST/UM5d7zSuuIHMWgjgZNRo2WodFM3mG4zpAwxVKu6AFkIeOIsh4?=
 =?us-ascii?Q?N5Td1bgHec8LyX0sEmdyhm4wIAWVeKG+pafXzDhh20n3Z4UhZRx9+dqxvgE4?=
 =?us-ascii?Q?qPv/6gNZY5glLI6VYgw0bHGf71sPS2txS4zMJ109oEz8uZJcFvWbQQsSBC2A?=
 =?us-ascii?Q?WUb0UFGgtRsQLiJEIz6b3rAw6keqYYEJnfIOy0P7EN40Pc19TjPTJX0wkNrI?=
 =?us-ascii?Q?l0CIQhMB2HhjyrnPvBZIHlGeg4KzEVY6wpEUixfPp9PpLiVD+5fn27mOZSKb?=
 =?us-ascii?Q?9dmXQBCMoEwbW1bpBS3ZjCRcNfwwxZusUM5B2JNR5Okp/WsLx4Pjxu9Ndnya?=
 =?us-ascii?Q?DrncJhMRGDu0nEWcvGIrVMWpHw0lhjOJacud5g9YL6Mxljp4eHc2Z5r31CUq?=
 =?us-ascii?Q?REIGFjIYlRq+nMYXmmGm00TNG0r2t+2AgsWwm2yiOOMrxyqQXh/+gq58SvDi?=
 =?us-ascii?Q?/vBhCM6Ts6eYPmPRbsulr5/nBrc8lJJhj1Y0kiveQmQjsjHkY49PMuW+KMqu?=
 =?us-ascii?Q?wiwiAoasvg/wMEwgjp2gfIaUrxVml9OJEfZ1vV1bcOiq3/okEMwHrSn12z3O?=
 =?us-ascii?Q?xYC+Y7Z6avzT24Xnp4eW4qvUSSh5F5PF6U67SLTqGeyOgt5QOh7nCE0DPp0/?=
 =?us-ascii?Q?ZuDtvp1pRQlQ2fOBnXD/re+FLU7xQsRvJNpjsq78eEROFsmtJ5/nIDRq0pJr?=
 =?us-ascii?Q?4KlwPKWGfFMVh4Lad49ROLnoXivyGgeoWfl0B+Vzzu/xkP+o7XWUh4tfP7N4?=
 =?us-ascii?Q?6mWLAHOnYL1YAsR05RYRLdrIwf2ZXOSGxIL9B852so+yO+5qCg/6hMdL/9hk?=
 =?us-ascii?Q?sgD5kwuoGLTtoDlr8AGdIZXtmSBp3gb21o32P8iyABqAV8S8LDgi4emy6+ZD?=
 =?us-ascii?Q?nw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ace2cc8-3b28-48a4-8aee-08dc77480836
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2024 14:37:24.0695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nWKdMdrCVVwfK0XXQ/luqBKq7s2YivzD8d33qbC0pbTCt3u9vg2AOAbGTaBxBC0ZVlZztCp1hY8TwPM+2z+4quMD2Cb8qt+uRYAn44SdMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8206
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

On Fri, May 17, 2024 at 03:40:22PM GMT, Matt Roper wrote:
>On Fri, May 17, 2024 at 01:43:07PM -0700, Lucas De Marchi wrote:
>> From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>
>> Add a helper to accumulate per-client runtime of all its
>> exec queues. This is called every time a sched job is finished.
>>
>> v2:
>>   - Use guc_exec_queue_free_job() and execlist_job_free() to accumulate
>>     runtime when job is finished since xe_sched_job_completed() is not a
>>     notification that job finished.
>>   - Stop trying to update runtime from xe_exec_queue_fini() - that is
>>     redundant and may happen after xef is closed, leading to a
>>     use-after-free
>>   - Do not special case the first timestamp read: the default LRC sets
>>     CTX_TIMESTAMP to zero, so even the first sample should be a valid
>>     one.
>>   - Handle the parallel submission case by multiplying the runtime by
>>     width.
>> v3: Update comments
>>
>> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>  drivers/gpu/drm/xe/xe_exec_queue.c   | 37 ++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h   |  1 +
>>  drivers/gpu/drm/xe/xe_execlist.c     |  1 +
>>  drivers/gpu/drm/xe/xe_guc_submit.c   |  2 ++
>>  5 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5c5e36de452a..bc97990fd032 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -555,6 +555,9 @@ struct xe_file {
>>  		struct mutex lock;
>>  	} exec_queue;
>>
>> +	/** @runtime: hw engine class runtime in ticks for this drm client */
>> +	u64 runtime[XE_ENGINE_CLASS_MAX];
>> +
>>  	/** @client: drm client */
>>  	struct xe_drm_client *client;
>>  };
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 395de93579fa..fa6dc996eca8 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -769,6 +769,43 @@ bool xe_exec_queue_is_idle(struct xe_exec_queue *q)
>>  		q->lrc[0].fence_ctx.next_seqno - 1;
>>  }
>>
>> +/**
>> + * xe_exec_queue_update_runtime() - Update runtime for this exec queue from hw
>> + * @q: The exec queue
>> + *
>> + * Update the timestamp saved by HW for this exec queue and save runtime
>> + * calculated by using the delta from last update. On multi-lrc case, only the
>> + * first is considered.
>> + */
>> +void xe_exec_queue_update_runtime(struct xe_exec_queue *q)
>> +{
>> +	struct xe_file *xef;
>> +	struct xe_lrc *lrc;
>> +	u32 old_ts, new_ts;
>> +
>> +	/*
>> +	 * Jobs that are run during driver load may use an exec_queue, but are
>> +	 * not associated with a user xe file, so avoid accumulating busyness
>> +	 * for kernel specific work.
>> +	 */
>> +	if (!q->vm || !q->vm->xef)
>> +		return;
>> +
>> +	xef = q->vm->xef;
>> +
>> +	/*
>> +	 * Only sample the first LRC. For parallel submission, all of them are
>> +	 * scheduled together and we compensate that below by multiplying by
>> +	 * width - this may introduce errors if that premise is not true and
>> +	 * they don't exit 100% aligned. On the other hand, looping through
>> +	 * the LRCs and reading them in different time could also introduce
>> +	 * errors.
>
>At the time we're executing this function, those LRCs aren't executing
>on the hardware anymore and their timestamps aren't continuing to move,

not necessarily. Besides calling this function when execution ends, see
last patch. This is called when userspace reads the fdinfo file, which
portentially reads this for running LRCs.

>right?  I don't see where error could creep in from just looping over
>each of them?
>
>I guess parallel submission is mostly just used by media these days,
>where the batches submitted in parallel are nearly identical and
>expected to run the same amount of time, right?  Do we have any

what I got from Matt Brost is that they are always scheduled together
and will run together on the different instances of that engine class,
regardless if they are different. As you said, I'm not sure there's
even a use case for running different batches.  +Matt Brost to confirm
my reasoning below.

Looking at our uapi and some tests in igt. This is controlled by the width
arg when creating the exec queue. Later when executing, we can only pass 1
sync obj to wait for completion. So even if userspace passes different
batch addresses during exec (i.e. different batches), the whole lot will
not complete until everything finishes. I think it's reasonable to
consider everything is busy while it doesn't complete.

>userspace (or potential future userspace) that might submit
>heterogeneous batches in parallel, which would make this inaccurate?
>
>I'm not very familiar with the use cases of parallel submission, so I'll
>trust that you've got a better understanding of the userspace usage than
>I do; everything else here looks fine to me.

I kind of learned this part when doing this code :). It'd be good to
wait for an ack by Matt Brost who is more familiar with it.

>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks
Lucas De Marchi
