Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8AE33FA5
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 09:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED889654;
	Tue,  4 Jun 2019 07:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80ABF892E0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 20:44:35 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id d23so11187937qto.2
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jun 2019 13:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gvdrQo5B70PjVzTAGPUvQj7fvSXVzP6mxSVdEzCLASY=;
 b=aSGEbXvJJPPg/JQ+7B6fxbp/Elsg1vsHv6cgzvLm+G1ZkSn/lcRs5aRQQcVXuoZG69
 QErNI57S8qifxkaKECpH3/Lw+cLcnxJvV2KcMDg33fcJuEIhiewa1zNTOF/ecURLGMRE
 CW3ZCy3Sf8HgvnXTgk6yFqQMHsFVjIfi+tWWP706B2X1MBnZlH115/UzQhq2vDBo3F6r
 rX3sWzf6wKppbenBST4jt8obhzJyXJZ6OJgC2KdE88HmXt1sSe910QNCmmbOvZbojwK/
 Ym1qgTzax9ZA0aRoRHinZQqYLQd0dxwHN306NGLKnb8TXKDN2kPOBXZAm5oajgYHowcH
 DBhg==
X-Gm-Message-State: APjAAAVDYJhICAHn6caQlASr3yruuh97b4EmgZagBE9qVIqFUCI1gcxJ
 F3yZ3/jAAPxjIr16cqJVqM/I6A==
X-Google-Smtp-Source: APXvYqxTQ/VyJ9mLBkuhiu277acvqJ0JTn+d00JBzZnk9wtjBACFQ0jxMb87m6w56/kleGG9LYW/dA==
X-Received: by 2002:ac8:68e:: with SMTP id f14mr11737655qth.366.1559594674546; 
 Mon, 03 Jun 2019 13:44:34 -0700 (PDT)
Received: from qcai.nay.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id e66sm9481525qtb.55.2019.06.03.13.44.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 13:44:33 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: akpm@linux-foundation.org
Subject: [RESEND PATCH v2] drm/vmwgfx: fix a warning due to missing dma_parms
Date: Mon,  3 Jun 2019 16:44:15 -0400
Message-Id: <1559594655-30324-1-git-send-email-cai@lca.pw>
X-Mailer: git-send-email 1.8.3.1
X-Mailman-Approved-At: Tue, 04 Jun 2019 07:14:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=gvdrQo5B70PjVzTAGPUvQj7fvSXVzP6mxSVdEzCLASY=;
 b=T42dqUDnlxUcv42X+xpZZ9Wm2JW57MKk1cKisSf9YDQbjcXzBoFwP6e/stsMbCe6gE
 0Pzg4myXqP5r5dH2OzSVt2SEs20IPwSCthC4VfPoa+N1i1Jt9yobmyV7hWGXYy1Sdw8c
 WcIkyT5UcFrW9E5+OOw0rC+EZoB5B5etU3u7D7ed8RRqfekvVMZGlB2ClXH6FEmAxhWN
 fp1y0jjJ8Gpaim5JLck1meM2kXiodMWkEdomDrzHG1GDm1N8PiXsHqPKf2hO0Ddcec3K
 s2b+ppo+bQ6P79c2lKKpspngweqqWf5nGWLQ3pIVHVUmD61Ji8D3Vk+OfHM/IHm49KBm
 GW0g==
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
Cc: thellstrom@vmware.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 Qian Cai <cai@lca.pw>, robin.murphy@arm.com, hch@lst.de,
 m.szyprowski@samsung.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Qm9vdGluZyB1cCB3aXRoIERNQV9BUElfREVCVUdfU0c9eSBnZW5lcmF0ZXMgYSB3YXJuaW5nIGR1
ZSB0byB0aGUgZHJpdmVyCmZvcmdvdCB0byBzZXQgZG1hX3Bhcm1zIGFwcHJvcHJpYXRlbHkuIFNl
dCBpdCBqdXN0IGFmdGVyIHZtd19kbWFfbWFza3MoKQppbiB2bXdfZHJpdmVyX2xvYWQoKS4KCkRN
QS1BUEk6IHZtd2dmeCAwMDAwOjAwOjBmLjA6IG1hcHBpbmcgc2cgc2VnbWVudCBsb25nZXIgdGhh
biBkZXZpY2UKY2xhaW1zIHRvIHN1cHBvcnQgW2xlbj0yMDk3MTUyXSBbbWF4PTY1NTM2XQpXQVJO
SU5HOiBDUFU6IDIgUElEOiAyNjEgYXQga2VybmVsL2RtYS9kZWJ1Zy5jOjEyMzIKZGVidWdfZG1h
X21hcF9zZysweDM2MC8weDQ4MApIYXJkd2FyZSBuYW1lOiBWTXdhcmUsIEluYy4gVk13YXJlIFZp
cnR1YWwgUGxhdGZvcm0vNDQwQlggRGVza3RvcApSZWZlcmVuY2UgUGxhdGZvcm0sIEJJT1MgNi4w
MCAwNC8xMy8yMDE4ClJJUDogMDAxMDpkZWJ1Z19kbWFfbWFwX3NnKzB4MzYwLzB4NDgwCkNhbGwg
VHJhY2U6CiB2bXdfdHRtX21hcF9kbWErMHgzYjEvMHg1YjAgW3Ztd2dmeF0KIHZtd19ib19tYXBf
ZG1hKzB4MjUvMHgzMCBbdm13Z2Z4XQogdm13X290YWJsZXNfc2V0dXArMHgyYTgvMHg3NTAgW3Zt
d2dmeF0KIHZtd19yZXF1ZXN0X2RldmljZV9sYXRlKzB4NzgvMHhjMCBbdm13Z2Z4XQogdm13X3Jl
cXVlc3RfZGV2aWNlKzB4ZWUvMHg0ZTAgW3Ztd2dmeF0KIHZtd19kcml2ZXJfbG9hZC5jb2xkKzB4
NzU3LzB4ZDg0IFt2bXdnZnhdCiBkcm1fZGV2X3JlZ2lzdGVyKzB4MWZmLzB4MzQwIFtkcm1dCiBk
cm1fZ2V0X3BjaV9kZXYrMHgxMTAvMHgyOTAgW2RybV0KIHZtd19wcm9iZSsweDE1LzB4MjAgW3Zt
d2dmeF0KIGxvY2FsX3BjaV9wcm9iZSsweDdhLzB4YzAKIHBjaV9kZXZpY2VfcHJvYmUrMHgxYjkv
MHgyOTAKIHJlYWxseV9wcm9iZSsweDFiNS8weDYzMAogZHJpdmVyX3Byb2JlX2RldmljZSsweGEz
LzB4MWEwCiBkZXZpY2VfZHJpdmVyX2F0dGFjaCsweDk0LzB4YTAKIF9fZHJpdmVyX2F0dGFjaCsw
eGRkLzB4MWMwCiBidXNfZm9yX2VhY2hfZGV2KzB4ZmUvMHgxNTAKIGRyaXZlcl9hdHRhY2grMHgy
ZC8weDQwCiBidXNfYWRkX2RyaXZlcisweDI5MC8weDM1MAogZHJpdmVyX3JlZ2lzdGVyKzB4ZGMv
MHgxZDAKIF9fcGNpX3JlZ2lzdGVyX2RyaXZlcisweGRhLzB4ZjAKIHZtd2dmeF9pbml0KzB4MzQv
MHgxMDAwIFt2bXdnZnhdCiBkb19vbmVfaW5pdGNhbGwrMHhlNS8weDQwYQogZG9faW5pdF9tb2R1
bGUrMHgxMGYvMHgzYTAKIGxvYWRfbW9kdWxlKzB4MTZhNS8weDFhNDAKIF9fc2Vfc3lzX2Zpbml0
X21vZHVsZSsweDE4My8weDFjMAogX194NjRfc3lzX2Zpbml0X21vZHVsZSsweDQzLzB4NTAKIGRv
X3N5c2NhbGxfNjQrMHhjOC8weDYwNgogZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4
NDQvMHhhOQoKRml4ZXM6IGZiMWQ5NzM4Y2EwNSAoImRybS92bXdnZng6IEFkZCBEUk0gZHJpdmVy
IGZvciBWTXdhcmUgVmlydHVhbCBHUFUiKQpTdWdnZXN0ZWQtYnk6IFRob21hcyBIZWxsc3Ryb20g
PHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KU2lnbmVkLW9mZi1ieTogUWlhbiBDYWkgPGNhaUBsY2Eu
cHc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYu
YwppbmRleCA0ZmYxMWEwMDc3ZTEuLjVmNjkwNDI5ZWI4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92
bXdnZnhfZHJ2LmMKQEAgLTc0Nyw2ICs3NDcsOCBAQCBzdGF0aWMgaW50IHZtd19kcml2ZXJfbG9h
ZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1bnNpZ25lZCBsb25nIGNoaXBzZXQpCiAJaWYgKHVu
bGlrZWx5KHJldCAhPSAwKSkKIAkJZ290byBvdXRfZXJyMDsKIAorCWRtYV9zZXRfbWF4X3NlZ19z
aXplKGRldi0+ZGV2LCBVMzJfTUFYKTsKKwogCWlmIChkZXZfcHJpdi0+Y2FwYWJpbGl0aWVzICYg
U1ZHQV9DQVBfR01SMikgewogCQlEUk1fSU5GTygiTWF4IEdNUiBpZHMgaXMgJXVcbiIsCiAJCQkg
KHVuc2lnbmVkKWRldl9wcml2LT5tYXhfZ21yX2lkcyk7Ci0tIAoxLjguMy4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
