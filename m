Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6E9AEEFB0
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 09:22:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99D2F10E50F;
	Tue,  1 Jul 2025 07:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fX3dUFJs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE2710E50F
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 07:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pCB51nvD2/JDPVfy/hGeNJ16zNa7o2R3rLDvRfdpzIH5y7AKpiio5PsS81biQliKp97qwmtIkFSUC3eYY3EJIe1v2tRG3Vp9cWOJs5uO8FgBNdnISFeAhqjE8RdpzdlqKEkDIfbD1SyVNUtvtkjSrdYEKdtjOP2r0iUxLvQSbD2kR0tbEQ4rXaZaxSNg/kaYzen38fAcKxrWmL4FuJsXJcwY4YqsaYn+pXQgXggzXDMFGuJwcw4WFpBl2BG2FMG87zrBVcaIV+hg/aSlZkrQoi0w6E6uxDexcaGrYP/DdKY7GV49Vb2o96szdcRbfL63eIPv/7H8wEr7/XbrgE2Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwe5/t4QDyVJM4phYLOcOj7DmnSc3FzTEy5weKAl8FA=;
 b=PZa6r47L5jPR+3i7meCcl7+azrzkcKzfGk863d0359Wxz5GVvJhQKE6QpoI5u3W8P13qi2RuHhLsjkFOImYU0a5pAcMFeK1M5uE1lBQGhzM9/2hvtmMdOiopHzIk6+RYt+lKZoaiHN1CJWZyAoheZjaHjz16CucW2aCHxuBDRBRKaBxox/MOE4m1ENeiMnFy5+DiR/jRw1id2OjPSlNnI+Sg5S3xYgxOXc29lDMsnHoTH9bN+EfJkTyySlO/5IeqkdYQd9OXGTLIz8L+AKBNxKSgv/vulwz3c+RZxOALDba9/r0fH8KRjZ04k/qkX/oYY+hc9fZpPLus5xXhm/bKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwe5/t4QDyVJM4phYLOcOj7DmnSc3FzTEy5weKAl8FA=;
 b=fX3dUFJss8S1T9Bo/cstNAFXVeOgkA0nc3bMyyJ3GB7tOzI8JnK8360t/WlA8PYgsVfgeJpm65J121WmmWW1a4JMdbaq57vx1UkrnKW0Sryh3AAnwwiTPwl+GUCDF2/qK7slGiGyT/x7Cv4zaFxFTlKCAqXQesyUWeS+9jgv38g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6944.namprd12.prod.outlook.com (2603:10b6:a03:47b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 1 Jul
 2025 07:22:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 07:22:30 +0000
Message-ID: <cf6cb95f-df79-40ae-95d5-dc5a7620a136@amd.com>
Date: Tue, 1 Jul 2025 09:22:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] ttm: add objcg pointer to bo and tt
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-13-airlied@gmail.com>
 <20a90668-3ddf-4153-9953-a2df9179a1b1@amd.com>
 <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25ok0Q93+EeyyoR-S0Ffvi-GswDiUGA8rPBwZ+C+5Y8HVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0272.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 6beeb7fc-aa6d-4f37-0096-08ddb8700a19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VUlkNTZJVXZwSDlPbXlHaUE3ODN5K1VFWC9uQ1M4Z1RNQTQyN1VWeXVlTVY0?=
 =?utf-8?B?N1FVZmFkblVlYkhWU2svNVNIS2VnMHEvQ2xkMnRZeHlFZ2FheXpjYU1XZ1hp?=
 =?utf-8?B?UFV3Nm5XS0lYZERNNEl1VEFKNVhiQld0bFhMdWM5em9iNCtBTVJLVVRUS2RF?=
 =?utf-8?B?WVBtZ0pLTzN5RTRUbHlqbHNGenVNWmVvRzVnNFBDeFhQNzhKNUpVVmloZnVa?=
 =?utf-8?B?aDJQZ0h3TFBhRVhlOUJQWkV2SUY1cm1sNU84V1Rkcm9iN1JPUVQrYXZqUHV1?=
 =?utf-8?B?Mm1qSjNkbFdjSkZyWStQeVUwU2pXZGFGelo3NzRzNC9sMjBLdmJxQTZlMXQ3?=
 =?utf-8?B?VnFtZE1BcEFya0c0aEhKbFNtMzFkR0JxK2pLK2xLWmhzc0dEVEM2Q25iaFVm?=
 =?utf-8?B?MU5RRHNjU0k2OE5WMXQrdHczWEh6ci8rZ3l5WDY4aitTTzF2L1UwTUFteU1y?=
 =?utf-8?B?Mk5VQ3JQVVlselhuTGlBTENEVE9KcHVuV1d0dlRwNjgxQllrcmlqSXdUaGU4?=
 =?utf-8?B?QW02WGE4bGZoSkFrbk1TZUI3VzNnOExwN0NpQXZvdllNY0dBTTlHZ0h3Ylor?=
 =?utf-8?B?VXdOM0psTVMzbTd2ajZrS2dZbkxJeWt2VUJmSnI4V3VqMndUS0M3WDhpQloy?=
 =?utf-8?B?VmNXeFlQOG5zalYyUGFxUGY5N05UWTdpZDlQMmUrRnNFTFhBQTlhckhNSFBP?=
 =?utf-8?B?bUFvdG9yVWswdW1FOTV0Nzk4bnJTU0w0d3phY3djUDNtRDlVV2dRdW44RDNT?=
 =?utf-8?B?Q2JCQUEzVWNJSkp3djRRNWFqTGJXVGc1UGEyaXA3N292Qm53OW9WVEZSUlIx?=
 =?utf-8?B?bEdUWXVaZVNyMng3RmtPWG1lN1Nlanc0L1NQQytub054eS9Ud0FCSERrYVd5?=
 =?utf-8?B?YUw5bGtFbFRlOFd2S0RaY1VTSVVnbm5ZdTdnaHZ5cEJtajZxQXVBcWZ0QUhC?=
 =?utf-8?B?YXM1TFg2eVZnYUNsbGNKREVoY3NqOEZGa3V0Ykthd285b3lhaWE1K2s1V1RR?=
 =?utf-8?B?Sm5ldVhMMy9hVVJKQzdkeWNVTEcrSzBtRW9IN0RIMko4SFo3VFFoNklPNjYy?=
 =?utf-8?B?UG1nT2hFL0JEc0Z1NkRiRmwwZVFDbjY3RzJDS1VGMTZTMmZpQWdWSytFQmo5?=
 =?utf-8?B?WjNpODBOcCtHY21zcDVJS29pVXAzcWhRV3hTQjBXd1czVWxwWXJ5RTFjdGUv?=
 =?utf-8?B?TklUY1o2WFpzOGhiZFRVdURvb29qZWc1WGhKOUN2QkM2SjFBME9YSW9EeUpx?=
 =?utf-8?B?Nmh4WE9oS25hUWNwM3VscGhHOHAvNGthZ2Ryb25Ld1dUeWZPRmxQbjFpaEll?=
 =?utf-8?B?UWhWUXlPMjZJNzRsZWt0RlBYYjdiZm9XYTFicFZicVBuWGpXdU5NZW1aa2pn?=
 =?utf-8?B?QnFWZU8xS0FOV3VtSWVVNXZ3T1FHeXpqN0Jlejh5cWFDL3RuMndEKzdCVXBQ?=
 =?utf-8?B?ZlJXNHVPejc5OWY2TU1RRkQySVlpaHdaY3NZM3hESkwvclIvTkowRm42clNS?=
 =?utf-8?B?M3NjMkM3SjFacjhCdy9kTFRWNE1MVjY3NU5jNk9FK20zVkw1RTJqY2lSdy9T?=
 =?utf-8?B?Sm5DTXFRajM4WllqWFhxYytrQmhMWERPQlpicGFnRU1sMnIyblVnV0Racnd3?=
 =?utf-8?B?ejhPUXQ5TUUwS0xraml3TXpCUVV0N2xjQUcyNyttbEdHUUJYTnIvYm5lTXNo?=
 =?utf-8?B?TUJIY1V1R0Q5R21VTktQaG4xcVlPZjhKY2xUcTUwamhzaVlnb3pob0hIbnFP?=
 =?utf-8?B?YVVuUzVwMmJXcTR4S08wNk91TVZQUFYxU3oyNXFjSHcxK1RuZDMrNkp6WE1q?=
 =?utf-8?B?V1RVSldQV2RvaGxOWVl2dnM3amF3MVZEWG9ubGs2Szl6Z05wYjJERGc0SkdL?=
 =?utf-8?B?SGlBVGtCUGIzdFAxaDRsZFhBdlA5WVd0OWV0R2h6dzB2T3RWTHlsd05XTHdi?=
 =?utf-8?Q?K34CDjBXmKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1aalQxb2pZMCt5WGFDWWN1bEVub3QvakR0aXdlWlExYjF3bW9vbkYxbHBk?=
 =?utf-8?B?L3hXRHZUMFFTNVlPeUpBSjcza081V0lMOHJGL1lzYk9KUXorRnR6d3FHSWRv?=
 =?utf-8?B?STVTbE5iem5jZ3N1N0xrYkxNSzVmOVpUeE9NRnlwaWFiZFNIYUsraEdjVG90?=
 =?utf-8?B?NmRZdWlnTGlsWS8rKzZmTzZpbnJoZXN4S0VOblNDaFY3WFpraGtyZGc0MDlP?=
 =?utf-8?B?Vjh6N0J0T3l4U1dXcHVBOFBrWnhqeVlGbnNlbUkzRjlTLzNRQi9yUkR4Q2M5?=
 =?utf-8?B?bDZyYllZYlFFcFZabGwwZ09jczdta0ZoTHllREEvcDFreUJ6akJXeHRtWjdI?=
 =?utf-8?B?QUFGUFQ0SzZIZnJROUMxbDN5bU1rYTI3bmp1c0dsaUQzRkhpbDBGQ3dvTDRp?=
 =?utf-8?B?WVVTc3ZHUTVMQ0xRenY0VUxZaGlSbU8zVlREMW84MGU0Q1FobUR6QS9Ubnd2?=
 =?utf-8?B?VHpqWkQwRzFmazVkQmdxRjVuTlNOZ0Q2UUVFR1loTUpjWXptV3NsR2tZbmMr?=
 =?utf-8?B?S3MrcFVRV093TUIyR1dqU3ZVeFdhREJHWTg0RmJWN1JmVmxRSGNTMmgvYU1m?=
 =?utf-8?B?blA3OUVsa3dpV3ZocXdMdDl0SDJzSS9xT0NwS1h4RDQxK2N4Q0djU2sxODhN?=
 =?utf-8?B?OVF6SkVpZkU1N0xMVDc1SG1lYzFBaG9vdWtLblo5ellzTnhrTWZkMkFRZ1RG?=
 =?utf-8?B?TFNXZlZsMG5NVERRdXM5QVl2N04vQTNIVnNqbDluZ2I5bDhYTytiNU1lYms5?=
 =?utf-8?B?dW5RRjU4Q1E5b1MzQU5zTlRjaEQyY01pMW8rT2ljRG9aOFUvQWlYV2xZcHV1?=
 =?utf-8?B?cWw4YjZuYy8wT003OEZidytHMzBiTUt5UWNpZSt5bjdHVWh3WnYycFQ4YUhU?=
 =?utf-8?B?b1J3UnpFanpvOW5HTXJsMjBDZk9sbThZWU9EVytGTWF0Mm1relhOWlJSMWdj?=
 =?utf-8?B?SDJIS0grdytlK3R2dWQ0NVZpb2F0U0JCaVBBMHRjZ2h3U1c3enI4M1JjWVdU?=
 =?utf-8?B?Nk9sWVg3MjluUEMwbXdicEFHSjE4QkJ2MXBjckFEUG1FT2c0dnUvNDNiTHU1?=
 =?utf-8?B?Q0pqV2srWno3Y0NHMXdqRXMrR3JIS1Y4V0ZwZXh2SmIrNS9RZHBFQ0xZUlVa?=
 =?utf-8?B?cW5NU0FQcnhyV1JrekE1SUVrOGNTcko1VjNoYkdNUFVSYnZnYTZwWm80ZTZW?=
 =?utf-8?B?eUtXbCt3OTJjNHhndkV6Vkg1dlI0QVFWRlFpdkladFpJTnJDYk5GWjhqNGtn?=
 =?utf-8?B?R1pRS21LQTdPeHEwOWNGUGE5NDFaY0JBamZSYmZybGM4ZWZ1dGZORTZyZFMw?=
 =?utf-8?B?Z2V3ZmtRYVluemxQSzlYWVFIcm1GMzJ2K1U5a0IxcW9YbkJ0WDJsNDNnMFM4?=
 =?utf-8?B?Tm40QVhJbWthVzhyejdYd3hxWk1HNWlOSFdiRTRKL2o1VHJ5R0p2UFB3b3FP?=
 =?utf-8?B?azZybTZvb2hZUjZDeW1ETUNPelhTWjY4cEVqajdLQmRISzFNUDl3V0lYdlBx?=
 =?utf-8?B?b09MNFVpd0J3ZVljcVlRWm53RERhU0dDQ2hiL2hwa0dEcTFsSmJDeW1PSjd6?=
 =?utf-8?B?M2hibTNMR2dSNlo0ZXRFSkJWOEM0VTdQOUd1U25KODhCT29oOTJla29ycXd0?=
 =?utf-8?B?Z3dOMTU5VlFtTTI0a0wyQmZpVFVZangxU3IzOG4zVU9GSGFNM1RrOUszUktF?=
 =?utf-8?B?WEVFTStwRW1JRFo5SUNvK0orenRvSVE1Mjh0bVN1MnB1eENQKzYxbDB3eElL?=
 =?utf-8?B?bTl0ckdIREVhbEN0Qi9mWHZZOUE2TFN0cTM4N3M4bkprRTZoR1ZBbGVEN1d4?=
 =?utf-8?B?UkFUOWFwb2xuSGNxQklJS2FqSm13S3h2Z1Y3dXBkd0NPV2N3cFByOHNJWDdJ?=
 =?utf-8?B?U1hGbWZJY2pmT21iSUQrVGYrelh5YWlTbEVMQkRHZlAyRzQvdm5ZcXpldEEr?=
 =?utf-8?B?VENtakhmenR5dFlDclVWbUJBZFBUZmJ0WGZ4WldmUGJPc09NbGZxTyt5WHl4?=
 =?utf-8?B?ZGFVVzRnQ0pOTnlHME1DNFduOFRhSlptOFh1Rzd4VldhVFMyVndCbUp6cmtK?=
 =?utf-8?B?WlFnL1l5TWtUekZyUFNsZUE5YkYrNkF2ekJ2Ym5oVVVXQXdvZGdFTFZVbzhH?=
 =?utf-8?Q?PgDHXLfPejuqJqOIQbEcGbWTe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beeb7fc-aa6d-4f37-0096-08ddb8700a19
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:22:30.3313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgiNCo8wseRqVOqpBW8BgHeZmaA1nt4E8QaQYzgF9YoS0DAIk1QW/GCsnMtBr+zE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6944
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

On 30.06.25 23:33, David Airlie wrote:
> On Mon, Jun 30, 2025 at 8:24 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 30.06.25 06:49, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> This just adds the obj cgroup pointer to the bo and tt structs,
>>> and sets it between them.
>>>
>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>> ---
>>>  drivers/gpu/drm/ttm/ttm_tt.c | 1 +
>>>  include/drm/ttm/ttm_bo.h     | 6 ++++++
>>>  include/drm/ttm/ttm_tt.h     | 2 ++
>>>  3 files changed, 9 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 8f38de3b2f1c..0c54d5e2bfdd 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -162,6 +162,7 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>>>       ttm->caching = caching;
>>>       ttm->restore = NULL;
>>>       ttm->backup = NULL;
>>> +     ttm->objcg = bo->objcg;
>>>  }
>>>
>>>  int ttm_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 099dc2604baa..f26ec0a0273f 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -135,6 +135,12 @@ struct ttm_buffer_object {
>>>        * reservation lock.
>>>        */
>>>       struct sg_table *sg;
>>> +
>>> +     /**
>>> +      * @objcg: object cgroup to charge this to if it ends up using system memory.
>>> +      * NULL means don't charge.
>>> +      */
>>> +     struct obj_cgroup *objcg;
>>>  };
>>>
>>>  #define TTM_BO_MAP_IOMEM_MASK 0x80
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 15d4019685f6..c13fea4c2915 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -126,6 +126,8 @@ struct ttm_tt {
>>>       enum ttm_caching caching;
>>>       /** @restore: Partial restoration from backup state. TTM private */
>>>       struct ttm_pool_tt_restore *restore;
>>> +     /** @objcg: Object cgroup for this TT allocation */
>>> +     struct obj_cgroup *objcg;
>>>  };
>>
>> We should probably keep that out of the pool and account the memory to the BO instead.
>>
> 
> I tried that like 2-3 patch posting iterations ago, you suggested it
> then, it didn't work. It has to be done at the pool level, I think it
> was due to swap handling.

When you do it at the pool level the swap/shrink handling is broken as well, just not for amdgpu.

See xe_bo_shrink() and drivers/gpu/drm/xe/xe_shrinker.c on how XE does it.

The problem here is that we don't have a generalized handling for drivers.

So the best we can do is to do it at the resource level because that is common for everybody.

This doesn't takes swapping on amdgpu into account, but that should not be that relevant since we wanted to remove that and switch to the XE approach anyway.

Regards,
Christian.


> 
> Dave.
> 

