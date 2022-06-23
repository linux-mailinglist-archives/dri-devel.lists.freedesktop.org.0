Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4897557365
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 08:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8011123A6;
	Thu, 23 Jun 2022 06:59:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FEF81123A6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 06:59:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EG0poeXlSpUR7cIw0qR22WETtAvE0aRDGIZkqtDVW6cACxzTvR42HRxnWexHBesGVDOnTkKZQ8wpKkT4NgF6pscRE9VWfQ28DnrunBiRLxHpK/msa0h+fKdiDktpAlZKdJQzU/udpPmUaDuP9gQAi4KZEbHifcyvCM2nF99i0+2+GFsNhEa+rQQvJsLkSaEUvaGviAYWCbIOQzfY7YPmtbM0teragPeNiK09TPa3cSZFiF2EgyhAzTW9oUJhjTuARLwPjw/let6CQmcEdJo4VRNZt/Dgf5Z/R9oV6qRAWW2FLCFfQZLVnEekFo2spOeG4HbrCmgitLvciJNctYPtNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EZcs0f0QSTT+UZ/bAPCFSuFf97Nc4vIseo9bJOsQAYY=;
 b=I+lIokdNORrs5+th/4G+p8I2/R6gDa/nf+5P9pYuCODJ26Tzm3cIINa+sYPOpUpz9ZkjsTQm2ckJ6ewznrzRu7Lrcl1dpShGg8/5wnXRzKG+pDtPQUax8GggYUkfoQdFELa+k9rh7ZTZZPAR2gUQC88XoHsaeEm/WnA7lTgUH+NXDoeXVnTz1N9EfCm4CzQtWr/j6UNze/jCSRBq8pscf02fMCeL6yAFh/qLhYiPLzNjl0Xo19/38zhiMD5I6FVIK9ZiinBSN+XgcjThrQcBbdkSJLE/1Xh7CdTzFagOV+up0wougqtI8bXyWlqnD7eeRRewvDUnB0rhCseudkK07w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EZcs0f0QSTT+UZ/bAPCFSuFf97Nc4vIseo9bJOsQAYY=;
 b=vZ+u6YnT1OXQvjRoq//snZeVHX1/MGUqb8xs5ne6f2uNv0fIpCxwjNexkQiM2aeYLE0SG7lLkS2Nj2YeBdqBEiMnJSYGGs5G31iFDWhxZPq6IsAorm3FgB+0IDbZOMzEGN1sFA51gZ4z5vOnyzBX/CDiW9TMlKPysH9W63OgcO0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB1722.namprd12.prod.outlook.com (2603:10b6:3:107::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.15; Thu, 23 Jun
 2022 06:59:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::e0fd:45cf:c701:2731%6]) with mapi id 15.20.5373.015; Thu, 23 Jun 2022
 06:59:48 +0000
Message-ID: <c6e65ee1-531e-d72c-a6a6-da7149e34f18@amd.com>
Date: Thu, 23 Jun 2022 08:59:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: Daniel Stone <daniel@fooishbar.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <YCuPhOT4GhY3RR/6@phenom.ffwll.local>
 <9178e19f5c0e141772b61b759abaa0d176f902b6.camel@ndufresne.ca>
 <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAPj87rPYQNkgVEdHECQcHcYe2nCpgF3RYQKk_=wwhvJSxwHXCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0040.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::17) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cb594a61-bc74-4306-2945-08da54e5f601
X-MS-TrafficTypeDiagnostic: DM5PR12MB1722:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB17223D65B4444C9D5ED4619B83B59@DM5PR12MB1722.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6fL375RPyYDtPu6X2ZRCSPiiwBg7INU14KVLS7GmBjumWUYJ4kGmtcXCM72tMCB7u6lNc8vbxT2qKwbVHXu8qVOgTpSyQbhzdDX5sbMmWqwN/kjfFMFLWwB9eybqRrq3yAeB+Ub785tvgSJYB9vXayglWh4RQO57Qp5mOCym6LdxJBmFQAP78eEa6JhIuAt9TBhZpqidOaikxJWaFqqc6GrFdrW2LRpqF787ycGcF8J06caNebuazfRtJN5LqROxOofisWIfprjWPk/HMomGYio0eYMFa9X22QZNREAwQfzRaEGxiUkfXKZhomWApmgCnK32F+s76gwa+lQm5cGvdl0ayDFaGPl+u6t0tIakSLBeT33ihNjRA30VXmd2GgsaVc1+rIBE4SWNGKB0moiBGCgntmrszLWLSjIDvS1LHf2JaGbPxCW0iwUdwTKSgI1Zxorn29re+errhHCg1QljJxd4qA5oW2DfxRhwHbj82HFX2jcie1oASIVfgy8reSBlGNTshXnNFkV6VQ1QVAgiEvhIkr05H3uR7bBcS8bp8oPtGXpVJ3isxbKTzKKUAbaKXtR5LG6L9va29srpjbsbwySHUKhgCJUINZ83deVK67fAmf0p8ODgTj2wuoKZkIvqORZ9sO8ZsbRfatj6lSytQ3s2Gazw5XMN0kgF6r0b1/1gCXRc/WXDeqfsz/n+cZvp9lyffecIjdGQNK5lMT1QrRd9YAgiWjuA9A9eZeGkJodkYqBJMFB0UoaBgcvhKgGu+iCvs2BiE5mURjLSXThI+VHuEDFUics/ZzxwG9TVN8M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(366004)(39860400002)(396003)(376002)(136003)(2616005)(41300700001)(186003)(4326008)(66574015)(38100700002)(66946007)(31686004)(110136005)(66476007)(36756003)(316002)(83380400001)(66556008)(8676002)(54906003)(478600001)(86362001)(26005)(8936002)(6486002)(5660300002)(31696002)(2906002)(6666004)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDREWkc4Y0hUQ3hsVno4OHdBL2M1ZnIrU2JNUXIxQkRYVHpnbzBJcXI0MHhF?=
 =?utf-8?B?OVlUT29aWXpzTGM5am5aT2JtT1RJcDEya1YvWG9TbmtSV3RBc0x1ZEtnc1A1?=
 =?utf-8?B?aHJybm1NNmZZcnF5aTRKRmROTmsyZnczTUVleEViQWJmWWQyd2tyMk41U2E4?=
 =?utf-8?B?SlhRKzJucUcvN0lLeHZ2S3FnVDRKMFg2MUw3UlVuZmtRZ05Vb3NQU2lkRDlM?=
 =?utf-8?B?cUx5aGtVd25YMWNYYmgraEk0RW4yOUkyTUMxVnVpK00vRmRxK0RJZDRzVnhN?=
 =?utf-8?B?UFFkOU0rVVZrUVE2UERCV0krOUo1UXQ1a3ZTZytzRHVKc0d0ODlJSnZ3TENV?=
 =?utf-8?B?Q3RJN21iczVwSFFmTGNuQWs2SFg2MGlUV3hpNjM4MnlDMUU2ZTBZSDhhc3cr?=
 =?utf-8?B?WnNwZVlYT1dnZCtVVFdVamdnSEpKZUx4SGNhWnlYQWJSczh5MlhwOUF2d0VU?=
 =?utf-8?B?aER5QW91WVpGeXc2K3FuRGluakExcERoR1pjdURoMmtZdVZnVDRNb2lOV3hr?=
 =?utf-8?B?amJjZnRCaE5qdFlTV2F2RTlhRklpQ2NSaVJISmR5R2h4ZWhsQXZiQ3FyTE9S?=
 =?utf-8?B?NFA5RitydVBtbkJKZHVMREJiclpDWDNhYUtIOHJTQmZhc2tFdCs0aW9qNUcx?=
 =?utf-8?B?L1o1ZVBKbWJFbTZjVHpXL01UdzIwRms4SmFwNEx6NUkwd2xyelpuUVpSSGpN?=
 =?utf-8?B?N0t6TGo2V3d4WnlKemFXS1lEazFSOW9uZ2VuOUc1enFCeG9DQVgwVmxCODVK?=
 =?utf-8?B?SlJhdWlLWGMxRUZzRjZzbXdYRXkzM0dtVTAxWWRvbHMyRDQzbExtWUUvbzBr?=
 =?utf-8?B?ME1HUElKdm1vemhSTlMyVW9DcTB3ZHpoVSticE5CaWRaelpoWDhRUnlIVUNy?=
 =?utf-8?B?clFmSFROWjZoT3g5VFF5c3dxRUt0Z0o0WGVLU3VmODZGTlZSN0NpZ3FxMkw3?=
 =?utf-8?B?bjlGSEo3YVViT0x4TmxvK1FjTTdrMkx0YW9Yb2RiRjJLU1d2MVVrWWI1VW5t?=
 =?utf-8?B?V2ZVZ1E4dHJlTkk3QWpDQmdLNFltN0ZIS0VyOTQrL1RtRWZ1VDZWRUVsc1Zj?=
 =?utf-8?B?T3R2eTlPQVFzUk5aMDhZUTVRaTRwZDY1L214MzErZE40UEJDcGxuLzNkZng4?=
 =?utf-8?B?QldsSmxpY0hab05ST1E2NDYrM0llamltRDQ5Y2lwcHYyZ0tXQTU4S1ZGMEdX?=
 =?utf-8?B?ZHM4bDJkUmJpUmRCdXJlUlRVNHM2ZXc3VFNnVWg3ZTcrbzJIZS9xQ1lKaisr?=
 =?utf-8?B?NEE4Z3ZYRWtjTndaY2RZam9HSm9kVlA4MkxMdVJnVEpvN2trRC9ENXBOQUY1?=
 =?utf-8?B?bmVGUDRldit3NG03QVF2NUJZTktzblJPYnNDY2E1UVA3VUNKNHdYbmdjOWFV?=
 =?utf-8?B?R29MR3FPd0xNWUlsNUZ2ZGVYaVAwNUc2Z2xpZU9PODFkWGtoUzhYcFNRaWxB?=
 =?utf-8?B?Z25MQjhadjR2ZUhBeUxOaXN0a2MxR2pHTFp6K2U0UGZCZkJCdG8xTTF4TVZP?=
 =?utf-8?B?bWZnWVh3OFJEWTBLSzA4NkZnRzByOCszMU9acW1UZzNqVjNRMk85T0luNW9V?=
 =?utf-8?B?SGxoeFpxc0k4SWhhQWYzbVd4SzBZVUZveERqTjNXeFFxVzNqQkkvdVFSVEdt?=
 =?utf-8?B?VUhlemphcU1yc2dsbnJVck5LWWVPOVNoWkJVVm4wUXJRS0NWZ1NWMGhDTWwv?=
 =?utf-8?B?aXNuaFgwRTlWZ3RPZjNuWkZDRU9wUmFPa1dUK09NREswZHl5V2RGOVd5Z3NM?=
 =?utf-8?B?VTI0N1pxYXEySjRxTXR3L2sxZUhXa2Y0SjFNcXBGOFVvSytHZEhkZVBHallV?=
 =?utf-8?B?c0hRSFUwVE83bjFFdUU2VUc3RUh1RldBUHBxdTl5aGp3ZXQyYjc4NXA2b0tU?=
 =?utf-8?B?Ykg1ekx2UVdhaGdnY29vbUtKdUVsNEkvbm9PODk0b1N6VGdJY2k1UGpkSkw0?=
 =?utf-8?B?ZW9oNjBBaEl6dHR0Y2NuZVJGM29YalJoSWpoWTU0ZFJvQmkvYTNqOE5NUGxI?=
 =?utf-8?B?QTlRcWlyeW4wOHJkR1lHZ3U3SE8rT1d1ZWNrZEUzZm5tWi9CdmVvOENyT3I3?=
 =?utf-8?B?dXJuS0g3QVgwMWJjd21iVk5pdld6SldGSVc4cmlySmJoczdBM0JyZnJZSFN2?=
 =?utf-8?B?ZVpLbGFMWng4QnpjTWdGbG5aL09PK09ZaVhmTGV6TCt4T1dvVi94N0FCRkJM?=
 =?utf-8?B?QUxscUcwRDhWWHpvVjFZd1M4akpyQ2U4UEZqRy9SSU8yak42MkpjdFBWY0RM?=
 =?utf-8?B?am53YTBPWkJaakZOOFlJS1BvQ2lUclpsZWlyM2ZjQ1FCVmpFODlaaGNMcFdP?=
 =?utf-8?B?MHRGQk52UE9lTG5MemY4enkwVU56UXFNNE9zTzMzR2xlQml4NlVpZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb594a61-bc74-4306-2945-08da54e5f601
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2022 06:59:48.0049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: duBCBOw/4MIN3I7wdS2YX0B90OaUBDld6wZY7VfsQkFZgft0HwSgVS1Nfg64aZ4N
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1722
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 23.06.22 um 01:34 schrieb Daniel Stone:
> Hi Nicolas,
>
> On Wed, 22 Jun 2022 at 20:39, Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>> Le mardi 16 février 2021 à 10:25 +0100, Daniel Vetter a écrit :
>>> So I think if AMD also guarantees to drop clean cachelines just do the
>>> same thing we do right now for intel integrated + discrete amd, but in
>>> reserve. It's fragile, but it does work.
>> Sorry to disrupt, but if you pass V4L2 vmalloc data to Intel display driver, you
>> also get nice dirt on the screen. If you have a UVC webcam that produces a pixel
>> format compatible with your display, you can reproduce the issue quite easily
>> with:
>>
>>    gst-launch-1.0 v4l2src device=/dev/video0 ! kmssink
>>
>> p.s. some frame-rate are less likely to exhibit the issue, make sure you create
>> movement to see it.
> Right, this is because the UVC data in a vmalloc() area is not
> necessarily flushed from the CPU cache, and the importer expects it
> will be.

Yeah, but that is something perfectly valid for an exporter to do. So 
the bug is not in UVC.

>> The only solution I could think of (not implemented) was to detect in the
>> attach() call what the importers can do (with dev->coherent_dma_mask if I
>> recall), and otherwise flush the cache immediately and start flushing the cache
>> from now on signalling it for DQBUF (in vb2 workqueue or dqbuf ioctl, I don't
>> have an idea yet). I bet this idea is inapplicable to were you have fences, we
>> don't have that in v4l2.
>>
>> This idea was hinted by Robert Becket (now in CC), but perhaps I picked it up
>> wrong, explaining it wrong, etc. I'm no expert, just noticed there wasn't really
>> a good plan for that, so one needs to make one up. I'm not aware oh an importer
>> could know how the memory was allocated by the exporter, and worst, how an
>> importer could figure-out that the export is going to produce buffer with hot
>> CPU cache (UVC driver does memcpy from USB chunks of variable size to produce a
>> fixed size image).
> This is exactly what Christian was saying above.

Well more or less.

The exporter isn't doing anything wrong here. DMA-buf are supposed to be 
CPU cached and can also be cache hot.

The importer needs to be able to deal with that. Either by flushing the 
CPU cache manually (awkward), rejecting the DMA-buf for this use case 
(display scanout) or working around that inside it's driver (extra copy, 
different hw settings, etc...).

Regards,
Christian.

>
> Cheers,
> Daniel

