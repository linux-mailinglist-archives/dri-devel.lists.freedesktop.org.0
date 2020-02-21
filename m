Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE3E1688DA
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC1F76F563;
	Fri, 21 Feb 2020 21:05:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF776F528
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:04:07 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3152458wmj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r8MykfXoZv4RMC4YeXLKl7BIFZZ0Ny74Kd3gytdkuYM=;
 b=LleKOXH95g8GyMdG1Jy31f6vvwdY7WGDBb6P+a7mmv2VXdnEk2YOw4iM/p8lz1l6mX
 W65PRiQmr9UY2uCKVcNNvENlPFp4aSqDAgU57LobPbwUCNuIo1ikGW9IOHl9jLGljHIl
 4Wkh8Wqe47O6wQqCFKXXvQEPbOEYE4P/5tDLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r8MykfXoZv4RMC4YeXLKl7BIFZZ0Ny74Kd3gytdkuYM=;
 b=QzeOw7Z3yVAyB3tZZb9CcahA4cvHuKPfhdNs5KyQyOlCMFhcleTymUdD/LjM5kYnAM
 j0Hq96pDu6dQFE673Xy1o9M2f/O43AKZQc5MwkIGvFApvP2yhArERqbF1hd8tCMOSOgW
 lymh3NWpyCRjaUEhkgjKR4LEz1tk4ZovqxDFxug0IRqlG6sk+rXGP/8qIskWsKGrDRGd
 MPqIW6B57Y70XzZF8FFjSAzVyznijYrRj/b+AgkfQKwhGzSYom28Dqre5wVVplCyahQp
 r/bt2mo8OWU0tr9VX/FirTrBOZDamlEgVopcvZcu20pXdVRmlQ6eAsDMpG38mWysRNss
 IBNw==
X-Gm-Message-State: APjAAAUspbylVyCfxfm0iTlSIBwT+A2iKT0+NNRVigB3wNaVvQBcKnLA
 CJ0DmExKJALyQj9/kZboXyrtAd44DGQ=
X-Google-Smtp-Source: APXvYqzEU0Wr4XFOu1nRzN2rE2Luhw9/C/9t9Xk8nlFxjcUfuIoi5P26Lh7Idw9eHPYj59oVnGvSkQ==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr5684120wml.55.1582319046109; 
 Fri, 21 Feb 2020 13:04:06 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:04:05 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 29/51] drm/cirrus: Drop explicit drm_mode_config_cleanup call
Date: Fri, 21 Feb 2020 22:02:57 +0100
Message-Id: <20200221210319.2245170-30-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
 Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
KExhdXJlbnQpLgoKQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+CkNjOiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRoYXQuY29tPgpDYzogR2VyZCBI
b2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4K
Q2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogdmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91
bmRhdGlvbi5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vY2lycnVzL2NpcnJ1cy5jIHwgMjEgKysr
KysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMKaW5kZXggYTlkNzg5YTU2NTM2Li42
YWMwMjg2ODEwZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9jaXJydXMvY2lycnVzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2NpcnJ1cy9jaXJydXMuYwpAQCAtNTEwLDExICs1MTAsMTUg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgY2lycnVzX21vZGVf
Y29uZmlnX2Z1bmNzID0gewogCS5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21pY19oZWxwZXJfY29t
bWl0LAogfTsKIAotc3RhdGljIHZvaWQgY2lycnVzX21vZGVfY29uZmlnX2luaXQoc3RydWN0IGNp
cnJ1c19kZXZpY2UgKmNpcnJ1cykKK3N0YXRpYyBpbnQgY2lycnVzX21vZGVfY29uZmlnX2luaXQo
c3RydWN0IGNpcnJ1c19kZXZpY2UgKmNpcnJ1cykKIHsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
ID0gJmNpcnJ1cy0+ZGV2OworCWludCByZXQ7CisKKwlyZXQgPSBkcm1fbW9kZV9jb25maWdfaW5p
dChkZXYpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAKLQlkcm1fbW9kZV9jb25maWdfaW5p
dChkZXYpOwogCWRldi0+bW9kZV9jb25maWcubWluX3dpZHRoID0gMDsKIAlkZXYtPm1vZGVfY29u
ZmlnLm1pbl9oZWlnaHQgPSAwOwogCWRldi0+bW9kZV9jb25maWcubWF4X3dpZHRoID0gQ0lSUlVT
X01BWF9QSVRDSCAvIDI7CkBAIC01MjIsMTUgKzUyNiwxMiBAQCBzdGF0aWMgdm9pZCBjaXJydXNf
bW9kZV9jb25maWdfaW5pdChzdHJ1Y3QgY2lycnVzX2RldmljZSAqY2lycnVzKQogCWRldi0+bW9k
ZV9jb25maWcucHJlZmVycmVkX2RlcHRoID0gMTY7CiAJZGV2LT5tb2RlX2NvbmZpZy5wcmVmZXJf
c2hhZG93ID0gMDsKIAlkZXYtPm1vZGVfY29uZmlnLmZ1bmNzID0gJmNpcnJ1c19tb2RlX2NvbmZp
Z19mdW5jczsKKworCXJldHVybiAwOwogfQogCiAvKiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0gKi8KIAotc3RhdGljIHZv
aWQgY2lycnVzX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQlkcm1fbW9kZV9j
b25maWdfY2xlYW51cChkZXYpOwotfQotCiBERUZJTkVfRFJNX0dFTV9GT1BTKGNpcnJ1c19mb3Bz
KTsKIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CkBAIC01NDQs
NyArNTQ1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGNpcnJ1c19kcml2ZXIgPSB7CiAK
IAkuZm9wcwkJID0gJmNpcnJ1c19mb3BzLAogCURSTV9HRU1fU0hNRU1fRFJJVkVSX09QUywKLQku
cmVsZWFzZSAgICAgICAgID0gY2lycnVzX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgaW50IGNpcnJ1
c19wY2lfcHJvYmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsCkBAIC01OTEsNyArNTkxLDkgQEAgc3Rh
dGljIGludCBjaXJydXNfcGNpX3Byb2JlKHN0cnVjdCBwY2lfZGV2ICpwZGV2LAogCWlmIChjaXJy
dXMtPm1taW8gPT0gTlVMTCkKIAkJZ290byBlcnJfdW5tYXBfdnJhbTsKIAotCWNpcnJ1c19tb2Rl
X2NvbmZpZ19pbml0KGNpcnJ1cyk7CisJcmV0ID0gY2lycnVzX21vZGVfY29uZmlnX2luaXQoY2ly
cnVzKTsKKwlpZiAocmV0KQorCQlnb3RvIGVycl9jbGVhbnVwOwogCiAJcmV0ID0gY2lycnVzX2Nv
bm5faW5pdChjaXJydXMpOwogCWlmIChyZXQgPCAwKQpAQCAtNjEzLDcgKzYxNSw2IEBAIHN0YXRp
YyBpbnQgY2lycnVzX3BjaV9wcm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwKIAlyZXR1cm4gMDsK
IAogZXJyX2NsZWFudXA6Ci0JZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGV2KTsKIAlpb3VubWFw
KGNpcnJ1cy0+bW1pbyk7CiBlcnJfdW5tYXBfdnJhbToKIAlpb3VubWFwKGNpcnJ1cy0+dnJhbSk7
Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
