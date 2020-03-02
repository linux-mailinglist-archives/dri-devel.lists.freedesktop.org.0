Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E92C417672C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E2A6E8B2;
	Mon,  2 Mar 2020 22:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766686E899
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:27:18 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so1829129wro.9
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E9zTLGBNNN54YIhc3c9OPHxiamIGydzptvOB63+Mt8Y=;
 b=IXA238jyUCndn1By49pG/o/5yxGPpqWGW4w3UlkkmdCpder19tHdTWTMWSgB9ZOtmb
 mJuvlzyqEIrHYAGl+SYVtcxaPompCBlppDHpu8CIdOUCWanPAxZdslCtn5e3r1yFqL+F
 9HJykUybQIQL6OEcWQdm7pA3eVKzGG5XIA39o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E9zTLGBNNN54YIhc3c9OPHxiamIGydzptvOB63+Mt8Y=;
 b=cB9zWJWzHklIG/WMxhgGKZy0Pa74ZfrFmoNpXYG9tdLH29XCBSeMef6hT/AjWSjoHr
 uZEk4Ozh/cEtGAAAtY9aDow1MH9OwE/Dy44MjdYFB9K1D10NCmfSc60zwAJ66ntvACZZ
 X4J4zY3+Mu4vRo/aJkOa9zzmIoIU7TPNTzn3sYDkyrs92CtZ9kGIdqvyhoWg9/DeG1X1
 C/HnfBwE9c9r82vLkgXkyQgiQm6CVS5J3OEFf8obKR8iCXN+cIHmWzzJZWiSqjZyvqix
 K0qv7/xkbakgwsKAXu+u4Xdtm+nd4ArxWqxbh60P0mL7cBJ1QeYzyNXQxKP/ETnZdN7f
 81Fw==
X-Gm-Message-State: ANhLgQ17dsnCWM28pbtXcmZcpa67Ob/WzAbirf03yCj/375oXw0MVG7Z
 crg8jwbfBp6elTa7bvhT+jpZxws+jkM=
X-Google-Smtp-Source: ADFU+vu17V2+hhwNxMgF00S+RXI5Bc+ahqEInf2w5oY4TH3dFIUL5akpZZyS/YXB0wB1Gb4Img+3bg==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr1605591wrp.344.1583188036929; 
 Mon, 02 Mar 2020 14:27:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.27.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:27:16 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Mon,  2 Mar 2020 23:26:09 +0100
Message-Id: <20200302222631.3861340-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
 virtualization@lists.linux-foundation.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGV2ZW4gZGVsZXRlIHRoZSBkcm1fZHJpdmVyLnJlbGVhc2UgaG9vayBub3chCgpUaGlz
IGlzIG1hZGUgcG9zc2libGUgYnkgYSBwcmVjZWVkaW5nIHBhdGNoIHdoaWNoIGFkZGVkIGEgZHJt
bV8KY2xlYW51cCBhY3Rpb24gdG8gZHJtX21vZGVfY29uZmlnX2luaXQoKSwgaGVuY2UgYWxsIHdl
IG5lZWQgdG8gZG8gdG8KZW5zdXJlIHRoYXQgZHJtX21vZGVfY29uZmlnX2NsZWFudXAoKSBpcyBy
dW4gb24gZmluYWwgZHJtX2RldmljZQpjbGVhbnVwIGlzIGNoZWNrIHRoZSBuZXcgZXJyb3IgY29k
ZSBmb3IgX2luaXQoKS4KCnYyOiBFeHBsYWluIHdoeSB0aGlzIGNsZWFudXAgaXMgcG9zc2libGUg
KExhdXJlbnQpLgoKdjM6IFVzZSBkcm1tX21vZGVfY29uZmlnX2luaXQoKSBmb3IgbW9yZSBjbGFy
aXR5IChTYW0sIFRob21hcykKCkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFj
a2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQu
Y29tPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0
dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25A
bGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2Np
cnJ1cy5jIHwgMjEgKysrKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2NpcnJ1cy9jaXJydXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXgg
YTlkNzg5YTU2NTM2Li5iZDg3ODRlYTlkNjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9j
aXJydXMvY2lycnVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAt
NTEwLDExICs1MTAsMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVu
Y3MgY2lycnVzX21vZGVfY29uZmlnX2Z1bmNzID0gewogCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0
b21pY19oZWxwZXJfY29tbWl0LAogfTsKIAotc3RhdGljIHZvaWQgY2lycnVzX21vZGVfY29uZmln
X2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKK3N0YXRpYyBpbnQgY2lycnVzX21v
ZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIHsKIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gJmNpcnJ1cy0+ZGV2OworCWludCByZXQ7CisKKwlyZXQgPSBkcm1t
X21vZGVfY29uZmlnX2luaXQoZGV2KTsKKwlpZiAocmV0KQorCQlyZXR1cm4gcmV0OwogCi0JZHJt
X21vZGVfY29uZmlnX2luaXQoZGV2KTsKIAlkZXYtPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDA7
CiAJZGV2LT5tb2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLm1h
eF93aWR0aCA9IENJUlJVU19NQVhfUElUQ0ggLyAyOwpAQCAtNTIyLDE1ICs1MjYsMTIgQEAgc3Rh
dGljIHZvaWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNpcnJ1c19kZXZpY2UgKmNp
cnJ1cykKIAlkZXYtPm1vZGVfY29uZmlnLnByZWZlcnJlZF9kZXB0aCA9IDE2OwogCWRldi0+bW9k
ZV9jb25maWcucHJlZmVyX3NoYWRvdyA9IDA7CiAJZGV2LT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZj
aXJydXNfbW9kZV9jb25maWdfZnVuY3M7CisKKwlyZXR1cm4gMDsKIH0KIAogLyogLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
ICovCiAKLXN0YXRpYyB2b2lkIGNpcnJ1c19yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
Ci17Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKLX0KLQogREVGSU5FX0RSTV9HRU1f
Rk9QUyhjaXJydXNfZm9wcyk7CiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBjaXJydXNfZHJp
dmVyID0gewpAQCAtNTQ0LDcgKzU0NSw2IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBjaXJy
dXNfZHJpdmVyID0gewogCiAJLmZvcHMJCSA9ICZjaXJydXNfZm9wcywKIAlEUk1fR0VNX1NITUVN
X0RSSVZFUl9PUFMsCi0JLnJlbGVhc2UgICAgICAgICA9IGNpcnJ1c19yZWxlYXNlLAogfTsKIAog
c3RhdGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LApAQCAtNTkx
LDcgKzU5MSw5IEBAIHN0YXRpYyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAq
cGRldiwKIAlpZiAoY2lycnVzLT5tbWlvID09IE5VTEwpCiAJCWdvdG8gZXJyX3VubWFwX3ZyYW07
CiAKLQljaXJydXNfbW9kZV9jb25maWdfaW5pdChjaXJydXMpOworCXJldCA9IGNpcnJ1c19tb2Rl
X2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJaWYgKHJldCkKKwkJZ290byBlcnJfY2xlYW51cDsKIAog
CXJldCA9IGNpcnJ1c19jb25uX2luaXQoY2lycnVzKTsKIAlpZiAocmV0IDwgMCkKQEAgLTYxMyw3
ICs2MTUsNiBAQCBzdGF0aWMgaW50IGNpcnJ1c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBk
ZXYsCiAJcmV0dXJuIDA7CiAKIGVycl9jbGVhbnVwOgotCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVw
KGRldik7CiAJaW91bm1hcChjaXJydXMtPm1taW8pOwogZXJyX3VubWFwX3ZyYW06CiAJaW91bm1h
cChjaXJydXMtPnZyYW0pOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
