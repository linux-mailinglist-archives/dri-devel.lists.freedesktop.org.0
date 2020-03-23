Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9998218F792
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:51:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0D6E1BC;
	Mon, 23 Mar 2020 14:50:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35ADC6E1E5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s1so17446260wrv.5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eR2FEf38TF0Ec6CbrNrCOun61RqAYczkIZF4p4zJero=;
 b=WpWb3C/UEL7p6y8tfyg5AuoGDa/LKFcpwqomZeD6QP+zMN71AHVu+H8KOYe4SkYx+j
 sE8pOjnXKhp0eSCkOaxL6y/Y9rIC5mBY9ivk9lHUW+IRKX1nViyedQOy5jz8tAQelrOy
 UTT7cQCXwVVUKxv0GL12bYxp0UByCf/L432ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eR2FEf38TF0Ec6CbrNrCOun61RqAYczkIZF4p4zJero=;
 b=X+jLZnfNQPd6/2jW1xmoG+jMn6eXA9IAOx+yFog/dPbnxreplT7EpmiF7lkEvBDDC6
 pv1Y8PoloC42cizZvUsyAVjU9LwwjtYGvyFn4DErWL8FEwNfOhKj/qDehQdHSLvrSe1t
 dVzyUfbgBafIb7YMcKWI7Vgf1i3xGSYe7+mmOCxa/yEjJsr6o4qSJN2x2Xs27b+YG63d
 LddFuZGHPVk+ctE0f7cVnaqiF/u/m+fAoEgPz9i1szFjF2sjj3MQIYaEX5IO49l8mv8a
 xChHZEGvbFcZbIzxRpxMQ5rNcHUGzWh64C2INnYCkRCYa7mwWl6DZIi+u/naNznU6AnK
 yUCw==
X-Gm-Message-State: ANhLgQ0r/S4QBCpdoCjlBZsjATLsUv7zR9JhwquNJsuHj4eSW25bFR9p
 nIgQhqSsVe6VvEcVk3INTcWtYJ58ZQxdBg==
X-Google-Smtp-Source: ADFU+vsYrE5M5/8jvcTVoW2tbKA8F/GHka6dScy8weWB5My4H9oipMabtBizXZZAGgDzS8MbgBbQ9Q==
X-Received: by 2002:adf:a387:: with SMTP id l7mr30239990wrb.250.1584975038416; 
 Mon, 23 Mar 2020 07:50:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 30/51] drm/cirrus: Fully embrace devm_
Date: Mon, 23 Mar 2020 15:49:29 +0100
Message-Id: <20200323144950.3018436-31-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGUgZHJtX2RldmljZSBsaWZldGltZSBmdW4gY2xlYW5lZCB1cCB0aGVyZSdzIG5vdGhp
bmcgaW4gdGhlIHdheQphbnltb3JlIHRvIHVzZSBkZXZtXyBmb3IgZXZlcnl0aGluZyBodyByZWxl
YXRlZC4gRG8gaXQsIGFuZCBpbiB0aGUKcHJvY2VzcywgdGhyb3cgb3V0IHRoZSBlbnRpcmUgb25p
b24gdW53aW5kaW5nLgoKQWNrZWQtYnk6IEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29t
PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Q2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNjOiBHZXJkIEhvZmZtYW5uIDxr
cmF4ZWxAcmVkaGF0LmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogRW1pbCBW
ZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIHwgNDQgKysr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Np
cnJ1cy9jaXJydXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggYmQ4
Nzg0ZWE5ZDY0Li5hMzYyNjk3MTdjM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJy
dXMvY2lycnVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtNTU4
LDcgKzU1OCw3IEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0JcmV0ID0gcGNpX2VuYWJsZV9kZXZp
Y2UocGRldik7CisJcmV0ID0gcGNpbV9lbmFibGVfZGV2aWNlKHBkZXYpOwogCWlmIChyZXQpCiAJ
CXJldHVybiByZXQ7CiAKQEAgLTU2OSwzOSArNTY5LDM4IEBAIHN0YXRpYyBpbnQgY2lycnVzX3Bj
aV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlyZXQgPSAtRU5PTUVNOwogCWNpcnJ1cyA9
IGt6YWxsb2Moc2l6ZW9mKCpjaXJydXMpLCBHRlBfS0VSTkVMKTsKIAlpZiAoY2lycnVzID09IE5V
TEwpCi0JCWdvdG8gZXJyX3BjaV9yZWxlYXNlOworCQlyZXR1cm4gcmV0OwogCiAJZGV2ID0gJmNp
cnJ1cy0+ZGV2OwotCXJldCA9IGRybV9kZXZfaW5pdChkZXYsICZjaXJydXNfZHJpdmVyLCAmcGRl
di0+ZGV2KTsKKwlyZXQgPSBkZXZtX2RybV9kZXZfaW5pdCgmcGRldi0+ZGV2LCBkZXYsICZjaXJy
dXNfZHJpdmVyKTsKIAlpZiAocmV0KSB7CiAJCWtmcmVlKGNpcnJ1cyk7Ci0JCWdvdG8gZXJyX3Bj
aV9yZWxlYXNlOworCQlyZXR1cm4gcmV0OwogCX0KIAlkZXYtPmRldl9wcml2YXRlID0gY2lycnVz
OwogCWRybW1fYWRkX2ZpbmFsX2tmcmVlKGRldiwgY2lycnVzKTsKIAotCXJldCA9IC1FTk9NRU07
Ci0JY2lycnVzLT52cmFtID0gaW9yZW1hcChwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMCksCi0J
CQkgICAgICAgcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKSk7CisJY2lycnVzLT52cmFtID0gZGV2
bV9pb3JlbWFwKCZwZGV2LT5kZXYsIHBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCAwKSwKKwkJCQkg
ICAgcGNpX3Jlc291cmNlX2xlbihwZGV2LCAwKSk7CiAJaWYgKGNpcnJ1cy0+dnJhbSA9PSBOVUxM
KQotCQlnb3RvIGVycl9kZXZfcHV0OworCQlyZXR1cm4gLUVOT01FTTsKIAotCWNpcnJ1cy0+bW1p
byA9IGlvcmVtYXAocGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIDEpLAotCQkJICAgICAgIHBjaV9y
ZXNvdXJjZV9sZW4ocGRldiwgMSkpOworCWNpcnJ1cy0+bW1pbyA9IGRldm1faW9yZW1hcCgmcGRl
di0+ZGV2LCBwY2lfcmVzb3VyY2Vfc3RhcnQocGRldiwgMSksCisJCQkJICAgIHBjaV9yZXNvdXJj
ZV9sZW4ocGRldiwgMSkpOwogCWlmIChjaXJydXMtPm1taW8gPT0gTlVMTCkKLQkJZ290byBlcnJf
dW5tYXBfdnJhbTsKKwkJcmV0dXJuIC1FTk9NRU07CiAKIAlyZXQgPSBjaXJydXNfbW9kZV9jb25m
aWdfaW5pdChjaXJydXMpOwogCWlmIChyZXQpCi0JCWdvdG8gZXJyX2NsZWFudXA7CisJCXJldHVy
biByZXQ7CiAKIAlyZXQgPSBjaXJydXNfY29ubl9pbml0KGNpcnJ1cyk7CiAJaWYgKHJldCA8IDAp
Ci0JCWdvdG8gZXJyX2NsZWFudXA7CisJCXJldHVybiByZXQ7CiAKIAlyZXQgPSBjaXJydXNfcGlw
ZV9pbml0KGNpcnJ1cyk7CiAJaWYgKHJldCA8IDApCi0JCWdvdG8gZXJyX2NsZWFudXA7CisJCXJl
dHVybiByZXQ7CiAKIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZGV2KTsKIApAQCAtNjA5LDMzICs2
MDgsMTggQEAgc3RhdGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2
LAogCXBjaV9zZXRfZHJ2ZGF0YShwZGV2LCBkZXYpOwogCXJldCA9IGRybV9kZXZfcmVnaXN0ZXIo
ZGV2LCAwKTsKIAlpZiAocmV0KQotCQlnb3RvIGVycl9jbGVhbnVwOworCQlyZXR1cm4gcmV0Owog
CiAJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZGV2LCBkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJl
ZF9kZXB0aCk7CiAJcmV0dXJuIDA7Ci0KLWVycl9jbGVhbnVwOgotCWlvdW5tYXAoY2lycnVzLT5t
bWlvKTsKLWVycl91bm1hcF92cmFtOgotCWlvdW5tYXAoY2lycnVzLT52cmFtKTsKLWVycl9kZXZf
cHV0OgotCWRybV9kZXZfcHV0KGRldik7Ci1lcnJfcGNpX3JlbGVhc2U6Ci0JcGNpX3JlbGVhc2Vf
cmVnaW9ucyhwZGV2KTsKLQlyZXR1cm4gcmV0OwogfQogCiBzdGF0aWMgdm9pZCBjaXJydXNfcGNp
X3JlbW92ZShzdHJ1Y3QgcGNpX2RldiAqcGRldikKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwotCXN0cnVjdCBjaXJydXNfZGV2aWNlICpjaXJydXMg
PSBkZXYtPmRldl9wcml2YXRlOwogCiAJZHJtX2Rldl91bnBsdWcoZGV2KTsKIAlkcm1fYXRvbWlj
X2hlbHBlcl9zaHV0ZG93bihkZXYpOwotCWlvdW5tYXAoY2lycnVzLT5tbWlvKTsKLQlpb3VubWFw
KGNpcnJ1cy0+dnJhbSk7Ci0JZHJtX2Rldl9wdXQoZGV2KTsKLQlwY2lfcmVsZWFzZV9yZWdpb25z
KHBkZXYpOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgcGNpaWRsaXN0
W10gPSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
