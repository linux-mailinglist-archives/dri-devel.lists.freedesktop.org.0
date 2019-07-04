Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 981495F4C3
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 10:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFAB56E301;
	Thu,  4 Jul 2019 08:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95EBB6E301
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2019 08:46:30 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DE44B2189E;
 Thu,  4 Jul 2019 08:46:29 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/11] Platform drivers,
 provide a way to add sysfs groups easily
Date: Thu,  4 Jul 2019 10:46:06 +0200
Message-Id: <20190704084617.3602-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1562229990;
 bh=tC7+gI4m6/FmoXDFgw+iYQurMimFbVLSYsLJZsEwswo=;
 h=From:To:Cc:Subject:Date:From;
 b=k1z/iZmhkgL1+r5CK+JywKsx41uolSAz0o6l9oruBRWsCwsK3uP7NC8yhwHmkRfmT
 uYnpWBIafyLG3LbrauXyApoKrbN+r0LhrfsET7Ma07/BKj/2HPxh7h3pjP8QOCjSuk
 V1ZrAdjygpzHO7Js27pZu/f0TdYw+0Cvmc/N3ge8=
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Mans Rullgard <mans@mansr.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Romain Izard <romain.izard.pro@gmail.com>,
 Richard Gong <richard.gong@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, x86@kernel.org,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 Jiri Slaby <jslaby@suse.com>, Darren Hart <dvhart@infradead.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-input@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Tony Prisk <linux@prisktech.co.nz>, Sudeep Holla <sudeep.holla@arm.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBwbGF0Zm9ybSBkcml2ZXIgd2FudHMgdG8gYWRkIGEgc3lzZnMgZ3JvdXAsIGl0IGhhcyB0
byBkbyBzbyBpbiBhCnJhY3kgd2F5LCBhZGRpbmcgaXQgYWZ0ZXIgdGhlIGRyaXZlciBpcyBib3Vu
ZC4gIFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwKaGF2ZSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUg
ZG8gdGhpcyBmb3IgdGhlIGRyaXZlciwgbWFraW5nIHRoZQppbmRpdmlkdWFsIGRyaXZlcnMgbG9n
aWMgc21hbGxlciBhbmQgc2ltcGxlciwgYW5kIHNvbHZpbmcgdGhlIHJhY2UgYXQKdGhlIHNhbWUg
dGltZS4KCkFsbCBvZiB0aGVzZSBwYXRjaGVzIGRlcGVuZCBvbiB0aGUgZmlyc3QgcGF0Y2guICBJ
J2xsIHRha2UgdGhlIGZpcnN0IG9uZQp0aHJvdWdoIG15IGRyaXZlci1jb3JlIHRyZWUsIGFuZCBh
bnkgc3Vic3lzdGVtIG1haW50YWluZXIgY2FuIGVpdGhlciBhY2sKdGhlaXIgaW5kaXZpZHVsIHBh
dGNoIGFuZCBJIHdpbGwgYmUgZ2xhZCB0byBhbHNvIG1lcmdlIGl0LCBvciB0aGV5IGNhbgp3YWl0
IHVudGlsIGFmdGVyIDUuMy1yYzEgd2hlbiB0aGUgY29yZSBwYXRjaCBoaXRzIExpbnVzJ3MgdHJl
ZSBhbmQgdGhlbgp0YWtlIGl0LCBpdCdzIHVwIHRvIHRoZW0uCgpUaGFuayB0byBSaWNoYXJkIEdv
bmcgZm9yIHRoZSBpZGVhIGFuZCB0aGUgdGVzdGluZyBvZiB0aGUgcGxhdGZvcm0KZHJpdmVyIHBh
dGNoLgoKR3JlZyBLcm9haC1IYXJ0bWFuICgxMSk6CiAgUGxhdGZvcm06IGFkZCBhIGRldl9ncm91
cHMgcG9pbnRlciB0byBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyCiAgdWlvOiB1aW9fZnNsX2VsYmNf
Z3BjbTogY29udmVydCBwbGF0Zm9ybSBkcml2ZXIgdG8gdXNlIGRldl9ncm91cHMKICBzZXJpYWw6
IHNoLXNjaTogdXNlIGRyaXZlciBjb3JlIGZ1bmN0aW9ucywgbm90IHN5c2ZzIG9uZXMuCiAgZmly
bXdhcmU6IGFybV9zY3BpOiBjb252ZXJ0IHBsYXRmb3JtIGRyaXZlciB0byB1c2UgZGV2X2dyb3Vw
cwogIG9scGM6IHgwMTogY29udmVydCBwbGF0Zm9ybSBkcml2ZXIgdG8gdXNlIGRldl9ncm91cHMK
ICBwbGF0Zm9ybTogeDg2OiBocC13bWk6IGNvbnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBk
ZXZfZ3JvdXBzCiAgdmlkZW86IGZiZGV2OiB3bTg1MDVmYjogY29udmVydCBwbGF0Zm9ybSBkcml2
ZXIgdG8gdXNlIGRldl9ncm91cHMKICB2aWRlbzogZmJkZXY6IHcxMDBmYjogY29udmVydCBwbGF0
Zm9ybSBkcml2ZXIgdG8gdXNlIGRldl9ncm91cHMKICB2aWRlbzogZmJkZXY6IHNtNTAxZmI6IGNv
bnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBkZXZfZ3JvdXBzCiAgaW5wdXQ6IGtleWJvYXJk
OiBncGlvX2tleXM6IGNvbnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBkZXZfZ3JvdXBzCiAg
aW5wdXQ6IGF4cDIweC1wZWs6IGNvbnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBkZXZfZ3Jv
dXBzCgogYXJjaC94ODYvcGxhdGZvcm0vb2xwYy9vbHBjLXhvMS1zY2kuYyB8IDE3ICsrKystLS0t
LS0KIGRyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgfCA0MCArKysrKysrKysr
KysrKystLS0tLS0tLQogZHJpdmVycy9maXJtd2FyZS9hcm1fc2NwaS5jICAgICAgICAgICB8ICA1
ICstLQogZHJpdmVycy9pbnB1dC9rZXlib2FyZC9ncGlvX2tleXMuYyAgICB8IDEzICsrLS0tLS0t
CiBkcml2ZXJzL2lucHV0L21pc2MvYXhwMjB4LXBlay5jICAgICAgIHwgMTUgKystLS0tLS0tCiBk
cml2ZXJzL3BsYXRmb3JtL3g4Ni9ocC13bWkuYyAgICAgICAgIHwgNDcgKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2gtc2NpLmMgICAgICAgICAgIHwgMjIg
KysrKystLS0tLS0tLQogZHJpdmVycy91aW8vdWlvX2ZzbF9lbGJjX2dwY20uYyAgICAgICB8IDIz
ICsrKysrLS0tLS0tLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc201MDFmYi5jICAgICAgICAgfCAz
NyArKysrKy0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvdzEwMGZiLmMgICAg
ICAgICAgfCAyMyArKysrKystLS0tLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMg
ICAgICAgIHwgMTMgKysrKy0tLS0KIGluY2x1ZGUvbGludXgvcGxhdGZvcm1fZGV2aWNlLmggICAg
ICAgfCAgMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspLCAxNjIgZGVsZXRp
b25zKC0pCgotLSAKMi4yMi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
