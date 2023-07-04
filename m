Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 909B7747472
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 16:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A1310E0F8;
	Tue,  4 Jul 2023 14:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D422E10E0F8;
 Tue,  4 Jul 2023 14:51:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GM8am9BTfDgGi0JGWuZknq4kxJ18D8oFi+L8BhXnVFqDoV0SLQiqJ8CFe0rnXL0YBkDeC+2Suozj60Tc7l81k2FlbPAtX6lxQsRYWqDjbdCcNeV3vZaM+dmrGyhc6CyiP7X/1uDzWCUai1fniGv/nYmgJ1PvEltpIOtjRxDn9hUtXwE3OR7ftjUl41Myy2cJQK6P9/SaiSz9jbI8GK17F2BvcyYwgNtPU0ljKOm/tHMLChCQmJkh2oA87kyZZTTbTSanIWFUbQwlzS85hr/nQ0Wuv2SOnXM2lW6KBKpbzJSMQd9kTUjQSkLEnVPfXNkQ1RKnOOy+mxc1z6sAetOVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cg1cgCdC9WQRnaMh9QyHJwbC1zbdDXeP3IFuMGvFkxw=;
 b=npmq0Ss5SyJ14rCrjpG/v0A6j/SU3yEJrwlcI+XLREhzzceJQHYC+W5jZ9ellgEmhPnSwB2a/HTz/UxHZuTAPS6HmZUyqoMjEQ8oS6wR3ivErRH8YCQFAWRBZjzxsx9Wa1Ni+x5UFeI8BFxH43lEM6QqwOD372QSqf1NLvZUGOl8GZgUmQ20+4BKrYmH8lstg/GhTatUntLkKTI9dk3YE+HBcivrHb+b69odyvQPR2LW17yZRaNQDkPv3e9mMuCTJzdFiUiYNg5DnrgqnzBe6r10AXPa8vPuyRRdTf0wRlw2pl6vi0JY84KLrlG2r4AjZmeZP8yAwiv4dqWDqbNBsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cg1cgCdC9WQRnaMh9QyHJwbC1zbdDXeP3IFuMGvFkxw=;
 b=OWiN193/G/ALVAk64jMRp+PTQGiBSbfzt4KL2/lq/Hv4McYbijNdGatju4YBJDFctaIS6CwsVgSScNAcMeiR8KrFPfCPBTfsjwsIXOY5mR0vjAgoSkfa3Veopn6rG88bxkNoOF4FLxl+J1b2J3MsImqL+MS9GZW7hd/3HpRRyBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA3PR12MB8022.namprd12.prod.outlook.com (2603:10b6:806:307::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Tue, 4 Jul
 2023 14:51:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6565.016; Tue, 4 Jul 2023
 14:51:17 +0000
Message-ID: <7b55040f-f2d2-372e-cf8a-5ac4a456fdb1@amd.com>
Date: Tue, 4 Jul 2023 16:51:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230703123557.3355657-1-arnd@kernel.org>
 <f4bc3739-3ff1-6fa7-5d7d-890f451315bf@amd.com>
 <788147c6-defd-496a-8174-1571b73d1a71@app.fastmail.com>
 <f1b190cb-3af7-178b-baeb-b59363868779@amd.com>
 <9b03246d-b46e-4b91-968a-e9ffc2fc26db@app.fastmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <9b03246d-b46e-4b91-968a-e9ffc2fc26db@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA3PR12MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: de471d65-046e-42ed-8603-08db7c9e1ee4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7Bw1IUAFs0kLtk2IbxRANOubmQyWyynnDlM2QOdld3SG3FUUwffrcFgFSzB0uT+ZWbvm22/xzUrjP26slRUSblW0qBeda0JRXwMkh9G6XVAVtIxAXORXsjS0fJChNeiMTk5pjSoWYcuioMzfWtNQSfU2KOFT5tuxx65r8NQLHZWHYWERvIR0OrpKpBvU617Hw6JkneUe2aa+4tNg7GewGtNE0WGjn3J8ljdq2cBZK8M0OL0bcWw80ZmN6/OTOJ0YfNAeOc4W4VIBBdZSuCKoCjWuv3XFuBazpyrO+VPVROlo1af/GoCQs3JgNc6804IFtlMHcTd43TrN5wzPAcdZCq+K6Ne8bMAyw0q3Ewr8qhmFnrrr+R+zrw6JclJIbm+09JETVz+Ig5iTiAWomlNfCtWSKigyQAfZrjgLQ5BjbOkg+pyt7BlRbiYKfSm7L17fEXntoCJ2ilxeZ1Ps5ZEgEpfGaCPkgUsdQLCZfXF+vICVFNYNNL4rrqOMSaCPiC35TFws70wZ01vBCTGyBCrgOLVHtOZ0IJtyKuvd5OymuuH+jdoK1y3HKE/SGJIs+z0MKUMhk3xHn/aggn/eQFxeMS2SCgAMFEuRaVxuBzyIMiPeF6nOlZsd7eb4xPPZ7+ddZFMQ7VN05oEdVcpRimzmQw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(39860400002)(396003)(366004)(451199021)(31686004)(478600001)(6666004)(6512007)(6506007)(31696002)(86362001)(2616005)(186003)(38100700002)(54906003)(66476007)(66556008)(4326008)(66946007)(66574015)(110136005)(83380400001)(6486002)(316002)(8676002)(8936002)(41300700001)(2906002)(5660300002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sit3ZTdDQndaTUF3KzUvRmtDN2plQzZYY2RRbUxYeVZEQ1VsV3dVVUtKWEpj?=
 =?utf-8?B?ZlI5WXdkWHM5UWdjQ3lRczU4Wjd0RWVKL01YRUJ5Q3dQNkZXcHhjVUp6UmtW?=
 =?utf-8?B?ci9IUEpWaWtnbjJaRGs5RGpSYVpyZDhmS3BuVU9UUDlMa2M3TXBaTTdRVmE1?=
 =?utf-8?B?K2hLb1pRU0h4dzJYanhhbWo1bXpVUlZaV05mTGE5MEhtVERnd2RpOHNKTHJM?=
 =?utf-8?B?TFE5YnJEaXovSU9qMzV3OFErZ2hkazdUNkQ4by9FZ1JoY0xNaEtTbWVhZmtn?=
 =?utf-8?B?NGc2K081Y3BBUWQweTVaODZ0bVRWSTNyRXpkQW5MMmJjc2xNd3ZMM1JMc0d4?=
 =?utf-8?B?UlhiUDZrOVN3V2Z1dzNkeW5YQjZCME9LSnpia2x4MEszMWVick16M3lFUk9j?=
 =?utf-8?B?NlZrek83R2ZXNlRrL00xelRBRU9WTi9udlo1Um1rQ2xud3hDU2NuODFEcG1s?=
 =?utf-8?B?aGtBcU0vQk5kK3c2QkE3cFBIWXNtRU10bytTSm9Od3ZseUNwcm1uK2dTYjNK?=
 =?utf-8?B?ejRGV242MDFrY1pJS3h2dnVLZlcrdlZvS2trMkNQK3ljL3Ezd0xIMTFTNjA0?=
 =?utf-8?B?c1djWUVyT2E1TE5SNVFDQ0pBMzZpQjVFTlNvZEhGbHlSWk9rdWlxRDhBNkdI?=
 =?utf-8?B?NmI4bnJsNFphMjF5UG1QbE5IVlFuS0RTRUFFbTM3RE9aREdtQ0ZZUzFsdUZB?=
 =?utf-8?B?K0NXaU5YV1hhUWo0SFhaTGhHRHFpamwzbFRPSldlbnB1ZnRJODdoSU5BMHhV?=
 =?utf-8?B?RWEvbVNKWHgwL0dmelpMZmt4UldHQjBEeHpMWkh1QnNwRmJLVGg4bEorTE5i?=
 =?utf-8?B?L3JZOEJzSWdYMEtuY05sUURjbXl6Z0Z2VGlCWVRabmZKbDZDYXJIUXA3azA5?=
 =?utf-8?B?cmtjOWx6L1QrTGxJQmtnMXVWejB2aGx6bnYzcVloMmJtTlh5L0xScHhHdERP?=
 =?utf-8?B?R3ZJRzVLTXg3V055dStrOXBSeTZtcnRadjd0cVNFaWtOZjQvcUh3VklXeWlD?=
 =?utf-8?B?d2ZTUUxuajNHVzRNdFU0d1pTUDdrcWtxWFNRUGpkRy8vRFJwdWxMVkwwNzBR?=
 =?utf-8?B?dU5VK0Y0M0R2Tmhnc1Jkb3ZhdDBpck10eHZhQWJuNWJ4bFlFZzdZbFExWk5z?=
 =?utf-8?B?NzRyb0JoU3ZXZGlvNzBCRWhGWG00RmE5b0hUNG1iRGFJMlRac2ZSbWJuYkxp?=
 =?utf-8?B?SzJ2MzhuTHNCZFpIMjRzV1Z2cE92aGY4aE1hMVNBK3lFdzNkN3NobEdQTDNE?=
 =?utf-8?B?T285OWFBTlN2bUVwSTd1enh0K2EwMzlNb2MweS91WUpYelBCdVIzMGh5Z1Jq?=
 =?utf-8?B?SVBqVElDeWlVdnJzQi9XSmgvbE1MN0tHL3JSZFVZNC9peC9SaTVERzMwVXVh?=
 =?utf-8?B?UUVCZWQ0SUdlVlYzaTM3aHlQRE96Qjc1RlNLc0Y1bmptUUdBOHltZTRCaDgy?=
 =?utf-8?B?K3dhWXlVaERrTGsycUsvT05xZTFHMXplWVY0TWhXVjNyNG9rQittWjBPTEZ6?=
 =?utf-8?B?UEEzcGpFR3VLaDNVY1ppR0xsZEJSTVEyMVpRTHRzaDR0cVZ6aEZseG51cXU0?=
 =?utf-8?B?OVoxRjI1dkhVYjEvbmVZMzdONXliSXVlUnViVTVFY3FuN1lnNWNicktoOHQv?=
 =?utf-8?B?UEhXZGl5ZjQyNDlscVZ6R1lOL1M1TWNxaVkrK3RONFlVbjhpelVtMCtKZCtF?=
 =?utf-8?B?dm81SDJTMm5HSXNoTUcxdkNwc3FsVTNXQ2lsL0RFVktDRG1FKzFkTUxGaTRa?=
 =?utf-8?B?NVM3anFCMXFZbUowbkdmQS9vaEdPNjBlT2tCSTRSWVNQUHdBY1Y4enM5WjNs?=
 =?utf-8?B?RGQ1M1NSaEE5dnZ3eWxxbnNMbDBuTFpyTklmTVJxV3AxZVNzWEQzWkp0OXRh?=
 =?utf-8?B?aEM2SEMvRVozcUMrSlNCQTlMZmpHcENCVWRvcWV4Y0ZHREFobndXQnFYaFd2?=
 =?utf-8?B?UUZEbm9lNGpaejY0NU84T08rZHYraXd0SGFwaWhINkhlUXlsQ0JFN2FwSmdx?=
 =?utf-8?B?eXZMMjQ1QnFvTzdnN3VqbnZtVjJta0FrZVdYM1F6a1F6QVp6T2xNa1lmZHFJ?=
 =?utf-8?B?MUs0Z1dMQ1VtMEgrTU91Ly8rWFg1MFRPMXpTTnVhenQ3N2hOUGJodDZia0Q5?=
 =?utf-8?B?ZkxhZ01PTnAyak10ZGJEYWRicU1NZHJuM2tRK3pycDEvM0lOV0VyQ21jdTVl?=
 =?utf-8?Q?umFMpI3ZykCk9K7WzxYMMbbzzrvpHNNtfqVsU9BJVmYz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de471d65-046e-42ed-8603-08db7c9e1ee4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 14:51:16.9325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpaPvPofPZLFVLf/0LP9BNpD/QVBj2Vx6wDT5MbbWF3VtkJctbVv76Zfm0Y3yUD0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8022
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
Cc: amd-gfx@lists.freedesktop.org,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Bokun Zhang <Bokun.Zhang@amd.com>, dri-devel@lists.freedesktop.org,
 Lijo Lazar <lijo.lazar@amd.com>, linux-kernel@vger.kernel.org,
 Shiwu Zhang <shiwu.zhang@amd.com>, Le Ma <le.ma@amd.com>,
 YiPeng Chai <YiPeng.Chai@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 04.07.23 um 16:31 schrieb Arnd Bergmann:
> On Tue, Jul 4, 2023, at 14:33, Christian König wrote:
>> Am 04.07.23 um 14:24 schrieb Arnd Bergmann:
>>> On Tue, Jul 4, 2023, at 08:54, Christian König wrote:
>>>> Am 03.07.23 um 14:35 schrieb Arnd Bergmann:
>>> Not sure I understand the specific requirement. Do you mean the entire
>>> amdgpu driver requires 64-bit BAR addressing, or just the bits that
>>> resize the BARs?
>> Well a bit of both.
>>
>> Modern AMD GPUs have 16GiB of local memory (VRAM), making those
>> accessible to a CPU which can only handle 32bit addresses by resizing
>> the BAR is impossible to begin with.
>>
>> But going a step further even without resizing it is pretty hard to get
>> that hardware working on such an architecture.
> I'd still like to understand this part better, as we have a lot of
> arm64 chips with somewhat flawed PCIe implementations, often with
> a tiny 64-bit memory space, but otherwise probably capable of
> using a GPU.

Yeah, those are unfortunately very well known to us :(

> What exactly do you expect to happen here?
>
> a) Use only part of the VRAM but otherwise work as expected
> b) Access all of the VRAM, but at a performance cost for
>     bank switching?

We have tons of x86 systems where we can't resize the BAR (because of 
lack of BIOS setup of the root PCIe windows). So bank switching is still 
perfectly supported.

> c) Require kernel changes to make a) or b) work, otherwise
>     fail to load
> d) have no chance of working even with driver changes

Yeah, that is usually what happens on those arm64 system with flawed 
PCIe implementations.

The problem is not even BAR resize, basically we already had tons of 
customers which came to us and complained that amdgpu doesn't load or 
crashes the system after a few seconds.

After investigating (which sometimes even includes involving engineers 
from ARM) we usually find that those boards doesn't even remotely comply 
to the PCIe specification, both regarding power as well as functional 
things like DMA coherency.

Regards,
Christian.

>
>>>> It might be cleaner to just not build the whole driver on such systems
>>>> or at least leave out this function.
>>> How about this version? This also addresses the build failure, but
>>> I don't know if this makes any sense:
>>>
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_device *adev)
>>>           u16 cmd;
>>>           int r;
>>>    
>>> +       if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
>>> +               return 0;
>>> +
>> Yes, if that suppresses the warning as well then that makes perfect
>> sense to me.
> Ok, I'll send that as a v2 then.
>
>      Arnd

