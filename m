Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC846E36B2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Apr 2023 11:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C17B10E130;
	Sun, 16 Apr 2023 09:40:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70ED10E130;
 Sun, 16 Apr 2023 09:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de; s=s29768273;
 t=1681638014; i=markus.elfring@web.de;
 bh=+NCsfkXOgfuHgoQl17J8LhHx9x3ANJMwQ5mx9xKblt0=;
 h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
 b=pzqg3t2qAM3m219l/pA9avqJGTNlIlkgDmHDFLaYF5w29VTNZ/QOZ12N7zw08tCAr
 q/9XG1SYZx1okSEYUjbNGPrDpsI10RKVN7XwyPs0xMmWMGhMM9BenohNpJWzfY8fGV
 fdYSHCpVwnIRTqj/AHA9FzjhRcHRp5ENsUpf5ga7K5cf7lJN6KApaodVE3TV2Y1aaE
 iVt6wJH93/8BFokSbwyO6GPeMmNizJ+RA3rO0i+fBHxVRZxeu1jA3lCboB6ykZcMc9
 r/+/ubID8CRdvYm0WLtVQFgiX9qQLNRP8jxG+fDGCp6NQrr8r9nIKdtgQ/mO1Y4DA0
 967tp06U3k9MQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.83]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N8n46-1qRyYK1tfq-0162Pr; Sun, 16
 Apr 2023 11:40:14 +0200
Message-ID: <bdee7e41-094a-91d1-3f6f-56df402d70b7@web.de>
Date: Sun, 16 Apr 2023 11:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: [PATCH 4/9] drm/nouveau/debugfs: Replace five seq_printf() calls by
 seq_puts() in nouveau_debugfs_pstate_get()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
To: kernel-janitors@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
In-Reply-To: <2a746461-844a-2ad6-7b52-03f13fe1b9bf@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:DOJiTspO1yVyqj5IRQ7Ck8IrgQpJ3wpqDiP4YB6SicStSNsT1Wn
 zp7gzbThX2mCd7NQP9lFztsSN3AbdrHL4LBRg4RzusLl0mqq2AYR3d88j7ApbbiVAZQyWUK
 LY2CTCL3HOldVjlLD6FREpXfB9psxEG6m/vbkd+VHWgzOPwxmgJDzVHS2+xrWwaKbxmmvZH
 Xawl5dHvP8+cF9FOr3jfA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vNiijIQRaJM=;tWbqBgSB+ngyZfoRofZ0uVvXENa
 Q8zDybNEY/Kbdtz7HRgy3rueuLGY9NaCbEDrLjc5Aa0VlPfqGWWf5V7r6u4Byl6b+QbIDdjsC
 45awXuBGjpYxOqZkq+9aqTifX/KR3uPR+Bfyctu8hXxJzjB61zIXpG0lYj8h+HGBxECJxRMbw
 UTnjLEsC2x9LaiBrmawNJ9GUhyNfFRxA4XQjKEKfKCClZ380ZdkwCxXQOYmcQkyohRhbkUnWV
 0mQh32fGIhe9R2VxLzHNW++qDVB1xqWS/MDgezikZp5Yf18ht/GHAii5mDk2ucv5KTLPtTRjV
 znGy5eBwFRRAfelcyP72FokgLm+WeWeVqlptFdCOcZfPcYnIDLqW5f/glKWfZg3sD07UPJ4jc
 shVu7LcdDbMGc4BUIrBSYOYlP8rZlz4qzuHLzd8Lws91J9ZwLLzcAW7UMuq3OsMN0qWW8Z72w
 uPVpre+Nmc6Xfnp2UPg71NNL6nmz84oVCo7o1x0CgYhoSn6WWnBGAQNRCZCSqRwNgS05gCrku
 CPCGjDobwoeHjdf5SYgfNgXu5yOU6oll5bkfJ6HYZsWB8DMq9cARlLx1sYVTxYPSEQcG4TVQa
 bw44HMYJ4ZXGFJwqfJfQPuCPB0LV23+M+I3sYIkph/J8v/V1DnHj+L8d0RmVYApLHFOnmLUfl
 DEs+GdhYvLSKjAVHhk+pdmRAZ6Sku33p3TmlUEHIhRQ1ItWw+74ROlG58nCAkwhYS7oeVWIkh
 jZLAPS1MwBv9QRLSe+TE/YYiTY9FOdno237aX5Ux4dQzyvl5eV9EVp1m/yNYnn+HI9aFYNwXI
 Lxeetawd00ykyklv2ji/zl41wEfRzE6/cri1mRCrB8j1ud5lOFqzY0pTPb1PeIu0QTe7o3ZUv
 eHdDLj1y3Czq+OS11ZBrOmbuNGN9Kre8l3hx9pfWiOwAsJuGdz++yHI30
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
Cc: LKML <linux-kernel@vger.kernel.org>, cocci@inria.fr
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Date: Sat, 15 Apr 2023 22:02:31 +0200

Five strings which did not contain a data format specification should
be put into a sequence. Thus use the corresponding function =E2=80=9Cseq_p=
uts=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/n=
ouveau/nouveau_debugfs.c
index 13c82eea8828..99d022a91afc 100644
=2D-- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -120,16 +120,16 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void =
*data)

 		if (state >=3D 0) {
 			if (info.ustate_ac =3D=3D state)
-				seq_printf(m, " AC");
+				seq_puts(m, " AC");
 			if (info.ustate_dc =3D=3D state)
-				seq_printf(m, " DC");
+				seq_puts(m, " DC");
 			if (info.pstate =3D=3D state)
-				seq_printf(m, " *");
+				seq_puts(m, " *");
 		} else {
 			if (info.ustate_ac < -1)
-				seq_printf(m, " AC");
+				seq_puts(m, " AC");
 			if (info.ustate_dc < -1)
-				seq_printf(m, " DC");
+				seq_puts(m, " DC");
 		}

 		seq_putc(m, '\n');
=2D-
2.40.0

