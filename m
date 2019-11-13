Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3E3FB57B
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:45:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4A96EDA4;
	Wed, 13 Nov 2019 16:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A20606EDA0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:44:52 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-YK43LfvxOY6jysmw9TNrdQ-1; Wed, 13 Nov 2019 11:44:48 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E497150F8FB;
 Wed, 13 Nov 2019 16:44:47 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6E6C310E1B43;
 Wed, 13 Nov 2019 16:44:45 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 06/13] drm/modes: parse_cmdline: Add freestanding argument
 to drm_mode_parse_cmdline_options()
Date: Wed, 13 Nov 2019 17:44:27 +0100
Message-Id: <20191113164434.254159-6-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: YK43LfvxOY6jysmw9TNrdQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gkete7xleyWcfMubL/8yDFgWI/v5yVImb0IFqeSLBDM=;
 b=gbOTbADFOryAAJ1Pf1oX/nk6gC3D7u0W8xUrOuEbQs+DtiNg1Sz3FDvHNnqknyZ7+LWJJO
 ijdKud5Fic4GKZ3CuROY/GjY9p/QPaOY9jcsG4x6ss3f2Xbu9FRKFSpq1UqQQHG52ggqUR
 mrWrc6UPy/qwMsIqrSq1GIhL4yFtdBk=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgZnJlZXN0YW5kaW5nIGZ1bmN0aW9uIGFyZ3VtZW50IHRvIGRybV9tb2RlX3BhcnNlX2Nt
ZGxpbmVfb3B0aW9ucygpCnNpbWlsYXIgdG8gaG93IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfZXh0
cmEoKSBhbHJlYWR5IGhhcyB0aGlzLgoKVGhpcyBpcyBhIHByZXBhcmF0aW9uIHBhdGNoIGZvciBh
bGxvd2luZyBwYXJzaW5nIG9mIHN0YW5kLWFsb25lIG9wdGlvbnMKd2l0aG91dCBhIG1vZGUgYmVm
b3JlIHRoZW0sIGUuZy46IHZpZGVvPUhETUktMTptYXJnaW5fcmlnaHQ9MTQsLi4uCgpBY2tlZC1i
eTogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBIYW5z
IGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYyB8IDUgKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKaW5kZXggMjVlOGVkZjRjZmI4Li44MGNiMjQ3YzgzYzcgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKQEAgLTE1OTIsNiArMTU5Miw3IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGlu
ZV9pbnQoY29uc3QgY2hhciAqZGVsaW0sIHVuc2lnbmVkIGludCAqaW50X3JldCkKIH0KIAogc3Rh
dGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMoY29uc3QgY2hhciAqc3RyLAor
CQkJCQkgIGJvb2wgZnJlZXN0YW5kaW5nLAogCQkJCQkgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsCiAJCQkJCSAgc3RydWN0IGRybV9jbWRsaW5lX21vZGUgKm1vZGUpCiB7
CkBAIC0xNjYzLDYgKzE2NjQsOSBAQCBzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVf
b3B0aW9ucyhjb25zdCBjaGFyICpzdHIsCiAJCW9wdGlvbiA9IHNlcCArIDE7CiAJfSB3aGlsZSAo
c2VwKTsKIAorCWlmIChyb3RhdGlvbiAmJiBmcmVlc3RhbmRpbmcpCisJCXJldHVybiAtRUlOVkFM
OworCiAJbW9kZS0+cm90YXRpb25fcmVmbGVjdGlvbiA9IHJvdGF0aW9uOwogCiAJcmV0dXJuIDA7
CkBAIC0xODU1LDYgKzE4NTksNyBAQCBib29sIGRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9m
b3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0aW9uLAogCiAJaWYgKG9wdGlvbnNfcHRy
KSB7CiAJCXJldCA9IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhvcHRpb25zX3B0ciAr
IDEsCisJCQkJCQkgICAgIGZhbHNlLAogCQkJCQkJICAgICBjb25uZWN0b3IsIG1vZGUpOwogCQlp
ZiAocmV0KQogCQkJcmV0dXJuIGZhbHNlOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
