Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB11CD3980
	for <lists+dri-devel@lfdr.de>; Sun, 21 Dec 2025 02:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820DA10E277;
	Sun, 21 Dec 2025 01:26:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.com header.i=szymonwilczek@gmx.com header.b="Zg5qoL1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFCB10E0B1
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Dec 2025 19:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.com;
 s=s31663417; t=1766258553; x=1766863353; i=szymonwilczek@gmx.com;
 bh=lD4Wc7em9XPo+1zd0feTsCmbYogGJRFtr1PP0c22ED4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Zg5qoL1Ms1+PEROIaE2sK/E8qcUs9UTa0LrxMgEUeUje7GKdDz8VcJywECtuMZ59
 F12kaXxAGrVqjkColwk8tKxoJXtRIj4QJ0K5zV+1uQO0z5XacYgaDQRiWcdU1Yt7D
 +Q+19reBoA0EslBajeNpmtQxpBqBV88EHlJBUFkzxCIW4EyyepkQ0K+DPJMvGqykL
 545FxeaFvr2MhxfBxP28hKJT8eQ3xkTPVJZEDoCdMHSJsTMnLeodDFd5ps15i1aEX
 EXk9CGcOSzoYIXW7UgETciETAlpR+wcn/eniosGPYqrx6eX1LF0AJuRJ9qK+PeOtb
 MugXaBLMWs3aScKeMw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from prometheus ([85.11.110.37]) by mail.gmx.net (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N9dwd-1w0kYP3CzN-010EKo; Sat, 20
 Dec 2025 20:22:32 +0100
From: Szymon Wilczek <szymonwilczek@gmx.com>
To: sumit.semwal@linaro.org,
	christian.koenig@amd.com
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, Szymon Wilczek <szymonwilczek@gmx.com>,
 syzbot+cd944c467e4d4bc24cf6@syzkaller.appspotmail.com
Subject: [PATCH] dma-buf: fix WARNING in dma_buf_vmap
Date: Sat, 20 Dec 2025 20:22:10 +0100
Message-ID: <20251220192210.399423-1-szymonwilczek@gmx.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:OXRF5Z3ofJ625XX975FTTkUixy8oeUxVSAJKJZ7jdb6s2p0T3y2
 7L5A3Px537qAtZcBtoYW6HlodfJtTNdzEe3HeloXPdrQwzSHK/AOf+pcaIz1rwkkb0Z+/xV
 fUdkt7XRrzDB5DMrJ4hzs6U9IZ8musywao8NedJWzHLJNjW4lMjqSWjs+A4idN+AWr5juTl
 vrgUWSNDqo3RQZYAHoq2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:JURjOrp/If0=;Ku5gq5bG9NczSCrIuQR+y7/kTs2
 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
X-Mailman-Approved-At: Sun, 21 Dec 2025 01:26:28 +0000
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

When a driver's vmap callback returns an error (e.g. -ENOMEM), dma_buf_vma=
p()
triggers a WARN_ON_ONCE(). This is incorrect as vmap operations can legiti=
mately
fail due to resource exhaustion or other transient conditions, as document=
ed.

Fix this by removing the WARN_ON_ONCE(). The error code is already correct=
ly
propagated to the caller.

Reported-by: syzbot+cd944c467e4d4bc24cf6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug\?extid\=3D4317d7108e14e5d56308
Signed-off-by: Szymon Wilczek <szymonwilczek@gmx.com>
=2D--
 drivers/dma-buf/dma-buf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index edaa9e4ee4ae..14b55f67ee1c 100644
=2D-- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -1525,7 +1525,7 @@ int dma_buf_vmap(struct dma_buf *dmabuf, struct iosy=
s_map *map)
 	BUG_ON(iosys_map_is_set(&dmabuf->vmap_ptr));
=20
 	ret =3D dmabuf->ops->vmap(dmabuf, &ptr);
-	if (WARN_ON_ONCE(ret))
+	if (ret)
 		return ret;
=20
 	dmabuf->vmap_ptr =3D ptr;
=2D-=20
2.52.0

