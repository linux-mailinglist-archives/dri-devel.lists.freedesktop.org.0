Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FE122E76
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B98892A6;
	Mon, 20 May 2019 08:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2765E892A0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:42 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id n17so22608399edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=brzEwqzIIXnydSs/RGKR5pFbo4J3hD4vcbto6AdqxGk=;
 b=sF37PnFf9zw7MJsypcYqvwzEezDjztiE8+8vmGTYRwgpVQEfd3aNZIeK8hxV4i5+jG
 GnAVdBAsrMtbVhIJ5efPMVCmh8OTT9iUDGtEtle0nNbmJtNJGcGY//qSGUxs6qRnODhL
 9ZrLXjK2XxJP4Wurqz2kozqwrNxRq9gjmCJEexDfluA6Wo/d4pQslaRhWASLUm2tdgPb
 E6o9dRAGlb038CFksS4ZObhGUJ7vR7sYaMK0zrHYhID23qXjywOGczD4Ty12lUhNk9ZO
 Tg2c3GHNXQwy2sMHC0d+Dq3jkrLD2wXO2TVKt2tRcMp+n2TcUrOSZmlL1aa9I5XCVXwI
 dYkw==
X-Gm-Message-State: APjAAAWw+iP1qp0dVgfJT7BVp2PqiZb2yvTRaYZW4+5/tV8/ZrxupA27
 kiuRKXPPyPivPLz0+Br8MENflFYLs04=
X-Google-Smtp-Source: APXvYqwcYQ/FNu9mKgR5y78+1RNm9YWWN/rbv1Dyk1fxTiJfn1IMT8JiRGTvl3E3oG9ZgSkImRa3bQ==
X-Received: by 2002:a17:906:4911:: with SMTP id
 b17mr50845503ejq.3.1558340560091; 
 Mon, 20 May 2019 01:22:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:39 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/33] fbdev/atyfb: lock_fb_info can't fail
Date: Mon, 20 May 2019 10:21:58 +0200
Message-Id: <20190520082216.26273-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=brzEwqzIIXnydSs/RGKR5pFbo4J3hD4vcbto6AdqxGk=;
 b=k225G4BySl1X7q+UlZP4Nituk6duwxPLxugM6XbySvaJv68rXCwZLb3vHIHnpUiVtt
 RMs142ozoZpwli8WRmc7BaQJrVmTQEAYyzOd8QwAVlCuFVjST21Uh742TKY/EU7jI4tn
 FvVS9T4MOsKO5Bio5SHMWrXZSZUxfL3BAeT14=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Mikulas Patocka <mpatocka@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <syrjala@sci.fi>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBwcm9wZXJseSBwcm90ZWN0ZWQgYnkgcmVib290X2xvY2suCgpTaWduZWQtb2ZmLWJ5OiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWlrdWxhcyBQYXRvY2th
IDxtcGF0b2NrYUByZWRoYXQuY29tPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVtQGRhdmVt
bG9mdC5uZXQ+CkNjOiAiVmlsbGUgU3lyasOkbMOkIiA8c3lyamFsYUBzY2kuZmk+CkNjOiBCYXJ0
bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L2F0eWZiX2Jhc2UuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9hdHkv
YXR5ZmJfYmFzZS5jIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJfYmFzZS5jCmluZGV4
IGI2ZmUxMDNkZjE0NS4uZWViYjYyZDgyYTIzIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2F0eS9hdHlmYl9iYXNlLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5ZmJf
YmFzZS5jCkBAIC0zOTE2LDggKzM5MTYsNyBAQCBzdGF0aWMgaW50IGF0eWZiX3JlYm9vdF9ub3Rp
Znkoc3RydWN0IG5vdGlmaWVyX2Jsb2NrICpuYiwKIAlpZiAoIXJlYm9vdF9pbmZvKQogCQlnb3Rv
IG91dDsKIAotCWlmICghbG9ja19mYl9pbmZvKHJlYm9vdF9pbmZvKSkKLQkJZ290byBvdXQ7CisJ
bG9ja19mYl9pbmZvKHJlYm9vdF9pbmZvKTsKIAogCXBhciA9IHJlYm9vdF9pbmZvLT5wYXI7CiAK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
