Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F202E83FC
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jan 2021 15:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895DA89C82;
	Fri,  1 Jan 2021 14:34:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770082.outbound.protection.outlook.com [40.107.77.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACBC789C82
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jan 2021 14:34:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJYFT+W5m44+ajk+Bx+uvIxB4xULWj05KgA4Ky5y0dJUODeI92E5Wi2xjLhUOMEn0leePdsFCYossysv7bvaXDeL37e63108I6aU4mQpxHLT/5yKI2kZzERBbz5EnMQ3Al7fY7ezRL3roydjFMiJ3APmhlmgwRVy9F+dHBy/iZwAr/u2NQuRqLPil+XFpHpUTFeIH4VNp7OzeYJO+RAhjSNmroJrAo/VUE1iNDqAK4RNCitYlkvDV0wulOIk20kOu72JNEWasY6JsE1Il6yHIOpIzv/bklt3q5iEcF+qxvMNJhXaIlB2DedlGYfC2NNF44tXWG+rhS3IHDimVCNM8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QghYirFR/gRwJXbAiLTSGNVWef6iuFBeZDNKPmogCOo=;
 b=Xt2fGjXSjrAZQ3MqMWRYCdOg5De0r/fgLfxuwa7hoY0J/7U5SJl2u+sGmtak9lcUV3kplcLuamTYU0VitHu15pW/vttWUEGjgCsxrW3ojFXx5y1tFOpVuPD1kzzUKIpcXnFHN+y2poMMn310Vsklz8iW03w1C1XitxireP9GpXtnHWy/FnN+T6SZqfZuq2scLJIQ1FS5gxdGKDzDzNjIvygauq09IuCbfs/GV5z3gupLZyw097+iU0OO0XuN9MhCxwu6Ao+ifsbe+ejirzdDSM+JrX1WHU9yQmwwL9SkCkoHy+QCTSVscakFZoFPfkuhbFe7DqMnRtZBJ6LLz9Dbww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QghYirFR/gRwJXbAiLTSGNVWef6iuFBeZDNKPmogCOo=;
 b=pUNbvI1vnEezs8k9UK2p1VQfPTn5ALOfJRNyCrgQ7mWgKgZxBMhV62T8Czdvp+0HQn8/l6Wz4G9Dq5Y6h/PHcOLZm8PWgWqxMSQ2jaGjR3yUmDDhbk3NH784iJHTBl5Hfx/EhTtCEW+IK3hXMJ43nUi8dOnOHxYLKVBreA9szU8=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4606.namprd12.prod.outlook.com (2603:10b6:208:3f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Fri, 1 Jan
 2021 14:34:33 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3721.020; Fri, 1 Jan 2021
 14:34:32 +0000
Subject: Re: 5.11-rc1 TTM list corruption
To: Borislav Petkov <bp@alien8.de>, Huang Rui <ray.huang@amd.com>
References: <20201231104020.GA4504@zn.tnic>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e3bfa0a4-5d0a-bd68-6cc8-73db1d29f22c@amd.com>
Date: Fri, 1 Jan 2021 15:34:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201231104020.GA4504@zn.tnic>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0202CA0006.eurprd02.prod.outlook.com
 (2603:10a6:200:89::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0006.eurprd02.prod.outlook.com (2603:10a6:200:89::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19 via Frontend
 Transport; Fri, 1 Jan 2021 14:34:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 81b9c3b0-32d5-4f29-2400-08d8ae625af2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4606E96403AF18BA2E95C6A283D50@MN2PR12MB4606.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uPxHHQRfiib5i0dHRryY5rRWvSmlB8eLC7sNTYmu0EjlHYGF6lDfsTshQfIGgiX+/hd9FBydjsKuoYIkO+mC+uGLtbYs5DJdOkybSSIy6gIsBzgd2vic6x6P47lCHf6q9uXjRVyR9aVz95aPH955xS4B3wWKjABBB5FTTIDqnegf7bB29sVMMfhM33ovVMJ2O3RAC4VHc/Wu0MwXWc79POVk94B0lgJTidJzA4Ojb/X5wv4VUamBcThc5iHWhLJ0mujECocmxDMvinWgKe+n1izPGgPjTcrVo5xP9iEnuxsePVz0lbZivenlvd56fBNNQNRgxowjM6cRoN3w2g/f+7lhfiAro3oPyTsVOxTjLQ1+Cx+1ABwU3FM/gv+Yw/01ecYDHR1C3R8n4QMzlxN2RncWUFz2sz3DV2tB35WSH+GJZobzH5IYC6UvAy7i99RU4CkJA+JkF3pX3wtU0hvlvbATmELAZ9YksiwQF1GMqRY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(316002)(16526019)(5660300002)(8936002)(186003)(4326008)(86362001)(36756003)(2906002)(66476007)(66556008)(66946007)(83380400001)(31696002)(52116002)(45080400002)(8676002)(31686004)(2616005)(6636002)(478600001)(6486002)(110136005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TDc3eWIraXc4T0xBdy9aYys2NkNiZFRnR2JwVjhaMklHVHI2SnZQRHRFeGdR?=
 =?utf-8?B?SDBpQVhWVUpyNHBrZEt3RDNWTWxOM1lONzA0OXZzQ1JyRDQzZHR2K3RBbDU0?=
 =?utf-8?B?L2NoWWlzRzJsY2lLWUhtZjVkTnZvbkY0WHpHdXMyV01QRlpGQUU3a3dnMHNI?=
 =?utf-8?B?elBLbGFuTzBWMGdHY2FvbS8zTXd2eGZlelViZHdyRHZyVi84OVhDZWtnNWZa?=
 =?utf-8?B?ZE92dDFpN205MitSeVRWZ21XT3doNCtTTXJhSld0cjRxY2FoYzh5d2hsWTRB?=
 =?utf-8?B?V2NWNVhTd2xNUGU4WlE2MnRiVk5PQ3VqbkE2NzlNQmhqVENoSGdVQ21FVW1x?=
 =?utf-8?B?dXhnazE1OFEwWGlzUGovVEhvM3pBcjZDUXRBOS91b09MbGdqcE1QRjdwTFVq?=
 =?utf-8?B?RmNaM0xlY3JidWxCcWRQMzZRSzZJWmhCNnIxQ2d2TTdkeStwUysyd1JObzdK?=
 =?utf-8?B?ci91bDA5SzJIWDlPbCs5aEtoWHU3dkZRM0ZyTEhLdXozd05YMG9WN28xNjlq?=
 =?utf-8?B?cE9Fd2IwNmhzeUZYT3BzbTlPLzF6cVNtdmpzczhGTzhvemwyVmZCcTdyMGdO?=
 =?utf-8?B?a2xrdDZjL3hkbkRGT2doN1VSL3gwQTBETlB1WEgvZldUWlhFRUtuaGg2dENu?=
 =?utf-8?B?MWhJZVVwODUrcml0VXRha0dzOVhMbWluUVc2MzR2bHZCdlY5R1ZPNEg0Z1gz?=
 =?utf-8?B?clhFa0xrU2p6Q3k2RXliWTNiKzdTV0tmY1Q5K0l6WWdaZlVTVlk1bk1PZE9K?=
 =?utf-8?B?d0pocU15OGZIc1hsb2R6UHQ2aTFUaWw2Zys4aWZoNWZFWlVCWHBsc2NWTTFv?=
 =?utf-8?B?ZjVnWXFhQUtXYWk0WEpteVV2Yjg0aFR0QWRpNEo2ajlFcmp5VWMzdG10T2cw?=
 =?utf-8?B?ZU56UGJMS0V3UUVWaldLNS9KZXc1ejc0NG8vU0hSdEd0ZnNvekU4M1NSNG01?=
 =?utf-8?B?Q0ZOVVN0YXZ0Q3dha2JSblNnRlNGUTY2eGp2TThFUVFzbEdtTXZMUjZMQ3hl?=
 =?utf-8?B?K3djMGVPdVNqS24vV2pKdGlieWUvQ09DZVZLMHZlS1hJcmFGV3Jxd3pWQVYy?=
 =?utf-8?B?MnJLL0N1WG1iZHZUNDM0NnpPRGQ5QVVFUndEY01NUm0reWhmcjJsRGVYWjVz?=
 =?utf-8?B?bHVDeHhLNUhnb1JtUlRrQ3pFQ1ZmNnpabDY4cU1ybG43QmdReHJLR0JnYy9B?=
 =?utf-8?B?ako0dHJ4TVIzR3FQckx1aWtGY2RvS2RjajB0bEpGdW8yT2g5bUN3U3I4OFoy?=
 =?utf-8?B?NmdoUGZEeFo2WmpuMjRlNFpsZDdlZ0hvTVhCdGhQdFkyUzhoYW5CY1E2bVJT?=
 =?utf-8?B?cTE4dFQ1RzZvQjlmU21KWDQwY1VBVURXYmtWOTU2UFI5ZkZYWTV2ZEtLYjlT?=
 =?utf-8?B?a1l3WFZUeWROYk5tRllBSFdKamFHRUxadjlBTVl5ZU9kQmx1VVJ3YlE1NjBh?=
 =?utf-8?Q?fxbeauFP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2021 14:34:32.7042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b9c3b0-32d5-4f29-2400-08d8ae625af2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGDlZ5zsDVD897eg5kexuoYw9vRCV7O2Up9gHvrnE3lS1PZDDZe5/DwbF+dIRJC/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4606
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
Cc: lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Borislav,

my best guess is that this is an use after free.

Going to double check the code, but can you reproduce this issue reliable?

Thanks,
Christian.

Am 31.12.20 um 11:40 schrieb Borislav Petkov:
> Hi folks,
>
> got this when trying to suspend my workstation to disk, it was still
> responsive so I could catch the splat:
>
> [22020.334381] ------------[ cut here ]------------
> [22020.339057] list_del corruption. next->prev should be ffffffff8b7a9a40, but was ffff8881020bced0
> [22020.347764] WARNING: CPU: 12 PID: 13134 at lib/list_debug.c:54 __list_del_entry_valid+0x8a/0x90
> [22020.356397] Modules linked in: fuse essiv authenc nft_counter nf_tables libcrc32c nfnetlink loop dm_crypt dm_mod amd64_edac edac_mce_amd kvm_amd snd_hda_codec_realtek snd_hda_codec_generic led_class kvm ledtrig_audio snd_hda_codec_hdmi snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hda_core snd_pcm snd_timer irqbypass crct10dif_pclmul snd crc32_pclmul crc32c_intel ghash_clmulni_intel pcspkr k10temp soundcore gpio_amdpt gpio_generic acpi_cpufreq radeon aesni_intel glue_helper crypto_simd cryptd pinctrl_amd
> [22020.400855] CPU: 12 PID: 13134 Comm: hib.sh Not tainted 5.11.0-rc1+ #2
> [22020.400857] Hardware name: Micro-Star International Co., Ltd. MS-7B79/X470 GAMING PRO (MS-7B79), BIOS 1.70 01/23/2019
> [22020.400858] RIP: 0010:__list_del_entry_valid+0x8a/0x90
> [22020.400861] Code: 46 00 0f 0b 31 c0 c3 48 89 f2 48 89 fe 48 c7 c7 78 30 0f 82 e8 24 6c 46 00 0f 0b 31 c0 c3 48 c7 c7 b8 30 0f 82 e8 13 6c 46 00 <0f> 0b 31 c0 c3 cc 48 85 d2 89 f8 74 20 48 8d 0c 16 0f b6 16 48 ff
> [22020.400863] RSP: 0018:ffffc90001fbbcf8 EFLAGS: 00010292
> [22020.441503] RAX: 0000000000000054 RBX: ffffffff8b7a9a40 RCX: 0000000000000000
> [22020.441505] RDX: ffff8887fef26600 RSI: ffff8887fef17450 RDI: ffff8887fef17450
> [22020.441505] RBP: 0000000000003f82 R08: ffff8887fef17450 R09: ffffc90001fbbb38
> [22020.441506] R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
> [22020.441507] R13: 0000000000000080 R14: 0000000000000480 R15: 000000000000019b
> [22020.441508] FS:  00007f51c72f9740(0000) GS:ffff8887fef00000(0000) knlGS:0000000000000000
> [22020.490045] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [22020.490046] CR2: 00005557afb81018 CR3: 000000012099e000 CR4: 00000000003506e0
> [22020.490047] Call Trace:
> [22020.490048]  ttm_pool_shrink+0x61/0xd0
> [22020.508965]  ttm_pool_shrinker_scan+0xa/0x20
> [22020.508966]  shrink_slab.part.0.constprop.0+0x1a1/0x330
> [22020.508970]  drop_slab_node+0x37/0x50
> [22020.522011]  drop_slab+0x33/0x60
> [22020.522012]  drop_caches_sysctl_handler+0x70/0x80
> [22020.522015]  proc_sys_call_handler+0x140/0x220
> [22020.534286]  new_sync_write+0x10b/0x190
> [22020.534289]  vfs_write+0x1b7/0x290
> [22020.534291]  ksys_write+0x60/0xe0
> [22020.544762]  do_syscall_64+0x33/0x40
> [22020.544765]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [22020.553320] RIP: 0033:0x7f51c73eaff3
> [22020.553322] Code: 8b 15 a1 ee 0c 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 64 8b 04 25 18 00 00 00 85 c0 75 14 b8 01 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 55 c3 0f 1f 40 00 48 83 ec 28 48 89 54 24 18
> [22020.553324] RSP: 002b:00007ffd0a748ef8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
> [22020.553325] RAX: ffffffffffffffda RBX: 0000000000000002 RCX: 00007f51c73eaff3
> [22020.553326] RDX: 0000000000000002 RSI: 000056039fd0ee70 RDI: 0000000000000001
> [22020.553327] RBP: 000056039fd0ee70 R08: 000000000000000a R09: 0000000000000001
> [22020.553327] R10: 000056039fd0e770 R11: 0000000000000246 R12: 0000000000000002
> [22020.611218] R13: 00007f51c74bb6a0 R14: 0000000000000002 R15: 00007f51c74bb8a0
> [22020.611220] ---[ end trace f7ea94a6ddb98f71 ]---
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
