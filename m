Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537F2949A4
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E163A6EA9E;
	Wed, 21 Oct 2020 08:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75BFB6EA91
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:09 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so2162809wrq.2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X91vcdrvFkENyRAE7ngumttfTvuoYERNqnOUmx1loc8=;
 b=GPnXCMyD+ghMvqTjeYNcG8HYusAwuJxpfHWnTLJKQIsMVr4ZAhrveCWfs4AXdeBUPw
 Y5mupIyBAV9NDJ8u8gy061IQONEWL5h8a9oYpovitSRm7WeaCy/YPrPbgEp1B6AXN1YC
 FZ2gAxPTsOCGgSfQP+HaV8u3GtfeNX/N9iPJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X91vcdrvFkENyRAE7ngumttfTvuoYERNqnOUmx1loc8=;
 b=ZLrPWPElBzOTHgA0+pDD11gvTIJv9eda2l5jfLauOFNfAFtY8V7KmGqSEyFzwBwQDc
 37kuZaVzcjZAwGuV8t/5oj6AZnTU+5Aw4pua+MLZmkw005tRAjm70hTfgVjGgkWebZom
 cj0TESfNJivd3Mq60CwVV0kOEiIXYfMDZNOzGixcawYgDwUhBhSsLxsMOe6jCUaAZuCL
 J4te/21nd6DMk5LindoH+RiDnkByJrp/ddYGyDCmp8ezJbMf715IDb846IqwBZIDVwmy
 iSOvUCZfkESFzWtriLyAJU3EIuTML+oY5nXdEs+ikazNyG+/kDPH7nwLkiTkUZ0qXrfC
 iDeQ==
X-Gm-Message-State: AOAM532LY/RS8aEyHaCp2eZp5izSYJ46tlmKjKwd4teT2gTMRoTx4ZWZ
 VCkNtNiqQJIQmYUwzq03guBPYZeYVRzZZ1Qr
X-Google-Smtp-Source: ABdhPJwRJSi1MhjUwKHGSaK47xh7Klwun5uHdPZbkNE0DXk17iEFA5dRgyjIq8Do+yUzr74H0TKxFQ==
X-Received: by 2002:a5d:554b:: with SMTP id g11mr3494901wrw.370.1603270627906; 
 Wed, 21 Oct 2020 01:57:07 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 04/16] misc/habana: Use FOLL_LONGTERM for userptr
Date: Wed, 21 Oct 2020 10:56:43 +0200
Message-Id: <20201021085655.1192025-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
Cc: Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-mm@kvack.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-s390@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, Omer Shpigelman <oshpigelman@habana.ai>,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.com>,
 Tomer Tayar <ttayar@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Ofir Bitton <obitton@habana.ai>,
 linux-arm-kernel@lists.infradead.org, Pawel Piskorski <ppiskorski@habana.ai>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgYXJlIHBlcnNpc3RlbnQsIG5vdCBqdXN0IGZvciB0aGUgZHVyYXRpb24gb2YgYSBkbWEg
b3BlcmF0aW9uLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KQ2M6IEFuZHJldyBN
b3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJi
YXJkQG52aWRpYS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxp
YW1zQGludGVsLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5l
bEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5v
cmcKQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpDYzogT2RlZCBHYWJiYXkgPG9kZWQu
Z2FiYmF5QGdtYWlsLmNvbT4KQ2M6IE9tZXIgU2hwaWdlbG1hbiA8b3NocGlnZWxtYW5AaGFiYW5h
LmFpPgpDYzogT2ZpciBCaXR0b24gPG9iaXR0b25AaGFiYW5hLmFpPgpDYzogVG9tZXIgVGF5YXIg
PHR0YXlhckBoYWJhbmEuYWk+CkNjOiBNb3RpIEhhaW1vdnNraSA8bWhhaW1vdnNraUBoYWJhbmEu
YWk+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KQ2M6IFBhd2VsIFBpc2tv
cnNraSA8cHBpc2tvcnNraUBoYWJhbmEuYWk+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY29tPgotLS0KIGRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2Nv
bW1vbi9tZW1vcnkuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9u
L21lbW9yeS5jIGIvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29tbW9uL21lbW9yeS5jCmluZGV4
IDMyN2I2NDQ3OWY5Ny4uNzY3ZDM2NDRjMDMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL21pc2MvaGFi
YW5hbGFicy9jb21tb24vbWVtb3J5LmMKKysrIGIvZHJpdmVycy9taXNjL2hhYmFuYWxhYnMvY29t
bW9uL21lbW9yeS5jCkBAIC0xMjg4LDcgKzEyODgsOCBAQCBzdGF0aWMgaW50IGdldF91c2VyX21l
bW9yeShzdHJ1Y3QgaGxfZGV2aWNlICpoZGV2LCB1NjQgYWRkciwgdTY0IHNpemUsCiAJCXJldHVy
biAtRU5PTUVNOwogCX0KIAotCXJjID0gcGluX3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnBhZ2Vz
LCBGT0xMX0ZPUkNFIHwgRk9MTF9XUklURSwKKwlyYyA9IHBpbl91c2VyX3BhZ2VzX2Zhc3Qoc3Rh
cnQsIG5wYWdlcywKKwkJCQkgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUgfCBGT0xMX0xPTkdURVJN
LAogCQkJCSB1c2VycHRyLT5wYWdlcyk7CiAKIAlpZiAocmMgIT0gbnBhZ2VzKSB7Ci0tIAoyLjI4
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
