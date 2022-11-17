Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9645562DA56
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:11:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FDC710E5B0;
	Thu, 17 Nov 2022 12:11:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E60D10E5B0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxTJq8RaY44Acko66fPOPdw2vAXnpLEJpSn4fTCTWqAHpAfYEVHWYG2KMOO6TKe/8JZbOGFq/wFD1PwQemSoctb5aID4KsjCKJS/lZu2SbcpdHvsSMnXzz9GCVyBGagnBgOSK76xBtp5RYIcpITXA1X98V66ILnMhBEmeskIgsFIelFYHaHIJTmwmMNTEy9B/vAQ8hgsAHUe2kQUD5pM5AwrAK2WUO/hcpowqJFcICW8ASFYkzJ503beCUvsjFlP4+Xk99zyLexNxGTX66W0Bh1nV7JL3wGKCn6fIGpCrCRi0yHCsW9maC1ZHW2On25qWoKMDEf106EckBZwjZmU8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onHTsedjaoBlvBn+J/vUpstY+VCDih7Qq1YmC5BtDYg=;
 b=SYk+RXnu/2h3S/+MPXarply3wEOxz8x9Zvd9zggFfllKFPfaCiiGVXM1si3Ew0qRovTAw7pgfpwIP3vaYcyhMKGwhzkhVYBC4+YSOC2mec9z9HktVModwS6/0j8mKA/WFkQaesONjjbpuOmUn8KGkfCfWxXxBqbJi+Qsq7kb8GHzjv0OOcuGY9sPQ+8kC2qCQQVcefOiXGGMdhIY6QsTmGMiT1WrEs+cNLN2190IsUh9Baupl1TFo/hmTLacV4A2zBuvvukCqJUGneh/4Szv97Ur55tByUn25dogzKM6+qawBjMDCqgbG7h8DdajzCTlPHbFsl0E/dEI6Rrfv0bxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onHTsedjaoBlvBn+J/vUpstY+VCDih7Qq1YmC5BtDYg=;
 b=pmteJ9p2Z9ARseBaBJ+gkDz8cuTY8LFOkajT42OLcabQCBcEjKjUOBOgbYgGVMMjdxbcHdVMUNuJCfHn08HE9LJR3lAHDq28DpjN7oCs4+ZaaKvMGFkFglc0vdtkC0f+y5OaVcsCmAkvtn+z1pKOCYqHSzs8qZKIhQwibaSjYwo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by IA1PR12MB6115.namprd12.prod.outlook.com (2603:10b6:208:3e9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20; Thu, 17 Nov
 2022 12:10:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::7d43:3f30:4caf:7421%7]) with mapi id 15.20.5813.017; Thu, 17 Nov 2022
 12:10:56 +0000
Message-ID: <b2dec9b3-03a7-e7ac-306e-1da024af8982@amd.com>
Date: Thu, 17 Nov 2022 13:10:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Try to address the DMA-buf coherency problem
Content-Language: en-US
To: Tomasz Figa <tfiga@chromium.org>
References: <20221020121316.3946-1-christian.koenig@amd.com>
 <3d7353f3fa5905ce18e5b2d92f758f098189bc5a.camel@pengutronix.de>
 <7f5eff36-6886-bb06-061a-dd4263b61605@gmail.com>
 <f5de84cfe81fee828bbe0d47d379028d28ef6ca6.camel@pengutronix.de>
 <e02cedc2-6741-8813-a7a5-f8769e301745@gmail.com>
 <a53e5df51ec0f2f9d4c2d377c0cc5ba85f2e58ff.camel@ndufresne.ca>
 <9d716641-55c6-1590-26c2-1c3b14a28226@gmail.com>
 <CAPj87rMPkmimR_RJHhxYZokH__TVpPArk0h6drOUSx7Z9+oAHA@mail.gmail.com>
 <11a6f97c-e45f-f24b-8a73-48d5a388a2cc@gmail.com>
 <caf4d6b82843788db97555a58bc9e33915e5b50a.camel@ndufresne.ca>
 <b422be59-4b4b-2d0d-8e8c-b19f27c6832e@gmail.com>
 <4fa4e5d3b1f46e46139bad069cbf5e795e63afa8.camel@pengutronix.de>
 <cc091a11-d012-d998-b7e2-8b3d616867a7@gmail.com>
 <0abc6efddb8dfc1888de15a1bedaaac6688fd078.camel@pengutronix.de>
 <1e2a6750-9849-e9ee-69d6-e4bfdcfb64f3@gmail.com>
 <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAAFQd5B+VHs62M5Wf2L-xOw=_PoaXT+akAySkeZc75HeA3d0jQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|IA1PR12MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: ab4271a7-041a-4e8f-bd37-08dac894c7dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hcru3xPelDXMzqdWgKaFysL4yZoJ69lLNmtfMqvRug1m7mWp3P4VGw9n7qH/dhNiZ+oHR4uFu3n4VCA4Q5VWT/41FQe/ZyGnqHXrGuRy22a0v3FQIj84pGJebvVsmhlC+43P/ZoOmoCXg+Ftelv8wz2RIShF87+Hm8oREx8zNSmqVNPRp3Wz4tcsAUrqlUe0VNo2BN+aI3mO6rmT0bqEDdvCvO877bPY+LFassEP0j50YgZCdbU4Hi/m7F9G3xb+wIlP3+QdaTrEwBZgVRojbt0WAs3Et4tuWEQrGDTmuB8nISPTGTIeA68Ike/eORqCvpniCtljh3t8FYl0ZcXSw53d2tZn07FeXGlYQGkxRGR0AmRIcZ4QuvNHXukKaj6SMvZFKRPomK9oFJXbK+8SnT8ph0Q3HF9owFeYFTXh2irIzIDYTYSGeUSmhoWiEDAMTam9eXmZb6OEroQiSSNGeeR5vRSvSwhwrG2XWr0nrJ0KijgzioergXZyJufuiQxB4vzkRubKqiKlfgDcc/JaKD67GAEckl4X4LTwYHxRYAwZAwpTFPkotFg7bbCtGhamOE1k/KTn64MnlLfPm0wVLEQntEo7Oh2xyU7oPhhG2Z4AiHql3tYwdau8a9lN37xI7hAq118funEFqE5GkEAoEx2s8ufvQOK/57n+/fw3eowBc9gazKbrFm10nzGlds4XJwh0ixw+XBCCBnzyyhecO54KHaTwAgR1amzN+Yd6jhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(451199015)(86362001)(31696002)(36756003)(41300700001)(2616005)(66946007)(66476007)(66556008)(4326008)(8676002)(30864003)(66574015)(186003)(8936002)(7416002)(5660300002)(6666004)(478600001)(6486002)(316002)(6512007)(26005)(6506007)(6916009)(54906003)(53546011)(38100700002)(83380400001)(2906002)(31686004)(66899015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VklGWTBPdjEramYxLzBMK212Zno0WUQ0Q3hwZWg3T1dGNlhtNzZxVU9SVjhz?=
 =?utf-8?B?d2JNdEN2bk5GZTltRTQzRDhYZ2gwNFI4Sm5hbGU4SHcvczZtVkZXU2VqWmll?=
 =?utf-8?B?Q0ZGYnBvaW5ycEVBUE9VcjM3b2MvZDBlQ3ppUWRZQVZ0YW4wc0pQZFBWWXo1?=
 =?utf-8?B?ekVOL3ZxdnREdnFhQkdnYWZINUl2dXJVSWhKQTl4ZStULzZFdVNUT0NWYkNl?=
 =?utf-8?B?a0hWekltWDF2Nmk0VHJseFI2djBGZWErOEE1RWE0dlpaSlk3L0tCNTROR2or?=
 =?utf-8?B?bEE1Q3dRUUU2MC83QmxKWksybE1rNlRYMGlURnlHaE1JNXFvbm9Da3BjdEVt?=
 =?utf-8?B?NE5zODFEU0I5cUlaQWJOYWlnNyt0SjJRNjF4V05BT1U5YzBWQlpoMHptenRC?=
 =?utf-8?B?cUk3SUJucTJuaWp4VGt6bThHNkl0clQvdFBXRzcyKzR6MnNKdStGT29mOUJW?=
 =?utf-8?B?TWM3WWd5VytGbGdGSXBDUEg3Tm9xdWpUMUt1UW9yZXllMlRhOXVJWG9kaUFx?=
 =?utf-8?B?VWFRU1ZjUStxWTFVMGhLNWNITzVYS09CNGdxSTJiUVVkemVvMkp2OU05M21K?=
 =?utf-8?B?TUoyRVliUVJYY3hUeEpoQys0Y3E1YUFINDRIUkZHU0EvUEpGMTVRVW1kNWZi?=
 =?utf-8?B?RnQ4SXprT3BBL3NxZkh4N3VYRlN0dGlUTDBOdXBDVEUwYkNiVCtOYWFYVXBo?=
 =?utf-8?B?VlN0b0ZjSnorM2k0am80OURNOXZST3JTVnhFMFd3UTBId2lzL0h1ellMdDRL?=
 =?utf-8?B?WlY2NkppQ3kyV2tLNmF3enJXczZFeDlkak84KzB0ckdOZExMVEZJZHJhNm5U?=
 =?utf-8?B?cXF0Tm5HRUhHL2p0ZFNhNWJDVFoyNzk2aVJVVUNLVkoyL3pBMUQwZTJzQU1x?=
 =?utf-8?B?WDBrcFp5S1FTYis2U0NKTkVrTFE5NnM5TWVnS3FlZXU0Um9yOVdoYk1hWFVw?=
 =?utf-8?B?TS9ETDNPWCtORmtScDVUaTEyU2ZZUjRleXdkZ282bUw0cEhNK01zNFNHTmtK?=
 =?utf-8?B?RWNKVURMSGJINnFIelNYTE95RjJhdDdRVmhQVEVZcmw4YnNtWGpKaGJFYnJD?=
 =?utf-8?B?M0IzeG02Y2t3cWI4bkhzMUE3QkxaMW1wellJdEhpRmp1SThXWFJLSy9acEVL?=
 =?utf-8?B?Z3Myc243RjFtUEdjdTcvVUt4UTNNNXNYZklKZEsrSXRmeDE1VVhkay9SOSto?=
 =?utf-8?B?WjFBVEY2RDl6WHl5bGtBaDFEMmtyQ1Awc0RMeEUwcUo4ckNCcGxDaXRkcnV2?=
 =?utf-8?B?SUl4R09kdURNencvdHAxNHRHVVJPQVdNRm5yRnRBSC81RGN6KzlHcndUSUgy?=
 =?utf-8?B?ZXM1N1FJTm5PZUZkbFpuMEFueTFmcjZRQkZhTkVNZGc5a2g4a0pGNUpwR3VK?=
 =?utf-8?B?N25TWGdQWEpZb2FJRVlnbUdtMGM2bEk0MTRKT1dKWnh2SmxvVFdIVC95UXhq?=
 =?utf-8?B?UXVkdklsdFdXdFdmcTNaNmJVVjNTdjhOZlpFZEg4Tm96a2Q2M3JCMkg0c1Yr?=
 =?utf-8?B?b3pvU21OeXJXcDRrM25IUHVuMHlBekNtWjBlUS9FQ2pNeTJhZSt3MFFxMVNa?=
 =?utf-8?B?RnhKWHRiMjRKd0RkdThEV2xYN1ZRUkdZSXprUnRKcTBxQVhTMXQyR2c0QXR1?=
 =?utf-8?B?L0FGVGtKRUM1RzZzWG1KWWJIRFMwRkNoR0FpSGZUWGM5UFRjS0p0Y3Y4azdj?=
 =?utf-8?B?NVBwUlRnT3BVZ0d0Y2FWQWxYdnhDdnlMbWZ1bHJ1U1h2Q1ZSeWhpVERUOWFL?=
 =?utf-8?B?Tmpkd2hhMTV6ZnAxUGdMQ3NZaUF0ZkFuOTBNbzJkSnd1TFk0QXUvT1BPa0Z6?=
 =?utf-8?B?T1A0VUVCRXNxZFNOYm1HZ09FczNNbUxUaU9Hd1JQdVNNTWR4b3cxSGU1Rmk0?=
 =?utf-8?B?ejRicElEOWlNaWYwenRkSlhleTJ6SzgwWDluTFIyQ1JIckE0dXcrOTc5ZVI4?=
 =?utf-8?B?SEZRMnlOWktNTms3cWZ6dTNlWFVnSC9mRjVseDZCbmlTVXFDSForRFlOYXZK?=
 =?utf-8?B?NGRCQk96enM5eGdBRVo3d0pNMnVZRU42aE5KRU4rQjF3SmVubE14aWN2Z3Rj?=
 =?utf-8?B?VVprTWtxLzl1aEtFUkFZT3B2WXI2Q0dKaUV6OU9KcFV5VlRiTTIyb3I0ckhu?=
 =?utf-8?Q?iI9Dxj/qXZav4AjmK6IUomflo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4271a7-041a-4e8f-bd37-08dac894c7dd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2022 12:10:56.1665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IPHRm9RUNqSVrP8NMtT89t2fCeXd4sLE5uJUIJJjBUYMrnecubSp5Cq3ywVoydgI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6115
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
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, linaro-mm-sig@lists.linaro.org,
 ppaalanen@gmail.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomasz,

Am 17.11.22 um 10:35 schrieb Tomasz Figa:
> Hi Christian and everyone,
>
> On Thu, Nov 3, 2022 at 4:14 AM Christian König
> <ckoenig.leichtzumerken@gmail.com> wrote:
>> Am 02.11.22 um 18:10 schrieb Lucas Stach:
>>> Am Mittwoch, dem 02.11.2022 um 13:21 +0100 schrieb Christian König:
>>> [SNIP]
>>>> It would just be doing this for the importer and exactly that
>>>> would be bad design because we then have handling for the display driver
>>>> outside of the driver.
>>>>
>>> The driver would have to do those cache maintenance operations if it
>>> directly worked with a non-coherent device. Doing it for the importer
>>> is just doing it for another device, not the one directly managed by
>>> the exporter.
>>>
>>> I really don't see the difference to the other dma-buf ops: in
>>> dma_buf_map_attachment the exporter maps the dma-buf on behalf and into
>>> the address space of the importer. Why would cache maintenance be any
>>> different?
>> The issue here is the explicit ownership transfer.
>>
>> We intentionally decided against that because it breaks tons of use
>> cases and is at least by me and a couple of others seen as generally
>> design failure of the Linux DMA-API.
> First of all, thanks for starting the discussion and sorry for being
> late to the party. May I ask you to keep me on CC for any changes that
> touch the V4L2 videobuf2 framework, as a maintainer of it? I'm okay
> being copied on the entire series, no need to pick the specific
> patches. Thanks in advance.

Sorry for that, I've only added people involved in the previous 
discussion. Going to keep you in the loop.

> I agree that we have some design issues in the current DMA-buf
> framework, but I'd try to approach it a bit differently. Instead of
> focusing on the issues in the current design, could we write down our
> requirements and try to come up with how a correct design would look
> like? (A lot of that has been already mentioned in this thread, but I
> find it quite difficult to follow and it might not be a complete view
> either.)

Well, exactly that's what we disagree on.

As far as I can see the current design of DMA-buf is perfectly capable 
of handling all the requirements.

A brief summary of the requirements with some implementation notes:

1. Device drivers export their memory as it is. E.g. no special handling 
for importers on the exporter side.
     If an importer can't deal with a specific format, layout, caching 
etc... of the data the correct approach is to reject the attachment.
     Those parameters are controlled by userspace and negotiating them 
is explicitly not part of the framework.

2. Accesses of the CPU to a buffer are bracket int begin_cpu_access() 
and end_cpu_access() calls.
     Here we can insert the CPU cache invalidation/flushes as necessary.

3. Accesses of the device HW to a buffer are represented with dma_fence 
objects.
     It's explicitly allowed to have multiple devices access the buffer 
at the same time.

4. Access to the DMA-buf by the HW of an importer is setup by the exporter.
     In other words the exporter provides a bunch of DMA addresses the 
importer should access.
     The importer should not try to come up with those on its own.

> That said, let me address a few aspects already mentioned, to make
> sure that everyone is on the same page.
>
>> DMA-Buf let's the exporter setup the DMA addresses the importer uses to
>> be able to directly decided where a certain operation should go. E.g. we
>> have cases where for example a P2P write doesn't even go to memory, but
>> rather a doorbell BAR to trigger another operation. Throwing in CPU
>> round trips for explicit ownership transfer completely breaks that concept.
> It sounds like we should have a dma_dev_is_coherent_with_dev() which
> accepts two (or an array?) of devices and tells the caller whether the
> devices need explicit ownership transfer.

No, exactly that's the concept I'm pushing back on very hard here.

In other words explicit ownership transfer is not something we would 
want as requirement in the framework, cause otherwise we break tons of 
use cases which require concurrent access to the underlying buffer.

When a device driver needs explicit ownership transfer it's perfectly 
possible to implement this using the dma_fence objects mentioned above. 
E.g. drivers can already look at who is accessing a buffer currently and 
can even grab explicit ownership of it by adding their own dma_fence 
objects.

The only exception is CPU based access, e.g. when something is written 
with the CPU a cache flush might be necessary and when something is read 
with the CPU a cache invalidation might be necessary.

>> So if a device driver uses cached system memory on an architecture which
>> devices which can't access it the right approach is clearly to reject
>> the access.
> I'd like to accent the fact that "requires cache maintenance" != "can't access".

Well that depends. As said above the exporter exports the buffer as it 
was allocated.

If that means the the exporter provides a piece of memory which requires 
CPU cache snooping to access correctly then the best thing we can do is 
to prevent an importer which can't do this from attaching.

We do have the system and CMA dma-buf heap for cases where a device 
driver which wants to access the buffer with caches enabled. So this is 
not a limitation in functionality, it's just a matter of correctly using it.

>> What we can do is to reverse the role of the exporter and importer and
>> let the device which needs uncached memory take control. This way this
>> device can insert operations as needed, e.g. flush read caches or
>> invalidate write caches.
>>
> (Putting aside the cases when the access is really impossible at all.)
> Correct me if I'm wrong, but isn't that because we don't have a proper
> hook for the importer to tell the DMA-buf framework to prepare the
> buffer for its access?

No, we do have the explicit begin_cpu_access() and end_cpu_access() 
calls which are even exporter to userspace through IOCTLs for this.

The problem is that in this particular case the exporter provides the 
buffer as is, e.g. with dirty CPU caches. And the importer can't deal 
with that.

Either reverting the roles of the importer or exporter or switching over 
to the common DMA-heaps implementation for the buffer would solve that.

>> It's the job of the higher level to prepare the buffer a device work
>> with, not the one of the lower level.
> What are higher and lower levels here?

The MM as higher level and the DMA mapping framework as lower level.

>
> As per the existing design of the DMA mapping framework, the framework
> handles the system DMA architecture details and DMA master drivers
> take care of invoking the right DMA mapping operations around the DMA
> accesses. This makes sense to me, as DMA master drivers have no idea
> about the specific SoCs or buses they're plugged into, while the DMA
> mapping framework has no idea when the DMA accesses are taking place.

Yeah and exactly that's a bit problematic. In an ideal world device 
drivers wouldn't see memory they can't access in the first place.

For example what we currently do is the following:
1. get_user_pages() grabs a reference to the pages we want to DMA to/from.
2. DMA mapping framework is called by the driver to create an sg-table.
3. The DMA mapping framework sees that this won't work and inserts 
bounce buffers.
4. The driver does the DMA to the bounce buffers instead.
5. The DMA mapping framework copies the data to the real location.

This is highly problematic since it removes the control of what happens 
here. E.g. drivers can't prevent using bounce buffers when they need 
coherent access for DMA-buf for example.

What we should have instead is that bounce buffers are applied at a 
higher level, for example by get_user_pages() or more general in the MM.

>> In other words in a proper design the higher level would prepare the
>> memory in a way the device driver can work with it, not the other way
>> around.
>>
>> When a device driver gets memory it can't work with the correct response
>> is to throw an error and bubble that up into a layer where it can be
>> handled gracefully.
>>
>> For example instead of using bounce buffers under the hood the DMA layer
>> the MM should make sure that when you call read() with O_DIRECT that the
>> pages in question are accessible by the device.
>>
> I tend to agree with you if it's about a costly software "emulation"
> like bounce buffers, but cache maintenance is a hardware feature
> existing there by default and it's often much cheaper to operate on
> cached memory and synchronize the caches rather than have everything
> in uncached (or write-combined) memory.

Well that we should have proper cache maintenance is really not the 
question. The question is where to do that?

E.g. in the DMA-mapping framework which as far as I can see should only 
take care of translating addresses.

Or the higher level (get_user_pages() is just one example of that) which 
says ok device X wants to access memory Y I need to make sure that 
caches are flushed/invalidated.

>>> It's a use-case that is working fine today with many devices (e.g. network
>>> adapters) in the ARM world, exactly because the architecture specific
>>> implementation of the DMA API inserts the cache maintenance operations
>>> on buffer ownership transfer.
>> Yeah, I'm perfectly aware of that. The problem is that exactly that
>> design totally breaks GPUs on Xen DOM0 for example.
>>
>> And Xen is just one example, I can certainly say from experience that
>> this design was a really really bad idea because it favors just one use
>> case while making other use cases practically impossible if not really
>> hard to implement.
> Sorry, I haven't worked with Xen. Could you elaborate what's the
> problem that this introduces for it?

That's a bit longer topic. The AMD XEN devs are already working on this 
as far as I know. I can ping internally how far they got with sending 
the patches out to avoid this problem.

Thanks for the input,
Christian.

>
> Best regards,
> Tomasz

