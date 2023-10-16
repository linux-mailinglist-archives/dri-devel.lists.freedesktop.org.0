Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C41897CA7B6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 14:06:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1411D10E1BD;
	Mon, 16 Oct 2023 12:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672AF10E1BD
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 12:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iorwbmsaDMr6NYe3Q3nGMbKQTrtxPaV4x0nAq9c976ZDXp1foreO2xtkr3HXFa/ORuqvD3YJ6j6xi2yWjUQFukqPuo7oB0Z/Hx7UC+ucqlldLNDxF4H8eZJBxTWePmkTX4JrUSYHng+wdMP7yJtQq02wiP2CPMWdM1IdZj/Ucy0QlL1FBa+P0kVun7FjQ+Zx8ugA1bF5cyvM56Y3p3Z2eirtJtFcg8q88moIQyV7ScH5KAA6iL2f7kQk8d5LCl7ak7rkUBa/H/X8ScNic9wnPMAcxU9uTreTe0obuvPDi/iSbL7tXi01HLPYgaTi5WxjCBqZuYvLnQ/+Pnj/HU8a2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoC+QB6MSLe1po473X3M9zp/J30WrLznpU+wZG+QnJE=;
 b=dtz48ffFZVU7jbGrC/MUB/Lnup11Wg7G1WfqB5LSy22jZqQM69oWhAdq2ExwcsUYpGxLprRJYAsKe3vphxmiE19e4vbyqA8/wGtLwC+Jay18gtqUhD4/smIwNNnq7KLNb+QVXcRD1OCmIFHNCIHslwq0xnf0E9GSpUYzELKPTx3ff9o0p2+KNfBVAJmiUUfNuAL4y8IFMCaQPclsPmWpjhbPX6KvXKx70ojhoflTFPR5BPYy3MuJYwUDbi2d1lR5w6GzpaicV6Vk7E9WPOasO9j6Cfpa8I0M++G6jkAzRLzLXnxl934iJBi2dkoM7NPuiraVIbwG5vCDz+tOg/hvfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoC+QB6MSLe1po473X3M9zp/J30WrLznpU+wZG+QnJE=;
 b=2y2WMf34OSs/SGgL/KoSQQG5U/tlQK1iAMSxAIiMySl4TApjndBAO1tkAjxHCh5ll8H7wX7KlyOwwzScVT4vagkHeoQbv+Au/IuAeLNyJ4sNLdy6feRf86kWw7T/BEgt86Q+EewXzdl66HZRRFA6ZkDTcIqO2Y9/1NXiE1FBga0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6795.namprd12.prod.outlook.com (2603:10b6:510:1c6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.43; Mon, 16 Oct
 2023 12:06:19 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 12:06:18 +0000
Message-ID: <fca23e1f-b2cc-4965-b844-975ba0f2366e@amd.com>
Date: Mon, 16 Oct 2023 14:06:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] WARNING in drm_prime_fd_to_handle_ioctl
Content-Language: en-US
To: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sumit.semwal@linaro.org,
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
References: <00000000000068c7730607b903b7@google.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <00000000000068c7730607b903b7@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6795:EE_
X-MS-Office365-Filtering-Correlation-Id: a7938acd-645d-470a-8a01-08dbce404e19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6RmhHdzApoVWi1fbQR5uzw+DDIdr9Mf/1UW3CMM24ayjYGlUQy7pWGKy9O9tm5g0vvaqcsGIG04EOC6gU9gAthEQ7uyhJ03SSZyozNFKDq/biM8IUlZvSeZwFpYlzKBZ2AvJePyS01QNX+R9KkeTlcjytW2gH4eojP9uSRp+1YoHfOpWFCVZZf03zJ+LS8xnAgzGyzyUiRg1diuBU6PCl9QJgNIuAmLND20MNNmMrrw8qn5gG1lKS2oNmA7s5hZcKMJte7EjrBM+9r2YqsPICjJ8eDzgkOw1plycXOu88s/8dtON2zuABLQwygiViZAteyTXXq2gIxTg9rg1XLiXeFYD+uuFEJflSfQhGx+NEbZ1yKadHqt3D9Ef38wuGPiaZuXwfTZ1tzu+t/h1uqSwiSaNSnonnICmUaFus8pxgVakP0k7Hx5CJdUQbDe81XHTTQyxZ7NEpbctfUE+746y6QBo3xd8CgM/WtyzEkGWnsHRFrZCnJ7x7DbLhLCf+BzVZ5Ed6l83bvVK9QT4mRMoboEhQ5kbRAwGQCzvgGM5xeHIvICjIlmDnzXJy95dHih+2wDaX/MAXB8SkBEj0x7lNrUfUeDwUWdnDWSfnLn47vCbnPs44K992X60d9IXNAJZ72XTxO4A/BPWoJ3zbcirjdbuU7NngiJm6yQohRzClmjRIcosF116RQ100R5Uqc7mqVHDU5pM0y4AleyWCLaPmugoAziANeTanZZ9Rirdwjs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(396003)(39860400002)(346002)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(478600001)(966005)(38100700002)(5660300002)(6486002)(921005)(6666004)(36756003)(66946007)(66556008)(66476007)(41300700001)(8936002)(45080400002)(8676002)(316002)(7416002)(6512007)(26005)(83380400001)(31686004)(66574015)(2906002)(2616005)(86362001)(31696002)(6506007)(99710200001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SklCUStMOURuR0lJUXBZTXJPS1l1dXl3WE9JMnRnVTZuQXBzVDRZSmJiMlU1?=
 =?utf-8?B?TG9WVHMzNm5IcHdSNjAzSFFJN1pYVCs1YkZBckJtUllkOXRacTdYUGpOclZy?=
 =?utf-8?B?djl5T0V4M1dQYjNKTDZDWEU4RkR2TWxCVElTR00rNHNTbG5QdTFsQzBBZzNp?=
 =?utf-8?B?ZFE5Q3ErcW1PbDZFNXV4V3M0azlBUFJ2eTJNMWRGUWtUZ05aQlJsUmRXcVl2?=
 =?utf-8?B?em5BZGJLOExUWCtzcDZ1ci9GWjlLSnBXK0xkd3FOSmlnMHVMT1BseXNWd0ZO?=
 =?utf-8?B?RWVzcXlNRWVLWmRXZ0U3RkhIVTBQdkVkMXpHdmh3WjJPd25lUEt0R0g0ME1Q?=
 =?utf-8?B?RExaeVBIeWF2NDFsRTZkOTNqcms3ZUdwTUJUK21WdTNFc25HMUVNUVhiSXor?=
 =?utf-8?B?Q2hHU1RxZCtvbUowVTFpeHp6Z1ZsMktsM2IwakJINWhSNWc1a1NhZVcxS2Ns?=
 =?utf-8?B?SnErQnBqQjFIQ2plL2RqeXB4cDJpZzdvVVlVQkIwTFZaMTBLY3BpcVRSdllk?=
 =?utf-8?B?YU1NRXVuRkQrY0dwekgzTFlQQmRVMVRLVy9Sb0tVbG5rdmI4d2FkcHU3SnhL?=
 =?utf-8?B?YkZoS1pVRDBWcmdVRE9ZNGczNXNiQ2d6NXo5L2F2SFkyYkdiQzRONGo2c0tx?=
 =?utf-8?B?SXp2U0JTcjhFWU03d0x3aUdEb3o0SzRHM0kyN3lhV09JZS92Y3dZdmRkRmNO?=
 =?utf-8?B?bEtINk82S21kWHREQmZKenpzZnVoSjJGeUhrVjkyaHhrNTNnYUI2RE5VRkRZ?=
 =?utf-8?B?TUZZVWg1cHFLZE44R2xUdWRZUXlMZXVuc1V3Rkc0Z011YzZVQ0M1OFlwa2gr?=
 =?utf-8?B?Tlp0bHJONkNNaWliTUhSK20xZEU3c1FzRXJnWHUyNTdtbDlpMzNqWmNDWFpX?=
 =?utf-8?B?ZFA3a0NQb1dOTW9MTkpWTDIwVUFMWm50M1ZpVmVzTmtST0hla2JSc3E0bGJa?=
 =?utf-8?B?YVF0TGprM3d5TG16eHIvNFU0UkRFZkpOMjUwalNheW91dDRqQkkvQjNKUVQ2?=
 =?utf-8?B?QjNzM3pDU3k2Ky8xMDJSRzVWNnAvS1BXQU5wYnlCbENNSm83OVNhRDdhTGQ5?=
 =?utf-8?B?bkRtcTNCbm9XZVBxbFNZTlJVU0dYOHFmd2g0K3VNcU8yVC84T2V0b1RtUVM4?=
 =?utf-8?B?dFZoUkdodkVyYVZtZldmK25UMzNKRnMxaDlwRWh2YU5GM1FpcUZNcE9iYnRx?=
 =?utf-8?B?ZDFYVVRhcDRNZ01pMDZnT0hxOEFMOVA1SFVaVzZxbEppV3JUUDNLVFlZbUNF?=
 =?utf-8?B?Q2ZKdUlsUS85TzJZMUx4L3EzODUzR245WFREbVJNNTBtWjcrV09qcWk5c2hQ?=
 =?utf-8?B?cWF6dWRpTnRoZm50WlJFMEFCUmd0TDFOYnU4ekUwN0ZBVU9tWE95NU00ZFpv?=
 =?utf-8?B?NmRCSG8zSy9qdDJkbER4TmE0MitXaEk3ejlKTzFhdExNb1l3S0lGd2taWWs0?=
 =?utf-8?B?Qjdnd2FjUStMOFlZVlQvcTBPN0k4RTFFZW1qWW1raVVqWmg5d2l5dElVNUNW?=
 =?utf-8?B?eU03UFFkMERJZ1lvME5obzJGbnFubGVocmZ0UTNlWTl3T3ZFVWVjTWs5Y0hv?=
 =?utf-8?B?bkRBS0xxb1RoRU94TmZNNFgxdnJLblRXbDk4TEQ4UGZTZEkreitGeXYyUFFN?=
 =?utf-8?B?aUlXbnBQTVlrRVBScmhUdWhHaFdrYzBjbUF2QnRUZmJFN3NEMng3Ui9CbEZL?=
 =?utf-8?B?RXg4THJFS1BHUGRrRi9PMFRSWFhQU2JKVmJvbFRyZXBNaS80OTNMUlVORU5Y?=
 =?utf-8?B?UFc1dVp0ZU15WmVkN1pYMnVzY1VxdUpKaVdNeGw4UFcxUDlXR1BzNWY3L3pP?=
 =?utf-8?B?TXZFT1NTOS95OWltQk16U1IrVldlWDRpVXVkZFM3QWpSeEN5S2VxM1ZJUldJ?=
 =?utf-8?B?VUMxeWhRS3piK0R5UWdza0RXeDY1SFJsRkdDRFNtUHhGNFNjYXVueW9qdyto?=
 =?utf-8?B?MWliNmpWald3dEppSHRZWE5DMDNrblZQK2JsdnN1S2tkbmFmWkpObnhaVC9w?=
 =?utf-8?B?aW4yY05scHhWeTRXRU1YV3ROcU1qazFwS0s3Y0h5V092SWdzUlNwWUZoU1N2?=
 =?utf-8?B?OXNnVDFnbVdIUW5FbFhuZVh2YUhYcWgxZzdaWCttcVROOWpmbWRoTzRLdzhr?=
 =?utf-8?Q?56Rk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7938acd-645d-470a-8a01-08dbce404e19
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 12:06:18.7500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +190kTdCAPZDVpj0GcapNqbfRf9KcA/6u/xBBeBDbNc8c2df7vAdmPG3U9fSye1G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6795
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

Hi guys,

I think I know what's going on here. The syzbot bisect is actually not 
100% correct, the patch in question just makes the problem appear for 
the console buffer as well.

What seems to happen is that we export some BO as DMA-buf and then close 
all handles to the buffer.

The DMA-buf of the BO then gets destroyed, but the BO can be kept around 
because it is referenced by the console (for example) or used as plane 
in KMS etc....

If we then create a new GEM handle for that BO again and re-export it by 
DMA-buf we run into the warning below because the object already has 
some DMA-buf assigned to it.

Any ideas how to fix this?

Regards,
Christian.

Am 15.10.23 um 05:37 schrieb syzbot:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    1c8b86a3799f Merge tag 'xsa441-6.6-tag' of git://git.kerne..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=13005e31680000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=32d0b9b42ceb8b10
> dashboard link: https://syzkaller.appspot.com/bug?extid=0da81ccba2345eeb7f48
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c48345680000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=101b3679680000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/45e9377886e9/disk-1c8b86a3.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/9511a41a6d1e/vmlinux-1c8b86a3.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/fac07e1c3c1a/bzImage-1c8b86a3.xz
>
> The issue was bisected to:
>
> commit 85e26dd5100a182bf8448050427539c0a66ab793
> Author: Christian König <christian.koenig@amd.com>
> Date:   Thu Jan 26 09:24:26 2023 +0000
>
>      drm/client: fix circular reference counting issue
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14cf17f1680000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=16cf17f1680000
> console output: https://syzkaller.appspot.com/x/log.txt?x=12cf17f1680000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+0da81ccba2345eeb7f48@syzkaller.appspotmail.com
> Fixes: 85e26dd5100a ("drm/client: fix circular reference counting issue")
>
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5040 at drivers/gpu/drm/drm_prime.c:326 drm_gem_prime_fd_to_handle drivers/gpu/drm/drm_prime.c:326 [inline]
> WARNING: CPU: 0 PID: 5040 at drivers/gpu/drm/drm_prime.c:326 drm_prime_fd_to_handle_ioctl+0x555/0x600 drivers/gpu/drm/drm_prime.c:374
> Modules linked in:
> CPU: 0 PID: 5040 Comm: syz-executor405 Not tainted 6.6.0-rc5-syzkaller-00055-g1c8b86a3799f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/06/2023
> RIP: 0010:drm_gem_prime_fd_to_handle drivers/gpu/drm/drm_prime.c:326 [inline]
> RIP: 0010:drm_prime_fd_to_handle_ioctl+0x555/0x600 drivers/gpu/drm/drm_prime.c:374
> Code: 89 df e8 0e 9b 26 fd f0 48 ff 03 e9 7e fd ff ff e8 b0 dc d0 fc 4c 89 f7 44 89 eb e8 75 73 8b 05 e9 da fe ff ff e8 9b dc d0 fc <0f> 0b e9 5d fd ff ff e8 3f 94 26 fd e9 3a fc ff ff 48 8b 7c 24 08
> RSP: 0018:ffffc90003a5fc70 EFLAGS: 00010293
> RAX: 0000000000000000 RBX: ffff888018f14c00 RCX: 0000000000000000
> RDX: ffff88801d691dc0 RSI: ffffffff84b6ea15 RDI: ffff8881476f3928
> RBP: ffff88801fac5400 R08: 0000000000000007 R09: fffffffffffff000
> R10: ffff8881476f3800 R11: 0000000000000000 R12: ffffc90003a5fe10
> R13: ffff8881476f3800 R14: ffff88801c590c10 R15: 0000000000000000
> FS:  00005555555d6380(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000555db75f4058 CR3: 0000000072209000 CR4: 0000000000350ef0
> Call Trace:
>   <TASK>
>   drm_ioctl_kernel+0x280/0x4c0 drivers/gpu/drm/drm_ioctl.c:789
>   drm_ioctl+0x5cb/0xbf0 drivers/gpu/drm/drm_ioctl.c:892
>   vfs_ioctl fs/ioctl.c:51 [inline]
>   __do_sys_ioctl fs/ioctl.c:871 [inline]
>   __se_sys_ioctl fs/ioctl.c:857 [inline]
>   __x64_sys_ioctl+0x18f/0x210 fs/ioctl.c:857
>   do_syscall_x64 arch/x86/entry/common.c:50 [inline]
>   do_syscall_64+0x38/0xb0 arch/x86/entry/common.c:80
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7f0c8214be69
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 c1 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fff6f4156f8 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f0c8214be69
> RDX: 0000000020000000 RSI: 00000000c00c642e RDI: 0000000000000003
> RBP: 0000000000000000 R08: 00000000000000a0 R09: 00000000000000a0
> R10: 00000000000000a0 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f0c821c3820 R14: 00007fff6f415720 R15: 00007fff6f415710
>   </TASK>
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
>
> If the bug is already fixed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite bug's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the bug is a duplicate of another bug, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup

