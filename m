Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CE2C9F172
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E6E10E7D5;
	Wed,  3 Dec 2025 13:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BRa5ICTn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012061.outbound.protection.outlook.com [40.107.209.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B07010E7CF;
 Wed,  3 Dec 2025 13:14:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZ9EFfgxJzsK/7egSfZ2c1Rf4LRgy5QBpNTv2n2lxDtLPixY6TnbkdRsZEb38TF6TQDqchbQJ7yw6pEW3kZNs6f0mVc/SY8UQIqdq+XQjq00zdxLuaRdB/m1/gHG5GKCVPQPOiy3ztEPmlXhfwLozeTigtaBdUIbzzBrkX5eyhAK4f88IQBs2xY4VvG/BQVwJpf7Vnr8nHcZXbpmNSJIrIrA/HfzkerVV+J7mmM60UolHeRaHj6ntARRToBQsAwsnnkPhWIfJJ70gz2egKsOs4NrAvfNZbVbbvgcDtWyoDn+RRFUj0luB0Nsfr2daX2sHNJS9V7Hht7ZJlvHhLRQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=485duK5wW/AaXo6F52Qr0KyyXILC+zEwxNA5mE1j40o=;
 b=VOXuOcQ3N2vjeBeFTVpw11cxQh2uZbx7icVQ5kb2vI6qiTg8GZ+06+CX5FEoeEz/kTcx0WU7L1oNkl/KE08+kskMNBWxn7coy2rVaxg7JSPRmwUqACNY4vmXc9Ol2I/j7cgpABqqMtU+43CircgLtlWw3DoR9o601zYnZVO4YSjHen0f232nsFIdQM4has9FSF6nk5GAq2GbbjlLjzebj1s/0KS6CtI97bLOCwmRi5JCzFW/S4ALWbMDakTfibdVhNDOCv+OZd6hxrFiV6iS/asj531Goq7DwtgFkFlOjlPKAIIBxGX+pq6GJM6vUgX0BhzhQUC1ZfGHJpqhBlJF7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=485duK5wW/AaXo6F52Qr0KyyXILC+zEwxNA5mE1j40o=;
 b=BRa5ICTnYCtCwVUIUEWk7x830+hY3LPvWWuMoB0lwpVM59t2ir4Di5p/jIna65RcQRn819DI3GijFyXFeBFlRQi1xXPel208EGwGvzFVEI1RV600dUmzqW3i+X4w+FQS01pwL9YpDDmN4D3T9ep4StTeu+JptilzVXxhrxe4jew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB7824.namprd12.prod.outlook.com (2603:10b6:a03:4c4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 13:14:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:14:21 +0000
Message-ID: <2fc7bb8e-aa0f-47c8-adf8-61e70d8c5689@amd.com>
Date: Wed, 3 Dec 2025 14:14:11 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/xe: Use dma_fence_check_and_signal_locked()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-6-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-6-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB7824:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e5ad84f-8810-43fb-7a62-08de326ddf29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHhUVWdKRUsyY0NBMUMrM1c0OHQrcll5cHdLbDl4RUpPRCtFUUdSWFBzcnBO?=
 =?utf-8?B?R0JmOGFKK1ZjRGhHY3pyK2hpMXZoVklYcUFiaTVvcEtpOEVRbGlSMThObWZK?=
 =?utf-8?B?SVZ1d05ydm9ESUV6Sk55UjcvUkhCTFN1REthOEprYXgvRjJWbXhWL3l4d3dL?=
 =?utf-8?B?UHdXdHI1NEpBSXdudHlVUEozanV5NktlQURhVDZzQ2FwSTBpMjB5dVJuN3A1?=
 =?utf-8?B?REx2aEpLNHRvZ0c4Y2ExTEtWbnk3ZHNtNXlaTVVGc2VxN1pYYm5aNklHKzM1?=
 =?utf-8?B?MWFsYVNkK3ZnMENhK2dWZzBueHJENDlZaGozcHhnS1M1dTIxeG4zMTFsL0dR?=
 =?utf-8?B?UWRueW4wVlh0cDVUVngxZnZRazhkdG84eGZKR1VaYStNcmp4T2orRGptS1hu?=
 =?utf-8?B?bVRkbEYzU3NiN2ZIcjd6aTM0bUx1OVYvQmlxV3ZxSUJVT2cwZWN6WnVQNnd1?=
 =?utf-8?B?eW9ZMXY3TEhIZW0rTmNPbW5Xbm9vMFliVDBQYmJnRkM1RFNPUWpMT095QWcy?=
 =?utf-8?B?WDI2cWV3bE41SzJ5a2VDTzJaQ1JzQlozRWkrNGN2K2ZaNTdTRTdwSThaR2RX?=
 =?utf-8?B?c0kxVS9NTlpjdTN1VjFwTFA1MnhEM09sRUlsMUIzVmg0a1JuOC9GckpvNndn?=
 =?utf-8?B?Q3NHZlE5cG10R2l6RlhmTHYvcExZY0VEWFZTS2pHY2Uyb2pBUWIyWjQ1NUtI?=
 =?utf-8?B?Sm1HQVBMNlVTQjZnNndQa3IvaXRYakRzTUMzK0tsc2dETWJKWkp3YU5nNnlm?=
 =?utf-8?B?blNYK29WeWcwZ3pvTm1MT1hZNzRpTE81MXBxd0s2VFNYc2pMRXBMaTVHdTBy?=
 =?utf-8?B?M0xjWXJvUlNJL201NTVBSGxOcFZ2VlIrZkFSZEc0aWJyY1hDTUd3VEVSakpl?=
 =?utf-8?B?R2E2UnRRbS9rRy9qMnBTTWl3UnU4bmRFeXFGZVR4RGV3ZmR3b2VKR2ZLWkpV?=
 =?utf-8?B?TDBDZHVuK3BZOUQzVEhBZVF0ZldzeDBra2JjK1hFRVVjTU1NaFlRRWliUnRl?=
 =?utf-8?B?aEdEMXd6OGE1RTYxK1BoSUo5NkcvRUw5OHRCakR0U1lVZFowRHJvd0NmeEky?=
 =?utf-8?B?ZkxVcDI0OGJaYTlUUkRvb2hvUE4wN1NIYU8xY0NFK0JrMkpMZGU3WmpPZFRo?=
 =?utf-8?B?VWVXNGRqWFlUZzBKc0U1VFpkUXB6SHVHYktPTkFzOEx3MktQcjQyVzlXV0Yv?=
 =?utf-8?B?c0REUUpyWk9FUnNCOFdibEZocnExdDB0Rk11UEJRMGlLWHBJUE1QMWtsVCtG?=
 =?utf-8?B?SS92KzQwc24zMG5XSVE5bm5NaEdmNWVxclNpZjBtdTNwUW51ekhKVnFCNHQ3?=
 =?utf-8?B?Ym9VRWpyTDdZWjdJUlc1Wko5T1JIWFlvZGtEcGJGRlR3U1ppUHIvaE5VRURV?=
 =?utf-8?B?YjVHYWpaQ1hHNVNWUUIzT1lqb1ZoQzFEVEhldk5paWRjOGVQRmxtcWlGaCth?=
 =?utf-8?B?TFZONUplNVRBL2FLRkpVcGMzNW1uZFFxWjhTdEE5MkxFTUU0aHJqdTFjWkd3?=
 =?utf-8?B?OXhxTFRBY0NvQ05lSVkxVDIra05OdG05ODhSQUlIMlFrWTc2cmo5OXRCak9w?=
 =?utf-8?B?cmdGTXZFb3Y4L0ppenhMK2Fzbnl3OVYzNUZnMkNrQVFIQ0RDK1ExSjhibVNz?=
 =?utf-8?B?NTgyMHVjZkN3Y0I5YjRYbDFkWG44Zk5aUXJDR3hYcHFYRTB5bnNqM0JBbXlN?=
 =?utf-8?B?ZVZMN0RreTh3bzNITWdNektJTEtNd3duN0hDZTBBNndJVzJlWlRWdXBHemdr?=
 =?utf-8?B?NlpCWjI4SWtwNlNPQkk1V0dCdEdta3JyS1VrM1FkQVpvaGtSajdLQWswLzFa?=
 =?utf-8?B?QzhMOG1YL2RCUkZ6amkrYVhlU0xaem5keGNYUHg0dk1nREUvWG44SnBBYkNi?=
 =?utf-8?B?ZjlyM2c4VTNOTWlHNS8wZkxDMmlMVzYzTW1sRVVlSmJFUlNLUnBZSkdFUmRD?=
 =?utf-8?B?WFBQOUkrek85YmphMkxScWdxdVZ0bWhsYmdxbCticHA0SHJiV0RLUTczZGtP?=
 =?utf-8?Q?VSONLrAb2FJztmcgCwIyO9ceJ4CDj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUJSVnBkWXNpZElNbFRGMXVCRUU3aVdNc3Rock9IV3FJVEdBK01odnVxN1ht?=
 =?utf-8?B?a3VBNk9XUUxjazZ6NzhJdVlEdWhhVTExR1hEc1V4bXQ1T1BUSjM2VTJVM3JR?=
 =?utf-8?B?bDVZYS8xR1lTQndxREJIc2xOV2R0OVZzYVErSG81SERpNlJBa2w0TnJ5QXZq?=
 =?utf-8?B?U1QyN0o4R3grRm9JeFZVdXNaWHBzY2NTcUlGalFOcGhXYzdseEpDdEJDZS8x?=
 =?utf-8?B?RlhMWG5POHdLN1V5UERBOUZmenU4Rk9LQnpKemJ3VVc5b3dmVkI0S2F4Z3ZB?=
 =?utf-8?B?cU0rYmFRZVNGSGJsS01saDczZ3poTktvT3g4M1hpU240Qmsxb0J0WDZUd05X?=
 =?utf-8?B?K0pPTU1BUUxaZlRsU0labE1pOEJjbUlLOEt4bE5POXlVOUJLdmdGVzkxQ25t?=
 =?utf-8?B?WHZkRmYzVzRYS2t3M2gwbmpvcHVnbFRkS3pFNHN4NVlqN2JtaGFIdHVWdEJn?=
 =?utf-8?B?SUN3aFhOeEVaajRDMzk3TlAvZUhxV1JIWjFYb0x2Zzk5SWp6Q2FVRmhUYWNz?=
 =?utf-8?B?b1FrczBYa3hJZ1BjVktXK1Q4QTV1UXFnVjRzVW9vWFdRUjIvaU00UjE4bXpB?=
 =?utf-8?B?Q2V4QW5Gd29BYUZSR2tMc0dsbDhKSG9zMmE1dnZvMU9TdlkxbnNNemY0K0Fs?=
 =?utf-8?B?c3JRU3ZlcDFYMjh4Vm9pRktYcGVXSEVNeVRwRUE2OE43Y2MzWFRGNms5bzJC?=
 =?utf-8?B?T085ajUzRG1SYkhNTmx4RkdWQkxLUi9acVBZRTRtajJRLzRLdFNSa2JaeHgr?=
 =?utf-8?B?Vy8zdGdPaGsvemdnbmkxQmhubk8zK3B6b3hPZmRGTXp4VnZTczRzb1EyTzVm?=
 =?utf-8?B?SS9XdG5TRW5wbmk3R1dXRVRSQ2tnU2xBTW9sMVlQemJ4bVY1eGxKN0JJYWx6?=
 =?utf-8?B?S3RjaWYwSGc4MWlIQXJkNHJFMVAwQXVBUUtqTXBYb1k3TmRaME5VNE5WYmRS?=
 =?utf-8?B?S0xYelVNem1OMDlXNXZRbmdWV2c1YTlGUmFCZlBMcUY3N21jckdjMFBJakJ4?=
 =?utf-8?B?bmh6UFZ6bnEyV1NYN1NJc3piOTZpczJLTnp3UGs3Yi84TjlEc0U5Z0FZTWpE?=
 =?utf-8?B?azhUZ1Nvc002TUcrZXFQUzZUM1BhNlRKSTZjbXc4SWRMc2piNXFtYzlrMTQ4?=
 =?utf-8?B?WTZkdE9pUlFkOE1PT2gwZktvamJzTjNRSVpTOEZ4R1pwTWpEb0c4Uzg1dnJO?=
 =?utf-8?B?b011VG5HY2VDVzJXak5nTzEwR3ZTb21XL3NRRXNZNW9vVGNhWE14c3gxZTkx?=
 =?utf-8?B?Uk9ibWFnd2pkeU9DTk9leWcrMHBnRnRTenJ2aE1LbXpFamhaTmRRZEV4Vi9Q?=
 =?utf-8?B?MGJIdEVrSlJMb3duUFFjdnREZm51YWdCK1dYZCszckd0MWpLNTcrZVhUWTFO?=
 =?utf-8?B?ZlcvMTd6MlRsZTEvaW5RR2tPRURvV2xseGhqYUdNdlpsK0RVQWdwRlJvbDJa?=
 =?utf-8?B?MVp3MW4vRjhEU0lpUEtackNqV0pQVTNOKzRucXowbms3NnpUZHNUTmJ2YjJY?=
 =?utf-8?B?dHV1MTFMUUFuWWtUYkdyWEptQk1XNVV5VXVJcjJnTTRiV0ZmUUtDU0drYU1y?=
 =?utf-8?B?QmVJclRmNVVKNFJlRnoyV0ZLcG9HUTNSL1h1RUhZNENsdDBoYjdUc0h3TGxK?=
 =?utf-8?B?S1hVVU1tZ2JWRW5aS3NjZnllM25yaGpPU0dyM0lrS3UwQk1RWlF2RTFHMkN1?=
 =?utf-8?B?dG9DaEYzTjgyZjYzeFZnVFVqVElHWTJQdExKWGYxbEVZM0tDWlp1ZHlJUFJG?=
 =?utf-8?B?OG5ZSUxLNG40ckZxbG5GMmlHNHBZZ29vQ0I5bzdHKzI2cHN2SGFBdndvR2th?=
 =?utf-8?B?cGhTdVlNREZKSEFFd2NJYTAyK2RQR0M4alRTM2FxaW0zbzN3bC9ZT0tBejhu?=
 =?utf-8?B?a2JSUEFwQ21FaXBYZGxtbWd6Z1QyRnpkek15Sk41MStiVTlYMVU1OVJwQWxL?=
 =?utf-8?B?OVUvMDRnVjFOL0xKbDNsMzkrbXFyZDNDaTRCa2hPU1duOXZvdVJoaW5uVk1F?=
 =?utf-8?B?YlZtT2JidUh5eExDdVVDMXc3dk8vNXhmOWhtdC9BeDU2amNiMy9lWTdDVkdw?=
 =?utf-8?B?UXMzM3hqelp0MG9QanZKclRrYkNRbXlUVExNQWVXeVRUSnlHRkVlbTJYRGth?=
 =?utf-8?Q?DZlRjsWar2VOVtWb964W1FI1R?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e5ad84f-8810-43fb-7a62-08de326ddf29
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:14:21.1376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jmP1ZWnihw5IylEAUWDw1r/wxrSS44sdFU28Os3L1XbQB8ebRAOwBWsoH65fDFtd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7824
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

On 12/1/25 11:50, Philipp Stanner wrote:
> Xe is one of the few users utilizing the return code of
> dma_fence_signal() to check whether a fence had already been signaled by
> someone else.
> 
> To clean up and simplify the dma_fence API, the few kernel users relying
> on that behavior shall be ported to an alternative function.
> 
> Replace dma_fence_signal_locked() with
> dma_fence_check_and_signal_locked().
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/xe/xe_hw_fence.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> index b2a0c46dfcd4..f6057456e460 100644
> --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> @@ -85,7 +85,6 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  {
>  	struct xe_hw_fence *fence, *next;
>  	unsigned long flags;
> -	int err;
>  	bool tmp;
>  
>  	if (XE_WARN_ON(!list_empty(&irq->pending))) {
> @@ -93,9 +92,8 @@ void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq)
>  		spin_lock_irqsave(&irq->lock, flags);
>  		list_for_each_entry_safe(fence, next, &irq->pending, irq_link) {
>  			list_del_init(&fence->irq_link);
> -			err = dma_fence_signal_locked(&fence->dma);
> +			XE_WARN_ON(dma_fence_check_and_signal_locked(&fence->dma));
>  			dma_fence_put(&fence->dma);
> -			XE_WARN_ON(err);
>  		}
>  		spin_unlock_irqrestore(&irq->lock, flags);
>  		dma_fence_end_signalling(tmp);

