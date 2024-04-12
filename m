Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 863178A26C1
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 08:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A04210E9E3;
	Fri, 12 Apr 2024 06:39:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dy1j1xbJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5A010F0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 06:39:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMSJw44OZfqWIUQPNmLT0nhCJbnx7HVf3aeKXGtDaj5LcOuBGlL2jm2t9uTr3vl1KChoCy0TecvUJdFB+rHK9xCOfEXSasanl7tTQKXN3T0GavMTH/BbQO4c5mdU9zhi68CD05OE3AnQhgMegTqUYEC90fkQbyesOy1D6AGnfVT7HgIE7K8HnxFgo2h+p1smICGId27xlu+Qsxf4WND7tb9H614E5fZNsnaClNJkS7e1pp48hiNEx2eEGYzdWtHKFGM5slbaG+OeSlceFpfxAuCc/TOPGQjL7oNHxNbD00P/AuC5MoFyJtyRYb+eXEhPZCUj3Aj5l4GxeyuqzeTNKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqUxssL/L11N0JQTXj7RKeHgH6Cujv20XZkUmG7Lehc=;
 b=LVLSHc7R+7bG5mUnO1GxHBOtwyU4q98F8PPtyYDlyk1LOEb3e1iDr43vS6feCXJRFzACfisHVc3FaMXhWTsMyrmjG7AbwaoVQ2rX88aneZ0A+0P9qlXYJeftyDrVWUC6CJDjNCwApRYGWf80YEPM9Ubges4cRLLGsAP/kp7djo9Ps25wE2/MfNXOzCDDSB6KUFfOiXrto/aCZppz6/rWIWryR65P04q+Nk8vsNi0/vX2OhgKLXhf6A7tkmRnNJgNHb5sLpJdGuqRqkUcmml6NIS9lKpdPi6u3uf9c4C4tcfDmEfvxD/Ml/F4hGV2zrHaHkF4mi2TdTkTe1P8YNw/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqUxssL/L11N0JQTXj7RKeHgH6Cujv20XZkUmG7Lehc=;
 b=Dy1j1xbJG/drNESWiLCyfYlE+2wXikvn7JMp/ofZgBB0ZOGVLsX5nLPiqG7FrjVLR13EAxCJ00ohj0bWa9Xqqkayey1qOiktsrIQoNjpR5Khyqzqso/+ZgqDf2BrmQ4PiNSE8AEZj3DVcKDwLGOlzRsbkJ9uOIptKZb2GabBXQQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB6774.namprd12.prod.outlook.com (2603:10b6:806:259::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 12 Apr
 2024 06:39:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.053; Fri, 12 Apr 2024
 06:39:20 +0000
Message-ID: <40ac02bb-efe2-4f52-a4f2-7b56d9b93d2c@amd.com>
Date: Fri, 12 Apr 2024 08:39:14 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmabuf: fix dmabuf file poll uaf issue
To: zhiguojiang <justinjiang@vivo.com>, "T.J. Mercier" <tjmercier@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, opensource.kernel@vivo.com
References: <20240327022903.776-1-justinjiang@vivo.com>
 <5cf29162-a29d-4af7-b68e-aac5c862d20e@amd.com>
 <cc7defae-60c1-4cc8-aee5-475d4460e574@vivo.com>
 <23375ba8-9558-4886-9c65-af9fe8e8e8b6@amd.com>
 <CABdmKX2Kf4ZmVzv3LGTz2GyP-9+rAtFY9hSAxdkrwK8mG0gDvQ@mail.gmail.com>
 <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e55cad9b-a361-4d27-a351-f6a4f5b8b734@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0015.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB6774:EE_
X-MS-Office365-Filtering-Correlation-Id: 58460528-97d9-47a6-48e3-08dc5abb48c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6uT52cxV5QOSX759oUT/GH7Z/iy1erKLN1SdumLA6Bm68/pSSWB833feared5friXtQ4u+1vJ2GpxaMi4Bf7pGiDWi6l5VqL05YvUbyzZntI7RG0VqzIMwOWxcXXjea5+QBJ1cV/lJgVm2sNr210yx6YBnhJ5NP5JsnYebRiJs5nN6SkgDPKYOaonSn4/94KV5T/n+aOnNyGR8yGeWw7hvkkDSntTKv0lQQbiWRkB7joUo6mT4lxTsI8q3tfefjXvb+j3wsE8dbTBZZ6w+/Lk0On0Yq9i9s0ZZiriZSptQwU9eG8nrkmjOWH2NX50yQ3tW3dbggC06Fbqg9NoFVCVLak/UGacuIt2qCtIBaI+JeIGNydlle/g81Ik2XS0NaZHbqMPkha/7Jv/axMn8nZoxjhoUq0SzIh1n9BugsqBT68KbGlPLx3+TSJk+D9XWwq49L+l/z/HaOewf3O8m6/xQsO30XEklsbZh7yAV/KgLwNjPIQRkGUTso+Fb3MEke6aWaNR99ygK8Xh4MxSyIDTJ+m4ego5Id2t/5yUjXHA8i9c34eJjNo1PTVLevZB/JYS8ag8WG2HiC0aReOSFW4HCQaf/9A6Dc7sVEsqDBo1/NnBVUmoz7Rss25x5djieC334NBGTpvxuZzqlWHW4fv/ZETlHkMTqnrSxFdy3rr8dQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVp4b1VsejlpYlZWUEJ6bW53aUo0clpTeVhGclpEOEZnY08yRlVxQ2FRWC9w?=
 =?utf-8?B?MVpjYU9BMGVyVDcyd1RsQTBwbG1OMm1WTEQ2SnNKNisxdWJNdFM1WHFlTk9D?=
 =?utf-8?B?NHVoeFR5SzZNREVmcm9LY0RkY3ZJQnd0SGh6WWZCVGJaYjZ1cFVucWtrUDlu?=
 =?utf-8?B?Z1E0blo3cDdtSGtIbjFSNWt4aGhRNER5MVpEMlJaYTY5SzR6Ulc0WDl1L2Mw?=
 =?utf-8?B?U2ozUEVOSVNQOFdBaXVFeVR6SUpTUUJ4QitlSzQvMU9kSW41c2RKK3NmMisv?=
 =?utf-8?B?MWZXYlRRaFZ4dnloQndGZ0piRWZDdnFPdGhMSFora1V1YXdYUWppR2RzSFB3?=
 =?utf-8?B?NjU4S093TldncFZwVkgxRGR6VkpqQjNLN2Npa2szWlI3VzFlV3R2UDV0czdr?=
 =?utf-8?B?OEJiZGNPaWF2VVdZOUIwdFJLemZia1Rpd2IyVnlmWFVPL2llL3ZXRDU0Qysv?=
 =?utf-8?B?eVVkWHlSaGkwdEdsZzRDaHZTVHlyUWpFYUEvelZieFp3SVJqaVNWQUxuS2t1?=
 =?utf-8?B?NmhwckNCdHhGNXZqT0ppbS8vdmJpZlBDMEFlbVVzYzJYUmJSRU9OREoxUkJD?=
 =?utf-8?B?eTVzS2xKVlpzL3RsNlV6a0FxaXVkaGxweHJMRHI1akJRYzFzeC9acVQ2OUM3?=
 =?utf-8?B?WFJZWXJvUGZTbnJ2TEs0UzE3U1lDMjlOcEd4WWs4b2VQTTh6eUhwS3UyQi9B?=
 =?utf-8?B?bmVNRHFNM3RiOU93dzVPM1AxNVlFbTNYNGdlS1dZZkZvMitkWVZiL2RCZjUz?=
 =?utf-8?B?L2lwZ0piSkVsRXJYYVhyRi96cEJJbGRhcXoxdTZUZi9iVFlyUWkrVWpBcDJx?=
 =?utf-8?B?Z2ZVVURpaUZlNFpsMjk4T2NDVE9ETUg4WTNWa1V2UHhCdWtyb2VQYmt5eUJR?=
 =?utf-8?B?YzlCdWpuUnlZaWFaSFZwVlJ4UDdQRGdteDBhR3dYQ1NRTmZub0FWdDV3QkNR?=
 =?utf-8?B?MUgyTW9UaDhLRlJNbW1hZTFVWW82MHJjY1E0NVEzZzl1VHIxWFlXUmp3MENu?=
 =?utf-8?B?SGVkbStNRmNRU05HR1doVG9TREwyeWxrTGt5TGFYYml6dXdoN3BjRmFUTWFv?=
 =?utf-8?B?d0NWNnZKMHpRRXlCNUt1allPZGxqM2ZFVkhNdURYcnhIa0NjT1ppVmJLeTNa?=
 =?utf-8?B?K2tYZ1pTblhCUDluRUUweVZNOHJQbis0ZVR2bm12QTFVM1dUWHBydzhpWVM1?=
 =?utf-8?B?Q0dESXpTUjI3ZUJqYS92em95SS9BeUVTdjZmSk5MajVXRElET2hRTFkrMnQz?=
 =?utf-8?B?WUN5TDkxNFNsNVlVUG5rTUxzVmJ6RXlIcjRSTkJPUTExbE1uTGNJKzFqeUJP?=
 =?utf-8?B?NXJvcjFyWkhmWEJSbzlsTkxxK0huV1VkZ0tUZ1AwVXdTMDhPMDZ0Vnh1azd2?=
 =?utf-8?B?UXNFQitTWkd6UVhpazE0aVQydktYV1RwMlJoMnNGVEtKSTRRK2xUR1g3VS9h?=
 =?utf-8?B?SWhGRjRsVWt2NEU3TjFHTy94NXRXSHFNb291ZFYvd2ZtV2ppOUhZaEN2YVdu?=
 =?utf-8?B?UnRUTG9jZDcrcGY3NllnY09JRmhDN09kUFdkcmxEendoQkY0TEJESDE5a1Zi?=
 =?utf-8?B?WFZPZFZqUGpEa3VVUkQ2cFVMUVl5MXpRQTVtTFd2cVNxNFd0a0lmVUp3MnBj?=
 =?utf-8?B?dWpQTUx0OSt5TTJ1Zmd4djdpNk5BVkZiZkc4dG81QzA5K0sxN2Fnc2s1RkVh?=
 =?utf-8?B?NVlWS2JYOFBjWGpPVFVsVU9vb2VmdHltQnoyUm9QN0Z5UVlOUEE0UzUxZEZh?=
 =?utf-8?B?TkNtZVM0SGFFVGRVMDE3alIyYzB0TWZ1RXpHUC9nN083TTNhNFd6ZzQ5dk5W?=
 =?utf-8?B?L01uTmR0ZjJoZWJqOFIyakRvQytKVVBTUEorVmx3aS8rZFAvdGVNZXVuQUdD?=
 =?utf-8?B?azRhK0NyMmZtaHBHdzFQeXB5NjNWQWhUOFV0UFVBTjdhb2J2VGkrd2ZsZ0g5?=
 =?utf-8?B?VWtkbW9aQ3JBQlZ6anFUR0xtS2h1Z1M2YlhIekNVUHZhVWdYM3RwMW5kS2R0?=
 =?utf-8?B?WFRIN2JzaUNOMFQxM0xjcTlNZjJPR1Z2MUFrQ0VyL0h0aXROZUxINjlFRVR6?=
 =?utf-8?B?ZjV0SEs2bEloTUY3WlMyOGhmWUl2T3lnQmRHdUlQWXViRW10QmxXeExaRks0?=
 =?utf-8?Q?6UPmyibxZBD79eNjH6yRf7Npl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58460528-97d9-47a6-48e3-08dc5abb48c1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 06:39:20.8113 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YQz4in2mgetj+TXos2DJN5peSxWrOwX/uujZk3CFMwITd7SmF6J5fw6uptyU1StM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6774
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

Am 12.04.24 um 08:19 schrieb zhiguojiang:
> [SNIP]
> -> Here task 2220 do epoll again where internally it will get/put then 
> start to free twice and lead to final crash.
>
> Here is the basic flow:
>
> 1. Thread A install the dma_buf_fd via dma_buf_export, the fd refcount 
> is 1
>
> 2. Thread A add the fd to epoll list via epoll_ctl(EPOLL_CTL_ADD)
>
> 3. After use the dma buf, Thread A close the fd, then here fd refcount 
> is 0,
>   and it will run __fput finally to release the file

Stop, that isn't correct.

The fs layer which calls dma_buf_poll() should make sure that the file 
can't go away until the function returns.

Then inside dma_buf_poll() we add another reference to the file while 
installing the callback:

                         /* Paired with fput in dma_buf_poll_cb */
                         get_file(dmabuf->file);

This reference is only dropped after the callback is completed in 
dma_buf_poll_cb():

         /* Paired with get_file in dma_buf_poll */
         fput(dmabuf->file);

So your explanation for the issue just seems to be incorrect.

>
> 4. Here Thread A not do epoll_ctl(EPOLL_CTL_DEL) manunally, so it 
> still resides in one epoll_list.
>   Although __fput will call eventpoll_release to remove the file from 
> binded epoll list,
>   but it has small time window where Thread B jumps in.

Well if that is really the case then that would then be a bug in 
epoll_ctl().

>
> 5. During the small window, Thread B do the poll action for 
> dma_buf_fd, where it will fget/fput for the file,
>   this means the fd refcount will be 0 -> 1 -> 0, and it will call 
> __fput again.
>   This will lead to __fput twice for the same file.
>
> 6. So the potenial fix is use get_file_rcu which to check if file 
> refcount already zero which means under free.
>   If so, we just return and no need to do the dma_buf_poll.

Well to say it bluntly as far as I can see this suggestion is completely 
nonsense.

When the reference to the file goes away while dma_buf_poll() is 
executed then that's a massive bug in the caller of that function.

Regards,
Christian.

>
> Here is the race condition:
>
> Thread A Thread B
> dma_buf_export
> fd_refcount is 1
> epoll_ctl(EPOLL_ADD)
> add dma_buf_fd to epoll list
> close(dma_buf_fd)
> fd_refcount is 0
> __fput
> dma_buf_poll
> fget
> fput
> fd_refcount is zero again
>
> Thanks
>

