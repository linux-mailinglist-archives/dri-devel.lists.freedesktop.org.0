Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCCABB43
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 16:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A319F6E2CF;
	Fri,  6 Sep 2019 14:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F426E2CF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 14:45:06 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id f2so176251edw.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 07:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JbNFSk0vk9u1tIFchjBlxL+hSi7HGEZcj3DKKbCr2uw=;
 b=aYLypePN63EONGfp/ZdLv28GELEzffxG/q+YUavK1fyKyyBLh9P+nZlAyQyg5A/4Fa
 PW++bTm6NGrXsLTDIq+U82QSTAjazsA+IQywjb8qLketEDxdMZi4Y/oNTa8pVKaTFNcR
 ww4aAdSpeevDuBEWMY9/QpYhMLoJL3Hb0bUos1EG0nFw/lzV7GWTsBhNni/f/Hh0QrJT
 6rc/qdJ/deSt5IAnDGZXvDnXq0Bg4JJzYOIFBbLgbh5qfPvhC8H1jYtVNy8hyaCNrBIR
 zjhYNS2/ZlCW1in4UiCbKIcAsTJtuHQHmVZECex6bEebXoFvXX0wVMR86BLiuk7QanuY
 OxPQ==
X-Gm-Message-State: APjAAAWnFvkz5h4LQod9r8PjVdfUttg5g7O3i8pxeI777251yQ+mngQz
 AB5C3voDMtwFzjyho2iLXqU5jb6UPNo=
X-Google-Smtp-Source: APXvYqxd0EnLcAauc93HJ6BoW6nRlwDyLYLxObLsX238cYaJJUzNWf+T2N8fNnH8K94KEwKcKJ4MEw==
X-Received: by 2002:a17:906:3746:: with SMTP id
 e6mr7966489ejc.35.1567781104642; 
 Fri, 06 Sep 2019 07:45:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b36sm976439edc.53.2019.09.06.07.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 07:45:03 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/blend: Define the direction of Z position values
Date: Fri,  6 Sep 2019 16:44:59 +0200
Message-Id: <20190906144459.16025-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JbNFSk0vk9u1tIFchjBlxL+hSi7HGEZcj3DKKbCr2uw=;
 b=ihuAgesXG42VYDotu20BsqcHVfC+VuQRQ8sG+2ToXtYLevFHU8bTvzoOEKEwdkX/o+
 Gu7mHCVRO/1XhxYOx4fCU+MLWOps8MTZtfRy+sJoW+hJI3E6D3k+datWoRe9bsEMBacS
 AZ1DADXAbNbRhgDqmkpRDlNXOyHAXkGGGgODc=
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
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgZm9yZ290IHRoYXQuCgpQcm9vZiBpcyB0aGUgb25lIGlndCB0ZXN0Y2FzZSB3ZSBoYXZlOgoK
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xzL2Jsb2IvbWFz
dGVyL3Rlc3RzL2ttc19hdG9taWMuYyNMMjgwCgpXaGlsZSBhdCBpdCBhbHNvIGRvY3VtZW50IHRo
YXQgd2UgaGF2ZSBpbW11dGFibGUgenBvcyBwcm9wZXJ0aWVzIGluCnNvbWUgY2FzZXMuCgpSZXBv
cnRlZC1ieTogUGVra2EgUGFhbGFuZW4gPHBla2thLnBhYWxhbmVuQGNvbGxhYm9yYS5jb20+CkNj
OiBQZWtrYSBQYWFsYW5lbiA8cGVra2EucGFhbGFuZW5AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQt
Ynk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29tPgpDYzogSWxp
YSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1PgpBY2tlZC1ieTogSWxpYSBNaXJraW4gPGlt
aXJraW5AYWx1bS5taXQuZWR1PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMgfCA3ICsr
KysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JsZW5kLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2JsZW5kLmMKaW5kZXggMzdhYzE2OGZjYjYwLi5kMDI3MDlkZDJkNGEgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fYmxlbmQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Js
ZW5kLmMKQEAgLTEzMCw3ICsxMzAsMTIgQEAKICAqCVogcG9zaXRpb24gaXMgc2V0IHVwIHdpdGgg
ZHJtX3BsYW5lX2NyZWF0ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eSgpIGFuZAogICoJZHJtX3Bs
YW5lX2NyZWF0ZV96cG9zX3Byb3BlcnR5KCkuIEl0IGNvbnRyb2xzIHRoZSB2aXNpYmlsaXR5IG9m
IG92ZXJsYXBwaW5nCiAgKglwbGFuZXMuIFdpdGhvdXQgdGhpcyBwcm9wZXJ0eSB0aGUgcHJpbWFy
eSBwbGFuZSBpcyBhbHdheXMgYmVsb3cgdGhlIGN1cnNvcgotICoJcGxhbmUsIGFuZCBvcmRlcmlu
ZyBiZXR3ZWVuIGFsbCBvdGhlciBwbGFuZXMgaXMgdW5kZWZpbmVkLgorICoJcGxhbmUsIGFuZCBv
cmRlcmluZyBiZXR3ZWVuIGFsbCBvdGhlciBwbGFuZXMgaXMgdW5kZWZpbmVkLiBUaGUgcG9zaXRp
dmUKKyAqCVogYXhpcyBwb2ludHMgdG93YXJkcyB0aGUgdXNlciwgaS5lLiBwbGFuZXMgd2l0aCBs
b3dlciBaIHBvc2l0aW9uIHZhbHVlcworICoJYXJlIHVuZGVybmVhdGggcGxhbmVzIHdpdGggaGln
aGVyIFogcG9zaXRpb24gdmFsdWVzLiBOb3RlIHRoYXQgdGhlIFoKKyAqCXBvc2l0aW9uIHZhbHVl
IGNhbiBhbHNvIGJlIGltbXV0YWJsZSwgdG8gaW5mb3JtIHVzZXJzcGFjZSBhYm91dCB0aGUKKyAq
CWhhcmQtY29kZWQgc3RhY2tpbmcgb2Ygb3ZlcmxheSBwbGFuZXMsIHNlZQorICoJZHJtX3BsYW5l
X2NyZWF0ZV96cG9zX2ltbXV0YWJsZV9wcm9wZXJ0eSgpLgogICoKICAqIHBpeGVsIGJsZW5kIG1v
ZGU6CiAgKglQaXhlbCBibGVuZCBtb2RlIGlzIHNldCB1cCB3aXRoIGRybV9wbGFuZV9jcmVhdGVf
YmxlbmRfbW9kZV9wcm9wZXJ0eSgpLgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
