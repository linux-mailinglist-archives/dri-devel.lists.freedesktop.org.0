Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86213A041AE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 15:09:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B405E10E24F;
	Tue,  7 Jan 2025 14:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="smwWw3oH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9010E24F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 14:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qrj02mawdG1F5agjzAlWuYQfPZdjqHnfPgFCtxquCejSzs+rk4IWHdeYTzjczI7fdCFq6xZzyyPq6lNtvDNMo3FM4keehWOqdQDfUafLMJe9NSP18cZZmlNPb45eHKcBQyXtQ40l5fnwHO/zD11jLeLO/scAF7dodkeOmvxTKJZYynKehnGO/chJNP7o33AJ0UVBhTMHW75PFnAZj+UTRb9bD8N5ppLekgC66rpKRyMcEt+uQfMy7YxdNdmD+85QuqdfuQfXmlATQ26DGU6+iYakoJCtmvyf2gaD+F2Yvp3M+FBk9Je5xgG8fY7P+X/CJMZNgKdCD/vm41Kg7lTkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caG0zKNZPqJobBM0tmm0J+bSKKhEdvqg4rZj9Teq5jk=;
 b=fHrrGxXEPLYCnwy+fodc7PyREgVH2SZQEev5ab+534eR68GGo2ZE80+OoH8WnhGXYlNbgxqXSrZG8i0ZhPb/+7FjnBhzvp26VqvU5b4CBbU0+TrzSvzpxzIl43XBRhXsCbg/4NWV9Nssd/kwfrni5jyNz1gsi7v/rtnP1F2ZMIrFbn1OVQBV1YNKlzVkC8tvUeXRzoj9FQPpBoF6GFzpMfcUQhykNkFXCjtusSDKDemwxaNK/GClQH8Fu6Tm5nCNnp/mcfGsVumt8bTCQxLlmB+ZbSOcPFNiwyfalbqF+SaDrYR+ENZxTY96yItrnBH3i14zjySF3pmlR8VEWTxYbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caG0zKNZPqJobBM0tmm0J+bSKKhEdvqg4rZj9Teq5jk=;
 b=smwWw3oH2mvYGlXpIPocI7pibrSmBqOmETe7NtL1te7DiYoYnClYkhtmPPD8jZYDuOTvR0t6uIn7Tp3M722cD24gYGrOzMN+Xgnl2CwjcpDbS2mAjbydEe2i8LV+TqltrXUJ6ERZLPdcBMMfvzcdU2TzlUZNhKxqRq4QHbSmi3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB9276.namprd12.prod.outlook.com (2603:10b6:8:1a0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 14:08:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Tue, 7 Jan 2025
 14:08:51 +0000
Message-ID: <942c02f2-6496-4406-a73b-941d096aadfb@amd.com>
Date: Tue, 7 Jan 2025 15:08:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Fix amdgpu crash upon suspend/resume
To: Philipp Reisner <philipp.reisner@linbit.com>,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, Nirmoy Das <nirmoy.das@amd.com>,
 Simona Vetter <simona@ffwll.ch>
References: <20250107140240.325899-1-philipp.reisner@linbit.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250107140240.325899-1-philipp.reisner@linbit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0142.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB9276:EE_
X-MS-Office365-Filtering-Correlation-Id: 7115625b-0c1e-4344-0544-08dd2f24d006
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NHg1VU1FTXR6ZytrcjU4eUo0VmhjN1pudnFPU21NMndvV0pMbGFRNW5YeWNm?=
 =?utf-8?B?SURhZkRXZjFYcVhMaTF6RWs2d21CaHRueUJxZVkzdWo3b2N2R2kwT0lYMlIx?=
 =?utf-8?B?YWZkanhsQm1VVXFhNHh6Y0pZT3JBcEdqVFlpcmtyZmhBQktjM2RmTnhYRDZa?=
 =?utf-8?B?dHFydnpkMG9MaHVoZ3NycUtrd1V3ZG1Xd0orRWNwRUJRSlpNMEZqbVlBS3JD?=
 =?utf-8?B?Y3pqWXFHYTJVRXBsdXJvbVhVa3pFOUN6UUJoRmpFRHlPdjIyZ0V6RGRFNzdQ?=
 =?utf-8?B?MTlxb3c5WDAwZU1kZXRKQkJrTUs5MGR6VVRSbXUxaE1nWDN3RXA4cHAxNmVQ?=
 =?utf-8?B?dUVqb1FOL0NsdGw4M1VDNlhVUzJtWHg2ZE1venVUdSthbFNyRXVBTzd5V2RB?=
 =?utf-8?B?VkNOOWpRTVA5Y3p5enNodDZ2SmVaTWtjRmo5VHd5OSttZlNpbXVJWTJ2YmNt?=
 =?utf-8?B?VzB2UzRqV1BRSTFLMHBRcjJUUURZZXNYc3NwLzNsMmFJOVVnRGV3dnZob0hn?=
 =?utf-8?B?QU1yYmVBa0syRVNwQmREZkRnb3QzenVlYVoyTUREUGszdllmRHJIMkcxU2Y1?=
 =?utf-8?B?TjY3bTREZm53NWdrakNLWVlTOWFNTStqOGlBR0dkNDJudWdrWkhNbGd4TDY5?=
 =?utf-8?B?S0NUMUx0d085NFVXS1Z0MWlZWVZqa29lNTNmTTRQWUhUYWw0Z2lScW1QcXZi?=
 =?utf-8?B?K2FNZTRsNjVpUnBHaDJOREhicDFBZlhsdGVDL0M3aXhpV1FvWjZaOGl0c3Jj?=
 =?utf-8?B?L2xZd3dCTmdyTmxQVkJzYUNVMlBkMmZrUE9ZRTJJdDdhdVNvRmZteWNFZlRY?=
 =?utf-8?B?TmUyajRoNkRGRjMrdXgvN1BWUTAyUzBPbWtnaEVCV1l0THpYU0JZK1B4WEtR?=
 =?utf-8?B?dzNvYkVrWkp5a3hPbjgzek1CWEtUY0N5WTlLQVRFbElJencrMVRlWDdTVEtL?=
 =?utf-8?B?MW40U1hleWJmZEUwOUV2R0F1RlVLSCs5V0N5UWVxUFpHVHZwM3RqUlBOSzh2?=
 =?utf-8?B?cnFwUkY4RW5HY1N3SDFOVjZobDRld3VVN05GNmEwV3Y4dDVjMXVYWDI2Um16?=
 =?utf-8?B?ZFVDSXZYL0ttKzJkZmUyN0VNelY4dVRpSGl6b3hnQzBTVjcrYVdFczVIR2F5?=
 =?utf-8?B?VGppQzRZWllyY1J6VVA1M1dIdlZBb0UzTmlzeGxVRmlwR0d4U2VQZWZDZU90?=
 =?utf-8?B?bGROSUMwS0RQT3lVcm1idi95WWVWWXY4WGFDcWhPSkZUYzljYmVtQmxSRUtG?=
 =?utf-8?B?RTE3NFF2QjdFZHVpZEpETUZITjRCRmhQUDhZZWI4bnY4cDBWL1RZdVgyRFZr?=
 =?utf-8?B?UGpiTnY3UjIzQzV4ckF4V0dDd0Y5RDBzZUY3emFzbUtSS293dTBlVi9MeDJM?=
 =?utf-8?B?alBWSC9SN1YxSGs4dFlkcUx2SlFIS0R4RjVPaDR6aVBlMlc0SFhKTis1ZzRZ?=
 =?utf-8?B?REFyTVBneGNBN3hyVjdZeDJxcnlFcnpHWnNCd3JHOWt2cmNMSGxVNDd1T3p4?=
 =?utf-8?B?Tm41QlhPZ1N3TDlLS2xWL2dkVmhDVFR3VEtHNENhRmZFU1FWZVhzK3AwWTI5?=
 =?utf-8?B?a3pYNThHdWRDUnRCaVBSZC95WUdNSmsrV09pQWF2bld6NHh1RnNudnJCOHNu?=
 =?utf-8?B?MUFaR2hWUWlNam1vRVFad1FSVmNpTG8zYjhoWnpBdUZxeFJtZGF5SG5BcDRF?=
 =?utf-8?B?V0RsZkgvVFFQOGJtWFNCTytQdy9ZQnI1NVdtRFVVRUltK1ZZTGlBUW5iRU11?=
 =?utf-8?Q?b3JpS49uK9H0oWzB16Pg4Rx+WgA5CO8n2ztufWD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVBZTUc2ZlJwTVppcm90N3RpQ2pxTDMvYXBob3ZTcWo5bi84dHZoOXFNT1VC?=
 =?utf-8?B?cVRNajZ3UGJjZk9CbG5nck9DMXB0cFZabzBadzMrQ2FKYlJqdFRxVTMwUVk5?=
 =?utf-8?B?QnAwMTU5eHRRVit6aS9mQkNpazkxcVB6bGJSekM0YnFqNzhVMXZYV21SL0hk?=
 =?utf-8?B?aTJlRlVDSU9uVVAvcVBPUVF6bE9UNEJYc1VPYlpNUXhVb3B3UlY5TmVYYXhM?=
 =?utf-8?B?M2haa0E1YnBTMC9FeXgvN3JQbWFKNy9NRzNlNEwvZTFrOU4vVHUyRDNyVEtG?=
 =?utf-8?B?aWJuVUFFUW05YzhzZHZYb3c5RWxJS1dJeVBUYkpWY2lpU1hGUTdWMDJOZFJJ?=
 =?utf-8?B?ZERMbzF6c1ZScVBKdEptckx6WmVJWnJMLzl4amNCSHlzS1FZcFZ4bnlORXhQ?=
 =?utf-8?B?Vy8zbHZzcVB4QjVTM1FqWjN2TkdNeDVFRTl2YjhaZ2dwa0RlVHFhUTR5aGE5?=
 =?utf-8?B?MzBXa0gyRE1LNjR5UkxpN3g2U3BEYktqSE1LamJxRlNHaGJuUUlEREExSnhY?=
 =?utf-8?B?cjcyNUFJVTZqdmxVVFEzZ2NtL0kra0FET0p6YnQyWnljd0VuOWtjYlpBN0tN?=
 =?utf-8?B?ak9VL0k1NGtUTmRYdWFXc2dOM0IwaFhYNm4xZEVVdEZuUHA2V3FHcFp1azZj?=
 =?utf-8?B?Yk02dzBGU2FRb0ZlR1FyRXF3SzBuRWZ6WXJKNE5LcWVhZzJHbnBTbk1sUVZr?=
 =?utf-8?B?RE1yZ3JkU2hnakhtU3ZHL0dFSnBZS29aTHExWVFiY1RSR1dMRzlkZEpxNkIv?=
 =?utf-8?B?aHpBSmJjVEFiQjZBOGVGS2ZLOFM4WmdiQ21zSmZveEZ6VkRnT1FzZFBLOSti?=
 =?utf-8?B?SUUxanhTVmNLazlhcjFEVE5jQ1JoOGNKSitEbkJ4YVRpaEZNSDdGQlVNWURz?=
 =?utf-8?B?bTN2TjVIWHh1cjR0UFVZYldQZVlyVkJQd3FiWGNzdUhSQUs1Vkh5dWV6KzQy?=
 =?utf-8?B?bC9UbXk1a0E1OWMrV2xyOStjNCtWTXZQdzZyQ1Jma1FvQ3lISWtCNDNabjJO?=
 =?utf-8?B?MEg2Y091MjZlVDJOeTdqTVhlTC8vbHl4TktCbVh6by95OEQ4ZmRmTEh1b2tB?=
 =?utf-8?B?dlFlUENNUTU3Tk15YThCQ01xZ3RsK3NaZllwTkFSeDdzRWlMOHJUMXl6TWxy?=
 =?utf-8?B?TUpkSHpoalBpbFJGc0w4RVR4NEQ3RkpWNUw3bFMraUZjWHErT3YwNFlrT1Rz?=
 =?utf-8?B?dEZFTHY5NHhOYnRSOW5rNStnaEtRMFpVdTJjZlZ6QlNhSC85M05KbjlOTmdV?=
 =?utf-8?B?UFQ3a1RLTjRPZ3dlSStaOFJFd2p4ZXE4U3d2dDhBeGdPMGlVZ3FaVWExNS9j?=
 =?utf-8?B?U0pEak1xY1pxVjNSZmw5RUw4NitJSERUK0V1dHdKdE1UYmtsV2phbmpGTi9Q?=
 =?utf-8?B?MGNENFNrcUFDSFBhWmErcGVUYWpzZlhLbGdpU0tWWnh3V1hZWE9QUy9OL1Jx?=
 =?utf-8?B?QUxueTZaaUUrVFErbGNBS0tOTGZab25ISDBoRzhTK2Q1ODliMUFlZTBPS3Ny?=
 =?utf-8?B?aUw2MjdteGhGWWVzZ2FDTVVqODVLSTBqcSsrcmVnY05iMmNyeWJFeE1yTVFO?=
 =?utf-8?B?dXNDUUM2d05VbzdBMGNWRE1TNk42ak00V2p4RzBqZnlIb1ZPdzNsVmNJS0Nq?=
 =?utf-8?B?UWMwYkFrMlJ2enQ2WW92ZDMzMFhYL0IwTyswV1JtOFI5aE9zeXBXUVBlcHdZ?=
 =?utf-8?B?enhZUW9LdnJ2cWN6Qmtnb3Q4OHdhdkpTREJ1bXFnczJOUFphUWRnekUrNmVD?=
 =?utf-8?B?VzdwWmRuTTN1SjhjRGFKOWZvSzBTdlB3b1pIeFVhZERINEtWeFM3T0RzVGpn?=
 =?utf-8?B?QWc1R2RlTlJtcEVGaDZsZlkwZ0svZjR6dG1tRGIwTDQ4ZVdCN1YwamxPN0FV?=
 =?utf-8?B?T3BISGZ3eW10OE05V3d6cGR5MU1NWHorRzRtRDZHNGJuWW9Jc0k3T09rTDlw?=
 =?utf-8?B?L3hIdjVwY3BXUXJrVGs2TEdibmhjWW5WZldhUlloK2trMEtnODZZaHNkMEtX?=
 =?utf-8?B?UHRTVlZ1UEcwQzNwUGVweUJXRlN0QWxUdDMvZHh1bGE5dklUbExMNG1NRnh6?=
 =?utf-8?B?MGwwOW01UTY3eG9oUWllRUZnWmFwTmVwY3pUdnFldmsrZFNUZXI0WUlMRWZq?=
 =?utf-8?Q?rKgyeTl4LhDcUbhM0Tc2oTghl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7115625b-0c1e-4344-0544-08dd2f24d006
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 14:08:51.3307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQbLPaVCVFAbjmKJa8jpfPcSTDXd1jehszZ41gr9t1xcHRaf/3K8zQjQ232BC6bQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9276
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

Am 07.01.25 um 15:02 schrieb Philipp Reisner:
> The following OOPS plagues me on about every 10th suspend and resume:
>
> [160640.791304] BUG: kernel NULL pointer dereference, address: 0000000000000008
> [160640.791309] #PF: supervisor read access in kernel mode
> [160640.791311] #PF: error_code(0x0000) - not-present page
> [160640.791313] PGD 0 P4D 0
> [160640.791316] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> [160640.791320] CPU: 12 UID: 1001 PID: 648526 Comm: kscreenloc:cs0 Tainted: G           OE      6.11.7-300.fc41.x86_64 #1
> [160640.791324] Tainted: [O]=OOT_MODULE, [E]=UNSIGNED_MODULE
> [160640.791325] Hardware name: Micro-Star International Co., Ltd. MS-7A38/B450M PRO-VDH MAX (MS-7A38), BIOS B.B0 02/03/2021
> [160640.791327] RIP: 0010:drm_sched_job_arm+0x23/0x60 [gpu_sched]
> [160640.791337] Code: 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 55 53 48 8b 6f 60 48 85 ed 74 3f 48 89 fb 48 89 ef e8 31 39 00 00 48 8b 45 10 <48> 8b 50 08 48 89 53 18 8b 45 24 89 43 5c b8 01 00 00 00 f0 48 0f
> [160640.791340] RSP: 0018:ffffb2ef5e6cb9b8 EFLAGS: 00010206
> [160640.791342] RAX: 0000000000000000 RBX: ffff9d804cc62800 RCX: ffff9d784020f0d0
> [160640.791344] RDX: 0000000000000000 RSI: ffff9d784d3b9cd0 RDI: ffff9d784020f638
> [160640.791345] RBP: ffff9d784020f610 R08: ffff9d78414e4268 R09: 2072656c75646568
> [160640.791346] R10: 686373205d6d7264 R11: 632072656c756465 R12: 0000000000000000
> [160640.791347] R13: 0000000000000001 R14: ffffb2ef5e6cba38 R15: 0000000000000000
> [160640.791349] FS:  00007f8f30aca6c0(0000) GS:ffff9d873ec00000(0000) knlGS:0000000000000000
> [160640.791351] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [160640.791352] CR2: 0000000000000008 CR3: 000000069de82000 CR4: 0000000000350ef0
> [160640.791354] Call Trace:
> [160640.791357]  <TASK>
> [160640.791360]  ? __die_body.cold+0x19/0x27
> [160640.791367]  ? page_fault_oops+0x15a/0x2f0
> [160640.791372]  ? exc_page_fault+0x7e/0x180
> [160640.791376]  ? asm_exc_page_fault+0x26/0x30
> [160640.791380]  ? drm_sched_job_arm+0x23/0x60 [gpu_sched]
> [160640.791384]  ? drm_sched_job_arm+0x1f/0x60 [gpu_sched]
> [160640.791390]  amdgpu_cs_ioctl+0x170c/0x1e40 [amdgpu]
> [160640.792011]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
> [160640.792341]  drm_ioctl_kernel+0xb0/0x100
> [160640.792346]  drm_ioctl+0x28b/0x540
> [160640.792349]  ? __pfx_amdgpu_cs_ioctl+0x10/0x10 [amdgpu]
> [160640.792673]  amdgpu_drm_ioctl+0x4e/0x90 [amdgpu]
> [160640.792994]  __x64_sys_ioctl+0x94/0xd0
> [160640.792999]  do_syscall_64+0x82/0x160
> [160640.793006]  ? __count_memcg_events+0x75/0x130
> [160640.793009]  ? count_memcg_events.constprop.0+0x1a/0x30
> [160640.793014]  ? handle_mm_fault+0x21b/0x330
> [160640.793016]  ? do_user_addr_fault+0x55a/0x7b0
> [160640.793020]  ? exc_page_fault+0x7e/0x180
> [160640.793023]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
>
> The OOPS happens because the rq member of entity is NULL in
> drm_sched_job_arm() after the call to drm_sched_entity_select_rq().
>
> In drm_sched_entity_select_rq(), the code considers that
> drb_sched_pick_best() might return a NULL value. When NULL, it assigns
> NULL to entity->rq even if it had a non-NULL value before.
>
> drm_sched_job_arm() does not deal with entities having a rq of NULL.
>
> Fix this by leaving the entity on the engine it was instead of
> assigning a NULL to its run queue member.

Well that is clearly not the correct approach to fixing this. So clearly 
a NAK from my side.

The real question is why is amdgpu_cs_ioctl() called when all of 
userspace should be frozen?

Regards,
Christian.

>
> Link: https://retrace.fedoraproject.org/faf/reports/1038619/
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3746
> Signed-off-by: Philipp Reisner <philipp.reisner@linbit.com>
> ---
>   drivers/gpu/drm/scheduler/sched_entity.c | 10 ++++++----
>   1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index a75eede8bf8d..495bc087588b 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -557,10 +557,12 @@ void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>   
>   	spin_lock(&entity->rq_lock);
>   	sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
> -	rq = sched ? sched->sched_rq[entity->priority] : NULL;
> -	if (rq != entity->rq) {
> -		drm_sched_rq_remove_entity(entity->rq, entity);
> -		entity->rq = rq;
> +	if (sched) {
> +		rq = sched->sched_rq[entity->priority];
> +		if (rq != entity->rq) {
> +			drm_sched_rq_remove_entity(entity->rq, entity);
> +			entity->rq = rq;
> +		}
>   	}
>   	spin_unlock(&entity->rq_lock);
>   

