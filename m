Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF466D1C1E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 00:46:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD286E348;
	Wed,  9 Oct 2019 22:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF4B46E348
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 22:46:43 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-KIwLCEdVNJyEmSQ29xHweA-1; Wed, 09 Oct 2019 18:46:40 -0400
Received: by mail-qt1-f199.google.com with SMTP id y10so3746326qti.1
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 15:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=kwhJbGsrDBKARYQsTY//S8acSS4Q7o1J2WuFd2+tiG0=;
 b=icLYefe6dEdB5eWf0a9rx2HwdJ7OVOB39wAjsVnz4JvKj5OCTC3B11vomBBw8dLeTk
 FPfG+qIesrT+/CCB6+BTUb+E7cGKZsTGq5Uqs/w8xp4CkmvCLdPsP6ZfoDuPOYks1TD5
 bw9t37Y/7U745ur6bgJD6hYKtR9E7xiXNA3oOxBxr7ajZca98MxOyZ4/MHKBicAhlYqZ
 JAFQu+/hkOcWQ/KRH5ICaGeLCGmb6CP1jeI0btJRHDqHagxAQFmidlLsDr7t19v73aby
 pWhpk36lmtee8eid7z5Q5LxfWwe8Z+ldQF41tw3NXXMTWR0IEH7lOCkq6IhjpTiKCko1
 /B8A==
X-Gm-Message-State: APjAAAX7GU0vyFR86Dz2E415BtE2HxUYvkqoCw1B9OMhgKZFtEw7M5rz
 I+LjgtL7+tal3y2PTD9iLLG0KRwsDmSC0sjzRYl3vHMFi4sLbM9DwgBrz2ahwomEk2RShUR/ZRa
 l2MiSQcE7h/TULNw94DT+eypoeQbE
X-Received: by 2002:ac8:705c:: with SMTP id y28mr6789842qtm.52.1570661200341; 
 Wed, 09 Oct 2019 15:46:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6lr5ZCjf9+Qo2HJVC9LNKfVUEtmcyteL+7BZ4Ay9LGYdZKzRp32HyzGtFydHz9neZHA39uQ==
X-Received: by 2002:ac8:705c:: with SMTP id y28mr6789823qtm.52.1570661200084; 
 Wed, 09 Oct 2019 15:46:40 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id 199sm1628704qkk.112.2019.10.09.15.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2019 15:46:39 -0700 (PDT)
Message-ID: <f33c9f6f6db1dc08c4bba8c220728d7a4408e1fb.camel@redhat.com>
Subject: Re: [PATCH] drm/dp-mst: Drop connection_mutex check
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 09 Oct 2019 18:46:38 -0400
In-Reply-To: <20191009224113.5432-1-daniel.vetter@ffwll.ch>
References: <20191009224113.5432-1-daniel.vetter@ffwll.ch>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: KIwLCEdVNJyEmSQ29xHweA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1570661202;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q27seZ5YDRNp/W1AOJyC1ndycrmpJWnaIFDQVftGKME=;
 b=gXemUhhNdOdQra0RovU4MM4dwX3Qvt9t4lgAuwkUgnJz6v2aDm1SCbO/FslOZ19z9WhZas
 1jabTfXbTeI5IYNctYOEUF9auOZs9+XEh++eIpbRu/t0LHXawi5XpI0jBOTxJdeghKswbE
 9P5ycQKs/9LODVv5cPJxo1fcoqAJi2o=
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

b2gsIGNvbXBsZXRlbHkgZm9yZ290IGFib3V0IHRoaXMgb25lCgpSZXZpZXdlZC1ieTogTHl1ZGUg
UGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4KCk9uIFRodSwgMjAxOS0xMC0xMCBhdCAwMDo0MSArMDIw
MCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBQcml2YXRlIGF0b21pYyBvYmplY3RzIGhhdmUgZ3Jv
d24gdGhlaXIgb3duIGxvY2tpbmcgd2l0aAo+IAo+IGNvbW1pdCBiOTYyYTEyMDUwYTM4N2U0YmJm
M2E0ODc0NWFmZTFkMjlkMzk2YjBkCj4gQXV0aG9yOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+Cj4gRGF0ZTogICBNb24gT2N0IDIyIDE0OjMxOjIyIDIwMTggKzAyMDAKPiAKPiAgICAg
ZHJtL2F0b21pYzogaW50ZWdyYXRlIG1vZGVzZXQgbG9jayB3aXRoIHByaXZhdGUgb2JqZWN0cwo+
IAo+IHdoaWNoIG1lYW5zIHdlJ3JlIG5vIGxvbmdlciByZWx5aW5nIG9uIGNvbm5lY3Rpb25fbXV0
ZXggZm9yIG1zdCBzdGF0ZQo+IGxvY2tpbmcgbmVlZHMuCj4gCj4gQ2M6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Cj4gQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+IFNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMSAtCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMKPiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9s
b2d5LmMKPiBpbmRleCA2YjE0YjYzYjhkNjIuLjkzNjRlNGY0Mjk3NSAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwo+IEBAIC00MTg2LDcgKzQxODYsNiBAQCBzdHJ1Y3Qg
ZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZQo+ICpkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lf
c3RhdGUoc3RydWN0IGRybV9hCj4gIHsKPiAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBtZ3It
PmRldjsKPiAgCj4gLQlXQVJOX09OKCFkcm1fbW9kZXNldF9pc19sb2NrZWQoJmRldi0+bW9kZV9j
b25maWcuY29ubmVjdGlvbl9tdXRleCkpOwo+ICAJcmV0dXJuCj4gdG9fZHBfbXN0X3RvcG9sb2d5
X3N0YXRlKGRybV9hdG9taWNfZ2V0X3ByaXZhdGVfb2JqX3N0YXRlKHN0YXRlLCAmbWdyLQo+ID5i
YXNlKSk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2dldF9tc3RfdG9wb2xvZ3lf
c3RhdGUpOwotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
