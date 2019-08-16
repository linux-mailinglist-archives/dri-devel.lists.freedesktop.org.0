Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E130D91190
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2019 17:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089786EB4A;
	Sat, 17 Aug 2019 15:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
 [209.85.161.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 483B26EAC9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 05:54:04 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id n126so1459996ywf.1
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 22:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=UYipLE04l+hV469SmbY4XrY4oOZqtnVNPF3gQkQCll8=;
 b=IrP2Po2js8sC5gvE7ePSoVX+LNfV1IZoDSJ/4raB/uZWtuVGZti7C1VUCEbyrBMqZ1
 4yYrymuUkB8SPPWo9OqGH5wxvY9nqphVqGUGh/97ttuItKPRU8YcXZiaohzwnDu8GEvv
 CpAEiE/2PGd/0Hx5EAC6D85pRMVKs0hpfYcmHoZCYEErIJT9o0zVy3WBIJAAtI9el2pP
 D3futOI5z++VojkGVEAUECknyrjMAvfCGxh5ITO9iMETHcoLLXvfwVjUrc77gKQekrD6
 OtEDOUSSE9Ux/VjPwtmzwmyac3QgaDm4E63vjwxJ/XgA9kXgI+Jvr7Vbyd+4QpALfDOL
 vmQg==
X-Gm-Message-State: APjAAAWVAIpA2JJ4BdxPM8GJaTJgUDAMGT3k4X0eRuaszl4uRXOKKBUE
 nicfE7ZB2cATNcD+ywobjMc=
X-Google-Smtp-Source: APXvYqxZaUZtS4fZ2kSCQd9d68IuvZhzPXPZFzXz5Kmh9HdF9l//nCgqyB/I2s70nXogaGzkCJRxhg==
X-Received: by 2002:a81:1cc1:: with SMTP id c184mr5901885ywc.297.1565934843404; 
 Thu, 15 Aug 2019 22:54:03 -0700 (PDT)
Received: from localhost.localdomain (24-158-240-219.dhcp.smyr.ga.charter.com.
 [24.158.240.219])
 by smtp.gmail.com with ESMTPSA id b64sm1052332ywe.43.2019.08.15.22.54.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 15 Aug 2019 22:54:02 -0700 (PDT)
From: Wenwen Wang <wenwen@cs.uga.edu>
To: Wenwen Wang <wenwen@cs.uga.edu>
Subject: [PATCH] dma-buf: fix a memory leak bug
Date: Fri, 16 Aug 2019 00:53:57 -0500
Message-Id: <1565934837-6471-1-git-send-email-wenwen@cs.uga.edu>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sat, 17 Aug 2019 15:24:21 +0000
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:SYNC FILE FRAMEWORK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:SYNC FILE FRAMEWORK" <linux-media@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gc3luY19maWxlX21lcmdlKCksICdmZW5jZXMnIGlzIGZpcnN0bHkgYWxsb2NhdGVkIHRocm91
Z2gga2NhbGxvYygpLgpMYXRlciBvbiwgaWYgdGhlIHNpemUgaXMgbm90IHN1ZmZpY2llbnQsIGty
ZWFsbG9jKCkgaXMgaW52b2tlZCB0bwpyZWFsbG9jYXRlICduZmVuY2VzJywgd2hpY2ggaXMgYXNz
aWduZWQgdG8gJ2ZlbmNlcycuIEhvd2V2ZXIsIGlmIGtyZWFsbG9jKCkKZmFpbHMsICdmZW5jZXMn
IGlzIG5vdCBkZWFsbG9jYXRlZCwgbGVhZGluZyB0byBhIG1lbW9yeSBsZWFrIGJ1Zy4KClRvIGZp
eCB0aGUgYWJvdmUgaXNzdWUsIGZyZWUgJ2ZlbmNlcycgYmVmb3JlIGdvIHRvIHRoZSAnZXJyJyBs
YWJlbC4KClNpZ25lZC1vZmYtYnk6IFdlbndlbiBXYW5nIDx3ZW53ZW5AY3MudWdhLmVkdT4KLS0t
CiBkcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAz
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1i
dWYvc3luY19maWxlLmMgYi9kcml2ZXJzL2RtYS1idWYvc3luY19maWxlLmMKaW5kZXggZWU0ZDFh
OS4uNmUyYjJkMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL3N5bmNfZmlsZS5jCisrKyBi
L2RyaXZlcnMvZG1hLWJ1Zi9zeW5jX2ZpbGUuYwpAQCAtMjcyLDggKzI3MiwxMCBAQCBzdGF0aWMg
c3RydWN0IHN5bmNfZmlsZSAqc3luY19maWxlX21lcmdlKGNvbnN0IGNoYXIgKm5hbWUsIHN0cnVj
dCBzeW5jX2ZpbGUgKmEsCiAJaWYgKG51bV9mZW5jZXMgPiBpKSB7CiAJCW5mZW5jZXMgPSBrcmVh
bGxvYyhmZW5jZXMsIGkgKiBzaXplb2YoKmZlbmNlcyksCiAJCQkJICBHRlBfS0VSTkVMKTsKLQkJ
aWYgKCFuZmVuY2VzKQorCQlpZiAoIW5mZW5jZXMpIHsKKwkJCWtmcmVlKGZlbmNlcyk7CiAJCQln
b3RvIGVycjsKKwkJfQogCiAJCWZlbmNlcyA9IG5mZW5jZXM7CiAJfQotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
