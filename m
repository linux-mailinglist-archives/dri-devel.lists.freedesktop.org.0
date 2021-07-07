Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A5D3BF5FE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E956E155;
	Thu,  8 Jul 2021 07:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1014 seconds by postgrey-1.36 at gabe;
 Wed, 07 Jul 2021 16:53:47 UTC
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com
 [185.176.79.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAB66E19B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jul 2021 16:53:46 +0000 (UTC)
Received: from fraeml712-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4GKlGx4Z7cz6DDcS
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 00:28:41 +0800 (CST)
Received: from fraeml714-chm.china.huawei.com (10.206.15.33) by
 fraeml712-chm.china.huawei.com (10.206.15.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 7 Jul 2021 18:36:50 +0200
Received: from fraeml714-chm.china.huawei.com ([10.206.15.33]) by
 fraeml714-chm.china.huawei.com ([10.206.15.33]) with mapi id 15.01.2176.012;
 Wed, 7 Jul 2021 18:36:49 +0200
From: Roberto Sassu <roberto.sassu@huawei.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Oops in qxl_bo_move_notify()
Thread-Topic: Oops in qxl_bo_move_notify()
Thread-Index: AddzTTJ8VdNfvPVUQaal0okXK7VbWw==
Date: Wed, 7 Jul 2021 16:36:49 +0000
Message-ID: <3c414722f5d84875a9251b3cc120a26a@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.221.98.153]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:08:27 +0000
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

Hi

I'm getting this oops (on commit a180bd1d7e16):

    [   17.711520] BUG: kernel NULL pointer dereference, address: 000000000=
0000010
    [   17.739451] RIP: 0010:qxl_bo_move_notify+0x35/0x80 [qxl]
    [   17.827345] RSP: 0018:ffffc90000457c08 EFLAGS: 00010286
    [   17.827350] RAX: 0000000000000001 RBX: 0000000000000000 RCX: dffffc0=
000000000
    [   17.827353] RDX: 0000000000000007 RSI: 0000000000000004 RDI: fffffff=
f85596feb
    [   17.827356] RBP: ffff88800e311c00 R08: 0000000000000000 R09: 0000000=
000000000
    [   17.827358] R10: ffffffff8697b243 R11: fffffbfff0d2f648 R12: 0000000=
000000000
    [   17.827361] R13: ffff88800e311e48 R14: ffff88800e311e98 R15: ffff888=
00e311e90
    [   17.827364] FS:  0000000000000000(0000) GS:ffff88805d800000(0000) kn=
lGS:0000000000000000
    [   17.861699] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [   17.861703] CR2: 0000000000000010 CR3: 000000002642c000 CR4: 0000000=
000350ee0
    [   17.861707] Call Trace:
    [   17.861712]  ttm_bo_cleanup_memtype_use+0x4d/0xb0 [ttm]
    [   17.861730]  ttm_bo_release+0x42d/0x7c0 [ttm]
    [   17.861746]  ? ttm_bo_cleanup_refs+0x127/0x420 [ttm]
    [   17.888300]  ttm_bo_delayed_delete+0x289/0x390 [ttm]
    [   17.888317]  ? ttm_bo_cleanup_refs+0x420/0x420 [ttm]
    [   17.888332]  ? lock_release+0x9c/0x5c0
    [   17.901033]  ? rcu_read_lock_held_common+0x1a/0x50
    [   17.905183]  ttm_device_delayed_workqueue+0x18/0x50 [ttm]
    [   17.909371]  process_one_work+0x537/0x9f0
    [   17.913345]  ? pwq_dec_nr_in_flight+0x160/0x160
    [   17.917297]  ? lock_acquired+0xa4/0x580
    [   17.921168]  ? worker_thread+0x169/0x600
    [   17.925034]  worker_thread+0x7a/0x600
    [   17.928657]  ? process_one_work+0x9f0/0x9f0
    [   17.932360]  kthread+0x200/0x230
    [   17.935930]  ? set_kthread_struct+0x80/0x80
    [   17.939593]  ret_from_fork+0x22/0x30
    [   17.951737] CR2: 0000000000000010
    [   17.955496] ---[ end trace e30cc21c24e81ee5 ]---

I had a look at the code, and it seems that this is caused by
trying to use bo->resource which is NULL.

bo->resource is freed by ttm_bo_cleanup_refs() ->
ttm_bo_cleanup_memtype_use() -> ttm_resource_free().

And then a notification is issued by ttm_bo_cleanup_refs() ->
ttm_bo_put() -> ttm_bo_release() ->
ttm_bo_cleanup_memtype_use(), this time with bo->release
equal to NULL.

I was thinking a proper way to fix this. Checking that
bo->release is not NULL in qxl_bo_move_notify() would
solve the issue. But maybe there is a better way, like
avoiding that ttm_bo_cleanup_memtype_use() is called
twice. Which way would be preferable?

Thanks

Roberto

HUAWEI TECHNOLOGIES Duesseldorf GmbH, HRB 56063
Managing Director: Li Peng, Li Jian, Shi Yanli
