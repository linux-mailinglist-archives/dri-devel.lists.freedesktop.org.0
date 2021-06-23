Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AB9B3B1B71
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:45:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0A16E8E3;
	Wed, 23 Jun 2021 13:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 980A56E8E3;
 Wed, 23 Jun 2021 13:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQKuueSxNykalO8ZWOYl8kVxgN1kEvJ9SLqb46bNJrWSdCJrmpm24Jj1Cf3xzx9BsIPXxnx//FHTJHq/Scd/yYfxmTNXEkU2a1FDheyoEZm7Rtl4m89RCdXptKOscox5UlNbagvOie84390wXLf7ekOYV1oUNZCXoV0m33ZZlH83IvfhfTwZc6cCLKOeGdQKAKmaX+VLoaS01kFDkt3QJGD6GaAEbT43NoltE5zLocS46Id3OqbOu3lKmaCdDNZjTQSVjpyIwZh071Ey2GFj50fxMKi2P1uA53YJrbliANgMZbYz6n+xYd+fTQTsFkMfKMqH2hJEXckn+TkgdjR7qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTkoOBivQfvNAjKtkSD/Lji4kNo8/rWRMZi+Y8oL5ko=;
 b=bOfkDAY4AzFOKwJUNkw/Wm3I8qOPKr0UBgI5lo6UZ2vmszRBxGms66f1j8VUQba60o0NOL+X31GCwpp/fOvs4K6CSpqU8tK3iecyDPtPW9g7MDBUdxyvYuWYosJh/+9/nCfR5OaNK9uu2dsDqnkXsXty1RCxQjQiiwLT8gCBY2JJfzGXNbYehAZ2ft3M1iMN3yebYeq/OVI2ndSQzdSb3CpkRxD4oJ3JpOrmfyASrl+643bYYoFeGKVFbUgWAHdl74FiVr0+07raQkX0cbbDZSZE1X23aZ3z38Xsf+hukWqV6ifD9TGyQKPAAMFzqfjfrymdWTfNtnO6BtUW59F6ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTkoOBivQfvNAjKtkSD/Lji4kNo8/rWRMZi+Y8oL5ko=;
 b=hiouip++u9WypzR0a0kIuNnCAOURKX2wl3z7LyyHc7Dx2/LizF1GOlDqis/xr9n4YIr1IQH0c3cpceYvjOUdiRejbGd3nZMxDwiKX7eChmWTAzTnc4pwBz6NVKgpy4iq+xlIxFCXriAm5TN47QFkswmYhEFDIOdv59MIU3Ms3/A=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4440.namprd12.prod.outlook.com (2603:10b6:208:26e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Wed, 23 Jun
 2021 13:44:56 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.024; Wed, 23 Jun 2021
 13:44:56 +0000
Subject: Re: [PATCH 15/15] RFC: drm/amdgpu: Implement a proper implicit
 fencing uapi
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-16-daniel.vetter@ffwll.ch>
 <CAP+8YyHPLpe6jM7gz3ZNL3QqdHiCdL0P5cVMS7ddNgBSJmutSA@mail.gmail.com>
 <CAKMK7uGOrro7-2+OVJse3CcuZO66kreq-XjL45Ay5vhL=2TZvQ@mail.gmail.com>
 <3bf45006-4256-763d-601b-3a25a7057820@amd.com>
 <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <421cb10d-92a7-0780-3d38-d4cabd008c0c@amd.com>
Date: Wed, 23 Jun 2021 15:44:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAP+8YyH1xyYVfEkYVudCn+=jyiWxoZgDndrcSLM0Qq=E9_GDKg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:871f:87e2:f394:e667]
X-ClientProxiedBy: PR0P264CA0280.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:871f:87e2:f394:e667]
 (2a02:908:1252:fb60:871f:87e2:f394:e667) by
 PR0P264CA0280.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Wed, 23 Jun 2021 13:44:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b2ff45a-813e-4872-d891-08d9364d15ef
X-MS-TrafficTypeDiagnostic: MN2PR12MB4440:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4440E736B5D9806B793AE29183089@MN2PR12MB4440.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5bpZZihSpZxXGsc7/hRHPOjHItC26w293DSs/ZCctxV7JuVIhVD74VprVpepMbzp0NSDN2AdBpVhP+ARr5KbbeUk8enkhM9MczhmNPl+U5r6eFGuElZPShzngEoE8OzTD20W0ixZvNz3z5X0wqokHHcuI/mif8Jh7UleqmW8i587bFND16XscBmrs/+qeHqeaJE3EvBuCBFjClDTZ7OsK014eZAJgDGK/dbpIblWBobZtI18SlQAkWYn7tRMvRUIVW5t8qEMNoimhteY2XBZ19TSz19ezwChKsRCwcCgOmblsJWL0P0SFhYZXEgiq9xYnAUxnnebNITaAqc+yYH7xuwaKy3mLUq4JnamVhjblsF85zxeAYG6lOGbSwQD2vux2xmn2InZj05SR3JWLe8Y23ZyFOSALBeuHflfJD60jZCpZC/HyjG0nEAVbly/quaGOWlVeEJDG/omf20iYADY2a1H6292JEuRKx9Ulwi1VigVAqTcVAdULu+DYQFhU7dF2CF1qk4awTRKDeIMH6s0dzr+fghbESO0Q2UzgGbPhL967tW5jlSpAh0rECQKWqYI8wFnl4HsKbCKK+G+qfenerJ6NdmQ/+b7PndcdQBFQlTn0bd9EJ+3Bafa9DOJlggxwlbAqEFu5FpmEY+/RPSBwQyD7Z2Pe/bDiTJMn8MLzT7RpQmdLCyAQeluOLHOmRwDVe2+7FKN1fm1oBMid+/zKYOwBpuPg0Z2zGYI+yNuodegi5tWFxYKJbs8S3wfsnI1CvK23u56SDZ39mTZLlNLRsv2yXD5U8qEb0xUF184jhVgKX86vY4nD92PetBNv39wL31WJ7vfm+xCrg16fyew++bVn4fkWCzAuPqG+UKB7Cg4fXilSsoRGczL+TROSPEpuhpm9eVAkkrR5PBjpYivEw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(346002)(366004)(45080400002)(478600001)(6916009)(66476007)(66946007)(66556008)(966005)(30864003)(31686004)(54906003)(83380400001)(66574015)(36756003)(316002)(7416002)(5660300002)(38100700002)(31696002)(86362001)(186003)(53546011)(16526019)(2616005)(2906002)(8936002)(6666004)(8676002)(6486002)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlZLZ01FQlJycUNCNk9BWG51OXlKd1Q1OG5XMUZCTnF2TkVNVFNjV2xHbXc0?=
 =?utf-8?B?ZSttenNrbm9hMWp5TE1mL1ZGQVlMTTBCOVdoVDlVa0s4QlQ1VEo2RE0vdnlX?=
 =?utf-8?B?Vm5BQ3ZiTmhEQlVORDhMT2lDODNqc1JxcTBZaHpja3RkK0pRakNNclNyb05n?=
 =?utf-8?B?WC9JNFRhTElxS216QktRYzBScFArUVFJTGE3NERaSXQ3cUdFOGE5akFUamFB?=
 =?utf-8?B?SjhEOXdIeXI4dXNZRzh5cmZuSDhza1hBQWR3dnVPOGJ3STBzcDNmeU9xN3g5?=
 =?utf-8?B?eTVtdWpBek5IZ2dmREZLWElsSWszY2RZdUFvU05XVDdXK1BkT0JQRFFKV0h1?=
 =?utf-8?B?VFZyTlVPc00zYkRmNVFXcmFheVBJMUx2QXpqRm5qclBLVGx3allwL2lDZUlx?=
 =?utf-8?B?RExyNFpoOXJEUTBUaUNPdndPSTllOEhpbUZlc2I4R084d0wyNStHQzBkZzd3?=
 =?utf-8?B?eTRxV3lobVIwYzlTWFJZNGRrdjZuRnpCWkR3WnZwOGlNL2lPZ0lta05wNFhz?=
 =?utf-8?B?Qnd2ZE9BNlkyeGtEcEhxS0dmMTFxK2xsbzdHeDJzT1o2OUMxUzNhSGdvSEJ0?=
 =?utf-8?B?elRRRFdWemZneERoNytndWdueUdLS3FoTGZZM0hnUWt2OU5WdzIxd0hSWkZi?=
 =?utf-8?B?UDVxMExLZWRHTko2c3F1OHNGVkdRQUFTWlJTcDN2QlFkSGxPS1JWcndjc2Vv?=
 =?utf-8?B?bVdLT3lINFZzQnN3V2VnM3JkZXdDc1VvVWU3M2Q4Q0VGaStwbzBkaTkzelJY?=
 =?utf-8?B?YWIyTnJPRkFSdU1GaUpLMDMvUVV5WVh3SnJZMHdjSHNWK21Qa0dEeFQvUDlV?=
 =?utf-8?B?SGFGZC9PWVo3NWVHazE5VnE0UklYd3dzdS9HZnRBTGhrMjhVK2NmaVp4dld4?=
 =?utf-8?B?R1ZmVjFzL2tuOFhYOERTWlM3YTNrNU55Vnl2eXNRcStPV0Z5Vm01RVVTZU1G?=
 =?utf-8?B?cUh0cVUvcit5WFc3ZjkwTXFZR1FqbWhJN2ZCVzAwSGZUT3FEQ1d5R2JzeG1y?=
 =?utf-8?B?M3M0R1hieW9CUS9oTm0xdm9TbGZ1eFBXNndaZFhPZWFUajl2bytXSGw4SWFJ?=
 =?utf-8?B?czBEcE00ZStZTnBUNHUvWkFKR0xwS3lCZ2FFS0d5UWpOWHMxMnFLVWlhbkFx?=
 =?utf-8?B?YnJlQjNuM3NjclFZNTB4TE85ejZYY0RMR2RkZms4SHgydTgxYnpEckkyRjJ5?=
 =?utf-8?B?Z2tJcHZiblZuUnpkQjdoc1FURFA3bGRUNk5GcWtVclZzOUZWK1hWd0d4alFK?=
 =?utf-8?B?dnlHVERYK3FVcHNscmNjOWNTcldtUGpsdXhtbzEweWc1MkhDeGM2cDhkd3JN?=
 =?utf-8?B?ZlZlNkN1bjFOOGw5MVJiYnE5TWd5MXkxdFcxeTZhZFpLc2kwYVZOMlFWMnFj?=
 =?utf-8?B?ak82U0RtQ05GaW83Ylp1N1RhaG9nUmpwK3Q2VVFRTGxiUVVQeDhFc3hGUnNt?=
 =?utf-8?B?ZDR6T05jbWpHUzhQWldFSjBacWluWGlENDhqUFp3VXN1Z3dFRTRubWxWcjd4?=
 =?utf-8?B?ZFBTMDliVHZsZE9Yem1JMjlYY29Idm9GMGErSzVtTUp0MmR4MzJUU25EcEFo?=
 =?utf-8?B?bnZwYzhqMW0wZTltT1hMeC94dlluZndaSmV1WUk5SzkrQjdNTnU2aGdXR2ln?=
 =?utf-8?B?VmdMdUtnRG5MM3NLMVhGS3R6USs3MGRwWG5nK0E3ZFJkVkoyam5waXZQdGwy?=
 =?utf-8?B?T3RYNXNWVk9hdUxKbmV3MlRlVDFaVm12Wk45Z2d1VW05SnhwOEZQdlIxN2Zi?=
 =?utf-8?B?N2t2K1BKSis4eGJFdllDUk90NzB6VU9lcnNBTzE5SXBFZWo0a1prekQreFZy?=
 =?utf-8?B?TnFXODhqNm1ydXNQc3JMdzJwT2FvSlVqTythT3JGSEdmOCtmK2RXdmdnRmh0?=
 =?utf-8?Q?lcaEs8tuf+3VX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b2ff45a-813e-4872-d891-08d9364d15ef
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2021 13:44:56.1895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9Dod5at7AGAYimwvik6fw2obQ8L1MnQGS91edbSCLH6gYnAe2kz773VKloo+CHU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4440
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Wang <kevin1.wang@amd.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 "Kristian H . Kristensen" <hoegsberg@google.com>,
 Chen Li <chenli@uniontech.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 mesa-dev <mesa-dev@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Dennis Li <Dennis.Li@amd.com>, Deepak R Varma <mh12gx2825@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.21 um 15:38 schrieb Bas Nieuwenhuizen:
> On Wed, Jun 23, 2021 at 2:59 PM Christian König
> <christian.koenig@amd.com> wrote:
>> Am 23.06.21 um 14:18 schrieb Daniel Vetter:
>>> On Wed, Jun 23, 2021 at 11:45 AM Bas Nieuwenhuizen
>>> <bas@basnieuwenhuizen.nl> wrote:
>>>> On Tue, Jun 22, 2021 at 6:55 PM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>>>>> WARNING: Absolutely untested beyond "gcc isn't dying in agony".
>>>>>
>>>>> Implicit fencing done properly needs to treat the implicit fencing
>>>>> slots like a funny kind of IPC mailbox. In other words it needs to be
>>>>> explicitly. This is the only way it will mesh well with explicit
>>>>> fencing userspace like vk, and it's also the bare minimum required to
>>>>> be able to manage anything else that wants to use the same buffer on
>>>>> multiple engines in parallel, and still be able to share it through
>>>>> implicit sync.
>>>>>
>>>>> amdgpu completely lacks such an uapi. Fix this.
>>>>>
>>>>> Luckily the concept of ignoring implicit fences exists already, and
>>>>> takes care of all the complexities of making sure that non-optional
>>>>> fences (like bo moves) are not ignored. This support was added in
>>>>>
>>>>> commit 177ae09b5d699a5ebd1cafcee78889db968abf54
>>>>> Author: Andres Rodriguez <andresx7@gmail.com>
>>>>> Date:   Fri Sep 15 20:44:06 2017 -0400
>>>>>
>>>>>       drm/amdgpu: introduce AMDGPU_GEM_CREATE_EXPLICIT_SYNC v2
>>>>>
>>>>> Unfortuantely it's the wrong semantics, because it's a bo flag and
>>>>> disables implicit sync on an allocated buffer completely.
>>>>>
>>>>> We _do_ want implicit sync, but control it explicitly. For this we
>>>>> need a flag on the drm_file, so that a given userspace (like vulkan)
>>>>> can manage the implicit sync slots explicitly. The other side of the
>>>>> pipeline (compositor, other process or just different stage in a media
>>>>> pipeline in the same process) can then either do the same, or fully
>>>>> participate in the implicit sync as implemented by the kernel by
>>>>> default.
>>>>>
>>>>> By building on the existing flag for buffers we avoid any issues with
>>>>> opening up additional security concerns - anything this new flag here
>>>>> allows is already.
>>>>>
>>>>> All drivers which supports this concept of a userspace-specific
>>>>> opt-out of implicit sync have a flag in their CS ioctl, but in reality
>>>>> that turned out to be a bit too inflexible. See the discussion below,
>>>>> let's try to do a bit better for amdgpu.
>>>>>
>>>>> This alone only allows us to completely avoid any stalls due to
>>>>> implicit sync, it does not yet allow us to use implicit sync as a
>>>>> strange form of IPC for sync_file.
>>>>>
>>>>> For that we need two more pieces:
>>>>>
>>>>> - a way to get the current implicit sync fences out of a buffer. Could
>>>>>     be done in a driver ioctl, but everyone needs this, and generally a
>>>>>     dma-buf is involved anyway to establish the sharing. So an ioctl on
>>>>>     the dma-buf makes a ton more sense:
>>>>>
>>>>>     https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-4-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca401fc4551f045c95d8808d9364c38f6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600523287217723%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=L8KCz8711Y2qZx0%2FJWT6HSg4o6OMhn%2BC4U2IR06nViE%3D&amp;reserved=0
>>>>>
>>>>>     Current drivers in upstream solves this by having the opt-out flag
>>>>>     on their CS ioctl. This has the downside that very often the CS
>>>>>     which must actually stall for the implicit fence is run a while
>>>>>     after the implicit fence point was logically sampled per the api
>>>>>     spec (vk passes an explicit syncobj around for that afaiui), and so
>>>>>     results in oversync. Converting the implicit sync fences into a
>>>>>     snap-shot sync_file is actually accurate.
>>>>>
>>>>> - Simillar we need to be able to set the exclusive implicit fence.
>>>>>     Current drivers again do this with a CS ioctl flag, with again the
>>>>>     same problems that the time the CS happens additional dependencies
>>>>>     have been added. An explicit ioctl to only insert a sync_file (while
>>>>>     respecting the rules for how exclusive and shared fence slots must
>>>>>     be update in struct dma_resv) is much better. This is proposed here:
>>>>>
>>>>>     https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210520190007.534046-5-jason%40jlekstrand.net%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Ca401fc4551f045c95d8808d9364c38f6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637600523287227719%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=8Ws%2B573T5rj9Bs08%2BQB5CbIAsWgo36hYiH%2Fd0dPcJeg%3D&amp;reserved=0
>>>>>
>>>>> These three pieces together allow userspace to fully control implicit
>>>>> fencing and remove all unecessary stall points due to them.
>>>>>
>>>>> Well, as much as the implicit fencing model fundamentally allows:
>>>>> There is only one set of fences, you can only choose to sync against
>>>>> only writers (exclusive slot), or everyone. Hence suballocating
>>>>> multiple buffers or anything else like this is fundamentally not
>>>>> possible, and can only be fixed by a proper explicit fencing model.
>>>>>
>>>>> Aside from that caveat this model gets implicit fencing as closely to
>>>>> explicit fencing semantics as possible:
>>>>>
>>>>> On the actual implementation I opted for a simple setparam ioctl, no
>>>>> locking (just atomic reads/writes) for simplicity. There is a nice
>>>>> flag parameter in the VM ioctl which we could use, except:
>>>>> - it's not checked, so userspace likely passes garbage
>>>>> - there's already a comment that userspace _does_ pass garbage in the
>>>>>     priority field
>>>>> So yeah unfortunately this flag parameter for setting vm flags is
>>>>> useless, and we need to hack up a new one.
>>>>>
>>>>> v2: Explain why a new SETPARAM (Jason)
>>>>>
>>>>> v3: Bas noticed I forgot to hook up the dependency-side shortcut. We
>>>>> need both, or this doesn't do much.
>>>>>
>>>>> v4: Rebase over the amdgpu patch to always set the implicit sync
>>>>> fences.
>>>> So I think there is still a case missing in this implementation.
>>>> Consider these 3 cases
>>>>
>>>> (format: a->b: b waits on a. Yes, I know arrows are hard)
>>>>
>>>> explicit->explicit: This doesn't wait now, which is good
>>>> Implicit->explicit: This doesn't wait now, which is good
>>>> explicit->implicit : This still waits as the explicit submission still
>>>> adds shared fences and most things that set an exclusive fence for
>>>> implicit sync will hence wait on it.
>>>>
>>>> This is probably good enough for what radv needs now but also sounds
>>>> like a risk wrt baking in new uapi behavior that we don't want to be
>>>> the end result.
>>>>
>>>> Within AMDGPU this is probably solvable in two ways:
>>>>
>>>> 1) Downgrade AMDGPU_SYNC_NE_OWNER to AMDGPU_SYNC_EXPLICIT for shared fences.
>>> I'm not sure that works. I think the right fix is that radeonsi also
>>> switches to this model, with maybe a per-bo CS flag to set indicate
>>> write access, to cut down on the number of ioctls that are needed
>>> otherwise on shared buffers. This per-bo flag would essentially select
>>> between SYNC_NE_OWNER and SYNC_EXPLICIT on a per-buffer basis.
>> Yeah, but I'm still not entirely sure why that approach isn't sufficient?
>>
>> Problem with the per context or per vm flag is that you then don't get
>> any implicit synchronization any more when another process starts using
>> the buffer.
> That is exactly what I want for Vulkan :)

Yeah, but as far as I know this is not something we can do.

See we have use cases like screen capture and debug which rely on that 
behavior.

The only thing we can do is to say on a per buffer flag that a buffer 
should not participate in implicit sync at all.

Regards,
Christian.

>>> The current amdgpu uapi just doesn't allow any other model without an
>>> explicit opt-in. So current implicit sync userspace just has to
>>> oversync, there's not much choice.
>>>
>>>> 2) Have an EXPLICIT fence owner that is used for explicit submissions
>>>> that is ignored by AMDGPU_SYNC_NE_OWNER.
>>>>
>>>> But this doesn't solve cross-driver interactions here.
>>> Yeah cross-driver is still entirely unsolved, because
>>> amdgpu_bo_explicit_sync() on the bo didn't solve that either.
>> Hui? You have lost me. Why is that still unsolved?
> The part we're trying to solve with this patch is Vulkan should not
> participate in any implicit sync at all wrt submissions (and then
> handle the implicit sync for WSI explicitly using the fence
> import/export stuff that Jason wrote). As long we add shared fences to
> the dma_resv we participate in implicit sync (at the level of an
> implicit sync read) still, at least from the perspective of later jobs
> waiting on these fences.
>
>> Regards,
>> Christian.
>>
>>> -Daniel
>>>
>>>>> Cc: mesa-dev@lists.freedesktop.org
>>>>> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
>>>>> Cc: Dave Airlie <airlied@gmail.com>
>>>>> Cc: Rob Clark <robdclark@chromium.org>
>>>>> Cc: Kristian H. Kristensen <hoegsberg@google.com>
>>>>> Cc: Michel Dänzer <michel@daenzer.net>
>>>>> Cc: Daniel Stone <daniels@collabora.com>
>>>>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
>>>>> Cc: "Christian König" <christian.koenig@amd.com>
>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>>> Cc: Deepak R Varma <mh12gx2825@gmail.com>
>>>>> Cc: Chen Li <chenli@uniontech.com>
>>>>> Cc: Kevin Wang <kevin1.wang@amd.com>
>>>>> Cc: Dennis Li <Dennis.Li@amd.com>
>>>>> Cc: Luben Tuikov <luben.tuikov@amd.com>
>>>>> Cc: linaro-mm-sig@lists.linaro.org
>>>>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c  |  7 +++++--
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 21 +++++++++++++++++++++
>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  6 ++++++
>>>>>    include/uapi/drm/amdgpu_drm.h           | 10 ++++++++++
>>>>>    4 files changed, 42 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> index 65df34c17264..c5386d13eb4a 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>> @@ -498,6 +498,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>           struct amdgpu_bo *gds;
>>>>>           struct amdgpu_bo *gws;
>>>>>           struct amdgpu_bo *oa;
>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>           int r;
>>>>>
>>>>>           INIT_LIST_HEAD(&p->validated);
>>>>> @@ -577,7 +578,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>>>>>
>>>>>                   e->bo_va = amdgpu_vm_bo_find(vm, bo);
>>>>>
>>>>> -               if (bo->tbo.base.dma_buf && !amdgpu_bo_explicit_sync(bo)) {
>>>>> +               if (bo->tbo.base.dma_buf &&
>>>>> +                   !(no_implicit_sync || amdgpu_bo_explicit_sync(bo))) {
>>>>>                           e->chain = dma_fence_chain_alloc();
>>>>>                           if (!e->chain) {
>>>>>                                   r = -ENOMEM;
>>>>> @@ -649,6 +651,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>    {
>>>>>           struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
>>>>>           struct amdgpu_bo_list_entry *e;
>>>>> +       bool no_implicit_sync = READ_ONCE(fpriv->vm.no_implicit_sync);
>>>>>           int r;
>>>>>
>>>>>           list_for_each_entry(e, &p->validated, tv.head) {
>>>>> @@ -656,7 +659,7 @@ static int amdgpu_cs_sync_rings(struct amdgpu_cs_parser *p)
>>>>>                   struct dma_resv *resv = bo->tbo.base.resv;
>>>>>                   enum amdgpu_sync_mode sync_mode;
>>>>>
>>>>> -               sync_mode = amdgpu_bo_explicit_sync(bo) ?
>>>>> +               sync_mode = no_implicit_sync || amdgpu_bo_explicit_sync(bo) ?
>>>>>                           AMDGPU_SYNC_EXPLICIT : AMDGPU_SYNC_NE_OWNER;
>>>>>                   r = amdgpu_sync_resv(p->adev, &p->job->sync, resv, sync_mode,
>>>>>                                        &fpriv->vm);
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> index c080ba15ae77..f982626b5328 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>>>>> @@ -1724,6 +1724,26 @@ int amdgpu_file_to_fpriv(struct file *filp, struct amdgpu_fpriv **fpriv)
>>>>>           return 0;
>>>>>    }
>>>>>
>>>>> +int amdgpu_setparam_ioctl(struct drm_device *dev, void *data,
>>>>> +                         struct drm_file *filp)
>>>>> +{
>>>>> +       struct drm_amdgpu_setparam *setparam = data;
>>>>> +       struct amdgpu_fpriv *fpriv = filp->driver_priv;
>>>>> +
>>>>> +       switch (setparam->param) {
>>>>> +       case AMDGPU_SETPARAM_NO_IMPLICIT_SYNC:
>>>>> +               if (setparam->value)
>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, true);
>>>>> +               else
>>>>> +                       WRITE_ONCE(fpriv->vm.no_implicit_sync, false);
>>>>> +               break;
>>>>> +       default:
>>>>> +               return -EINVAL;
>>>>> +       }
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>>    const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_CREATE, amdgpu_gem_create_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_CTX, amdgpu_ctx_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>> @@ -1742,6 +1762,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] = {
>>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_VA, amdgpu_gem_va_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_OP, amdgpu_gem_op_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>           DRM_IOCTL_DEF_DRV(AMDGPU_GEM_USERPTR, amdgpu_gem_userptr_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>> +       DRM_IOCTL_DEF_DRV(AMDGPU_SETPARAM, amdgpu_setparam_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),
>>>>>    };
>>>>>
>>>>>    static const struct drm_driver amdgpu_kms_driver = {
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>> index ddb85a85cbba..0e8c440c6303 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
>>>>> @@ -321,6 +321,12 @@ struct amdgpu_vm {
>>>>>           bool                    bulk_moveable;
>>>>>           /* Flag to indicate if VM is used for compute */
>>>>>           bool                    is_compute_context;
>>>>> +       /*
>>>>> +        * Flag to indicate whether implicit sync should always be skipped on
>>>>> +        * this context. We do not care about races at all, userspace is allowed
>>>>> +        * to shoot itself with implicit sync to its fullest liking.
>>>>> +        */
>>>>> +       bool no_implicit_sync;
>>>>>    };
>>>>>
>>>>>    struct amdgpu_vm_manager {
>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.h
>>>>> index 0cbd1540aeac..9eae245c14d6 100644
>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>> @@ -54,6 +54,7 @@ extern "C" {
>>>>>    #define DRM_AMDGPU_VM                  0x13
>>>>>    #define DRM_AMDGPU_FENCE_TO_HANDLE     0x14
>>>>>    #define DRM_AMDGPU_SCHED               0x15
>>>>> +#define DRM_AMDGPU_SETPARAM            0x16
>>>>>
>>>>>    #define DRM_IOCTL_AMDGPU_GEM_CREATE    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
>>>>>    #define DRM_IOCTL_AMDGPU_GEM_MMAP      DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
>>>>> @@ -71,6 +72,7 @@ extern "C" {
>>>>>    #define DRM_IOCTL_AMDGPU_VM            DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_VM, union drm_amdgpu_vm)
>>>>>    #define DRM_IOCTL_AMDGPU_FENCE_TO_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_FENCE_TO_HANDLE, union drm_amdgpu_fence_to_handle)
>>>>>    #define DRM_IOCTL_AMDGPU_SCHED         DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SCHED, union drm_amdgpu_sched)
>>>>> +#define DRM_IOCTL_AMDGPU_SETPARAM      DRM_IOW(DRM_COMMAND_BASE + DRM_AMDGPU_SETPARAM, struct drm_amdgpu_setparam)
>>>>>
>>>>>    /**
>>>>>     * DOC: memory domains
>>>>> @@ -306,6 +308,14 @@ union drm_amdgpu_sched {
>>>>>           struct drm_amdgpu_sched_in in;
>>>>>    };
>>>>>
>>>>> +#define AMDGPU_SETPARAM_NO_IMPLICIT_SYNC       1
>>>>> +
>>>>> +struct drm_amdgpu_setparam {
>>>>> +       /* AMDGPU_SETPARAM_* */
>>>>> +       __u32   param;
>>>>> +       __u32   value;
>>>>> +};
>>>>> +
>>>>>    /*
>>>>>     * This is not a reliable API and you should expect it to fail for any
>>>>>     * number of reasons and have fallback path that do not use userptr to
>>>>> --
>>>>> 2.32.0.rc2
>>>>>
>>>

