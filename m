Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD348138F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7926F6E2E8;
	Mon,  5 Aug 2019 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA7589CDE;
 Sun,  4 Aug 2019 22:50:13 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id t16so38568875pfe.11;
 Sun, 04 Aug 2019 15:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=AbOHYzfdLcmW9Q5Z1vGLIgDHIPup54KqFDdFyYbuIEC3ot7FJWwcAO09IeDQl3o9mR
 FafvImTchV3GwHKKN207QpYecOxV0ano6bT2mOtfqZTitZShtgD8W5NUBXVLEGgcT8si
 0sY6WmSrzSLiGjbmuO6h7CHNtAC2Xt4dF5GMBhrUB/opw6E87fzanIVuU8HPgXQ8C4JA
 RwGSnEybmmAxrH7upF6bhKtPoGC17D1H2ua+zuf0vQIGr86CE8j3sLHWcgZNrSlkXop4
 NwKJuwHPCft1jQKJa26LsfAtnRaX6i3jXmcjdEbmD6gElTrKe1SHmeoU6Ivm0dHc31Fz
 RSgA==
X-Gm-Message-State: APjAAAUAQqEoSYy9oY5aycHSTvGOwXtep3A0C+BvKqB3fMkwzbyTgS/X
 2VuYdTZxlkeJ4AIYm28vF4w=
X-Google-Smtp-Source: APXvYqwQo0taKdXUQzpI7809Qn44c5UC2qpj3t9n7qUuNadX/5xLSvSBDLCQnHDNoFHPmzlJl8WofQ==
X-Received: by 2002:a17:90a:2767:: with SMTP id
 o94mr14743655pje.25.1564959012976; 
 Sun, 04 Aug 2019 15:50:12 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.50.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:50:12 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 34/34] fs/binfmt_elf: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:15 -0700
Message-Id: <20190804224915.28669-35-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190804224915.28669-1-jhubbard@nvidia.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cegKTIaYJ+tSle0YiC1yJpybmvJrVZXG5Xryw9OToL0=;
 b=aCkaquioWJVgZ9oxi+kgs0xYn9XvezpV99sLT07IcNs8SpVl8RxEWxB8NfzIRBrjBL
 2B4dJHw2cG5TO6qtCk6u4ZcIwavE5x+pbFyHjAA9Gawo5yJz/cR/RN7KLFsBrzcuwVZV
 WP2fTbo7D/YmdMo3LfJiKW1AjSHc3oDEIZmC59HJW1UrPrOWaY8WJXtwgsxilT0195Uq
 ocw3UqvOC5KedpAwMEgqM2mZYVxGq6/tGgBNtuTtcR3B451sP4Bb3FZmj7gUlwzeWEUc
 XzVXXNThe+NP4na45hxvXL3T6bslaXSJNEyIhO73A4aiizrSPKRgEZ7pYwnnfabRC/Y3
 oqhQ==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgoKRm9yIHBhZ2VzIHRoYXQgd2Vy
ZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKdmlh
IHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0X3Bh
Z2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVy
c2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9kdWNl
IHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpnZXRfZHVtcF9wYWdl
IGNhbGxzIGdldF91c2VyX3BhZ2Ugc28gcHV0X3VzZXJfcGFnZSBtdXN0IGJlIHVzZWQKdG8gbWF0
Y2guCgpTaWduZWQtb2ZmLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBmcy9iaW5m
bXRfZWxmLmMgICAgICAgfCAyICstCiBmcy9iaW5mbXRfZWxmX2ZkcGljLmMgfCAyICstCiAyIGZp
bGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9mcy9iaW5mbXRfZWxmLmMgYi9mcy9iaW5mbXRfZWxmLmMKaW5kZXggZDRlMTFiMmUwNGY2Li45
MmU0YTVjYTk5ZDggMTAwNjQ0Ci0tLSBhL2ZzL2JpbmZtdF9lbGYuYworKysgYi9mcy9iaW5mbXRf
ZWxmLmMKQEAgLTIzNzcsNyArMjM3Nyw3IEBAIHN0YXRpYyBpbnQgZWxmX2NvcmVfZHVtcChzdHJ1
Y3QgY29yZWR1bXBfcGFyYW1zICpjcHJtKQogCQkJCXZvaWQgKmthZGRyID0ga21hcChwYWdlKTsK
IAkJCQlzdG9wID0gIWR1bXBfZW1pdChjcHJtLCBrYWRkciwgUEFHRV9TSVpFKTsKIAkJCQlrdW5t
YXAocGFnZSk7Ci0JCQkJcHV0X3BhZ2UocGFnZSk7CisJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsK
IAkJCX0gZWxzZQogCQkJCXN0b3AgPSAhZHVtcF9za2lwKGNwcm0sIFBBR0VfU0laRSk7CiAJCQlp
ZiAoc3RvcCkKZGlmZiAtLWdpdCBhL2ZzL2JpbmZtdF9lbGZfZmRwaWMuYyBiL2ZzL2JpbmZtdF9l
bGZfZmRwaWMuYwppbmRleCBkODZlYmQwZGNjM2QuLjMyMTcyNGIzYmUyMiAxMDA2NDQKLS0tIGEv
ZnMvYmluZm10X2VsZl9mZHBpYy5jCisrKyBiL2ZzL2JpbmZtdF9lbGZfZmRwaWMuYwpAQCAtMTUx
MSw3ICsxNTExLDcgQEAgc3RhdGljIGJvb2wgZWxmX2ZkcGljX2R1bXBfc2VnbWVudHMoc3RydWN0
IGNvcmVkdW1wX3BhcmFtcyAqY3BybSkKIAkJCQl2b2lkICprYWRkciA9IGttYXAocGFnZSk7CiAJ
CQkJcmVzID0gZHVtcF9lbWl0KGNwcm0sIGthZGRyLCBQQUdFX1NJWkUpOwogCQkJCWt1bm1hcChw
YWdlKTsKLQkJCQlwdXRfcGFnZShwYWdlKTsKKwkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJ
fSBlbHNlIHsKIAkJCQlyZXMgPSBkdW1wX3NraXAoY3BybSwgUEFHRV9TSVpFKTsKIAkJCX0KLS0g
CjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
