Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AFA7EF08
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FEC76ED3E;
	Fri,  2 Aug 2019 08:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C11A06E862;
 Fri,  2 Aug 2019 02:20:49 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p184so35148623pfp.7;
 Thu, 01 Aug 2019 19:20:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=tuYJYr5V+EI/Vz4mU7uSKTT+uzMD9iIzrVSnw8W8tvG+9Mxldguwq/GBrFfuxxwyyt
 UuZqrX+TYkGxBO+22tD0gUTNiplSZiKh38weZ7WQZDpefzJqFTttLbZ9/8Z4CiT11ZTH
 oOwXRLkbtRWCvEn0/fY14nXv6CjJvV5Ti3Yrz48562WsjfMZMDmBlVrK7VzXTnzZR6Aq
 RB4vmZbJfUygrZo7D303dFubP8Fie7M5Xf285GvDLBfCfyCSodRnSqDiFK4dTUk7rkb/
 lpied4g/6qaEcBqYOViPpjiYwPRjfnBw78v/zRnUGXEiv0OxlutFFHFeshf7mf/U6xWy
 cH3A==
X-Gm-Message-State: APjAAAUHTXsFxI48qs49PK6amxrlEffIDOEbEqgRpyJlCxH5ySjxsPs+
 DqG3nwPR+2GXYxAWstshIkA=
X-Google-Smtp-Source: APXvYqyQ9NWbm7e7UjvOHtMhAwjS+tkI0uFYNRjX3KlyXdyqOSjy3adbw2n2ONz+amcM+RqqbPvknQ==
X-Received: by 2002:a17:90a:cb15:: with SMTP id
 z21mr1894788pjt.87.1564712449418; 
 Thu, 01 Aug 2019 19:20:49 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u9sm38179744pgc.5.2019.08.01.19.20.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 01 Aug 2019 19:20:48 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 24/34] futex: convert put_page() to put_user_page*()
Date: Thu,  1 Aug 2019 19:19:55 -0700
Message-Id: <20190802022005.5117-25-jhubbard@nvidia.com>
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
 bh=rRiJNzkH0bRoPJKYXoQcsROADD9YH4USeXVLEsmAa1E=;
 b=IdQZjyJhMTiA3ru+rOrbTXLCRfg1Iz7YPF+8DSWpdWDcWtOO1jwAD+njJSqb4AFsL3
 BoorK7WVXpk5wvzf+3MNWsWlqvxT2AU71m913kuKWpgnoA+0ZYT8hPv0DG2k2t5CL0So
 4HfYIB1+xctKU8nZMy0TNVHkmmwgfvFDwPBOEjDSZMguKyYiKdAvH/kYmRGOOCm1PmW7
 4QVOBE2D85KD1ebTOdlBPaqm/TGzFf20gzANQLnGH2MHePv/KbpSRa5elxYK3OTWVg7W
 lX3umVSebAxAiH6LaR7v6UhLbExl0YmQ1qyvKE73k3aH42K6tSy55ZxlEvZWhHEAZhKs
 EwnQ==
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
