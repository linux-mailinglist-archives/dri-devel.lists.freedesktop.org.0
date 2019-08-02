Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978437EEF8
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973E66ED33;
	Fri,  2 Aug 2019 08:19:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BCDD6E863;
 Fri,  2 Aug 2019 02:20:18 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so35239394pgj.7;
 Thu, 01 Aug 2019 19:20:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8SOviSW3O4erJ4o/T7vOdTDRu8uyyXM9kIDmKsHyj7c=;
 b=NgWhNtp5Zp7l5rZ+Q4jSkUegquZECMis6rTgtm0IfpYoDK8FhrL84DKAzNwDZ+b7IH
 uJyYxriZx7KH4rWua4eFdL1NwMwpdVN6HA3Qerbm8zBBrbDo7085bJIeFjtgJlPUMdJ0
 FMe1WQu7tNr3PbGR/TP5HSLwojm8qmeSoD4gwxqTaqkZpLWBK/zMYVp46iQAw3KYfB1n
 E4fOUjc034/wJim7xxTFXOC2lJkC/SnVotNgKCJGkkaS2mdBlrcXFtXJ8epFb211/HBR
 S+ywbT4sSVWiHASAWa8V2GH2M0mLJZMv8qvDgVhoqEY6F2M8rTbHM+6TgA/OvHpYB769
 imCw==
X-Gm-Message-State: APjAAAXajGaWbUi/N+js/7u2ndQJeKkqdOkLvZKnPy34CIGcq3iVFrgu
 Y/y+JBjkoA0crc/aTSgqbkU=
X-Google-Smtp-Source: APXvYqy6SxWBaLdRR2vg6Lx/woJAETS/7eDG5dTzML6C7DLLIiEKJ1wWpgVv8K7hxMNjNoQ+Y+s8Dw==
X-Received: by 2002:a17:90a:8c92:: with SMTP id
 b18mr1836391pjo.97.1564712418017; 
 Thu, 01 Aug 2019 19:20:18 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.16
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:17 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/34] x86/kvm: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:35 -0700
Message-Id: <20190802022005.5117-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190802022005.5117-1-jhubbard@nvidia.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8SOviSW3O4erJ4o/T7vOdTDRu8uyyXM9kIDmKsHyj7c=;
 b=fX9VH11/xtmCZY5ktyfRXv+8oFT24qnzRAke9R5fEGSeD2IzOy84ZG8im/eaEUg8Lt
 YkXZtAgFC41AXSsr/ysnzaRAFRybM7sVVSGjTeMscCtwe6TgKQtIwxVTNVhX+CyOlaHj
 zyT65gbiAfpxTAt1YaJp886/lI6PgypiCjw7omXplGhR0qwXivcLAeNmtsNmtXQS2+4w
 xqKa+JcZGRrR5eWJB589WBbm/hXzKEauxkOa/UURNDAyCoi6UPYtZRE7atesr45WwiIq
 ErXdMxUJmMSia9/QMT7Nme9zP4x0BmIDxW3018QpZobBFVGv7P1VjjU6MaObsA2EybjP
 VU2g==
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
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
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
Lm9yZz4KQ2M6IFBhb2xvIEJvbnppbmkgPHBib256aW5pQHJlZGhhdC5jb20+CkNjOiAiUmFkaW0g
S3LEjW3DocWZIiA8cmtyY21hckByZWRoYXQuY29tPgpDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4
QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVkaGF0LmNvbT4KQ2M6ICJI
LiBQZXRlciBBbnZpbiIgPGhwYUB6eXRvci5jb20+CkNjOiB4ODZAa2VybmVsLm9yZwpDYzoga3Zt
QHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+Ci0tLQogYXJjaC94ODYva3ZtL3N2bS5jICB8IDQgKystLQogdmlydC9rdm0va3Zt
X21haW4uYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC94ODYva3ZtL3N2bS5jIGIvYXJjaC94ODYva3Zt
L3N2bS5jCmluZGV4IDdlYWZjNjkwNzg2MS4uZmY5M2M5MjNlZDM2IDEwMDY0NAotLS0gYS9hcmNo
L3g4Ni9rdm0vc3ZtLmMKKysrIGIvYXJjaC94ODYva3ZtL3N2bS5jCkBAIC0xODI3LDcgKzE4Mjcs
NyBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKipzZXZfcGluX21lbW9yeShzdHJ1Y3Qga3ZtICprdm0s
IHVuc2lnbmVkIGxvbmcgdWFkZHIsCiAKIGVycjoKIAlpZiAobnBpbm5lZCA+IDApCi0JCXJlbGVh
c2VfcGFnZXMocGFnZXMsIG5waW5uZWQpOworCQlwdXRfdXNlcl9wYWdlcyhwYWdlcywgbnBpbm5l
ZCk7CiAKIAlrdmZyZWUocGFnZXMpOwogCXJldHVybiBOVUxMOwpAQCAtMTgzOCw3ICsxODM4LDcg
QEAgc3RhdGljIHZvaWQgc2V2X3VucGluX21lbW9yeShzdHJ1Y3Qga3ZtICprdm0sIHN0cnVjdCBw
YWdlICoqcGFnZXMsCiB7CiAJc3RydWN0IGt2bV9zZXZfaW5mbyAqc2V2ID0gJnRvX2t2bV9zdm0o
a3ZtKS0+c2V2X2luZm87CiAKLQlyZWxlYXNlX3BhZ2VzKHBhZ2VzLCBucGFnZXMpOworCXB1dF91
c2VyX3BhZ2VzKHBhZ2VzLCBucGFnZXMpOwogCWt2ZnJlZShwYWdlcyk7CiAJc2V2LT5wYWdlc19s
b2NrZWQgLT0gbnBhZ2VzOwogfQpkaWZmIC0tZ2l0IGEvdmlydC9rdm0va3ZtX21haW4uYyBiL3Zp
cnQva3ZtL2t2bV9tYWluLmMKaW5kZXggODg3ZjNiMGMyYjYwLi40YjZhNTk2ZWE4ZTkgMTAwNjQ0
Ci0tLSBhL3ZpcnQva3ZtL2t2bV9tYWluLmMKKysrIGIvdmlydC9rdm0va3ZtX21haW4uYwpAQCAt
MTQ5OSw3ICsxNDk5LDcgQEAgc3RhdGljIGludCBodmFfdG9fcGZuX3Nsb3codW5zaWduZWQgbG9u
ZyBhZGRyLCBib29sICphc3luYywgYm9vbCB3cml0ZV9mYXVsdCwKIAogCQlpZiAoX19nZXRfdXNl
cl9wYWdlc19mYXN0KGFkZHIsIDEsIDEsICZ3cGFnZSkgPT0gMSkgewogCQkJKndyaXRhYmxlID0g
dHJ1ZTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAkJCXBh
Z2UgPSB3cGFnZTsKIAkJfQogCX0KQEAgLTE4MzEsNyArMTgzMSw3IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGt2bV9yZWxlYXNlX3BhZ2VfY2xlYW4pOwogdm9pZCBrdm1fcmVsZWFzZV9wZm5fY2xlYW4o
a3ZtX3Bmbl90IHBmbikKIHsKIAlpZiAoIWlzX2Vycm9yX25vc2xvdF9wZm4ocGZuKSAmJiAha3Zt
X2lzX3Jlc2VydmVkX3BmbihwZm4pKQotCQlwdXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKKwkJ
cHV0X3VzZXJfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGt2
bV9yZWxlYXNlX3Bmbl9jbGVhbik7CiAKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
