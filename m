Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E78592F58
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 15:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919AC5235;
	Mon, 15 Aug 2022 13:04:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2046.outbound.protection.outlook.com [40.107.94.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAE2C50BA;
 Mon, 15 Aug 2022 13:03:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=at32165LhQhtBIQln4VPgAvimi9RtYGPxSio8dUjNNDxASLeGKcKFMlmZcuTil9knleFug4a0qnzL8Y6DvtfQFEN0GzbaB4Vqjngq8eh6rMtS+/BuZpvUIltO1hy+5KBI/yhokGOq1e8hgz2ktrcJYXOLLPnmf/A7lliAiqW4rO9WuQwAEBrG/G4qTw1F/huoZZsohvhuQMVXrbGFpFIw98AU3ZhtOsZD9dMNggicTV6IesBCpPHbsPs1Mz9gUUbt2EzijdQw0AFgaI+mus27uDK2qmQar11Irmwymlr8KIdAByJ9kHOv71vtjzyoinu3RZR/N3fnW46+gF9jFj0qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2hpcJ9cD/7Ai4dFbZwfwYcn+x5BfxSMj3EErGKkQL8=;
 b=gGEOOw2idl/aCSr/DolqWjwl4kr+zvFKK/f0xcJ5Bxkto0gV3YTOwuvj+idO22UZYpvk2iDyEoP0wFFRWOqLStwbNEU/HuiwoUFPLvWpI9fge6ZCMyDUN5R/sKyYx4FQ2+CtLvppOHEU053FahCaAFYwOwATsVzE3jIoXePhRyn6e7spq8wJpo1hsPPAG7SOHhYOrp7Rw2JMmw5LmfjotUVguHpw7HAD8TawUu5TcPyIIWLFMnKPq5qRwMVIMKvaUHkJUitQLjZJ5Iks6d3nx1qXBALl0B1D8iZviNagjBH6VxUQ//7XkveUVa+6d1Y/sa+TAwPk5uDgBK2d5XT5PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d2hpcJ9cD/7Ai4dFbZwfwYcn+x5BfxSMj3EErGKkQL8=;
 b=AlKBe2uF9o8G29QTvINAwjf1DJJRq3z132cezcTvww8YSHZX6PNiCvBgAAoBDmoNBG0JcrQAcp5ZSkX4UTR33UFngX0FpBrWLqPThQeqihgW6Z0kqK7/Sqj4oEPjq8+46etv6lS8aZ5ChBJvhtvCVTIN+pT4vkj8vy1meL+rUKc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BYAPR12MB2760.namprd12.prod.outlook.com (2603:10b6:a03:72::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Mon, 15 Aug
 2022 13:03:54 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 15 Aug 2022
 13:03:53 +0000
Message-ID: <e07aa5c3-1d00-a76c-3efa-67b9626c1706@amd.com>
Date: Mon, 15 Aug 2022 15:03:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/amdgpu: Fix use-after-free on amdgpu_bo_list mutex
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mairacanal@riseup.net>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui.Pan@amd.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220815113931.53226-1-mairacanal@riseup.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220815113931.53226-1-mairacanal@riseup.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bbf52e7-eee7-48d7-580f-08da7ebe9a76
X-MS-TrafficTypeDiagnostic: BYAPR12MB2760:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8JKaQ2Bw43MsDCnPoN0Xgigr54oHg6PRyDMQZn7ZOcduCOiqOktj3drUW/jXdoRT8sOkkFHjMKzGYdbIua4JqdUNh2kFjRZlQI6u0y2prYnsvZqBt58tPCMi+XCfjJ1JyU0NFCpSN8y8Sq0KPLwshbJR6uSztSt+SLcJ0T4bJ8Z1+LfP6EFX63MnXjzOdyYeOWC2afpkQa9CODiOnS7VtJQUJmOed9a7lUyBWzl6BZFEC37xtgYV8HRVPmjQqMgUiFkynBc9DsT42AUuBjR3xqH9/3eO52ZvU7jJ0VLscdrHV8yFfFI+dPzOJjDyOk8ptePKDiIW6XqtKPYXkJD2kHUfrN9BAGiHl9aHg01vWDRV7R5MNzUw0vYrTnliCQTcD9wJznBAAWhRwo/CIeJKJO7rHTFsF5sa6oyeBvsH903DfL9NWq60HwyuvfDuEHiJ4xXRl44DzJqJWTq7GNUKw/+Pd8fMsI4H2i6DkU84lmRNDxheGjllhNbd0D856y+rRxyyV1PD9pRevdpjbAOGnAceC7xhY9w6IrS7hyoC5vXlx5nJoEUagFf1cG8DCyam39stk2CSPs0lMjLZcSOPIIq5YqSh4/iLuzWDxEbnr+e1n8fa43lkawZhT/qUrPNYd/6ofYkSTe0c4It9XXyW7oQpDDUp7KdDS8dpBKhPUAP7sXGaALCNRUHtfqavPchY8CgHVKHMgzlKCn0tZF61+YbAYhHzBWu057qR3ymm/H+6ZsqzXtXpI25LB7QDXOihkgar9vcL8Zgm54v4HodCpFJB+9Vdd98fQIeeGfzZIsm6lDvBnctnPj/FBHV46lg89IQ9muf0bKcrfR+uLeiLYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(366004)(136003)(396003)(346002)(376002)(186003)(66574015)(2616005)(38100700002)(83380400001)(66946007)(5660300002)(8936002)(4326008)(66476007)(8676002)(66556008)(478600001)(6486002)(86362001)(6506007)(6666004)(6512007)(2906002)(41300700001)(316002)(31686004)(31696002)(36756003)(110136005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTBLL3p5UEpkeWpGWEhGNXhFR0t6c1lzMFJhUkJJcE80QTloQjgxTVo0N1M1?=
 =?utf-8?B?eldIamYrNUF5RVZxeVc3QlAxcUYrZC9Ldnp6RWNTKzJVZ2o1bTFyUFRSLzYy?=
 =?utf-8?B?RjN0MkRRWnhwTFlVUFZ6ZVBOQmwxV01UbjVtdDhrS1hvL2d2OW9qVlEwTEpV?=
 =?utf-8?B?dEgvUXlISlowWmlIbEF3VUZHY1RCQVJSamFHTnVEQVM5eGsvRG4zWERCeWRx?=
 =?utf-8?B?MER0aVRLbHpqazZwSWdjMXJIUXFaMFJkMW8rb1NJVGFCc0FZZXV3VFlTaVFq?=
 =?utf-8?B?KytWczBlMVRONjBEWVdmSzNvRkYwcEVSbmVMM0tnbmhVaTNWTDBSUkJCclVE?=
 =?utf-8?B?bit1c1kzbzc2S2pSWkEwYTJrNmNZbHMwdGJRd3VDcDdlckJxQ1BMVjEramly?=
 =?utf-8?B?MUp0TkI0eWVVTEZsSXlxY2gyOFVhcng3RjZ0VzhwRCs3MlhXVHNzOHRBaTE4?=
 =?utf-8?B?Zyt3NEpFU3FWcms1S3NrRGl5bnVjUGxBcW5DTVIwaEp6WjNxZFc3OTFRaGJh?=
 =?utf-8?B?RGVIT09WcEg3NUo3Z0RXM2oreS9BRTEzOXViQmJmSVQ3M2pWOTFpdTVmVFUr?=
 =?utf-8?B?anlJR1BoVVI4Q0JQVk1OdVBMckxIei9TUTU2VGVXLzNqdUdzcGZ1bWJmK1A5?=
 =?utf-8?B?NkZFdkhucFlxSmJ3dTB2dDBjRkRlSTFsdmhPUFBaNE1maytJSVZpZ3N0dHpP?=
 =?utf-8?B?dzNvOGN4THJLeUdEUmhpNm5OS1ZXVXloc2tnTDh2azdXdHJVcjUrVGpJNTJJ?=
 =?utf-8?B?R0xLRFQzR05rSUYvRXp0RzdMMlpPQnVRdEY5czg0UitLSElCV1BtN1NlVnJJ?=
 =?utf-8?B?UVg1ZmlSenRCUUlLa0pPVkJrZEROTkpUOFZYRUFSMEFJbjRWZGVKUXBhamtv?=
 =?utf-8?B?di8vci9GNVVKNWY5aTRub0JvaDdmMEZBcStVaCsrazMwS2tVSnc0TGljamVK?=
 =?utf-8?B?ZWM4YS84M3hxajNIb1pVZmt4NDNVZmFSN2pqS0N0Mk5TV0ljc05GZWp1cVVO?=
 =?utf-8?B?RzdxU1BVZzk0MFJPSmRKRUZTaXdvQUxhUDlkdDFQMWVzSHUrV2VKSTBDNXAr?=
 =?utf-8?B?SFRMY2Z1R0FESnlJNlQxcWpneVQ1V1djanIrc3VyeGFMSzZ3MFpkbnhweHlq?=
 =?utf-8?B?MnN3UVhXOGhGK3VCZFIxL3FGK2hFT2ZEVXRjZVp6a2pWbDBoZ3ozRmQ5K2lo?=
 =?utf-8?B?UmtOMXl6SkRSOVpXUnIyUWVZYjB6VndSVHhrdlpISHBoSmUxVWdXRWtJaTB6?=
 =?utf-8?B?VXZRbWRldEdsRXQyeVpERlRrTUZUWkZteE1NRGFJM3p3Rk1zYXUvMGkrSzlQ?=
 =?utf-8?B?VGkwSVZMOVBVQ2xQczNsZHA4cWhtaGZIS2UyNUh0d3dod3VpY3VKZ1k5RllB?=
 =?utf-8?B?cmNKUDg3aXhuYitORVN4OSs1dVJ6akErdlU0dlNIcEh4bGt1MkNXdm42QzBk?=
 =?utf-8?B?cUoxQXhGVzE4ci9kREdZYjk3OVMyMUpTUzBLY1k4bTdpUmlSNytRbmtkdjc3?=
 =?utf-8?B?am9hcmpwaWFZLzhYcno1R0lBcWFrVk1VK25qMm5BbU1qcVYyM1lQeXNnZmdT?=
 =?utf-8?B?bitvOXI5REF1UXVXSll5Q1NLREtDU3h5MnIrN2FhKytqcmhTYll1OW5GNk1n?=
 =?utf-8?B?NWI2L2ZHK3UzUmROWUxaVWpvL2FaWkM3UndoM1dWMDcyYlFTQktWZ29ZbXZ1?=
 =?utf-8?B?WCtnbmZPMHpPdUV4c0ZJbkF1K3cycnF2U0ZQa25lNE9TV28zeVFYTGJqbGhG?=
 =?utf-8?B?VlFTNjhFaUpKZTg4S281czlBK1BmNVh0bm1BbiswTHpoREtFTng5RVZPbEpM?=
 =?utf-8?B?LzdrM0syVkZkWHQ0N2xqVG9UamlnUkVqYWVJQTJzYk43c2JtQlJaY1ZGQU1Q?=
 =?utf-8?B?VEFhczF2UjZVYUxPcWMwTWF6U3RxU3MvWEJUVHo4NlBOVVRZMHRJZFVBc1lt?=
 =?utf-8?B?WGxkZjFEYVF0OHlLSDdkZHQ5aEJRaVZjUzZrU3ExY2l5YVFtVEdqdEpaZDRO?=
 =?utf-8?B?aTdLbllzdVF5Mkhla0Fxb2kxRktLbUp6THZmOXdxRUlxTVE0YzdWMmlvQnhQ?=
 =?utf-8?B?Mzlkb2Z6d05TdGtXdkVIR0FNbmxvUGN4dVh3eUFlT3E5cDIyUk5ickh4TVBH?=
 =?utf-8?B?bHhrZWFDTDFELzNWTWpKVUV5eUw5Q1dWVk9ZYkI4SnlFd2g1WXF5R0hJZlZu?=
 =?utf-8?Q?11pbpOhB1oHt7U+LsjVVyOeaXm/8My00y63rSMKpGSi8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bbf52e7-eee7-48d7-580f-08da7ebe9a76
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 13:03:53.8397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpbOiC2IK1D57DkY3vDIDh2BeaghSlaeDEg/zUBhJaM6sYkwH8Ki1XYXGtjxN3Qz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2760
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
Cc: mwen@igalia.com, Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.08.22 um 13:39 schrieb Maíra Canal:
> If amdgpu_cs_vm_handling returns r != 0, then it will unlock the
> bo_list_mutex inside the function amdgpu_cs_vm_handling and again on
> amdgpu_cs_parser_fini. This problem results in the following
> use-after-free problem:
>
> [ 220.280990] ------------[ cut here ]------------
> [ 220.281000] refcount_t: underflow; use-after-free.
> [ 220.281019] WARNING: CPU: 1 PID: 3746 at lib/refcount.c:28 refcount_warn_saturate+0xba/0x110
> [ 220.281029] ------------[ cut here ]------------
> [ 220.281415] CPU: 1 PID: 3746 Comm: chrome:cs0 Tainted: G W L ------- --- 5.20.0-0.rc0.20220812git7ebfc85e2cd7.10.fc38.x86_64 #1
> [ 220.281421] Hardware name: System manufacturer System Product Name/ROG STRIX X570-I GAMING, BIOS 4403 04/27/2022
> [ 220.281426] RIP: 0010:refcount_warn_saturate+0xba/0x110
> [ 220.281431] Code: 01 01 e8 79 4a 6f 00 0f 0b e9 42 47 a5 00 80 3d de
> 7e be 01 00 75 85 48 c7 c7 f8 98 8e 98 c6 05 ce 7e be 01 01 e8 56 4a
> 6f 00 <0f> 0b e9 1f 47 a5 00 80 3d b9 7e be 01 00 0f 85 5e ff ff ff 48
> c7
> [ 220.281437] RSP: 0018:ffffb4b0d18d7a80 EFLAGS: 00010282
> [ 220.281443] RAX: 0000000000000026 RBX: 0000000000000003 RCX: 0000000000000000
> [ 220.281448] RDX: 0000000000000001 RSI: ffffffff988d06dc RDI: 00000000ffffffff
> [ 220.281452] RBP: 00000000ffffffff R08: 0000000000000000 R09: ffffb4b0d18d7930
> [ 220.281457] R10: 0000000000000003 R11: ffffa0672e2fffe8 R12: ffffa058ca360400
> [ 220.281461] R13: ffffa05846c50a18 R14: 00000000fffffe00 R15: 0000000000000003
> [ 220.281465] FS: 00007f82683e06c0(0000) GS:ffffa066e2e00000(0000) knlGS:0000000000000000
> [ 220.281470] CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 220.281475] CR2: 00003590005cc000 CR3: 00000001fca46000 CR4: 0000000000350ee0
> [ 220.281480] Call Trace:
> [ 220.281485] <TASK>
> [ 220.281490] amdgpu_cs_ioctl+0x4e2/0x2070 [amdgpu]
> [ 220.281806] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [ 220.282028] drm_ioctl_kernel+0xa4/0x150
> [ 220.282043] drm_ioctl+0x21f/0x420
> [ 220.282053] ? amdgpu_cs_find_mapping+0xe0/0xe0 [amdgpu]
> [ 220.282275] ? lock_release+0x14f/0x460
> [ 220.282282] ? _raw_spin_unlock_irqrestore+0x30/0x60
> [ 220.282290] ? _raw_spin_unlock_irqrestore+0x30/0x60
> [ 220.282297] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282305] ? _raw_spin_unlock_irqrestore+0x40/0x60
> [ 220.282317] amdgpu_drm_ioctl+0x4a/0x80 [amdgpu]
> [ 220.282534] __x64_sys_ioctl+0x90/0xd0
> [ 220.282545] do_syscall_64+0x5b/0x80
> [ 220.282551] ? futex_wake+0x6c/0x150
> [ 220.282568] ? lock_is_held_type+0xe8/0x140
> [ 220.282580] ? do_syscall_64+0x67/0x80
> [ 220.282585] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282592] ? do_syscall_64+0x67/0x80
> [ 220.282597] ? do_syscall_64+0x67/0x80
> [ 220.282602] ? lockdep_hardirqs_on+0x7d/0x100
> [ 220.282609] entry_SYSCALL_64_after_hwframe+0x63/0xcd
> [ 220.282616] RIP: 0033:0x7f8282a4f8bf
> [ 220.282639] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
> 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
> 0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
> 00
> [ 220.282644] RSP: 002b:00007f82683df410 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [ 220.282651] RAX: ffffffffffffffda RBX: 00007f82683df588 RCX: 00007f8282a4f8bf
> [ 220.282655] RDX: 00007f82683df4d0 RSI: 00000000c0186444 RDI: 0000000000000018
> [ 220.282659] RBP: 00007f82683df4d0 R08: 00007f82683df5e0 R09: 00007f82683df4b0
> [ 220.282663] R10: 00001d04000a0600 R11: 0000000000000246 R12: 00000000c0186444
> [ 220.282667] R13: 0000000000000018 R14: 00007f82683df588 R15: 0000000000000003
> [ 220.282689] </TASK>
> [ 220.282693] irq event stamp: 6232311
> [ 220.282697] hardirqs last enabled at (6232319): [<ffffffff9718cd7e>] __up_console_sem+0x5e/0x70
> [ 220.282704] hardirqs last disabled at (6232326): [<ffffffff9718cd63>] __up_console_sem+0x43/0x70
> [ 220.282709] softirqs last enabled at (6232072): [<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
> [ 220.282716] softirqs last disabled at (6232061): [<ffffffff970ff669>] __irq_exit_rcu+0xf9/0x170
> [ 220.282722] ---[ end trace 0000000000000000 ]---
>
> Therefore, remove the mutex_unlock from the amdgpu_cs_vm_handling
> function, so that amdgpu_cs_submit and amdgpu_cs_parser_fini can handle
> the unlock.
>
> Fixes: 90af0ca047f3 ("drm/amdgpu: Protect the amdgpu_bo_list list with a mutex v2")
> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
> Signed-off-by: Maíra Canal <mairacanal@riseup.net>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
> Thanks Melissa and Christian for the feedback on mutex_unlock.
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d8f1335bc68f..b7bae833c804 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -837,16 +837,12 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			continue;
>   
>   		r = amdgpu_vm_bo_update(adev, bo_va, false);
> -		if (r) {
> -			mutex_unlock(&p->bo_list->bo_list_mutex);
> +		if (r)
>   			return r;
> -		}
>   
>   		r = amdgpu_sync_fence(&p->job->sync, bo_va->last_pt_update);
> -		if (r) {
> -			mutex_unlock(&p->bo_list->bo_list_mutex);
> +		if (r)
>   			return r;
> -		}
>   	}
>   
>   	r = amdgpu_vm_handle_moved(adev, vm);

