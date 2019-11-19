Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D85461027E0
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 16:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D716E968;
	Tue, 19 Nov 2019 15:18:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99096E968
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 15:18:26 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-gj-aswoLMX2E5TPcRjr9sg-1; Tue, 19 Nov 2019 10:18:24 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F51C802520;
 Tue, 19 Nov 2019 15:18:22 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-117-49.ams2.redhat.com
 [10.36.117.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C9F201001925;
 Tue, 19 Nov 2019 15:18:19 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 0/3] drm/i915 / LPSS / mfd: Select correct PWM controller to
 use based on VBT
Date: Tue, 19 Nov 2019 16:18:15 +0100
Message-Id: <20191119151818.67531-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: gj-aswoLMX2E5TPcRjr9sg-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574176705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=W44n0jnAWgfO1rcmYb1hXUHI1Cvs6LKx+Od1R8CiNaI=;
 b=WJhPoksoZr/4euaFUBfGc/1pQIxgjkeeEwiM2HBLdQmfVxVR4hMNPyKT/TlZPeMwJM7cT/
 wc0THZPqIKxX/u5sx8TpMbyZxvuIOk7viP2pY+SCBIMG9PrpsFr7ZAM86GdjWs18Q0eoQ3
 VGwD1ZkdlLcqtueUienq83kJnRFIp4A=
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
Cc: linux-acpi@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxsLAoKVGhpcyBzZXJpZXMgbmVlZHMgdG8gYmUgbWVyZ2VkIHRocm91Z2ggYSBzaW5nbGUg
dHJlZSwgdG8ga2VlcCB0aGluZ3MKYmlzZWN0YWJsZS4gSSBoYXZlIGV2ZW4gY29uc2lkZXJlZCBq
dXN0IHNxdWFzaGluZyBhbGwgMyBwYXRjaGVzIGludG8gMSwKYnV0IGhhdmluZyBzZXBhcmF0ZSBj
b21taXRzIHNlZW1zIGJldHRlciwgYnV0IHRoYXQgZG9lcyBsZWFkIHRvIGFuCmludGVybWVkaWF0
ZSBzdGF0ZSB3aGVyZSB0aGUgYmFja2xpZ2h0IHN5c2ZzIGludGVyZmFjZSB3aWxsIGJlIGJyb2tl
bgooYW5kIGZpeGVkIDIgY29tbWl0cyBsYXRlcikuIFNlZSBiZWxvdyBmb3Igc29tZSBiYWNrZ3Jv
dW5kIGluZm8uCgpUaGUgY2hhbmdlcyB0byBkcml2ZXJzL2FjcGkvYWNwaV9scHNzLmMgYW5kIGRy
aXZlcnMvbWZkL2ludGVsX3NvY19wbWljX2NvcmUuYwphcmUgcXVpdGUgc21hbGwgYW5kIHNob3Vs
ZCBub3QgbGVhZCB0byBhbnkgY29uZmxpY3RzLCBzbyBJIGJlbGlldmUgdGhhdAppdCB3b3VsZCBi
ZSBiZXN0IHRvIG1lcmdlIHRoaXMgZW50aXJlIHNlcmllcyB0aHJvdWdoIHRoZSBkcm0taW50ZWwg
dHJlZS4KCkxlZSwgbWF5IEkgaGF2ZSB5b3VyIEFja2VkLWJ5IGZvciBtZXJnaW5nIHRoZSBtZmQg
Y2hhbmdlIHRocm91Z2ggdGhlCmRybS1pbnRlbCB0cmVlPwoKUmFmYWVsLCBtYXkgSSBoYXZlIHlv
dXIgQWNrZWQtYnkgZm9yIG1lcmdpbmcgdGhlIGFjcGlfbHBzcyBjaGFuZ2UgdGhyb3VnaCB0aGUK
ZHJtLWludGVsIHRyZWU/CgpSZWdhcmRzLAoKSGFucwoKcC5zLgoKVGhlIHByb21pc2VkIGJhY2tn
cm91bmQgaW5mbzoKCldlIGhhdmUgdGhpcyBsb25nIHN0YW5kaW5nIGlzc3VlIHdoZXJlIGluc3Rl
YWQgb2YgbG9va2luZyBpbiB0aGUgaTkxNQpWQlQgKFZpZGVvIEJJT1MgVGFibGUpIHRvIHNlZSBp
ZiB3ZSBzaG91bGQgdXNlIHRoZSBQV00gYmxvY2sgb2YgdGhlIFNvQwpvciBvZiB0aGUgUE1JQyB0
byBjb250cm9sIHRoZSBiYWNrbGlnaHQgb2YgYSBEU0kgcGFuZWwsIHdlIHJlbHkgb24KZHJpdmVy
cy9hY3BpL2FjcGlfbHBzcy5jIGFuZC9vciBkcml2ZXJzL21mZC9pbnRlbF9zb2NfcG1pY19jb3Jl
LmMKcmVnaXN0ZXJpbmcgYSBwd20gd2l0aCB0aGUgZ2VuZXJpYyBuYW1lIG9mICJwd21fYmFja2xp
Z2h0IiBhbmQgdGhlbiB0aGUKaTkxNSBwYW5lbCBjb2RlIGRvZXMgYSBwd21fZ2V0KGRldiwgInB3
bV9iYWNrbGlnaHQiKS4KCldlIGhhdmUgc29tZSBoZXVyaXN0aWNzIGluIGRyaXZlcnMvYWNwaS9h
Y3BpX2xwc3MuYyB0byBub3QgcmVnaXN0ZXIgdGhlCmxvb2t1cCBpZiBhIENyeXN0YWwgQ292ZSBQ
TUlDIGlzIHByZXNlbmQgYW5kIHRoZSBtZmQvaW50ZWxfc29jX3BtaWNfY29yZS5jCmNvZGUgc2lt
cGx5IGFzc3VtZXMgdGhhdCBzaW5jZSB0aGVyZSBpcyBhIFBNSUMgdGhlIFBNSUMgUFdNIGJsb2Nr
IHdpbGwKYmUgdXNlZC4gQmFzaWNhbGx5IHdlIGFyZSB3aW5naW5nIGl0LgoKUmVjZW50bHkgSSd2
ZSBsZWFybmVkIGFib3V0IDIgZGlmZmVyZW50IEJZVCBkZXZpY2VzOgpQb2ludCBvZiBWaWV3IE1P
QklJIFRBQi1QODAwVwpBY2VyIFN3aXRjaCAxMCBTVzUtMDEyCgpXaGljaCB1c2UgYSBDcnlzdGFs
IENvdmUgUE1JQywgeWV0IHRoZSBMQ0QgaXMgY29ubmVjdGVkIHRvIHRoZSBTb0MvTFBTUwpQV00g
Y29udHJvbGxlciAoYW5kIHRoZSBWQlQgY29ycmVjdGx5IGluZGljYXRlcyB0aGlzKSwgc28gaGVy
ZSBvdXIgb2xkCmhldXJpc3RpY3MgZmFpbC4KClRoaXMgc2VyaWVzIHJlbmFtcyB0aGUgUFdNIGxv
b2t1cHMgcmVnaXN0ZXJlZCBieSB0aGUgTFBTUyAvCmludGVsX3NvY19wbWljX2NvcmUuYyBjb2Rl
IGZyb20gInB3bV9iYWNrbGlnaHQiIHRvICJwd21fc29jX2JhY2tsaWdodCIgcmVzcC4KInB3bV9w
bWljX2JhY2tsaWdodCIgYW5kIGluIHRoZSBMUFNTIGNhc2UgYWxzbyBkcm9wcGluZyB0aGUgaGV1
cmlzdGljcyB3aGVuCnRvIHJlZ2lzdGVyIHRoZSBsb29rdXAuIFRoaXMgY29tYmluZWQgd2l0aCB0
ZWFjaGluZyB0aGUgaTkxNSBwYW5lbCB0byBjYWxsCnB3bV9nZXQgZm9yIHRoZSByaWdodCBsb29r
dXAtbmFtZSBkZXBlbmRpbmcgb24gdGhlIFZCVCBiaXRzIHJlc29sdmVzIHRoaXMuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
