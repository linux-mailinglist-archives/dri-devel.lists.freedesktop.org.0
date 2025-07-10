Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 705BAB00185
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 14:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C750810E8B9;
	Thu, 10 Jul 2025 12:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ODhVC2ek";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2073.outbound.protection.outlook.com [40.107.93.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697B110E8C2;
 Thu, 10 Jul 2025 12:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7rcXXe7vLeCagdXEA8U6MCx/xKIKQIZzXZsQzrTSvlKNMem5SiwM/hQDRLrCiN5rex0emtsIgaPUiz/+9u3EUjsjo7eJbVmQhbRL0mqSkXhaFDzqIP0YIynvt9f0DOoCh0ChFl8Q6MXhNsNH9m+MIEsT2LG9YzW897LNisMHCS7p7yVJHQvwgPk7cG3PaxSNua6aAcbuCCOpsjOIHgHSXDa1duCGY4TT8Xj5sNnd+t3xeSWdWINN7frQggb/iPKsN2Ftfe66NGrH7+vftXgOoms1amHoKTPl4ar7/ddF/R9Dg0lfwfx5uH0CnOT5zvWRjaS9nFDFJNFd0KZSE3cFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LnqPJB+CS3vJz4lfh1I/OEL8Ub7CdaAjueemAsyt0Gw=;
 b=t/hyTY4DBKFCOs00T6a+pr7MeYf/3TvDcBoCDgnkW8/18H+nYYqK+FMdKKhrPsc7j51Q/Ns4MweLaF0FnM0u52YcE0RZajFykyJaf/GLyvPJn/DmQ0GwokEmyirMy2jf3MGVRLUQSj23qYfvwQVvqXtasSPJBFZ7ezE02STnMXWkCAp4Ju3TB9P466b+Y8m2HiuFXTeJXyYv7zGb1sVrnD/tWDvCP28qRA5DrZpjGxMp2NZPv918zTTD67Ms5OJd2EvjFkXb5SQ152zFVos9vcSg4wRxTBdIBIm6ipf96OVv8aZZGiPy9psMtd28IbrYL8tp2hx4NXKN1NIffoNv1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LnqPJB+CS3vJz4lfh1I/OEL8Ub7CdaAjueemAsyt0Gw=;
 b=ODhVC2ek0DaDAG5m8iIQCpqA059z0dgW0h3mj7Rcsgoz8/46fe94joydMeBdCau1UnCvK1l7673jSWhcu0f40Wu19Rwqk+yA2gfMj7KpgpepPE+nd4UkyKddV19x9dQzCGZWuD+qZG4HpwdBmf3ElA0U3cpneHBUQbCxfc4vsCw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6149.namprd12.prod.outlook.com (2603:10b6:208:3c7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Thu, 10 Jul
 2025 12:20:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 12:20:49 +0000
Message-ID: <da71b812-6ac8-4abd-82d6-4cfc6a168146@amd.com>
Date: Thu, 10 Jul 2025 14:20:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Mario Limonciello <mario.limonciello@amd.com>,
 Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 rafael@kernel.org, len.brown@intel.com, pavel@kernel.org,
 gregkh@linuxfoundation.org, dakr@kernel.org, airlied@gmail.com,
 simona@ffwll.ch, ray.huang@amd.com, matthew.auld@intel.com,
 matthew.brost@intel.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
 <20250710062313.3226149-6-guoqing.zhang@amd.com>
 <b9bb9865-8bf4-4d9a-9bfd-945d38a7698a@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <b9bb9865-8bf4-4d9a-9bfd-945d38a7698a@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR0102CA0071.prod.exchangelabs.com
 (2603:10b6:208:25::48) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: d4700a2d-53c9-449e-8f72-08ddbfac348b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ekZSaUlVTkYwbzZua1F6UXdlWXNZWXpJVTE3OEJrMzJ5aHo5OUtLS29zci9v?=
 =?utf-8?B?TVJSNjEzMktBT050VzlUaDRhQU5hUDJxVHIwMktVbmhKMGZubzdlclBqcHgw?=
 =?utf-8?B?dmducVplMlNQWmdTbGRrZ0VnMHlYVFIrM3MwczVESStUdzdXTHVkSy9sQ0Mv?=
 =?utf-8?B?bkNjSFVWeWpTUklqMUUvck4xZTc0V1UzeGVqTk9vZzRRREhGV0IzNmN3UG5X?=
 =?utf-8?B?VUJCNlNXMWJjdTVPck1MNmRDd1pPUDBlSU1yRS9iVFdUd0E1b3FEZkx5L2Rq?=
 =?utf-8?B?N05qVVFwd3gwQVdGWE9HWWhhK25MaVA4bTBvR2tiWXlmaTNiWnFYSHBPWUt6?=
 =?utf-8?B?K29jRmZDaE8rcTRDZk9aT1lJUFA3MGhWQ0l0RHhFS1BxdjlWOVRxejlCV2VH?=
 =?utf-8?B?RGVMc0lvY0ZSMWhmME1BSkhtZytPejBwcGRwL0NwVVpNSmhsbHJXTlYweHZS?=
 =?utf-8?B?RmtPaVpaRnhjWStvU2V4YXNBSG9BTjZ2VFdxNWVudDhlRlhObXEwWmNDc2ty?=
 =?utf-8?B?MWk2NmZ3Y1JuOVR0VlE0eTdvL29WT2VVdEJZMnlQdjVUUWRPOFJiUzUrQjIv?=
 =?utf-8?B?MXlqQUwrYWsxUHlVTTNxREtWQjhFaFFmTVMrbjQyL2t1UUJKQTVaTGIwQUNa?=
 =?utf-8?B?LzBSTnliaU5vMGJ5UnRzUjQvOStySkZnSHFiTHJaWmpaaytOdjB3anpBTjdX?=
 =?utf-8?B?UERQN1AyRDR4T0YyUjh6bE1xWkUyU25DbWlaZ3lmQWFDQ0IzNU9mZGdMOFVN?=
 =?utf-8?B?dE1oNjkvRmgyV2hLS0JiSElVc1hlaTJqcEpWK1MzTmVHa015dW5IRjhqdGlp?=
 =?utf-8?B?MlBoZFQ4Zy9DUE9Meno1UnhZKzZhWUlmZ2NXK3hSWVkyblpYSHFMMzZlU081?=
 =?utf-8?B?a0ZpYVFJK0FnRWdQclQ5bkNVQUY1YkRmSGM4YWRBS253NzNuZDZJOEJQYVl4?=
 =?utf-8?B?OUFDSjZ0ZWlzRkFlNGdBTDQ4SDVpbWx4K2Q2WUExZ2Jpb2NGQlZRQnljdFI3?=
 =?utf-8?B?STJYQkRmMkthTlVwYTdqbGZOTGtFbDhlcVU0cWl4a0x4WlBvalZ5UDE2U3ZR?=
 =?utf-8?B?NDNvZVBKVUh2WFFnNURSTHg1QmdtK2t3WXB1RGJBOFBDRlhGL09RWlpZc0lD?=
 =?utf-8?B?aVhwTFpMc0hiZ2JoWldnc0RxNlA3cENmc2kweGNJd2N3U0hwK1pqSWZMV0Zi?=
 =?utf-8?B?alkyYS9wNTNZcVQxclVyM1JwdUFNY3VMdXkwTWFsYkthNHJZdnRtUXQ4aVhY?=
 =?utf-8?B?aFBvVGVpQjJya3B2SnZZaDZnSksrZ1J3NHRkTTBCeUJaQnFIWjFubTFUSHFK?=
 =?utf-8?B?bkxqVlpHQkltOVhGbXRVUlg4TEYxVFNJekpJam1CRjJVelNKVmQ4ODRFK2FP?=
 =?utf-8?B?M1NGb2pDQUJ0aUhMWHFBbFZKZkZnUmJ0b082NkNoRkFZK0IxeFlMRW9UblNy?=
 =?utf-8?B?bnY2WC9JajltdHp2d244RFQ4ZnRRQ0t2VVJwV2lZeFp3NWVDVmZlOGNMcE11?=
 =?utf-8?B?akxCK1BKYmJrK0tpYWM1Y2VkVm9FdVRNT2hudkwwSzBmVmdKdXFnVkVXbHJo?=
 =?utf-8?B?b0dieHp4RGlBMElMMmhydnhiRS9uZldEdlh0Y2xwK0NjT1FCVEQ0Y3c2QmJG?=
 =?utf-8?B?cnRHeVhPeHM5TGUxQ1NnQkxBaTk0U1NvTDlkRVRqT0tsbWhlZ00rUjNQeDkv?=
 =?utf-8?B?OTdhZW1FN0ZRWkI5K0FvOXdQQ2doYk1vS3F3eW9rdnhEZE42TEZYUlg2MmFa?=
 =?utf-8?B?NmJXcTJZcXl2eVVRQTVoZFRDbis2T0R1eDROTHFvNDBiVUxMamRvMUt1dlJn?=
 =?utf-8?B?MjhkT1Njak9TSUFXRURNMTg0TWFRQmt0L3llbU1pcENUOXlPeGNMV0h2K25E?=
 =?utf-8?B?NXM1TmxKNEwwV0dTKzNZUnBTNzRMVXhDcVAwUTBmSEZJc29Wei9yWmM2c2ov?=
 =?utf-8?B?alJjRW1wYStraU9SSk5ya3Ztb0R4akxqQS9CYVJlelRpdHY2UW0wNFBmK0Rm?=
 =?utf-8?B?WmNwbVJTMVJRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RlNBZ0owNUovOHhGbVFneWZHSm1Ec05tbDdLQnM5V2kyQVpGMElScm1welp4?=
 =?utf-8?B?YTZ3MHNaeFVHSE5SakM1UjFzSDJOVWg2bTYwdnRwYVRSc0JyZk5vUzZKaGR4?=
 =?utf-8?B?QktqL0VWd1dQck5WTXpJRjZSUHlCTkl6bmpLQXRSZDV2dWg3OGZkQ29TbVht?=
 =?utf-8?B?UjRaUFJEbFkxR25XaE1Mb3ZEVWRJdG5DQmhCeXEzQ1dDTnZvZVV3ZEtMSklS?=
 =?utf-8?B?UXhYdzNaQlhIM2FjNExMNVc3aGJ4Y1NKSzZFMVhjZ1Y1VytkMVUweW9wSGdx?=
 =?utf-8?B?OUd5WkJDQlZqNWpSeUNGSU5qM00yeUZlcXNLOFRFOGNpaXJEQytGemcxaGNo?=
 =?utf-8?B?U3lVQlVIQkJoMzBGM3BWOHlabjRKbVlTUTRrYlRxelJOUXBLRGhnWm1mcmNp?=
 =?utf-8?B?Y1NFSm1wYUlMV2FsODFpeldaZXlxUkZybU8xUUt6MFZCcm9aV2NJa0ttclNy?=
 =?utf-8?B?WUlWa1h1MHg1WEhyWkVjNnN6UllIRGZtSXZEcEQyMEgwcEovZjZPSS9qU0o0?=
 =?utf-8?B?NDRSS1k5T2p2MUlyeVF2cWwyK3pLcUorbTZ2dWIzZlQzUlVDV1VHTjlUa3hW?=
 =?utf-8?B?ZS9aYVJvY3NTZU1xbTRUK29aSEZxaGRDRWoybXZtZ2VRNS81Nk8yb1ZHT3NW?=
 =?utf-8?B?Z1J4RU9BTFd6dm1iSWZPVGlSK25HRGRwZ2liSUJNK0JqTE5tMEFlcXgydlp0?=
 =?utf-8?B?R0EwYkZMUmZrUHdsUWwyQTZWUnFwM3ZHVkd3blNidnBVTHAwMUVLdVdDYW96?=
 =?utf-8?B?aUt0YVJuU05vNkl4ZFNDOHpCVTl1bXhzc0pxWjVmTVk1WkNpSTBjQTBoN0FJ?=
 =?utf-8?B?cVB2WnBkdVpBMXFYQmVUUXRLZEVKaHNTTnlsL3dpcFRrMWFacWxPbUIzaHlP?=
 =?utf-8?B?NUJlQWNIbEpsUEJoSGlZa0JDREs0alI1bXhucFBtU01teS9RUGViNXNsUlc2?=
 =?utf-8?B?UkNzeWw3cjIxbjdnNXJtRTlwcmIrOGtaYTN6R2lIeW1tOGpHNVhsWXhEYTBi?=
 =?utf-8?B?TUQxWFcvQXFFbkhlWk4vbno4TmVZQ0lqcVNUNXF4SVNWc01odlZIK0JVZkor?=
 =?utf-8?B?RHJoSVhKV1E0Ym4rc1EveHZlRy9UaGttQUxnbG94VFBQNy9jZlVuSnQ3Ti9Z?=
 =?utf-8?B?US90RXBDRGFWNlNLTkpxUXljZ0k2S25Jc2x2c2tnRkkwaGduSHBzcVlNYUls?=
 =?utf-8?B?MVlHY0pxdnA5M3J1NnBqZXYzMWFyRDhoUTNzemZ2RlNCbkJzUThhZTJ1dUo5?=
 =?utf-8?B?c1BLWnZMV3BFakVoR2xOTTdTaWN5ZS9hZXZRZ245OGVseDJTeGVVazBQK3VN?=
 =?utf-8?B?dDJlWmdmNFBSYkpTaUMrOHJVSDBiZm80NHhwelJYWS8xNmYvbUU3ZzdSWnYv?=
 =?utf-8?B?aVBSa3l5bkVZeHd5ZVJJUVozclBQKyt2NkY2THpEUkF1VmNwNmNDcjkwR25l?=
 =?utf-8?B?UE83ZVRDQU5CbDhNWVdYdysyRGNnaFk2OXgyRDVVYWlUMDJ5b1hOemc2U0FI?=
 =?utf-8?B?cGhRcEVmc0hISWZpSnliejFWMzhmME9pODYzUFZyY2F6MTl1d1h6RG1tRVNx?=
 =?utf-8?B?L1loelVoNzZDcUtsUmlJak04bkc1VVhQaVpqMVZWVXFSeDhqM3R5QktxQ21r?=
 =?utf-8?B?U09nZzhMVmcrbWQxR05QeWFBQmFkdXhSR0tjTmRzZ2dNR0gyMm01V3VFd0hR?=
 =?utf-8?B?YTBpZG9iRG9EWTFiM1hER3daaVBEakVNWXUrY0Z6d3RYZ3NNNC80eTlWNlA0?=
 =?utf-8?B?bXltd3F1NTU5enNuc3FMaGo1eVNCL3IybDNub2lTWTZiN2MxVXBXa2Izd3Rp?=
 =?utf-8?B?bkc3aUNKZ1c0T1psU0JnNVR1ZGRuR1cyZzZWU2RhVGRMZXBEZ3Z6enB2ZkM3?=
 =?utf-8?B?THBVV1pRSDJiUUh4Wm9idTFmRG1Oazl0bThETlVvY2N4WTVYdVlqdGFRS2l3?=
 =?utf-8?B?dUp1SFg1L3NEOWR6R3NlZFdGcXIrd3VyZEkzcFBUSTg4d0s3dWZNMjdvczVV?=
 =?utf-8?B?VitFbUxkQWFVMWQvalkraWxzOWxZcCtSMFlzWXg4SlRnbHlvZk1kbDNHZFMw?=
 =?utf-8?B?SjF0bzY4SzY1QWI5d1VENUVNbWZyQk9BSHFRUFQ1Ylc2NGFBeEhFOWltTW5Y?=
 =?utf-8?Q?V7yY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4700a2d-53c9-449e-8f72-08ddbfac348b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 12:20:49.4785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpW/quKmJRuDzHxFO5YE6eX2mOMsXGDYn8GaI5owdk0zOm96S4VKlmlQQKAfejGr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6149
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

On 10.07.25 14:13, Mario Limonciello wrote:
> On 7/10/2025 2:23 AM, Samuel Zhang wrote:
>> For normal hibernation, GPU do not need to be resumed in thaw since it is
>> not involved in writing the hibernation image. Skip resume in this case
>> can reduce the hibernation time.
>>
>> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
>> this can save 50 minutes.
>>
>> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
>> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>

I think we now have reviews and acks for all patches, don't we?

What was the conclusion on how this should go upstream? Through drm-misc-next?

I've seen that you asked Mario, but I think I missed the response.

Regards,
Christian.

> 
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 1c54b2e5a225..021defca9b61 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>>       if (amdgpu_ras_intr_triggered())
>>           return;
>>   +    /* device maybe not resumed here, return immediately in this case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return;
>> +
>>       /* if we are running in a VM, make sure the device
>>        * torn down properly on reboot/shutdown.
>>        * unfortunately we can't detect certain
>> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>       struct amdgpu_device *adev = drm_to_adev(drm_dev);
>>   +    /* device maybe not resumed here, return immediately in this case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return 0;
>> +
>>       /* Return a positive number here so
>>        * DPM_FLAG_SMART_SUSPEND works properly
>>        */
>> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>>   +    /* do not resume device if it's normal hibernation */
>> +    if (!pm_hibernate_is_recovering())
>> +        return 0;
>> +
>>       return amdgpu_device_resume(drm_dev, true);
>>   }
>>     static int amdgpu_pmops_poweroff(struct device *dev)
>>   {
>>       struct drm_device *drm_dev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(drm_dev);
>> +
>> +    /* device maybe not resumed here, return immediately in this case */
>> +    if (adev->in_s4 && adev->in_suspend)
>> +        return 0;
>>         return amdgpu_device_suspend(drm_dev, true);
>>   }
> 

