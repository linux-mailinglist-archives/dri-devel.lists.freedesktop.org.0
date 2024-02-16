Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540A2857C35
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587EC10EB1F;
	Fri, 16 Feb 2024 11:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="L2dWi3V4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2089.outbound.protection.outlook.com [40.107.212.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD0210E86A;
 Fri, 16 Feb 2024 11:59:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3nIglEG0/+cYAB+W9V5QuhnTT/8OrF4fL/VQWL4us0tjLTWvlreB+k/PAV0AhTssAnLDC/5mF1VBEhCIdXXufY8BbkSP19ck4w8W7ePzMBJNfUNO1zuppc0Xc3dmXhqn15yA3jkwgukmmkjzFyIpMQ872iN/A+A5P4xcVJFEJr9/OEnWQ4W5TvZe3jk+KGvAB8VccCE6NbfwQ6eBCApeK9WcVtOF/n4fysiaV57KvuYNDofHp9dj/UPkhZJl0/zrVf4Yi4GQZ8CbdmfhHlRPQ94dL9E4lQBotgLYjVwYQHQHx6ufmOLI1HmIUNK2bnetvcomx2VCRaGm4CKtkG+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTHDy8Ia2mWKb/pcLDmZ0gbZtMelOAZZJjiOSzS7Owo=;
 b=Bk34jbyeXZMAgMq1jIAAlt91EOhnt3lxHRKCOpQ40Wbu4BUKzUF5qhGttEmu38VQgKNHOXuJgSnPH9z4Z1Xl2cDBToRAj5vJCXEiySTzNqeyZJI2nWfyPffROqp0ACZKnt0FESYSHCxe9YljeCmh/M1Moa8AEB5DtbUYdHYZi2jm6GYwp4h+QcuJlWfy8IRKklwFpj9YOyAfdli4dYZW+3OjaUIhoHzQDMjqiaUVnwiaXH3e0nj/EY1lIvl83QjHCYd8+q30nSlEDt069So1nHF6Ns07mUaHfrf5W6HE64QKK3J5U2jpyeO1y7yxs2CdQbOJJJYH6zDerknpZmh5fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTHDy8Ia2mWKb/pcLDmZ0gbZtMelOAZZJjiOSzS7Owo=;
 b=L2dWi3V4TWyy2haq499wBrfgD6RuvoHjnPS6jXvZX2F7Yz0hQitWeTP3DBPqet4GvkDij/Wof+9+ZdDyb6n0AT4MlYocQRC9ZsOkLPIL+JPCIF67UXxxjOqzZIxwp4BJfm46wrNjtnRZ4gWwPd9k/Bd7AOuI7YyyACDLnKkBk8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5916.namprd12.prod.outlook.com (2603:10b6:8:69::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 11:59:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 11:59:23 +0000
Message-ID: <fc77efca-137c-4d39-b74a-6a3e1ca39987@amd.com>
Date: Fri, 16 Feb 2024 12:59:16 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Modify duplicate list_splice_tail call
Content-Language: en-US
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, mario.limonciello@amd.com, spasswolf@web.de,
 stable@vger.kernel.org
References: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
 <bb158180-c354-458b-8aab-bb224bcb3fbc@intel.com>
 <210c7dbe-7357-47f0-a40a-0c82c3cd96d9@amd.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <210c7dbe-7357-47f0-a40a-0c82c3cd96d9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0302.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5916:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b34b3b-f740-4582-879e-08dc2ee6b70e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XsPRgIhUd/zGiOyyi04n/R3+PX+ahqi84jQTPmWGPreLkX9wcTHd5y8nPuCjfrI0EvfeeYDXDB3dSs16kJDC1uF8FND19ajyJ3yBTiwDFeH7Z03CoYrm7ZyJP+zFxEwUKMe/qjjeQ6t67qBXoLkx9OaU4fYs1jvxBF5EVKwUAmkXEz/F/OGyoIR005bl5JcANBADqIt7P9Hhi6KwerZVpj98g6y2KUGTwRBdIpqVzZ91Cm9gG/SX1TecyNYJekOezsj4ItXrZx7PhFNLofjzPwQCzs9WyBkiEk8Ihc44IZ7Dhw7vihYlWk4+zGfPnH48VngLCLEXVnCxzjTqPJ3ukwuPSjO1h9Y4SGuWtuFj1dVc/Gq49JfQtagfdNEJPesITbD+RhUy4PAZ19LbmFF5UnTLjRvC1K6l3cjkRsIpttlwnO/riLnDSGtRIsdHeeUBZufc6RJ7DcZadqbDGtLGQfoyRy9vjydKDHGaWYcX+TJqYfGXSU3o6VMzYZqyrMyp5Hnvb172DGLWou76ndWz3VVPGTgmZzjcge+/fIRpZiGgY+oM7fhN3sbBVBjOrUIi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(376002)(396003)(366004)(136003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(6512007)(6506007)(6486002)(478600001)(53546011)(110136005)(316002)(6666004)(83380400001)(36756003)(31696002)(86362001)(38100700002)(2616005)(41300700001)(26005)(8676002)(8936002)(4326008)(31686004)(66476007)(5660300002)(2906002)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3lRNXFYZC9NWUoyUFZiZkdKbjcxZVZWRWM1ZE1nZEhWWUhXZ1FtOWZueVJB?=
 =?utf-8?B?NFozYTFhZ3hNWFQraEdwSmp4VVU4UjRPUXBEaEk0NFBONVUzQ0s2empqOTdO?=
 =?utf-8?B?Nlc4TEtIZ3JXTWl6VzJIZ0grSXZWb09QU3VjRjJTVjdEWlhhRDdqRVpYcnh0?=
 =?utf-8?B?RTRjOC9YbzZRV1RIazZQV0poUVVRUllxUjcyTm05Qkg5NkRzRjR0d284RVY3?=
 =?utf-8?B?MTh5RW53UHk2dzhkeHJuMmp6VXhoYWNLZTlDenNaTG53RDQyWTZMaUs1d1ps?=
 =?utf-8?B?REU1RFRIY0dMYzN5VTk5M04xN1pUbTVHY3NPY09PVWNMYy84ZnptMEY1OFpW?=
 =?utf-8?B?dmdxYWZjdllvOFpzby9XaXo2Nm9XK2gyV1FKS21oRmZ5SFN1UEpoSmlCdDVq?=
 =?utf-8?B?ZG15R0hPbExTcEhreTJFRGE2VGdjZW8wN3kyUVBnOHZDUXJJMkNoMkdHZGtv?=
 =?utf-8?B?RDJrVWtINkdraWxpa3R1TjAzRG40Zzl5WVRhbzQxbGJ5K3JHcVc0bXY5cWtV?=
 =?utf-8?B?T1cwMjBMcHVxWUxabnZ3RWY4TmFGYTY2cnM1UmdPNEhFRndjcDJ3NG42Mzhq?=
 =?utf-8?B?ZDJSd0ZWUFlCeW5hbkh0NGwweWdtRXh2eFl3ZmtZa2wyRDRVc1B1d2JFLzhr?=
 =?utf-8?B?Y2t4WWFXamQvcUljdEZEdXhSbE5hUXdHL1lSaXF1aFpMa1RrMGlRVWwyZHBG?=
 =?utf-8?B?VW5ERCtDb3o2ckRBYzVpTkFjaW0vZTJkdXo1dXZpRHFWWDVLUTZORE5QSnl5?=
 =?utf-8?B?UE1iZlZremovL0pwS0FyWXBsUi9zWEpCZUd0b3BtRzNEcjJjVmorRi9TbnlD?=
 =?utf-8?B?anpUb2xXSHBad1RDUFo4MWNJc0FvcDU1QVVIdXU1a0xYNXQyZmNYTDhWaWZ1?=
 =?utf-8?B?VjBwY2JSN2prVTFhMG5HQ1lNWmQxQmkxclgrbDVDQlg2UHE5ekN4ZmJEdWFw?=
 =?utf-8?B?VmNjTnlmdTYxR2FyT2ZZd2k2OFdmWUw3L2gwMWh2eTJ4Z3dWVEtrWnpLbk5D?=
 =?utf-8?B?RTBDTjY0RU1vUmdnR2FrWVU0TlRBUU9PNTFwejdyWHFOTzZQWmh2bGdmYnZ2?=
 =?utf-8?B?enlaMnZsTlRXMExpTXBGQlBZejlyT2Mzb0pmMjZWRWtha3U2dllKSjNkeWl1?=
 =?utf-8?B?SE9XT0Q3MXZxTE5GMjYwYkZDVHMvNjBabjdXanhLYWFSL2lkMkN2Wk56b3BU?=
 =?utf-8?B?ZWVialU2VmFVcm11R2RYaE5NY1JwdFd3azM3SFlqRXBMb24rWGtHbGEzb1NZ?=
 =?utf-8?B?VkNLVlp2N0JnZlE2T2M1bE1yWjdIejJkTUtwbysxcHZjcldva0xCVTZSWnlY?=
 =?utf-8?B?MVhOY3oxNTUyaWtnQ2NpNzJodUJ6bEpYeE91Z3RiZndYOFV4Rkdsc25LMWth?=
 =?utf-8?B?eHNTckI4K3lRcHlJOE1oaXUydml2SHFIY3EwNVYvNjNUZXBWRTZpOVN3VFdJ?=
 =?utf-8?B?RjgrV3NoYUQzQmdrdVJ1NUxkOEhZT2RUdWREYUxnY2E4K1dvUGNmeUs4MWJz?=
 =?utf-8?B?c0VBRGkxN3dYRkwydzRONi9tT0dpVVJmZkp4dE5xQW5mMUdZMUdHRUVVY1pP?=
 =?utf-8?B?RGdGOS91cjZqN0VVQUdVNjV1MEhpMGdoSXlJU3doKysrVU9DTjFzeXNrb0FN?=
 =?utf-8?B?eFgwSVpWa0dkOTAyTUJrSGtEVmFZWnhYditRUno1K0luaWljZDRzSktBazVV?=
 =?utf-8?B?MDFzVzVBbXd5QVJaVmxKMHVTN3JEV0lOYTliTkRHeXVTczZ0NG9ZaXp6RDRt?=
 =?utf-8?B?M1dFSlVMQlhERDA3MGJ4TkhmYnVrb3ljVlY0N2VGek1Rakh2Ty9QNmozcHpn?=
 =?utf-8?B?UnkzTElPRlNESUJCTGJQT3Z2RURzQW1PclEramM1OXRSSWNqODB5c0d2VFJs?=
 =?utf-8?B?TEtuaUN5ZVd4OFVLUko1VFIyUm4yWTF3Rk5NSGxJaGptREZsT0VrSUJESnFK?=
 =?utf-8?B?Ny9WMTB6ZFZxU1pvZVkydFovTjhrZ3RPL1NCQVJVd1hMQ0JKb1lFV2pRVmdV?=
 =?utf-8?B?NE8xQjh2V2ZFZVBIN1hSNWxuak9pdG1xV1lMY1ZhVlZVazBJWjlBNWg1cmNX?=
 =?utf-8?B?S1JscU9xZ3loZnhmdWo0UERQNS92VUg5WmY5ajk4VVE4azFMTXNDU0N3YlZa?=
 =?utf-8?Q?WBxaTb1+JqHMQ/+qnUbDM4LIG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b34b3b-f740-4582-879e-08dc2ee6b70e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 11:59:22.9449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZfzNcm1/mzxEfMXINjhgYOR4Znyqc7s2+RgFbWR3D3c8BPBzToQsVyNOQ8LGX2Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5916
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



Am 16.02.24 um 12:46 schrieb Arunpravin Paneer Selvam:
>
>
> On 2/16/2024 4:41 PM, Matthew Auld wrote:
>> On 16/02/2024 10:00, Arunpravin Paneer Selvam wrote:
>>> Remove the duplicate list_splice_tail call when the
>>> total_allocated < size condition is true.
>>>
>>> Cc: <stable@vger.kernel.org> # 6.7+
>>> Fixes: 8746c6c9dfa3 ("drm/buddy: Fix alloc_range() error handling 
>>> code")
>>> Reported-by: Bert Karwatzki <spasswolf@web.de>
>>> Signed-off-by: Arunpravin Paneer Selvam 
>>> <Arunpravin.PaneerSelvam@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>>> index c1a99bf4dffd..c4222b886db7 100644
>>> --- a/drivers/gpu/drm/drm_buddy.c
>>> +++ b/drivers/gpu/drm/drm_buddy.c
>>> @@ -538,13 +538,13 @@ static int __alloc_range(struct drm_buddy *mm,
>>>           list_add(&block->left->tmp_link, dfs);
>>>       } while (1);
>>>   -    list_splice_tail(&allocated, blocks);
>>> -
>>>       if (total_allocated < size) {
>>>           err = -ENOSPC;
>>>           goto err_free;
>>>       }
>>>   +    list_splice_tail(&allocated, blocks);
>>
>> Sigh. Can we extend the unit test(s) to catch this?
> Sure, Let me check.

In the meantime I'm going to push this one to drm-misc-fixes.

Regards,
Christian.

>
> Regards,
> Arun.
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>
>>> +
>>>       return 0;
>>>     err_undo:
>>>
>>> base-commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea
>

