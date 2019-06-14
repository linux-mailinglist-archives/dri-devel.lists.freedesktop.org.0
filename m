Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4102246A21
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C578938F;
	Fri, 14 Jun 2019 20:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657108935A
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so5286475edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ozuYLkzuE5EKiRdXRtonyVrqpSQymWsQ+YHRXJTwCgs=;
 b=nUdNCsow1tp/jNHoALDsYwSOZknERmwSKEIzupG0ofsAuFOFm789eyURejXLZH0KH3
 51DVmsuJ34PP9rgz8jZKkbBhJjbYgkclr3n//OQa2ttkaOLYIt7iI4R7ZbeIi+UXz9Xa
 rveMPyO3D3+7EFJpkPeICGkaJz7VfaQxTmOMesLAon6970hIeQoFLJCdhj9BC7D4qOVr
 M1jBd5XXRMyXJIeM140U/UDOrX02jFNum4vDh4RABqV6JdIbrQNgwuNvyf84+SQrc6B/
 DOiz7REEtInqzKlu5T8S+dIE73nhN8LD0w0Zf0iIrhgrmRYRAZB7gke8C66KjeuqLKBK
 9Eiw==
X-Gm-Message-State: APjAAAWEpaftRL0UFy+yomcT2jsf9nW5/sWdMRsqAXR4GAj10nH8elT6
 no+kSPb8PXsRxCt+D8pHFogfLc8sUVQ=
X-Google-Smtp-Source: APXvYqxmo68l9VKjRmngxSrKRMzF9noCB0RAXjDyt/6YJA3Pw4xvMLAa618hUD4JDSKybWUZoFjsCw==
X-Received: by 2002:a17:906:bb11:: with SMTP id
 jz17mr15709119ejb.185.1560544590304; 
 Fri, 14 Jun 2019 13:36:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.29
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:29 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/59] drm/omapdrm: drop fb_debug_enter/leave
Date: Fri, 14 Jun 2019 22:35:24 +0200
Message-Id: <20190614203615.12639-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ozuYLkzuE5EKiRdXRtonyVrqpSQymWsQ+YHRXJTwCgs=;
 b=dlEupAw2H2UeKPz87OmFUI9OX5pfxKv+9CxXEZ0H764h+0dwq/RRP4E1dSxIaGiyTX
 Rl8DiP0ig24M/9fSJoSFelZyoCtIujHG6qbmHeExrleSBnOng7C6Y/BoE6a376ueGtgU
 pQiEdJtMvZcUlwPggQ1u+8mJXaAmF1/ER3C2g=
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBhIG5vLW9wIG9uIGF0b21pYyBkcml2ZXJzIGJlY2F1c2Ugd2l0aCBhdG9taWMgaXQn
cyBzaW1wbHkgdG9vCmNvbXBsaWNhdGVkIHRvIGdldCBhbGwgdGhlIGxvY2tpbmcgYW5kIHdvcmtl
cnMgYW5kIG5vbmJsb2NraW5nCnN5bmNocm9uaXphdGlvbiBjb3JyZWN0LCBmcm9tIGVzc2VudGlh
bGx5IGFuIE5NSSBjb250ZXh0LiBXZWxsLCB0b28KY29tcGxpY2F0ZWQgPSBpbXBvc3NpYmxlLiBB
bHNvLCBvbWFwZHJtIG5ldmVyIGltcGxlbWVudGVkIHRoZQptb2RlX3NldF9iYXNlX2F0b21pYyBo
b29rLCBzbyBJIGtpbmRhIHdvbmRlciB3aHkgdGhpcyB3YXMgZXZlciBhZGRlZC4KCkRyb3AgdGhl
IGhvb2tzLgoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+CkNjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29t
YXBfZmJkZXYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYwppbmRleCA1
MGFhYmQ4NTRmNGQuLjBkYWQ0MmU4MTliYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9mYmRldi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJk
ZXYuYwpAQCAtODcsOCArODcsNiBAQCBzdGF0aWMgc3RydWN0IGZiX29wcyBvbWFwX2ZiX29wcyA9
IHsKIAkuZmJfc2V0Y21hcAk9IGRybV9mYl9oZWxwZXJfc2V0Y21hcCwKIAkuZmJfYmxhbmsJPSBk
cm1fZmJfaGVscGVyX2JsYW5rLAogCS5mYl9wYW5fZGlzcGxheSA9IG9tYXBfZmJkZXZfcGFuX2Rp
c3BsYXksCi0JLmZiX2RlYnVnX2VudGVyID0gZHJtX2ZiX2hlbHBlcl9kZWJ1Z19lbnRlciwKLQku
ZmJfZGVidWdfbGVhdmUgPSBkcm1fZmJfaGVscGVyX2RlYnVnX2xlYXZlLAogCS5mYl9pb2N0bAk9
IGRybV9mYl9oZWxwZXJfaW9jdGwsCiAKIAkuZmJfcmVhZCA9IGRybV9mYl9oZWxwZXJfc3lzX3Jl
YWQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
