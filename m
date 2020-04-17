Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 485C81AE602
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 21:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5684A6E866;
	Fri, 17 Apr 2020 19:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F61C6E85E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 19:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587152549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0POUKn5el8rFXJ9SU/bGUJ9HAHH8PpwpgN/Gi+roguo=;
 b=a9rPaHTYlZDqtqH2OfHbtI9x0jIl+UzOdtz90avX/JTUPSpDLcJpHXosW7N+6vq4u6xQlZ
 XqUM5OdEqmsTkNy0nR43rbn6JzRGFv0Junv38F8nkDMpavN6u42erhnEeRE0HH55keORtG
 7L+5tEwHspYXvOsnjVk/8DzZk6yPOCo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-205-xtB5XGjZOqyG9S9NH0HXNg-1; Fri, 17 Apr 2020 15:42:27 -0400
X-MC-Unique: xtB5XGjZOqyG9S9NH0HXNg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9509F8010CA;
 Fri, 17 Apr 2020 19:42:23 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-114-140.rdu2.redhat.com [10.10.114.140])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5B8645D9CA;
 Fri, 17 Apr 2020 19:42:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v3 00/11] drm/nouveau: Introduce CRC support for gf119+
Date: Fri, 17 Apr 2020 15:40:47 -0400
Message-Id: <20200417194145.36350-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Liang Chen <cl@rock-chips.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TnZpZGlhIHJlbGVhc2VkIHNvbWUgZG9jdW1lbnRhdGlvbiBvbiBob3cgQ1JDIHN1cHBvcnQgd29y
a3Mgb24gdGhlaXIKR1BVcywgaG9vcmF5IQoKU286IHRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVu
dHMgc2FpZCBDUkMgc3VwcG9ydCBpbiBub3V2ZWF1LCBhbG9uZyB3aXRoCmFkZGluZyBzb21lIHNw
ZWNpYWwgZGVidWdmcyBpbnRlcmZhY2VzIGZvciBzb21lIHJlbGV2YW50IGlndC1ncHUtdG9vbHMK
dGVzdHMgdGhhdCB3ZSdsbCBiZSBzZW5kaW5nIGluIGp1c3QgYSBzaG9ydCBiaXQuCgpUaGlzIGFk
ZGl0aW9uYWxseSBhZGRzIGEgZmVhdHVyZSB0aGF0IFZpbGxlIFN5cmrDpGzDpCBjYW1lIHVwIHdp
dGg6IHZibGFuawp3b3Jrcy4gQmFzaWNhbGx5LCB0aGlzIGlzIGp1c3QgYSBnZW5lcmljIERSTSBp
bnRlcmZhY2UgdGhhdCBhbGxvd3MgZm9yCnNjaGVkdWxpbmcgaGlnaC1wcmlvcml0eSB3b3JrZXJz
IHRoYXQgc3RhcnQgb24gYSBnaXZlbiB2YmxhbmsgaW50ZXJydXB0LgpOb3RlIHRoYXQgd2hpbGUg
d2UncmUgY3VycmVudGx5IG9ubHkgdXNpbmcgdGhpcyBpbiBub3V2ZWF1LCBJbnRlbCBoYXMKcGxh
bnMgdG8gdXNlIHRoaXMgZm9yIGk5MTUgYXMgd2VsbCAoaGVuY2Ugd2h5IHRoZXkgY2FtZSB1cCB3
aXRoIGl0ISkuCgpBbmQgZmluYWxseTogaW4gb3JkZXIgdG8gaW1wbGVtZW50IHRoZSBsYXN0IGZl
YXR1cmUsIHdlIGV4cG9zZSBzb21lIG5ldwpmdW5jdGlvbnMgaW4gdGhlIGtlcm5lbCdzIGt0aHJl
YWRfd29ya2VyIGluZnJhc3RydWN0dXJlIHNvIHRoYXQgd2UgY2FuCmRlLWNvbXBsaWNhdGUgb3Vy
IGltcGxlbWVudGF0aW9uIG9mIHRoaXMuCgpBbnl3YXktd2VsY29tZSB0byB0aGUgZnV0dXJlISA6
KQoKTWFqb3IgY2hhbmdlcyBzaW5jZSB2MjoKKiBVc2Uga3RocmVhZF93b3JrZXIgaW5zdGVhZCBv
ZiBrdGhyZWFkZCBmb3IgdmJsYW5rIHdvcmtlcnMKKiBEb24ndCBjaGVjayBkZWJ1Z2ZzIHJldHVy
biB2YWx1ZXMKCkx5dWRlIFBhdWwgKDExKToKICBkcm0vdmJsYW5rOiBSZWdpc3RlciBkcm1tIGNs
ZWFudXAgYWN0aW9uIG9uY2UgcGVyIGRybV92YmxhbmtfY3J0YwogIGt0aHJlYWQ6IEludHJvZHVj
ZSBfX2t0aHJlYWRfcXVldWVfd29yaygpCiAgZHJtL3ZibGFuazogQWRkIHZibGFuayB3b3Jrcwog
IGRybS9ub3V2ZWF1L2ttcy9udjUwLTogVW5yb2xsIGVycm9yIGNsZWFudXAgaW4gbnY1MF9oZWFk
X2NyZWF0ZSgpCiAgZHJtL25vdXZlYXUva21zL252MTQwLTogRG9uJ3QgbW9kaWZ5IGRlcHRoIGlu
IHN0YXRlIGR1cmluZyBhdG9taWMKICAgIGNvbW1pdAogIGRybS9ub3V2ZWF1L2ttcy9udjUwLTog
Rml4IGRpc2FibGluZyBkaXRoZXJpbmcKICBkcm0vbm91dmVhdS9rbXMvbnY1MC06IHMvaGFybS9h
cm1oL2cKICBkcm0vbm91dmVhdS9rbXMvbnYxNDAtOiBUcmFjayB3bmR3IG1hcHBpbmdzIGluIG52
NTBfaGVhZF9hdG9tCiAgZHJtL25vdXZlYXUva21zL252NTAtOiBFeHBvc2UgbnY1MF9vdXRwX2F0
b20gaW4gZGlzcC5oCiAgZHJtL25vdXZlYXUva21zL252NTAtOiBNb3ZlIGhhcmQtY29kZWQgb2Jq
ZWN0IGhhbmRsZXMgaW50byBoZWFkZXIKICBkcm0vbm91dmVhdS9rbXMvbnZkOS06IEFkZCBDUkMg
c3VwcG9ydAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgICAgICAgICAgICAgICAgfCAz
MTQgKysrKysrKystCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnYwNC9jcnRjLmMgICAg
IHwgIDI1ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9LYnVpbGQgICAgIHwg
ICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2F0b20uaCAgICAgfCAgMjEg
KwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZS5oICAgICB8ICAgNCArCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jb3JlOTA3ZC5jIHwgICAzICsKIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmU5MTdkLmMgfCAgIDMgKwogZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZWMzN2QuYyB8ICAgMyArCiBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9jb3JlYzU3ZC5jIHwgICAzICsKIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2NyYy5jICAgICAgfCA3MTUgKysrKysrKysrKysrKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NyYy5oICAgICAgfCAxMjUgKysrKwogZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjOTA3ZC5jICB8IDEzOSArKysrCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jcmNjMzdkLmMgIHwgMTUzICsrKysrCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgICAgIHwgIDY1ICstCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmggICAgIHwgIDI0ICsKIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hhbmRsZXMuaCAgfCAgMTYgKwogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvaGVhZC5jICAgICB8IDE0MiArKystCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9oZWFkLmggICAgIHwgIDEzICstCiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9kaXNwbnY1MC9oZWFkOTA3ZC5jIHwgIDE0ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9oZWFkYzM3ZC5jIHwgIDI3ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9oZWFkYzU3ZC5jIHwgIDIwICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC93bmR3LmMgICAgIHwgIDE1ICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2Rpc3BsYXkuYyAgIHwgIDYwICstCiBpbmNsdWRlL2RybS9kcm1fdmJsYW5rLmggICAgICAgICAg
ICAgICAgICAgIHwgIDMxICsKIGluY2x1ZGUvbGludXgva3RocmVhZC5oICAgICAgICAgICAgICAg
ICAgICAgfCAgIDMgKwoga2VybmVsL2t0aHJlYWQuYyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAzNCArLQogMjYgZmlsZXMgY2hhbmdlZCwgMTgzMSBpbnNlcnRpb25zKCspLCAxNDUgZGVs
ZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvY3JjLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9jcmMuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2NyYzkwN2QuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2NyY2MzN2QuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hhbmRsZXMuaAoKLS0gCjIuMjUuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
