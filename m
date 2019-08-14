Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2B08DEA5
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 22:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00F1A6E837;
	Wed, 14 Aug 2019 20:20:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC566E832
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 20:20:40 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s49so385345edb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 13:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U5KwhaOsa05mLs5dKsxyaJ8nPNTkq9L0E7PVwxBUg2k=;
 b=ZgCM/s6E7msBlyVrSdsB+oMjViM3HMUFtvNXAOO3HxqAGmDb2aeEE4N/LlWYSAr9ZL
 icNezKA9h3BW8UMB8bog729VeFILUcsbR9wzPAt28AEb7DESQmQ2h7wOQXs3MrvII3cd
 DZjntZwdmKOH04u2PVqY9zU7yHYTKz9ag6OTz66A/uGquktna2yFLzhFLheyxWuc+9v1
 bzcXiyi0aSkoG7+UDFpBf3J+TGIMo0FcM7lV3/wp55kCxaWjn3JmoMUYpCtivZdEMWsw
 bMFNBEyFch3NS6IaitEIF3A61HlACfIcbSLmH2zP1KdX6B7NwYY0ePLA/E+CgduWkCPC
 R8pw==
X-Gm-Message-State: APjAAAVNB/z3mi9N7QI4NTNAlL2Opda6S359fVGX7Aa/Ct5T/e4yU4RO
 TQA86G0q2KjJpOkg5XzZLuO6vw==
X-Google-Smtp-Source: APXvYqwr2QYX0Cwtm9mM9vEmD8lUn0css8IRklo25E0smQh544dGM+PTj5A8hH3aTQAPYL0Qh4N4uw==
X-Received: by 2002:a17:907:390:: with SMTP id
 ss16mr1324369ejb.46.1565814039028; 
 Wed, 14 Aug 2019 13:20:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id ns22sm84342ejb.9.2019.08.14.13.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 13:20:38 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/5] mm, notifier: Add a lockdep map for invalidate_range_start
Date: Wed, 14 Aug 2019 22:20:26 +0200
Message-Id: <20190814202027.18735-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
References: <20190814202027.18735-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U5KwhaOsa05mLs5dKsxyaJ8nPNTkq9L0E7PVwxBUg2k=;
 b=dtTpZc1TP3phfJWfjZ0TTcGZDEkgZeTx7+tiSVp14czRexPyqDM1gnaVtyCL269PpM
 uyr+QykzpH67/lUTpJRJ4qgJstssFYUgdSFMP71ckMZGGA6c+b2mIUyn+RNlKV5QMWnf
 BWavURm9nkk5uzc5rKnkwSgXxYm3JJg1jMKeM=
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
Cc: Michal Hocko <mhocko@suse.com>, linux-mm@kvack.org,
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

VGhpcyBpcyBhIHNpbWlsYXIgaWRlYSB0byB0aGUgZnNfcmVjbGFpbSBmYWtlIGxvY2tkZXAgbG9j
ay4gSXQncwpmYWlybHkgZWFzeSB0byBwcm92b2tlIGEgc3BlY2lmaWMgbm90aWZpZXIgdG8gYmUg
cnVuIG9uIGEgc3BlY2lmaWMKcmFuZ2U6IEp1c3QgcHJlcCBpdCwgYW5kIHRoZW4gbXVubWFwKCkg
aXQuCgpBIGJpdCBoYXJkZXIsIGJ1dCBzdGlsbCBkb2FibGUsIGlzIHRvIHByb3Zva2UgdGhlIG1t
dSBub3RpZmllcnMgZm9yCmFsbCB0aGUgdmFyaW91cyBjYWxsY2hhaW5zIHRoYXQgbWlnaHQgbGVh
ZCB0byB0aGVtLiBCdXQgYm90aCBhdCB0aGUKc2FtZSB0aW1lIGlzIHJlYWxseSBoYXJkIHRvIHJl
bGlhYmxlIGhpdCwgZXNwZWNpYWxseSB3aGVuIHlvdSB3YW50IHRvCmV4ZXJjaXNlIHBhdGhzIGxp
a2UgZGlyZWN0IHJlY2xhaW0gb3IgY29tcGFjdGlvbiwgd2hlcmUgaXQncyBub3QKZWFzeSB0byBj
b250cm9sIHdoYXQgZXhhY3RseSB3aWxsIGJlIHVubWFwcGVkLgoKQnkgaW50cm9kdWNpbmcgYSBs
b2NrZGVwIG1hcCB0byB0aWUgdGhlbSBhbGwgdG9nZXRoZXIgd2UgYWxsb3cgbG9ja2RlcAp0byBz
ZWUgYSBsb3QgbW9yZSBkZXBlbmRlbmNpZXMsIHdpdGhvdXQgaGF2aW5nIHRvIGFjdHVhbGx5IGhp
dCB0aGVtCmluIGEgc2luZ2xlIGNoYWxsY2hhaW4gd2hpbGUgdGVzdGluZy4KCkFzaWRlOiBTaW5j
ZSBJIHR5cGVkIHRoaXMgdG8gdGVzdCBpOTE1IG1tdSBub3RpZmllcnMgSSd2ZSBvbmx5IHJvbGxl
ZAp0aGlzIG91dCBmb3IgdGhlIGludmFsaWF0ZV9yYW5nZV9zdGFydCBjYWxsYmFjay4gSWYgdGhl
cmUncwppbnRlcmVzdCwgd2Ugc2hvdWxkIHByb2JhYmx5IHJvbGwgdGhpcyBvdXQgdG8gYWxsIG9m
IHRoZW0uIEJ1dCBteQp1bmRlc3RhbmRpbmcgb2YgY29yZSBtbSBpcyBzZXJpb3VzbHkgbGFja2lu
ZywgYW5kIEknbSBub3QgY2xlYXIgb24Kd2hldGhlciB3ZSBuZWVkIGEgbG9ja2RlcCBtYXAgZm9y
IGVhY2ggY2FsbGJhY2ssIG9yIHdoZXRoZXIgc29tZSBjYW4KYmUgc2hhcmVkLgoKdjI6IFVzZSBs
b2NrX21hcF9hY3F1aXJlL3JlbGVhc2UoKSBsaWtlIGZzX3JlY2xhaW0sIHRvIGF2b2lkIGNvbmZ1
c2lvbgp3aXRoIHRoaXMgYmVpbmcgYSByZWFsIG11dGV4IChDaHJpcyBXaWxzb24pLgoKdjM6IFJl
YmFzZSBvbiB0b3Agb2YgR2xpc3NlJ3MgYXJnIHJld29yay4KCkNjOiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0B6aWVwZS5jYT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IERhdmlk
IFJpZW50amVzIDxyaWVudGplc0Bnb29nbGUuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpn
bGlzc2VAcmVkaGF0LmNvbT4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzog
IkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBHcmVnIEty
b2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpDYzogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IE1pa2UgUmFwb3BvcnQgPHJwcHRAbGludXgu
dm5ldC5pYm0uY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnClJldmlld2VkLWJ5OiBKw6lyw7Rt
ZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9tbXVfbm90aWZp
ZXIuaCB8IDYgKysrKysrCiBtbS9tbXVfbm90aWZpZXIuYyAgICAgICAgICAgIHwgNyArKysrKysr
CiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21tdV9ub3RpZmllci5oIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaAppbmRl
eCBiNmMwMDRiZDlmNmEuLjlkZDM4YzMyZmM1MyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9t
bXVfbm90aWZpZXIuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCkBAIC00Miw2
ICs0MiwxMCBAQCBlbnVtIG1tdV9ub3RpZmllcl9ldmVudCB7CiAKICNpZmRlZiBDT05GSUdfTU1V
X05PVElGSUVSCiAKKyNpZmRlZiBDT05GSUdfTE9DS0RFUAorZXh0ZXJuIHN0cnVjdCBsb2NrZGVw
X21hcCBfX21tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcDsKKyNlbmRpZgor
CiAvKgogICogVGhlIG1tdSBub3RpZmllcl9tbSBzdHJ1Y3R1cmUgaXMgYWxsb2NhdGVkIGFuZCBp
bnN0YWxsZWQgaW4KICAqIG1tLT5tbXVfbm90aWZpZXJfbW0gaW5zaWRlIHRoZSBtbV90YWtlX2Fs
bF9sb2NrcygpIHByb3RlY3RlZApAQCAtMzEwLDEwICszMTQsMTIgQEAgc3RhdGljIGlubGluZSB2
b2lkIG1tdV9ub3RpZmllcl9jaGFuZ2VfcHRlKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAogc3RhdGlj
IGlubGluZSB2b2lkCiBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChzdHJ1Y3Qg
bW11X25vdGlmaWVyX3JhbmdlICpyYW5nZSkKIHsKKwlsb2NrX21hcF9hY3F1aXJlKCZfX21tdV9u
b3RpZmllcl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7CiAJaWYgKG1tX2hhc19ub3RpZmll
cnMocmFuZ2UtPm1tKSkgewogCQlyYW5nZS0+ZmxhZ3MgfD0gTU1VX05PVElGSUVSX1JBTkdFX0JM
T0NLQUJMRTsKIAkJX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydChyYW5nZSk7
CiAJfQorCWxvY2tfbWFwX3JlbGVhc2UoJl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vf
c3RhcnRfbWFwKTsKIH0KIAogc3RhdGljIGlubGluZSBpbnQKZGlmZiAtLWdpdCBhL21tL21tdV9u
b3RpZmllci5jIGIvbW0vbW11X25vdGlmaWVyLmMKaW5kZXggNDNhNzZkMDMwMTY0Li4zMzFlNDNj
ZTZmM2MgMTAwNjQ0Ci0tLSBhL21tL21tdV9ub3RpZmllci5jCisrKyBiL21tL21tdV9ub3RpZmll
ci5jCkBAIC0yMSw2ICsyMSwxMyBAQAogLyogZ2xvYmFsIFNSQ1UgZm9yIGFsbCBNTXMgKi8KIERF
RklORV9TVEFUSUNfU1JDVShzcmN1KTsKIAorI2lmZGVmIENPTkZJR19MT0NLREVQCitzdHJ1Y3Qg
bG9ja2RlcF9tYXAgX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXAgPSB7
CisJLm5hbWUgPSAibW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQiCit9OworRVhQ
T1JUX1NZTUJPTF9HUEwoX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXAp
OworI2VuZGlmCisKIC8qCiAgKiBUaGlzIGZ1bmN0aW9uIGFsbG93cyBtbXVfbm90aWZpZXI6OnJl
bGVhc2UgY2FsbGJhY2sgdG8gZGVsYXkgYSBjYWxsIHRvCiAgKiBhIGZ1bmN0aW9uIHRoYXQgd2ls
bCBmcmVlIGFwcHJvcHJpYXRlIHJlc291cmNlcy4gVGhlIGZ1bmN0aW9uIG11c3QgYmUKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
