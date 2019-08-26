Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4079D751
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 22:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ADC88F1B;
	Mon, 26 Aug 2019 20:14:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4339C88EA7
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 20:14:40 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id g8so28158523edm.6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bUhdeRpbg8gRloy4w33VnXTSeooO5sqpvDT0wx5DMzY=;
 b=m/i5r8EvQb1WnP/3pUJ4RMLMMuxHHHYQ36TXmIwX1vyD23NjoOIbQeOr8OYwyG+kBE
 WLjTj3lEusyCBIsvUP8P/R5H+ljM+/hhdqIg3ucGTgRGCGgG/k82muilNyJ4/+EiIUWL
 KC7m+PdDwPIstytBvOXrxxnS1vdQh8l3yl8UvG/tQ6gA386VKRGID70yXO0GOMtePBcR
 ZQ6cSz/5CiPTm4dhrl7H8QqmBDMtXo3XQQlnnMUtpmXgkaDF5rtE6WpWThxDPRVOAm2Q
 xmlzGT6GOlnTfoNfx3sgsylsMbNJy5TJylRVHTfzXC9/iIGNaBO2MNv3tcUQftDhRc8T
 8lXg==
X-Gm-Message-State: APjAAAWodRtYcb7wvgc227g8Bnn3rlLrVsi2uVPxvsu2bS2Qg8EnBxdB
 k/NF0yAjI9/ye8FIf8H6BmATcg==
X-Google-Smtp-Source: APXvYqwQX5rJn4xiT0PzmoOjk8RceDZHB/u+ViHnJA99I4EPasO1Ql6cGV43P/XDRPUyqHKPLLvlzQ==
X-Received: by 2002:aa7:c552:: with SMTP id s18mr21104247edr.0.1566850478492; 
 Mon, 26 Aug 2019 13:14:38 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id j25sm3000780ejb.49.2019.08.26.13.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 13:14:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/5] mm, notifier: annotate with might_sleep()
Date: Mon, 26 Aug 2019 22:14:25 +0200
Message-Id: <20190826201425.17547-6-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
References: <20190826201425.17547-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bUhdeRpbg8gRloy4w33VnXTSeooO5sqpvDT0wx5DMzY=;
 b=QViZPMOCt4TCBDSlKAVCdrC+U37mohUaGpt7t54fKUAJnII/M30PJe3HVgsMvO32I/
 JHmsQisAEo+uwv1GVmUHudMfC1x01ExLcWbO28gdRMZiZ/4jYiOIUrGZ6L9+5vRcVnku
 F9YxwgBgX7xnEA70Wp+hl/fz9/FJFtPM7Z4dQ=
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 David Rientjes <rientjes@google.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgbW11IG5vdGlmaWVycyBkb24ndCBleGlzdCBmb3IgbW9yZSBwcm9jZXNzZXMsIGJ1dCBj
b3VsZCBibG9jayBpbgppbnRlcmVzdGluZyBwbGFjZXMsIGFkZCBzb21lIGFubm90YXRpb25zLiBU
aGlzIHNob3VsZCBoZWxwIG1ha2Ugc3VyZQpjb3JlIG1tIGtlZXBzIHVwIGl0cyBlbmQgb2YgdGhl
IG1tdSBub3RpZmllciBjb250cmFjdC4KClRoZSBjaGVja3MgaGVyZSBhcmUgb3V0c2lkZSBvZiBh
bGwgbm90aWZpZXIgY2hlY2tzIGJlY2F1c2Ugb2YgdGhhdC4KVGhleSBjb21waWxlIGF3YXkgd2l0
aG91dCBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQLgoKU3VnZ2VzdGVkIGJ5IEphc29uLgoKQ2M6
IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBs
aW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpD
YzogRGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdvb2dsZS5jb20+CkNjOiAiQ2hyaXN0aWFuIEvD
tm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNzZUByZWRoYXQu
Y29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3JnClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvbGludXgvbW11X25vdGlmaWVy
LmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIuaCBiL2luY2x1ZGUvbGludXgvbW11X25vdGlm
aWVyLmgKaW5kZXggM2Y5ODI5YTFmMzJlLi44YjcxODEzNDE3ZTcgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvbW11X25vdGlmaWVyLmgKKysrIGIvaW5jbHVkZS9saW51eC9tbXVfbm90aWZpZXIu
aApAQCAtMzQ1LDYgKzM0NSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtbXVfbm90aWZpZXJfY2hh
bmdlX3B0ZShzdHJ1Y3QgbW1fc3RydWN0ICptbSwKIHN0YXRpYyBpbmxpbmUgdm9pZAogbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnQoc3RydWN0IG1tdV9ub3RpZmllcl9yYW5nZSAq
cmFuZ2UpCiB7CisJbWlnaHRfc2xlZXAoKTsKKwogCWxvY2tfbWFwX2FjcXVpcmUoJl9fbW11X25v
dGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbWFwKTsKIAlpZiAobW1faGFzX25vdGlmaWVy
cyhyYW5nZS0+bW0pKSB7CiAJCXJhbmdlLT5mbGFncyB8PSBNTVVfTk9USUZJRVJfUkFOR0VfQkxP
Q0tBQkxFOwpAQCAtMzY4LDYgKzM3MCw5IEBAIG1tdV9ub3RpZmllcl9pbnZhbGlkYXRlX3Jhbmdl
X3N0YXJ0X25vbmJsb2NrKHN0cnVjdCBtbXVfbm90aWZpZXJfcmFuZ2UgKnJhbmdlKQogc3RhdGlj
IGlubGluZSB2b2lkCiBtbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQoc3RydWN0IG1t
dV9ub3RpZmllcl9yYW5nZSAqcmFuZ2UpCiB7CisJaWYgKG1tdV9ub3RpZmllcl9yYW5nZV9ibG9j
a2FibGUocmFuZ2UpKQorCQltaWdodF9zbGVlcCgpOworCiAJaWYgKG1tX2hhc19ub3RpZmllcnMo
cmFuZ2UtPm1tKSkKIAkJX19tbXVfbm90aWZpZXJfaW52YWxpZGF0ZV9yYW5nZV9lbmQocmFuZ2Us
IGZhbHNlKTsKIH0KLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
