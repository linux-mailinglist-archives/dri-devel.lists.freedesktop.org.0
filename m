Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556EB5D33D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 17:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EA5B89E0E;
	Tue,  2 Jul 2019 15:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9B189E0E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2019 15:44:38 +0000 (UTC)
Received: by mail-qk1-x742.google.com with SMTP id i125so14462719qkd.6
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2019 08:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ZJiwvjj9fDU7DxrMr8mtf6HfgbC93nAUMw1oRC2Lt8=;
 b=joqAXh8kh12uyY9Z/NC+j78FR70NAZHQlny5U6ephaFD8hlkjJTfb6/K+W9HTV3A64
 38zUcOKXX8R+Dh9yi7F4Lsmdm735fANEmIAUUSlU25xwumXU6MOwqZ+U2c8qvUvGyq6y
 N0X7kuaT6Ilnad80ywHpkDpKckZMvtov2Qu+MeQorFkYpChdA4c3jVLyyGBY14oVIJ2v
 LZKkpD/s2RCXruBjeTw67s2B+Hh2HVd4G9g8SiK5db/AizsbIs19mGix3XSLaLylwDnQ
 bTAij0BfiU6LCplblIS1NoOgNghlFbn5TqBCtiLZXk+Z3Ae3AJXA6TgSQuA3yFZU2lDI
 3x8g==
X-Gm-Message-State: APjAAAWDqJtR/Bi9yDPRxc+v+Rcrc2erC5Z8kzhrYjlFaRsiMI7m3bb/
 AkFhpwWD208gfVpoN1cNz15MNJ3R3T4=
X-Google-Smtp-Source: APXvYqzAZEkKpxeLcmDK75ZZ0trIM1JgZgt6dDfwCEhn4ru6eHZ/guN/4ysKfZB6YaWdhI5TMDfnMw==
X-Received: by 2002:a05:620a:10b2:: with SMTP id
 h18mr25786034qkk.14.1562082277651; 
 Tue, 02 Jul 2019 08:44:37 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id z21sm5836582qto.48.2019.07.02.08.44.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 08:44:37 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/bridge: ti-sn65dsi86: add debugfs
Date: Tue,  2 Jul 2019 08:44:17 -0700
Message-Id: <20190702154419.20812-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702154419.20812-1-robdclark@gmail.com>
References: <20190702154419.20812-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ZJiwvjj9fDU7DxrMr8mtf6HfgbC93nAUMw1oRC2Lt8=;
 b=LYevnwo9WIJp9bSgzwfX1XVlrHKir2ZZbBVAhgC8ARt7UfjEV6pcO+SvaWmSCTHbH3
 KvIEGJCBFdsSasKCW3x5UxJIsdoIgNVHXLO1PqJH+KGPq2bqPiWht+fUtFs7gQkvFH+t
 z5DfYAy5Ma2FH8PjBSw5xJDghjfQQij+Yt7uOhCGl9UTjnL2yazo269ojRjYer/lpSgo
 RUdg5FlInIPuWgVTtvFjiD7DxwVFweVH4ASaa1ILfT2tbyQY23cM0/BdH3MOzFLdY4Mc
 SlM9DZcwMFhPvHAALkb7CTE4F1Zh8Oj6e6pTJF3bBV0szrCGA43l5Gpi7moK1YzH0EIa
 m1pw==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKQWRkIGEgZGVidWdmcyBm
aWxlIHRvIHNob3cgc3RhdHVzIHJlZ2lzdGVycy4KClNpZ25lZC1vZmYtYnk6IFJvYiBDbGFyayA8
cm9iZGNsYXJrQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNu
NjVkc2k4Ni5jIHwgNDIgKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdl
ZCwgNDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktc242NWRzaTg2LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCmlu
ZGV4IGYxYTI0OTNiODZkOS4uYTZmMjc2NDhjMDE1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RpLXNuNjVkc2k4Ni5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGkt
c242NWRzaTg2LmMKQEAgLTUsNiArNSw3IEBACiAgKi8KIAogI2luY2x1ZGUgPGxpbnV4L2Nsay5o
PgorI2luY2x1ZGUgPGxpbnV4L2RlYnVnZnMuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2NvbnN1
bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvaTJjLmg+CiAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+
CkBAIC0xMDksNiArMTEwLDcgQEAgc3RydWN0IHRpX3NuX2JyaWRnZSB7CiAJc3RydWN0IGRybV9k
cF9hdXgJCWF1eDsKIAlzdHJ1Y3QgZHJtX2JyaWRnZQkJYnJpZGdlOwogCXN0cnVjdCBkcm1fY29u
bmVjdG9yCQljb25uZWN0b3I7CisJc3RydWN0IGRlbnRyeQkJCSpkZWJ1Z2ZzOwogCXN0cnVjdCBk
ZXZpY2Vfbm9kZQkJKmhvc3Rfbm9kZTsKIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlCQkqZHNpOwog
CXN0cnVjdCBjbGsJCQkqcmVmY2xrOwpAQCAtMTc4LDYgKzE4MCw0MiBAQCBzdGF0aWMgY29uc3Qg
c3RydWN0IGRldl9wbV9vcHMgdGlfc25fYnJpZGdlX3BtX29wcyA9IHsKIAlTRVRfUlVOVElNRV9Q
TV9PUFModGlfc25fYnJpZGdlX3N1c3BlbmQsIHRpX3NuX2JyaWRnZV9yZXN1bWUsIE5VTEwpCiB9
OwogCitzdGF0aWMgaW50IHN0YXR1c19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywgdm9pZCAqZGF0
YSkKK3sKKwlzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSA9IHMtPnByaXZhdGU7CisJdW5zaWdu
ZWQgaW50IHJlZywgdmFsOworCisJc2VxX3B1dHMocywgIlNUQVRVUyBSRUdJU1RFUlM6XG4iKTsK
KworCXBtX3J1bnRpbWVfZ2V0X3N5bmMocGRhdGEtPmRldik7CisKKwkvKiBJUlEgU3RhdHVzIFJl
Z2lzdGVycywgc2VlIFRhYmxlIDMxIGluIGRhdGFzaGVldCAqLworCWZvciAocmVnID0gMHhmMDsg
cmVnIDw9IDB4Zjg7IHJlZysrKSB7CisJCXJlZ21hcF9yZWFkKHBkYXRhLT5yZWdtYXAsIHJlZywg
JnZhbCk7CisJCXNlcV9wcmludGYocywgIlsweCUwMnhdID0gMHglMDh4XG4iLCByZWcsIHZhbCk7
CisJfQorCisJcG1fcnVudGltZV9wdXQocGRhdGEtPmRldik7CisKKwlyZXR1cm4gMDsKK30KKwor
REVGSU5FX1NIT1dfQVRUUklCVVRFKHN0YXR1cyk7CisKK3N0YXRpYyB2b2lkIHRpX3NuX2RlYnVn
ZnNfaW5pdChzdHJ1Y3QgdGlfc25fYnJpZGdlICpwZGF0YSkKK3sKKwlwZGF0YS0+ZGVidWdmcyA9
IGRlYnVnZnNfY3JlYXRlX2RpcigidGlfc242NWRzaTg2IiwgTlVMTCk7CisKKwlkZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlKCJzdGF0dXMiLCAwNjAwLCBwZGF0YS0+ZGVidWdmcywgcGRhdGEsCisJCQkmc3Rh
dHVzX2ZvcHMpOworfQorCitzdGF0aWMgdm9pZCB0aV9zbl9kZWJ1Z2ZzX3JlbW92ZShzdHJ1Y3Qg
dGlfc25fYnJpZGdlICpwZGF0YSkKK3sKKwlkZWJ1Z2ZzX3JlbW92ZV9yZWN1cnNpdmUocGRhdGEt
PmRlYnVnZnMpOworCXBkYXRhLT5kZWJ1Z2ZzID0gTlVMTDsKK30KKwogLyogQ29ubmVjdG9yIGZ1
bmNzICovCiBzdGF0aWMgc3RydWN0IHRpX3NuX2JyaWRnZSAqCiBjb25uZWN0b3JfdG9fdGlfc25f
YnJpZGdlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCkBAIC04NjksNiArOTA3LDgg
QEAgc3RhdGljIGludCB0aV9zbl9icmlkZ2VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVu
dCwKIAogCWRybV9icmlkZ2VfYWRkKCZwZGF0YS0+YnJpZGdlKTsKIAorCXRpX3NuX2RlYnVnZnNf
aW5pdChwZGF0YSk7CisKIAlyZXR1cm4gMDsKIH0KIApAQCAtODc5LDYgKzkxOSw4IEBAIHN0YXRp
YyBpbnQgdGlfc25fYnJpZGdlX3JlbW92ZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50KQogCWlm
ICghcGRhdGEpCiAJCXJldHVybiAtRUlOVkFMOwogCisJdGlfc25fZGVidWdmc19yZW1vdmUocGRh
dGEpOworCiAJb2Zfbm9kZV9wdXQocGRhdGEtPmhvc3Rfbm9kZSk7CiAKIAlwbV9ydW50aW1lX2Rp
c2FibGUocGRhdGEtPmRldik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
