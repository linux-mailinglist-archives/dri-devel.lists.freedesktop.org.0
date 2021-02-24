Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CDE324215
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 17:31:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFB86EB0D;
	Wed, 24 Feb 2021 16:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680059.outbound.protection.outlook.com [40.107.68.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF2476EB09;
 Wed, 24 Feb 2021 16:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jZTLGqwygHJcsWjrWLWgGWrsHDrDrfnTc8XtCjQQQUP8+By7tOzszf/4Maj0NYeMm12uQrNczl9+Y6pKmbYu3Mq9LygL7OcfQLZMelZ8hKXwzEAPahgJtl1wVPQ8Vy/1EzYG+dRxZhaDtkXEYmi8J3x6UVgtb5BxRNE8uOtYiuvv+LIxlhksvu+RdcNFb1gnyFl7ZrGvJSOggoBZ6+Ra1ObnAeHfyHG54Czi8ALgBR53Oc2Ideho37U2tQdZ7bMAN3H7iQrThKgA4rGsahFIbQ9B7yUOD3CQLFQoMl6pBVjTAJP1DQmc14P56qqWDZb4CBb4O/ULDaWnDedhm/v8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miuO6cpHu9lM29OLBfETZGYikid81C5g45KkMa7MbBI=;
 b=kkoqvQnE4xEoaAZt/FEDdoPrTamepUIY4tUcFHLNvccsP3zH6csGpERGCBSXDsBgh2hHDxtcvPicQnT+ZwX+GsX02CGaKZ0gLkYr2GB+p8q4DmgXK3k/M44N/7qqjjUhb3CYzMIondqdikK6756tgCBoEODxPKLGhmxxQRLblMpEKlCTeSKyaqWxHsOCGfOrz+8CBPn7IfCGO5LQmdhGOhXLQ4sv59h9/KvxbozjxwP1QXn0rpsAbf1o67KidxNi7hLvfntVko0heHWfpT6VC1xFp/9Ip2k1rl1ObZ/Hhwq/uwqt2IB63xsJn7wgMW0J+4nLnenwK/r6nTd88aEL8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miuO6cpHu9lM29OLBfETZGYikid81C5g45KkMa7MbBI=;
 b=xNVVHL3NZvalCdjK9UXwm2EEAzBG2IeJC3tkToS2oVzHsMVlobDlfhbSgdtxDQXQOL+6/u/VhRVu7al9oRsaY/nFOFB2sjNzSm1wcZbcrf8ez1MjW3kNjlmxP9FBSJoGqeWAKVI6PjyStufSESC24bM6oSW0GjbaSbW7TmoIW2c=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Wed, 24 Feb
 2021 16:30:53 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 16:30:53 +0000
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
 <871a02d8-e776-dd37-bd25-3169f8167923@amd.com>
 <CAKMK7uEKERRmQRfngkO_1yfi6kHJjarJncFm3eZ1Uxcf9pNWGg@mail.gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <c8666ac8-e7b4-59e1-dac7-a10d77aeb9ff@amd.com>
Date: Wed, 24 Feb 2021 11:30:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAKMK7uEKERRmQRfngkO_1yfi6kHJjarJncFm3eZ1Uxcf9pNWGg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:994a:4dd2:59a:30]
X-ClientProxiedBy: YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:994a:4dd2:59a:30]
 (2607:fea8:3edf:49b0:994a:4dd2:59a:30) by
 YT1PR01CA0116.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3868.29 via Frontend Transport; Wed, 24 Feb 2021 16:30:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b14e6c6a-2042-4b5e-ba8e-08d8d8e18dfb
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB47678B4A805697BB060DC2B7EA9F9@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FNnqH0ssA7dJZHNTS/zBHOmTvhSAHEIyfMmsaK5Y68WzXRAL8+cpaUWyLPu1Sb4OLqY0Y5i6YI8A+vBFTkZqPW12bdrLEooYhxxgT60y6PrSrnIgh0DDksx9pvxQnImy5X6MtSvgs/eklahXv0TsjvO0whFFUdujbtkGp0d5vNfxn+Ti1JQKTDYWG+Y8plV1IaT/u6RXOcfXQAWQLb6FcvdAG6gf08SilCwOJ+jrCTso+cWrviJ1OGId9UXRwRGHJ3NGMINeP9hMp41l5CGPFr7wUNLoTTfZrZmibyyim5t3FizTSQT6I0u8erRYs6Veuw3JXNqRqCmji8K/M5HNRgvCUfORUh0VVHj86cwYhiJ34+FVyk+ttyd8axKbx42SFdcOIlEcxf5ApL7vZ0iAsxg2s9sz7Z8vUJ8rAGxglohCo7KI9f45O7iP4Ch/pE25iyyUO2eASMPg0mHoC66aelU8Vv20EtV9dQ6WOGegU1INx9Ojd+48KWYxUpbpqqWLPjzzItPFL0ie7uWSscBtYQzoPWoMIgy0rbpOLiYwuS5JdGKVF0cX0RT/J8reNYSY6/oftMskJuaSNE/3lmQPYeowBKOwR9DMzlA7aDpgVn3M7Stdoz2l2I9LidnpRobIbuoB6zGS2JPivOY9hRObCUfv1qkdnRxdWPEFuRNiP9J1AygmFXgnjTqakM8j3U77
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(4326008)(16526019)(66476007)(31696002)(7416002)(186003)(52116002)(66946007)(36756003)(86362001)(316002)(6916009)(478600001)(53546011)(66556008)(5660300002)(44832011)(2616005)(31686004)(966005)(2906002)(8676002)(54906003)(8936002)(6486002)(83380400001)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WlF5QnBWNnpkdU16Q3E2TXRXQlJYdjRONE1FbWVGejFkSXBEbFJJeUVJRGZz?=
 =?utf-8?B?UEdLa0NLdmErRzg5T1ZvNis4MnhNUVBIcDc0cEQvSFh0S2NEcVc0MHIxcFFh?=
 =?utf-8?B?akprLzRPbXp2L3pWTzF6eWRSOHRaUVRmYk9CRUlPeU93Q1MzQ2N2cE92MSt4?=
 =?utf-8?B?azJLY0Q4VmdjcVhqN1IrLzM0d2RaVitKemtYUFVRQmc5ZTR6K2lmSllhQTZQ?=
 =?utf-8?B?bVJTcG85ZXlPeFdNamhnUTlKaGFKY2djVVpGWUlaK0pPaXB0ZGNkTk4yeFYw?=
 =?utf-8?B?VlZQMXR2Q2NaNnZqMFF1UmRHeWxIQXdYLzREWFJSeGZlb2VJZ1loL2FMcXRi?=
 =?utf-8?B?OFN0OVFjRmorTGVEY3F2b2xhTWMyV0NlTVFlSTY1WkZ6Rm1QclVoV1FUVzE1?=
 =?utf-8?B?a0oyNmVKMExON1FSYmVHNDh3Q2FmdFB6VG0zcEJEY2M3MWhqYXptWjNGSXQ5?=
 =?utf-8?B?d3FFZWZRRWE4M1JzdlIvbWNEQjdBMXNGTWNxU3NtOFFqYzUxbFhYeWxPUWlI?=
 =?utf-8?B?dU9KU2p4NCtLaFIya1ordG1Rb3MrTllER0FEV21qREhNWEYzeGFJZXFjU2hF?=
 =?utf-8?B?eFpWWXZwQnQ2M2hNVENIVElnb2VLcVc4MVhqMFEvVkptOSs0Y2daSGE2Wk5a?=
 =?utf-8?B?MU00YldqcTRZQ0o0S0FrU1dteFQ5RjhCVUdjZ0VVeDhvS2JjM0t6VW5TNGEx?=
 =?utf-8?B?MUI3Wm9Dc1hlekhTUjE2VWlvL0JqSk83NVc4MjZaNGpqVFl0TGNlSjhuYWps?=
 =?utf-8?B?c3JwVlh6RFpvRGxtdjU1ejY4d053TWplVU1XRFpTSG5tRS9leFNTbGdRbnJ6?=
 =?utf-8?B?eGt0dkljMGxXWW9oQjBiV1A0R2ZtQTRiaTFRU2Q3Ymw2VDdLMVY1c25lNXV3?=
 =?utf-8?B?NVg4bDVCbDcvRUpvdVJZVUZhRXF5MDgxdmNEZnNqdWRndnMrVGJvRys3emwv?=
 =?utf-8?B?TUthQmtLYTlpTVJ0N3dRMFBIMWlXTEZJQ1FQVUhmNHZEMTFiSTZmVU44V3g1?=
 =?utf-8?B?SXNTZVJFTXZpVitWZWExVjBJeVlrWEpCUm1kWnZ6aGlaNnpOMkdkUytOM3Iv?=
 =?utf-8?B?MXkzMGxYamhRRGt0MVdnVXdHVGdnNTBaaVV3VEtRM0NrRTZOWjZ4SlRBNUZV?=
 =?utf-8?B?TTFqb0d0OVg4eTlIMGNodUc5Z014bTdrSzJyclZ3SUtscGE1MkkzZDJScGxB?=
 =?utf-8?B?cVprc29XdzdpUjJ2Q3lHVlVQR1h4bmtwcjJGOUJXcDVlS0tuN2VDMVBaTjQ5?=
 =?utf-8?B?WVhub1ZrSjhTczJLSVNKWFdzcGR5a0x0TFdWdXk5U3VzNVNYM3dwY0VuSFNT?=
 =?utf-8?B?RS9VYnM0NGJudllRNUgxdDNZNW84OHFMSnpzMVpMa29wUm83Q09pb2VxQlpH?=
 =?utf-8?B?MzFtcFViV2NXNXRnOUtONlBTbnk4SnpvUUV5eWNIbmZiV2NqYk8wTnlISUdX?=
 =?utf-8?B?c0hzaDhhV1czaUFsd2NxVGtRa0lxTmVYRUFOajdYM3NxSE5WTFhVN2dOeTJa?=
 =?utf-8?B?M0djZWJLS0JCYnFabnNha2lJa01Rcmtma05xcGZXb3dYbEU4ektEOUxKenlR?=
 =?utf-8?B?NUtQMTk5MlJiR2pBbFZoOEh0RlR4bDJVc1ZxRGNUQVgxUCtQU3RURG9JSW1E?=
 =?utf-8?B?YkVlNGlEZU1wem1la3FCYVVWK0Z6bkVuMzB0UkhsbDFtTlNDSzFFSTNsUU14?=
 =?utf-8?B?SFZSY3d1dnF5a0RIZ3NDellhM01pNUVuRmtRbkhTZDZHT0xsTUdqTUJMYi9K?=
 =?utf-8?B?UzVKdE90V0o0Z3RoZ1E3WUd0UlV6SjRwa25kbHlBYk5HU3RrYWdxUFF1NkN3?=
 =?utf-8?B?MnpUdU93MnVuelExREJBSjUzRmJRT2NZbHRPaG5TOE9wTUl5REUxcW1rVm5Z?=
 =?utf-8?Q?dtxpyarn0YxQ+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b14e6c6a-2042-4b5e-ba8e-08d8d8e18dfb
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 16:30:53.7259 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IOONed+sOp1lPXTahNPfPi55jSG0sIrUqBgENtyQvqVsGTio2AXqPvxakbmlroVzR8bmc0RLJWfYew1umhN3qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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


On 2021-02-19 5:24 a.m., Daniel Vetter wrote:
> On Thu, Feb 18, 2021 at 9:03 PM Andrey Grodzovsky
> <Andrey.Grodzovsky@amd.com> wrote:
>> Looked a bit into it, I want to export sync_object to FD and import  from that FD
>> such that I will wait on the imported sync object handle from one thread while
>> signaling the exported sync object handle from another (post device unplug) ?
>>
>> My problem is how to create a sync object with a non signaled 'fake' fence ?
>> I only see API that creates it with already signaled fence (or none) -
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Fdrm_syncobj.c%23L56&amp;data=04%7C01%7CAndrey.Grodzovsky%40amd.com%7C5085bdd151c642514d2408d8d4c08e56%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637493270792459284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=sZWIn0Lo7ZujBq0e7MdFPhJDARXWpOlLgLzANMS8cCY%3D&amp;reserved=0
>>
>> P.S I expect the kernel to crash since unlike with dma_bufs we don't hold
>> drm device reference here on export.
> Well maybe there's no crash. I think if you go through all your
> dma_fence that you have and force-complete them, then I think external
> callers wont go into the driver anymore. But there's still pointers
> potentially pointing at your device struct and all that, but should
> work. Still needs some audit ofc.
>
> Wrt how you get such a free-standing fence, that's amdgpu specific. Roughly
> - submit cs
> - get the fence for that (either sync_file, but I don't think amdgpu
> supports that, or maybe through drm_syncobj)
> - hotunplug
> - wait on that fence somehow (drm_syncobj has direct uapi for this,
> same for sync_file I think)
>
> Cheers, Daniel


Indeed worked fine, did with 2 devices. Since syncobj is refcounted, 
even after I
destroyed the original syncobj and unplugged the device, the exported 
syncobj and the
fence inside didn't go anywhere.

See my 3 tests in my branch on Gitlab 
https://gitlab.freedesktop.org/agrodzov/igt-gpu-tools/-/commits/master
and let me know if I should go ahead and do a merge request (into which 
target project/branch ?) or you
have more comments.

Andrey


>
>> Andrey
>>
>> On 2/9/21 4:50 AM, Daniel Vetter wrote:
>>> Yeah in the end we'd need 2 hw devices for testing full fence
>>> functionality. A useful intermediate step would be to just export the
>>> fence (either as sync_file, which I think amdgpu doesn't support because
>>> no android egl support in mesa) or drm_syncobj (which you can do as
>>> standalone fd too iirc), and then just using the fence a bit from
>>> userspace (like wait on it or get its status) after the device is
>>> unplugged.
>
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
