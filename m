Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B6841582B
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 08:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28BB26ECDF;
	Thu, 23 Sep 2021 06:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E75E6ECDF
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Sep 2021 06:17:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KJ/JIidVzb1b5lOvjMIVw2lSjSSys4eyr67U2jTKB33QXwKnKlgStUBGAoHqVSGs2ufYcUBrSXgiux2tBKreitzaIxlmSfCkQfqgev5FMMEZ51dNviH+FYayEvs3/n/2p2UdbbiprAQNdguNah8v8XfP0oZOz0rUc3nZwfIJxQ+kcz03MkHh4kNpLhhYpwlsg+Y2GC/SQ/BAmKOVig9iCIsHuACXwDbcokgveifdJT/ckqnDqrgASKVb5+37UMzdadJw4EOAZ3PlZ+4pe/J8XhaVHCo2rS2PoMArg09lsxvUZ1nfn/OrRogG+xAUmak0Ch5IA08NmJ41HQprBUsMTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=iW+QWVNpioo1J/BHf1wZW0eYErhKVN3YhAdh/HVQAFI=;
 b=J+qpVUx9UbT7SUD3CGiVSqKuYLLzLY/TU2Y38ZYw8YN2GX8h9y8j08Z/FYnyXeSLFUJk3y76823aMhuUCEGMo6skMVG2/7S6yMvxe3gDC+MDLySVnKMNq1xVnwIyl/03iKXBD+oM/AplZpqvHdOqhP9H7SuVNPNcKEGABQtPsbqJdYFbE43FDRkEKtGcWFPc10DYNhU2o0SjABMbIgpZ60/ur7NvGJJ9Th9IMLJBy5psMwhrt65OdOQzTpLBwOeVK7B7vLTJ9R6aAq1CnWkVg14/FT/YsVR39FRhRdH0qPtw7XctaMQZ0guX20RnYnI5Y1c6ij/ekYhEJ2yDR2IvfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW+QWVNpioo1J/BHf1wZW0eYErhKVN3YhAdh/HVQAFI=;
 b=Dj9/0z0Rch6MNu/dD/Y0J4VDO9hPgSemzCXaQQHL8g5g+kLtjJlpy4T70sutt+xz1wpwyxtA+cl0bU+Xh/IIh595rkHvR5Ep+7A3F113Thj1Nl5XwDIIjVpZHN7poxvyyLJD+D+zSl64N0raIYCgs8tgj2fzpZ8f1gcnJn64Yps=
Authentication-Results: baylibre.com; dkim=none (message not signed)
 header.d=none;baylibre.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 06:17:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4544.015; Thu, 23 Sep 2021
 06:17:41 +0000
Subject: Re: [RFC PATCH 2/4] DRM: Add support of AI Processor Unit (APU)
To: Dave Airlie <airlied@gmail.com>, Alexandre Bailon <abailon@baylibre.com>
Cc: Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 ohad@wizery.com, bjorn.andersson@linaro.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-remoteproc@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK"
 <linaro-mm-sig@lists.linaro.org>, khilman@baylibre.com, gpain@baylibre.com
References: <20210917125945.620097-1-abailon@baylibre.com>
 <20210917125945.620097-3-abailon@baylibre.com>
 <CAPM=9tzOADabEgEP1L+yNO4gj2JhNuVDL-Bhpbsz4=UX5feLcg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ffc29919-809f-05c3-6079-62f1e6453f24@amd.com>
Date: Thu, 23 Sep 2021 08:17:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <CAPM=9tzOADabEgEP1L+yNO4gj2JhNuVDL-Bhpbsz4=UX5feLcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0090.eurprd05.prod.outlook.com
 (2603:10a6:208:136::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [192.168.178.21] (91.14.161.181) by
 AM0PR05CA0090.eurprd05.prod.outlook.com (2603:10a6:208:136::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 06:17:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a93b627-b420-487d-f228-08d97e59d945
X-MS-TrafficTypeDiagnostic: MN2PR12MB4375:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4375B3F56493E32C96DF95FE83A39@MN2PR12MB4375.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KrkzJA2dNiZw3Yvdu/POyWStd4YAhzN3QexReseCYHnRsUIbkTFpm10Kd8WSL3/xGl5BlLFRGj4DkXplYDfMm9qQwu6nKSHCtlmO6+HTuKf4exTdteSX0FcJwya9HGbyX3zUKCyT+vSxIYfEaA4nUFEnWYxLXvLzEYo4/Ltb7h45EtTEw9B+6CKmkPehyItpjweBe+kcjrlu7hp6n8lbqIx5MEj/Qq+d9AYq6V4dXxzPa8JZ+aF+gTTZUEkBHwKymNwLZwPGkYhA5wO30ss1lPXUY8GyPli1NKTqobWDKo9q4jdJoH99BablpDXDNsBLZCBKslOS6YqbJfKFd/WQmsheMDQSUGJocKYfMAJCFhGQUQXCfj3JkNarfLB7BRFJvU0KhaYvMICf0HFugGFECmik01w0tG9Vz/LkWKSETjjBez4/95/nZBUMSEyrAm6Src3LZVgyt/22WIimsCPyW9+PkyrOUrWUENbdKa7gqjJtlYT/CDVdlwwPtNp3kJeStviYT/A9PXbDG6F3N02Wo0kqFpKXlAE6Vlppzr5Y2chLR5Tl5vkRJim/WvVCD53/bH/c7DQPfTuC9UOsSwhlrUVXJtzANa766j83nzj4aajN04thP6B1qDtAEUlr6MxTIkskPLFNrGBV/aWTGY/b5v8ohlBEBWaF/m8OU8B6MPFpoXyjMhjuwEJBnpyguTsb06tELJn8I8Y+KolV2v9zQidFJj0OhDc8oh33WKeCkhamy4uUPG/5CVThp5e8QWT6s7Yp2XvSRyeUcxi7wG/SxZ58UfXWhB90fiWyoV36jokZhQGe5X+xUu8eYgnWlBlQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(966005)(38100700002)(508600001)(6486002)(16576012)(31686004)(4326008)(5660300002)(36756003)(45080400002)(26005)(956004)(2906002)(110136005)(2616005)(54906003)(8936002)(7416002)(66476007)(66556008)(31696002)(186003)(8676002)(86362001)(316002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFJEQVNzM2ZMazNJQlFkSTU5QUFDTjNVakNRM2JJR3krMWxzVEFIUWRQM0J2?=
 =?utf-8?B?eVlPNTM1Q004TklzUXp4T2h5TldydXdGZWxhZDFXeC80L2NSTWFFSFhINTNz?=
 =?utf-8?B?RFBQa2JaRnFUbVZGYTJmbVNpVnlhWUs0bUVBbUZNN3VnQXFuRTFoUWwxUlBi?=
 =?utf-8?B?YitGdjVZVUFnMzE3VGVwRUpqN1FSZ1Y5QmFFaEZobi9CZjBpc0VkSlJNajZ4?=
 =?utf-8?B?SkNSVVVnTlRtbXJpaHFOQ1FSWjdlbE9EVjVGMWl5K0xyTTRWZ3pQdktmZjc1?=
 =?utf-8?B?Qm9wZ2xLcGl2RmdWOE9OaVMra09samlRVnRyRGlaK2RkMHB4aGJkdnRtek1E?=
 =?utf-8?B?M2g0TFF6UlBLQU0xZGtIaFRKNnNnaTBOY0wwam9LZFI1RU9hZFdLMFVlZHlo?=
 =?utf-8?B?OEdlc2pTdDJjVFRRMHJqUlBJV3MrMHhIQlpFOElMVWNUemRveFlJWEtZNmsv?=
 =?utf-8?B?TkRSdjJjVElYdEJSK0F5OW5DaDd0MWJ4cWZkQnhLM29HU1JJeFRRVFVkdFJW?=
 =?utf-8?B?akpuZWluSWRxK0NuSzN5VmgzeTIvTXpLZ2E5cTRTb1FOUDdkSWFudkNkSExM?=
 =?utf-8?B?Y2ZnMlRSUGRTcVIxR3JxR2Z0NzdHZWg1ZFlpR3NhU0psOFFSVUZwdVAveEdV?=
 =?utf-8?B?REJKeVlrNFBqOUdZSFZXRDRSQWFob3ZCampaakVpbUZ6OW9xY21UK0xQckFa?=
 =?utf-8?B?N05tb2UrUCtJbjZwYVFScHRZVHcyTC9sVjlydFdMaUlmRzZjamhFalZST09q?=
 =?utf-8?B?TkZFSXRaeUp3dHlLYlZjOUx3ajZFQWI5a21HVVlhZGQ5dE9QaDhhV1hCNUFD?=
 =?utf-8?B?VkhOV3hMRFdISlJJR2czSmVZeE5KaHg4Z0JqZ0JxZGlxMzdWSlVmS1MvbThy?=
 =?utf-8?B?bk9kb3oxTk1oMi8zL1hKZVpQNUlCY1F1WVptdmlZVUhmWXVFVFg5dnZiMUFG?=
 =?utf-8?B?TWZQRysrbVhOblF3bStrM0ZPNjBnS1pBOVAvRmsvSitad2t6QWFPTW9lc3Ba?=
 =?utf-8?B?L0pKTDkxZ2FjWjZTd1g4TUw2dnY1elVEU0pVdTJDckYyZmxBZEo2QW1aNDdV?=
 =?utf-8?B?ZG1XQ3F6SnoxNlg5Y09QUWluUEw4bHpWZXYyV2kvU1NnYUdkYnd6MDdmd0Q0?=
 =?utf-8?B?eUxpclJ4QXVXdHpRUXo1cXU2Sno4NDRDL2tRS1pGTCtxdWhtd3lTbEFreVJ1?=
 =?utf-8?B?UzZRbjY5RTB0RWIyaEZSSkpCL1NpR0pEdzJCME1EVHFZK2U1NDgxaW41MDBr?=
 =?utf-8?B?VHBqdzFHQjhQb2ZMaFdWQmwvU2dSTkdBYTZna3NWaTZrckFjZ1diRHpZYXJW?=
 =?utf-8?B?M3h4NTI0T1JGSGE2eG11WGtKSlpYMm1pamZjUGs3Tzg1aDZjNUNNWW55RCsr?=
 =?utf-8?B?d210bHZZOE92b2tJbThLSzU3THVzS09WTUlYQW91dkNjcjFEaFN4bUdPQVBV?=
 =?utf-8?B?UytlRi9YNld1VlBXcnpHZm16eHc0Qjk3RzNibHR5ajI4bStwWElOSjB5Q0Fh?=
 =?utf-8?B?YXFRTUxjTGUvNm9kalFwajRLL1phbmZzMVVPNHFsY0ZrYjZxcEhsRFdwQmkx?=
 =?utf-8?B?OFJKSFc5MEZxVVhucEd1WlVBbkp1OU1CYy9uejhDY003Ymp5WTdyaE9zemtv?=
 =?utf-8?B?N056UlNRZlZHRnNJcnh1a1d0WElGYjlSeEQ3djBOZE1vV1dETjQ3OG5aYnA0?=
 =?utf-8?B?azhHSkdhSENJZ2ppTnRNSFdCeDRGckh2SUg3VkY2K1VESkZkbGIrOGdHS2Qv?=
 =?utf-8?Q?yQauzGVL4ggD98lZmViwOwXn9R9TDtFxNgTsI/F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a93b627-b420-487d-f228-08d97e59d945
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 06:17:41.3773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i8ka79Yy4qjAzt5uimpZkB9KaQQt1SH7Mxl/Xj6gWKZyAoXfTP89tFfbNfWG3lyg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375
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

Am 23.09.21 um 02:58 schrieb Dave Airlie:
> On Sat, 18 Sept 2021 at 07:57, Alexandre Bailon <abailon@baylibre.com> wrote:
>> Some Mediatek SoC provides hardware accelerator for AI / ML.
>> This driver provides the infrastructure to manage memory
>> shared between host CPU and the accelerator, and to submit
>> jobs to the accelerator.
>> The APU itself is managed by remoteproc so this drivers
>> relies on remoteproc to found the APU and get some important data
>> from it. But, the driver is quite generic and it should possible
>> to manage accelerator using another ways.
>> This driver doesn't manage itself the data transmitions.
>> It must be registered by another driver implementing the transmitions.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> [SNIP]

>> Please refer to
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.kernel.org%2Fdoc%2FDocumentation%2Fioctl%2Fbotching-up-ioctls.rst&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C53a0ef2630404ddc4d9408d97e2d409c%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637679555123878415%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=6oVXAAOjQX%2FnDzJxZIAALqjDourHdrdGF6QVQKR58KI%3D&amp;reserved=0
>>
>> here and below in many places.
>>
>> There's a lot of missing padding/alignment here.

There is also the pahole utility which show you nicely where you need 
padding for your IOCTL structures.

For example "pahole drivers/gpu/drm/amd/amdgpu/amdgpu.ko -C 
drm_amdgpu_gem_va" gives you:

struct drm_amdgpu_gem_va {
     __u32                      handle;               /*     0     4 */
     __u32                      _pad;                 /*     4     4 */
     __u32                      operation;            /*     8     4 */
     __u32                      flags;                /*    12     4 */
     __u64                      va_address;           /*    16     8 */
     __u64                      offset_in_bo;         /*    24     8 */
     __u64                      map_size;             /*    32     8 */

     /* size: 40, cachelines: 1, members: 7 */
     /* last cacheline: 40 bytes */
};

And as you can see we have added the _pad field to our IOCTL parameter 
structure to properly align the 64bit members.

Regards,
Christian.

>>
>> I'm trying to find the time to review this stack in full, any writeups
>> on how this is used from userspace would be useful (not just the code
>> repo, but some sort of how do I get at it) it reads as kinda generic
>> (calling it apu), but then has some specifics around device binding.
>>
>> Dave.

