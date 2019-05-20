Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B9F22E6E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2019 10:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8448C892A1;
	Mon, 20 May 2019 08:22:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 593808928D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 08:22:39 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id n17so22608181edb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 01:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Yo/Zer+8+iZGO3QV40bLkqCAAdgnz/HLbmfJGGYr+Q=;
 b=n1YEfaAybDJMrTLp9CfH2oecV3q8o6QhyXtup8SRHvgAXOen8+cqD/x2GGz1rdS99Q
 YTURxTyBOccVcjT/mHp6ccI5zk6Q9GYsa43DmYKOdCnBfYuH8k8dmYP8lntiDazxZyQD
 obwa/aMzIFyiJovvCBV8roG4lrHvYh1mjrpPCzbKCqHd6w4RcNEPfwfhCYrWuZ3oE5Mf
 RwDd2fhEsyMA0jVOqTF+rVtgVI/YUWQbD1Q3DYQwNpmCKs+T9hdiiP6k15zXR9gNP7o2
 QQAIZkBbeyknkd6+qVyuIYH6FOZTakjX5Q00ANimfL3GfFVfubaocY3WODWa62GPW3XB
 GExw==
X-Gm-Message-State: APjAAAXW20PcmrwybzSbLram7FLycD1PYkABkwMR3q8Z39bDZT1qWVnv
 9FbyeHvLdLHD1xeO6TVmnz/K3bcs5wk=
X-Google-Smtp-Source: APXvYqzSNedje/GrhvJfy+yDfT67EfzYCBA9dSKXp3EwKybc9/rxqIqDEBVyCwEsyZ9DjbZ6qFx3XQ==
X-Received: by 2002:a17:906:66c9:: with SMTP id
 k9mr9493808ejp.21.1558340557540; 
 Mon, 20 May 2019 01:22:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id t25sm3021263ejx.8.2019.05.20.01.22.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 01:22:36 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/33] fbdev: sysfs files can't disappear before the device is
 gone
Date: Mon, 20 May 2019 10:21:56 +0200
Message-Id: <20190520082216.26273-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
References: <20190520082216.26273-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Yo/Zer+8+iZGO3QV40bLkqCAAdgnz/HLbmfJGGYr+Q=;
 b=LVMcjUHiu9elaHcvju6oijD096OkeD1rCO8uoQPNTGt0fOEVW6lb2YqOePOduwuC0R
 SnyyUwKDlhWGsP/P/rOme7Yyry2xo+zUigmnV26HCAqtqU23iZdbgd4nAQI2lcc6rkIS
 EhuEwvu9OKdJNj15SzU/r8nEGq/huZCyYiE5g=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpY2ggbWVhbnMgbG9ja19mYl9pbmZvIGNhbiBuZXZlciBmYWlsLiBSZW1vdmUgdGhlIGVycm9y
IGhhbmRsaW5nLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBm
ZndsbC5jaD4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNjOiBC
YXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5jb20+CkNjOiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2Zic3lzZnMuYyB8IDEwICsrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2Zic3lzZnMuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYnN5c2ZzLmMKaW5kZXgg
NDRjY2EzOWYyYjUxLi41ZjMyOTI3OGU1NWYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY29yZS9mYnN5c2ZzLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2Zic3lzZnMu
YwpAQCAtMTc5LDEwICsxNzksNyBAQCBzdGF0aWMgc3NpemVfdCBzdG9yZV9tb2RlcyhzdHJ1Y3Qg
ZGV2aWNlICpkZXZpY2UsCiAJCXJldHVybiAtRUlOVkFMOwogCiAJY29uc29sZV9sb2NrKCk7Ci0J
aWYgKCFsb2NrX2ZiX2luZm8oZmJfaW5mbykpIHsKLQkJY29uc29sZV91bmxvY2soKTsKLQkJcmV0
dXJuIC1FTk9ERVY7Ci0JfQorCWxvY2tfZmJfaW5mbyhmYl9pbmZvKTsKIAogCWxpc3Rfc3BsaWNl
KCZmYl9pbmZvLT5tb2RlbGlzdCwgJm9sZF9saXN0KTsKIAlmYl92aWRlb21vZGVfdG9fbW9kZWxp
c3QoKGNvbnN0IHN0cnVjdCBmYl92aWRlb21vZGUgKilidWYsIGksCkBAIC00MDksMTAgKzQwNiw3
IEBAIHN0YXRpYyBzc2l6ZV90IHN0b3JlX2Zic3RhdGUoc3RydWN0IGRldmljZSAqZGV2aWNlLAog
CXN0YXRlID0gc2ltcGxlX3N0cnRvdWwoYnVmLCAmbGFzdCwgMCk7CiAKIAljb25zb2xlX2xvY2so
KTsKLQlpZiAoIWxvY2tfZmJfaW5mbyhmYl9pbmZvKSkgewotCQljb25zb2xlX3VubG9jaygpOwot
CQlyZXR1cm4gLUVOT0RFVjsKLQl9CisJbG9ja19mYl9pbmZvKGZiX2luZm8pOwogCiAJZmJfc2V0
X3N1c3BlbmQoZmJfaW5mbywgKGludClzdGF0ZSk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
