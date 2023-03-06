Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 324CF6ABA7E
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 10:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4910E09E;
	Mon,  6 Mar 2023 09:56:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Mon, 06 Mar 2023 09:56:47 UTC
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398B10E09E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 09:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id BFA9E20137;
 Mon,  6 Mar 2023 10:49:22 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hErAdg_uF3sj; Mon,  6 Mar 2023 10:49:22 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 455092012C;
 Mon,  6 Mar 2023 10:49:22 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pZ7T7-0001Rf-1i;
 Mon, 06 Mar 2023 10:49:21 +0100
Date: Mon, 6 Mar 2023 10:49:21 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH] VT: Protect KD_FONT_OP_GET_TALL from unbound access
Message-ID: <20230306094921.tik5ewne4ft6mfpo@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>,
 keescook@chromium.org,
 syzbot+3af17071816b61e807ed@syzkaller.appspotmail.com,
 akpm@linux-foundation.org, linux-hardening@vger.kernel.org,
 linux-mm@kvack.org, syzkaller-bugs@googlegroups.com,
 Jiri Slaby <jirislaby@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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
Cc: linux-fbdev@vger.kernel.org, keescook@chromium.org,
 syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 syzbot+3af17071816b61e807ed@syzkaller.appspotmail.com,
 linux-hardening@vger.kernel.org, Sanan Hasanov <sanan.hasanov@Knights.ucf.edu>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, akpm@linux-foundation.org,
 Jiri Slaby <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In ioctl(KD_FONT_OP_GET_TALL), userland tells through op->height which
vpitch should be used to copy over the font. In con_font_get, we were
not checking that it is within the maximum height value, and thus
userland could make the vc->vc_sw->con_font_get(vc, &font, vpitch);
call possibly overflow the allocated max_font_size bytes, and the
copy_to_user(op->data, font.data, c) call possibly read out of that
allocated buffer.

By checking vpitch against max_font_height, the max_font_size buffer
will always be large enough for the vc->vc_sw->con_font_get(vc, &font,
vpitch) call (since we already prevent loading a font larger than that),
and c = (font.width+7)/8 * vpitch * font.charcount will always remain
below max_font_size.

Fixes: 24d69384bcd3 ("VT: Add KD_FONT_OP_SET/GET_TALL operations")
Reported-by: syzbot+3af17071816b61e807ed@syzkaller.appspotmail.com
Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Reviewed-by: Jiri Slaby <jirislaby@kernel.org>

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 57a5c23b51d4..3c2ea9c098f7 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4545,6 +4545,9 @@ static int con_font_get(struct vc_data *vc, struct console_font_op *op)
 	int c;
 	unsigned int vpitch = op->op == KD_FONT_OP_GET_TALL ? op->height : 32;
 
+	if (vpitch > max_font_height)
+		return -EINVAL;
+
 	if (op->data) {
 		font.data = kvmalloc(max_font_size, GFP_KERNEL);
 		if (!font.data)
