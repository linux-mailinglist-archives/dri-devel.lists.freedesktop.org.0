Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DB05248D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:28:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C22E89FCE;
	Tue, 25 Jun 2019 07:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB4C89DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 21:02:06 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id h19so805831wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 14:02:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yY5nuWFfvtGdjXx5X0jOTLVoM6UrkzhjnRnf2/dFDmQ=;
 b=IfhPFUO9RLcdudU64VrgK/wTwa7H1YWcExq4kPX2m7/tOyqN2ZlZQ78kG+dbLx8yyg
 SP/pCw03wDsszDPA0pFKUC4J9c+xOERdzgPvIdH5CjJ85a0tc2TrdSMFRQiP49JYqwGg
 qEmH6CijdpRF1bFuKYC60cytwDpsN2HMxM6Yq66M5dydrDkJaTOhABNMslk6MvKNhH/l
 zq6de8FlXzske5dZ4VpxSskVDZRMDMXGiWIHm3Qgmk1L4e55zR5BpHOyvdJzhXCLeRhT
 sv6PzTidjF00u1x2irXawD8G/q+NlJp6hJwYpL7cpx0fjrMcw327Q4cElVhF47GzL1f5
 BXCw==
X-Gm-Message-State: APjAAAXWP7s8M0CrK0AEPCHgnHoNd4oeXL/H8+yBfd5uTNAHAWXI2fBM
 XxQKX/P7M7xupXzjtqzDRvSlMQ==
X-Google-Smtp-Source: APXvYqyRMuYsh8UNUKwpWttANdd8lJKeiEYwmSXHHDDyx29FbNSbr+pndqxDZmcjLhM+HZNLBH9CVQ==
X-Received: by 2002:a1c:4054:: with SMTP id n81mr17413906wma.78.1561410125081; 
 Mon, 24 Jun 2019 14:02:05 -0700 (PDT)
Received: from ziepe.ca ([66.187.232.66])
 by smtp.gmail.com with ESMTPSA id f7sm6578766wrv.38.2019.06.24.14.02.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 24 Jun 2019 14:02:02 -0700 (PDT)
Received: from jgg by jggl.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1hfW6D-0001N1-4V; Mon, 24 Jun 2019 18:02:01 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jerome Glisse <jglisse@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Felix.Kuehling@amd.com
Subject: [PATCH v4 hmm 11/12] mm/hmm: Remove confusing comment and logic from
 hmm_release
Date: Mon, 24 Jun 2019 18:01:09 -0300
Message-Id: <20190624210110.5098-12-jgg@ziepe.ca>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190624210110.5098-1-jgg@ziepe.ca>
References: <20190624210110.5098-1-jgg@ziepe.ca>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yY5nuWFfvtGdjXx5X0jOTLVoM6UrkzhjnRnf2/dFDmQ=;
 b=F8IpBc2pCC9TRRcnAQyPopBTGejfFjN4O3manyf4o/rILQiqjMrQn93gZmQT0zfX3x
 5Z+FOf3huG56JiHRxImMjpmYUHWLJoUWRxsyiLyvuER8NJ6yXAhiFhmoMeS3xXIFDdo2
 S8cp9J0djUNYJQZ5sFZYQ/C2WzaQmeRBmrPgWsubS3c8Ie4OcoFe0BbQ1hX51zSmNWX8
 jRx4QvWLtE9d+wLs0Pn2yh3tjD1LsHbOoGDIFKF99fyOS9uFazFhPFuBYcSfa5SLimKH
 7oBiYCs7lU7Wqx9ujUyjct2anJPQXnJ7qZm2I66poFSkOkPL9DAIWEUtnwKp1WVc7xDc
 HnQg==
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKaG1tX3JlbGVhc2UoKSBp
cyBjYWxsZWQgZXhhY3RseSBvbmNlIHBlciBobW0uIG9wcy0+cmVsZWFzZSgpIGNhbm5vdAphY2Np
ZGVudGFsbHkgdHJpZ2dlciBhbnkgYWN0aW9uIHRoYXQgd291bGQgcmVjdXJzZSBiYWNrIG9udG8K
aG1tLT5taXJyb3JzX3NlbS4KClRoaXMgZml4ZXMgYSB1c2UgYWZ0ZXItZnJlZSByYWNlIG9mIHRo
ZSBmb3JtOgoKICAgICAgIENQVTAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIENQ
VTEKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhtbV9yZWxlYXNl
KCkKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdXBfd3JpdGUo
JmhtbS0+bWlycm9yc19zZW0pOwogaG1tX21pcnJvcl91bnJlZ2lzdGVyKG1pcnJvcikKICBkb3du
X3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKICB1cF93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7
CiAga2ZyZWUobWlycm9yKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtaXJyb3ItPm9wcy0+cmVsZWFzZShtaXJyb3IpCgpUaGUgb25seSB1c2VyIHdlIGhhdmUg
dG9kYXkgZm9yIG9wcy0+cmVsZWFzZSBpcyBhbiBlbXB0eSBmdW5jdGlvbiwgc28gdGhpcwppcyB1
bmFtYmlndW91c2x5IHNhZmUuCgpBcyBhIGNvbnNlcXVlbmNlIG9mIHBsdWdnaW5nIHRoaXMgcmFj
ZSBkcml2ZXJzIGFyZSBub3QgYWxsb3dlZCB0bwpyZWdpc3Rlci91bnJlZ2lzdGVyIG1pcnJvcnMg
ZnJvbSB3aXRoaW4gYSByZWxlYXNlIG9wLgoKU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgpUZXN0ZWQtYnk6IFBoaWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0Bh
bWQuY29tPgotLS0KIG1tL2htbS5jIHwgMjggKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBjMzBhYTk0MDNkYmU0ZC4uYjIyNGVhNjM1
YTc3MTYgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzAsMjYgKzEz
MCwxNiBAQCBzdGF0aWMgdm9pZCBobW1fcmVsZWFzZShzdHJ1Y3QgbW11X25vdGlmaWVyICptbiwg
c3RydWN0IG1tX3N0cnVjdCAqbW0pCiAJICovCiAJV0FSTl9PTighbGlzdF9lbXB0eV9jYXJlZnVs
KCZobW0tPnJhbmdlcykpOwogCi0JZG93bl93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7Ci0JbWly
cm9yID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZobW0tPm1pcnJvcnMsIHN0cnVjdCBobW1f
bWlycm9yLAotCQkJCQkgIGxpc3QpOwotCXdoaWxlIChtaXJyb3IpIHsKLQkJbGlzdF9kZWxfaW5p
dCgmbWlycm9yLT5saXN0KTsKLQkJaWYgKG1pcnJvci0+b3BzLT5yZWxlYXNlKSB7Ci0JCQkvKgot
CQkJICogRHJvcCBtaXJyb3JzX3NlbSBzbyB0aGUgcmVsZWFzZSBjYWxsYmFjayBjYW4gd2FpdAot
CQkJICogb24gYW55IHBlbmRpbmcgd29yayB0aGF0IG1pZ2h0IGl0c2VsZiB0cmlnZ2VyIGEKLQkJ
CSAqIG1tdV9ub3RpZmllciBjYWxsYmFjayBhbmQgdGh1cyB3b3VsZCBkZWFkbG9jayB3aXRoCi0J
CQkgKiB1cy4KLQkJCSAqLwotCQkJdXBfd3JpdGUoJmhtbS0+bWlycm9yc19zZW0pOworCWRvd25f
cmVhZCgmaG1tLT5taXJyb3JzX3NlbSk7CisJbGlzdF9mb3JfZWFjaF9lbnRyeShtaXJyb3IsICZo
bW0tPm1pcnJvcnMsIGxpc3QpIHsKKwkJLyoKKwkJICogTm90ZTogVGhlIGRyaXZlciBpcyBub3Qg
YWxsb3dlZCB0byB0cmlnZ2VyCisJCSAqIGhtbV9taXJyb3JfdW5yZWdpc3RlcigpIGZyb20gdGhp
cyB0aHJlYWQuCisJCSAqLworCQlpZiAobWlycm9yLT5vcHMtPnJlbGVhc2UpCiAJCQltaXJyb3It
Pm9wcy0+cmVsZWFzZShtaXJyb3IpOwotCQkJZG93bl93cml0ZSgmaG1tLT5taXJyb3JzX3NlbSk7
Ci0JCX0KLQkJbWlycm9yID0gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKCZobW0tPm1pcnJvcnMs
Ci0JCQkJCQkgIHN0cnVjdCBobW1fbWlycm9yLCBsaXN0KTsKIAl9Ci0JdXBfd3JpdGUoJmhtbS0+
bWlycm9yc19zZW0pOworCXVwX3JlYWQoJmhtbS0+bWlycm9yc19zZW0pOwogCiAJaG1tX3B1dCho
bW0pOwogfQpAQCAtMjc5LDcgKzI2OSw3IEBAIHZvaWQgaG1tX21pcnJvcl91bnJlZ2lzdGVyKHN0
cnVjdCBobW1fbWlycm9yICptaXJyb3IpCiAJc3RydWN0IGhtbSAqaG1tID0gbWlycm9yLT5obW07
CiAKIAlkb3duX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKLQlsaXN0X2RlbF9pbml0KCZtaXJy
b3ItPmxpc3QpOworCWxpc3RfZGVsKCZtaXJyb3ItPmxpc3QpOwogCXVwX3dyaXRlKCZobW0tPm1p
cnJvcnNfc2VtKTsKIAlobW1fcHV0KGhtbSk7CiB9Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
