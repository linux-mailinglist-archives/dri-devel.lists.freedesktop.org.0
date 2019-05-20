Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB009242F9
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 23:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14EDD89258;
	Mon, 20 May 2019 21:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CB989258
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 21:39:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id l25so25931346eda.9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 14:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pWxZTOU32QqeCUWxSxBPbL225yVTtI+hlaFCbsgM9zc=;
 b=rddOEgWMZYozxczE0rJMwR7Iw9zzJUbDQoceTpDSsCKsxm23hOQ42lppMSXM6kIakn
 coYiqe98sqF1uRe+pVvhaPqdhxS6lgNpZXciro5e1RlEpRbgHvZrBs2ZoATorY3zheO/
 3UsqGTI4at9igc4CBh0q6Oppb3ONuATU3N2D2L7TdIIlrv9I0Y2kDyHIwFjLkXOQlIcT
 4bovsf/aVKbMyAnkXsRlpcH+gyeXjsuppMDMNUUhhpEFubrBkyPH4YFPRNVcWwNcQmxM
 bOCrLTbQ//QJl4YrHn+x/bjMKZqO/8/o4Fgk1PqHE1fM5xdPfX09vBCME6UWS7pe62/A
 UcEw==
X-Gm-Message-State: APjAAAUkoMDWl4QH+nG39HI8oNrg1W4cj8uZgo7lSMZabnDVzcjWAJ2V
 2dUFwP/IXE0IU+9ixXXsEA3SSFfGtBE=
X-Google-Smtp-Source: APXvYqx80jEeRT18HZXVIF2BoTYuZwcSTE9+LxH0PFGQif7m2Gu96O3Mba57kRuyzhiZzeoU6L992A==
X-Received: by 2002:a17:906:5390:: with SMTP id
 g16mr53949638ejo.12.1558388396676; 
 Mon, 20 May 2019 14:39:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id v27sm3285772eja.68.2019.05.20.14.39.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 14:39:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 4/4] mm, notifier: Add a lockdep map for invalidate_range_start
Date: Mon, 20 May 2019 23:39:45 +0200
Message-Id: <20190520213945.17046-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
References: <20190520213945.17046-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pWxZTOU32QqeCUWxSxBPbL225yVTtI+hlaFCbsgM9zc=;
 b=lD66uZtMoIMvvSsmt5W9Ap+FV3+sBqSE3BFc0cEJ684d/bm9E2HP1JXq7mSRH9YW4v
 nkbstF3kFQkxqWWqyv6BlV3/MFaD+qTRyQzGtP0efOBVs1Kb0ZlKW4eRerQFHNS9iDrt
 TmWczlsEj0ymWwKCv4nAMDK83tVqOnaVQm3Tg=
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
Cc: Michal Hocko <mhocko@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
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
YmFzZSBvbiB0b3Agb2YgR2xpc3NlJ3MgYXJnIHJld29yay4KCkNjOiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91
bmRhdGlvbi5vcmc+CkNjOiBEYXZpZCBSaWVudGplcyA8cmllbnRqZXNAZ29vZ2xlLmNvbT4KQ2M6
ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiBNaWNoYWwgSG9ja28g
PG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5p
Z0BhbWQuY29tPgpDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBNaWtl
IFJhcG9wb3J0IDxycHB0QGxpbnV4LnZuZXQuaWJtLmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
LS0tCiBpbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oIHwgNiArKysrKysKIG1tL21tdV9ub3Rp
Zmllci5jICAgICAgICAgICAgfCA3ICsrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW11X25vdGlmaWVyLmggYi9pbmNs
dWRlL2xpbnV4L21tdV9ub3RpZmllci5oCmluZGV4IGI2YzAwNGJkOWY2YS4uOWRkMzhjMzJmYzUz
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tdV9ub3RpZmllci5oCisrKyBiL2luY2x1ZGUv
bGludXgvbW11X25vdGlmaWVyLmgKQEAgLTQyLDYgKzQyLDEwIEBAIGVudW0gbW11X25vdGlmaWVy
X2V2ZW50IHsKIAogI2lmZGVmIENPTkZJR19NTVVfTk9USUZJRVIKIAorI2lmZGVmIENPTkZJR19M
T0NLREVQCitleHRlcm4gc3RydWN0IGxvY2tkZXBfbWFwIF9fbW11X25vdGlmaWVyX2ludmFsaWRh
dGVfcmFuZ2Vfc3RhcnRfbWFwOworI2VuZGlmCisKIC8qCiAgKiBUaGUgbW11IG5vdGlmaWVyX21t
IHN0cnVjdHVyZSBpcyBhbGxvY2F0ZWQgYW5kIGluc3RhbGxlZCBpbgogICogbW0tPm1tdV9ub3Rp
Zmllcl9tbSBpbnNpZGUgdGhlIG1tX3Rha2VfYWxsX2xvY2tzKCkgcHJvdGVjdGVkCkBAIC0zMTAs
MTAgKzMxNCwxMiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbW11X25vdGlmaWVyX2NoYW5nZV9wdGUo
c3RydWN0IG1tX3N0cnVjdCAqbW0sCiBzdGF0aWMgaW5saW5lIHZvaWQKIG1tdV9ub3RpZmllcl9p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQog
eworCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3Rh
cnRfbWFwKTsKIAlpZiAobW1faGFzX25vdGlmaWVycyhyYW5nZS0+bW0pKSB7CiAJCXJhbmdlLT5m
bGFncyB8PSBNTVVfTk9USUZJRVJfUkFOR0VfQkxPQ0tBQkxFOwogCQlfX21tdV9ub3RpZmllcl9p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0KHJhbmdlKTsKIAl9CisJbG9ja19tYXBfcmVsZWFzZSgmX19t
bXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9zdGFydF9tYXApOwogfQogCiBzdGF0aWMgaW5s
aW5lIGludApkaWZmIC0tZ2l0IGEvbW0vbW11X25vdGlmaWVyLmMgYi9tbS9tbXVfbm90aWZpZXIu
YwppbmRleCBhMDllNzM3NzExZDUuLjMzYmRhZGRmYjliMSAxMDA2NDQKLS0tIGEvbW0vbW11X25v
dGlmaWVyLmMKKysrIGIvbW0vbW11X25vdGlmaWVyLmMKQEAgLTIzLDYgKzIzLDEzIEBACiAvKiBn
bG9iYWwgU1JDVSBmb3IgYWxsIE1NcyAqLwogREVGSU5FX1NUQVRJQ19TUkNVKHNyY3UpOwogCisj
aWZkZWYgQ09ORklHX0xPQ0tERVAKK3N0cnVjdCBsb2NrZGVwX21hcCBfX21tdV9ub3RpZmllcl9p
bnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCA9IHsKKwkubmFtZSA9ICJtbXVfbm90aWZpZXJfaW52
YWxpZGF0ZV9yYW5nZV9zdGFydCIKK307CitFWFBPUlRfU1lNQk9MX0dQTChfX21tdV9ub3RpZmll
cl9pbnZhbGlkYXRlX3JhbmdlX3N0YXJ0X21hcCk7CisjZW5kaWYKKwogLyoKICAqIFRoaXMgZnVu
Y3Rpb24gYWxsb3dzIG1tdV9ub3RpZmllcjo6cmVsZWFzZSBjYWxsYmFjayB0byBkZWxheSBhIGNh
bGwgdG8KICAqIGEgZnVuY3Rpb24gdGhhdCB3aWxsIGZyZWUgYXBwcm9wcmlhdGUgcmVzb3VyY2Vz
LiBUaGUgZnVuY3Rpb24gbXVzdCBiZQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
