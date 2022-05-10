Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABC5521513
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:20:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2220D10F3FC;
	Tue, 10 May 2022 12:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2087.outbound.protection.outlook.com [40.107.223.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488D910F3FC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aTmbpaMlS3isRMkg2T6JEy0dKCQiBWBjD6/huo8W/GyMGud0SWm8F8MHsSquPyjuIQQBDISC+6cqNYcjaJ/LIKFnI5TqC8rGFmo88lbtH/chx1OumYlV/Wu9T3mpYXVRQppLrallJftAuB5W0v/ZagYygNcfDE43sdFdZynlYxIR11Q34Q4/0SBVt7gvhD8sblGhKbfmwi+ywJdN5N1N1u+LVEesfkyP7EyJLIva1+YmKBcHrbRRmAuDOn7vAsvigTXpAOFsY+PuokUlYB/H3beqHttwO/CuKr58C4DXtGAvKfKNakIUACxyvL65N38qZZvHFcwXdHOJ7SPNNuaRng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hmsT/g18UhquvCDQuFtXwsC/Z38GTp9Xq0ubiUgEHaQ=;
 b=JPZI2BA8AtoUsQmNE77h+p7FRuJktDMBfoUOBiTN/Vh9FQYGzlXsbrLyKcJfrSU9+xz+1FcFicjzcaO1/HXP6I9HM4Cx4YLWC1xsoJmmZRc7mzZpkcOXjF++GdjpubCi9hPYF/JbdsrUPEv/Cl0JbylBNHNnzr9QMjRHqNgmiu14izHM4hGoSnPfsE5Mc0gjUz/ldY4jBhOQg2gwCgTXXc5eCf+SZvqEvjwNfCiG2QacUmohWvWGz8uFWten6yCW5RV0+Np60zB0zAEQ/I8PyHZNP7fFLSwpsKAZeKxo6RFHlBHR2zcOITwL0xWRJPmuiAGDO5Tz6PKuAMweyRlATg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hmsT/g18UhquvCDQuFtXwsC/Z38GTp9Xq0ubiUgEHaQ=;
 b=N6tAf6XH9j2rAaNN3r6LV4QmnVPX/YLAd8gN+zFjRCbb5pdb2vHEkDnyFcypGQgV1UsqFCAOh1ZPLnRfi1J2hSNQ4yu+88cArk5u0oqRn9Asm6d83J2wv5rkXcFG4inHo6sp4GtkuACQnstXSOFoETMTTFVOd7VWNptUwUc4mUA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM6PR12MB4714.namprd12.prod.outlook.com (2603:10b6:5:30::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23; Tue, 10 May
 2022 12:20:23 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::fdba:2c6c:b9ab:38f%4]) with mapi id 15.20.5227.023; Tue, 10 May 2022
 12:20:23 +0000
Message-ID: <771f293d-9972-7176-aed3-04e63ef3014d@amd.com>
Date: Tue, 10 May 2022 14:20:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: Charan Teja Kalla <quic_charante@quicinc.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
 <YnpF1XP1tH83uBlM@kroah.com> <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
 <cf3a80e3-301d-7c61-54ab-d63fd355dd48@quicinc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <cf3a80e3-301d-7c61-54ab-d63fd355dd48@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR07CA0018.eurprd07.prod.outlook.com
 (2603:10a6:20b:451::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 370a1dd6-b620-4e3d-510e-08da327f74c2
X-MS-TrafficTypeDiagnostic: DM6PR12MB4714:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB471473A05A666B5F8FC7058883C99@DM6PR12MB4714.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cG8B0tCBykJJl22+tEiZWRlgLBdEnMkYSM0VmmYlHrxayG4arsG8yJDPRSKmwLPn+IbmxMcw4y2WkBPv8pjPdUIpi4tZXZTnEeG677hjcYP/qKVz5vlkr7m8RwG6CsVahC5dQs0ksL7yGBqkhXG4J8VctkxRJmr2j3Ujc2b8xGy12yim+iqwf18eTbVUfqdPWpKg2ld+dBuVxxJCdyWXXwWF2Kxy4WAbqrr5T7c4VzaEiAnGxOANlBHH+ZcC+9JQMMad5PEg7/Y/zWPYFgpbb9hzZbIyqWKwIdoN3LcRVQnbCNIsFrPnR9zkZ3R8XbvKap4wfXxrZrcZFUKMvkCB8msfIe+cBSKwhm3HMC4kkzJHg4XpkKHQxWpo0KFW/P9WjNBpK3JglTr88PXIJKscOmYiHFWksQV/AVsnxsGvsqq1A1eSE63Q8uvkDiNXB8G5N1IXg/cGlDM5cDRtkn0lsPp7TNdbYFMKntjh9uKxq7LwUCY4EMvt8U0++K1fnJgvoYhpkcPI524HU/Ry4RQqUa06285YO/VsTve/aSd4Bxx58AM0UPPv0q4+prpZWN84qw06uL7QLRZhPXWx/EeuvSPwEF1jrCfby1DHq26LvPCDdA1J8LKQy2wJ1pwJW0GDi/DYt/kMtnz/KOBQ/vJv9ePHnUszfGfl3pWrP67JtGVWB/JA2pMLYea+hvmd7dgPh/waxPNREzhbcgJs5Wm6MTHlpn0e/62kmnEXVZmJSII1LcvvNT41f5yv3HdiSIIw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(31696002)(66946007)(66556008)(66476007)(186003)(2616005)(86362001)(8936002)(6512007)(4326008)(2906002)(38100700002)(316002)(6506007)(53546011)(110136005)(36756003)(31686004)(6666004)(6486002)(5660300002)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWhNQWJGWDUzeEZaL3laaWY5bTN2dlZJSGtDS2lXNHpKVFpIVnRNcE1kbisy?=
 =?utf-8?B?MDVTYUVxcU5Jb2cyeUk5RDY5MzE3bjAvcnpwWU10ODdsQ1pxRkJCMXVlWFBp?=
 =?utf-8?B?STFjYkY5ZElCTHRhVTlSbzgxMnFOYW9CQzBCRXFPbGtWcEJraUVaUWtGT0xu?=
 =?utf-8?B?bFhIQVVMdjJWYUtiS3FPUERleDhMVWNKb283WWFsYnNoT2p1Tmd3QzFRTDNr?=
 =?utf-8?B?OEoyUFZwK00zT0tMYVgrcVAzcVhHcXFwRzZFVkdZWWphb05zS0RRWkhLZGJE?=
 =?utf-8?B?OS96N3RkN1RVVGE1RVBYL1h1K0RYN0h1czJkVlBEUWdHTU9xZENXV0hzQ3FD?=
 =?utf-8?B?ZmVxNnYya0lpMXRWc01sQWF1b1VlcE93c2loQjg2OU5GNm5jUCtjMG5MTmVP?=
 =?utf-8?B?VXRZcXJSNkFnclU5NXI1UWV4bjdSUjBLMUpNM2J4OVRPSWU1R2Q1VzdqakJO?=
 =?utf-8?B?OExsYmRFZVZZd0s5OGZvOW9BU3Q4QnpxSEoxTE9SdERtUzVrRnZVSWhyUmky?=
 =?utf-8?B?MkhoY3czNU1yNkZWbjZFNmZlYW5veHhEVHZVeTNEa3BlVDZnRjNpd0M2dTIr?=
 =?utf-8?B?djBxUlYveExHckdHRi9teHdIUzdncTBnQ2VMLzdxMi8xRy9PLzJkZmZyVGVM?=
 =?utf-8?B?dGVCQUt1L05KeXZjd1lCSHpqaE1PSG5jV3Fvc3ZoUU9RRDJzaUo1cm02cE0w?=
 =?utf-8?B?TmZKQzEyUk9sdHFsZVJqKzBtMm9CcFNGK0NwWGJMVHdqaWRjampiZTA0eFc4?=
 =?utf-8?B?T2NuYksxczd6RTFwWnZ2cFFBQUJRMFVOcG1JbXplaFBpRlU5d0VzY1grY1RQ?=
 =?utf-8?B?SjBRTERFcE1iSVNBWjlzNVFPZEpGSWRkMUdzaGkwNDYrOWpkT2IrWnozL2ZP?=
 =?utf-8?B?d2wvRDhFVEdCQlJQN0JLZFAwL3U5NHlPSUR3NjJ6bmoveFdIR2VQUitHbWpR?=
 =?utf-8?B?eHVLZjlrUmV4dlNBMUo0bk9Db3ViQVlZUVgwUDNoc25lTE1OZ2lKTDhqQ3kv?=
 =?utf-8?B?dVlkam40S0svWTF4c2NrazIxbjE2VGEyaFVKOVhrZEM0UGN0UW53RVFQdHUz?=
 =?utf-8?B?UWV6L1pTc2JVYnN6WjlVOWFEMWlWbjIrMGN6ZER6T0ZIclNISVpnT1VoSjVp?=
 =?utf-8?B?QTgvN2M1N3k1Y0hUMWFzMFl4WU9rRnJKYXVjNDdPV00wZ0RzRHg2Tmx4N05i?=
 =?utf-8?B?d0xTVTNPOWJkTHh4bE04Sk50U0N6N0tnUjRjQ0hoTlE4emc4ekdjRHdFMUJI?=
 =?utf-8?B?QU1FeTV4cTZHTU5qSUZMc0Q3MmhjZUVDckxuUVhOSDNqSzA4d20xNW03aTJ3?=
 =?utf-8?B?aVllSHppUG10TXVrcmR3U2l6Unp4dkhtZm9iQjFlTjdTSkE4YkNjRTNuZnl0?=
 =?utf-8?B?SXRTMFRKMzhRYmNxRGo1bXhiZ0QvdXdKWGhRYUZxaFdwL3BSd01KZFptbkhW?=
 =?utf-8?B?blpOMDh5blZzaWUrZksvVFNyZ1lRZTk3QWdBU1REOEF0NGw2MUNSR05ZVlVa?=
 =?utf-8?B?cGpFUjJkaUtueGNiekdaOHc3TkVidHNia0V3WG1mZEZDQXQyemcvWENJa040?=
 =?utf-8?B?YW9EaERqc1pKT3VmNmo0aSthZk9Gd0Q2NmhYMzNSMFBwTGpGNWprVWxzZ1V2?=
 =?utf-8?B?UWNBbGxKYzBNdmRTS3cydG5BZ2dNZStJMC90VGtMaUZBVXQ5eXZEQVYwdVRH?=
 =?utf-8?B?WG1JSkRJZjlTVzZDVElBeFZLZlpuaUZNVEZzM3Jpd1RwS0tPVnBpNm5HcTVX?=
 =?utf-8?B?ZGZqWU9sYVBIRHNORFhDZEZhS1BsR0hLSGZyVStwSVlFenMvNDJxeFFJY3cw?=
 =?utf-8?B?K3ZwK1FESU9GeXM1SWlwZ0sxcENlclhZdnRwaFhqSENQNm5zejRZbExLVklz?=
 =?utf-8?B?RHVTM09ER0JjU3hOVW5XbXZYUzBBZWlsbFN6WjFtM2JnUnZWdVpUYWFBQUFa?=
 =?utf-8?B?bnNNM1Bpbm1SUlhGWStONmk1K0J2a2pqZGFBS2V1WXNtMVJ6dTF6OXdlejdU?=
 =?utf-8?B?MHFKaFZtQUJBbnpYNmV5Y1kzWlNiWG5FaEk1QnZWaWRGbWxjSXFvRHQ2eFZw?=
 =?utf-8?B?R09yUGhUUVhFWTVORE0xVDFOZTF4NTdWSitUa0ZaVGtrYU1nYVlwbUt6QmRs?=
 =?utf-8?B?ZXh4Umo3eHZ2SjlTeUo2bFE4dWFOSHZrRGFtbGI0SGlJVzhoOVEvOWRRSjJY?=
 =?utf-8?B?UnNwTjBvcGI0cFU2Z2hieUFjbmp5KzkrcEFKM2RaaUo3cDV0YmJGbS9ENnpL?=
 =?utf-8?B?ckh5V2dkbEhHWFFoUnBpTG4rbk1BMGpESmJ1NlNUWEgrdEhnSFFpN3VuQUtP?=
 =?utf-8?B?MmlqTUlSdXNVSTlmb1NqL1d0RTV6UXZsNWRTdHRtYVhPQ2hZeGJCZ0VsQ0dt?=
 =?utf-8?Q?/n+rhBWsgDHYWhgKEbhsMn0n59v7Hze6OrnHb6m7DRp3T?=
X-MS-Exchange-AntiSpam-MessageData-1: /XdL2OJ76UJPIg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370a1dd6-b620-4e3d-510e-08da327f74c2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 12:20:22.9192 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /cs3awLV7/eBCmrMFKgXVaNQ0ZLxFVI9JSMekGh4zNifE8aQ7kNJT/hkX9G5+zk9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4714
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

Am 10.05.22 um 14:16 schrieb Charan Teja Kalla:
> Thanks Christian for the inputs!!
>
> On 5/10/2022 5:05 PM, Christian König wrote:
>>> And what's to keep the seconds field from also being the same?
>> Well exporting two DMA-bufs with the same ino in the same nanosecond
>> should be basically impossible, but I would rather opt for using a 64bit
>> atomic in that function.
>>
>> This should be 100% UAPI compatible and even if we manage to create one
>> buffer ever ns we need ~500years to wrap around.
> I see that the inode->i_ctime->tv_sec is already defined as
> 64bit(time64_t tv_sec), hence used it. This way we don't need extra
> static atomic_t variable just to get a unique name.
>
> Just pasting excerpt from the reply posted to Greg about why this secs
> will always be a unique: with secs field added, to get the same
> inode-secs string, the uint should overflow in the same second which is
> impossible.
>
> Let me know If you still opt for atomic variable only.

I think just using a static atomic variable here would be cleaner, that 
is 100% unique.

Your approach should probably work as well, but it looks quite constructed.

Regards,
Christian.
