Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67BE954BF9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2024 16:11:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B54810E7AF;
	Fri, 16 Aug 2024 14:11:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWn5GzpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BEE910E7A5;
 Fri, 16 Aug 2024 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723817502; x=1755353502;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d7/ANyLXLQ6rWiKdMOpg+NquBkBPXwvNgKTYxyxRDO8=;
 b=TWn5GzpXLxyuQZAs1Lbwmcfd261GBaPSXZoLB1cdMc29immvKoRkfkzM
 Ay9cGUqgDCxv7uhOwwcuOG1Kb7FrRMmUphLfF81HA8qSIO7/i1QfZLFLQ
 BWHyeJZCsJ6COgre1+r6nPPyWa7gOqMRMSAdvJSdvhHmzSy8S//8bCYzi
 Vdh9UdO79wvHaHjrpvmTcnTeDqWCfKnLLAH7l42iSGubROymN+ly7GSGm
 Ahq7lKBHJ7C2XOvMv4phhL6I65KpyWYOJc2PfuUiArbyLpxfavs1VHgFM
 Lru5HEMgintBNZX6oGagIqqcuGXsaLJUQyiZCh7yWPM3AvY/bkRW/tXck g==;
X-CSE-ConnectionGUID: 2HMZHRsuSD63jiMh+3Yl8w==
X-CSE-MsgGUID: fzJMGtw2Tz6qsdEkiWawYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32748407"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="32748407"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2024 07:11:41 -0700
X-CSE-ConnectionGUID: HNeCH92MQT6oFOpSs3ezNw==
X-CSE-MsgGUID: rIz0Kw2rTCCKOKBE/6SN2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; d="scan'208";a="59848705"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Aug 2024 07:11:41 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 07:11:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 16 Aug 2024 07:11:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 16 Aug 2024 07:11:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 16 Aug 2024 07:11:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gz8krJ1cg89ddgyFzFO9vlB4xR7zr7bxbir9keq4wPJorvf1vo5nBxqMbLz1h0d8+v+AgILiUCicL6Jap0NiYFD25QDnmm+gfnx2NhruQOoRcGaRuwU1X7YKYKDIx43AM39yN6F9uSD9FIaUyWJYrb+uUOkm9WsDDjnsuukct6YvZvRfQEQ7t33giiwjmKGcu8NHvq+6IAQtnPHB1ljDrYuxz5sdQsYOS8AKrygGLdhYIWfKttylVXoH62dFetCd5LARjikUJxic5x+IGw8TNc54gSDCJNNcLI/+BxCY9nYEIGkPf0K60uqS29REw7GE/dArGJu3nGiAP604IcP2uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgvh7bHDJRjZ5zJXSjp7MBl4arFB3tuwghyQIYtr8qA=;
 b=i+afSP5nrQPppzeYs0MW+Ae/wd8lIPd4E7aaJuTMEYoYOx02fj6RrvUWQ9Fbu4KDmH8+/TMGQOW4oMaqTG233TSZY+Ns51G5XsShO19R9O0R/GijKIbVueybKodlK13Hfm7kgq0vvYm5GmZ9jLmXYMuW+AEGDkL56tZ2m04WtqlaqW/LucyhJ9s4WTcicQbVfduRagJU2/wnidwb5m8eiDA3vMhLPpJ+nfSyh0hQiLUvYhdMDTEgohI+RoCfnlVkiFKRrgHFBXNwsNR2TysjIqDcxovQ8ges3GWo6peQ41vRmDlHsS4KmIp0giQ5mQdfUZtLLeMBktCGgmYgtaIntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8124.namprd11.prod.outlook.com (2603:10b6:510:237::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 16 Aug
 2024 14:11:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7875.018; Fri, 16 Aug 2024
 14:11:31 +0000
Date: Fri, 16 Aug 2024 14:10:28 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>, "Paulo
 Zanoni" <paulo.r.zanoni@intel.com>
Subject: Re: [PATCH v8 2/6] drm/ttm/pool: Provide a helper to shrink pages
Message-ID: <Zr9d1Fw0a7S7TywD@DUT025-TGLU.fm.intel.com>
References: <20240816133717.3102-1-thomas.hellstrom@linux.intel.com>
 <20240816133717.3102-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240816133717.3102-3-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0148.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::33) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 010cb8ff-6500-4d58-e274-08dcbdfd53d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Yk9EMFNFbG5OM0VWNVpxOXJuc0l0NCthN0s3YVE2NzFncHNGM0FyL0RtUi85?=
 =?utf-8?B?KzZjVnBJaFhYSlVkd1YvaXFSbXluYnhpL3NtWVVvSG5wRVluekMyNHVheitM?=
 =?utf-8?B?dHB1MStYTldRc2Q0SnZKbVRNQnhMaVBqMndTRHg4c0NGaGN4bFdJemNQQmVr?=
 =?utf-8?B?TW1OMnJiek55Vk90S0dWallvTFR5Wi80V0JCWDg1RUtUVkswVDcyeHRGazI5?=
 =?utf-8?B?czVqczEzN2ZodjRJSk9zZEladCtaMkFTdTBSclV1d2ZFaXpVcUYxU0V4V1Ni?=
 =?utf-8?B?U1ZtNGx6QjhPYTFCL0E0STBqdHFQamV0SEc2QzZ1cUREbUZFb3lacHFwZ056?=
 =?utf-8?B?OGEvQmJYRCs2emdKVk8xd3U3MzVxWFM1Q29rOTdzeTVwNStSMGhDTlZyK1l1?=
 =?utf-8?B?UkZqak5PdWc3THZwcjNNTG80dXltWjhJOEpNM3g4anlxbHFzNFlOUXlaTEc0?=
 =?utf-8?B?eHhEWXJEU0lZZ0NoamZLQ2k2dnFqUThRR3pPR1ZENThnQkpYbEh2UGtCeGcy?=
 =?utf-8?B?V3VSTVVNeHBvTjd0eHVvMklyakN0T1A2S0QzMzFpV00wRFRtc0dibnZNV2t0?=
 =?utf-8?B?dnpiRWY3akZCMXo4dStNai85YUx4bWVMVHNWdFdiWkc2TGRvK0NpT1BtLzdM?=
 =?utf-8?B?aCtxYU93T3g5aCs2UkdvS1lRQTY2aTJtRTlEWVo5dHZPeVFZSnlJUHVZZHgy?=
 =?utf-8?B?S1RaamJXOC9vSXdRcDZVNWgvd2Y2d1RYbHYxbmRrTHVTVnFQQ2RoUkdpTlJU?=
 =?utf-8?B?eWxYcTJVK2lxbmtNQWM3VXlHNWM3QkZmd0F5bkxuakVnSTZvUVpMNDFSSmt4?=
 =?utf-8?B?c085aVRWR1NwdzFSQnk0V1h0YWFJbytJbTN2cXFPTEdtR0Y1b28zMFFMOEtG?=
 =?utf-8?B?RE9lQmE3ZHJKSi82dmFCWVIrSVlTTm9tV3EwYnhzbGw5MlVGcDBGN2xheWFr?=
 =?utf-8?B?MEZ4MFkwZ2h3K0VqT01SaGJ6T2EvWUIwYlgyRlJDVkUvbHZIREhhcFh3bG9U?=
 =?utf-8?B?cERqUXJ4dmdzWldBa1lVUmM4WU9nYTVlMEIzT2JTV3ptQnJSd1ZHYkhWMUN4?=
 =?utf-8?B?TjBmUFlRU2VIcGtsZStOYkdZamFJcHlCOElVMnAzNS9aVFZVaitwYitSK0dE?=
 =?utf-8?B?dU54R3ZGRnBRTkY1UytYb285MWNtTWxKWXJIeUs1c3FVM2xGcFpmYk9PRktm?=
 =?utf-8?B?a1NSNnZjcEdHMnpSQUd2amhKMDZzc2RQREJoSzlPaHJidDRFVkc3clRtSFVa?=
 =?utf-8?B?TGh6ZEJwM2tKTVBxdmswdnhDMEZWa2x0NnlTS28xZjZZMUtWZ3cybU9ZeDZn?=
 =?utf-8?B?aWpNTlRLc3o0WDR6WmQyZmVVQ1o3TlUva2dyQzVydk5BNHg3T05wcG4ycGRQ?=
 =?utf-8?B?cEVLKzB3OGVrYTR6aU1VaFZ3TWFFejJmNktpQ0dEWGJzWHE1TVpFaXV1cUNV?=
 =?utf-8?B?VkdXNXpYa0FpMytMRW94YU9pYjN1Tnd1MDdUWlIvUkxaSUpWS2VmeGtSaytG?=
 =?utf-8?B?anByajcweE52Vzh6b2Rxdm9yT0hvSlNtQW9hM096SWhHNnlmeXBacmFQTEl1?=
 =?utf-8?B?VmlEenJGd09aZ2gxZGt1VHNMRmxIVERmWmlHZUlKOVUvZDNFZk5kNDV0ZDlw?=
 =?utf-8?B?YmtTL29TdEF6TmZpZE1aMERtV01oNHJqQ2g1ZzBuZGpPTldQRE1qbGlyVGt1?=
 =?utf-8?B?Vm1pRGo2ek9qMHFVUmJscjEvWm0zeG9obkVDQnlKcC9qSlFmbThqUEZ1U24r?=
 =?utf-8?Q?qbB9OgLPa2eqr8o3lo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDJQejZqQmlNbWVlaWw3K24xcnBxRDRrUXc5YmF4RisxNzJnQmh4Z3NXcnhJ?=
 =?utf-8?B?QjNGdmxiSFh2Y1dLTTVSSDBxS3NTNUptTkhvaGI3aFo4S3NhVXl3RFNjZGlp?=
 =?utf-8?B?MkhzQTZpb25LWVZLeldvQTE1OFJRNjUyd0Q3anFXOUJLZ0VFWkNJajNkbTBB?=
 =?utf-8?B?UjIxNXRiNFpDODZwR1lmbTcvWGJ1by9Rak1YVVoxY051MG1HK1VZdGpKczZR?=
 =?utf-8?B?cGI3TzNhMUk4UjBabFcvczIwdmdncW8zTU5yM3N1YmlUY0thL0ZVeXdTem9O?=
 =?utf-8?B?WVN1V0JMZVVjTXNXMEt5WmIwYVFMT2ZkYUZxZGtPR3FnaGU1YmRiQkF5RkR0?=
 =?utf-8?B?OThVUHJlckxNMkNJaTFtOWI0ZlBiN29JUFBzSCtsSzRZVEJhTjkrMkZYRnk3?=
 =?utf-8?B?TkVzYkR0SDdwRW1lNThCQmREbm4valV2REVjQ3k5ZXBMTmhkOVN0a1F4RXZQ?=
 =?utf-8?B?YzJUeUg0QjhIeFBIOGhidmErUkhXQ1ZFc2FzK0Rwb2h0ZHM0Q2dhVG5nQlIy?=
 =?utf-8?B?RmRBcjFzdkJzMktKNlBOdERRTy8rVjRYRmdqd1JvbGtsNmNLQ0R3S1F0Q0k3?=
 =?utf-8?B?QnN3MmMrV0R1RmFwa0pFbmVBTE1PZE9NOWVzWFRzYTBzZEQvL09BQ2NLU01l?=
 =?utf-8?B?NWJWS0VwOU81aGpHaWkxSEVNWW9LQmtrbDBodnhUd3NBVm1NTVpLR3EzcGJJ?=
 =?utf-8?B?YXh4MDhPdnZzdEFBUDdydkt4aDR5TzlXSVNoSEpDSWVPbytaeWprTmR4OVpz?=
 =?utf-8?B?T3ZMT2pIb01RbWVDa0o4U1NjMVg1WXE5c2JkcXdvdFdYRkVPa05zVEhkM2NR?=
 =?utf-8?B?ZG4rakNUeDNlYy9yMzNnZFhuWTFZbi8wYWJZd3BmaE5nZ3JRUEZKdG5vY0pU?=
 =?utf-8?B?MFA1Y3VEamJHblZtOUZyVW1XNHVxU2ZNQ3FpYytGUUFWNEcxamVMejZCMzU5?=
 =?utf-8?B?Tko5NzRSanpqcHU4USs4OFZwM2RmSU9yTFlLOTM2VWM0Sm11cDFQUmhHcExT?=
 =?utf-8?B?N3d0MnBmNit3WVpraDlFTDR2SDExdHYzUHFOdjdBZHVUaE9kY1BhdGlYa2Ns?=
 =?utf-8?B?d2MwSHMrbWRiQUgzNkloREphdFgyNVF1TXRJSUVGaDE4UFQ4MVl0WUp1ZXpN?=
 =?utf-8?B?eXh5UWVOTkl1WkNOYU9sOVlvMHlKeXIrRG1EcEdKamxldDROS2hUbGN4QlZ2?=
 =?utf-8?B?d0xXNk90eXMySW41aGx5NE9TY0J0b2hkcU1zWEdFV1hrS1hJUnJJNEkyTFFK?=
 =?utf-8?B?eFJsaWtIcVdCaGZJSU1GTXpJdGhzTDM5Zy9lVGdvNi8rMEJHdDBCa0xLTGd2?=
 =?utf-8?B?bms1ZUJycTFsWGMxd3ZiaWZSbkZyYWZNVmJUVDBNOW5scXF2UG9vU1VKUWx4?=
 =?utf-8?B?UElEajRHVHVYcnhUQXlldkVGR2I0a3lVbmVTUFlsS1FVb0FaK2xEYksraGE2?=
 =?utf-8?B?eldEbHl3MDQybzJXc0owT0xPRnVzTUwzZE1JbXF0M0R6b294TWFmT0xaa1dm?=
 =?utf-8?B?cXFnek5TQ3liRGd4OUF5cTlsclFpWTdIMllrSU9RNnBrcnVMS2NNeWVBYnJK?=
 =?utf-8?B?c0lYbzY2WVFXODlyZEpjNWo0cWdGOWxGNkUzSlRNMVFHZTVHOXZlSUVLcXFS?=
 =?utf-8?B?VGVHSHIwZ3lMNk1BV0l3R202MlcvOXFMVjBKVEs0UlQzRlRIZWorRTBxamt4?=
 =?utf-8?B?cmdqNzZRdlNRcmIvV0k0dDU0OE85c0lVSUNHdUxETTJMMWh6RTkvNGpuTGZx?=
 =?utf-8?B?dTVLeUhZLzNlVHMvNWJETnFhdXhtM0Z6NnlMSEwvaXkxSzlISXRFdnFZekxh?=
 =?utf-8?B?TGc0cENvTEJ3dnhhcjdERW5nVGV0QTBMMnRQUlAvWVdQa3d2emhERUNiUlRn?=
 =?utf-8?B?UFMzc1JvV1poeDNsb25vbWhGNFVvU291dzZzVnZtQVA3a0hKM0ZMRGF3ekpL?=
 =?utf-8?B?aXdJYWphN01wVzlEdktFZ2pwYlhlV0FTWlRLeksyeUN4WW5TSXhKdmNqamty?=
 =?utf-8?B?KzNQTW8zM2UvNG9VSENTMGtRMkVYS0V3ejlldW4vcTZENXBFbHliUm9yblVF?=
 =?utf-8?B?eW9WbjBXTlZxc1l1Z3V0MUhhT1ZjNitaWlZIaUtyRXY4U00rZTZjMkoyd1BB?=
 =?utf-8?B?YzVrWnN5QnU4UisrVlpSM2p6bFhVYnkrOEU5cEQrakV1ejVYbGx3QXgvOGdK?=
 =?utf-8?B?dWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 010cb8ff-6500-4d58-e274-08dcbdfd53d1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 14:11:31.5000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: udP+iu01tBRc0hpLLA3oOkn0R1IbQo5FHUJmDajKdsQUNlpdtXSI+RVAWM4sNxaTN8lHJrs5e7+9qDYCpixdCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8124
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

On Fri, Aug 16, 2024 at 03:37:13PM +0200, Thomas Hellström wrote:
> Provide a helper to shrink ttm_tt page-vectors on a per-page
> basis. A ttm_backup backend could then in theory get away with
> allocating a single temporary page for each struct ttm_tt.
> 
> This is accomplished by splitting larger pages before trying to
> back them up.
> 
> In the future we could allow ttm_backup to handle backing up
> large pages as well, but currently there's no benefit in
> doing that, since the shmem backup backend would have to
> split those anyway to avoid allocating too much temporary
> memory, and if the backend instead inserts pages into the
> swap-cache, those are split on reclaim by the core.
> 
> Due to potential backup- and recover errors, allow partially swapped
> out struct ttm_tt's, although mark them as swapped out stopping them
> from being swapped out a second time. More details in the ttm_pool.c
> DOC section.
> 
> v2:
> - A couple of cleanups and error fixes in ttm_pool_back_up_tt.
> - s/back_up/backup/
> - Add a writeback parameter to the exported interface.
> v8:
> - Use a struct for flags for readability (Matt Brost)
> - Address misc other review comments (Matt Brost)
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 394 +++++++++++++++++++++++++++++++--
>  drivers/gpu/drm/ttm/ttm_tt.c   |  37 ++++
>  include/drm/ttm/ttm_pool.h     |   6 +
>  include/drm/ttm/ttm_tt.h       |  29 +++
>  4 files changed, 453 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 8504dbe19c1a..0d224cd9f8eb 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -41,6 +41,7 @@
>  #include <asm/set_memory.h>
>  #endif
>  
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_pool.h>
>  #include <drm/ttm/ttm_tt.h>
>  #include <drm/ttm/ttm_bo.h>
> @@ -58,6 +59,32 @@ struct ttm_pool_dma {
>  	unsigned long vaddr;
>  };
>  
> +/**
> + * struct ttm_pool_tt_restore - State representing restore from backup
> + * @alloced_pages: Total number of already allocated pages for the ttm_tt.
> + * @restored_pages: Number of (sub) pages restored from swap for this
> + *		     chunk of 1 << @order pages.
> + * @first_page: The ttm page ptr representing for @old_pages[0].
> + * @caching_divide: Page pointer where subsequent pages are cached.
> + * @old_pages: Backup copy of page pointers that were replaced by the new
> + *	       page allocation.
> + * @pool: The pool used for page allocation while restoring.
> + * @order: The order of the last page allocated while restoring.
> + *
> + * Recovery from backup might fail when we've recovered less than the
> + * full ttm_tt. In order not to loose any data (yet), keep information
> + * around that allows us to restart a failed ttm backup recovery.
> + */
> +struct ttm_pool_tt_restore {
> +	pgoff_t alloced_pages;
> +	pgoff_t restored_pages;
> +	struct page **first_page;
> +	struct page **caching_divide;
> +	struct ttm_pool *pool;
> +	unsigned int order;
> +	struct page *old_pages[];
> +};
> +
>  static unsigned long page_pool_size;
>  
>  MODULE_PARM_DESC(page_pool_size, "Number of pages in the WC/UC/DMA pool");
> @@ -354,11 +381,102 @@ static unsigned int ttm_pool_page_order(struct ttm_pool *pool, struct page *p)
>  	return p->private;
>  }
>  
> +/*
> + * To be able to insert single pages into backup directly,
> + * we need to split multi-order page allocations and make them look
> + * like single-page allocations.
> + */
> +static void ttm_pool_split_for_swap(struct ttm_pool *pool, struct page *p)
> +{
> +	unsigned int order = ttm_pool_page_order(pool, p);
> +	pgoff_t nr;
> +
> +	if (!order)
> +		return;
> +
> +	split_page(p, order);
> +	nr = 1UL << order;
> +	while (nr--)
> +		(p++)->private = 0;
> +}
> +
> +/**
> + * DOC: Partial backup and restoration of a struct ttm_tt.
> + *
> + * Swapout using ttm_backup::ops::backup_page() and swapin using
> + * ttm_backup::ops::copy_backed_up_page() may fail.
> + * The former most likely due to lack of swap-space or memory, the latter due
> + * to lack of memory or because of signal interruption during waits.
> + *
> + * Backupfailure is easily handled by using a ttm_tt pages vector that holds
> + * both swap entries and page pointers. This has to be taken into account when
> + * restoring such a ttm_tt from backup, and when freeing it while backed up.
> + * When restoring, for simplicity, new pages are actually allocated from the
> + * pool and the contents of any old pages are copied in and then the old pages
> + * are released.
> + *
> + * For restoration failures, the struct ttm_pool_tt_restore holds sufficient state
> + * to be able to resume an interrupted restore, and that structure is freed once
> + * the restoration is complete. If the struct ttm_tt is destroyed while there
> + * is a valid struct ttm_pool_tt_restore attached, that is also properly taken
> + * care of.
> + */
> +
> +static bool ttm_pool_restore_valid(const struct ttm_pool_tt_restore *restore)
> +{
> +	return restore && restore->restored_pages < (1 << restore->order);
> +}
> +
> +static int ttm_pool_restore_tt(struct ttm_pool_tt_restore *restore,
> +			       struct ttm_backup *backup,
> +			       struct ttm_operation_ctx *ctx)
> +{
> +	unsigned int i, nr = 1 << restore->order;
> +	int ret = 0;
> +
> +	if (!ttm_pool_restore_valid(restore))
> +		return 0;
> +
> +	for (i = restore->restored_pages; i < nr; ++i) {
> +		struct page *p = restore->old_pages[i];
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			if (handle == 0)
> +				continue;
> +
> +			ret = backup->ops->copy_backed_up_page
> +				(backup, restore->first_page[i],
> +				 handle, ctx->interruptible);
> +			if (ret)
> +				break;
> +
> +			backup->ops->drop(backup, handle);
> +		} else if (p) {
> +			/*
> +			 * We could probably avoid splitting the old page
> +			 * using clever logic, but ATM we don't care.
> +			 */
> +			ttm_pool_split_for_swap(restore->pool, p);
> +			copy_highpage(restore->first_page[i], p);
> +			__free_pages(p, 0);
> +		}
> +
> +		restore->restored_pages++;
> +		restore->old_pages[i] = NULL;
> +		cond_resched();
> +	}
> +
> +	return ret;
> +}
> +
>  /* Called when we got a page, either from a pool or newly allocated */
>  static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  				   struct page *p, dma_addr_t **dma_addr,
>  				   unsigned long *num_pages,
> -				   struct page ***pages)
> +				   struct page ***pages,
> +				   struct ttm_pool_tt_restore *restore)
>  {
>  	unsigned int i;
>  	int r;
> @@ -369,6 +487,16 @@ static int ttm_pool_page_allocated(struct ttm_pool *pool, unsigned int order,
>  			return r;
>  	}
>  
> +	if (restore) {
> +		memcpy(restore->old_pages, *pages,
> +		       (1 << order) * sizeof(*restore->old_pages));
> +		memset(*pages, 0, (1 << order) * sizeof(**pages));
> +		restore->order = order;
> +		restore->restored_pages = 0;
> +		restore->first_page = *pages;
> +		restore->alloced_pages += 1UL << order;
> +	}
> +
>  	*num_pages -= 1 << order;
>  	for (i = 1 << order; i; --i, ++(*pages), ++p)
>  		**pages = p;
> @@ -394,22 +522,39 @@ static void ttm_pool_free_range(struct ttm_pool *pool, struct ttm_tt *tt,
>  				pgoff_t start_page, pgoff_t end_page)
>  {
>  	struct page **pages = &tt->pages[start_page];
> +	struct ttm_backup *backup = tt->backup;
>  	unsigned int order;
>  	pgoff_t i, nr;
>  
>  	for (i = start_page; i < end_page; i += nr, pages += nr) {
>  		struct ttm_pool_type *pt = NULL;
> +		struct page *p = *pages;
> +
> +		if (ttm_backup_page_ptr_is_handle(p)) {
> +			unsigned long handle = ttm_backup_page_ptr_to_handle(p);
> +
> +			nr = 1;
> +			if (handle != 0)
> +				backup->ops->drop(backup, handle);
> +			continue;
> +		}
> +
> +		if (pool) {
> +			order = ttm_pool_page_order(pool, p);
> +			nr = (1UL << order);
> +			if (tt->dma_address)
> +				ttm_pool_unmap(pool, tt->dma_address[i], nr);
>  
> -		order = ttm_pool_page_order(pool, *pages);
> -		nr = (1UL << order);
> -		if (tt->dma_address)
> -			ttm_pool_unmap(pool, tt->dma_address[i], nr);
> +			pt = ttm_pool_select_type(pool, caching, order);
> +		} else {
> +			order = p->private;
> +			nr = (1UL << order);
> +		}
>  
> -		pt = ttm_pool_select_type(pool, caching, order);
>  		if (pt)
> -			ttm_pool_type_give(pt, *pages);
> +			ttm_pool_type_give(pt, p);
>  		else
> -			ttm_pool_free_page(pool, caching, order, *pages);
> +			ttm_pool_free_page(pool, caching, order, p);
>  	}
>  }
>  
> @@ -453,9 +598,36 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	else
>  		gfp_flags |= GFP_HIGHUSER;
>  
> -	for (order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> -	     num_pages;
> -	     order = min_t(unsigned int, order, __fls(num_pages))) {
> +	order = min_t(unsigned int, MAX_PAGE_ORDER, __fls(num_pages));
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		if (!tt->restore) {
> +			gfp_t gfp = GFP_KERNEL | __GFP_NOWARN;
> +
> +			if (ctx->gfp_retry_mayfail)
> +				gfp |= __GFP_RETRY_MAYFAIL;
> +
> +			tt->restore =
> +				kvzalloc(struct_size(tt->restore, old_pages,
> +						     (size_t)1 << order), gfp);
> +			if (!tt->restore)
> +				return -ENOMEM;
> +		} else if (ttm_pool_restore_valid(tt->restore)) {
> +			struct ttm_pool_tt_restore *restore = tt->restore;
> +
> +			num_pages -= restore->alloced_pages;
> +			order = min_t(unsigned int, order, __fls(num_pages));
> +			pages += restore->alloced_pages;
> +			r = ttm_pool_restore_tt(restore, tt->backup, ctx);
> +			if (r)
> +				return r;
> +			caching = restore->caching_divide;
> +		}
> +
> +		tt->restore->pool = pool;
> +	}
> +
> +	for (; num_pages; order = min_t(unsigned int, order, __fls(num_pages))) {
>  		struct ttm_pool_type *pt;
>  
>  		page_caching = tt->caching;
> @@ -472,11 +644,19 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				r = ttm_pool_page_allocated(pool, order, p,
>  							    &dma_addr,
>  							    &num_pages,
> -							    &pages);
> +							    &pages,
> +							    tt->restore);
>  				if (r)
>  					goto error_free_page;
>  
>  				caching = pages;
> +				if (ttm_pool_restore_valid(tt->restore)) {
> +					r = ttm_pool_restore_tt(tt->restore, tt->backup,
> +								ctx);
> +					if (r)
> +						goto error_free_all;
> +				}
> +
>  				if (num_pages < (1 << order))
>  					break;
>  
> @@ -496,9 +676,17 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  				caching = pages;
>  			}
>  			r = ttm_pool_page_allocated(pool, order, p, &dma_addr,
> -						    &num_pages, &pages);
> +						    &num_pages, &pages,
> +						    tt->restore);
>  			if (r)
>  				goto error_free_page;
> +
> +			if (ttm_pool_restore_valid(tt->restore)) {
> +				r = ttm_pool_restore_tt(tt->restore, tt->backup, ctx);
> +				if (r)
> +					goto error_free_all;
> +			}
> +
>  			if (PageHighMem(p))
>  				caching = pages;
>  		}
> @@ -517,12 +705,26 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>  	if (r)
>  		goto error_free_all;
>  
> +	if (tt->restore) {
> +		kvfree(tt->restore);
> +		tt->restore = NULL;
> +	}
> +
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP)
> +		tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
>  	return 0;
>  
>  error_free_page:
>  	ttm_pool_free_page(pool, page_caching, order, p);
>  
>  error_free_all:
> +	if (tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP) {
> +		tt->restore->caching_divide = caching;
> +		return r;
> +	}
> +
>  	num_pages = tt->num_pages - num_pages;
>  	caching_divide = caching - tt->pages;
>  	ttm_pool_free_range(pool, tt, tt->caching, 0, caching_divide);
> @@ -549,6 +751,172 @@ void ttm_pool_free(struct ttm_pool *pool, struct ttm_tt *tt)
>  }
>  EXPORT_SYMBOL(ttm_pool_free);
>  
> +/**
> + * ttm_pool_release_backed_up() - Release content of a swapped-out struct ttm_tt
> + * @tt: The struct ttm_tt.
> + *
> + * Release handles with associated content or any remaining pages of
> + * a backed-up struct ttm_tt.
> + */
> +void ttm_pool_release_backed_up(struct ttm_tt *tt)
> +{
> +	struct ttm_backup *backup = tt->backup;
> +	struct ttm_pool_tt_restore *restore;
> +	pgoff_t i, start_page = 0;
> +	unsigned long handle;
> +
> +	if (!(tt->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return;
> +
> +	restore = tt->restore;
> +
> +	if (ttm_pool_restore_valid(restore)) {
> +		pgoff_t nr = 1UL << restore->order;
> +
> +		for (i = restore->restored_pages; i < nr; ++i) {
> +			struct page *p = restore->old_pages[i];
> +
> +			if (ttm_backup_page_ptr_is_handle(p)) {
> +				handle = ttm_backup_page_ptr_to_handle(p);
> +				if (handle == 0)
> +					continue;
> +
> +				backup->ops->drop(backup, handle);
> +			} else if (p) {
> +				ttm_pool_split_for_swap(restore->pool, p);
> +				__free_pages(p, 0);
> +			}
> +		}
> +	}
> +
> +	if (restore) {
> +		pgoff_t mid = restore->caching_divide - tt->pages;
> +
> +		start_page = restore->alloced_pages;
> +		/* Pages that might be dma-mapped and non-cached */
> +		ttm_pool_free_range(restore->pool, tt, tt->caching,
> +				    0, mid);
> +		/* Pages that might be dma-mapped but cached */
> +		ttm_pool_free_range(restore->pool, tt, ttm_cached,
> +				    mid, restore->alloced_pages);
> +	}
> +
> +	/* Shrunken pages. Cached and not dma-mapped. */
> +	ttm_pool_free_range(NULL, tt, ttm_cached, start_page, tt->num_pages);
> +
> +	if (restore) {
> +		kvfree(restore);
> +		tt->restore = NULL;
> +	}
> +
> +	tt->page_flags &= ~(TTM_TT_FLAG_PRIV_BACKED_UP | TTM_TT_FLAG_SWAPPED);
> +}
> +
> +/**
> + * ttm_pool_backup_tt() - Back up or purge a struct ttm_tt
> + * @pool: The pool used when allocating the struct ttm_tt.
> + * @ttm: The struct ttm_tt.
> + * @flags: Flags to govern the backup behaviour.
> + *
> + * Back up or purge a struct ttm_tt. If @purge is true, then
> + * all pages will be freed directly to the system rather than to the pool
> + * they were allocated from, making the function behave similarly to
> + * ttm_pool_free(). If @purge is false the pages will be backed up instead,
> + * exchanged for handles.
> + * A subsequent call to ttm_pool_alloc() will then read back the content and
> + * a subsequent call to ttm_pool_release_shrunken() will drop it.
> + * If backup of a page fails for whatever reason, @ttm will still be
> + * partially backed up, retaining those pages for which backup fails.
> + *
> + * Return: Number of pages actually backed up or freed, or negative
> + * error code on error.
> + */
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> +			const struct ttm_backup_flags *flags)
> +{
> +	struct ttm_backup *backup = ttm->backup;
> +	struct page *page;
> +	unsigned long handle;
> +	gfp_t alloc_gfp;
> +	gfp_t gfp;
> +	int ret = 0;
> +	pgoff_t shrunken = 0;
> +	pgoff_t i, num_pages;
> +
> +	if ((!get_nr_swap_pages() && !flags->purge) ||
> +	    pool->use_dma_alloc ||
> +	    (ttm->page_flags & TTM_TT_FLAG_PRIV_BACKED_UP))
> +		return -EBUSY;
> +
> +#ifdef CONFIG_X86
> +	/* Anything returned to the system needs to be cached. */
> +	if (ttm->caching != ttm_cached)
> +		set_pages_array_wb(ttm->pages, ttm->num_pages);
> +#endif
> +
> +	if (ttm->dma_address || flags->purge) {
> +		for (i = 0; i < ttm->num_pages; i += num_pages) {
> +			unsigned int order;
> +
> +			page = ttm->pages[i];
> +			if (unlikely(!page)) {
> +				num_pages = 1;
> +				continue;
> +			}
> +
> +			order = ttm_pool_page_order(pool, page);
> +			num_pages = 1UL << order;
> +			if (ttm->dma_address)
> +				ttm_pool_unmap(pool, ttm->dma_address[i],
> +					       num_pages);
> +			if (flags->purge) {
> +				shrunken += num_pages;
> +				page->private = 0;
> +				__free_pages(page, order);
> +				memset(ttm->pages + i, 0,
> +				       num_pages * sizeof(*ttm->pages));
> +			}
> +		}
> +	}
> +
> +	if (flags->purge)
> +		return shrunken;
> +
> +	if (pool->use_dma32)
> +		gfp = GFP_DMA32;
> +	else
> +		gfp = GFP_HIGHUSER;
> +
> +	alloc_gfp = GFP_KERNEL | __GFP_HIGH | __GFP_NOWARN | __GFP_RETRY_MAYFAIL;
> +
> +	for (i = 0; i < ttm->num_pages; ++i) {
> +		page = ttm->pages[i];
> +		if (unlikely(!page))
> +			continue;
> +
> +		ttm_pool_split_for_swap(pool, page);
> +
> +		handle = backup->ops->backup_page(backup, page, flags->writeback, i,
> +						  gfp, alloc_gfp);
> +		if (handle) {
> +			ttm->pages[i] = ttm_backup_handle_to_page_ptr(handle);
> +			put_page(page);
> +			shrunken++;
> +		} else {
> +			/* We allow partially shrunken tts */
> +			ret = -ENOMEM;
> +			break;
> +		}
> +		cond_resched();
> +	}
> +
> +	if (shrunken)
> +		ttm->page_flags |= (TTM_TT_FLAG_PRIV_BACKED_UP |
> +				    TTM_TT_FLAG_SWAPPED);
> +
> +	return shrunken ? shrunken : ret;
> +}
> +
>  /**
>   * ttm_pool_init - Initialize a pool
>   *
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 4b51b9023126..f520b8c93f03 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -40,6 +40,7 @@
>  #include <drm/drm_cache.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_util.h>
> +#include <drm/ttm/ttm_backup.h>
>  #include <drm/ttm/ttm_bo.h>
>  #include <drm/ttm/ttm_tt.h>
>  
> @@ -158,6 +159,8 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>  	ttm->swap_storage = NULL;
>  	ttm->sg = bo->sg;
>  	ttm->caching = caching;
> +	ttm->restore = NULL;
> +	ttm->backup = NULL;
>  }
>  
>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
> @@ -182,6 +185,12 @@ void ttm_tt_fini(struct ttm_tt *ttm)
>  		fput(ttm->swap_storage);
>  	ttm->swap_storage = NULL;
>  
> +	ttm_pool_release_backed_up(ttm);
> +	if (ttm->backup) {

Sorry for the conflicting comments in the last rev, but my last one here
[1] regardind making this fully driver-owned didn’t receive a response.
I’ll state it again: Do you think the backup fini should be owned by the
driver? This would allow the driver to use a global backup for all TT if
it wanted to. It would also make it consistent in the sense that the
driver would own both the allocation and fini of the backup.

Matt

[1] https://patchwork.freedesktop.org/patch/602165/?series=131815&rev=6#comment_1104556

> +		ttm->backup->ops->fini(ttm->backup);
> +		ttm->backup = NULL;
> +	}
> +
>  	if (ttm->pages)
>  		kvfree(ttm->pages);
>  	else
> @@ -253,6 +262,34 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL_FOR_TESTS_ONLY(ttm_tt_swapin);
>  
> +/**
> + * ttm_tt_backup() - Helper to back up a struct ttm_tt.
> + * @bdev: The TTM device.
> + * @tt: The struct ttm_tt.
> + * @flags: Flags that govern the backup behaviour.
> + *
> + * Update the page accounting and call ttm_pool_shrink_tt to free pages
> + * or back them up.
> + *
> + * Return: Number of pages freed or swapped out, or negative error code on
> + * error.
> + */
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags)
> +{
> +	long ret;
> +
> +	if (WARN_ON(IS_ERR_OR_NULL(tt->backup)))
> +		return 0;
> +
> +	ret = ttm_pool_backup_tt(&bdev->pool, tt, &flags);
> +
> +	if (ret > 0)
> +		tt->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
> +
> +	return ret;
> +}
> +
>  /**
>   * ttm_tt_swapout - swap out tt object
>   *
> diff --git a/include/drm/ttm/ttm_pool.h b/include/drm/ttm/ttm_pool.h
> index 160d954a261e..3112a4be835c 100644
> --- a/include/drm/ttm/ttm_pool.h
> +++ b/include/drm/ttm/ttm_pool.h
> @@ -33,6 +33,7 @@
>  
>  struct device;
>  struct seq_file;
> +struct ttm_backup_flags;
>  struct ttm_operation_ctx;
>  struct ttm_pool;
>  struct ttm_tt;
> @@ -89,6 +90,11 @@ void ttm_pool_fini(struct ttm_pool *pool);
>  
>  int ttm_pool_debugfs(struct ttm_pool *pool, struct seq_file *m);
>  
> +void ttm_pool_release_backed_up(struct ttm_tt *tt);
> +
> +long ttm_pool_backup_tt(struct ttm_pool *pool, struct ttm_tt *ttm,
> +			const struct ttm_backup_flags *flags);
> +
>  int ttm_pool_mgr_init(unsigned long num_pages);
>  void ttm_pool_mgr_fini(void);
>  
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 2b9d856ff388..e42a75cff502 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -32,11 +32,13 @@
>  #include <drm/ttm/ttm_caching.h>
>  #include <drm/ttm/ttm_kmap_iter.h>
>  
> +struct ttm_backup;
>  struct ttm_device;
>  struct ttm_tt;
>  struct ttm_resource;
>  struct ttm_buffer_object;
>  struct ttm_operation_ctx;
> +struct ttm_pool_tt_restore;
>  
>  /**
>   * struct ttm_tt - This is a structure holding the pages, caching- and aperture
> @@ -85,6 +87,9 @@ struct ttm_tt {
>  	 * fault handling abuses the DMA api a bit and dma_map_attrs can't be
>  	 * used to assure pgprot always matches.
>  	 *
> +	 * TTM_TT_FLAG_PRIV_BACKED_UP: TTM internal only. This is set if the
> +	 * struct ttm_tt has been (possibly partially) backed up.
> +	 *
>  	 * TTM_TT_FLAG_PRIV_POPULATED: TTM internal only. DO NOT USE. This is
>  	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>  	 * then unset when TTM calls ttm_tt_unpopulate().
> @@ -96,6 +101,7 @@ struct ttm_tt {
>  #define TTM_TT_FLAG_DECRYPTED		BIT(4)
>  
>  #define TTM_TT_FLAG_PRIV_POPULATED	BIT(5)
> +#define TTM_TT_FLAG_PRIV_BACKED_UP	BIT(6)
>  	uint32_t page_flags;
>  	/** @num_pages: Number of pages in the page array. */
>  	uint32_t num_pages;
> @@ -105,11 +111,19 @@ struct ttm_tt {
>  	dma_addr_t *dma_address;
>  	/** @swap_storage: Pointer to shmem struct file for swap storage. */
>  	struct file *swap_storage;
> +	/**
> +	 * @backup: Pointer to backup struct for backed up tts.
> +	 * Could be unified with @swap_storage. Meanwhile, this is
> +	 * a driver-owned field.
> +	 */
> +	struct ttm_backup *backup;
>  	/**
>  	 * @caching: The current caching state of the pages, see enum
>  	 * ttm_caching.
>  	 */
>  	enum ttm_caching caching;
> +	/** @restore: Partial restoration from backup state. TTM private */
> +	struct ttm_pool_tt_restore *restore;
>  };
>  
>  /**
> @@ -230,6 +244,21 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>  struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>  					    struct ttm_tt *tt);
>  unsigned long ttm_tt_pages_limit(void);
> +
> +/**
> + * struct ttm_backup_flags - Flags to govern backup behaviour.
> + * @purge: Free pages without backing up. Bypass pools.
> + * @writeback: Attempt to copy contents directly to swap space, even
> + * if that means blocking on writes to external memory.
> + */
> +struct ttm_backup_flags {
> +	u32 purge : 1;
> +	u32 writeback : 1;
> +};
> +
> +long ttm_tt_backup(struct ttm_device *bdev, struct ttm_tt *tt,
> +		   const struct ttm_backup_flags flags);
> +
>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
>  
> -- 
> 2.44.0
> 
