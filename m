Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9663A24A7
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 08:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BD176E479;
	Thu, 10 Jun 2021 06:43:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9E76E423;
 Thu, 10 Jun 2021 06:43:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSwqZjJO671GRWtiCXKXTEQRRrwPRSB4T2ZqoioeSNxwVtT/5iBiuBiqpJXXDDBRw5XKPVtbhZvMFWgysdxgTSuVjyqn3GMJS7ApMUPk4vIjiH8rG6pdDQyYCrYLcHgJo7GuIA+Zard0wJ3ubWjpyEq7BvOyJTyWOVZ7ejeGvyefcHzwG6ZtMAZzMpENasO4jSnXzFKnPtRYv9es6ntv7rqC6dUVoc/ePYDNll03HG0Wc193cvUGbZ4yPssUoX8RPX40QdWSGRS7UxjmoLMOJH5EKvq8sz7uhmJmPNXxaOA06xNdMQSdBkFFPwjt8f/ilZsli44ov+AseHZiKb6xMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxjUcp1MhWcCAwGBRUDFcdf7PJ33kp8up+c5JKOIZtg=;
 b=RSJz+v8CCQh3ld7e/Th/jcmWajd9oanxzQIJ7fgnUCqV3yy1eyIRCD/EQshCXhxO7mZqlZvPz+96GSjn1MM1phuR7NcaWoiONyMKgCjDHno71uhywX6y3QVYpNpaobf7YQb8aGCsFNJO3LqDZ0HZdBC6NAR3i76E4AaC+sh3DSgw/DRLQnrUj4zeL1FugViK+j2UHEXnVt9xFsTOCPEV8q3G3t/5zgHyb9m8qLTqvr49w7pZ6Xd4oQFqHXk0I4OCzxW56JLVmu1Npx5cf+/g883S7ZRwz4Ag8y12mn/wlqjjJJqbxEBcS3EW2vsR7GlBZuOqfFQ6XfELQ5Cc7nXTmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CxjUcp1MhWcCAwGBRUDFcdf7PJ33kp8up+c5JKOIZtg=;
 b=4iYsS4weC6LoX2EE2irYbrJsu2S7xFJRn5PpKhUyqTiFzd48xPaI7yzd+XW4UxIgnIm/fOSXc/WLgxpmbz5+e9bL+sUcYNda99hp5jBiLAhcBGzge13vFgqHaMUaFrSyI5XAJGUlj5MMMuHVK6fFjfw4eWFCyT76pafQjSDW21s=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Thu, 10 Jun
 2021 06:43:11 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 06:43:11 +0000
Subject: Re: nouveau broken on Riva TNT2 in 5.13.0-rc4: NULL pointer
 dereference in nouveau_bo_sync_for_device
To: Ondrej Zary <linux@zary.sk>
References: <202106052143.52488.linux@zary.sk>
 <202106090910.51188.linux@zary.sk>
 <762c1044-6e3a-48fc-95e4-1730b6ef2a2e@amd.com>
 <202106092200.08088.linux@zary.sk>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <081b7908-9a1c-fef1-2b82-4b794f612c9b@amd.com>
Date: Thu, 10 Jun 2021 08:43:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <202106092200.08088.linux@zary.sk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:c285:5f9a:99f5:633e]
X-ClientProxiedBy: AM3PR07CA0121.eurprd07.prod.outlook.com
 (2603:10a6:207:7::31) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:c285:5f9a:99f5:633e]
 (2a02:908:1252:fb60:c285:5f9a:99f5:633e) by
 AM3PR07CA0121.eurprd07.prod.outlook.com (2603:10a6:207:7::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Thu, 10 Jun 2021 06:43:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b6b1742e-00f0-41e4-1356-08d92bdb03bd
X-MS-TrafficTypeDiagnostic: MN2PR12MB4254:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4254224745E5C28AD97D567683359@MN2PR12MB4254.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qY2Mnp3dPQ+8VQAko7kqOBj2H81GEVqJchyaMIgmk7tAiOGGat4pTA111GYb9biJ6GYo4UGAfZFJ6WZwl4QApVySyONO+FLwG2Q7EomzG2feP17rOB1qmdkt0IeXSW1vysXJ1TkWg8IoVVJmBY6jgnXcbvZ1SeN4w9fucq9qPSddFbjfxgr66ETYjMbEguMFhjSyLAeWZx3vPss8KWHnnVTbZogLitEguRI+9gJK317zxurS5+DmTNXJnVqkk25tIotPqu9Hvu4tWzJXbtuL+4sJK0KSmL4JQ1seHBvcWzHt0lg8iYDFNtNkxH/uHv/MccpXr5fD4eRhPwEO+gY5sgZ/KTdAZuoy6hVPcHNRzsGSClen1+vy7o3hvRrjfWJz/R4JbYYSuLzV0JVcAg3rR7LcZtzzljuBScFodqV/WBbZujoJOI7jkC+gAAMuY14lSqwv/6uCYBpRsDQAn4PkdRxdwitSItbQnWZPEvH/E+XHXZr/ckKsPhIV21oFmMRVypU2hVra7xAG+YBHjoUNqVIAKC5dxdtvjzoF6q3chCOCacTXT1v61dFYbLVvAAATSMjqg5pIa4d/a+bLiYKgftCCpgNxTEmL/c8YLWkTGFuowRdGthmPTE/YZs7y1EP/djR9FQWrwjpbSSBgzzLjVXkLYzY6K1C/wQhs1cOp69FfEVH7Zf8L0L7dNT3bhfs4wyx0kZgthqzsJBRs9ZZcdofJQQj4MqbBWKk1uPlwaohMRY6sIGraguG+L9yOvMHow31KaUR2VuzTqcgziKf1pWOMqzoQwAHv1kLLy6wZk2V9wQWhMjj+iv3oM5LtxhN2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(366004)(38100700002)(6916009)(31696002)(5660300002)(966005)(83380400001)(66574015)(86362001)(36756003)(6486002)(31686004)(66476007)(66556008)(66946007)(16526019)(186003)(2616005)(45080400002)(6666004)(478600001)(316002)(8936002)(8676002)(4326008)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlUwMExoSjY3NUQxZ2JwdElmL1A0UlM5RUVwUU5XWXVpeld6OW9OQko2V0Vr?=
 =?utf-8?B?RFY2UnVqeDlSUjJRbXdtM2ZVWjJWZVBSTG9ydWdiT2x1RWpHNTNjWUpLaUds?=
 =?utf-8?B?TUdIanoyZGxHQXNlTnR0RE1PbjdCRnk5RWZqRy92UnpZSEUrcGhKZHNiNGQr?=
 =?utf-8?B?MElJaTUxT2xjSXlnK0FMOXNTYk9oTXNrL0ZPR3FQT2pRaDgza1U1RDQ5L0FM?=
 =?utf-8?B?bkdyWFJWY2tFenJQMEpoMUp5KzdkZnNXNmZZL2pxMTdBSEtseDR6MW9zemNh?=
 =?utf-8?B?ZkJvUmd6NXNWdUtKcFBXWFhJY1I2WFZrL2FBWXg4aWtsNW5ZaUhWdldCSitj?=
 =?utf-8?B?dHVMSTJWcUhKZ1I1ZTEvcEtuZ0NQc095enAyOXAvdHdEbS9lYjQ4UlhYKzRw?=
 =?utf-8?B?Vnp2Q3BHT210LzdCM3lhVEFXdm9QeTcxTkZQZ1Z4OWd3UmdUKzB2MHU3aUtX?=
 =?utf-8?B?NGJzdTMzbHJ0eE4yVmR4TFJyMjJEUk9oTlNRMGl6cnZ0eVE1ZkVBSDA4K2Nt?=
 =?utf-8?B?RnZVY0F3c0VtRlIxSzJkeHVMZHhMUHBGV0N3VTExazRPa2dDaHFtM3RDb1JP?=
 =?utf-8?B?VDFZQVZ3eEZ1ZENUaXB5RUFyREdSVWpROTJUZzZpcWJ3eWtZV3JtS0tLL2xL?=
 =?utf-8?B?bDJ1bDNtTkhzNUQ0ZW81MDNsVXNFdlZCaG9iRVRJSVZSTU81RlRSV0NvZWJS?=
 =?utf-8?B?ZFYxbWI1MGZCNDdPUVBSWmY4WWZCYXFWME9TNUk4a2doSkd6dmFsRm0zZ1dl?=
 =?utf-8?B?Z3NXZjQxSG1oc0lkZ0ZHR1FSeEkxOG8zeWFnYlZnZlpRYTV1U3ZIcFRjbDY1?=
 =?utf-8?B?ZVdOb3hqd3BrOENGMDkwN3NDbGdmbEUyNHlId0YrcDR2UTg1WTBmd0oxWG11?=
 =?utf-8?B?d1hydEpxZG9nZmpEZUdlRXdlK2prd2tpUmNacnA3VlhVSXplV0JoYUVXZkVY?=
 =?utf-8?B?YVUzNUJXNW4xZmdCQWF1MjI0bndzWWZEdUY0bVk5SXc5dUhJbm9qNjRGQ2g1?=
 =?utf-8?B?MUR2dlhUcTZ1dStiZVJOdDBiQWpwNFo3WWZWUDZmcHVncnYxTUYwUmd1US9L?=
 =?utf-8?B?VTNTS2dXcm1ZUitRY3RDYkJRYkNqTkFRVlBlcEFOeWF1VDhHSTNmTEhxMTJl?=
 =?utf-8?B?NVlRMTBZTHJoWG5TaTkxS0N1TmFwRFd4WGpQc2xhRlhyMlBickNla1pzSGt4?=
 =?utf-8?B?b3FPdXFMUmlwU2ZQTDBqZ3Rva2RYV1RWYzZLNUZqa0E5bzRwd0RkeVk2eXFa?=
 =?utf-8?B?bWVUaTBXY1A4MDJYZnpqWDU3Yyt3OXc1TVJvN2daZzV4TjVJRlVPTmEvZk9O?=
 =?utf-8?B?R1JJSUZNMS90TzU0MmR2aDVvQSs4bk1TQTM2TkNTaXNRVzBsVWZISS84cFhW?=
 =?utf-8?B?ZVg4Zmh3akpHNlRXTDhqWForRVA5RVk4Wk5mUHlIc09nbTNXZTJlYzM1VHYw?=
 =?utf-8?B?cEY1b1Z5Lys4VjBDamU0Snlnb3pob0pOZlNpeVk1ME5rT2VpUmxHNndxb3J4?=
 =?utf-8?B?bFVMQzc5MlhSeEV5SFdrK1k4cU5rOCsvRkRtQS90NHZvRWdieWNSaUdxU3Nx?=
 =?utf-8?B?OWNjYWI3RXAwS3hPMTZwWnlBck4xd2Evb2p4YU40QVptWG1IZVVrMXRUZ2NZ?=
 =?utf-8?B?czdiVmdNK3puWC9kclhyQmtSTXNOc1JDbjJMSUlOYkt1akNiR1hKeFlwUmd2?=
 =?utf-8?B?SHg0Qi80TDRxTGZZZm1lUTRCN2NTUmlJQUFpcXJLNnZ1UDRzUCszYjBPbkRx?=
 =?utf-8?B?Sjlyb3VsUCs5bm9qN3ZpTzJCMFVuSldaNnFkMnlvdXhObktWdjEwRVlOTGVG?=
 =?utf-8?B?UjZ1YUUraHB5NzJCYll3ZmtHcDB6b1czUHVyRGpqa1pMK2tEZGZjNmZjc1BO?=
 =?utf-8?Q?I6kzzwU6sk5zR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b1742e-00f0-41e4-1356-08d92bdb03bd
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 06:43:11.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIzbFCB+cUmaObHt8z7OYS2oZT0QgHyavmq5QiaAaeKoV9gi+Erx7hRLVLYXiGfn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 09.06.21 um 22:00 schrieb Ondrej Zary:
> On Wednesday 09 June 2021 11:21:05 Christian König wrote:
>> Am 09.06.21 um 09:10 schrieb Ondrej Zary:
>>> On Wednesday 09 June 2021, Christian König wrote:
>>>> Am 09.06.21 um 08:57 schrieb Ondrej Zary:
>>>>> [SNIP]
>>>>>> Thanks for the heads up. So the problem with my patch is already fixed,
>>>>>> isn't it?
>>>>> The NULL pointer dereference in nouveau_bo_wr16 introduced in
>>>>> 141b15e59175aa174ca1f7596188bd15a7ca17ba was fixed by
>>>>> aea656b0d05ec5b8ed5beb2f94c4dd42ea834e9d.
>>>>>
>>>>> That's the bug I hit when bisecting the original problem:
>>>>> NULL pointer dereference in nouveau_bo_sync_for_device
>>>>> It's caused by:
>>>>> # first bad commit: [e34b8feeaa4b65725b25f49c9b08a0f8707e8e86] drm/ttm: merge ttm_dma_tt back into ttm_tt
>>>> Good that I've asked :)
>>>>
>>>> Ok that's a bit strange. e34b8feeaa4b65725b25f49c9b08a0f8707e8e86 was
>>>> created mostly automated.
>>>>
>>>> Do you have the original backtrace of that NULL pointer deref once more?
>>> The original backtrace is here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flkml.org%2Flkml%2F2021%2F6%2F5%2F350&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C4309ff021d5e4cbe948b08d92b813106%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637588657045383056%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=t70c9ktzPJzDaEAcO4wpQMv3TUo5b53cUy66AkLeVwE%3D&amp;reserved=0
>> And the problem is that ttm_dma->dma_address is NULL, right? Mhm, I
>> don't see how that can happen since nouveau is using ttm_sg_tt_init().
>>
>> Apart from that what nouveau does here is rather questionable since you
>> need a coherent architecture for most things anyway, but that's not what
>> we are trying to fix here.
>>
>> Can you try to narrow down if ttm_sg_tt_init is called before calling
>> this function for the tt object in question?
> ttm_sg_tt_init is not called:
> [   12.150124] nouveau 0000:01:00.0: DRM: VRAM: 31 MiB
> [   12.150133] nouveau 0000:01:00.0: DRM: GART: 128 MiB
> [   12.150143] nouveau 0000:01:00.0: DRM: BMP version 5.6
> [   12.150151] nouveau 0000:01:00.0: DRM: No DCB data found in VBIOS
> [   12.151362] ttm_tt_init
> [   12.151370] ttm_tt_init_fields
> [   12.151374] ttm_tt_alloc_page_directory
> [   12.151615] BUG: kernel NULL pointer dereference, address: 00000000

Please add dump_stack(); to ttm_tt_init() and report back with the 
backtrace.

I can't see how this is called from the nouveau code, only possibility I 
see is that it is maybe called through the AGP code somehow.

Christian.
