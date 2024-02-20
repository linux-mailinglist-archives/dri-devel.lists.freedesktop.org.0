Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE9185BD9A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 14:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BC4910E416;
	Tue, 20 Feb 2024 13:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jtc3W6Lw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445E610E416
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 13:50:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcgvU4DfTbgljwqoaLT1n2Vt6Ale5E0HRnHfqZQWyGdQskOj94wDxXZ8FqIBTsAu7V19O+aZDq/TJ+FJzf6h4KeHrERviK/50OxrZvCOS4uSW9Yh9Ur9VAAMz+7Fd1NLjWydibhDfioNCRVADCaVLPQkGAi0se8KodQmk3QPvFBvnUlbhiZOXzwgCbeHzDQiN62cY8OO+DMav7FJzhqEkIuTf4FZ6FobBB3fH1K8vRYTVVm4Bk1L8KnOHWEmzhwihxag2Pjxe61k7+Hp47IZ9XY3SkqBUguQ33Usd26slWafVzpa0MAJ1dwbO+HfI9ZVooKSxtEcQhh4PaZPr4E7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mXtZYOMVkmdofdXwkkLsBPy2F8TXJzFwsZO+Cui8AmU=;
 b=iXXMCH5CWMo0JUyhzYCbduJMERQl6Er0xLFomMOhoAIM20/GmKKZ/p10jV00LMAakC7KhzKgxiLb1Ya6rbrgtzY3t6tZOFeT5DyQwVKiHhSMS8TIpU5EnC2QwUHOL5rRNtCMSJLRpvjdrvec7w6l7dguaqUqVCyr2H1mcSyN7mVMROnKbAz4FhIyhCDxLIGav/pUr6UrADvVi+PLoFsaZkvYYWdjCLqXBh1+X8ZuCq1btiDYLPzs2UZrqLp0MMuc+tdq5BLQQvyNpPPzX1G0Ev9540vlnfLS/iS0kxJbTms9W27NQVBEealj3608U9oCyWRjbROs+93M26wYznTtLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mXtZYOMVkmdofdXwkkLsBPy2F8TXJzFwsZO+Cui8AmU=;
 b=Jtc3W6Lw3htmUYaMoEmpLSRQktZHngPlE0kkcMbmq60GTKZBQReM/lI/3/yuVAqxruse5S1sxTgsfr1PLQxNJ7qtO66BOKWOO5Tg86Xk5uWkJHon6ePxDFtvRSbnSWS1pYfx/8W2jh/LXAv+eigDWYjjBzd8B/fjWvzAUsoItzk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CYXPR12MB9386.namprd12.prod.outlook.com (2603:10b6:930:de::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 13:50:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 13:50:11 +0000
Message-ID: <ae1ffd81-5026-4d64-b055-4f60090962a5@amd.com>
Date: Tue, 20 Feb 2024 14:50:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Content-Language: en-US
To: Erhard Furtner <erhard_f@mailbox.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
 <20240220134556.61f6441c@yea>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240220134556.61f6441c@yea>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CYXPR12MB9386:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b98ecb7-a7b2-47b0-e3ba-08dc321adb85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zRuqjgGtVfFMysATmV75sSuPGACt2UkFF9iVxkeTJcUHTnbXmrCcYLKS1WBa0v4DpTi5XNghoKwbb+nR7f3fIxnxuX8tDngLnWvYj6bENxdOre8NKYybAZ1srRQ4eJJ8EO6ibEEu4vu/U0V5nFkyVLop44ZxKvWSG7QEI5rBKcoMBmIfCmnnfd+fcmxgNGXzdzjheZF8XR50rShXEvWpwyAZ237d0WwHE+3HdHh14A37Hm29f3Py6UZzWV79F2hTqTS/wOR1L2qaYtxpGsIAUlYxuP9PmKGeFypMjNo+GMc79+na2ov79q28LD3ssDAzTgkxIhos1lkB8IanHat581W1INbYcAr7Way8TXHDJEevp7a3oTNbqpgfMI4Id1M+rzLFFAIAomQL637zzfYWhKjLx16ME/LsxRqR6oJ6xH/oEUGCy54LNuSNGCVHl5mbBIZlQfnnjwtXX5pavJIJwmsyIQcKXG0dxGEUg9LAg8pHi+FnvQT++LygmLWg8gVwwkSUB2V7/Fs0v0bfyt7ZmI5kd9Zu+iVE+1f5SnI21iaeobjQgawL3aJ212GE6vhz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFhoV2Z2WEdsbC9kVDRHWDFxVTVKNEdDUzJIZ3BYTmd2MFJPazJoVXhKRzZz?=
 =?utf-8?B?NVdsWTByci81KzhIeXlBRnQwQnJaYmFmZ3c1ZDBoWE1LYWVLOFFtMnFKZkR6?=
 =?utf-8?B?NVZqOGlJTkNYSTQ4Ty9hVGNmb2N6eWh4OGY0VlZFV1JONGFKQ1ZEMjg3U1kv?=
 =?utf-8?B?WVlQMFBoSmhrTWw2eUEwTkJxOU93bkxLLy8wZEozb0k2cXM5MnJjK2xIbW9M?=
 =?utf-8?B?clA4QTFMN3BoRmhXcW5vaUI1dkxuYlpMenN1VVNhNWI2V1dwTFE5MXFUR2Zu?=
 =?utf-8?B?SFNOd1hiTFFIZDFjMU1nUmxwZzBIZkZRNHNTc1JGNEJIN0NTRmx1QmcvZlBE?=
 =?utf-8?B?ZFhsMEZjUlZ3WW01dUJpS1pjTVF0UUpZbjV5ZnZWSVBSRTc2VnpZcWNDVVpF?=
 =?utf-8?B?UkFpWEdQdjJQa1F6L1drUHltdTJyanM2OUVCMTdoYWpmUlVMZit3ZGlPQnFU?=
 =?utf-8?B?T291dTljUE1UbU1uaUJrODVIT0JNeXo0MC9ZMVQyN0NlRHRpbE5GT3hwY281?=
 =?utf-8?B?UWlIS2pBNzZ2MHhFcFRESGE2MTFvd2xsRW9seFBQcVhFeGh5cG5uemp1eTRl?=
 =?utf-8?B?bWgwY05ibXJXWVhIc2Z2eGsyVXpoZCtHbERBTE1BeDQwS3YvV2VJV3J5andv?=
 =?utf-8?B?dWFiRlVWSkRxZVdIRVZBZnZmYlpEOTVxcE4welFTN1dSZGhTc1E1Y0prYkt5?=
 =?utf-8?B?cWJTRDNEdTdKQ1pTWTdweXV2MWtkeXpIS2UrZi9jUTlnRVhBVTR0em9yN04y?=
 =?utf-8?B?NENlSXJBTWRFWWp6TXNMK0F2b2pqcFZRRDFjamQzWmdxUUM2TnpwTlpNZWIw?=
 =?utf-8?B?VVpLSlpJYzRBUGJBeW9ncmF6eis3NU5DZ0xwcGJWeW5Sa052VDRpd2tLOG0v?=
 =?utf-8?B?c1BZZnpmUGFxWVNDc3ZzVjA1L2R6YytXejJESkNabHZUVTJlTWVJVHdVazBr?=
 =?utf-8?B?Rm1pTi95ajJVam5CNEVZNHpwbTEzR1pvSDV4N3k2Z2dsd1JDWXB1VGhrQ25N?=
 =?utf-8?B?NHVKWStrZ0tNVGpOTzIxVGRnckErSlgyRVBBM1VYSTJJbTRxTC9vdWJVd1Ru?=
 =?utf-8?B?QXVWbVI2NnRlak5kQ1BLZTMyZnhSeGFrWEV3N09LRmlvYUIyZmRYbFdLbC9Z?=
 =?utf-8?B?VnpHYndnU0xSUytsc3dhUGN4QjJvOGxZMUc2WllmUFozS0Z0cUEySGRGc2w3?=
 =?utf-8?B?NDVrS1c3V05mb3RrRGdEb1JkLzBVV0NWTStDUzd3UjdqcDZab3l6Z3VXOXFF?=
 =?utf-8?B?T0RmeGV4WU45b1ZqenVEM0FBM2NVZjdQam1Wc0hJYlQ4ZVBsWWRKSVlnT3NI?=
 =?utf-8?B?b1JPNnNWNWtKMThNbmVnajlSUkZidWh4U0pIV3luVkN1dDBkcXphbDdDWlEw?=
 =?utf-8?B?MXJ4Y2NBWVRGSnVVK281eGlZQ3BuaFhhTXFjRFlKeU1LY2JnRVVYTmt0Mitq?=
 =?utf-8?B?cFVmMGRRSmxKT25GOUhkcFBNL0x1NXVyNzJGUFJNeUVIQjhEVTE1ekNoTXp1?=
 =?utf-8?B?SUFXZitZVW1aK1IzNWVGOFBLMEY1L2FuZGkvRjc4dzdXejJpQnhadk01VjBa?=
 =?utf-8?B?anBNbUlYVUNZKzZRTzVCQ1hId3pTWkRLSXZ1Zm11SEZad01ic2JBUkt3aFlo?=
 =?utf-8?B?TDI0cFR6eEwwRkI5eGpLQW9aemtBYVlxY3hSVHQ0RkpnSEtmZ2p1VTZEcEJS?=
 =?utf-8?B?dmVmMnBDeVZoR0Rpck9zRU1VcjEwM0RmUWdEdktjVzF6VHR4RDlOdjBXQUl1?=
 =?utf-8?B?R052RmtjWThsSTBGOVcrbFo4cENwdWgyOUVaaElycUFJc1ZtY3haRVkxS3lE?=
 =?utf-8?B?OFpnbVQwQVhwOXdXbkFyNERSV016d2Eyc25yZDJZMXUramdUbTNyN09kWWVr?=
 =?utf-8?B?ckFiZGZsaDJxVUhjVnBKN0ZuUUx3NXU0ODZvSHFHWEUvUDJiNHZiY2tIMVUr?=
 =?utf-8?B?K0l1Zk14UVVxTGJNVVFGaFM1ZEdOU1ZpVEVlSW5wS0twOFQxcnNYVWVyQnBv?=
 =?utf-8?B?MGc3UjJxb08yK1UvdmlmWnRMdVNaVm9jOWVNMmtvU2ljRVo1di9pTDZEWUVs?=
 =?utf-8?B?UXFOU1ExdUl5bk1ZQ2pYTnlIK3cyLzVnYWdDaFBGYjZFTlBjd3YrZFZETHRX?=
 =?utf-8?Q?3LiuQtKkKcqdLlJGGiWaTliu5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b98ecb7-a7b2-47b0-e3ba-08dc321adb85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 13:50:11.6028 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: drG/fTXAe+ZnvxRBWkDRVx+9xZqVT+iCipJjT0GvnqNDbLTR31iLd5lSenoeKh3C
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9386
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

Hi Erhard,

Am 20.02.24 um 13:45 schrieb Erhard Furtner:
> On Tue, 20 Feb 2024 16:12:44 +0700
> Bagas Sanjaya <bagasdotme@gmail.com> wrote:
>
>>> [    0.000000] Linux version 6.7.5-Zen3 (root@supah) (gcc (Gentoo 13.2.1_p20240113-r1 p12) 13.2.1 20240113, GNU ld (Gentoo 2.41 p5) 2.41.0) #1 SMP Mon Feb 19 12:44:46 -00 2024
>> Is it vanilla kernel (i.e. no patches applied)? Can you also check current
>> mainline (v6.8-rc5)?
>>
>> Confused...
> Yes, this kernel was built from upstream git stable sources, no additional patches.
>
> It's just that I use my own custom kernel .config that's why I attached it. But the kernel should run in qemu too.

Yeah and that's probably the problem. The test is not supposed to be 
compiled and executed on bare metal, but rather just as unit test 
through user mode Linux.

We probably don't check that correctly in the kconfig for some reason. 
Can you provide your .config file?

Thanks,
Christian.

>
> Also the issue is reproducible on v6.8-rc5 (dmesg attached).
>
> Additionally I tried 'modprobe -v ttm-device-test' on v6.8-rc5 with KASAN enabled instead of KFENCE, same kernel .config otherwise. With KASAN I get a different dmesg and the test completes with a failure. And I don't seem to get memory corruption afterwards:
>
> [...]
> KTAP version 1
> 1..1
>      KTAP version 1
>      # Subtest: ttm_device
>      # module: ttm_device_test
>      1..5
>      ok 1 ttm_device_init_basic
>      # ttm_device_init_multiple: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:68
>      Expected list_count_nodes(&ttm_devs[0].device_list) == num_dev, but
>          list_count_nodes(&ttm_devs[0].device_list) == 4 (0x4)
>          num_dev == 3 (0x3)
>      not ok 2 ttm_device_init_multiple
>      ok 3 ttm_device_fini_basic
> ------------[ cut here ]------------
> WARNING: CPU: 5 PID: 2146 at drivers/gpu/drm/ttm/ttm_device.c:206 ttm_device_init+0x23/0x281 [ttm]
> Modules linked in: ttm_device_test ttm_kunit_helpers drm_kunit_helpers kunit rfkill dm_crypt nhpoly1305_avx2 nhpoly1305 chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher amdgpu wmi_bmof amd64_edac edac_mce_amd snd_hda_codec_hdmi input_leds snd_hda_intel amdxcp snd_intel_dspcfg kvm_amd snd_hda_codec snd_hwdep snd_hda_core mfd_core snd_pcm gpu_sched snd_timer video drm_suballoc_helper snd i2c_algo_bit drm_ttm_helper gpio_amdpt soundcore ttm drm_exec button drm_display_helper rapl gpio_generic wmi drm_buddy k10temp evdev joydev lz4 lz4_compress lz4_decompress sg zram nct6775 nct6775_core hwmon_vid hwmon loop configfs hid_generic usbhid hid sha512_ssse3 sha512_generic sha256_ssse3 sha1_ssse3 sha1_generic aesni_intel xhci_pci libaes xhci_hcd crypto_simd ccp cryptd usbcore usb_common sunrpc dm_mod pkcs8_key_parser efivarfs
> CPU: 5 PID: 2146 Comm: kunit_try_catch Tainted: G    B            N 6.8.0-rc5-Zen3 #3
> Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4, BIOS P3.40 01/18/2024
> RIP: 0010:ttm_device_init+0x23/0x281 [ttm]
> Code: 31 ff e9 fa e4 d5 e6 f3 0f 1e fa 41 57 41 56 41 55 41 54 55 53 48 83 ec 18 8b 44 24 50 48 89 14 24 89 44 24 0c 4d 85 c0 75 0c <0f> 0b bd ea ff ff ff e9 2f 02 00 00 48 89 fb 49 89 f7 49 89 ce 4d
> RSP: 0018:ffffc9000611fcf8 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff888190184000 RCX: ffff888100651b18
> RDX: ffff88817d4a6400 RSI: ffffffffc2033d40 RDI: ffff888106abc000
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: ffff888106abc000 R14: 0000000000000000 R15: ffff888100651b18
> FS:  0000000000000000(0000) GS:ffff8887de880000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007feb67e03b20 CR3: 00000001608ac000 CR4: 0000000000b50ef0
> Call Trace:
>   <TASK>
>   ? __warn+0x113/0x14c
>   ? ttm_device_init+0x23/0x281 [ttm]
>   ? report_bug+0x1b3/0x229
>   ? ttm_device_init+0x23/0x281 [ttm]
>   ? handle_bug+0x3c/0x7c
>   ? exc_invalid_op+0x17/0x46
>   ? asm_exc_invalid_op+0x1a/0x20
>   ? ttm_device_init+0x23/0x281 [ttm]
>   ? local_clock_noinstr+0xc/0xa8
>   ttm_device_kunit_init+0xf1/0x10f [ttm_kunit_helpers]
>   ttm_device_init_no_vma_man+0x145/0x1e7 [ttm_device_test]
>   ? ttm_device_init_pools+0x61e/0x61e [ttm_device_test]
>   ? srso_alias_return_thunk+0x5/0xfbef5
>   ? srso_alias_return_thunk+0x5/0xfbef5
>   ? timekeeping_get_ns+0x60/0xf8
>   ? srso_alias_return_thunk+0x5/0xfbef5
>   ? ktime_get_ts64+0x68/0x109
>   kunit_try_run_case+0x269/0x3cc [kunit]
>   ? kunit_try_run_case_cleanup+0xc2/0xc2 [kunit]
>   ? srso_alias_return_thunk+0x5/0xfbef5
>   ? do_raw_spin_unlock+0x5d/0x1b6
>   ? srso_alias_return_thunk+0x5/0xfbef5
>   ? kunit_try_catch_throw+0x6a/0x6a [kunit]
>   ? kunit_try_run_case_cleanup+0xc2/0xc2 [kunit]
>   kunit_generic_run_threadfn_adapter+0x54/0x86 [kunit]
>   kthread+0x25e/0x26d
>   ? kthread_complete_and_exit+0x1f/0x1f
>   ret_from_fork+0x23/0x54
>   ? kthread_complete_and_exit+0x1f/0x1f
>   ret_from_fork_asm+0x11/0x20
>   </TASK>
> ---[ end trace 0000000000000000 ]---
>      ok 4 ttm_device_init_no_vma_man
>          KTAP version 1
>          # Subtest: ttm_device_init_pools
>          ok 1 No DMA allocations, no DMA32 required
>          ok 2 DMA allocations, DMA32 required
>          ok 3 No DMA allocations, DMA32 required
>          ok 4 DMA allocations, no DMA32 required
>      # ttm_device_init_pools: pass:4 fail:0 skip:0 total:4
>      ok 5 ttm_device_init_pools
> # ttm_device: pass:4 fail:1 skip:0 total:5
> # Totals: pass:7 fail:1 skip:0 total:8
> not ok 1 ttm_device
> [...]
>
>
> Regards,
> Erhard

