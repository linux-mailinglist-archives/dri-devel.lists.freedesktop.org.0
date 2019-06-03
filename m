Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E402E33593
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 18:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB57E892BD;
	Mon,  3 Jun 2019 16:56:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFBCC892BD
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2019 16:56:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id 7B3C0284AD8
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	nicholas.kazlauskas@amd.com
Subject: [PATCH v4 4/5] drm/vc4: fix fb references in async update
Date: Mon,  3 Jun 2019 13:56:09 -0300
Message-Id: <20190603165610.24614-5-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603165610.24614-1-helen.koike@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@google.com>,
 Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, Helen Koike <helen.koike@collabora.com>,
 boris.brezillon@collabora.com, kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXN5bmMgdXBkYXRlIGNhbGxiYWNrcyBhcmUgZXhwZWN0ZWQgdG8gc2V0IHRoZSBvbGRfZmIgaW4g
dGhlIG5ld19zdGF0ZQpzbyBwcmVwYXJlL2NsZWFudXAgZnJhbWVidWZmZXJzIGFyZSBiYWxhbmNl
ZC4KCkNhbGxpbmcgZHJtX2F0b21pY19zZXRfZmJfZm9yX3BsYW5lKCkgKHdoaWNoIGdldHMgYSBy
ZWZlcmVuY2Ugb2YgdGhlIG5ldwpmYiBhbmQgcHV0IHRoZSBvbGQgZmIpIGlzIG5vdCByZXF1aXJl
ZCwgYXMgaXQncyB0YWtlbiBjYXJlIGJ5CmRybV9tb2RlX2N1cnNvcl91bml2ZXJzYWwoKSB3aGVu
IGNhbGxpbmcgZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lKCkuCgpDYzogPHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmc+ICMgdjQuMTkrCkZpeGVzOiA1MzljMzIwYmZhOTcgKCJkcm0vdmM0OiB1
cGRhdGUgY3Vyc29ycyBhc3luY2hyb25vdXNseSB0aHJvdWdoIGF0b21pYyIpClN1Z2dlc3RlZC1i
eTogQm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AY29sbGFib3JhLmNvbT4KU2lnbmVk
LW9mZi1ieTogSGVsZW4gS29pa2UgPGhlbGVuLmtvaWtlQGNvbGxhYm9yYS5jb20+ClJldmlld2Vk
LWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPgoKLS0t
CkhlbGxvLAoKSSB0ZXN0ZWQgb24gYSBSYXNwYmVycnkgUGkgbW9kZWwgQiByZXYyIHdpdGggaWd0
IHBsYW5lX2N1cnNvcl9sZWdhY3kgYW5kCmttc19jdXJzb3JfbGVnYWN5IGFuZCBJIGRpZG4ndCBz
ZWUgYW55IHJlZ3Jlc3Npb25zLgoKQ2hhbmdlcyBpbiB2NDogTm9uZQpDaGFuZ2VzIGluIHYzOiBO
b25lCkNoYW5nZXMgaW4gdjI6Ci0gQWRkZWQgcmV2aWV3ZWQtYnkgdGFnCi0gdXBkYXRlZCBDQyBz
dGFibGUgYW5kIEZpeGVzIHRhZwoKIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3BsYW5lLmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfcGxhbmUuYwppbmRleCBiZTIyNzQ5MjRiMzQuLjQ0MWUwNmQ0NWM4OSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9wbGFuZS5jCkBAIC0xMDIwLDcgKzEwMjAsNyBAQCBzdGF0aWMgdm9pZCB2YzRf
cGxhbmVfYXRvbWljX2FzeW5jX3VwZGF0ZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIHsKIAlz
dHJ1Y3QgdmM0X3BsYW5lX3N0YXRlICp2YzRfc3RhdGUsICpuZXdfdmM0X3N0YXRlOwogCi0JZHJt
X2F0b21pY19zZXRfZmJfZm9yX3BsYW5lKHBsYW5lLT5zdGF0ZSwgc3RhdGUtPmZiKTsKKwlzd2Fw
KHBsYW5lLT5zdGF0ZS0+ZmIsIHN0YXRlLT5mYik7CiAJcGxhbmUtPnN0YXRlLT5jcnRjX3ggPSBz
dGF0ZS0+Y3J0Y194OwogCXBsYW5lLT5zdGF0ZS0+Y3J0Y195ID0gc3RhdGUtPmNydGNfeTsKIAlw
bGFuZS0+c3RhdGUtPmNydGNfdyA9IHN0YXRlLT5jcnRjX3c7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
