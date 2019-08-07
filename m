Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51051845F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A866E685;
	Wed,  7 Aug 2019 07:27:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED39989A9F;
 Wed,  7 Aug 2019 01:34:34 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id ay6so38635636plb.9;
 Tue, 06 Aug 2019 18:34:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P44t64b1Yt2CczJo6SOAPYnnEfAXhRMhGjbg0YSdFKY=;
 b=egU8CPr517FJwhsQzcJT0vkJNGtm3SCsIRKecdAOxJ/XdJY6O4ZWZOm1dUgzIlBu9a
 zhT3nBKnHza86ZaW2mEVhULtkVyTnOJ/qgZXdkOqCj//ymudGSXXrxsin4FEVRzL3LWG
 SCFSfriFcCsj29LLnmdlMx3i+FuYKKQ3hdo516JQMNxtFo+ZWVberxx4exVGcQEBcVIb
 Bsc9c2BwcUDBIxX89uT+KZPfhRlKW7mSDZZ8d/JVl/p3zuJERKrvSe/lff3je6TmMUop
 5UaAhk99OI5CAMj6Q0eFbi3tRrWlCABydD4k+qYAclCYBjuKO7IbKrwNoAF/MmMkyRPU
 nUAA==
X-Gm-Message-State: APjAAAXSJNp8w28+Qg3VgKLcZNJK+HgSSzHoxKPmTjBtctTuP51+BcXR
 0J82+B73dlfAxs8v+e+xsq4=
X-Google-Smtp-Source: APXvYqw8+L1VoxRPbf6Y+c4qD8GNaA9eNx8R+zkKMbLiZR/mjctguTvKD53OkN4n/knnADLxacIAYA==
X-Received: by 2002:a17:902:7782:: with SMTP id
 o2mr5960829pll.12.1565141674655; 
 Tue, 06 Aug 2019 18:34:34 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:34 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 31/41] mm/process_vm_access.c: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:30 -0700
Message-Id: <20190807013340.9706-32-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P44t64b1Yt2CczJo6SOAPYnnEfAXhRMhGjbg0YSdFKY=;
 b=oYwU8ETglc6KiHkcA0RyRS5vGqCW2i7AIOfUQ1rGo+vD39eROBW26/892d5mL8jCka
 9NN3Xib7WtATsBiYJqkB3ezAv9jDjLgX0Nt2lJwKPO87RMwjfI/ercmqj2pogsz06Wb7
 pt7t+tRi22lEyEbjwYG4pvxEn5EP2upJ7sBYXvkRkx1OZr8K8A0zsi1zsXDmxeKjKGdS
 rd7sOAmNlVKLyRrCXgSP759pVqt58t0Qr3CX/SHM65KMfp9F8GOgkLwibGL9VUlsrg7f
 RCrbiDazxsGGGqq8tug1r4v+hpbk+DodA1qAwxGhZjgi6TOY5xhcloApNp8UIjMczhiZ
 1TFQ==
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
 amd-gfx@lists.freedesktop.org, Ingo Molnar <mingo@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Rashika Kheria <rashika.kheria@gmail.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-rpi-kernel@lists.infradead.org, Jann Horn <jann@thejh.net>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, Lorenzo Stoakes <lstoakes@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, Christopher Yeoh <cyeoh@au1.ibm.com>,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQWwgVmly
byA8dmlyb0B6ZW5pdi5saW51eC5vcmcudWs+CkNjOiBBbmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5n
ZUByZWRoYXQuY29tPgpDYzogQ2hyaXN0b3BoZXIgWWVvaCA8Y3llb2hAYXUxLmlibS5jb20+CkNj
OiBEYXZlIEhhbnNlbiA8ZGF2ZS5oYW5zZW5AbGludXguaW50ZWwuY29tPgpDYzogSGVpa28gQ2Fy
c3RlbnMgPGhlaWtvLmNhcnN0ZW5zQGRlLmlibS5jb20+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29A
a2VybmVsLm9yZz4KQ2M6IEphbm4gSG9ybiA8amFubkB0aGVqaC5uZXQ+CkNjOiBMb3JlbnpvIFN0
b2FrZXMgPGxzdG9ha2VzQGdtYWlsLmNvbT4KQ2M6IE1hdGhpZXUgRGVzbm95ZXJzIDxtYXRoaWV1
LmRlc25veWVyc0BlZmZpY2lvcy5jb20+CkNjOiBNaWtlIFJhcG9wb3J0IDxycHB0QGxpbnV4LnZu
ZXQuaWJtLmNvbT4KQ2M6IFJhc2hpa2EgS2hlcmlhIDxyYXNoaWthLmtoZXJpYUBnbWFpbC5jb20+
ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBt
bS9wcm9jZXNzX3ZtX2FjY2Vzcy5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL3By
b2Nlc3Nfdm1fYWNjZXNzLmMgYi9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCmluZGV4IDM1N2FhN2Jl
ZjZjMC4uNGQyOWQ1NGVjOTNmIDEwMDY0NAotLS0gYS9tbS9wcm9jZXNzX3ZtX2FjY2Vzcy5jCisr
KyBiL21tL3Byb2Nlc3Nfdm1fYWNjZXNzLmMKQEAgLTk2LDcgKzk2LDcgQEAgc3RhdGljIGludCBw
cm9jZXNzX3ZtX3J3X3NpbmdsZV92ZWModW5zaWduZWQgbG9uZyBhZGRyLAogCQlmbGFncyB8PSBG
T0xMX1dSSVRFOwogCiAJd2hpbGUgKCFyYyAmJiBucl9wYWdlcyAmJiBpb3ZfaXRlcl9jb3VudChp
dGVyKSkgewotCQlpbnQgcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7
CisJCWludCBwaW5uZWRfcGFnZXMgPSBtaW4obnJfcGFnZXMsIG1heF9wYWdlc19wZXJfbG9vcCk7
CiAJCWludCBsb2NrZWQgPSAxOwogCQlzaXplX3QgYnl0ZXM7CiAKQEAgLTEwNiwxNCArMTA2LDE1
IEBAIHN0YXRpYyBpbnQgcHJvY2Vzc192bV9yd19zaW5nbGVfdmVjKHVuc2lnbmVkIGxvbmcgYWRk
ciwKIAkJICogY3VycmVudC9jdXJyZW50LT5tbQogCQkgKi8KIAkJZG93bl9yZWFkKCZtbS0+bW1h
cF9zZW0pOwotCQlwYWdlcyA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBh
Z2VzLCBmbGFncywKLQkJCQkJICAgICAgcHJvY2Vzc19wYWdlcywgTlVMTCwgJmxvY2tlZCk7CisJ
CXBpbm5lZF9wYWdlcyA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZSh0YXNrLCBtbSwgcGEsIHBpbm5l
ZF9wYWdlcywKKwkJCQkJCSAgICAgZmxhZ3MsIHByb2Nlc3NfcGFnZXMsIE5VTEwsCisJCQkJCQkg
ICAgICZsb2NrZWQpOwogCQlpZiAobG9ja2VkKQogCQkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsK
LQkJaWYgKHBhZ2VzIDw9IDApCisJCWlmIChwaW5uZWRfcGFnZXMgPD0gMCkKIAkJCXJldHVybiAt
RUZBVUxUOwogCi0JCWJ5dGVzID0gcGFnZXMgKiBQQUdFX1NJWkUgLSBzdGFydF9vZmZzZXQ7CisJ
CWJ5dGVzID0gcGlubmVkX3BhZ2VzICogUEFHRV9TSVpFIC0gc3RhcnRfb2Zmc2V0OwogCQlpZiAo
Ynl0ZXMgPiBsZW4pCiAJCQlieXRlcyA9IGxlbjsKIApAQCAtMTIyLDEwICsxMjMsOSBAQCBzdGF0
aWMgaW50IHByb2Nlc3Nfdm1fcndfc2luZ2xlX3ZlYyh1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkJ
CSB2bV93cml0ZSk7CiAJCWxlbiAtPSBieXRlczsKIAkJc3RhcnRfb2Zmc2V0ID0gMDsKLQkJbnJf
cGFnZXMgLT0gcGFnZXM7Ci0JCXBhICs9IHBhZ2VzICogUEFHRV9TSVpFOwotCQl3aGlsZSAocGFn
ZXMpCi0JCQlwdXRfcGFnZShwcm9jZXNzX3BhZ2VzWy0tcGFnZXNdKTsKKwkJbnJfcGFnZXMgLT0g
cGlubmVkX3BhZ2VzOworCQlwYSArPSBwaW5uZWRfcGFnZXMgKiBQQUdFX1NJWkU7CisJCXB1dF91
c2VyX3BhZ2VzKHByb2Nlc3NfcGFnZXMsIHBpbm5lZF9wYWdlcyk7CiAJfQogCiAJcmV0dXJuIHJj
OwotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
