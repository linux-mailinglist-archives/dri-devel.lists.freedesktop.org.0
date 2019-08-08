Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF0486D10
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC0F6ECCB;
	Thu,  8 Aug 2019 22:22:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99CAE6ECCB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:03 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r6so125061777oti.3
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9sfQNCvhJgn29BJCg3/CuK1P1Bx5yJsxtn9s7N5T8QQ=;
 b=dlrxPbkPw3cpYlltufivjaW9wq6CFJZAV7ES8zJ1jaTG88qClVx3RUKLWloZWFMtoq
 kGpTqShnsmxPtJ2GofYE1tpAzVc3RRIiVu1FwYxPzIEibefwnqOBdZwqeY+6K/qMCYIR
 O/litj9+q4BBtbaq8YxF6doUXMzeGFKyMvqMVQn3hD9jturTbaOTYON6fXsXLFQmirwf
 I7H6IYvE5s0MvguATb8fW9tKds7yRiy1bdbt6FTSkYSA492ARS9kOqwHGctZSbHINJyA
 opWadu5nNNRgVXg2feHpBb2xnSNPumhCJ6Sl9BZB58MhwWyWRLQ9T6wBMF0/P2g0+Ap7
 YAwg==
X-Gm-Message-State: APjAAAUTMUmDBVOVVjLORL8CxZBp97ZZrBseCEhEl3ctJ1qguk+CvRCr
 0Ox/fqQHdfFbxf+X/e/13gUy8C8=
X-Google-Smtp-Source: APXvYqyrJU/Nt+CWsJrVvjCBfOqoN8P4jic8O/v1JKt/vDi4+1wtNHMysXgRABgOEV0DUCvRN58BOg==
X-Received: by 2002:a5e:d51a:: with SMTP id e26mr16765691iom.71.1565302922251; 
 Thu, 08 Aug 2019 15:22:02 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:01 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/9] drm/panfrost: Add heap and no execute buffer allocation
Date: Thu,  8 Aug 2019 16:21:51 -0600
Message-Id: <20190808222200.13176-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBzZXJpZXMgYWRkcyBuZXcgQk8gYWxsb2NhdGlvbiBmbGFncyBQQU5GUk9TVF9CT19IRUFQ
IGFuZApQQU5GUk9TVF9CT19OT0VYRUMuIFRoZSBoZWFwIGFsbG9jYXRpb25zIGFyZSBwYWdlZCBp
biBvbiBHUFUgcGFnZSBmYXVsdHMuCgpIb3BlZnVsbHksIHRoaXMgaXMgdGhlIGxhc3QgdmVyc2lv
biwgYnV0IEkgbWFkZSBhIGZldyBjaGFuZ2VzIGFmdGVyCmltcGxlbWVudGluZyBwZXIgRkQgYWRk
cmVzcyBzcGFjZXMgb24gdG9wIG9mIHRoaXMuIFByaW1hcmlseSwgSSBtb3ZlZCB0aGUKR1BVIFZB
IG1hcHBpbmcgaW50byBHRU0gb3Blbi9jbG9zZSBmdW5jdGlvbnMuIFRoaXMgaXMgYSBiaXQgY2xl
YW5lciBhbmQKd2lsbCB3b3JrIHdoZW4gd2UgbmVlZCBhY2Nlc3MgdG8gcGVyIEZEIG9iamVjdHMu
CgpJIGFsc28gZm91bmQgYSBwcm9ibGVtIHdpdGggaG93IHRoZSBHUFUgcmVzZXQgaXMgaGFuZGxl
ZCB3aXRoIHRoZSBNTVUuCldpdGggdGhlIG1vdmUgdG8gYSB0aHJlYWRlZCBpcnEgaGFuZGxlciwg
aXQncyBub3Qgb2theSB0byB1bm1hc2sgdGhlIE1NVQphdCBhbnkgdGltZSBhcyB3YXMgcG9zc2li
bGUgd2l0aCBwYW5mcm9zdF9tbXVfZW5hYmxlKCkgY2FsbHMuIFRoZSByZXN1bHQKd2FzIHNvbWUg
Y29uc29saWRhdGlvbiBvZiB0aGUgcmVzZXQgY2FsbHMuCgpUb21ldSwgSSBkb24ndCB0aGluayB0
aGVyZSBzaG91bGQgYmUgYW55IGNoYW5nZXMgaW4gdGVzdCByZXN1bHRzLCBidXQgSQpkaWRuJ3Qg
YWRkIHlvdXIgdGVzdGVkLWJ5IGFzIHRoZXJlIGFyZSBhIGZldyB0b28gbWFueSBjaGFuZ2VzIHRo
YXQgSSBmZWx0CmNvbWZvcnRhYmxlIHdpdGguIEkgZGlkIHRlc3QgdGhpcyB3aXRoIHlvdXIgc2Vy
aWVzLgoKVGhpcyBpcyBiYXNlZCBvbiBkcm0tbWlzYy1uZXh0LiBBbiB1cGRhdGVkIGJyYW5jaCBp
cyBoZXJlWzFdLgoKdjQ6CiAtIE1vdmUgR1BVIFZBIG1hcHBpbmcvdW5tYXBwaW5nIHRvIEdFTSBv
cGVuL2Nsb3NlCiAtIEFkZCByZXdvcmsgb2YgcmVzZXQgaGFuZGxpbmcuCiAtIFJlYmFzZWQgb24g
dG9wIG9mIG1hZHZpc2Ugc3VwcG9ydAoKdjM6CiAtIFJldGFpbiBzaGFyZWQgaXJxIHN1cHBvcnQs
IHNwbGl0dGluZyBJUlEgY2hhbmdlcyB0byBzZXBhcmF0ZSBwYXRjaCAoNi84KQogLSBTdG9wIGxl
YWtpbmcgU0cgdGFibGVzCiAtIFByZXZlbnQgbW1hcCBhbmQgcGlubmluZyBwYWdlcyBmb3IgaGVh
cCBCT3MKClJvYgoKWzFdIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yb2JoL2xpbnV4LmdpdCBwYW5mcm9zdC9oZWFwLW5vZXhlYwoKClJvYiBIZXJyaW5nICg5
KToKICBkcm0vZ2VtOiBBbGxvdyBzcGFyc2VseSBwb3B1bGF0ZWQgcGFnZSBhcnJheXMgaW4gZHJt
X2dlbV9wdXRfcGFnZXMKICBkcm0vc2htZW06IFB1dCBwYWdlcyBpbmRlcGVuZGVudCBvZiBhIFNH
IHRhYmxlIGJlaW5nIHNldAogIGRybS9wYW5mcm9zdDogUmVzdHJ1Y3R1cmUgdGhlIEdFTSBvYmpl
Y3QgY3JlYXRpb24KICBkcm0vcGFuZnJvc3Q6IFNwbGl0IHBhbmZyb3N0X21tdV9tYXAgU0cgbGlz
dCBtYXBwaW5nIHRvIGl0cyBvd24KICAgIGZ1bmN0aW9uCiAgZHJtL3BhbmZyb3N0OiBBZGQgYSBu
byBleGVjdXRlIGZsYWcgZm9yIEJPIGFsbG9jYXRpb25zCiAgZHJtL3BhbmZyb3N0OiBDb25zb2xp
ZGF0ZSByZXNldCBoYW5kbGluZwogIGRybS9wYW5mcm9zdDogQ29udmVydCBNTVUgSVJRIGhhbmRs
ZXIgdG8gdGhyZWFkZWQgaGFuZGxlcgogIGRybS9wYW5mcm9zdDogQWRkIHN1cHBvcnQgZm9yIEdQ
VSBoZWFwIGFsbG9jYXRpb25zCiAgZHJtL3BhbmZyb3N0OiBCdW1wIGRyaXZlciB2ZXJzaW9uIHRv
IDEuMQoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgICAgICAgICAgICAgICAgICB8ICAgMyAr
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyAgICAgfCAgIDQgKy0KIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9UT0RPICAgICAgICAgICAgICB8ICAgMiAtCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAgMTYgKy0KIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaCB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZHJ2LmMgICAgfCAgNjUgKysrKystLQogZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X2dlbS5jICAgIHwgMTM4ICsrKysrKysrKystLS0KIGRyaXZlcnMv
Z3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uaCAgICB8ICAxNyArLQogZHJpdmVycy9ncHUv
ZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jICAgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgICAgfCAyMTYgKysrKysrKysrKysrKysrKystLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmggICAgfCAgIDMgKy0KIGluY2x1
ZGUvdWFwaS9kcm0vcGFuZnJvc3RfZHJtLmggICAgICAgICAgICB8ICAgMyArCiAxMiBmaWxlcyBj
aGFuZ2VkLCAzNzQgaW5zZXJ0aW9ucygrKSwgMTAxIGRlbGV0aW9ucygtKQoKLS0KMi4yMC4xCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
