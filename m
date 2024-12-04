Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 119EF9E4F23
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941010EDD6;
	Thu,  5 Dec 2024 08:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=swemel.ru header.i=@swemel.ru header.b="QJ6BKxRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.swemel.ru (mx.swemel.ru [95.143.211.150])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB2E10E4C3
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:24:58 +0000 (UTC)
From: Andrey Kalachev <kalachev@swemel.ru>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swemel.ru; s=mail;
 t=1733325456;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TtKj3Zp/JRYeGnDcyJF4pdofxZNsir6y77bk5hjmV4E=;
 b=QJ6BKxRavX3ragvkfORBkL1vZ3HDaumpwVWxZQMYhGXejXXpI9J7CqBoq1j65KanzqUiQg
 AQoqgIX+Fyw1DEVnye8k0HhHcXjI+b6EjQ5UUsmhwGtSTCIivw28hv5cM6AOT+5Tmx9zQl
 JXhpVWP+bYv8hrnHKEmI2WNAVr7zeXY=
To: stable@vger.kernel.org
Cc: vivek.kasireddy@intel.com, kraxel@redhat.com, sumit.semwal@linaro.org,
 christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 kalachev@swemel.ru, lvc-project@linuxtesting.org
Subject: Please, fix syzbot crash: kernel BUG in filemap_unaccount_folio
Date: Wed,  4 Dec 2024 18:17:33 +0300
Message-Id: <20241204151735.141277-1-kalachev@swemel.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

Hi all.

The upstream kernels late than v6.10-rc6 has the patch:

   7d79cd784470 udmabuf: use vmf_insert_pfn and VM_PFNMAP for handling mmap

That patch stop reproducing syzbot crashes [1], [2].
The reproducer code [3] still crash longterm & stable kernel versions v5.4-v6.6.
Here the 7d79cd784470 backports below.
Patch v6.6 just cherry-picked, patch for v5.4-v6.1 has minor change described
in the patch note.

Regards,
AK

[1] https://syzkaller.appspot.com/bug?extid=3d218f7b6c5511a83a79
[2] https://syzkaller.appspot.com/bug?extid=17a207d226b8a5fb0fd9
[3] https://syzkaller.appspot.com/text?tag=ReproC&x=10c0b8c0580000

Reported-by: syzbot+3d218f7b6c5511a83a79@syzkaller.appspotmail.com
Reported-by: syzbot+17a207d226b8a5fb0fd9@syzkaller.appspotmail.com
