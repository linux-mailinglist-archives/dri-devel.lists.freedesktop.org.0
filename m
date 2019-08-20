Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A1A95981
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 10:29:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B88D36E829;
	Tue, 20 Aug 2019 08:19:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6966E820
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 08:19:12 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id h13so5333341edq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 01:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRs5HpBA3qSqFe5qnt1LL6h0B7I2hzSM+r7A2DpfdeU=;
 b=WT3mHHhxDducO6x7VSSelr96a/0daGO5XKxP/kBkc2qht+ArKP26SyeHhY54r/Byrr
 pE9zTQHDZpmZaZlGXEgRKe5sCcDmKUIMVdXzUshFXaEL5gf21UofdCZBffWS/vjvUVQQ
 WijpkP8wtDybVKZzb+oHrMxIGJlCvnngrZ1vXlehoTNcXEW5355f3CNdZaoMoNkeo9bm
 Cvy7BQriedfrsbSNyQ9vkIRy4g+rx3hKgVsMcXHy1alr7Z9NPdqGk8G7JSdKGHTjDj88
 C8HoJ3tvBlrCUL1RY3jROCGHB9rxki9d5tsyN6p7G7b8Hb+1y0PfaL6ouQVMaZfKAnBO
 in6A==
X-Gm-Message-State: APjAAAW9PikkKLf9X1PgfAYPxSo46qA+SGi9+3wqVAJrbb1bsUuJ57Ju
 fI550c2o7GEd7trf5b8taaCi7g==
X-Google-Smtp-Source: APXvYqzwk/VVcEGb/uEJb+MjHFqWnLqThVvSK3PFeDiC0L0cxhC/+XJhzn783w4kD3r5dKVWby8hcQ==
X-Received: by 2002:aa7:c498:: with SMTP id m24mr12784881edq.277.1566289150887; 
 Tue, 20 Aug 2019 01:19:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id fj15sm2469623ejb.78.2019.08.20.01.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 01:19:10 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/4] mm, notifier: Prime lockdep
Date: Tue, 20 Aug 2019 10:19:00 +0200
Message-Id: <20190820081902.24815-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
References: <20190820081902.24815-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HRs5HpBA3qSqFe5qnt1LL6h0B7I2hzSM+r7A2DpfdeU=;
 b=H3IaTIIKcnZxd8XaCn8QCH9mcrNGjOx/ak2ybd66H0ki331clYHFNQzkO0bKWcuXsr
 Mq6+jU/jrdI7HQWeHyhaTDSfFkUDTPsmPa++H2SDWnl1ZAvHNh4YpUIn825O4i0/plh8
 z09eHCYqJKERfRBDZg/Pr+cpNjod1qv2vMJ8w=
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
Cc: Michal Hocko <mhocko@suse.com>, Linux MM <linux-mm@kvack.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Mike Rapoport <rppt@linux.vnet.ibm.com>, David Rientjes <rientjes@google.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2FudCB0byB0ZWFjaCBsb2NrZGVwIHRoYXQgbW11IG5vdGlmaWVycyBjYW4gYmUgY2FsbGVk
IGZyb20gZGlyZWN0CnJlY2xhaW0gcGF0aHMsIHNpbmNlIG9uIG1hbnkgQ0kgc3lzdGVtcyBsb2Fk
IG1pZ2h0IG5ldmVyIHJlYWNoIHRoYXQKbGV2ZWwgKGUuZy4gd2hlbiBqdXN0IHJ1bm5pbmcgZnV6
emVyIG9yIHNtYWxsIGZ1bmN0aW9uYWwgdGVzdHMpLgoKTW90aXZhdGVkIGJ5IGEgZGlzY3Vzc2lv
biB3aXRoIEphc29uLgoKSSd2ZSBwdXQgdGhlIGFubm90YXRpb24gaW50byBtbXVfbm90aWZpZXJf
cmVnaXN0ZXIgc2luY2Ugb25seSB3aGVuIHdlCmhhdmUgbW11IG5vdGlmaWVycyByZWdpc3RlcmVk
IGlzIHRoZXJlIGFueSBwb2ludCBpbiB0ZWFjaGluZyBsb2NrZGVwCmFib3V0IHRoZW0uIEFsc28s
IHdlIGFscmVhZHkgaGF2ZSBhIGttYWxsb2MoLCBHRlBfS0VSTkVMKSwgc28gdGhpcyBpcwpzYWZl
LgoKQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogQ2hyaXMgV2lsc29uIDxj
aHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZv
dW5kYXRpb24ub3JnPgpDYzogRGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+CkNj
OiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogTWljaGFsIEhvY2tv
IDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogTWlr
ZSBSYXBvcG9ydCA8cnBwdEBsaW51eC52bmV0LmlibS5jb20+CkNjOiBsaW51eC1tbUBrdmFjay5v
cmcKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+
Ci0tLQogbW0vbW11X25vdGlmaWVyLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3Rp
Zmllci5jCmluZGV4IGQxMmUzMDc5ZTdhNC4uNTM4ZDNiYjg3ZjliIDEwMDY0NAotLS0gYS9tbS9t
bXVfbm90aWZpZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMjU2LDYgKzI1NiwxMyBA
QCBzdGF0aWMgaW50IGRvX21tdV9ub3RpZmllcl9yZWdpc3RlcihzdHJ1Y3QgbW11X25vdGlmaWVy
ICptbiwKIAogCUJVR19PTihhdG9taWNfcmVhZCgmbW0tPm1tX3VzZXJzKSA8PSAwKTsKIAorCWlm
IChJU19FTkFCTEVEKENPTkZJR19MT0NLREVQKSkgeworCQlmc19yZWNsYWltX2FjcXVpcmUoR0ZQ
X0tFUk5FTCk7CisJCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVf
cmFuZ2Vfc3RhcnRfbWFwKTsKKwkJbG9ja19tYXBfcmVsZWFzZSgmX19tbXVfbm90aWZpZXJfaW52
YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOworCQlmc19yZWNsYWltX3JlbGVhc2UoR0ZQX0tFUk5F
TCk7CisJfQorCiAJcmV0ID0gLUVOT01FTTsKIAltbXVfbm90aWZpZXJfbW0gPSBrbWFsbG9jKHNp
emVvZihzdHJ1Y3QgbW11X25vdGlmaWVyX21tKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKHVubGlrZWx5
KCFtbXVfbm90aWZpZXJfbW0pKQotLSAKMi4yMy4wLnJjMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
