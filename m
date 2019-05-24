Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0294029CFF
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 19:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B129E89F69;
	Fri, 24 May 2019 17:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198976E12F
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 17:32:35 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id x32so993309ybh.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 10:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rz26KSKqatgFQwQEso0yLpeStqm8dFhYBz7Ve/DZ0/o=;
 b=Hry636YZnAHEPX7sAPNyncbZdrGvFFxdbPyqKhDBucioKMh7ODCn+mgmrITFI4aINj
 JT5N9nWNXWj/RjvVHFFUrCSU1JGSnXJO6jVC3v2QmE6/zmHv/mwb6eeNEGF23HO/IcVN
 Ht1r4JIWuk87t0OsZPSv9J9HZ7bhZHnT652U48cWH3lrqRjRwZ6+qVfPvXRXBC9zp8Eg
 blNqfLeFVxGeO2jGAM3qOtol5OHl2geRfplPlsf2nEFjZ/VP2yvoQ12MbVWMqfrZasg1
 tgvs+hDOFR9WsmdIFti+8HpuG1a3H593ujqupLi6PJKmOtHcp+lwx7u0aoasoP+SzDcC
 Kdww==
X-Gm-Message-State: APjAAAXLtQ6MoJ6EJtyAMXO5BrpCZz4skG9F1hP0m+glPHEmHNnEjObl
 O/3oiVTHOse1aDfT95tCcmDYXbSGKUs=
X-Google-Smtp-Source: APXvYqyAfITfeQW2P8raMp1Vi5Tp3aAtUGPeTrwt5ETgg6rjflQFAIsoMyZ6kRYVZUXtoycQ38M6AQ==
X-Received: by 2002:a25:2183:: with SMTP id h125mr9593613ybh.414.1558719154005; 
 Fri, 24 May 2019 10:32:34 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id s17sm774437ywg.70.2019.05.24.10.32.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 10:32:33 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: Use provided drm_minor to initialize debugfs
Date: Fri, 24 May 2019 13:32:18 -0400
Message-Id: <20190524173231.5040-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rz26KSKqatgFQwQEso0yLpeStqm8dFhYBz7Ve/DZ0/o=;
 b=KdJ3DcoDcjyiPNJv6g/csr1ng1mJ8ryqzVACkIgEeWcFAZu11Imsi0+q5nj9Jfg3N0
 L+Ki9KHNKTI3ZIfkOWPzteqyqR+vtP9pLAHQ7wabfoZ8SBAXYVjYDY/vDlWgqonhEYUg
 XPLp79rjWFNaZQTsL/8tJPEQr1Ps1+YGiu2jpHgdol7z/RKPvpexMtEobrGlCUDLzst+
 Kx7hS8+zLA4clylEUtMoMejh3TNZYflL4+EnV+B++QdSCcI5GW7fPDyInIiWwKGECVNl
 8ODdJRYouaFIh69pTSCkF6i5JF5QFyEWH4utfOsz82C429dt5w1Thd7vA1YdZZdISmjg
 SONA==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJbnN0ZWFkIG9mIHJlYWNo
aW5nIGludG8gZGV2LT5wcmltYXJ5IGZvciBkZWJ1Z2ZzX3Jvb3QsIHVzZSB0aGUgbWlub3IKcGFz
c2VkIGludG8gZGVidWdmc19pbml0LgoKVGhpcyBhdm9pZHMgY3JlYXRpbmcgdGhlIGRlYnVnIGRp
cmVjdG9yeSB1bmRlciAvc3lzL2tlcm5lbC9kZWJ1Zy8gYW5kCmluc3RlYWQgY3JlYXRlcyB0aGUg
ZGlyZWN0b3J5IHVuZGVyIHRoZSBjb3JyZWN0IG5vZGUgaW4KL3N5cy9rZXJuZWwvZGVidWcvZHJp
Lzxub2RlPi8KClJlcG9ydGVkLWJ5OiBTdGVwaGVuIEJveWQgPHN3Ym95ZEBjaHJvbWl1bS5vcmc+
ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9kcHUxL2RwdV9rbXMuYwppbmRleCA4ODViZjg4YWZhM2UuLmQ3NzA3MTk2NTQzMSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwpAQCAtMjMxLDcgKzIzMSw3
IEBAIHZvaWQgKmRwdV9kZWJ1Z2ZzX2NyZWF0ZV9yZWdzZXQzMihjb25zdCBjaGFyICpuYW1lLCB1
bW9kZV90IG1vZGUsCiAJCQlyZWdzZXQsICZkcHVfZm9wc19yZWdzZXQzMik7CiB9CiAKLXN0YXRp
YyBpbnQgX2RwdV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCitzdGF0aWMg
aW50IF9kcHVfZGVidWdmc19pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zLCBzdHJ1Y3QgZHJt
X21pbm9yICptaW5vcikKIHsKIAl2b2lkICpwID0gZHB1X2h3X3V0aWxfZ2V0X2xvZ19tYXNrX3B0
cigpOwogCXN0cnVjdCBkZW50cnkgKmVudHJ5OwpAQCAtMjM5LDcgKzIzOSw3IEBAIHN0YXRpYyBp
bnQgX2RwdV9kZWJ1Z2ZzX2luaXQoc3RydWN0IGRwdV9rbXMgKmRwdV9rbXMpCiAJaWYgKCFwKQog
CQlyZXR1cm4gLUVJTlZBTDsKIAotCWVudHJ5ID0gZGVidWdmc19jcmVhdGVfZGlyKCJkZWJ1ZyIs
IGRwdV9rbXMtPmRldi0+cHJpbWFyeS0+ZGVidWdmc19yb290KTsKKwllbnRyeSA9IGRlYnVnZnNf
Y3JlYXRlX2RpcigiZGVidWciLCBtaW5vci0+ZGVidWdmc19yb290KTsKIAlpZiAoSVNfRVJSX09S
X05VTEwoZW50cnkpKQogCQlyZXR1cm4gLUVOT0RFVjsKIApAQCAtNTgxLDcgKzU4MSw3IEBAIHN0
YXRpYyBpbnQgX2RwdV9rbXNfZHJtX29ial9pbml0KHN0cnVjdCBkcHVfa21zICpkcHVfa21zKQog
I2lmZGVmIENPTkZJR19ERUJVR19GUwogc3RhdGljIGludCBkcHVfa21zX2RlYnVnZnNfaW5pdChz
dHJ1Y3QgbXNtX2ttcyAqa21zLCBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikKIHsKLQlyZXR1cm4g
X2RwdV9kZWJ1Z2ZzX2luaXQodG9fZHB1X2ttcyhrbXMpKTsKKwlyZXR1cm4gX2RwdV9kZWJ1Z2Zz
X2luaXQodG9fZHB1X2ttcyhrbXMpLCBtaW5vcik7CiB9CiAjZW5kaWYKIAotLSAKU2VhbiBQYXVs
LCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
