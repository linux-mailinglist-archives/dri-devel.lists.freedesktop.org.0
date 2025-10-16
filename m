Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E90BE578F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 22:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6472710E0EF;
	Thu, 16 Oct 2025 20:54:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jT4asTKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 840D010E0EF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 20:54:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KizielrRLS6MsfWFxdx4Scxcg1/4JMIQkcqN8FVDgBYU5Si0puZvSnTBpWDbyc7jHQPa122D4ftQVXhPG6cBBOsHzIQK+P07p5u/t6pKworVo9evNnK/LXuP3HT+FM5w0jcVV93tKwcd849TxPEUu+GZ0f6iMGq7FNRyxhwyLLJ6Ml1regQat4tNdhKsmdmarIOaEqhbtQ4GL3DWDDGqARFvGTVnkv7n/9RJCn+3ALl8KmV9SEbm5GxvfV3YhLdtbAm+fMHZ64sHQiUV8p87PR5xdb9h9zjPFM5w81n4maBIDBT6gSxg3c+7a5qOoCMG+tueY0/+Lsj/CcOFgg/htg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrP5tq9iJXkEHL1vARDRV9ZgDdBJ1Qw8+KUSTL2SdJk=;
 b=khPA8K4pSkb3Z42XXcFvPKVEgFXvm2M2QPMOWhPuCrpuVJEY/xlH76v23lwgjQzT8Kkc8YqOTSs6rPGew1KgI8XWXQWspaOPKU6AbZe6mkgwpgZTFB0XBYVBU5jHoEI19AyTyyteBJBZO4PbDsm6QJrdul2HPtb/bF+81c/wKppGnmgDmPrLjjXmdleoM0K9BsIw/B6snQHGa8tF7J0+Q0SOuRjcBjBVohqjUGth5Lr1fU2poz11e14bJ1XYzSUO1DSe9Y8HZ5XvcBbWtheDBsQCvE7nEZNVvGEI2UKuzyh51gGu3dtlCaIdin3Jo8F/Sq5FvNC328EJGFVY8Q+xKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrP5tq9iJXkEHL1vARDRV9ZgDdBJ1Qw8+KUSTL2SdJk=;
 b=jT4asTKSDZRCWPdQP1hFMO0Bg4ALvv0UAKEbb7SeIxZZatjQBt/WLDFew0E2ugYQBvxX0fnPRkhouR6u8IXE9dAcY0fs9uVDeurkX9tt9JhmSoVWGvoRmkyEdvqcxoae+YeF12guyA/TG3IgFhPHY1wsfxVISGpJcdvNhXNGJQU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 20:54:53 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 20:54:52 +0000
Message-ID: <19415004-ed31-4388-ba40-deb63767c31b@amd.com>
Date: Thu, 16 Oct 2025 15:54:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/amdxdna: Support firmware debug buffer
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com
References: <20251016203016.819441-1-lizhi.hou@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251016203016.819441-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR03CA0082.namprd03.prod.outlook.com
 (2603:10b6:5:333::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 29543e53-1d64-4e52-941c-08de0cf64115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEtnZDJOdFJ5ZmhLV1dwazV1cDhRaXJBRy9kZmxFZndEbloyckZZRUJSb3Zh?=
 =?utf-8?B?TUkvZEtxZC8zS2ZxZ3hoS042WGN3Z1JHZzVJKzVObTV0SCtjb3AvVlFyZkl1?=
 =?utf-8?B?NHBCb0I0QjVqTENSS2FUc21CZ0crY2FiMUl6ZWRaNXhsYWxBYzZudVBKclU1?=
 =?utf-8?B?Mitpby9VQTZqMUZRQkswTWs0bWZ0SnFTMVBaaUFvbUZMTlBnbjFqSDd4YlB3?=
 =?utf-8?B?RklaY1ZOZEJ6bzFxQ3hiVFdIWXZ3NGpOMUowMGJHWXNmMXN6clFsL2xGWFNi?=
 =?utf-8?B?V3JpQ29VWWlyOElVeFhXNTl0WWs2R1NIdTRsdXpQam5Hb2ZYeVFkZ1RlVkp3?=
 =?utf-8?B?Q3F2K3BvSmRSTDA3Q1NoM2dJNXpRUGZJWWhUL2VSTW5ZM2Q1VUVadUo5RzMv?=
 =?utf-8?B?a3BRQ1F4Mk41VCtOdUFSUnlEc1R2cllDYXo0Z1ZLYVhjaDUxNnJLZ0VCakpw?=
 =?utf-8?B?YXl6OXYycWw0aFZ5S1FWZEErcUQwTWhkNFhubVlwN01HOTJWMVZLTWkrNXBQ?=
 =?utf-8?B?T0pyZE1Qd0JNcUQyVHpjZFJlNUhtUUllTEVKS1hmNEF5aGFPN0REYk4zWitB?=
 =?utf-8?B?cHZGc3dzYVd5N0Vta3ZudTJwY3NtL3JqWFFIRmx2K1JhajJRSms3VFY5UlRi?=
 =?utf-8?B?UnlYZVlwY3FoY2pLRjgyUWtwcWpXQlZxWEswSmJQS2tEV0xaRlpPUzNmV2J6?=
 =?utf-8?B?YVU0dEZ2SUI4UCtpbFgyWk9jOWY3eDRUVDMvWmljWVpjTmRZWjdScVhZOFlD?=
 =?utf-8?B?RFRTNHd6dDFIYUpVMW5WWFhjQlc1U1NPUkR2cXhIOHE3WTRTWkMxcnZUQ2lM?=
 =?utf-8?B?NmFrb0M1Y2VuenBIYzd6UnhHbXYyMVhCakNQaHh0WnZOMXpyYjZQQVNLSWVh?=
 =?utf-8?B?VHkxWitlN3JWZDBQQjRLY29FV2ZPQ2k0UGxwTFZISmt4UzluNHBURlgxempn?=
 =?utf-8?B?aWhMRXhPczZ4NXlCYUV2aGdjc3FmOURiemFVTnNpVDZsd2ltYnRpU3grVDBW?=
 =?utf-8?B?V1FpbjBYYzRxMHJyNjFxbUFlaXM0S21rVEljSnZqL2pLcFl5OHBkVDdWZExp?=
 =?utf-8?B?MlErTWVqOVVEdW9RNUdGWXRsbFR6ek9FWFVUSW91WmNRNmo0WWVtZ2E5cnBL?=
 =?utf-8?B?ZGRRRVBCYWhQYS9hZkhlV0NRTzZMLzU1VGNWd0tBWHBVSTBQOGNSSlRUNmVv?=
 =?utf-8?B?a0RNaXgzN1ZPRUo5S29kdnUrOHY3ZmJXeVdsOGtyR3FqaEVIcmUxRFZqTDhI?=
 =?utf-8?B?UzFUYUhUc3pGWUxlQVdzRXRWc0RVMjR3WG13dWUvbERabXhjcU51d2piQnMx?=
 =?utf-8?B?SWd4bHFuZzZpc1FncVpzdGtuL0RDWHpLbUZ3bE5CSmsyKzQvY3FZN3lseWFH?=
 =?utf-8?B?TlZncWdLMEZQeWtQRWd1R0FZY0lvTDNrRGZLWGxuOXVQQzhVN2R2b2o1bGRG?=
 =?utf-8?B?YU5IaDBZa0tMOEhXQi9mZVRvcE1HMVJLRkNEakFWcEJqUEdmMDBUWjZRM09B?=
 =?utf-8?B?cDdXbUhNZGJiVWF5Y3hHaDVtRDRIbzJRL1M2YjJOU0ROc3JvNEpLTW9sT2ky?=
 =?utf-8?B?ZHRTNE9UY2syL3lLUW9sZG1uTkQ3NkpRQUlSdUNqbmxSOHBXSlRzZ0d2Tldk?=
 =?utf-8?B?NkR4SlNubUdFa0c0djJpbnBFTURWR0JRVmF0dVcrL3JtY1cyZmtwYmxQZ0VJ?=
 =?utf-8?B?cTZQRVlVV3ExZHdTNlhZUjBROGdWa2Fic0Q4WlBmMTYyZ1NTVGZFd3kvRnIy?=
 =?utf-8?B?eXQxdFVHM2swNFBBd21jZGtoRHBTd09hSms3WDYxYWVhNFF3TlQ1TXFPSE9n?=
 =?utf-8?B?RExLaWhKUm5Bczd6bVNoQkJBd2dXYjU0MisvSmFlMGo2bGVpRHVUVWJVSjZW?=
 =?utf-8?B?K1ltbG94MWdjbjRybGs5SE9RZ3Rlajg3dUtxa2E1Vzh6MVVubkVLcHdkcTVS?=
 =?utf-8?Q?KUN3y6e9CCwqtsg4sEMcb8vSO8mpzrKd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjZwT1pYMG02aVorZXBvcEZYN0RHdnl0M3BMRUF6aDZHMW9NYTNRRjY1THNE?=
 =?utf-8?B?RmRBVHhXVFZ1dVNTQWVuUzc0NFNLbUcvN1VCemF5MThLQnQrbDgyREkxL29I?=
 =?utf-8?B?Z3hrZG1kZUl6VEhZSWNwR1B0MVNOL29GVk01NlZqUENtUStNWi9yQlFGNUIv?=
 =?utf-8?B?VmczKzVmWUNiNTh4YXNidVd6cWc4c3lLcFljSTFRUld2eHNhcnE1ZlpRNVZl?=
 =?utf-8?B?czR6OHVvbnRWcEtPMjZBMDdLRkprdFFUSWdxZUlyd2lXYWdmVEdiWUF4TU1D?=
 =?utf-8?B?RkhjTC9kTWlYMFFDNUNWNjlKa3RTZzhXL1psWEg2bmkyNVljdk5NTHRxK2Zy?=
 =?utf-8?B?RzdLdHltK2dodkZhZnpFTEtEaHRpM0s1Vkp2WVd4L3U1cXUrckZqSk5uMnkw?=
 =?utf-8?B?ZEtmQTF2WSs2THZqWGo1OVd6UW9rUFdDZ0p6QkZMd0QvUGNDRjB4MmxEbXdO?=
 =?utf-8?B?NXdlUUdya3huV2w0Z1hKRDRaNkYxOW9reFM0RmFHVll2UGZ6OTFaVzBUa25j?=
 =?utf-8?B?NVUwRGxrYURqWi9vSWRnQnl2Mnhhak5VL1NKL0UzTXh5cENIMFdEbkIvWUxM?=
 =?utf-8?B?ZEIwOEhGVmhaamNNZzF3NDhQNERYQ0RFRWxBcE9nUmx3REFmald3Um1FMWVC?=
 =?utf-8?B?dDhUd3VJQldVcUcvTlhyVytOZFFJaTc4NkRWQytUb05FRFg5SDFhc0tHWEw2?=
 =?utf-8?B?aTBPbUw0MEhYNWRPekc0T3lLT0xjeG9UL3V5QitpN09hSDdxTzlPbWhLN1pa?=
 =?utf-8?B?bkpnU09ZZ0t5NWZZNEhqeHNQZk9nMWRRb2JiMHhSaUFNVTd3V2I5QUFJUU5q?=
 =?utf-8?B?QWdmcU00TFRmU0ZieDBvdC9ZSGw1NDROOVJ5ZnVDdlkzK0tsMkRBNmZ5azFW?=
 =?utf-8?B?OU8vaUR1M1RiRjVIVVlnZTJPMlEzekJOWFhKSXdJOUQwaXFJT3k1YkloVzJD?=
 =?utf-8?B?OGkweUZiMlR5ZEVIeUF6RDJabitCV21lNmhtUEJxSERodXQ1a0hDSm00M3E5?=
 =?utf-8?B?OStZZDFOOWMzOXV2RXRuYXc0Qi9Pc3pRUkNSaENvU3FzRkZTbXgxVW4ybGM4?=
 =?utf-8?B?Q29xZ3UwU3NOSnU1WHZyNytTUVNLZUpqTVRlRHNpd01oVEpnaGZtanBmdlE2?=
 =?utf-8?B?WllRVmxKcmloUlN1SjVzQVE0SFZlT1YwckM1SGVwWTk2dHFsdUFUbEVKUmRm?=
 =?utf-8?B?OGlBYld3RExZcFhZMXRCNzUyQ010TkJiTEFVVGk1M2huSTN4TDQxalRPZGtS?=
 =?utf-8?B?L284Nm1Iak9nMy9Bbi9PS0FRM1RxQ0pET2JYVjlPMmxhTWdnaXlaemhYQ2Zm?=
 =?utf-8?B?bERzd1FidHNYV1VHbHQwWklnQWJBMHNaa1A0U05lQ2dSTGZnVndWeVU1RnR0?=
 =?utf-8?B?RlFTQjE2T1UrOUJkV1NXUkNvbTR5bWQ2aXl2bWFRVEZFeHRNZzgyQXY0Q2h3?=
 =?utf-8?B?Ynk5SmZpUHpXV3EyVGNrMXBRN3c0VGZjbk9NeDF2QmZBa1ZhNUdiUWxmQnV4?=
 =?utf-8?B?MU16OTBuTEJvajlRNzFYRGdnV2pjYkNWSWpKamEvaXltSkxjQ2ZYeUQwcHIz?=
 =?utf-8?B?c2dFc1ZiVEFNT1ZJUGtRNTFxTE5HdDg1VlVvM3YwNCtVQTRQa3pNa21hZHVr?=
 =?utf-8?B?emxqUUNJVzJzTkZ2TWNMK04vRnFoKytINVpmQ0Rvc0RNRk5oUFgzQzV5bE9O?=
 =?utf-8?B?UWxhaURQYU8zRmFQV0pxWitOZWJaYlRGRWNzMHZiT3pkcTNUQjBlVEN6cDNW?=
 =?utf-8?B?dmRNY0E5SDNleVNIYm9IbWtFTzNiT3JyVWJmaUJHQ2U1R0taQ3ExalM1SkVt?=
 =?utf-8?B?eVpmN2IzY3NmQ0hjR0VMaTJ3dnJQK3pHMEE2UjlrNHFGdTdzZHMvYnBQMUlK?=
 =?utf-8?B?dXBlOThCMk1UeC9HL0t3Wm5MV1RVTE5OQ1NBMTBrQU85Q0hKY0o0cGVYa3p2?=
 =?utf-8?B?MHBxdHNhbm9ySk9WS2d4VEdWVnVpSWdlb2lZSTdVMzA2blhJRkZlMzlkZXNx?=
 =?utf-8?B?cVQ0UzZjamZiemcySHFqUkVSR05hWnhjdDRWaXJGeVRGNjNnZ0hDYkFQdGYv?=
 =?utf-8?B?TUJOdTJHb2ZQTzVvRm9mVGdJUmp1Z1UrbjdYVVpNOXJoYVdjTnhvVTB4ZjQ0?=
 =?utf-8?Q?hHeNAxxRb+NmxKBAooVut3+AO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29543e53-1d64-4e52-941c-08de0cf64115
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 20:54:52.8609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnSvgRRMG7uAYRv3EiIb6UWi4N8ItqJohMYuEgW1ETYqPYAuLXP17ZwGtc4WNgUQ7LGAP18nbsh4wZBrgMOxBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445
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

On 10/16/25 3:30 PM, Lizhi Hou wrote:
> To collect firmware debug information, the userspace application allocates
> a AMDXDNA_BO_DEV buffer object through DRM_IOCTL_AMDXDNA_CREATE_BO.
> Then it associates the buffer with the hardware context through
> DRM_IOCTL_AMDXDNA_CONFIG_HWCTX which requests firmware to bind the buffer
> through a mailbox command. The firmware then writes the debug data into
> this buffer. The buffer can be mapped into userspace so that
> applications can retrieve and analyze the firmware debug information.

Let me ask a high level question.  Do we really want all userspace to 
always have access to this debug information?  Could this leak 
information between processes potentially?

Two ideas:

1) I wonder if this is better placed in debugfs files.
2) If this architecture does make sense - what are your thoughts on 
tying the ability to use it to kernel lockdown?

> 
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   drivers/accel/amdxdna/TODO              |   1 -
>   drivers/accel/amdxdna/aie2_ctx.c        | 116 ++++++++++++++++++++++--
>   drivers/accel/amdxdna/aie2_message.c    |  31 ++++++-
>   drivers/accel/amdxdna/aie2_msg_priv.h   |  13 +++
>   drivers/accel/amdxdna/aie2_pci.c        |   1 +
>   drivers/accel/amdxdna/aie2_pci.h        |   3 +
>   drivers/accel/amdxdna/amdxdna_ctx.c     |  39 +++++++-
>   drivers/accel/amdxdna/amdxdna_ctx.h     |  16 +++-
>   drivers/accel/amdxdna/amdxdna_gem.c     |   3 +
>   drivers/accel/amdxdna/amdxdna_gem.h     |   6 ++
>   drivers/accel/amdxdna/amdxdna_pci_drv.c |   3 +-
>   drivers/accel/amdxdna/amdxdna_pci_drv.h |   1 +
>   drivers/accel/amdxdna/npu1_regs.c       |   1 +
>   drivers/accel/amdxdna/npu4_regs.c       |   1 +
>   14 files changed, 221 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/accel/amdxdna/TODO b/drivers/accel/amdxdna/TODO
> index ad8ac6e315b6..0e4bbebeaedf 100644
> --- a/drivers/accel/amdxdna/TODO
> +++ b/drivers/accel/amdxdna/TODO
> @@ -1,2 +1 @@
>   - Add debugfs support
> -- Add debug BO support
> diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
> index ab4d66f1325d..63450b7773ac 100644
> --- a/drivers/accel/amdxdna/aie2_ctx.c
> +++ b/drivers/accel/amdxdna/aie2_ctx.c
> @@ -226,11 +226,10 @@ aie2_sched_resp_handler(void *handle, void __iomem *data, size_t size)
>   }
>   
>   static int
> -aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
> +aie2_sched_drvcmd_resp_handler(void *handle, void __iomem *data, size_t size)
>   {
>   	struct amdxdna_sched_job *job = handle;
>   	int ret = 0;
> -	u32 status;
>   
>   	if (unlikely(!data))
>   		goto out;
> @@ -240,8 +239,7 @@ aie2_sched_nocmd_resp_handler(void *handle, void __iomem *data, size_t size)
>   		goto out;
>   	}
>   
> -	status = readl(data);
> -	XDNA_DBG(job->hwctx->client->xdna, "Resp status 0x%x", status);
> +	job->drv_cmd->result = readl(data);
>   
>   out:
>   	aie2_sched_notify(job);
> @@ -314,8 +312,18 @@ aie2_sched_job_run(struct drm_sched_job *sched_job)
>   	kref_get(&job->refcnt);
>   	fence = dma_fence_get(job->fence);
>   
> -	if (unlikely(!cmd_abo)) {
> -		ret = aie2_sync_bo(hwctx, job, aie2_sched_nocmd_resp_handler);
> +	if (job->drv_cmd) {
> +		switch (job->drv_cmd->opcode) {
> +		case SYNC_DEBUG_BO:
> +			ret = aie2_sync_bo(hwctx, job, aie2_sched_drvcmd_resp_handler);
> +			break;
> +		case ATTACH_DEBUG_BO:
> +			ret = aie2_config_debug_bo(hwctx, job, aie2_sched_drvcmd_resp_handler);
> +			break;
> +		default:
> +			ret = -EINVAL;
> +			break;
> +		}
>   		goto out;
>   	}
>   
> @@ -766,6 +774,74 @@ static int aie2_hwctx_cu_config(struct amdxdna_hwctx *hwctx, void *buf, u32 size
>   	return ret;
>   }
>   
> +static void aie2_cmd_wait(struct amdxdna_hwctx *hwctx, u64 seq)
> +{
> +	struct dma_fence *out_fence = aie2_cmd_get_out_fence(hwctx, seq);
> +
> +	if (!out_fence) {
> +		XDNA_ERR(hwctx->client->xdna, "Failed to get fence");
> +		return;
> +	}
> +
> +	dma_fence_wait_timeout(out_fence, false, MAX_SCHEDULE_TIMEOUT);
> +	dma_fence_put(out_fence);
> +}
> +
> +static int aie2_hwctx_cfg_debug_bo(struct amdxdna_hwctx *hwctx, u32 bo_hdl,
> +				   bool attach)
> +{
> +	struct amdxdna_client *client = hwctx->client;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_drv_cmd cmd = { 0 };
> +	struct amdxdna_gem_obj *abo;
> +	u64 seq;
> +	int ret;
> +
> +	abo = amdxdna_gem_get_obj(client, bo_hdl, AMDXDNA_BO_DEV);
> +	if (!abo) {
> +		XDNA_ERR(xdna, "Get bo %d failed", bo_hdl);
> +		return -EINVAL;
> +	}
> +
> +	if (attach) {
> +		if (abo->assigned_hwctx != AMDXDNA_INVALID_CTX_HANDLE) {
> +			ret = -EBUSY;
> +			goto put_obj;
> +		}
> +		cmd.opcode = ATTACH_DEBUG_BO;
> +	} else {
> +		if (abo->assigned_hwctx != hwctx->id) {
> +			ret = -EINVAL;
> +			goto put_obj;
> +		}
> +		cmd.opcode = DETACH_DEBUG_BO;
> +	}
> +
> +	ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
> +				 &bo_hdl, 1, hwctx->id, &seq);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Submit command failed");
> +		goto put_obj;
> +	}
> +
> +	aie2_cmd_wait(hwctx, seq);
> +	if (cmd.result) {
> +		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
> +		goto put_obj;
> +	}
> +
> +	if (attach)
> +		abo->assigned_hwctx = hwctx->id;
> +	else
> +		abo->assigned_hwctx = AMDXDNA_INVALID_CTX_HANDLE;
> +
> +	XDNA_DBG(xdna, "Config debug BO %d to %s", bo_hdl, hwctx->name);
> +
> +put_obj:
> +	amdxdna_gem_put_obj(abo);
> +	return ret;
> +}
> +
>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size)
>   {
>   	struct amdxdna_dev *xdna = hwctx->client->xdna;
> @@ -775,14 +851,40 @@ int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *bu
>   	case DRM_AMDXDNA_HWCTX_CONFIG_CU:
>   		return aie2_hwctx_cu_config(hwctx, buf, size);
>   	case DRM_AMDXDNA_HWCTX_ASSIGN_DBG_BUF:
> +		return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, true);
>   	case DRM_AMDXDNA_HWCTX_REMOVE_DBG_BUF:
> -		return -EOPNOTSUPP;
> +		return aie2_hwctx_cfg_debug_bo(hwctx, (u32)value, false);
>   	default:
>   		XDNA_DBG(xdna, "Not supported type %d", type);
>   		return -EOPNOTSUPP;
>   	}
>   }
>   
> +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl)
> +{
> +	struct amdxdna_client *client = hwctx->client;
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_drv_cmd cmd = { 0 };
> +	u64 seq;
> +	int ret;
> +
> +	cmd.opcode = SYNC_DEBUG_BO;
> +	ret = amdxdna_cmd_submit(client, &cmd, AMDXDNA_INVALID_BO_HANDLE,
> +				 &debug_bo_hdl, 1, hwctx->id, &seq);
> +	if (ret) {
> +		XDNA_ERR(xdna, "Submit command failed");
> +		return ret;
> +	}
> +
> +	aie2_cmd_wait(hwctx, seq);
> +	if (cmd.result) {
> +		XDNA_ERR(xdna, "Response failure 0x%x", cmd.result);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>   static int aie2_populate_range(struct amdxdna_gem_obj *abo)
>   {
>   	struct amdxdna_dev *xdna = to_xdna_dev(to_gobj(abo)->dev);
> diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
> index 4660e8297ed8..0ec1dc6fe668 100644
> --- a/drivers/accel/amdxdna/aie2_message.c
> +++ b/drivers/accel/amdxdna/aie2_message.c
> @@ -749,7 +749,7 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   	int ret = 0;
>   
>   	req.src_addr = 0;
> -	req.dst_addr = abo->mem.dev_addr - hwctx->client->dev_heap->mem.dev_addr;
> +	req.dst_addr = amdxdna_dev_bo_offset(abo);
>   	req.size = abo->mem.size;
>   
>   	/* Device to Host */
> @@ -773,3 +773,32 @@ int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   
>   	return 0;
>   }
> +
> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +			 int (*notify_cb)(void *, void __iomem *, size_t))
> +{
> +	struct mailbox_channel *chann = hwctx->priv->mbox_chann;
> +	struct amdxdna_gem_obj *abo = to_xdna_obj(job->bos[0]);
> +	struct amdxdna_dev *xdna = hwctx->client->xdna;
> +	struct config_debug_bo_req req;
> +	struct xdna_mailbox_msg msg;
> +
> +	if (job->drv_cmd->opcode == ATTACH_DEBUG_BO)
> +		req.config = DEBUG_BO_REGISTER;
> +	else
> +		req.config = DEBUG_BO_UNREGISTER;
> +
> +	req.offset = amdxdna_dev_bo_offset(abo);
> +	req.size = abo->mem.size;
> +
> +	XDNA_DBG(xdna, "offset 0x%llx size 0x%llx config %d",
> +		 req.offset, req.size, req.config);
> +
> +	msg.handle = job;
> +	msg.notify_cb = notify_cb;
> +	msg.send_data = (u8 *)&req;
> +	msg.send_size = sizeof(req);
> +	msg.opcode = MSG_OP_CONFIG_DEBUG_BO;
> +
> +	return xdna_mailbox_send_msg(chann, &msg, TX_TIMEOUT);
> +}
> diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
> index 6df9065b13f6..6a5c70bff5e9 100644
> --- a/drivers/accel/amdxdna/aie2_msg_priv.h
> +++ b/drivers/accel/amdxdna/aie2_msg_priv.h
> @@ -18,6 +18,7 @@ enum aie2_msg_opcode {
>   	MSG_OP_CONFIG_CU                   = 0x11,
>   	MSG_OP_CHAIN_EXEC_BUFFER_CF        = 0x12,
>   	MSG_OP_CHAIN_EXEC_DPU              = 0x13,
> +	MSG_OP_CONFIG_DEBUG_BO             = 0x14,
>   	MSG_OP_MAX_XRT_OPCODE,
>   	MSG_OP_SUSPEND                     = 0x101,
>   	MSG_OP_RESUME                      = 0x102,
> @@ -365,4 +366,16 @@ struct sync_bo_req {
>   struct sync_bo_resp {
>   	enum aie2_msg_status	status;
>   } __packed;
> +
> +struct config_debug_bo_req {
> +	__u64	offset;
> +	__u64	size;
> +#define DEBUG_BO_UNREGISTER 0
> +#define DEBUG_BO_REGISTER   1
> +	__u32	config;
> +} __packed;
> +
> +struct config_debug_bo_resp {
> +	enum aie2_msg_status	status;
> +} __packed;
>   #endif /* _AIE2_MSG_PRIV_H_ */
> diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
> index cfca4e456b61..f48045318dc0 100644
> --- a/drivers/accel/amdxdna/aie2_pci.c
> +++ b/drivers/accel/amdxdna/aie2_pci.c
> @@ -1004,6 +1004,7 @@ const struct amdxdna_dev_ops aie2_ops = {
>   	.hwctx_init = aie2_hwctx_init,
>   	.hwctx_fini = aie2_hwctx_fini,
>   	.hwctx_config = aie2_hwctx_config,
> +	.hwctx_sync_debug_bo = aie2_hwctx_sync_debug_bo,
>   	.cmd_submit = aie2_cmd_submit,
>   	.hmm_invalidate = aie2_hmm_invalidate,
>   	.get_array = aie2_get_array,
> diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
> index 34bc35479f42..243ac21d50c1 100644
> --- a/drivers/accel/amdxdna/aie2_pci.h
> +++ b/drivers/accel/amdxdna/aie2_pci.h
> @@ -287,11 +287,14 @@ int aie2_cmdlist_multi_execbuf(struct amdxdna_hwctx *hwctx,
>   			       int (*notify_cb)(void *, void __iomem *, size_t));
>   int aie2_sync_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
>   		 int (*notify_cb)(void *, void __iomem *, size_t));
> +int aie2_config_debug_bo(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job,
> +			 int (*notify_cb)(void *, void __iomem *, size_t));
>   
>   /* aie2_hwctx.c */
>   int aie2_hwctx_init(struct amdxdna_hwctx *hwctx);
>   void aie2_hwctx_fini(struct amdxdna_hwctx *hwctx);
>   int aie2_hwctx_config(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
> +int aie2_hwctx_sync_debug_bo(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl);
>   void aie2_hwctx_suspend(struct amdxdna_client *client);
>   int aie2_hwctx_resume(struct amdxdna_client *client);
>   int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.c b/drivers/accel/amdxdna/amdxdna_ctx.c
> index 868ca369e0a0..d18182c59668 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.c
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.c
> @@ -328,6 +328,38 @@ int amdxdna_drm_config_hwctx_ioctl(struct drm_device *dev, void *data, struct dr
>   	return ret;
>   }
>   
> +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl)
> +{
> +	struct amdxdna_dev *xdna = client->xdna;
> +	struct amdxdna_hwctx *hwctx;
> +	struct amdxdna_gem_obj *abo;
> +	struct drm_gem_object *gobj;
> +	int ret, idx;
> +
> +	if (!xdna->dev_info->ops->hwctx_sync_debug_bo)
> +		return -EOPNOTSUPP;
> +
> +	gobj = drm_gem_object_lookup(client->filp, debug_bo_hdl);
> +	if (!gobj)
> +		return -EINVAL;
> +
> +	abo = to_xdna_obj(gobj);
> +	guard(mutex)(&xdna->dev_lock);
> +	idx = srcu_read_lock(&client->hwctx_srcu);
> +	hwctx = xa_load(&client->hwctx_xa, abo->assigned_hwctx);
> +	if (!hwctx) {
> +		ret = -EINVAL;
> +		goto unlock_srcu;
> +	}
> +
> +	ret = xdna->dev_info->ops->hwctx_sync_debug_bo(hwctx, debug_bo_hdl);
> +
> +unlock_srcu:
> +	srcu_read_unlock(&client->hwctx_srcu, idx);
> +	drm_gem_object_put(gobj);
> +	return ret;
> +}
> +
>   static void
>   amdxdna_arg_bos_put(struct amdxdna_sched_job *job)
>   {
> @@ -393,6 +425,7 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job)
>   }
>   
>   int amdxdna_cmd_submit(struct amdxdna_client *client,
> +		       struct amdxdna_drv_cmd *drv_cmd,
>   		       u32 cmd_bo_hdl, u32 *arg_bo_hdls, u32 arg_bo_cnt,
>   		       u32 hwctx_hdl, u64 *seq)
>   {
> @@ -406,6 +439,8 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
>   	if (!job)
>   		return -ENOMEM;
>   
> +	job->drv_cmd = drv_cmd;
> +
>   	if (cmd_bo_hdl != AMDXDNA_INVALID_BO_HANDLE) {
>   		job->cmd_bo = amdxdna_gem_get_obj(client, cmd_bo_hdl, AMDXDNA_BO_CMD);
>   		if (!job->cmd_bo) {
> @@ -413,8 +448,6 @@ int amdxdna_cmd_submit(struct amdxdna_client *client,
>   			ret = -EINVAL;
>   			goto free_job;
>   		}
> -	} else {
> -		job->cmd_bo = NULL;
>   	}
>   
>   	ret = amdxdna_arg_bos_lookup(client, job, arg_bo_hdls, arg_bo_cnt);
> @@ -508,7 +541,7 @@ static int amdxdna_drm_submit_execbuf(struct amdxdna_client *client,
>   		}
>   	}
>   
> -	ret = amdxdna_cmd_submit(client, cmd_bo_hdl, arg_bo_hdls,
> +	ret = amdxdna_cmd_submit(client, NULL, cmd_bo_hdl, arg_bo_hdls,
>   				 args->arg_count, args->hwctx, &args->seq);
>   	if (ret)
>   		XDNA_DBG(xdna, "Submit cmds failed, ret %d", ret);
> diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
> index 7cd7a55936f0..cbe60efbe60b 100644
> --- a/drivers/accel/amdxdna/amdxdna_ctx.h
> +++ b/drivers/accel/amdxdna/amdxdna_ctx.h
> @@ -95,6 +95,17 @@ struct amdxdna_hwctx {
>   #define drm_job_to_xdna_job(j) \
>   	container_of(j, struct amdxdna_sched_job, base)
>   
> +enum amdxdna_job_opcode {
> +	SYNC_DEBUG_BO,
> +	ATTACH_DEBUG_BO,
> +	DETACH_DEBUG_BO,
> +};
> +
> +struct amdxdna_drv_cmd {
> +	enum amdxdna_job_opcode	opcode;
> +	u32			result;
> +};
> +
>   struct amdxdna_sched_job {
>   	struct drm_sched_job	base;
>   	struct kref		refcnt;
> @@ -106,6 +117,7 @@ struct amdxdna_sched_job {
>   	struct dma_fence	*out_fence;
>   	bool			job_done;
>   	u64			seq;
> +	struct amdxdna_drv_cmd	*drv_cmd;
>   	struct amdxdna_gem_obj	*cmd_bo;
>   	size_t			bo_cnt;
>   	struct drm_gem_object	*bos[] __counted_by(bo_cnt);
> @@ -143,9 +155,11 @@ void amdxdna_sched_job_cleanup(struct amdxdna_sched_job *job);
>   void amdxdna_hwctx_remove_all(struct amdxdna_client *client);
>   int amdxdna_hwctx_walk(struct amdxdna_client *client, void *arg,
>   		       int (*walk)(struct amdxdna_hwctx *hwctx, void *arg));
> +int amdxdna_hwctx_sync_debug_bo(struct amdxdna_client *client, u32 debug_bo_hdl);
>   
>   int amdxdna_cmd_submit(struct amdxdna_client *client,
> -		       u32 cmd_bo_hdls, u32 *arg_bo_hdls, u32 arg_bo_cnt,
> +		       struct amdxdna_drv_cmd *drv_cmd, u32 cmd_bo_hdls,
> +		       u32 *arg_bo_hdls, u32 arg_bo_cnt,
>   		       u32 hwctx_hdl, u64 *seq);
>   
>   int amdxdna_cmd_wait(struct amdxdna_client *client, u32 hwctx_hdl,
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
> index 7f91863c3f24..61e0136c21a8 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.c
> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
> @@ -962,6 +962,9 @@ int amdxdna_drm_sync_bo_ioctl(struct drm_device *dev,
>   	XDNA_DBG(xdna, "Sync bo %d offset 0x%llx, size 0x%llx\n",
>   		 args->handle, args->offset, args->size);
>   
> +	if (args->direction == SYNC_DIRECT_FROM_DEVICE)
> +		ret = amdxdna_hwctx_sync_debug_bo(abo->client, args->handle);
> +
>   put_obj:
>   	drm_gem_object_put(gobj);
>   	return ret;
> diff --git a/drivers/accel/amdxdna/amdxdna_gem.h b/drivers/accel/amdxdna/amdxdna_gem.h
> index ae29db94a9d3..f79fc7f3c93b 100644
> --- a/drivers/accel/amdxdna/amdxdna_gem.h
> +++ b/drivers/accel/amdxdna/amdxdna_gem.h
> @@ -7,6 +7,7 @@
>   #define _AMDXDNA_GEM_H_
>   
>   #include <linux/hmm.h>
> +#include "amdxdna_pci_drv.h"
>   
>   struct amdxdna_umap {
>   	struct vm_area_struct		*vma;
> @@ -62,6 +63,11 @@ static inline void amdxdna_gem_put_obj(struct amdxdna_gem_obj *abo)
>   	drm_gem_object_put(to_gobj(abo));
>   }
>   
> +static inline u64 amdxdna_dev_bo_offset(struct amdxdna_gem_obj *abo)
> +{
> +	return abo->mem.dev_addr - abo->client->dev_heap->mem.dev_addr;
> +}
> +
>   void amdxdna_umap_put(struct amdxdna_umap *mapp);
>   
>   struct drm_gem_object *
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> index 696fdac8ad3c..3599e713bfcb 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
> @@ -28,9 +28,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
>    * 0.0: Initial version
>    * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
>    * 0.2: Support getting last error hardware error
> + * 0.3: Support firmware debug buffer
>    */
>   #define AMDXDNA_DRIVER_MAJOR		0
> -#define AMDXDNA_DRIVER_MINOR		2
> +#define AMDXDNA_DRIVER_MINOR		3
>   
>   /*
>    * Bind the driver base on (vendor_id, device_id) pair and later use the
> diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.h b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> index 626beebf730e..c99477f5e454 100644
> --- a/drivers/accel/amdxdna/amdxdna_pci_drv.h
> +++ b/drivers/accel/amdxdna/amdxdna_pci_drv.h
> @@ -55,6 +55,7 @@ struct amdxdna_dev_ops {
>   	int (*hwctx_init)(struct amdxdna_hwctx *hwctx);
>   	void (*hwctx_fini)(struct amdxdna_hwctx *hwctx);
>   	int (*hwctx_config)(struct amdxdna_hwctx *hwctx, u32 type, u64 value, void *buf, u32 size);
> +	int (*hwctx_sync_debug_bo)(struct amdxdna_hwctx *hwctx, u32 debug_bo_hdl);
>   	void (*hmm_invalidate)(struct amdxdna_gem_obj *abo, unsigned long cur_seq);
>   	int (*cmd_submit)(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq);
>   	int (*get_aie_info)(struct amdxdna_client *client, struct amdxdna_drm_get_info *args);
> diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
> index e4f6dac7d00f..10124cccb102 100644
> --- a/drivers/accel/amdxdna/npu1_regs.c
> +++ b/drivers/accel/amdxdna/npu1_regs.c
> @@ -46,6 +46,7 @@
>   
>   const struct rt_config npu1_default_rt_cfg[] = {
>   	{ 2, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
> +	{ 4, 1, AIE2_RT_CFG_INIT }, /* Debug BO */
>   	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 0 },
>   };
> diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
> index 9f2e33182ec6..e1da882420ec 100644
> --- a/drivers/accel/amdxdna/npu4_regs.c
> +++ b/drivers/accel/amdxdna/npu4_regs.c
> @@ -63,6 +63,7 @@
>   
>   const struct rt_config npu4_default_rt_cfg[] = {
>   	{ 5, 1, AIE2_RT_CFG_INIT }, /* PDI APP LOAD MODE */
> +	{ 10, 1, AIE2_RT_CFG_INIT }, /* DEBUG BUF */
>   	{ 1, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 2, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */
>   	{ 3, 1, AIE2_RT_CFG_CLK_GATING }, /* Clock gating on */

