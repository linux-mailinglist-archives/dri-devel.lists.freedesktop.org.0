Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6579A69E2D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 03:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C66810E36C;
	Thu, 20 Mar 2025 02:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gb1OI5d9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9763010E30D;
 Thu, 20 Mar 2025 02:17:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k04EDpN7gmjpXGIl38+T6btRblKdDxjTMS02FvfZlFcz5VuALiuP1ePEAKb7Mga4EfpR7bUOdtA0qcnsF/5pUwIRfvgCcmyGH8pI5mQgkLdRvrq+QhZHVeppsUql/mokDoeMApYv+pK5dEEL8ePKGgAoxGfvuEEzsVV0+4WCSXkztEAr1Qt5Uoe+ilGTRUFFN6DaRtgsaZmEheTgbTwaeqqYjQ9DuM5v/VoXR+yNFMSn+nFVGmkv39Et8Ocme3C8NffhC7bXzYSxtxg3WRyUVChW6WUP59v4an4nQC9NklQ3hltw8x+NywZabN5kGU6H2y2z5nef6MzNhFE7R0DY2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HjwAZPVGgXefhcWupcI4p5Q8ZrzKT+jJQjgveV9c+Ig=;
 b=SOitlc4A7px6qzAPGECzB6Pk62KJaDY6pVTmPPtaJVS2DL6veAzL6Y6iTaAr9g9Aja7cOqVPovZvM1EecVEnvo/Oz/ACjmIAnVc3DTXokSePDTV7wg8oRzsmVuQczM2jftW00WD6FH4ulicUDWs0UvYC5oE04DHKKaC9aJFXC02JMmZhCjvA7tIgs0aP9gnlWWlyzfSg3S0iUnhnn5RNCR2A7GIsRXbvCt3d5gMlp05HPSdVZWERmokgyCE6x7X5TAto6rLNB9lus1hYEm0GKcWgkFddNjWEMG5qJJfKJpln3T6owSUMkGj7qAwb8hKcHrR2HdrXb8W9fJgm/6sxcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HjwAZPVGgXefhcWupcI4p5Q8ZrzKT+jJQjgveV9c+Ig=;
 b=Gb1OI5d9i9CKb1j7GjXPSL5vZwBaDvygt+oFihg2e0rV/b69cWPUNHUX6dqZOHhYClM0gxkyzPL4alTm0YuyPWGkmhXjGzH+RAf8WvD9hF5SXtzwFIqjv97MoCNN+QiLSp/VuQHtwaquSEdYZdGmm/mc2VCZ/v5Az0B/uA1pJUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ1PR12MB6073.namprd12.prod.outlook.com (2603:10b6:a03:488::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Thu, 20 Mar
 2025 02:17:28 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%4]) with mapi id 15.20.8511.026; Thu, 20 Mar 2025
 02:17:28 +0000
Message-ID: <b453d0d1-ec2f-4db3-aaa0-15e87af365ed@amd.com>
Date: Wed, 19 Mar 2025 20:17:26 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Protect dml2_validate() from its
 callers
To: Huacai Chen <chenhuacai@loongson.cn>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Austin.Zheng@amd.com
References: <20250318111717.2161235-1-chenhuacai@loongson.cn>
 <20250318111717.2161235-2-chenhuacai@loongson.cn>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20250318111717.2161235-2-chenhuacai@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0347.namprd04.prod.outlook.com
 (2603:10b6:303:8a::22) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ1PR12MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: a62e234e-49a9-44e2-04d1-08dd67555cbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wlc1d2dmanZMUVhzQWJkdWFRck9UVHRWQzlHOFpFY3RBVUt1QjBBSzkvZjk2?=
 =?utf-8?B?K3FoQldlKzJ0ZTlqUnI1VHVGVHF5NnZTSUdWdDBWRVVUK0lReW1WWm84T3FY?=
 =?utf-8?B?L0lOejNPa2tXRklGc1BhNWJXVEFaK0dBcmZlSE9RRk9KMDE0cmQ1Vm5xNDVO?=
 =?utf-8?B?ZWZmVGNkSTZheUVxbHp0dUNubER2UVFUS3V0K2xCRUxZelhtaUQzYjRxeXdq?=
 =?utf-8?B?UE9jOFhBT0cvN0t5am9oRGUvdWZWSS9qUUNJeWJFeGpYdU1hZTV0M2xvdFlu?=
 =?utf-8?B?bjJGTVYxZHNZODlMK1UvblU1S1poZ3hLV2pYMG9sQ3NVMFhLT2NHTE1xaDJQ?=
 =?utf-8?B?NGdEcnVJbEw2RUxVNSsxSVN4TTE0NmJnVldNa0x6c0NaK1pTMktiRUxnUFJY?=
 =?utf-8?B?aTJhMklOZ3ViV3pzWGVjOHFJK1ZiQms1Mk10NEd4a0pNZ1diVmx6TzY3NWV4?=
 =?utf-8?B?TWxlVStnbFR0b0UxeXkrc2ZWbGFQTGpVUkM3VUhxNDVsWkg3ME5hb1ozak1X?=
 =?utf-8?B?M1VUbmhrcis2UWZPa2tuc2hhdm5iKzBZSmhtZzY3RDBhOFhBWFJ0UHlwdFhq?=
 =?utf-8?B?aGhobWZDSVoxZkZSVUhNRDlHeG96YnllZkJOQnpBSEcwMFd0THZ1U2VGbCs1?=
 =?utf-8?B?dzlYRU4wR29UcHl5TDdpUU5sV1dYem5jZkZpL1EvcmFaNUVSVmZyOUtRb3BD?=
 =?utf-8?B?K3ZBTlRTT1Q5QmF2ZGo1TDZSYy9mYTRLaVJnU1I4UytXaklrenR4ekpNeWFh?=
 =?utf-8?B?bTlaandFVVRGWDRKTGVNR3l3UjVUbzgrYzhUTktyY1lUaHlhdVVtZ1kwc2FM?=
 =?utf-8?B?ak9BZ3RFdEFDbVJoS0JzVmZzYUR3bEEzQzNhdkIvMVBOZW55cHhNN2VWeXp6?=
 =?utf-8?B?MlpaSUNJcDZ6Q0l4dnh3dnh0R3dQYkptTlRpMDdsM2EzOFF5emlmS3BSVlFZ?=
 =?utf-8?B?RXJ4OEZhVytUZ21GYkJuNkRQeTFQNFZWMEk0eUhhd0FsQ1VWYlhRSjR0dFJG?=
 =?utf-8?B?UlRHaTA4emFwSmFTNjlpRG9nN1NLWkNhWE44ZHlnVmZneGFNaHIxMTFLWUk5?=
 =?utf-8?B?elFZTFA4eHVVYkFLbGF1dW85R1JZLzBXTTc3elAzSG5lVDl0VkdDbUlidENi?=
 =?utf-8?B?UjNUQWRhK0Z3dGV0b0E1UVhKaVJYTkF6RnNUS0pkY3RqRUdzZkl3TVorcDRq?=
 =?utf-8?B?RUpwYUFGcDNyc0N3a1NhbHN5NDJmTnA5UHc4MTQzMUU1UWd0a3pKRk5iY2Vk?=
 =?utf-8?B?YURmQ1o0V2ZzOFRUbDhabzdoMmtLWmZPSnlIaHR5TEliQksrd3F3TkcyUHhJ?=
 =?utf-8?B?ZlQrRlpuUVRzdFB5ZmhqMmIzekNMYWJ5WWVPcWZXOENlU20razhoL29ISFBF?=
 =?utf-8?B?SjVmaFFGQ0x4RVEvbkswc2ZGN2JzRFN6THpoNlJaSXFFdlJFN3pqMnJFMGY0?=
 =?utf-8?B?NGpSM1hnbFBTQi9ma2poKzBnV2dmWnJSY0tRd2RtK1hheHRuRTZxTDZtOFZF?=
 =?utf-8?B?SktXTlZwWTRhd1lCMmFyWjJLUTdldzE5UUdmdzZIVWxGU0ZOeXVSeEtDZEth?=
 =?utf-8?B?QVZwMklKdTBkdDVJUXlxUWMwZ3NTbkEyZnZJRGxwYTVIZmV3cEhDZzZ6aU9u?=
 =?utf-8?B?UzhDV2pVZXltNE1TWU5Rc0JWcHpWQnlXWWlVNHBvMGsrZTNOWHZGblBEWU1B?=
 =?utf-8?B?MTJoTmFrMG5lajFTcVVWOTRjb3YvMXVPczdGQjd5NVNMaDFydnZNZWFpTW9I?=
 =?utf-8?B?YUh4Zm1LMDJMRG1sWFMrbmxQWnVFaUdxVE5MQkl1YnlDMTYzZGlIcXB4OXZr?=
 =?utf-8?B?c0dicmUxdTh2SHZNUVVZcSthcktwVnFHKy9ZN1dvaUl6TTVoVDMzSWZSanRz?=
 =?utf-8?Q?/29v3kMw6E3Z7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU1Ndyt6bG9wVThwQldNOTJxcDhMWGppNlh1UEkvT3k2UUYyMmowbmo0ZjhB?=
 =?utf-8?B?WkZsQldheFFBVW96TzZpcTNGbTN1L3VWYmxUeTg0UGIyWUNCNndyc2gxOTlr?=
 =?utf-8?B?dGdBWmxWa2xOZ1RNWk5ndVFXZTBvSGNQcXFLNDBtYzh2Q0lGM09UdGlDbG01?=
 =?utf-8?B?bjlzQVNXODdmODdlcE5tVUpGdHVaNEw0R0ZxQzRwREl0YzUxdGlFS2NGM1JB?=
 =?utf-8?B?T1lQc3dNOEs0NmVjYW80bTJQUVcwd0JVOWxWVEE2S0V0aXFRUkdEbG82V1ZC?=
 =?utf-8?B?SFJsL3FaVzBrVnV1aEEvTnJOcjUwanpZU1ZjM2UrdVZtTTVnemxLcEw1a2Z2?=
 =?utf-8?B?TnlETlo5enBkU25lVjRvNDRMa3hYUjZNMVdSN0ltMGhWVmduS0VscVRPMzAw?=
 =?utf-8?B?bVRHdExJM3Iwc3N4SXlML3pWYzlmVWE3Q2ozNzVmMGZ0cEVpY2pxSGZlT2tX?=
 =?utf-8?B?eDkwVDJPZnNSc0Q3dENsSlN2NUtUQ09USkQ1M1BPZDlyR2xaK0I4TmlVZVJa?=
 =?utf-8?B?NmdUSG45YkRwZXpPektMZmlwbzM1QjdHQVVYZlNibTZLZVNzUUZsMzFVL01M?=
 =?utf-8?B?TWFIYmtuY2VzMjN4RGZhdWxSVURCaXlTdmViQzh1emd2bVlXY2dWYThPNXVu?=
 =?utf-8?B?V2pjZS9pcHlaNncwVzI0eCs2QVR4VUhsdU9kRXBSVTdGbkk0ZGhPT0lLUGpx?=
 =?utf-8?B?YnRDdFpKWkxiYkhGK3ZWLytVakhKRDdLK1lDSHU1ZTBoZWJCOXpneFQyRnNa?=
 =?utf-8?B?ZDhUOTRaejA2SDBKdEMvNlJocXh6WFZBd1hVWUxtNU9IazdwSmR5MGpFVXZJ?=
 =?utf-8?B?VGNTM0Q2eVlsbHFDU3hIT0lEN0Z5Y29YcUZLT1laV21SZ3FUUUd4WENnZ1NZ?=
 =?utf-8?B?c0dSMVVHb2VPZmNBK0NTYWlPMXNpRmdDYklvVTJsWkRyaEJJRlNaMzZSY1c3?=
 =?utf-8?B?bk53T0VXQmRYdGloQzNpZEV6b1o5SFlmK1luWmovb0NxcjVuT1RxNm1MdUxL?=
 =?utf-8?B?cjhjdzNiMkhOcFd3L2h4cGdlWC9iUmI5M1VVUVZUSFV2a3ZxZS9rWmNiOGNz?=
 =?utf-8?B?b251MVU4QlhJWkFIRE16N0lZK3dtU1g3ampiVEFnU1ZOZVI3NGV4d3Z6M1J4?=
 =?utf-8?B?NWFMTDUwak05RnJhZm1yQWwrSkt1cnRUMFVMRmdoZU1wTVRkM0dqQmFsZ2h5?=
 =?utf-8?B?MjIveUNGcVcrK3FoenVxNjlIYUF0dDIzeXV0Y054QjRuUVM2cGk3eGtRQzlJ?=
 =?utf-8?B?Ykl5cmNPc3A1bTlyNytPeDU5UEFLNTlXa0paVkoyYk01RUkwc1E3S3lLWm55?=
 =?utf-8?B?QWt2UlROanFnanhyaGVBWUtMdVRNK01iWXRJQlNSUFFSNEZoNURMRUdQUmN4?=
 =?utf-8?B?Z0pWZmtYWVNCemRwei82ekFCdTBlcENZR010engzT3gyeHNWWXhQWkNHbmFO?=
 =?utf-8?B?MkRrOUk5ZDY5UUovUFE5cE9uaTVCMnE2YlhZRzYzV09XNmIraUt2c3p0YVg2?=
 =?utf-8?B?ekJIem9CMXRPWkVwVEhKd01pUmdpOUxXVVZwVWcxRnJPbE9KS2ZuMVhSSmhE?=
 =?utf-8?B?MW42WGxZUGJXeVBmSGNubEp6YTVTRDZXQ1V2YnZsamNNcjdJTlhZQ2pKMFJ3?=
 =?utf-8?B?OGVDZ1ZiNDBIUmVpUDVEbi9QK3ZUNWRZSlBYWmdyS3E5NWxWSUVpWTN3Qlky?=
 =?utf-8?B?WXVNUk1vT3laS0dBMU5TM29EZzFBdHJpRE95S3lHaks1ZEtPVmxEeFdIUVYv?=
 =?utf-8?B?U2ZzT0paMyt3STl5eUE1MWZ0Wis5d1hOd2E2ZkMyL050WkVqcFdYUG9sYkh6?=
 =?utf-8?B?QWZlZUV6UWZrWXl1cTJwZXZsdVZadzVQQktQL2QyK0lLSDRXa09zak1zYkE0?=
 =?utf-8?B?OEVTUHRwUHA5dUZDWXd3WFdTZjlOSHc3NUNxdnNPN3J0aUFLNXB4RWVoL0Fx?=
 =?utf-8?B?YUIvbjVqNDFVNWNNUHpTTVVYdGN5VmRLZUdQZzZHWEczNTBSeDV4ejJBdklu?=
 =?utf-8?B?THFsYVFXZ3NXWGZHc0tacnBEZmZuOURIS2R6N2MrcG9zMXFvRzF2N1R2ZWJK?=
 =?utf-8?B?b0owQVQzbWw0ZTBOK1BiclcyMTYxKy9CZ01HWGgxZ2F6T2NiMXRaK3lSdzJj?=
 =?utf-8?Q?JPKxgFlXQ1QJIIen1KUBdAvi0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a62e234e-49a9-44e2-04d1-08dd67555cbf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 02:17:28.4160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qsnujo1JggQZWBFrMCgAhOalguge+XBe6iG5SEmUZ/hqIb3NANuaiKXt6nbK4f/u9wzccNyDnH9Nh0f3XVPz3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6073
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

Please see comments for patch 1.

On 3/18/25 05:17, Huacai Chen wrote:
> Similar to dml2_create()/dml2_copy()/dml2_create_copy(), dml2_validate()
> should also be protected from its callers because "All the DC_FP_START/END
> should be used before call anything from DML2".
> 
> So protect dml2_validate() with DC_FP_START() and DC_FP_END(), otherwise
> it causes such errors:
> 
>   do_fpu invoked from kernel context![#1]:
>   CPU: 10 UID: 0 PID: 331 Comm: kworker/10:1H Not tainted 6.14.0-rc6+ #4
>   Workqueue: events_highpri dm_irq_work_func [amdgpu]
>   pc ffff800003191eb0 ra ffff800003191e60 tp 9000000107a94000 sp 9000000107a975b0
>   a0 9000000140ce4910 a1 0000000000000000 a2 9000000140ce49b0 a3 9000000140ce49a8
>   a4 9000000140ce49a8 a5 0000000100000000 a6 0000000000000001 a7 9000000107a97660
>   t0 ffff800003790000 t1 9000000140ce5000 t2 0000000000000001 t3 0000000000000000
>   t4 0000000000000004 t5 0000000000000000 t6 0000000000000000 t7 0000000000000000
>   t8 0000000100000000 u0 ffff8000031a3b9c s9 9000000130bc0000 s0 9000000132400000
>   s1 9000000140ec0000 s2 9000000132400000 s3 9000000140ce0000 s4 90000000057f8b88
>   s5 9000000140ec0000 s6 9000000140ce4910 s7 0000000000000001 s8 9000000130d45010
>   ra: ffff800003191e60 dml21_map_dc_state_into_dml_display_cfg+0x40/0x1140 [amdgpu]
>     ERA: ffff800003191eb0 dml21_map_dc_state_into_dml_display_cfg+0x90/0x1140 [amdgpu]
>    CRMD: 000000b0 (PLV0 -IE -DA +PG DACF=CC DACM=CC -WE)
>    PRMD: 00000004 (PPLV0 +PIE -PWE)
>    EUEN: 00000000 (-FPE -SXE -ASXE -BTE)
>    ECFG: 00071c1d (LIE=0,2-4,10-12 VS=7)
>   ESTAT: 000f0000 [FPD] (IS= ECode=15 EsubCode=0)
>    PRID: 0014d010 (Loongson-64bit, Loongson-3C6000/S)
>   Process kworker/10:1H (pid: 331, threadinfo=000000007bf9ddb0, task=00000000cc4ab9f3)
>   Stack : 0000000100000000 0000043800000780 0000000100000001 0000000100000001
>           0000000000000000 0000078000000000 0000000000000438 0000078000000000
>           0000000000000438 0000078000000000 0000000000000438 0000000100000000
>           0000000100000000 0000000100000000 0000000100000000 0000000100000000
>           0000000000000001 9000000140ec0000 9000000132400000 9000000132400000
>           ffff800003408000 ffff800003408000 9000000132400000 9000000140ce0000
>           9000000140ce0000 ffff800003193850 0000000000000001 9000000140ec0000
>           9000000132400000 9000000140ec0860 9000000140ec0738 0000000000000001
>           90000001405e8000 9000000130bc0000 9000000140ec02a8 ffff8000031b5db8
>           0000000000000000 0000043800000780 0000000000000003 ffff8000031b79cc
>           ...
>   Call Trace:
>   [<ffff800003191eb0>] dml21_map_dc_state_into_dml_display_cfg+0x90/0x1140 [amdgpu]
>   [<ffff80000319384c>] dml21_validate+0xcc/0x520 [amdgpu]
>   [<ffff8000031b8948>] dc_validate_global_state+0x2e8/0x460 [amdgpu]
>   [<ffff800002e94034>] create_validate_stream_for_sink+0x3d4/0x420 [amdgpu]
>   [<ffff800002e940e4>] amdgpu_dm_connector_mode_valid+0x64/0x240 [amdgpu]
>   [<900000000441d6b8>] drm_connector_mode_valid+0x38/0x80
>   [<900000000441d824>] __drm_helper_update_and_validate+0x124/0x3e0
>   [<900000000441ddc0>] drm_helper_probe_single_connector_modes+0x2e0/0x620
>   [<90000000044050dc>] drm_client_modeset_probe+0x23c/0x1780
>   [<9000000004420384>] __drm_fb_helper_initial_config_and_unlock+0x44/0x5a0
>   [<9000000004403acc>] drm_client_dev_hotplug+0xcc/0x140
>   [<ffff800002e9ab50>] handle_hpd_irq_helper+0x1b0/0x1e0 [amdgpu]
>   [<90000000038f5da0>] process_one_work+0x160/0x300
>   [<90000000038f6718>] worker_thread+0x318/0x440
>   [<9000000003901b8c>] kthread+0x12c/0x220
>   [<90000000038b1484>] ret_from_kernel_thread+0x8/0xa4
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>   .../gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c   | 5 ++++-
>   .../gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c   | 2 ++
>   .../gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c | 2 ++
>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c | 5 ++++-
>   4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> index 664302876019..63ef8629d7ed 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
> @@ -1811,10 +1811,13 @@ bool dcn32_validate_bandwidth(struct dc *dc,
>   {
>   	bool out = false;
>   
> -	if (dc->debug.using_dml2)
> +	if (dc->debug.using_dml2) {
> +		DC_FP_START();
>   		out = dml2_validate(dc, context,
>   				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
>   				fast_validate);
> +		DC_FP_END();
> +	}
>   	else
>   		out = dml1_validate(dc, context, fast_validate);
>   	return out;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> index 8ee3d99ea2aa..0495c8dbcf1e 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn35/dcn35_resource.c
> @@ -1738,9 +1738,11 @@ static bool dcn35_validate_bandwidth(struct dc *dc,
>   {
>   	bool out = false;
>   
> +	DC_FP_START();
>   	out = dml2_validate(dc, context,
>   			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
>   			fast_validate);
> +	DC_FP_END();
>   
>   	if (fast_validate)
>   		return out;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> index 14f7c3acdc96..aea5acf22b26 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn351/dcn351_resource.c
> @@ -1718,9 +1718,11 @@ static bool dcn351_validate_bandwidth(struct dc *dc,
>   {
>   	bool out = false;
>   
> +	DC_FP_START();
>   	out = dml2_validate(dc, context,
>   			context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
>   			fast_validate);
> +	DC_FP_END();
>   
>   	if (fast_validate)
>   		return out;
> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> index c1ebc6b1c937..a1815fa59b02 100644
> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
> @@ -1650,10 +1650,13 @@ bool dcn401_validate_bandwidth(struct dc *dc,
>   		bool fast_validate)
>   {
>   	bool out = false;
> -	if (dc->debug.using_dml2)
> +	if (dc->debug.using_dml2) {
> +		DC_FP_START();
>   		out = dml2_validate(dc, context,
>   				context->power_source == DC_POWER_SOURCE_DC ? context->bw_ctx.dml2_dc_power_source : context->bw_ctx.dml2,
>   				fast_validate);
> +		DC_FP_END();
> +	}
>   	return out;
>   }
>   

