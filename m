Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7B9587F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 09:31:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399AB6E60A;
	Tue, 20 Aug 2019 07:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31CED6E5C0;
 Tue, 20 Aug 2019 03:14:25 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id w2so2441766pfi.3;
 Mon, 19 Aug 2019 20:14:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K4of2PnnHi951vdKUeK2K+sxyHzoe/hoiqAy/eVEirM=;
 b=hhOT5wK8dCRMhIqvUTqf1ob1Rb6kHKEYRRVPPNxQfU96t/u+u/87lw0tFIQzmEdEAi
 azYhci2Z9HEyOW1/PJiMvnKcBaGQ/2S8nDlrg1I6657YAKM7MtAKgc0pMxYI5PFZ53YQ
 I6CFQC0WxhkLm6wPSa96npdKgN66RU6KoCL0PwOJZ0uYW09o5dQHHgelzRFYj1KLoVJA
 RQrF/FmJ0ag+NEGAL6GucolKSL5RbkGzkjJE9gQpewp1oRf+uFRmtW8q/Ng2JhNGCmIF
 fNAHRh2YRACJ6xlrLoX+B6A+/H3x2DOI0CDmtZa9fXyl+DdN5cVeG0xFhYFSeqFYbfIk
 cm+g==
X-Gm-Message-State: APjAAAW0Tz7cuI41h7AHr5FCrzL2X8wKbJwyAGnB1i5/EDyzKHc9UKr5
 4hdiRk1OMHDHWFEKUOG/2qc=
X-Google-Smtp-Source: APXvYqz9a/3SyryqSwUMcB7DFqYmpTTlG+WpK9xSoJbY4pJWLd2w/rkmZkHdR5wOYLwXn7nrZmj2Kg==
X-Received: by 2002:a65:52c5:: with SMTP id z5mr22933012pgp.118.1566270864801; 
 Mon, 19 Aug 2019 20:14:24 -0700 (PDT)
Received: from localhost.localdomain ([175.223.16.125])
 by smtp.gmail.com with ESMTPSA id y16sm22979651pfc.36.2019.08.19.20.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 20:14:24 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
X-Google-Original-From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 David Howells <dhowells@redhat.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCHv2 2/2] i915: do not leak module ref counter
Date: Tue, 20 Aug 2019 12:13:59 +0900
Message-Id: <20190820031359.11717-2-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190820031359.11717-1-sergey.senozhatsky@gmail.com>
References: <20190820031359.11717-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 20 Aug 2019 07:30:56 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K4of2PnnHi951vdKUeK2K+sxyHzoe/hoiqAy/eVEirM=;
 b=qnvx2lkhaPKZ2PX5FAyasqmmW2NoOyz64n3FGHz179t53oPUjxZUlnwbnIk+4Dlg3D
 EzguXrsYM8ygUZVVDCwCFcdo/++fB2CYHoLBUbn3WUEqKpQhN1+UTg5OpFs1B18ai88u
 3v1SzY7sxLZQFdWWUYgFwNh3giTFWs3V9tuVqjLxgZTxsXGT5wbirhQd2czpspT5FoNL
 ibmdQmM2egXzqR1sqZU/Hu66LpSBAIosjOCr6WLfQJtNJKEMZPuz2fDM1qzHWI7nr6nU
 sT+WvHPw5Y5bSv8PuGW2oXUaxI3njyq7YSYoplv4frx38erw+my9Z7S0Lh6ELbGgpW8q
 brug==
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
Cc: linux-fsdevel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWx3YXlzIHB1dF9maWxlc3lzdGVtKCkgaW4gaTkxNV9nZW1mc19pbml0KCkuCgpTaWduZWQtb2Zm
LWJ5OiBTZXJnZXkgU2Vub3poYXRza3kgPHNlcmdleS5zZW5vemhhdHNreUBnbWFpbC5jb20+Ci0t
LQogLSB2MjogcmViYXNlZCAoaTkxNSBkb2VzIG5vdCByZW1vdW50IGdlbWZzIGFueW1vcmUpCgog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtZnMuYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKaW5k
ZXggNWU2ZThjOTFhYjM4Li4wYTM5OGUxZTQ1ZmMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2dlbS9pOTE1X2dlbWZzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtZnMuYwpAQCAtMzAsNiArMzAsNyBAQCBpbnQgaTkxNV9nZW1mc19pbml0KHN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICppOTE1KQogCSAqLwogCiAJZ2VtZnMgPSBrZXJuX21vdW50KHR5cGUp
OworCXB1dF9maWxlc3lzdGVtKHR5cGUpOwogCWlmIChJU19FUlIoZ2VtZnMpKQogCQlyZXR1cm4g
UFRSX0VSUihnZW1mcyk7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
