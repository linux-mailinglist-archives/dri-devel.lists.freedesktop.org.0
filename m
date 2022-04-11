Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7321C4FBC5C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 14:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7B010E35D;
	Mon, 11 Apr 2022 12:44:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2058.outbound.protection.outlook.com [40.107.237.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AB1610E18D;
 Mon, 11 Apr 2022 12:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha7S3ye+xzAraJOhQ6nMtDC5a4bGttC+12iYSkjwP2RBzl5uKYWvEdzeZSN71aiSm3Vw2EWqi4DFOgMqTRW9WuNqreryteUrUye7lpur6LPaPEJIawZhVG9nCL3ULMlrC2Mkv1KJeLUKt3DalJ7N7wP2Y6rcEShT9X6MsT/pz8N9ZwaaahErVOWbiyaBHVs9Q3OFH9inGbp8vPtL4bSMGQ2b1/S4duvxWzACQPUJwFtpH8cPVPJOJnQO3oZs1ELh76XdoKstidMEl2G417TNDqQ7P3yyrNxVtO3bndH/iMn5+QUD97Ou/tMf8zEpAUsx591gYkk+jYkz0EfNhBcwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KacxODSDzBfnMYAkptkU9kNXAzxMDEaHZEPPEiMcnfQ=;
 b=XmR9JAmXpP0KLTNngZomRocQ3yTMezH27maWrEUCXWSS6D6CTaknOjE2p5SwC8F7LSaXDCXDyKE2J4TIFuptHZEQfREOqfdJnPkYr2ksirleIEgrK+XPshKvFb2BbtOg4HHBRTzR7YZAHYAlj4RZLVeudY+43oKMbyNUsgzSqrmxSy9BzxosWFIIEvwkx9wu9wuSsxL0MaedPcq8vm8fzpsOu5R24TGYJ/9Pq1lu4LEzgJnIBL74ZzWZK/rxrp2QbZS7gIrgvDTUUwPAG9CGYn+ZP0r9joNxXln2InpaCzDalgpQ0+17czG6yD5bpoVmlXZmt0bmvkbvMnvacgImSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KacxODSDzBfnMYAkptkU9kNXAzxMDEaHZEPPEiMcnfQ=;
 b=Dn1HABVnDcygWRK8gODDOE43ehK2Jb5ohAlHMgnIN9XCQPUDlsMWWXsMF/sD8LXU5WFxLr81Z/KnO9smGjT+zWg3OuQtNbimNrZGXs8HbU8zgUljbdWA90dIheCY0C67ZLozxZrzM0LYCw23g5Ba/ptSP5TShN8jhFHZ2/FzTVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL0PR12MB4996.namprd12.prod.outlook.com (2603:10b6:208:1c6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 12:44:21 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a5fb:7137:5e64:cf8%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 12:44:21 +0000
Message-ID: <6ab5bf58-927c-5e32-28d7-079ba4ec1aef@amd.com>
Date: Mon, 11 Apr 2022 14:44:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] drm/ttm: stop passing NULL fence in
 ttm_bo_move_sync_cleanup
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220411085603.58156-1-matthew.auld@intel.com>
 <11835204-fd38-ef91-8e55-2b3e15aaaacd@linux.intel.com>
 <dd38bc4f-33ea-eb29-6192-fe04578f90f6@intel.com>
 <271fa83e-029e-a0d2-ecc3-5583722c7320@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <271fa83e-029e-a0d2-ecc3-5583722c7320@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0082.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::8) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e89a7be4-1c40-4877-9eb8-08da1bb8ff74
X-MS-TrafficTypeDiagnostic: BL0PR12MB4996:EE_
X-Microsoft-Antispam-PRVS: <BL0PR12MB4996956F3BFD47B61079C7F783EA9@BL0PR12MB4996.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x86Tt2MK8Qva4a24e0ODCreGZ+cDtJmI3YdGwXLFU8dnvQlB6iCGRuJX/BaSGZRCvBisVj8pCT0ueRM4qLc8qqVDbTckn1kwzESggRBiQsJGkx44hD2Zc8XxQLlEjYN+HhwoZTJvtpdI4r0t/3bwLyxbolPBBpMRcuGoXszxBfiSpUqSBVNDUnpDsKIeLpLvSG7fidx4HvqoEseLu63ivYhBSmX0POQbDu2woQgl1oAx63Gq2rNn5DqeSzkUlO8fTL/2SlWk5wMz5E+8YyT8lHYb0zkQwU/jgicw35z52ScsQ/qHUSXG5WTGwVxbFJpvpPjS70pxLX0wQH67vemDuyiqjaE8VmaI5Rk3l9uJJ1QZJ4Lwk8w3HC9a2D0rNwke2OnQ35pZic0nCI+C3Vk0ljVtgWfOMdVF13/T0zLdA5fivdXXvhNr5FcQWwMsAfbnvapXHFpO4e4C7S69t+xCmYzdtBnZM7BaNqh+OA3P7GXwRoUS3D0oW83KGqJyvrvvGuv/7FprMVMeLoPGo/75a3NXz6GrJGBEqteZZYreEjTBUrxMozzYLfKYre10wA2VCzsoomPw++picm2hytEGd0C76N3Y7IXJ07oI58mJWcplSHDmE3RaNxaR90Q2ImcgpxTy+FQ7T/S9Q9Zs6+JJtHnwQcqivHL5RpGRpVkAFs5bRpCeTR8cm/oT+J3Z/bM6fgexDCTcyu8eKHN4SvrY09SrG3jx2j/M4JcxU1AomCj2ZNnV5C9hqm5L2h6psvMu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(8676002)(66946007)(66476007)(66556008)(6512007)(31696002)(8936002)(5660300002)(508600001)(2906002)(2616005)(6486002)(110136005)(86362001)(6506007)(53546011)(316002)(31686004)(83380400001)(66574015)(38100700002)(54906003)(186003)(6666004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjkyUnBKcFQzREN3cTYwYi85OFFXdEtZK2JBa0hGeWR4L3pEN0JhUjVSQTBT?=
 =?utf-8?B?TlZNRjhHODlrNzVTOEdOSUVnK0dseWw2Z1VNWmhUZjFzUWxNaWJDK0luSVpR?=
 =?utf-8?B?NTdmS3NkQkI4R0Z1QkQvMmMxcHU0U3ZZWDZ2cDFNa29Od2NONlN3MVp6aHVy?=
 =?utf-8?B?VEM3RUEzSGFhUG5WZGFpMVptNXVwVUtBZE5WLzIxbnBPaUpFaWcrQWxZOElu?=
 =?utf-8?B?amcyc1U2ZW5wRjFGZm02Snd5aGx0RlZLb2hyYU1wVWE1WGtFa09RWEtJMXRt?=
 =?utf-8?B?VXMxZ29peFZlT1Zpb2t4YXRPY1BoczZ5VlJQbnRLWXVKbERjeTZnQ3grTlRv?=
 =?utf-8?B?UU91YkZ5eVZsbW9YU2FNZDhraVZNTWJxNm1kdTFLK1loWkNGSDJKUjM0OUNx?=
 =?utf-8?B?YVJ1NWJLTWltditEWFNwd2dMeWtGMjgxcnlTZzNOc2VKelNJTmtSeFl4VTU5?=
 =?utf-8?B?L1FoZlBXWGYxTHZIVDRVVWhwUytYVTJVSGVyRFZiSGtXaWFUdENTa3FPY2lW?=
 =?utf-8?B?VUg4bmxWTVo5dTl3aEt2djhUalRmS1VySElkWWw4YStDOHo1a0ZLVjdSSmlQ?=
 =?utf-8?B?K2VSUitVQ3pKYitmMitlaFdLdCtqdlIzencraWRyNmN3L3BzTXA2cXJ4QU9j?=
 =?utf-8?B?M0pkcXVRTzNRUVVyOGQ5S2s0L3hoWHFDMSt0WGh6NHQ1bjV3bHE5YURsSWJO?=
 =?utf-8?B?blA4MDJQTTlBT3pyY1NZT2x5WFgwbHh6SGptRGhLYUl6YU9uYk5rVGhrdDBp?=
 =?utf-8?B?eFY3TWNpVjFZbmZMa1RxaU5kSTR3ZXhueE43SDFPRDNOQmtvRnlhNzNad0ky?=
 =?utf-8?B?Q1Z4eU9xVHJnZlovdnZsMkptSHZvSkJJYjVRRTlWTldRdmo3UTNZaW9LQm5j?=
 =?utf-8?B?TTRMZ3FDZkF1dVVlWmJhczVLb3dPVWZEci9FR3I1S0ppZ0FUSHpBTXM5NkpE?=
 =?utf-8?B?ZHcyU0N4eSs4VWtycW50azJLc2tsaWlSYXZJTzRzSzZ5YUFIU0JJMVdjSWZk?=
 =?utf-8?B?MU9qdHhWS1g4cHArWFJkZ3hVa245WHFZY2FLbjJMSWRGdGtGbzNSN3RaN0dM?=
 =?utf-8?B?V1kwM1JtSW4vNjlUaFE4Y1ZINGpCa3Q2cWltWGg3MXZiYWJJZU9YVm9ocGk0?=
 =?utf-8?B?L21oZlplVG14SjJJMWJ6eEVra1F5c2xEZTEzMzZWZkRZeDJyRmRoNUFtNHMw?=
 =?utf-8?B?LzlNQ1BXMnpPUjRMUUZlNFlRbWNRQUF3K0NCc0FuTm1uMVJ2c1hJd3hxSGp5?=
 =?utf-8?B?Y3J4cTZJZXo5WXVNVkFtdm1UaWZJS2NXL2JzT2I0aUVFSHJJUVV3c00rZStV?=
 =?utf-8?B?c3E5cnM2ZUUzVnpyajRsQ3VrUlh4RHBJUTBtYXVoMG53TVpGQ0ZacW41MzJC?=
 =?utf-8?B?dFMyajZocXNQaHNiNUxUTldvSExUcU5icURiUmVuVUlGMGxKSkxVWFAzdURN?=
 =?utf-8?B?bEk4WGN3RE8xcitUSnVHVFRFZVMyc3hMRk01L2pkQ24xUE9FQUpPM1U5WnhQ?=
 =?utf-8?B?MW55NFlhNlk0YldKRDJPczd2YzhHaDJRNE5XL2VnRGxNOFI0bHg2bHJtVVR5?=
 =?utf-8?B?VmgvT29PVmliTFI3ZmdscmRiQTlDTmhXa2tua3lKSHo4L3ZMSDZNK0hzcldJ?=
 =?utf-8?B?V3FzVzZxNzMvVTJvYVRZVUltZ25qdHRoaGJtWVRlcVFaSDBrRWpyY1Jqb0Fn?=
 =?utf-8?B?TGp4L3lDdHZMZittQ1pob3hnbUFrMDZtZjNKQ3ZmZkxRR3VZd2RRV3d3U3pZ?=
 =?utf-8?B?eXRGNW9GTHlsTmF2S3NGckNHOHQ3bmV5VU9RYTJHbW10VmptYkxycFEwUUVj?=
 =?utf-8?B?NkI5QW9FRzlzLzVzN1VEUlNMbnhKcG01VTA4eFNRdmlpeE1HMHN3dmFTNTJy?=
 =?utf-8?B?VDhxMjh6MG5hWjJvdGx0WUZFNlIxUlpTYjQzb2JGQTloUHZUOWdCZEloL05i?=
 =?utf-8?B?cUxMUS9iY3pZcmdzdWRqdStwY2IrWmRPc1ZreVJuL0txR05DTDNWMEpvUHFh?=
 =?utf-8?B?WnlxaUVRWWtyVWtlVERJbGFuRzVsWTVQeGNvVDNoaXdwM1BtZFlLYzI0dXlv?=
 =?utf-8?B?b2VsR0RnemFjd3hQcjFRZ2tSNkJ4eVVsbzRnUGxseUROQ254ZjdEN2VUelIr?=
 =?utf-8?B?VWJ5YVRFMXB6anFwMlVGdkVyL2szSGl3ZDdMMEY3dUhuaEZxWlNBSVN0bDlq?=
 =?utf-8?B?VXl5RVhJQk80Ynk4WEVNL1lrajVNYTAvZUFMczFhMG0ycXhqSmY2ckJmS3Ri?=
 =?utf-8?B?WmVzQzIwenhVOElkQVRRU3lrb1NNazNEa0ZaTGZrMTdxYUFoQzlaRUdvRHlJ?=
 =?utf-8?B?S05GY1hqZVplSWxiVS9kSk1KYm5VRVQyNGx6NWFpZDh5QkVVNU5uU1hrdDhh?=
 =?utf-8?Q?IJ6CDQSSpCXCd5DGEQHokxmbGcV7KXcTQ40Ws4zRXpE/n?=
X-MS-Exchange-AntiSpam-MessageData-1: Pr+io8f8x6XZlQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e89a7be4-1c40-4877-9eb8-08da1bb8ff74
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 12:44:21.0423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bI35AEcQTw1qu4CvfBWeM7jDivH+SeSxADT7w7lm876Q00dya2Ghv76wGbrVu5TF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4996
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
Cc: Nirmoy Das <nirmoy.das@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 11.04.22 um 12:45 schrieb Thomas Hellström:
>
> On 4/11/22 12:06, Matthew Auld wrote:
>> On 11/04/2022 10:56, Thomas Hellström wrote:
>>> Hi, Matthew
>>>
>>> On 4/11/22 10:56, Matthew Auld wrote:
>>>> If we hit the sync case, like when skipping clearing for kernel 
>>>> internal
>>>> objects, or when falling back to cpu clearing, like in i915, we end up
>>>> trying to add a NULL fence, but with some recent changes in this area
>>>> this now just results in NULL deref in dma_resv_add_fence:
>>>>
>>>> <1>[    5.466383] BUG: kernel NULL pointer dereference, address: 
>>>> 0000000000000008
>>>> <1>[    5.466384] #PF: supervisor read access in kernel mode
>>>> <1>[    5.466385] #PF: error_code(0x0000) - not-present page
>>>> <6>[    5.466386] PGD 0 P4D 0
>>>> <4>[    5.466387] Oops: 0000 [#1] PREEMPT SMP NOPTI
>>>> <4>[    5.466389] CPU: 5 PID: 267 Comm: modprobe Not tainted 
>>>> 5.18.0-rc2-CI-CI_DRM_11481+ #1
>>>> <4>[    5.466391] RIP: 0010:dma_resv_add_fence+0x63/0x260
>>>> <4>[    5.466395] Code: 38 85 c0 0f 84 df 01 00 00 0f 88 e8 01 00 
>>>> 00 83 c0 01 0f 88 df 01 00 00 8b 05 35 89 10 01 49 8d 5e 68 85 c0 
>>>> 0f 85 45 01 00 00 <48> 8b 45 08 48 3d c0 a5 0a 82 0f 84 5c 01 00 00 
>>>> 48 3d 60 a5 0a 82
>>>> <4>[    5.466396] RSP: 0018:ffffc90000e974f8 EFLAGS: 00010202
>>>> <4>[    5.466397] RAX: 0000000000000001 RBX: ffff888123e88b28 RCX: 
>>>> 00000000ffffffff
>>>> <4>[    5.466398] RDX: 0000000000000001 RSI: ffffffff822e4f50 RDI: 
>>>> ffffffff8233f087
>>>> <4>[    5.466399] RBP: 0000000000000000 R08: ffff8881313dbc80 R09: 
>>>> 0000000000000001
>>>> <4>[    5.466399] R10: 0000000000000001 R11: 00000000da354294 R12: 
>>>> 0000000000000000
>>>> <4>[    5.466400] R13: ffff88810927dc58 R14: ffff888123e88ac0 R15: 
>>>> ffff88810a88d600
>>>> <4>[    5.466401] FS:  00007f5fa1193540(0000) 
>>>> GS:ffff88845d880000(0000) knlGS:0000000000000000
>>>> <4>[    5.466402] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>>> <4>[    5.466402] CR2: 0000000000000008 CR3: 0000000106dd6003 CR4: 
>>>> 00000000003706e0
>>>> <4>[    5.466403] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 
>>>> 0000000000000000
>>>> <4>[    5.466404] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 
>>>> 0000000000000400
>>>> <4>[    5.466404] Call Trace:
>>>> <4>[    5.466405]  <TASK>
>>>> <4>[    5.466406] ttm_bo_move_accel_cleanup+0x62/0x270 [ttm]
>>>> <4>[    5.466411]  ? i915_rsgt_from_buddy_resource+0x185/0x1e0 [i915]
>>>> <4>[    5.466529]  i915_ttm_move+0xfd/0x430 [i915]
>>>> <4>[    5.466833]  ? dma_resv_reserve_fences+0x4e/0x320
>>>> <4>[    5.466836]  ? ttm_bo_add_move_fence.constprop.20+0xf7/0x140 
>>>> [ttm]
>>>> <4>[    5.466841]  ttm_bo_handle_move_mem+0xa1/0x140 [ttm]
>>>> <4>[    5.466845]  ttm_bo_validate+0xee/0x160 [ttm]
>>>> <4>[    5.466849]  __i915_ttm_get_pages+0x4f/0x210 [i915]
>>>> <4>[    5.466976]  i915_ttm_get_pages+0xad/0x140 [i915]
>>>> <4>[    5.467094] ____i915_gem_object_get_pages+0x32/0xf0 [i915]
>>>> <4>[    5.467210] __i915_gem_object_get_pages+0x89/0xa0 [i915]
>>>> <4>[    5.467323]  i915_vma_get_pages+0x114/0x1d0 [i915]
>>>> <4>[    5.467446]  i915_vma_pin_ww+0xd3/0xa90 [i915]
>>>> <4>[    5.467570] i915_vma_pin.constprop.10+0x119/0x1b0 [i915]
>>>> <4>[    5.467700]  ? __mutex_unlock_slowpath+0x3e/0x2b0
>>>> <4>[    5.467704] intel_alloc_initial_plane_obj.isra.6+0x1a9/0x390 
>>>> [i915]
>>>> <4>[    5.467833] intel_crtc_initial_plane_config+0x83/0x340 [i915]
>>>>
>>>> In the ttm_bo_move_sync_cleanup() case it seems we only really care
>>>> about calling ttm_bo_wait_free_node(), so let's instead just call that
>>>> directly.
>>>>
>>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>> Cc: Christian König <christian.koenig@amd.com>
>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>> Cc: Nirmoy Das <nirmoy.das@linux.intel.com>
>>>> ---
>>>>   drivers/gpu/drm/ttm/ttm_bo_util.c | 15 +++++++++++++++
>>>>   include/drm/ttm/ttm_bo_driver.h   | 11 +++--------
>>>>   2 files changed, 18 insertions(+), 8 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c 
>>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> index bc5190340b9c..1cbfb00c1d65 100644
>>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>>> @@ -572,6 +572,21 @@ int ttm_bo_move_accel_cleanup(struct 
>>>> ttm_buffer_object *bo,
>>>>   }
>>>>   EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>>>> +void ttm_bo_move_sync_cleanup(struct ttm_buffer_object *bo,
>>>> +                  struct ttm_resource *new_mem)
>>>> +{
>>>> +    struct ttm_device *bdev = bo->bdev;
>>>> +    struct ttm_resource_manager *man = ttm_manager_type(bdev, 
>>>> new_mem->mem_type);
>>>> +    int ret;
>>>> +
>>>> +    ret = ttm_bo_wait_free_node(bo, man->use_tt);
>>>> +    if (WARN_ON(ret))
>>>> +        return;
>>>> +
>>>> +    ttm_bo_assign_mem(bo, new_mem);
>>>> +}
>>>> +EXPORT_SYMBOL(ttm_bo_move_sync_cleanup);
>>>
>>> I don't think this will help in the case where we call 
>>> ttm_bo_move_accel_cleanup() with a NULL fence....
>>
>> Hmm, do you know if that case actually exists? I thought the only 
>> current user passing fence == NULL was ttm_bo_move_sync_cleanup().
>
>
> Yes, indeed, you're right. Not sure if any other driver hits that, 
> though.

At least when I came up with that ~halve a year ago I double checked all 
drivers to not call ttm_bo_move_accel_cleanup() without a fence.

But I also somehow missed ttm_bo_move_sync_cleanup(), so take that with 
a grain of salt.

Christian.

>
> /Thomas
>
>

