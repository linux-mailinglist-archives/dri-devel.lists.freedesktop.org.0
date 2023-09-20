Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EA47A79AB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 12:48:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0E010E16C;
	Wed, 20 Sep 2023 10:48:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FD210E16C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 10:48:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C8ig5CgA6erbMJEn1GXzBsDm9+aZGeogQWFFB+V+puSqvAQbogtUMS+yQVOdEaOWyaAxaQj9qJLMp8iiOGma83p7Gh2aZImrXnFbM+QZUc5Ms96mkJaZA22SunWHYPRPuSwi7JwyeDAXqQ9GFw6xEEosU1uakK7duFVVQe+H9TgFANU/wf3VPKkw8HNBNfdUSU4Ob+m7l/CFymZGuDz/LbHsc7LHEAP5PZBKZ7zUsqxyl0qucPJXQld3yltlvJ+gt+UW08ZuyfYs4XWQ8dzPwOJsjHdGtCXBPgGkzoS/GGiOxmyLb0dEuIjle4cjrvCf8FXwuBkGPwBrpBaVgWTrvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nEEeUK+5vhvWEau/0uikX2Hsn7h5+HbJjUIc5PtG5s=;
 b=XVZx9A5bl1XjIS2EyE7849QlhOJvhDkl5le0pQHAjUsuxlc//kPdreEcHuao/yUosiGBLy4BFS4agYoaTRLzcwm9jv5o+oX0DGBWNsZiWXV/gPZ7MPtOAD3Wvsus3WnBhwBUp+gYP0QTw/oxIUdqrp0ccrPGNRMOTz5menfMRHW6CTuiQQmhXFSGl020atPykn4sy/f82DjegxLaxCY4AHlWkSq/LZJCTmKWej3CNnMxklGXvhShS0xenDEH7EERGaSU2cCyIbZkno0LeDMSfoqKSfwYqFl6o62sqLUPrjylfyCZnDm/KW+FuPDQy2PgFMc1unvjWDM6/NYj371GmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5nEEeUK+5vhvWEau/0uikX2Hsn7h5+HbJjUIc5PtG5s=;
 b=kDrtiiiPWpSR+lA7VJG/A3i/F3+FvLFD9vK1c4bnfkK1GXTjULf+A3Yn1AS2wN9n8B2sCsuSVnc79xyLTeH5savTlS9JC+oK27cnK5H2AQ18Qnw53fL325bBJjE2J+0PjYswdVxGzSmxNovDKC5jpcM0/yzP1/YS6cTvH6rx3dE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV3PR12MB9096.namprd12.prod.outlook.com (2603:10b6:408:198::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Wed, 20 Sep
 2023 10:48:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::55cb:215b:389e:eced%5]) with mapi id 15.20.6792.026; Wed, 20 Sep 2023
 10:48:30 +0000
Message-ID: <690a0d33-0091-fdbf-7a1c-c9de89bb79eb@amd.com>
Date: Wed, 20 Sep 2023 12:48:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: Decrypting tt maps in ttm
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Zack Rusin <zackr@vmware.com>, "alexdeucher@gmail.com"
 <alexdeucher@gmail.com>
References: <15c9beb5f8dcb091b00c35d6206b84aa100d729e.camel@vmware.com>
 <60f15275-ebfd-2fd6-64c4-c8907520e5dd@amd.com>
 <3fa9b4d0-e12a-59b6-14c5-68f7406df129@linux.intel.com>
 <fc935b9f-9b25-bcab-717c-0c31373fcfee@linux.intel.com>
 <e9ba0f7a0620cd252adfc1df43cd15d16dcea74d.camel@vmware.com>
 <883309f9-fcd3-51c5-52e7-3e0ae5650cba@linux.intel.com>
 <CADnq5_PPAZqusAoMTrG3OE3seZTQZbj1HC1u-4d5hcCQHsPD0g@mail.gmail.com>
 <b8fa7c6a4cd01fdfabef512972f79b67a1cbe58c.camel@vmware.com>
 <5efd9a5d-7c88-855a-8a2f-5d984ea4a5e7@amd.com>
 <53e09f13-eb54-9662-a511-77c012df9646@linux.intel.com>
 <beb209b5-fb67-5b53-62b8-bc1c78b41cc5@amd.com>
 <d61a3236737e13a6a303fd9902cf6938e29cf32d.camel@vmware.com>
 <70af0fd3-3dbb-b19a-8a4d-dcddab60d3e9@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <70af0fd3-3dbb-b19a-8a4d-dcddab60d3e9@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::16) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV3PR12MB9096:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a957cd-7026-41c7-1651-08dbb9c72095
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GbAm7H/uJ/+39acusMp0N9p+A1Ar6dBmqeQT+w9JfTm5WfruHekoJ3zOakWMjmJQ3yJk/C40Vj2CymS7omH3cQAgq9yC4ySZgmqI3gTFJ7AHcDo74JpIEzeZPG5xMzt4xGtJk8re5xcfwpj/VBqrXBSwBq5yAunBts+CBv8IGvJ4SAfQ9tx1JHot4IqGCnIFQQms7Ci58M8t4YSHsIBTCZQY6hSXlrEr5Hgt5Ds338+9pT+D3c1egNEkjzkxGcmqTWCEN37ZIWQ1WK+ei/haHv6hGOEgylhb8CkGZGgpn+yJ5XfNxJudxX5hNStmrpD8UniW4n4RUKsc2hrmRrb49QGV/IP0gOokzzsZhf7jcMuS6H/X7xP1aR0HmQe5H83bFRhU1EUsjVSBeTzkCOeOxOIZ11W3NYBK5+FHGR1xoCUY3C9iEeZhgR6fEG1gAA48C0r8a6fznC9vloPjwnIOW+Zcdt9eZaKHZEDlVKvOHJm6vkeiP2d602h63uQbu4B3Y76GXnt69yeOpFLG54l65coB+moEUxQ7B6QPE3nPpWFj+jeegCbnl7CJz7E53dJz+qT7amILwAmsi7DmJt+ZkIyzCR7vLAWpdco98cjJLFqwJkAX89qO2a7k/UqXfxUfOuugvAnD/K5TYMRRmBcxhPOLbtkSDYFlS+DWwyK713L6YEjbfMpVECB4mYfuK6MY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199024)(186009)(1800799009)(38100700002)(2616005)(26005)(53546011)(66574015)(83380400001)(31696002)(66476007)(110136005)(54906003)(66946007)(2906002)(86362001)(966005)(4326008)(5660300002)(31686004)(316002)(8936002)(8676002)(66556008)(41300700001)(6486002)(36756003)(6666004)(6512007)(6506007)(478600001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b3U0NWg3WFQyTnE5Vy8yeDBFWmRWMGRBRVVwWm9ITlRnVGtjU0RqR0JNUUp5?=
 =?utf-8?B?WFJ2WTY2d2p6YjdpTFpYY3V5YUJWVmJodlZNS3V3NWR4WUtpR2lsQWV0bXNq?=
 =?utf-8?B?bnEzR2NiYnl2VzVGUUpUWGVXYzNYUVBwdHBMZ0RZWC9CVm45OFplc1l2Nm1H?=
 =?utf-8?B?OFU1SFpVdWM4YkFlZ29ZNlNlcy9USmxBbGFxWE5qUm9KTmxlc2NLWUQxSzlB?=
 =?utf-8?B?VldsLzJmdXFib0pwa0RUdnBONzhCU2tEQUdLeVVMUHZjVVNWUkM4aUg1ZXJo?=
 =?utf-8?B?TmI4YlFJVmdvWlVTVFczUDZLVXZPdjBKQVlxbHdBV21QOVlwdmJZblNETkFx?=
 =?utf-8?B?M085SktDa0c1MGtvUG5Va05QcDZYbFU2dG5MNkNWcFZ1dW16VTIzSWZZckdW?=
 =?utf-8?B?NlR1azlFcFJBNmhGNTNsMngxblg0eE5YVDduSDVXNXRjdG5SUjBLZ1ZQQ2xh?=
 =?utf-8?B?a1dBSjAwcVZNVFhUMnNCQXZlb2lRUUNLekNCNU5xRkVMaWtkdUpUNTB2cDJ4?=
 =?utf-8?B?ZGQreHpsZjd2LzFKb092QXpOVjkwZ1FPOE8rNzBtYkNlYkgrcmtMenJLTENu?=
 =?utf-8?B?QmlKeHZsMTZLb2NkL3N5cGgzSy9jaUpYQkRZdVNyRzdMcXhnZWtzV0hXRnJh?=
 =?utf-8?B?MDN1Y0poUFlZTTVXdURYbEwrc201WlRYUzhMNmxMOHk5WUhiOGRyWWxwMHJS?=
 =?utf-8?B?RFpMQVEyVHQwYkY3K0ZLTmhJcFkxcFNnV0VJZGM0MFd1RG84d3g4ZFRCUEhQ?=
 =?utf-8?B?bUE3TG00cmNkZzFLcnhVZm8yVTN3VFBKOHRRTW1ENlhOd2g3b05RdHVwK3hE?=
 =?utf-8?B?WFVOQmhua2g5cWYrWlJleFQzbit2TU5tUXcrY0UyWTVmUytCK3hwY3QrWEpZ?=
 =?utf-8?B?WitJSG1ENzQrV3pqV2c0SUNrL3hzVnVCSnpPcjJpMUltMWNhSkNBd1RxVFlX?=
 =?utf-8?B?VEZBQ3BIWFVyelIwTkFvSjR1S2NZMlRrOFZwR0JzUms2ejVTTU92RGtNcUpt?=
 =?utf-8?B?OTN2dFYvYWp5ZWVxaDFqV25BM1p5UzVJQWU5dy9pUFZjZ21wa1NNN21IU01O?=
 =?utf-8?B?RUdKSlFlNnRncndLa0dvTWFWd0hQUWh3ZDQ5S3lmQkcxQnZJVExkVWtxVnhx?=
 =?utf-8?B?WkVzY1pweGdoSnk5eVdndS95aGkyRWpwNkgvdjRDeFRlU2Y3SGJGa0c3MzNW?=
 =?utf-8?B?KzNLd1R6R3B5OUxPbGk5YzBRNUVnMG1UeTBQdllSRHhDaFlCWkJ5VWgyMlF1?=
 =?utf-8?B?NU1sdzkzM0t0Z2svSTZubkMwZU1PdFlaUXloTUwzdzhpcXBOUThQL0hOa1FR?=
 =?utf-8?B?OHpXWlZ6N1plYW54cUNDMndYY0FRdkpZTCtyVGM4YnQrME0zUFZjVW5nZGdh?=
 =?utf-8?B?TEwzcjFFbVljWWJXNU9lZFppRU43YlRRdEVCaDloN0l2UHRRT08vVW9ERDBz?=
 =?utf-8?B?dFZva2NCaVdRMkpIMUkrRWkxcVhSRFFlZDYvbTRJT2xxbFZHWWwvRm91SEN0?=
 =?utf-8?B?UjlFRGF0WFc1Mmx2T2thS2xZZVhpNHl3dnpwYnFOU04rRHJXNlBUVmVobVpG?=
 =?utf-8?B?TkxvQjFnZUo4Um1LQ3BoQzFBb2wzdlI1MmI3K2hyWmJvdXdhZjlQYURmRUk5?=
 =?utf-8?B?RUFoWGJzR0MxVFdqREg0RnBZWHBEVm1sd0VyS0wyRnNiY0VIcTdyZ25NNXpx?=
 =?utf-8?B?YVEzYXcxK0dPM05ldW1MS0UybDhIS0E4c0c0Q1RVdzI4aHdIZy9SSHRmWDRO?=
 =?utf-8?B?QlpPSHhOb3RLUXJHTjRobVB4eEM3ZUZ4ak50VzVGbHlhSDVINldUOEIrUUtJ?=
 =?utf-8?B?cmZUOW8xNVhXdEllUDFFcWZCZTQ1cVlqck9aMGtiYW1tRVNLbnBuUWM4VEE0?=
 =?utf-8?B?VHZmUGVqd0dRN2hZQWJ3dUJXUDV2OC95S2hkQm4zQTRSUXN0T2k1OHF3T3lY?=
 =?utf-8?B?VHJFNmFDT0FpSGNqQXFVdzVVaHNLMThYMjZ3VEhKTVpjYUI2VTd3ZjJwRHhN?=
 =?utf-8?B?V21FbWhjYnpRWGQ0QkRFQ2lMSmJzOUhVUjJvWk9mSFJ1WnBkM0kwYmNsRzNQ?=
 =?utf-8?B?aEJFMUlBYnYwaUFRb244d3QxTkNMSjdXVkpkb2xHbjVmcjgwUG5DZXBENlNJ?=
 =?utf-8?Q?ewxY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a957cd-7026-41c7-1651-08dbb9c72095
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 10:48:30.2272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMtv+h/becL/G/rm+ZSs9DoVcGJawGgonbejNF8rtLAPqIoa4Bhy5SixTkUzjz2B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9096
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.09.23 um 09:36 schrieb Thomas Hellström:
> Hi, Zack,
>
> On 9/20/23 05:43, Zack Rusin wrote:
>> On Tue, 2023-09-19 at 09:47 +0200, Christian König wrote:
>>> !! External Email
>>>
>>> Am 19.09.23 um 08:56 schrieb Thomas Hellström:
>>>> On 9/19/23 07:39, Christian König wrote:
>>>>> Am 19.09.23 um 03:26 schrieb Zack Rusin:
>>>>>> On Mon, 2023-09-18 at 16:21 -0400, Alex Deucher wrote:
>>>>>>> !! External Email
>>>>>>>
>>>>>>> On Mon, Sep 18, 2023 at 3:06 PM Thomas Hellström
>>>>>>> <thomas.hellstrom@linux.intel.com> wrote:
>>>>>>>> On 9/18/23 17:52, Zack Rusin wrote:
>>>>>>>>> On Mon, 2023-09-18 at 17:13 +0200, Thomas Hellström wrote:
>>>>>>>>>> Hi,
>>>>>>>>>>
>>>>>>>>>> On 9/18/23 16:56, Thomas Hellström wrote:
>>>>>>>>>>> Hi Zack, Christian
>>>>>>>>>>>
>>>>>>>>>>> On 9/18/23 13:36, Christian König wrote:
>>>>>>>>>>>> Hi Zack,
>>>>>>>>>>>>
>>>>>>>>>>>> adding Thomas and Daniel.
>>>>>>>>>>>>
>>>>>>>>>>>> I briefly remember that I talked with Thomas and some other
>>>>>>>>>>>> people
>>>>>>>>>>>> about that quite a while ago as well, but I don't fully
>>>>>>>>>>>> remember the
>>>>>>>>>>>> outcome.
>>>>>>>>>>> Found one old thread, but didn't read it:
>>>>>>>>>>>
>>>>>>>>>>> https://lists.freedesktop.org/archives/dri-devel/2019-September/234100.html 
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> /Thomas
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>> Ugh. Now starting to read that thread I have a vague
>>>>>>>>>> recollection it all
>>>>>>>>>> ended with not supporting mapping any device pages whatsoever
>>>>>>>>>> when SEV
>>>>>>>>>> was enabled, but rather resorting to llvmpipe and VM-local bos.
>>>>>>>>> Hi, Thomas.
>>>>>>>>>
>>>>>>>>> Thanks for finding this! I'd (of course) like to solve it
>>>>>>>>> properly and get
>>>>>>>>> vmwgfx
>>>>>>>>> running with 3d support with SEV-ES active instead of essentially
>>>>>>>>> disabling
>>>>>>>>> the
>>>>>>>>> driver when SEV-ES is active.
>>>>>>>>>
>>>>>>>>> I think there are two separate discussions there, the
>>>>>>>>> non-controversial one
>>>>>>>>> and the
>>>>>>>>> controversial one:
>>>>>>>>> 1) The non-controversial: is there a case where drivers would
>>>>>>>>> want encrypted
>>>>>>>>> memory
>>>>>>>>> for TT pages but not for io mem mappings? Because if not then as
>>>>>>>>> Christian
>>>>>>>>> pointed
>>>>>>>>> out we could just add pgprot_decrypted to ttm_io_prot and be
>>>>>>>>> essentially done.
>>>>>>>>> The
>>>>>>>>> current method of decrypting io mem but leaving sys mem mappings
>>>>>>>>> encrypted is
>>>>>>>>> a bit
>>>>>>>>> weird anyway.
>>>>>>>>>
>>>>>>>>> If the answer to that question is "yes, some driver does want the
>>>>>>>>> TT mappings
>>>>>>>>> to be
>>>>>>>>> encrypted" then your "[PATCH v2 3/4] drm/ttm, drm/vmwgfx:
>>>>>>>>> Correctly support
>>>>>>>>> support
>>>>>>>>> AMD memory encryption" solves that. I think getting one of those
>>>>>>>>> two in makes
>>>>>>>>> sense
>>>>>>>>> regardless of everything else, agreed?
>>>>>>>> Well, there is more to it I think.
>>>>>>>>
>>>>>>>> IIRC, the AMD SME encryption mode has a way for a device to 
>>>>>>>> have the
>>>>>>>> memory controller (?) encrypt / decrypt device traffic by using an
>>>>>>>> address range alias, so in theory it supports encrypted TT 
>>>>>>>> pages, and
>>>>>>>> the dma-layer may indeed hand encrypted DMA pages to TTM on such
>>>>>>>> systems
>>>>>>>> depending on the device's DMA mask. That's why I think that
>>>>>>>> force_dma_unencrypted() export was needed, and If the amdgpu 
>>>>>>>> driver
>>>>>>>> accesses TT memory in SME mode *without* pgprot_decrypted() and it
>>>>>>>> still
>>>>>>>> works, then I think that mode is actually used. How could it
>>>>>>>> otherwise work?
>>>>>>> For SME, as long as the encrypted bit is set in the physical 
>>>>>>> address
>>>>>>> used for DMA, the memory controller will handle the encrypt/decrypt
>>>>>>> for the device.  For devices with a limited dma mask, you need 
>>>>>>> to use
>>>>>>> the IOMMU so that the encrypted bit is retained when the address 
>>>>>>> hits
>>>>>>> the memory controller.
>>>>>> How does that work on systems with swiotlb, e.g. swiotlb=force, or
>>>>>> i.e. what would
>>>>>> decrypt the ttm tt mappings when copying between system and vram
>>>>>> when iommu is
>>>>>> disabled/absent?
>>>>> SME makes it mandatory that all devices can handle the physical
>>>>> address used for DMA, either native or with the help of IOMMU.
>>>>>
>>>>> Hacks like SWIOTLB are not directly supported as far as I know. Maybe
>>>>> somehow SWIOTLB manually decrypts the data while copying it or
>>>>> something like this, but I'm not 100% sure if that is actually
>>>>> implemented.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>> A bold guess after looking at various code and patches:
>>>>
>>>> 1) Devices under SME that don't support the encryption bit and SEV:
>>>> a) Coherent memory is unencrypted.
>>>> b) Streaming DMA under IOMMU: The IOMMU sets the encrypted bit.
>>>> c) Streaming DMA with SWIOTLB: The bounce buffer is unencrypted.
>>>> Copying to/from bounce-buffer decrypts/encrypts.
>>>>
>>>> 2) Devices under SME that do support the encryption bit (which I
>>>> believe is most graphics devices in general on SME systems, not just
>>>> amdgpu; it "just works")
>>>> *) Coherent memory is encrypted. The DMA layer sets dma addresses and
>>>> pgprot accordingly.
>>>> *) Streaming DMA is encrypted.
>>>>
>>>> So the bug in TTM would then be it's not handling 1a) and 1b) 
>>>> correctly.
>>>>
>>>> Remedy:
>>>> 1b) Shouldn't be used with encryption.
>>>> 1a) This is what we should try to fix. Exporting
>>>> dma_force_unencrypted() didn't seem to be a way forward. Properly
>>>> fixing this would, I guess, mean implement the missing functionality
>>>> in the dma layer: For vmap / kmap we could simply reuse the virtual
>>>> addresses we get back from dma_alloc_coherent(), but for faulting one
>>>> would want something like dma_coherent_insert_pfn() (if it doesn't
>>>> exist already) after a proper disussion with Christoph Hellwig.
>>> Christoph once pointed me to dma_mmap_attrs() for this, but I never
>>> found the time to fully look into it.
>> Hmm, yea, that would make sense
>> https://elixir.bootlin.com/linux/latest/source/kernel/dma/direct.c#L564
>> Replacing the vmap's with dma_mmap_attrs would probably fix this, but 
>> it would
>> require a bit of extra setup.
>>
>> So we're saying that yes, we don't want unconditional pgprot_decrypt 
>> in ttm_io_prot.
>> We'd like to leave those tt mappings as encrypted when possible and 
>> instead maybe
>> add a vaddr to ttm_tt (or extract it from the pages->private via the  
>> ttm_pool_dma,
>> but that seems rather ugly),
>
> It could probably be extracted from pages->private from a helper in 
> the ttm pool code, (Christian has a final saying here). However, that 
> requires that all ttm_tts are built from a single dma_alloc chunk. Not 
> sure that's the case? In that case we're back to square zero for vmaps.

Nope they aren't and yes we are back to square one with that.

i think when we want to make this really clean we would need to forward 
the page fault request to the ttm_pool so that it can call 
dma_mmap_attrs() or similar.

But I'm not sure if dma_mmap_attrs() is even guaranteed to work with 
reverse mapping.

>
>
>>   plus add get_vm_area() to be able to use dma_mmap_attrs
>> instead of vmap when use_dma_alloc's is true in ttm_bo_vmap/ttm_bo_kmap?
>
> vmap is for kernel mappings, and dma_mmap_attrs is for user-space 
> mappings, But dma_mmap_attrs()wouldn't be sufficient. If, for example. 
> a bo is moved from VRAM to dma-coherent memory, or vice-versa we Zap 
> the user-space page-table entries and replace them using faulting to 
> the new address. That's why we'd need a dma_coherent_insert_pfn().

Yes, exactly that.

>
> I think at the time Christoph was under the impression that you could 
> replace xxx_insert_pfn() with xxx_mmap() in the fault handler, but 
> that doesn't work since the latter requires the mmap_lock in write 
> mode, whereas the fault handler only holds it in read mode. (That 
> caused some bugs in the i915 driver when that change was attempted).

Good to know.

Christian.

>
> /Thomas
>
>
>>
>> z
>>
>>

