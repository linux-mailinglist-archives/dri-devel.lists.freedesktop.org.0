Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DF681D242
	for <lists+dri-devel@lfdr.de>; Sat, 23 Dec 2023 05:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67E610E029;
	Sat, 23 Dec 2023 04:55:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1009710E029
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Dec 2023 04:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703307318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=5SoVEASJs5tNI3P8IvtKEX7RdqCt8eLRKS+s8poE6oE=;
 b=GhdNQZsy3IbGg5s+MR9mkxxVFLb1j1xi9r5JfsTbK4E9wd2d7X+fouGa+TzjhfWAKYVI2w
 8GoZQbnAiludW7fX5uyc0feXdfpLoNL/zufazvof0Q5zt1dpfLBpuKqBKn0rc81yoL8qIH
 pFzy7juhkGiFJYYLVT/l1Rf3ZUgAi6c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675-AL-UgaBqM1-_9aRctpnXJA-1; Fri, 22 Dec 2023 23:55:14 -0500
X-MC-Unique: AL-UgaBqM1-_9aRctpnXJA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31EF5101A52A;
 Sat, 23 Dec 2023 04:55:14 +0000 (UTC)
Received: from localhost (unknown [10.72.116.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 824B240C6EB9;
 Sat, 23 Dec 2023 04:55:13 +0000 (UTC)
Date: Sat, 23 Dec 2023 12:55:10 +0800
From: Baoquan He <bhe@redhat.com>
To: airlied@redhat.com
Subject: OOM in kdump kernel caused by commit b5bad8c16b9b
Message-ID: <ZYZoLp9NVCZTchLF@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: kexec@lists.infradead.org, dakr@redhat.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi David,

Recently, Redhat CKI reported a kdump kernel bootup failure caused by
OOM. After bisect, it only happened after commit b5bad8c16b9b
("nouveau/gsp: move to 535.113.01"). Reverting the commit can avoid the
OOM, kdump kernel can boot up successfully. 

From debugging, we can see that about extra 100M memory will be costed
when commit b5bad8c16b9b applied on the hpe machine with 2G memory.
Do you know if there's room to improve that to reduce the extra memory
cost?

I have opened a fedora bug to track this OOM, and copy the bug
description here for reference in case someone may not access the bug
easily.

Bug 2253165 - kdump kernel failed to boot up because a big memory chunk is reserved
https://bugzilla.redhat.com/show_bug.cgi?id=2253165
------------------------------------------------------------
CKI reported a failure on beaker machine hp-z210-01.ml3.eng.bos.redhat.com, please see below CKI reports:
https://datawarehouse.cki-project.org/kcidb/tests/10508330

In that failure, crashkernel=256M and succeeded to reserve in 1st kernel. However, in
kdump kernel it failed to boot up when it started to run init process. I set crashkernel=320M to make kdump kernel boot up successfully and vmcore dumping succeeded too.

After adding "rd.memdebug=4 memblock=debug" to kdump kernel cmdline, it appears to have a big chunk of reserved memory in memblock of about 122M. I don't know where it comes from. I doubt firmware stole that chunk from system memory to cause the kdump kernel having oom.


[Tue Dec  5 22:32:38 2023] DMI: Hewlett-Packard HP Z210 Workstation/1587h, BIOS J51 v01.20 09/16/2011
[Tue Dec  5 22:32:38 2023] tsc: Fast TSC calibration using PIT
[Tue Dec  5 22:32:38 2023] tsc: Detected 3092.940 MHz processor
[Tue Dec  5 22:32:38 2023] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[Tue Dec  5 22:32:38 2023] e820: remove [mem 0x000a0000-0x000fffff] usable
[Tue Dec  5 22:32:38 2023] last_pfn = 0x61000 max_arch_pfn = 0x400000000
[Tue Dec  5 22:32:38 2023] MTRR map: 4 entries (3 fixed + 1 variable; max 23), built from 10 variable MTRRs
[Tue Dec  5 22:32:38 2023] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT
[Tue Dec  5 22:32:38 2023] x2apic: enabled by BIOS, switching to x2apic ops
[Tue Dec  5 22:32:38 2023] found SMP MP-table at [mem 0x000f4b80-0x000f4b8f]
[Tue Dec  5 22:32:38 2023] memblock_reserve: [0x00000000000f4b80-0x00000000000f4b8f] smp_scan_config+0xca/0x150
[Tue Dec  5 22:32:38 2023] memblock_reserve: [0x00000000000f4b90-0x00000000000f4e4b] smp_scan_config+0x13a/0x150
[Tue Dec  5 22:32:38 2023] memblock_reserve: [0x000000005f600000-0x000000005f610fff] setup_arch+0xd84/0xf10
[Tue Dec  5 22:32:38 2023] memblock_add: [0x0000000000001000-0x000000000008f7ff] e820__memblock_setup+0x73/0xb0
[Tue Dec  5 22:32:38 2023] memblock_add: [0x000000004d0e00b0-0x0000000060ff81cf] e820__memblock_setup+0x73/0xb0
[Tue Dec  5 22:32:38 2023] memblock_add: [0x0000000060ff81d0-0x0000000060ff81ff] e820__memblock_setup+0x73/0xb0
[Tue Dec  5 22:32:38 2023] memblock_add: [0x0000000060ff8200-0x0000000060ffffff] e820__memblock_setup+0x73/0xb0
[Tue Dec  5 22:32:38 2023] MEMBLOCK configuration:
[Tue Dec  5 22:32:38 2023]  memory size = 0x0000000013fae750 reserved size = 0x0000000007b7cc50
[Tue Dec  5 22:32:38 2023]  memory.cnt  = 0x2
[Tue Dec  5 22:32:38 2023]  memory[0x0] [0x0000000000001000-0x000000000008efff], 0x000000000008e000 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  memory[0x1] [0x000000004d0e1000-0x0000000060ffffff], 0x0000000013f1f000 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  reserved.cnt  = 0x5
[Tue Dec  5 22:32:38 2023]  reserved[0x0]       [0x0000000000000000-0x000000000000ffff], 0x0000000000010000 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  reserved[0x1]       [0x000000000008f400-0x00000000000fffff], 0x0000000000070c00 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  reserved[0x2]       [0x0000000057b16000-0x000000005f610fff], 0x0000000007afb000 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  reserved[0x3]       [0x0000000060ff81d0-0x0000000060ff821f], 0x0000000000000050 bytes flags: 0x0
[Tue Dec  5 22:32:38 2023]  reserved[0x4]       [0x0000000060ffe000-0x0000000060ffefff], 0x0000000000001000 bytes flags: 0x0
----------------------------------------------------

Thanks
Baoquan

