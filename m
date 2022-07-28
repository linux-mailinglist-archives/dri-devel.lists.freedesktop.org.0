Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5382958391E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 09:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4580118A689;
	Thu, 28 Jul 2022 07:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80E518A57D;
 Thu, 28 Jul 2022 07:04:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjkKX7dMxRHBJTrVF2Nk4pFJZxwyIeNDr5ygFfalIlqwi8Q/aIfsruvJz6TBFaHL2nVyDWLNNaE0B7BDSa1GCI9gUMOsId1IAFFboxyGOAlbmllU98hirwO77ePRDMR80uWs8ok02GGoqNNSXtsfXLwJzKtbiTuyOEmJU5fmPnxs+WB7pjW6mkhzRGaNls9LnenjbNqS8g++4norCOK1fcJSim2Rqg6yiKnSy3s3mzBAt7Vst5yvD9L/x6jWvBneIIu1aLr8URKv4DIh/piHPYsbzF1PAKZr2FohlBca5w4/0egQUBCQRsDYlIuKsF+TTTLD92tvY473e5/dNecsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8A2ZIMxd3D/5BFY3zSXs53DaNJBb51gPSS1kPFmnKg8=;
 b=lLWrTBjQ9P+AwoLe4QGc7BMH72IQlIefurjTV/Cm+cpBFt9oZg4Jzih/seEJixgpaf0AycxxerJZko14XW7ygwcoOnqBRVu6cTh3F5DYQMHu3E2WWl+3B1IOHhicfVEOde536LgH4or9bLFwhiDhryuHNEBQi5MjoBgNbdrdD5TQ1+Y4I32ZcnoCHV3D+TJIUKctDxecaJ8Q9E8D15cHimRmUE58Lkcon+WtEc0MMg/wn5F7v+gBUoT5Nfv73AmQ8+H72sPxoVBCZMK2t/uPacqBWGkWuwwtmPib22+G5mOZmvSAhJLR3JT1i97dmZFiswRdsL0NPb4gDaX9N0wTrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8A2ZIMxd3D/5BFY3zSXs53DaNJBb51gPSS1kPFmnKg8=;
 b=RRisfODI9roluEa5tn1dS9fc6sfWm2sRlZJA1GAafqWo6/qhVvR9GheoopbPN2Csdsq3FTWuU7ETbJclWyOnxtDIT6crOmP5a+uiDTqhrG+BBe8PojyN71higu10j/2e4W6nqLeHKMxw/Lf5Oodesus89SdbrQujPd9f7xhsJ3E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MWHPR12MB1888.namprd12.prod.outlook.com (2603:10b6:300:112::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 28 Jul
 2022 07:04:23 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::a1d8:6a71:213b:6e14%9]) with mapi id 15.20.5458.025; Thu, 28 Jul 2022
 07:04:23 +0000
Message-ID: <136a11dd-2d6c-d0a7-fac4-58f478c762c6@amd.com>
Date: Thu, 28 Jul 2022 12:34:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] drm/ttm: Fix dummy res NULL ptr deref bug
Content-Language: en-US
To: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
References: <20220727053032.3668-1-Arunpravin.PaneerSelvam@amd.com>
 <92810c27-4a8c-3df0-db37-086cdae28868@igalia.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <92810c27-4a8c-3df0-db37-086cdae28868@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34418afc-e52d-423f-b3f3-08da7067668f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1888:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b86hAjUxGx/N/AI9+8qCegvHfC6u8gzwJpb6To0qj0Pa6DTRB1f9Wtdhfb18aAJCG8t/+Kouesi5M411mKHC7Yy1nKdjtUnZ/Hs6nO1QpCwapnhrxjy68J26fkjsuYS17qu9iFK9tfuR4U6HMlPIz4bW8+R9qFdw/NaccleskyBgWLI21lpJU6wLZAIDkXehJwjOiGZUP/75prIXcnSp6lPdtnYaX6mrmSWxX57zusinkg6SxDQNtwYFhZgumXI/OkOhMbQpx9nLS3m1Z6JjO5UoojI9o9+B7jDL8iYcHYbEqK8BX/kKDZ740n2YPvAP3GwZQz7WihXGUZ1UGtJuo2zPTqSZ9B2XZvdLs8Hlt9DNC4c/aIbo7prZ3CSjgrylYPdP7vqjhOa9g37NOOtqrdn+nJXvEiNGNMutxLhJUaIMQ4Zk0hr5SgY59FuXADL3Syx5gyrArnHYOHr1OxTeuHfVRptceFtAzI/79so+6jzT/tRKYfBZmcnk8wXQzNQBJIocKLHN8cHyeDlU3vNofBOVNQCb2UK0DVudJC1CDY7FUsJb8dB14f0SVi5nyO5AfWqPNyZlIzWPns60lniPzBFEr3Mg+SCvEwbZb2PIgBNB/2TU/XeJuYx1Ecq7OH9PrWd3oh0i6lqtAl1ufSij9gisgUHJGXuJ7aCbtQgDRWEJJG5y5ByZAETrSB3DUPKs8Cj7nE4Htf8bmG5uG082TPela37zx9vkafWrDRkr7FGDVdFPmLQ9QCU/49A5gUJ0FJw62/7jxswuxXYdv/bEGVT4ZeE0F220DhWVtn0xzScJOg2Dy5PI2G4xrKm+u0dMuxNPGXTCVo7ep7GTShhwGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(186003)(2616005)(36756003)(83380400001)(6916009)(66476007)(4326008)(66946007)(8676002)(6506007)(31686004)(53546011)(6666004)(2906002)(26005)(41300700001)(66556008)(31696002)(5660300002)(38100700002)(316002)(6486002)(86362001)(478600001)(8936002)(6512007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1lIajAzeW43bGdiZWNveGpvOGV5VU4wV1Y3c0tlcVRPRVdhRUhoY3VycG9R?=
 =?utf-8?B?WEJUaFdCODRkK1JJSWV1dlY0aEQ4Um5HTlI1Z0J5a3ZqTWdJSGpPdjgrbW1x?=
 =?utf-8?B?WXJrOEhpU01lUHJIM3cwbkVxRU9OZFhuWGFwUDFlcmVKT3QrSEZncktCQXZU?=
 =?utf-8?B?VUlDYlk0b3ZRK1g2dUFDOXJpeEZURkkrZ0twV09IcVdZQVFJTEtpZ1g2b2hn?=
 =?utf-8?B?bUtyclk0UVlDN01nMHp1QUpoaDdhKzlkQlFuZDcvaGh5cVF5RXZaUU5iUDUy?=
 =?utf-8?B?TllSM3gybGtQdC9zRHBtVTEzQXI4ZmVUMnpZVC9sdDI0d2g4a0FMNDEyaWlF?=
 =?utf-8?B?VzBKcCtCTzVQa1pnZ3NiTHovV0R0aGNuMXNvMXpRd1FVZHhNdUFSUDdWZ1I4?=
 =?utf-8?B?dmZxREthVWFFdHdiN3E2NVRNYUp4dldIRm1keEhEOE0vdEMvU3dnaVM3SmJw?=
 =?utf-8?B?N3B2VTZyRnVXYjl5Qm1pTUx3cmZ4OElhNXdrY2JjQVhDV3pKbHBTT1BYZWRu?=
 =?utf-8?B?ZEV5ZEp2OERFZHU5WUdkUmw0UVlIVmVDeGU4LzZvMHcwVlNoUk9vdy9lYy9m?=
 =?utf-8?B?VWdFR0x2UXE3dXFHVzdFbUVNUzFNVklUNkVWMHZWTjVkMDMyeFdPUDN6Tjdq?=
 =?utf-8?B?ZUtrMG1tZTVSclEwTSt1c1pkS1RURDFtcjBGckpBN1pTOEZvOW5GOFNoNlNS?=
 =?utf-8?B?VHhJeHVzMkIxNGxlNHFkM0kyU1Q4Y2sxY1l6ZktSWTBWNjhNTSs2UnpIeW03?=
 =?utf-8?B?UWRDbUQ2L0FRQ0hUWTBtYmppM0QwLzJSSW1idkJ0QXI0NWVKR0s3MUtTdmRL?=
 =?utf-8?B?ejFGUWxadWI0Y0lKanh6QnVZMWh0YWhBbXI1Q3AzQmVPMHNCVkJISStEU0ZJ?=
 =?utf-8?B?TldBSlA2UEFZWDhwN0ZNVVdCbUkrVTBOQkFnbDhSdW9LNWVWVWFCYXlYa2Ev?=
 =?utf-8?B?WFREeVBPZ3hnQTJsL2lZMGpLaWNSNnErdVB1T2Q5QXo2eGsrUWY5eUQ1R3pn?=
 =?utf-8?B?MlpENEhiU2orQWRjMWxDZjM3RTN1WUJLYXR0T1lIdkpYQkUvY0RqeHQ3OVVW?=
 =?utf-8?B?aXZpRXh0THlsbXZXTW5CMHdvemtONVV0TGd4WDFmZ0VMMk8xZlpDNXVhSDRn?=
 =?utf-8?B?TUpkS0VsSHpRTTFWSjZUTWtWbUpvdTdVY0g2ZHNpajY3TXJ2TGRYdC94V3Ra?=
 =?utf-8?B?RWx6d2VRbmNhL1U2TXJ1S2piUkJQN1NJRGxYWmdRbTQrUTAzQThBaXZhaS9E?=
 =?utf-8?B?eVlGMjZhVGgyNjJ1TDVtNDZTTGI4WExXTzZyVmVOTyt5d0dDUnN5cTJnV0lZ?=
 =?utf-8?B?eFRoenlmV2ZST0NuVUlNUnFra21SMzUwRXdOcTBqUXhwZWZDUDdzaTZQSmk1?=
 =?utf-8?B?S0hDK0o2Y1FVOXpURE0vTzhxUXd1WGZGV1g3ckduMFE0TFkzZzNwZndFekpt?=
 =?utf-8?B?VVNSZC9rQWw2VnFsUmRRWXEvaE0yczY2enczYkxjdG16RTNVTVZjUGJYY1pU?=
 =?utf-8?B?d1g5dkQrQ1o2MjJ6b3ZpallRc05LSk5zM29yekYzenZDS0dEYVlqQTVYNGZF?=
 =?utf-8?B?cnpVc0UveGRucCtrbFRETmIxeXZqbjNUMnh2QUlzMHJVcUY2MjMwRzA3dE9M?=
 =?utf-8?B?RlJTWkRGZ2NBcEpTZVZjZW9FWTNMalMrUHorVWZjQno2MFh6eWd6RStkQ2NW?=
 =?utf-8?B?ekF4bWE1QjB3dy9oMk1KMFc0U2pmTzVHd2lqbUtZZTRhM0NBSzlwUktYUGdy?=
 =?utf-8?B?WloxR3paK1NlQ2FGZzc3RUFaYnkrU2tLMDJaYStCWFc2UUkrVnF2WHE3NVl4?=
 =?utf-8?B?aGxHbk1kQTF3Y09XM3dheDBXTm9STk82UG82eDNqYXI3UjFtZ0NiSUJIU0xV?=
 =?utf-8?B?a3drc2wzdWRETm9YOGhRNEFaQzAvdEFXMnRkYlpheTcxaWlValpaWFUzZkx3?=
 =?utf-8?B?Yi9OcTI4amJWVEpabFZXWkZidzJqTG1DTGIxWGxqbVd0QXlBK1NtWkx3NlRB?=
 =?utf-8?B?ZnRqMHZacUt3N2MvSWlMQ29oNHVQYkd5UGVjY3JqZ2NZQU5CWWtSMzVvNXp1?=
 =?utf-8?B?bGQwSlBwUElXLzMzMmRqOEZZTm1maG9ESSs4YXNwZVEyVkhLV2dzM3BGbXdD?=
 =?utf-8?Q?U5vhZnTap/sX35YSonuYG1XHM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34418afc-e52d-423f-b3f3-08da7067668f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2022 07:04:23.3950 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Y4AqQJ3oPiJvF0eFFXLwrFlm95cLt59dN2uul7OWqfQ2uYWMv76uCtLFjMiRueIG/H82JKC+P3DybBeOgEjAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1888
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 luben.tuikov@amd.com, kernel test robot <oliver.sang@intel.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andre,

On 7/27/2022 8:56 PM, André Almeida wrote:
> Hi Arunpravin,
>
> Às 02:30 de 27/07/22, Arunpravin Paneer Selvam escreveu:
>> Check the bo->resource value before accessing the resource
>> mem_type.
>>
>> v2: Fix commit description unwrapped warning
>>
>> <log snip>
>> [   40.191227][  T184] general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
>> [   40.192995][  T184] KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
>> [   40.194411][  T184] CPU: 1 PID: 184 Comm: systemd-udevd Not tainted 5.19.0-rc4-00721-gb297c22b7070 #1
>> [   40.196063][  T184] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
>> [   40.199605][  T184] RIP: 0010:ttm_bo_validate+0x1b3/0x240 [ttm]
>> [   40.200754][  T184] Code: e8 72 c5 ff ff 83 f8 b8 74 d4 85 c0 75 54 49 8b 9e 58 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 10 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 04 3c 03 7e 44 8b 53 10 31 c0 85 d2 0f 85 58
>> [   40.203685][  T184] RSP: 0018:ffffc900006df0c8 EFLAGS: 00010202
>> [   40.204630][  T184] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff1102f4bb71b
>> [   40.205864][  T184] RDX: 0000000000000002 RSI: ffffc900006df208 RDI: 0000000000000010
>> [   40.207102][  T184] RBP: 1ffff920000dbe1a R08: ffffc900006df208 R09: 0000000000000000
>> [   40.208394][  T184] R10: ffff88817a5f0000 R11: 0000000000000001 R12: ffffc900006df110
>> [   40.209692][  T184] R13: ffffc900006df0f0 R14: ffff88817a5db800 R15: ffffc900006df208
>> [   40.210862][  T184] FS:  00007f6b1d16e8c0(0000) GS:ffff88839d700000(0000) knlGS:0000000000000000
>> [   40.212250][  T184] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [   40.213275][  T184] CR2: 000055a1001d4ff0 CR3: 00000001700f4000 CR4: 00000000000006e0
>> [   40.214469][  T184] Call Trace:
>> [   40.214974][  T184]  <TASK>
>> [   40.215438][  T184]  ? ttm_bo_bounce_temp_buffer+0x140/0x140 [ttm]
>> [   40.216572][  T184]  ? mutex_spin_on_owner+0x240/0x240
>> [   40.217456][  T184]  ? drm_vma_offset_add+0xaa/0x100 [drm]
>> [   40.218457][  T184]  ttm_bo_init_reserved+0x3d6/0x540 [ttm]
>> [   40.219410][  T184]  ? shmem_get_inode+0x744/0x980
>> [   40.220231][  T184]  ttm_bo_init_validate+0xb1/0x200 [ttm]
>> [   40.221172][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
>> [   40.222530][  T184]  ? ttm_bo_init_reserved+0x540/0x540 [ttm]
>> [   40.223643][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
>> [   40.224654][  T184]  ? __shmem_file_setup+0x102/0x280
>> [   40.234764][  T184]  drm_gem_vram_create+0x305/0x480 [drm_vram_helper]
>> [   40.235766][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
>> [   40.236846][  T184]  ? __kasan_slab_free+0x108/0x180
>> [   40.237650][  T184]  drm_gem_vram_fill_create_dumb+0x134/0x340 [drm_vram_helper]
>> [   40.238864][  T184]  ? local_pci_probe+0xdf/0x180
>> [   40.239674][  T184]  ? drmm_vram_helper_init+0x400/0x400 [drm_vram_helper]
>> [   40.240826][  T184]  drm_client_framebuffer_create+0x19c/0x400 [drm]
>> [   40.241955][  T184]  ? drm_client_buffer_delete+0x200/0x200 [drm]
>> [   40.243001][  T184]  ? drm_client_pick_crtcs+0x554/0xb80 [drm]
>> [   40.244030][  T184]  drm_fb_helper_generic_probe+0x23f/0x940 [drm_kms_helper]
>> [   40.245226][  T184]  ? __cond_resched+0x1c/0xc0
>> [   40.245987][  T184]  ? drm_fb_helper_memory_range_to_clip+0x180/0x180 [drm_kms_helper]
>> [   40.247316][  T184]  ? mutex_unlock+0x80/0x100
>> [   40.248005][  T184]  ? __mutex_unlock_slowpath+0x2c0/0x2c0
>> [   40.249083][  T184]  drm_fb_helper_single_fb_probe+0x907/0xf00 [drm_kms_helper]
>> [   40.250314][  T184]  ? drm_fb_helper_check_var+0x1180/0x1180 [drm_kms_helper]
>> [   40.251540][  T184]  ? __cond_resched+0x1c/0xc0
>> [   40.252321][  T184]  ? mutex_lock+0x9f/0x100
>> [   40.253062][  T184]  __drm_fb_helper_initial_config_and_unlock+0xb9/0x2c0 [drm_kms_helper]
>> [   40.254394][  T184]  drm_fbdev_client_hotplug+0x56f/0x840 [drm_kms_helper]
>> [   40.255477][  T184]  drm_fbdev_generic_setup+0x165/0x3c0 [drm_kms_helper]
>> [   40.256607][  T184]  bochs_pci_probe+0x6b7/0x900 [bochs]
>> [   40.257515][  T184]  ? _raw_spin_lock_irqsave+0x87/0x100
>> [   40.258312][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
>> [   40.259244][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
>> [   40.260186][  T184]  local_pci_probe+0xdf/0x180
>> [   40.260928][  T184]  pci_call_probe+0x15f/0x500
>> [   40.265798][  T184]  ? _raw_spin_lock+0x81/0x100
>> [   40.266508][  T184]  ? pci_pm_suspend_noirq+0x980/0x980
>> [   40.267322][  T184]  ? pci_assign_irq+0x81/0x280
>> [   40.268096][  T184]  ? pci_match_device+0x351/0x6c0
>> [   40.268883][  T184]  ? kernfs_put+0x18/0x40
>> [   40.269611][  T184]  pci_device_probe+0xee/0x240
>> [   40.270352][  T184]  really_probe+0x435/0xa80
>> [   40.271021][  T184]  __driver_probe_device+0x2ab/0x480
>> [   40.271828][  T184]  driver_probe_device+0x49/0x140
>> [   40.272627][  T184]  __driver_attach+0x1bd/0x4c0
>> [   40.273372][  T184]  ? __device_attach_driver+0x240/0x240
>> [   40.274273][  T184]  bus_for_each_dev+0x11e/0x1c0
>> [   40.275080][  T184]  ? subsys_dev_iter_exit+0x40/0x40
>> [   40.275951][  T184]  ? klist_add_tail+0x132/0x280
>> [   40.276767][  T184]  bus_add_driver+0x39b/0x580
>> [   40.277574][  T184]  driver_register+0x20f/0x3c0
>> [   40.278281][  T184]  ? 0xffffffffc04a2000
>> [   40.278894][  T184]  do_one_initcall+0x8a/0x300
>> [   40.279642][  T184]  ? trace_event_raw_event_initcall_level+0x1c0/0x1c0
>> [   40.280707][  T184]  ? kasan_unpoison+0x23/0x80
>> [   40.281479][  T184]  ? kasan_unpoison+0x23/0x80
>> [   40.282197][  T184]  do_init_module+0x190/0x640
>> [   40.282926][  T184]  load_module+0x221b/0x2780
>> [   40.283611][  T184]  ? layout_and_allocate+0x5c0/0x5c0
>> [   40.284401][  T184]  ? kernel_read_file+0x286/0x6c0
>> [   40.285216][  T184]  ? __x64_sys_fspick+0x2c0/0x2c0
>> [   40.286043][  T184]  ? mmap_region+0x4e7/0x1300
>> [   40.286832][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
>> [   40.287743][  T184]  __do_sys_finit_module+0x11a/0x1c0
>> [   40.288636][  T184]  ? __ia32_sys_init_module+0xc0/0xc0
>> [   40.289557][  T184]  ? __seccomp_filter+0x15e/0xc80
>> [   40.290341][  T184]  ? vm_mmap_pgoff+0x185/0x240
>> [   40.291060][  T184]  do_syscall_64+0x3b/0xc0
>> [   40.291763][  T184]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
>> [   40.292678][  T184] RIP: 0033:0x7f6b1d6279b9
>> [   40.293438][  T184] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
>> [   40.296302][  T184] RSP: 002b:00007ffe7f51b798 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
>> [   40.297633][  T184] RAX: ffffffffffffffda RBX: 00005642dcca2880 RCX: 00007f6b1d6279b9
>> [   40.298890][  T184] RDX: 0000000000000000 RSI: 00007f6b1d7b2e2d RDI: 0000000000000016
>> [   40.300199][  T184] RBP: 0000000000020000 R08: 0000000000000000 R09: 00005642dccd5530
>> [   40.301547][  T184] R10: 0000000000000016 R11: 0000000000000246 R12: 00007f6b1d7b2e2d
>> [   40.302698][  T184] R13: 0000000000000000 R14: 00005642dcca4230 R15: 00005642dcca2880
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
>> index c1bd006a5525..590110fdf59c 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>> @@ -912,7 +912,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>>   	/*
>>   	 * We might need to add a TTM.
>>   	 */
>> -	if (bo->resource->mem_type == TTM_PL_SYSTEM) {
>> +	if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
>>   		ret = ttm_tt_create(bo, true);
>>   		if (ret)
>>   			return ret;
>
> bo->resource is accessed a bit earlier in the same function at
>
> 	ttm_resource_compat(bo->resource, placement)
>
> I wonder if this would need to be check for NULL as well.
In the earlier condition, if bo->resource is NULL, it enters the if 
condition and I suspect it
didn't return, hence the control hits the next if condition and access 
the bo->resource->mem_type
which results in NULL pointer deference.

Thanks,
Arun

