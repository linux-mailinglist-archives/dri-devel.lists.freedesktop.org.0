Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD232FB60F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 13:18:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB706E877;
	Tue, 19 Jan 2021 12:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8486E871
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:18:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id gx5so8940457ejb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 04:18:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=am4EeStR9m76doJ/yyB5TRIGf4Z+bQhxXz/r5WL0x9I=;
 b=rVPA4GBNqxCRtRpsGrR1R7ySyUnknsl5l1qxC/YX7PTlb8e+4BikFE6QkOlv65aXM2
 /4ml3+Q6lnsAKFuG85iSsZmpcdzQNglw1ewpaBb2RD78tezgzYZB9oV5FW/j7WyDGOxX
 wM/pQkb55END23NJhxbVz1LO1HxZTHYxmn4fS+vIgNBImrlagW9rhcd3bt5w4Xiyab5I
 /Al+xZDvkREB68c1VXQ1QRxL1imu2wo382FNMsNNp9HIsgs0IkITHime3tVuZ++QlCrg
 MxadHokdepaaazjpiAOoCmA2XBsndeKFA/lQKBFfIN8oDo2oc7EoIvKYOkb7R+T1RVe0
 3XuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=am4EeStR9m76doJ/yyB5TRIGf4Z+bQhxXz/r5WL0x9I=;
 b=byYzZoEtJ5Y3XiQb2ymtp+y8sUO/Ay2IasMAH1b3feoVfoq1Spueop6R1BQD0x6wia
 YEnukWiqLUgRex9wxc6VyNn4fvlcwrt8a5cR2HTVwJI20Oa9yOgD0hjhpdoP2Owd2Vo9
 xi7GHAhcfWZm7FllBb/3iiPggP4IBj8tu6V4ihUtLQmraqJVewVOVF14Txpa9V6HXED6
 /3tor+El1/5cWIk+Mc2Ei5gORaltlOZ0n8GzXXNDu0kIaFz39YjU6p1H/9IC6bHePhiM
 EcznXGJ2q4GKvJ3DgPvltjj7Kx61xx5X2BWRvzAD/Tu20K40WD9d0a/b4fbmXlbJz4+o
 YPhg==
X-Gm-Message-State: AOAM531VR4qWandFZQebWHNVARyuH5NwsNqfHcPtFKU9uF//WP/A2bJF
 EV0Is+7ZLo+Xi4RB29yNQGocvz72j5Q=
X-Google-Smtp-Source: ABdhPJxaBNjNTKbxWAlR/Ba82RRIHLWsjD7wQk2lxbRqzmEJ6Tq1k0Jxvt3sac9qKCM5IlWv1EG8Fg==
X-Received: by 2002:a17:906:b186:: with SMTP id
 w6mr2888280ejy.477.1611058705174; 
 Tue, 19 Jan 2021 04:18:25 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b05c:1403:9024:973b])
 by smtp.gmail.com with ESMTPSA id q9sm7090422ejd.113.2021.01.19.04.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 04:18:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: optimize ttm pool shrinker a bit
Date: Tue, 19 Jan 2021 13:18:21 +0100
Message-Id: <20210119121821.2320-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119121821.2320-1-christian.koenig@amd.com>
References: <20210119121821.2320-1-christian.koenig@amd.com>
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
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCmluZGV4IDk4ZWNiOWM5ODQyYy4uZTA2MTc3MTcxMTNm
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCkBAIC01MDUsMTAgKzUwNSwxMiBAQCB2b2lkIHR0bV9w
b29sX2luaXQoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAJcG9v
bC0+dXNlX2RtYV9hbGxvYyA9IHVzZV9kbWFfYWxsb2M7CiAJcG9vbC0+dXNlX2RtYTMyID0gdXNl
X2RtYTMyOwogCi0JZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytpKQot
CQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCi0JCQl0dG1fcG9vbF90eXBlX2luaXQo
JnBvb2wtPmNhY2hpbmdbaV0ub3JkZXJzW2pdLAotCQkJCQkgICBwb29sLCBpLCBqKTsKKwlpZiAo
dXNlX2RtYV9hbGxvYykgeworCQlmb3IgKGkgPSAwOyBpIDwgVFRNX05VTV9DQUNISU5HX1RZUEVT
OyArK2kpCisJCQlmb3IgKGogPSAwOyBqIDwgTUFYX09SREVSOyArK2opCisJCQkJdHRtX3Bvb2xf
dHlwZV9pbml0KCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSwKKwkJCQkJCSAgIHBvb2wsIGks
IGopOworCX0KIH0KIEVYUE9SVF9TWU1CT0wodHRtX3Bvb2xfaW5pdCk7CiAKQEAgLTUyNCw5ICs1
MjYsMTEgQEAgdm9pZCB0dG1fcG9vbF9maW5pKHN0cnVjdCB0dG1fcG9vbCAqcG9vbCkKIHsKIAl1
bnNpZ25lZCBpbnQgaSwgajsKIAotCWZvciAoaSA9IDA7IGkgPCBUVE1fTlVNX0NBQ0hJTkdfVFlQ
RVM7ICsraSkKLQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQotCQkJdHRtX3Bvb2xf
dHlwZV9maW5pKCZwb29sLT5jYWNoaW5nW2ldLm9yZGVyc1tqXSk7CisJaWYgKHBvb2wtPnVzZV9k
bWFfYWxsb2MpIHsKKwkJZm9yIChpID0gMDsgaSA8IFRUTV9OVU1fQ0FDSElOR19UWVBFUzsgKytp
KQorCQkJZm9yIChqID0gMDsgaiA8IE1BWF9PUkRFUjsgKytqKQorCQkJCXR0bV9wb29sX3R5cGVf
ZmluaSgmcG9vbC0+Y2FjaGluZ1tpXS5vcmRlcnNbal0pOworCX0KIH0KIEVYUE9SVF9TWU1CT0wo
dHRtX3Bvb2xfZmluaSk7CiAKQEAgLTYzMSw2ICs2MzUsMTEgQEAgaW50IHR0bV9wb29sX2RlYnVn
ZnMoc3RydWN0IHR0bV9wb29sICpwb29sLCBzdHJ1Y3Qgc2VxX2ZpbGUgKm0pCiB7CiAJdW5zaWdu
ZWQgaW50IGk7CiAKKwlpZiAoIXBvb2wtPnVzZV9kbWFfYWxsb2MpIHsKKwkJc2VxX3B1dHMobSwg
InVudXNlZFxuIik7CisJCXJldHVybiAwOworCX0KKwogCXR0bV9wb29sX2RlYnVnZnNfaGVhZGVy
KG0pOwogCiAJc3Bpbl9sb2NrKCZzaHJpbmtlcl9sb2NrKTsKLS0gCjIuMjUuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
