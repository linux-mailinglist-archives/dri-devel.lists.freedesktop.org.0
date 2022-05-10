Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B17521DCF
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 17:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D2210E3A6;
	Tue, 10 May 2022 15:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2080.outbound.protection.outlook.com [40.107.92.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4BE10E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 15:12:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AfdM13oNNvRX6UFVlZvlCgp6deHWGohtymApbgGknZUPLSXvukamKghFUR3CuaSuvhOvW26bsatDdDyX54mqE+kKrYZtV2nrQacjHKY/GYuo3bFFBzY8NDqro7nNEquCk5IynA5eoY7y2VAKbhGmdLd0EuTYM8e+pnFyH1CcJJIjw3KUZ68MTkf1wv3lR8Yd9QsBnwQadJBSzQJOvHuj2kKz3ZbgVBgQTsIDadlpiA1D6NMBikUCd0yzvNc89JzxtJY3MiyMPuvsBOZy2Lv/4iV26CSTJyWMFsBKc5JrfprRmts4d3MGn32OCmD7KqW2lXp8k/62avTJnoXrRJtA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5wjyK0zD8rRrMy/cRpcVvevQKwTPeRJ2bVwZXMmB1TE=;
 b=FZuiwBXkZVOA6ka/WK+NqCovwvo9dbQz+ybCzBZX1c+ar1j2vRxlGjxG9CyRjQS4vz1K/IqnaWcBiatEV+JIxaSRgQp5L/5NYP32UeiwZP8/bDzN0QVndTZehKz3WQClabIGvgMgKk4BzPCmT5WhPzP/N5UVDS3PJH9iP/+VFwRc6guqaXvNNnSPBJfNtJjVQgS346j39TQvptgtvKecC8qewV05pQLtC5Lv2Pnsgn/+oHqeiSBr7pgMteP0UgNGlJ5sw0t7ApOaojDwHaYiMMW9MNwktu6ax5L7xlHSBLmZMGOwLf54TS4TRdNeafMEGoCC+L5wsEGKOesUSh/hBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5wjyK0zD8rRrMy/cRpcVvevQKwTPeRJ2bVwZXMmB1TE=;
 b=Dp3z1B4yWLLvVJf4iZNHmeLMlSeWm+nsNVKRRQ90wk1rCUTDzOsnAuBzgAuMu5PWnHgDcXGjfAa+9eGeZsZ8rXsQbFvsvYcVY4tfXbnwmXUM0wb416CSazbiYcQBBtUe9VlpxWgWUgRQtYL9LW8Q73vTa01VOxMW5JPmZ/E4VXg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS0PR12MB6440.namprd12.prod.outlook.com (2603:10b6:8:c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Tue, 10 May
 2022 15:12:14 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 15:12:14 +0000
Message-ID: <4ac55be2-7d55-2c3b-0d5e-f61c02c62792@amd.com>
Date: Tue, 10 May 2022 17:12:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 gregkh@linuxfoundation.org, sumit.semwal@linaro.org, hridya@google.com,
 daniel.vetter@ffwll.ch, tjmercier@google.com
References: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <1652191562-18700-1-git-send-email-quic_charante@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:20b:488::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62146b42-0bfb-476e-6c68-08da329776a3
X-MS-TrafficTypeDiagnostic: DS0PR12MB6440:EE_
X-Microsoft-Antispam-PRVS: <DS0PR12MB64404585254F99902C7D1C1D83C99@DS0PR12MB6440.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CtwT7iiUByDeKbrVzvF/782xnuKz6SjgeOeA77U7/Muei9ilwvIcrvZm4Oje+39or18W4VhlA/K9AJdO2LbThPM1puen/E9mNzUaPFiMOyQBZFY1cKI+Ei7h5eA4ASgxJQDCtaUcYMLFY+JVZqPcMdkD3usi3gbWWfb86cR5V0H7pNM52+Lu7nsV1BYx2Vtuldq5RO/IApycFwRPkW5cBQ2jzKYc3pm93qwjmO/rFbxix3bavC3+D4rLoOTFw65QWttBhUuLnidoTyR9F8OhDFRdAOQdKIs1bZ93VFWMWKrhc1+B76rC4k9vSKCxXzHo4fEj6vX7e3h9Pn2yd6MuJYsxXKwbwTGZ15/knjZyUNGgD/j1NNTU7KPOSl6t2Qpaw5MJliMOJaXQoA16HPzgjaUhnz0gdJF7iaX5HEy1B7upcHhG/TiUXLgdSES/SnR/sGRq6HsbdUq6Z7KZEAXWXtRRPvhznFSULQHxanwutgyqf7xGYMi87rI6kM8NLJwRs4bUxiXIK2mO+A90I1k42mdqqfBEg1J3tiGh3NOkjUXqU1G6DNA1Sch5nNQi+tnO0drKS1ZWuUpfM89MY15gov0c6Fd+SCQPxB/UtznIuPrZxuzI4ZLLRMO7amkDVtuKN61xj90alVFQaRkuptd663GF11qRjbqe4/bdML1uzjKLDYqZutvLQCdAKqHY3AH3m1VJ3K3IJf4vj4rlHPRIbhtOg1FwmXShtyEhDrB3G92bJTpuRP8uEoESYLuOiYBVb+5HNWOPXX5yZ6E7giqse0njBIRkO295zL4ESA6CrsaCVJg1uCeJcsMyPsMTLJobXIoQ+EbWPKjH9gqdcAJI0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(966005)(6486002)(31696002)(86362001)(8936002)(7416002)(5660300002)(508600001)(83380400001)(6512007)(38100700002)(2616005)(6506007)(186003)(316002)(36756003)(31686004)(66556008)(4326008)(8676002)(66946007)(66476007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1NBbWpRa1ZUQXVzdXVLTjZlZkxuQk5BaSthczBOVGxGRUs2QklURS9MU1g4?=
 =?utf-8?B?VUVIZUNZb3QvaGg0enpPUy9mNitCa0VoSjdWU291VG5NOVRlQzFmN2xONXpU?=
 =?utf-8?B?RjErM1czSS9JM3ZyQXZBeHNhdlc0UFlKVG9oQkJCWHUxeDNKY3ByUTRhVVZ4?=
 =?utf-8?B?TllPeUZVdnd6YVF5V3pmWExOSFN4UG04citxMDJpM2xhRXlXdXc5dCtZRWwr?=
 =?utf-8?B?dEhETDFRdmN0c3cvNXBzTGNOOGtTU3ZDVDFJYzMvU0ViNHJ6b1dRcHUrUEJj?=
 =?utf-8?B?UjZIL3U5ODR0Q0RmV3ZJKzlLYStMenh1WlZRV242Zlh1OTZxRHI5NkJGZzlW?=
 =?utf-8?B?SFdGRE1wNS9PRDNkeE9IUGhKMEdSdjhCcHR6NTF5Q0tOMVZyMnRZVEdyZU9k?=
 =?utf-8?B?R1VaL1FWNTEvMWdhaUh2akFqQUhnSXVGOTlucGpQMnVIVUR4TUl1Y2t2K3U1?=
 =?utf-8?B?dGhpcmM5UUFSNFBMdzdsWFJ3NWRvTExRbzNoRDhSYitXZWdxVGkzdzhuc2Js?=
 =?utf-8?B?U0JjUnpSeUZPTzR1SStZblc2RWlZeXZTMjdTMEk5SnpvZHQrUVh1bG8rWGxu?=
 =?utf-8?B?STFPU1VVNEwwZHZ0M0E2TUlpRUM1c0FKWUp1Ym5YNTh1S1kzZEN1WlE3N21H?=
 =?utf-8?B?UVhIdkdwS3hLM1F4a2xyWU5rMXhjZ3VLSXZkSHhwbklyakRxVno1Rzk0RVR0?=
 =?utf-8?B?RWpwUUZvTFlFaklLUHZ0SFpuVlpJTFJlc0dRWHpPYzFxRG5BWE9iM1NsYlVR?=
 =?utf-8?B?VVNkeElQdGJJNDJhYk01MnFLRWx2NFVqNzNwL3oyaXUvSjdTdEhDOUFCQXRW?=
 =?utf-8?B?Qit1UWpPQWdYMHh0Nk1pcXl5MDNoRG8zSFBsYkV1ajQ1Ykk0QmJ3YWpUV1Rn?=
 =?utf-8?B?Qm0zaHlTYWVKSURoeVlYL0FBMFFNaTY0SmwyNzNRMXRTd0xxQUFCK1dvU3VD?=
 =?utf-8?B?eHlCZlUrOFdoeEs2S0ozU2RhOW1wcUVobFA0OWlRRjRFSTA5UnlPS0dheTlG?=
 =?utf-8?B?QUhENWh3K1FFZzdFSDRaNzNqa093ajdXNnpGSW85RXhUQlBOZlltajg3WjR3?=
 =?utf-8?B?RktHbWk0NEVaOEtGZnFicnlGZ0V3YWg5OHNSbnhONk5Vd1ByWUd5elUxRkFG?=
 =?utf-8?B?MXdLT0Zqa0JxSS95RnVJemtFT3J5NXg0dmd0d2p5SC9GVEcwNmpqVXc2ekRq?=
 =?utf-8?B?anVXRFZpSHpzNUsrOWZZK3Rnb0pvaGR0MVlxNy96VnpqMDBLcUdkNGVHK0gy?=
 =?utf-8?B?QVkxS05pc1Vpck5XK0ZDOVEvOVlvMDlDYjd3OFZrMDNDdkRJMmtDcDYvN2FM?=
 =?utf-8?B?QWRWU2c0bFBQZXd2c2lKWVNCQVJtYXpIZGEzTy9leTh4Y3RGWVBpMWljUTZ4?=
 =?utf-8?B?MDlWN2VPNkpHNjE4cEZSTU5VM0MrbXlvSWl1czN6Q2tDZnlGR3hHOXlDNUw5?=
 =?utf-8?B?WHRLNUFaNnR4Q1krTVQyOHdNZ1dJN3VsUjhZT215V3lINmt5cm9KT3BldzZt?=
 =?utf-8?B?NWhIUTQ2ZVNQRWNWMEZ0K0ZYZXJ0bGEvM1pxTnNVNlJkLytEbU94cjY1TlhI?=
 =?utf-8?B?VkV4eEE1MTRrQzE5MFBHWUtsWG5wQTVObHNYN0RXbnFXZTZCN0hVZDg3MmlY?=
 =?utf-8?B?SS9mWVhxY0FNYjlQMzBuVko3NXZwYWphUFdvaDR5clF0NkM5bU9TYlMzMjA0?=
 =?utf-8?B?SFRZVlNRdFQ0cStkcUZIVTNUNUFlL0xtUjNrWjFUZU4ya2dad1l2cHNndXNJ?=
 =?utf-8?B?ZG5QYmE5MExxWTd0ZzF5amRmYXlBbThmVWpZOUw3Y0xzUmVldzEreE5CQm1n?=
 =?utf-8?B?NWMzbmcvZUdvZkYxY1RKNkV1V1VoNzNZNythM0RnSmJ3MFU3UEJsbzltNFVr?=
 =?utf-8?B?bnJSbDdmZDRpSFNqeUdndUJnVlFmc0tva3ZuRGpuWTJyQSs0aWQxY0tNSmh4?=
 =?utf-8?B?d1RCemM1WjlzbzNYU2JzWnV1clMwTnpVZDR4dDdqZTdzVWhOQ216bEpNSmlP?=
 =?utf-8?B?UFhuQjF2U2JhOFJJNS81azN6MkNSRWxORUJpL0k5QWYyOUhZSTlCdFBuNENj?=
 =?utf-8?B?eU56eHU4VkY2YXFnZXBESjg1WDBuUzNBS1o0QmZRVFIwK3o2c3V1LzdrazhP?=
 =?utf-8?B?bmR3RUtMNXR1VkZGQjEyOUpqaGdibXhoT29nUkp6d3cxUlpISWc1UGYzcEhR?=
 =?utf-8?B?NDF4b1VoWjA2Ny9uckovVlZMQTVZZVgzaEZwVTJBbDAyWXlJUENxc3dTWWxp?=
 =?utf-8?B?VEVPdjF0QXdDSlVXR2pYbUVKK0Y0akl6VXJDaGJScUtoeURJMllSWHlKNXlq?=
 =?utf-8?B?V1E2dEswNTJwbUNwaWlMd3hUcDcrNXE4RDNRTEtuU2hVa2NNSGFlVjV4Ujho?=
 =?utf-8?Q?jg00R3tRW4FgRv2nuwDQpRCcOB5nZAqIp8so9VVowH30K?=
X-MS-Exchange-AntiSpam-MessageData-1: MPagDzIZk9BR7Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62146b42-0bfb-476e-6c68-08da329776a3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 15:12:13.9624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I0qPe8r5o7FmAJUKn/yJlrGCcqGk5nqonYSqFf+xH3gWbg22CCV2BXI7qrFIesOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6440
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
Cc: linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.05.22 um 16:06 schrieb Charan Teja Kalla:
> The dmabuf file uses get_next_ino()(through dma_buf_getfile() ->
> alloc_anon_inode()) to get an inode number and uses the same as a
> directory name under /sys/kernel/dmabuf/buffers/<ino>. This directory is
> used to collect the dmabuf stats and it is created through
> dma_buf_stats_setup(). At current, failure to create this directory
> entry can make the dma_buf_export() to fail.
>
> Now, as the get_next_ino() can definitely give a repetitive inode no
> causing the directory entry creation to fail with -EEXIST. This is a
> problem on the systems where dmabuf stats functionality is enabled on
> the production builds can make the dma_buf_export(), though the dmabuf
> memory is allocated successfully, to fail just because it couldn't
> create stats entry.
>
> This issue we are able to see on the snapdragon system within 13 days
> where there already exists a directory with inode no "122602" so
> dma_buf_stats_setup() failed with -EEXIST as it is trying to create
> the same directory entry.
>
> To make the directory entry as unique, append the unique_id for every
> inode. With this change the stats directory entries will be in the
> format of: /sys/kernel/dmabuf/buffers/<inode_number-unique_id>.
>
> Signed-off-by: Charan Teja Kalla <quic_charante@quicinc.com>
> ---
> Changes in V2:
>    -- Used the atomic64_t variable to generate a unique_id to be appended to inode
>       to have an unique directory with name <inode_number-unique_id> -- Suggested by christian
>    -- Updated the ABI documentation -- Identified by Greg.
>    -- Massaged the commit log.
>
> Changes in V1:
>    -- Used the inode->i_ctime->tv_secs as an id appended to inode to create the
>       unique directory with name <inode_number-time_in_secs>.
>    -- https://lore.kernel.org/all/1652178212-22383-1-git-send-email-quic_charante@quicinc.com/
>
>   Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers | 10 +++++-----
>   drivers/dma-buf/Kconfig                               |  6 +++---
>   drivers/dma-buf/dma-buf-sysfs-stats.c                 |  8 +++++---
>   3 files changed, 13 insertions(+), 11 deletions(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> index 5d3bc99..9fffbd3 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> +++ b/Documentation/ABI/testing/sysfs-kernel-dmabuf-buffers
> @@ -4,19 +4,19 @@ KernelVersion:	v5.13
>   Contact:	Hridya Valsaraju <hridya@google.com>
>   Description:	The /sys/kernel/dmabuf/buffers directory contains a
>   		snapshot of the internal state of every DMA-BUF.
> -		/sys/kernel/dmabuf/buffers/<inode_number> will contain the
> -		statistics for the DMA-BUF with the unique inode number
> -		<inode_number>
> +		/sys/kernel/dmabuf/buffers/<inode_number-unique_id> will
> +		contain the statistics for the DMA-BUF with the unique
> +		pair <inode_number-unique_id>
>   Users:		kernel memory tuning/debugging tools
>   
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name
> +What:		/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/exporter_name
>   Date:		May 2021
>   KernelVersion:	v5.13
>   Contact:	Hridya Valsaraju <hridya@google.com>
>   Description:	This file is read-only and contains the name of the exporter of
>   		the DMA-BUF.
>   
> -What:		/sys/kernel/dmabuf/buffers/<inode_number>/size
> +What:		/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/size
>   Date:		May 2021
>   KernelVersion:	v5.13
>   Contact:	Hridya Valsaraju <hridya@google.com>
> diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
> index 541efe0..5bcbdb1 100644
> --- a/drivers/dma-buf/Kconfig
> +++ b/drivers/dma-buf/Kconfig
> @@ -81,9 +81,9 @@ menuconfig DMABUF_SYSFS_STATS
>   	   Choose this option to enable DMA-BUF sysfs statistics
>   	   in location /sys/kernel/dmabuf/buffers.
>   
> -	   /sys/kernel/dmabuf/buffers/<inode_number> will contain
> -	   statistics for the DMA-BUF with the unique inode number
> -	   <inode_number>.
> +	   /sys/kernel/dmabuf/buffers/<inode_number-unique_id> will contain
> +	   statistics for the DMA-BUF with the unique pair
> +	   <inode_number-unique_id>.
>   
>   source "drivers/dma-buf/heaps/Kconfig"
>   
> diff --git a/drivers/dma-buf/dma-buf-sysfs-stats.c b/drivers/dma-buf/dma-buf-sysfs-stats.c
> index 2bba0ba..29e9e23 100644
> --- a/drivers/dma-buf/dma-buf-sysfs-stats.c
> +++ b/drivers/dma-buf/dma-buf-sysfs-stats.c
> @@ -38,8 +38,8 @@
>    *
>    * The following stats are exposed by the interface:
>    *
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/exporter_name``
> - * * ``/sys/kernel/dmabuf/buffers/<inode_number>/size``
> + * * ``/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/exporter_name``
> + * * ``/sys/kernel/dmabuf/buffers/<inode_number-unique_id>/size``
>    *
>    * The information in the interface can also be used to derive per-exporter
>    * statistics. The data from the interface can be gathered on error conditions
> @@ -172,6 +172,7 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   {
>   	struct dma_buf_sysfs_entry *sysfs_entry;
>   	int ret;
> +	static atomic64_t unique_id = ATOMIC_INIT(0);

Please move that to the beginning of the declarations.

>   
>   	if (!dmabuf || !dmabuf->file)
>   		return -EINVAL;
> @@ -192,7 +193,8 @@ int dma_buf_stats_setup(struct dma_buf *dmabuf)
>   
>   	/* create the directory for buffer stats */
>   	ret = kobject_init_and_add(&sysfs_entry->kobj, &dma_buf_ktype, NULL,
> -				   "%lu", file_inode(dmabuf->file)->i_ino);
> +				   "%lu-%lu", file_inode(dmabuf->file)->i_ino,

Why not just use the unique value here? Or is the inode number necessary 
for something?

Regards,
Christian.

> +				   atomic64_add_return(1, &unique_id));
>   	if (ret)
>   		goto err_sysfs_dmabuf;
>   

