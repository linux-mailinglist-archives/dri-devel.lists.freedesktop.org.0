Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C49A1CB92D
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 22:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872E6E15E;
	Fri,  8 May 2020 20:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 684EC6E290
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 20:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588970911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PABbYX5l1s1Q7QOkyDr67VfhHwZx5DccKVnVnS2WJ7Q=;
 b=A7fUtC8hkDfHM+LbvdcB4mOP6Q7psRZqatWsS4Ni5YaXKjAKhcEun7wT7qywzFhtASd+jD
 F0ZaaBUenMZyHveRFQ7zDBCY/5pqPlDaj3P5JGZrvgVRwyxzGcSO9xIgRTBsqW7h7MUyIb
 ONkD0+ptBNm63GNdqtGP3/Hjlk7KBXY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-unhX4jLNPO2o-MomrFUNfQ-1; Fri, 08 May 2020 16:48:29 -0400
X-MC-Unique: unhX4jLNPO2o-MomrFUNfQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 664A48018A6;
 Fri,  8 May 2020 20:48:25 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-118-29.rdu2.redhat.com [10.10.118.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EE5B5D9CA;
 Fri,  8 May 2020 20:48:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [RFC v4 00/12] drm/nouveau: Introduce CRC support for gf119+
Date: Fri,  8 May 2020 16:46:50 -0400
Message-Id: <20200508204751.155488-1-lyude@redhat.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Ben Dooks <ben.dooks@codethink.co.uk>, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 Peteris Rudzusiks <peteris.rudzusiks@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>, Sean Paul <seanpaul@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Liang Chen <cl@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TnZpZGlhIHJlbGVhc2VkIHNvbWUgZG9jdW1lbnRhdGlvbiBvbiBob3cgQ1JDIHN1cHBvcnQgd29y
a3Mgb24gdGhlaXIKR1BVcywgaG9vcmF5IQoKU286IHRoaXMgcGF0Y2ggc2VyaWVzIGltcGxlbWVu
dHMgc2FpZCBDUkMgc3VwcG9ydCBpbiBub3V2ZWF1LCBhbG9uZyB3aXRoCmFkZGluZyBzb21lIHNw
ZWNpYWwgZGVidWdmcyBpbnRlcmZhY2VzIGZvciBzb21lIHJlbGV2YW50IGlndC1ncHUtdG9vbHMK
dGVzdHMgKGFscmVhZHkgb24gdGhlIE1MKS4KCkZpcnN0IC0gd2UgYWRkIHNvbWUgbmV3IGZ1bmN0
aW9uYWxpdHkgdG8ga3RocmVhZF93b3JrIGluIHRoZSBrZXJuZWwsIGFuZAp0aGVuIHVzZSB0aGlz
IHRvIGFkZCBhIG5ldyBmZWF0dXJlIHRvIERSTSB0aGF0IFZpbGxlIFN5cmrDpGzDpCBjYW1lIHVw
CndpdGg6IHZibGFuayB3b3JrZXJzLiBCYXNpY2FsbHksIHRoaXMgaXMganVzdCBhIGdlbmVyaWMg
RFJNIGludGVyZmFjZQp0aGF0IGFsbG93cyBmb3Igc2NoZWR1bGluZyBoaWdoLXByaW9yaXR5IHdv
cmtlcnMgdGhhdCBzdGFydCBvbiBhIGdpdmVuCnZibGFuayBpbnRlcnJ1cHQuIE5vdGUgdGhhdCB3
aGlsZSB3ZSdyZSBjdXJyZW50bHkgb25seSB1c2luZyB0aGlzIGluCm5vdXZlYXUsIEludGVsIGhh
cyBwbGFucyB0byB1c2UgdGhpcyBmb3IgaTkxNSBhcyB3ZWxsIChoZW5jZSB3aHkgdGhleQpjYW1l
IHVwIHdpdGggaXQhKS4KCkFuZCBmaW5hbGx5OiBpbiBvcmRlciB0byBpbXBsZW1lbnQgdGhlIGxh
c3QgZmVhdHVyZSwgd2UgZXhwb3NlIHNvbWUgbmV3CmZ1bmN0aW9ucyBpbiB0aGUga2VybmVsJ3Mg
a3RocmVhZF93b3JrZXIgaW5mcmFzdHJ1Y3R1cmUgc28gdGhhdCB3ZSBjYW4KZGUtY29tcGxpY2F0
ZSBvdXIgaW1wbGVtZW50YXRpb24gb2YgdGhpcy4KCkFueXdheS13ZWxjb21lIHRvIHRoZSBmdXR1
cmUhIDopCgpNYWpvciBjaGFuZ2VzIHNpbmNlIHYzOgoqIFN0eWxlIGZpeGVzIG9uIG5vdXZlYXUg
cGF0Y2hlcyBmcm9tIGNoZWNrcGF0Y2gsIG5vIGZ1bmN0aW9uYWwgY2hhbmdlcwoqIERvbid0IGlu
dGVncmF0ZSBzbyB0aWdodGx5IHdpdGgga3RocmVhZF93b3JrIChhbmQgdXNlIG91ciBvd24gbG9j
ayksCiAgaW5zdGVhZCBpbnRyb2R1Y2Ugc29tZSBuZXcgZnVuY3Rpb25zIGZvciBkb2luZyBzaW1w
bGUgYXN5bmMgZmx1c2hpbmcKICBhbmQgY2FuY2VsbGluZy4gSSB0aGluayB0aGlzIGludGVyZmFj
ZSBsb29rcyBhIGxvdCBtb3JlIGFjY2VwdGFibGUKICB0aGVuIHdoYXQgSSB3YXMgcHJldmlvdXNs
eSB0cnlpbmcuCiogQXBwbHkgc29tZSBjaGFuZ2VzIHJlcXVlc3RlZCBieSBkYW52ZXQKTWFqb3Ig
Y2hhbmdlcyBzaW5jZSB2MjoKKiBVc2Uga3RocmVhZF93b3JrZXIgaW5zdGVhZCBvZiBrdGhyZWFk
ZCBmb3IgdmJsYW5rIHdvcmtlcnMKKiBEb24ndCBjaGVjayBkZWJ1Z2ZzIHJldHVybiB2YWx1ZXMK
Ckx5dWRlIFBhdWwgKDEyKToKICBrdGhyZWFkOiBBZGQga3RocmVhZF9xdWV1ZV9mbHVzaF93b3Jr
KCkKICBrdGhyZWFkOiBBZGQga3RocmVhZF8odW4pYmxvY2tfd29ya19xdWV1aW5nKCkgYW5kCiAg
ICBrdGhyZWFkX3dvcmtfcXVldWFibGUoKQogIGRybS92Ymxhbms6IFJlZ2lzdGVyIGRybW0gY2xl
YW51cCBhY3Rpb24gb25jZSBwZXIgZHJtX3ZibGFua19jcnRjCiAgZHJtL3ZibGFuazogQWRkIHZi
bGFuayB3b3JrcwogIGRybS9ub3V2ZWF1L2ttcy9udjUwLTogVW5yb2xsIGVycm9yIGNsZWFudXAg
aW4gbnY1MF9oZWFkX2NyZWF0ZSgpCiAgZHJtL25vdXZlYXUva21zL252MTQwLTogRG9uJ3QgbW9k
aWZ5IGRlcHRoIGluIHN0YXRlIGR1cmluZyBhdG9taWMKICAgIGNvbW1pdAogIGRybS9ub3V2ZWF1
L2ttcy9udjUwLTogRml4IGRpc2FibGluZyBkaXRoZXJpbmcKICBkcm0vbm91dmVhdS9rbXMvbnY1
MC06IHMvaGFybS9hcm1oL2cKICBkcm0vbm91dmVhdS9rbXMvbnYxNDAtOiBUcmFjayB3bmR3IG1h
cHBpbmdzIGluIG52NTBfaGVhZF9hdG9tCiAgZHJtL25vdXZlYXUva21zL252NTAtOiBFeHBvc2Ug
bnY1MF9vdXRwX2F0b20gaW4gZGlzcC5oCiAgZHJtL25vdXZlYXUva21zL252NTAtOiBNb3ZlIGhh
cmQtY29kZWQgb2JqZWN0IGhhbmRsZXMgaW50byBoZWFkZXIKICBkcm0vbm91dmVhdS9rbXMvbnZk
OS06IEFkZCBDUkMgc3VwcG9ydAoKIGRyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMgICAgICAg
ICAgICAgICAgfCAyODAgKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjA0
L2NydGMuYyAgICAgfCAgMjUgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL0ti
dWlsZCAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvYXRvbS5o
ICAgICB8ICAyMSArCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jb3JlLmggICAg
IHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmU5MDdkLmMgfCAg
IDMgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY29yZTkxN2QuYyB8ICAgMyAr
CiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jb3JlYzM3ZC5jIHwgICAzICsKIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NvcmVjNTdkLmMgfCAgIDMgKwogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjLmMgICAgICB8IDcxNSArKysrKysrKysrKysr
KysrKysrKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjLmggICAgICB8IDEy
NSArKysrCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jcmM5MDdkLmMgIHwgMTM5
ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2NyY2MzN2QuYyAgfCAxNTMg
KysrKysKIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyAgICAgfCAgNjUg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuaCAgICAgfCAgMjQgKwog
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGFuZGxlcy5oICB8ICAxNiArCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMgICAgIHwgMTQyICsrKy0KIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuaCAgICAgfCAgMTMgKy0KIGRyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQ5MDdkLmMgfCAgMTQgKy0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjMzdkLmMgfCAgMjcgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWRjNTdkLmMgfCAgMjAgKy0KIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL3duZHcuYyAgICAgfCAgMTUgKy0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZGlzcGxheS5jICAgfCAgNjAgKy0KIGluY2x1ZGUvZHJtL2RybV92Ymxhbmsu
aCAgICAgICAgICAgICAgICAgICAgfCAgMzUgKwogaW5jbHVkZS9saW51eC9rdGhyZWFkLmggICAg
ICAgICAgICAgICAgICAgICB8ICAzNSArCiBrZXJuZWwva3RocmVhZC5jICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgMTMzICsrKy0KIDI2IGZpbGVzIGNoYW5nZWQsIDE5MDMgaW5zZXJ0aW9u
cygrKSwgMTc0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2NyYy5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvZGlzcG52NTAvY3JjLmgKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jcmM5MDdkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9jcmNjMzdkLmMKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oYW5kbGVzLmgKCi0tIAoyLjI1LjQK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
