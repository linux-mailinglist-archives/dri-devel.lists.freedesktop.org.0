Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A4AFB57D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951DB6EDAB;
	Wed, 13 Nov 2019 16:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01DF86EDA8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:44:59 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-qPvccgKhM5GNOyN8sym_Jg-1; Wed, 13 Nov 2019 11:44:55 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EA4E802CFD;
 Wed, 13 Nov 2019 16:44:54 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D58410592A6;
 Wed, 13 Nov 2019 16:44:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 10/13] drm/modes: parse_cmdline: Remove some unnecessary
 code (v2)
Date: Wed, 13 Nov 2019 17:44:31 +0100
Message-Id: <20191113164434.254159-10-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: qPvccgKhM5GNOyN8sym_Jg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Vm57+sECj2/AEhIyUy04jlL++g9O0HevfGA/At2Z6s=;
 b=FzrBXzKR5KPlltQE1ESMp2kPoriZxJl0bxOz4iLvS2jQPat8SyXKopobJzF2IpkJOUtWNA
 KXyLpPZCIt03RyYz/6vd5GWlVYtO6uRnDeKwXtnDa4WE7gaZ0dTM81fn4sWmICqHQ2F0/5
 r/zjVbrzAvaqV2PIhzaez1MB2WTKQEE=
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
YXRpb24gb2YgdGhlIG1vZGUgc3RydWN0CiBpbnRvIGEgc2VwYXJhdGUgcGF0Y2gKClNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jIHwgNSAtLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jCmluZGV4IDExOWZlZDdhYjgxNS4uYmViNzY0ZWZlNmIzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jCkBAIC0xNzQ3LDExICsxNzQ3LDYgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9j
b21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAogCW1v
ZGUtPnBhbmVsX29yaWVudGF0aW9uID0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9X
TjsKIAotI2lmZGVmIENPTkZJR19GQgotCWlmICghbW9kZV9vcHRpb24pCi0JCW1vZGVfb3B0aW9u
ID0gZmJfbW9kZV9vcHRpb247Ci0jZW5kaWYKLQogCWlmICghbW9kZV9vcHRpb24pIHsKIAkJbW9k
ZS0+c3BlY2lmaWVkID0gZmFsc2U7CiAJCXJldHVybiBmYWxzZTsKLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
