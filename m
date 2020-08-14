Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B32724466A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 10:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 845076E3A2;
	Fri, 14 Aug 2020 08:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E396E3A2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Aug 2020 08:23:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6Mtf82+h+DG/AzxrPFUZ5C8yPKJVhjs/EDAESdoCbBqlv1N4UvW2AxJ5l3GU/XiFWEAl+GfyTQRnmxUwnsPJFzETtyw2iSyOyADGD5mt44IsadZ4uPLZTy+4NmciW9d3LpGFSs1cJ4ll8Nzh+FkmaiG5Gq0aBTrk1WpfEg6We6sclR4v/QZL6l68pEjspPOMuiIN3bNgBnzrHzzYtgBbjS6IrMQqXwJqZkOgDyKKjPajUPhH6q0tRlz5d/gGRh1b3LPQvlBt8JpJISQCnMG/B1e5Ll+LLOXqBqJr2UWVpVKrWDEKWoknqml4U8FAJfChekKXeZoKOT4btO/7gCWyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVqek+tcpWLWmxNT2tjZrwKaxpHxJIcWdAcNTBsBRAM=;
 b=FHidzzODtSxCaMQ2ZhgXcgMWVSnuPZQhugG4Pqq9jH7UBe2ZKbvWCZInQl5yW2njVAzf+ri2h2No4deGvA1KU9oOoKiNzOkdQLghdO0AyfVN3ysVfs2B5MZxs2uQ4n/y3fWDRuRpUMozeJwEkBhFyfzICBSp3VQ/f2U6+rp8wnL5p5B6qkQHBMWKaLOM3mumZSbmJ+0JSDxhy1hFdBTjcrcGzHpFc4kQkHKiK27/TA1t6xzbTedXHwlgfXf+jRnXSdcLVdwPCvTeOayx4s5JQ2Qnj4mFsGZuQ/+YjPS+IrkVTGGrvFKhXOTU7xWOSSM70/z0LS60Wuz4+eNyjqNASQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVqek+tcpWLWmxNT2tjZrwKaxpHxJIcWdAcNTBsBRAM=;
 b=JRy5m+qTqHi7QhHyQC/7CYpGSjpoM0jXhKIHOMfQEqUMK5gQf8rgl7s1OB6EW+lcrl0oYFkaqFtcmPZ2iFOjsjr2+hkfnW1uEEYvz+/New4gxvtAIJJYvAXOBZx1muOEh3cwND5sQxMYTysFvRiwChsNhFRmCAeQuiuxRhmkplc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4112.namprd12.prod.outlook.com (2603:10b6:208:19a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Fri, 14 Aug
 2020 08:23:54 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3283.015; Fri, 14 Aug 2020
 08:23:54 +0000
Subject: Re: [BUG] drm/ttm: Warning during suspend/freeze
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <87zh6x3b16.fsf@nanos.tec.linutronix.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <7a8edb0a-350e-b19a-aabb-ec66922313c0@amd.com>
Date: Fri, 14 Aug 2020 10:23:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <87zh6x3b16.fsf@nanos.tec.linutronix.de>
Content-Language: en-US
X-ClientProxiedBy: AM0PR04CA0096.eurprd04.prod.outlook.com
 (2603:10a6:208:be::37) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR04CA0096.eurprd04.prod.outlook.com (2603:10a6:208:be::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3283.16 via Frontend Transport; Fri, 14 Aug 2020 08:23:51 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 740b692f-aa74-4bf3-063e-08d8402b6187
X-MS-TrafficTypeDiagnostic: MN2PR12MB4112:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4112FA55497CA0C9BE6E3CD683400@MN2PR12MB4112.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YJW14Iuz9QjfMfv5MBOrKAaPmIPZhAo3jc5LfQhbK87hxP5Fyi2PrML5tEFZoC8ccLffTK1Pysu8wOhFqVxeXDriSuWrSF5iy9CIPEzvBB7RI1q9XOgeGTmo3t2rmgS9ZLos9P0x+7v+QtB82otgZ5wkGsHnZ+Uikxjin4CY19e37kSe/5wcbKqhgxwZrk//J1K6KbB0NVtfLrei4DL/RQmow0+hpE2+mugXMI+Br+11bRLLuN/OHdgw0TUTQC/EeKyRtBgM9Rtm5x2cNfRVEbJe71yFXyHNsy9WR7Iz8bA7jW96jlnkfsgu9IA+VypZGk6pET4B91PmiNBFZDJa3ptFUTzFiMbNuc5nbWilELDF4X7H+/mJq0oamWKpPj1i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(396003)(346002)(39860400002)(4326008)(31686004)(86362001)(6666004)(54906003)(31696002)(52116002)(15650500001)(66556008)(66476007)(5660300002)(316002)(2906002)(2616005)(8676002)(66946007)(36756003)(6486002)(16526019)(186003)(8936002)(83380400001)(45080400002)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: fVAsVvEBv8XC1ac8O6imN7w3RiFfIwdx5S1cwlV4LXye4yWdNdsTik1I+bduhQTbEwfxOle2Ev6Hk8ugexFyAsog8sMAUpQ2BFyfq98I27GfmaAwzkkEDNEQgepRwd9VHrjks0mycsd35zG8Z+b/dHDKQdBRna9VXUFTI/06741XLedhare1keSWhlkq7TJUqc4JMbyKv3uAVJ+GrShA75sqG/KKL6Le9vZ59qGoopQNwx5wO3pLWorZUdDEhaj8b4ZWwlsur/W8FpYINU+GeK+m27XCko/rDqmaJFLG5j2+JwWMj1SfIY1ZgwDMU0AiHoZiVHJ+dfhx1pU5X62Pb+aVSR5xsXZ2XEiV7Zd8cmASC3004T85r43xV2dFCWg501D2InpuAVmBDfSGRN2W3HdtNFGs8hOEiFInBTuT9DK7mSZegtYh2RX57E3OkKg2Q7iUzJk28doSxlonC5CnhGLzeHRt7Pj8964+myOgiw6FI7xC+7KzC/SgAjqq22y94s3bPylZgo/dFYDr9rOxWAhlXzDagOa2PAhjn90YyawuytuG01LAFQFR0MeECB5lfMohaGZXPWTBwKDaLQAy+Uj0R+jhZcrjqThbyTjE2h0n1yLblIHniJLH34ZYmAkcwSm9PHQS9zjF/YH83Wkce1OjDomLvKJEmysrcfpB6pzRDWwGR0wN+tZ63kvjGcBLaC6llUJ3SggKshmc84g2XQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740b692f-aa74-4bf3-063e-08d8402b6187
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2020 08:23:53.9743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFYh0nQF7ELjsD6Cijzk6mo4ZeMEl5uuGyWc635D044tiRMPuKIJk9bY8eNwK448
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4112
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

well I added a new assertion to catch cases when a driver tries to kmap 
a BO without grabbing the lock.

Looks like QXL is doing exactly that here.

Regards,
Christian.

Am 14.08.20 um 10:08 schrieb Thomas Gleixner:
> Suspending or freezing a KVM guest triggers the following warning
> reliably on current mainline:
>
> [56691.550343] printk: Suspending console(s) (use no_console_suspend to debug)
> [56691.578735] WARNING: CPU: 37 PID: 462 at drivers/gpu/drm/ttm/ttm_tt.c:51 ttm_tt_create+0xb6/0xe0 [ttm]
> [56692.795234] Modules linked in: snd_hda_codec_generic(E) qxl(E) drm_ttm_helper(E) ttm(E) snd_hda_intel(E) snd_intel_dspcfg(E) snd_hda_codec(E) drm_kms_helper(E) snd_hwdep(E) snd_hda_core(E) cec(E) snd_pcm(E) snd_timer(E) drm(E) joydev
> (E) snd(E) pcspkr(E) sg(E) evdev(E) virtio_balloon(E) serio_raw(E) virtio_console(E) soundcore(E) button(E) virtio_rng(E) rng_core(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_generic(E) usbhid(E) hid(E) virtio_net(E) net_failover(E) failover(E) uhci_hcd(E) virtio_blk(E) sr_mod(E) cdrom(E) ata_generic(E) ehci_pci(E) ata_piix(E) ehci_hcd(E) libata(E) virtio_pci(E) usbcore(E) psmouse(E) virtio_ring(E) scsi_mod(E) i2c_piix4(E) virtio(E) floppy(E)
> [56691.578781] CPU: 37 PID: 462 Comm: kworker/37:1 Tainted: G            E     5.8.0+ #8217
> [56691.578784] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> [56692.795348] Workqueue: events drm_fb_helper_dirty_work [drm_kms_helper]
> [56691.578872] RIP: 0010:ttm_tt_create+0xb6/0xe0 [ttm]
> [56691.578903] Call Trace:
> [56691.578912]  ttm_bo_kmap+0x13c/0x260 [ttm]
> [56691.578942]  qxl_bo_kmap+0x40/0x70 [qxl]
> [56691.578947]  qxl_gem_prime_vmap+0x21/0x50 [qxl]
> [56691.579060]  drm_gem_vmap+0x1f/0x50 [drm]
> [56691.579073]  drm_client_buffer_vmap+0x1c/0x30 [drm]
> [56691.579083]  drm_fb_helper_dirty_work+0xb2/0x1c0 [drm_kms_helper]
> [56691.579091]  process_one_work+0x246/0x580
> [56691.579099]  ? process_one_work+0x580/0x580
> [56691.579101]  worker_thread+0x30/0x370
> [56691.579104]  ? process_one_work+0x580/0x580
> [56691.579107]  kthread+0x12a/0x140
> [56691.579110]  ? kthread_park+0x80/0x80
> [56691.579118]  ret_from_fork+0x22/0x30
>
> Have not had time to figure out whether this is a regression or an older
> issue. If you need further info please let me know.
>
> Thanks,
>
>          tglx

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
