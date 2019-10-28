Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2061BE7B13
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 22:08:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BCBF6EA5F;
	Mon, 28 Oct 2019 21:08:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5F989CBC
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 20:10:45 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id l3so5993635qtp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 13:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l1vmkJOGIS2JMKSg4aauB9VEgyiPOw7K+GpcfRESIoI=;
 b=F0EQBV+G/7ByVb2DOs8+YAS+y7oUBDlrZk8YsA+43153v2jQXitSd2qrpMCBI69D0h
 oiWkkmr7Y27N1LO71U9l036ckyGWQ/DVm4Sd50SB9klS6qjLk5GWAyl5hx2uIKr5/sQr
 D35Uus/BgDbP+k2enlONokveIDRe2Mh4QMXDvsXCN34FPe5iemdxsC8bb8IVe1qxfuj2
 A4LP3bAp/BJSkxZcIbLjqWI55EwFzNMaqCGme91iDEmcfZhScgSLCtLkpCTuRCosDlqJ
 LiUwlBu4GeJmc40K2m/uDG/PLS0ZRIS0lcYKTr7vvcG/XyWQqgQD4gnbge7WfpKm68bv
 owoQ==
X-Gm-Message-State: APjAAAWU/EVEQ6v49X+09NLGuJ6Db46G5IqVTqlo2gwVKo+ntG8YZ4en
 dQRaTzlEZxw7tjDSEBhsswqRjA==
X-Google-Smtp-Source: APXvYqxTDtu71nCg9F2jZDXMIik3Sf1CZYtmdCLMzyep9mn/F9AraC2jZajJbEZtCjPA2P8VltCn3g==
X-Received: by 2002:ad4:480e:: with SMTP id g14mr18897959qvy.39.1572293444691; 
 Mon, 28 Oct 2019 13:10:44 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-162-113-180.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.113.180])
 by smtp.gmail.com with ESMTPSA id m63sm6163383qkc.72.2019.10.28.13.10.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 13:10:43 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iPBLf-0001g4-2o; Mon, 28 Oct 2019 17:10:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Felix.Kuehling@amd.com
Subject: [PATCH v2 01/15] mm/mmu_notifier: define the header pre-processor
 parts even if disabled
Date: Mon, 28 Oct 2019 17:10:18 -0300
Message-Id: <20191028201032.6352-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191028201032.6352-1-jgg@ziepe.ca>
References: <20191028201032.6352-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 28 Oct 2019 21:07:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l1vmkJOGIS2JMKSg4aauB9VEgyiPOw7K+GpcfRESIoI=;
 b=LU+bbOjd0cz1dQjUVAwpTjm6I0OdzLxMOxP5OoMyKCWRmK92PNmFNIQUKjbHoE0awh
 pvseSw0PInn+OF/81alAmqaBN3yHzoSoswny6AKzKgyRT2YkUzVM+paRmtol46aPrKhB
 QMMBDPPQTSaHLetLANbdYa3ssCHD20beSUMzU9gm9hiKbchM7fSukllx4483KCxtEhyN
 0Mm9M8XrqlM/44ykUJTpSDhYdIpysgD+jWTg7Bkp6a2q7tAw/WZ08cKn9lLaF//6ovXU
 MNbPAJvpBLVztUrMAbJtNDCSkUdk4JNS5LcIXoJukchmgRsl1Gm23FzQw1GvQQ1wT1Cn
 HISw==
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
Cc: Juergen Gross <jgross@suse.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKTm93IHRoYXQgd2UgaGF2
ZSBLRVJORUxfSEVBREVSX1RFU1QgYWxsIGhlYWRlcnMgYXJlIGdlbmVyYWxseSBjb21waWxlCnRl
c3RlZCwgc28gcmVseWluZyBvbiBtYWtlZmlsZSB0cmlja3MgdG8gYXZvaWQgY29tcGlsaW5nIGNv
ZGUgdGhhdCBkZXBlbmRzCm9uIENPTkZJR19NTVVfTk9USUZJRVIgaXMgbW9yZSBhbm5veWluZy4K
Ckluc3RlYWQgZm9sbG93IHRoZSB1c3VhbCBwYXR0ZXJuIGFuZCBwcm92aWRlIG1vc3Qgb2YgdGhl
IGhlYWRlciB3aXRoIG9ubHkKdGhlIGZ1bmN0aW9ucyBzdHViYmVkIG91dCB3aGVuIENPTkZJR19N
TVVfTk9USUZJRVIgaXMgZGlzYWJsZWQuIFRoaXMKZW5zdXJlcyBjb2RlIGNvbXBpbGVzIG5vIG1h
dHRlciB3aGF0IHRoZSBjb25maWcgc2V0dGluZyBpcy4KCldoaWxlIGhlcmUsIHN0cnVjdCBtbXVf
bm90aWZpZXJfbW0gaXMgcHJpdmF0ZSB0byBtbXVfbm90aWZpZXIuYywgbW92ZSBpdC4KClJldmll
d2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIGluY2x1ZGUvbGludXgv
bW11X25vdGlmaWVyLmggfCA0NiArKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0K
IG1tL21tdV9ub3RpZmllci5jICAgICAgICAgICAgfCAxMyArKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5o
CmluZGV4IDFiZDhlNmEwOWEzYzI3Li4xMmJkNjAzZDMxOGNlNyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9tbXVfbm90aWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5o
CkBAIC03LDggKzcsOSBAQAogI2luY2x1ZGUgPGxpbnV4L21tX3R5cGVzLmg+CiAjaW5jbHVkZSA8
bGludXgvc3JjdS5oPgogCitzdHJ1Y3QgbW11X25vdGlmaWVyX21tOwogc3RydWN0IG1tdV9ub3Rp
ZmllcjsKLXN0cnVjdCBtbXVfbm90aWZpZXJfb3BzOworc3RydWN0IG1tdV9ub3RpZmllcl9yYW5n
ZTsKIAogLyoqCiAgKiBlbnVtIG1tdV9ub3RpZmllcl9ldmVudCAtIHJlYXNvbiBmb3IgdGhlIG1t
dSBub3RpZmllciBjYWxsYmFjawpAQCAtNDAsMzYgKzQxLDggQEAgZW51bSBtbXVfbm90aWZpZXJf
ZXZlbnQgewogCU1NVV9OT1RJRllfU09GVF9ESVJUWSwKIH07CiAKLSNpZmRlZiBDT05GSUdfTU1V
X05PVElGSUVSCi0KLSNpZmRlZiBDT05GSUdfTE9DS0RFUAotZXh0ZXJuIHN0cnVjdCBsb2NrZGVw
X21hcCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcDsKLSNlbmRpZgot
Ci0vKgotICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIGFuZCBp
bnN0YWxsZWQgaW4KLSAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2Fs
bF9sb2NrcygpIHByb3RlY3RlZAotICogY3JpdGljYWwgc2VjdGlvbiBhbmQgaXQncyByZWxlYXNl
ZCBvbmx5IHdoZW4gbW1fY291bnQgcmVhY2hlcyB6ZXJvCi0gKiBpbiBtbWRyb3AoKS4KLSAqLwot
c3RydWN0IG1tdV9ub3RpZmllcl9tbSB7Ci0JLyogYWxsIG1tdSBub3RpZmllcnMgcmVnaXN0ZXJk
IGluIHRoaXMgbW0gYXJlIHF1ZXVlZCBpbiB0aGlzIGxpc3QgKi8KLQlzdHJ1Y3QgaGxpc3RfaGVh
ZCBsaXN0OwotCS8qIHRvIHNlcmlhbGl6ZSB0aGUgbGlzdCBtb2RpZmljYXRpb25zIGFuZCBobGlz
dF91bmhhc2hlZCAqLwotCXNwaW5sb2NrX3QgbG9jazsKLX07Ci0KICNkZWZpbmUgTU1VX05PVElG
SUVSX1JBTkdFX0JMT0NLQUJMRSAoMSA8PCAwKQogCi1zdHJ1Y3QgbW11X25vdGlmaWVyX3Jhbmdl
IHsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLQlzdHJ1Y3QgbW1fc3RydWN0ICptbTsK
LQl1bnNpZ25lZCBsb25nIHN0YXJ0OwotCXVuc2lnbmVkIGxvbmcgZW5kOwotCXVuc2lnbmVkIGZs
YWdzOwotCWVudW0gbW11X25vdGlmaWVyX2V2ZW50IGV2ZW50OwotfTsKLQogc3RydWN0IG1tdV9u
b3RpZmllcl9vcHMgewogCS8qCiAJICogQ2FsbGVkIGVpdGhlciBieSBtbXVfbm90aWZpZXJfdW5y
ZWdpc3RlciBvciB3aGVuIHRoZSBtbSBpcwpAQCAtMjQ5LDYgKzIyMiwyMSBAQCBzdHJ1Y3QgbW11
X25vdGlmaWVyIHsKIAl1bnNpZ25lZCBpbnQgdXNlcnM7CiB9OwogCisjaWZkZWYgQ09ORklHX01N
VV9OT1RJRklFUgorCisjaWZkZWYgQ09ORklHX0xPQ0tERVAKK2V4dGVybiBzdHJ1Y3QgbG9ja2Rl
cF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXA7CisjZW5kaWYK
Kworc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSB7CisJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWE7CisJc3RydWN0IG1tX3N0cnVjdCAqbW07CisJdW5zaWduZWQgbG9uZyBzdGFydDsKKwl1bnNp
Z25lZCBsb25nIGVuZDsKKwl1bnNpZ25lZCBmbGFnczsKKwllbnVtIG1tdV9ub3RpZmllcl9ldmVu
dCBldmVudDsKK307CisKIHN0YXRpYyBpbmxpbmUgaW50IG1tX2hhc19ub3RpZmllcnMoc3RydWN0
IG1tX3N0cnVjdCAqbW0pCiB7CiAJcmV0dXJuIHVubGlrZWx5KG1tLT5tbXVfbm90aWZpZXJfbW0p
OwpkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMgYi9tbS9tbXVfbm90aWZpZXIuYwppbmRl
eCA3ZmRlODg2OTVmMzVkNi4uMzY3NjcwY2ZkMDJiN2IgMTAwNjQ0Ci0tLSBhL21tL21tdV9ub3Rp
Zmllci5jCisrKyBiL21tL21tdV9ub3RpZmllci5jCkBAIC0yNyw2ICsyNywxOSBAQCBzdHJ1Y3Qg
bG9ja2RlcF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXAgPSB7
CiB9OwogI2VuZGlmCiAKKy8qCisgKiBUaGUgbW11IG5vdGlmaWVyX21tIHN0cnVjdHVyZSBpcyBh
bGxvY2F0ZWQgYW5kIGluc3RhbGxlZCBpbgorICogbW0tPm1tdV9ub3RpZmllcl9tbSBpbnNpZGUg
dGhlIG1tX3Rha2VfYWxsX2xvY2tzKCkgcHJvdGVjdGVkCisgKiBjcml0aWNhbCBzZWN0aW9uIGFu
ZCBpdCdzIHJlbGVhc2VkIG9ubHkgd2hlbiBtbV9jb3VudCByZWFjaGVzIHplcm8KKyAqIGluIG1t
ZHJvcCgpLgorICovCitzdHJ1Y3QgbW11X25vdGlmaWVyX21tIHsKKwkvKiBhbGwgbW11IG5vdGlm
aWVycyByZWdpc3RlcmVkIGluIHRoaXMgbW0gYXJlIHF1ZXVlZCBpbiB0aGlzIGxpc3QgKi8KKwlz
dHJ1Y3QgaGxpc3RfaGVhZCBsaXN0OworCS8qIHRvIHNlcmlhbGl6ZSB0aGUgbGlzdCBtb2RpZmlj
YXRpb25zIGFuZCBobGlzdF91bmhhc2hlZCAqLworCXNwaW5sb2NrX3QgbG9jazsKK307CisKIC8q
CiAgKiBUaGlzIGZ1bmN0aW9uIGNhbid0IHJ1biBjb25jdXJyZW50bHkgYWdhaW5zdCBtbXVfbm90
aWZpZXJfcmVnaXN0ZXIKICAqIGJlY2F1c2UgbW0tPm1tX3VzZXJzID4gMCBkdXJpbmcgbW11X25v
dGlmaWVyX3JlZ2lzdGVyIGFuZCBleGl0X21tYXAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
