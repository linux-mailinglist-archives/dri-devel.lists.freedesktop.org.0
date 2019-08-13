Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D86D8E6B9
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF3276E93C;
	Thu, 15 Aug 2019 08:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD336E0F2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 11:04:07 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id l186so45501323vke.19
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
 b=cLLJxmExIbWn+lYfaYcmOwgJSpomUDRiEIeJ1YKzEcCN93ESc7Fpg0DIyPVkXr+V8x
 1NoU/Pc6N/2zOZSZvNKpfJ4+wlVJwZYjrBaR6xGCS7qyQFYKxY6dNjeBIj6RyqNNOthp
 mxKBPhXFsAFUCwPPtBNJbCbd6ue2SmLxdP+jHT0vggkPqgggYDFm17dXkS0cH6S5EmX6
 luz1LX3Eo1sTraXQ3lH7/MkGkSoOKnEvkgpupAMCBC9NGofCZPhPr0vtjbqJHVqDrkws
 qJAdMxWpEwHFeHUb0U04rEOHIOxyOHOzZXs8bXJ4aqfB2NnJIWTr1aV133M69TptqEOM
 Cqyg==
X-Gm-Message-State: APjAAAUJG21lQrpwf1x5NE/+xOYEKLSlygwpx3ZPIr3r35OlcHVI8tPq
 7uQPv+rGe7vNQCylvEqqr7l4wjS/UN15aCUbxbfphJAqioVdI410kyZacKtkRMJUAZsWx66JUci
 o24EBa8jG+lkJSt94IkcNf9V4Ob/qzzjbxfpFhc6s5wIivJF+izCl8c/aV1oFqwUW8xtrwzOEJw
 ==
X-Google-Smtp-Source: APXvYqyRU0LZVcPWtHHZrERKAl27mwogAt6+FnB4yxVhw/aK7Ob1F1wrsG/rm4k4QQRTeI1EszqJIbqVp0I=
X-Received: by 2002:a67:fa44:: with SMTP id j4mr10655278vsq.138.1565694246217; 
 Tue, 13 Aug 2019 04:04:06 -0700 (PDT)
Date: Tue, 13 Aug 2019 13:02:38 +0200
In-Reply-To: <20190813110300.83025-1-darekm@google.com>
Message-Id: <20190813110300.83025-7-darekm@google.com>
Mime-Version: 1.0
References: <20190813110300.83025-1-darekm@google.com>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v6 6/8] drm: tegra: use cec_notifier_conn_(un)register
From: Dariusz Marcinkiewicz <darekm@google.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org, 
 hverkuil-cisco@xs4all.nl
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:55 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc;
 bh=saq5XDceOIgoGr9TXKhDgKirX3SqKoE0qoHBi968/xk=;
 b=gDO1KkDTJUciiu/w2pWa46oNOHB2NW+diPTrQSe6UjOmk/n2EoRpy+rDWdBYJuiKzY
 6x6LgDF5KDKyv9VXmseeyAu3LhFkBOtjkbVjLcCMTQsulzf1fQZYMwK97ErqMxCmCX3D
 S7EApgu5kjDAFza//vwbwwa1Gk59twIlmD1KY7DRHQFJrGUzS5zFJe0CbCc0GIqHF4io
 VFLPmmZnVQfYKNtjAbG8Evu6bf3DyEGgeEqB45NKR7BoQ3ILZ+L7a3sdX45sWfvGO1sY
 XSFc2NiIuWZftfLGRjyOg7nh1+UFJBut3iAOv4jzfoc8SYbt4t+/WIT5Jms6mAK+9E0I
 NTQA==
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
Cc: David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBuZXcgY2VjX25vdGlmaWVyX2Nvbm5fKHVuKXJlZ2lzdGVyKCkgZnVuY3Rpb25zIHRv
Cih1bilyZWdpc3RlciB0aGUgbm90aWZpZXIgZm9yIHRoZSBIRE1JIGNvbm5lY3RvciwgYW5kIGZp
bGwgaW4KdGhlIGNlY19jb25uZWN0b3JfaW5mby4KCkNoYW5nZXMgc2luY2UgdjQ6CgktIG9ubHkg
Y3JlYXRlIGEgQ0VDIG5vdGlmaWVyIGZvciBIRE1JIGNvbm5lY3RvcnMKClNpZ25lZC1vZmYtYnk6
IERhcml1c3ogTWFyY2lua2lld2ljeiA8ZGFyZWttQGdvb2dsZS5jb20+ClRlc3RlZC1ieTogSGFu
cyBWZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL291dHB1dC5jIHwgMjggKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291
dHB1dC5jCmluZGV4IGJkY2FhNGM3MTY4Y2YuLjM0MzczNzM0ZmY2ODkgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
b3V0cHV0LmMKQEAgLTcwLDYgKzcwLDExIEBAIHRlZ3JhX291dHB1dF9jb25uZWN0b3JfZGV0ZWN0
KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCiAKIHZvaWQgdGVn
cmFfb3V0cHV0X2Nvbm5lY3Rvcl9kZXN0cm95KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpCiB7CisJc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0ID0gY29ubmVjdG9yX3RvX291dHB1
dChjb25uZWN0b3IpOworCisJaWYgKG91dHB1dC0+Y2VjKQorCQljZWNfbm90aWZpZXJfY29ubl91
bnJlZ2lzdGVyKG91dHB1dC0+Y2VjKTsKKwogCWRybV9jb25uZWN0b3JfdW5yZWdpc3Rlcihjb25u
ZWN0b3IpOwogCWRybV9jb25uZWN0b3JfY2xlYW51cChjb25uZWN0b3IpOwogfQpAQCAtMTYzLDE4
ICsxNjgsMTEgQEAgaW50IHRlZ3JhX291dHB1dF9wcm9iZShzdHJ1Y3QgdGVncmFfb3V0cHV0ICpv
dXRwdXQpCiAJCWRpc2FibGVfaXJxKG91dHB1dC0+aHBkX2lycSk7CiAJfQogCi0Jb3V0cHV0LT5j
ZWMgPSBjZWNfbm90aWZpZXJfZ2V0KG91dHB1dC0+ZGV2KTsKLQlpZiAoIW91dHB1dC0+Y2VjKQot
CQlyZXR1cm4gLUVOT01FTTsKLQogCXJldHVybiAwOwogfQogCiB2b2lkIHRlZ3JhX291dHB1dF9y
ZW1vdmUoc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0KQogewotCWlmIChvdXRwdXQtPmNlYykK
LQkJY2VjX25vdGlmaWVyX3B1dChvdXRwdXQtPmNlYyk7Ci0KIAlpZiAob3V0cHV0LT5ocGRfZ3Bp
bykKIAkJZnJlZV9pcnEob3V0cHV0LT5ocGRfaXJxLCBvdXRwdXQpOwogCkBAIC0xODQsNiArMTgy
LDcgQEAgdm9pZCB0ZWdyYV9vdXRwdXRfcmVtb3ZlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1
dCkKIAogaW50IHRlZ3JhX291dHB1dF9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHN0cnVj
dCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKIHsKKwlpbnQgY29ubmVjdG9yX3R5cGU7CiAJaW50IGVy
cjsKIAogCWlmIChvdXRwdXQtPnBhbmVsKSB7CkBAIC0xOTksNiArMTk4LDIxIEBAIGludCB0ZWdy
YV9vdXRwdXRfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgdGVncmFfb3V0cHV0
ICpvdXRwdXQpCiAJaWYgKG91dHB1dC0+aHBkX2dwaW8pCiAJCWVuYWJsZV9pcnEob3V0cHV0LT5o
cGRfaXJxKTsKIAorCWNvbm5lY3Rvcl90eXBlID0gb3V0cHV0LT5jb25uZWN0b3IuY29ubmVjdG9y
X3R5cGU7CisJLyoKKwkgKiBDcmVhdGUgYSBDRUMgbm90aWZpZXIgZm9yIEhETUkgY29ubmVjdG9y
LgorCSAqLworCWlmIChjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfSERNSUEg
fHwKKwkgICAgY29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlCKSB7CisJ
CXN0cnVjdCBjZWNfY29ubmVjdG9yX2luZm8gY29ubl9pbmZvOworCisJCWNlY19maWxsX2Nvbm5f
aW5mb19mcm9tX2RybSgmY29ubl9pbmZvLCAmb3V0cHV0LT5jb25uZWN0b3IpOworCQlvdXRwdXQt
PmNlYyA9IGNlY19ub3RpZmllcl9jb25uX3JlZ2lzdGVyKG91dHB1dC0+ZGV2LCBOVUxMLAorCQkJ
CQkJCSAmY29ubl9pbmZvKTsKKwkJaWYgKCFvdXRwdXQtPmNlYykKKwkJCXJldHVybiAtRU5PTUVN
OworCX0KKwogCXJldHVybiAwOwogfQogCi0tIAoyLjIzLjAucmMxLjE1My5nZGVlZDgwMzMwZi1n
b29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
