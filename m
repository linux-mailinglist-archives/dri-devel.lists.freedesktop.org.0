Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD06A1008B0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050E46E5D4;
	Mon, 18 Nov 2019 15:52:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D36E5C3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:52:02 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-yx76oTNjMEqWlSpM9SmQDg-1; Mon, 18 Nov 2019 10:51:57 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 094C718A07C8;
 Mon, 18 Nov 2019 15:51:56 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4F4D7600CD;
 Mon, 18 Nov 2019 15:51:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 10/13] drm/modes: parse_cmdline: Remove some unnecessary
 code (v2)
Date: Mon, 18 Nov 2019 16:51:31 +0100
Message-Id: <20191118155134.30468-10-hdegoede@redhat.com>
In-Reply-To: <20191118155134.30468-1-hdegoede@redhat.com>
References: <20191118155134.30468-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: yx76oTNjMEqWlSpM9SmQDg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574092321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNGLi01dDO6gnSEUyMqoHyAv0u4MnckNGJixuTZ0yH4=;
 b=WgF3cqVld/6Bsaw02D3VdOTy+Sfp3qGRgQcwdUgQDfn2fIP5iScUNOppEWl8W7U5iNH2Uv
 IdpLozOK1MS9pGGjgVGQeDHCJRhhkqdwnFA/SQHKzwITFYmikJ0lN61b5ZHWzpWVQpL6tO
 UnT4BJ5w+VqaMpqbu5lzyVgMo3+BS8A=
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

ZmJfZ2V0X29wdGlvbnMoKSB3aWxsIHJldHVybiBmYl9tb2RlX29wdGlvbiBpZiBubyB2aWRlbz08
Y29ubmVjdG9yLW5hbWU+CmFyZ3VtZW50IGlzIHByZXNlbnQgb24gdGhlIGtlcm5lbCBjb21tYW5k
bGluZSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBhbHNvCmRvIHRoaXMgaW4gZHJtX21vZGVfcGFy
c2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoKSBhcyBvdXIgb25seSBjYWxsZXIKdXNlcyBm
Yl9nZXRfb3B0aW9ucygpIHRvIGdldCB0aGUgbW9kZV9vcHRpb24gYXJndW1lbnQuCgpDaGFuZ2Vz
IGluIHYyOgotU3BsaXQgb3V0IHRoZSBjaGFuZ2VzIGRlYWxpbmcgd2l0aCB0aGUgaW5pdGlhbGl6
YXRpb24gb2YgdGhlIG1vZGUgc3RydWN0CiBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gKCkFja2VkLWJ5
OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEhhbnMg
ZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jCmluZGV4IDExOWZlZDdhYjgxNS4uYmViNzY0ZWZlNmIzIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
CkBAIC0xNzQ3LDExICsxNzQ3LDYgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVf
Zm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAogCW1vZGUtPnBhbmVsX29y
aWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTjsKIAotI2lmZGVm
IENPTkZJR19GQgotCWlmICghbW9kZV9vcHRpb24pCi0JCW1vZGVfb3B0aW9uID0gZmJfbW9kZV9v
cHRpb247Ci0jZW5kaWYKLQogCWlmICghbW9kZV9vcHRpb24pIHsKIAkJbW9kZS0+c3BlY2lmaWVk
ID0gZmFsc2U7CiAJCXJldHVybiBmYWxzZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
