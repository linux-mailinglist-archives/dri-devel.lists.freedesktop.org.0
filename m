Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F333152E1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:34:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5258E6EB61;
	Tue,  9 Feb 2021 15:34:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690050.outbound.protection.outlook.com [40.107.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E7E66EB67;
 Tue,  9 Feb 2021 15:34:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV9ioglzGh8IMvCQF7LG3zsU1PoAHQFos0Epy3zZpCaeYOc+LUJD62XDeMaUK/29d+IWpG56jlNh1Joo9+A/vOKjUgdCKphVDpkqaTEzhiyTnChE3A0I59B8ZMWsMUbmH566JshI4VWRjY7OwOmMNG2M376rWGID7Ib5fHkqihlF+iKY4JFSAy1Zt4N5FFZbFhSCYPvPrd21TBjD81i8jFzoz8vtN+OnoYkoCe0xpSnKoWNv2NbC4dQszmnhGmFRJZsOiwwcIw5UQ9itZQN0Um/sPf+ODVTwzOy5qiduEOf3885Dfl/6tng89PqBpGNXAI17efsicOUptomK81CoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMrGWqmi+GsZ3T45B2n95t4/PREHJzkZGQySOGdpFAY=;
 b=K5JcraK+k2+KJuZMz8daJWqhpjgdT5b10iWUGZAEimTBn/oWG8jpo7bzrxULzQWPeOtN4gaelVB1GrasMOwk6ah5mtRE3g8MuqPka77elUE5wtulXmSTdpbXW3jE4oKADGH5G5mKQH9qWzVPxQyUbXjwpbzmTA+YiXlAlmKp2496FM2EXx1DR7DmynxqPDGN/KN46N3fuJEniPbY5RAZYGKNrDRVupf07eUzSkgOBvCnUMqlXHKkoZXgYf4gyQX6DDums/MI5xF+Izh2cEoP9BOvmYsC0bf/VF4PmvjrVWIzzSKI9GAEpnhROS/m9/uULKh4UaRudwv1yRT9Z8dURw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qMrGWqmi+GsZ3T45B2n95t4/PREHJzkZGQySOGdpFAY=;
 b=hCyNq7J5WJcXoG3y7sKnnvNWZCWS0cKwR6eGNzXKqEZgYU0nn6zCOL0+1HNIbozQc1Q2SgkzyspHpaggh88DrGsKxuPLm8DIllyNnCBS/WL/zRIiM1CXxvB9VX+R8xp1jlah4YSngKOjw7HpwDIYnaSH420FNkNXX1ugjXpQUTU=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Tue, 9 Feb
 2021 15:34:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Tue, 9 Feb 2021
 15:34:35 +0000
Subject: Re: [PATCH v4 00/14] RFC Support hot device unplug in amdgpu
To: Daniel Vetter <daniel@ffwll.ch>
References: <YAbpxbTifiupYJML@phenom.ffwll.local>
 <c4f911dc-99a9-387c-21d1-a3ca2cfd78da@amd.com>
 <CAKMK7uFKMgKAQSCgunjStuUTbuiwdR3zjwtn_Ms1XJjO0ML2EA@mail.gmail.com>
 <755e7c8a-5bd7-6414-8141-249a1ba5a865@amd.com>
 <YAfyPEB2gpMnW/PP@phenom.ffwll.local>
 <8ea4b2d7-d5f3-3708-724d-c70520603283@amd.com>
 <CAKMK7uE11MonjPB3dmy6u=b029am1p2KqJ57DgLUGu-9QgtebA@mail.gmail.com>
 <75e782f1-4cb9-9210-87d2-e7d2a76782f1@amd.com>
 <CAKMK7uH=ycuBQ5qbujA8kwcrExAC4YAM26W-7wJjE7RS4zPiHw@mail.gmail.com>
 <6152bf16-6086-17f5-4157-c9be0ef84155@amd.com>
 <YCJa2HraImprr4Ew@phenom.ffwll.local>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <d1468c89-9c6a-354a-09cb-5ccd284416ff@amd.com>
Date: Tue, 9 Feb 2021 10:34:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YCJa2HraImprr4Ew@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:7c2a:3adf:50f0:e34b]
X-ClientProxiedBy: YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::24) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:7c2a:3adf:50f0:e34b]
 (2607:fea8:3edf:49b0:7c2a:3adf:50f0:e34b) by
 YTBPR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 9 Feb 2021 15:34:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e80b6cdb-e6db-42f3-a006-08d8cd103444
X-MS-TrafficTypeDiagnostic: SN1PR12MB2479:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB24793F6782F3B0065853FB4FEA8E9@SN1PR12MB2479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NrFIFSwK4y1dt0FhYmdBt5eS4aEc7Os7rrNquiu+JKq1JfffW/BTeq9+h/4bBe86ak/bWtGKxHANmMVYXTQaPWBfHv+KU0thqc29I9OCVR3LqKgWMz7N60kq57uHFG88dM6voKfNqStilOXvsBBGoOS3+7q6XIMMU5cbEgccgQWTNKpv8pAW8TImv/vUzGAKXko4ZtS9SNx1FQM+ST4l4Lq+zrv/nAA8msagncUVyQC4VBB5JfeyFCHd3iFDxYncYZS3asV6DMlodYcQMFLnnM4VXFcGTgUXt5JAgXOu6DoouyAKS4DkopzIoyX7jCZN2zSJ/HW/rFZ0SNzxb+iWnDa/ygJ2YrGw6yr3WpLfSvqQ+KAnri50LCOp0Z2EahkD0Qn5Ef/6llWmkuj4nBAT5lvjzmrH7FZ+qo40aK22iMSdkiIiwOaYEOY4Ji/NJoXZFIuQ+jEyq6UH8mK7Q1bGRhqPqXqJr4Bsazk82Wn2qf9bIG1jFXdtB8LQkehYfPi4uQsvlqymFGad2s3EZcBJwcXqs0OcGQ21HcYqxaH4U2kxqjHQvNl/liKfnxR5oOepOBDNaX5oEFmSlZ1NnXrANdnppEDQWxJT1OHMQK0Y2TbTaqbOLjvXVpN2br0/9b6ytFquj1RWYyN7iEgOqxptdQaPwU3JjjzK6LdfuvkyRLzqxFQskgvcx/uZ2Uv7Sp0Q
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(346002)(39860400002)(366004)(376002)(83380400001)(186003)(16526019)(31696002)(966005)(86362001)(478600001)(45080400002)(66946007)(66476007)(66556008)(5660300002)(6486002)(53546011)(30864003)(8676002)(2906002)(6916009)(36756003)(31686004)(2616005)(7416002)(316002)(8936002)(4326008)(52116002)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VUlLNjZPNVlzRDFYTzhnSjdMd05xbytHYTlXS3lGQUVEZFMvZVRtY05DV0Vj?=
 =?utf-8?B?ajB3RVkvL2w4QlRUVXdxVzdVY0d0bGIySHU5cStjRkFFY09tRWVObWFaczdp?=
 =?utf-8?B?UjlsbUMxR1lCQjFaZlF1SUVFTlhhRy9hd0NSQnFuWDJzbTlOM2pMaVNDcDY2?=
 =?utf-8?B?U2VrYXU1cTZKM1JhN3VrZHhyOXpBYlowTnljdTFNaHVvY3l0YjJKeEVTNVpG?=
 =?utf-8?B?eUVNYmxxVnp3UjVUWlVLT0RiTTNXYUh0Qzc5OVFiTnppM0daVFQ2bHZINzZ4?=
 =?utf-8?B?cFYzWWhXYlM5ZjBER01Kc1BVY2hOYitTUXM4UGZ4dFRpd0Q1d1BGd0F4SDQ5?=
 =?utf-8?B?aEVMejJJT1JIZHhNRUNlMXdWR2VySHppVzZkdEpiVE41THZlU0FWZFVQTTdS?=
 =?utf-8?B?ajVWNGxDWUh5M2Y4bDdrRjNIR0cyWEQ0b3ZBQVJYQy9IQUxQVkNkOCtZbGNn?=
 =?utf-8?B?MXVEc0I0d3lFd1Y5VkhkTk9hclFDaU1VdllqeG50aWFHY1N1M1h1d1JmaFBS?=
 =?utf-8?B?QS9kOGpzNE5mWm82emVlU25WbEkxWEZ2MDJYUlNvZ282VkdvSUNLcVZkc2Zr?=
 =?utf-8?B?OUo2LzNTMFZML0c0K2wxanphbU0yeTVpZitscTlNSGxydnBzWFo5elZBbUdC?=
 =?utf-8?B?MjJ5dWVvSHRsTmo3Z3ZqL01CMDBxU3I4N3MyK0s0Qkh5SS9NT0ptY2JVdmhx?=
 =?utf-8?B?NXFQMG40QXJQZitPeWVRR2tzM1lXN3R5WmM0TDZMZkQvZTZlVmtWWGx4YUhh?=
 =?utf-8?B?aXhqbWF1VjI4cVFzRkExMkZGVU9oSVFVbzlma2RTQVhHTTA3RFVhdkdqMmV4?=
 =?utf-8?B?d1Bac0VqZ0FScmY2OG1Fd3RWQU9SSEtGR0NXcUVCNnd4eENQbzF0cDJjRFA1?=
 =?utf-8?B?RUpyQTYvMHU4ZXRUYitOUjhDTTk2WDdDbkhBWFJCRDNYdFJlK0RHNUlrNEsz?=
 =?utf-8?B?QTB2UDU4OThyZlJkTlE3THJCdkRIVkN1ZitkZzBvNFpQelc4NTB4cDUzbFph?=
 =?utf-8?B?NTh2a1lSUVhGSFljb2pYL1F0cFVVSGt3cVBWRFNTSlpjK1prNDJOa0YvNXdK?=
 =?utf-8?B?WG1kbkpPVDUzQUpkVDZlNjhYUVFYVlJVUGpFNFY3L0J0RE4rUmZiUWp0bWZ4?=
 =?utf-8?B?VzFZZldtUEtnZ3ZGN044S2tFamlGb3g4YWNrSUt1ODFJbFdOM3lsWXM2VjNj?=
 =?utf-8?B?V0tkODNEVVVRb0hIL3Vxbko3SnV3ckhJY1poTDhmcStmNExlMDNBa3ZFbHA1?=
 =?utf-8?B?MGduTGV4czdNeXk5SjU4UDNYSDJXbC9BenJRbThtL0pyVmhpYXYzUzNEV2Zq?=
 =?utf-8?B?aHkwZzZjUHFNbHlVMTdNMDhIKytyU0RlYmN1MHNaYnZUd3hvWnc2K092Vi85?=
 =?utf-8?B?N3lRblcxSVZRTlpiaVlBallJZ0lzNTdvSnFLQjdhUXFSWDAwMDdMckF1VHFB?=
 =?utf-8?B?am14Q2ttV2F4amdWS0k3Z0hJZzI1eUZMRzFlYnFIWGpiZ0NCdWtxKzNqUnhm?=
 =?utf-8?B?SysrcVcyMU5aUlordnNFcGJYSVpKM1pNcE1nWUdFcTJVTWx1RE9VZTFWbkhV?=
 =?utf-8?B?YTZxMlZ3QjBPWjhGZWo2cFpLK0E5NCtDS2pVYk1ZL2xJSjVVV1hOR1I5VUdH?=
 =?utf-8?B?TWhTakpucllKWDRIbTBCVDdxK01ING5aTGJWSlJ2a2I2SENsQllLTkZ3OFdt?=
 =?utf-8?B?Q2xzd0M0dEQzMzkvRkxCVGFodktwTG92RmpIaWFyaVR1VzRzOE93NFNJdm5U?=
 =?utf-8?B?MzNKcDFCb1RzTFpnbEFBVGlNOGhremN6d0F4RlZpRGlNQUFWNDhSbytPSm1s?=
 =?utf-8?B?MzZmY1ZndDJxZWRKdGE3cjZ3eTY0OHpkR1RQRVlybmQ1bDVPSk5uZjdMVXNw?=
 =?utf-8?Q?x9RnvYGHz/nfp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e80b6cdb-e6db-42f3-a006-08d8cd103444
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 15:34:35.4927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /UJC0fnem516ta9MoL9SbUx8qu6Wz2FOFDu+OYHjLgM8x0U55a96Ptk9/Z23Et8p0p+bWeF17BTLtsdo3uBMkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/9/21 4:50 AM, Daniel Vetter wrote:
> On Mon, Feb 08, 2021 at 11:01:14PM -0500, Andrey Grodzovsky wrote:
>> On 2/8/21 2:27 AM, Daniel Vetter wrote:
>>> On Mon, Feb 8, 2021 at 6:59 AM Andrey Grodzovsky
>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>> On 1/20/21 10:59 AM, Daniel Vetter wrote:
>>>>> On Wed, Jan 20, 2021 at 3:20 PM Andrey Grodzovsky
>>>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>>>> On 1/20/21 4:05 AM, Daniel Vetter wrote:
>>>>>>> On Tue, Jan 19, 2021 at 01:18:15PM -0500, Andrey Grodzovsky wrote:
>>>>>>>> On 1/19/21 1:08 PM, Daniel Vetter wrote:
>>>>>>>>> On Tue, Jan 19, 2021 at 6:31 PM Andrey Grodzovsky
>>>>>>>>> <Andrey.Grodzovsky@amd.com> wrote:
>>>>>>>>>> On 1/19/21 9:16 AM, Daniel Vetter wrote:
>>>>>>>>>>> On Mon, Jan 18, 2021 at 04:01:09PM -0500, Andrey Grodzovsky wrote:
>>>>>>>>>>>> Until now extracting a card either by physical extraction (e.g. eGPU with
>>>>>>>>>>>> thunderbolt connection or by emulation through  syfs -> /sys/bus/pci/devices/device_id/remove)
>>>>>>>>>>>> would cause random crashes in user apps. The random crashes in apps were
>>>>>>>>>>>> mostly due to the app having mapped a device backed BO into its address
>>>>>>>>>>>> space was still trying to access the BO while the backing device was gone.
>>>>>>>>>>>> To answer this first problem Christian suggested to fix the handling of mapped
>>>>>>>>>>>> memory in the clients when the device goes away by forcibly unmap all buffers the
>>>>>>>>>>>> user processes has by clearing their respective VMAs mapping the device BOs.
>>>>>>>>>>>> Then when the VMAs try to fill in the page tables again we check in the fault
>>>>>>>>>>>> handlerif the device is removed and if so, return an error. This will generate a
>>>>>>>>>>>> SIGBUS to the application which can then cleanly terminate.This indeed was done
>>>>>>>>>>>> but this in turn created a problem of kernel OOPs were the OOPSes were due to the
>>>>>>>>>>>> fact that while the app was terminating because of the SIGBUSit would trigger use
>>>>>>>>>>>> after free in the driver by calling to accesses device structures that were already
>>>>>>>>>>>> released from the pci remove sequence.This was handled by introducing a 'flush'
>>>>>>>>>>>> sequence during device removal were we wait for drm file reference to drop to 0
>>>>>>>>>>>> meaning all user clients directly using this device terminated.
>>>>>>>>>>>>
>>>>>>>>>>>> v2:
>>>>>>>>>>>> Based on discussions in the mailing list with Daniel and Pekka [1] and based on the document
>>>>>>>>>>>> produced by Pekka from those discussions [2] the whole approach with returning SIGBUS and
>>>>>>>>>>>> waiting for all user clients having CPU mapping of device BOs to die was dropped.
>>>>>>>>>>>> Instead as per the document suggestion the device structures are kept alive until
>>>>>>>>>>>> the last reference to the device is dropped by user client and in the meanwhile all existing and new CPU mappings of the BOs
>>>>>>>>>>>> belonging to the device directly or by dma-buf import are rerouted to per user
>>>>>>>>>>>> process dummy rw page.Also, I skipped the 'Requirements for KMS UAPI' section of [2]
>>>>>>>>>>>> since i am trying to get the minimal set of requirements that still give useful solution
>>>>>>>>>>>> to work and this is the'Requirements for Render and Cross-Device UAPI' section and so my
>>>>>>>>>>>> test case is removing a secondary device, which is render only and is not involved
>>>>>>>>>>>> in KMS.
>>>>>>>>>>>>
>>>>>>>>>>>> v3:
>>>>>>>>>>>> More updates following comments from v2 such as removing loop to find DRM file when rerouting
>>>>>>>>>>>> page faults to dummy page,getting rid of unnecessary sysfs handling refactoring and moving
>>>>>>>>>>>> prevention of GPU recovery post device unplug from amdgpu to scheduler layer.
>>>>>>>>>>>> On top of that added unplug support for the IOMMU enabled system.
>>>>>>>>>>>>
>>>>>>>>>>>> v4:
>>>>>>>>>>>> Drop last sysfs hack and use sysfs default attribute.
>>>>>>>>>>>> Guard against write accesses after device removal to avoid modifying released memory.
>>>>>>>>>>>> Update dummy pages handling to on demand allocation and release through drm managed framework.
>>>>>>>>>>>> Add return value to scheduler job TO handler (by Luben Tuikov) and use this in amdgpu for prevention
>>>>>>>>>>>> of GPU recovery post device unplug
>>>>>>>>>>>> Also rebase on top of drm-misc-mext instead of amd-staging-drm-next
>>>>>>>>>>>>
>>>>>>>>>>>> With these patches I am able to gracefully remove the secondary card using sysfs remove hook while glxgears
>>>>>>>>>>>> is running off of secondary card (DRI_PRIME=1) without kernel oopses or hangs and keep working
>>>>>>>>>>>> with the primary card or soft reset the device without hangs or oopses
>>>>>>>>>>>>
>>>>>>>>>>>> TODOs for followup work:
>>>>>>>>>>>> Convert AMDGPU code to use devm (for hw stuff) and drmm (for sw stuff and allocations) (Daniel)
>>>>>>>>>>>> Support plugging the secondary device back after unplug - currently still experiencing HW error on plugging back.
>>>>>>>>>>>> Add support for 'Requirements for KMS UAPI' section of [2] - unplugging primary, display connected card.
>>>>>>>>>>>>
>>>>>>>>>>>> [1] - Discussions during v3 of the patchset https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Famd-gfx%2Fmsg55576.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C49a8be16944441aca3ce08d8cce01c88%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484610239738569%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PkvEkJt2zQ9G0dpiGYtSuVLpziwQ0FklkjdMLV2ZOnE%3D&amp;reserved=0
>>>>>>>>>>>> [2] - drm/doc: device hot-unplug for userspace https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg259755.html&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C49a8be16944441aca3ce08d8cce01c88%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484610239738569%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=akobkV%2FtjcDck7sHlGbgE5n1FCyGmcklhu%2Bx3goGRuw%3D&amp;reserved=0
>>>>>>>>>>>> [3] - Related gitlab ticket https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1081&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C49a8be16944441aca3ce08d8cce01c88%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637484610239738569%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=P0O5VHLkRczar2XHXyM8UysK%2BaD4hpUuoT%2FCBCnOW2g%3D&amp;reserved=0
>>>>>>>>>>> btw have you tried this out with some of the igts we have? core_hotunplug
>>>>>>>>>>> is the one I'm thinking of. Might be worth to extend this for amdgpu
>>>>>>>>>>> specific stuff (like run some batches on it while hotunplugging).
>>>>>>>>>> No, I mostly used just running glxgears while testing which covers already
>>>>>>>>>> exported/imported dma-buf case and a few manually hacked tests in libdrm amdgpu
>>>>>>>>>> test suite
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> Since there's so many corner cases we need to test here (shared dma-buf,
>>>>>>>>>>> shared dma_fence) I think it would make sense to have a shared testcase
>>>>>>>>>>> across drivers.
>>>>>>>>>> Not familiar with IGT too much, is there an easy way to setup shared dma bufs
>>>>>>>>>> and fences
>>>>>>>>>> use cases there or you mean I need to add them now ?
>>>>>>>>> We do have test infrastructure for all of that, but the hotunplug test
>>>>>>>>> doesn't have that yet I think.
>>>>>>>>>
>>>>>>>>>>> Only specific thing would be some hooks to keep the gpu
>>>>>>>>>>> busy in some fashion while we yank the driver.
>>>>>>>>>> Do you mean like staring X and some active rendering on top (like glxgears)
>>>>>>>>>> automatically from within IGT ?
>>>>>>>>> Nope, igt is meant to be bare metal testing so you don't have to drag
>>>>>>>>> the entire winsys around (which in a wayland world, is not really good
>>>>>>>>> for driver testing anyway, since everything is different). We use this
>>>>>>>>> for our pre-merge ci for drm/i915.
>>>>>>>> So i keep it busy by X/glxgers which is manual operation. What you suggest
>>>>>>>> then is some client within IGT which opens the device and starts submitting jobs
>>>>>>>> (which is much like what libdrm amdgpu tests already do) ? And this
>>>>>>>> part is the amdgou specific code I just need to port from libdrm to here ?
>>>>>>> Yup. For i915 tests we have an entire library already for small workloads,
>>>>>>> including some that just spin forever (useful for reset testing and could
>>>>>>> also come handy for unload testing).
>>>>>>> -Daniel
>>>>>> Does it mean I would have to drag in the entire infrastructure code from
>>>>>> within libdrm amdgpu code that allows for command submissions through
>>>>>> our IOCTLs ?
>>>>> No it's perfectly fine to use libdrm in igt tests, we do that too. I
>>>>> just mean we have some additional helpers to submit specific workloads
>>>>> for intel gpu, like rendercpy to move data with the 3d engine (just
>>>>> using copy engines only isn't good enough sometimes for testing), or
>>>>> the special hanging batchbuffers we use for reset testing, or in
>>>>> general for having precise control over race conditions and things
>>>>> like that.
>>>>>
>>>>> One thing that was somewhat annoying for i915 but shouldn't be a
>>>>> problem for amdgpu is that igt builds on intel. So we have stub
>>>>> functions for libdrm-intel, since libdrm-intel doesn't build on arm.
>>>>> Shouldn't be a problem for you.
>>>>> -Daniel
>>>> Tested with igt hot-unplug test. Passed unbind_rebind, unplug-rescan,
>>>> hot-unbind-rebind and hotunplug-rescan
>>>> if disabling the rescan part as I don't support plug-back for now. Also added
>>>> command submission for amdgpu.
>>>> Attached a draft of submitting workload while unbinding the driver or simulating
>>>> detach. Catched 2 issues with unpug if command submission in flight  during
>>>> unplug -
>>>> (unsignaled fence causing a hang in amdgpu_cs_sync and hitting a BUG_ON in
>>>> gfx_v9_0_ring_emit_patch_cond_exec whic is expected i guess).
>>>> Guess glxgears command submissions is at a much slower rate so this was missed.
>>>> Is that what you meant for this test ?
>>> Yup. Would be good if you can submit this one for inclusion.
>>> -Daniel
>>
>> Will do together with exported dma-buf test once I do it.
>>
>> P.S How am i supposed to do exported fence test. Exporting a fence from
>> device A, importing it into device B, unplugging
>> device A then signaling the fence from device B - this supposed to call a
>> fence cb which was registered
>> by the exporter which by now is dead and hence will cause a 'use after free' ?
> Yeah in the end we'd need 2 hw devices for testing full fence
> functionality. A useful intermediate step would be to just export the
> fence (either as sync_file, which I think amdgpu doesn't support because
> no android egl support in mesa) or drm_syncobj (which you can do as
> standalone fd too iirc), and then just using the fence a bit from
> userspace (like wait on it or get its status) after the device is
> unplugged.
>
> I think this should cover most of the cross-driver issues that fences
> bring in, and I think for the other problems we can worry once we spot.
> -Daniel


OK, will write up all the tests and submit a merge request for all of them 
together to IGT gitlab

Andrey


>
>> Andrey
>>
>>>> Andrey
>>>>
>>>>
>>>>>> Andrey
>>>>>>
>>>>>>>> Andrey
>>>>>>>>
>>>>>>>>
>>>>>>>>>>> But just to get it started
>>>>>>>>>>> you can throw in entirely amdgpu specific subtests and just share some of
>>>>>>>>>>> the test code.
>>>>>>>>>>> -Daniel
>>>>>>>>>> Im general, I wasn't aware of this test suite and looks like it does what i test
>>>>>>>>>> among other stuff.
>>>>>>>>>> I will definitely  try to run with it although the rescan part will not work as
>>>>>>>>>> plugging
>>>>>>>>>> the device back is in my TODO list and not part of the scope for this patchset
>>>>>>>>>> and so I will
>>>>>>>>>> probably comment the re-scan section out while testing.
>>>>>>>>> amd gem has been using libdrm-amd thus far iirc, but for things like
>>>>>>>>> this I think it'd be worth to at least consider switching. Display
>>>>>>>>> team has already started to use some of the test and contribute stuff
>>>>>>>>> (I think the VRR testcase is from amd).
>>>>>>>>> -Daniel
>>>>>>>>>
>>>>>>>>>> Andrey
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>>> Andrey Grodzovsky (13):
>>>>>>>>>>>>         drm/ttm: Remap all page faults to per process dummy page.
>>>>>>>>>>>>         drm: Unamp the entire device address space on device unplug
>>>>>>>>>>>>         drm/ttm: Expose ttm_tt_unpopulate for driver use
>>>>>>>>>>>>         drm/sched: Cancel and flush all oustatdning jobs before finish.
>>>>>>>>>>>>         drm/amdgpu: Split amdgpu_device_fini into early and late
>>>>>>>>>>>>         drm/amdgpu: Add early fini callback
>>>>>>>>>>>>         drm/amdgpu: Register IOMMU topology notifier per device.
>>>>>>>>>>>>         drm/amdgpu: Fix a bunch of sdma code crash post device unplug
>>>>>>>>>>>>         drm/amdgpu: Remap all page faults to per process dummy page.
>>>>>>>>>>>>         dmr/amdgpu: Move some sysfs attrs creation to default_attr
>>>>>>>>>>>>         drm/amdgpu: Guard against write accesses after device removal
>>>>>>>>>>>>         drm/sched: Make timeout timer rearm conditional.
>>>>>>>>>>>>         drm/amdgpu: Prevent any job recoveries after device is unplugged.
>>>>>>>>>>>>
>>>>>>>>>>>> Luben Tuikov (1):
>>>>>>>>>>>>         drm/scheduler: Job timeout handler returns status
>>>>>>>>>>>>
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu.h               |  11 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c      |  17 +--
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_device.c        | 149 ++++++++++++++++++++--
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c           |  20 ++-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c         |  15 ++-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c          |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h          |   1 +
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c           |   9 ++
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c       |  25 ++--
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c           |  26 ++--
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_irq.h           |   3 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_job.c           |  19 ++-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c           |  12 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_object.c        |  10 ++
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_object.h        |   2 +
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c           |  53 +++++---
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_psp.h           |   3 +
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c           |   1 +
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c          |  70 ++++++++++
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h          |  52 +-------
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c           |  21 ++-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c            |   8 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c      |  14 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/cik_ih.c               |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/cz_ih.c                |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/iceland_ih.c           |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/navi10_ih.c            |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/psp_v11_0.c            |  16 +--
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/psp_v12_0.c            |   8 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/psp_v3_1.c             |   8 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/si_ih.c                |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/tonga_ih.c             |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/amdgpu/vega10_ih.c            |   2 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
>>>>>>>>>>>>        drivers/gpu/drm/amd/include/amd_shared.h          |   2 +
>>>>>>>>>>>>        drivers/gpu/drm/drm_drv.c                         |   3 +
>>>>>>>>>>>>        drivers/gpu/drm/etnaviv/etnaviv_sched.c           |  10 +-
>>>>>>>>>>>>        drivers/gpu/drm/lima/lima_sched.c                 |   4 +-
>>>>>>>>>>>>        drivers/gpu/drm/panfrost/panfrost_job.c           |   9 +-
>>>>>>>>>>>>        drivers/gpu/drm/scheduler/sched_main.c            |  18 ++-
>>>>>>>>>>>>        drivers/gpu/drm/ttm/ttm_bo_vm.c                   |  82 +++++++++++-
>>>>>>>>>>>>        drivers/gpu/drm/ttm/ttm_tt.c                      |   1 +
>>>>>>>>>>>>        drivers/gpu/drm/v3d/v3d_sched.c                   |  32 ++---
>>>>>>>>>>>>        include/drm/gpu_scheduler.h                       |  17 ++-
>>>>>>>>>>>>        include/drm/ttm/ttm_bo_api.h                      |   2 +
>>>>>>>>>>>>        45 files changed, 583 insertions(+), 198 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> --
>>>>>>>>>>>> 2.7.4
>>>>>>>>>>>>
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
