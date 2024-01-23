Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BCD837925
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 01:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421E110F1B1;
	Tue, 23 Jan 2024 00:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFCB10F1AE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 00:30:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxysvg8Q3VTsUnNZgiPGwgjwL4+WCvp7lH/yNu9oZ4jJA9GWRlVqWaygKueelxNrujrnDsab5G3mUv4EZTjUF7F4UIDmUO1qAEdextgu4t8bn4oTbD65iPoDFJLOI/Me2viwoCAnZUSgZTpFa1yhRvuyYodUZ4Qu3QRcN4JZ5RXKdphnPAZtsfzZYpZtl13ofBZLDZQEPThneZeCS9jTqQW/wpUTwjQMYQHU8QEf3WMll+SiL+ffCjhakEWLoi+Ztlu5PF3KIlU4jF9TpMiGVYnsG0EpSF2Nh9aXrr7f4MNq/GizolA89SPVMBQSWiYSi+n3L+3sd+wst5T4b/r3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FZIFUUTL+W1z0z0sByf/6DDcnTXJEfifjARDogEBH/E=;
 b=kDlORGaPoQXYudZFRpGx/jLr1lM5/l/y8xrh59XATnow7wxnsMWUpM0khFCtQ0nsVwQveFydesK+tgvWfN6J9hYLDCSMq97+0fZczUFRr9ogt4aJL7khjxmjsQDsJEWetRk8Sn55k4rRlmj8jT82nX/Wd5suz9R0JJad4MQlbMg7cnV5WKlXwLzku2WczIn2rCWhLsH3sH4wI51HZnBzwRzfcpEbGrpFdEAIyVrwOcxEWyzl2H1y3JFLuJ0QHpDY8FZcXPwwPEivRUHEyGssIv1a8ijwGCBQWRummwbTz5BrjuD3NSCBPMwHqnuyocG6WJIue0r+PVHdfef2Yxsa5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZIFUUTL+W1z0z0sByf/6DDcnTXJEfifjARDogEBH/E=;
 b=MUnzT/N1ojU7lhZDMxhwdwcdn0zvLCH4YPXfwjPvGHSOPjJqhobGfr1WpvrvthhArzviyjd1+iD1RCueQRYULcdHRy23g8Mk/XUAR36Xr6pWkJ4RtMWlUXnFcEVLGTN1ylw3QpAneZNuleFVX2qChAfb9YSjxZ840H6EhSZNZUE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 DS0PR12MB8365.namprd12.prod.outlook.com (2603:10b6:8:f8::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7202.32; Tue, 23 Jan 2024 00:30:15 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::5704:c345:989b:8095%7]) with mapi id 15.20.7202.031; Tue, 23 Jan 2024
 00:30:15 +0000
Content-Type: multipart/alternative;
 boundary="------------W0LzUAEXSEmzQHWbu0SA4CeO"
Message-ID: <918ddc13-1cf8-4199-b5be-5719a023de42@amd.com>
Date: Mon, 22 Jan 2024 19:29:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] BUG: kernel NULL pointer dereference at ttm_device_init+0xb4
Content-Language: en-US
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
References: <20240122180605.28daf23a@gandalf.local.home>
From: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>
In-Reply-To: <20240122180605.28daf23a@gandalf.local.home>
X-ClientProxiedBy: YQBPR01CA0166.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::28) To DS7PR12MB5933.namprd12.prod.outlook.com
 (2603:10b6:8:7c::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB5933:EE_|DS0PR12MB8365:EE_
X-MS-Office365-Filtering-Correlation-Id: 47c7cd42-0733-47dc-eddf-08dc1baa77e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4e0FwAVI3EhXDvI/23IyeMa0H4v0ScWCgqRpItoBQIzB/TGYr734o7ckLltG1qnSPs+v1PLXWHCPArIRtfaoFLCkrB2TuagfXY/3UWQBTXnY6FHTNBoxAzYO0ehOUxSGtIV7KjtNl0rz03z8RrwYAdwFUrvIM/fMVc7S9Goola6p22PjyXIqRdxCMvERC6aEBVND6DSBeBnkGJfrTbeTDfM6Ta9EQ85seSM8n2QQAkvuMbDxFGQCypa6vcbVs78Lm47Toqh7nOYqP32DefJEMlzuJwC+Z57//EbuWYF6DrwL+zBM17A/lumLd1bo9DhBEJXFvArFsfl3IkppRnylDqEIeUCiDBrfZv6r1Bk26FCQh8eDIuuQ9/VvGJ37SdqoK5PdFeBF03J5Gf+QayNba+vhA9stwsHkKYBLsCv+Y/jYQSFTkzJ0cFnmIEYPgJ2fMuporMmgeFcc4lUZ0oNVvOjpeUAsRlXVJ9D3StY2Hfaj7CgGoRysTPqQ4jBLvhGpXAx5g1wD5c5c2fDbSKTr2EIJiZGsB66VJVuwwWNF0nUg9FCausm+oKj5N01T4lME0VE7xH62U1LbNVDMiAPIvPxvziWRcqPJTHFwHEsez3wxiqWV1vWfJ3zv85iO/5HzD1PLWpbC6KZIDLebPXeBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(366004)(376002)(396003)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(6506007)(53546011)(33964004)(110136005)(6666004)(45080400002)(66476007)(8936002)(66556008)(66946007)(8676002)(316002)(478600001)(6512007)(54906003)(6486002)(2616005)(26005)(83380400001)(2906002)(4326008)(41300700001)(5660300002)(36756003)(38100700002)(86362001)(31696002)(31686004)(43740500002)(45980500001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q21rankzeVV2T25lblFGS3NFbjZ0OGxBQU5YL2daaU1Ycmw3WXo3NC9qR3cw?=
 =?utf-8?B?ZzFnbzFDc3c4dGVkZlRVNk95NFIrc1p5ZVpydGM0cDJ2T1hSQzNaa3VPeDVJ?=
 =?utf-8?B?TE1KdVY4Zk1jVEdvMDZGZlF2Z3JkeFRUZ1poaDB2NkJ6WmRyU25LcmROcnMw?=
 =?utf-8?B?V2FiVG1KSWVWYmhjK2g3NVY3UGlLa0IrVnBKOVFIM3RLM0I5S0VnY1ZPT1hs?=
 =?utf-8?B?WTFHa0duY2V6dlpVZ29IeXhsVHpsbWhiWHN4bjc1ZUQzdThlVkVTZUN5Sjla?=
 =?utf-8?B?b2lDTHJxSTBZOVkxdVZEZi85OUp5OUorV25WRnRVbGc3QUVodFNqUjlsN2s0?=
 =?utf-8?B?STUwWmoxdlkyWUNLeTlqb2RMZElLWThqREMwdVRnMFhKL1IxYVh3NThhanF5?=
 =?utf-8?B?UW4xMnBhQUYrOUV5R2ZWeWFrNzhvbjdlaThhWURQeGJXSzJoTng2MVRjYUZP?=
 =?utf-8?B?TkxBV3o0T01qR3BXZ21qM212NEdhQWZESjZzSk5GVkpLTFJzOWZyRW9YMktH?=
 =?utf-8?B?WEE1dTMwV0RXNTRnb0FNemM3eXFWSUF0SWdub25XZ2NHYWY4azJOeWtIYW15?=
 =?utf-8?B?eFlTOU9Hc0cwSkQvZ24wbVdtQmg1SEgzZVVWMFpMbFdwdUVLbDNRaXc5MFpu?=
 =?utf-8?B?K2lINkEvdUozOHZGV2crbjM0L1BUOWJBY21heSs0YzdnUER2Wi9UaHlDS3NV?=
 =?utf-8?B?SWJrdmxCY3VCOC8yVmJvZHZWQytrZ0ZxbnFNNm5CUEM0WDRyQUQ2QitXeWp4?=
 =?utf-8?B?eHJpTitwS1F2aGpqRk5GZHlRSkI4WW1qYkttYkQyY2FvQnpyb1E1VEU0MzBI?=
 =?utf-8?B?VVhON2o2Mk5URUpWK0hDVXYxekgyd1JEcTRqV2lBZzNWbDVRNVNuYXlWZDJj?=
 =?utf-8?B?NW1DZXJ6cHd2MC9ZUlJWMTNZK0tBRnFiRXhhTzAvckFPeEhFRENoRmg0Vjh1?=
 =?utf-8?B?N1hRYWFlUVNvcW9nZkc0YVBHOWxLak9IM0lLUUhjVUVhbzFTV3k2bFlqdVB6?=
 =?utf-8?B?WmgwRkV3emwraVcxeEhtbXNVYXFyNElVYU5QNVpRYUU3MWtVVEluT1JMQzF4?=
 =?utf-8?B?N3M2OUVEcXBLcEpnY3ZqR0JQRHlsWG9SZUVYaHYwQjVQWGgzSWJ2a2RjQ3V1?=
 =?utf-8?B?Z1F6T3pmZU9IL3p1d0ViZzBnRUZvWGZ4SjNLNFc0cEQwQTAwVzhTeWJGcGdu?=
 =?utf-8?B?YllxWUVKMDJWM0xvQlhlb3hhcUxsNHp2bDNVVjRnUjdKYWgrdW01SEc2dzZr?=
 =?utf-8?B?bmp0VDFqVzVzbGJPMHU0QjhpTGFLSkhpU2I1V3lYVExSZjVuNUcrR3BuWkdz?=
 =?utf-8?B?c2EwTjZRUCs4WHl4VWVoRnFtTGxUV2gvTURZUjlKd2VOUjZneTdLZVFDZFZl?=
 =?utf-8?B?QjYrTnd2aklZUlpOUlppQWdESVJBem9hK1pqTmJ3L21CYngvcGt4V0FEQ2tO?=
 =?utf-8?B?a3VtS0h5MnFtMDcyUU4ydjhUTnQ0OXdVa0t6SURwRU1OdE1VUXp1azU4MGtl?=
 =?utf-8?B?SXF3Z2V6MnRPbUlpY3Rmd0ErUnp5VUlxM1cxNGU5MTRYWU1ZYWRLS0p0R1Ux?=
 =?utf-8?B?WGdIWjRhRE1FaVZCZnU0b2RWeXNEdy9WMk9FRUsySmVQbGJ6MFh6eWFxSEJK?=
 =?utf-8?B?MnBmYWRmVkMxcy9zUEQrYkQreEU5OTloYW5nT3lRMGIvNFRHMTQ3SnJ5ZUVR?=
 =?utf-8?B?dFB5Tk9JbHNYcU4zVkxBd3hyOFdUUCtFOGpETmk1aHNEcnNyaUl0TTVYamtV?=
 =?utf-8?B?Ymp0cVhoV0cvejVKL0ZuVU1iYXh4YXQ3UUJlWlJ0cHdMNVoxWmpkRy9GclA1?=
 =?utf-8?B?MVhyck1QQWJkOENlekF2ZEJIUTNUMHNtekl0U2w0dkZhSTJCUldKUTY3akd6?=
 =?utf-8?B?MS9RelE1NWxPRVAwSUdySU14Q0dsNmU1RER4SGs3N25NYVQwNEZydXE0aGln?=
 =?utf-8?B?L01meXV0NlFCSThEa1ZoUUIwOHlueXZRVS9rbEVETnoxNGxpS3VBRmJYNXgr?=
 =?utf-8?B?Y21TT3R0YmRlOU13L0p3WEt5OWhsY2xpWk5EZXVoTlVwYmh1WkFBODRxOWdx?=
 =?utf-8?B?M2lXYldNenJxdUFVdXRSbVdGaXZ2b1RPQ1RMU3lGMGJtNDRJY1paYlJ5eC9K?=
 =?utf-8?Q?MntRWmFySzy1MnWEKM5odusHJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c7cd42-0733-47dc-eddf-08dc1baa77e4
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2024 00:30:15.6489 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z86MMypxRwv85JUYr7//0BKpg15rhexmI/qsHsP4b0uX8V5PEigxFUonq3NuKmTvid9KnuOb7l9nSyL9XS5F0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8365
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
Cc: Felix Kuehling <Felix.Kuehling@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------W0LzUAEXSEmzQHWbu0SA4CeO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/22/2024 6:06 PM, Steven Rostedt wrote:
> I just kicked off testing some patches on top of 6.8-rc1 and triggered this
> immediately:
>
> [ note this happened on both my 32 bit an 64 bit test machines, this is
>    just the 32 bit output ]
>
>   BUG: kernel NULL pointer dereference, address: 00000238
>   #PF: supervisor read access in kernel mode
>   #PF: error_code(0x0000) - not-present page
>   *pdpt = 0000000000000000 *pde = f000ff53f000ff53
>   Oops: 0000 [#1] PREEMPT SMP PTI
>   CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.8.0-rc1-test-00001-g2b44760609e9-dirty #1056
>   Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
>   Workqueue: events work_for_cpu_fn
>   EIP: ttm_device_init+0xb4/0x274
>   Code: 86 10 09 00 00 83 c4 0c 85 c0 0f 84 96 01 00 00 8b 45 ac 8d 9e 94 00 00 00 89 46 08 89 f0 e8 27 05 00 00 8b 55 a8 0f b6 45 98 <8b> 8a 38 02 00 00 50 0f b6 45 9c 50 89 d8 e8 95 ee ff ff 8b 45 a0
>   EAX: 00000000 EBX: c135a7e4 ECX: c135a7b0 EDX: 00000000
>   ESI: c135a750 EDI: 0007bc1d EBP: c11d7e4c ESP: c11d7de4
>   DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
>   CR0: 80050033 CR2: 00000238 CR3: 145c4000 CR4: 000006f0
>   Call Trace:
>    ? show_regs+0x4f/0x58
>    ? __die+0x1d/0x58
>    ? page_fault_oops+0x171/0x330
>    ? lock_acquire+0xa4/0x280
>    ? kernelmode_fixup_or_oops.constprop.0+0x7c/0xcc
>    ? __bad_area_nosemaphore.constprop.0+0x124/0x1b4
>    ? __mutex_lock+0x17f/0xb00
>    ? bad_area_nosemaphore+0xf/0x14
>    ? do_user_addr_fault+0x140/0x3e4
>    ? exc_page_fault+0x5b/0x1d8
>    ? pvclock_clocksource_read_nowd+0x130/0x130
>    ? handle_exception+0x133/0x133
>    ? pvclock_clocksource_read_nowd+0x130/0x130
>    ? ttm_device_init+0xb4/0x274
>    ? pvclock_clocksource_read_nowd+0x130/0x130
>    ? ttm_device_init+0xb4/0x274
>    qxl_ttm_init+0x34/0x130
>    qxl_bo_init+0xd/0x10
>    qxl_device_init+0x52a/0x92c
>    qxl_pci_probe+0x91/0x1ac
>    local_pci_probe+0x3d/0x84
>    work_for_cpu_fn+0x16/0x20
>    process_one_work+0x1bc/0x4a0
>    worker_thread+0x310/0x3a8
>    kthread+0xea/0x110
>    ? rescuer_thread+0x2f0/0x2f0
>    ? kthread_complete_and_exit+0x1c/0x1c
>    ret_from_fork+0x34/0x4c
>    ? kthread_complete_and_exit+0x1c/0x1c
>    ret_from_fork_asm+0x12/0x18
>    entry_INT80_32+0xf0/0xf0
>   Modules linked in:
>   CR2: 0000000000000238
>   ---[ end trace 0000000000000000 ]---
>
> The crash happened here:
>
> int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
> 		    struct device *dev, struct address_space *mapping,
> 		    struct drm_vma_offset_manager *vma_manager,
> 		    bool use_dma_alloc, bool use_dma32)
> {
> 	struct ttm_global *glob = &ttm_glob;
> 	int ret;
>
> 	if (WARN_ON(vma_manager == NULL))
> 		return -EINVAL;
>
> 	ret = ttm_global_init();
> 	if (ret)
> 		return ret;
>
> 	bdev->wq = alloc_workqueue("ttm",
> 				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
> 	if (!bdev->wq) {
> 		ttm_global_release();
> 		return -ENOMEM;
> 	}
>
> 	bdev->funcs = funcs;
>
> 	ttm_sys_man_init(bdev);
>
> 	ttm_pool_init(&bdev->pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32); <<<------- BUG!
>
> Specifically, it appears that dev is NULL and dev_to_node() doesn't like
> having a NULL pointer passed to it.
>
> I currently "fixed" this with a:
>
> 	if (!dev)
> 		return -EINVAL;
>
> at the start of this function just so that I can continue running my tests,
> but that is obviously incorrect.


In one of my previous revisions of this patch when I was experimenting, 
I used something like below. Wonder if that could work in your case 
and/or in general.


diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
b/drivers/gpu/drm/ttm/ttm_device.c

index 43e27ab77f95..4c3902b94be4 100644

--- a/drivers/gpu/drm/ttm/ttm_device.c

+++ b/drivers/gpu/drm/ttm/ttm_device.c

@@ -195,6 +195,7 @@ int ttm_device_init(struct ttm_device *bdev, struct 
ttm_device_funcs *funcs,

bool use_dma_alloc, bool use_dma32){

struct ttm_global *glob = &ttm_glob;

+bool node_has_cpu = false;

int ret;

if (WARN_ON(vma_manager == NULL))

@@ -213,7 +214,12 @@ int ttm_device_init(struct ttm_device *bdev, struct 
ttm_device_funcs *funcs,

bdev->funcs = funcs;

ttm_sys_man_init(bdev);

-ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);

+

+node_has_cpu = node_state(dev->numa_node, N_CPU);

+if (node_has_cpu)

+ttm_pool_init(&bdev->pool, dev, dev->numa_node, use_dma_alloc, use_dma32);

+else

+ttm_pool_init(&bdev->pool, dev, NUMA_NO_NODE, use_dma_alloc,

+use_dma32);

bdev->vma_manager = vma_manager;

spin_lock_init(&bdev->lru_lock);


>
> -- Steve
--------------W0LzUAEXSEmzQHWbu0SA4CeO
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 1/22/2024 6:06 PM, Steven Rostedt
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240122180605.28daf23a@gandalf.local.home">
      <pre class="moz-quote-pre" wrap="">I just kicked off testing some patches on top of 6.8-rc1 and triggered this
immediately:

[ note this happened on both my 32 bit an 64 bit test machines, this is
  just the 32 bit output ]

 BUG: kernel NULL pointer dereference, address: 00000238
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 *pdpt = 0000000000000000 *pde = f000ff53f000ff53 
 Oops: 0000 [#1] PREEMPT SMP PTI
 CPU: 0 PID: 9 Comm: kworker/0:1 Not tainted 6.8.0-rc1-test-00001-g2b44760609e9-dirty #1056
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
 Workqueue: events work_for_cpu_fn
 EIP: ttm_device_init+0xb4/0x274
 Code: 86 10 09 00 00 83 c4 0c 85 c0 0f 84 96 01 00 00 8b 45 ac 8d 9e 94 00 00 00 89 46 08 89 f0 e8 27 05 00 00 8b 55 a8 0f b6 45 98 &lt;8b&gt; 8a 38 02 00 00 50 0f b6 45 9c 50 89 d8 e8 95 ee ff ff 8b 45 a0
 EAX: 00000000 EBX: c135a7e4 ECX: c135a7b0 EDX: 00000000
 ESI: c135a750 EDI: 0007bc1d EBP: c11d7e4c ESP: c11d7de4
 DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
 CR0: 80050033 CR2: 00000238 CR3: 145c4000 CR4: 000006f0
 Call Trace:
  ? show_regs+0x4f/0x58
  ? __die+0x1d/0x58
  ? page_fault_oops+0x171/0x330
  ? lock_acquire+0xa4/0x280
  ? kernelmode_fixup_or_oops.constprop.0+0x7c/0xcc
  ? __bad_area_nosemaphore.constprop.0+0x124/0x1b4
  ? __mutex_lock+0x17f/0xb00
  ? bad_area_nosemaphore+0xf/0x14
  ? do_user_addr_fault+0x140/0x3e4
  ? exc_page_fault+0x5b/0x1d8
  ? pvclock_clocksource_read_nowd+0x130/0x130
  ? handle_exception+0x133/0x133
  ? pvclock_clocksource_read_nowd+0x130/0x130
  ? ttm_device_init+0xb4/0x274
  ? pvclock_clocksource_read_nowd+0x130/0x130
  ? ttm_device_init+0xb4/0x274
  qxl_ttm_init+0x34/0x130
  qxl_bo_init+0xd/0x10
  qxl_device_init+0x52a/0x92c
  qxl_pci_probe+0x91/0x1ac
  local_pci_probe+0x3d/0x84
  work_for_cpu_fn+0x16/0x20
  process_one_work+0x1bc/0x4a0
  worker_thread+0x310/0x3a8
  kthread+0xea/0x110
  ? rescuer_thread+0x2f0/0x2f0
  ? kthread_complete_and_exit+0x1c/0x1c
  ret_from_fork+0x34/0x4c
  ? kthread_complete_and_exit+0x1c/0x1c
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
 Modules linked in:
 CR2: 0000000000000238
 ---[ end trace 0000000000000000 ]---

The crash happened here:

int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
		    struct device *dev, struct address_space *mapping,
		    struct drm_vma_offset_manager *vma_manager,
		    bool use_dma_alloc, bool use_dma32)
{
	struct ttm_global *glob = &amp;ttm_glob;
	int ret;

	if (WARN_ON(vma_manager == NULL))
		return -EINVAL;

	ret = ttm_global_init();
	if (ret)
		return ret;

	bdev-&gt;wq = alloc_workqueue(&quot;ttm&quot;,
				   WQ_MEM_RECLAIM | WQ_HIGHPRI | WQ_UNBOUND, 16);
	if (!bdev-&gt;wq) {
		ttm_global_release();
		return -ENOMEM;
	}

	bdev-&gt;funcs = funcs;

	ttm_sys_man_init(bdev);

	ttm_pool_init(&amp;bdev-&gt;pool, dev, dev_to_node(dev), use_dma_alloc, use_dma32); &lt;&lt;&lt;------- BUG!

Specifically, it appears that dev is NULL and dev_to_node() doesn't like
having a NULL pointer passed to it.

I currently &quot;fixed&quot; this with a:

	if (!dev)
		return -EINVAL;

at the start of this function just so that I can continue running my tests,
but that is obviously incorrect.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>In one of my previous revisions of this patch when I was
      experimenting, I used something like below. Wonder if that could
      work in your case and/or in general. <br>
    </p>
    <p><br>
    </p>
    <p><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ascii-font-family:Calibri;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Calibri;
	mso-hansi-theme-font:minor-latin;
	mso-bidi-font-family:"Times New Roman";
	mso-bidi-theme-font:minor-bidi;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;}
</style>
<![endif]-->
    </p>
    <p class="MsoPlainText">diff --git
      a/drivers/gpu/drm/ttm/ttm_device.c
      b/drivers/gpu/drm/ttm/ttm_device.c</p>
    <p class="MsoPlainText">index 43e27ab77f95..4c3902b94be4 100644</p>
    <p class="MsoPlainText">--- a/drivers/gpu/drm/ttm/ttm_device.c</p>
    <p class="MsoPlainText">+++ b/drivers/gpu/drm/ttm/ttm_device.c</p>
    <p class="MsoPlainText">@@ -195,6 +195,7 @@ int
      ttm_device_init(struct ttm_device
      *bdev, struct ttm_device_funcs *funcs,</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span style="mso-spacerun:yes">&nbsp;&nbsp;&nbsp; </span>bool use_dma_alloc, bool
      use_dma32)<span style="mso-spacerun:yes">&nbsp; </span>{</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>struct ttm_global
      *glob =
      &amp;ttm_glob;</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>bool
      node_has_cpu = false;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>int ret;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>if
      (WARN_ON(vma_manager == NULL))</p>
    <p class="MsoPlainText">@@ -213,7 +214,12 @@ int
      ttm_device_init(struct
      ttm_device *bdev, struct ttm_device_funcs *funcs,</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>bdev-&gt;funcs =
      funcs;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>ttm_sys_man_init(bdev);</p>
    <p class="MsoPlainText">-<span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>ttm_pool_init(&amp;bdev-&gt;pool,
      dev, NUMA_NO_NODE, use_dma_alloc, use_dma32);</p>
    <p class="MsoPlainText">+</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>node_has_cpu
      = node_state(dev-&gt;numa_node, N_CPU);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>if
      (node_has_cpu)</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>ttm_pool_init(&amp;bdev-&gt;pool,
      dev, dev-&gt;numa_node, use_dma_alloc, use_dma32);</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>else</p>
    <p class="MsoPlainText">+<span style="mso-tab-count:2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </span>ttm_pool_init(&amp;bdev-&gt;pool,
      dev, NUMA_NO_NODE, use_dma_alloc, </p>
    <p class="MsoPlainText">+use_dma32);</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span></p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>bdev-&gt;vma_manager
      =
      vma_manager;</p>
    <p class="MsoPlainText"><span style="mso-spacerun:yes">&nbsp;</span><span style="mso-tab-count:1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>spin_lock_init(&amp;bdev-&gt;lru_lock);</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:20240122180605.28daf23a@gandalf.local.home">
      <pre class="moz-quote-pre" wrap="">

-- Steve
</pre>
    </blockquote>
  </body>
</html>

--------------W0LzUAEXSEmzQHWbu0SA4CeO--
