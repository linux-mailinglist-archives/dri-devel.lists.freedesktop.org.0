Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F90085BD26
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 14:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C28B10E3E9;
	Tue, 20 Feb 2024 13:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="w9NlLRQt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060.outbound.protection.outlook.com [40.107.237.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CC410E3ED
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 13:29:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lGCY+gQBMtpZF5bakz0HPB0lSBwsn9zl75Bo0D4t8id2xZxEvCKz2/gHauGQhhNa5/ZLUCenqKYOJ16O73QJ93xTJI1QIxaVDn8n3o5U5JYPzRaTlYF0DAs9fzEtnB4Tg9D56d6SosROHApoC9ZRGuQvpfuY4+43uKlqFupn8ZRKItvqPc64QbjDDeh93IUiGXcZDfW5Rmub/WocfRMv2dELqkns3SDt6z5idTY39omDbjiroDnirThL7+2Zc2useNvVXL0vqgJm+aL4Ne4KWU2eQ/cxiHQtx5omNNPYUrM7WaKk/mP5zM3n7XaaHOmjdrETVkgLYu/u0U6zFssmoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zvv1m0sAc5KPDEdeB+n7daTBdDz5QXxrlb/QnzhJbaM=;
 b=F2bs1UA8n9Wr2ZagzCQ0g7jwaVY1+eS7PL2xZv1Xer0lmhtGxqLsYD4mJf5YmaNrjV6JlFhiId4YXdNxrx3sHR2KZYw7lsZeW/hiTvkvbE5h7ifm+7pnig9+/tXjsOkTfsjXEnolcGFxTh2lJ7indaIvkqwNMC17YXs4OYrvvo6uAGUdwiqzjLPaF1x3hvvGsJ4jyc7W4WrUyN9ngfcdmt7cEeG+l+ENKhUN1mBV8oJ4u7Xi30AUoJM1aH3SJJnuaMdCMBP5vMR7Wt9CqijKlDhQUeF3jIRvH8vXKF2zgvUUBKhpE4YEirjCR42xshxmT56IDPEzplZnC7PWigfHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zvv1m0sAc5KPDEdeB+n7daTBdDz5QXxrlb/QnzhJbaM=;
 b=w9NlLRQtaMYg6O0C4uFa3EsfO0Qtv2GrEky9UeQHHqwuuky0+qslenv+8hiecozZAYNrufdxx6hr00dyoqjzIo2htaJ5uXn/aBmJg1OCB1StO6PXOrkEWsA+MXHny0KY60kIw/zRodSODWfJ7VGukRV/FRe+Xt+8pq7IyocLr1o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7384.namprd12.prod.outlook.com (2603:10b6:303:22b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15; Tue, 20 Feb
 2024 13:29:12 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 13:29:11 +0000
Message-ID: <9cdf0baa-f544-4fa8-bee3-568b790527cc@amd.com>
Date: Tue, 20 Feb 2024 14:28:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Running ttm_device_test leads to list_add corruption. prev->next
 should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b.
 (prev=ffffa0b1a5c034f0) (kernel 6.7.5)
Content-Language: en-US
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Erhard Furtner <erhard_f@mailbox.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Huang Rui <ray.huang@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Karolina Stolarek <karolina.stolarek@intel.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <20240219230116.77b8ad68@yea> <ZdRtDOhQGQUm5X4d@archie.me>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZdRtDOhQGQUm5X4d@archie.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0267.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7384:EE_
X-MS-Office365-Filtering-Correlation-Id: 8af2c733-8486-4e21-106b-08dc3217ec68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8FXUUeKEijyhKyDn1VKwBGizxZkyheQ2LblOD2FGTlEIJQAfQEgj/hnt/J4r0NTAakCDQq/LO096AkoSfED3LuFzGYd9TZmBq1a6PI0YN941SJpLV7VN0Bh2dOXTwGM1HaTkp5czj5BUpFersdaChWKq54Kcen1A5vBcwz8IWTfXZtMmtg56Mqx/39rZ9Quy6Py7/AKSnXoNUeE+/8GoAL8yfDfMcTlqXXsengS81uOl0N+EpDujw9GWK5WBN61gUEOl3HkCkvyEPjgpV635j4+ROkBleumdiP7u6mgkmxu1Q24gDUGNlndx7afAONXuF1o52FoDlbKuq1NKe70Hs2HG/brHMqs1Fxbpa1laPiuvKTzlm1JHulrwvy0Qu0Ht0kuIQvSWguC9EzS83un55LTiMWnUqvHTmqRJTU/r8boH7c4fL4eS8aDGh8+WdY+oUTxMRm0xvbKIaEHfz3Ac/P/WbS3/NX8f0o7mvBSRjsevQULlDg5Cc+ek1RZzbHwg5lmcxOI0T7itTwu3joR7cn8+SCINRRvvGz12R15K4Ksn+6WPcvQXiAbyP4wcv+qLoAYj1o54tgBXmBVPas33NPqhmuaGqqWYW/F73lVO1iU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(921011); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVlsYzJRclpJZDhlMThoTW9xMFRvU0xGdVhzdm0wNHNOMk8va3BucTk2aEcw?=
 =?utf-8?B?NUxPL1YxTDg4akYwZEcyN2orV2JnNURiYzZEZGlzWGd3cmtYK0YwcjVmY0kw?=
 =?utf-8?B?dTd3em0zbjFnRWcwYjVERWFzRU4wQnpGSDNLeVVVWFV6bUR2UTNJMjhUYUJL?=
 =?utf-8?B?cWhJdFowKzlyM0pmaVpQMUdWNWcvcWQ3WURITmJWeDd5dE9zdGNPMHNoSnl6?=
 =?utf-8?B?VjdJVW93MUV1KzZWZnJ3ZlNtOE9ZdG1kejJTNkdMTVdDbXdvSVpkOWNtRW9s?=
 =?utf-8?B?UUQ5VCs3cFd6djZRNDJvc2VGb0s1R0hYY1JJSHNsOWpnQlRwalhLc2VZY2pS?=
 =?utf-8?B?ZHU0SDJpaHVNTERNZ3FaZFpCTy9qaEQxMTNoSEVBNWxqVG5VRmNBUlNxQ1B5?=
 =?utf-8?B?UGJ6RVZIK3dlaFprWDBWUTZFWlpzQlBWMEI0Q29QaTZsYnBXMXJTNS9jZW1H?=
 =?utf-8?B?TXFSVGJSNytEUTl0WXgzMUE3eU80Sm9IVk5zeGtwQWY2czZjZXhJQmUzdGVQ?=
 =?utf-8?B?Rjh2bVNjMHZBcUtvaUVHeXQ1Rk1LQ25YWUtKbW1yNnVtdmFtZXZTVlRKZUla?=
 =?utf-8?B?TGx6bVNxSm52RVZXZFN4a0JBY3RzNlRqblcxMC9GN0wzb2ZWNTFjODFWbGpa?=
 =?utf-8?B?SitORXo0S1NXcWVyNUFhWEQyQ2lTTU16TDgwenh4YkxIOGk1R29SRXU1Wllj?=
 =?utf-8?B?WEFjWHMvQ3BRRXBGeW1leERNU1NUTG5wb3p1WXA5SzhuRExMcFNEa1VUZHFX?=
 =?utf-8?B?anRyWW1HT25FUlBZaWMzVHFtVVJCWld2UVNsQmVlOHRlNWdKRUwzUFVvNW9u?=
 =?utf-8?B?aEduRXJiYmQ4aUFHQlhWaHEvT0xDR0tFekdVemwwdkh5K1Q5cFdhdWp1MUlS?=
 =?utf-8?B?SGN0dHJuVmxLSHdiODI5d0pFdStyUDhXb2U1NitHV0oxYkFEdGJmRWhEZUdq?=
 =?utf-8?B?RlYwRVJsQXo3QUEyTThnMjFVbnZiOEx5SmtQT2V4UXJXODlJT3RKa3NoWWN0?=
 =?utf-8?B?eEk4WDdkN3VBbHpIcXRQSnk0ajZ1RnlGN1lIL3NnR3ZRc1lDaGpIUjhJR2JJ?=
 =?utf-8?B?Y3NkMlNMVEZmZVJGNFlUTFBmSitQa29WSWJpWnV0bEdXbEhNaGhTanYyc3ln?=
 =?utf-8?B?ZWVqQnhSQ0RNbHMwaFl1am1FTTI3ZllOazdDaE1zQjVKdTI1Q0MvU1B4WXRQ?=
 =?utf-8?B?OEN0b0VxZG8wdlJ0NVhyTS8wczJydE9Ra3RZTFpBVlJ4aHJCYk5FaVI5OEhw?=
 =?utf-8?B?M1lGNkFHQ3A5UTNnUGh3SWNLYkFHeXo5MTlCZlRZa1BqSHlEYnVFNElHSkY3?=
 =?utf-8?B?VytCTnRSdkFBR1BqZGZKcWVGanphanp0azM3Mk5tVHlhNDN0aWVMMS95N3lE?=
 =?utf-8?B?emRiV3pSTEMzUytZblZuWHllWml3OWlLajVvYjhmM0dJQ01qZVo0Yk94Ty9u?=
 =?utf-8?B?Rlo2TFgrRkwzS0dPQUtCWUFxYVRsSFVObS83eStLWFM4RDQxTU0vWm9vMzEy?=
 =?utf-8?B?cHdSQmZqS0huZUU5WCt2N3NVcGVQNjJnZG5MMldTdFVBbER0aUV4TENyODFH?=
 =?utf-8?B?aVBzMm9Hams4L1FhcExlZ1NjSkN6T0hzUmdDYmlBdks2QVV6bktxVkxneWs1?=
 =?utf-8?B?aGN5aWF5c29YSCtTYzBOMzJ4ZE5KN2s3ZlRBZnFqTmg0Uzl5cnpxRzJNc0Zt?=
 =?utf-8?B?Wmp5NXBTUk1BZFlkby9IYXV0cHJlbnBrWXA0cFNtVWg4bWZLaWU3a1NZSThP?=
 =?utf-8?B?dlpEZUVaVnA1VDZPVzgxSUEwOWwrQWxZOUlmcTBRSEdPTGFIU1hvdmM4Zkcr?=
 =?utf-8?B?ZVFMcjFhWTlzTUpFaVplS05XWFZlUTZhRzBQVzBJT214RkRqcEp1NlJ3U1Rw?=
 =?utf-8?B?L2FkelVEbTdUWXBzMitST0pGUmJEQnpVWWV1Y3QzZHBnUzZuN29IYisvbGgy?=
 =?utf-8?B?QmFmajQ0bXgwNXZYUjRRWDJGd3BaN01NZDhNa2szancwZ0IydDZQSHI5SWpr?=
 =?utf-8?B?Q0d4c2hDcHBaQWVXejBXejV2aGRSbkVGQkp6TmNTN2hHTjNHL2UrWkZma0FZ?=
 =?utf-8?B?T0tXSXprTVo4WjVGdEdLT3VCNkVsUTFDODVTa2xteUJRSW5pWVpSZWZXRzJo?=
 =?utf-8?Q?1xWg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8af2c733-8486-4e21-106b-08dc3217ec68
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 13:29:11.4697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgZQn52LGF6TAS57r5R3OTlejtEEjKEfF57KRIiGFcg2oDFstPvUPk3KKmRQ67Lb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7384
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

Am 20.02.24 um 10:12 schrieb Bagas Sanjaya:
> On Mon, Feb 19, 2024 at 11:01:16PM +0100, Erhard Furtner wrote:
>> Greetings!
>>
>> 'modprobe -v ttm-device-test' on my Ryzen 5950X amd64 box and on my Talos II (ppc64) leads to immediate list_add corruption.
>>
>> The machines stay useable via VNC but the issue seems to cause memory corruption which shows up later on when PAGE_POISONING is enabled:
>>
>> [...]
>> KTAP version 1
>> 1..1
>>      KTAP version 1
>>      # Subtest: ttm_device
>>      # module: ttm_device_test
>>      1..5
>>      ok 1 ttm_device_init_basic
>>      # ttm_device_init_multiple: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_device_test.c:68
>>      Expected list_count_nodes(&ttm_devs[0].device_list) == num_dev, but
>>          list_count_nodes(&ttm_devs[0].device_list) == 4 (0x4)
>>          num_dev == 3 (0x3)
>>      not ok 2 ttm_device_init_multiple
>> list_add corruption. prev->next should be next (ffffffffc05cd428), but was 6b6b6b6b6b6b6b6b. (prev=ffffa0b1a5c034f0).
>> ------------[ cut here ]------------
>> kernel BUG at lib/list_debug.c:32!
>> invalid opcode: 0000 [#1] SMP NOPTI
>> CPU: 6 PID: 2129 Comm: kunit_try_catch Tainted: G                 N 6.7.5-Zen3 #1
>> Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4, BIOS P3.40 01/18/2024
>> RIP: 0010:__list_add_valid_or_report+0x67/0x9c
>> Code: c7 c7 26 ff c4 90 48 89 c6 e8 2f 32 ca ff 0f 0b 4c 8b 02 49 39 f0 74 14 48 89 d1 48 c7 c7 78 ff c4 90 4c 89 c2 e8 13 32 ca ff <0f> 0b 48 39 d7 74 05 4c 39 c7 75 17 48 89 f1 48 89 c2 48 89 fe 48
>> RSP: 0018:ffffb23b05d27df8 EFLAGS: 00010246
>> RAX: 0000000000000075 RBX: 0000000000000000 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> RBP: ffffa0b1a5c034f0 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0b1843b2628
>> R13: ffffa0b1b7c1f478 R14: ffffffffc0696480 R15: ffffa0b1a5c11000
>> FS:  0000000000000000(0000) GS:ffffa0b85eb80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ff09c005038 CR3: 000000026ce14000 CR4: 0000000000b50ef0
>> Call Trace:
>>   <TASK>
>>   ? __die_body+0x15/0x65
>>   ? die+0x2f/0x48
>>   ? do_trap+0x76/0x109
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ? do_error_trap+0x69/0xa6
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ? exc_invalid_op+0x4d/0x71
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ? asm_exc_invalid_op+0x1a/0x20
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ? __list_add_valid_or_report+0x67/0x9c
>>   ttm_device_init+0x10e/0x157 [ttm]
>>   ttm_device_kunit_init+0x3d/0x51 [ttm_kunit_helpers]
>>   ttm_device_fini_basic+0x6d/0x1b3 [ttm_device_test]
>>   ? timekeeping_get_ns+0x19/0x3b
>>   ? srso_alias_return_thunk+0x5/0xfbef5
>>   ? ktime_get_ts64+0x40/0x92
>>   kunit_try_run_case+0xaf/0x163 [kunit]
>>   ? kunit_try_catch_throw+0x1b/0x1b [kunit]
>>   ? kunit_try_catch_throw+0x1b/0x1b [kunit]
>>   kunit_generic_run_threadfn_adapter+0x15/0x20 [kunit]
>>   kthread+0xcf/0xd7
>>   ? kthread_complete_and_exit+0x1a/0x1a
>>   ret_from_fork+0x23/0x35
>>   ? kthread_complete_and_exit+0x1a/0x1a
>>   ret_from_fork_asm+0x11/0x20
>>   </TASK>
>> Modules linked in: ttm_device_test ttm_kunit_helpers drm_kunit_helpers kunit rfkill dm_crypt nhpoly1305_avx2 nhpoly1305 chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher input_leds joydev hid_generic usbhid hid amdgpu snd_hda_codec_hdmi amd64_edac snd_hda_intel amdxcp mfd_core snd_intel_dspcfg edac_mce_amd gpu_sched snd_hda_codec video snd_hwdep drm_suballoc_helper snd_hda_core i2c_algo_bit drm_ttm_helper snd_pcm wmi_bmof ttm snd_timer evdev drm_exec snd drm_display_helper soundcore kvm_amd k10temp drm_buddy rapl wmi gpio_amdpt gpio_generic button lz4 lz4_compress lz4_decompress zram sg nct6775 nct6775_core hwmon_vid hwmon loop configfs sha512_ssse3 sha512_generic sha256_ssse3 sha1_ssse3 sha1_generic aesni_intel libaes crypto_simd cryptd xhci_pci xhci_hcd ccp usbcore usb_common sunrpc dm_mod pkcs8_key_parser efivarfs
>> ---[ end trace 0000000000000000 ]---
>> RIP: 0010:__list_add_valid_or_report+0x67/0x9c
>> Code: c7 c7 26 ff c4 90 48 89 c6 e8 2f 32 ca ff 0f 0b 4c 8b 02 49 39 f0 74 14 48 89 d1 48 c7 c7 78 ff c4 90 4c 89 c2 e8 13 32 ca ff <0f> 0b 48 39 d7 74 05 4c 39 c7 75 17 48 89 f1 48 89 c2 48 89 fe 48
>> RSP: 0018:ffffb23b05d27df8 EFLAGS: 00010246
>> RAX: 0000000000000075 RBX: 0000000000000000 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> RBP: ffffa0b1a5c034f0 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0b1843b2628
>> R13: ffffa0b1b7c1f478 R14: ffffffffc0696480 R15: ffffa0b1a5c11000
>> FS:  0000000000000000(0000) GS:ffffa0b85eb80000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007ff09c005038 CR3: 000000026ce14000 CR4: 0000000000b50ef0
>> Key type dns_resolver registered
>> NFS: Registering the id_resolver key type
>> Key type id_resolver registered
>> Key type id_legacy registered
>>      # ttm_device_fini_basic: try timed out
>> general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#2] SMP NOPTI
>> CPU: 26 PID: 2119 Comm: modprobe Tainted: G      D          N 6.7.5-Zen3 #1
>> Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4, BIOS P3.40 01/18/2024
>> RIP: 0010:kthread_stop+0x3c/0x78
>> Code: f0 0f c1 43 28 be 02 00 00 00 85 c0 74 0c 8d 50 01 09 c2 79 0a be 01 00 00 00 e8 f5 31 37 00 48 89 df e8 35 f1 ff ff 48 89 c5 <f0> 80 08 02 48 89 df e8 6a ff ff ff f0 80 4b 02 02 48 89 df e8 f6
>> RSP: 0018:ffffb23b01fff938 EFLAGS: 00010246
>> RAX: 6b6b6b6b6b6b6b6b RBX: ffffa0b170ab6040 RCX: 0000000000000000
>> RDX: 000000006b6b6b6f RSI: 0000000000000002 RDI: 0000000000000000
>> RBP: 6b6b6b6b6b6b6b6b R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0b170ab6040
>> R13: 0000000000000000 R14: 0000000000000001 R15: 0000000000000000
>> FS:  00007f9321e6ec40(0000) GS:ffffa0b85f080000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00005592ea51ef40 CR3: 0000000189590000 CR4: 0000000000b50ef0
>> Call Trace:
>>   <TASK>
>>   ? __die_body+0x15/0x65
>>   ? die_addr+0x37/0x50
>>   ? exc_general_protection+0x1b6/0x1ec
>>   ? asm_exc_general_protection+0x26/0x30
>>   ? kthread_stop+0x3c/0x78
>>   ? kthread_stop+0x39/0x78
>>   kunit_try_catch_run+0xc9/0x155 [kunit]
>>   kunit_run_case_catch_errors+0x3f/0x93 [kunit]
>>   kunit_run_tests+0x182/0x516 [kunit]
>>   ? kunit_try_run_case_cleanup+0x39/0x39 [kunit]
>>   ? kunit_catch_run_case_cleanup+0x85/0x85 [kunit]
>>   __kunit_test_suites_init+0x64/0x83 [kunit]
>>   kunit_module_notify+0xda/0x177 [kunit]
>>   notifier_call_chain+0x5a/0x92
>>   blocking_notifier_call_chain+0x3e/0x60
>>   do_init_module+0xcb/0x218
>>   init_module_from_file+0x7a/0x99
>>   __do_sys_finit_module+0x162/0x223
>>   do_syscall_64+0x6e/0xd8
>>   entry_SYSCALL_64_after_hwframe+0x4b/0x53
>> RIP: 0033:0x7f9321f7a479
>> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 87 89 0c 00 f7 d8 64 89 01 48
>> RSP: 002b:00007ffe2e350908 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> RAX: ffffffffffffffda RBX: 00005590b57cef40 RCX: 00007f9321f7a479
>> RDX: 0000000000000000 RSI: 00005590b5100c7c RDI: 0000000000000007
>> RBP: 0000000000000000 R08: 00007f9322043b20 R09: 0000000000000000
>> R10: 0000000000000050 R11: 0000000000000246 R12: 0000000000040000
>> R13: 00005590b5100c7c R14: 00005590b57cefe0 R15: 0000000000000000
>>   </TASK>
>> Modules linked in: nfsv4 dns_resolver nfs lockd grace ttm_device_test ttm_kunit_helpers drm_kunit_helpers kunit rfkill dm_crypt nhpoly1305_avx2 nhpoly1305 chacha_generic chacha_x86_64 libchacha adiantum libpoly1305 algif_skcipher input_leds joydev hid_generic usbhid hid amdgpu snd_hda_codec_hdmi amd64_edac snd_hda_intel amdxcp mfd_core snd_intel_dspcfg edac_mce_amd gpu_sched snd_hda_codec video snd_hwdep drm_suballoc_helper snd_hda_core i2c_algo_bit drm_ttm_helper snd_pcm wmi_bmof ttm snd_timer evdev drm_exec snd drm_display_helper soundcore kvm_amd k10temp drm_buddy rapl wmi gpio_amdpt gpio_generic button lz4 lz4_compress lz4_decompress zram sg nct6775 nct6775_core hwmon_vid hwmon loop configfs sha512_ssse3 sha512_generic sha256_ssse3 sha1_ssse3 sha1_generic aesni_intel libaes crypto_simd cryptd xhci_pci xhci_hcd ccp usbcore usb_common sunrpc dm_mod pkcs8_key_parser efivarfs
>> ---[ end trace 0000000000000000 ]---
>> RIP: 0010:__list_add_valid_or_report+0x67/0x9c
>> Code: c7 c7 26 ff c4 90 48 89 c6 e8 2f 32 ca ff 0f 0b 4c 8b 02 49 39 f0 74 14 48 89 d1 48 c7 c7 78 ff c4 90 4c 89 c2 e8 13 32 ca ff <0f> 0b 48 39 d7 74 05 4c 39 c7 75 17 48 89 f1 48 89 c2 48 89 fe 48
>> RSP: 0018:ffffb23b05d27df8 EFLAGS: 00010246
>> RAX: 0000000000000075 RBX: 0000000000000000 RCX: 0000000000000000
>> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
>> RBP: ffffa0b1a5c034f0 R08: 0000000000000000 R09: 0000000000000000
>> R10: 0000000000000000 R11: 0000000000000000 R12: ffffa0b1843b2628
>> R13: ffffa0b1b7c1f478 R14: ffffffffc0696480 R15: ffffa0b1a5c11000
>> FS:  00007f9321e6ec40(0000) GS:ffffa0b85f080000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00005592ea51ef40 CR3: 0000000189590000 CR4: 0000000000b50ef0
>> =============================================================================
>> BUG task_struct (Tainted: G      D          N): Poison overwritten
>> -----------------------------------------------------------------------------
>>
>> 0xffffa0b170ab6068-0xffffa0b170ab6068 @offset=24680. First byte 0x6c instead of 0x6b
>> Slab 0xffffea8944c2ac00 objects=8 used=8 fp=0x0000000000000000 flags=0x4000000000000840(slab|head|zone=1)
>> Object 0xffffa0b170ab6040 @offset=24640 fp=0x0000000000000000
>>
>> Redzone  ffffa0b170ab6000: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  ffffa0b170ab6010: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  ffffa0b170ab6020: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  ffffa0b170ab6030: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Object   ffffa0b170ab6040: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   ffffa0b170ab6050: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   ffffa0b170ab6060: 6b 6b 6b 6b 6b 6b 6b 6b 6c 6b 6b 6b 6b 6b 6b 6b  kkkkkkkklkkkkkkk
>> Object   ffffa0b170ab6070: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> [...]
>> Object   ffffa0b170ab6fb0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   ffffa0b170ab6fc0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
>> Redzone  ffffa0b170ab6fd0: bb bb bb bb bb bb bb bb                          ........
>> Padding  ffffa0b170ab6fe0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  ffffa0b170ab6ff0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> CPU: 13 PID: 2 Comm: kthreadd Tainted: G      D          N 6.7.5-Zen3 #1
>> Hardware name: To Be Filled By O.E.M. B550M Pro4/B550M Pro4, BIOS P3.40 01/18/2024
>> Call Trace:
>>   <TASK>
>>   dump_stack_lvl+0x37/0x52
>>   check_bytes_and_report+0xa7/0x107
>>   check_object+0x157/0x253
>>   alloc_debug_processing+0x5d/0x111
>>   ___slab_alloc+0x288/0x561
>>   ? copy_process+0x35f/0x2276
>>   ? kthread_is_per_cpu+0x22/0x22
>>   ret_from_fork+0x23/0x35
>>   ? kthread_is_per_cpu+0x22/0x22
>>   ret_from_fork_asm+0x11/0x20
>>   </TASK>
>> FIX task_struct: Restoring Poison 0xffffa0b170ab6068-0xffffa0b170ab6068=0x6b
>> FIX task_struct: Marking all objects used
>>
>>
>> The Talos II ppc64 trace looks a bit different:
>>
>> [...]
>> KTAP version 1
>> 1..1
>>      KTAP version 1
>>      # Subtest: ttm_pool
>>      # module: ttm_pool_test
>>      1..8
>>          KTAP version 1
>>          # Subtest: ttm_pool_alloc_basic
>>          ok 1 One page
>>          ok 2 More than one page
>>          ok 3 Above the allocation limit
>>      # ttm_pool_alloc_basic: ASSERTION FAILED at drivers/gpu/drm/ttm/tests/ttm_pool_test.c:162
>>      Expected err == 0, but
>>          err == -12 (0xfffffffffffffff4)
>>          not ok 4 One page, with coherent DMA mappings enabled
>> list_add corruption. prev->next should be next (c00800000cf64fc0), but was 0000000000000000. (prev=c0002000061a4ad0).
>> ------------[ cut here ]------------
>> kernel BUG at lib/list_debug.c:32!
>> Oops: Exception in kernel mode, sig: 5 [#1]
>> BE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=32 NUMA PowerNV
>> Modules linked in: ttm_pool_test ttm_kunit_helpers drm_kunit_helpers kunit snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill input_leds evdev hid_generic usbhid hid radeon xts xhci_pci ctr xhci_hcd drm_suballoc_helper i2c_algo_bit drm_ttm_helper cbc ttm aes_generic ofpart usbcore libaes powernv_flash drm_display_helper at24 vmx_crypto gf128mul mtd backlight usb_common regmap_i2c opal_prd ibmpowernv lz4 lz4_compress lz4_decompress zram pkcs8_key_parser powernv_cpufreq loop dm_mod configfs
>> CPU: 29 PID: 934 Comm: kunit_try_catch Tainted: G                TN 6.7.5-gentoo-P9 #1
>> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
>> NIP:  c000000000864744 LR: c000000000864740 CTR: 0000000000000000
>> REGS: c000200015333a30 TRAP: 0700   Tainted: G                TN  (6.7.5-gentoo-P9)
>> MSR:  9000000000029032 <SF,HV,EE,ME,IR,DR,RI>  CR: 24000222  XER: 00000000
>> CFAR: c0000000001d5620 IRQMASK: 0
>> GPR00: 0000000000000000 c000200015333cd0 c0000000011b4700 0000000000000075
>> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR12: 0000000000000000 c0002007fa4d5e00 c000000000182548 c0002000066aa1c0
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR24: 0000000000000000 c0002000061a4010 c00800000cf64fc0 c0002000061a4020
>> GPR28: c0002000061a4ad0 c00800000cf64fa8 c00800000cf64fa0 c0002000061a4010
>> NIP [c000000000864744] __list_add_valid_or_report+0xd4/0x120
>> LR [c000000000864740] __list_add_valid_or_report+0xd0/0x120
>> Call Trace:
>> [c000200015333cd0] [c000000000864740] __list_add_valid_or_report+0xd0/0x120 (unreliable)
>> [c000200015333d30] [c00800000cf5eed8] ttm_pool_type_init+0xa0/0x120 [ttm]
>> [c000200015333d80] [c00800000cf5efec] ttm_pool_init+0x94/0x170 [ttm]
>> [c000200015333de0] [c00800000cc6b324] ttm_pool_alloc_basic+0x9c/0x670 [ttm_pool_test]
>> [c000200015333ea0] [c00800000bddf7f0] kunit_try_run_case+0xb8/0x220 [kunit]
>> [c000200015333f60] [c00800000bde27c8] kunit_generic_run_threadfn_adapter+0x30/0x50 [kunit]
>> [c000200015333f90] [c000000000182670] kthread+0x130/0x140
>> [c000200015333fe0] [c00000000000d030] start_kernel_thread+0x14/0x18
>> Code: f8010070 4b970ea9 60000000 0fe00000 7c0802a6 3c62fff1 7d064378 7d244b78 38639600 f8010070 4b970e85 60000000 <0fe00000> 7c0802a6 3c62fff1 7ca62b78
>> ---[ end trace 0000000000000000 ]---
>>
>> note: kunit_try_catch[934] exited with irqs disabled
>>      # ttm_pool_alloc_basic: try timed out
>> BUG: Unable to handle kernel data access at 0x6b6b6b6b6b6b6b6b
>> Faulting instruction address: 0xc000000000181ae4
>> Oops: Kernel access of bad area, sig: 11 [#2]
>> BE PAGE_SIZE=4K MMU=Radix SMP NR_CPUS=32 NUMA PowerNV
>> Modules linked in: ttm_pool_test ttm_kunit_helpers drm_kunit_helpers kunit snd_hrtimer snd_seq snd_seq_device snd_timer snd soundcore cfg80211 rfkill input_leds evdev hid_generic usbhid hid radeon xts xhci_pci ctr xhci_hcd drm_suballoc_helper i2c_algo_bit drm_ttm_helper cbc ttm aes_generic ofpart usbcore libaes powernv_flash drm_display_helper at24 vmx_crypto gf128mul mtd backlight usb_common regmap_i2c opal_prd ibmpowernv lz4 lz4_compress lz4_decompress zram pkcs8_key_parser powernv_cpufreq loop dm_mod configfs
>> CPU: 17 PID: 921 Comm: modprobe Tainted: G      D         TN 6.7.5-gentoo-P9 #1
>> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
>> NIP:  c000000000181ae4 LR: c00800000bde2a54 CTR: c000000000181a80
>> REGS: c0002000153871b0 TRAP: 0380   Tainted: G      D         TN  (6.7.5-gentoo-P9)
>> MSR:  900000000280b032 <SF,HV,VEC,VSX,EE,FP,ME,IR,DR,RI>  CR: 44422282  XER: 00000000
>> CFAR: c00800000bde53ec IRQMASK: 0
>> GPR00: c00800000bde2a54 c000200015387450 c0000000011b4700 c0000000b1e34d00
>> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR08: 0000000000000000 0000000000000000 000000006b6b6b6c c00800000bde53d8
>> GPR12: c000000000181a80 c0002007fa4dd600 0000000020000000 0000000020000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR20: 0000000000000002 0000000020000000 c0000000023d78f8 c0000000023d78a8
>> GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR28: c0002000153876c0 6b6b6b6b6b6b6b6b c0000000b1e34d00 c0000000b1e34eb8
>> NIP [c000000000181ae4] kthread_stop+0x64/0x1c0
>> LR [c00800000bde2a54] kunit_try_catch_run+0x26c/0x2c0 [kunit]
>> Call Trace:
>> [c000200015387450] [c0000000001d5934] vprintk+0x84/0xc0 (unreliable)
>> [c000200015387490] [c00800000bde2a54] kunit_try_catch_run+0x26c/0x2c0 [kunit]
>> [c000200015387540] [c00800000bde4f14] kunit_run_case_catch_errors+0x60/0xf0 [kunit]
>> [c0002000153875a0] [c00800000bddf448] kunit_run_tests+0x560/0x680 [kunit]
>> [c0002000153878d0] [c00800000bddf614] __kunit_test_suites_init+0xac/0x160 [kunit]
>> [c000200015387970] [c00800000bde349c] kunit_exec_run_tests+0x44/0xb0 [kunit]
>> [c0002000153879f0] [c00800000bddecbc] kunit_module_notify+0x4d4/0x590 [kunit]
>> [c000200015387a90] [c0000000001842f0] notifier_call_chain+0xa0/0x190
>> [c000200015387b30] [c00000000018480c] blocking_notifier_call_chain+0x5c/0xb0
>> [c000200015387b70] [c00000000020cf64] do_init_module+0x234/0x330
>> [c000200015387bf0] [c00000000021054c] init_module_from_file+0x9c/0xf0
>> [c000200015387cc0] [c000000000210740] sys_finit_module+0x190/0x420
>> [c000200015387d80] [c00000000002b808] system_call_exception+0x1b8/0x3a0
>> [c000200015387e50] [c00000000000c270] system_call_vectored_common+0xf0/0x280
>> --- interrupt: 3000 at 0x3fff9eb3d7c8
>> NIP:  00003fff9eb3d7c8 LR: 0000000000000000 CTR: 0000000000000000
>> REGS: c000200015387e80 TRAP: 3000   Tainted: G      D         TN  (6.7.5-gentoo-P9)
>> MSR:  900000000280f032 <SF,HV,VEC,VSX,EE,PR,FP,ME,IR,DR,RI>  CR: 48422244  XER: 00000000
>> IRQMASK: 0
>> GPR00: 0000000000000161 00003fffc80d3ab0 00003fff9ec37100 0000000000000007
>> GPR04: 0000000134f6df90 0000000000000000 000000000000001f 0000000000000045
>> GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> GPR12: 0000000000000000 00003fff9ef7fbe0 0000000020000000 0000000020000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000020 0000000020000000
>> GPR20: 0000000161994850 0000000020000000 0000000000000000 0000000000000000
>> GPR24: 0000000000000000 0000000000000000 0000000000000000 0000000161993f90
>> GPR28: 0000000134f6df90 0000000000040000 0000000000000000 0000000161993cc0
>> NIP [00003fff9eb3d7c8] 0x3fff9eb3d7c8
>> LR [0000000000000000] 0x0
>> --- interrupt: 3000
>> Code: 40c2fff4 2c090000 41820164 39490001 7d494b78 2c090000 418000f4 813e01a8 6d290020 79295fe2 0b090000 ebbe0738 <7d20e8a8> 61290002 7d20e9ad 40c2fff4
>> ---[ end trace 0000000000000000 ]---
>>
>> note: modprobe[921] exited with irqs disabled
>> =============================================================================
>> BUG task_struct (Tainted: G      D         TN): Poison overwritten
>> -----------------------------------------------------------------------------
>>
>> 0xc0000000b1e34ebb-0xc0000000b1e34ebb @offset=20155. First byte 0x6c instead of 0x6b
>> Slab 0xc00c000002c78c00 objects=5 used=4 fp=0xc0000000b1e33380 flags=0x7ffc0000000840(slab|head|node=0|zone=0|lastcpupid=0x1fff)
>> Object 0xc0000000b1e34d00 @offset=19712 fp=0xc0000000b1e33380
>>
>> Redzone  c0000000b1e34c80: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34c90: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34ca0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34cb0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34cc0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34cd0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34ce0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Redzone  c0000000b1e34cf0: bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb bb  ................
>> Object   c0000000b1e34d00: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d10: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d20: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d30: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d40: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d50: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d60: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d70: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d80: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34d90: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34da0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34db0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34dc0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34dd0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34de0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34df0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e00: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e10: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e20: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e30: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e40: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e50: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e60: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e70: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e80: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34e90: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34ea0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Object   c0000000b1e34eb0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6c 6b 6b 6b 6b  kkkkkkkkkkklkkkk
>> Object   c0000000b1e34ec0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> [...]
>> Object   c0000000b1e35cf0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
>> Redzone  c0000000b1e36580: bb bb bb bb bb bb bb bb                          ........
>> Padding  c0000000b1e36590: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365a0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365b0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365c0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365d0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365e0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> Padding  c0000000b1e365f0: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
>> CPU: 28 PID: 2 Comm: kthreadd Tainted: G      D         TN 6.7.5-gentoo-P9 #1
>> Hardware name: T2P9D01 REV 1.01 POWER9 0x4e1202 opal:skiboot-bc106a0 PowerNV
>> Call Trace:
>> [c00000000593b890] [c000000000e8ecf8] dump_stack_lvl+0x6c/0xb0 (unreliable)
>> [c00000000593b8c0] [c00000000041dad0] print_trailer+0x1e0/0x22c
>> [c00000000593b940] [c0000000004155f4] check_bytes_and_report+0x224/0x240
>> [c00000000593b9f0] [c00000000041596c] check_object+0x35c/0x4a0
>> [c00000000593ba40] [c0000000004168dc] alloc_debug_processing+0xdc/0x270
>> [c00000000593bac0] [c000000000416c8c] get_partial_node.part.0+0x21c/0x460
>> [c00000000593bb80] [c000000000417148] ___slab_alloc+0x278/0xb20
>> [c00000000593bc90] [c000000000417b3c] kmem_cache_alloc_node+0x14c/0x630
>> [c00000000593bd20] [c000000000140618] copy_process+0x408/0x3270
>> [c00000000593be00] [c0000000001435f4] kernel_clone+0xc4/0x5b0
>> [c00000000593be80] [c000000000143dc4] kernel_thread+0x84/0xc0
>> [c00000000593bf40] [c0000000001829bc] kthreadd+0x1ec/0x290
>> [c00000000593bfe0] [c00000000000d030] start_kernel_thread+0x14/0x18
>> FIX task_struct: Restoring Poison 0xc0000000b1e34ebb-0xc0000000b1e34ebb=0x6b
>> FIX task_struct: Marking all objects used
>>
>>
>> Full dmesg and kernel .config of both machines attached.
>>
>> Regards,
>> Erhard
>> [    0.000000] Linux version 6.7.5-Zen3 (root@supah) (gcc (Gentoo 13.2.1_p20240113-r1 p12) 13.2.1 20240113, GNU ld (Gentoo 2.41 p5) 2.41.0) #1 SMP Mon Feb 19 12:44:46 -00 2024
> Is it vanilla kernel (i.e. no patches applied)? Can you also check current
> mainline (v6.8-rc5)?
>
> Confused...

Oh, that is most likely kind of expected behavior.

This kunit test is not meant to be run on real hardware, but rather just 
as stand a long kunit tests within user mode linux. I was assuming that 
it doesn't even compiles on bare metal.

We should probably either double check the kconfig options to prevent 
compiling it or modify the test so that it can run on real hardware as well.

Regards,
Christian.
