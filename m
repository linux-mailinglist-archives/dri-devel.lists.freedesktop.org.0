Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9713E78612
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F176789C9A;
	Mon, 29 Jul 2019 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A1489BBD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 05:33:59 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id f17so23399422pfn.6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:33:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fFA6JHvF9RL4SlnrCsKvFmdFU03CeyVLjFDP1pS0wlw=;
 b=HMF9BWtqNnF91SKIdMaiayizYMhmXCPFJfm3juYE18gwzgpApB3XUBsZnzppaVn0d8
 NHp/duOP57jhV8NBXVg9eru4Yqs+ZCRk16BEkzkkNQmPdnUE9OWbu5tc/HQUNffn+zX0
 iJKEiXE5zhlydPi6ZYVx39hYcQCKDufXqgnZnpnYjLnW2w1Aiz/iyOhAL5LWp5fWVSld
 DlfI/eVUaO1y3RvtyegXQ26vxNQDBpRZI0/3mcajG2rQ6pM3UWfIsE021HoiqK252WVH
 Aio1m19+ku1PH0ZahOSZWoBwTeS6u8vQ4lF8Vv7vsMLgJsthk8Ipf1Vu+4RbJ6Kqg/Z+
 IsRQ==
X-Gm-Message-State: APjAAAX6G/Bs12PHHKYQl9WJd8gOJidEtbTy0Mwr63eSijP63X920nRb
 wc489YjffbG8Gpjm3/aCS+D0Bw==
X-Google-Smtp-Source: APXvYqzkNeaQn+UkeE5CYItkb2celfQKxux5U1FpZg0SMhD7RWrrUnStw+c6KqDZ6DbluZXXZwbGSg==
X-Received: by 2002:a17:90a:2767:: with SMTP id
 o94mr106651693pje.25.1564378439306; 
 Sun, 28 Jul 2019 22:33:59 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
 by smtp.gmail.com with ESMTPSA id z4sm93792810pfg.166.2019.07.28.22.33.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 22:33:58 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 2/2] drm/mediatek: set DMA max segment size
Date: Mon, 29 Jul 2019 14:33:35 +0900
Message-Id: <20190729053335.251379-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190729053335.251379-1-acourbot@chromium.org>
References: <20190729053335.251379-1-acourbot@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fFA6JHvF9RL4SlnrCsKvFmdFU03CeyVLjFDP1pS0wlw=;
 b=njTypoIWLBX0T+S5qtVUNVWH5W/9uNjn4BRJIz3vfNvxtl0S+NyxKpqLBct47BG1Zy
 jG7M/gdLx8a1y8x2IqY+SKnbvRs+uCiytvlgDk6hEm1PDGrT2ZSnxwuIq0ePvaRnnV8l
 UjTRa6FPm9CbDZnEOFLmGEoW1G0ZakKYXXSQM=
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
Cc: Alexandre Courbot <acourbot@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBkcml2ZXIgcmVxdWlyZXMgaW1wb3J0ZWQgUFJJTUUgYnVmZmVycyB0byBhcHBlYXIgY29u
dGlndW91c2x5IGluCml0cyBJTyBhZGRyZXNzIHNwYWNlLiBNYWtlIHN1cmUgdGhpcyBpcyB0aGUg
Y2FzZSBieSBzZXR0aW5nIHRoZSBtYXhpbXVtCkRNQSBzZWdtZW50IHNpemUgdG8gYSBtb3JlIHN1
aXRhYmxlIHZhbHVlIHRoYW4gdGhlIGRlZmF1bHQgNjRLQi4KClNpZ25lZC1vZmYtYnk6IEFsZXhh
bmRyZSBDb3VyYm90IDxhY291cmJvdEBjaHJvbWl1bS5vcmc+ClJldmlld2VkLWJ5OiBUb21hc3og
RmlnYSA8dGZpZ2FAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX2Rydi5jIHwgMzUgKysrKysrKysrKysrKysrKysrKysrKysrLS0KIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oIHwgIDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgMzUg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHJtX2Rydi5jCmluZGV4IDhiMThhMDBhNThjNy4uYzAyMWQ0YzgzMjRmIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpAQCAtMjEzLDYgKzIxMyw3IEBAIHN0YXRpYyBpbnQg
bXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogCXN0cnVjdCBtdGtfZHJt
X3ByaXZhdGUgKnByaXZhdGUgPSBkcm0tPmRldl9wcml2YXRlOwogCXN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXY7CiAJc3RydWN0IGRldmljZV9ub2RlICpucDsKKwlzdHJ1Y3QgZGV2aWNlICpk
bWFfZGV2OwogCWludCByZXQ7CiAKIAlpZiAoIWlvbW11X3ByZXNlbnQoJnBsYXRmb3JtX2J1c190
eXBlKSkKQEAgLTI3NSw3ICsyNzYsMjkgQEAgc3RhdGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0
cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJCWdvdG8gZXJyX2NvbXBvbmVudF91bmJpbmQ7CiAJfQog
Ci0JcHJpdmF0ZS0+ZG1hX2RldiA9ICZwZGV2LT5kZXY7CisJZG1hX2RldiA9ICZwZGV2LT5kZXY7
CisJcHJpdmF0ZS0+ZG1hX2RldiA9IGRtYV9kZXY7CisKKwkvKgorCSAqIENvbmZpZ3VyZSB0aGUg
RE1BIHNlZ21lbnQgc2l6ZSB0byBtYWtlIHN1cmUgd2UgZ2V0IGNvbnRpZ3VvdXMgSU9WQQorCSAq
IHdoZW4gaW1wb3J0aW5nIFBSSU1FIGJ1ZmZlcnMuCisJICovCisJaWYgKCFkbWFfZGV2LT5kbWFf
cGFybXMpIHsKKwkJcHJpdmF0ZS0+ZG1hX3Bhcm1zX2FsbG9jYXRlZCA9IHRydWU7CisJCWRtYV9k
ZXYtPmRtYV9wYXJtcyA9CisJCQlkZXZtX2t6YWxsb2MoZHJtLT5kZXYsIHNpemVvZigqZG1hX2Rl
di0+ZG1hX3Bhcm1zKSwKKwkJCQkgICAgIEdGUF9LRVJORUwpOworCX0KKwlpZiAoIWRtYV9kZXYt
PmRtYV9wYXJtcykgeworCQlyZXQgPSAtRU5PTUVNOworCQlnb3RvIGVycl9jb21wb25lbnRfdW5i
aW5kOworCX0KKworCXJldCA9IGRtYV9zZXRfbWF4X3NlZ19zaXplKGRtYV9kZXYsICh1bnNpZ25l
ZCBpbnQpRE1BX0JJVF9NQVNLKDMyKSk7CisJaWYgKHJldCkgeworCQlkZXZfZXJyKGRtYV9kZXYs
ICJGYWlsZWQgdG8gc2V0IERNQSBzZWdtZW50IHNpemVcbiIpOworCQlnb3RvIGVycl91bnNldF9k
bWFfcGFybXM7CisJfQogCiAJLyoKIAkgKiBXZSBkb24ndCB1c2UgdGhlIGRybV9pcnFfaW5zdGFs
bCgpIGhlbHBlcnMgcHJvdmlkZWQgYnkgdGhlIERSTQpAQCAtMjg1LDEzICszMDgsMTYgQEAgc3Rh
dGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCiAJZHJtLT5p
cnFfZW5hYmxlZCA9IHRydWU7CiAJcmV0ID0gZHJtX3ZibGFua19pbml0KGRybSwgTUFYX0NSVEMp
OwogCWlmIChyZXQgPCAwKQotCQlnb3RvIGVycl9jb21wb25lbnRfdW5iaW5kOworCQlnb3RvIGVy
cl91bnNldF9kbWFfcGFybXM7CiAKIAlkcm1fa21zX2hlbHBlcl9wb2xsX2luaXQoZHJtKTsKIAlk
cm1fbW9kZV9jb25maWdfcmVzZXQoZHJtKTsKIAogCXJldHVybiAwOwogCitlcnJfdW5zZXRfZG1h
X3Bhcm1zOgorCWlmIChwcml2YXRlLT5kbWFfcGFybXNfYWxsb2NhdGVkKQorCQlkbWFfZGV2LT5k
bWFfcGFybXMgPSBOVUxMOwogZXJyX2NvbXBvbmVudF91bmJpbmQ6CiAJY29tcG9uZW50X3VuYmlu
ZF9hbGwoZHJtLT5kZXYsIGRybSk7CiBlcnJfY29uZmlnX2NsZWFudXA6CkBAIC0zMDIsOSArMzI4
LDE0IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJt
KQogCiBzdGF0aWMgdm9pZCBtdGtfZHJtX2ttc19kZWluaXQoc3RydWN0IGRybV9kZXZpY2UgKmRy
bSkKIHsKKwlzdHJ1Y3QgbXRrX2RybV9wcml2YXRlICpwcml2YXRlID0gZHJtLT5kZXZfcHJpdmF0
ZTsKKwogCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOwogCWRybV9hdG9taWNfaGVscGVy
X3NodXRkb3duKGRybSk7CiAKKwlpZiAocHJpdmF0ZS0+ZG1hX3Bhcm1zX2FsbG9jYXRlZCkKKwkJ
cHJpdmF0ZS0+ZG1hX2Rldi0+ZG1hX3Bhcm1zID0gTlVMTDsKKwogCWNvbXBvbmVudF91bmJpbmRf
YWxsKGRybS0+ZGV2LCBkcm0pOwogCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7CiB9CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5oCmluZGV4IDU5OGZmM2U3MDQ0Ni4uZTAz
ZmVhMTJmZjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9k
cnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuaApAQCAtNTEs
NiArNTEsOCBAQCBzdHJ1Y3QgbXRrX2RybV9wcml2YXRlIHsKIAl9IGNvbW1pdDsKIAogCXN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdXNwZW5kX3N0YXRlOworCisJYm9vbCBkbWFfcGFybXNfYWxs
b2NhdGVkOwogfTsKIAogZXh0ZXJuIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbXRrX2RkcF9kcml2
ZXI7Ci0tIAoyLjIyLjAuNzA5LmcxMDIzMDIxNDdiLWdvb2cKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
