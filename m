Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C46195986
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6BB56E81F;
	Tue, 20 Aug 2019 08:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0506E81E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:19:09 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g8so5341356edm.6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2z56NGRuBwQ6OtJWWZ+ElQlv8Da6Bh+gCKkp4IYR4I=;
 b=Uy9DZF6JkxK8EiT/PSUjsfZJ3BBB7kPxcIce1CKkNQS7DpevywZQyKNYAB4Nd6y9oF
 u1vaKxFhalx2VM91WmaZj8d192jXXdzn5zzSllKEb9cRKJ4nZQPC06chgtAED6IV0oE2
 VCcN2nz0d92pLUNIlWz68myH32anrDc1idq3jckPMsfXQ3fVJMooHwyDQhCIcCjMjiMV
 wrDmVUzV3TcWDnp7G/UloEs00Z5C4wBoahzh2ybAhUWjuZSf/9Waa/t+2BJThdnfCt3Z
 NDKRD5jbQM+cNKrCDZ52HfcMZcKjjE2AtEWcUVwzzzlOi9C+rwlz/FYLEOQJV7rQYlL4
 yYcQ==
X-Gm-Message-State: APjAAAXtEM9W7aMnu+a2BKGIZLg4VxO0Ds6FELVi/5uE75j2MoG0ULSe
 s4KwtVAgBCZQMhUXYeK7lvc0Kw==
X-Google-Smtp-Source: APXvYqzDZ+XSiJaUiLyBO6xryISbkppFw3Ap9Zd0Y3Zq1bsN8EUYkCC3bk1FyxoLEsheLO+r1k3c9A==
X-Received: by 2002:a05:6402:155a:: with SMTP id
 p26mr30221294edx.9.1566289148256; 
 Tue, 20 Aug 2019 01:19:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id fj15sm2469623ejb.78.2019.08.20.01.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:19:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/4] mmu notifier debug annotations/checks
Date: Tue, 20 Aug 2019 10:18:58 +0200
Message-Id: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q2z56NGRuBwQ6OtJWWZ+ElQlv8Da6Bh+gCKkp4IYR4I=;
 b=SmZ/pRArK01I8lgnLa49hGHl9IbRlO4jooOekpAQLUww/NtZzFbMdIf6NslU/Y3SKc
 gCLvUacj0TPK72ol8Q8Xy9ZgNWfki0+DDeENUyIK5fHcnRb+guPbzkfvrrpI3BAbNMmh
 SzIkH2ny+RAPMFrNxXmq4QZ6VxH2OOupC75XY=
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
Cc: Linux MM <linux-mm@kvack.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgYWxsLAoKSGVyZSdzIHRoZSByZXNwaW4uIENoYW5nZXM6CgotIDIgcGF0Y2hlcyBmb3IgY2hl
Y2tpbmcgcmV0dXJuIHZhbHVlcyBvZiBjYWxsYmFja3MgZHJvcHBlZCwgdGhleSBsYW5kZWQKCi0g
bW92ZSB0aGUgbG9ja2RlcCBhbm5vdGF0aW9ucyBhaGVhZCwgc2luY2UgSSB0aGluayB0aGF0IHBh
cnQgaXMgbGVzcwogIGNvbnRlbnRpb3VzLiBsb2NrZGVwIG1hcCBub3cgYWxzbyBhbm5vdGF0ZXMg
aW52YWxpZGF0ZV9yYW5nZV9lbmQsIGFzCiAgcmVxdWVzdGVkIGJ5IEphc29uLgoKLSBhZGQgYSBw
YXRjaCB0byBwcmltZSBsb2NrZGVwLCBpZGVhIGZyb20gSmFzb24sIGxldCdzIGhlYXIgd2hldGhl
ciB0aGUKICBpbXBsZW1lbnRhdGlvbiBmaXRzLgoKLSBJJ3ZlIHN0dWNrIHdpdGggdGhlIG5vbl9i
bG9ja19zdGFydC9lbmQgZm9yIG5vdyBhbmQgbm90IHN3aXRjaGVkIGJhY2sgdG8KICBwcmVlbXB0
X2Rpc2FibGUvZW5hYmxlLCBidXQgd2l0aCBjb21tZW50cyBhcyBzdWdnZXN0ZWQgYnkgQW5kcmV3
LgogIEhvcGVmdWxseSB0aGF0IGZpdHMgdGhlIGJpbGwsIG90aGVyd2lzZSBJIGNhbiBnbyBiYWNr
IGFnYWluIGlmIHRoZQogIGNvbnNlbnN1cyBpcyBtb3JlIHRoZXJlLgoKUmV2aWV3LCBjb21tZW50
cyBhbmQgaWRlYXMgdmVyeSBtdWNoIHdlbGNvbWUuCgpDaGVlcnMsIERhbmllbAoKRGFuaWVsIFZl
dHRlciAoNCk6CiAgbW0sIG5vdGlmaWVyOiBBZGQgYSBsb2NrZGVwIG1hcCBmb3IgaW52YWxpZGF0
ZV9yYW5nZV9zdGFydC9lbmQKICBtbSwgbm90aWZpZXI6IFByaW1lIGxvY2tkZXAKICBrZXJuZWwu
aDogQWRkIG5vbl9ibG9ja19zdGFydC9lbmQoKQogIG1tLCBub3RpZmllcjogQ2F0Y2ggc2xlZXBp
bmcvYmxvY2tpbmcgZm9yICFibG9ja2FibGUKCiBpbmNsdWRlL2xpbnV4L2tlcm5lbC5oICAgICAg
IHwgMjUgKysrKysrKysrKysrKysrKysrKysrKysrLQogaW5jbHVkZS9saW51eC9tbXVfbm90aWZp
ZXIuaCB8ICA4ICsrKysrKysrCiBpbmNsdWRlL2xpbnV4L3NjaGVkLmggICAgICAgIHwgIDQgKysr
Kwoga2VybmVsL3NjaGVkL2NvcmUuYyAgICAgICAgICB8IDE5ICsrKysrKysrKysrKysrLS0tLS0K
IG1tL21tdV9ub3RpZmllci5jICAgICAgICAgICAgfCAyNCArKysrKysrKysrKysrKysrKysrKysr
Ky0KIDUgZmlsZXMgY2hhbmdlZCwgNzMgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCi0t
IAoyLjIzLjAucmMxCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
