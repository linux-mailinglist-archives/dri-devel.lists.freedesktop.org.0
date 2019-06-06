Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D222380A3
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 00:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE79A89A35;
	Thu,  6 Jun 2019 22:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D20589A08
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 22:28:12 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so5559843eds.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 15:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeDSyVtOXRXEHiR2W7B4DH9ZPXBdnhHGqP4dgrobpmo=;
 b=HJLVuHVakPg/kSNmhbHhTUndTrelbfEGZeFI3UxbialwyibasbzEHto9sP3w3DZ4ZV
 g/kOZn4bP6IUdaMx4yDj9pkTRk2Ra6K37Wh3AtoIGMNY/LoTHDVgtw7k8mlrMdYy/Nvq
 aka84h37n/qAX+aXNH384XYgmRjRjKSLQ8A33NcfeV8RLrWgcHUot4pzdiqu5Zhk4p+q
 8TxWKCd+hMu+mkDROXSSOUt1oSzoLipMeMN4XMSL2V1nOnzF853UZxLZaFfLZkC5s6GY
 7rfJJhMmn9mWxeFhLIlRlMuioXrGz1Fav8kDdhzwjLaD4p53Xxzf8izU2Bl1Upteq0B2
 u57A==
X-Gm-Message-State: APjAAAU7TK2UYN40aJqaoBm07LQRRW+CBVPKi7wn8fITiJkaRI9YIGlT
 +9h5b8Uj31vCgu2701pbiQtEFPMgGIA=
X-Google-Smtp-Source: APXvYqzS2BVvGqtu3HGJ7jajln37Vr8QcwtLx1hDJn1g7LCVNa2z8TlQpJGaHavsPlgfCI/Fs5/W3Q==
X-Received: by 2002:aa7:c402:: with SMTP id j2mr46664467edq.165.1559860089984; 
 Thu, 06 Jun 2019 15:28:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z10sm54228edl.35.2019.06.06.15.28.08
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 15:28:09 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/10] drm/vkms: No _irqsave within spin_lock_irq needed
Date: Fri,  7 Jun 2019 00:27:49 +0200
Message-Id: <20190606222751.32567-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
References: <20190606222751.32567-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeDSyVtOXRXEHiR2W7B4DH9ZPXBdnhHGqP4dgrobpmo=;
 b=ceVHHuMhW3DSI1EL8qvoGn9laYfMHLlDtOzETk1/ebRTLtZWDcp68irwiKTPDYAwfO
 /wJp3x9zqvn2DcuatT9Gw38TFkpjEsFlSXbjRDB50w3vw3lca0mqpfsRb+M4CsFChFFb
 liFteu6lberZVyqDAVmLW5Ej+5qVK55qkeg6Y=
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aXJxcyBhcmUgYWxyZWFkeSBvZmYuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMu
YyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2NydGMuYwppbmRleCBiNjk4N2Q5MDgwNWYuLjQ4YTc5M2Jh
NDAzMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKQEAgLTE4MywxNyArMTgzLDE2IEBAIHN0
YXRpYyB2b2lkIHZrbXNfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRjICpjcnRjLAog
CQkJCSAgIHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqb2xkX2NydGNfc3RhdGUpCiB7CiAJc3RydWN0
IHZrbXNfb3V0cHV0ICp2a21zX291dHB1dCA9IGRybV9jcnRjX3RvX3ZrbXNfb3V0cHV0KGNydGMp
OwotCXVuc2lnbmVkIGxvbmcgZmxhZ3M7CiAKIAlpZiAoY3J0Yy0+c3RhdGUtPmV2ZW50KSB7Ci0J
CXNwaW5fbG9ja19pcnFzYXZlKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2ssIGZsYWdzKTsKKwkJc3Bp
bl9sb2NrKCZjcnRjLT5kZXYtPmV2ZW50X2xvY2spOwogCiAJCWlmIChkcm1fY3J0Y192Ymxhbmtf
Z2V0KGNydGMpICE9IDApCiAJCQlkcm1fY3J0Y19zZW5kX3ZibGFua19ldmVudChjcnRjLCBjcnRj
LT5zdGF0ZS0+ZXZlbnQpOwogCQllbHNlCiAJCQlkcm1fY3J0Y19hcm1fdmJsYW5rX2V2ZW50KGNy
dGMsIGNydGMtPnN0YXRlLT5ldmVudCk7CiAKLQkJc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmY3J0
Yy0+ZGV2LT5ldmVudF9sb2NrLCBmbGFncyk7CisJCXNwaW5fdW5sb2NrKCZjcnRjLT5kZXYtPmV2
ZW50X2xvY2spOwogCiAJCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7CiAJfQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
