Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 834C081359
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A606E243;
	Mon,  5 Aug 2019 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EEF389147;
 Sun,  4 Aug 2019 22:49:59 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u14so38616478pfn.2;
 Sun, 04 Aug 2019 15:49:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=WMLW7z3wvi4DcyNThLXGowxt78+jbPILL8NpOFvqmM6xObK5+5GiSyopBdJg0EZVrP
 xLrByNQkDNqC3tVy50jfScGlL1QdyjABONkOSYSqznljRchDvmbOchblBeF5AjpwNSu4
 k54z4xUWBQscIglz34+YT9Qu+Y2n9fQVV+zfz6833ns8LToLi/NShMcIQQTxLYp6HG7h
 VUUYuj87s2RfMRzyro7X4p0MlDPAkYAfkc/K/GEf+AOouOwTqQJS/OySYSlP4L7BueoF
 aG6LMmIiVa6p9LTIctCywwFLwYIiehfAC4mNHI+XliXhOleRnKdrQXjSSRe5bPkww7/9
 q5OQ==
X-Gm-Message-State: APjAAAU6ne1B0T4lNdmU7MAE/hPP+Krru6HxhswK72J+U3FTbXIwUFql
 Yzgt1bqkRmUO1Kh22Qlx/rY=
X-Google-Smtp-Source: APXvYqwlrqrBPfbU3uzw56VyHFJ2u/Wv2Z0KkmEAsOsnKmMeY4aJMueEUB/6oS1u2+NCnzOVxWkmSA==
X-Received: by 2002:a63:4a51:: with SMTP id
 j17mr133593330pgl.284.1564958998921; 
 Sun, 04 Aug 2019 15:49:58 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.57
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:58 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 25/34] mm/frame_vector.c: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:49:06 -0700
Message-Id: <20190804224915.28669-26-jhubbard@nvidia.com>
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
 bh=XDFswRI13oGzit66yuxshlgOj+nOKd4gwJhAdxr7MGM=;
 b=rRmTjwmKQyZXs+w2fc61p+6blqitgFt44VDlq2hBJa3msEqsCjE3iMA0N59ImENjx1
 pWxFmzHovpTywgJof2duXF6btSgoIVe+p+WICBao5KO8pBkE9NcaTV9gfxHpi58Jd393
 DFKgJ0xyVx8/IYN8IUERTh2Rxf2HWoXWnWj+XPN7lRyL0wmkPmCXMh8pOjTaDWP9OB/k
 giTYlSTz/ZRaJt6cAxVDISU3w6TbcicUIO0JMUvDlHhqw/CPHipUdbC11SYdC5WWsNXd
 vc/vSbii+ZbRuDVkTzr0tcFTEidEPQ4hRCQUhyIepPPKxZC6v01QDasnaLKNedkEXXRF
 M2wA==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Mel Gorman <mgorman@suse.de>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
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

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogRGFuIFdp
bGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+CkNjOiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6PgpDYzogTWVsIEdvcm1hbiA8bWdvcm1hbkBzdXNlLmRlPgpDYzogVmxhc3RpbWlsIEJhYmth
IDx2YmFia2FAc3VzZS5jej4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIG1tL2ZyYW1lX3ZlY3Rvci5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vZnJhbWVf
dmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwppbmRleCBjNjRkY2E2ZTI3YzIuLmY1OTBiYWRh
Yzc3NiAxMDA2NDQKLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKKysrIGIvbW0vZnJhbWVfdmVjdG9y
LmMKQEAgLTEyMCw3ICsxMjAsNiBAQCBFWFBPUlRfU1lNQk9MKGdldF92YWRkcl9mcmFtZXMpOwog
ICovCiB2b2lkIHB1dF92YWRkcl9mcmFtZXMoc3RydWN0IGZyYW1lX3ZlY3RvciAqdmVjKQogewot
CWludCBpOwogCXN0cnVjdCBwYWdlICoqcGFnZXM7CiAKIAlpZiAoIXZlYy0+Z290X3JlZikKQEAg
LTEzMyw4ICsxMzIsNyBAQCB2b2lkIHB1dF92YWRkcl9mcmFtZXMoc3RydWN0IGZyYW1lX3ZlY3Rv
ciAqdmVjKQogCSAqLwogCWlmIChXQVJOX09OKElTX0VSUihwYWdlcykpKQogCQlnb3RvIG91dDsK
LQlmb3IgKGkgPSAwOyBpIDwgdmVjLT5ucl9mcmFtZXM7IGkrKykKLQkJcHV0X3BhZ2UocGFnZXNb
aV0pOworCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCB2ZWMtPm5yX2ZyYW1lcyk7CiAJdmVjLT5nb3Rf
cmVmID0gZmFsc2U7CiBvdXQ6CiAJdmVjLT5ucl9mcmFtZXMgPSAwOwotLSAKMi4yMi4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
