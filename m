Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46ECCDA54
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 03:57:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D6E76E442;
	Mon,  7 Oct 2019 01:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628596E442;
 Mon,  7 Oct 2019 01:57:35 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id q10so7651886pfl.0;
 Sun, 06 Oct 2019 18:57:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vCMjdk46j83K+YmWMfdReFCcF9CxWhT3FfjxqzRuQNA=;
 b=SjIGuvb4zKPjsQEcV4/tuTRKCzjZ4zz0035crghX8NuIh6e7+Eklmx9NJhDUzM76ce
 wH+TloUITClqcv1BeCVKadMHTmMYnl+rqyEo+tVppc1oPCRWsFSQrt/OkC5feSCI25cu
 sfDssiImxBXgRvBi3e/fL64wrd9FXgzX2RZEESOydB4p0hjliCF76cRQwMMapx4kVZ+P
 GoHlGmOz0sQF7omTAvoY5cSQOfzpHzq+P/ULLcakuu9nF5Y1/LWSXYQhP4iv9NTf2lMD
 LANmLBlVErhQlswB86V28+1nTpDLv0LIXqfg+L2apUVhrT7OpGjjTINDCdwvsaVB1qYn
 ygqw==
X-Gm-Message-State: APjAAAXHN8+RqR1zNh4lnzEvED6PD7a5qCplnG3UVKWGlkxw+Wm9T1jP
 5YNMtfc2Zp0Epto+mQUF/r7OnzfB3I+4uA==
X-Google-Smtp-Source: APXvYqxgu23VoTDeRUgG568EtYDFY2FRPQOUtmccq4iJ1OyyPdiWAd1tJ5NuXYXoW0PzTGs/WvgV2Q==
X-Received: by 2002:a17:90a:356d:: with SMTP id
 q100mr30999369pjb.53.1570413454815; 
 Sun, 06 Oct 2019 18:57:34 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 b123sm18328536pgc.72.2019.10.06.18.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 18:57:34 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] drm/v3d: use drm_gem_objects_lookup_user
Date: Mon,  7 Oct 2019 09:54:26 +0800
Message-Id: <20191007015430.20829-3-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191007015430.20829-1-yuq825@gmail.com>
References: <20191007015430.20829-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vCMjdk46j83K+YmWMfdReFCcF9CxWhT3FfjxqzRuQNA=;
 b=RKruRgP+/BuF/Lz3ewdss9BA0cEoUwuZcLJUlnyTzhlDF6KOJLYkiVL7klnudhpXHu
 bZR6FT7Mq4sLa6fNCYChqsV5QcFmTLgygChgblTjzarVu10r4EAMZmDUxerX2NC5W8sX
 S3UpKhL8yayzZRN1jH1JEDnrpgAdVoCKlcvUAENEP3aI8k7rknuY/OOIs6gintNQ+JjM
 JO+JlK1SWrGo7Tm44Hw9L0AJiB1sxhzXSB/hzfdejONOdOOXAkWgCTyarR1nVZZaj8TG
 +85jI+cEUmn1j6Alu0Jpux30rAieKEG+JI6uXocuBcRFIYFjLUNPR/C4pMqa/q8L144X
 ioAQ==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maxime Ripard <mripard@kernel.org>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGxpZnkgdGhlIEdFTSBvYmplY3QgbG9va3VwIGNvZGUgd2l0aCBEUk0gR0VNIGhlbHBlcgpm
dW5jdGlvbiBkcm1fZ2VtX29iamVjdHNfbG9va3VwX3VzZXIoKS4KCnYyOgp1c2UgZHJtX2dlbV9v
YmplY3RzX2xvb2t1cF91c2VyIGluc3RlYWQgb2YKZHJtX2dlbV9vYmplY3RzX2xvb2t1cC4KCnYz
OgppbXByb3ZlIGNvbW1pdCBjb21lbW50LgoKQ2M6IEVyaWMgQW5ob2x0IDxlcmljQGFuaG9sdC5u
ZXQ+ClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBRaWFuZyBZdSA8eXVxODI1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdjNkL3YzZF9nZW0uYyB8IDQ5ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS92
M2QvdjNkX2dlbS5jCmluZGV4IDRjNGI1OWFlMmM4MS4uNzVhM2I0NDhmM2ZhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdjNk
L3YzZF9nZW0uYwpAQCAtMjkwLDEwICsyOTAsNiBAQCB2M2RfbG9va3VwX2JvcyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LAogCSAgICAgICB1NjQgYm9faGFuZGxlcywKIAkgICAgICAgdTMyIGJvX2Nv
dW50KQogewotCXUzMiAqaGFuZGxlczsKLQlpbnQgcmV0ID0gMDsKLQlpbnQgaTsKLQogCWpvYi0+
Ym9fY291bnQgPSBib19jb3VudDsKIAogCWlmICgham9iLT5ib19jb3VudCkgewpAQCAtMzA0LDQ4
ICszMDAsOSBAQCB2M2RfbG9va3VwX2JvcyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCQlyZXR1
cm4gLUVJTlZBTDsKIAl9CiAKLQlqb2ItPmJvID0ga3ZtYWxsb2NfYXJyYXkoam9iLT5ib19jb3Vu
dCwKLQkJCQkgc2l6ZW9mKHN0cnVjdCBkcm1fZ2VtX2NtYV9vYmplY3QgKiksCi0JCQkJIEdGUF9L
RVJORUwgfCBfX0dGUF9aRVJPKTsKLQlpZiAoIWpvYi0+Ym8pIHsKLQkJRFJNX0RFQlVHKCJGYWls
ZWQgdG8gYWxsb2NhdGUgdmFsaWRhdGVkIEJPIHBvaW50ZXJzXG4iKTsKLQkJcmV0dXJuIC1FTk9N
RU07Ci0JfQotCi0JaGFuZGxlcyA9IGt2bWFsbG9jX2FycmF5KGpvYi0+Ym9fY291bnQsIHNpemVv
Zih1MzIpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWhhbmRsZXMpIHsKLQkJcmV0ID0gLUVOT01FTTsK
LQkJRFJNX0RFQlVHKCJGYWlsZWQgdG8gYWxsb2NhdGUgaW5jb21pbmcgR0VNIGhhbmRsZXNcbiIp
OwotCQlnb3RvIGZhaWw7Ci0JfQotCi0JaWYgKGNvcHlfZnJvbV91c2VyKGhhbmRsZXMsCi0JCQkg
ICAodm9pZCBfX3VzZXIgKikodWludHB0cl90KWJvX2hhbmRsZXMsCi0JCQkgICBqb2ItPmJvX2Nv
dW50ICogc2l6ZW9mKHUzMikpKSB7Ci0JCXJldCA9IC1FRkFVTFQ7Ci0JCURSTV9ERUJVRygiRmFp
bGVkIHRvIGNvcHkgaW4gR0VNIGhhbmRsZXNcbiIpOwotCQlnb3RvIGZhaWw7Ci0JfQotCi0Jc3Bp
bl9sb2NrKCZmaWxlX3ByaXYtPnRhYmxlX2xvY2spOwotCWZvciAoaSA9IDA7IGkgPCBqb2ItPmJv
X2NvdW50OyBpKyspIHsKLQkJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpibyA9IGlkcl9maW5kKCZm
aWxlX3ByaXYtPm9iamVjdF9pZHIsCi0JCQkJCQkgICAgIGhhbmRsZXNbaV0pOwotCQlpZiAoIWJv
KSB7Ci0JCQlEUk1fREVCVUcoIkZhaWxlZCB0byBsb29rIHVwIEdFTSBCTyAlZDogJWRcbiIsCi0J
CQkJICBpLCBoYW5kbGVzW2ldKTsKLQkJCXJldCA9IC1FTk9FTlQ7Ci0JCQlzcGluX3VubG9jaygm
ZmlsZV9wcml2LT50YWJsZV9sb2NrKTsKLQkJCWdvdG8gZmFpbDsKLQkJfQotCQlkcm1fZ2VtX29i
amVjdF9nZXQoYm8pOwotCQlqb2ItPmJvW2ldID0gYm87Ci0JfQotCXNwaW5fdW5sb2NrKCZmaWxl
X3ByaXYtPnRhYmxlX2xvY2spOwotCi1mYWlsOgotCWt2ZnJlZShoYW5kbGVzKTsKLQlyZXR1cm4g
cmV0OworCXJldHVybiBkcm1fZ2VtX29iamVjdHNfbG9va3VwX3VzZXIoZmlsZV9wcml2LAorCQkJ
CQkgICAodm9pZCBfX3VzZXIgKikodWludHB0cl90KWJvX2hhbmRsZXMsCisJCQkJCSAgIGpvYi0+
Ym9fY291bnQsICZqb2ItPmJvKTsKIH0KIAogc3RhdGljIHZvaWQKLS0gCjIuMTcuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
