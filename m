Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CF481373
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AC2B6E2AB;
	Mon,  5 Aug 2019 07:35:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88B998946E;
 Sun,  4 Aug 2019 22:49:43 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c3so15459418pfa.13;
 Sun, 04 Aug 2019 15:49:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=dqkY2xNTz21A2YKbruvurR6dThTCjmMucbLuL2GJ2dwdOe2p44GJLBJ1IsVVYPag8z
 /FvlSrsNrKs1fctr56d6vP/rKwEonP7uLG6+LnJrAnhgmiE0O43VkxVykNvp1fahsHdx
 vjvkDtXbqAo1/DQkg/zGaTQCKh24A9cBw4Ei1g9BBBtuxjXi8WH9hRza5i8gisKiqzRS
 zBXz02/YyVlpSr7q2HWYnMSaUlZZZFImr1gO4GXcwxxR9TN8kWi5Q5bK/rzCiDsbuwTl
 e1UyDpXKZd7Q3GQsb2cfkhQC74Bun2doAf0ZM9PgsqXYCPWoW8ib7pn1aRRFKvVxAtjQ
 iR3w==
X-Gm-Message-State: APjAAAUPfDQ3XkAepN0heVxSTqoXLyBawL1ame0RoqrL1w1vj9dDQBG/
 6TVsqYZu81mnkv03JIgueJk=
X-Google-Smtp-Source: APXvYqyPw77rNCbZJ7kQ+m4UN8hP7cU/4bhOvRnVoHevKNRjma2a+EIazJKEeGo0aqshVanFUuFV/w==
X-Received: by 2002:aa7:8acb:: with SMTP id b11mr67847354pfd.109.1564958983244; 
 Sun, 04 Aug 2019 15:49:43 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:42 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 15/34] staging/vc04_services: convert put_page() to
 put_user_page*()
Date: Sun,  4 Aug 2019 15:48:56 -0700
Message-Id: <20190804224915.28669-16-jhubbard@nvidia.com>
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
 bh=JsaN0a6ImilSblrGqgWWjtVL4aaUVqoBD3LMggUShuU=;
 b=JnEMIs3nTK87TbKIsk78nYiw0PTY0ejtc4/1iVy6auz4dRHpNyRxFRwH1QA1daWzTN
 aXj9jYYTXz8+AYgGcMfTPEBfeFGtB4kpRaO8Pk0E6cwtra6dbEcp5zLBIuE/7ypkwlfT
 SpsJZfWDoouD9Zux+JSra/B270Q5FO6OQn2iMY62H9YA77q4YnCIt/dO49LC8oE1+DV3
 b+TloTS62XLmGXLlvmUrAcvGMvg3D8t/Jyb83QK6eNN0dmLM2VXZUouulBv1uv5lB+bU
 bCC0pVKtYc9eHNJ+luk9voAPhlxcPRRn3LwajJw/0mnVI63KipX9TSVsdQUN1tD1p56o
 UI1Q==
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org,
 Suniel Mahesh <sunil.m@techveda.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mihaela Muraru <mihaela.muraru21@gmail.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Kishore KP <kishore.p@techveda.org>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Sidong Yang <realwakka@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpBY2tlZC1ieTog
R3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KCkNjOiBFcmlj
IEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzogU3RlZmFuIFdhaHJlbiA8c3RlZmFuLndhaHJl
bkBpMnNlLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBNaWhhZWxhIE11cmFydSA8bWloYWVsYS5tdXJhcnUyMUBnbWFpbC5jb20+CkNj
OiBTdW5pZWwgTWFoZXNoIDxzdW5pbC5tQHRlY2h2ZWRhLm9yZz4KQ2M6IEFsIFZpcm8gPHZpcm9A
emVuaXYubGludXgub3JnLnVrPgpDYzogU2lkb25nIFlhbmcgPHJlYWx3YWtrYUBnbWFpbC5jb20+
CkNjOiBLaXNob3JlIEtQIDxraXNob3JlLnBAdGVjaHZlZGEub3JnPgpDYzogbGludXgtcnBpLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmcKQ2M6IGRldmVsQGRyaXZlcmRldi5vc3Vvc2wub3JnClNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiAuLi4vdmMwNF9zZXJ2aWNlcy9p
bnRlcmZhY2UvdmNoaXFfYXJtL3ZjaGlxXzI4MzVfYXJtLmMgfCAxMCArKy0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFf
MjgzNV9hcm0uYyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2VzL2ludGVyZmFjZS92Y2hp
cV9hcm0vdmNoaXFfMjgzNV9hcm0uYwppbmRleCA2MWM2OWYzNTNjZGIuLmVjOTJiNGM1MGU5NSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL3ZjMDRfc2VydmljZXMvaW50ZXJmYWNlL3ZjaGlx
X2FybS92Y2hpcV8yODM1X2FybS5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy92YzA0X3NlcnZpY2Vz
L2ludGVyZmFjZS92Y2hpcV9hcm0vdmNoaXFfMjgzNV9hcm0uYwpAQCAtMzM2LDEwICszMzYsNyBA
QCBjbGVhbnVwX3BhZ2VsaXN0aW5mbyhzdHJ1Y3QgdmNoaXFfcGFnZWxpc3RfaW5mbyAqcGFnZWxp
c3RpbmZvKQogCX0KIAogCWlmIChwYWdlbGlzdGluZm8tPnBhZ2VzX25lZWRfcmVsZWFzZSkgewot
CQl1bnNpZ25lZCBpbnQgaTsKLQotCQlmb3IgKGkgPSAwOyBpIDwgcGFnZWxpc3RpbmZvLT5udW1f
cGFnZXM7IGkrKykKLQkJCXB1dF9wYWdlKHBhZ2VsaXN0aW5mby0+cGFnZXNbaV0pOworCQlwdXRf
dXNlcl9wYWdlcyhwYWdlbGlzdGluZm8tPnBhZ2VzLCBwYWdlbGlzdGluZm8tPm51bV9wYWdlcyk7
CiAJfQogCiAJZG1hX2ZyZWVfY29oZXJlbnQoZ19kZXYsIHBhZ2VsaXN0aW5mby0+cGFnZWxpc3Rf
YnVmZmVyX3NpemUsCkBAIC00NTQsMTAgKzQ1MSw3IEBAIGNyZWF0ZV9wYWdlbGlzdChjaGFyIF9f
dXNlciAqYnVmLCBzaXplX3QgY291bnQsIHVuc2lnbmVkIHNob3J0IHR5cGUpCiAJCQkJICAgICAg
IF9fZnVuY19fLCBhY3R1YWxfcGFnZXMsIG51bV9wYWdlcyk7CiAKIAkJCS8qIFRoaXMgaXMgcHJv
YmFibHkgZHVlIHRvIHRoZSBwcm9jZXNzIGJlaW5nIGtpbGxlZCAqLwotCQkJd2hpbGUgKGFjdHVh
bF9wYWdlcyA+IDApIHsKLQkJCQlhY3R1YWxfcGFnZXMtLTsKLQkJCQlwdXRfcGFnZShwYWdlc1th
Y3R1YWxfcGFnZXNdKTsKLQkJCX0KKwkJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBhY3R1YWxfcGFn
ZXMpOwogCQkJY2xlYW51cF9wYWdlbGlzdGluZm8ocGFnZWxpc3RpbmZvKTsKIAkJCXJldHVybiBO
VUxMOwogCQl9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
