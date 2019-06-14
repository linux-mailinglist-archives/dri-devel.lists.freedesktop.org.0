Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71410469F8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA40892EA;
	Fri, 14 Jun 2019 20:36:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F28AF892EA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id p15so5222605eds.8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NCigECl+eLv0j+gr5RVk62juHsPhtgdWifjAskWwSiY=;
 b=NWvFMyQmDWTjM5IBvOmLzIAVqOoXPzYCz8ujlFjsXUu3QJPXFoJSES5QcdZXmaoEls
 HDBNlPptRKSBbkEE5S7lzKNJoDUJUbGhEbyuqC8JL9xZT8AkdOMn1QqZT+CdMVvkP6GX
 cj8dUZj3wM/vb6A5CI0xex8FJKawsdxMdOJzxvcuCwGBmxXdiB5YQymqkgfxgoVY+olu
 D61uVUd31TRvG+zVTTx7N79LQZsoOjxdxm6rfUqbBTCVSEboGBJVju3MqCBH9o9nWJlz
 RWfYHKtb6spb2FRcl+V6EJzFWXWlEIzbKBt2EaB0UmNcWIhlDX0svDLwe1MEEea/CwWO
 LLHA==
X-Gm-Message-State: APjAAAVDldDeS1++lmw2HoEVgOO/nEoiytFlLRSdyopE6CRFPoA0MSUG
 y+I/BvXYVZMI/1Sqy02zdwudCoLtf9s=
X-Google-Smtp-Source: APXvYqxT3nBqL8oJ4M0ZY8FyqH+UmBFUSiZZ8sZRMVzCh3pErU/LZ7pZK42HigoG9iw2kI9F8i1Q8A==
X-Received: by 2002:a17:906:31c8:: with SMTP id
 f8mr78452703ejf.131.1560544582301; 
 Fri, 14 Jun 2019 13:36:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:21 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 01/59] drm/todo: Improve drm_gem_object funcs todo
Date: Fri, 14 Jun 2019 22:35:17 +0200
Message-Id: <20190614203615.12639-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NCigECl+eLv0j+gr5RVk62juHsPhtgdWifjAskWwSiY=;
 b=UR9o2pSzx9iUjZe80Z77JCadYkzDYmrMZbuBz7lJgZlxYKy8JQGWIR2lMSirJqZr3w
 8k87vuljQsCaTvV4XgWG5yBbYhodZZD+KTchDT6j6rHpT+8vPUYpJX5FO9m9pzBgHpcQ
 cviy2No2WNl8wo+uzr+YTJRmnbOORuvPM6KIw=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UncmUga2luZGEgZ29pbmcgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4gU3BvdHRlZCB3aGlsZSB0
eXBpbmcgYmV0dGVyCmdlbS9wcmltZSBkb2NzLgoKQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpDYzogR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJlZGhhdC5jb20+CkNj
OiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgpDYzogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZ3B1L3RvZG8ucnN0IHwgNCArKysrCiAx
IGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdAppbmRleCBiNGE3NmMy
NzAzZTUuLjIzNTgzZjBlMzc1NSAxMDA2NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5y
c3QKKysrIGIvRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QKQEAgLTIyOCw2ICsyMjgsMTAgQEAg
c3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzCiBHRU0gb2JqZWN0cyBjYW4gbm93IGhhdmUgYSBm
dW5jdGlvbiB0YWJsZSBpbnN0ZWFkIG9mIGhhdmluZyB0aGUgY2FsbGJhY2tzIG9uIHRoZQogRFJN
IGRyaXZlciBzdHJ1Y3QuIFRoaXMgaXMgbm93IHRoZSBwcmVmZXJyZWQgd2F5IGFuZCBkcml2ZXJz
IGNhbiBiZSBtb3ZlZCBvdmVyLgogCitVbmZvcnR1bmF0ZWx5IHNvbWUgb2YgdGhlIHJlY2VudGx5
IGFkZGVkIEdFTSBoZWxwZXJzIGFyZSBnb2luZyBpbiB0aGUgd3JvbmcKK2RpcmVjdGlvbiBieSBh
ZGRpbmcgT1BTIG1hY3JvcyB0aGF0IHVzZSB0aGUgb2xkLCBkZXByZWNhdGVkIGhvb2tzLiBTZWUK
K0RSTV9HRU1fQ01BX1ZNQVBfRFJJVkVSX09QUywgRFJNX0dFTV9TSE1FTV9EUklWRVJfT1BTLCBh
bmQgRFJNX0dFTV9WUkFNX0RSSVZFUl9QUklNRS4KKwogVXNlIERSTV9NT0RFU0VUX0xPQ0tfQUxM
XyogaGVscGVycyBpbnN0ZWFkIG9mIGJvaWxlcnBsYXRlCiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
