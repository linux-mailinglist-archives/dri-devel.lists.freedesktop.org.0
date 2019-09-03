Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E23A7327
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 21:07:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A325A89804;
	Tue,  3 Sep 2019 19:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E09897F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 19:07:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c19so5684914edy.10
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 12:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rMbe/90UeFfqEUrk4ND8PxMTYBDDkx6JYpo4F1BWcC8=;
 b=YrhXon+iZEVHJf5BIn1JUnhQY0rWI8W8qwd8PGSSHUtFs0tLX7MISKglcqVlOw66We
 fNOEweb2qwJWeYX2wM7K6eag01La+ZZ7nfAPJprhTxgSEOpSacE1ZXpMwOTtD9tIPmCM
 TRwAb9/CXFGIHmGRUP2+7BM+EV1JRO9mPEn3glB/7LSQT4z2Svhw0+pqZNWFykKwa0Ib
 aenOvcQbBpA0O7sUXpbCRzF5VTr5k4WalnKWYIl/nI8Az1UTaFAdcwew8hpzQFbnoC4/
 8HGgI1WqFEDsfqcIIkB39pqrh6LyJTVZzeV/10SrOtlXePQaK9dQ9B6i+TySHb4eLQWc
 2hgA==
X-Gm-Message-State: APjAAAXlWScVoemw6cr+J5pymyVdTEXdpvIS82I/xasoTIvnfzlBrHoX
 3aYweVUaWm8EEDiVgm2oV3S3ydSzUPU=
X-Google-Smtp-Source: APXvYqweLY86stxuQkQXezP/PFuo3lvwCfIEpFRc8/jxHYyer1v3jB8UP3B3FCjCKXceMYgpkvb9eA==
X-Received: by 2002:a17:906:c08:: with SMTP id s8mr8462775ejf.66.1567537618355; 
 Tue, 03 Sep 2019 12:06:58 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b12sm3655583edj.93.2019.09.03.12.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 12:06:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/3] drm/atomic: Reject FLIP_ASYNC unconditionally
Date: Tue,  3 Sep 2019 21:06:41 +0200
Message-Id: <20190903190642.32588-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
References: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rMbe/90UeFfqEUrk4ND8PxMTYBDDkx6JYpo4F1BWcC8=;
 b=GBOWMGKL2htvO3SG2dtez5oS9+y04XBknjNmJprvWjn75fZ0rnETw5swFSjkZtTClo
 ThuibSbiJQweoF8PUR9R6qvA0cNz8onWs/Gg6Wr38ugYlhNTuTjHWsD06MsQLBm80ycm
 gMsJ0Cu+sxjStk/RcC0NXV+LdYOEQf3dFZDxk=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQncyBuZXZlciBiZWVuIHdpcmVkIHVwLiBPbmx5IHVzZXJzcGFjZSB0aGF0IHRyaWVkIHRvIHVz
ZSBpdCAoYW5kCmRpZG4ndCBhY3R1YWxseSBjaGVjayB3aGV0aGVyIGFueXRoaW5nIHdvcmtzLCBi
dXQgaGV5IGl0IGJ1aWxkcykgaXMKdGhlIC1tb2Rlc2V0dGluZyBhdG9taWMgaW1wbGVtZW50YXRp
b24uIEFuZCB3ZSBqdXN0IHNodXQgdGhhdCB1cC4KCklmIHRoZXJlJ3MgYW55b25lIGVsc2UgdGhl
biB3ZSBuZWVkIHRvIHNpbGVudGx5IGFjY2VwdCB0aGlzIGZsYWcgbm8KbWF0dGVyIHdoYXQsIGFu
ZCBmaW5kIGEgbmV3IG9uZS4gQmVjYXVzZSBvbmNlIGEgZmxhZyBpcyB0YWludGVkLCBpdCdzCmxv
c3QuCgpDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVs
LmNvbT4KQ2M6IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFlbnplci5uZXQ+CkNjOiBBbGV4IERl
dWNoZXIgPGFsZXhkZXVjaGVyQGdtYWlsLmNvbT4KQ2M6IEFkYW0gSmFja3NvbiA8YWpheEByZWRo
YXQuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX3VhcGkuYyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9hdG9taWNfdWFwaS5jCmluZGV4IDVhNWI0MmRiNmYyYS4uN2EyNmJmYjUzMjlj
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY191YXBpLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfdWFwaS5jCkBAIC0xMzA1LDggKzEzMDUsNyBAQCBpbnQg
ZHJtX21vZGVfYXRvbWljX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJaWYgKGFyZy0+
cmVzZXJ2ZWQpCiAJCXJldHVybiAtRUlOVkFMOwogCi0JaWYgKChhcmctPmZsYWdzICYgRFJNX01P
REVfUEFHRV9GTElQX0FTWU5DKSAmJgotCQkJIWRldi0+bW9kZV9jb25maWcuYXN5bmNfcGFnZV9m
bGlwKQorCWlmIChhcmctPmZsYWdzICYgRFJNX01PREVfUEFHRV9GTElQX0FTWU5DKQogCQlyZXR1
cm4gLUVJTlZBTDsKIAogCS8qIGNhbid0IHRlc3QgYW5kIGV4cGVjdCBhbiBldmVudCBhdCB0aGUg
c2FtZSB0aW1lLiAqLwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
