Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C573A0D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3153E10E54F;
	Thu, 22 Jun 2023 12:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A8B10E559;
 Thu, 22 Jun 2023 12:26:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nE7UFexygnCJK35sy0DdCHJluKE23r9rqwQfQe6qeCHt0stwMzzfPMb0ZG4Giy5O/pXSparvZUXqPTXqnX2goPyWcE3IHmJWvUYlGlCmchU8x6jqitgBTDE+3SYFSsApf9H/TsiFvw8mZy7t32sah9nCahfBaugPSXRyyUDHcN7N/ycP4dRcZgpvmvZ4emIPr6l6lr65aoOjbfZ1jK+8JMvnQtcM00ZZxDU2Y3REh86Hg9yNU/7QXaeINJAza4M8Zj3mepeUoIN/2bbdR076dMdr6YAcYYqoUpW/M1ETBFwRD2c/kJF8sa7ze9kNzWRhIKZbYlshun8x6kdEd76Deg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1/hEwUT1cgaXHfAAv7IIgsTM2oHTsGsKgtZ1El7VoI=;
 b=g6nvwGP+l/M0VmjBoJfhs5xUvoCylJ3w+OoMnepLqFBZAIXRFmuIP4QknMWsGedBEFZmZf/DuQe3PViAkj7daqUFRUfwAqNAJB9yz59YiuDJMULBkYwLy0BhHa12qDmPn+3qpe8YQu0v+jbxR2B94j+AjJ7KA7xm2xmwfb7FBfNt9VqiRexLMArCNb2cz9q0v1BxAKtILWo01anuwHi9QXO7ZvydF6j3st16ltDZVvuOnaAKf6teRLdO4S0xM+oV0Gkzu6f3TpgseZjXgVHIMRvju0ln+6gnQkXM9WzSag8jVaEBE8Kny4lqIrqB3uGn1f6YNX5EGgvqYLjxGhfjoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1/hEwUT1cgaXHfAAv7IIgsTM2oHTsGsKgtZ1El7VoI=;
 b=KMy/wwUf3M7ooADMvPv5k0tDdTJ9cefCn38YrHSG/S66MP4VzSZKQjDM3kZTR7Q3vLeaqh8FNZN5PyustGXAnutLis2KXXAk/UU6LmTH4sICX7hhpLodbyBA5JSNHqPfXZZzghtsd4K2bMNz3leTn4PlO3sC9h3D4AfUxBjwiec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Thu, 22 Jun
 2023 12:26:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::384a:95a4:8819:ee84%7]) with mapi id 15.20.6521.024; Thu, 22 Jun 2023
 12:26:21 +0000
Message-ID: <b9eb015b-6ba4-f980-17f1-db4921cefccc@amd.com>
Date: Thu, 22 Jun 2023 14:26:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/4] drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-2-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230622101412.78426-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0218.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 48c8fa62-f789-4471-34de-08db731be2de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 94uMp00He0kqh5r8KXUCGUE508PdleFuH777g1NqoYig9sYexTlIoMiYsRaaUtwZ1In3yjlUrn3nGuO6B6LhoYALEdOn1Uh1qTs4fNZ2K3Jdjsi3DnfrZnrpAfdccrsfYmUlOuZMKYlnj6gS+vSc1RMz0Zk5c1NJzkPvUfXKtZ+NR5Rs/6FyzqE2Md/MYm2bwahV6Q/n+Xy8/ZEaSpkhfO2sg/XfoHVE5ji85jpAph/O0USNJv+yGunqnfLtH9ZP2E+PVqD6MKbQGDfg66aLCTltRJ4imjh72xj9laahv/QmWUi8mg3tCo382m66YOW62CXOoM9cmefTmH9mOXIG/MNni1xiEXtHdtzHFOQqJpPD3SRQ3vbwpU5rFSnqCnMFpSBf6cIZRnMe8X4nF4PdnVw17Bw0WlCsFo85KSw6OKQBR1ctHQThRZdCjhww7ysjxVI+zhg3tA8zplp3gYsvT4gork3gjFCuCxZMAiddhF10qOf1t6SAcIu8wNeiCsQJqp44pxeKXxzxVPuI50ntW6ticpUDC54b+UStLVGyyvF3TDY07Ktz5oLDWZrGBYA3qlVE7rC6cGBS27yD8zZWzgkyyJk7P3Cu2eL3JSJQdRZIqVmz+3jniMk6E/NPXUQvTwHSIPZ98z6eXF+c2+D9Og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(451199021)(36756003)(66574015)(6486002)(966005)(6506007)(83380400001)(6666004)(66556008)(478600001)(2616005)(54906003)(316002)(2906002)(186003)(5660300002)(66476007)(66946007)(31696002)(86362001)(41300700001)(8936002)(8676002)(4326008)(38100700002)(31686004)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG8vaFpER3hFTWJmbU83ZjlhdVMzSjE4aTA3a1Rqc2F3NGpmTktpZnNZc0hr?=
 =?utf-8?B?Z0gyeXNlajVHbk5mTWVyWFluK1Q1dUczZWFrMkc1UUYvREMrL0RZV3k5b0Mw?=
 =?utf-8?B?TzR2Qlk0NlZGZ3NkMEZ0MUFqY1JreDhkamwvWUJSdkJLRUYyeHBwYXBVY2Vi?=
 =?utf-8?B?WThxTXNMQlRDQzl4azFoaWYxUU94VVRSV0lwankzeTVEMUthUWJ1Z2Q3WjlX?=
 =?utf-8?B?dFFSSm9HaXFON2tIeHBoSFNZbjBncitXWFBHZ1BTdUtsSUZxQ2FNd1ROZFZG?=
 =?utf-8?B?U2hGTE5VQVVDdFBhUU9nK2ZpcnBvVVBvU3lvNVd0dytiVFlTU3E1a2tKQ2ta?=
 =?utf-8?B?TVNZYTZhMDVNS2sxaDRFUitWR1hHRzNQa1lVbkE4QmI0aWl3VkFKOGVWdG5n?=
 =?utf-8?B?eXBQNGtFT1kvd2xJODNjNm02OFpxVTFMRlREdmtEWTNQSC82WnE0TXpVNmlE?=
 =?utf-8?B?L0YyOUczcEpuOCtVSVVxMldYZUZmdUd0WVlNTFo5dkxOSmo0UUNBWVNFZXU5?=
 =?utf-8?B?MDg2K09LZXFEeUNUV2dEd3MwSEFZOEtFc2VoNitqV3E2Z0JPc1VPNk5KcmFq?=
 =?utf-8?B?dm94U05kMmhlOVBjNWZDVHZhZmJiTm02SEczMzBZQ2NTeERWSDRNaEpjQm5C?=
 =?utf-8?B?ZFVUMVlXaVFQcmx6SmUvamFTRCtDWlpPcUVPTzlaYW9kRVpNTmJyblpCWWdr?=
 =?utf-8?B?YkNjcC9ueVNwQWFsVWR6NStDUzRaRGdnMUQ5STc1Zi82T2pCWUg5NkpQWnJl?=
 =?utf-8?B?SERWVktmMXIyUXB0dWpSSktHNSs4ZnoxdVZRVC9ZZjFBU1p4dU5TWHpsczVT?=
 =?utf-8?B?VnBYNmluVFM4V0ZtcTN4MXNaaUJESTJreWtOV0FzUUEvdjJwVGoxTVAzeFVP?=
 =?utf-8?B?K3hGSjNuUXlLMVV3WllGWjI3RjlkdnVhWkFXdlJnOFNQL0NXbnphUUc4d05w?=
 =?utf-8?B?OU94a01QTm9VUURqdUxPZVU5ejZzOFUvWVlrTlFsL1k0UXRSMCtSYm9FYmdo?=
 =?utf-8?B?K2ZrWW9VK01JTG1SOVJpczdtRXdoanhmTDk1VkJYSUhnU1NtR0pjVDRReXBh?=
 =?utf-8?B?RzZOd2UvcmFVTDMwMUMwRlk2R3FidVQ5M2IrNmZKTGdlc3VaSkJmdmZVR0xm?=
 =?utf-8?B?OG9EMVFRNmZob3hLSkxYTmIxVGYyNk9VM0FYZ0JPY3dEZU0rMlN2cEJRdm04?=
 =?utf-8?B?SGFwRFNHcnhFT1hsNkwxeEVoeDd1cHN3UjFwZFVwaTIxOWQ5Y1VIYjFlU2Rk?=
 =?utf-8?B?cHlnZk1Jci9HNFNqQmpJa292L1VHdDhra0dGRGtmM3Y3eXRIZDRQMTFqY0th?=
 =?utf-8?B?NGZRUVNsUllCc2RWdDB4dEE4RnpxalJxMlNPRDhpSW1GelVSdDNnNFA4cWZK?=
 =?utf-8?B?d3ZhaUh5TXVuS2xaVnRobnVkcXhhQk4xU3lnN2pMd3pXc25yM2FBSVZlYnhJ?=
 =?utf-8?B?ZFlJR2c3b3R1SDR2WVZiQmZMSnZ3Nmh0OXNsSlRHdHVKQmdza2M4YnJURUxw?=
 =?utf-8?B?WkFHamhLdzFuRSsxNHBMNHRNOVpNelhORmhLUzd4SDNPVDFOdWNGSXh1TXlL?=
 =?utf-8?B?THpyc09RSDhsNFg3VzE5Zk1sSFpycDNDZEJ6ZklRQzZjQU9DYVF4bTVpZDdv?=
 =?utf-8?B?QjFaRTNpc2UraVUyZ3Zac1h3dmw5bmxwTXlnM2VlNUFLN0JqbUdlRkQ4MVE1?=
 =?utf-8?B?ZEhyUFQweWJEcklPd01GQnorNkdIVk41ODNEUW1LeUZ3aFJLcmF1cnd0Mmp1?=
 =?utf-8?B?Q3c2aFA3L3F6MVA1a3F0V3ZqVE8zbHE0TFQ0N01IUjZrV0haaTFoVmwvMTdD?=
 =?utf-8?B?OE5GeThaWkVVL213QVY3akk5NThGUnN4cTZLd3orUHd3NXBWeTRJdXNEY1p4?=
 =?utf-8?B?RklBSExUZmlZUDVmSHdGSUZ2QWJiLzMyK1hxajRHTU1MMFIyS0FrZnJZWWZH?=
 =?utf-8?B?NUVDVVU0c2oyKzU1dXpsTkhEZzJuUS9YaTN2WVBUejk4UTU4YmNPTkhXVy9C?=
 =?utf-8?B?S2V0R0tPdjlhbmNJL2NYbDRIZlFWUzlpY3RqU2xXbVVac3hEQlRaNm5UZnhK?=
 =?utf-8?B?YVIybzlBa2tBa1B1UjNLWGQ0cllYaXJLZm5BL0tzWmJ5STdibHJoSS9hNGJS?=
 =?utf-8?B?K1RMKzJFUlZNOURQLzZsVzFSd1Vid0F4MmQ5cElCK2p2bDJuMjVIMlpmYXlt?=
 =?utf-8?Q?lFgw457+Svl3xUdubyOS4djWJWDl6UZm5SAjyqpxuU2J?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48c8fa62-f789-4471-34de-08db731be2de
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:26:21.2903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVPMQgHf0OsYeWUSM1hHvyHRvI2xq9usGPjYapsbWnKCIGjC/s9opg/OFFwhd2D/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Teddy already stumbled over this as well, but this patch here looks better.

Going to review and push it to drm-misc-fixes asap.

Thanks,
Christian.

Am 22.06.23 um 12:14 schrieb Thomas Hellström:
> The value of pos->first was not updated when the first resource of the
> range was moved. This could lead to errors like the one below.
> Fix this by updating pos->first when needed.
>
> <3> [218.963342] BUG: KASAN: null-ptr-deref in ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.963456] Read of size 8 at addr 0000000000000038 by task xe_evict/1529
> <3> [218.963546]
> <3> [218.963566] CPU: 0 PID: 1529 Comm: xe_evict Not tainted 6.3.0-xe #1
> <3> [218.963664] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake H DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.4064.A00.2102041619 02/04/2021
> <3> [218.963841] Call Trace:
> <3> [218.963881]  <TASK>
> <3> [218.963915]  dump_stack_lvl+0x64/0xb0
> <3> [218.963976]  print_report+0x3e5/0x600
> <3> [218.964036]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964127]  kasan_report+0x96/0xc0
> <3> [218.964183]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964276]  ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
> <3> [218.964365]  ttm_bo_set_bulk_move+0x92/0x140 [ttm]
> <3> [218.964454]  xe_gem_object_close+0xc8/0x120 [xe]
> <3> [218.964675]  ? __pfx_xe_gem_object_close+0x10/0x10 [xe]
> <3> [218.964908]  ? drm_gem_object_handle_put_unlocked+0xc7/0x170 [drm]
> <3> [218.965071]  drm_gem_object_release_handle+0x45/0x80 [drm]
> <3> [218.965220]  ? __pfx_drm_gem_object_release_handle+0x10/0x10 [drm]
> <3> [218.965381]  idr_for_each+0xc9/0x180
> <3> [218.965437]  ? __pfx_idr_for_each+0x10/0x10
> <3> [218.965504]  drm_gem_release+0x20/0x30 [drm]
> <3> [218.965637]  drm_file_free.part.0+0x4cb/0x4f0 [drm]
> <3> [218.965778]  ? drm_close_helper.isra.0+0xb7/0xe0 [drm]
> <3> [218.965921]  drm_release_noglobal+0x49/0x90 [drm]
> <3> [218.966061]  __fput+0x122/0x450
> <3> [218.966115]  task_work_run+0xfe/0x190
> <3> [218.966175]  ? __pfx_task_work_run+0x10/0x10
> <3> [218.966239]  ? do_raw_spin_unlock+0xa7/0x140
> <3> [218.966308]  do_exit+0x55f/0x1430
> <3> [218.966364]  ? __pfx_lock_release+0x10/0x10
> <3> [218.966431]  ? do_raw_spin_lock+0x11d/0x1e0
> <3> [218.966498]  ? __pfx_do_exit+0x10/0x10
> <3> [218.966554]  ? __pfx_do_raw_spin_lock+0x10/0x10
> <3> [218.966625]  ? mark_held_locks+0x24/0x90
> <3> [218.966688]  ? lockdep_hardirqs_on_prepare+0x136/0x210
> <3> [218.966768]  do_group_exit+0x68/0x110
> <3> [218.966828]  __x64_sys_exit_group+0x2c/0x30
> <3> [218.966896]  do_syscall_64+0x3c/0x90
> <3> [218.966955]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> <3> [218.967035] RIP: 0033:0x7f77b194f146
> <3> [218.967094] Code: Unable to access opcode bytes at 0x7f77b194f11c.
> <3> [218.967174] RSP: 002b:00007ffc64791188 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
> <3> [218.967271] RAX: ffffffffffffffda RBX: 00007f77b1a548a0 RCX: 00007f77b194f146
> <3> [218.967364] RDX: 0000000000000062 RSI: 000000000000003c RDI: 0000000000000062
> <3> [218.967458] RBP: 0000000000000062 R08: 00000000000000e7 R09: ffffffffffffff78
> <3> [218.967553] R10: 0000000000000058 R11: 0000000000000246 R12: 00007f77b1a548a0
> <3> [218.967648] R13: 0000000000000003 R14: 00007f77b1a5d2e8 R15: 0000000000000000
> <3> [218.967745]  </TASK>
>
> Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.19+
> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/411
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 7333f7a87a2f..cb05e0a36576 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -86,6 +86,8 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>   				       struct ttm_resource *res)
>   {
>   	if (pos->last != res) {
> +		if (pos->first == res)
> +			pos->first = list_next_entry(res, lru);
>   		list_move(&res->lru, &pos->last->lru);
>   		pos->last = res;
>   	}

