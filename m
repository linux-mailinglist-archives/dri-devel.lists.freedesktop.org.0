Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CCE2DE891
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 18:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A797D893B9;
	Fri, 18 Dec 2020 17:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594FE893A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 17:55:44 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id h16so3228808edt.7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 09:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewF5EIClYqqy4RXQ0HaSbN4c5NdKEVFW8AB8itR38dA=;
 b=jauBYRUNJuLZDse/TmUAPSsD+LJ/5+H48sxNJJ30Zl+Pu6N3Ch//pWHOVt1NqBAx9T
 KBLsx7OTGCjiF+AAjh4DIVu1Y2200GFaEeGMjgPOpyyURb6BeizPZm8+4R6Gg+/ilx/n
 kbdSTzgL8U1GIIKmo7tJoeCy/i9FhteN9VYOINhgzjKfp9uHNjVJU6GcLtrx2/TQw5HQ
 RWUQ6QLLm5nyU5mvFrkiZzcpyL2lMBjeY7pntECOnlvNHS3WyAub9Yn5Ym3xrX+VW+a9
 REe6tAz2wcMM1S88MAQGwl8vNaDJFii8Ix2GnPlLhO/RCeaSQxAlnRYRrbLY4M5hIHGj
 hLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ewF5EIClYqqy4RXQ0HaSbN4c5NdKEVFW8AB8itR38dA=;
 b=MOOk39DKll0ULkW3qni48e84cGSTyKZ0BKs80uu17ukc5qRv2N6ABuzPPLE9LxMvle
 uYBRkdMkn7Kc3yiSV0iyfVYFGlRPgIShUDzI/7/U+GSh4IC+6aREBfZIY3w7b+VstGt7
 G5inQWovwwJakEErbTAzvIXoP5QsJMfq9kmjBbTygKVSL1sXEPiIHUe23aJjQJTItjWU
 I9965KnOEu7c2FSXJauPQL2S0+kfYNW+Gqi4f/GvuX/KtLzyGB9gy3pNTE8CqCaczqud
 TaUJc2lDGb6SyRkruJn2K6mPx7DjALJgP8rIEMLY+XrsdF3cIgBNlNDyYvsbV/6nwSwG
 UFsw==
X-Gm-Message-State: AOAM530PavpEgp/yvNCHn8XfIabP6eAs1267CAAlk87owis3lkDx7Cxk
 r5+3SY6mxOtFwdFgMNn63ZScApivM5k=
X-Google-Smtp-Source: ABdhPJyglIhCALeVdX4tEKO+1uHx3GqN7STIXHydy7Oo/q16FczDWAp8FXgeZ88z9TmgYdNWP6pZeQ==
X-Received: by 2002:aa7:d485:: with SMTP id b5mr5450106edr.214.1608314142761; 
 Fri, 18 Dec 2020 09:55:42 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4769:42ab:9b50:97cf])
 by smtp.gmail.com with ESMTPSA id x6sm26751795edl.67.2020.12.18.09.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 09:55:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Date: Fri, 18 Dec 2020 18:55:38 +0100
Message-Id: <20201218175538.1364-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201218175538.1364-1-christian.koenig@amd.com>
References: <20201218175538.1364-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: ray.huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBpbml0aWFsaXplIHRoZSBETUEgY29oZXJlbnQgcG9vbHMgaWYgdGhleSBhcmUgdXNlZC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAyMyArKysrKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCmluZGV4IDFjZGFjZDU4NzUzYS4uZjA5ZTM0NjE0MjI2
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCkBAIC01MDQsMTAgKzUwNCwxMiBAQCB2b2lkIHR0bV9w
b29sX2luaXQoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcG9v
bC0+dXNlX2RtYV9hbGxvYyA9IHVzZV9kbWFfYWxsb2M7CiAJcG9vbC0+dXNlX2RtYTMyID0gdXNl
X2RtYTMyOwogCi0JZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytpKQot
CQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCi0JCQl0dG1fcG9vbF90eXBlX2luaXQo
JnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdLAotCQkJCQkgICBwb29sLCBpLCBqKTsKKwlpZiAo
dXNlX2RtYV9hbGxvYykgeworCQlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVT
OyArK2kpCisJCQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCisJCQkJdHRtX3Bvb2xf
dHlwZV9pbml0KCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSwKKwkJCQkJCSAgIHBvb2wsIGks
IGopOworCX0KIH0KIEVYUE9SVF9TWU1CT0wodHRtX3Bvb2xfaW5pdCk7CiAKQEAgLTUyMyw5ICs1
MjUsMTEgQEAgdm9pZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCkKIHsKIAl1
bnNpZ25lZCBpbnQgaSwgajsKIAotCWZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX0NBQ0hJTkdfVFlQ
RVM7ICsraSkKLQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQotCQkJdHRtX3Bvb2xf
dHlwZV9maW5pKCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSk7CisJaWYgKHBvb2wtPnVzZV9k
bWFfYWxsb2MpIHsKKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytp
KQorCQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQorCQkJCXR0bV9wb29sX3R5cGVf
ZmluaSgmcG9vbC0+Y2FjaGluZ1tpXS5vcmRlcnNbal0pOworCX0KIH0KIEVYUE9SVF9TWU1CT0wo
dHRtX3Bvb2xfZmluaSk7CiAKQEAgLTYzMCw2ICs2MzQsMTEgQEAgaW50IHR0bV9wb29sX2RlYnVn
ZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCiB7CiAJdW5zaWdu
ZWQgaW50IGk7CiAKKwlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKKwkJc2VxX3B1dHMobSwg
InVudXNlZFxuIik7CisJCXJldHVybiAwOworCX0KKwogCXR0bV9wb29sX2RlYnVnZnNfaGVhZGVy
KG0pOwogCiAJc3Bpbl9sb2NrKCZzaHJpbmtlcl9sb2NrKTsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
