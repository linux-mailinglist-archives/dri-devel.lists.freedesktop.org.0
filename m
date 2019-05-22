Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A126888
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 18:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7E389C19;
	Wed, 22 May 2019 16:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 149A989C18
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 16:42:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so3034250wrr.13
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 09:42:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FKVd6xhpYfv+ZT31yBVOx/hjmfuDpWSl0legPgI6N+0=;
 b=CHC5BmzYyR7pQTuLqof5zO/OhgBuesmnvO1M8s+Wqg/UF6xzjeK7Nt0qH4qI80IoXM
 B/w/l+VxcJ2ZCYXezA/rqyYyKumA35kBSyAwxa4CI410vwtYdNkvK+pqfrpirUx4T6g0
 sD16H9YNr5QlLRnkFHPWHspnqaUpaLtsk04qBiYa4B81eK4UjIPz1alz3sMgCiepNan3
 d5o3pkze7ZTkQaYXbQCljDsoN6fQL18nC+TnNT8S2z4558NVRROOQ9dwhLAX4NrX5p9K
 W943OpQK/BwM0Nwxq+pPLweChQDs9xQugPMQpTE7+XKxT5xGhKWKvAOnzdZj8HhgtWn7
 ti7Q==
X-Gm-Message-State: APjAAAV/T7QJ6VNSLtF98+7YVQ5kETxA5/BJnOdOUQMONLgPCp/FIVdG
 0uDsxmul8C79q5KbIi4EHdW2arpO
X-Google-Smtp-Source: APXvYqyHhTDtJjduPo0dH9P2lReJuJD//FrO5Bb8WzOdRG5o4pHomGt4avISjxxri3+osHv4H+5JNQ==
X-Received: by 2002:adf:ce88:: with SMTP id r8mr33705053wrn.191.1558543366581; 
 Wed, 22 May 2019 09:42:46 -0700 (PDT)
Received: from arch-x1c3.cbg.collabora.co.uk
 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id l18sm24576684wrv.38.2019.05.22.09.42.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 09:42:45 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm: make drm_ioctl_permit() internal
Date: Wed, 22 May 2019 17:41:19 +0100
Message-Id: <20190522164119.24139-5-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190522164119.24139-1-emil.l.velikov@gmail.com>
References: <20190522164119.24139-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FKVd6xhpYfv+ZT31yBVOx/hjmfuDpWSl0legPgI6N+0=;
 b=tFLbIoLdUZshS4NmVWVG0rZCkb2Z6byaRYuI9aU4hRiJ5Bze6DMlb38gd7yss0NYg2
 HYpuyUE/M7qn64im5eokX0FPJrCerJu9om9pCYnhH/htzszMpvOoDs+Tvnlq6CPOCA+g
 ZEA4xu5KKYiwMXSwoWdKA2wZeuuz3uIyI4LD1whpLHSzceVFf4XkEU3Tr86BFB5N0CBd
 2iwKa/pdk/ELVf8akh2+zGj/rGOuLc0qbErBSks9rpJjiJN6126MrcDdDOUXlmOMU7SA
 y03mlBdVEnxOTAqSOxKowJj/6SuUSizPRdyz3CNAr2aKJrJLV6O3PSVZjtXI4NncSGJQ
 F8Tw==
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
Cc: kernel@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KCkFzIG9mIGVh
cmxpZXIgY29tbWl0IHRoZSBmdW5jdGlvbiBpcyB1c2VkIG9ubHkgd2l0aGluIGRybSBjb3JlLgoK
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogRW1pbCBW
ZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2lvY3RsLmMgfCAzICstLQogaW5jbHVkZS9kcm0vZHJtX2lvY3RsLmggICAgIHwgMSAtCiAy
IGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9j
dGwuYwppbmRleCAyMjYzZTNkZGQ4MjIuLjA2NDZjMGJkNTUzNSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9pb2N0bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYwpA
QCAtNTIzLDcgKzUyMyw3IEBAIGludCBkcm1fdmVyc2lvbihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB2b2lkICpkYXRhLAogICogUmV0dXJuczoKICAqIFplcm8gaWYgYWxsb3dlZCwgLUVBQ0NFUyBv
dGhlcndpc2UuCiAgKi8KLWludCBkcm1faW9jdGxfcGVybWl0KHUzMiBmbGFncywgc3RydWN0IGRy
bV9maWxlICpmaWxlX3ByaXYpCitzdGF0aWMgaW50IGRybV9pb2N0bF9wZXJtaXQodTMyIGZsYWdz
LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKIHsKIAkvKiBST09UX09OTFkgaXMgb25seSBm
b3IgQ0FQX1NZU19BRE1JTiAqLwogCWlmICh1bmxpa2VseSgoZmxhZ3MgJiBEUk1fUk9PVF9PTkxZ
KSAmJiAhY2FwYWJsZShDQVBfU1lTX0FETUlOKSkpCkBAIC01NDYsNyArNTQ2LDYgQEAgaW50IGRy
bV9pb2N0bF9wZXJtaXQodTMyIGZsYWdzLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGVfcHJpdikKIAog
CXJldHVybiAwOwogfQotRVhQT1JUX1NZTUJPTChkcm1faW9jdGxfcGVybWl0KTsKIAogI2RlZmlu
ZSBEUk1fSU9DVExfREVGKGlvY3RsLCBfZnVuYywgX2ZsYWdzKQlcCiAJW0RSTV9JT0NUTF9OUihp
b2N0bCldID0gewkJXApkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2lvY3RsLmggYi9pbmNs
dWRlL2RybS9kcm1faW9jdGwuaAppbmRleCBmYWZiNmY1OTJjNGIuLmYzZmJhNTI5Y2IxYiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2lvY3RsLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2lv
Y3RsLmgKQEAgLTE2Myw3ICsxNjMsNiBAQCBzdHJ1Y3QgZHJtX2lvY3RsX2Rlc2MgewogCQkubmFt
ZSA9ICNpb2N0bAkJCQkJCVwKIAl9CiAKLWludCBkcm1faW9jdGxfcGVybWl0KHUzMiBmbGFncywg
c3RydWN0IGRybV9maWxlICpmaWxlX3ByaXYpOwogbG9uZyBkcm1faW9jdGwoc3RydWN0IGZpbGUg
KmZpbHAsIHVuc2lnbmVkIGludCBjbWQsIHVuc2lnbmVkIGxvbmcgYXJnKTsKIGxvbmcgZHJtX2lv
Y3RsX2tlcm5lbChzdHJ1Y3QgZmlsZSAqLCBkcm1faW9jdGxfdCwgdm9pZCAqLCB1MzIpOwogI2lm
ZGVmIENPTkZJR19DT01QQVQKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
