Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1145213E5
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 13:36:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A481410F81E;
	Tue, 10 May 2022 11:35:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AC6D10F4B7
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 11:35:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oXGHDiCDcYNi01kpStsKBeur6Y8J7i+e59NY/08widh6QZVsL3cBpugOCTZQfuF+QZyBX37A6MaYodxVVgxJAqB7AyUmfAO/sXbyi4NIVlhkRL170+RUF/Yp6S12KTuhIav5kFARYTShThy2DMRZMhFX2CF1FwoG2InwzgccWSe8Nd4P3LjbRMxKa+It06aoNXY4Foq+c9Y2O7zn1fzVeNOnKRQgjLv30NQRP8W25PD3Pv/uvPTBiuCmZK/erxYblbCDngNC4nqIwrCQgfJA72l7TLYo1RJ2yE/RzOhyJtik4hBW/bQxgCFxQYlopddsA4BVD52EkVtbqbtDhAEI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p/VqmbfIv8uF9TwRjY50FQbA1EERe8Jo8jBpqS3n2aU=;
 b=nRTs0SVrAcjiiHHe9uTiAT+iMQwfpvujo3iNXt/phfurd5oIA4CxdVZ93UIBX5XUDIyVGxbD+ghCQSIHB3lAtvZMvwK1GubH7PZU9Z3x6Poqn2zOMr3uTTK3L2JsF2RzLVX0+IsIBIxc3mLhOyqRx36rvl4khTjkKtdmNwdRkO1kBrRd5w0kdzkN8NGrEEKbb2pfxY8MczzZwsqk6qE/E40AdhWk66jHzdoNqJLyPv8METT9Em2h4HWB0Rc4VjQ0d0tKjgqVPlzkVQ2mmSYdNNkNh31Aa2nSG9HmbEmXXxj1w4inLb1px9wx19XsB9K4/wi4a7EBZlmQItUQtOhK/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p/VqmbfIv8uF9TwRjY50FQbA1EERe8Jo8jBpqS3n2aU=;
 b=K0nU/mpZipCKxqVa1JeXHHdP6UNZd/W3RxygGr6louF9QSt9wbhSuotSVIW8yroAouz2LuwNTl265ih3wZsF7zOQf04ITON6XJ3wBI++ijNfmCjYVUn34U/LAKDBTZ0+Ob7ZiwV5Wt2o+JhsmEmV7DqBejqh5OvJwS18HsLL4ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA1PR12MB5670.namprd12.prod.outlook.com (2603:10b6:806:239::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 11:35:53 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 11:35:47 +0000
Message-ID: <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
Date: Tue, 10 May 2022 13:35:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>,
 Charan Teja Kalla <quic_charante@quicinc.com>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
 <YnpF1XP1tH83uBlM@kroah.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <YnpF1XP1tH83uBlM@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM6PR04CA0067.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::44) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7042011e-6575-4b99-f87c-08da327939fa
X-MS-TrafficTypeDiagnostic: SA1PR12MB5670:EE_
X-Microsoft-Antispam-PRVS: <SA1PR12MB56705C0EC51F394838C0A45B83C99@SA1PR12MB5670.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q14cdPZCaA02uxq+KqyhgYFJKphT7esa8zaACW7WEcKhbkTElTNycgFYoY/QSDGYcU/iKvOB4JSWkVoVJYocPIDoG+2L4FTID/USr7ceQ4fOc6NqNnB6KUa9Ob8mig0CqE+HZdxuxZgq1qyKkb8Xa9OdOchT63e3H1YfOT/lde8vDYHuTIdUWOeiJWumlxZSk1qV6pzHK0DuP9HiRhCF+L3U27KX462OlUHFOrEaxflrC03BWv+ljwfAD4SSRSvySP8LthIu2AJpcnpu2NAOSdjHEhn3Vf7nc7N2Ymf6M+jg3FlQJGPhYjpJasl5f1xS0runciLuZhtqo8ReS4ftbzmTEve2imBAMzTGNUxblq33DV/7+t7JEok/JPRvHjSgatFOd7mwyw48Y3yS9Kdwl4GmGxtXwayRtEeV4F11fJaSK7d0bmYzzm/8iXTi5QT0Jw02ACntDlTxq3vMIAoyFZyO38Kf/THhK4S9sGMjWAuNg+bKf+IssXEv8biK9xUz7iNSanTP2JyGdQ2/AKob3Ie6nsSBpz1b1zFqE4IgvLMG1RksGCxKy7KaqJJXp9pEjrGMrBLFhV4o+0ZTou7gHd6S8CAupGbt7dM9pFFPhX+rp6Vkb6PFCoaRRMaP+T0slC9sCVdMtxdr/zqtCX0XgpKRKS+KStVQls1eScWcVu5XEYhgJWbixFdxd4b7xg2/UZVQPlPQgPhHzOLAiDq7Lq8mYls0lPT6tzLytX8Pid3/2I54btHg2lCNfTt/5S2a
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(508600001)(36756003)(186003)(66476007)(31686004)(8676002)(6512007)(110136005)(66946007)(66556008)(2906002)(6666004)(83380400001)(316002)(31696002)(4326008)(86362001)(2616005)(6506007)(5660300002)(6486002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmFvbzJHOUxiYWNaT1R1bHYwT1dreHZSSDFUdTVOdGRNRHBYSzRMREdDVTRk?=
 =?utf-8?B?NDhKTjREL1Y3ZmZpTUk5aG9QRTVkVUgvZG52VHBkQ2pyTkhKbTBDc3JxVzNH?=
 =?utf-8?B?N25tZnFCRllxcHhhRkJWK1NyOG1wYUpPYUlneEx4N0VNSDlUNHNhclY1QW9D?=
 =?utf-8?B?eVhqMURXdGdheUFvdHhCbjdDY0Mxc1pVU0tzMVlNaGNsWjlXazZkVWNCN3Nr?=
 =?utf-8?B?WEp0dXpBRVkxdXFlVU9sVDlDczNKbHMzN29zME1MbHExOHpYL3VZNlg5Mm4z?=
 =?utf-8?B?L3FoNURtQ0h1TmdGbjJJaUtQN3J2U215K1UvZENZSDVhMDJOdzk5cWdnaGdu?=
 =?utf-8?B?L0Q1UXhDbnJZUWxQWGhSTkRaRXp3QUliUnVEY3p4QkhUdnE3UG14bzVXbDNa?=
 =?utf-8?B?YkpWd09YeVcxU2p4dnZxL25oUHJtVDVkYUViMUd6M0c2VFpQaWswT0dzUWgy?=
 =?utf-8?B?SjUwcnZ0UVJiT1VnVVdDMk9wVG53dWJrNTVhWDdSUGg1QXVkRmtIWEVrUFBF?=
 =?utf-8?B?OFQrbmlrRWoxR0xtVzV1QndvTDZVTEtSUElLV054ZmhIekVDLytHNGZESGdX?=
 =?utf-8?B?WVZzZHdpeTI3VVlHVCtWUU5ub3N0dXAwYXgyaUxpUlMwZVZlSTdCTTdIcE9r?=
 =?utf-8?B?cXVWUXVwczRtZUN6NThsTXNIa1lzclQwU00rS1JVc0ErNytMcTRSdXlQMHdY?=
 =?utf-8?B?TDVmaGNudGxVYWU3Y2tQNDVXNEdjUlBzL3BPWHc4cHFwWGJndVA0K1RrUjRT?=
 =?utf-8?B?eXdtcTNCT3hZM3VvZXR2bUpxUWdaRmpBeGRrUEJPalByV2dRWk8xS3NKc05Q?=
 =?utf-8?B?THZtd0ZlK0JTZkN6cW9ubHRKL0dIMkRkUUI2RkZlNVhLSDhibTdNeXBnRWRm?=
 =?utf-8?B?ZWRtdFZ6S2YwU3JDVzhwQlNrT3QyUExRcWpUUGVhcUYvSjlyUi9vWXROTXJ5?=
 =?utf-8?B?VkNXUWp5akJBYTRrVFZ3cUlmbVU4bDUwWXJSL1VydE1ZUFlPcFRhRVJtRFBu?=
 =?utf-8?B?THNmbEpWcFZ1aldIU2k3bFJiSkNPaVgwdlUxNUdjV05lc3FjVy9Ya210WW5v?=
 =?utf-8?B?aS9HU0Vna2ErTkNlNElYY1pYN2U3RVpCZkF2SjRpTktPdDlJaTNlTkJpdm5B?=
 =?utf-8?B?OXlOSFlXUldQRFpSdVNVZU5LS3ZUKzZpWVpRTm9WK2x3LzFFNm9Nam1pZW9k?=
 =?utf-8?B?L3lCZFgzVmUyUVd0Q0pFTysya0ZRenozN0hTUmFDSFVqbzZUSzYwY2gwLzFh?=
 =?utf-8?B?U0p4cHV1WXk5eEtTM2ovd09kSnBuc3I3TXZIRG9UZERXMUhEU2lvQmxjUWha?=
 =?utf-8?B?NUtQT0VmdEtLRmdmdHZacFpjWDFtS0pGdDAvS25wZG9JVm0ySWpjek9NaXI2?=
 =?utf-8?B?clZVcVRWMVRhVlVoZE5pVEh6UlFITDI0cmtJWFF4UWJQUmhzODdqcmFUWTNu?=
 =?utf-8?B?UGxuRmJ4TlNzMVlrSlMweC90c0ZGSWpDR2cvZHFvd1ZQdVFSQnBXYmdmNEgx?=
 =?utf-8?B?WmpFRDljUXpMN2taMSsrUWVoY3lTUzRVdGROc2piUW9KNXk0VHBFSnRld0xi?=
 =?utf-8?B?dmtTK2hyS21BWUVGY1VMWmxVYlRhYndxNUowT2FVV29nRVZTYnVJMllWaWJs?=
 =?utf-8?B?TFVrTGNma2grbWtnTFFOV0hVVm9LemdMeHZFMGlkbnlqMWl6S0FRYy95Z3lP?=
 =?utf-8?B?cXR6ZlV3RVRVcEE3a0J0YXgwb01NZmRycUYyRnowWUg1a09abHhGcUdMYnh3?=
 =?utf-8?B?UjdLaEhMa2haTGZpc202OHVkWGZidHBMSng0SjhzYnVoWUhZWDE0RU9HK0VL?=
 =?utf-8?B?SWo3a0c4WUthR0VuMzV6a3NYbFpnekpIYUQ0am1LRGdhWWNLbDZ3MGpvaGZS?=
 =?utf-8?B?c3hZMlhPbHJzclZNcXlTVDlLKzFOb1lKKytQVWRFT1RXeGRMY3QxejFLY1Jo?=
 =?utf-8?B?U3lQNmtPaUM1ZXo0UTRpRjBiUmVBbnRIS2JVMndWYW56K2tZNlhwemFXUU1P?=
 =?utf-8?B?MTRoR25zQnF1YUhYMDFUUS9jYnM0UktpV3NLWFJsNTgvcTJBbmMzNW52SFF2?=
 =?utf-8?B?bllmZVFYblAxbktodGdvcGFjbWlqQVFoVWNHVzRwb1hhdno0dmpERzFPcFlv?=
 =?utf-8?B?c0R2a2dCNzlPQTNWajRVcE9NS0ZnSTVwRXh1NC9ncmVQR1dDZ2M4eWp2Vk5i?=
 =?utf-8?B?RXQrZUJGY1N0RXVVRldrUUxzT1l1L0RPcERqVU1MNnRLZm5PTHdTVHVwbHht?=
 =?utf-8?B?czExcDlONnp3eWQwcXJ4VTNUQWx4VnB4NXNVeUEvNGxucCtDbURRMkhjRzBC?=
 =?utf-8?B?SUw4YTI1a2dIcTRqS295Wmh0TDhaQXdUcEh2d29GenROeFR4ZUlIdy9IZzZO?=
 =?utf-8?Q?9YtpSvUOCBvkQk2+1vioqLMl4y2HQXf+GBM+BCS8WV6b5?=
X-MS-Exchange-AntiSpam-MessageData-1: jssV32FFSXOlsg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7042011e-6575-4b99-f87c-08da327939fa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 11:35:47.3401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fd/valNhsT1AyL1fYB1DiLNx37O0/jJ4IYTwya1Xa41VgHWotnpybWyAJdpEO2jw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB5670
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.22 um 13:00 schrieb Greg KH:
> On Tue, May 10, 2022 at 03:53:32PM +0530, Charan Teja Kalla wrote:
>> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
>> alloc_anon_inode()) to get an inode number and uses the same as a
>> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
>> used to collect the dmabuf stats and it is created through
>> dma_buf_stats_setup(). At current, failure to create this directory
>> entry can make the dma_buf_export() to fail.
>>
>> Now, as the get_next_ino() can definitely give a repetitive inode no
>> causing the directory entry creation to fail with -EEXIST. This is a
>> problem on the systems where dmabuf stats functionality is enabled on
>> the production builds can make the dma_buf_export(), though the dmabuf
>> memory is allocated successfully, to fail just because it couldn't
>> create stats entry.
> Then maybe we should not fail the creation path of the kobject fails to
> be created?  It's just for debugging, it should be fine if the creation
> of it isn't there.

Well if it's just for debugging then it should be under debugfs and not 
sysfs.

>> This issue we are able to see on the snapdragon system within 13 days
>> where there already exists a directory with inode no "122602" so
>> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
>> the same directory entry.
>>
>> To make the directory entry as unique, append the inode creation time to
>> the inode. With this change the stats directory entries will be in the
>> format of: /sys/kernel/dmabuf/buffers/<inode no>-<inode creation time in
>> secs>.
> As you are changing the format here, shouldn't the Documentation/ABI/
> entry for this also be changed?

As far as I can see that is even an UAPI break, not sure if we can allow 
that.

> And what's to keep the seconds field from also being the same?

Well exporting two DMA-bufs with the same ino in the same nanosecond 
should be basically impossible, but I would rather opt for using a 64bit 
atomic in that function.

This should be 100% UAPI compatible and even if we manage to create one 
buffer ever ns we need ~500years to wrap around.

Regards,
Christian.

>
> thanks,
>
> greg k-h

