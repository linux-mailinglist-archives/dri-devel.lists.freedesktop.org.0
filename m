Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E458138E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8DF6E2E6;
	Mon,  5 Aug 2019 07:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D539F89147;
 Sun,  4 Aug 2019 22:49:55 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id c14so35603670plo.0;
 Sun, 04 Aug 2019 15:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=EGb39j8ijBMCU7100yPTB5VREyswsLf1m/J8PFv2PscIzaSM8D+pN3GB5+JJN+fEqs
 HVWBTlHwda/AjrnhkwxsrJ8q+2FWaJtIUaTHB8yV1bP5KlMA/I0nPLyRASBRCDQq/1/J
 8nPf6NOu56ABF25EDPlpGf+XrZYL1uovvAjmLzVzMp+1FSuHxUDWc8UoArlX/9rvhZTs
 QNZlPI4eBqCvfpRhSqOokzrP7+rGAlzEFZKCjRBUjC2JGzgOXjEtZEQz9zEMm0fi0DCI
 U5l6q8JtfWUe/JGNl2sFjdcOsrOp1auNpIWTDW2Dt0BDgAB06xrTIgIrEsOcVKpobJdP
 TO8w==
X-Gm-Message-State: APjAAAW6EKLckv/4E5693MdyEHodFuUExllpC0sASI12OKwjH0QmyK/x
 aJXNDIoPOCBF0SRrZpi6iN8=
X-Google-Smtp-Source: APXvYqxpyFBswVwCpmbWWUYW5zokWhx2pCk/sdTQw8977867DfmKTOqoiHBx6Glc/HUCem3kZHec6Q==
X-Received: by 2002:a17:902:8689:: with SMTP id
 g9mr131877551plo.252.1564958995585; 
 Sun, 04 Aug 2019 15:49:55 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:55 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 23/34] uprobes: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:49:04 -0700
Message-Id: <20190804224915.28669-24-jhubbard@nvidia.com>
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
 bh=lKIFYbXGeRFczJ7GPuSawhtMV9YIx2+MYUTps7oOTAE=;
 b=TDggbkgRiGIAFGZg+jjgHpzcEiYccMBQ6jptVLtuAINCBCAa7tBLSYJdtzRqQAkVQq
 tQ08R+kd1zAphQz9pkaaBX/hg9RvlkTaePPnO2E1bu2f/76JhzKynqi5fDXQgm3u+sje
 C80KY3nOvFeOz/PfxhVfGvol35idNxGJp30wpqdrZCtYSNKWJHD3OZzPkmpz9TZ2iydK
 zGtAdXJa7uyuK2GhTVtmCk46eJaIXB31IST9V3s1VEcpQHy9Y1uuVubQ/wNf6EoCYZeE
 iY7ztWwDS8B1eHyY4QnXS4dvWcICmGOtU1XZ3uVoXugfKVLMqqSM2fvbIrY7TrJ6h/xd
 OTrg==
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
 Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogUGV0ZXIg
WmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJl
ZGhhdC5jb20+CkNjOiBBcm5hbGRvIENhcnZhbGhvIGRlIE1lbG8gPGFjbWVAa2VybmVsLm9yZz4K
Q2M6IEFsZXhhbmRlciBTaGlzaGtpbiA8YWxleGFuZGVyLnNoaXNoa2luQGxpbnV4LmludGVsLmNv
bT4KQ2M6IEppcmkgT2xzYSA8am9sc2FAcmVkaGF0LmNvbT4KQ2M6IE5hbWh5dW5nIEtpbSA8bmFt
aHl1bmdAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPgotLS0KIGtlcm5lbC9ldmVudHMvdXByb2Jlcy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
a2VybmVsL2V2ZW50cy91cHJvYmVzLmMgYi9rZXJuZWwvZXZlbnRzL3Vwcm9iZXMuYwppbmRleCA4
NGZhMDA0OTdjNDkuLjRhNTc1ZGU4Y2VjOCAxMDA2NDQKLS0tIGEva2VybmVsL2V2ZW50cy91cHJv
YmVzLmMKKysrIGIva2VybmVsL2V2ZW50cy91cHJvYmVzLmMKQEAgLTM5Nyw3ICszOTcsNyBAQCBf
X3VwZGF0ZV9yZWZfY3RyKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRy
LCBzaG9ydCBkKQogCXJldCA9IDA7CiBvdXQ6CiAJa3VubWFwX2F0b21pYyhrYWRkcik7Ci0JcHV0
X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAlyZXR1cm4gcmV0OwogfQogCkBA
IC01MDQsNyArNTA0LDcgQEAgaW50IHVwcm9iZV93cml0ZV9vcGNvZGUoc3RydWN0IGFyY2hfdXBy
b2JlICphdXByb2JlLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIAlyZXQgPSBfX3JlcGxhY2VfcGFn
ZSh2bWEsIHZhZGRyLCBvbGRfcGFnZSwgbmV3X3BhZ2UpOwogCXB1dF9wYWdlKG5ld19wYWdlKTsK
IHB1dF9vbGQ6Ci0JcHV0X3BhZ2Uob2xkX3BhZ2UpOworCXB1dF91c2VyX3BhZ2Uob2xkX3BhZ2Up
OwogCiAJaWYgKHVubGlrZWx5KHJldCA9PSAtRUFHQUlOKSkKIAkJZ290byByZXRyeTsKQEAgLTE5
ODEsNyArMTk4MSw3IEBAIHN0YXRpYyBpbnQgaXNfdHJhcF9hdF9hZGRyKHN0cnVjdCBtbV9zdHJ1
Y3QgKm1tLCB1bnNpZ25lZCBsb25nIHZhZGRyKQogCQlyZXR1cm4gcmVzdWx0OwogCiAJY29weV9m
cm9tX3BhZ2UocGFnZSwgdmFkZHIsICZvcGNvZGUsIFVQUk9CRV9TV0JQX0lOU05fU0laRSk7Ci0J
cHV0X3BhZ2UocGFnZSk7CisJcHV0X3VzZXJfcGFnZShwYWdlKTsKICBvdXQ6CiAJLyogVGhpcyBu
ZWVkcyB0byByZXR1cm4gdHJ1ZSBmb3IgYW55IHZhcmlhbnQgb2YgdGhlIHRyYXAgaW5zbiAqLwog
CXJldHVybiBpc190cmFwX2luc24oJm9wY29kZSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
