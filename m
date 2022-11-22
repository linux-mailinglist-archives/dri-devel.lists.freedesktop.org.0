Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E4363428D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 18:34:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB4510E1C5;
	Tue, 22 Nov 2022 17:34:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 114C110E1C5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Nov 2022 17:34:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Var9nPFJoY7ID/zt+w0h0XixJdiFN/Prlu35fcTM/U/8EOoAz+bOBJ1ytaCGHNpTUNeb2gS/Se6lY9ZKOK1qGG4G9eb+CANGlidCW11XfMA75h+a5otY5Co85OPlIPflZikgIrkGy6syJok0I3vb2jlGcTDjZhdDA7eZTCC74PhkZMWb61xCC5NtN7R9uQKML3jLgbuMMw6RD++nfd42ydB0W23Qv4UzqbZjXhSvVIfr3HCTHzpPMfRXlJlm6/bB8TySHG44ugGqfTPTTL16uoVefF43F4/1IE6U7LGyy5Z/werDlXDeHRqwWMrhz/c/NbCddzSKeu8LVvAKM56yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZyF1/EBFJrzggmv3EFSCf3/3JGGKBSzjuT2dTVGIfw=;
 b=bJk7BovHNcW4lu6C5DvWr559IBEtPE5EN4k6NAxHwrDDbTE7zv4o4Lw5FXC3prADw6UtbR6o3nUBM9GZ8xHkGnBHdMbDmEBHySHSOea30YjpPhzW+iRqQZzi7BeF9gLMPLS6yvnx1JDpCKTlPP7dB7jVnzkTv+Ns0xXT6769esn3pEA9CN22s0Jzlzn3fBGmAIaren297+F6C6p/WY3Xdzq/zD/fpAvo/ozdkn+9c4VedHotyTC04UKILCmHZpDii2oYhkQmZQdaXIMmgLBLEgFeKp/NXzMlk5BhRv25jhZN/OXP5NUBV5SdJNqS71siX+JZngMskKc1NzBNAt/2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZyF1/EBFJrzggmv3EFSCf3/3JGGKBSzjuT2dTVGIfw=;
 b=4CCAlNECReZpYdeU18l91mwjxuGHI7oxlXuL1pTs6n3s7EcujTVKkbac73nNUfI1njj1NL6AjdiEj4wA1QKsldt7/3nf6PX/mf7SEswlwS6E9dsVQ/RZqiW8zA64OC6nGUpOESVxnxX4UI9wB0w4RTKEHnNwr9fDl18kl/yHZkY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6883.namprd12.prod.outlook.com (2603:10b6:510:1b9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Tue, 22 Nov
 2022 17:34:03 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5834.009; Tue, 22 Nov 2022
 17:34:03 +0000
Message-ID: <ae9ba9ba-3ad3-af23-be66-1540862bf571@amd.com>
Date: Tue, 22 Nov 2022 18:33:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, Rob Clark <robdclark@gmail.com>
References: <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
 <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
 <346d6ad023ef8697aafd93ac1b100890f3637e44.camel@ndufresne.ca>
 <CAF6AEGuqgWi0T=B9cb+Uy7aoWBPGQmZ3JbwFcK_45GbkY2nHPg@mail.gmail.com>
 <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <Y3zeYnufgXJHQAbN@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6883:EE_
X-MS-Office365-Filtering-Correlation-Id: 067dd5fe-8396-4a0d-21e5-08daccafbfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oap5opGV54itvaEuyP6ZCeQ69S+oeO0BqEyaPCl7iM1GtX+6HTzm0CHDUYD+71OWiEYF0Aqo2G1m4GjzAsReZmBPLeJyfYbF1unZnQ+LqYp9inGrWriSKbX42v+VxeEMQCWJIE/nkpfcVnhZd14hgDNIwa6UYGFg035lt+f0b8Bt5arQXCzrVKRd575tt/zyJPXag6DvHn6hM3epF0ptnc9F/07cQHWe/hkxPxT8gfZW8Ytg4UClcCElGrGkNTMswmjj2sAbjJZ7Ga8Kw/8IgOMFWjsrVaJrT6MOK5wCBur4SNc/6EyPENC32iqEi1I/CVwL0RqFa67Tv0v29Wy1M3l52vGys10WTO1slNRMATTATMBhuNeNcQ5nBu2MR+6FAUfs6zzZ5qDD5ro10JznhiHeqa8Gugf3GFjoPv6KbqRKUEViR/iwtvwfvQ14BUxz8VR+oKwK4MYIGywkIatDQC0VOAcnlJWbVCnHYmDyI37OmeJAppfYjeSM1p+uqTFB+KjEHM2Aw6mGp5+yaoKsRGooZMGyUk8UR6EUmRUITZqEs8z1P7eatRI/nrG/J30ihJNfSwdz4cmBvJpIxgbtAgZrOojW6Wst0K/jIov0wWEUi9phxOPGxi8myS++E+pLtirQU8+4Os9EI0HVUv6NFW6Xr70zjIwtk25r9alsD0ChpROxQroYlSKoWfIv8NkpVfCUoiNIkeQmkMXO4WojmF/IE/ddfi0mK217cAhkeaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199015)(6512007)(2616005)(53546011)(83380400001)(186003)(66574015)(38100700002)(2906002)(7416002)(5660300002)(6506007)(54906003)(6486002)(66556008)(8676002)(6666004)(478600001)(316002)(66946007)(8936002)(41300700001)(4326008)(66476007)(110136005)(36756003)(86362001)(31696002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTRlT0c2dGpNcVhZZVVJbXFidlBXN3NqUmozLzJyejhtNzNoYThGS1NJdmZ6?=
 =?utf-8?B?QUlVWHRxbnJXYUFBU1h4WW0vR2NDUFhDblk0dnZzUDhDZ3BqRXRxZTFSV2VN?=
 =?utf-8?B?M0lDTkVBalFRb3ZrUFYzaFhDcmkwRGlpajhNTndqMDZmOElFOUVEaHRWYXg1?=
 =?utf-8?B?Qk8wYjM3OEZyMlRHSm9yaTRzMWNsenpxM2ZyNGlkY3ljT0xYUzJqU3h6ZzBo?=
 =?utf-8?B?UTdRUHhUbVlrTUNtK0haZXppRmxsdWRySEVGMHg3UEEyTjJXQ2JFTjM3SUhq?=
 =?utf-8?B?a2l3SkIvRVFCclZGa1FFejVraTVhbmhGaE1KNFhoM3lnOE54WXdydmlOL3lt?=
 =?utf-8?B?L0xzREFOekJaZnZ6bURQK1VCSVRpb0dxdXBIbmZDS0VqMkJOcmQ2OGRCeDIw?=
 =?utf-8?B?dkJhSFdkZnJnV1NXSStDQUF5WllMRGI5eXZvOTAxS2RweUVPd2F4QU5FK29o?=
 =?utf-8?B?YkpaU2ZrV3pxMWd6S0hMWm9ZYTlsV05GbVdHcnB3SDhMM2RMejFzQ3FKaXJM?=
 =?utf-8?B?SVVLUkJVM1VOSk1yV0ZDNlJ1S3luNE0wMEhqTXFVaHdTL1RHajVxT09NdXk0?=
 =?utf-8?B?ZlIwaDFIY3d2MDFBOWRMOXIxcllKa2hLS201OUNiLzdTS0tIbEh0OHErZ0JB?=
 =?utf-8?B?UlYwRzRBSjVkODVoWG12ejgydkJVNjM4Y2ltNTNZZFRaR3llZFZKcWRsYWN0?=
 =?utf-8?B?OEZHMVVHVEJMaDcrWGhxbXdJRTFDNlg0ZDJnb2k3Zkw3T3krVEJWV3g2ZmJV?=
 =?utf-8?B?VGZ4dUtrRFk3KytlWTNuejVYZnIrQVVEZW9GWm1jNVc2eU9EOHJ6TUZWOUor?=
 =?utf-8?B?d21LaFJPbTYrblJtblJuUW1zRk1RZVRYejRoaTlNdGdzL3B5S3U0MXFGZ3lP?=
 =?utf-8?B?c2xTeXMrenZ5Qkc5ZCswMVBLRzN0cGdOc3UrZEtBNWlnLzc0UmJLa1RkcTRL?=
 =?utf-8?B?SjJSaVp3MDUvMEMvUUJZQzhOQktzRzV5TkEwMHBzd294d0twWjEwZU1iQWZR?=
 =?utf-8?B?V1MyNjRkMXJnWHJRUU14NE1mWUw3NDVzUEJWZGIxUEozMTU2eTJ5bDZrRkk0?=
 =?utf-8?B?Yzc2NU1RblM4S01ub01Oc2Q1V0M1MW4xbnN2WnFqSVE4Sm03QzlBNlU4MmdT?=
 =?utf-8?B?OUpoT1pUSktBeWNXWEFGSFlyYks1eUkvcUVxU0pSeG9wNFNKM1JDV0Rsb0VX?=
 =?utf-8?B?UG8zejZqeTVoa0YzUFBhT2JVdXdydVF6U1J2WDB3all0TSt1VkVXcjkxTzFl?=
 =?utf-8?B?TlpLQVZxOUEyOElDcHo4WFFHOXI3ajFJN2tEbFl4RzhtS3djWW1Sdk9aT0F2?=
 =?utf-8?B?SHlsZDRGWWl4TTJBVmtZaUZHVXpqRFgyRnNzbEt6V2I1MGNZZU5NUUxkRUtD?=
 =?utf-8?B?NFlHQjFBTHplamJ0VEZBd1E1UFBJVnZCQXNwcHRNS3ZZTUtTeEsyaEp3V3Ba?=
 =?utf-8?B?YXdIclZFbUFJS1ppbnROZDJNUHZqN3A1Y2Z2K0JuQ0h5bWR5aHl5Y0lXNkwz?=
 =?utf-8?B?UjNod1d3NjFCaXFZUWh6bE9wT3JPRjJKc0duNkcvMEp1NVlFaXBuMkJxRkpT?=
 =?utf-8?B?WVpNQkF2R3FSdzlFenB0R09wMVpIODZxWlZnbi9jdWl2OU5jQ2xEYVlYaXJD?=
 =?utf-8?B?VTMzWmZXZmxDSklRYjZXaDM0UE1DVkJacGhUL2t0NDNFaE5UUXhGVWpCd3lK?=
 =?utf-8?B?MWgxWFRzUzV2QUlxMUhoRTVvRUptRE1tZUt4UWthazhhTzJUdldjZGdNZGlh?=
 =?utf-8?B?ZHdSMWFsQVBKV25LNWZpbitteUNPYVplT3UvMDlKOUc0T3RXODBQVXFxTTZF?=
 =?utf-8?B?TDNBaUdoamhrM01DRC9wTDIyVmVPNXlPQWkrc3EwRk84UGswSmZ3TjJlNjc0?=
 =?utf-8?B?MUtRR094M3dqWjdtMnp3KzJSeFZpL0l3NTlSc0FnRXRSVHJwaTBxWkw0NEhS?=
 =?utf-8?B?Z21KU01CZFRHZitVUytteDJGT2JFYWRwYVhHWGpJVXVwTU51N3B4SlZOMlo5?=
 =?utf-8?B?OEQxMnFVVmE0KzQxSUIxd3NkSytlQjhYNVBuZ1llaHZJb2NidGloeDF1WExO?=
 =?utf-8?B?SXB2OEFEbFF5Z3M3S1ZrenVCVE9vSTJtN3pxbWFsSDBJZUd5ZTV4SXNkbjF1?=
 =?utf-8?B?bnBWZzg0TDZPcm9EQ2JZbWZFL0hxMkhLUjZ3c3ZGREJuckZ2bUdwdXZ5VzFU?=
 =?utf-8?Q?EcKBXMwB/fN3un2+rlDroY9gS3n8NyZhuUgx/HmNPDsi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 067dd5fe-8396-4a0d-21e5-08daccafbfc3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 17:34:03.7582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wHkJ804ImtjL3RDW3+plqkHP2Y5933CA3Ak/iueVCGGh1ij9XAA+MYABwzWa2hvS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6883
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
Cc: linux-media@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linaro-mm-sig@lists.linaro.org, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 22.11.22 um 15:36 schrieb Daniel Vetter:
> On Fri, Nov 18, 2022 at 11:32:19AM -0800, Rob Clark wrote:
>> On Thu, Nov 17, 2022 at 7:38 AM Nicolas Dufresne <nicolas@ndufresne.ca> wrote:
>>> Le jeudi 17 novembre 2022 à 13:10 +0100, Christian König a écrit :
>>>>>> DMA-Buf let's the exporter setup the DMA addresses the importer uses to
>>>>>> be able to directly decided where a certain operation should go. E.g. we
>>>>>> have cases where for example a P2P write doesn't even go to memory, but
>>>>>> rather a doorbell BAR to trigger another operation. Throwing in CPU
>>>>>> round trips for explicit ownership transfer completely breaks that
>>>>>> concept.
>>>>> It sounds like we should have a dma_dev_is_coherent_with_dev() which
>>>>> accepts two (or an array?) of devices and tells the caller whether the
>>>>> devices need explicit ownership transfer.
>>>> No, exactly that's the concept I'm pushing back on very hard here.
>>>>
>>>> In other words explicit ownership transfer is not something we would
>>>> want as requirement in the framework, cause otherwise we break tons of
>>>> use cases which require concurrent access to the underlying buffer.
>>> I'm not pushing for this solution, but really felt the need to correct you here.
>>> I have quite some experience with ownership transfer mechanism, as this is how
>>> GStreamer framework works since 2000. Concurrent access is a really common use
>>> cases and it is quite well defined in that context. The bracketing system (in
>>> this case called map() unmap(), with flag stating the usage intention like reads
>>> and write) is combined the the refcount. The basic rules are simple:
>> This is all CPU oriented, I think Christian is talking about the case
>> where ownership transfer happens without CPU involvement, such as via
>> GPU waiting on a fence
> Yeah for pure device2device handover the rule pretty much has to be that
> any coherency management that needs to be done must be done from the
> device side (flushing device side caches and stuff like that) only. But
> under the assumption that _all_ cpu side management has been done already
> before the first device access started.
>
> And then the map/unmap respectively begin/end_cpu_access can be used what
> it was meant for with cpu side invalidation/flushing and stuff like that,
> while having pretty clear handover/ownership rules and hopefully not doing
> no unecessary flushes. And all that while allowing device acces to be
> pipelined. Worst case the exporter has to insert some pipelined cache
> flushes as a dma_fence pipelined work of its own between the device access
> when moving from one device to the other. That last part sucks a bit right
> now, because we don't have any dma_buf_attachment method which does this
> syncing without recreating the mapping, but in reality this is solved by
> caching mappings in the exporter (well dma-buf layer) nowadays.
>
> True concurrent access like vk/compute expects is still a model that
> dma-buf needs to support on top, but that's a special case and pretty much
> needs hw that supports such concurrent access without explicit handover
> and fencing.
>
> Aside from some historical accidents and still a few warts, I do think
> dma-buf does support both of these models.

We should have come up with dma-heaps earlier and make it clear that 
exporting a DMA-buf from a device gives you something device specific 
which might or might not work with others.

Apart from that I agree, DMA-buf should be capable of handling this. 
Question left is what documentation is missing to make it clear how 
things are supposed to work?

Regards,
Christian.

>   Of course in the case of
> gpu/drm drivers, userspace must know whats possible and act accordingly,
> otherwise you just get to keep all the pieces.
> -Daniel

