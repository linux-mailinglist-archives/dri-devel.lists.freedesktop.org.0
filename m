Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E90951371
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 06:21:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D2210E271;
	Wed, 14 Aug 2024 04:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F5RbE/ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3B410E271;
 Wed, 14 Aug 2024 04:21:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f+Ko/wUqIqWE78nTNB42x3eFUL25qVoob0TrdCcgXgJ/LfOhN/Yi8oUylrVUbSqBLBhuS4VdQJvmC4FWEP/xJ0VnyoB4h/0OON+aSQLNgYhBkZ2J7tCzXew/ecrJ65sCbyL67wb9ZQLUV3TE4Agk7AT7gTpaUobqnayyuTbj/r5tOBzZ4040w7HvwiaF/8SECf93wTiwqHQ07h8d76OHXqb1FoG2097nBm9mztu6fefNeugULUhJMPSxqk88krnf5CJlT/c14MLiH9DOc9S92aNytwqCt3xvxSIjsfrvgHYJFLd1gtDwZY7DiPu7YTQJ9gyX/d4xZ8PHgROY3daNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XL+SiZfLYhczlHul1GSlZ89MW+Jtvqju+ph40nWOlY4=;
 b=sRUUmjOSAf3ggdGvr4eOkVqFRNk+tuIdqvUUwKgRF722zJPQTRdP3fgw6gmGZNeoVEKFv3O6et9Fz7B0eF3DPY1CjTK9KZKOd1YzY0SDq4GimXp/gMyYhPNjNlGCbCLrfVKl4h1myDhRt8UF4GmOjSzcy62isa71tUpSHN/i3lEgGnTKP9Nm+IC2G3DKij17VuLtJ9mfQQUt0tDshB15p63nvSsMZ+ufVS8R8+2zbwFy6V7N6GiOLB9acA2XZzcfX7Vm+qMD4Ir9VfwnXzXMOUyO5knkxrauQfia0OQkDYXOEygQmN1ZWjwGzfqVeZdiL+0qXYA1zKRKs4pSJ3riwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XL+SiZfLYhczlHul1GSlZ89MW+Jtvqju+ph40nWOlY4=;
 b=F5RbE/arfLfNJJAbOMM0zUx++s/Ylpg+3S6qjOivzh3tnYGIqpQ/agdixCEE1D/hqh3zbI6+seCfLzx4+gR/w+8I3rdXabn9D/Mp7GoiEgOOg97mimDbnEZglRO9w/339V82e2z/STKDE/flPsoTIoSbVvabtuE4QEihUGghncM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com (2603:10b6:a03:44c::18)
 by CH3PR12MB7620.namprd12.prod.outlook.com (2603:10b6:610:150::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Wed, 14 Aug
 2024 04:21:00 +0000
Received: from SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947]) by SJ0PR12MB6760.namprd12.prod.outlook.com
 ([fe80::25c8:f399:b2e8:1947%5]) with mapi id 15.20.7849.023; Wed, 14 Aug 2024
 04:20:57 +0000
Message-ID: <ae511933-e191-4e25-a919-21504fa31b93@amd.com>
Date: Wed, 14 Aug 2024 00:20:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] drm: Use full allocated minor range for DRM
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 David Airlie <airlied@linux.ie>, Oded Gabbay <ogabbay@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Emil Velikov <emil.l.velikov@gmail.com>,
 Matthew Wilcox <willy@infradead.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20230724211428.3831636-1-michal.winiarski@intel.com>
 <CADnq5_NwDn5DXPadzZtegUJ=y=LfVHykO7kG3edmiqRTTCxMNQ@mail.gmail.com>
 <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
Content-Language: en-US
From: James Zhu <jamesz@amd.com>
Organization: AMD RTG
In-Reply-To: <nqsuaaibncfcnu3d5376ulujxfswbjwq3ptrivh6djpmvcpuih@fepbhcbik272>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0105.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::22) To SJ0PR12MB6760.namprd12.prod.outlook.com
 (2603:10b6:a03:44c::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB6760:EE_|CH3PR12MB7620:EE_
X-MS-Office365-Filtering-Correlation-Id: 10620e38-ff76-4308-ca1f-08dcbc187ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: oi8t7uQmpbycZTqkj3uB6dAk4//UlfcLvanLh7qT0N6Ho/uk29cL9hEg6dAZFnT43D0Eu+zG2JPv4b6bGHUBs+lu9aNIuf73avHHDnLfaSiN9B4BYUaJDVLXYS1DqtBz53PuwecLrBk1fne3iID+XceWHVd/L8XzkQhHwpL2i2x5K11dF11G2cID9VlOz+q3Pm1fw9gYdu1du2linzDz7PV/jA8krd3liYYfP8q5rcCcPX3irA4gMGCQQObsbEAG5NWdjYZZpGvWGHVFQQP7kshQa18ouKrxtMSo9/iFMelHkKbclcPUiQy9khYPMOq45CDs1qRcVsV6OLMoBcUpuqNe4AXePWwNYW2zAxIF3IZmWZZVUprf512ZPmCKyEnuu5XdTqlRgRVACtrka7JG/pV8C7IZiPkYwKoSyc96bJbMQAc7DWH5snGuHCLNFSQWc6GVJiLWw/YPrdokItC79FsMjZQFfA9Yw8mm3P1jphaM3zkFNm5nTdr+kAui/Kk+Mfp5+kTg9YQtgIL9xW4Jc1dVw4ucfgESLbvCDV+oh7Ha+XdZG5qFhacq5mnAQOJqujM4Si/jSyKMtRtbDuKQE++buf3iavuiuc+a14o4kKIhL9Zv4cOLtbr6n3ONeZO5kBfb+fmxyYHeIsJQFl2hZAye943oAcOmLtCO1En1/So=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB6760.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aW9nbElkY0h3SUpSR2VGOC9uNFppVVhsY0xkSXJZSVNjSWlFU2JMZTRMaHA5?=
 =?utf-8?B?ckVuUUlyNFZIWjExSW9GK2hLb3dsdGtPNExBaWJ5SllhZ3Q5QWJtcldkalBX?=
 =?utf-8?B?RG5HNEt4NlNZY1I2UExhRXFOZk00SHJ1SXQzdjNKUUdMWHlFVU5RNXJKNnpa?=
 =?utf-8?B?aFJXdTZBVE05L2NabWhNdDg5ZTlDa0kzWHRWNE15UnE5QWwxM1lPemYxSXNC?=
 =?utf-8?B?NXE3d3VqR245eWZCUTY2MGxQQi93clRRb2xKUjdDRDRLSDQ2NFQxMWtOM2FN?=
 =?utf-8?B?emlFc29IN2d4WnVlY2xKcWxzb0QwV1FXY1orVHBSRUU1TFQ2RkVDS0gyZEVm?=
 =?utf-8?B?ek15d09pcnhhOWh3VG9WRHFlaUZQcytSKzJadDhQRXBieU42akpqaUV5dW1I?=
 =?utf-8?B?VFhWZEdwWGJWQU40cEhPYU81N1dOcmRZcFVQcmFoYnpWSEN6dVppUjFnVjBw?=
 =?utf-8?B?UldQSjR2MXI1RlJxNWRTUjAxY3E3NCszd3NsMjh4aktxZlpodTZtOWFUZ1Zp?=
 =?utf-8?B?QUdaemlGZEVPOWMwQ3ZoM0NzbDVUblMxL0dZeGszbnYrVFp0U1kwU2RkTHdX?=
 =?utf-8?B?TDg1Q0VWY1padS9FTkhTSVQ3MUVzN1lMTmRGZGlveGpzNHpJZGVqSlVoYm9W?=
 =?utf-8?B?eTYyS1ZEVnhZMEFSOG9MdFowQ2g0aDEyM0JCSG1DZDR6RVF3QjVkOS9EZDAz?=
 =?utf-8?B?SGxCaDRaWkwzNDdYYVVQVVU0N3Z5RU5LQjFhS2h3WG9FMU1wOHk2a1NjS3ox?=
 =?utf-8?B?VkJ5clg1OTFyRXd4L1hlK1ZPVDJRWlY1VUtLZ0daUkN3NHlXaExjakpLWjdn?=
 =?utf-8?B?ZWw1OTNacy9hbmM2bStZMGVSTkp5U2ZhbjZCZXdRMmJkaW91NXpFSndkYXFJ?=
 =?utf-8?B?NmhRRnhzbUhzVC95YVk1bU04ZGNONGpJZ0x4VVlXc3JFQ3NVWHVvMXN2YkdY?=
 =?utf-8?B?UDVHTHE0eFYrVldObkdwMUgvN0hVWFEyTU1rcjg1UEZJYXY0MEthZnc5ODlF?=
 =?utf-8?B?MlhxNWNtRHVpQkpFSXFER1AzckcvMklpME1ma04xcWgvblhROUsrbmxzSFA4?=
 =?utf-8?B?dVVRaGdJam1ya3JvbjVjR1JSdFRpT3d0TlpzQnFSMEZIeTZUTG5haTVFcy82?=
 =?utf-8?B?NmhZd0RkNU1FUktrUG1LRENzaUJwdUEyV1V3RGd0M3czUjdjOFB1LzRzMEZo?=
 =?utf-8?B?L3NzUitER1hNa3h1ZEtobFVGdDN1TEhSb0g5ck1XQWNDT1k4cVJSSFB2bEJS?=
 =?utf-8?B?N2VaZm9qNTkxdzRwdmtNa1I1NFRnUlpJdEI0WWgrMFR3Y3ZISXVScGkxaGI3?=
 =?utf-8?B?cjlTZDhqSVIxK3pGellKQzlmcDRvVWVRN3h6am96S1JJT0puMUpNZnJ2dTlF?=
 =?utf-8?B?U0RQaFZrNVpBbnpqME9GMXQzRGFWSlIybngwZEcrZVFTZXdHUTZxVUJWdk1q?=
 =?utf-8?B?dU54RjUxNnlKRzhuc1gvc0liSXNBWlJLdEcwNzFzYk41bnR5b2l1ZFd1K01h?=
 =?utf-8?B?YnVFci9naGg4aWQ4Q2tJMWMzOEY5cXFuQTVuTGNFdWtlT2Z3ZjVrK3RNQXhU?=
 =?utf-8?B?ZVFIbnN0KzIyRTR3TnZuYXc3dHZUakE0eUZDSURaQ0RLb1JrNW9hbmNweWFR?=
 =?utf-8?B?aHo4ajVtc1hvTHh1WnIvaE5kNnFQN1J4TURwM1lqRThQZkFKc1FKUXppUmFx?=
 =?utf-8?B?cE5uSmhyVmpUYjhpSEsxeVA3VzROdHZ2NkFrV0NHdExSdU1MNWtpcTllYlI3?=
 =?utf-8?B?VGRiV1l6dzdGZTBYazFCeXl0YlY0bXhoWGxLeEM1MTN0aHI4alNFT1BFVmwz?=
 =?utf-8?B?ejF4ZHVvbVFJYmNjUmVjbjZJUWFHMEpnaHpNMGxzUXpMT052VW9NcTNNZmFG?=
 =?utf-8?B?a2VGSzdJVlEzbmwwOG95WTBtdHh3dVIrRlZoNnQyaGwrV0lEOEdNMTdUQjJF?=
 =?utf-8?B?a3RrZVd5d21odktiT2FqT2poK1VxWE5vODgreFVObXNOOHFmN3VKY05nUGc1?=
 =?utf-8?B?TFROb1VTQWxmL3UxTXNMendXaXB4TzU1SENSK3QzT00yNnlVUTJESUEyL1My?=
 =?utf-8?B?NldPM21zcnE1dExpNjZSRlhSV0NTUUZWZUNhUlQzUlZEbk5ydUNnQmZQR1R3?=
 =?utf-8?Q?YxMJA5edVP/oCscDd3zun732m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10620e38-ff76-4308-ca1f-08dcbc187ef8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6760.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 04:20:57.6857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qmf3Yv9wJKm8ZMcTOfCze8LRT0l4xdiJyowRLsAdppvQb85Z/mngkt3OJkK7Jexe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7620
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

Hi Michal

I did give Tested-by before. If you need Acks, Here  I can give
Acked-by: James Zhu <James.Zhu@amd.com> for the series

Best Regards!

James

On 2024-08-13 20:18, Michał Winiarski wrote:
> On Mon, Aug 12, 2024 at 01:38:38PM GMT, Alex Deucher wrote:
>> Are there any objections to this series?  We have been running into
>> this limit as a problem for a while now on big servers.
> I don't think there were any objections, just a general lack of
> interest - so there are no R-b / Acks.
> If you're interested to have a go at it - I can resend it.
> It should still apply on latest drm-tip.
>
> -Michał
>
>> Alex
>>
>> On Mon, Jul 24, 2023 at 5:15 PM Michał Winiarski
>> <michal.winiarski@intel.com> wrote:
>>> 64 DRM device nodes is not enough for everyone.
>>> Upgrade it to ~512K (which definitely is more than enough).
>>>
>>> To allow testing userspace support for >64 devices, add additional DRM
>>> modparam (force_extended_minors) which causes DRM to skip allocating minors
>>> in 0-192 range.
>>> Additionally - convert minors to use XArray instead of IDR to simplify the
>>> locking.
>>>
>>> v1 -> v2:
>>> Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)
>>>
>>> v2 -> v3:
>>> Don't use legacy scheme for >=192 minor range (Dave Airlie)
>>> Add modparam for testing (Dave Airlie)
>>> Add lockdep annotation for IDR (Daniel Vetter)
>>>
>>> v3 -> v4:
>>> Convert from IDR to XArray (Matthew Wilcox)
>>>
>>> v4 -> v5:
>>> Fixup IDR to XArray conversion (Matthew Wilcox)
>>>
>>> v5 -> v6:
>>> Also convert Accel to XArray
>>> Rename skip_legacy_minors to force_extended_minors
>>>
>>> Michał Winiarski (4):
>>>    drm: Use XArray instead of IDR for minors
>>>    accel: Use XArray instead of IDR for minors
>>>    drm: Expand max DRM device number to full MINORBITS
>>>    drm: Introduce force_extended_minors modparam
>>>
>>>   drivers/accel/drm_accel.c      | 110 +++------------------------------
>>>   drivers/gpu/drm/drm_drv.c      | 105 ++++++++++++++++---------------
>>>   drivers/gpu/drm/drm_file.c     |   2 +-
>>>   drivers/gpu/drm/drm_internal.h |   4 --
>>>   include/drm/drm_accel.h        |  18 +-----
>>>   include/drm/drm_file.h         |   5 ++
>>>   6 files changed, 69 insertions(+), 175 deletions(-)
>>>
>>> --
>>> 2.41.0
>>>
