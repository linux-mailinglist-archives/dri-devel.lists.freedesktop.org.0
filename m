Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9F29738E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 09:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53DBF6E925;
	Wed, 21 Aug 2019 07:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27D6E8E7;
 Tue, 20 Aug 2019 23:57:25 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b16so245632wrq.9;
 Tue, 20 Aug 2019 16:57:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFWxZfDSgaxpgiVvfnA+C89QxTNzwFuJSCG0oY5/8cU=;
 b=uKrWlJpK9qVZW6Ku+zufEfkDDqlLT4IxbRw/emRXxv8BFvygyjdlX1MYw0DExJ67GK
 1q8+EOPKG6tAAbFyG2oMpmgmtOz+zf2X0OvqE92IWRsuuyg4dI18pNeAJUDF7xfH2CO3
 dMbxm113eQActoxxoRoRdwNqdMyLYbwihIT6DCD0sKJeXszwTEO81FY5J6lo2ZarYXNz
 UjB31s1stsZBcoQaC8ligmhtyInnIqoIKN7+I3c+8dr/tu/mXTRnxkdZX5YDrHZ9Ym6H
 Ggf/pLfDfouqa7nKZiXZDr+assafhq1uUVnlLd03lzm2EuZkaH5rxrcADSbrxB1ddstL
 /+bw==
X-Gm-Message-State: APjAAAV00rJ3YlzNSV/ljsrFD8VRw9ud//R9YtBsdTAppfcbfv0d/6gO
 Mcfz0Bum4xg81wTOx6sHZP8=
X-Google-Smtp-Source: APXvYqxE8oZO9D0ftd/BMspekKYA6qAtN7ZH+yFAachqoYvAcGRekIGFBW94LXpj+pVcTZyDYfKrDw==
X-Received: by 2002:a5d:42c1:: with SMTP id t1mr29487098wrr.344.1566345444030; 
 Tue, 20 Aug 2019 16:57:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id p4sm19534872wrs.6.2019.08.20.16.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 16:57:23 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>
Subject: [PATCH] drm/amd/display: Fix 32-bit divide error in wait_for_alt_mode
Date: Tue, 20 Aug 2019 16:57:13 -0700
Message-Id: <20190820235713.3429-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mailman-Approved-At: Wed, 21 Aug 2019 07:33:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CFWxZfDSgaxpgiVvfnA+C89QxTNzwFuJSCG0oY5/8cU=;
 b=NoOVkgQB5pI8+yvEo8zXInR2QIQgLE4GQTEHpmN0+49qM/bhxbTPmI6JlthW55qtBh
 E3iDLclKnfNYx+VB5kzXihL+ZzRe0bvdWb7UizyYbkXhJtzEyupEToQXeJC4TFV/oqcv
 7sl1CDWiYNPBfc6eYG10HCfSe+E//wiQ3DbU9QfTpkhI3nE04oNx1lZMbUe0K776Puv+
 wE+NtpDo83HoT5Dd8n31RL7zcAG3nYAyiLxMbkk5gnn7glp6ma3MS786qGrmi0f52voK
 +AGuxlDiaNzE6l0RWv9CHvvQXo/R6r/zlv0vxNwy/OTad4qrJ93D81/pxaHrLcObmp/V
 CaDA==
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
Cc: Nathan Chancellor <natechancellor@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiBidWlsZGluZyBhcm0zMiBhbGx5ZXNjb25maWc6CgpsZC5sbGQ6IGVycm9yOiB1bmRlZmlu
ZWQgc3ltYm9sOiBfX2FlYWJpX3VsZGl2bW9kCj4+PiByZWZlcmVuY2VkIGJ5IGRjX2xpbmsuYwo+
Pj4gZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsubzood2FpdF9mb3JfYWx0X21v
ZGUpIGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hCj4+PiByZWZlcmVuY2VkIGJ5IGRjX2xp
bmsuYwo+Pj4gZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsubzood2FpdF9mb3Jf
YWx0X21vZGUpIGluIGFyY2hpdmUgZHJpdmVycy9idWlsdC1pbi5hCgp0aW1lX3Rha2VuX2luX25z
IGlzIG9mIHR5cGUgdW5zaWduZWQgbG9uZyBsb25nIHNvIHdlIG5lZWQgdG8gdXNlIGRpdl91NjQK
dG8gYXZvaWQgdGhpcyBlcnJvci4KCkZpeGVzOiBiNWIxZjQ1NTQ5MDQgKCJkcm0vYW1kL2Rpc3Bs
YXk6IEVuYWJsZSB0eXBlIEMgaG90cGx1ZyIpClJlcG9ydGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJk
dW5sYXBAaW5mcmFkZWFkLm9yZz4KU2lnbmVkLW9mZi1ieTogTmF0aGFuIENoYW5jZWxsb3IgPG5h
dGVjaGFuY2VsbG9yQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNw
bGF5L2RjL2NvcmUvZGNfbGluay5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Nv
cmUvZGNfbGluay5jCmluZGV4IGYyZDc4ZDdiMDg5ZS4uODYzNDkyM2I0NDQ0IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCkBAIC03MjEsNyArNzIx
LDcgQEAgYm9vbCB3YWl0X2Zvcl9hbHRfbW9kZShzdHJ1Y3QgZGNfbGluayAqbGluaykKIAkJCXRp
bWVfdGFrZW5faW5fbnMgPSBkbV9nZXRfZWxhcHNlX3RpbWVfaW5fbnMoCiAJCQkJbGluay0+Y3R4
LCBmaW5pc2hfdGltZXN0YW1wLCBlbnRlcl90aW1lc3RhbXApOwogCQkJRENfTE9HX1dBUk5JTkco
IkFsdCBtb2RlIGVudGVyZWQgZmluaXNoZWQgYWZ0ZXIgJWxsdSBtc1xuIiwKLQkJCQkgICAgICAg
dGltZV90YWtlbl9pbl9ucyAvIDEwMDAwMDApOworCQkJCSAgICAgICBkaXZfdTY0KHRpbWVfdGFr
ZW5faW5fbnMsIDEwMDAwMDApKTsKIAkJCXJldHVybiB0cnVlOwogCQl9CiAKQEAgLTczMCw3ICs3
MzAsNyBAQCBib29sIHdhaXRfZm9yX2FsdF9tb2RlKHN0cnVjdCBkY19saW5rICpsaW5rKQogCXRp
bWVfdGFrZW5faW5fbnMgPSBkbV9nZXRfZWxhcHNlX3RpbWVfaW5fbnMobGluay0+Y3R4LCBmaW5p
c2hfdGltZXN0YW1wLAogCQkJCQkJICAgIGVudGVyX3RpbWVzdGFtcCk7CiAJRENfTE9HX1dBUk5J
TkcoIkFsdCBtb2RlIGhhcyB0aW1lZCBvdXQgYWZ0ZXIgJWxsdSBtc1xuIiwKLQkJCXRpbWVfdGFr
ZW5faW5fbnMgLyAxMDAwMDAwKTsKKwkJCWRpdl91NjQodGltZV90YWtlbl9pbl9ucywgMTAwMDAw
MCkpOwogCXJldHVybiBmYWxzZTsKIH0KIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
