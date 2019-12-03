Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5911103AA
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 18:37:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D00E26EA4E;
	Tue,  3 Dec 2019 17:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4996389166
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 17:37:34 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id t141so1618942ywc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 09:37:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=agSIMt9qL1hxT3fbJ0reE7XcbpJIccyYjH/rTo8BTDM=;
 b=lj4iK4NPZWWeyghxdIpIomU3b0xns3txakYmc0EbDzH/phG0H2XO8biH3ZB2lxGEd5
 3Ih09NwXF9JYFm+ueJIPsmlk2uqUQUDormgDsKBxyXyefJMVedsdT6QT8uAaojXn7Xco
 wuT30BHBG8NPjVOgveX4wBuYSXauV0Ta9RVSy8A65vq64rv8ri9JJAbPyYRrzuOTT0pW
 r+NziUf1b0Dr4jULrwCkAbXupUblZG3rFQyHuwc/ON59Ouy3/iubtcKCeS4ZeN3wYGDo
 PgP1hfAomRpXgCgZ+T83RwH8JeKRu6GjHKpAfGduEzluB7EzChQ9SAqNjBRQEMcGI+JJ
 hCsQ==
X-Gm-Message-State: APjAAAWOCFID2bVUJLX9D+kD4b6kf8ow8mJCrv0mXm9rrWV/H4yGsc/B
 dcCq1fFG6JmHDd8wef/hA34zZjPThF3L7g==
X-Google-Smtp-Source: APXvYqx4IVEfP7pQN+lP5WTSHgMM7XPAJ14VoUzEu3yt+G7yWz8prX6m1eairvUDa9pdwOuBO86Miw==
X-Received: by 2002:a81:47d7:: with SMTP id u206mr4789709ywa.15.1575394653270; 
 Tue, 03 Dec 2019 09:37:33 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g190sm1729426ywf.41.2019.12.03.09.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 09:37:32 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 ramalingm.c@intel.com
Subject: [PATCH 08/11] drm/i915: Support DP MST in enc_to_dig_port() function
Date: Tue,  3 Dec 2019 12:36:31 -0500
Message-Id: <20191203173638.94919-9-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.393.g34dc348eaf-goog
In-Reply-To: <20191203173638.94919-1-sean@poorly.run>
References: <20191203173638.94919-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=agSIMt9qL1hxT3fbJ0reE7XcbpJIccyYjH/rTo8BTDM=;
 b=ChDdZ6TjP5A9oU/M88m7XHvamZnU26ETrpdD7G17nvWnJhul4L21AbY6XaT+9PVDA1
 TymOOsv/7E/flmRjZMQsUJ/xn7rDJC7u0WY6ngxDhcbfG8x/Shjq7JskSNqHGgaaXPNV
 O1+Ci4EA/ttgstGHRV9zULi23BuFrREVrxSRH9eTPTkdIgH5hxMsLY3FgQh+RATCGo4Y
 wevD2/2HjXOPjCiswgN0v9nYrqls2JxiC6tJ8e1X2IKXSNX8Cq6fZWanQGPWO29DKSBe
 z47INp+KiQlxM2VAjBR8qmnzdpXPGz/eXxwQwvHVYZm7F50LjB2o6CfPxa5bHRqPn2+8
 yb/w==
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
Cc: David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpBbHRob3VnaCBEUF9NU1Qg
ZmFrZSBlbmNvZGVycyBhcmUgbm90IHN1YmNsYXNzZWQgZnJvbSBkaWdpdGFsIHBvcnRzLAp0aGV5
IGFyZSBhc3NvY2lhdGVkIHdpdGggdGhlbS4gU3VwcG9ydCB0aGVzZSBlbmNvZGVycy4KClNpZ25l
ZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIC4uLi9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXlfdHlwZXMuaCAgICB8IDE5ICsrKysrKysrKysrKyst
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90
eXBlcy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X3R5cGVz
LmgKaW5kZXggNDg5ZTFkMDA5MjhiLi40OTI0Nzg0ZjNmNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheV90eXBlcy5oCkBAIC0xNDE0LDYgKzE0
MTQsMTcgQEAgc3RhdGljIGlubGluZSBib29sIGludGVsX2VuY29kZXJfaXNfZGlnX3BvcnQoc3Ry
dWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpCiAJfQogfQogCitzdGF0aWMgaW5saW5lIGJvb2wg
aW50ZWxfZW5jb2Rlcl9pc19tc3Qoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIpCit7CisJ
cmV0dXJuIGVuY29kZXItPnR5cGUgPT0gSU5URUxfT1VUUFVUX0RQX01TVDsKK30KKworc3RhdGlj
IGlubGluZSBzdHJ1Y3QgaW50ZWxfZHBfbXN0X2VuY29kZXIgKgorZW5jX3RvX21zdChzdHJ1Y3Qg
ZHJtX2VuY29kZXIgKmVuY29kZXIpCit7CisJcmV0dXJuIGNvbnRhaW5lcl9vZihlbmNvZGVyLCBz
dHJ1Y3QgaW50ZWxfZHBfbXN0X2VuY29kZXIsIGJhc2UuYmFzZSk7Cit9CisKIHN0YXRpYyBpbmxp
bmUgc3RydWN0IGludGVsX2RpZ2l0YWxfcG9ydCAqCiBlbmNfdG9fZGlnX3BvcnQoc3RydWN0IGRy
bV9lbmNvZGVyICplbmNvZGVyKQogewpAQCAtMTQyMiw2ICsxNDMzLDggQEAgZW5jX3RvX2RpZ19w
b3J0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAlpZiAoaW50ZWxfZW5jb2Rlcl9pc19k
aWdfcG9ydChpbnRlbF9lbmNvZGVyKSkKIAkJcmV0dXJuIGNvbnRhaW5lcl9vZihlbmNvZGVyLCBz
dHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0LAogCQkJCSAgICBiYXNlLmJhc2UpOworCWVsc2UgaWYg
KGludGVsX2VuY29kZXJfaXNfbXN0KGludGVsX2VuY29kZXIpKQorCQlyZXR1cm4gZW5jX3RvX21z
dChlbmNvZGVyKS0+cHJpbWFyeTsKIAllbHNlCiAJCXJldHVybiBOVUxMOwogfQpAQCAtMTQzMiwx
MiArMTQ0NSw2IEBAIGNvbm5fdG9fZGlnX3BvcnQoc3RydWN0IGludGVsX2Nvbm5lY3RvciAqY29u
bmVjdG9yKQogCXJldHVybiBlbmNfdG9fZGlnX3BvcnQoJmludGVsX2F0dGFjaGVkX2VuY29kZXIo
JmNvbm5lY3Rvci0+YmFzZSktPmJhc2UpOwogfQogCi1zdGF0aWMgaW5saW5lIHN0cnVjdCBpbnRl
bF9kcF9tc3RfZW5jb2RlciAqCi1lbmNfdG9fbXN0KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rl
cikKLXsKLQlyZXR1cm4gY29udGFpbmVyX29mKGVuY29kZXIsIHN0cnVjdCBpbnRlbF9kcF9tc3Rf
ZW5jb2RlciwgYmFzZS5iYXNlKTsKLX0KLQogc3RhdGljIGlubGluZSBzdHJ1Y3QgaW50ZWxfZHAg
KmVuY190b19pbnRlbF9kcChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiB7CiAJcmV0dXJu
ICZlbmNfdG9fZGlnX3BvcnQoZW5jb2RlciktPmRwOwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBF
bmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
