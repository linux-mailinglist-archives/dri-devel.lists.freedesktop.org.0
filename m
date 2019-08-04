Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A8B81350
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3FC6E29B;
	Mon,  5 Aug 2019 07:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9F7892DE;
 Sun,  4 Aug 2019 22:49:28 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z14so1431562pga.5;
 Sun, 04 Aug 2019 15:49:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YLPz5BCHjHkg+J9ZI8yxOLwnUAw8CiRxIyzlmsd6bb8=;
 b=UOHPx8qZ5iDaxYAfvRqrKN5q8k7VZDeBDZbVyj8RQEN8cN/gOfmbcheGRHAwmEMTM8
 mbuQyqW3PHylxz82qXc80DbI0HnY+V8mr92XAU+aicM0xaTJbglblLe4E5f6tdRNZvJe
 sl02mGI3WbjgdHoCSD2x1IFTBB6XLq8ripjRdhR2tRNlh7/E7djKMqMJstVUYdFZ3Ldx
 niSrebNxaI4GfU68uuhd9ifVXWPNEA00tbi55Lm/5efV3z0976aENM7kUs3x67LCmAHj
 z7Xl/BERt0ZiS2GxWAyDFiau2He/+6S+tEMIO4hDsvP6K03eJ5VmZ7RElTH1FD1aY/fL
 /omA==
X-Gm-Message-State: APjAAAX2S2Hypj185w16Xjx1gyzW1QWTEH6K35JgK6tviFA6eUfczKwI
 LHl3FuqG5INyK4KlEKpbKRs=
X-Google-Smtp-Source: APXvYqzIKv6XtE7UttpMMo5Kx4L8tiNE0k37oAlXEn6wMXua1ZT012h1Fuu1D5Rv1jbsWDQQbHwbnw==
X-Received: by 2002:a65:6547:: with SMTP id a7mr112462494pgw.65.1564958968612; 
 Sun, 04 Aug 2019 15:49:28 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.27
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:28 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 06/34] drm/i915: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:47 -0700
Message-Id: <20190804224915.28669-7-jhubbard@nvidia.com>
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
 bh=YLPz5BCHjHkg+J9ZI8yxOLwnUAw8CiRxIyzlmsd6bb8=;
 b=VGrPeNjqXUKwD8rPOUJWvgTDjvXlBgpZNgVsAZpGvh41vX88GkAws7QVpEp9tEzYXW
 EWAxbuchsvglHqS59E2TkHXvzV9QiwRyVicm9YfNC1RSq1Lw+8bSeox7MCzKs4UlTpfP
 ozXvShoKM7yUTPqi96o4h71oG13jljV2Z5NhvBV41avMLU4Q1BrhH8GwT114cWkCl1MF
 d261JitS12TLzntNYSyrJZWMAgzBr9+636G4ae4VYGKmmjZF/lcCezF8KGvZPOFySOt6
 etVud9nCJxdyVx56j1jluPcIcFoQjayW3OLzqWiVdA46hf2UCQT0Dq3HzUpJLfZuSPrQ
 6mhw==
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpUaGlzIGlzIGEg
bWVyZ2UtYWJsZSB2ZXJzaW9uIG9mIHRoZSBmaXgsIGJlY2F1c2UgaXQgcmVzdHJpY3RzCml0c2Vs
ZiB0byBwdXRfdXNlcl9wYWdlKCkgYW5kIHB1dF91c2VyX3BhZ2VzKCksIGJvdGggb2Ygd2hpY2gK
aGF2ZSBub3QgY2hhbmdlZCB0aGVpciBBUElzLiBMYXRlciwgaTkxNV9nZW1fdXNlcnB0cl9wdXRf
cGFnZXMoKQpjYW4gYmUgc2ltcGxpZmllZCB0byB1c2UgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9j
aygpLgoKQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBK
b29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51eC5pbnRlbC5jb20+CkNjOiBSb2Ry
aWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxp
ZWRAbGludXguaWU+CkNjOiBpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8
amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fdXNlcnB0ci5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX3VzZXJwdHIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2Vy
cHRyLmMKaW5kZXggMmNhYTU5NDMyMmJjLi43NmRkYTI5MjNjZjEgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYwpAQCAtNTI3LDcgKzUyNyw3IEBAIF9faTkx
NV9nZW1fdXNlcnB0cl9nZXRfcGFnZXNfd29ya2VyKHN0cnVjdCB3b3JrX3N0cnVjdCAqX3dvcmsp
CiAJfQogCW11dGV4X3VubG9jaygmb2JqLT5tbS5sb2NrKTsKIAotCXJlbGVhc2VfcGFnZXMocHZl
YywgcGlubmVkKTsKKwlwdXRfdXNlcl9wYWdlcyhwdmVjLCBwaW5uZWQpOwogCWt2ZnJlZShwdmVj
KTsKIAogCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKQEAgLTY0MCw3ICs2NDAsNyBAQCBzdGF0
aWMgaW50IGk5MTVfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2Jq
ZWN0ICpvYmopCiAJCV9faTkxNV9nZW1fdXNlcnB0cl9zZXRfYWN0aXZlKG9iaiwgdHJ1ZSk7CiAK
IAlpZiAoSVNfRVJSKHBhZ2VzKSkKLQkJcmVsZWFzZV9wYWdlcyhwdmVjLCBwaW5uZWQpOworCQlw
dXRfdXNlcl9wYWdlcyhwdmVjLCBwaW5uZWQpOwogCWt2ZnJlZShwdmVjKTsKIAogCXJldHVybiBQ
VFJfRVJSX09SX1pFUk8ocGFnZXMpOwpAQCAtNjc1LDcgKzY3NSw3IEBAIGk5MTVfZ2VtX3VzZXJw
dHJfcHV0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2JqZWN0ICpvYmosCiAJCQlzZXRfcGFn
ZV9kaXJ0eV9sb2NrKHBhZ2UpOwogCiAJCW1hcmtfcGFnZV9hY2Nlc3NlZChwYWdlKTsKLQkJcHV0
X3BhZ2UocGFnZSk7CisJCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAJfQogCW9iai0+bW0uZGlydHkg
PSBmYWxzZTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
