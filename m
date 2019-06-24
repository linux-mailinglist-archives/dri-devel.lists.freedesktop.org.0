Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7C9524C1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DE76E0A0;
	Tue, 25 Jun 2019 07:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355E989DAB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w9so798389wmd.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MJQSyx5I9WQIuat3hBB7cHn44HQ02+T6fWrOLMHDIpE=;
 b=kznMHNO56V5Qd9oNXqJCt7/pVTcD6Or98ShDYg1/hFzYBlQSMCqOsqclReg5T4/wGY
 NFdSUCkMR9g18czES9Sb1+NqHojcBEnCwmG6f5nn43iqzdvcPxu/+ZiJJySp8bENWKgG
 oWfQ/A9Xt6yqWuaSM3Yh7XjNsHx1cKaZH6JSt+pik4vNKVTThkQsvhACZz6S7Au/XVkI
 CnD/FXeNXrYzF0DigtZEkJ2pXR1qjPuKsobf2jN4J3oDzmRTJnfkn3WpCh3qhB1c+yZt
 19UbbnZ5I7chhK6JustQ5d0UKE4nTcSLDRv4hE6UAz/ecqeuLCs3iKH9kTKHsxYYY+vP
 4/TQ==
X-Gm-Message-State: APjAAAUxDLxFIh0dUZ3Vd1r58osVrDVSfXdsv9E686PRI8HYET1bMEK9
 ayy+BZMrR0j74SnKUA5KjYUvXg==
X-Google-Smtp-Source: APXvYqy/o9BJkcVraqWn87goYHtDioMKUZC2UcYj3qjd4Ok68R0RasKDzib4jR1bwJteEjTWcnZR4g==
X-Received: by 2002:a05:600c:20c3:: with SMTP id
 y3mr17777867wmm.3.1561410124814; 
 Mon, 24 Jun 2019 14:02:04 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id l8sm26977546wrg.40.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6C-0001MC-Qe; Mon, 24 Jun 2019 18:02:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 03/12] mm/hmm: Hold a mmgrab from hmm to mm
Date: Mon, 24 Jun 2019 18:01:01 -0300
Message-Id: <20190624210110.5098-4-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MJQSyx5I9WQIuat3hBB7cHn44HQ02+T6fWrOLMHDIpE=;
 b=oMvQEeOW3jlA/jInbebXvBiNOpipgFRfSGqcRm7zQTy9n0fBZhNWc+HqRdsBGvfoas
 9ZagIA6tsA27jF8jJhsuzXhsn1FXmqG0j5xv4shnb4nwTXoKwmM7oJ2k65yF3t5gXBSE
 xlXz3qHDEErdU0D2pMcseGextk7OdhnOkqInYbmQI1gUO7qrtJE1uX0pyvlz3YlLnknO
 sqCZVvuYR+lhn6UVq6Z9jO7x/rArDqufw9dwJ5VG1vfgusW9/rg/xQREUYZgy4+U1mqN
 JQUgexOwqWQrBjbYL4JVl6Alf5y/LhMUNGKdzg0+gQVKP467Kb+hNL89aBTa4xHO/0eq
 Mg5g==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, Philip Yang <Philip.Yang@amd.com>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKU28gbG9uZyBhcyBhIHN0
cnVjdCBobW0gcG9pbnRlciBleGlzdHMsIHNvIHNob3VsZCB0aGUgc3RydWN0IG1tIGl0IGlzCmxp
bmtlZCB0b28uIEhvbGQgdGhlIG1tZ3JhYigpIGFzIHNvb24gYXMgYSBobW0gaXMgY3JlYXRlZCwg
YW5kIG1tZHJvcCgpIGl0Cm9uY2UgdGhlIGhtbSByZWZjb3VudCBnb2VzIHRvIHplcm8uCgpTaW5j
ZSBtbWRyb3AoKSAoaWUgYSAwIGtyZWYgb24gc3RydWN0IG1tKSBpcyBub3cgaW1wb3NzaWJsZSB3
aXRoIGEgIU5VTEwKbW0tPmhtbSBkZWxldGUgdGhlIGhtbV9obW1fZGVzdHJveSgpLgoKU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTog
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBKb2huIEh1
YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBp
bnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KVGVz
dGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0tCnYyOgogLSBGaXgg
ZXJyb3IgdW53aW5kIHBhdGhzIGluIGhtbV9nZXRfb3JfY3JlYXRlIChKZXJvbWUvSmFzb24pCi0t
LQogaW5jbHVkZS9saW51eC9obW0uaCB8ICAzIC0tLQoga2VybmVsL2ZvcmsuYyAgICAgICB8ICAx
IC0KIG1tL2htbS5jICAgICAgICAgICAgfCAyMiArKysrLS0tLS0tLS0tLS0tLS0tLS0tCiAzIGZp
bGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggMWZiYTY5
NzlhZGY0NjAuLjFkOTdiNmQ2MmM1YmNmIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5o
CisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTU3NywxNCArNTc3LDExIEBAIHN0YXRpYyBp
bmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKIH0KIAog
LyogQmVsb3cgYXJlIGZvciBITU0gaW50ZXJuYWwgdXNlIG9ubHkhIE5vdCB0byBiZSB1c2VkIGJ5
IGRldmljZSBkcml2ZXIhICovCi12b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKTsKLQogc3RhdGljIGlubGluZSB2b2lkIGhtbV9tbV9pbml0KHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tKQogewogCW1tLT5obW0gPSBOVUxMOwogfQogI2Vsc2UgLyogSVNfRU5BQkxFRChDT05GSUdf
SE1NX01JUlJPUikgKi8KLXN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1fZGVzdHJveShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3Qg
bW1fc3RydWN0ICptbSkge30KICNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlSUk9S
KSAqLwogCmRpZmYgLS1naXQgYS9rZXJuZWwvZm9yay5jIGIva2VybmVsL2ZvcmsuYwppbmRleCA3
NTY3NWI5YmY2ZGZkMy4uYzcwNGMzY2VkZWU3OGQgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9mb3JrLmMK
KysrIGIva2VybmVsL2ZvcmsuYwpAQCAtNjczLDcgKzY3Myw2IEBAIHZvaWQgX19tbWRyb3Aoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0pCiAJV0FSTl9PTl9PTkNFKG1tID09IGN1cnJlbnQtPmFjdGl2ZV9t
bSk7CiAJbW1fZnJlZV9wZ2QobW0pOwogCWRlc3Ryb3lfY29udGV4dChtbSk7Ci0JaG1tX21tX2Rl
c3Ryb3kobW0pOwogCW1tdV9ub3RpZmllcl9tbV9kZXN0cm95KG1tKTsKIAljaGVja19tbShtbSk7
CiAJcHV0X3VzZXJfbnMobW0tPnVzZXJfbnMpOwpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9o
bW0uYwppbmRleCAyMmE5N2FkYTEwOGI0ZS4uMDgwYjE3YTJlODdlMmQgMTAwNjQ0Ci0tLSBhL21t
L2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0yMCw2ICsyMCw3IEBACiAjaW5jbHVkZSA8bGludXgv
c3dhcG9wcy5oPgogI2luY2x1ZGUgPGxpbnV4L2h1Z2V0bGIuaD4KICNpbmNsdWRlIDxsaW51eC9t
ZW1yZW1hcC5oPgorI2luY2x1ZGUgPGxpbnV4L3NjaGVkL21tLmg+CiAjaW5jbHVkZSA8bGludXgv
anVtcF9sYWJlbC5oPgogI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBwaW5nLmg+CiAjaW5jbHVkZSA8
bGludXgvbW11X25vdGlmaWVyLmg+CkBAIC03Myw2ICs3NCw3IEBAIHN0YXRpYyBzdHJ1Y3QgaG1t
ICpobW1fZ2V0X29yX2NyZWF0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIAlobW0tPm5vdGlmaWVy
cyA9IDA7CiAJaG1tLT5kZWFkID0gZmFsc2U7CiAJaG1tLT5tbSA9IG1tOworCW1tZ3JhYihobW0t
Pm1tKTsKIAogCXNwaW5fbG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7CiAJaWYgKCFtbS0+aG1t
KQpAQCAtMTAwLDYgKzEwMiw3IEBAIHN0YXRpYyBzdHJ1Y3QgaG1tICpobW1fZ2V0X29yX2NyZWF0
ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSkKIAkJbW0tPmhtbSA9IE5VTEw7CiAJc3Bpbl91bmxvY2so
Jm1tLT5wYWdlX3RhYmxlX2xvY2spOwogZXJyb3I6CisJbW1kcm9wKGhtbS0+bW0pOwogCWtmcmVl
KGhtbSk7CiAJcmV0dXJuIE5VTEw7CiB9CkBAIC0xMjEsNiArMTI0LDcgQEAgc3RhdGljIHZvaWQg
aG1tX2ZyZWUoc3RydWN0IGtyZWYgKmtyZWYpCiAJCW1tLT5obW0gPSBOVUxMOwogCXNwaW5fdW5s
b2NrKCZtbS0+cGFnZV90YWJsZV9sb2NrKTsKIAorCW1tZHJvcChobW0tPm1tKTsKIAltbXVfbm90
aWZpZXJfY2FsbF9zcmN1KCZobW0tPnJjdSwgaG1tX2ZyZWVfcmN1KTsKIH0KIApAQCAtMTI5LDI0
ICsxMzMsNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgaG1tX3B1dChzdHJ1Y3QgaG1tICpobW0pCiAJ
a3JlZl9wdXQoJmhtbS0+a3JlZiwgaG1tX2ZyZWUpOwogfQogCi12b2lkIGhtbV9tbV9kZXN0cm95
KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQotewotCXN0cnVjdCBobW0gKmhtbTsKLQotCXNwaW5fbG9j
aygmbW0tPnBhZ2VfdGFibGVfbG9jayk7Ci0JaG1tID0gbW1fZ2V0X2htbShtbSk7Ci0JbW0tPmht
bSA9IE5VTEw7Ci0JaWYgKGhtbSkgewotCQlobW0tPm1tID0gTlVMTDsKLQkJaG1tLT5kZWFkID0g
dHJ1ZTsKLQkJc3Bpbl91bmxvY2soJm1tLT5wYWdlX3RhYmxlX2xvY2spOwotCQlobW1fcHV0KGht
bSk7Ci0JCXJldHVybjsKLQl9Ci0KLQlzcGluX3VubG9jaygmbW0tPnBhZ2VfdGFibGVfbG9jayk7
Ci19Ci0KIHN0YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBz
dHJ1Y3QgbW1fc3RydWN0ICptbSkKIHsKIAlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2Yo
bW4sIHN0cnVjdCBobW0sIG1tdV9ub3RpZmllcik7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
