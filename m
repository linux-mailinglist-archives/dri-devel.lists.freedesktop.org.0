Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD42C3A95
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655E76E847;
	Wed, 25 Nov 2020 08:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2108.outbound.protection.outlook.com [40.107.243.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240086E20A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 08:33:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a73K9jtwgZI0C/dUZfVPI2vSbUWNLL6KDBR4oxa/QRxfqIGuXsGs6L4ivRv5bL2qECQAt+L3K1YW0uoHwxCDTdFJE+vXP4kEH1MlAZF+vt0+Mgn2um8o+uQv0N+fEvu0O2nnnTkVmlxN3dmD+z2H6PaMKHHoWLMyhLYVUmnbRlkg0UuLPBnO02GNwqMS+w+mMBgAohGWIMPeyI6MoPyDGNqp0a4PnEfYNfaJEaSAFMfneF8wLZiC6VfP6zYvugFbHyfaYUn9k8wWClVBvFL3wdnSbSyhXsg4h/XQvqWaQnaFHhQVpdvc58NH82+BnqUlyNzEl3HaAQ9q03wSj/xSAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEShTQjqrhLIGxf+jX/srIl9s8yR7hrS3Y1sxYIXRYE=;
 b=H/A9HjdIW0sWyyxR+h9NWINRlCSCTH4UhnxtaG9E10qHygMeOWsJHyNbbBIUhREWg9F6bLjqX/w2UqY5D9egIBhXAuhfvQ1EXD88YrkWFTvuvM29PQkEt3EJqdhRU2qSIqvP99iUOhaP4YComn/4CQfn01v3jDuefeVGHgBRnJscEVbLqKxEgbvkUkUO0axk2tg0ZgPJnbyIKNqJ7GmS91BgJ6gDI5pP6ecEyeII/AEEnIBQSQ4fiio2RtpLLNLU0EN/TKyfj+BxUh9sN9WWKEUyOWq9horMi6XL0XjkiHERwk1b1FnuvwkVCgn2btcXwDIdJSDy6q6R7AKRp+eMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microsoft.com; dmarc=pass action=none
 header.from=microsoft.com; dkim=pass header.d=microsoft.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEShTQjqrhLIGxf+jX/srIl9s8yR7hrS3Y1sxYIXRYE=;
 b=e360GJzH56uCTQZidEH85Vc7ZDQDlFvhX6YjNETFbCBjOtQnPMI6BhgmYP9r0g0gF4iChNW7r6rweVFHhUdKa9v694xxB8B0QHIf9+p2idMv06IhOoggXKkFyeygK0inTeQu65PRKMqxtutKsffLSwN+bbSW+1MJSvTV01tWR+A=
Received: from MW2PR2101MB1801.namprd21.prod.outlook.com (2603:10b6:302:5::20)
 by MW4PR21MB1860.namprd21.prod.outlook.com (2603:10b6:303:7a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.4; Tue, 24 Nov
 2020 08:33:33 +0000
Received: from MW2PR2101MB1801.namprd21.prod.outlook.com
 ([fe80::d0da:1926:ffb7:f06c]) by MW2PR2101MB1801.namprd21.prod.outlook.com
 ([fe80::d0da:1926:ffb7:f06c%8]) with mapi id 15.20.3611.017; Tue, 24 Nov 2020
 08:33:33 +0000
From: Dexuan Cui <decui@microsoft.com>
To: Boqun Feng <boqun.feng@gmail.com>, "wei.liu@kernel.org"
 <wei.liu@kernel.org>
Subject: RE: [PATCH] video: hyperv_fb: Directly use the MMIO VRAM
Thread-Topic: [PATCH] video: hyperv_fb: Directly use the MMIO VRAM
Thread-Index: AQHWwBYrh+ep75sJdUq4vnjYcMIHRqnW9RcA
Date: Tue, 24 Nov 2020 08:33:32 +0000
Message-ID: <MW2PR2101MB1801841901E659E60502EB86BFFB0@MW2PR2101MB1801.namprd21.prod.outlook.com>
References: <20201121014547.54890-1-decui@microsoft.com>
 <20201121145411.GG3025@boqun-archlinux>
In-Reply-To: <20201121145411.GG3025@boqun-archlinux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ActionId=3963a294-6577-4647-97b6-267f7e8557ab;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_ContentBits=0;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Enabled=true;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Method=Standard;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_Name=Internal;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SetDate=2020-11-24T08:20:13Z;
 MSIP_Label_f42aa342-8706-4288-bd11-ebb85995028c_SiteId=72f988bf-86f1-41af-91ab-2d7cd011db47;
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=microsoft.com;
x-originating-ip: [2601:600:a280:7f70:c577:ba58:12ff:ac91]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 256fb33f-69db-4f9a-d4d0-08d89053a10f
x-ms-traffictypediagnostic: MW4PR21MB1860:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW4PR21MB18609F106DFC21781953E56ABFFB0@MW4PR21MB1860.namprd21.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wRNnB9qEwzZYQMo4+445qOgb+8YZtZTY8EAntDRAG575DoaoTyHco+XQpKQUi2dx4xtO7O72fkjjdyhSm75D7ISsJLyG9gDMoVhHCAYUzIBRhP7Gm0bwfSBiozVTmzHMMTurVQGyYqeRM6d3roBd8nBEZLkFPZRkxsDKv83A+qXOm5c/hlY7iUyy7Ld3YZEa/hMtp4bZM4WK/Lc413KuwUuQHp79RhXWdmz5U1vE3BystZNLvZfGeZJ0P0z/LajbHFyc+P6UBoooEEygsuLZHn6bqB+ZWb9Tmhql29XeX6Uq0LyvRzNZd3/5ma9oQG4royvcfwNCez+UUoFxcO2Y+A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR2101MB1801.namprd21.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(9686003)(5660300002)(33656002)(82950400001)(8990500004)(107886003)(82960400001)(55016002)(52536014)(8936002)(8676002)(66446008)(64756008)(66556008)(66476007)(66946007)(10290500003)(6506007)(186003)(76116006)(71200400001)(83380400001)(2906002)(7696005)(54906003)(86362001)(4326008)(316002)(110136005)(478600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?6dYcbf0pA7nuEXs1woMo2A624LFu+sXJu6btquTmON2awu2D6HDsX7ouQZQZ?=
 =?us-ascii?Q?4Bys6r8tYD3+QX4bFmjSAbr0daNL9EMPBgVBXckAcQi2fcmbFh5MDIWLzBWI?=
 =?us-ascii?Q?9OsOQ9TZ4bO+vD+ihXvaV/7qedyBNkrImRLP4fmNn5kv+jCTGy1ISY/L8IEV?=
 =?us-ascii?Q?hxzIF4AUtNpwTZPkAXg3otPF5CN6NdeLncL/jzRp4WLu51TqVXY0lx579lmW?=
 =?us-ascii?Q?15TlR0AtlGFZoBaZKken5y9wpvPgTIct6d0IiVOqcbcFYTpM5hDBCI8dHyBO?=
 =?us-ascii?Q?uTiQ60kkI6Oo1GogBs0HALs+hDu4pK0XVF4bpA9adkd/pX/bn/QJgFB3Jyde?=
 =?us-ascii?Q?dnuolEDaGfR3ZP7t5dnpNxJJmOeNCNNJuR+mMSgncy4eAbaeGDDwrjiQOPor?=
 =?us-ascii?Q?auaOLFldcLf8HMTmkl0s5/XDOuqqVGbhuJrF4YzbXzD3aH9NiFfYAkiHGyWU?=
 =?us-ascii?Q?EYI15hLO6yQik58VJS7mKum2IDSPB3HKxKuYwmjpKeXqFJssu5TKT6BVEepB?=
 =?us-ascii?Q?gB+3qQsba5hR50TlSTayGOD9j6zlmDs55KATCX3Qy3D0rePCNnFTs+2cq8QY?=
 =?us-ascii?Q?bpTuF2Ujvgn9SW9kV+P4Bu/p1tJcIZPPumN8RwLuilsovndQVHyLFu/VW0ay?=
 =?us-ascii?Q?8LzPn8LrDj4rvEk4F9e/WwHiBUp4gMFuDtYm1PcsiNkuEIC+rM5Mihe2HoNh?=
 =?us-ascii?Q?P4aK1PxNrHYZrZEed5e2dcEZ9BCLhbpZiIoJ7vlVY5I0xqhxAMRg53rwzEdB?=
 =?us-ascii?Q?E2/MlPd1UYDg4muyAG1UvZ6MQa4V5uqmoHs9U8xLJ53MrCPDFM2+FmdL3ljd?=
 =?us-ascii?Q?ZGCaQ2gijhX1VGE5+UzBo0xLNRIrbnk7ErPahqMEPt59jY9wGcJhNL2nS9ch?=
 =?us-ascii?Q?LCACwQ12ZU+1Uuv6Qkd16i56W9VWwJZYjUN9OgDaX9MRXs5AlLE0I/+g+x3i?=
 =?us-ascii?Q?PZl5jD6YPiYzo1l6cIWIv0EcfV3VGfPXJvvJAS+2ktoGuF1VO5MFw5trg7TH?=
 =?us-ascii?Q?+JPYsULYdcVnDjgMQX5clYxqHAZfodrNQxO5TIZJB5FH6IE=3D?=
MIME-Version: 1.0
X-OriginatorOrg: microsoft.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR2101MB1801.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256fb33f-69db-4f9a-d4d0-08d89053a10f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2020 08:33:33.0410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72f988bf-86f1-41af-91ab-2d7cd011db47
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A19a7poQar6UyoSSd6cZnkM2kXKE3HKKdyoI3uAVCSxgMN1bh49+gqyZZCZNXqG3AiNsuSROqgivvX1BOphbEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR21MB1860
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Wei Hu <weh@microsoft.com>, KY Srinivasan <kys@microsoft.com>,
 Michael Kelley <mikelley@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wei Liu,
Please do not pick up this patch, because actually MMIO VRAM can not work
with fb_deferred_io.

Previously I didn't test Xorg -- sorry. As soon as I tested it, I got the below
warning and the Xorg program ternimated immediately:

[   28.148432] WARNING: CPU: 19 PID: 1410 at mm/vmalloc.c:383 vmalloc_to_page+0x14b/0x150
...
[   28.192959] CPU: 19 PID: 1410 Comm: Xorg Tainted: G            E     5.10.0-rc1+ #4
...
[   28.208720] RIP: 0010:vmalloc_to_page+0x14b/0x150
...
[   28.299231] Call Trace:
[   28.301428]  fb_deferred_io_fault+0x3a/0xa0
[   28.305276]  __do_fault+0x36/0x120
[   28.308276]  handle_mm_fault+0x1144/0x1950
[   28.311963]  exc_page_fault+0x290/0x510
[   28.315551]  ? asm_exc_page_fault+0x8/0x30
[   28.319186]  asm_exc_page_fault+0x1e/0x30
[   28.322969] RIP: 0033:0x7fbeda3ec2f5

The issue is that fb_deferred_io_page() requires that the PFN be backed by a
struct page, but it looks the MMIO address does not have the struct page backed.

So I have to drop this patch. 
Thanks Wei Hu and Michael for pointing this out!

FYI: drivers/video/fbdev/core/fb_defio.c:
static struct page *fb_deferred_io_page(struct fb_info *info, unsigned long offs)
{
        void *screen_base = (void __force *) info->screen_base;
        struct page *page;

        if (is_vmalloc_addr(screen_base + offs))
                page = vmalloc_to_page(screen_base + offs);
        else
                page = pfn_to_page((info->fix.smem_start + offs) >> PAGE_SHIFT);

        return page;
}

/* this is to find and return the vmalloc-ed fb pages */
static vm_fault_t fb_deferred_io_fault(struct vm_fault *vmf)
{
        unsigned long offset;
        struct page *page;
        struct fb_info *info = vmf->vma->vm_private_data;

        offset = vmf->pgoff << PAGE_SHIFT;
        if (offset >= info->fix.smem_len)
                return VM_FAULT_SIGBUS;

        page = fb_deferred_io_page(info, offset);
        if (!page)
                return VM_FAULT_SIGBUS;

Thanks,
-- Dexuan
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
