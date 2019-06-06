Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B97DD380A6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF5889A5E;
	Thu,  6 Jun 2019 22:28:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D91389A34
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:14 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so5543728edv.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yYxrzPGYeHw5OKnXexCCG8lNOTvG3IHbPNWAvBtpsmI=;
 b=URVVIrAtm1HTCVi/Uf8XRpleIpjtRBahC4QhAGS3WXPEnnGKkV+YU+QWzg7UGI6e8R
 kCr1JTRMcPvGICKHY+B7v2+m8Q/9GJlpG+foNGTlTtqHnME/0X9ZxdWGPPC71I/+fPfD
 1WmuTF4VjkKL0UsMB6ZAtO9MsSwL7T5QTkrvuZA23BYOsToENMIYeA7u/mf1IaGSuQQp
 Kkq9Js4xClorC2VQcvC1LAqlAVKNxkBuObai+cCGyNitplby6xSjls9zzZJcmoKH58qe
 kxP1jM/PkKZ0/A6lgaoCjKBIfT7Hd6hJ1VH4d7RQ4neR6P/iNry3Ho3OheYD6c11hyxl
 x81w==
X-Gm-Message-State: APjAAAVOEnfENJ9fjwb4j3GBqsj9+FkLmzOuQxuRVKSSF/CcEOBdTUIA
 WsvrLTvXizAenI0DDpvRegc0dIXfDb0=
X-Google-Smtp-Source: APXvYqya5iuaAVBG4/Y8pQZn1MIUN7WvXIgg0l+2jYiXmlKsCr0QTO5WDuvg20W4/5j4LhfZ8LqGEQ==
X-Received: by 2002:a17:906:720e:: with SMTP id
 m14mr43943502ejk.84.1559860092786; 
 Thu, 06 Jun 2019 15:28:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.11
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:12 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/10] drm/vkms: No need for ->pages_lock in crc work anymore
Date: Fri,  7 Jun 2019 00:27:51 +0200
Message-Id: <20190606222751.32567-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yYxrzPGYeHw5OKnXexCCG8lNOTvG3IHbPNWAvBtpsmI=;
 b=dPNMoNct0kA7A9xkJw+pe9BnOmIKZKimsUUdU+ILk47MVwLz4GSja4AZ2NpOBKi4BE
 g7bW2mZZiQlprq1A13wXN88BIH6eA6Jg2NKEIOJwCIQrWz0kTrla8RcBuv3xAfYo/zIV
 OeTpux51DgfEg/LBhZve+m+ShhzTKA5v2rMTQ=
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
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UncmUgbm93IGd1YXJhbnRlZWQgdG8gbm8gbG9uZ2VyIHJhY2UgYWdhaW5zdCBwcmVwYXJlX2Zi
L2NsZWFudXBfZmIsCndoaWNoIG1lYW5zIHdlIGNhbiBhY2Nlc3MgLT52YWRkciB3aXRob3V0IGhh
dmluZyB0byBob2xkIGEgbG9jay4KCkJlZm9yZSB0aGUgcHJldmlvdXMgcGF0Y2hlcyBpdCB3YXMg
ZmFpcmx5IGVhc3kgdG8gb2JzZXJ2ZSB0aGUgY3Vyc29yCi0+dmFkZHIgYmVpbmcgaW52YWxpZCwg
YnV0IHRoYXQncyBub3cgZ29uZSwgc28gd2UgY2FuIHVwZ3JhZGUgdG8gYQpmdWxsIFdBUk5fT04u
CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Q2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpDYzog
SGFuZWVuIE1vaGFtbWVkIDxoYW1vaGFtbWVkLnNhQGdtYWlsLmNvbT4KQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5j
IHwgMTMgKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTEg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMu
YyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMKaW5kZXggMGQzMWNmYzMyMDQyLi40
YjMxNDZkODMyNjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3JjLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYwpAQCAtOTcsMTYgKzk3LDEwIEBA
IHN0YXRpYyB2b2lkIGNvbXBvc2VfY3Vyc29yKHN0cnVjdCB2a21zX2NyY19kYXRhICpjdXJzb3Jf
Y3JjLAogCWN1cnNvcl9vYmogPSBkcm1fZ2VtX2ZiX2dldF9vYmooJmN1cnNvcl9jcmMtPmZiLCAw
KTsKIAljdXJzb3Jfdmttc19vYmogPSBkcm1fZ2VtX3RvX3ZrbXNfZ2VtKGN1cnNvcl9vYmopOwog
Ci0JbXV0ZXhfbG9jaygmY3Vyc29yX3ZrbXNfb2JqLT5wYWdlc19sb2NrKTsKLQlpZiAoIWN1cnNv
cl92a21zX29iai0+dmFkZHIpIHsKLQkJRFJNX1dBUk4oImN1cnNvciBwbGFuZSB2YWRkciBpcyBO
VUxMIik7Ci0JCWdvdG8gb3V0OwotCX0KKwlpZiAoV0FSTl9PTighY3Vyc29yX3ZrbXNfb2JqLT52
YWRkcikpCisJCXJldHVybjsKIAogCWJsZW5kKHZhZGRyX291dCwgY3Vyc29yX3ZrbXNfb2JqLT52
YWRkciwgcHJpbWFyeV9jcmMsIGN1cnNvcl9jcmMpOwotCi1vdXQ6Ci0JbXV0ZXhfdW5sb2NrKCZj
dXJzb3Jfdmttc19vYmotPnBhZ2VzX2xvY2spOwogfQogCiBzdGF0aWMgdWludDMyX3QgX3ZrbXNf
Z2V0X2NyYyhzdHJ1Y3Qgdmttc19jcmNfZGF0YSAqcHJpbWFyeV9jcmMsCkBAIC0xMjMsMTUgKzEx
NywxMiBAQCBzdGF0aWMgdWludDMyX3QgX3ZrbXNfZ2V0X2NyYyhzdHJ1Y3Qgdmttc19jcmNfZGF0
YSAqcHJpbWFyeV9jcmMsCiAJCXJldHVybiAwOwogCX0KIAotCW11dGV4X2xvY2soJnZrbXNfb2Jq
LT5wYWdlc19sb2NrKTsKIAlpZiAoV0FSTl9PTighdmttc19vYmotPnZhZGRyKSkgewotCQltdXRl
eF91bmxvY2soJnZrbXNfb2JqLT5wYWdlc19sb2NrKTsKIAkJa2ZyZWUodmFkZHJfb3V0KTsKIAkJ
cmV0dXJuIGNyYzsKIAl9CiAKIAltZW1jcHkodmFkZHJfb3V0LCB2a21zX29iai0+dmFkZHIsIHZr
bXNfb2JqLT5nZW0uc2l6ZSk7Ci0JbXV0ZXhfdW5sb2NrKCZ2a21zX29iai0+cGFnZXNfbG9jayk7
CiAKIAlpZiAoY3Vyc29yX2NyYykKIAkJY29tcG9zZV9jdXJzb3IoY3Vyc29yX2NyYywgcHJpbWFy
eV9jcmMsIHZhZGRyX291dCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
