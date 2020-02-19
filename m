Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 996AE1641AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DD766EB90;
	Wed, 19 Feb 2020 10:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA1C6EB5B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:08 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w15so27528444wru.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6THFp6AG4GHfhNGPDUxvX1xl7YrFlEjP83iYxHAXrg=;
 b=II97WZQEemEOCvxmtZjCFmXnOaYUxIaZiCNRWZYfcxh76VhNC/REdqUKnwG4hasj53
 Suzfin86drwenEG5S2qpXsvZloDpklyajmeTRJv5hoSORfJ369gyw2Fsgjn3lrLV0HAB
 6H+oEJipl3XVZMDePBoj9a+Al/z7AZGhQ/rHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6THFp6AG4GHfhNGPDUxvX1xl7YrFlEjP83iYxHAXrg=;
 b=nFSSAAM4Hi7OKUVekJrVUfkD0cHMyniJDhlQBqX0nA1udo8qNaZ/aO/isVkP0ZLBsA
 alqWCaoaaSK8UxKUBNspVbyTPbJUa0Przi7npIaFSQYM8kFOOyJ2zBD1/BPvvbGDCJXL
 EjEZdJzR7WfAY7RtUHS6iXnVX9wYdGMEFTRPxcT8or7Imk0Kanj2wTsqlIjlGe8dJy0l
 BDiTKs1hk0hGOiuOMK1l4JTmNdhFWoFzkSzRUV+Otc+s+RdzXMfFUnKxhh01r5y0WZFz
 0l9EdHmDSZyY6GXfx4WflkCY9m7dNoOYYAdiFXwT3A1F/vQaiHJ6lHDOSBep+OlFNySO
 nKqQ==
X-Gm-Message-State: APjAAAXQNUAqFdyfWHZELmbknLeiN+OsUrYlORNBbSbf3gDBCuHzBeW0
 KK/80nnBRUo1WRO7QfbgWqehK+FtN7Q=
X-Google-Smtp-Source: APXvYqySG1/Os6NThGfBV6gSL6bmM+gb0fX74bVHA0PhviFzs2Z30QO+x1XnwFR00QIFFJ3wtBI6ig==
X-Received: by 2002:adf:f406:: with SMTP id g6mr35537076wro.189.1582107727387; 
 Wed, 19 Feb 2020 02:22:07 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:06 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/52] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:00 +0100
Message-Id: <20200219102122.1607365-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGV2ZW4gZGVsZXRlIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vayBub3chCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IERh
dmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxA
cmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CkNj
OiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+CkNjOiB2aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwotLS0K
IGRyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMgfCAyMSArKysrKysrKysrKy0tLS0tLS0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2NpcnJ1cy9jaXJydXMuYwppbmRleCBhOWQ3ODlhNTY1MzYuLjZhYzAyODY4MTBlYyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vY2lycnVzL2NpcnJ1cy5jCkBAIC01MTAsMTEgKzUxMCwxNSBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyBjaXJydXNfbW9kZV9jb25maWdfZnVuY3MgPSB7
CiAJLmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsCiB9OwogCi1zdGF0
aWMgdm9pZCBjaXJydXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2ly
cnVzKQorc3RhdGljIGludCBjaXJydXNfbW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2Rl
dmljZSAqY2lycnVzKQogewogCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmY2lycnVzLT5kZXY7
CisJaW50IHJldDsKKworCXJldCA9IGRybV9tb2RlX2NvbmZpZ19pbml0KGRldik7CisJaWYgKHJl
dCkKKwkJcmV0dXJuIHJldDsKIAotCWRybV9tb2RlX2NvbmZpZ19pbml0KGRldik7CiAJZGV2LT5t
b2RlX2NvbmZpZy5taW5fd2lkdGggPSAwOwogCWRldi0+bW9kZV9jb25maWcubWluX2hlaWdodCA9
IDA7CiAJZGV2LT5tb2RlX2NvbmZpZy5tYXhfd2lkdGggPSBDSVJSVVNfTUFYX1BJVENIIC8gMjsK
QEAgLTUyMiwxNSArNTI2LDEyIEBAIHN0YXRpYyB2b2lkIGNpcnJ1c19tb2RlX2NvbmZpZ19pbml0
KHN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMpCiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJy
ZWRfZGVwdGggPSAxNjsKIAlkZXYtPm1vZGVfY29uZmlnLnByZWZlcl9zaGFkb3cgPSAwOwogCWRl
di0+bW9kZV9jb25maWcuZnVuY3MgPSAmY2lycnVzX21vZGVfY29uZmlnX2Z1bmNzOworCisJcmV0
dXJuIDA7CiB9CiAKIC8qIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSAqLwogCi1zdGF0aWMgdm9pZCBjaXJydXNfcmVsZWFz
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQotewotCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRl
dik7Ci19Ci0KIERFRklORV9EUk1fR0VNX0ZPUFMoY2lycnVzX2ZvcHMpOwogCiBzdGF0aWMgc3Ry
dWN0IGRybV9kcml2ZXIgY2lycnVzX2RyaXZlciA9IHsKQEAgLTU0NCw3ICs1NDUsNiBAQCBzdGF0
aWMgc3RydWN0IGRybV9kcml2ZXIgY2lycnVzX2RyaXZlciA9IHsKIAogCS5mb3BzCQkgPSAmY2ly
cnVzX2ZvcHMsCiAJRFJNX0dFTV9TSE1FTV9EUklWRVJfT1BTLAotCS5yZWxlYXNlICAgICAgICAg
PSBjaXJydXNfcmVsZWFzZSwKIH07CiAKIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1
Y3QgcGNpX2RldiAqcGRldiwKQEAgLTU5MSw3ICs1OTEsOSBAQCBzdGF0aWMgaW50IGNpcnJ1c19w
Y2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCiAJaWYgKGNpcnJ1cy0+bW1pbyA9PSBOVUxM
KQogCQlnb3RvIGVycl91bm1hcF92cmFtOwogCi0JY2lycnVzX21vZGVfY29uZmlnX2luaXQoY2ly
cnVzKTsKKwlyZXQgPSBjaXJydXNfbW9kZV9jb25maWdfaW5pdChjaXJydXMpOworCWlmIChyZXQp
CisJCWdvdG8gZXJyX2NsZWFudXA7CiAKIAlyZXQgPSBjaXJydXNfY29ubl9pbml0KGNpcnJ1cyk7
CiAJaWYgKHJldCA8IDApCkBAIC02MTMsNyArNjE1LDYgQEAgc3RhdGljIGludCBjaXJydXNfcGNp
X3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCXJldHVybiAwOwogCiBlcnJfY2xlYW51cDoK
LQlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkZXYpOwogCWlvdW5tYXAoY2lycnVzLT5tbWlvKTsK
IGVycl91bm1hcF92cmFtOgogCWlvdW5tYXAoY2lycnVzLT52cmFtKTsKLS0gCjIuMjQuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
