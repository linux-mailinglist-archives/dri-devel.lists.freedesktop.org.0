Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5698BFD8AC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:21:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6281B6E1E0;
	Fri, 15 Nov 2019 09:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFB26E1C4
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:21:29 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l7so10140232wrp.6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7+oPDeQqF7gn0t6Wu9eF8AtGPXsaZV+oIAe4ESZB4+I=;
 b=XbynQ57FmDu0PxrMb8rpRSE6mFYicg+WesUfcVaoS66FT2sgVb1HqL+TmMCYtMNbTw
 RW0YhbgcrSMHd4DSD+miqcXP9c7ESFsUjabqDQddAxuGQfxQozirszQMqQ7BCqhpIMkO
 dRHrkmg20kfAdvSeOeACnp+kkUSsw9Rh7vCu538hjCExLf94cn8dNyxw+0GXyE856MJ4
 M0OqbSUusry+38RkEEPGWc6diCiQ08WfXU1VkW69lkThPuTQp70+A87fv2uaRgE1YF7P
 DYLtCsQowLadTWA/ybWpK0mgiFETBUoaxBmF+noVIPpKuvkb34YzybTzDqpoqY9GzWYJ
 pnOg==
X-Gm-Message-State: APjAAAXM4ZDXGgyjPbdpQ5cxRBByZJxemHL5eAl5LtDw+L+PwsY3n8Ab
 KaP94/zkRu6TJSZX38c9J6tFfNM5EDA=
X-Google-Smtp-Source: APXvYqy4xQOZIjeRbauUeqQKIO8M/6NlQDaBlz50R0hcYWTelYUpaPnZumvxvO0yNNTq4Y5vMVVoRw==
X-Received: by 2002:a5d:4986:: with SMTP id r6mr13987202wrq.307.1573809687576; 
 Fri, 15 Nov 2019 01:21:27 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/8] drm/fb: More paranoia in addfb checks
Date: Fri, 15 Nov 2019 10:21:13 +0100
Message-Id: <20191115092120.4445-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7+oPDeQqF7gn0t6Wu9eF8AtGPXsaZV+oIAe4ESZB4+I=;
 b=D1nMy3OrU401MPI+aJZ+9RnFH1JLI19Pbqk42mTKBhcMlgKtLA87cGuH13UiQs3a+y
 cYVXByY15jz0APl458Cwg/vaesaf/W1SQQjRskOuxfz62Ng47WsHp1egIzSHBPFJgXDH
 dyFiokb2LcYIVOHet1ybxdy9ztV5RfTRvP73w=
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

LSBPdXIgbGltaXQgaXMgdWludDMyX3QsIG1ha2UgdGhhdCBleHBsaWNpdC4KCi0gVW50YW5nbGUg
dGhlIG9uZSBvdmVyZmxvdyBjaGVjaywgSSB0aGluayAoYnV0IG5vdCBzdXJlKSB0aGF0IHdpdGgK
ICBhbGwgdGhyZWUgdG9nZXRoZXIgeW91IGNvdWxkIG92ZXJmbG93IHRoZSB1aW50NjRfdCBhbmQg
aXQnZCBsb29rCiAgY29vbCBhZ2Fpbi4gSGVuY2UgdHdvIHN0ZXBzLiBBbHNvIGdvIHdpdGggdGhl
IG1vcmUgY29tbW9uIChhbmQgaW1vCiAgc2FmZXIgYXBwcm9hY2gpIG9mIHJlZHVjaW5nIHRoZSBy
YW5nZSB3ZSBhY2NlcHQsIGluc3RlYWQgb2YgdHJ5aW5nCiAgdG8gY29tcHV0ZSB0aGUgb3ZlcmZs
b3cgaW4gaGlnaCBlbm91Z2ggcHJlY2lzaW9uLgoKLSBUaGUgYWJvdmUgd291bGQgYmxvdyB1cCBp
ZiB3ZSBnZXQgYSAwIHBpdGNoZXMsIHNvIGNoZWNrIGZvciB0aGF0CiAgdG9vLCBidXQgb25seSBp
ZiBibG9ja19zaXplIGlzIGEgdGhpbmcuCgpDYzogUGVra2EgUGFhbGFuZW4gPHBla2thLnBhYWxh
bmVuQGNvbGxhYm9yYS5jby51az4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVs
LnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9mcmFtZWJ1ZmZlci5j
IHwgMTcgKysrKysrKysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVi
dWZmZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYwppbmRleCA1NzU2NDMx
OGNlZWEuLjMxNDFjNmVkNmRkMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mcmFt
ZWJ1ZmZlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZnJhbWVidWZmZXIuYwpAQCAtMjE0
LDE1ICsyMTQsMjAgQEAgc3RhdGljIGludCBmcmFtZWJ1ZmZlcl9jaGVjayhzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LAogCQkJcmV0dXJuIC1FSU5WQUw7CiAJCX0KIAotCQlpZiAobWluX3BpdGNoID4g
VUlOVF9NQVgpCisJCWlmIChtaW5fcGl0Y2ggPiBVOF9NQVgpCiAJCQlyZXR1cm4gLUVSQU5HRTsK
IAotCQlpZiAoKHVpbnQ2NF90KSBoZWlnaHQgKiByLT5waXRjaGVzW2ldICsgci0+b2Zmc2V0c1tp
XSA+IFVJTlRfTUFYKQotCQkJcmV0dXJuIC1FUkFOR0U7CisJCWlmIChibG9ja19zaXplKSB7CisJ
CQlpZiAoci0+cGl0Y2hlc1tpXSA8IG1pbl9waXRjaCkgeworCQkJCURSTV9ERUJVR19LTVMoImJh
ZCBwaXRjaCAldSBmb3IgcGxhbmUgJWRcbiIsIHItPnBpdGNoZXNbaV0sIGkpOworCQkJCXJldHVy
biAtRUlOVkFMOworCQkJfQogCi0JCWlmIChibG9ja19zaXplICYmIHItPnBpdGNoZXNbaV0gPCBt
aW5fcGl0Y2gpIHsKLQkJCURSTV9ERUJVR19LTVMoImJhZCBwaXRjaCAldSBmb3IgcGxhbmUgJWRc
biIsIHItPnBpdGNoZXNbaV0sIGkpOwotCQkJcmV0dXJuIC1FSU5WQUw7CisJCQlpZiAoaGVpZ2h0
ID4gVThfTUFYIC8gci0+cGl0Y2hlc1tpXSkKKwkJCQlyZXR1cm4gLUVSQU5HRTsKKworCQkJaWYg
KHItPm9mZnNldHNbaV0gPiBVOF9NQVggLyByLT5waXRjaGVzW2ldIC0gaGVpZ2h0KQorCQkJCXJl
dHVybiAtRVJBTkdFOwogCQl9CiAKIAkJaWYgKHItPm1vZGlmaWVyW2ldICYmICEoci0+ZmxhZ3Mg
JiBEUk1fTU9ERV9GQl9NT0RJRklFUlMpKSB7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
