Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC01F1B97
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 17:48:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544856E27A;
	Wed,  6 Nov 2019 16:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EA76E27A
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 16:48:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id p2so1481858wro.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 08:48:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsQf+1m23+jsDxNB5IS6XnKaQp9Ng9lV2UMQAWB4LKw=;
 b=iAbFrNqv/pX4+Qx4++n/OCB+mNVO2bhx1Itdbr0PZCqI8csJW99d0+VmjON/WgB1BY
 c91d+yseX6RtJxmy5MPXNHeIqZ09ty7FfOWsSwSpb/5oJYKiTISsG6femPCW6vf1/ocy
 X4SyHCqY5CcPE3RYjfRMdmjj9YcVTYHR7yqVU/2F39iiIvA6BXi9MspSGb0VfRjubrVW
 0r+kxi/Y6k3LW7jFyHfENQjXNahOzwuHK61XXduaqGgxTkhc6oGzQYsLaYaPyjPwok7A
 6IjC0CFvPISWa8c6eVMKq9KHJrOeTmgejTxp3iY8cPe65ar/k5kr9GyearKDv7PrBJYc
 u1NA==
X-Gm-Message-State: APjAAAWC1p3wh8o9nqbpvKgSXKf2EbpK5arU3V6Wzi2zQalSxTFV21MF
 jk4ufmlQglPsnY5cFk5l8wKWgu6VvXw=
X-Google-Smtp-Source: APXvYqzGy3n/IVXtHdPDD+4tIgpqH4phKgxw3vXsnxKnjEcXZQRREIZ7Z3grAjzpRiN/nIjVtv+L4Q==
X-Received: by 2002:a5d:678f:: with SMTP id v15mr2521944wru.242.1573058881709; 
 Wed, 06 Nov 2019 08:48:01 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p4sm16694187wrx.71.2019.11.06.08.48.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 08:48:01 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: Limit to INT_MAX in create_blob ioctl
Date: Wed,  6 Nov 2019 17:47:55 +0100
Message-Id: <20191106164755.31478-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0.rc2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qsQf+1m23+jsDxNB5IS6XnKaQp9Ng9lV2UMQAWB4LKw=;
 b=TDfF3VN9GaeQ/u0sLLvRvovI5BAhrbb/MI7b7LHt4gu3mjqLxSEwVXmdM5bBA4L5tQ
 g7XAIkJ7IQJfMDsIjivw9DRrqHmIoKbtWxjFhIrjhkqMI0UtiiE0xFVyLu6hxlA53eZG
 y674F5ysqw5/BF1d6i0Fu8yX3hTWMgSLluQXM=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 syzbot+fb77e97ebf0612ee6914@syzkaller.appspotmail.com,
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 LKML <linux-kernel@vger.kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhhcmRlbmVkIHVzZXJjcHkgY29kZSBpcyB0b28gcGFyYW5vaWQgZXZlciBzaW5jZToKCmNv
bW1pdCA2YTMwYWZhOGMxZmJkZTVmMTBmOWM1ODRjMjk5MmFhM2M3ZjdhOGZlCkF1dGhvcjogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkRhdGU6ICAgV2VkIE5vdiA2IDE2OjA3OjAx
IDIwMTkgKzExMDAKCiAgICB1YWNjZXNzOiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcwoK
Q29kZSBpdHNlbGYgc2hvdWxkIGhhdmUgYmVlbiBmaW5lIGFzLWlzLgoKUmVwb3J0ZWQtYnk6IHN5
emJvdCtmYjc3ZTk3ZWJmMDYxMmVlNjkxNEBzeXprYWxsZXIuYXBwc3BvdG1haWwuY29tCkZpeGVz
OiA2YTMwYWZhOGMxZmIgKCJ1YWNjZXNzOiBkaXNhbGxvdyA+IElOVF9NQVggY29weSBzaXplcyIp
CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KQ2M6IEFsZXhhbmRlciBWaXJv
IDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgt
Zm91bmRhdGlvbi5vcmc+CkNjOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5h
dT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Ci0tCktlZXMvQW5kcmV3LAoKU2luY2UgdGhpcyBpcyAtbW0gY2FuIEkgaGF2ZSBhIHN0YWJsZSBz
aGExIG9yIHNvbWV0aGluZyBmb3IKcmVmZXJlbmNpbmc/IE9yIGRvIHlvdSB3YW50IHRvIGluY2x1
ZGUgdGhpcyBpbiB0aGUgLW1tIHBhdGNoIGJvbWIgZm9yCnRoZSBtZXJnZSB3aW5kb3c/Ci1EYW5p
ZWwKLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMgfCAyICstCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMK
aW5kZXggODkyY2U2MzZlZjcyLi42ZWUwNDgwM2MzNjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJvcGVydHkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3Byb3BlcnR5LmMK
QEAgLTU2MSw3ICs1NjEsNyBAQCBkcm1fcHJvcGVydHlfY3JlYXRlX2Jsb2Ioc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgc2l6ZV90IGxlbmd0aCwKIAlzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmJs
b2I7CiAJaW50IHJldDsKIAotCWlmICghbGVuZ3RoIHx8IGxlbmd0aCA+IFVMT05HX01BWCAtIHNp
emVvZihzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IpKQorCWlmICghbGVuZ3RoIHx8IGxlbmd0aCA+
IElOVF9NQVggLSBzaXplb2Yoc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iKSkKIAkJcmV0dXJuIEVS
Ul9QVFIoLUVJTlZBTCk7CiAKIAlibG9iID0ga3Z6YWxsb2Moc2l6ZW9mKHN0cnVjdCBkcm1fcHJv
cGVydHlfYmxvYikrbGVuZ3RoLCBHRlBfS0VSTkVMKTsKLS0gCjIuMjQuMC5yYzIKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
