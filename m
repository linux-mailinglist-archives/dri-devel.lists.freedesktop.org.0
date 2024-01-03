Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E3B82303C
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 16:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A67F10E2C0;
	Wed,  3 Jan 2024 15:12:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6A9610E2C0
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 15:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuBauQaLMtxG8irtBQhqQh/n6ksIkVx5ULyG1KIWuHB8DT2juWmbMJ4iabXUdVejOy8K50T/Ixv6MqHbtoodeokTxkl8RnmwlC5px0L/fdUlPLqx/T7QUWL/sIDYGOtNdKda84CYYoxbUrqxYLAhtHpzjU5HKhlzEkDlzqy/OEMWzZwXCjPoO+qCE8uYfHPgfWkZTFHLTdu9rYykgylXE4Y//8EZarPcGev10FCKitJ+Ri8Wb5vDaiijyKgVWDRwW1DQYa5IOxWPT7oMQ0xDI3qvXf4gAnc/ndeLStiVKxYb47hEcRqZEahTmF+2oShEMYMQIVMZGKVpJZWQZT0PLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g7Sfb49omOY5kUIBfz2P32nZaE+EGqoIOWCvC6skFrg=;
 b=ajqSQ+EQSQ/T/Rp7EOEDzKZksaFQlQA6pVQQwqRc858r/Q5Vz5XjIrds5erF1iDcyYeMgxW/qhF2Rd1oVn3fBqi+rbJewXeTtf0/ygPnfa5S4uCrTdsro+aZEkgPtcOcLctkEnct5wnpIhf05LckvITyDQaLqypeMIkzZaY6nwRuEEBkHSeoOLQYFpvPVCvcG9hYifn4DC7a9tB2pcF0ScOozEOGOR0OE9TMyyl2xAQwhfbkJbYy39HtAR7UKZINjzBy1InKYgrf5Dv0I/g4iteWFqiu330WQTenSfmBfcEQCaimh8MC8qKreCchbvCyyo82hymq5AgdnNR9SrFjDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g7Sfb49omOY5kUIBfz2P32nZaE+EGqoIOWCvC6skFrg=;
 b=b2QSf0xGIJTkROCfgIH5xWN5zk3U9FmBzQAPJdZ6WFis/5zFh/NMlo/by+QB82lPlBDkGlD0wo9JZu8DLNMaCxzlSk0VUXqRNFh1VtZGwxsrD4W2bYsbMUWW5NyTXfNhWMPaVzBtm347f+SaFomF045ppduwWuGl/TZg8H+csNQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8065.namprd12.prod.outlook.com (2603:10b6:930:73::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Wed, 3 Jan
 2024 15:12:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7159.013; Wed, 3 Jan 2024
 15:12:49 +0000
Message-ID: <743cde4d-7907-4dcf-a0d1-d06c486e2af6@amd.com>
Date: Wed, 3 Jan 2024 16:12:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in drm_prime_destroy_file_private (2)
Content-Language: en-US
To: Qi Zheng <zhengqi.arch@bytedance.com>,
 syzbot <syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com>
References: <000000000000f4faa2060d83f582@google.com>
 <0b0963c2-3c77-4037-a66c-f535c4422755@bytedance.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <0b0963c2-3c77-4037-a66c-f535c4422755@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0245.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: f8b58534-27a1-40f9-ed13-08dc0c6e729a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vMfA7EGJc2vvykA4UHd35LQPUunh5D3DrZJrGzcouziCxihorN2N8HMaKEf9sVktSQzSSqlPFKFxbjN7cVR/paKkD4P5gnKL8xvYQ1IFutPzceNoj+II5bUPnEfnphceHR6/O3jIjPQKRKuqxSamnrdCsP/1tUHfiYFnvNarRYiVHeYtaRK5PmakBYXPlj5hB00ci6lcq+ByTjjUKnB7sXe9M0IDzJLLRIasMAtAQYIZOWYkVPnoWh35midLLJtJvfJS7kUETcPOSz0gmk3liVL2VOmTvgQahwX20ErQ6s9Stk6ZFK/buL8LTFrqPZX7sdPYZqjqT7HIVt6zIzJuzgdjcSxLQ1C1LeSBMedw1FadnHCkawkwpENE5XxgIWDX9uQrILMmzfMxi7XDW809L2JoonQBNWnKzrSowlncYZWwPMmf+0tbupAks6uC+dIh8Q0J4BeiCzp18eWnhomyf+veWNna9w+NPsTOtMdPmktO2S+9foVX/53O9Pm3C+YRf5+Zl3rMIg/L3vyG0olznAH3Dpj4ch0M8y12DTTDTKt/bJynDctQq6bPH1Cnpo0bzkoeHxLlnTsK5ZP9pBkSH46KJErgeqOPeaOE/1sYVbba3dVeKWUOiMhb4dwVAO6yL9UXKyVZ5Fokkz7qt6Zi5+I+5eD8XTFheSW63k2+Ih7JmczTVUTMu15F4XPY4Sq09oCfne4l6s0C5r14PaRaCUwvLiDK/CdVpfgifZplxk3Lers1L50y0r9xKcc/n2H5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(396003)(136003)(39860400002)(230922051799003)(230173577357003)(230273577357003)(64100799003)(1800799012)(186009)(451199024)(36756003)(31686004)(53546011)(66476007)(6512007)(6506007)(66556008)(66946007)(6486002)(86362001)(31696002)(966005)(38100700002)(2616005)(83380400001)(26005)(41300700001)(2906002)(7416002)(4001150100001)(5660300002)(6666004)(45080400002)(478600001)(4326008)(110136005)(8676002)(316002)(8936002)(99710200001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXBpM0NYMUthMnI1Tm03TUlaaVd5T3R3Vm9oNThLYVR3bkxwSEpkTkRQbStz?=
 =?utf-8?B?b0ptc2ZFTVMvelh5Z2N3ZVNJYVFmVnd2M1E0QzQyZXZFRXk5OXh5and2Vngx?=
 =?utf-8?B?b3R0dDIxbUltRHdqejBDUHkrVWhtK2toamJ6bGgvMmZ6UytEbDE4bmdrU24v?=
 =?utf-8?B?TWZUTEdXbDNIWTZmd2p2ZzdGVWFHUFJROEtSYmpKZVBNcmRYeSs3aHpyMUQ2?=
 =?utf-8?B?RXAySll0RWRQSXdDbUdmSjYzd0xwSTl2TUdpUVhnS01vZ0xhYkoxRGtiRFcy?=
 =?utf-8?B?SW15TVJuS3BndXpUNWRlVk42NmEraGREdkZraFFvZlZ4c0QzUG5RbHN0Wm00?=
 =?utf-8?B?UkExRkhpMWY0dUp6TS9OV0hhVVk5Tlo5U04xYmZWdWVPL3ZJSWt6WUNJYnhr?=
 =?utf-8?B?OVhaWkMxMmNZaXB4Z0x4RWdiakkySE5zWk9vR1FxSk9WR3dybzdINlBDRFpk?=
 =?utf-8?B?ZDVSWFh4Q21NemFqR1BVdDUxTG1OQW91Q2cvM21NOGdoQmFGMW16T1NhM1E1?=
 =?utf-8?B?Y0RXZy9aWGJqWWIvRW1nanRWVXBUM2tHclBJb3ljQTZEbTJ6cEppc2dUbGQw?=
 =?utf-8?B?NkZmVitmNDc1K0cycGVBUTNHT0lDamRpdDllc0h2VjdTVWl0d04xY0pFYXow?=
 =?utf-8?B?UkdxbGtkbVdxdmVvUVB4aUJrZnhkbHE3YmdMblRXWmtQYWxPaHBVd1RDNGcw?=
 =?utf-8?B?YlllT2c4S291TW9UbVlPd2VCMmpwUXg4VnZFb3BHRUwxaDNyZG1ZRFdIWXVH?=
 =?utf-8?B?N2didTdmUlBoVENINVRQRVcvSy9sckZrTFRad1pnU3VuWEF0dUVrQmMwU2dP?=
 =?utf-8?B?V1JNd043cW9SQ3JVZmxtRldzNmQ1Vk9wUnFTQVFsZ09aZlhnWUhlWVhrcmlE?=
 =?utf-8?B?R0NLRmZpODZCMkVZT204NFNqQ0dVbmt4bFhqV28xMitkVWFCY3BxZURLaVh4?=
 =?utf-8?B?OGVzaVlIRjNCUG4xTVlyV3I0VVlyNFJybS9lcnE1SU1NQW9rMDBYYmowY29K?=
 =?utf-8?B?aFI2NTJrV0NjbW16TGh2eG8renV6YkE5VVRCOXNzOThlZnFtcjVUTkplSERH?=
 =?utf-8?B?MjNlNkhqTHpqQU5jYzhkRWZJYzkvMFYrTHFocE05RUVnQXdjdWZhSDd4cWo3?=
 =?utf-8?B?Z055SUZYTGhYc0xvaHJjOWVNUjNjRFgwNmJIVTY1WldTaHdaWmR2M1d4Qndr?=
 =?utf-8?B?eUt5cloxK1U4NStrMnRGbVVXKzVvZFRlem1rdUUwcmkzQ3FOOUxIdjdzRDBU?=
 =?utf-8?B?MGlJT1hsdFRkYXRTYXJrVVVLTGxqMHBiZ3BudkhQbmgwSTg4aUkweCtEclpR?=
 =?utf-8?B?T1FnSDJ6azhuZ3VBdDNmSVoxWVRzOFVoWEVpTTJQaXdEaWd0TUVGQ01tVlJi?=
 =?utf-8?B?NkF5SmlnR3Q4NFg0TG9WMWJIZzBTVVFYSDc4MVhseWgxa3d5Zm5TU3JoTi9I?=
 =?utf-8?B?K1I3V215cnBQb1dNSjBlaTJYMjRZcFBCM0IyU0xSY29YUWNSNjVnUXBIQnhD?=
 =?utf-8?B?bjJBUFZPbDZBYVM2Q1FIcTgwS3Z2UVRBN1RiSUlBY2FvaGJ4ZjIvK3gyMHJK?=
 =?utf-8?B?aFJkRGlDNzQrendlZzVERXJiNkdPV1RXVGRrbVNsSXU0SVdBN2l0UVVzaWJl?=
 =?utf-8?B?R3N0L1JOeUY2SVowWnNMblpaZzhRcG1RQ25GVnN2RmluZFhNdm0xSmZ1TTVZ?=
 =?utf-8?B?SGNiT0FoQTI1M1YxQUNPWXdFY25sVUhGWjdtZCsrTnB0TnZRQnZWWS9qOTZv?=
 =?utf-8?B?NGZZNDBGRGdXdU9JM29xa0I0Z1VUdSsrTXV0aUs2VEZmOGVsQkgraXVSR1pL?=
 =?utf-8?B?VmcwcHhPK3NEd3h0cFZJdFFNSXN2QnIrN1Z3NHVRQ3lLcjZQQ0dIQTlHQVd2?=
 =?utf-8?B?bnMxM3FlNWFLSnpLN3g5S09RZVVUeHJ5L0pWMGpxNG9HeHFVZnh1cHQ3Tk4w?=
 =?utf-8?B?NXFSNDJaUHhPT05Jbml5VFptd0hvOFlHb1RYdWJ5aFJTUHNhR1hnK093cDU4?=
 =?utf-8?B?aENFSndZQ09JbDVZNFh6enR3SGkvdTBRVEtTTjhLay9TNUs0RmF6WGVnbE9Y?=
 =?utf-8?B?Tk03cWpza1VLQUJ1NVF3dVMyemRPYmJXOGhQSlhPTDgrUzBXS1hZeldpeUR2?=
 =?utf-8?Q?RTwGmz7Ws+DYGBG58jeHePWx3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8b58534-27a1-40f9-ed13-08dc0c6e729a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2024 15:12:49.1004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWnUWzMBEvML0d0WFgJjhAG7W0q0BmBvsouempoAiaJDGJyd/REszCm1TAoqy7aS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8065
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
Cc: jgg@nvidia.com, tzimmermann@suse.de, syzkaller-bugs@googlegroups.com,
 akinobu.mita@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 mripard@kernel.org, akpm@linux-foundation.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 28.12.23 um 03:57 schrieb Qi Zheng:
>
>
> On 2023/12/28 04:51, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    5254c0cbc92d Merge tag 'block-6.7-2023-12-22' of 
>> git://git..
>> git tree:       upstream
>> console+strace: https://syzkaller.appspot.com/x/log.txt?x=10cc6995e80000
>> kernel config: 
>> https://syzkaller.appspot.com/x/.config?x=314e9ad033a7d3a7
>> dashboard link: 
>> https://syzkaller.appspot.com/bug?extid=59dcc2e7283a6f5f5ba1
>> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils 
>> for Debian) 2.40
>> syz repro: https://syzkaller.appspot.com/x/repro.syz?x=13e35809e80000
>> C reproducer: https://syzkaller.appspot.com/x/repro.c?x=155d5fd6e80000
>>
>> Downloadable assets:
>> disk image: 
>> https://storage.googleapis.com/syzbot-assets/ebe09a5995ee/disk-5254c0cb.raw.xz
>> vmlinux: 
>> https://storage.googleapis.com/syzbot-assets/02178d7f5f98/vmlinux-5254c0cb.xz
>> kernel image: 
>> https://storage.googleapis.com/syzbot-assets/12307f47d87c/bzImage-5254c0cb.xz
>>
>> The issue was bisected to:
>>
>> commit ea4452de2ae987342fadbdd2c044034e6480daad
>> Author: Qi Zheng <zhengqi.arch@bytedance.com>
>> Date:   Fri Nov 18 10:00:11 2022 +0000
>>
>>      mm: fix unexpected changes to {failslab|fail_page_alloc}.attr
>>
>> bisection log: 
>> https://syzkaller.appspot.com/x/bisect.txt?x=13027f76e80000
>> final oops: https://syzkaller.appspot.com/x/report.txt?x=10827f76e80000
>> console output: https://syzkaller.appspot.com/x/log.txt?x=17027f76e80000
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the 
>> commit:
>> Reported-by: syzbot+59dcc2e7283a6f5f5ba1@syzkaller.appspotmail.com
>> Fixes: ea4452de2ae9 ("mm: fix unexpected changes to 
>> {failslab|fail_page_alloc}.attr")
>>
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
>> R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
>>   </TASK>
>> ------------[ cut here ]------------
>> WARNING: CPU: 0 PID: 5107 at drivers/gpu/drm/drm_prime.c:227 
>> drm_prime_destroy_file_private+0x43/0x60 drivers/gpu/drm/drm_prime.c:227
>
> The warning is caused by !RB_EMPTY_ROOT(&prime_fpriv->dmabufs):
>
> drm_prime_destroy_file_private
> --> WARN_ON(!RB_EMPTY_ROOT(&prime_fpriv->dmabufs));
>
> It seems irrelevant to the logic of fault injection. So I don't see
> why the commit ea4452de2ae9 can cause this warning. :(

Making an educated guess I strongly think syzbot incorrectly bisected this.

What basically happens is that a DRM test case crashes because a file 
private data structure is destroyed before all DMA-bufs referring to it 
are destroyed.

Looks like a random race condition in a test case to me. Question is 
really what test is syzbot running and who is maintaining this test case?

Regards,
Christian.

>
>> Modules linked in:
>> CPU: 0 PID: 5107 Comm: syz-executor227 Not tainted 
>> 6.7.0-rc6-syzkaller-00248-g5254c0cbc92d #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, 
>> BIOS Google 11/17/2023
>> RIP: 0010:drm_prime_destroy_file_private+0x43/0x60 
>> drivers/gpu/drm/drm_prime.c:227
>> Code: 00 00 fc ff df 48 89 fa 48 c1 ea 03 80 3c 02 00 75 21 48 8b 83 
>> 90 00 00 00 48 85 c0 75 06 5b e9 13 f1 93 fc e8 0e f1 93 fc 90 <0f> 
>> 0b 90 5b e9 04 f1 93 fc e8 3f 9b ea fc eb d8 66 66 2e 0f 1f 84
>> RSP: 0018:ffffc90003bdf9e0 EFLAGS: 00010293
>> RAX: 0000000000000000 RBX: ffff888019f28378 RCX: ffffc90003bdf9b0
>> RDX: ffff888018ff9dc0 RSI: ffffffff84f380c2 RDI: ffff888019f28408
>> RBP: ffff888019f28000 R08: 0000000000000001 R09: 0000000000000001
>> R10: ffffffff8f193a57 R11: 0000000000000000 R12: ffff88814829a000
>> R13: ffff888019f282a8 R14: ffff88814829a068 R15: ffff88814829a0a0
>> FS:  0000000000000000(0000) GS:ffff8880b9800000(0000) 
>> knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007efe98050410 CR3: 000000006d1ff000 CR4: 0000000000350ef0
>> Call Trace:
>>   <TASK>
>>   drm_file_free.part.0+0x738/0xb90 drivers/gpu/drm/drm_file.c:290
>>   drm_file_free drivers/gpu/drm/drm_file.c:247 [inline]
>>   drm_close_helper.isra.0+0x180/0x1f0 drivers/gpu/drm/drm_file.c:307
>>   drm_release+0x22a/0x4f0 drivers/gpu/drm/drm_file.c:494
>>   __fput+0x270/0xb70 fs/file_table.c:394
>>   task_work_run+0x14d/0x240 kernel/task_work.c:180
>>   exit_task_work include/linux/task_work.h:38 [inline]
>>   do_exit+0xa8a/0x2ad0 kernel/exit.c:869
>>   do_group_exit+0xd4/0x2a0 kernel/exit.c:1018
>>   get_signal+0x23b5/0x2790 kernel/signal.c:2904
>>   arch_do_signal_or_restart+0x90/0x7f0 arch/x86/kernel/signal.c:309
>>   exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
>>   exit_to_user_mode_prepare+0x121/0x240 kernel/entry/common.c:204
>>   __syscall_exit_to_user_mode_work kernel/entry/common.c:285 [inline]
>>   syscall_exit_to_user_mode+0x1e/0x60 kernel/entry/common.c:296
>>   do_syscall_64+0x4d/0x110 arch/x86/entry/common.c:89
>>   entry_SYSCALL_64_after_hwframe+0x63/0x6b
>> RIP: 0033:0x7efe98014769
>> Code: Unable to access opcode bytes at 0x7efe9801473f.
>> RSP: 002b:00007efe97fd2208 EFLAGS: 00000246 ORIG_RAX: 00000000000000ca
>> RAX: fffffffffffffe00 RBX: 00007efe9809c408 RCX: 00007efe98014769
>> RDX: 0000000000000000 RSI: 0000000000000080 RDI: 00007efe9809c408
>> RBP: 00007efe9809c400 R08: 0000000000003131 R09: 0000000000003131
>> R10: 0000000000000000 R11: 0000000000000246 R12: 00007efe98069194
>> R13: 00007efe97fd2210 R14: 0000000000000002 R15: 6972642f7665642f
>>   </TASK>
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>> For information about bisection process see: 
>> https://goo.gl/tpsmEJ#bisection
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want syzbot to run the reproducer, reply with:
>> #syz test: git://repo/address.git branch-or-commit-hash
>> If you attach or paste a git patch, syzbot will apply it before testing.
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup

