Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F53D69B90F
	for <lists+dri-devel@lfdr.de>; Sat, 18 Feb 2023 10:21:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B36810E03B;
	Sat, 18 Feb 2023 09:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D4C10E035
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Feb 2023 06:44:13 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-171ae29decdso78356fac.1
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 22:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=NB3pQSuONgFS77gcKDututtFmRG8oCAgBcmXE6iuXOA=;
 b=HpTbn7Qq0SVKsT7dpwgP4HxMWkfAWzkhjJpWy5/wJ0wQmoGTHfD5DMfQQC4wpwMSYs
 Ap1QQE6r/BWHvUW6gKVLxadnI1BuoRbjs6yV3NTNrLrsoH8y2lg5COChTJbYaP/YWwzq
 oxFZSyVpjz1qjjW1GtYOKT4hYm7TGZJEgy+3ROYIjWnjvNCHxP0KpDA1tF3pIp5+sW8N
 oy5Yh5ExgN9NEypds6h1bLmG5UtXY82ccne2p/DV6KJJ3nF6TQ2zCERK35pIMUlsaNjY
 KK6Rbsmi6xx3xan7GttWrlgvK6B570SIF/NWQn1uYMyl/4R/l44MpzU+gDN5vXWlEEDZ
 soGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NB3pQSuONgFS77gcKDututtFmRG8oCAgBcmXE6iuXOA=;
 b=vcP/o3VG2rdeKLCLcfxEx2lux40XAU9ktfvsdF8S5f2S9Boa7TzzCi/kMTVOluwlNM
 acMsu7gdaKpVuAJUZKz2EaZT/VHW/A0et2I9FGCVFXn7ivaB7PS/X+FKdVf2u67MA7FC
 qCq0UzscmOcxW5H2gVwe+28ZZCYP3iHHEQgk8GWsD2hQfn+RnvSUeNzLyQ6E99OyLAhb
 TEzjuR0QNN6ZXYI+TfBGoLqgz1E+XRRCTK46Y/NGwQwPINmAiVekcRbvXV81A5VP3rtJ
 Kdun9W9s24qs2xZykPmbq26d75fmgSIgpE+nItqL4EK8wsKMDYWhhyXzgPZtRo/Nz1PF
 ikog==
X-Gm-Message-State: AO0yUKVGNTSPpJ4+TYhH9H+HL2bOMrwPkMZFEn/k5Po6jPoMu7aDw8dH
 0XdXSLuUG2OENsoIrBrAw0HK2E4T4Y72SZste1g=
X-Google-Smtp-Source: AK7set+rXUmLvo/fIjtDr4aASGB6EwCQSP/Mg4pq1MxcG77V/rxm3QtqpvxR1QeT/HCEgDdUL5xzrTcgbwnHJSDDfAg=
X-Received: by 2002:a05:6870:fba9:b0:16e:7da2:1a03 with SMTP id
 kv41-20020a056870fba900b0016e7da21a03mr773728oab.90.1676702652427; Fri, 17
 Feb 2023 22:44:12 -0800 (PST)
MIME-Version: 1.0
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Fri, 17 Feb 2023 22:44:01 -0800
Message-ID: <CANX2M5azXhxrSV2YfrDVfZb7w26ugygC61vfUbBxxVHOgNOwFg@mail.gmail.com>
Subject: KMSAN: uninit-value in __dma_map_sg_attrs
To: hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com, 
 sumit.semwal@linaro.org, christian.koenig@amd.com, iommu@lists.linux.dev, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000fe2c9305f4f3c184"
X-Mailman-Approved-At: Sat, 18 Feb 2023 09:20:53 +0000
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
Cc: Marius Fleischer <fleischermarius@googlemail.com>,
 syzkaller <syzkaller@googlegroups.com>,
 Priyanka Bose <its.priyanka.bose@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--000000000000fe2c9305f4f3c184
Content-Type: text/plain; charset="UTF-8"

Hi,

We would like to report the following bug which has been found by our
modified version of syzkaller.

======================================================
description: KMSAN: uninit-value in __dma_map_sg_attrs
affected file: kernel/dma/mapping.c
kernel version: 6.2.0-rc5
kernel commit: 41c66f47061608dc1fd493eebce198f0e74cc2d7
git tree: kmsan
kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=a9a22da1efde3af6
crash reproducer: attached
======================================================
Crash log:
======================================================
BUG: KMSAN: uninit-value in __dma_map_sg_attrs+0x1f3/0x2e0
kernel/dma/mapping.c:200
 __dma_map_sg_attrs+0x1f3/0x2e0 kernel/dma/mapping.c:200
 dma_map_sg_attrs+0x4a/0x60 kernel/dma/mapping.c:232
 ata_sg_setup drivers/ata/libata-core.c:4544 [inline]
 ata_qc_issue+0x958/0x1480 drivers/ata/libata-core.c:4845
 ata_scsi_translate drivers/ata/libata-scsi.c:1745 [inline]
 __ata_scsi_queuecmd+0x161c/0x16c0 drivers/ata/libata-scsi.c:4023
 ata_scsi_queuecmd+0x86d/0x970 drivers/ata/libata-scsi.c:4068
 scsi_dispatch_cmd drivers/scsi/scsi_lib.c:1517 [inline]
 scsi_queue_rq+0x478f/0x55c0 drivers/scsi/scsi_lib.c:1758
 blk_mq_dispatch_rq_list+0x13e9/0x40f0 block/blk-mq.c:2056
 __blk_mq_do_dispatch_sched block/blk-mq-sched.c:173 [inline]
 blk_mq_do_dispatch_sched+0xd97/0x1630 block/blk-mq-sched.c:187
 __blk_mq_sched_dispatch_requests+0x495/0x620
 blk_mq_sched_dispatch_requests+0x146/0x2b0 block/blk-mq-sched.c:339
 __blk_mq_run_hw_queue+0xf7/0x310 block/blk-mq.c:2174
 __blk_mq_delay_run_hw_queue+0x13c/0x6b0 block/blk-mq.c:2250
 blk_mq_run_hw_queue+0x527/0x850 block/blk-mq.c:2298
 blk_mq_sched_insert_requests+0x50f/0x7d0 block/blk-mq-sched.c:493
 blk_mq_dispatch_plug_list block/blk-mq.c:2758 [inline]
 blk_mq_flush_plug_list+0x752/0x1300 block/blk-mq.c:2800
 __blk_flush_plug+0x600/0x680 block/blk-core.c:1137
 blk_finish_plug+0x71/0x90 block/blk-core.c:1161
 ext4_do_writepages+0x5c84/0x6e40 fs/ext4/inode.c:2928
 ext4_writepages+0x2bc/0x660 fs/ext4/inode.c:2965
 do_writepages+0x475/0x930 mm/page-writeback.c:2581
 filemap_fdatawrite_wbc+0x1c4/0x260 mm/filemap.c:388
 __filemap_fdatawrite_range mm/filemap.c:421 [inline]
 file_write_and_wait_range+0x22f/0x410 mm/filemap.c:777
 ext4_sync_file+0x1ef/0x15b0 fs/ext4/fsync.c:151
 vfs_fsync_range+0x1ee/0x240 fs/sync.c:188
 generic_write_sync include/linux/fs.h:2885 [inline]
 ext4_buffered_write_iter+0xaa3/0xb90 fs/ext4/file.c:292
 ext4_file_write_iter+0xc9c/0x3350
 do_iter_write+0x645/0x12e0 fs/read_write.c:861
 vfs_writev+0x307/0x750 fs/read_write.c:934
 do_pwritev fs/read_write.c:1031 [inline]
 __do_sys_pwritev2 fs/read_write.c:1090 [inline]
 __se_sys_pwritev2+0x275/0x480 fs/read_write.c:1081
 __x64_sys_pwritev2+0xe0/0x140 fs/read_write.c:1081
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Uninit was created at:
 __alloc_pages+0x767/0xee0 mm/page_alloc.c:5572
 alloc_pages+0xa9a/0xd90 mm/mempolicy.c:2286
 folio_alloc+0x41/0x100 mm/mempolicy.c:2296
 filemap_alloc_folio+0xa5/0x450 mm/filemap.c:972
 __filemap_get_folio+0xe7c/0x1960 mm/filemap.c:1966
 pagecache_get_page+0x46/0x270 mm/folio-compat.c:98
 grab_cache_page_write_begin+0x51/0x70 mm/folio-compat.c:110
 ext4_write_begin+0x3d8/0x31d0 fs/ext4/inode.c:1194
 ext4_da_write_begin+0x5f4/0x11c0 fs/ext4/inode.c:3058
 generic_perform_write+0x376/0xc50 mm/filemap.c:3772
 ext4_buffered_write_iter+0x583/0xb90 fs/ext4/file.c:285
 ext4_file_write_iter+0xc9c/0x3350
 do_iter_write+0x645/0x12e0 fs/read_write.c:861
 vfs_writev+0x307/0x750 fs/read_write.c:934
 do_pwritev fs/read_write.c:1031 [inline]
 __do_sys_pwritev2 fs/read_write.c:1090 [inline]
 __se_sys_pwritev2+0x275/0x480 fs/read_write.c:1081
 __x64_sys_pwritev2+0xe0/0x140 fs/read_write.c:1081
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x3d/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Bytes 0-1279 of 4096 are uninitialized
Memory access of size 4096 starts at ffff8880324c6000

CPU: 0 PID: 24178 Comm: syz-executor.4 Not tainted
6.2.0-rc5-00010-g41c66f470616 #8
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.13.0-1ubuntu1.1 04/01/2014

-- 
Thanks and Regards,

Dipanjan

--000000000000fe2c9305f4f3c184
Content-Type: application/octet-stream; name="repro.syz"
Content-Disposition: attachment; filename="repro.syz"
Content-Transfer-Encoding: base64
Content-ID: <f_le9ldcfr1>
X-Attachment-Id: f_le9ldcfr1

cjAgPSBjcmVhdCgmKDB4N2YwMDAwMDAwMDAwKT0nLi9maWxlMFx4MDAnLCAweDApCmlvY3RsJEZT
X0lPQ19SRVNWU1AocjAsIDB4NDAzMDU4MjgsICYoMHg3ZjAwMDAwMDAwODApPXsweDAsIDB4MCwg
MHgwLCAweDh9KQpwd3JpdGV2MihyMCwgJigweDdmMDAwMDAwMTU0MCk9W3smKDB4N2YwMDAwMDAw
MGMwKT0iOGFjYTRkMjgwYzg5OGVkOWE4OTcxMTA3ZTkyYmM2M2NiNjljOTAwZDJkMjBjODA1NDU2
NWEyOWU4M2IwMWJhNTBmNWJkZGFiOWIxMTg1YzQxYjg4Yjg0MGUxMDI1MDlmOTY0MmE4MWZiNGE1
NDU0NTQ4Yjk1ODA2MzVlMDEzZDI5MmI0YzE3OGMzMWEwMDRkZDA2OGVkYTIyMDA0MTQzMDgxMDA4
ZTdhOGVjMGJkZjk1NzIzMWQ2MzE0NWIxNGI4NzllNDJmNjNhZDc1ZDNjMDlmNzIiLCAweDZhfSwg
ezB4MH0sIHsweDB9LCB7MHgwfSwgezB4MH1dLCAweDUsIDB4NTAyLCAweDksIDB4MikKcjEgPSBj
cmVhdCgmKDB4N2YwMDAwMDAwMDAwKT0nLi9maWxlMFx4MDAnLCAweDApCmlvY3RsJEZTX0lPQ19S
RVNWU1AocjEsIDB4NDAzMDU4MjgsICYoMHg3ZjAwMDAwMDAwODApPXsweDAsIDB4MiwgMHgwLCAw
eDFmZmUwMDAwMH0pCg==
--000000000000fe2c9305f4f3c184
Content-Type: text/x-csrc; charset="US-ASCII"; name="repro.c"
Content-Disposition: attachment; filename="repro.c"
Content-Transfer-Encoding: base64
Content-ID: <f_le9ldcff0>
X-Attachment-Id: f_le9ldcff0

Ly8gYXV0b2dlbmVyYXRlZCBieSBzeXprYWxsZXIgKGh0dHBzOi8vZ2l0aHViLmNvbS9nb29nbGUv
c3l6a2FsbGVyKQoKI2RlZmluZSBfR05VX1NPVVJDRSAKCiNpbmNsdWRlIDxkaXJlbnQuaD4KI2lu
Y2x1ZGUgPGVuZGlhbi5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPGZjbnRsLmg+CiNp
bmNsdWRlIDxzaWduYWwuaD4KI2luY2x1ZGUgPHN0ZGFyZy5oPgojaW5jbHVkZSA8c3RkYm9vbC5o
PgojaW5jbHVkZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDxzdGRpby5oPgojaW5jbHVkZSA8c3RkbGli
Lmg+CiNpbmNsdWRlIDxzdHJpbmcuaD4KI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgojaW5jbHVkZSA8
c3lzL21vdW50Lmg+CiNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KI2luY2x1ZGUgPHN5cy9zdGF0Lmg+
CiNpbmNsdWRlIDxzeXMvc3lzY2FsbC5oPgojaW5jbHVkZSA8c3lzL3R5cGVzLmg+CiNpbmNsdWRl
IDxzeXMvd2FpdC5oPgojaW5jbHVkZSA8dGltZS5oPgojaW5jbHVkZSA8dW5pc3RkLmg+CgojaWZu
ZGVmIF9fTlJfcHdyaXRldjIKI2RlZmluZSBfX05SX3B3cml0ZXYyIDMyOAojZW5kaWYKCnN0YXRp
YyB1bnNpZ25lZCBsb25nIGxvbmcgcHJvY2lkOwoKc3RhdGljIHZvaWQgc2xlZXBfbXModWludDY0
X3QgbXMpCnsKCXVzbGVlcChtcyAqIDEwMDApOwp9CgpzdGF0aWMgdWludDY0X3QgY3VycmVudF90
aW1lX21zKHZvaWQpCnsKCXN0cnVjdCB0aW1lc3BlYyB0czsKCWlmIChjbG9ja19nZXR0aW1lKENM
T0NLX01PTk9UT05JQywgJnRzKSkKCWV4aXQoMSk7CglyZXR1cm4gKHVpbnQ2NF90KXRzLnR2X3Nl
YyAqIDEwMDAgKyAodWludDY0X3QpdHMudHZfbnNlYyAvIDEwMDAwMDA7Cn0KCnN0YXRpYyB2b2lk
IHVzZV90ZW1wb3JhcnlfZGlyKHZvaWQpCnsKCWNoYXIgdG1wZGlyX3RlbXBsYXRlW10gPSAiLi9z
eXprYWxsZXIuWFhYWFhYIjsKCWNoYXIqIHRtcGRpciA9IG1rZHRlbXAodG1wZGlyX3RlbXBsYXRl
KTsKCWlmICghdG1wZGlyKQoJZXhpdCgxKTsKCWlmIChjaG1vZCh0bXBkaXIsIDA3NzcpKQoJZXhp
dCgxKTsKCWlmIChjaGRpcih0bXBkaXIpKQoJZXhpdCgxKTsKfQoKc3RhdGljIGJvb2wgd3JpdGVf
ZmlsZShjb25zdCBjaGFyKiBmaWxlLCBjb25zdCBjaGFyKiB3aGF0LCAuLi4pCnsKCWNoYXIgYnVm
WzEwMjRdOwoJdmFfbGlzdCBhcmdzOwoJdmFfc3RhcnQoYXJncywgd2hhdCk7Cgl2c25wcmludGYo
YnVmLCBzaXplb2YoYnVmKSwgd2hhdCwgYXJncyk7Cgl2YV9lbmQoYXJncyk7CglidWZbc2l6ZW9m
KGJ1ZikgLSAxXSA9IDA7CglpbnQgbGVuID0gc3RybGVuKGJ1Zik7CglpbnQgZmQgPSBvcGVuKGZp
bGUsIE9fV1JPTkxZIHwgT19DTE9FWEVDKTsKCWlmIChmZCA9PSAtMSkKCQlyZXR1cm4gZmFsc2U7
CglpZiAod3JpdGUoZmQsIGJ1ZiwgbGVuKSAhPSBsZW4pIHsKCQlpbnQgZXJyID0gZXJybm87CgkJ
Y2xvc2UoZmQpOwoJCWVycm5vID0gZXJyOwoJCXJldHVybiBmYWxzZTsKCX0KCWNsb3NlKGZkKTsK
CXJldHVybiB0cnVlOwp9CgojZGVmaW5lIEZTX0lPQ19TRVRGTEFHUyBfSU9XKCdmJywgMiwgbG9u
ZykKc3RhdGljIHZvaWQgcmVtb3ZlX2Rpcihjb25zdCBjaGFyKiBkaXIpCnsKCWludCBpdGVyID0g
MDsKCURJUiogZHAgPSAwOwpyZXRyeToKCQl3aGlsZSAodW1vdW50MihkaXIsIE1OVF9ERVRBQ0gg
fCBVTU9VTlRfTk9GT0xMT1cpID09IDApIHsKCQl9CglkcCA9IG9wZW5kaXIoZGlyKTsKCWlmIChk
cCA9PSBOVUxMKSB7CgkJaWYgKGVycm5vID09IEVNRklMRSkgewoJZXhpdCgxKTsKCQl9CglleGl0
KDEpOwoJfQoJc3RydWN0IGRpcmVudCogZXAgPSAwOwoJd2hpbGUgKChlcCA9IHJlYWRkaXIoZHAp
KSkgewoJCWlmIChzdHJjbXAoZXAtPmRfbmFtZSwgIi4iKSA9PSAwIHx8IHN0cmNtcChlcC0+ZF9u
YW1lLCAiLi4iKSA9PSAwKQoJCQljb250aW51ZTsKCQljaGFyIGZpbGVuYW1lW0ZJTEVOQU1FX01B
WF07CgkJc25wcmludGYoZmlsZW5hbWUsIHNpemVvZihmaWxlbmFtZSksICIlcy8lcyIsIGRpciwg
ZXAtPmRfbmFtZSk7CgkJCXdoaWxlICh1bW91bnQyKGZpbGVuYW1lLCBNTlRfREVUQUNIIHwgVU1P
VU5UX05PRk9MTE9XKSA9PSAwKSB7CgkJCX0KCQlzdHJ1Y3Qgc3RhdCBzdDsKCQlpZiAobHN0YXQo
ZmlsZW5hbWUsICZzdCkpCglleGl0KDEpOwoJCWlmIChTX0lTRElSKHN0LnN0X21vZGUpKSB7CgkJ
CXJlbW92ZV9kaXIoZmlsZW5hbWUpOwoJCQljb250aW51ZTsKCQl9CgkJaW50IGk7CgkJZm9yIChp
ID0gMDs7IGkrKykgewoJCQlpZiAodW5saW5rKGZpbGVuYW1lKSA9PSAwKQoJCQkJYnJlYWs7CgkJ
CWlmIChlcnJubyA9PSBFUEVSTSkgewoJCQkJaW50IGZkID0gb3BlbihmaWxlbmFtZSwgT19SRE9O
TFkpOwoJCQkJaWYgKGZkICE9IC0xKSB7CgkJCQkJbG9uZyBmbGFncyA9IDA7CgkJCQkJaWYgKGlv
Y3RsKGZkLCBGU19JT0NfU0VURkxBR1MsICZmbGFncykgPT0gMCkgewoJCQkJCX0KCQkJCQljbG9z
ZShmZCk7CgkJCQkJY29udGludWU7CgkJCQl9CgkJCX0KCQkJaWYgKGVycm5vID09IEVST0ZTKSB7
CgkJCQlicmVhazsKCQkJfQoJCQlpZiAoZXJybm8gIT0gRUJVU1kgfHwgaSA+IDEwMCkKCWV4aXQo
MSk7CgkJCQlpZiAodW1vdW50MihmaWxlbmFtZSwgTU5UX0RFVEFDSCB8IFVNT1VOVF9OT0ZPTExP
VykpCglleGl0KDEpOwoJCX0KCX0KCWNsb3NlZGlyKGRwKTsKCWZvciAoaW50IGkgPSAwOzsgaSsr
KSB7CgkJaWYgKHJtZGlyKGRpcikgPT0gMCkKCQkJYnJlYWs7CgkJaWYgKGkgPCAxMDApIHsKCQkJ
aWYgKGVycm5vID09IEVQRVJNKSB7CgkJCQlpbnQgZmQgPSBvcGVuKGRpciwgT19SRE9OTFkpOwoJ
CQkJaWYgKGZkICE9IC0xKSB7CgkJCQkJbG9uZyBmbGFncyA9IDA7CgkJCQkJaWYgKGlvY3RsKGZk
LCBGU19JT0NfU0VURkxBR1MsICZmbGFncykgPT0gMCkgewoJCQkJCX0KCQkJCQljbG9zZShmZCk7
CgkJCQkJY29udGludWU7CgkJCQl9CgkJCX0KCQkJaWYgKGVycm5vID09IEVST0ZTKSB7CgkJCQli
cmVhazsKCQkJfQoJCQlpZiAoZXJybm8gPT0gRUJVU1kpIHsKCQkJCQlpZiAodW1vdW50MihkaXIs
IE1OVF9ERVRBQ0ggfCBVTU9VTlRfTk9GT0xMT1cpKQoJZXhpdCgxKTsKCQkJCWNvbnRpbnVlOwoJ
CQl9CgkJCWlmIChlcnJubyA9PSBFTk9URU1QVFkpIHsKCQkJCWlmIChpdGVyIDwgMTAwKSB7CgkJ
CQkJaXRlcisrOwoJCQkJCWdvdG8gcmV0cnk7CgkJCQl9CgkJCX0KCQl9CglleGl0KDEpOwoJfQp9
CgpzdGF0aWMgdm9pZCBraWxsX2FuZF93YWl0KGludCBwaWQsIGludCogc3RhdHVzKQp7CglraWxs
KC1waWQsIFNJR0tJTEwpOwoJa2lsbChwaWQsIFNJR0tJTEwpOwoJZm9yIChpbnQgaSA9IDA7IGkg
PCAxMDA7IGkrKykgewoJCWlmICh3YWl0cGlkKC0xLCBzdGF0dXMsIFdOT0hBTkcgfCBfX1dBTEwp
ID09IHBpZCkKCQkJcmV0dXJuOwoJCXVzbGVlcCgxMDAwKTsKCX0KCURJUiogZGlyID0gb3BlbmRp
cigiL3N5cy9mcy9mdXNlL2Nvbm5lY3Rpb25zIik7CglpZiAoZGlyKSB7CgkJZm9yICg7OykgewoJ
CQlzdHJ1Y3QgZGlyZW50KiBlbnQgPSByZWFkZGlyKGRpcik7CgkJCWlmICghZW50KQoJCQkJYnJl
YWs7CgkJCWlmIChzdHJjbXAoZW50LT5kX25hbWUsICIuIikgPT0gMCB8fCBzdHJjbXAoZW50LT5k
X25hbWUsICIuLiIpID09IDApCgkJCQljb250aW51ZTsKCQkJY2hhciBhYm9ydFszMDBdOwoJCQlz
bnByaW50ZihhYm9ydCwgc2l6ZW9mKGFib3J0KSwgIi9zeXMvZnMvZnVzZS9jb25uZWN0aW9ucy8l
cy9hYm9ydCIsIGVudC0+ZF9uYW1lKTsKCQkJaW50IGZkID0gb3BlbihhYm9ydCwgT19XUk9OTFkp
OwoJCQlpZiAoZmQgPT0gLTEpIHsKCQkJCWNvbnRpbnVlOwoJCQl9CgkJCWlmICh3cml0ZShmZCwg
YWJvcnQsIDEpIDwgMCkgewoJCQl9CgkJCWNsb3NlKGZkKTsKCQl9CgkJY2xvc2VkaXIoZGlyKTsK
CX0gZWxzZSB7Cgl9Cgl3aGlsZSAod2FpdHBpZCgtMSwgc3RhdHVzLCBfX1dBTEwpICE9IHBpZCkg
ewoJfQp9CgpzdGF0aWMgdm9pZCBzZXR1cF90ZXN0KCkKewoJcHJjdGwoUFJfU0VUX1BERUFUSFNJ
RywgU0lHS0lMTCwgMCwgMCwgMCk7CglzZXRwZ3JwKCk7Cgl3cml0ZV9maWxlKCIvcHJvYy9zZWxm
L29vbV9zY29yZV9hZGoiLCAiMTAwMCIpOwoJaWYgKHN5bWxpbmsoIi9kZXYvYmluZGVyZnMiLCAi
Li9iaW5kZXJmcyIpKSB7Cgl9Cn0KCnN0YXRpYyB2b2lkIGV4ZWN1dGVfb25lKHZvaWQpOwoKI2Rl
ZmluZSBXQUlUX0ZMQUdTIF9fV0FMTAoKc3RhdGljIHZvaWQgbG9vcCh2b2lkKQp7CglpbnQgaXRl
ciA9IDA7Cglmb3IgKDs7IGl0ZXIrKykgewoJCWNoYXIgY3dkYnVmWzMyXTsKCQlzcHJpbnRmKGN3
ZGJ1ZiwgIi4vJWQiLCBpdGVyKTsKCQlpZiAobWtkaXIoY3dkYnVmLCAwNzc3KSkKCWV4aXQoMSk7
CgkJaW50IHBpZCA9IGZvcmsoKTsKCQlpZiAocGlkIDwgMCkKCWV4aXQoMSk7CgkJaWYgKHBpZCA9
PSAwKSB7CgkJCWlmIChjaGRpcihjd2RidWYpKQoJZXhpdCgxKTsKCQkJc2V0dXBfdGVzdCgpOwoJ
CQlleGVjdXRlX29uZSgpOwoJCQlleGl0KDApOwoJCX0KCQlpbnQgc3RhdHVzID0gMDsKCQl1aW50
NjRfdCBzdGFydCA9IGN1cnJlbnRfdGltZV9tcygpOwoJCWZvciAoOzspIHsKCQkJaWYgKHdhaXRw
aWQoLTEsICZzdGF0dXMsIFdOT0hBTkcgfCBXQUlUX0ZMQUdTKSA9PSBwaWQpCgkJCQlicmVhazsK
CQkJc2xlZXBfbXMoMSk7CgkJCWlmIChjdXJyZW50X3RpbWVfbXMoKSAtIHN0YXJ0IDwgNTAwMCkK
CQkJCWNvbnRpbnVlOwoJCQlraWxsX2FuZF93YWl0KHBpZCwgJnN0YXR1cyk7CgkJCWJyZWFrOwoJ
CX0KCQlyZW1vdmVfZGlyKGN3ZGJ1Zik7Cgl9Cn0KCnVpbnQ2NF90IHJbMl0gPSB7MHhmZmZmZmZm
ZmZmZmZmZmZmLCAweGZmZmZmZmZmZmZmZmZmZmZ9OwoKdm9pZCBleGVjdXRlX29uZSh2b2lkKQp7
CgkJaW50cHRyX3QgcmVzID0gMDsKbWVtY3B5KCh2b2lkKikweDIwMDAwMDAwLCAiLi9maWxlMFww
MDAiLCA4KTsKCXJlcyA9IHN5c2NhbGwoX19OUl9jcmVhdCwgMHgyMDAwMDAwMHVsLCAwdWwpOwoJ
aWYgKHJlcyAhPSAtMSkKCQlyWzBdID0gcmVzOwoqKHVpbnQxNl90KikweDIwMDAwMDgwID0gMDsK
Kih1aW50MTZfdCopMHgyMDAwMDA4MiA9IDA7CioodWludDY0X3QqKTB4MjAwMDAwODggPSAwOwoq
KHVpbnQ2NF90KikweDIwMDAwMDkwID0gODsKKih1aW50MzJfdCopMHgyMDAwMDA5OCA9IDA7Cioo
dWludDMyX3QqKTB4MjAwMDAwOWMgPSAwOwptZW1zZXQoKHZvaWQqKTB4MjAwMDAwYTAsIDAsIDE2
KTsKCXN5c2NhbGwoX19OUl9pb2N0bCwgclswXSwgMHg0MDMwNTgyOCwgMHgyMDAwMDA4MHVsKTsK
Kih1aW50NjRfdCopMHgyMDAwMTU0MCA9IDB4MjAwMDAwYzA7Cm1lbWNweSgodm9pZCopMHgyMDAw
MDBjMCwgIlx4OGFceGNhXHg0ZFx4MjhceDBjXHg4OVx4OGVceGQ5XHhhOFx4OTdceDExXHgwN1x4
ZTlceDJiXHhjNlx4M2NceGI2XHg5Y1x4OTBceDBkXHgyZFx4MjBceGM4XHgwNVx4NDVceDY1XHhh
Mlx4OWVceDgzXHhiMFx4MWJceGE1XHgwZlx4NWJceGRkXHhhYlx4OWJceDExXHg4NVx4YzRceDFi
XHg4OFx4YjhceDQwXHhlMVx4MDJceDUwXHg5Zlx4OTZceDQyXHhhOFx4MWZceGI0XHhhNVx4NDVc
eDQ1XHg0OFx4YjlceDU4XHgwNlx4MzVceGUwXHgxM1x4ZDJceDkyXHhiNFx4YzFceDc4XHhjM1x4
MWFceDAwXHg0ZFx4ZDBceDY4XHhlZFx4YTJceDIwXHgwNFx4MTRceDMwXHg4MVx4MDBceDhlXHg3
YVx4OGVceGMwXHhiZFx4ZjlceDU3XHgyM1x4MWRceDYzXHgxNFx4NWJceDE0XHhiOFx4NzlceGU0
XHgyZlx4NjNceGFkXHg3NVx4ZDNceGMwXHg5Zlx4NzIiLCAxMDYpOwoqKHVpbnQ2NF90KikweDIw
MDAxNTQ4ID0gMHg2YTsKKih1aW50NjRfdCopMHgyMDAwMTU1MCA9IDA7CioodWludDY0X3QqKTB4
MjAwMDE1NTggPSAwOwoqKHVpbnQ2NF90KikweDIwMDAxNTYwID0gMDsKKih1aW50NjRfdCopMHgy
MDAwMTU2OCA9IDA7CioodWludDY0X3QqKTB4MjAwMDE1NzAgPSAwOwoqKHVpbnQ2NF90KikweDIw
MDAxNTc4ID0gMDsKKih1aW50NjRfdCopMHgyMDAwMTU4MCA9IDA7CioodWludDY0X3QqKTB4MjAw
MDE1ODggPSAwOwoJc3lzY2FsbChfX05SX3B3cml0ZXYyLCByWzBdLCAweDIwMDAxNTQwdWwsIDV1
bCwgMHg1MDIsIDksIDJ1bCk7Cm1lbWNweSgodm9pZCopMHgyMDAwMDAwMCwgIi4vZmlsZTBcMDAw
IiwgOCk7CglyZXMgPSBzeXNjYWxsKF9fTlJfY3JlYXQsIDB4MjAwMDAwMDB1bCwgMHVsKTsKCWlm
IChyZXMgIT0gLTEpCgkJclsxXSA9IHJlczsKKih1aW50MTZfdCopMHgyMDAwMDA4MCA9IDA7Cioo
dWludDE2X3QqKTB4MjAwMDAwODIgPSAyOwoqKHVpbnQ2NF90KikweDIwMDAwMDg4ID0gMDsKKih1
aW50NjRfdCopMHgyMDAwMDA5MCA9IDB4MWZmZTAwMDAwOwoqKHVpbnQzMl90KikweDIwMDAwMDk4
ID0gMDsKKih1aW50MzJfdCopMHgyMDAwMDA5YyA9IDA7Cm1lbXNldCgodm9pZCopMHgyMDAwMDBh
MCwgMCwgMTYpOwoJc3lzY2FsbChfX05SX2lvY3RsLCByWzFdLCAweDQwMzA1ODI4LCAweDIwMDAw
MDgwdWwpOwoKfQppbnQgbWFpbih2b2lkKQp7CgkJc3lzY2FsbChfX05SX21tYXAsIDB4MWZmZmYw
MDB1bCwgMHgxMDAwdWwsIDB1bCwgMHgzMnVsLCAtMSwgMHVsKTsKCXN5c2NhbGwoX19OUl9tbWFw
LCAweDIwMDAwMDAwdWwsIDB4MTAwMDAwMHVsLCA3dWwsIDB4MzJ1bCwgLTEsIDB1bCk7CglzeXNj
YWxsKF9fTlJfbW1hcCwgMHgyMTAwMDAwMHVsLCAweDEwMDB1bCwgMHVsLCAweDMydWwsIC0xLCAw
dWwpOwoJZm9yIChwcm9jaWQgPSAwOyBwcm9jaWQgPCA4OyBwcm9jaWQrKykgewoJCWlmIChmb3Jr
KCkgPT0gMCkgewoJCQl1c2VfdGVtcG9yYXJ5X2RpcigpOwoJCQlsb29wKCk7CgkJfQoJfQoJc2xl
ZXAoMTAwMDAwMCk7CglyZXR1cm4gMDsKfQo=
--000000000000fe2c9305f4f3c184--
