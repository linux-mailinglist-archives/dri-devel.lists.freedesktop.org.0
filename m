Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95564BBCA6
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 16:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1E1010EE37;
	Fri, 18 Feb 2022 15:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B7110EE23;
 Fri, 18 Feb 2022 15:57:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=beaYzV40uc2jZFStS9cdM74UvYNizXXXmnL7dt+6kLet51r+uWgxMXMDWv9VqUX2ZfhNXNiAlTb2Al79o6iRqYrUp/lA898yKE50J/TnUZ4V4XIhpUYWyc3MBROCN6jDy0oey6zMGMnMZLdBGU0p+kM8MdJ7PHfPEr5SXHAW75WN+ZmNHwAni8GSDGFmF0dYFnNtrbK8fjgsjHJhaX9sRf0HKc73GGc1HedhLbHcWON2ZV0j+HT0hFIJkhFtOsLV/XsQB/viE6tIaLlpUW77AfDZRAY0C2c2atQvXNqIXBIOsXw+ioPs8OqbBijYISYN88XzM2+I9LTP3MLzLR9EFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ38nmP5Pd6sEtCL4z/ZVSwd7kLNpFXi2fWrnrn9QTQ=;
 b=dy+iNJxla+a4yxvV/HWdzAd+zB43pFvvZuVRwkXDJnkTVzFBpOUC5U8gO+xj4kTp8Q8vCLX/cxRN25FCnBl6ZMKRD5e01azN9JKJET2sSgAwZTnDxYXRXJ+ohYS8sy1s00GdT2Uh3sVptYrfAIMhmwM2C87CaNyDTsdD2OxjpGCY5MU8B7jUUiuhPtD5wtRMVCDiHGGG6yL+4Kly1xnRJlLgy7QfYxqTIKWqTi6Zf/AkZvorAY+2VrtRbrX+OGVHE2z4TQ9LVLE2bK1XlLvnyMXYe/4XQEeM+sAVMjxYRyYs4uOzC3wzQ9ASvCNb9guIXXFd2aMUMKiVfljiMKOdDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZ38nmP5Pd6sEtCL4z/ZVSwd7kLNpFXi2fWrnrn9QTQ=;
 b=aFHUXVvZuiG/kBIlv7br/b5M6EOefEzmX+31xrtGxgZr5Octr8EYT5CI9+AwxyZrNq6aq82hbgG/hkK5l9rnaU+NTwjehl69Md0NFPTMi7Kv0LnAAtNCcRe8jcoHx8R8ea94ADZb2HVvC2auRIyMFKWVqAbuqYxlYPBqavVcug4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4643.namprd12.prod.outlook.com (2603:10b6:a03:1ff::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Fri, 18 Feb
 2022 15:57:32 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::192:5346:4ece:7ca3%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 15:57:32 +0000
Message-ID: <16c1886f-d130-b299-9d09-ad11556f3bfd@amd.com>
Date: Fri, 18 Feb 2022 10:57:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, Hans de Goede <hdegoede@redhat.com>
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
 <KW6DNh6IRRgVJx9DfOFBnEqc4a0x-AnDXEbMxwpfEbk8dOn_KGVzAfo-slJWq-4nWW728Uc-OVpFh2w4fDE4-bxfkDuz1hFILRVvbcuXqaw=@emersion.fr>
 <CACvgo532-pC+7DLFCo=DWTX-OnJEJvSoTmQnt3_qLhiT4cqEMg@mail.gmail.com>
 <GYG6EVT1MqtmfKiPpMhDG9mpuATnmwVDq2PuE_dpDat5oQW_t1tUfm39lSWHj32D5r7mrog27sL4dkgdMYQ5BN830TfVOrgQ4Ts8LcO8Hcs=@emersion.fr>
 <CACvgo52+o9_ETC+1RKzqKkyw3ZJ28RjH0BqC9DfmNAKqByud8Q@mail.gmail.com>
 <d3f0cc20-d226-ee42-cc98-b469949cec9e@redhat.com>
 <YV87l-2XXzmZ2i6GuGd__uf85s2JQkbXt_qTQDYlbBh1kW2COJoNLUDinmLCokKyy-_0ZnIMUcZeW0GdJ8zF690iYi4ThKrjc09omNMe-0g=@emersion.fr>
 <d4f5e101-3dd5-2f3a-6c14-6b32ee37c223@redhat.com>
 <DM7TzJ-fZEHjoGXvMG8XLfJ2VxohRxotL40_0Vb4cAUvrELgV9BvPGbK6HAwOYOBCx8qXtY2LQ0xnZ-nlH_IVCyne7tMKfvkqxtoWI6MkTw=@emersion.fr>
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <DM7TzJ-fZEHjoGXvMG8XLfJ2VxohRxotL40_0Vb4cAUvrELgV9BvPGbK6HAwOYOBCx8qXtY2LQ0xnZ-nlH_IVCyne7tMKfvkqxtoWI6MkTw=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YTOPR0101CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::36) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47e5ae0f-1f4c-4599-456a-08d9f2f75f2c
X-MS-TrafficTypeDiagnostic: BY5PR12MB4643:EE_
X-Microsoft-Antispam-PRVS: <BY5PR12MB4643B91DB8633A416C21662F8C379@BY5PR12MB4643.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z4peCcs5bhAcYBD3KY8qfu9rzrvD2IM+Azlj8a8Ty9PKSac3HL63wEILXD1pXSBBDjGt+fxsKxLvc/Q989KYnER4KT0bb9qWHvv3PWuTyGWdaKnbroBkz/lSKG6so8Wl/Fsbav3GkEwp6X1V+8+UnXcS30YNVjk9LkLsYC5XGEL9CWn2HuZYc2jqz/P2fI4QNxz2rezgGDwFGukjludWg0CoYinAWlkVmfBMQ3RD3MOABvKaYxmlE9eIX8PVWypxTbydcAKMO+Ek5l12UkJHKq0wihL6GkwrU1HT6CX2FWDl5SU3gS7Y8NrNWb2VBEHZh1+fs6NCHZzMjcSIKes3zpQgz0StvDzNxiNQE4UMPs4GGgfowKYIIgxlXcpJInP4VrsqHwSooWPONzsjtA3Ti821JSe7WDiCraww9gFUvFiTzO9iUH0K4U0aLlk7Yx28ldBnmdxjji8alkPUH4yiL1NLXHBkcqm0WDlsGGP1lcbp2SxmblgWrEzXpqSx0DSFBascx8+1ncbonikc0bIp6oWpfV0V6wQd0NIpVuGK7xPaa5YSkTe8yF4spsatSn2UIceRrf858+4fG0niQWO7WNouGl5UEOR2O4nY4ZPd35Uu0+2JBZDpA4VQoA2+SkpvupXgrwUUnUtPUU1x0LBqwyHcQZg+8vNUN+fRQHw/WCk0bxfePRFzZk30xVIMsLa+V/5U+MSev3KsFzfZ/i/xTmsQiU+MGDYK/B8H5W3AsXk4uZAfp+mfm8GzYDbKUiDc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(6486002)(8936002)(83380400001)(6512007)(86362001)(6506007)(38100700002)(4326008)(66476007)(8676002)(508600001)(66556008)(66946007)(31696002)(2616005)(36756003)(31686004)(110136005)(6666004)(54906003)(26005)(186003)(44832011)(53546011)(7416002)(316002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T2czdTc1bVQyZmpxeTRpRTU4L3JhN1ZySUZsMHhCSHF4YTRjRHZzWXozdkxR?=
 =?utf-8?B?SFh5Zlo0N3ZNaTB1RGw2TjE1azU5RUNIUXRrYm1ueUgxVHZqdmVDQWdUUjhG?=
 =?utf-8?B?UlIvT05pS1k3WGM5NXRwU3BnbWMzWnU5WmxZQksxR3hVRlY1WXlaNHIyaDlQ?=
 =?utf-8?B?dE1JcExHZE94RlUyZHd3NEEremVNbXhCZitJRkRCTDR2aVRuT3JsZk5hRFBa?=
 =?utf-8?B?a1RMaUhsNGcyblhYdzNqS0pRRVA5Vk0rV3FwVHZNcXNzeUlZOVU1RUtEM0JX?=
 =?utf-8?B?K0J0WFR3bTRnVUZ1S1pidk5jTjRqY3d2Nk9jREZlajUrMzhzd1JqTnR5ZExo?=
 =?utf-8?B?MlBwb2xkMXhuMGxyVWVxSTdnR1E5ZzBOTyszMkhnZnk5ZDFkemFjWGxIMGhO?=
 =?utf-8?B?UzIwbDlESGFyclFveTNxSUNOaFZRSU9PSmxUZVNDdzB4ZndLZDdqRDlVSUpr?=
 =?utf-8?B?Rjd6M3BuSE96V2J4aEhNK29TdXBITGZsSHBsMlVCeWlDQnVaQWllK2YrbU8r?=
 =?utf-8?B?VXliZ3dsOFZYcjJWc3Y2RE1GYlUxa1dWMDJEOG1oUG9Wd1pBd3FCdXl1NGEx?=
 =?utf-8?B?YmdvUjAzU09NSjR1Ymp3ekdHL3VXaFpaOTNmamU3N3NlcUlCVXU1R1F2U2t1?=
 =?utf-8?B?S0srQVdWODhoNmNoNXJURkVmaXcrbzhtcG9ibUVyWElGNVBZdXhnNk90a3l6?=
 =?utf-8?B?NW9pTnYxQ3VHUmdBSW1IMlFxMUpDZzFid3R2TzFyTkdzZXJLUzdjYTVQZ2dl?=
 =?utf-8?B?V1JCMmVMN3BUWE9ZanBJK3dXUC9WWGtLaVJzSk5EbGRmRnRhMjFsMlhMZFNN?=
 =?utf-8?B?UWROWEduS2JVRE02SmZQRUUveXBwc29FSDFGTnVLM3hwYmpiSmo4WjFOamVL?=
 =?utf-8?B?enl6bjV0Z2JGWmtidnJSMktINzE5R0lZNUJwbHllVUMwU3NLMDVKVHp5aUFF?=
 =?utf-8?B?SG0xa3E5bXRLbnRxUkJVeTVCOStiVUFYK1JpSVlDdzhLY2NVSWI3Ymo5SEd2?=
 =?utf-8?B?VFl4cWMwNHFRTEE5d3N6cTE1TzRZVnBlVjRYbGFmRVdpdHRLM2J3WmNZOXlB?=
 =?utf-8?B?MlNXZkxvNmFSS21Vc3hXNUJRMGpCU21hMkJJeFVGSGczaUFsWHRTV2kxNTlH?=
 =?utf-8?B?aUtxaEc1NlJtdms4OUp3ODJ4dzhpajlMOWhMZmh6QnI4bEFqOXgvRURUSk5x?=
 =?utf-8?B?RHhUaUZMWWZDSWVPMlhXc2l5Q1Vqc1FNbkRHdUU0bnRUUU90Y3NHYjFETlA0?=
 =?utf-8?B?UlZIKyt3TkEvTVRLRmI5T0JLd2NtUm0wNlUwU2pkK1BDdjRSc2Q5c3hJT0hu?=
 =?utf-8?B?TFdpYmludmVvc2tkMjFPbHhvcFV3Z1NrQVd2cjlHS3BXWnZCQ3FsdCthWTBu?=
 =?utf-8?B?SzBZdnJuODZWYmxWb2VJWktvMXJlQmdKWnNSbnVXOHBJemNNdWExTWV2aTE1?=
 =?utf-8?B?TVZNNTlwL0w0YmFzektFV2gwV2xkUUkrdE9OZGFYNTRrSWRNTTQrSDFLTUtV?=
 =?utf-8?B?eW82QnZhL0xSWGlBOEdUN1hQM0g0dDNWTDNtaURFKzVvdkY1d3BhZ2tjWWk5?=
 =?utf-8?B?WVFSbmxhdXBOSWFuakwvRjFkQ1gybXU3OU1oQWIwVTF2QWxBSlNaZGQ3U3NI?=
 =?utf-8?B?SHdLdXRWOVlxc2RtRnVST05peFZPNHBJYlZIamlTSks2RDFxcEttdjJydUls?=
 =?utf-8?B?R2JBcVZoTGZNS01RaXVUOURRRGMzeHNWMGVUYVk4N3VwSW9JTkhIV3FBUDdz?=
 =?utf-8?B?REtUd0RnR1F0bEF0bEN1RjJuUnVLOWl5VVZQcFpvTm5NalF2ZnVxQU5rV082?=
 =?utf-8?B?OWVGZnI5ZzRaYzYvUTZXWW5yMm51aVBSdFBZeDdITlhiak9SMHhlTFFEcFZs?=
 =?utf-8?B?NDhnS2pTUGorRkcwM1Jhc0x2Mnc0YklUMm05TTJ1V1pJYWhOSUs1L2d0YjZB?=
 =?utf-8?B?cGsrMk9sNnZ3UVhWSTBaVU4wd1hDa3BxWTB3dGNUSzhyekcxM1FUSThNR3hy?=
 =?utf-8?B?QzFMemhaR09RbENlMVJoZ2hXdTU4WXlFM0Zta2Y2aTRaWDNzczZFOVZKWWVB?=
 =?utf-8?B?UkpDV3RQN1pJbm5ackNaMlhiSEJkYklWdTJnRFJKamgrNUFLQXRSRlpyYmdQ?=
 =?utf-8?B?OFdMWDlUVlJ1enRwbE1iNDRRODdhK21QeEh3MFFmQ2FiUllkRFkxYytjdC91?=
 =?utf-8?Q?G+A0wVZHow8j+0tgBJBIqjA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47e5ae0f-1f4c-4599-456a-08d9f2f75f2c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 15:57:31.9091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nxz8t5OUV/KkZ0QMn0LC6Q0Cqgk+6OwRAs9Qp9HXrYIpxz2eMKXKKQI3SJ6F4FAGy03v++RXLpiX0eIy8IC2RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4643
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-18 07:12, Simon Ser wrote:
> On Friday, February 18th, 2022 at 12:54, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> On 2/18/22 12:39, Simon Ser wrote:
>>> On Friday, February 18th, 2022 at 11:38, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>>> What I'm reading in the above is that it is being considered to allow
>>>> changing the panel-orientation value after the connector has been made
>>>> available to userspace; and let userspace know about this through a uevent.
>>>>
>>>> I believe that this is a bad idea, it is important to keep in mind here
>>>> what userspace (e.g. plymouth) uses this prorty for. This property is
>>>> used to rotate the image being rendered / shown on the framebuffer to
>>>> adjust for the panel orientation.
>>>>
>>>> So now lets assume we apply the correct upside-down orientation later
>>>> on a device with an upside-down mounted LCD panel. Then on boot the
>>>> following could happen:
>>>>
>>>> 1. amdgpu exports a connector for the LCD panel to userspace without
>>>> setting panel-orient=upside-down
>>>> 2. plymouth sees this and renders its splash normally, but since the
>>>> panel is upside-down it will now actually show upside-down
>>>
>>> At this point amdgpu hasn't probed the connector yet. So the connector
>>> will be marked as disconnected, and plymouth shouldn't render anything.
>>
>> If before the initial probe of the connector there is a /dev/dri/card0
>> which plymouth can access, then plymouth may at this point decide
>> to disable any seemingly unused crtcs, which will make the screen go black...
>>
>> I'm not sure if plymouth will actually do this, but AFAICT this would
>> not be invalid behavior for a userspace kms consumer to do and I
>> believe it is likely that mutter will disable unused crtcs.
>>
>> IMHO it is just a bad idea to register /dev/dri/card0 with userspace
>> before the initial connector probe is done. Nothing good can come
>> of that.
>>
>> If all the exposed connectors initially are going to show up as
>> disconnected anyways what is the value in registering /dev/dri/card0
>> with userspace early ?
> 
> OK. I'm still unsure how I feel about this, but I think I agree with
> you. That said, the amdgpu architecture is quite involved with multiple
> abstraction levels, so I don't think I'm equipped to write a patch to
> fix this...
> 

amdgpu_dm's connector registration already triggers a detection. See the
calls to dc_link_detect and amdgpu_dm_update_connector_after_detect in
amdgpu_dm_initialize_drm_device.

dc_link_detect is supposed to read the edid via
dm_helpers_read_local_edid and amdgpu_dm_update_connector_after_detect
will update the EDID on the connector via a
drm_connector_update_edid_property call.

This all happens at driver load.

I don't know why you're seeing the embedded connector as disconnected
unless the DP-MIPI bridge for some reason doesn't indicate that the panel
is connected at driver load.

Harry

> cc Daniel Vetter: can you confirm probing all connectors is a good thing
> to do on driver module load?
> 
>>>> I guess the initial modeline is inherited from the video-bios, but
>>>> what about the physical size? Note that you cannot just change the
>>>> physical size later either, that gets used to determine the hidpi
>>>> scaling factor in the bootsplash, and changing that after the initial
>>>> bootsplash dislay will also look ugly
>>>>
>>>> b) Why you need the edid for the panel-orientation property at all,
>>>> typically the edid prom is part of the panel and the panel does not
>>>> know that it is mounted e.g. upside down at all, that is a property
>>>> of the system as a whole not of the panel as a standalone unit so
>>>> in my experience getting panel-orient info is something which comes
>>>> from the firmware /video-bios not from edid ?
>>>
>>> This is an internal DRM thing. The orientation quirks logic uses the
>>> mode size advertised by the EDID.
>>
>> The DMI based quirking does, yes. But e.g. the quirk code directly
>> reading this from the Intel VBT does not rely on the mode.
>>
>> But if you are planning on using a DMI based quirk for the steamdeck
>> then yes that needs the mode.
>>
>> Thee mode check is there for 2 reasons:
>>
>> 1. To avoid also applying the quirk to external displays, but
>> I think that that is also solved in most drivers by only checking for
>> a quirk at all on the eDP connector
>>
>> 2. Some laptop models ship with different panels in different badges
>> some of these are portrait (so need a panel-orient) setting and others
>> are landscape.
> 
> That makes sense. So yeah the EDID mode based matching logic needs to
> stay to accomodate for these cases.
> 
>>> I agree that at least in the Steam
>>> Deck case it may not make a lot of sense to use any info from the
>>> EDID, but that's needed for the current status quo.
>>
>> We could extend the DMI quirk mechanism to allow quirks which don't
>> do the mode check, for use on devices where we can guarantee neither
>> 1 nor 2 happens, then amdgpu could call the quirk code early simply
>> passing 0x0 as resolution.
> 
> Yeah. But per the above amdgpu should maybe probe connectors on module
> load. If/when amdgpu is fixed to do this, then we don't need to disable
> the mode matching logic in panel-orientation quirks anymore.

