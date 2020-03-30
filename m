Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7FB1974F8
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A71A089F03;
	Mon, 30 Mar 2020 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F3689F2E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Mar 2020 01:09:46 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 19so16276122ljj.7
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Mar 2020 18:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EkjouEeBk5eg2E7LoRsCY9DiuMbRBnrdHMJNPQxQEMg=;
 b=uoReP5o1Wpc4sXErhiwwYzGLqIZG8/HPTnwU7/VbcpDBs0yAOXD5zAtYc5xDmZL1ct
 UuKYJpRsNORBwC3dD+X3wBa1m8tFRMzhZmWJ4z3Rc0eBrZhJ12T25VLwdECwkkKTHpTP
 t35MNKIgHpLxPZAP0v8t9xEval1hNjGLep9oSnUp+WEsTqo3QWL+3qc1rn/tvGRi9IUO
 0ShuXp9UEK8Dn0YFEW+wn5CZLvlkkxtD6nr09356ror89nA8ngq22tQkpAR/48R88sY6
 rDYWrkNZbCJVkZbcjZ42l3Yka9hlLd33sO+pONmsjcbbEBT+NyCKwDos3/c5Tae10v3v
 gZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EkjouEeBk5eg2E7LoRsCY9DiuMbRBnrdHMJNPQxQEMg=;
 b=XrvfBHm1FcOqXJ76xyfZp/Y8WMUaZCg7PHsOPHL8iRSX4udhlalT0khJZU0j+MWwFa
 UGw4oWotqLFh/+Hh9HWK0k+GPxZlSgV4x4ow0BQKYCa7VKTvmf015F5Et3d79jn8aJlQ
 dGj6b3DYZpXvePUuCs6nU+AElVn33xVDGpwE5qmHAJVK+ZPuN1g/zmgPpoicGwyu0HY8
 n/ESBFzOMGd4KrvBcArvqDp9NCJH9OIrOms/HRjiGSJNawd7TxydqKv1kOjesXcVh/HR
 MsEVJ9gKML6FQrFYt5KfTsHRMwjFZIkIna3uGuhv3g6wZFwRX5+CY8pctx7Vgttvntyr
 n9Yg==
X-Gm-Message-State: AGi0Pua6QPfuUIisScbcQyJ7QmxnnLuc6mBkyws2Vbq5zeUQQ24ha639
 oVztb6zMCdXMxX9dMswrv+g=
X-Google-Smtp-Source: APiQypIZbS8q+NVKU2VHe5+16UUjZNBYbRLaViehODNF6YSe90cPCBqkF1gsWjim+Yl2LvdHvEowig==
X-Received: by 2002:a2e:a412:: with SMTP id p18mr5826456ljn.39.1585530584794; 
 Sun, 29 Mar 2020 18:09:44 -0700 (PDT)
Received: from localhost.localdomain (ppp91-78-208-152.pppoe.mtu-net.ru.
 [91.78.208.152])
 by smtp.gmail.com with ESMTPSA id f23sm2449005lja.60.2020.03.29.18.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Mar 2020 18:09:44 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 10/22] interconnect: Relax requirement in
 of_icc_get_from_provider()
Date: Mon, 30 Mar 2020 04:08:52 +0300
Message-Id: <20200330010904.27643-11-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200330010904.27643-1-digetx@gmail.com>
References: <20200330010904.27643-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQXJ0dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgoKVGhpcyBwYXRjaCBy
ZWxheGVzIHRoZSBjb25kaXRpb24gaW4gb2ZfaWNjX2dldF9mcm9tX3Byb3ZpZGVyKCkgc28gdGhh
dCBpdAppcyBubyBsb25nZXIgcmVxdWlyZWQgdG8gc2V0ICNpbnRlcmNvbm5lY3QtY2VsbHMgPSA8
MT4gaW4gdGhlIERULiBJbiBjYXNlCm9mIHRoZSBkZXZmcmVxIGRyaXZlciBmb3IgZXh5bm9zLWJ1
cywgI2ludGVyY29ubmVjdC1jZWxscyBpcyBhbHdheXMgemVyby4KClNpZ25lZC1vZmYtYnk6IEFy
dHVyIMWad2lnb8WEIDxhLnN3aWdvbkBzYW1zdW5nLmNvbT4KW2RpZ2V0eEBnbWFpbC5jb206IGFk
ZGVkIGNlbGxzX251bSBjaGVja2luZyBmb3Igb2ZfaWNjX3hsYXRlX29uZWNlbGwoKV0KU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgotLS0KIGRyaXZlcnMv
aW50ZXJjb25uZWN0L2NvcmUuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW50ZXJj
b25uZWN0L2NvcmUuYyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwppbmRleCAyYzY1MTVl
M2VjZjEuLjdkMDk2NTY3MzRjMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbnRlcmNvbm5lY3QvY29y
ZS5jCisrKyBiL2RyaXZlcnMvaW50ZXJjb25uZWN0L2NvcmUuYwpAQCAtMzM1LDcgKzMzNSw3IEBA
IHN0YXRpYyBzdHJ1Y3QgaWNjX25vZGUgKm9mX2ljY19nZXRfZnJvbV9wcm92aWRlcihzdHJ1Y3Qg
b2ZfcGhhbmRsZV9hcmdzICpzcGVjKQogCXN0cnVjdCBpY2Nfbm9kZSAqbm9kZSA9IEVSUl9QVFIo
LUVQUk9CRV9ERUZFUik7CiAJc3RydWN0IGljY19wcm92aWRlciAqcHJvdmlkZXI7CiAKLQlpZiAo
IXNwZWMgfHwgc3BlYy0+YXJnc19jb3VudCAhPSAxKQorCWlmICghc3BlYykKIAkJcmV0dXJuIEVS
Ul9QVFIoLUVJTlZBTCk7CiAKIAltdXRleF9sb2NrKCZpY2NfbG9jayk7CkBAIC04NTEsNiArODUx
LDE1IEBAIEVYUE9SVF9TWU1CT0xfR1BMKGljY19ub2Rlc19yZW1vdmUpOwogICovCiBpbnQgaWNj
X3Byb3ZpZGVyX2FkZChzdHJ1Y3QgaWNjX3Byb3ZpZGVyICpwcm92aWRlcikKIHsKKwlzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKm5wID0gcHJvdmlkZXItPmRldi0+b2Zfbm9kZTsKKwl1MzIgY2VsbHNfbnVt
OworCWludCBlcnI7CisKKwllcnIgPSBvZl9wcm9wZXJ0eV9yZWFkX3UzMihucCwgIiNpbnRlcmNv
bm5lY3QtY2VsbHMiLCAmY2VsbHNfbnVtKTsKKwlpZiAoV0FSTl9PTihlcnIpKQorCQlyZXR1cm4g
ZXJyOworCWlmIChXQVJOX09OKHByb3ZpZGVyLT54bGF0ZSA9PSBvZl9pY2NfeGxhdGVfb25lY2Vs
bCAmJiBjZWxsc19udW0gIT0gMSkpCisJCXJldHVybiAtRUlOVkFMOwogCWlmIChXQVJOX09OKCFw
cm92aWRlci0+c2V0KSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJaWYgKFdBUk5fT04oIXByb3ZpZGVy
LT54bGF0ZSkpCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
