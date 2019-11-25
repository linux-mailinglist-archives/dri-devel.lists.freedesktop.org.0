Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF9108B1D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 10:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3556E0C9;
	Mon, 25 Nov 2019 09:44:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 737276E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 09:44:04 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b18so17085326wrj.8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 01:44:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iSmNGXwr7kI9x8aaaLkjUAscIM9SqwQv2RCAyEgTVbo=;
 b=FnBJ6EqpEf64KGd4ghmTUq2CYBcMr3mQUpqMHV1oPpXQWxMAjg+BUnMAFM+rqMIkqd
 ofCrWQHaekcvvLCiaRqLAceaHe1pn2LKHA2GAzqgpTZzwIBHj1SFuY3xIW3ncZNCPgbu
 Z1tGFZdL5PEhYhku82QG3Fz2sVRJKUnwATCXKpUFhePcw15FozZWNvjfb7f/0VeHf+OE
 DITC7SSxOMXFamZ1ekwQeoF1Iyk7ucPzeSkLesWLGE+ZJLbXQV3U8YH+4IUaWnd3ciGk
 gVfP9D6VBWwvM0i30qUk1W5AF78yhSPpMv6qUrQFfe37yZ8HQ+CeNC1bXR66Asddua0I
 IGtA==
X-Gm-Message-State: APjAAAXAOo6Sux+i5RmAwNezRvArJJnConE0/WTanJnbu02uL6J8pdEW
 Uy5jS67PWqLXentTsx1rEpOyBLUbMew=
X-Google-Smtp-Source: APXvYqxA0Dvd4XRSGmFfjbFuy4hCi71K2+LFykYrVq1LJ6uVN6jnzWIMbDRYgQfqxSpeX8FQM5GSPg==
X-Received: by 2002:a5d:4445:: with SMTP id x5mr31839933wrr.341.1574675042826; 
 Mon, 25 Nov 2019 01:44:02 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id x2sm7598233wmc.3.2019.11.25.01.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Nov 2019 01:44:02 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/4] consistently use dma_resv locking wrappers
Date: Mon, 25 Nov 2019 10:43:52 +0100
Message-Id: <20191125094356.161941-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iSmNGXwr7kI9x8aaaLkjUAscIM9SqwQv2RCAyEgTVbo=;
 b=fkQuVcJJlkr/poaM8VllMT5BFMwFqe317tWBouImc2jBQVMTTH0OSigcpo+w91T4js
 yYpdia6AGt34Ay7d2eM9xYTAXPKI/1lviDS5QnRtX0eKxk1nnYbShY8BcRv7XZXWyIlf
 OuqBFECxnCOk+0QWuzOCo2lb1b5frGcixDnJE=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKVGhpcyBpcyBwcmVwIHdvcmsgZm9yIHNvbWUgZG1hX3Jlc3Ygc2VyaWVzIEknbSB0
aW5rZXJpbmcgd2l0aCwgYnV0IEkKZmlndXJlZCBnb29kIHRvIHNwbGl0IHRoaXMgb3V0IHNpbmNl
IGdvb2QgaWRlYSB0byBsYW5kIHRoaXMgbm8gbWF0dGVyIHdoYXQKZXhhY3RseSBJJ2xsIGVuZCB1
cCBjcmVhdGluZyBpbiBkbWFfcmVzdi4gV2l0aCB0aGVzZSBldmVyeXRoaW5nIGluCmRyaXZlcnMv
Z3B1IG5pY2VseSBnb2VzIHRocm91Z2ggZWl0aGVyIHRoZSBkbWFfcmVzdiBvciBkcm1fbW9kZXNl
dF9sb2NrCndyYXBwZXJzLCBhbmQgZG9lc24ndCBjYWxsIHd3X211dGV4IGRpcmVjdGx5LgoKUmV2
aWV3LCBjb21tZW50cywgYWNrcyBhbGwgdmVyeSBtdWNoIHdlbGNvbWUsIGFzIHVzdWFsLgoKQ2hl
ZXJzLCBEYW5pZWwKCkRhbmllbCBWZXR0ZXIgKDQpOgogIGRybS9ldG5hdml2OiBVc2UgZG1hX3Jl
c3YgbG9ja2luZyB3cmFwcGVycwogIGRybS9pOTE1OiBVc2UgZG1hX3Jlc3YgbG9ja2luZyB3cmFw
cGVycwogIGRybS9tc206IFVzZSBkbWFfcmVzdiBsb2NraW5nIHdyYXBwZXJzCiAgZHJtL3ZjNDog
VXNlIGRtYV9yZXN2IGxvY2tpbmcgd3JhcHBlcnMKCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9l
dG5hdml2X2dlbV9zdWJtaXQuYyAgIHwgIDggKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMgfCAgNiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbV9zdWJtaXQuYyAgICAgICAgICAgfCAxMCArKysrKy0tLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9nZW0uYyAgICAgICAgICAgICAgICAgIHwgMTEgKysrKystLS0tLS0KIDQg
ZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pCgotLSAKMi4y
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
