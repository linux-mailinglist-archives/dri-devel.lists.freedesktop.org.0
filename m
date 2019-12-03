Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466E21101F9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EE36E83F;
	Tue,  3 Dec 2019 16:19:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76B16E83F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:20 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id j42so4344722wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ak02DWSi16xtOh2ECFAWgXweAP5WExvaHVwWZOvyNnw=;
 b=dbHZz7SgehlCcyxyW3CzS+N9we4F3QbrIcLBfyIb0yrXVp7DYyDu9xK9+cF3LKPI6v
 2BhrAHQIAFpyU9MnVj9mFSKqP0qvEQpqB/+O9RpvY5dqHr3T/ZQwRJKbGCH7X+jGeYJ6
 uYIOR2n+lQeua8wjrkKsRvn5o2XZRmUS29pxG9mSheJ+c0jW/otDx+DeE7IoVys0N5gv
 JtBKXr05+c1/Mro+dO8l4y/XF5p6fkmwqfT9ey36yXLj8MFC/rzqDKHTZP+JAYDEJdYm
 4t01aQjBIfUkQhlxATG7XurzeqLSOwJbIWHeRNZsTzhNKpKy8dfxKXVnbvHYv/JYufWV
 tHvg==
X-Gm-Message-State: APjAAAXyjWbqvt/0LjIY196Nu6e4WqZ6iMweN2v+rlDNoDRbV5GNVJDT
 DvwnMIqEYtSUTo/bGk4pyUw=
X-Google-Smtp-Source: APXvYqxX2J/L0HA0d2WUetE0tWp+6QJNxQ50KMEFOyZXtSl+Lp5vT6IUI4TcSqgDC50CFxE2aJTYvw==
X-Received: by 2002:a05:6000:12c9:: with SMTP id
 l9mr6434660wrx.304.1575389959171; 
 Tue, 03 Dec 2019 08:19:19 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id h2sm4386670wrt.45.2019.12.03.08.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/9] drm/tegra: gem: Properly pin imported buffers
Date: Tue,  3 Dec 2019 17:19:07 +0100
Message-Id: <20191203161914.1312555-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ak02DWSi16xtOh2ECFAWgXweAP5WExvaHVwWZOvyNnw=;
 b=RL3vCTki5+cR7UoU49Qhs4YMV6dygSXVkmjcJrGmlyiUJg7I40PArNtHDdaed3Idsp
 jqhgLSdkixx8XnwBSZnJBed9WhVY8qumrBkEf771dmfwvNKAlqBseA1KyW/3io7flDmX
 ylaS17NtXPPiCC45yXaVsWKHcYhofEuygZQ5BH1a+SN+ekT+ttVeQ9V159fDpN+Zw7Lx
 sHcJ/QPG4K/Lb6Tnkpm6EVre2n0cf96UTeXShV5FhWjBPZCahz5RfM9RgNjJXaIfJpWr
 4t09araZKxkwBgt8EB6H4p1ADwfkSsSbtC6yvhDkM2IRriGGs5LBDDNkObPp2it7sCb1
 Apyw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkJ1ZmZlcnMgdGhhdCBh
cmUgaW1wb3J0ZWQgZnJvbSBhIERNQS1CVUYgZG9uJ3QgaGF2ZSBwYWdlcyBhbGxvY2F0ZWQgd2l0
aAp0aGVtLiBBdCB0aGUgc2FtZSB0aW1lIGFuIFNHIHRhYmxlIGZvciB0aGVtIGNhbid0IGJlIGRl
cml2ZWQgdXNpbmcgdGhlCkRNQSBBUEkgaGVscGVycyBiZWNhdXNlIHRoZSBuZWNlc3NhcnkgaW5m
b3JtYXRpb24gZG9lc24ndCBleGlzdC4gSG93ZXZlcgp0aGVyZSdzIGFscmVhZHkgYW4gU0cgdGFi
bGUgdGhhdCB3YXMgY3JlYXRlZCBkdXJpbmcgaW1wb3J0LCBzbyB0aGlzIGNhbgpzaW1wbHkgYmUg
ZHVwbGljYXRlZC4KClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Ci0tLQpOb3RlIHRoYXQgZm9yIHByb3BlciBETUEtQlVGIHVzYWdlLCB0aGUgZGlzcGxh
eSBjb250cm9sbGVycyBzaG91bGQgZWFjaAphdHRhY2ggdG8gdGhlIERNQS1CVUYgZm9yIGltcG9y
dGVkIGJ1ZmZlcnMuIFRoYXQncyBhIGZhaXJseSBsYXJnZSBjaGFuZ2UKYW5kIHdpbGwgYmUgc2Vu
dCBvdXQgYXMgYSBmb2xsb3ctdXAsIHRhcmdldHRpbmcgdjUuNi4gVGhpcyBwYXRjaCBpcyBhCmZp
eCBmb3IgYSByZWNlbnQgcmVncmVzc2lvbiBpbiB2NS41LXJjMS4KCiBkcml2ZXJzL2dwdS9kcm0v
dGVncmEvZ2VtLmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwppbmRleCA3NDZk
YWUzMmM0ODQuLjZkZmFkNTZlZWUyYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYwpAQCAtMjcsNiArMjcsMjkg
QEAgc3RhdGljIHZvaWQgdGVncmFfYm9fcHV0KHN0cnVjdCBob3N0MXhfYm8gKmJvKQogCWRybV9n
ZW1fb2JqZWN0X3B1dF91bmxvY2tlZCgmb2JqLT5nZW0pOwogfQogCisvKiBYWFggbW92ZSB0aGlz
IGludG8gbGliL3NjYXR0ZXJsaXN0LmM/ICovCitzdGF0aWMgaW50IHNnX2FsbG9jX3RhYmxlX2Zy
b21fc2coc3RydWN0IHNnX3RhYmxlICpzZ3QsIHN0cnVjdCBzY2F0dGVybGlzdCAqc2csCisJCQkJ
ICB1bnNpZ25lZCBpbnQgbmVudHMsIGdmcF90IGdmcF9tYXNrKQoreworCXN0cnVjdCBzY2F0dGVy
bGlzdCAqZHN0OworCXVuc2lnbmVkIGludCBpOworCWludCBlcnI7CisKKwllcnIgPSBzZ19hbGxv
Y190YWJsZShzZ3QsIG5lbnRzLCBnZnBfbWFzayk7CisJaWYgKGVyciA8IDApCisJCXJldHVybiBl
cnI7CisKKwlkc3QgPSBzZ3QtPnNnbDsKKworCWZvciAoaSA9IDA7IGkgPCBuZW50czsgaSsrKSB7
CisJCXNnX3NldF9wYWdlKGRzdCwgc2dfcGFnZShzZyksIHNnLT5sZW5ndGgsIDApOworCQlkc3Qg
PSBzZ19uZXh0KGRzdCk7CisJCXNnID0gc2dfbmV4dChzZyk7CisJfQorCisJcmV0dXJuIDA7Cit9
CisKIHN0YXRpYyBzdHJ1Y3Qgc2dfdGFibGUgKnRlZ3JhX2JvX3BpbihzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBob3N0MXhfYm8gKmJvLAogCQkJCSAgICAgZG1hX2FkZHJfdCAqcGh5cykKIHsK
QEAgLTUyLDExICs3NSwzMSBAQCBzdGF0aWMgc3RydWN0IHNnX3RhYmxlICp0ZWdyYV9ib19waW4o
c3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgaG9zdDF4X2JvICpibywKIAkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7CiAKIAlpZiAob2JqLT5wYWdlcykgeworCQkvKgorCQkgKiBJZiB0aGUgYnVm
ZmVyIG9iamVjdCB3YXMgYWxsb2NhdGVkIGZyb20gdGhlIGV4cGxpY2l0IElPTU1VCisJCSAqIEFQ
SSBjb2RlIHBhdGhzLCBjb25zdHJ1Y3QgYW4gU0cgdGFibGUgZnJvbSB0aGUgcGFnZXMuCisJCSAq
LwogCQllcnIgPSBzZ19hbGxvY190YWJsZV9mcm9tX3BhZ2VzKHNndCwgb2JqLT5wYWdlcywgb2Jq
LT5udW1fcGFnZXMsCiAJCQkJCQkwLCBvYmotPmdlbS5zaXplLCBHRlBfS0VSTkVMKTsKIAkJaWYg
KGVyciA8IDApCiAJCQlnb3RvIGZyZWU7CisJfSBlbHNlIGlmIChvYmotPnNndCkgeworCQkvKgor
CQkgKiBJZiB0aGUgYnVmZmVyIG9iamVjdCBhbHJlYWR5IGhhcyBhbiBTRyB0YWJsZSBidXQgbm8g
cGFnZXMKKwkJICogd2VyZSBhbGxvY2F0ZWQgZm9yIGl0LCBpdCBtZWFucyB0aGUgYnVmZmVyIHdh
cyBpbXBvcnRlZCBhbmQKKwkJICogdGhlIFNHIHRhYmxlIG5lZWRzIHRvIGJlIGNvcGllZCB0byBh
dm9pZCBvdmVyd3JpdGluZyBhbnkKKwkJICogb3RoZXIgcG90ZW50aWFsIHVzZXJzIG9mIHRoZSBv
cmlnaW5hbCBTRyB0YWJsZS4KKwkJICovCisJCWVyciA9IHNnX2FsbG9jX3RhYmxlX2Zyb21fc2co
c2d0LCBvYmotPnNndC0+c2dsLCBvYmotPnNndC0+bmVudHMsCisJCQkJCSAgICAgR0ZQX0tFUk5F
TCk7CisJCWlmIChlcnIgPCAwKQorCQkJZ290byBmcmVlOwogCX0gZWxzZSB7CisJCS8qCisJCSAq
IElmIHRoZSBidWZmZXIgb2JqZWN0IGhhZCBubyBwYWdlcyBhbGxvY2F0ZWQgYW5kIGlmIGl0IHdh
cworCQkgKiBub3QgaW1wb3J0ZWQsIGl0IGhhZCB0byBiZSBhbGxvY2F0ZWQgd2l0aCB0aGUgRE1B
IEFQSSwgc28KKwkJICogdGhlIERNQSBBUEkgaGVscGVyIGNhbiBiZSB1c2VkLgorCQkgKi8KIAkJ
ZXJyID0gZG1hX2dldF9zZ3RhYmxlKGRldiwgc2d0LCBvYmotPnZhZGRyLCBvYmotPmlvdmEsCiAJ
CQkJICAgICAgb2JqLT5nZW0uc2l6ZSk7CiAJCWlmIChlcnIgPCAwKQotLSAKMi4yMy4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
