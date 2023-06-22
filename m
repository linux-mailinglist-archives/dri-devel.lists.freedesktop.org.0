Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B4F739DED
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8765710E51F;
	Thu, 22 Jun 2023 10:00:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6EE10E508;
 Thu, 22 Jun 2023 10:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K1Afzg0uJNcs27IJaYSxPMAm3ECDUTWCYHt3g9ubkPuL2dJ78lMIrJIA5ajS4854MovPqbSSTMqtqIO2uHI4JuHGluUvoUIIlrCRCd0YMmOebf14nGOcMovrMaXIogTh0eLKPx0ycVKkV0OQjrsVQze7ruoLKsmibReOnfoVA3ZTx5gBt8ihZ0xNJfTYCi+rgQmtKFn1YSA+5MgHluyw1zhvPwC7vskkxNDqfWtUhmNTfsF4VH4m2ha3CqtWydsfsKZpkIQwhYaEGc8EYBtJxXoOtEyzOCxLq11JB0C1LQewgod1SePfGZGqH4Ek/LywWZwBeoJoOxeVFgYjXxRFSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1R5DOUVShpjIRnaTmmSb1HP3397S5/R4q8T3ZmIZc4=;
 b=h8cwFa+WmH09y+lYMv4SrYBOZ8lqVh19j7Xbq75r1+uLW4aHNlCUCK4JTY+f4EJqWn3whelcq3lh4OqKwfpMZ7q6XxGvCLYbXiWpELH7hnWhZvREpCg3nvZI3l25pFQUtKw3wiV8mpZHU9V7w3SDO2TtdkStNd3csZBCIM3XbSmZOlrU1m76MCRWYHp+x8NNY6WS/NiRqaJ5ZVf9+Ag444V/XSg4xPfNRVPJSArci7/YyeDdByUvxL0ReLQmm0/PirUvliai17dXSIRuCeZHdrbZl5yH/OpwMq+HgXzvZ9WNs6ZzFkcXPEaAXl1odNzfJneqXD5AF/2+65BD+JNL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C1R5DOUVShpjIRnaTmmSb1HP3397S5/R4q8T3ZmIZc4=;
 b=czKpVm/yqhv4UZhEVM12VxPO2tNFRzsGu+GutRGohBzAM51jzJoWjyFwHz8F18a+lzdPI20uNQDk2h8By5t/0tnPvzcxbmpdkS5cAlcX9Hi7FC73SDHjAbsvH8azL/Mofabet8NC4W1hjFuCPglaX8/NkirO18I8eedrYMXLs0c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7352.namprd12.prod.outlook.com (2603:10b6:510:214::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 22 Jun
 2023 09:59:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 09:59:57 +0000
Message-ID: <97886df5-05bd-e28e-7cc3-1c46b460e557@amd.com>
Date: Thu, 22 Jun 2023 11:59:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v3 2/4] drm: Create DRM_IOCTL_GET_RESET
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20230621005719.836857-1-andrealmeid@igalia.com>
 <20230621005719.836857-3-andrealmeid@igalia.com>
 <20230621110931.6f3c8914@eldfell>
 <ab9ebe98-f583-234d-4901-ae570fb89d9f@igalia.com>
 <20230622112241.70d4e941@eldfell>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230622112241.70d4e941@eldfell>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0242.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7352:EE_
X-MS-Office365-Filtering-Correlation-Id: fb98be7c-7d4e-497b-557e-08db73076f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yQ4UPeaf5D7HnRK0feXysJjgrOLQQjQhBit0OkSUeLVEILnwaEfE8WXTuswYL10Md65UH7XpCBzKwUJJQ+dSWXWgZS0vh9dZrDjcjIjCVyjgs8Ug8Yk01IxksbaMQ5Xac5C5UMrnuOGfjgKPqdtyiX8hrJsdq290ghRT3g8BlifK//v+J1Cb7XkqUJwuR+kHrc1B97Y1+rsfBXM0wDo+5T90vQ/qGC377ApfR9CeWv/PABNJ16iY4FB7vQeXiOqsjbmmgzN7e2pFDCqXSSgXP7o52DPxr15HX6+bugJOl/qEfgOFfB5smdKn+hY+iaEIcc2ddGAQZ1zT2Z/2b7oudplNI2Fyk/w/aGy1C66hUDsCvzNH001GJHRcLrqtZZa/4OPqptaM5FEEqJS6Ou+du5vfq8GIIFX6YUp/enGbxRtXQFENUz2kUfcIS3QeqWJrpfv461bx1a35l1FgWM7s2kqwao87uDRd67dQjjYKrIS9TMgE8ZPHqr9RUOuWmIfEL2Al9v81bA/AWGuBFpu6QOJzrcF+kxcg5SpgS8yH98oAN+CR5YBtppYFVU6s2tJPKxohBBeT4lQa39KqqXSE1OTqxbNzMSx+E2IUFZOneecVP7KRS+EK3WtMu5sMxizyhI0XB5jANOpfce4w8tHkOQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(316002)(83380400001)(41300700001)(7416002)(5660300002)(2906002)(8936002)(8676002)(36756003)(38100700002)(6506007)(6512007)(6666004)(186003)(6486002)(31686004)(66476007)(4326008)(66556008)(66946007)(478600001)(31696002)(110136005)(54906003)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWFCb0VXdGFscktaSER4Q0w3SDYyb1JJa01oZ1RObTJOUlhlY0hpWGw2TDNm?=
 =?utf-8?B?eEtOMFI2eUVIeDc3QlRyYWtRU2F0V24rS2FVeitpRWxIOWt5SUViaTNsZDVB?=
 =?utf-8?B?aWkrMUJ4bUNNRE5OaEJ1bXJqM09tQklXWTkyYkNXR1JSWG1YTWlqRWF1UVZ4?=
 =?utf-8?B?SFhHNnd3dm5vbHd6WlZuZU43OTY0eGhxcTZ5VlJZUTI5eTU4NkRHbVQrY3RJ?=
 =?utf-8?B?U0J2bytHWHprWTZRYm5VRDB6TDUwYk83SG9pclczNXVCK1FOb1R2NG9oc0Rn?=
 =?utf-8?B?RXBlWUVwc2FodEwxTSs1WGNWREk4ZzNRdSs1TGhDUHhEd0g0VXdMMytJd2E3?=
 =?utf-8?B?RzFjSDdKL08yN08vRVRKNjc3czBTS01MdDUwVnpkYm1aQlREcVI0N1pMM1J1?=
 =?utf-8?B?NnhTWlBkN1NGSUdiMXFMT2luTTNRM1lPTHVSSzlkdVY0THptTDZyak40N1JU?=
 =?utf-8?B?RkRPUkFQWEZDTnVsUVBjczNBOGVkb2JVL0xibU55RXdIS3FrQVdaUlhtNXds?=
 =?utf-8?B?U0VLNVVRdk81ZW5zZkprT25GTU5OZzhqZWRCWnVOa0JWSVpjRHFkb2VJbVM3?=
 =?utf-8?B?QUFBdmQ0REc5MGsvbk9FMnJVV3pqTnNuNEtMYnhwU1VCZEZnOU9hSC9lNUhv?=
 =?utf-8?B?TXZQR2JBbGlTbDNBanQzMEk3S3F5TlJSYytWZnYwUmpYakNpVGV1NEIrUEsw?=
 =?utf-8?B?QkJub0ZNdFVjSngya0JUZFJsLzRHUFBGUExGeEJGQU93RlFEYVFPVkhoMWRX?=
 =?utf-8?B?YnRDTUFiOFBNZUIrWC9OZUZ5R05GdWlwdTg4VmkxbGVQc2VmN0VHSWlCdmV2?=
 =?utf-8?B?eWlxM0lmMEFsVmU2MFh2R1VTSjlsMFNXYU00eVNnUEJ6cVRjUXFSbEF2V2xT?=
 =?utf-8?B?WWx4eEI3K2xMWEloY2xXcklXaUtKVFZXZmsyYWgwcjZHb1lhRkhBMHk1WjJx?=
 =?utf-8?B?bEtMS3FFQ29JUllERyswSFZYUmY4ZnlqbXpGOVpoK3cyd1VrenpERFhOTktH?=
 =?utf-8?B?V2dUV1FUc2ZMOFdheHFjaHJ1WUV6cVkvUGp1MDNkem4xQ0Y5QVphN1d4YVlz?=
 =?utf-8?B?RENVSkpxWlRtVVowcEdZWVRvUEFFZWU1eE9EaGVxSlVPcUp5eWx1d1hSRUhG?=
 =?utf-8?B?ZUxIU1g0VDVyVVpJMEtGSHdxYzhJUWF2SVBGY3l4SXBTajJzd0dPNVlwZmg4?=
 =?utf-8?B?OGdsMzlDWVcyUkllYWR1WDVFQWZlY2xib1hZWVN1bnFia1NkVExCKzk3dDJO?=
 =?utf-8?B?ekVZNVBhelRDTCtFT3ZZQmp0SUljbUtXTCtuRUFEL2k2TUpWSlZYVW5pc0Ux?=
 =?utf-8?B?M0xOTmVoSlB3dUZVQ1dvK1RLU0EzWDV1d1ZLRHNEa2hOQXVidmw2MEE3RjRR?=
 =?utf-8?B?Qm8ydHY5KzJsYWR1ZUFzQUcyRGhVUUR0NkY3V0RGZ3RmUHhwYWc5RTMydTVP?=
 =?utf-8?B?aGp3V0htcXRhY25yOEZaV3FFM01jMzdtV1FXc3o5ckNLenJWSFN4M3NVaC9P?=
 =?utf-8?B?WkpzaHhGUWZ6WmhRTXBTTGNvdFhZWWpaQTIwUHBvL2lLVVZRek1SZTRzZWRm?=
 =?utf-8?B?eU9TbFZMNy9aU29YMTRIWTdBTlFwd3FoSU80L1FNbGVkdGwrbzFVODFPVzR2?=
 =?utf-8?B?bGtPS3JVSGZodXVWUXBBSWZGWFpZbzNrRnlESGxBc09waWw0czhtUStEWEZB?=
 =?utf-8?B?MXV5RUl3eC8wY3BWWGxxTWhObDRCYjhBMkpNYnlnSkF0Rkw4SFcwZWJBUGNm?=
 =?utf-8?B?VnU2QVNyNUs5S3hndmJLaU16em91dHlDOFgwSkhYdDAvMFBVcW50NnNoVWJl?=
 =?utf-8?B?TnA3bkg1ZGYzVjlZMFFHc3J2M29aamhVdzhwYXFmRmZybU85R0thQUxUZGVX?=
 =?utf-8?B?Y0VIVVErWGs0MU56eURoSzFGOXhHalA5WTc0ZU4rUzk2M2I2QmNOaS9hbVZi?=
 =?utf-8?B?SEZXL2hFOVJkR2U2dmh6SEVVcTF5dCtFS2Jlbm1wWTd1ZGc1b1NOejExcUN2?=
 =?utf-8?B?emZWcHdVc2ZpTmJXTmoxcTFFOHNXUGg2RXhCaWZ2Zk8zU3RxdGlXZUxqRmxk?=
 =?utf-8?B?UnpoWnZweWdWWGJHRzN6SFE1U1ozV01QWG5NbjJLeEpONnNNamNJWE5wTGY5?=
 =?utf-8?B?dzJwNDRyc0FoeHd0b2NsbkFjbkRSVm9WcDhaYy9ZTUYySzFFa2FQNFY1ODFB?=
 =?utf-8?Q?oLNjzu5kv3D1CRX3u6ZFU1aSDrBzgPLB8uBJuarPuCwr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb98be7c-7d4e-497b-557e-08db73076f70
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 09:59:57.6740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ig5tjSC5Ph8ORZV0Q5wgqPdcKxJhPYIq8fG4CXEdvYDpXzFbeesQa0x/2WKtH/6Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7352
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
Cc: pierre-eric.pelloux-prayer@amd.com,
 Samuel Pitoiset <samuel.pitoiset@gmail.com>,
 =?UTF-8?B?J01hcmVrIE9sxaHDoWsn?= <maraeo@gmail.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel.daenzer@mailbox.org>,
 =?UTF-8?Q?Timur_Krist=c3=b3f?= <timur.kristof@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.06.23 um 10:22 schrieb Pekka Paalanen:
> On Wed, 21 Jun 2023 13:33:56 -0300
> André Almeida <andrealmeid@igalia.com> wrote:
>
>> Em 21/06/2023 05:09, Pekka Paalanen escreveu:
>>> On Tue, 20 Jun 2023 21:57:17 -0300
>>> André Almeida <andrealmeid@igalia.com> wrote:
>>>    
>>>> Create a new DRM ioctl operation to get the numbers of resets for a
>>>> given context. The numbers reflect just the resets that happened after
>>>> the context was created, and not since the machine was booted.
>>>>
>>>> Create a debugfs interface to make easier to test the API without real
>>>> resets.
>>>>
>>>> Signed-off-by: André Almeida <andrealmeid@igalia.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_debugfs.c |  2 ++
>>>>    drivers/gpu/drm/drm_ioctl.c   | 58 +++++++++++++++++++++++++++++++++++
>>>>    include/drm/drm_device.h      |  3 ++
>>>>    include/drm/drm_drv.h         |  3 ++
>>>>    include/uapi/drm/drm.h        | 21 +++++++++++++
>>>>    include/uapi/drm/drm_mode.h   | 15 +++++++++
>>>>    6 files changed, 102 insertions(+)
>>> ...
>>>    
>>>> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
>>>> index a87bbbbca2d4..a84559aa0d77 100644
>>>> --- a/include/uapi/drm/drm.h
>>>> +++ b/include/uapi/drm/drm.h
>>>> @@ -1169,6 +1169,27 @@ extern "C" {
>>>>     */
>>>>    #define DRM_IOCTL_MODE_GETFB2		DRM_IOWR(0xCE, struct drm_mode_fb_cmd2)
>>>>    
>>>> +/**
>>>> + * DRM_IOCTL_GET_RESET - Get information about device resets
>>>> + *
>>>> + * This operation requests from the device information about resets. It should
>>>> + * consider only resets that happens after the context is created, therefore,
>>>> + * the counter should be zero during context creation.
>>>> + *
>>>> + * dev_reset_count tells how many resets have happened on this device, and
>>>> + * ctx_reset_count tells how many of such resets were caused by this context.
>>>> + *
>>>> + * Flags can be used to tell if a reset is in progress, and userspace should
>>>> + * wait until it's not in progress anymore to be able to create a new context;
>>>> + * and to tell if the VRAM is considered lost. There's no safe way to clean this
>>>> + * flag so if a context see this flag set, it should be like that until the end
>>>> + * of the context.
>>> Is "this flag" the VRAM_LOST? Or any flag?
>>>
>>> Does this mean that not all resets are fatal to the context? Is there
>>> any kind of reset that should not be fatal to a context? All the
>>> rendering APIs seem to assume that any reset is fatal and the context
>>> must be destroyed.
>> I got this flag from the `AMDGPU_CTX_OP_QUERY_STATE2` operation, and
>> it's used to notify that the reset was fatal for a giving context,
>> although the idea of non-fatal resets seems to be a bit controversial
>> for now, so I think it will be better if I leave this flag for latter
>> improvements of the API.
> Which flag is "this flag"? There are RESET_IN_PROGRESS and VRAM_LOST.
> Both are fine by me to exist.
>
> I think I made a wrong conclusion here. Somehow I read that it would be
> possible to have a reset happen, and if VRAM is not lost, then the
> context could work again.

Yeah, that's exactly what AMD tries to do.

And no, I'm absolutely not keen about that idea.

Regards,
Christian.

> Should there be some wording added to say the context is permanently
> broken on any kind of reset? Or is that for UMD to decide?
>
>
> Thanks,
> pq
>
>>>    
>>>> + */
>>>> +#define DRM_IOCTL_GET_RESET		DRM_IOWR(0xCF, struct drm_get_reset)
>>>> +
>>>> +#define DRM_RESET_IN_PROGRESS	0x1
>>>> +#define DRM_RESET_VRAM_LOST	0x2
>>> Ok, so the dmabuf lost is being communicated here, but how would a
>>> userspace process know on which device a dmabuf resides on?
>>>
>>> Let's assume process A uses device 1 to draw, exports a dmabuf, sends
>>> it to process B which imports it to device 2. Device 1 resets and loses
>>> VRAM contents. How would process B notice that the dmabuf is lost when
>>> it never touches device 1 itself?
>>>    
>>>> +
>>>>    /*
>>>>     * Device specific ioctls should only be in their respective headers
>>>>     * The device specific ioctl range is from 0x40 to 0x9f.
>>>> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
>>>> index 43691058d28f..c3257bd1af9c 100644
>>>> --- a/include/uapi/drm/drm_mode.h
>>>> +++ b/include/uapi/drm/drm_mode.h
>>>> @@ -1308,6 +1308,21 @@ struct drm_mode_rect {
>>>>    	__s32 y2;
>>>>    };
>>>>    
>>>> +/**
>>>> + * struct drm_get_reset - Get information about a DRM device resets
>>>> + * @ctx_id: the context id to be queried about resets
>>>> + * @flags: flags
>>>> + * @dev_reset_count: global counter of resets for a given DRM device
>>>> + * @ctx_reset_count: of all the resets counted by this device, how many were
>>>> + * caused by this context.
>>>> + */
>>>> +struct drm_get_reset {
>>>> +	__u32 ctx_id;
>>>> +	__u32 flags;
>>>> +	__u64 dev_reset_count;
>>>> +	__u64 ctx_reset_count;
>>>> +};
>>>> +
>>>>    #if defined(__cplusplus)
>>>>    }
>>>>    #endif
>>> Thanks,
>>> pq

