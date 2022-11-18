Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC13062FE15
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 20:40:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0190A10E7A6;
	Fri, 18 Nov 2022 19:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99A5310E7A6;
 Fri, 18 Nov 2022 19:40:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NssJfmO7lS894yu4X//vFWyeXMUH0IzJNiJr+fYoT7X3fRNpofldbGn9fCTPUULVefDT6kTDOaH5npnhprIqgfda/IjJ9oiJeXF6DD2yp5LfIw8FUHWTAwPXFoKNHNg5weNt4YP238L9hH1kIT8NekjC63mJ08R5KwGy40z+pXZCN3vGVgswFEfhOcJGMMPyTJpgpIMm9m05pct9VK5gCjCxvyeQvs4mzvi4lxUpp9aZK2ZzDlUG1k1SMv6sxw1bG0H+3mi05h/rxMHdRJkRFXqzUJ6c1xv4SYWgd7P3zvxuK+1IL5LcCKO6Bnm+6jRBNCcNknkrNDZZWxki8d4r8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vBs6KLa110dqGreXh0YGkAe9WsEDyOekdSqlLsS65A=;
 b=CiPaATXplwJ8sK6/fMLP+P8wWoCKecfielDTkHdq9JOn6ZHt2xy1h0t9hKbeRMuO21uCI8KyvPIAlKa2OKRpvl0BfAT3P70nXtqw41wW5iL0CYs2BrU0v4883wUs7+O+c8JQB0lf43GXpNYibaCSxBqaHXOhqOeHDzQa0cIKpQMoFNDh9AljwoZN8i5ZVaHKlF1aU7I2/MLfFNESP3camIOJ/za1iXlUderF+HmDTxYMtEXRdJkSgXhdMro4TfAXU9gKwvd03Kv9htDk+pImkcbipYnyVKKiEeX838TS2rtEbyCQKG+na2Wfn3Z9rc9wbS5Q+kjENL6zl+fHiP45Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vBs6KLa110dqGreXh0YGkAe9WsEDyOekdSqlLsS65A=;
 b=GmYhF3yt63qwD+DfA7F4af4uTafK5AbUnJ26NBtWmY3v9C/YplXLg5ZqotQS+LGtHyTpOAd+POMGXIDeP/j0FD3upmgXXPNU7I+73JQC2Zk3eeVpM04apeYu0fqM1DEui2b9vv5s+EsKrQgaZdFrNK2NeL5ezHH2PMyQK6u3xG4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA1PR12MB6331.namprd12.prod.outlook.com (2603:10b6:208:3e3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17; Fri, 18 Nov
 2022 19:40:18 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::2d6a:70d0:eb90:9dca%8]) with mapi id 15.20.5813.019; Fri, 18 Nov 2022
 19:40:18 +0000
Message-ID: <a37a67d4-6cf1-a8e9-1add-2dd7e74be907@amd.com>
Date: Fri, 18 Nov 2022 14:40:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: The state of Quantization Range handling
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <CA+hFU4w8=yTU5tQgqZj4qUvJddAQL9fj5teTVSB_dvNcwCyr6g@mail.gmail.com>
 <CAPY8ntCnAjGy0e55raxV=2bgi1YPSringrKdRmJHeS+Li=3yeg@mail.gmail.com>
 <CA+hFU4x0PGs-8oUBSXQa9uTNvvW80ZPFnheoBWO0SZnxJ=FKXA@mail.gmail.com>
 <20221118121530.23c7c3ee@eldfell>
 <CAPY8ntCux_s-iNaYSH4Fs+kwNAiSfTat5saT0jiDcxaVwpGp=g@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAPY8ntCux_s-iNaYSH4Fs+kwNAiSfTat5saT0jiDcxaVwpGp=g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0038.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::16) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA1PR12MB6331:EE_
X-MS-Office365-Filtering-Correlation-Id: 407b8780-ab0a-4a54-a959-08dac99cb8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CsDlmFMmdjQqLMSKoHH9oAUbLyaCHLfTsINyAhiKjKGBMV/oZHzCLUl4RAHOVWnFYe6/9ZA9rVmvGtZYhD50XWRr5+btiKFs3almH3szZySMXGTgDEjHy8bQp+y2779pEi6GcN5/O7h6YEa5YOa+b0vVJDEWDxLdRBxTGAFNhSasQrsbKIq3gF4I+z43f9kVvTkh60v/1PnXuxv4I1hHwdJ3dmERi6kh4TKvPZDcr3ofZlwR5H1o+icfAn/8YfHgOD/gUdJF6oHnKqUZ/SH98x1ZopZLC0DjsPmFk+hmYayls1ly+OHQK+hJRRKzDryom3HK68PT1w875jDl5M7X2FmeAPYE1qzfnwgJqe6bf8Ow5nW3WCs1A0QJ2lVVBdDsHOS6OdXTfshVdYRqtKvm2q0RkRB0mT46vXQRCUqUHRvJHMiYptIXMWZppTTFWA34+p2ZHgmoAyrkgY0VaU81erCsi2I08bHWYQ5bGF/dQA5zcrLXAqwLvAUSBraOnw6IV8w8VO49qcvmM4YZJ9sCaM7YSu3ibAbkjSdr8NC1HGbJ/70ZnGlTt+lFssSlJ8mTzYR1Ao7yuNQcWile7SsD8mhTbAOisJG9SN4pl4thw++bKaH0sBDksxStHIf+EHqtIfX3Cr/cakNlPOSk3t+faujfvS8ELfXIgcl2gh9UuA3wvd/tGO+V5/7EqIUnvmqspVztO+fgGxp1QgOGObk2rq8cdOBqIKcDjXSkqUuuC4Ap7wEhofrbAlAFhGxPoyMaoSGDOAO0LLP4nH8CxNpHZBmfWJzn6Co+Fa2YR1zAOUY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(66476007)(2906002)(66899015)(31686004)(66946007)(6666004)(38100700002)(5660300002)(316002)(110136005)(6512007)(44832011)(86362001)(2616005)(31696002)(54906003)(41300700001)(36756003)(8676002)(4326008)(8936002)(26005)(83380400001)(478600001)(53546011)(6506007)(30864003)(966005)(186003)(6486002)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1c4RVpNbHRDamR4ZlhXMFlRRkVSREQrVyt1dThZZlp0OTQ5dmtjaXd5MUpi?=
 =?utf-8?B?OHlNS3MvekFCaVQvaHplQkdEbE1rcGtGNWdYVlphUkplakg0VGpPZGd1QjlM?=
 =?utf-8?B?YUZUclVuRnllVk5NU0E3b01wQmR5dlJjenVBdStSN0M3U0RBNzYxZ3hSeHFp?=
 =?utf-8?B?NThZanVTSGY1aGtaUWhsaGx1SnN3N1lzTjhEM2JUS0gxdTAwZlVKTlZlamEx?=
 =?utf-8?B?V3A5R0kwNFZkd3FpTGdxbkg2bVhaaXBtK3JsbktwYjJEUTh0WVRDSkE2S2kw?=
 =?utf-8?B?MEVWeENLcHY5N0NPbkFvZVpFMmdIa2hTRzk1REFYL1E2eWVoK0c0RTA0c1VN?=
 =?utf-8?B?cnY3ZmRhY2FOVGpYVVA1RDRFcWJaclBEQllZbkF6WUFtQ0hZd2Yvb1JnR2xm?=
 =?utf-8?B?bDN2TUdGek5CaGtTU3IrMnlHN0dEOHRURmJqcFhSNzF4QzdwUG0wb0xzQWhS?=
 =?utf-8?B?bGpZMjl4SktoUlFiQzhleXVwVlM0TEozVktYM0VnQk5OT3p3MnkzZjlzM01U?=
 =?utf-8?B?dXUzTGVnNXlXK0JSRTNmN0NlRHFXanJBd0M5TGUvVjRhN0F6eEozT1BMWU1j?=
 =?utf-8?B?aGZISlFNR1lBQ2dxQmJUN1RYVlIyOFZIKzY1c2ZwdnRLUUJmekwvU3lBOEpV?=
 =?utf-8?B?TGh5TU1wUXFmeE1DTjdTa0tqaWFvUGxiZzZBcHFNM1g4WDkvUHV5NUNPYmdh?=
 =?utf-8?B?NzdDTjBENnBkYjJXcktaTU41TUZtL3FUL3N2OTd5MVFRL2tseGQ4WU9mS2RG?=
 =?utf-8?B?SloxVWduVmNiQnVIQzEyTU02L0kzWU5tT3FNb0txQU1MQ1YvU3pCYzVjYVRu?=
 =?utf-8?B?L3dRMlJJckI1MUJvMzVyMDl0Ykg1MjZCdFRrV2xlbFg3SEozbTFFdzQ1ZE4z?=
 =?utf-8?B?dWhJMVZ2dmZkOWc2R0cyQldCR2JuaG5DQmtYL0wvUW1yVWt6Y1RDWkYweWpX?=
 =?utf-8?B?ZGlTeXFsNGJwZDgyTmNxMVExMjNYcVZFK1hyT2k3ZkpUdXpabjR0eGIvdFM0?=
 =?utf-8?B?L3BRMjlkcjN2eFNuUG84dkx3dWcrMXBETEMzdWQvYkpQN1h1ZVEvempEUDho?=
 =?utf-8?B?ZXlTOXdGZDhBTG9sTHVZc1JUejRrVzdJZkhzbWNVRkhZblo3NnFyK3NsUDJZ?=
 =?utf-8?B?RU55VmhNUHd0dDlKTlZ3SEE5enFsdUFWVVhtYTZCdzQ0djE5eVVzRzNpZFN0?=
 =?utf-8?B?UDlqN0FVV0V0QlI4T1Rsdm9KUEFBbVFPRzNPZ1hjVWdNRVViM3MzamUvOWdX?=
 =?utf-8?B?T0dWaEZCUVF0VXdraWNaSGYyVVhCV0ZRZlN3UHBBbjdyeHhJbHltZDh2V3NF?=
 =?utf-8?B?R1gyczR6SmtVV0RmOWd3ZzQ5Z292Y0NLSkZHa2dialQzUlJ6MXVPTk83YWhO?=
 =?utf-8?B?dkN6VUJoZVQzamNhYnhXd1Y5cVdadi9yQWFlcDdNcDR5QWNPMG1XbHJUeGh4?=
 =?utf-8?B?YlVzUC8xbXc3MVFsOHpFWjlKc0RxMGNubGZyU01oRDdIMTNLcmlnM3hBZE9G?=
 =?utf-8?B?NkRBaHZzSksySkg4SG9ZemRvUEw5Y2ZIZzRFblhOR3hCL0tQNTZFYW0vaFR3?=
 =?utf-8?B?czgwUUdCanlJRkVEd1p6TFdjVFdTSlFHNUlxUmN3NTY0VnlLK3BkSzBJNnpx?=
 =?utf-8?B?ZDg4MHdsWFJTbE5xZ3hBRDhSU21ndktEekFvaTIrekk2VjdOUTFGWkgwbVE0?=
 =?utf-8?B?T2VuNVY5WlJyU0gwZ2pWVkcra3BkWTUwY0phdFpua2hpLzlCUnZZc3UrOVdu?=
 =?utf-8?B?SlhucERPMWoweWFMbTdkSWFkbUU1MG4xbzZBcUp4N3RjTXE5YkVEbzY0R0hL?=
 =?utf-8?B?TkwwdytVTnVQeEhncHpSaDhaY0xJM0pGWERCU1JpQmEvSCtnaWhqcmxuYUlZ?=
 =?utf-8?B?emtKWVZXZS9FSFpiRSt1OXdKMGtsMXB0MTQrU2xNeGxhazNVT1cyclpxVVhC?=
 =?utf-8?B?amFZNW5LRjdXcTR2VnZkNWtHTiszVG9PUG8rQUVvTVJ6eEl6Rlc5Sk42bkx5?=
 =?utf-8?B?ZVl0TWxRb2hhakg0ME9QeEtTeGdUd1hZVHdRblBKSjc3eDhsZVF6b2NSZ2U2?=
 =?utf-8?B?TlBOZnkycm5ZaTQzSjd1dTJDdHQ0R052QWtLSU9ZSkVNSVh0MVN6MGdVenJy?=
 =?utf-8?Q?ezTRB4uluWz44pABjxeRNUgZb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407b8780-ab0a-4a54-a959-08dac99cb8c4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 19:40:18.0510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzDPJBINfJlTCGZJ+npS7v6Duq9W4a4RUz3jnjHtKSfe9hdAokxi0r1uLC7u6ayuhU4FOkyxcvfy2lci+Rd2Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6331
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/18/22 10:53, Dave Stevenson wrote:
> Hi Pekka
> 
> On Fri, 18 Nov 2022 at 10:15, Pekka Paalanen <ppaalanen@gmail.com> wrote:
>>
>> On Thu, 17 Nov 2022 22:13:26 +0100
>> Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>
>>> Hi Dave,
>>>
>>> I noticed that I didn't get the Broadcast RGB property thanks to you
>>> (more below)
>>>
>>> On Tue, Nov 15, 2022 at 2:16 PM Dave Stevenson
>>> <dave.stevenson@raspberrypi.com> wrote:
>>>>
>>>> Hi Sebastian
>>>>
>>>> Thanks for starting the conversation - it's stalled a number of times
>>>> previously.
>>>>
>>>> On Mon, 14 Nov 2022 at 23:12, Sebastian Wick <sebastian.wick@redhat.com> wrote:
>>>>>
>>>>> There are still regular bug reports about monitors (sinks) and sources
>>>>> disagreeing about the quantization range of the pixel data. In
>>>>> particular sources sending full range data when the sink expects
>>>>> limited range. From a user space perspective, this is all hidden in
>>>>> the kernel. We send full range data to the kernel and then hope it
>>>>> does the right thing but as the bug reports show: some combinations of
>>>>> displays and drivers result in problems.
>>>>
>>>> I'll agree that we as Raspberry Pi also get a number of bug reports
>>>> where sinks don't always look at the infoframes and misinterpret the
>>>> data.
>>>>
>>>>> In general the whole handling of the quantization range on linux is
>>>>> not defined or documented at all. User space sends full range data
>>>>> because that's what seems to work most of the time but technically
>>>>> this is all undefined and user space can not fix those issues. Some
>>>>> compositors have resorted to giving users the option to choose the
>>>>> quantization range but this really should only be necessary for
>>>>> straight up broken hardware.
>>>>
>>>> Wowsers! Making userspace worry about limited range data would be a
>>>> very weird decision in my view, so compositors should always deal in
>>>> full range data.
>>>
>>> Making this a user space problem is IMO the ideal way to deal with it
>>> but that's a bit harder to do (I'll answer that in the reply to
>>> Pekka). So let's just assume we all agree that user space only deals
>>> with full range data.
>>
>> Limited range was invented for some reason, so it must have some use
>> somewhere, at least in the past. Maybe it was needed to calibrate mixed
>> digital/analog video processing chains with test images that needed to
>> contain sub-blacks and super-whites, to make sure that sub-blacks come
>> out as the nominal black etc. Just because desktop computers do not
>> seem to have any need for limited range, I personally wouldn't be as
>> arrogant as to say it's never useful. Maybe there are professional
>> video/broadcasting needs that currently can only be realized with
>> proprietary OS/hardware, because Linux just can't do it today?
>>
>> Why would TVs support limited range, if it was never useful? Why would
>> video sources produce limited range if it was always strictly inferior
>> to full range?
>>
>> Even digital image processing algorithms might make use of
>> out-of-unit-range values, not just analog circuitry for overshoot.
>>
>> But no, I can't give a real example, just speculation. Hence it's fine
>> by me to discard limited range processing for now. Still, what I
>> explain below would allow limited range processing without any extra
>> complexity by making the KMS color pipeline better defined and less
>> limiting for userspace.
> 
> AIUI limited range comes from the analogue world, or possibly creative
> (film/TV) world, hence being used on Consumer devices rather than IT
> ones (CTA and CEA modes vs VESA and DMT modes).
> 
> YCbCr output from video codecs typically uses a range of 16-235,
> therefore a media player wanting to pass the decoded video out to the
> display exactly as-is needs to be able to signal that to the display
> for it to be interpreted correctly.
> HDMI extended DVI. I believe both YCbCr support and range control were
> added to the HDMI spec at the same time, presumably to allow for this
> use case. Limited range RGB seems to be a bit of a quirk though.
> 
> Just to be annoying, JPEG uses full range YCbCr.
> 
>>>> How would composition of multiple DRM planes work if some are limited
>>>> range and some are full but you want limited range output? Your
>>>> hardware needs to have CSC matrices to convert full range down to
>>>> limited range, and know that you want to use them to effectively
>>>> compose to limited range.
>>>> In fact you can't currently tell DRM that an RGB plane is limited
>>>> range - the values in enum drm_color_range are
>>>> DRM_COLOR_YCBCR_LIMITED_RANGE and DRM_COLOR_YCBCR_FULL_RANGE [1].
>>
>> Yeah, that's because range conversion has been conflated with
>> YUV-to-RGB conversion, and the result is always full-range RGB in
>> practise, AFAIU. There is no way to feed limited range color into the
>> further color pipeline in KMS, but that's actually a good thing.(*)
>>
>> The following is my opinion of the future, as someone who has been
>> thinking about how to make HDR work on Wayland while allowing the
>> display quality and hardware optimizations that Wayland was designed
>> for:
>>
>>
>> Userspace should not tell KMS about a plane being limited range at all.
>> The reason is the same why userspace should not tell KMS about what
>> colorspace a plane is in.
>>
>> Instead, userspace wants to program specific mathematical operations
>> into KMS hardware without any associated or implied semantics. It's
>> just math. The actual semantics have been worked out by userspace
>> before-hand. This allows to use the KMS hardware to its fullest effect,
>> even for things the hardware or KMS UAPI designers did not anticipate.
>>
>> IMO, framebuffers and KMS planes should ultimately be in undefined
>> quantization range, undefined color space, and undefined dynamic range.
>> The correct processing of the pixel values is programmed by per-plane
>> KMS properties like CTM, LUT, and more specialized components like
>> quantization range converter or YUV-to-RGB converter (which is just
>> another CTM at a different point, really) where userspace explicitly
>> programs the *operation*, and not the input and output types hoping the
>> driver and hardware does something sensible.
> 
> How do you describe the functionality available on constrained
> hardware that has fixed matrices for YUV to RGB conversions using the
> normal BT601 and 709?
> Or hardware that has no per plane matrix for RGB? (I believe vc4 fits
> into this category).
> 

Thanks for bringing this up. This is one of the big challenges I
have when thinking about a generic DRM/KMS HDR API. Compositor devs
would like an API that simply programs operations but the HW designs
in the wild often don't operate on that level. They're designed for
specific use-cases. At times the HW designers will go for a generic
solution to satisfy the range of desired use-cases, other times they
might opt for hard-coding certain conversion.

When designing an API of "operations" there is a real danger such
and API won't map to a lot of HW or introduce a lot of complexity
into compositor backends.

Harry

> I'd also propose that you need a load of helpers so that the "normal"
> use cases of eg BT601 YCbCr to the default composition space is
> handled for simply. Otherwise the enforced complexity to userspace has
> just exploded.
> 
> Or seeing as properties like COLOR_ENCODING and COLOR_RANGE already
> exist in the UAPI, add a "custom" mode to those that will enable all
> your other magic properties.
> 
>> In that design, there is no problem at all to blend multiple planes of
>> differing quantization ranges together. Userspace first chooses the
>> blending space, a radiometrically linear RGB limited range BT.709 space
>> for example, and then programs each plane to produce exactly that. Then
>> CRTC properties are programmed to produce the desired type of output
>> signal. Finally, connector properties are programmed to send the
>> appropriate metadata to the sink. Of course, userspace takes the sink
>> capabilities into account before deciding all this.
>>
>> The thing KMS UAPI is missing are the per-plane properties.
> 
> And hardware support on many platforms.
> I've just checked, and vc4 always composes to RGB. Things like YCbCr
> for HDMI are handled in the HDMI tx block. How do we tell userspace
> that it has no choice over the blending space?
> 
> If you're trying to make things totally comprehensive, please don't
> miss out chroma-siting as that is another property that is missing
> from KMS for YCbCr planes.
> MPEG-2, MPEG-4 and H264 differ from JPEG and MPEG-1 in default
> chroma-siting, and HEVC differs again.
> 
> Conversion of HDR to/from SDR is going to be an interesting problem on
> many platforms. I won't claim enough knowledge on the subject, but
> obviously there needs to be a choice made over which mode composition
> should happen in, and other planes will need to be converted. Is that
> conversion going to be totally generic?
> 
> 
> Lots of questions posed by this discussion, but I'm not sure that they
> are specifically relevant to HDMI quantization ranges at this stage.
> All RGB buffers should be full range, and full/limited range
> conversion should be controlled via a similar mechanism to "Broadcast
> RGB" but in the KMS core.
> 
> Checking drm_hdmi_avi_infoframe_quant_range(), it already does the
> correct thing with regard to the EDID VCD block and signalling the
> quantization range. The implementation of range choice on i915 (and
> vendor vc4 tree) could be improved to also check
> display_info->rgb_quant_range_selectable and choose FULL even for CEA
> modes if the display allows it, but that may expose more compatibility
> issues with monitors where the EDID is a little iffy.
> 
> Cheers
>   Dave
> 
>> (*) The reason it is a good thing that one cannot have limited range
>> framebuffers is that it would raise problems on how to handle pixel
>> values outside of the nominal range, that is, the sub-black and
>> super-white channel values. The immediate problem is that LUT stages
>> need normalized input and they cannot extrapolate. So if nominal
>> quantization range is normalized to 0.0-1.0 for LUT input, sub-black
>> would be negative values and super-white would be greater than 1.0
>> values, which a LUT cannot sensibly handle. That makes the whole
>> concept of limited range problematic in the color pipeline. But, if the
>> color pipeline elements like LUTs are defined *as if* the data was
>> always full range, it becomes well-defined and useful how the elements
>> work, and userspace can produce a proper programming that is guaranteed
>> to work.
>>
>> By completely removing the concept of quantization range and its
>> "automatic" handling from the KMS color pipeline and adding processing
>> elements to do scaling+offset at suitable stages, we gain the ability
>> to accept, process, blend, and produce pixels in any quantization
>> range, color space or dynamic range at will.
>>
>> Another thing such an approach solves is how to interpret
>> floating-point pixel data which can naturally represent
>> out-of-unit-range values.
>>
>>
>> Thanks,
>> pq
>>
>>>> Cheers.
>>>>   Dave
>>>>
>>>> [1] https://elixir.bootlin.com/linux/latest/source/include/drm/drm_color_mgmt.h#L84>>>>> [2] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L6756>>>>> [3] https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_edid.c#L5642>>>>>
>>>
>>

