Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1073792B5FC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:54:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F203A10E4F8;
	Tue,  9 Jul 2024 10:54:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gtFI0jgp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCA910E4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:54:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BdNdUmyTRCsUXTeKfYB6SJjQ+mrgSfQR9l3CdMTel+wzmdze7Zl+pbiPRmDpNDQ7W6HRmx3VV3cOpbf2HTuRp8rO3LNUZ/lfC5E6zujKXNNKKa7z63RbFY4xZlY1ppR8T+MZPR6k2pIA2bv7pmZUpxP3tA/o80UI5J61iGSCQLtf+g07HRw+s8FJOJQtDrxQjK+D/KS+U7gMy66S0FNTx1lPbnVYYAhO8HhQWabuMTLmtRWaCoXovwVtzBsmyITtR15//J/wyIBfGIzjyGxwGppnrMKpF6jQ5wh2khICN6XkXVgrxHmz6GFCgg8vEvmRVtpQW1ndgNQqAXexJM6BEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jc/nRn2o4MHxz9MbO+nhbobAXXfmNXrniP2KfoBdAjc=;
 b=MVN6HNNsPd523TIH3HaLMKvhB7qWaAbMi6/dd6xiUwpgx49ZP8C+49PlUb8Wh36YDrtc5XDnrEHUnmRRMz5mJ0352K63kd6fygXESH/VeExotuCNBSQ2ufd76+0n26bK0QBb1MGpWALrdhJ2vX2CkHdNIDL0rOs/gTSUHxGeJSu/4nl7HmiG1O+tYOXNds/asKt72kwxNVzeCr8f943rWIypdRRqYivUGT85B094eKs3rCaLuvAUcchr8RmxfLunho87lkeefL/GN5xh4ktCDFxIPE6n2MAeN3a1Dvz3SH+GA95v2vlPB7iF8Ot0hSAhtvbFvSYYiN6rBEIiA+ZHEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jc/nRn2o4MHxz9MbO+nhbobAXXfmNXrniP2KfoBdAjc=;
 b=gtFI0jgp7XLhsveUZcofzHk4WdX44LCAZ/xK4icDxbRL2U1P9Ea4XjJbeL71ZBdebih9aEOdFuvfM+/YF9aHOZj/FeQl5XZOaVinflMmv4JFFV6YSoMs8Vu8S5+AdD/VB7hitm5Al3PubRkUr8S5LS2a/EcMC9QpvqBZnfBMa0g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4485.namprd12.prod.outlook.com (2603:10b6:208:269::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 10:54:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Tue, 9 Jul 2024
 10:54:17 +0000
Message-ID: <b56aa968-011f-4b6c-b28b-564378bb5e68@amd.com>
Date: Tue, 9 Jul 2024 12:54:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: The TTM LRU-walk cherry-pick series
To: Matthew Brost <matthew.brost@intel.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <0db8246a59e67c8e740110c6cfdd8339bec97f32.camel@linux.intel.com>
 <ZowEX6tlXJJafTDZ@DUT025-TGLU.fm.intel.com>
 <e356d7e2-33db-4aed-bfee-8e0828372527@amd.com>
 <ZowG//hThxa4zDPc@DUT025-TGLU.fm.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZowG//hThxa4zDPc@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR5P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4485:EE_
X-MS-Office365-Filtering-Correlation-Id: 940eb92a-51ed-4889-7209-08dca0057ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3M5TUFXRG56VWVzdzNWSkZ3TzNYZUVZZXhSNVozNE8yTkVUYkZ6WE93WEtE?=
 =?utf-8?B?V3lRM2ZwdktjYnF6ZTBHOWJpQUo3WlhhblRqSXJKd0xwemJCcFIwbWptWkZD?=
 =?utf-8?B?SitreWg4bkNNclZIUTF3aFV4MU0rNWovUjUzTVhVY1FhMmhIbmdXRG8wSkdQ?=
 =?utf-8?B?anAvaS8wckF5Z01IdUtCa0ZtVUxRQXVGU1VMemNtazA0Wk4xaTg1S1dUcXh1?=
 =?utf-8?B?VEVkTTI0SzNpbXc0UTZOZlJuSXhwRHl2U0hLTTZGcGFxb0R2WlZwYktSU2t0?=
 =?utf-8?B?ZzRIbEg4SUFoMG5FR1QvSHMwYkRmYmhwTzNxaDFBYWE3OVpjWTQwZDdENnA5?=
 =?utf-8?B?ckUxTEppS1h4SnVqZEFEM3cveDM4YmJjcVN4cWhJSE9NVWpYOFFLVHlIbDkz?=
 =?utf-8?B?UVZsTWxVS3ArdWFnY0FveVQ0dHBWSFFBZmx3ODRTeHZJdm9qclNBRTYyazhj?=
 =?utf-8?B?RzdLd3ZKbmV6LzA1MVZNVnErMXpKM3J6MFB1UDNyQmliaXRERlBYY1FRK2dr?=
 =?utf-8?B?eC9kZmdEb3g3N2dUdHR1WkUrNEwwMWUrbnRhVWRxcnhuNHBheFpZdmxobkRO?=
 =?utf-8?B?bmpmUFFMeVErTnJmd3dXUUdaWEZVU0lVSmU4V2lvRFRhMW9Wd09jeTJHdG5X?=
 =?utf-8?B?UkFRMCtnekF5RCszUmJlamlnNXlCL3JObzM0VFlqbTlSUUIxa1Ird0Fsalpy?=
 =?utf-8?B?L2VWQlNCbDdIL08xYmFOUzVpUWc2bmN6dVNoZmFhODZ4VzJrU1dGYVpqVVFQ?=
 =?utf-8?B?dmV2VzFHUmJtZUw1cjFsSU5xLytUTlNmd3o4eW9jVU42S21ZdWwzWE1zcmhJ?=
 =?utf-8?B?bzl1cndCSGNIRjNuSVZ0UnZuZHU3ZHlWNHV6Yy9vbVhXZjVCZGJoU1hmajJX?=
 =?utf-8?B?VW1jcGFpZmc2VStnRE5UL3Y3MHdCaFRyZXdjMVlNNFczcm9zQnFSamMzb25D?=
 =?utf-8?B?YmNMK3NCb0tsVTBlRDdmN1FIODFoblZCaXNnR21RK1g0UzBZQzV3L1dUaFRQ?=
 =?utf-8?B?NjEzWVVnWUZyVWRQWkZVWkxNWTFYRUFrYkx4d1g3WHlYT3Jtb1JiN0ljMjdt?=
 =?utf-8?B?Mnoxdmx2QzlNWDkvU09ocW1obGJHMHFzR2Y2MGxBaWNkd2pYNVdmVENPVzQ2?=
 =?utf-8?B?aDFUNmJZOUUzN29YVGEweVJqYitUZVl5Q0VuQTRYcWpCOHAwZHNjUHovczUx?=
 =?utf-8?B?bnJxbXVSc2J6WklWY3MveUlrMCtKYzNuWDZzWDJKdmJMeGZZRjVnc2VIdkZF?=
 =?utf-8?B?K2o2d3JSc0dxSXRKMHZLTUtIT0dWVUV6OWltaXdYTTRid0ZENWNNTCsvRStx?=
 =?utf-8?B?Nk0wcHdkZG5KMExobk9RTGVqU1VqN1ppcjhSU1BlcnZQN2YvV045TkF2b1Ny?=
 =?utf-8?B?eXZjakw4bnIrOW10MmdBZFpDNXJlbmpXTnlzZnVlRDB5dk8xZ3lyYko2TGV1?=
 =?utf-8?B?eVFMa3Q3TzZ3NGlEYWhjVmVTdUZ2MG0xSlF4SHBKUmt0QWdvWkNMRHdXMW9W?=
 =?utf-8?B?QUcyeEdCYWFSTnRPcm1lTzJYdGhWVFBtZmM2YmVFQXYwMHl0dXpQbFR0UVF3?=
 =?utf-8?B?K2czQ1RPZ25Xb1lRdVlUOENjTlB1ZE5aUlZBMzhqcVJCL2tnajd2OGNqWnBz?=
 =?utf-8?B?dXJycXFRSSttMDUvRHNjMVBMU2pvWmRoR2g3M2F4bEdGQkdFNWM3VFZVdndr?=
 =?utf-8?B?bmg3aENKcGFiZlQrcjRSTjlxbVprU0ZIcDRLU3MySDBYd2w3TXRxTi9JWXB6?=
 =?utf-8?Q?MB6ML2QHPI8YorLS78=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WVNwanlwODBJOWdUNjNROFhPdythRENBcGIxd1FDNTNlczFWSzUrL2JXOE1M?=
 =?utf-8?B?dlVUbi9ITVNrZkpjclFSS1hPd2FBQUlYY2JxenlpOFpseGNYTTF5TDRCSGN4?=
 =?utf-8?B?VjBlL1FuZG1tcURPWVBJblRVWm9WM3VPZGNhTEN0SlZKLzNld1pPcGV6QnlB?=
 =?utf-8?B?SVNkUzBjVFhlWUVKUGR1Q2taVDNnYWRQUDdPZ1hkc2x1VVJDTkRtMm03RGJo?=
 =?utf-8?B?ZDlwWnVFUDNiV2Z3bk1uTmY0dVhiK0ZrZW1saXZLVHl4Q2w1cmpqOEdVeFdX?=
 =?utf-8?B?Tm42V1daWEt4Q0gvL2Y5Q3lBamc5ZklFa3RsQmI2NTZCYUlUZWFVQ01aTnRM?=
 =?utf-8?B?RDZ4bStnWDNVblZqNlN0NU5jYW13K1hIWGllemhBWDA4UzZwYmRrVmx5Y2NW?=
 =?utf-8?B?Sk1YSFA5REZteTJSblhWWkVoOWpVdTN6Mld3aHNzci9xWmowaHFKdURGYld1?=
 =?utf-8?B?MHlodXkwb3dLT3N5dU4xVDIwK2UxcGNWbkpHbU1uRWR1U2hFMC9FbG5ldzZ1?=
 =?utf-8?B?S3JuY1drOFllUlVNdWN2RGJFN0l5RHd5ZUpwbG92WEUxUk5aV0EwY0JFQXJC?=
 =?utf-8?B?TW94cHlwZStzeTZUY2YxdWhmUlVyVVQ5ZkhrMmRHVDJPVEVpK0J0K1NBMjh0?=
 =?utf-8?B?SDBiQUxXOUdnQ295VXRzMTdZckcxMGQ2WUxQZTMzQkliNHV4NXZ4SkRab3VP?=
 =?utf-8?B?M0VCNmFyZGNOVVgraUVERW9xenhaSG54L3JYTzJTSTR1bUZDK3J0RjVrZTJ1?=
 =?utf-8?B?M3paMEQzb3R0WDVwa21zVDd6bHd1b1RWcnllUnJjM084aHc0TzZZZXhUTHg5?=
 =?utf-8?B?VHAxYXRtNlpOYWpOMG9sMVpaeTVVV2E3bU9hdk1BQWF2anNFOHNwcFVwWk1s?=
 =?utf-8?B?eElBbDFiQmprODJPSUV0eFN0ci9NaTRwRDBPRXRkVXdkdk8wOEJ2TVE4dDRJ?=
 =?utf-8?B?aVRrMkl2TWxGL0pDSytzd2Z0WmQ3Rk13NjQydVloRWpNYzZ6Nkc2b1drMUdU?=
 =?utf-8?B?ejFxdGU0b1M1eFh6ODlQd0ZmdE9qY0c4VTNUQlcraStUQ0VoMWtNa3Mwa3lR?=
 =?utf-8?B?c2xhSmQ4U2NDMC80OCtLaTlWcS9hTnFuanIvY05vUnBHd1ZSV2JrR2ZLcXRs?=
 =?utf-8?B?dnZTaXdjT2dKelFPOFZDRk9kZmkxM0hXdW84b3lmRXp1SDIzWmg0NzFIUFZH?=
 =?utf-8?B?ZDRYaVVyQzQxT0hMbGwvRDRHTkVhclpwekFzQXk1WjZWTHUra0N2N0Y5OEJI?=
 =?utf-8?B?UHhnR1VMU1JMeTBXeWFpdXhrUWp3T3I4U2xSWlFyRy9sU2FaNzVEUGR3b0Yr?=
 =?utf-8?B?US9pWFVvYU9idVVaVGhCZEZGVVNKMUZ1eVVVUnI0cXhXRExuSjlkenNLYmdU?=
 =?utf-8?B?VG1CelB2RW42OUlabWpmaloyZUlOQnpMVTRGdk96N21JYVRnVTlJT0FpSkQ5?=
 =?utf-8?B?SDFxNk8wSnVuZzUwTnNYRnRsNkxsS0YzT0RnM0crM3RjS3FOdVplOENpdWd2?=
 =?utf-8?B?dWtNVUFMeFRLNWJwaFNHMTdtUXRPSUFGQmlHNU1iLzJ5aUFLMHVDUjRqK0gr?=
 =?utf-8?B?OWM0NHBMT0w4RC9SOEpRSlBKcTRleFNqZC80QzJubXIzemJHYkFNd1oxL1Fh?=
 =?utf-8?B?TXlnNUo0SFQrKzZ3WHV3VTBSQTczd3FkSFE5bWtWdkx0aUV1Z3d6QUtDUUh4?=
 =?utf-8?B?NHZwZ3hlaEpyZno5M0ZvcDUvK3Z4anRvUjZkSFJ5SmZjdlV3MDQzalVaeUJZ?=
 =?utf-8?B?eXdhZ0VEY0luUUwxdzFvT0hpMktqVTRHa1hISmg5bmVOQXh1RW1JbTBFQjVZ?=
 =?utf-8?B?UGZ1QXVLcVZIYXdUYWlHY3R3dURQN2c0bnJ2VVZlU3B0L2NwQVk0RzlmSmd1?=
 =?utf-8?B?VDYwYlJJYjVtazVwRHZRYTlJZ3c2TlpjQkxVdktYeU1ISUJpT1RYV2loWm0r?=
 =?utf-8?B?ZTRpY2tJUXFaalRSRmdDWVNxSWgxYjE4SjAwOVJONkMzQjlNdVNWVERZZHly?=
 =?utf-8?B?eVRTRFV5bjBqUEdQYjVBLzhBKzVjYTF6RUFyTUFjeVExZFo4M3NvbnNjalVp?=
 =?utf-8?B?V0gvNlVrOENFM25nbzlNZGhWYzI5RGVSN0Q4NG9BVG9JYjA4emJoMW1QOUVz?=
 =?utf-8?Q?CYnI94l1QLHhGqeOugAw4vQM3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 940eb92a-51ed-4889-7209-08dca0057ac5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 10:54:17.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEkSbfNRhnEPP1C4s9K/csYSv4VsVBaD78CS46AvmZ6iQWe7ykxzKYEfeRVWuqeT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4485
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

Am 08.07.24 um 17:34 schrieb Matthew Brost:
> On Mon, Jul 08, 2024 at 05:29:30PM +0200, Christian König wrote:
>> Am 08.07.24 um 17:23 schrieb Matthew Brost:
>>> On Sun, Jul 07, 2024 at 05:49:16PM +0200, Thomas Hellström wrote:
>>>> Christian, Matthew,
>>>>
>>>> I think I addressed all review comments and a couple of anticipated
>>>> ones (s/long/s64/) in the swapout- and eviction patches.
>>>>
>>>> I'm heading off on vacation today, (4 weeks) so if something becomes
>>>> urgent in-between feel free to pick up, modify and merge.
>>>>
>>> I found a couple of nits in last patch of [1] but gave an RB as the nits
>>> can be fixed on upon merge.
>>>
>>> The series [1] is fully RB'd and CI looks good. I'm thinking we should
>>> merge this. If any bugs pop after merging feel confident that I can
>>> quickly fix them while Thomas is out. Also fine for waiting for Thomas
>>> to return too.
>>>
>>> What do you think Christian?
>> I'm currently working on testing patches 1-7 and if that doesn't show any
>> immediate problems will push them to drm-misc-next.
>>
> +1

And pushed.

>
>> The kernel build bot also complained about something in #8 additionally to
>> your nit picks so I think we should investigate that first.
>>
>>> drivers/gpu/drm/ttm/ttm_resource.c:607: warning: Excess function parameter 'man' description in 'ttm_resource_manager_first'
> That is the kernel doc nit I raised.

Ah, yeah ok. For that minor cleanup we can wait for Thomas to be back 
from vacation.

Important point is I can now rebase my drm_exec work on top of it.

Regards,
Christian.

>
> Matt
>
>> Christian.
>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/series/135801/
>>>
>>>> Regarding the drm_exec trylock functionality I'm for as much as
>>>> possible that it should look like any other locking primitive trylock.
>>>> i.e. no additional tricks needed.
>>>>
>>>> Thanks,
>>>> Thomas
>>>>
>>>>

