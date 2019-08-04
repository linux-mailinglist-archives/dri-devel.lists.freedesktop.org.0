Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDEFD81346
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C3289B8E;
	Mon,  5 Aug 2019 07:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB5988DF6;
 Sun,  4 Aug 2019 22:49:25 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id r7so38601000pfl.3;
 Sun, 04 Aug 2019 15:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o0zfkIFt+6JH2qCeaVwPptBUW8DYTI9b55PprZaXkM8=;
 b=E7AemQE8WeEpfhbDm4Ozf76VEIeIFZDtK2qS8ocJNmqIQwwYrxfrTqfqcHgC7/JGSE
 LBOwstTN4fGH2+fYzMnhLp70tsmO+EOSX8+xaoxHnm5TwTTAxfJvmjvlGD9UxWXN6cE5
 YMvGipIP4oTsueRv8gXZc8ym81yLkDOQ0U6zuwmEnn9tVISMWmei3gr9eVTag8zxfdPZ
 69Cc0Pjn+cNcj54rCrG4VTCpq2ddUmII77lAcEo1h3W0FqqUjudk0GPIlaaeaP4bCtT3
 uUmEVPqWB3Fxai4A0zV8CFDweeCB+zs5gj9X3cvuqA2lQ7etxaAXIZFeQiOznCMyJ2cz
 rDsA==
X-Gm-Message-State: APjAAAXGdYqaUMvNXiY1xfjoO52Oa1N/snO+7o3UkShJOOe8kTdKhkOP
 SrkNkYqJO6Of3VHjyfjis24=
X-Google-Smtp-Source: APXvYqwRJ1sJ/rrgIE94buNkF2wqaHOY76PrdCWNDeiwr3VYQjX9Duq5YnDYkLulcSwytNSAtlk/zQ==
X-Received: by 2002:a63:6bc5:: with SMTP id
 g188mr104077235pgc.225.1564958965247; 
 Sun, 04 Aug 2019 15:49:25 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 r6sm35946836pjb.22.2019.08.04.15.49.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 04 Aug 2019 15:49:24 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 04/34] x86/kvm: convert put_page() to put_user_page*()
Date: Sun,  4 Aug 2019 15:48:45 -0700
Message-Id: <20190804224915.28669-5-jhubbard@nvidia.com>
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
 bh=o0zfkIFt+6JH2qCeaVwPptBUW8DYTI9b55PprZaXkM8=;
 b=H+TbmcIgrwACxFo9hl2l5Xjf1f4GsBt3cThAJffGoVTGjng2zDR+vuW1ELmO9cwqUz
 zWIfVJ0ECGbvkQCKwqluHnqhDjnVY4M3JR5j9zUjgsJ4KIo9Jdd0V01x7wYmYDPTzYc0
 2jx8SovBWIpXNDy6R5BQslstKFd50o4jcCzDRtzpOpp5UZEbCq0wLfyRsWQbHo85Apl6
 6aso8ZPOFALMDQpmQJWkBkmOSbB25/wfG2bt9gcemYDwOVD8vq08Rd+SZJr2wXg0pz6k
 SDHNDSjbHSOs0ynQ5oDFI2egfnr7bliii2ZaEObWVPQlOvI2whQIUmO0CHVVfGDuWZsi
 brew==
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
 =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ingo Molnar <mingo@redhat.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKS4KClRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmli
ZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAooIm1tOiBpbnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSoo
KSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KCkNjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVz
Lm9yZz4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiBSYWRpbSBL
csSNbcOhxZkgPHJrcmNtYXJAcmVkaGF0LmNvbT4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGdseEBs
aW51dHJvbml4LmRlPgpDYzogSW5nbyBNb2xuYXIgPG1pbmdvQHJlZGhhdC5jb20+CkNjOiBILiBQ
ZXRlciBBbnZpbiA8aHBhQHp5dG9yLmNvbT4KQ2M6IHg4NkBrZXJuZWwub3JnCkNjOiBrdm1Admdl
ci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlh
LmNvbT4KLS0tCiBhcmNoL3g4Ni9rdm0vc3ZtLmMgIHwgNCArKy0tCiB2aXJ0L2t2bS9rdm1fbWFp
bi5jIHwgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rdm0vc3ZtLmMgYi9hcmNoL3g4Ni9rdm0vc3Zt
LmMKaW5kZXggN2VhZmM2OTA3ODYxLi5mZjkzYzkyM2VkMzYgMTAwNjQ0Ci0tLSBhL2FyY2gveDg2
L2t2bS9zdm0uYworKysgYi9hcmNoL3g4Ni9rdm0vc3ZtLmMKQEAgLTE4MjcsNyArMTgyNyw3IEBA
IHN0YXRpYyBzdHJ1Y3QgcGFnZSAqKnNldl9waW5fbWVtb3J5KHN0cnVjdCBrdm0gKmt2bSwgdW5z
aWduZWQgbG9uZyB1YWRkciwKIAogZXJyOgogCWlmIChucGlubmVkID4gMCkKLQkJcmVsZWFzZV9w
YWdlcyhwYWdlcywgbnBpbm5lZCk7CisJCXB1dF91c2VyX3BhZ2VzKHBhZ2VzLCBucGlubmVkKTsK
IAogCWt2ZnJlZShwYWdlcyk7CiAJcmV0dXJuIE5VTEw7CkBAIC0xODM4LDcgKzE4MzgsNyBAQCBz
dGF0aWMgdm9pZCBzZXZfdW5waW5fbWVtb3J5KHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IHBhZ2Ug
KipwYWdlcywKIHsKIAlzdHJ1Y3Qga3ZtX3Nldl9pbmZvICpzZXYgPSAmdG9fa3ZtX3N2bShrdm0p
LT5zZXZfaW5mbzsKIAotCXJlbGVhc2VfcGFnZXMocGFnZXMsIG5wYWdlcyk7CisJcHV0X3VzZXJf
cGFnZXMocGFnZXMsIG5wYWdlcyk7CiAJa3ZmcmVlKHBhZ2VzKTsKIAlzZXYtPnBhZ2VzX2xvY2tl
ZCAtPSBucGFnZXM7CiB9CmRpZmYgLS1naXQgYS92aXJ0L2t2bS9rdm1fbWFpbi5jIGIvdmlydC9r
dm0va3ZtX21haW4uYwppbmRleCA4ODdmM2IwYzJiNjAuLjRiNmE1OTZlYThlOSAxMDA2NDQKLS0t
IGEvdmlydC9rdm0va3ZtX21haW4uYworKysgYi92aXJ0L2t2bS9rdm1fbWFpbi5jCkBAIC0xNDk5
LDcgKzE0OTksNyBAQCBzdGF0aWMgaW50IGh2YV90b19wZm5fc2xvdyh1bnNpZ25lZCBsb25nIGFk
ZHIsIGJvb2wgKmFzeW5jLCBib29sIHdyaXRlX2ZhdWx0LAogCiAJCWlmIChfX2dldF91c2VyX3Bh
Z2VzX2Zhc3QoYWRkciwgMSwgMSwgJndwYWdlKSA9PSAxKSB7CiAJCQkqd3JpdGFibGUgPSB0cnVl
OwotCQkJcHV0X3BhZ2UocGFnZSk7CisJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwogCQkJcGFnZSA9
IHdwYWdlOwogCQl9CiAJfQpAQCAtMTgzMSw3ICsxODMxLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwo
a3ZtX3JlbGVhc2VfcGFnZV9jbGVhbik7CiB2b2lkIGt2bV9yZWxlYXNlX3Bmbl9jbGVhbihrdm1f
cGZuX3QgcGZuKQogewogCWlmICghaXNfZXJyb3Jfbm9zbG90X3BmbihwZm4pICYmICFrdm1faXNf
cmVzZXJ2ZWRfcGZuKHBmbikpCi0JCXB1dF9wYWdlKHBmbl90b19wYWdlKHBmbikpOworCQlwdXRf
dXNlcl9wYWdlKHBmbl90b19wYWdlKHBmbikpOwogfQogRVhQT1JUX1NZTUJPTF9HUEwoa3ZtX3Jl
bGVhc2VfcGZuX2NsZWFuKTsKIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
