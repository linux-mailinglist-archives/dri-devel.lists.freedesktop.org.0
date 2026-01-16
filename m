Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF52D38957
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 23:37:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6DF10E163;
	Fri, 16 Jan 2026 22:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SnIs311U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF1810E163;
 Fri, 16 Jan 2026 22:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768603022; x=1800139022;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=w7BFxtoapMOd3oEFX2td3xdBAEVMi/KSp6jkfjAjmhI=;
 b=SnIs311UZ3MpbuROV5kcaE+urEXhdXnHnDB8mxjWa+j2HpID9VwGcB89
 JadXY+DVJrHaIK5PX8M3y15GHO7IJP3VJsvSa0Y/nWpjqeEYsJOUJy0CZ
 6aW8yq14CfaJofjKzAr1tdOZmLWnGl9OFRckjO2stz7horlkriBVi08Rn
 3jbPJFvNGsdn3bizrxiOPIgYAN8dwuxKcEW4vLa/yjDYSDFMEU3BWDp4A
 3+Mbff3qfqM+7XGWvYMIfGwxeJBdQQ6cxozSu9cJLialbMqjACtr/cFZy
 lXk10a3PTbRGNwivcW5FuduVn9Qh7tFf8Z6yOQpcUOj7cCG7TC5zweLkz w==;
X-CSE-ConnectionGUID: QdS7MhFRQta1qZ4DDuiRAw==
X-CSE-MsgGUID: 5YVQxL27Tm+t2nHzxKKimw==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69124539"
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="69124539"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:37:01 -0800
X-CSE-ConnectionGUID: 2+UMlko5Q5+FkCB4FNnwJw==
X-CSE-MsgGUID: yv7ZcGkGTVyV1ipHsEjE4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,232,1763452800"; d="scan'208";a="204966098"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2026 14:37:01 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:37:00 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 16 Jan 2026 14:37:00 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.66) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 16 Jan 2026 14:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEqFL75y2BG+7sfIkfNckfL4iXU+AQHKl573jtoj87jj4Elu+VLH+Wbk50dNWn0FYxRbLYeVkAmN/qBZpRD7Yf2QzWzfJd2L9dLOjooJ1HvfKCLTQK0EsbWkPyRwZ2cFGjehxzVxv6/DWNmxEHaO7OhAXVfN6hbO9YBukFHH5hR0c1nKHi2AybPUreSUFsel9JeQqy0Eo+b2L1uYqclYsPdc31383pksr+Zfbc9bqTz7bA48RCPh4JVbZWYRGIYd/3kd8Tujuoot2DKr0iovPWHJ96cv8RCIc4Gy7P0wIy6kgNmvNGAh/rW2Gn7U/chQkpFr1UIlZ7ho/Q3Wc7HkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zJVK3v/8gxKGx66UuXijuX/09K0e/MvTGKvZPpjJNI=;
 b=YBthngArrc7o324A+0cW67yK0ewukXZkwVqRBg6AOLe84pIpyTb7drqW8c2rC8OaRtfbsHB3CdWz/qHsWBAId3O/cacYW0JALlOuOaRXci63oCAQbPHXqgHDuWK+8YpHlFMwEWdpaux+IV9Ji5vrSXa/uhwMmb2ToxaLENyw+1V22JXfEylyKwjALmWvlcJCmutWIehKTKtx8/AqPFFCaB1UNPoiw8Bpq5S+VpI4C2RAZFiBV0EceOL2+nTaut1mOD7iBjE6iz5qGEciYkIOd1FUKdCTDbTDjh1BYL0uJw3QvZPmsZbl5QHr7mp7rZSRQAp2mA3vS8yV4T55/ii/HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7602.namprd11.prod.outlook.com (2603:10b6:806:348::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.7; Fri, 16 Jan
 2026 22:36:57 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Fri, 16 Jan 2026
 22:36:55 +0000
Date: Fri, 16 Jan 2026 14:36:51 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: Francois Dugast <francois.dugast@intel.com>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, Zi Yan
 <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>, adhavan Srinivasan
 <maddy@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman
 <mpe@ellerman.id.au>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Hildenbrand" <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, "Jason
 Gunthorpe" <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, "Suren
 Baghdasaryan" <surenb@google.com>, Michal Hocko <mhocko@suse.com>, "Balbir
 Singh" <balbirs@nvidia.com>, <linuxppc-dev@lists.ozlabs.org>,
 <kvm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-mm@kvack.org>, <linux-cxl@vger.kernel.org>
Subject: Re: [PATCH v6 1/5] mm/zone_device: Reinitialize large zone device
 private folios
Message-ID: <aWq9g8lIUPl9yDYA@lstrano-desk.jf.intel.com>
References: <20260116111325.1736137-1-francois.dugast@intel.com>
 <20260116111325.1736137-2-francois.dugast@intel.com>
 <20260116143432.50b98d6dc965b94f3b915333@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260116143432.50b98d6dc965b94f3b915333@linux-foundation.org>
X-ClientProxiedBy: BY3PR10CA0002.namprd10.prod.outlook.com
 (2603:10b6:a03:255::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7602:EE_
X-MS-Office365-Filtering-Correlation-Id: 24555a29-8102-47ec-ec2b-08de554fc097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlhOanduY2l3TEdncVJJR3dvY20zV0pQVjJLTWxRWmkvQzFBM3NkaWwrdmR1?=
 =?utf-8?B?ekhaU29vNDZIVmlhRWowU3RsV1dVMVdHR1dMZTExaEJYVm44a09OYnQ4QU5i?=
 =?utf-8?B?YjJGcEVIT3E0cFVzZWRkTThQRHlibTVRVFkzWHo0b1JKaTM5MUhEdVlOWTJq?=
 =?utf-8?B?RmxQcEFFaURLblVuZDB2Tk1uNjFtdGFtZm1JT2xnOTFKQ05WT3BDRU11SXd2?=
 =?utf-8?B?ZnFXMnpjRWtLOU01NjNLRzVOaXp6RnpIWDM3MmVqdUUyTW1UWis5TUI1SFJm?=
 =?utf-8?B?cC9MNERRNUduTHJHYWwwNmJEMEhUQktReUlGV1JIcHpGK2FpZE1QalR4cFEr?=
 =?utf-8?B?NFBqem1STE5kSU1iQStyaktQTHhMa2o4L1A2RExmWExPZ25qaTR1Zk1HSktU?=
 =?utf-8?B?bjM5bWJ5RUlQTHNXaERmMHVBamc0QTRQU3JFOHR6YkNpbHNDd3huNDNDUzRi?=
 =?utf-8?B?dlZUbjZYUXpCbGpTMi85Vk1Zbkc0by8xWi9JZVVjaVdmZ0RlNGtZNFhJUTVw?=
 =?utf-8?B?Unc4NHN3akFGanVzNm9aUW5HeS9kV2xXUGVCM00zc1RmQUNVK0x6cU8wa3lk?=
 =?utf-8?B?OUs5RWRvL1B3NEFjS3lVYW5zQkNocTZIQlI2QlBpZlBnMkxZdnJkVWVkSnRu?=
 =?utf-8?B?UWFOVmR0aHFWdXpPT0NxaDZocjI5TTQrK2NKeXlxekJ3cGtaWU1MdW1QWkMv?=
 =?utf-8?B?dno0U09oUjdScjFaQzRROFJieHk0WFFBcjFjWkRTdzBiVHRYaVdUS3FKRTFy?=
 =?utf-8?B?di8zMEV6dGFYMkg5elZ1MW92VWVuWjlSVmlVVFVpWU51WkpOUVNCKy9wZXY1?=
 =?utf-8?B?VW90bjlrbDU2NmtqWXRoemdIbW96UnJYU1J5SzdDTkdiQ2xBUWMxZEtNU3pm?=
 =?utf-8?B?Kzhrd2I3bi9ETzZGYnVkSUlBbW4rbmg1RVpRWUFhR09kU3EzWGZyNWxzUHlM?=
 =?utf-8?B?MnZ5djBQc0REMElzdDNaOVJGNFkreFc2ZHpsdzN3ZzlZVTlmMWZIc0NHZFF2?=
 =?utf-8?B?TDBZSE9oNWVLdElSQU11SGF0QmxsT3R3YmRuUWJraGZ1UkIxUWNoNjZzbk9V?=
 =?utf-8?B?S0lWSXFiVHlrVEN5TjQ0dXhONjcrc0wvZkFzMGNhczlLMGd6UGtTNUpubUJG?=
 =?utf-8?B?Vmw4VXdISmlCQ1pFNWx2bUs1T05KK1hhNXo2K0p0Z2hlaThCbmJseDM3TVM5?=
 =?utf-8?B?RnZITFJtNmhRVWV3V0lISnhGc2szM3BqMC9neno2S1FJUEZSNm5qUGZLaE1p?=
 =?utf-8?B?L0pEd0lJRlZDQ3RtSG40czA5YjRkUS94T1VUYkFVamo4ajBDQStiQVZuUUVs?=
 =?utf-8?B?WEhveDIxa2RqYVpMT0dlbncvU1dtdk40UUpEOXV1U290QjNSRVZiSlNiT0JX?=
 =?utf-8?B?Tm02YTBBc0FBZHJzZ0pXSUNIUUF4Q2ZRK2NxZGNIOXFYdEczWm52VERxMU5T?=
 =?utf-8?B?MDExVC9LTHhpcWg5ZWJabSthdGZxSXRZYkFnZlBVeXIrWnR5cm8zRDJEc1VI?=
 =?utf-8?B?dmw3dkhwcUFhejNqeGczcm1XT05ScjhLcjRlTWh5a0FJYkMrUUpWaWE0SFhn?=
 =?utf-8?B?ZVQzYi8xTk43M3RHOGRBbnQ0ZExZTEs1MEJaT29nd0R0MTBrMmFDYk5JSElo?=
 =?utf-8?B?OVdlVDltTmMweTNuVGNrbTRzR3M2UkE3MnBySFBOYk80d2d4RXQxV3dYWEgr?=
 =?utf-8?B?bWVKZjZQREQrNWQ5U1VaazF4WWYvT3FoU0ZLWHkxcjgwVUFQeDhiNzFNMXJo?=
 =?utf-8?B?V3E0TnNvYnBBKzdwVVUvY1hPVVhzaUJDcmJxTHN1dmpqR3dzdkhDN2FSb2JY?=
 =?utf-8?B?RkRJRmxGeFAzVkU5eHVwdklTQVJ4ajlyMzc3VURocy9TMGg0Y3pzU2YvaXVV?=
 =?utf-8?B?eVJZV0hoZmZQVHRtNVY1RWpmVmtDZDdFRUVTTFdhWlRNczFQMkRSQ0o4VEZZ?=
 =?utf-8?B?Nlc0eVV1bHBVbEZhdHRVRCtBWk4vQnc2bERBcWJlNFBhYVphczBMNkFvaGFV?=
 =?utf-8?B?a1VNSUo1dmJwMFA0WTAwdndRaW9vTHM0RlRpeVY4bTMvRDJZYXNXYVFhdVgy?=
 =?utf-8?B?NkxENVZIRWVic3lpTlJrcWFNd3dqQ1poUTNhQU5EM1FyNVpNbFR2eFg5amo4?=
 =?utf-8?Q?8tto=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJPdnMyY1hoVGpLVW1UNmlRZTZMNHlId0phM0RTUVR1RWdDUzRWdlR2RW1n?=
 =?utf-8?B?Q0sydHhLMTFVVU1tNmo1ekJwckFMU09RMGVSelZWMGFJM3ZFSU9NTTBURnpE?=
 =?utf-8?B?WVhRdEFLNUtiZ2JCL2RKcU5HUmF6dnhPVmsxNThWVmw0dTMzNmdwZ2lTQWdD?=
 =?utf-8?B?SFMyTGlIazBSZnMxLys1RzFKTlgvcWx4MVhBaVV3R3B0RWVDbHp6VVRHTVcz?=
 =?utf-8?B?ampOUHdqS3RQRXpjOFBlZzdxU1pveWhLaklLTWVUTFJDQUkzS2JoZ1YyMXBz?=
 =?utf-8?B?RjU3aUxPa1lDQnpXSDFrZGlWU1B6dDM4QkNzS1YvdGFzRGxvcGg5QlIrWTlP?=
 =?utf-8?B?TUIwWG1wbUZqRUFzLzROclBtY3h5djJLeTdhTnM4YVNVTThndDV5a0dnbEhS?=
 =?utf-8?B?UzhsL24vdHpQdHJialM5VXhnTmJlUFhpRGphdXhYSFdOTUMxeFVMeFdJTFRk?=
 =?utf-8?B?SjFPRG42dGNvaDVJL1ZHdm52aWhmQ1pwaUFJMG5JZHJtTWxHVDAwaCtGWjBN?=
 =?utf-8?B?bHQvTnczREF2M05HSHpyQzZpYjd2VGN5ZG83NmZMekpLZm9pZUprM2dlWWxD?=
 =?utf-8?B?dTAzOTc5VkIrSE1HVVIvTDR5RHRPUkZ5YTE1dUF6OTQ4M1MyQTdZRTJLQ09h?=
 =?utf-8?B?U1huWjdNajFhSUZhdEJsN0JkU0FKM09tNjhwNjdSclJ5SnQxYmw1QlE4NmVz?=
 =?utf-8?B?L1Yzc08vQkpkSklWN1VPc2lScTlYOTJPaTlOSUVtajlrZkYrcHNSTVlicSt0?=
 =?utf-8?B?clBIQTcwRWUzRWZiYUFsS0lZOXI2MEl4SVQwdFlmLzd1QU83NVBWalhjMFVJ?=
 =?utf-8?B?Y3Y4QXdGZGFscTJ0dWlDaCt2YlJvRkEzNUxvUWJNVXdlOEN6TG5naWRROHNt?=
 =?utf-8?B?TlIzR0x3WUpTaUtycjRtSS9sM2g5dCs0WVNIclFxUFB5cUd0WENock96QnFm?=
 =?utf-8?B?TlB5UFpCM1c4Ui9hNjQrOEduZ013V0ZHTzhKOGpVQ1cwK3pmMVZoUnJ5Vitv?=
 =?utf-8?B?N2VLbjhvbHFieW0rL1JOKy9jRHk4b2NrZklIN1dqOTdweFJMaXZxREhnU05j?=
 =?utf-8?B?MmNkeFFJakU0WjdYUlVyN3Zkbi83ckxDK2t6ODVQUE5IbTJZQ3N6V1ZIV0xF?=
 =?utf-8?B?Ujg2dnk3ZmZyN3l5Tk4wNXo3a1lxS3NZZUxyTHAxMmgzMkJiTFVmclRydnY1?=
 =?utf-8?B?cW9DL1N6ODhPdnI2dDlhL1BUNU1JS280UGNEZU84QW1EV0RqVUF2OEdEWHBM?=
 =?utf-8?B?VlJld1BpclJUcWVjQitEN1dPU2ZkeTFCaW8vSWowQ0NKTysyZklsYnFwMnhD?=
 =?utf-8?B?T0E4VXh6OTREQkJ1amdSV3pkcWxlZ1RjUVFyLzVjNy9CZ2FBazcrOTROSEht?=
 =?utf-8?B?cDNIeTFTZEZWNmY2NnlKTTUzM2QyNUFVVWl5UFhsZDA4RGZ6b1ljTmZTRGVy?=
 =?utf-8?B?YXdwRytCN0pDcUxJdmZtcVRSc3JmcFJJMmk5d3YrZ3hJdnAvQmhjdThpQmxC?=
 =?utf-8?B?NkUxenVWVXVJcGdyWVBLOTN0NFBnZmE4RGdacW4xTTRxS1ZiMmZNTThjd0pS?=
 =?utf-8?B?Vks4Y3Y0SGd3MlkzamUzQWVlcFg0NGg1eFEya2dXQ3hYL0Jzalp1N2c5enhR?=
 =?utf-8?B?QTNUblBQSUUzRlp0dDBRZDFMcklONStCZEsveW5rUTRWMTNwN2ZwTHc0T2Rh?=
 =?utf-8?B?TkRtdXN0VnJkM1puaDJqSnVTMkt5WldBS3cyN2lVTWRFeVYzYmZxWlUxVkNu?=
 =?utf-8?B?SHZHbjU4UjNJMXFmN0xSWVpuSkczVFVOenVSNVlneGRMOHdhTGZKQ1RFbUJt?=
 =?utf-8?B?Y0JiUHphR21ObGtSaWNma1BEby9wbWk3SFliUjlXQ05NUHZXaFpyYXBObDU4?=
 =?utf-8?B?eDZQMlp2TjJrOTJvRC9rMEZiYjhVdG42VzlFekhld1U3cFhkbFVrT1U5bE5D?=
 =?utf-8?B?K1ZNTlpjcTZ0cHVYQ0JPQUtjOGZWWDBMTzFWRlpVVStQSXE0dENoZ0wyODJi?=
 =?utf-8?B?YnQwK2dKdzNRMDBjd3dvY25JcTFPclF2RVFMckNkV0oyQ1JDbkU5ek9ySjlR?=
 =?utf-8?B?ZEVuSlBKV2UxK0dNbmJXMVhQSndxQmdYM052OTlKRTBEZGpSa2FzNlZDYWhW?=
 =?utf-8?B?S3Q2UXF3M0dabXFrNEhMbkwwN2lFWHhmWFUyWU12bDBLQ2lDQjhSYkZuVjdU?=
 =?utf-8?B?cU9qdHhzM1ZNSFNhOU56R1dtcE93YlM5ckNKMERWWkN5R1RORldIcTJEZ3Ex?=
 =?utf-8?B?MG1OckNkWm1OU0tPL2RpM1FUYnhnTzVZZC9qaSs0eHlMRHpiUm5ZRnU2NmI0?=
 =?utf-8?B?d2lPbmNXQ0hxN1FkRkhncjlWVkR0ZFZwKzBkMFp5dWJFSDJGOGRIeHhCekVG?=
 =?utf-8?Q?tEOAepfEkCpURh+k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24555a29-8102-47ec-ec2b-08de554fc097
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 22:36:55.6612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U24mFgpAPPL+V/TAj4+uL7LymYnE9ys91ZTSU1+iNXRRjXGlrIomf65I/LuO1o/JECvduNtDO88FoPZnH6n3aQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7602
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

On Fri, Jan 16, 2026 at 02:34:32PM -0800, Andrew Morton wrote:
> On Fri, 16 Jan 2026 12:10:16 +0100 Francois Dugast <francois.dugast@intel.com> wrote:
> 
> > Reinitialize metadata for large zone device private folios in
> > zone_device_page_init prior to creating a higher-order zone device
> > private folio. This step is necessary when the folio’s order changes
> > dynamically between zone_device_page_init calls to avoid building a
> > corrupt folio. As part of the metadata reinitialization, the dev_pagemap
> > must be passed in from the caller because the pgmap stored in the folio
> > page may have been overwritten with a compound head.
> > 
> > Without this fix, individual pages could have invalid pgmap fields and
> > flags (with PG_locked being notably problematic) due to prior different
> > order allocations, which can, and will, result in kernel crashes.
> 
> Is it OK to leave 6.18.x without this fixed?

I think 6.18.x is fine, the offending patch + large device pages is
going into 6.19, right?

Matt
