Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486A17C8D1
	for <lists+dri-devel@lfdr.de>; Sat,  7 Mar 2020 00:46:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B256ED9B;
	Fri,  6 Mar 2020 23:46:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47F836ED9A
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 23:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583538392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Po/iBBoWJfPjGLJrHZfnvvlLhPKKA60+1bls5u7diKE=;
 b=TWVCdFygv0ZZQbnUtnOHKU4DodSuQFBJc+NTEnfLQL48Cam4F3sS0ngYhmO5mPQfcdzYXR
 gjwgc+X3atKpn0q97ln2gvRvRJMmSdQF1gWorgSKKhqXupeizgf5ncKfXpRq1kK+Z8yQG9
 bnFPtZK0eQYRYte7PCfFSMHMG1V4W0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-qzJu6ej_P8uoHKNYBQA6nQ-1; Fri, 06 Mar 2020 18:46:31 -0500
X-MC-Unique: qzJu6ej_P8uoHKNYBQA6nQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8AC59800D4E;
 Fri,  6 Mar 2020 23:46:29 +0000 (UTC)
Received: from Ruby.bss.redhat.com (dhcp-10-20-1-196.bss.redhat.com
 [10.20.1.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 851397389A;
 Fri,  6 Mar 2020 23:46:27 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm/dp_mst: Fix bandwidth checking regressions from
 DSC patches
Date: Fri,  6 Mar 2020 18:46:18 -0500
Message-Id: <20200306234623.547525-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QU1EJ3MgcGF0Y2ggc2VyaWVzIGZvciBhZGRpbmcgRFNDIHN1cHBvcnQgdG8gdGhlIE1TVCBoZWxw
ZXJzCnVuZm9ydHVuYXRlbHkgaW50cm9kdWNlZCBhIGZldyByZWdyZXNzaW9ucyBpbnRvIHRoZSBr
ZXJuZWwgdGhhdCBJIGRpZG4ndApnZXQgYXJvdW5kIHRvIGZpeGluZyB1bnRpbCBqdXN0IG5vdy4g
SSB3b3VsZCBoYXZlIHJldmVydGVkIHRoZSBjaGFuZ2VzCmVhcmxpZXIsIGJ1dCBzZWVpbmcgYXMg
dGhhdCB3b3VsZCBoYXZlIHJldmVydGVkIGFsbCBvZiBhbWQncyBEU0Mgc3VwcG9ydAorIGV2ZXJ5
dGhpbmcgdGhhdCB3YXMgZG9uZSBvbiB0b3Agb2YgdGhhdCBJIHJlYWxsbGxsbHkgd2FudGVkIHRv
IGF2b2lkCmRvaW5nIHRoYXQuCgpBbnl3YXksIHRoaXMgc2hvdWxkIGZpeCBldmVyeXRoaW5nIGJh
bmR3aWR0aC1jaGVjayByZWxhdGVkIGFzIGZhciBhcyBJCmNhbiB0ZWxsIChJIGZvdW5kIHNvbWUg
b3RoZXIgcmVncmVzc2lvbnMgdW5yZWxhdGVkIHRvIEFNRCdzIERTQyBwYXRjaGVzCndoaWNoIEkn
bGwgYmUgc2VuZGluZyBvdXQgcGF0Y2hlcyBmb3Igc2hvcnRseSkuIE5vdGUgdGhhdCBJIGRvbid0
IGhhdmUKYW55IERTQyBkaXNwbGF5cyBsb2NhbGx5IHlldCwgc28gaWYgc29tZW9uZSBmcm9tIEFN
RCBjb3VsZCBzYW5pdHkgY2hlY2sKdGhpcyBJIHdvdWxkIGFwcHJlY2lhdGUgaXQg4pmlLgoKQ2M6
IE1pa2l0YSBMaXBza2kgPG1pa2l0YS5saXBza2lAYW1kLmNvbT4KQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbnBhdWxAZ29vZ2xl
LmNvbT4KQ2M6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+CgpMeXVkZSBQYXVs
ICg0KToKICBkcm0vZHBfbXN0OiBSZW5hbWUgZHJtX2RwX21zdF9pc19kcF9tc3RfZW5kX2Rldmlj
ZSgpIHRvIGJlIGxlc3MKICAgIHJlZHVuZGFudAogIGRybS9kcF9tc3Q6IFVzZSBmdWxsX3BibiBp
bnN0ZWFkIG9mIGF2YWlsYWJsZV9wYm4gZm9yIGJhbmR3aWR0aCBjaGVja3MKICBkcm0vZHBfbXN0
OiBSZXByb2JlIHBhdGggcmVzb3VyY2VzIGluIENTTiBoYW5kbGVyCiAgZHJtL2RwX21zdDogUmV3
cml0ZSBhbmQgZml4IGJhbmR3aWR0aCBsaW1pdCBjaGVja3MKCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX21zdF90b3BvbG9neS5jIHwgMTg1ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCiBpbmNs
dWRlL2RybS9kcm1fZHBfbXN0X2hlbHBlci5oICAgICAgIHwgICA0ICstCiAyIGZpbGVzIGNoYW5n
ZWQsIDEyOSBpbnNlcnRpb25zKCspLCA2MCBkZWxldGlvbnMoLSkKCi0tIAoyLjI0LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
