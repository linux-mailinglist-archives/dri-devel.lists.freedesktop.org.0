Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B1B2B9504
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 15:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C1FA6E59F;
	Thu, 19 Nov 2020 14:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381206E55C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:42:11 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b6so6716748wrt.4
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:42:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lUo9ncFU/nKq3MG4mWQrX8BX1Csq/yukMRd1xs72MQA=;
 b=CIIgMEJ/YZCJYqrr/Qtw//Z/EuYS19MxKYSZBAuaNm2O4riC4ia7lWBoP9fdOxE899
 lfrakfIMVKfanEOJTQM/T9AeH3p6C/ndGvDvgquoWvteonENyQO4m2trca3rvVUBYdrV
 pqSf5p+4Iw5KW2ru9wTswKE3C26aax9R920gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lUo9ncFU/nKq3MG4mWQrX8BX1Csq/yukMRd1xs72MQA=;
 b=gdDk6rod62mrLkxmy/+/Cc7TZq2KUtCbnBja0/4OIEwJqjl+AMfFhyqq1STt3/mlkP
 LlIaU5D/S1t5eF5I+7xtfLiVyR0zqd+D1rUQGWJ8d6mqldbNy5ZM7c7cqF1SvjV31ZA6
 7/MgNNDdVSHaJt9OSltJb56mjGtHAKcxJKaLIvSxCQQESUiZrUDEIFuRQa0QHXHfEBI/
 BvF+GVfU4PlSmWWc8ksVHKfZbwORJpuEvUuGA+5KpVfx+XsFfBWOn0c+tFg2CjdIc/KM
 ZVKI3hORTcylmfIOqqZypaE3+xSz1tf56VzIejQRQ6BibrEfua/PK0a1aA3an7Pj5cor
 dM8g==
X-Gm-Message-State: AOAM5315gcLkhUkmU/+bUDEJjDRTB3+0yq9dtvaSgGygivj8w0HXQpgM
 d/ac+jkEQoaK7SfPat1HqK+LStBl0vNNhw==
X-Google-Smtp-Source: ABdhPJwk5Y7yKnIhKFhsy0JLp99xQ3IuhlAonQX0yhhkN3nOXvFaqvGXi/lZAmUY0jINVS3Y2iOPTg==
X-Received: by 2002:adf:f7c7:: with SMTP id a7mr11488760wrq.347.1605796929676; 
 Thu, 19 Nov 2020 06:42:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x63sm51292wmb.48.2020.11.19.06.42.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 06:42:08 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 12/17] /dev/mem: Only set filp->f_mapping
Date: Thu, 19 Nov 2020 15:41:41 +0100
Message-Id: <20201119144146.1045202-13-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Kees Cook <keescook@chromium.org>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-mm@kvack.org, =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hlbiB3ZSBjYXJlIGFib3V0IHBhZ2VjYWNoZSBtYWludGVuYW5jZSwgd2UgbmVlZCB0byBtYWtl
IHN1cmUgdGhhdApib3RoIGZfbWFwcGluZyBhbmQgaV9tYXBwaW5nIHBvaW50IGF0IHRoZSByaWdo
dCBtYXBwaW5nLgoKQnV0IGZvciBpb21lbSBtYXBwaW5ncyB3ZSBvbmx5IGNhcmUgYWJvdXQgdGhl
IHZpcnR1YWwvcHRlIHNpZGUgb2YKdGhpbmdzLCBzbyBmX21hcHBpbmcgaXMgZW5vdWdoLiBBbHNv
IHNldHRpbmcgaW5vZGUtPmlfbWFwcGluZyB3YXMKY29uZnVzaW5nIG1lIGFzIGEgZHJpdmVyIG1h
aW50YWluZXIsIHNpbmNlIGluIGUuZy4gZHJpdmVycy9ncHUgd2UKZG9uJ3QgZG8gdGhhdC4gUGVy
IERhbiB0aGlzIHNlZW1zIHRvIGJlIGNvcHlwYXN0YSBmcm9tIHBsYWNlcyB3aGljaCBkbwpjYXJl
IGFib3V0IHBhZ2VjYWNoZSBjb25zaXN0ZW5jeSwgYnV0IG5vdCBuZWVkZWQuIEhlbmNlIHJlbW92
ZSBpdCBmb3IKc2xpZ2h0bHkgbGVzcyBjb25mdXNpb24uCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdn
QHppZXBlLmNhPgpDYzogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+CkNjOiBEYW4g
V2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KQ2M6IEFuZHJldyBNb3J0b24gPGFr
cG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRp
YS5jb20+CkNjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6IEphbiBL
YXJhIDxqYWNrQHN1c2UuY3o+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVs
LmNvbT4KQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnCkNjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKQ2M6IGxp
bnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwpSZXZpZXdlZC1ieTogRGFuIFdpbGxpYW1zIDxkYW4u
ai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQogZHJpdmVycy9jaGFyL21lbS5jIHwgMSAtCiAxIGZpbGUg
Y2hhbmdlZCwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2hhci9tZW0uYyBi
L2RyaXZlcnMvY2hhci9tZW0uYwppbmRleCA5NGMyYjU1NmNmOTcuLjdkY2Y5ZTRlYTc5ZCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9jaGFyL21lbS5jCisrKyBiL2RyaXZlcnMvY2hhci9tZW0uYwpAQCAt
ODkxLDcgKzg5MSw2IEBAIHN0YXRpYyBpbnQgb3Blbl9wb3J0KHN0cnVjdCBpbm9kZSAqaW5vZGUs
IHN0cnVjdCBmaWxlICpmaWxwKQogCSAqIHJldm9jYXRpb25zIHdoZW4gZHJpdmVycyB3YW50IHRv
IHRha2Ugb3ZlciBhIC9kZXYvbWVtIG1hcHBlZAogCSAqIHJhbmdlLgogCSAqLwotCWlub2RlLT5p
X21hcHBpbmcgPSBkZXZtZW1faW5vZGUtPmlfbWFwcGluZzsKIAlmaWxwLT5mX21hcHBpbmcgPSBp
bm9kZS0+aV9tYXBwaW5nOwogCiAJcmV0dXJuIDA7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
