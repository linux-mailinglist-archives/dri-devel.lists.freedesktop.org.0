Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB19D74B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198AD88E45;
	Mon, 26 Aug 2019 20:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF01488E35
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:14:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t50so28194390edd.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=43MMkU2nAs7jtnMnw+TAIk5AMkJWGIqIB3w6SHg2dOA=;
 b=OIXMaFsOifmuLQXTgeNiIKFlLFHgPJk9ubPV3CgPnJIWNW+W2xYF0ciBO8cGuCS/7i
 8If5/uEGNay1T4b8a1tSZtBihodJaqnoTsRfc6C78P6ih19vn6Aq6bjPoV6poktPWDHi
 1ggzh36oZ83xdeRAM/dNgcqjlh4Qe6U8KUEEFK0W3fZ1NLJZK6lMlQOrdLU6pz15/KIl
 qNcap7OrV7LxSNdWltxEz3vHOYdeqar2HiIvmBXc9Pj41b0Y6veRAz+fVopo/rS2p/ko
 qWM5E9vNx17O+Ujde0ctcMzEPnCupdj5AZfN9TGeMM3OXkqbwcJ5bJ8EKeRsQz9uy7Uk
 7NQg==
X-Gm-Message-State: APjAAAXFM6Z2Ribi9fBgnxyKfbAfLnmKgfSoYOFAJNt6ayTHJIIaNVgn
 PEyac7NaUdDIfe+gx0g1JOl5qg==
X-Google-Smtp-Source: APXvYqz1alL5dlGwBBuOouoL2tngfggzrmMx20gafiZ6V+aQeNinylzwLOpzJO1HhOF4TDXl6u3nsA==
X-Received: by 2002:a50:d0cc:: with SMTP id g12mr19859322edf.201.1566850474445; 
 Mon, 26 Aug 2019 13:14:34 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j25sm3000780ejb.49.2019.08.26.13.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:14:33 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/5] mm, notifier: Prime lockdep
Date: Mon, 26 Aug 2019 22:14:22 +0200
Message-Id: <20190826201425.17547-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=43MMkU2nAs7jtnMnw+TAIk5AMkJWGIqIB3w6SHg2dOA=;
 b=jWs+/c0l0gQqLqnonUguMXmcEgRnSUc9uFPRnBjVNs1Nfg/BKnOJH3T6iKhSC9eb6q
 dpAfCEkDXZ40OJ02lIV0O9i7OYhqlEmJrKDApByW1yfFG3TBOGtD29nnDadAmOX0w/3a
 ohtG4NM02aYnLMkZ4fScN1kWA5UKzPn2mVZA0=
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jason Gunthorpe <jgg@mellanox.com>,
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
cmcKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogbW0v
bW11X25vdGlmaWVyLmMgfCA3ICsrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9tbS9tbXVfbm90aWZpZXIuYyBiL21tL21tdV9ub3RpZmllci5jCmlu
ZGV4IGQ0OGQzYjJhYmQ2OC4uMDUyMzU1NTkzM2M5IDEwMDY0NAotLS0gYS9tbS9tbXVfbm90aWZp
ZXIuYworKysgYi9tbS9tbXVfbm90aWZpZXIuYwpAQCAtMjU5LDYgKzI1OSwxMyBAQCBpbnQgX19t
bXVfbm90aWZpZXJfcmVnaXN0ZXIoc3RydWN0IG1tdV9ub3RpZmllciAqbW4sIHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tKQogCWxvY2tkZXBfYXNzZXJ0X2hlbGRfd3JpdGUoJm1tLT5tbWFwX3NlbSk7CiAJ
QlVHX09OKGF0b21pY19yZWFkKCZtbS0+bW1fdXNlcnMpIDw9IDApOwogCisJaWYgKElTX0VOQUJM
RUQoQ09ORklHX0xPQ0tERVApKSB7CisJCWZzX3JlY2xhaW1fYWNxdWlyZShHRlBfS0VSTkVMKTsK
KwkJbG9ja19tYXBfYWNxdWlyZSgmX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFy
dF9tYXApOworCQlsb2NrX21hcF9yZWxlYXNlKCZfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jh
bmdlX3N0YXJ0X21hcCk7CisJCWZzX3JlY2xhaW1fcmVsZWFzZShHRlBfS0VSTkVMKTsKKwl9CisK
IAltbi0+bW0gPSBtbTsKIAltbi0+dXNlcnMgPSAxOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
