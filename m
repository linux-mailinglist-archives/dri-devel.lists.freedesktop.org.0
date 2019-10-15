Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2401D897E
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 09:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC15D6E8CE;
	Wed, 16 Oct 2019 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3776E87E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 18:16:23 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id w8so9961173plq.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 11:16:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GMW6u8sAEpasPVClwfBBYlElWNrrf0/DwLqwZuYcSQY=;
 b=Pt1kFkDnszDjWn9jHlIV7QfRiHgTYKA0n35iuJve9jQHJQBw0KdlZH0+17EoD5EcEx
 8A9M5ssXKVxpDJCNvUTGjd8qINCxUyIzXf+SCQH4J440ibjkHFUCuRCmiDPdL6quyhnw
 cmSlZJ9sZPxSz2T/1Z04SNKcL0IHfM9sXUptRQVRxy5WpUrkjmV7BU543gDEqD7yk+EJ
 Cvti14SCxxhbvxhTVecSPDGuE1BNOPU6puS999vp6asbzCTJXhDh+9yF2XjPd+cJAbCh
 1cZtUhJ9AxyUjGB8hrSekR/waFOqH/b7TwnCOC9O/1CTs/rXoQ/Z14r5eu5/B+AzOvPT
 WA3A==
X-Gm-Message-State: APjAAAXMDts3zLO2bRqn/HBYuTyAOa7Nl1WHbYDOWPLdZygmdaRtHPu0
 CVnHXZuTgle+KgcB0nalkxB7vw==
X-Google-Smtp-Source: APXvYqyhe/t6Rp9RdcodgUXqjHqLoBMW/iEiC3lVKeBbOWy+tiRj0M2CZprzUCvqWIdC9clgqoP/Uw==
X-Received: by 2002:a17:902:8689:: with SMTP id
 g9mr36459912plo.131.1571163382804; 
 Tue, 15 Oct 2019 11:16:22 -0700 (PDT)
Received: from ziepe.ca ([24.114.26.129])
 by smtp.gmail.com with ESMTPSA id 206sm21017956pge.80.2019.10.15.11.16.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 15 Oct 2019 11:16:22 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1iKRJT-0002Bm-7p; Tue, 15 Oct 2019 15:12:51 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH hmm 01/15] mm/mmu_notifier: define the header pre-processor
 parts even if disabled
Date: Tue, 15 Oct 2019 15:12:28 -0300
Message-Id: <20191015181242.8343-2-jgg@ziepe.ca>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015181242.8343-1-jgg@ziepe.ca>
References: <20191015181242.8343-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 16 Oct 2019 07:33:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GMW6u8sAEpasPVClwfBBYlElWNrrf0/DwLqwZuYcSQY=;
 b=M2J/KnGOO/ynYpeFySRiBudsUiTvI2FrRfaB+aH7OnKlnUucmp2R4RQ3z95+mIc56C
 +g20pMBoKXyb31P9hQPfxdcXUYUvJHGoSxWwdPz8PdPEImr03JRyocWO5fTlrvE6O5ys
 ro8e9KyWA4yi36wrt+mpCwP6ZvL3AhynqBci5ewDZ/MRFeTdMgqY3ltqTfHL1st2ARtx
 hIxfwbvsZGs6rxOwg2BlTfWXb/3h9ed3xReb75tByFaMPai/ZH2dj9CAdDpRfbgUhcFQ
 eWSBu6EU3iiU3V7B68KEKG3nfNBpW9NI3yjcV1rsJhRwjcjZU7sLp7YJ1SVCc9CD5bJI
 o3SQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
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
bm90aWZpZXJfbW0gaXMgcHJpdmF0ZSB0byBtbXVfbm90aWZpZXIuYywgbW92ZSBpdC4KClNpZ25l
ZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBpbmNsdWRl
L2xpbnV4L21tdV9ub3RpZmllci5oIHwgNDYgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tCiBtbS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgIHwgMTMgKysrKysrKysrKwogMiBm
aWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90
aWZpZXIuaAppbmRleCAxYmQ4ZTZhMDlhM2MyNy4uMTJiZDYwM2QzMThjZTcgMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbXVfbm90
aWZpZXIuaApAQCAtNyw4ICs3LDkgQEAKICNpbmNsdWRlIDxsaW51eC9tbV90eXBlcy5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3NyY3UuaD4KIAorc3RydWN0IG1tdV9ub3RpZmllcl9tbTsKIHN0cnVjdCBt
bXVfbm90aWZpZXI7Ci1zdHJ1Y3QgbW11X25vdGlmaWVyX29wczsKK3N0cnVjdCBtbXVfbm90aWZp
ZXJfcmFuZ2U7CiAKIC8qKgogICogZW51bSBtbXVfbm90aWZpZXJfZXZlbnQgLSByZWFzb24gZm9y
IHRoZSBtbXUgbm90aWZpZXIgY2FsbGJhY2sKQEAgLTQwLDM2ICs0MSw4IEBAIGVudW0gbW11X25v
dGlmaWVyX2V2ZW50IHsKIAlNTVVfTk9USUZZX1NPRlRfRElSVFksCiB9OwogCi0jaWZkZWYgQ09O
RklHX01NVV9OT1RJRklFUgotCi0jaWZkZWYgQ09ORklHX0xPQ0tERVAKLWV4dGVybiBzdHJ1Y3Qg
bG9ja2RlcF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXA7Ci0j
ZW5kaWYKLQotLyoKLSAqIFRoZSBtbXUgbm90aWZpZXJfbW0gc3RydWN0dXJlIGlzIGFsbG9jYXRl
ZCBhbmQgaW5zdGFsbGVkIGluCi0gKiBtbS0+bW11X25vdGlmaWVyX21tIGluc2lkZSB0aGUgbW1f
dGFrZV9hbGxfbG9ja3MoKSBwcm90ZWN0ZWQKLSAqIGNyaXRpY2FsIHNlY3Rpb24gYW5kIGl0J3Mg
cmVsZWFzZWQgb25seSB3aGVuIG1tX2NvdW50IHJlYWNoZXMgemVybwotICogaW4gbW1kcm9wKCku
Ci0gKi8KLXN0cnVjdCBtbXVfbm90aWZpZXJfbW0gewotCS8qIGFsbCBtbXUgbm90aWZpZXJzIHJl
Z2lzdGVyZCBpbiB0aGlzIG1tIGFyZSBxdWV1ZWQgaW4gdGhpcyBsaXN0ICovCi0Jc3RydWN0IGhs
aXN0X2hlYWQgbGlzdDsKLQkvKiB0byBzZXJpYWxpemUgdGhlIGxpc3QgbW9kaWZpY2F0aW9ucyBh
bmQgaGxpc3RfdW5oYXNoZWQgKi8KLQlzcGlubG9ja190IGxvY2s7Ci19OwotCiAjZGVmaW5lIE1N
VV9OT1RJRklFUl9SQU5HRV9CTE9DS0FCTEUgKDEgPDwgMCkKIAotc3RydWN0IG1tdV9ub3RpZmll
cl9yYW5nZSB7Ci0Jc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Ci0Jc3RydWN0IG1tX3N0cnVj
dCAqbW07Ci0JdW5zaWduZWQgbG9uZyBzdGFydDsKLQl1bnNpZ25lZCBsb25nIGVuZDsKLQl1bnNp
Z25lZCBmbGFnczsKLQllbnVtIG1tdV9ub3RpZmllcl9ldmVudCBldmVudDsKLX07Ci0KIHN0cnVj
dCBtbXVfbm90aWZpZXJfb3BzIHsKIAkvKgogCSAqIENhbGxlZCBlaXRoZXIgYnkgbW11X25vdGlm
aWVyX3VucmVnaXN0ZXIgb3Igd2hlbiB0aGUgbW0gaXMKQEAgLTI0OSw2ICsyMjIsMjEgQEAgc3Ry
dWN0IG1tdV9ub3RpZmllciB7CiAJdW5zaWduZWQgaW50IHVzZXJzOwogfTsKIAorI2lmZGVmIENP
TkZJR19NTVVfTk9USUZJRVIKKworI2lmZGVmIENPTkZJR19MT0NLREVQCitleHRlcm4gc3RydWN0
IGxvY2tkZXBfbWFwIF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwOwor
I2VuZGlmCisKK3N0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgeworCXN0cnVjdCB2bV9hcmVhX3N0
cnVjdCAqdm1hOworCXN0cnVjdCBtbV9zdHJ1Y3QgKm1tOworCXVuc2lnbmVkIGxvbmcgc3RhcnQ7
CisJdW5zaWduZWQgbG9uZyBlbmQ7CisJdW5zaWduZWQgZmxhZ3M7CisJZW51bSBtbXVfbm90aWZp
ZXJfZXZlbnQgZXZlbnQ7Cit9OworCiBzdGF0aWMgaW5saW5lIGludCBtbV9oYXNfbm90aWZpZXJz
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQogewogCXJldHVybiB1bmxpa2VseShtbS0+bW11X25vdGlm
aWVyX21tKTsKZGlmZiAtLWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlmaWVy
LmMKaW5kZXggN2ZkZTg4Njk1ZjM1ZDYuLjM2NzY3MGNmZDAyYjdiIDEwMDY0NAotLS0gYS9tbS9t
bXVfbm90aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMjcsNiArMjcsMTkgQEAg
c3RydWN0IGxvY2tkZXBfbWFwIF9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRf
bWFwID0gewogfTsKICNlbmRpZgogCisvKgorICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1
cmUgaXMgYWxsb2NhdGVkIGFuZCBpbnN0YWxsZWQgaW4KKyAqIG1tLT5tbXVfbm90aWZpZXJfbW0g
aW5zaWRlIHRoZSBtbV90YWtlX2FsbF9sb2NrcygpIHByb3RlY3RlZAorICogY3JpdGljYWwgc2Vj
dGlvbiBhbmQgaXQncyByZWxlYXNlZCBvbmx5IHdoZW4gbW1fY291bnQgcmVhY2hlcyB6ZXJvCisg
KiBpbiBtbWRyb3AoKS4KKyAqLworc3RydWN0IG1tdV9ub3RpZmllcl9tbSB7CisJLyogYWxsIG1t
dSBub3RpZmllcnMgcmVnaXN0ZXJlZCBpbiB0aGlzIG1tIGFyZSBxdWV1ZWQgaW4gdGhpcyBsaXN0
ICovCisJc3RydWN0IGhsaXN0X2hlYWQgbGlzdDsKKwkvKiB0byBzZXJpYWxpemUgdGhlIGxpc3Qg
bW9kaWZpY2F0aW9ucyBhbmQgaGxpc3RfdW5oYXNoZWQgKi8KKwlzcGlubG9ja190IGxvY2s7Cit9
OworCiAvKgogICogVGhpcyBmdW5jdGlvbiBjYW4ndCBydW4gY29uY3VycmVudGx5IGFnYWluc3Qg
bW11X25vdGlmaWVyX3JlZ2lzdGVyCiAgKiBiZWNhdXNlIG1tLT5tbV91c2VycyA+IDAgZHVyaW5n
IG1tdV9ub3RpZmllcl9yZWdpc3RlciBhbmQgZXhpdF9tbWFwCi0tIAoyLjIzLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
