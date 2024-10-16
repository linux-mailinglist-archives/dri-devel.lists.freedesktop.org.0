Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793AE9A0900
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 14:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EBD10E5A5;
	Wed, 16 Oct 2024 12:05:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="foxzjcG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171EA10E115;
 Wed, 16 Oct 2024 12:05:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8L0UaOAx6mHGu9VJheNfTku8OJa6vVqQW+CWuKD4BeFPreAt+/sTtcQMAM0egPoKgyh7wzdAJk2jfhDdqFRgF3BSaUpTfo/9ba/OiP9FeO2AKrgXsIwT4u1xH3ycRuTrmj0mFBfDu4T1R0Gq1Ufsze801qH2Ok8G2NOBY2SKuIwI9Cd1pIRdTpTAmEJG1dsw2vQ3EX2l0zwLuIrFS5Q1JwMZ7MchE5Sz4iTZnnzU6nbfBP5sEyy2IHMb0Ef9ZaYqc1JqecCBnBNK4XU4rh7goSO1TggX9Aklr987xVZ24gEcwHKikiNM7+IYnfZzT0CaLOAyA9J325sUv2Xd0EHxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PwrYvAT6SFz8Mh9PPW9fLiuMSZyAgHX/RWXDd84BIwc=;
 b=TJS8r2K414ogy6E10olmroBif9WorBrRqurLFELGtzol+ns80mHEZ8/PSj+ejEMg5Jk6jeFo0LeltijSjqirN+2cL1SMl4i7poVWhaSSsc5vCafV2buzEMkt7h2u7tDhBllZp/7MrY8yQ2KqNInXwqIik6hQOY/lBr2kU3s1OVS8hsBMNvadl8wJaTMIOsLdDZweoA5liM0aWZLum9lBILHF43dkx8wq2+WRXJv8ZLL3GMqRvnTAt9wUwC+fUTYSCap52MtsNrDDCuRONqwwAvjcEicydGZ2iVqnOzR+JM6eITwBTKjxxxSns4HQY7CL+gS9bfPF/FTeI9bPDvw/2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PwrYvAT6SFz8Mh9PPW9fLiuMSZyAgHX/RWXDd84BIwc=;
 b=foxzjcG4PSWKi8OzB9Nr9bMGA/H/EpgykmuecOhLR01JBvs9LIpzSJchWhqov75NMQ+C5gSPaakUyrhbs1ruRIWqcZswNWJkbU8A9VJxPypeY9VQJElBa/I8cb0R/77pm8LGEnpqRNCCZgOGVBxBdFeZ8fLj9EfXgeJqyLjh/+Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by PH7PR12MB8037.namprd12.prod.outlook.com (2603:10b6:510:27d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 12:05:18 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%6]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 12:05:18 +0000
Message-ID: <420212a1-dc5c-492b-a9b1-8f7a4036a942@amd.com>
Date: Wed, 16 Oct 2024 14:05:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: adding a new scheduling policy
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20241011062136.1019695-1-jesse.zhang@amd.com>
 <db1694f2-031c-44e8-aa74-e6b002a136c5@amd.com>
 <DM4PR12MB51529D851091E72DE52F2E50E37A2@DM4PR12MB5152.namprd12.prod.outlook.com>
 <BL1PR12MB5144CF902B41761ACF3767F0F7442@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <BL1PR12MB5144CF902B41761ACF3767F0F7442@BL1PR12MB5144.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0382.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::20) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|PH7PR12MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 660e7814-951f-4a0a-171b-08dceddacd2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WTFYMWQ0WThqZFdkR1ZjOFc0UTNsUjF2SThCbHNHZHRvSHo4UVRiVGRrNGtF?=
 =?utf-8?B?akdaL0xTRUpEMnFUL1ArbjlxeFdzaDVvaGFBMnh5Yy9lbnY3S2ZkMTFGejBw?=
 =?utf-8?B?bDg4eHZhWTk4ZmlzMmlHN3BZL3FZQm5mc3RHNGJsamNnaDdHdFJMT3dYVlJ5?=
 =?utf-8?B?RmdIaWVDRk1lbFpKUG5RbU1vRjEwcFhXY096SlJ4bDlGUmFJeHAyU3l0UHdN?=
 =?utf-8?B?REk4VDNyK1RkRHRDYzVNRmNUSWtCaXNYZ1RudVk0N09oYnhVdGFhNm5qQzIr?=
 =?utf-8?B?ZjhjUm1kVExDWThXeEcxVERtNGFYZWUwdVVmSE9GK25FUDIwQ29LVDFJbmRI?=
 =?utf-8?B?S2hXUlFlWEhlYVdYdzlkWEVsM0h0UlBMNWdWVDVPNCtOUS9PdDZPUk5VN0Ev?=
 =?utf-8?B?Z3d6QmtQdkx5VGJhRmhKTmhIUTZIdkpnc2JVS3NmalAyeXR4ODFUVWRLc3RV?=
 =?utf-8?B?cm5oc1I5NFA4MjBCZUNSclBFUkp5RFlHdEI2dVFWZzNUOFRhZzB3VlRUWTNi?=
 =?utf-8?B?SjJENElPdU12OE1xZUMxa3I3VGRramZURURjSVFINTMzc0NBSEZnQy96TjhL?=
 =?utf-8?B?ZW5KYVBidm1mMytoSWgzMlZLTVR6RGRveElYWVI0TXY0RlBhV1BZb29RUFpC?=
 =?utf-8?B?UXdmMmdXNWd4cVoydkNJNzAxQmMydFFlRCtoYzQ2UWYzZGdRcnVoajlrRzVi?=
 =?utf-8?B?SVgwekkxNUFPbTlObFJHdlczb2lFbzlQZllSNWtzS01LT01SY3psVDkvaE16?=
 =?utf-8?B?dCtHcEJORkxqa0tldkEzQmxZc0pVU2Y3bXVzVTZUd25kNVpaMkJQT2VmNmdr?=
 =?utf-8?B?UXo4Rm50TnJ1dC8vd200czZ4ZXVtY3VuK001ak1Sd3dZaTBmUk1kR3AxMlFy?=
 =?utf-8?B?T1ZWck1tclB4bml5RExOYUpDTEFSakdmUUw4K1lJaFprVktSeWtaOGJ0MzZz?=
 =?utf-8?B?a1ZzY09xZytOcnVEaVdyVmo5UHkwK2lMbGJvNTJqRmJqTlB5SWN0ZlBuaHA5?=
 =?utf-8?B?ZUZTN0tKSDJnVUNwS0tFV2ZmZHlSaVdUcS9iN2VzQ1lYNHN4RnFoMUpHRzdy?=
 =?utf-8?B?NW1UVWVwcGgyWXRjbXlVL3FneXRocEFZY2U0ckZHbkdXbXAzczEyRG5oUHBw?=
 =?utf-8?B?Y3ZLYlcycExwNm5sN0crejJURmJYOHRVRG5Qc005UDltK0JsNWhyOHh6T29j?=
 =?utf-8?B?b2VrVUVzY0YxYzUrUG9iZ2xkQnFyZy9tSFl1d3dwZTNZYW1QTkVaZ1JMM2xk?=
 =?utf-8?B?bk9tQUJsY2NleXVmQnIxazRpZ3ZtWG5Ca2htN0pCTlc1bGo1Wk1ERjk2MTAw?=
 =?utf-8?B?czFadnVKRHBta1NjSGxPUjM5aFJyYnJjeWQvckw2dUhaamhLT3ExUThZTFNx?=
 =?utf-8?B?alN5WUVrb1I3Q1FIWjNjdGF3WXNkUkd3QnFtWUV4NkUvdlcxcndzemFFejBw?=
 =?utf-8?B?SXk4Rm4vMWpwVXoxaXBBZXVCVVdzSWtEejBlVW02ZnJBOFRJYUswSVRoM1Vo?=
 =?utf-8?B?ZCt5UlJuVGxkb0ZtaHFuM0FQRWVMdHJJTTkyMmxWWU1qRUlldTBCV2w5R20w?=
 =?utf-8?B?akRKejgzeXV3UzJXbUlwYTVpb1BxellTaXNuWjZCMHJQaENHT2h6eTRqMStq?=
 =?utf-8?Q?Jgm9m9FmiEeIUh75HxH+Blt7am/WoG9KCGo7cO4xfpGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhzSW9zSjlmNTkwQ0NmOTRwMkRObnB3WFNwSEQ1cWNlbnJwKzdkdkhCb1Bt?=
 =?utf-8?B?bktFZGl4RytQK1k4YkFVSVVjUFNOVDhudlFtWlVKOEgvOHVxSjcxMUFtTVY3?=
 =?utf-8?B?aHByQVZ6VkpqL3VPOVVvZW9TL1g0dDRETTVYeit1TXdibUsrSEZ2S0xvZHpF?=
 =?utf-8?B?Uk1neXZwMTlLRmNwN3VacHdYVEpoSDROODZKNDRQMzlHanFoS3pMdXFSOXNm?=
 =?utf-8?B?YkVKcWxZMm55R1BmbkM3cWhFaGQzWmZpMEZ4UkpXYitnNWVycGdPdTVSR0JG?=
 =?utf-8?B?WXZ6UGJRZWZpd09RdTNpNXRQTHI2MUtTc3BxVEtIT202b3pzdEFTeXp6TDB3?=
 =?utf-8?B?TzcrVlFxaTBlTng5c2pvOEpMbS9ITXNIQTFQMlNjYzBtaHduV2lpazNkQUhC?=
 =?utf-8?B?MjJkNjFoaEh6MkJNQjI2M3BBV28xc2J0dWhWdnorZWdMUXhtamRQZ09xZ3dz?=
 =?utf-8?B?UEJUQjVnOFgvRjhIbXpOTStDaEc2d3N2WkhWSTBUYWg0NTR0RjdZend5MjYx?=
 =?utf-8?B?ak5wSjlGUyt6N0ozTWpxK1NObTBQS2pZeUZ1dGxsSGRDRnAvWjZyWkR1M2h1?=
 =?utf-8?B?NmIrUTZQcnEyekVSL1IzWHpyQzhBMml1b0Y3cGoxVUpHdXNnUlFnblBQYzJY?=
 =?utf-8?B?aUU2YmtUVXhhNEIyRXJZVkZydjUzV2h1ZzBYSXFxcUI4eTF0R2JPSHhub3pX?=
 =?utf-8?B?ZjNpcXNuWmowcE1rNTU1R2lMczlMUHJjVmUzdEFhT1pPSmR0N3lhK0JxS2Zh?=
 =?utf-8?B?U3F3MlRVTGdQMUF1T2FYQWdoWDJ0c2dzMVhJRXRLR1VuUTRqYUpzaUhmUVlt?=
 =?utf-8?B?N2p0MllVbXFQN2F6bHNsQWk2WU1BOTFGUkFyWDZnK3o5YzJZQ0UzTEVWOVN6?=
 =?utf-8?B?WmVJZStUL1pkTlRFcHVIdGlDdzR4Mis1am0vQktDc0prUFc0aTNjenhxZTRF?=
 =?utf-8?B?S2ZMb1JYMTdWeUpXWmNDQ055cjUyODhlazZVSHlBM2RkVHQxZEtkOUYzMVg2?=
 =?utf-8?B?USttQ1UySnVHV3UxT2c4OUhqeG1jWk9QTEZpbG5sMHBWdmhNOVpOTkkwRUF0?=
 =?utf-8?B?K2ZEWU9DOUlGb0hhZlphYlF6b1BuS0JEdnhidXJSSXVlc1pCMlYreGNWSUdG?=
 =?utf-8?B?N2xvSm8xai9QQlpZbzlQTWpMTXNYbEdpbFZNRzNuZ0hYaXNncWtQV0pxc2lq?=
 =?utf-8?B?N2R5c20zcDhub01DVkRLSCtzVHgxMHN3YlptOThkbDNuYWhTOGIwcDZReVNi?=
 =?utf-8?B?NmJJdDJiaSthMjhmMFRQMGZFMElkVVZFMHpoWVI5REFRVE1wN1NoL2pFZld3?=
 =?utf-8?B?ZS9uczVSZTJ3WGEwbWE3bzVNSWx5UVZXS0ZEOTNvbWl5eXRLR01pZGxobnR2?=
 =?utf-8?B?MlFxclJzWjI4SWlrSzdaWWM2UlIvTCtrTDVTRVh5QWJUd1dIVzExNDZQd2E0?=
 =?utf-8?B?eXVjb01YdVZoODdMNHhaVGF5dTNtdzJia2kxN0haaEdjMnl6U0RXUkxLMUxr?=
 =?utf-8?B?OE5jRWNNenRzOHNjNW1TZkVPR1p1b0pzaDRTNlhGTFdWOUMrYkRwL05NYzJ4?=
 =?utf-8?B?cEtGNnVSZVJaY0ZoTmw1ZWNCVDZMajhFZHZ6cjUzS3ZXZnhtMU1jQVM1QUND?=
 =?utf-8?B?em9BckpHNzQ4d2w5dDVYc2hlWkV2Z1F6S0lYb2VDMUk5Nk1NZlIvTHNna0Qw?=
 =?utf-8?B?WWtjMXYxc2RsMmJKMUZNSkcxcElRYkZqNmxRVjdDcU8vRWJZVFA0aVJEVnh3?=
 =?utf-8?B?UU1Wa2YveU40UWNjNEJFb25vbVIrVG9LcVFQL1lmL052eEd0UVJ4OGw2dmtx?=
 =?utf-8?B?c1p4c252RXNPQ2QvN1JBK0l0cUlpd0c0a2xhb1lSVzVndVJxSitlSm10VXI3?=
 =?utf-8?B?eWcwNlpGbGlXVmlBOWk5VUhFWkFCM0R6UnA4QlhvZzV1VUltVCtWVzBZR2Ez?=
 =?utf-8?B?bC9rRWdGcVFBUi93UGpNZW5WbWJGMkttd0FQSEdPNzNZVVB3MVUrV0xwbjhx?=
 =?utf-8?B?Tkx3TDNmTGxKVExmT2JTWHZCM1NaT28vcnpQaWpXemFuZXpXK1FNa1pVYURD?=
 =?utf-8?B?bnBwTHpGWWt0b3pGVWVWbmplVHZTVmQ1NWt6dTdtUzExclhBV0c4QnlhdW1z?=
 =?utf-8?Q?bf7vrM9VxMdt3YKzgjUs/Hds+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660e7814-951f-4a0a-171b-08dceddacd2c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:05:18.1987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBsyBMIElW5q9o86P9n7FH/l3CI0mP+BL+Lu5C1CTw1ZKdvEnkxF7x0ETNoXh/Db
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8037
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

Am 14.10.24 um 23:56 schrieb Deucher, Alexander:
> [AMD Official Use Only - AMD Internal Distribution Only]
>
>> -----Original Message-----
>> From: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>
>> Sent: Friday, October 11, 2024 9:45 PM
>> To: Koenig, Christian <Christian.Koenig@amd.com>; dri-
>> devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
>> Subject: RE: [PATCH 1/2] drm/sched: adding a new scheduling policy
>>
>> [AMD Official Use Only - AMD Internal Distribution Only]
>>
>> Hi Christian,
>>
>> -----Original Message-----
>> From: Koenig, Christian <Christian.Koenig@amd.com>
>> Sent: Friday, October 11, 2024 4:40 PM
>> To: Zhang, Jesse(Jie) <Jesse.Zhang@amd.com>; dri-devel@lists.freedesktop.org;
>> amd-gfx@lists.freedesktop.org
>> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>
>> Subject: Re: [PATCH 1/2] drm/sched: adding a new scheduling policy
>>
>> Am 11.10.24 um 08:21 schrieb jesse.zhang@amd.com:
>>> From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
>>>
>>> Added ring ID scheduling.
>>> In some cases, userspace needs to run a job on a specific ring.
>>> Instead of selecting the best ring to run based on the ring score.
>>> For example, The user want to run a bad job on a specific ring to
>>> check whether the ring can recover from a queue reset.
>> Absolutely clearly a NAK, we don't want to expose the different HW rings directly to
>> userspace.
>>
>> Thanks for the confirmation. It was a bit confusing.
>> But now userspace can get the number of hardware rings directly via amdgpu info
>> ioctl.
> That number does not align with the actual number of rings on the IP.  It's just used for allowing userspace to schedule things in parallel.  The kernel driver still decides which actual rings to use based on load.  If you want to target specific rings, you might want to consider doing something like this:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/08c517d5a923628de50f93e8a9fedd647d3eefbb

Yeah that looks like a good solution to me as well.

Christian.

>
> Alex
>
>> Regards
>> Jesse
>>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c   |  2 +-
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
>>>    drivers/gpu/drm/etnaviv/etnaviv_sched.c  |  2 +-
>>>    drivers/gpu/drm/imagination/pvr_queue.c  |  2 +-
>>>    drivers/gpu/drm/lima/lima_sched.c        |  2 +-
>>>    drivers/gpu/drm/msm/msm_gem_submit.c     |  2 +-
>>>    drivers/gpu/drm/nouveau/nouveau_sched.c  |  2 +-
>>>    drivers/gpu/drm/panfrost/panfrost_job.c  |  2 +-
>>>    drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
>>>    drivers/gpu/drm/scheduler/sched_main.c   |  4 ++--
>>>    drivers/gpu/drm/v3d/v3d_submit.c         |  2 +-
>>>    include/drm/gpu_scheduler.h              |  4 ++--
>>>    12 files changed, 22 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index d891ab779ca7..18887128a973 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -1286,7 +1286,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser
>> *p,
>>>        int r;
>>>
>>>        for (i = 0; i < p->gang_size; ++i)
>>> -             drm_sched_job_arm(&p->jobs[i]->base);
>>> +             drm_sched_job_arm(&p->jobs[i]->base, -1);
>>>
>>>        for (i = 0; i < p->gang_size; ++i) {
>>>                struct dma_fence *fence; diff --git
>>> a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> index 717adcedf096..8d75ffa9a097 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>>> @@ -320,7 +320,7 @@ struct dma_fence *amdgpu_job_submit(struct
>> amdgpu_job *job)
>>>    {
>>>        struct dma_fence *f;
>>>
>>> -     drm_sched_job_arm(&job->base);
>>> +     drm_sched_job_arm(&job->base, -1);
>>>        f = dma_fence_get(&job->base.s_fence->finished);
>>>        amdgpu_job_free_resources(job);
>>>        drm_sched_entity_push_job(&job->base);
>>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> index 62dcfdc7894d..98d003757af1 100644
>>> --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
>>> @@ -107,7 +107,7 @@ int etnaviv_sched_push_job(struct etnaviv_gem_submit
>> *submit)
>>>         */
>>>        mutex_lock(&gpu->sched_lock);
>>>
>>> -     drm_sched_job_arm(&submit->sched_job);
>>> +     drm_sched_job_arm(&submit->sched_job, -1);
>>>
>>>        submit->out_fence = dma_fence_get(&submit->sched_job.s_fence->finished);
>>>        ret = xa_alloc_cyclic(&gpu->user_fences, &submit->out_fence_id,
>>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
>>> b/drivers/gpu/drm/imagination/pvr_queue.c
>>> index 5ed9c98fb599..ed7398a0ff21 100644
>>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>>> @@ -1115,7 +1115,7 @@ int pvr_queue_job_init(struct pvr_job *job)
>>>     */
>>>    struct dma_fence *pvr_queue_job_arm(struct pvr_job *job)
>>>    {
>>> -     drm_sched_job_arm(&job->base);
>>> +     drm_sched_job_arm(&job->base, -1);
>>>
>>>        return &job->base.s_fence->finished;
>>>    }
>>> diff --git a/drivers/gpu/drm/lima/lima_sched.c
>>> b/drivers/gpu/drm/lima/lima_sched.c
>>> index bbf3f8feab94..cc83b2aab9ce 100644
>>> --- a/drivers/gpu/drm/lima/lima_sched.c
>>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>>> @@ -130,7 +130,7 @@ int lima_sched_task_init(struct lima_sched_task *task,
>>>                return err;
>>>        }
>>>
>>> -     drm_sched_job_arm(&task->base);
>>> +     drm_sched_job_arm(&task->base, -1);
>>>
>>>        task->num_bos = num_bos;
>>>        task->vm = lima_vm_get(vm);
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index fba78193127d..74c4e1b4df78 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -831,7 +831,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void
>> *data,
>>>                goto out;
>>>        }
>>>
>>> -     drm_sched_job_arm(&submit->base);
>>> +     drm_sched_job_arm(&submit->base, -1);
>>>
>>>        submit->user_fence =
>>> dma_fence_get(&submit->base.s_fence->finished);
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> index 32fa2e273965..3ff8142b5370 100644
>>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>>> @@ -309,7 +309,7 @@ nouveau_job_submit(struct nouveau_job *job)
>>>        list_add(&job->entry, &sched->job.list.head);
>>>        spin_unlock(&sched->job.list.lock);
>>>
>>> -     drm_sched_job_arm(&job->base);
>>> +     drm_sched_job_arm(&job->base, -1);
>>>        job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>        if (job->sync)
>>>                done_fence = dma_fence_get(job->done_fence); diff --git
>>> a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> index a61ef0af9a4e..cc937420cd35 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
>>> @@ -301,7 +301,7 @@ int panfrost_job_push(struct panfrost_job *job)
>>>                return ret;
>>>
>>>        mutex_lock(&pfdev->sched_lock);
>>> -     drm_sched_job_arm(&job->base);
>>> +     drm_sched_job_arm(&job->base, -1);
>>>
>>>        job->render_done_fence =
>>> dma_fence_get(&job->base.s_fence->finished);
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 58c8161289fe..f4669422b3f9 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -525,7 +525,7 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct
>> drm_sched_entity *entity)
>>>        return sched_job;
>>>    }
>>>
>>> -void drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>> +void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int
>>> +ring)
>>>    {
>>>        struct dma_fence *fence;
>>>        struct drm_gpu_scheduler *sched; @@ -554,7 +554,14 @@ void
>>> drm_sched_entity_select_rq(struct drm_sched_entity *entity)
>>>                return;
>>>
>>>        spin_lock(&entity->rq_lock);
>>> -     sched = drm_sched_pick_best(entity->sched_list, entity->num_sched_list);
>>> +     if(ring >= 0) {
>>> +             if(entity->sched_list[ring] && entity->sched_list[ring]->ready)
>>> +                     sched = entity->sched_list[ring];
>>> +             else
>>> +                     sched = drm_sched_pick_best(entity->sched_list, entity-
>>> num_sched_list);
>>> +     }
>>> +     else
>>> +             sched = drm_sched_pick_best(entity->sched_list,
>>> +entity->num_sched_list);
>>>        rq = sched ? sched->sched_rq[entity->priority] : NULL;
>>>        if (rq != entity->rq) {
>>>                drm_sched_rq_remove_entity(entity->rq, entity); diff
>>> --git a/drivers/gpu/drm/scheduler/sched_main.c
>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>> index 7e90c9f95611..356adf510670 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>> @@ -833,13 +833,13 @@ EXPORT_SYMBOL(drm_sched_job_init);
>>>     *
>>>     * This can only be called if drm_sched_job_init() succeeded.
>>>     */
>>> -void drm_sched_job_arm(struct drm_sched_job *job)
>>> +void drm_sched_job_arm(struct drm_sched_job *job, int ring)
>>>    {
>>>        struct drm_gpu_scheduler *sched;
>>>        struct drm_sched_entity *entity = job->entity;
>>>
>>>        BUG_ON(!entity);
>>> -     drm_sched_entity_select_rq(entity);
>>> +     drm_sched_entity_select_rq(entity, ring);
>>>        sched = entity->rq->sched;
>>>
>>>        job->sched = sched;
>>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>>> b/drivers/gpu/drm/v3d/v3d_submit.c
>>> index 88f63d526b22..d33749017f93 100644
>>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>>> @@ -211,7 +211,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
>>>    static void
>>>    v3d_push_job(struct v3d_job *job)
>>>    {
>>> -     drm_sched_job_arm(&job->base);
>>> +     drm_sched_job_arm(&job->base, -1);
>>>
>>>        job->done_fence = dma_fence_get(&job->base.s_fence->finished);
>>>
>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>> index 5acc64954a88..0eab405a2683 100644
>>> --- a/include/drm/gpu_scheduler.h
>>> +++ b/include/drm/gpu_scheduler.h
>>> @@ -553,7 +553,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>>    int drm_sched_job_init(struct drm_sched_job *job,
>>>                       struct drm_sched_entity *entity,
>>>                       u32 credits, void *owner); -void
>>> drm_sched_job_arm(struct drm_sched_job *job);
>>> +void drm_sched_job_arm(struct drm_sched_job *job, int ring);
>>>    int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>>                                 struct dma_fence *fence);
>>>    int drm_sched_job_add_syncobj_dependency(struct drm_sched_job *job,
>>> @@ -603,7 +603,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>    long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>>>    void drm_sched_entity_fini(struct drm_sched_entity *entity);
>>>    void drm_sched_entity_destroy(struct drm_sched_entity *entity);
>>> -void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
>>> +void drm_sched_entity_select_rq(struct drm_sched_entity *entity, int
>>> +ring);
>>>    struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity
>> *entity);
>>>    void drm_sched_entity_push_job(struct drm_sched_job *sched_job);
>>>    void drm_sched_entity_set_priority(struct drm_sched_entity *entity,

