Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835EE242F8
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 23:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C2589190;
	Mon, 20 May 2019 21:39:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09D9B89190
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 21:39:57 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id f37so25899393edb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 14:39:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eXUjiROiFGqrcZrxiXfMd6x0O70wFn+SjDBkygnZtOE=;
 b=oHgWDENSyIgRXx24cMZYN5g5uYKWOOrUI2ifIRkkDuAwZ0b8qEeip8ZONo6RMM4b/N
 0QHrDjNc4EjMlUiy01kdfOC0j6MPoSodZ/DVYYDKT/vVmoQe5PRh23KV6q+Yqx441e1V
 3wDbzLTVXX4pFBvPG+xg/RhPbYL6T3zULLr48jmVww6B908GMMS0T81kyzh/tfdgFN9W
 KWv8+IygtlIVH/8CxnNolLeSp/UtmDne+jstw6M0jCSkfA9mglEM/3e4DoNaNEKM2+/U
 8HYHpUDGQgVGmXn0KN+vjiExsYQAtzPn6ojqUJmH8Krr4s3uWJvdxViIceVeBB236smT
 LxUw==
X-Gm-Message-State: APjAAAU5F/Zg4GivIApNdrlfOaKV5YFwC7HKYBn00VZmHouzovYY+nF5
 +JkWscTFkrafS6UgDBqaPa6KNjaobOc=
X-Google-Smtp-Source: APXvYqz2Kva8jHAMyBKyLi3aGikci686nvq4u0U8stYOPI/ZCt3pyHtCQHVoinWV1c/CI2ko59Od2g==
X-Received: by 2002:a17:906:4d4f:: with SMTP id
 b15mr1630714ejv.116.1558388395426; 
 Mon, 20 May 2019 14:39:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id v27sm3285772eja.68.2019.05.20.14.39.53
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 14:39:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/4] mm, notifier: Catch sleeping/blocking for !blockable
Date: Mon, 20 May 2019 23:39:44 +0200
Message-Id: <20190520213945.17046-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eXUjiROiFGqrcZrxiXfMd6x0O70wFn+SjDBkygnZtOE=;
 b=HE+2jI9yKoWCqEtPmGEmHm4ylYNZon4lbb4PF4NHS53IZxF8pOEgpY8SO8PWwjK/yd
 Kr/K3az9UYI2fpQ8PMsRr6OEK8DOagVNchYQwPKerYeVImZ6A8MUoeqdUStHHSrf9OL7
 JAAzKQQ0avwTjuYS01lKURpWOQUYPaK/I6Hmg=
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
Cc: Michal Hocko <mhocko@suse.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBtYWtlIHN1cmUgaW1wbGVtZW50YXRpb25zIGRvbid0IGNoZWF0IGFuZCBkb24n
dCBoYXZlIGEKcG9zc2libGUgc2NoZWR1bGUvYmxvY2tpbmcgcG9pbnQgZGVlcGx5IGJ1cnJpZWQg
d2hlcmUgcmV2aWV3IGNhbid0CmNhdGNoIGl0LgoKSSdtIG5vdCBzdXJlIHdoZXRoZXIgdGhpcyBp
cyB0aGUgYmVzdCB3YXkgdG8gbWFrZSBzdXJlIGFsbCB0aGUKbWlnaHRfc2xlZXAoKSBjYWxsc2l0
ZXMgdHJpZ2dlciwgYW5kIGl0J3MgYSBiaXQgdWdseSBpbiB0aGUgY29kZSBmbG93LgpCdXQgaXQg
Z2V0cyB0aGUgam9iIGRvbmUuCgpJbnNwaXJlZCBieSBhbiBpOTE1IHBhdGNoIHNlcmllcyB3aGlj
aCBkaWQgZXhhY3RseSB0aGF0LCBiZWNhdXNlIHRoZQpydWxlcyBoYXZlbid0IGJlZW4gZW50aXJl
bHkgY2xlYXIgdG8gdXMuCgp2MjogVXNlIHRoZSBzaGlueSBuZXcgbm9uX2Jsb2NrX3N0YXJ0L2Vu
ZCBhbm5vdGF0aW9ucyBpbnN0ZWFkIG9mCmFidXNpbmcgcHJlZW1wdF9kaXNhYmxlL2VuYWJsZS4K
CnYzOiBSZWJhc2Ugb24gdG9wIG9mIEdsaXNzZSdzIGFyZyByZXdvcmsuCgp2NDogUmViYXNlIG9u
IHRvcCBvZiBtb3JlIEdsaXNzZSByZXdvcmsuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51
eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzog
RGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+CkNjOiAiQ2hyaXN0aWFuIEvDtm5p
ZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQuY29t
PgpDYzogbGludXgtbW1Aa3ZhY2sub3JnClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIG1tL21tdV9ub3RpZmllci5jIHwgOCArKysrKysr
LQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL21tL21tdV9ub3RpZmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMKaW5kZXggYzA1ZTQw
NmE3Y2Q3Li5hMDllNzM3NzExZDUgMTAwNjQ0Ci0tLSBhL21tL21tdV9ub3RpZmllci5jCisrKyBi
L21tL21tdV9ub3RpZmllci5jCkBAIC0xNzYsNyArMTc2LDEzIEBAIGludCBfX21tdV9ub3RpZmll
cl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdl
KQogCWlkID0gc3JjdV9yZWFkX2xvY2soJnNyY3UpOwogCWhsaXN0X2Zvcl9lYWNoX2VudHJ5X3Jj
dShtbiwgJnJhbmdlLT5tbS0+bW11X25vdGlmaWVyX21tLT5saXN0LCBobGlzdCkgewogCQlpZiAo
bW4tPm9wcy0+aW52YWxpZGF0ZV9yYW5nZV9zdGFydCkgewotCQkJaW50IF9yZXQgPSBtbi0+b3Bz
LT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1uLCByYW5nZSk7CisJCQlpbnQgX3JldDsKKworCQkJ
aWYgKCFtbXVfbm90aWZpZXJfcmFuZ2VfYmxvY2thYmxlKHJhbmdlKSkKKwkJCQlub25fYmxvY2tf
c3RhcnQoKTsKKwkJCV9yZXQgPSBtbi0+b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0KG1uLCBy
YW5nZSk7CisJCQlpZiAoIW1tdV9ub3RpZmllcl9yYW5nZV9ibG9ja2FibGUocmFuZ2UpKQorCQkJ
CW5vbl9ibG9ja19lbmQoKTsKIAkJCWlmIChfcmV0KSB7CiAJCQkJcHJfaW5mbygiJXBTIGNhbGxi
YWNrIGZhaWxlZCB3aXRoICVkIGluICVzYmxvY2thYmxlIGNvbnRleHQuXG4iLAogCQkJCQltbi0+
b3BzLT5pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0LCBfcmV0LAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
