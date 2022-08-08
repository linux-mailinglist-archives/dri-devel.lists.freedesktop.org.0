Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78058C771
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFDCB96C35;
	Mon,  8 Aug 2022 11:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B0E92ABF;
 Mon,  8 Aug 2022 11:22:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CEurGpclVMR1f+mdjHzrQ3Xbl547aoYf79C/WSAlbITN1R29tnTdNTOwhl0yVV95Cmx5DdfFk0BB4kP/au9Kqucyf/ZUXUPTktg0TgCe5o0++1O5awLG8l3rsd75sGRyh71hIvVO0ckZ7APTWFs+52ZrBtb51E+SvZkSGw1zAgc33yNITpV1fIBzjnuk4RPPio/ujt9LrdYkz5jg5IPp59wxeYWTf+G4+vVTgchEU1G6FnxwudJ+Hh+jKa4V/qlLKa+fSuLHfYxui2fNLzTJgPHVmtZlSj7SXhdr0vMm4Hiyf3/vm7PNCSahR3wseTagbjgDn7lwbtUyn1xQaYRJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N1pYY4L4lxeqK+M8JVfyILMs+mNm/4PFxSEZhbnyBWg=;
 b=REWcTixEJapObYhz9R5usXJ3VgmUhFcib0OUyk9rsFtOj8yDDLi6yaGkT4EAZYSMs2wOnq31hdtuxPZoBo399DoJwNLD/mLKDGanabEQyMsSgMmLnTS+eadrAdfZA6eSrsZTj+YWmwKQ09KKigicG1tEG4E0UDkU+rZytRwbx00hFhzOD7Oir/fBbU9RkyuZv/p3xBFxpB7aOo0uSlPBT5D+6VxGeBagCyKJRJoIHFdbNhoF1qAS8SUmSjJjVwckp4ZXYkjCpPxhR3SYTY31/VIpPZ62SeHnfCsW4KwvQeQsQVPmD4IacVLALo/3PYCLEU09lswSsrDxFG+FpDp8lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N1pYY4L4lxeqK+M8JVfyILMs+mNm/4PFxSEZhbnyBWg=;
 b=JvPAmtlIQNvHdR1JtNEoNHe8VRfxP7uaLtw5e+Smu1j3v+YWyCwuPjI4zAAbRS7zXwZUjVuSUOI7s/CX/GPuA7j+P9P88stbKZVBwjziNIWBlx8drLbJ6fG9n4NC9NhurId2iZIoGanDB9uyaEuJDGsN8aHi1FlexyubIB04iHw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN7PR12MB2836.namprd12.prod.outlook.com (2603:10b6:408:32::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Mon, 8 Aug
 2022 11:22:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 11:22:10 +0000
Message-ID: <e90caaaa-cae9-c6d1-bfb6-dc56aa559681@amd.com>
Date: Mon, 8 Aug 2022 13:22:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [Linaro-mm-sig] [PATCH 1/3] dma-buf: Add ioctl to query mmap info
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220729170744.1301044-1-robdclark@gmail.com>
 <20220729170744.1301044-2-robdclark@gmail.com>
 <3d2083aa-fc6c-6875-3daf-e5abe45fb762@gmail.com>
 <CAF6AEGvKdM3vyCvBZK=ZcdGmak7tsrP1b8ANyyaMjVfNDViqyw@mail.gmail.com>
 <973de2f8-75e4-d4c7-a13a-c541a6cf7c77@amd.com>
 <CAF6AEGuhQT6A_jh8kLWh5xMoUGc1osdewyBk-8NoprtWOHseaQ@mail.gmail.com>
 <2fc74efe-220f-b57a-e804-7d2b3880d14f@gmail.com>
 <CAF6AEGv9H+fSFKPNqwPxYUjkgj05AimpXbp-p_JL8nKLnzON=w@mail.gmail.com>
 <e2423bd7-ef73-8d43-c661-a19c80ad1a26@gmail.com>
 <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAF6AEGsoYaXe2+qug_TfT99KXuXh9Ez2L2HjQZroE6c6GSW4SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a0dc593-2441-4ce0-305c-08da79303c22
X-MS-TrafficTypeDiagnostic: BN7PR12MB2836:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRuzS8RIIomTQ7ecKyK4TFQU+sqedQxKNQlQXRyMrgcSGFYNvVUQHe4AnY4v52iG5S95WYCIGOSqGiWZX8+vIr1aBXJtOwo3rzU94DaqIOy6R/34ehJ6CyiL6kdnqGb7NW4TUncUwP6oczkq6/Sollx4/jU2AY+nf5NfQ7dSKsLlN4TxL2bmjZxQolYH+aWrtDHd6EleNsfvMbPhnkr4/evCq+4GV5ny916qB97FNsJZIT5YoxQHUt5HNoe6qlb6WBWVYuhd5Jz0i7+E3snHpJb4cfM7fnASRt5TWzjIdkZpMHKI8CZw4IOxj4zGka+CfanmwRzaiGENin9124FdBoiOFgj26Ah6D0LC3+l5Guf86HmEp8tCdnEO8uJ1I+j4Qcf6Y2eDt93cPs2SPyrYf5kDPAyKhR27qLkrp5NXi0ej+W0l/uhEyuCz2ifsvtNdSlQLf81SXzgbFCUf4llv7IRWnKaYgEDXm1Ki6L9aGyCwC9zBT32hxbtHEvvi2BrQkY5JuGCv7D/it+7s48v8GCNZP3WnHUL8XsRfgyhIHm049ElSViayQwG0p2TuV0XhQXfAu6Nq0DMd2d1imp3AiZt/Rbw9IDXG2ZhVHmZ0cFPVMsjliiTkGsW8tvMi9xfhJnkfN5tKv258B1Wxl0o0Wb1bf8BzCPz3EAfOFN+kSVJJgHx3vLAJkZOCCazcQ1zxaWza2ctNRUWh7Y5jDknPJhgLmuBXcy+iX//yWgw/9PEfDBEMeJOEEqNnk0TpV/DKOPk8qxxvMTPOQZZyM7MHPdElFvr2o05AC1OkTO6HEVgZ6OwwNmAcbgcN2mT174TqU/d9c1KA40GRyVSGZ8HPnGWg8cp3qXksehQ4GT7I+j4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(39860400002)(396003)(366004)(346002)(136003)(7416002)(966005)(38100700002)(6486002)(5660300002)(8936002)(53546011)(186003)(66574015)(6506007)(6512007)(86362001)(31696002)(83380400001)(478600001)(2616005)(6666004)(2906002)(45080400002)(316002)(66556008)(41300700001)(66476007)(31686004)(66946007)(36756003)(8676002)(4326008)(110136005)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWtsK1RPbVFQRHdpZEEyZWZWTVEzcW1KY0d5L0pXd3BTZkNuWlIrbkJUdU5I?=
 =?utf-8?B?WWFBc2hVVnM2ZVBVWWtTNHVZQWw5Ymp5OWROY2M5bVh4TjVLQkgzcHp5T3hN?=
 =?utf-8?B?WG40R0p3R3lKVjRGbjAwdnFnOXFwTVRFa1FvMXArZGV3MUNmbkp2YnRLNWZL?=
 =?utf-8?B?RHc5Z2lROGUyTHdYZEh4ZmRyVlpDN1lPME9MZW9lV3lQQTFzZ3dWSHIrWits?=
 =?utf-8?B?QWZrb3BLakNRWVljaTVZOE1yR0dlK2NjZE1oVm1XMFN5L0JGTTEwUFNrajRk?=
 =?utf-8?B?ajJBSFZ3aEZRdG8zQXpDQU9Mc3kxcWsrNFZKQmpzVlMzcVRMNE1tQWVGdkdj?=
 =?utf-8?B?amN4VUpQbldJNW5jN1cvSFJDcmhXbmtNbjlZWmMyc09IOGFpZ2xnamNKemNE?=
 =?utf-8?B?ZTFnd1B5Nmxmak5Tb2h3TzhZUkpVMGFWZDA0VmR1Sy8wb2c2aTEwRjROSnJy?=
 =?utf-8?B?ZStMc3QrWU1OYlRnR2NjaFFlU2dLRjY1YlRmYklXVEpvRDRxS3J1NHZEeERq?=
 =?utf-8?B?YUhzVklnU1lTQVlaYy90cjhsNEJkWjBiOFhFNkExNjlmdmZ5OG5LVDR4V0Fw?=
 =?utf-8?B?Rmh4am0rZm9sV3cvV2UzYlEyZ3FFQVdyUTF1QXI3WDBCVU1lN2FXUTZ5ZHlR?=
 =?utf-8?B?Unl6Z3lld2xmeXFRaHBwSFh4ckNCMW9uKzlhenpCcDZ0aWR3dUxsYkhjYW9L?=
 =?utf-8?B?MTQxN1gyQXZHRGprZUtJdmFnTXRuamxmVVNZelU2VGZ0QTFtM3hjbGNUUWZt?=
 =?utf-8?B?QlJsZlcreXhkcGRGT291cmNoN0FOeHRnWnVMOU9oK0NYOHVTUU0rU0pKRDdt?=
 =?utf-8?B?a2Q5UXJWaGhmalpIak03c2pOYVZkVTBaTy9EOEN3aVVNNklwckpTeHAzTDdE?=
 =?utf-8?B?TitBUGdVaVdkZ0RxeXkzWDlJZGd4TnFGTzhHQ3NUOVhCVnh2R3NkZU1FOFF1?=
 =?utf-8?B?eExDdTNXYjRJaXZSejU5NEpINU9qank3QWgwR25oVXdKMnFVWGdvUXV0OWE5?=
 =?utf-8?B?NTVkNlRFSXBVWkdhSnMySGlpd3JSR3NUbDlCanpaQmpZMGxvc1NVelNmVFl4?=
 =?utf-8?B?UklRcnlaUVFBTHVOdXhVS2Vaa240ZHpPdTc1WkFyN2lWdWs2VEJhcHQ0QWpR?=
 =?utf-8?B?aFIrNUZKMEo0L01VclBRd3htRmtlOEZsZXRnU3RaVUhCMGt1Wm5KTm9CVnNP?=
 =?utf-8?B?S3AxZ2FRQjVPWEI5TzkzejhiVWw5OG45RWt4S0I5eDg0VHRoMnVYUkllZkpq?=
 =?utf-8?B?VDdMTklWTDI1Z2srb0MvbGs2MXJwYTVmSk1oVlQ3S0M4bkw5QzdQdXRDRVhi?=
 =?utf-8?B?MFJGd3NrQmJidENkZ2IrLzRtQmQ4WWlncmlzTGVTNGNyaW1ST0RxSndRd0RW?=
 =?utf-8?B?Zm1tQVBtR0x0Q2Z3NGNVSkN5eUUrYUIyOGJJN3RLb1c1RnJzOGNPZk1UV0ZL?=
 =?utf-8?B?bWxJdHlqQVI3WjhDTFNNYjhtRTJnL0FBYzBDeERzaWF1MVEwTDBBZnVCMW5O?=
 =?utf-8?B?NHZLUFA5NVNxMm9aL3JIQkU2ZlV0cHZKbmQ2NmJhYlFlbUQxakduSThpV2NM?=
 =?utf-8?B?T1ZMTnNyWDZFdkp6N2k4MCszczB0blNVeEZhSVJPbDhQZUtuRkZickpZa0xx?=
 =?utf-8?B?Nm5SN2duQWpBYWNQd3JqUFppVXA4Vkl5ZWxqNVprdFk0bUloNlExVXg4bjdU?=
 =?utf-8?B?Z29vVDhUY2xWWWhKTXF6V0ZXZEkwS1crUjBZdGVpOGtvY3RtZXgxajljeWF0?=
 =?utf-8?B?aEg2anFwb0FXK0NqSGc0Wm5yRU9NQ3VjK1BKRkZvRjdWMHNLbnNTUHdNeFJV?=
 =?utf-8?B?amdUMU9DQ3JWL084eDJhQ0lodGNlUEV2Q2N4ZnVSclZGcUtuaXdURTducnZx?=
 =?utf-8?B?NTRiTzdyZjFqZnVXYU00VjhzbThjREFObEkvOEJOdmNVS1pia3JQY2J4WGJa?=
 =?utf-8?B?S3lEQUF6TTdJZU0rUFB3YnAwREx1ZnhYODJGdjZkbWNROElOd0VZQ1piM3Bn?=
 =?utf-8?B?Y3RweHpMWlJKeUd0TjF0OWVKM2habkhjdktMUCtJTlVKVFloUk5GaXhLekJu?=
 =?utf-8?B?TGJyRk5jN2s0UlhjQXVJaS9IbE9sRUNjM1hteERLNTMwdzBSSkhKeUs5ZDJC?=
 =?utf-8?B?K1BYRlY0NzhsOFVzSmNoQjRWQUd0NGJlMU9SZC9xejhWWDRnYk1vbEMybVRJ?=
 =?utf-8?Q?ySkCAu0IcpbOq+I0/3h9JvumiZKqUA2nV24hCeHgki2l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a0dc593-2441-4ce0-305c-08da79303c22
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 11:22:10.1861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dGmu1rm43Ddd2kR/Ugy+qnzRg+rYMaRSW+WQMRTAlB+0Xq0h8dbXdL0hsn2WP9wb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR12MB2836
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
Cc: Rob Clark <robdclark@chromium.org>,
 =?UTF-8?B?SsOpcsO0bWUgUG91aWxsZXI=?= <jerome.pouiller@silabs.com>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.08.22 um 21:10 schrieb Rob Clark:
> On Sun, Aug 7, 2022 at 11:05 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 07.08.22 um 19:56 schrieb Rob Clark:
>>> On Sun, Aug 7, 2022 at 10:38 AM Christian König
>>> <ckoenig.leichtzumerken@gmail.com> wrote:
>>>> [SNIP]
>>>> And exactly that was declared completely illegal the last time it came
>>>> up on the mailing list.
>>>>
>>>> Daniel implemented a whole bunch of patches into the DMA-buf layer to
>>>> make it impossible for KVM to do this.
>>> This issue isn't really with KVM, it is not making any CPU mappings
>>> itself.  KVM is just making the pages available to the guest.
>> Well I can only repeat myself: This is strictly illegal.
>>
>> Please try this approach with CONFIG_DMABUF_DEBUG set. I'm pretty sure
>> you will immediately run into a crash.
>>
>> See this here as well
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Fv5.19%2Fsource%2Fdrivers%2Fdma-buf%2Fdma-buf.c%23L653&amp;data=05%7C01%7Cchristian.koenig%40amd.com%7Cc1392f76994f4fef7c7f08da78a86283%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637954961892996770%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=T3g9ICZizCWXkIn5vEnhFYs38Uj37jCwHjMb1s3UtOw%3D&amp;reserved=0
>>
>> Daniel intentionally added code to mangle the page pointers to make it
>> impossible for KVM to do this.
> I don't believe KVM is using the sg table, so this isn't going to stop
> anything ;-)

Then I have no idea how KVM actually works. Can you please briefly 
describe that?

>> If the virtio/virtgpu UAPI was build around the idea that this is
>> possible then it is most likely fundamental broken.
> How else can you envision mmap'ing to guest userspace working?

Well long story short: You can't.

See userspace mappings are not persistent, but rather faulted in on 
demand. The exporter is responsible for setting those up to be able to 
add reverse tracking and so can invalidate those mappings when the 
backing store changes.

> The guest kernel is the one that controls the guest userspace pagetables,
> not the host kernel.  I guess your complaint is about VMs in general,
> but unfortunately I don't think you'll convince the rest of the
> industry to abandon VMs ;-)

I'm not arguing against the usefulness of VM, it's just that what you 
describe here technically is just utterly nonsense as far as I can tell.

I have to confess that I'm totally lacking how this KVM mapping works, 
but when the struct pages pointers from the sg_table are not used I see 
two possibilities what was implemented here:

1. KVM is somehow walking the page tables to figure out what to map into 
the guest VM.

     This would be *HIGHLY* illegal and not just with DMA-buf, but with 
pretty much a whole bunch of other drivers/subsystems as well.
     In other words it would be trivial for the guest to take over the 
host with that because it doesn't take into account that the underlying 
backing store of DMA-buf and other mmaped() areas can change at any time.

2. The guest VM triggers the fault handler for the mappings to fill in 
their page tables on demand.

     That would actually work with DMA-buf, but then the guest needs to 
somehow use the caching attributes from the host side and not use it's own.
     Because otherwise you can't accommodate that the exporter is 
changing those caching attributes.

> But more seriously, let's take a step back here.. what scenarios are
> you seeing this being problematic for?  Then we can see how to come up
> with solutions.  The current situation of host userspace VMM just
> guessing isn't great.

Well "isn't great" is a complete understatement. When KVM/virtio/virtgpu 
is doing what I guess they are doing here then that is a really major 
security hole.

>    And sticking our heads in the sand and
> pretending VMs don't exist isn't great.  So what can we do?  I can
> instead add a msm ioctl to return this info and solve the problem even
> more narrowly for a single platform.  But then the problem still
> remains on other platforms.

Well once more: This is *not* MSM specific, you just absolutely *can't 
do that* for any driver!

I'm just really wondering what the heck is going on here, because all of 
this was discussed in lengthy before on the mailing list and very 
bluntly rejected.

Either I'm missing something (that's certainly possible) or we have a 
strong case of somebody implementing something without thinking about 
all the consequences.

Regards,
Christian.


>
> Slightly implicit in this is that mapping dma-bufs to the guest won't
> work for anything that requires DMA_BUF_IOCTL_SYNC for coherency.. we
> could add a possible return value for DMA_BUF_INFO_VM_PROT indicating
> that the buffer does not support mapping to guest or CPU access
> without DMA_BUF_IOCTL_SYNC.  Then at least the VMM can fail gracefully
> instead of subtly.
>
> BR,
> -R

