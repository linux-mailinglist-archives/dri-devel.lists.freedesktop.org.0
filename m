Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A3165D0AC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB4610E069;
	Wed,  4 Jan 2023 10:31:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42DD310E069
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 10:31:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EeWjveuY7k6YgYOIDzHC71egf1OLFQ7NU9zHA2lhl2wvPP9hRHCXFj0UTRqIOhSWLEDZu/Fwqi4oTosFSIaXxs/RHNubz+4OoVxI7ODP4t4DeIANUfM8BKLChqeFw3MtDFv5x5E2dPXMgbPoElX/FBmq9kB39MbssFtXhax5Ul1Ki9QvwGKrgZ8ydmRYyd498OI2wxVOufAyWymWh0eumifR6Fo9+R5fApZ/xrAA+UuCs/n81XFQdxmvU6J1iLvG2BzNpcLpt9JXEAu2SPbuVI/mEDciAvqek9uGCnAssMXmg5Rf+SGbvIsSebu11vCtLo9X/DRmR+2L88lClpNqXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lIZj2FSIyHlljJg5aN4oUpqwXl2Zvhw8LuwlJWOSEDU=;
 b=iFXXLd+6YaVgTha2iJcsN+XuYQHFQsCaYIyVhwp/iAPaJDyDrz4icjJ35CKFYBpIfZARjRD24GfFxiOgdWyvqyrh7BGmAlEgVeNubh0jLac0ASdHkEZtuwsypHoQWo6y38BxTSpy8xqdnDqGBzDZIXU7OIQBnlb86FirX2qylywLFNl1wnVCKONnCZALuWDyIWMo/8OTite8NONe8TNOMm6gwerOcFX8l0NHIfhS1Rvy8YFhdQTJrcNasFF7r5YlDAgUve5otQ8beNa45tZt2GBOgtdGIMITfxlYSTJTcIsMZ0tN97gwSbnmYEhTAwcC5DUGkgww0L237c7zE9GPsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lIZj2FSIyHlljJg5aN4oUpqwXl2Zvhw8LuwlJWOSEDU=;
 b=4po7I2nf0GoGcKeXKWK6Xgv6UoBDwQZfANVJa2kdlzLa+cCnwUnl6gp+wYO5/aTkU/TThIxSNIo0Uxd1DKclHiqtYtKViAcxQzy4v8xj1MyROM5sV7Xow9uPnobNsS6jEsSzn9c23E/N1MkYZPNgDwrdf50N50/fBgiZPQ4Jjk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Wed, 4 Jan
 2023 10:31:48 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5944.019; Wed, 4 Jan 2023
 10:31:48 +0000
Message-ID: <ac777256-2400-1b19-81ce-af9ec7adfe9c@amd.com>
Date: Wed, 4 Jan 2023 11:31:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC] TTM shrinking revisited
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20221230111159.75410-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0137.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c7146a8-015e-487d-e994-08daee3ee29a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/6jEbJ11jVrdixIsE/D5LyEjdJgvkHUJtaZp/wePrbrJNmtK+QL+GTDxnp3W+TBFq0/QAvpXqbnw+3CWFZG95UHo2+62/tQrDMwDVuyGLqNyPjVY5/UVw8wZ2WmkJLNWhlgqtF0UhwpONzwK9v8VAEeuGJJ8xIZWqRQgI/pGcped6u2wKShQXC5qo2KdbtHnEeciDfEC5yK2wIglYFMnQ20/6SZ+l9w/ctSfaxN4rMhQpIeg93GhCYCccfNBRuaw0LKY5ge4S9YfCcJck2fcbSm0irgQnvwZTdZIe+EpyE2UbTZssF6SDRlb39aoaCYiWTNnF3m8y7lwX+o9PGC4uOow9Y4t7JB0tcyVf+siqhpoML3ilQM4wUJN4QSFjIMv+SSQk0ML41JIAyXQD5A1JKomQIqzCMGGNICNxZKCxpyAZvj2trgW99P2R+0RCSBdCGYaPqQ3D/Bfr8dNHXuiBvLCI5juDjjUqaM7AxwKKjI54yhQ8k9SpBWnXbv4GIb/9oqOdbaOGzLNT5EEoufE9W81NSnPeH9YJgP6oVevZ4L7Q7f5kQaoeFVWHOlrCCcrXFrL/42Vk5thfKQ7XC+CjuiIw/yeRB7+4NX5CcAZrV5HVjw7fZ4QBMKK07wF5vMazh7Nysj2hWyyLc4Q0mZEuAGUP6/yiDP+WaZQzuuRgG+NnNY1f6Ecx5KpTue3vDXrIU3QF3KMVEb/NZ2htPcPZVnqtz1Vk4WvVBw865+KnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(39860400002)(346002)(451199015)(66574015)(83380400001)(31696002)(86362001)(8936002)(5660300002)(38100700002)(2906002)(41300700001)(6666004)(478600001)(26005)(6506007)(2616005)(8676002)(6512007)(316002)(186003)(66476007)(66946007)(6486002)(66556008)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU9UWUk4Y28ra2M0T3dlVUVXZnFBSXdNeEhWaG9STVBtc0c3NmVnaDVYSFpW?=
 =?utf-8?B?MFB6bW9tbmNYYXhsci9oeld1R1M2SzJ5T0hlQ25VUmFQZkMxaWZzdWpFbHJk?=
 =?utf-8?B?TmNVZEVHR3llWnErdXArMFlaMnhQVGdFeDBsWUxzM1U2UmNSVndaandxa0FJ?=
 =?utf-8?B?dVM1dEdsL1pwTUk1cjR0cWh5MHc0QU9FQzF1ajNGWkUreHJHMkYzZ2o3TEhh?=
 =?utf-8?B?WTZwQ2Y1bWEwRFc4QTVub0hMSEw3SFYybWwwbEhSSW51VGhPWnl0Wkx3U3Jz?=
 =?utf-8?B?SEp2UDBTeDM4WG9VclFWQjRDcEZvR1dCUERwWHR2SStmRmpXdzNUWXlwUWth?=
 =?utf-8?B?VFd5NFN6MkE0RGxGNzJndVpVWkZ6aGZnVDJHMmFmRkRQQmYxTmNDc2Q3Rmdy?=
 =?utf-8?B?QnZlNXpoeE9sQlE2SVVGcXNxUCtTTXRheHh1UTJydDRDaTNkV3RUdTNCakUz?=
 =?utf-8?B?YlpuTjQ5Wjd5TEpTN0JyZHpGeVpoc25sNDhpNlpzKzBBdGQzWHNlN0lvdXlU?=
 =?utf-8?B?YVJKaGl4Y290cGlVb3JQMXFESDZWVk1KUE9aenpkaVE1NExnZ0VRRjk4Nno4?=
 =?utf-8?B?TzhTdE9mRmpvSjJ2am9oVXpRTDdVMnJIZTRRWHdxTHcxcmh0eGxiMWUwRUlI?=
 =?utf-8?B?eVlWVU5IYWRQRENaaXZueHlENkdTY09lanlnQmlMV1ljclRYclBjUjZ4QW5z?=
 =?utf-8?B?OUdNTWh3SjlWdFV6dk8vUkF1YmhBeGRMeFpQRXlBVkE5dXZTNFBrdlI2czJT?=
 =?utf-8?B?clR1d2VXN0xUNEpHS1JoZ2J3UTFvdFhhOUhYQmpnZ3ZWSWdxbTN5clo4UVha?=
 =?utf-8?B?ZkRRekVWbEJQTmEycUFFL2R1bmJmVDQ2VnJ3Zy9FY0ZpaExMY0RqNWg3cFhv?=
 =?utf-8?B?M2tlRGVVbVlreThwWEJndy9pUkNwendPbXlDNjhDcXVtRk9XUXBtYW5lT29v?=
 =?utf-8?B?ODNqbmxzT2RweURpMzdPVzZEb2RmZUVXenFaT3FJbHluRUY1ek1OcVBRMXJK?=
 =?utf-8?B?Mksyc212M2trdDFjaUlzWUEraVpTVUtGTk14Y1JvVkd5dnExeGJKdWpBenNj?=
 =?utf-8?B?VTQ3MDZRZ282Q3FYM2p0eXBlZEM0RzNkZzBFZkxGVGRDcDk2dVF3SlFsaHU2?=
 =?utf-8?B?cHdlYUNtOXNPNERwMDZSTHV2M014amtDTk4yZlRHWU1MSWpLWHJ0Rmthc0hi?=
 =?utf-8?B?d3J1bG1MMVlVZ1R5aXRYWUxPTEx3NzhPRGE0L1VaQTBzZ2tLVWFyN2Q3bXRs?=
 =?utf-8?B?R1VvT3BlVnRLdENBa3d2Y1ZTdEdjazd4aHVNemNrZWdVbEoyY3BkbEQ3cFh0?=
 =?utf-8?B?UHBnR1dDS3NMSEQzQzBRYmRwcGh2VitoeU53bSsxQTN5TXpJeklvYnZsMTFi?=
 =?utf-8?B?bjczYUkydnU1K1RneUNqVnp1SVd5SGJHYjRFWWFPVFNQN3lTQkR4MmZkYTMw?=
 =?utf-8?B?ZGMwQk5ZN0cwSm9lWDJrdmppbW43OCtJQkJkTTV1d1NzTG05a0ZBT2RXNlZK?=
 =?utf-8?B?THNLMmlZZStFeW41am9DYXlNMnJFbDgxdWlSSjhpc0djYXBxRFpaR1I0VVND?=
 =?utf-8?B?VTVsbHUxcWY2a0FmMHVqd2g1OVIzRmx5amFIU0N4aTlBR1Z6eVdRdkxKZDB0?=
 =?utf-8?B?UWR6V2ZJdVZmSXM2YU9iL2VMbjZBZzdPNFFhVFhESmhaYnRPNUV2Y3RYVDZv?=
 =?utf-8?B?MFBqTWV4RTh2V0VGWTEyZ0R3Uy8yYkU4bmt4Sm9HcFJOMFB2QlZpSnJKNnVH?=
 =?utf-8?B?c1h4dHg3QWU2OFFzRm1RTlFiVit4cnVXdlM2enRneU04TzNMV0lMZy9ndUdG?=
 =?utf-8?B?bG9pNzFOMEFOZDNTVnJoOExsbDdJdHBuSVBDV1pzR2dWSG5aODRMYk5OTk1M?=
 =?utf-8?B?eGFLNlVndk1pNHJnWXpQYVg0cGVJeStWdTJOZFowVEszUCs0dzhHcEVkamYx?=
 =?utf-8?B?Yi9zc2crWnc0Yk9ieFVPbjhQekRaR0NpQjlvYk5lWVcxK1ZEWmg4cVhnb2VX?=
 =?utf-8?B?dHV3Z1p2TzJLUEtRdXY0NUtkWGZlN2xxSXRkVnlyNlN1VTI0eFhTZUNqNGl5?=
 =?utf-8?B?MVZvZkdsb0xUY2dKOXRWRndJZ1dXZXpXK2pqZmxGTGNDZlpER0cwQnhnMUVJ?=
 =?utf-8?Q?ZxoEQL3xuhuOWXu4kGMNyeBVp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c7146a8-015e-487d-e994-08daee3ee29a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jan 2023 10:31:48.5876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZr6gZzsAk+yPbQj6sVvM8HTyqzyjHTbJncrC7Mu5+s/vciR7qBRhPHnwi7o5nRO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.12.22 um 12:11 schrieb Thomas Hellström:
> Hi, Christian, others.
>
> I'm starting to take a look at the TTM shrinker again. We'll probably be
> needing it at least for supporting integrated hardware with the xe driver.
>
> So assuming that the last attempt failed because of the need to allocate
> shmem pages and lack of writeback at shrink time, I was thinking of the
> following approach: (A rough design sketch of the core support for the
> last bullet is in patch 1/1. It of course needs polishing if the interface
> is at all accepted by the mm people).
>
> Before embarking on this, any feedback or comments would be greatly
> appreciated:
>
> *) Avoid TTM swapping when no swap space is available. Better to adjust the
>     TTM swapout watermark, as no pages can be freed to the system anyway.
> *) Complement the TTM swapout watermark with a shrinker.
>     For cached pages, that may hopefully remove the need for the watermark.
>     Possibly a watermark needs to remain for wc pages and / or dma pages,
>     depending on how well shrinking them works.

Yeah, that's what I've already tried and failed miserable exactly 
because of what you described above.

> *) Trigger immediate writeback of pages handed to the swapcache / shmem,
>     at least when the shrinker is called from kswapd.

Not sure if that's really valuable.

> *) Hide ttm_tt_swap[out|in] details in the ttm_pool code. In the pool code
>     we have more details about the backing pages and can split pages,
>     transition caching state and copy as necessary. Also investigate the
>     possibility of reusing pool pages in a smart way if copying is needed.

Well I think we don't need to split pages at all. The higher order pages 
are just allocated for better TLB utilization and could (in theory) be 
freed as individual pages as well. It's just that MM doesn't support 
that atm.

But I really like the idea of moving more of this logic into the ttm_pool.

> *) See if we can directly insert pages into the swap-cache instead of
>     taking the shmem detour, something along with the attached patch 1 RFC.

Yeah, that strongly looks like we way to go. Maybe in combination with 
being able to swap WC/UC pages directly out.

While swapping them in again an extra copy doesn't hurt us, but for the 
other way that really sucks.

Thanks,
Christian.

>
> Thanks,
> Thomas
>

