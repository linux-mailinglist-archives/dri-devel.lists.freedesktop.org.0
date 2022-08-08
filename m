Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8842458C804
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 13:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E187D90FB3;
	Mon,  8 Aug 2022 11:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA0E8CFD3;
 Mon,  8 Aug 2022 11:57:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XMh9qncq/eANlEa2zYSDVRdap7X7JUXJpFxnZZe6M24DInNcvo6XUc/Sc+nvySDbHHzsJp2Vf5L/RUXzZjawA4Wh0Du25MZazUKY5HrZohLaBAB1YVxl/y4IxLeJ4LUXRjQQOctQTgm2iCPdRuzkxr+DjtKOz8fuIcN76TBD6wa15oDcnkjD+x7CN9++UvnRGR7SYJAK2NBPzyoM2gMkwRInBg2LfgSTTOZcXQuh2QsrdNHDfjGspVK7t18RTod1Qy3cx8lk1M2hv0eXfKjBttoYk5OqOCkx2kqFY3g5A4yl+NdKstAPakb4W0IHN1srvnjU/qbNO2OXm4rKjjvweg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNrimScN2waA9o7W+zFq5/oKQDBPyR8OOif1kwiQ3Gs=;
 b=KpxCxyxdFQK7zYLRBY96NJBP7IWpDC5jEcU1G1vTJaaIYfyfcca/qBwOz/witHl0wmQxQnvEeP5Sr9iIFfOzXD7/J3ii4ov5ROvCFbtyFlxdDk98NKVcMFOO6efRNe6daqxC3rcvd5Pzvd4BXQEuxfqDCAKlI2qkc3atJ+fZ0YuPicchxE+n0f7ADM/3DHu+37Sk6z5HeTkAcJtTHRlOrFxG/shiM/N0seRBN6TZwqDzld9/PrFU4lY/1mLzg4nDTXRBOnA1edbAywqZDz8sehXroSzDFwDD1kSl6j9C3sTH2gZQTgWzh26QWt1vxKmZ2cYBa28zA9oj0oCO2ce3BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNrimScN2waA9o7W+zFq5/oKQDBPyR8OOif1kwiQ3Gs=;
 b=sehvM28VRuV/G09JyhvmtluDiZ7CLsygecWBOoWh0sNrNvbWC22czJ3b+2iWOCK44wVKxTZ37+FCfuC6tGuq6nKv7WoUjtqjRAXwWEUQcZtYyK01L6IrL5HnAK0+ofnFxiygkpt1Bcutz/JjvlLmvq4ycvEkCMNDwT+55A8pJCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4706.namprd12.prod.outlook.com (2603:10b6:208:82::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Mon, 8 Aug
 2022 11:56:57 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Mon, 8 Aug 2022
 11:56:57 +0000
Message-ID: <5d813403-7cbd-13f5-ca96-713f92207aa8@amd.com>
Date: Mon, 8 Aug 2022 13:56:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ttm: Fix dummy res NULL ptr deref bug
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220726162205.2778-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220726162205.2778-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: acf96dba-646a-491a-9080-08da79351855
X-MS-TrafficTypeDiagnostic: BL0PR12MB4706:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xXth0SZHnhvH6HATUT44hyy1kcaoIOzYuMca4xRbpYz76ndd1/zlX5tk6IwORsKH8FphkY/oioY2g0iOmgBQ8Q2HdmjH+/u1u9qSC4yZ7cTVkzxESNdK/PZ/WWRM1Jc1/IPbFg8D1Q7n/VRZY3Zx2Xcp14vU98idZMiSAkkXOMXDPVVGWqWRop/4ZHMpgM7G+fnHTKATASFuOx1cas1Opq79OkfgqTqDtEIxOCSoRZ+AdahaAqDz1Di2c/UMJmdlsy2aCMozRmmciAejjHjHEh+D9JmHlU6wrs23aHBDv1Q/pRYrF5PGiNeojlNyTqQrTjVPzM6jvxeQVAt/nEnpZ6vgpUpeNvEFckNtc6JoQgQ9CGrh7vPe5a3cS39B0Pfyfq3YDPlDXT+tOzKEFPd0yaQnsYWyAfxkxzn2Z7TRLwnuH1uI7xBxcy7/ALnGbJxVNZmQL9Vh3A8C9YZ+YhflCyaBnTj2PnMuKsupCoJOPXBekSRBa5+4qQIkS4XCgEEpuAE2S1kLXNgAudPm+OAht3NFxo9LVpdjheAxDQ0JuWn8HZl0FPQ9MEmbQBaKaIEzvBrx0kZd1fUWTXHu/rIwk98dUPAADNQ0EDfHZ3OGVa6RtUg084uFI+yKRhWxKtL/QitnhIdazqwsoLs2CdyKwK3ynmXWB8AcHoxO4nxGMVKUGDDx5MSbAvOHJQQDVgKRDec6APSV0KYBgCU6Z22sZa2Yglg44Dd2/QvHA3Sf6v54tUDn7PSZ2LpmVebiQqy2Qzq4GxolzRIzJA7wJdgbL5gfJ912MDc9GipNlYe3Tna62+1K86c663xdhy/pS/2MGSl/zMljcQii5hsNxkv3geIgYaX8VwCJi/QWKn2a/g4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(478600001)(6486002)(966005)(66946007)(4326008)(2906002)(66476007)(31686004)(8936002)(38100700002)(5660300002)(66556008)(86362001)(66574015)(2616005)(41300700001)(186003)(6666004)(6512007)(6506007)(316002)(36756003)(31696002)(8676002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVoyazJSN2JnZ0xRZ0lWUndnL0czRTVZS3RRdDI3Tll0RjNwWENVbUJMT240?=
 =?utf-8?B?Q0tuYWdpRm14ZXlBOWlsaG1MbXZOSXVFR2hudmpWanBad2tLampHY3pXK2RX?=
 =?utf-8?B?aTVkdUZ6NlJYREY5SVkyQUY2ZGhWc3U1VTRTZEtRV00yTkkzZTdrTE9iS3Zw?=
 =?utf-8?B?ckpvZkowZnp4V2lPejlLU3ZVSG05Uk9UbXlsczlOU3FGaWlSdlFybXZieXdL?=
 =?utf-8?B?QXozMW5ZcGtpa3AweEV2b0cxMjUwd09XbVpIeGhCQU0vbkZ2NnBoVkJuc2hp?=
 =?utf-8?B?eThnbEQ4R0Y0ZTI4K0pwL3JDaUYyTmVBK2tGalQxVnRWam8vWnEwNmplQUo3?=
 =?utf-8?B?dkpMa2lTbDdPanpYYmdXYzFCaHRpZUFIZDdscTlyazRWUUl4cmlIcUxjSWVs?=
 =?utf-8?B?cGhBMldVcmNzdDlyaHU3Nlo5aG5wZmRDa2kreVI5ZU5KMTk1aWVjelhXSWY0?=
 =?utf-8?B?a2p6UTdqNXpkYVRoZHJlVUxpc0VDVkx1eUlDdEhXdGtBQUVIZXZiYTYvZWZS?=
 =?utf-8?B?UWRzdjZ5bklENmZ3cW9VRS95SUU2ajlhM0cwcmRudmh5dVBYbjNSeEtqMnJi?=
 =?utf-8?B?VEErc29TSXlqWm14MUFvQWJ0ZU5aL0w4Rng2QTFabnExWk54aXlNeFY3d2No?=
 =?utf-8?B?ZGhwNDdSakpnQndXQVBocHM0ZDhjS2JaQTI4Q3czcXFIRHo1WEZIMHIzYXlC?=
 =?utf-8?B?VC9zcTl2bFdxeW9YTGF0S1BieE05T2xBTFNFUDhIU212QTMyNklwWWE5NEVI?=
 =?utf-8?B?WWFPS09Pb0lOMDNINmhJZFhCNFJVTE10YmhaR3hWazZTUDNpMWwvbkw4Y05v?=
 =?utf-8?B?Z3NXQzdheSsvU1ZZdGRmbG9NdDdwNVgwNGhXNFpWSkhTNGkzWWdrRFRveDlk?=
 =?utf-8?B?djdlSkVCdThURzBDMEw0cEtzbzQyaFZ0RTliKzN5bVpvdGw5UDhVTnRvdzVS?=
 =?utf-8?B?SE54K3JjYlZhQXY5TWRjaWFhUThzVDd2djkrN0d4b3phaVMyMWQyc0hvQU5L?=
 =?utf-8?B?bjRIV3dMaW1FTGlsMnYvdXRBd01lbi9QSEpCN1NnMmZXa2xpeHI1SjBlekl0?=
 =?utf-8?B?K2piMkpDaTJrVVBqWmNnZTQ2SjNvaEpWZkhEdWxQajFnS293VUl1Rnd5WFBH?=
 =?utf-8?B?RW1ETHlGanJ5dTFhZjVURVNzL1VHTzFBc2VzRmt0QWV3ckRMaE5JTFd6dGQz?=
 =?utf-8?B?Z2xiN05YWnNieHBlQlZObks2MEplZXZMTlhqTFhsR2VTNVh3cFk2cDR2SVN0?=
 =?utf-8?B?S3B5enZEWWc4UkRFNERmU1YvKzZnbExabmFFUVllSkF6QWlLYVNQTU8ydTdX?=
 =?utf-8?B?b3hKU0s4dytmTCtsc2lVVU5BakYrYnVwdDhWWFdZTjhIV0F1YmNxRG5VeExP?=
 =?utf-8?B?R0kyeCt6SUFiY3VlWjVHVkV4ekVQdzc0Q1lNbldXSGlZL2xYTmI5ayswcHRU?=
 =?utf-8?B?ekh6anFTYWhsNWxsNkdVYWlRbXFUR1kzRkRWT1NQSHJrbVhyOUpqOVJrT3Nz?=
 =?utf-8?B?bkFZK2F6V2w5b2IwSHord3dEemtnWEM2aDRXam5BN244QmQ3NGtPa0NMaWp3?=
 =?utf-8?B?QmxtY1JlNEFmMXZFNnYyd3pKQUFvU1NzdGdUcTZJSDZiSE9UNWRZVTg2cHQv?=
 =?utf-8?B?cTArZFpoVkRYbStUSk43bUNiaGJFbFdBS01pRmQ0eDFHUTlCRkRVcEpsOTFD?=
 =?utf-8?B?YmVxTzd0T0REZVYrRHd2VzJzanFxZTdlemkxRVgyVUR5Vy9YSHBPWkZGTUFT?=
 =?utf-8?B?alRtU2huYW5lZ0V0OHNoZmF5VnkzQVdtNWtHTzdBSWtmbFVROG5ZU0pDWTh0?=
 =?utf-8?B?TmJxZ2dtYU52alFpQ20rWkl4RnppdUcwWXVNVHo3MVhkMGVndmdJcldSZFEx?=
 =?utf-8?B?dUM4UmlRUEpLSkNQb29HYmhpQkNycW16R2t5OE9xeGtvSGtHZGtxd0VTZjYy?=
 =?utf-8?B?RHRFTld3TXQva2k0dEU1MXdwdFlSS1pWQ1RJUi9YNENOK3k0ZzdhSXlkaFda?=
 =?utf-8?B?QWYyNnkrY2NKOVNYd0ZJUGpCNzR2SXM3cnBXckxBYUFDWG9sbDlUbFdWUnhC?=
 =?utf-8?B?MUFtN1FidjlnNUdBSVpEcHlpOUxCN3E1cURFQzNGZDhqQjMwT0xmK0ltRzc2?=
 =?utf-8?B?QmpRR3NlY2ZxaXhKRWZUVmREYVhMY2cvTTErWUpVem9ra3JrcEJjenhqL0Ew?=
 =?utf-8?Q?48hqv0TiPT8RgKIeF+DPxgYO9F2mJ49MukqUZFs8RV26?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf96dba-646a-491a-9080-08da79351855
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2022 11:56:57.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4SEB8xAt29OmEBgA5DqXfm3iGT8PU6zXZLbSfrbeeNtZM8cKocCkJ7XBnVg6oaVj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4706
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
Cc: alexander.deucher@amd.com, luben.tuikov@amd.com,
 kernel test robot <oliver.sang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.07.22 um 18:22 schrieb Arunpravin Paneer Selvam:
> Check the bo->resource value before accessing the resource
> mem_type.
>
> <log snip>
> [   40.191227][  T184] general protection fault, probably for non-canonical address 0xdffffc0000000002: 0000 [#1] SMP KASAN PTI
> [   40.192995][  T184] KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
> [   40.194411][  T184] CPU: 1 PID: 184 Comm: systemd-udevd Not tainted 5.19.0-rc4-00721-gb297c22b7070 #1
> [   40.196063][  T184] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [   40.199605][  T184] RIP: 0010:ttm_bo_validate+0x1b3/0x240 [ttm]
> [   40.200754][  T184] Code: e8 72 c5 ff ff 83 f8 b8 74 d4 85 c0 75 54 49 8b 9e 58 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8d 7b 10 48 89 fa 48 c1 ea 03 <0f> b6 04 02 84 c0 74 04 3c 03 7e 44 8b 53 10 31 c0 85 d2 0f 85 58
> [   40.203685][  T184] RSP: 0018:ffffc900006df0c8 EFLAGS: 00010202
> [   40.204630][  T184] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 1ffff1102f4bb71b
> [   40.205864][  T184] RDX: 0000000000000002 RSI: ffffc900006df208 RDI: 0000000000000010
> [   40.207102][  T184] RBP: 1ffff920000dbe1a R08: ffffc900006df208 R09: 0000000000000000
> [   40.208394][  T184] R10: ffff88817a5f0000 R11: 0000000000000001 R12: ffffc900006df110
> [   40.209692][  T184] R13: ffffc900006df0f0 R14: ffff88817a5db800 R15: ffffc900006df208
> [   40.210862][  T184] FS:  00007f6b1d16e8c0(0000) GS:ffff88839d700000(0000) knlGS:0000000000000000
> [   40.212250][  T184] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   40.213275][  T184] CR2: 000055a1001d4ff0 CR3: 00000001700f4000 CR4: 00000000000006e0
> [   40.214469][  T184] Call Trace:
> [   40.214974][  T184]  <TASK>
> [   40.215438][  T184]  ? ttm_bo_bounce_temp_buffer+0x140/0x140 [ttm]
> [   40.216572][  T184]  ? mutex_spin_on_owner+0x240/0x240
> [   40.217456][  T184]  ? drm_vma_offset_add+0xaa/0x100 [drm]
> [   40.218457][  T184]  ttm_bo_init_reserved+0x3d6/0x540 [ttm]
> [   40.219410][  T184]  ? shmem_get_inode+0x744/0x980
> [   40.220231][  T184]  ttm_bo_init_validate+0xb1/0x200 [ttm]
> [   40.221172][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
> [   40.222530][  T184]  ? ttm_bo_init_reserved+0x540/0x540 [ttm]
> [   40.223643][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
> [   40.224654][  T184]  ? __shmem_file_setup+0x102/0x280
> [   40.234764][  T184]  drm_gem_vram_create+0x305/0x480 [drm_vram_helper]
> [   40.235766][  T184]  ? bo_driver_evict_flags+0x340/0x340 [drm_vram_helper]
> [   40.236846][  T184]  ? __kasan_slab_free+0x108/0x180
> [   40.237650][  T184]  drm_gem_vram_fill_create_dumb+0x134/0x340 [drm_vram_helper]
> [   40.238864][  T184]  ? local_pci_probe+0xdf/0x180
> [   40.239674][  T184]  ? drmm_vram_helper_init+0x400/0x400 [drm_vram_helper]
> [   40.240826][  T184]  drm_client_framebuffer_create+0x19c/0x400 [drm]
> [   40.241955][  T184]  ? drm_client_buffer_delete+0x200/0x200 [drm]
> [   40.243001][  T184]  ? drm_client_pick_crtcs+0x554/0xb80 [drm]
> [   40.244030][  T184]  drm_fb_helper_generic_probe+0x23f/0x940 [drm_kms_helper]
> [   40.245226][  T184]  ? __cond_resched+0x1c/0xc0
> [   40.245987][  T184]  ? drm_fb_helper_memory_range_to_clip+0x180/0x180 [drm_kms_helper]
> [   40.247316][  T184]  ? mutex_unlock+0x80/0x100
> [   40.248005][  T184]  ? __mutex_unlock_slowpath+0x2c0/0x2c0
> [   40.249083][  T184]  drm_fb_helper_single_fb_probe+0x907/0xf00 [drm_kms_helper]
> [   40.250314][  T184]  ? drm_fb_helper_check_var+0x1180/0x1180 [drm_kms_helper]
> [   40.251540][  T184]  ? __cond_resched+0x1c/0xc0
> [   40.252321][  T184]  ? mutex_lock+0x9f/0x100
> [   40.253062][  T184]  __drm_fb_helper_initial_config_and_unlock+0xb9/0x2c0 [drm_kms_helper]
> [   40.254394][  T184]  drm_fbdev_client_hotplug+0x56f/0x840 [drm_kms_helper]
> [   40.255477][  T184]  drm_fbdev_generic_setup+0x165/0x3c0 [drm_kms_helper]
> [   40.256607][  T184]  bochs_pci_probe+0x6b7/0x900 [bochs]
> [   40.257515][  T184]  ? _raw_spin_lock_irqsave+0x87/0x100
> [   40.258312][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
> [   40.259244][  T184]  ? bochs_hw_init+0x480/0x480 [bochs]
> [   40.260186][  T184]  local_pci_probe+0xdf/0x180
> [   40.260928][  T184]  pci_call_probe+0x15f/0x500
> [   40.265798][  T184]  ? _raw_spin_lock+0x81/0x100
> [   40.266508][  T184]  ? pci_pm_suspend_noirq+0x980/0x980
> [   40.267322][  T184]  ? pci_assign_irq+0x81/0x280
> [   40.268096][  T184]  ? pci_match_device+0x351/0x6c0
> [   40.268883][  T184]  ? kernfs_put+0x18/0x40
> [   40.269611][  T184]  pci_device_probe+0xee/0x240
> [   40.270352][  T184]  really_probe+0x435/0xa80
> [   40.271021][  T184]  __driver_probe_device+0x2ab/0x480
> [   40.271828][  T184]  driver_probe_device+0x49/0x140
> [   40.272627][  T184]  __driver_attach+0x1bd/0x4c0
> [   40.273372][  T184]  ? __device_attach_driver+0x240/0x240
> [   40.274273][  T184]  bus_for_each_dev+0x11e/0x1c0
> [   40.275080][  T184]  ? subsys_dev_iter_exit+0x40/0x40
> [   40.275951][  T184]  ? klist_add_tail+0x132/0x280
> [   40.276767][  T184]  bus_add_driver+0x39b/0x580
> [   40.277574][  T184]  driver_register+0x20f/0x3c0
> [   40.278281][  T184]  ? 0xffffffffc04a2000
> [   40.278894][  T184]  do_one_initcall+0x8a/0x300
> [   40.279642][  T184]  ? trace_event_raw_event_initcall_level+0x1c0/0x1c0
> [   40.280707][  T184]  ? kasan_unpoison+0x23/0x80
> [   40.281479][  T184]  ? kasan_unpoison+0x23/0x80
> [   40.282197][  T184]  do_init_module+0x190/0x640
> [   40.282926][  T184]  load_module+0x221b/0x2780
> [   40.283611][  T184]  ? layout_and_allocate+0x5c0/0x5c0
> [   40.284401][  T184]  ? kernel_read_file+0x286/0x6c0
> [   40.285216][  T184]  ? __x64_sys_fspick+0x2c0/0x2c0
> [   40.286043][  T184]  ? mmap_region+0x4e7/0x1300
> [   40.286832][  T184]  ? __do_sys_finit_module+0x11a/0x1c0
> [   40.287743][  T184]  __do_sys_finit_module+0x11a/0x1c0
> [   40.288636][  T184]  ? __ia32_sys_init_module+0xc0/0xc0
> [   40.289557][  T184]  ? __seccomp_filter+0x15e/0xc80
> [   40.290341][  T184]  ? vm_mmap_pgoff+0x185/0x240
> [   40.291060][  T184]  do_syscall_64+0x3b/0xc0
> [   40.291763][  T184]  entry_SYSCALL_64_after_hwframe+0x46/0xb0
> [   40.292678][  T184] RIP: 0033:0x7f6b1d6279b9
> [   40.293438][  T184] Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d a7 54 0c 00 f7 d8 64 89 01 48
> [   40.296302][  T184] RSP: 002b:00007ffe7f51b798 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> [   40.297633][  T184] RAX: ffffffffffffffda RBX: 00005642dcca2880 RCX: 00007f6b1d6279b9
> [   40.298890][  T184] RDX: 0000000000000000 RSI: 00007f6b1d7b2e2d RDI: 0000000000000016
> [   40.300199][  T184] RBP: 0000000000020000 R08: 0000000000000000 R09: 00005642dccd5530
> [   40.301547][  T184] R10: 0000000000000016 R11: 0000000000000246 R12: 00007f6b1d7b2e2d
> [   40.302698][  T184] R13: 0000000000000000 R14: 00005642dcca4230 R15: 00005642dcca2880
>
> For more details: https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/CDDMUNPBPCKKVECT35ZIUG7FN5ZMSFCQ/
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..590110fdf59c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -912,7 +912,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   	/*
>   	 * We might need to add a TTM.
>   	 */
> -	if (bo->resource->mem_type == TTM_PL_SYSTEM) {
> +	if (!bo->resource || bo->resource->mem_type == TTM_PL_SYSTEM) {
>   		ret = ttm_tt_create(bo, true);
>   		if (ret)
>   			return ret;

