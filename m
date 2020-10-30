Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 103012A023E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 11:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8D96ED98;
	Fri, 30 Oct 2020 10:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B6436ED88
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 10:08:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p22so2305187wmg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 03:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5W4UqFTJMoDRzu7XpmV7m/mIx7tbXZK4TFNNVek8jNg=;
 b=OzUM7mbx2/F/oW9bbPe7In3qrMb9VgdikqTSY/EoMsPyXGAHuRv65Nms3OB0mjtIqw
 GVQCRCl/bcb/ABRytGNQRec8qj5WedF9qpRoNXq/7Q2qAH3BZRTXvZHES4rNIMYTppYX
 ZyoeN/ZtxE8PEeZM/6gBTeLfJXnqEXHLZdrKg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5W4UqFTJMoDRzu7XpmV7m/mIx7tbXZK4TFNNVek8jNg=;
 b=TVgiGTNElHEd0Q3krvbohbTVVgng6U2JaA1KNR4ApAFrVDZ9g6t0DxfMSbdPP2YEKI
 ON7AmyJlWfIQMMvQdFcJs+zRGRmwuxJ9MCphXU3+pnrljLZ8qn4TWZq4VJhEBVRjTjb5
 9rCelgz7fb9Sdj3tAtQrRyExWpqcvqjgYvjPdZnuZAUBgXFnbeV7caD5gMTjt6A0J+rm
 H/VR/I7E5mdC8N42w5JSNHG6aihGcurV5NilLO955AS+py1cyVYapWqGY4gviIZLPcN1
 iocQ6TQFu//ncvilwo+ixtEqDJK8LgpTbCLbJczNS8HhATNuzFZft/rdLUZMnDWF5CLG
 qGZw==
X-Gm-Message-State: AOAM53209voEpK2NSDi4iKt1LyTNOa6tH2qYgEKB1ps/MfOHOvP54AO9
 HLBIdkZOwUtOrX4frP64uyxsY1hJBXjwhODQ
X-Google-Smtp-Source: ABdhPJwkuxWq70OZDDHUvlvKxagck9TRjPZKU3g23XqCmDUUZEe9Y01RmcL6G8BKldTXxtndJYt3iA==
X-Received: by 2002:a7b:c085:: with SMTP id r5mr1669161wmh.17.1604052533716;
 Fri, 30 Oct 2020 03:08:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v189sm4430947wmg.14.2020.10.30.03.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 03:08:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 11/15] PCI: Obey iomem restrictions for procfs mmap
Date: Fri, 30 Oct 2020 11:08:11 +0100
Message-Id: <20201030100815.2269-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
References: <20201030100815.2269-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-pci@vger.kernel.org, linux-mm@kvack.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyB0aHJlZSB3YXlzIHRvIGFjY2VzcyBQQ0kgQkFScyBmcm9tIHVzZXJzcGFjZTogL2Rl
di9tZW0sIHN5c2ZzCmZpbGVzLCBhbmQgdGhlIG9sZCBwcm9jIGludGVyZmFjZS4gVHdvIGNoZWNr
IGFnYWluc3QKaW9tZW1faXNfZXhjbHVzaXZlLCBwcm9jIG5ldmVyIGRpZC4gQW5kIHdpdGggQ09O
RklHX0lPX1NUUklDVF9ERVZNRU0sCnRoaXMgc3RhcnRzIHRvIG1hdHRlciwgc2luY2Ugd2UgZG9u
J3Qgd2FudCByYW5kb20gdXNlcnNwYWNlIGhhdmluZwphY2Nlc3MgdG8gUENJIEJBUnMgd2hpbGUg
YSBkcml2ZXIgaXMgbG9hZGVkIGFuZCB1c2luZyBpdC4KCkZpeCB0aGlzIGJ5IGFkZGluZyB0aGUg
c2FtZSBpb21lbV9pc19leGNsdXNpdmUoKSBjaGVjayB3ZSBhbHJlYWR5IGhhdmUKb24gdGhlIHN5
c2ZzIHNpZGUgaW4gcGNpX21tYXBfcmVzb3VyY2UoKS4KClJlZmVyZW5jZXM6IDkwYTU0NWU5ODEy
NiAoInJlc3RyaWN0IC9kZXYvbWVtIHRvIGlkbGUgaW8gbWVtb3J5IHJhbmdlcyIpClNpZ25lZC1v
ZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+CkNjOiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVt
Lm9yZz4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmou
d2lsbGlhbXNAaW50ZWwuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnCkNjOiBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIua2Vy
bmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCkNjOiBCam9ybiBIZWxnYWFz
IDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgpDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgotLQp2Mjog
SW1wcm92ZSBjb21taXQgbWVzc2FnZSAoQmpvcm4pCi0tLQogZHJpdmVycy9wY2kvcHJvYy5jIHwg
NSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGNpL3Byb2MuYyBiL2RyaXZlcnMvcGNpL3Byb2MuYwppbmRleCBkMzUxODZiMDFkOTgu
LjNhMmY5MGJlYjRjYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9wY2kvcHJvYy5jCisrKyBiL2RyaXZl
cnMvcGNpL3Byb2MuYwpAQCAtMjc0LDYgKzI3NCwxMSBAQCBzdGF0aWMgaW50IHByb2NfYnVzX3Bj
aV9tbWFwKHN0cnVjdCBmaWxlICpmaWxlLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAkJ
ZWxzZQogCQkJcmV0dXJuIC1FSU5WQUw7CiAJfQorCisJaWYgKGRldi0+cmVzb3VyY2VbaV0uZmxh
Z3MgJiBJT1JFU09VUkNFX01FTSAmJgorCSAgICBpb21lbV9pc19leGNsdXNpdmUoZGV2LT5yZXNv
dXJjZVtpXS5zdGFydCkpCisJCXJldHVybiAtRUlOVkFMOworCiAJcmV0ID0gcGNpX21tYXBfcGFn
ZV9yYW5nZShkZXYsIGksIHZtYSwKIAkJCQkgIGZwcml2LT5tbWFwX3N0YXRlLCB3cml0ZV9jb21i
aW5lKTsKIAlpZiAocmV0IDwgMCkKLS0gCjIuMjguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
