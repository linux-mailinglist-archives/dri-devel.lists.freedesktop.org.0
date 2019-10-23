Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D30E1E97
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 16:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F2316EAEF;
	Wed, 23 Oct 2019 14:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F626EAEF
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 14:50:05 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id v6so2962813wmj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 07:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNcxEwD/Rw+XsHHUoWKtnyQ7Kd75vAYAE7l7GYdjMw=;
 b=AGse6qR0JHoz1uyiPLZZ3RPdM+SNGhHIQDRU1HY1j4XNPxzcF+DpbArqENfxZO9jV4
 uNyR03cTE/o/XZgujRaSfOylXv6LM+T4J32rHzfF+HublfgPTRK29OAlSChkY+VlCQFO
 DVWXCdLYKnh0X2iH2WWVqxLsOo7/8dSIv4GLVmVWahzo1v7rs9ZrULnnM5aV4FOi296s
 AGidh0DmXUUzDaoq9oE82sZ/VMUL62A8HQmJ2asSwFmpdNUz2WFonp5yEYASik7wpf2d
 yy+lyGLbkG4x/76DT/msroiazC1fI4eEZwdkyA6ZOvUYYeXmtgebUtokIbKkdBBv2wwd
 l/Vg==
X-Gm-Message-State: APjAAAUh87O1yEnxGFjif76QJPw/01j3ZdxzF/U2TMxjaSW45WAmVfm3
 sG2I9xZ+bvBudtLgIP5IOH3a75Oic18=
X-Google-Smtp-Source: APXvYqxBybYZhBzgCwl8sjJ1UHbUbu9xiERzLdeA22Nqrezpw1E1ihlJAn/cLHEHT8CYvoFqDh8h8Q==
X-Received: by 2002:a1c:dd06:: with SMTP id u6mr261130wmg.109.1571842202346;
 Wed, 23 Oct 2019 07:50:02 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z125sm29614190wme.37.2019.10.23.07.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 07:49:59 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/property: Enforce more lifetime rules
Date: Wed, 23 Oct 2019 16:49:52 +0200
Message-Id: <20191023144953.28190-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgNcxEwD/Rw+XsHHUoWKtnyQ7Kd75vAYAE7l7GYdjMw=;
 b=WGzE7qffBMivLCljiUXSRqpVN97SZOL/56BMB9CMFOMsN0qHEJRDyLLPJpmGZ6OUiW
 P4Vf/TDutlZKpZLOz8HwOWTfTjkMKWBlnm6xmFq4ZYgPblEV+uWiu2vsQacqkTymj+6U
 dnVIX/7SAFgNX8tHFNpel1YTG23II2Pb673/k=
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
 Rajat Jain <rajatja@google.com>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UHJvcGVydGllcyBjYW4ndCBiZSBhdHRhY2hlZCBhZnRlciByZWdpc3RlcmluZywgdXNlcnNwYWNl
IHdvdWxkIGdldApjb25mdXNlZCAobm8gb25lIGJvdGhlcnMgdG8gcmVwcm9iZSByZWFsbHkpLgoK
LSBBZGQga2VybmVsZG9jCi0gRW5mb3JjZSB0aGlzIHdpdGggc29tZSBjaGVja3MuIFRoaXMgbmVl
ZHMgYSBzb21ld2hhdCB1Z2x5IGNoZWNrCiAgc2luY2UgY29ubmVjdG9ycyBjYW4gYmUgYWRkZWQg
bGF0ZXIgb24sIGJ1dCB3ZSBzdGlsbCBuZWVkIHRvIGF0dGFjaAogIGFsbCBwcm9wZXJ0aWVzIGJl
Zm9yZSB0aGV5IGdvIHB1YmxpYy4KCk5vdGUgdGhhdCB3ZSBhbHJlYWR5IGVuZm9yY2UgdGhhdCBw
cm9wZXJ0aWVzIHRoZW1zZWx2ZXMgYXJlIGNyZWF0ZWQKYmVmb3JlIHRoZSBlbnRpcmUgZGV2aWNl
IGlzIHJlZ2lzdGVyZWQuCgpDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4KQ2M6IFJhamF0IEphaW4gPHJhamF0amFAZ29vZ2xlLmNvbT4KU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2RlX29iamVjdC5jIHwgMTQgKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rl
X29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCmluZGV4IDZhMjNl
MzZlZDRmZS4uMzVjMjcxOTQwN2E4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX29iamVjdC5jCkBAIC0y
MjQsMTIgKzIyNCwyNiBAQCBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX29iamVjdF9nZXQpOwogICog
VGhpcyBhdHRhY2hlcyB0aGUgZ2l2ZW4gcHJvcGVydHkgdG8gdGhlIG1vZGVzZXQgb2JqZWN0IHdp
dGggdGhlIGdpdmVuIGluaXRpYWwKICAqIHZhbHVlLiBDdXJyZW50bHkgdGhpcyBmdW5jdGlvbiBj
YW5ub3QgZmFpbCBzaW5jZSB0aGUgcHJvcGVydGllcyBhcmUgc3RvcmVkIGluCiAgKiBhIHN0YXRp
Y2FsbHkgc2l6ZWQgYXJyYXkuCisgKgorICogTm90ZSB0aGF0IGFsbCBwcm9wZXJ0aWVzIG11c3Qg
YmUgYXR0YWNoZWQgYmVmb3JlIHRoZSBvYmplY3QgaXRzZWxmIGlzCisgKiByZWdpc3RlcmVkIGFu
ZCBhY2Nlc3NpYmxlIGZyb20gdXNlcnNwYWNlLgogICovCiB2b2lkIGRybV9vYmplY3RfYXR0YWNo
X3Byb3BlcnR5KHN0cnVjdCBkcm1fbW9kZV9vYmplY3QgKm9iaiwKIAkJCQlzdHJ1Y3QgZHJtX3By
b3BlcnR5ICpwcm9wZXJ0eSwKIAkJCQl1aW50NjRfdCBpbml0X3ZhbCkKIHsKIAlpbnQgY291bnQg
PSBvYmotPnByb3BlcnRpZXMtPmNvdW50OworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwcm9w
ZXJ0eS0+ZGV2OworCisKKwlpZiAob2JqLT50eXBlID09IERSTV9NT0RFX09CSkVDVF9DT05ORUNU
T1IpIHsKKwkJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciA9IG9ial90b19jb25uZWN0
b3Iob2JqKTsKKworCQlXQVJOX09OKCFkZXYtPmRyaXZlci0+bG9hZCAmJgorCQkJY29ubmVjdG9y
LT5yZWdpc3RyYXRpb25fc3RhdGUgPT0gRFJNX0NPTk5FQ1RPUl9SRUdJU1RFUkVEKTsKKwl9IGVs
c2UgeworCQlXQVJOX09OKCFkZXYtPmRyaXZlci0+bG9hZCAmJiBkZXYtPnJlZ2lzdGVyZWQpOwor
CX0KIAogCWlmIChjb3VudCA9PSBEUk1fT0JKRUNUX01BWF9QUk9QRVJUWSkgewogCQlXQVJOKDEs
ICJGYWlsZWQgdG8gYXR0YWNoIG9iamVjdCBwcm9wZXJ0eSAodHlwZTogMHgleCkuIFBsZWFzZSAi
Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
