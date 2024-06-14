Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2F9909264
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 20:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7173510EE23;
	Fri, 14 Jun 2024 18:37:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GN5lrwwv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FAC10EE25
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 18:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718390238; x=1749926238;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=B8z8vGOLW6bkkDfSmEqK2rNcNkWYYHbxonEFKKwuQ0E=;
 b=GN5lrwwvlKL8+y4mdERQPgTWr1aK+wSsi3HLTjr+3yWCms/plZBIbQM4
 UqfQjRyZZHLab5JEvPaCapndLu5bgp90ltQXsvztg6Y/aMxGyJBhYEZZN
 Gn8uh7FjypXyHZ4IIpD4MrJNzUTg+W/Xpiht0HK/p2PQKg/z/sMKrAm8s
 VCdxlVlHz0HLZaAia3ZlKDyd84Nf42+vozdNtB3hnN0E0FGGRdKbLSCKi
 pswJfSeyFTSMOhQuJJOYSbm3T5HIzY2q7OdQIcuy7A/ltbwl2y3wnN6Rx
 hg+lxXNjZHd1L0g8jtHY2qvKW8PKFSiEIQl61fnrkuKDDG6d0XVDRvN7V Q==;
X-CSE-ConnectionGUID: OonWjM8gRF2Stj3bruOgqA==
X-CSE-MsgGUID: clgZJtZ5REiuVZaLugZmRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15261630"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="15261630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2024 11:37:17 -0700
X-CSE-ConnectionGUID: f9yZIpTOQbOD5CgnRtP3bQ==
X-CSE-MsgGUID: 3jGTt0KTSzG1g71r+WPM6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; d="scan'208";a="45534701"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jun 2024 11:37:17 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 14 Jun 2024 11:37:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 14 Jun 2024 11:37:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 14 Jun 2024 11:37:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HvouE3HuTybYITwZwToqXgRC1OlCS27mV0BSvAm4fYyBENXfKOrdazDIXok/W+PyWQT8p6eo+GwqI8+CB8tHAQFMzaEs6m2HGNjyjSkOwY5XZAwYHLIydqsoPCn08twujySyGgDS2+MwI2YVuswzx+XojeuHNawytIIs7Cl9zT6PrGCKfwvzCzX1kVVj/PExnAutaV0fZcYSGgF3zyz9uxdE4g3bOy5PLsRRo9nme9HXceuSu3mqo5pLNz98hLBdZWvhrNmAaQ1O4hRWdYynx+ym/DH1LMkRxNlJntp2Mke8fl3YqkpeMeWThBwO2P6CgCpGZS+6TVJ79Xyk/8h2UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhQh4okGD7b10AVJFBscX7h0w8A/zW+OyLU5jictNWk=;
 b=ZoWYJeKhyo4OZoXwJRAw9v9mjM6lt1oe93f+IoSb7PzQzxXse1Elks3EvEFpuQTqxzbiCNQnq3SbvjYjvCOssrtWNWBRXdshkXhMBOh4F9nv+RsgrFcYdq4L10x8n3DNISynJSA+qgDFjgDG5w0WB9i27vQBrCCxix1EnwGCxeFGjNgGBahRPEXud0J1Fr8n/SU2SmgRdOKBrWIYrYNgvJGRJIDuhluvmxWztFAy8jtpJLn0/j5Z+UkXQFSMi8phewWXfX+IzPFax2T/XbgF8u45Hdb+OG7Wa01luNce4Ty78cspHtBXpOa2fVh1HlJEY2CZPuYuk7mBpkq7pPwFRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by MN0PR11MB6010.namprd11.prod.outlook.com (2603:10b6:208:371::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 18:37:14 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 18:37:14 +0000
Message-ID: <907ebc27-ab3c-47fb-97e2-ff281ab5161d@intel.com>
Date: Fri, 14 Jun 2024 11:37:10 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/print: Introduce drm_line_printer
To: Jani Nikula <jani.nikula@intel.com>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20240528130622.1152-1-michal.wajdeczko@intel.com>
 <1bf31a4b-fede-4044-8390-abb2b833608d@intel.com> <877cfbivrv.fsf@intel.com>
 <146d5133-f3be-4411-b020-a177254a65bc@intel.com> <87ed9jgkge.fsf@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87ed9jgkge.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|MN0PR11MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d7b42de-a6dc-462e-ef9b-08dc8ca1026f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VTI5M2R5Z3pCcjJ4MytsMzRtd2pTbU55bmJtUFcxT0hVT05zRGdpY0loeFVp?=
 =?utf-8?B?NzhkYXNtMFFRNFF3dGFHRVVRK0ZYUzZhVG9IN3ZRR2VhVVp0UC9oc2VMOCtl?=
 =?utf-8?B?U3VJR2cwYWlRckNNOCtLZzJyRisxWEhiU2dnVG5aSzV6VFBpNE1UbjRuWnlE?=
 =?utf-8?B?cmdHVjI5MGFPeXNqOCtwRWNJZGdQY2FnRUhDYTF1aU9zVzBRNnc1VnF3VDJH?=
 =?utf-8?B?TG8vZlAxNjF3SzBvd0tCSnN3b0l4YW55UWlPcExVeXgvTVI2bUZzSnBLdXJE?=
 =?utf-8?B?SjdCbGRKenUrQXZ2eG42TVNJazhjazlkbjBaSVptM0wvSjZ0WFluMHNwbGkz?=
 =?utf-8?B?U0tEL0ZYYkczZHV0MDd1WlBFTUlYNjNWUCswdHNKcXpyMFRsdGlvbU9BWlpG?=
 =?utf-8?B?VUdicmUyZ1czNUhUT3BjbEdIWTdwTWw1MHZ0V203WDIrRGgwWS9sUDNHU2Nm?=
 =?utf-8?B?ZlFvN0xQTEF1SVVnM2RMeDJDZFhYdXVnUlFlZEZuS3c5SytURlZqOEhiU0RV?=
 =?utf-8?B?a2FXRVNsNGdPRGppZmxIWndZWDM1eUZJNU8vNDFaSjMrOHR6UE9lc1hIamMx?=
 =?utf-8?B?cnJqd3Y2Nk83a2FrK3V3RVdIamdZZFUwWHBlUTE5emFrdml6UGZKaGwvMWN1?=
 =?utf-8?B?V3JqSXZxcEhyNHBkOGF3Q3dRU3R3Wkowb3hCOGFoNHVDTXhJbzhCZzlLVHU2?=
 =?utf-8?B?ZFZIVFBWM2YxYWoyRy9xNHpiOGdWUE5KRi9kenlSR3JVWWdQSHByTDNhdjBn?=
 =?utf-8?B?RVh1STlGS3lNYWsrZmtCWDJuM0tMbGJ2YXhUVi9keVBKTXRMV2tySjRVUHRl?=
 =?utf-8?B?aDRQUnRGYjV5Z2Rnc256VGNjeGYrNy9XdlczVTFLV3d3L3UzaTdsS2lvOVFm?=
 =?utf-8?B?aVhkZzAvUnlVSWJ1cUxQNGlCR3p2VkpBVFkyOEFYdE95T244VFVxellQWkNB?=
 =?utf-8?B?OXZveGRnaU9ra3JqNDNtT1cyYnp5b25LdkNrZWNqTXdrOFQ4dG1maVJFT3Bz?=
 =?utf-8?B?ZXRWRTlNS1E3Y2ZCRzErNW8wdFcwOVNKbVZsWi85QlY0bXhGRk5VTldvcVY5?=
 =?utf-8?B?VDhyRDBUbTExNElIaEtLUk9RZ3F5TldTMUFBTmNhSlh4bElzOG5rTThyWUY1?=
 =?utf-8?B?RDI1NFhJNG1LZ1VBZXBFdlR4WFR2WGpRTzJEaXRsNmx1cUk3akMyT0phUUtD?=
 =?utf-8?B?VldYaXhPaGpmMFFOQzNrQzZRVjdKMW9LdTIwV0U4WWRqVzBIVDNDZE1IQnNN?=
 =?utf-8?B?OFRPTXgydUhHUWFxQmtDR09ucFpCYUQxYWltYUtBcXp0N285RlBJWHJ3UXE3?=
 =?utf-8?B?R0tsZVhjWmNUZWh6UFljVE1KU1QvNjNxYnRmb25wVHdhcllPMlR1bDJvL0Jv?=
 =?utf-8?B?QmM0VWJxbWZkUktXVHA1MG1FYnRDS1Y1RnJGRU9vQUIrdTZjczVWUk5PUjBx?=
 =?utf-8?B?SHQyVFBHaC9ZMkpQNi91V0FBdUVVYkVyNGhpQjF4aXBHV1paQnY2MzRRU2NZ?=
 =?utf-8?B?UUREakxMWXp3cFFmWkY0ODBweVJIeWhpdE16QkhNOTl1cnliVDB2a2ZlZzQx?=
 =?utf-8?B?SzN6ZDhRSVZaTUVSVVlhdWNocStTVDYreGhBbFl4c1BSUzRrY0VOK1IxbUp6?=
 =?utf-8?B?R0FXM3hFWklzazRnRHJXQmoxMkNUaDRzNnJxZ3lkbWpneEZtYld2cU8rWE81?=
 =?utf-8?Q?HOG1K1S3yWvHRSho6wK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGEwOU56TmdZY2RGYnIyZ05HRFBMZlZjR1gvOTdXcCtsZ3cyaEhOWUVON1l1?=
 =?utf-8?B?Y3VmN1Z5Nk4zSSs1dXJIcW40S2tPRSsrOHQzb2EyNzRMbmlFN292MHozcUpx?=
 =?utf-8?B?cndKckk3U2VYOWJCbEdCZHpqbWs2WEJjRjBNVUJoNk16NXJ4NmRoRVg1QU1N?=
 =?utf-8?B?TC9laTNvN21zRUJTc2VpV1hudjU1ZFFYem5zWFBUK1RSejFSK2xpVlBhdTh4?=
 =?utf-8?B?T0pCMW5OVTI0OXp6dkdPSXB1cUVzcHREakJEOWJEWktSaEZPTHZLSE1mQTJa?=
 =?utf-8?B?cDlRdXY5bmZScFlKY1daUmplTHFveTNjclhKQ2NGVHhXQjNEZzV4YzNiWjVy?=
 =?utf-8?B?NWV2QnRMVDZxYitDMTRHSlIyQlEwN3UxMkRkNDRJOHlpbTNpVm1jc0EvTWVZ?=
 =?utf-8?B?Q0RLOWNrR2dBUVFKTGdLTjlCTXMySi9DMmFoUlhWZVRtaWovNXVlMm96Vi9Q?=
 =?utf-8?B?NnVyU216c2I4d2V4L2lBRG1VWk03dk1IcHl3eEpyMVJZMWdBdE1HYkJ6UFQv?=
 =?utf-8?B?RHJjUWZEc3FTMGY5cFFabmlVcTExZDJwelpESCtHN0NLUUU4blduR1ZMV1Bs?=
 =?utf-8?B?TDdVY2U4WjgwWlR6aVkxRTg5UHlTa2VXTnVxZ1huNWl3ZVBmbGxxZWdISnNr?=
 =?utf-8?B?dzluaFp4S2E1anRLaWZHdHhPL2hTcFljamMwTDRtemVWdWF2Sm14Y3lJOWw5?=
 =?utf-8?B?N091d0FQcDZiTkY4ZVJOMHgyaWZOSHhBZlAwbytWY1hhQVZFOElIQlQrYW9y?=
 =?utf-8?B?aWtBRzB0SnRRN05jV1pjVUpYSUd0L0JiNHlpTVRic055RVBZY25ZdzJ6L1Yy?=
 =?utf-8?B?NW5yTEI2azNKRHJmUHRtWHlZbXZxVERBNjliaGEvWWhVVitHbmZnM3hwKzht?=
 =?utf-8?B?ZnRubUtoWFVOc3d1RVVXYVgxNXd2cjdSMmxJaGZwNGZ0SWxZbTQ3dUlCSVRt?=
 =?utf-8?B?R2NwZnYrUTc5YWJvSlJxem1jSDNEMEdOeFhubGZUSWN3aEtyd2o2Z1FOMm04?=
 =?utf-8?B?bUJBNkQ4dGVyTjZoR0RzNW03V1gvbnd2LzkzbzBscDlLakJ4endmalBESWJh?=
 =?utf-8?B?WUNtYWJRdkpEZk1oS3pyYmxiMTNjZHFGT05jMWhKN3VBNzZKQ25sQWgzdGx0?=
 =?utf-8?B?YTJZd00vT3JuRUxnZWVhMUdZd1ZRVUowZTcySGg5b3Z5dDAweFdmdjVnUlph?=
 =?utf-8?B?aTlrelJQZ0FUVS9UMG9MUmh3UDZVcVRxU3ZsVDBDa3AyU0VSa2dRNjdZREJx?=
 =?utf-8?B?UDcxMTcxazFOaTFjZjdCQnJpd0x0bzlCOVBldmMwOW8xL2puWERXclk3TjVR?=
 =?utf-8?B?OVRwd3Q3YmMySnlIS1VwcTZVZjVPRXAwOFgrdUZiYjNDNWQ2RVEzMnRtQ2Jh?=
 =?utf-8?B?MEJOVVNhZTkyY3l3eFlvbG1XWkhWT1NNQkVTY3E1c3NWT2ZRUis0S2RjOFI0?=
 =?utf-8?B?a3NycklFd1oxd1NERHgxWC9sOUlKSHlGYUpoc3NuNlpndnBHL2VHaDZKempj?=
 =?utf-8?B?dVN5MkFXajdQTHdoL1R0NkIxZnErYVZ3SXNJMjNJY2pwVzZ3cnNTYk1qbmZS?=
 =?utf-8?B?R1Z3d21lZkI2OCtmT0xZVUFobjNVNTlvd2VBRi9pZU95b2ZWVWswV244bzhi?=
 =?utf-8?B?MXg2OEVsam53R0lVaWRVVzdGaDIxWGlFRTkxSklXL0JBbnFobkV3V1BpeW1w?=
 =?utf-8?B?UVhFMi9DdENEQzZCdGYxdFZEd1Z6T1g1WU95bXFHd3M4T3hoa1VPNTZzTVpi?=
 =?utf-8?B?RU9NYklFd2YydDdyd01MVTFkakhuUWVrYjlyNU1Yd0M4SmUwNkNxT09XNFQv?=
 =?utf-8?B?M25hK2JYS0lNRVBaYmFSYlZhMW9SWG4wbXpod1dCbFRzb2FIWFpkL09zVmJP?=
 =?utf-8?B?c0xZK0lMWDl1SDh0amRxcEVaT2M2RkRPY3g2NllEa0ltdHQ2LzJVNVNYRjNt?=
 =?utf-8?B?WndQM0RpVWpESGRVS0drSVFOdHIycUxTdHZzcGVicXB3RHZKQVdUQUowL2RP?=
 =?utf-8?B?N2lPeDhlTDYyQ3FuQU1NUWxOTXZaclRRdUQrVGNNVEZvRmFHdThRQUp3RzQy?=
 =?utf-8?B?OUV5SzFIOTEvcnlPd2RsbVpMQW5wV1Y1bWMzWERha2ttVXAwbURJRVhlWnJa?=
 =?utf-8?B?Tm9aRGdhK3FKcU9jSXplM2lrQzlKOU42R1gweE9PcnhtemZtVUtyR1pwS1B4?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d7b42de-a6dc-462e-ef9b-08dc8ca1026f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 18:37:14.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60t2lqXkztDIEZeHZgV9Ji6CN4UUAwF5B/EqvZMeYJyUHwe1nSrgcGZNKA/0+jT02PyvZTyanQYSP59nHTKdds5i0eN+7gIq1ucLTQX2JMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6010
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

On 5/30/2024 12:37, Jani Nikula wrote:
> On Thu, 30 May 2024, John Harrison <john.c.harrison@intel.com> wrote:
>> Except that the whole reason this was started was because Michal
>> absolutely refuses to allow line counted output in a sysfs/debugfs
>> file because "it is unnecessary and breaks the decoding tools".
> I'm only looking at this patch at face value, it seems useful to me, but
> I'm not aware of any deeper context. And judging by the tone of the
> discussion, I also don't want to get into it.
>
> That said, might be prudent to post a patch using the line printer along
> with its addition.
See:
     https://patchwork.freedesktop.org/series/134695/

Patches #5 and #6 make use of the line printer. Although as mentioned in 
that patch set, the usage there is still just a stop-gap measure and 
both those usages are intended to be replaced once the issues with the 
devcoredump version are resolved. The ultimate aim would be to use the 
line printer from just one function which dumps a devcoredump capture to 
dmesg. That function can then be used from the dead CT code and any 
other random debug effort a random developer is working on locally.

John.

>
> Over and out.
>
>
> BR,
> Jani.
>

