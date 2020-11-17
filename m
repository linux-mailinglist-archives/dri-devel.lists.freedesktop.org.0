Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E89D92B6A58
	for <lists+dri-devel@lfdr.de>; Tue, 17 Nov 2020 17:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FB26E055;
	Tue, 17 Nov 2020 16:33:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E036E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 16:33:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so23857821wrx.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 08:33:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5RsanfRMYtRZA34lNmf+rYEAQYFMbVrpX6WJujlT6tI=;
 b=QNKFaM+5LUQOGP8rG/b6WOyWh/yALFulKhu7QdeT9qRvy3vu0rWkc9yL+OcusfOmO2
 WV6HRBSSjOngsEoV6AuBpJ+i7jtl4QcsDsnNknC6rn/VqIwzO5NOYHuG/2grJCXcN7m8
 iaHkSZIJLRAmNSVdbKnuh5bx/ogwcO5pUnw5wnZkdvcnajAFRurEkNvW8pTD41c5qv5P
 CEeNKgeEC5sKWBM3S6YETpgt+EdKZsTqGTTwTdfhyI+bDFRkd/9614T+J2t3dOBMth3m
 9ZB/HRSVNzGa0631O43oeX84zhAykfoPUoOR4Uqe5Gk2rpTltbLwRuCxdegyW0JMVB5s
 RwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5RsanfRMYtRZA34lNmf+rYEAQYFMbVrpX6WJujlT6tI=;
 b=b+Lac5UIDUVWdeUSC9DlCUzzMnabFkFKHF2HH64uoVXJidikojnQd5zNc3r+GZJ70Z
 Y5h4WKumiNEtxE8wMoJteTS51CkGNlq8YQQtJNU/jnVJ3yKesda71J1a647Y5MFBxdzQ
 ss7Goy9NbaUQKkugiBwM6XfIL5jNVk8w1klMX9TzFjm30DtDyJLcTacjNBVtOPDSAm75
 12C1W9xGzn0BfQ+4K6uKNoLNXd/UwrpGeGP7OzmmYXBFSkzV++7dsSvaq0opfU5PgP9A
 rnDaoGe1a8MJe96nnZsR774CAUK0YGuEuSJ68TvyBrGSTkS1iTxjLmrft8iXfirx6SSk
 QSig==
X-Gm-Message-State: AOAM532abhqBJ572EAoegqVabQer7hT91JFsJgFgRepYRhQsldBz0Tr7
 Q79KtVgnvk5EsigWmK9wswMhqZmu39U=
X-Google-Smtp-Source: ABdhPJzepOp7tOHOIIAYzanqvCsnXmXLWfk9bPQuwuV7nVK1x6xdUpn21vpmY6f039DQnwjGQ+9lwg==
X-Received: by 2002:a17:906:13d2:: with SMTP id
 g18mr1682881ejc.76.1605630822495; 
 Tue, 17 Nov 2020 08:33:42 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:dd48:f15c:7bed:4c52])
 by smtp.gmail.com with ESMTPSA id dn16sm12225351edb.19.2020.11.17.08.33.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 08:33:42 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Date: Tue, 17 Nov 2020 17:33:38 +0100
Message-Id: <20201117163338.1784-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201117163338.1784-1-christian.koenig@amd.com>
References: <20201117163338.1784-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T25seSBpbml0aWFsaXplIHRoZSBETUEgY29oZXJlbnQgcG9vbHMgaWYgdGhleSBhcmUgdXNlZC4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAyMyArKysrKysrKysrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCmluZGV4IDVkYWY4MTI1NTFlZS4uNTQyNTNhYTA5ZmZi
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCkBAIC01MDgsMTAgKzUwOCwxMiBAQCB2b2lkIHR0bV9w
b29sX2luaXQoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcG9v
bC0+dXNlX2RtYV9hbGxvYyA9IHVzZV9kbWFfYWxsb2M7CiAJcG9vbC0+dXNlX2RtYTMyID0gdXNl
X2RtYTMyOwogCi0JZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytpKQot
CQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCi0JCQl0dG1fcG9vbF90eXBlX2luaXQo
JnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdLAotCQkJCQkgICBwb29sLCBpLCBqKTsKKwlpZiAo
dXNlX2RtYV9hbGxvYykgeworCQlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVT
OyArK2kpCisJCQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCisJCQkJdHRtX3Bvb2xf
dHlwZV9pbml0KCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSwKKwkJCQkJCSAgIHBvb2wsIGks
IGopOworCX0KIH0KIEVYUE9SVF9TWU1CT0wodHRtX3Bvb2xfaW5pdCk7CiAKQEAgLTUyNyw5ICs1
MjksMTEgQEAgdm9pZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCkKIHsKIAl1
bnNpZ25lZCBpbnQgaSwgajsKIAotCWZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX0NBQ0hJTkdfVFlQ
RVM7ICsraSkKLQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQotCQkJdHRtX3Bvb2xf
dHlwZV9maW5pKCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSk7CisJaWYgKHBvb2wtPnVzZV9k
bWFfYWxsb2MpIHsKKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytp
KQorCQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQorCQkJCXR0bV9wb29sX3R5cGVf
ZmluaSgmcG9vbC0+Y2FjaGluZ1tpXS5vcmRlcnNbal0pOworCX0KIH0KIEVYUE9SVF9TWU1CT0wo
dHRtX3Bvb2xfZmluaSk7CiAKQEAgLTU5OCw2ICs2MDIsMTEgQEAgaW50IHR0bV9wb29sX2RlYnVn
ZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCiB7CiAJdW5zaWdu
ZWQgaW50IGk7CiAKKwlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKKwkJc2VxX3B1dHMobSwg
InVudXNlZFxuIik7CisJCXJldHVybiAwOworCX0KKwogCXR0bV9wb29sX2RlYnVnZnNfaGVhZGVy
KG0pOwogCiAJc3Bpbl9sb2NrKCZzaHJpbmtlcl9sb2NrKTsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
