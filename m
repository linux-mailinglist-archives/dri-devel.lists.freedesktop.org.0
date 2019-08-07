Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E22845D4
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC6A86E65C;
	Wed,  7 Aug 2019 07:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 187CC890B1;
 Wed,  7 Aug 2019 01:34:27 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i189so42499665pfg.10;
 Tue, 06 Aug 2019 18:34:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=tjK5/x45zSc+l1uRuikdUQkIk058QHKfX3x9zaKEtQ0ahIV0E5esqRXfgDoTz4e8Vd
 UkVzzQUdQTEEmXZGxobStJG6TjFFxADCTfrGFH4Wp6spBh4SfkW6D8AZ2GdFHRykP5hE
 u9Xr22vLqx/VJRhK5X0naFvX03hFR5IxsPX57KULnjl8+TmjevuvvuqjDqS7Gxkgrm29
 vAsn2uFNHMDF16MzEfSFkYQ2P0Obj6ywjSEKK3cM7WhaS2TSndz0cXvFh63qbnei0A+r
 9Ld5deppPSL4RIeTXg90SuOudgzxUHm4hwc32ts0Q/dp8W1rAgZv+omx++Yv7ZSHCA2E
 rgVQ==
X-Gm-Message-State: APjAAAUrFD54Piiccawiey4LDW1QGYW+PxwQU8XTVUD2yG+k/elXgaW7
 aTK4qfJypomuAgNRPechA1M=
X-Google-Smtp-Source: APXvYqz+78FWPbJakrK1ZelWQJSg29Gh/RFKsj1GJIoNKea8JqaCLYMVGyBI1IWh4QFTdizL46lHtA==
X-Received: by 2002:a65:610a:: with SMTP id z10mr5605978pgu.178.1565141666704; 
 Tue, 06 Aug 2019 18:34:26 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:26 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 26/41] futex: convert put_page() to put_user_page*()
Date: Tue,  6 Aug 2019 18:33:25 -0700
Message-Id: <20190807013340.9706-27-jhubbard@nvidia.com>
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
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=ZAOMcyqaxqY643ITrRXBO6KWZEv0BPrbx5tJQbPH7rHQpilJpWZFaQqivaW1dFVk9n
 HEg+YPfjTMvoOIccb/08xfn9NKdsR6RZrkMFQVLviReHqdXnWL+vc4R4t0ltPC+hbt68
 VA4jLMoR95CN/y6sAkP8CqnObqsDT6qKWV75L660iR7mpVuhSyRR/4cQnMVcKpvgWZXu
 ppOap2XKxusMXjt7xI2vgsY0f8KkQAj/hv5RrF9v3DRsqTv3I7ksuzgSRnKVipJSmOcw
 MASa+XFQrV8LVi8afesATNPV3nj9fqATOCuf2yKuf9L1MVFlsmCg+cL6q2lyis0vQrGP
 pY7g==
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
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Darren Hart <dvhart@infradead.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-crypto@vger.kernel.org,
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
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogVGhvbWFz
IEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+CkNjOiBJbmdvIE1vbG5hciA8bWluZ29AcmVk
aGF0LmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IERh
cnJlbiBIYXJ0IDxkdmhhcnRAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGtlcm5lbC9mdXRleC5jIHwgMTAgKysrKyst
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9rZXJuZWwvZnV0ZXguYyBiL2tlcm5lbC9mdXRleC5jCmluZGV4IDZkNTA3Mjhl
ZjJlNy4uNGI0Y2FlNThlYzU3IDEwMDY0NAotLS0gYS9rZXJuZWwvZnV0ZXguYworKysgYi9rZXJu
ZWwvZnV0ZXguYwpAQCAtNjIzLDcgKzYyMyw3IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAq
dWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAJ
CWxvY2tfcGFnZShwYWdlKTsKIAkJc2htZW1fc3dpenpsZWQgPSBQYWdlU3dhcENhY2hlKHBhZ2Up
IHx8IHBhZ2UtPm1hcHBpbmc7CiAJCXVubG9ja19wYWdlKHBhZ2UpOwotCQlwdXRfcGFnZShwYWdl
KTsKKwkJcHV0X3VzZXJfcGFnZShwYWdlKTsKIAogCQlpZiAoc2htZW1fc3dpenpsZWQpCiAJCQln
b3RvIGFnYWluOwpAQCAtNjc1LDcgKzY3NSw3IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAq
dWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAK
IAkJaWYgKFJFQURfT05DRShwYWdlLT5tYXBwaW5nKSAhPSBtYXBwaW5nKSB7CiAJCQlyY3VfcmVh
ZF91bmxvY2soKTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsK
IAogCQkJZ290byBhZ2FpbjsKIAkJfQpAQCAtNjgzLDcgKzY4Myw3IEBAIGdldF9mdXRleF9rZXko
dTMyIF9fdXNlciAqdWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBmdXRleF9rZXkgKmtleSwgZW51
bSBmdXRleF9hCiAJCWlub2RlID0gUkVBRF9PTkNFKG1hcHBpbmctPmhvc3QpOwogCQlpZiAoIWlu
b2RlKSB7CiAJCQlyY3VfcmVhZF91bmxvY2soKTsKLQkJCXB1dF9wYWdlKHBhZ2UpOworCQkJcHV0
X3VzZXJfcGFnZShwYWdlKTsKIAogCQkJZ290byBhZ2FpbjsKIAkJfQpAQCAtNzAyLDcgKzcwMiw3
IEBAIGdldF9mdXRleF9rZXkodTMyIF9fdXNlciAqdWFkZHIsIGludCBmc2hhcmVkLCB1bmlvbiBm
dXRleF9rZXkgKmtleSwgZW51bSBmdXRleF9hCiAJCSAqLwogCQlpZiAoIWF0b21pY19pbmNfbm90
X3plcm8oJmlub2RlLT5pX2NvdW50KSkgewogCQkJcmN1X3JlYWRfdW5sb2NrKCk7Ci0JCQlwdXRf
cGFnZShwYWdlKTsKKwkJCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAKIAkJCWdvdG8gYWdhaW47CiAJ
CX0KQEAgLTcyMyw3ICs3MjMsNyBAQCBnZXRfZnV0ZXhfa2V5KHUzMiBfX3VzZXIgKnVhZGRyLCBp
bnQgZnNoYXJlZCwgdW5pb24gZnV0ZXhfa2V5ICprZXksIGVudW0gZnV0ZXhfYQogCX0KIAogb3V0
OgotCXB1dF9wYWdlKHBhZ2UpOworCXB1dF91c2VyX3BhZ2UocGFnZSk7CiAJcmV0dXJuIGVycjsK
IH0KIAotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
