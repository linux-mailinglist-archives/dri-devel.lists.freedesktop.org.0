Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923CDE38C4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A226E507;
	Thu, 24 Oct 2019 16:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72486E49A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:46:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id o28so26848633wro.7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oFcPP2oqutBVyEiEACLaC7jQyoj9cZb8X5+nPOqCh7o=;
 b=JeoCFKAF/aC38+6aNcv2NDxIXJkII0tPnC9/Yz0uFR83TcZNZW6zf4XYzy5ONL/ltn
 7bQcSRQR0rdyVCKFRqnK+8tmo9atc3M1w954zqy65FiC3Lje5VgUb/qukOglmdjB2Cwm
 /E2f5uZ5F2ryhtYbhL3e0RmH92hKNB9KMwJhELs9mrL97RcjePQhoqBYOIZGivMO6gH2
 hEnIqQ2+NIKBSqz14AFOv6+zF0d/JwtR1QkoEXUoi5saSjwPXR9N8QRfLsVJf7BPhmx7
 YVagy7afyc702Bjbq6TaqvE3XfmU02FofKevwW6JXvxoVMSFK7auPdjhwr7PUkvuK0BI
 3ftA==
X-Gm-Message-State: APjAAAVGcAfI0wlgXzLr52/FEVJqIfQ/bzxt9fKkjsaSYN8J6l+XNRFb
 2NWjnGRDk2RXyp3FMhV8QQE=
X-Google-Smtp-Source: APXvYqw1/hZX5WMs4ab63v5HQMWmYw5vlnLln0CGWngX/3ACyBOT0yDMD2mOwJBPkaMVnEh2VWRDBQ==
X-Received: by 2002:a5d:6246:: with SMTP id m6mr4947510wrv.262.1571935609360; 
 Thu, 24 Oct 2019 09:46:49 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id 1sm8265435wrr.16.2019.10.24.09.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:46:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 32/32] drm/tegra: sor: Introduce audio enable/disable callbacks
Date: Thu, 24 Oct 2019 18:45:34 +0200
Message-Id: <20191024164534.132764-33-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oFcPP2oqutBVyEiEACLaC7jQyoj9cZb8X5+nPOqCh7o=;
 b=TZjKFmQbkbNHnXanxjcWtAgpeaF8KGP7cYtEIFz+T1fl6RXPpBGDum4oB9w0sCVmAd
 4ml40spo8rbDQA04LDO7W2onpmI/Ng2S2DgO+f318AVyFfwpOMsENcL0rN1NgeqOfglB
 8C5dBKm24qwSsxrNCUhcYzycUGR8D0CpJaICkexJTkTFNaDYgyJRgq7xSZki7ghncePh
 Ngh6Jr64kkJOrRdAbhTJqsYJ/RCWWFD/sAPpSvBQjcdF+isQ716wcoifti2j8mbNFyME
 FrBgw30ns3N/3/ylqoIhYZzhj/V/zPgTv9if8RhJQZTaYFjPU6+i4eq5ie+MABjHQxqq
 Zebw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkluIG9yZGVyIHRvIHN1
cHBvcnQgZGlmZmVyZW50IG1vZGVzIChEUCBpbiBhZGRpdGlvbiB0byBIRE1JKSwgc3BsaXQgb3V0
CnRoZSBhdWRpbyBzZXR1cC90ZWFyZG93biBpbnRvIGNhbGxiYWNrcy4KClNpZ25lZC1vZmYtYnk6
IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3Nvci5jIHwgMTAgKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
c29yLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKaW5kZXggNDc4YzAwMWY0NDUzLi42
MTVjYjMxOWZhOGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9zb3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvc29yLmMKQEAgLTM5OCw2ICszOTgsOCBAQCBzdHJ1Y3Qg
dGVncmFfc29yX29wcyB7CiAJY29uc3QgY2hhciAqbmFtZTsKIAlpbnQgKCpwcm9iZSkoc3RydWN0
IHRlZ3JhX3NvciAqc29yKTsKIAlpbnQgKCpyZW1vdmUpKHN0cnVjdCB0ZWdyYV9zb3IgKnNvcik7
CisJdm9pZCAoKmF1ZGlvX2VuYWJsZSkoc3RydWN0IHRlZ3JhX3NvciAqc29yKTsKKwl2b2lkICgq
YXVkaW9fZGlzYWJsZSkoc3RydWN0IHRlZ3JhX3NvciAqc29yKTsKIH07CiAKIHN0cnVjdCB0ZWdy
YV9zb3IgewpAQCAtMzAwOCw2ICszMDEwLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB0ZWdyYV9z
b3Jfb3BzIHRlZ3JhX3Nvcl9oZG1pX29wcyA9IHsKIAkubmFtZSA9ICJIRE1JIiwKIAkucHJvYmUg
PSB0ZWdyYV9zb3JfaGRtaV9wcm9iZSwKIAkucmVtb3ZlID0gdGVncmFfc29yX2hkbWlfcmVtb3Zl
LAorCS5hdWRpb19lbmFibGUgPSB0ZWdyYV9zb3JfaGRtaV9hdWRpb19lbmFibGUsCisJLmF1ZGlv
X2Rpc2FibGUgPSB0ZWdyYV9zb3JfaGRtaV9hdWRpb19kaXNhYmxlLAogfTsKIAogc3RhdGljIGlu
dCB0ZWdyYV9zb3JfZHBfcHJvYmUoc3RydWN0IHRlZ3JhX3NvciAqc29yKQpAQCAtMzYxNiw5ICsz
NjIwLDExIEBAIHN0YXRpYyBpcnFyZXR1cm5fdCB0ZWdyYV9zb3JfaXJxKGludCBpcnEsIHZvaWQg
KmRhdGEpCiAKIAkJCXRlZ3JhX2hkYV9wYXJzZV9mb3JtYXQoZm9ybWF0LCAmc29yLT5mb3JtYXQp
OwogCi0JCQl0ZWdyYV9zb3JfaGRtaV9hdWRpb19lbmFibGUoc29yKTsKKwkJCWlmIChzb3ItPm9w
cy0+YXVkaW9fZW5hYmxlKQorCQkJCXNvci0+b3BzLT5hdWRpb19lbmFibGUoc29yKTsKIAkJfSBl
bHNlIHsKLQkJCXRlZ3JhX3Nvcl9oZG1pX2F1ZGlvX2Rpc2FibGUoc29yKTsKKwkJCWlmIChzb3It
Pm9wcy0+YXVkaW9fZGlzYWJsZSkKKwkJCQlzb3ItPm9wcy0+YXVkaW9fZGlzYWJsZShzb3IpOwog
CQl9CiAJfQogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
