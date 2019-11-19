Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5D4102DF8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 22:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD2D6E3EB;
	Tue, 19 Nov 2019 21:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066836E3F2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 21:08:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c22so5492503wmd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 13:08:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lFJdMagUel06mMXNDWGQkTwShRL7t6pQn6DEe+09zlY=;
 b=AyoIyp8e9JBNylDd81Fw8H0BbZOVscGA33rPSaHxmoa/rkMYVOtryA189W2yDF2QiT
 RaVivxazESnvUzNJobqp6PXQ9VKghRi3pB9yPqE556MuqXeTvBClYkxGsihYIDYcZLqW
 lFtrYqDOeRjERyPLTB3IBMQr1IgybMRw7N7VomGzHC/1PN9BPUG+1hEdL9RUlRt8+t5Q
 ZPneXrAADHLyd3gBjqfkWfZJRtOD53gS+gM4WJoPUIB1T9/rnwb3hZGdgtwLiOCV661N
 bb5ALo7u2r6LNYbDIff7iyEQxL6nwnwkFUc2WvKjoqNEm9aTTqZJyJXsEfMTpZob0I0h
 aqgg==
X-Gm-Message-State: APjAAAVmL1qpZkw1RXnAwB+g2C/meKF96+ZEZRHADUrDafjmm9tOwzAb
 CycLL6+a6DuDPAP2OTzncRPgPg==
X-Google-Smtp-Source: APXvYqwivJmhi4Os3RCqsnYj/E91ZPdyhytUQXj3+7/ohIDi4sF6cvMLTAM3OVQUOAE17TPHOX12Gw==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr8454110wma.120.1574197730513; 
 Tue, 19 Nov 2019 13:08:50 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z14sm28005126wrl.60.2019.11.19.13.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:08:49 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] more dma-buf lockdep priming
Date: Tue, 19 Nov 2019 22:08:41 +0100
Message-Id: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lFJdMagUel06mMXNDWGQkTwShRL7t6pQn6DEe+09zlY=;
 b=UnLGJIjrUmj9yOiPO+80JkAHyZQVCld4ULE4HfiBQMsg6AsslDHr9kRmepWsvNZ3DO
 XmE2/dlIY4FxVYF2ejF0QfUFqPz28R6FqJ3WhT1cpN8nz1s6YIDsv+ZGxixjneoGoeRc
 BcLoqd8XKyw9JrjTlA8TIupMUJE/xD7XFEAHA=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKV2hpbGUgbG9va2luZyBhdCAoZHluYW1pYykgZG1hLWJ1ZiBpc3N1ZXMgYW5kIGlk
ZWFzIEkndmUgc3BvdHRlZCBhIGJpdAptb3JlIHJvb20gZm9yIGxvY2tpbmcgZG93biB0aGUgY3Jv
c3MtZHJpdmVyIGRtYV9yZXN2IHJ1bGVzLgoKT25seSBmdW5jdGlvbmFsIGZhbGxvdXQgaXMgYSB0
aW55IHBhdGNoIGZvciBtc20sIGFzc3VtaW5nIEkgZGlkbid0IGJvdGNoCmFueXRoaW5nIGluIHRo
ZSBhdWRpdGluZyBvZiBhbGwgcmVsZXZhbnQgY29kZS4KCkNvbW1lbnRzLCByZXZpZXcgYW5kIHRl
c3RpbmcgdmVyeSBtdWNoIGFwcHJlY2lhdGVkLCBhcyB1c3VhbC4KCkNoZWVycywgRGFuaWVsCgpE
YW5pZWwgVmV0dGVyICgzKToKICBkcm0vbW9kZXNldDogUHJpbWUgbW9kZXNldCBsb2NrIHZzIGRt
YV9yZXN2CiAgZG1hLXJlc3Y6IEFsc28gcHJpbWUgYWNxdWlyZSBjdHggZm9yIGxvY2tkZXAKICBk
cm0vbXNtOiBEb24ndCBpbml0IHd3X211dGVjIGFjcXVpcmUgY3R4IGJlZm9yZSBuZWVkZWQKCiBk
cml2ZXJzL2RtYS1idWYvZG1hLXJlc3YuYyAgICAgICAgICAgfCAgOCArKysrKysrLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jICAgIHwgMjggKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jIHwgIDIgKy0KIDMg
ZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tIAoyLjI0
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
