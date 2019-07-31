Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1D7C1DC
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 14:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38A489D9A;
	Wed, 31 Jul 2019 12:43:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 732C789D9A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 12:43:55 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 94935206B8;
 Wed, 31 Jul 2019 12:43:54 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org, Richard Gong <richard.gong@linux.intel.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
Date: Wed, 31 Jul 2019 14:43:39 +0200
Message-Id: <20190731124349.4474-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564577035;
 bh=qdKt8xMkWx3WVKyGM6p4kgZa2A5bUHnif0uObDGpacs=;
 h=From:To:Cc:Subject:Date:From;
 b=2PNMPi2HyAUo2pq0bnVlLzISd0g9zVsRAilNinPTip5E5cYDt4EuxnIXHElkwTvJH
 dPcH2fxP7sNNLV5xbJKld4HmAQXtZsA0TJ9OOL2zD56aMvLQcivlBKx2iiQgNAw2U7
 SBbEoWYOMqoaclJc4+S40fQvW5IGe6rMUuYu8HzU=
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
Cc: linux-input@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sudeep Holla <sudeep.holla@arm.com>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Tony Prisk <linux@prisktech.co.nz>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBvcmlnaW5hbGx5IHN0YXJ0ZWQgb3V0IGp1c3QgYXMgYSB3YXkgZm9yIHBsYXRm
b3JtIGRyaXZlcnMgdG8KZWFzaWx5IGFkZCBhIHN5c2ZzIGdyb3VwIGluIGEgcmFjZS1mcmVlIHdh
eSwgYnV0IHRoYW5rcyB0byBEbWl0cnkncwpwYXRjaCwgdGhpcyBzZXJpZXMgbm93IGlzIGZvciBh
bGwgZHJpdmVycyBpbiB0aGUga2VybmVsIChoZXksIGEgdW5pZmllZApkcml2ZXIgbW9kZWwgd29y
a3MhISEpCgpJJ3ZlIG9ubHkgY29udmVydGVkIGEgZmV3IHBsYXRmb3JtIGRyaXZlcnMgaGVyZSBp
biB0aGlzIHNlcmllcyB0byBzaG93CmhvdyBpdCB3b3JrcywgYnV0IG90aGVyIGJ1c3NlcyBjYW4g
YmUgY29udmVydGVkIGFmdGVyIHRoZSBmaXJzdCBwYXRjaApnb2VzIGludG8gdGhlIHRyZWUuCgpI
ZXJlJ3MgdGhlIG9yaWdpbmFsIDAwIG1lc3NhZ2UsIGZvciBwZW9wbGUgdG8gZ2V0IGFuIGlkZWEg
b2Ygd2hhdCBpcwpnb2luZyBvbiBoZXJlOgoKSWYgYSBwbGF0Zm9ybSBkcml2ZXIgd2FudHMgdG8g
YWRkIGEgc3lzZnMgZ3JvdXAsIGl0IGhhcyB0byBkbyBzbyBpbiBhCnJhY3kgd2F5LCBhZGRpbmcg
aXQgYWZ0ZXIgdGhlIGRyaXZlciBpcyBib3VuZC4gIFRvIHJlc29sdmUgdGhpcyBpc3N1ZSwKaGF2
ZSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgZG8gdGhpcyBmb3IgdGhlIGRyaXZlciwgbWFraW5n
IHRoZQppbmRpdmlkdWFsIGRyaXZlcnMgbG9naWMgc21hbGxlciBhbmQgc2ltcGxlciwgYW5kIHNv
bHZpbmcgdGhlIHJhY2UgYXQKdGhlIHNhbWUgdGltZS4KCkFsbCBvZiB0aGVzZSBwYXRjaGVzIGRl
cGVuZCBvbiB0aGUgZmlyc3QgcGF0Y2guICBJJ2xsIHRha2UgdGhlIGZpcnN0IG9uZQp0aHJvdWdo
IG15IGRyaXZlci1jb3JlIHRyZWUsIGFuZCBhbnkgc3Vic3lzdGVtIG1haW50YWluZXIgY2FuIGVp
dGhlciBhY2sKdGhlaXIgaW5kaXZpZHVsIHBhdGNoIGFuZCBJIHdpbGwgYmUgZ2xhZCB0byBhbHNv
IG1lcmdlIGl0LCBvciB0aGV5IGNhbgp3YWl0IHVudGlsIGFmdGVyIDUuNC1yYzEgd2hlbiB0aGUg
Y29yZSBwYXRjaCBoaXRzIExpbnVzJ3MgdHJlZSBhbmQgdGhlbgp0YWtlIGl0LCBpdCdzIHVwIHRv
IHRoZW0uCgpUaGFuayB0byBSaWNoYXJkIEdvbmcgZm9yIHRoZSBpZGVhIGFuZCB0aGUgdGVzdGlu
ZyBvZiB0aGUgcGxhdGZvcm0KZHJpdmVyIHBhdGNoIGFuZCB0byBEbWl0cnkgVG9yb2tob3YgZm9y
IHJld3JpdGluZyB0aGUgZmlyc3QgcGF0Y2ggdG8Kd29yayB3ZWxsIGZvciBhbGwgYnVzc2VzLgoK
LS0tLS0KClYyIC0gd29yayBmb3IgYWxsIGJ1c3NlcyBhbmQgbm90IGp1c3QgcGxhdGZvcm0gZHJp
dmVycy4KCgpEbWl0cnkgVG9yb2tob3YgKDEpOgogIGRyaXZlciBjb3JlOiBhZGQgZGV2X2dyb3Vw
cyB0byBhbGwgZHJpdmVycwoKR3JlZyBLcm9haC1IYXJ0bWFuICg5KToKICB1aW86IHVpb19mc2xf
ZWxiY19ncGNtOiBjb252ZXJ0IHBsYXRmb3JtIGRyaXZlciB0byB1c2UgZGV2X2dyb3VwcwogIGlu
cHV0OiBrZXlib2FyZDogZ3Bpb19rZXlzOiBjb252ZXJ0IHBsYXRmb3JtIGRyaXZlciB0byB1c2Ug
ZGV2X2dyb3VwcwogIGlucHV0OiBheHAyMHgtcGVrOiBjb252ZXJ0IHBsYXRmb3JtIGRyaXZlciB0
byB1c2UgZGV2X2dyb3VwcwogIGZpcm13YXJlOiBhcm1fc2NwaTogY29udmVydCBwbGF0Zm9ybSBk
cml2ZXIgdG8gdXNlIGRldl9ncm91cHMKICBvbHBjOiB4MDE6IGNvbnZlcnQgcGxhdGZvcm0gZHJp
dmVyIHRvIHVzZSBkZXZfZ3JvdXBzCiAgcGxhdGZvcm06IHg4NjogaHAtd21pOiBjb252ZXJ0IHBs
YXRmb3JtIGRyaXZlciB0byB1c2UgZGV2X2dyb3VwcwogIHZpZGVvOiBmYmRldjogd204NTA1ZmI6
IGNvbnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBkZXZfZ3JvdXBzCiAgdmlkZW86IGZiZGV2
OiB3MTAwZmI6IGNvbnZlcnQgcGxhdGZvcm0gZHJpdmVyIHRvIHVzZSBkZXZfZ3JvdXBzCiAgdmlk
ZW86IGZiZGV2OiBzbTUwMWZiOiBjb252ZXJ0IHBsYXRmb3JtIGRyaXZlciB0byB1c2UgZGV2X2dy
b3VwcwoKIGFyY2gveDg2L3BsYXRmb3JtL29scGMvb2xwYy14bzEtc2NpLmMgfCAxNyArKysrLS0t
LS0tCiBkcml2ZXJzL2Jhc2UvZGQuYyAgICAgICAgICAgICAgICAgICAgIHwgMTQgKysrKysrKysK
IGRyaXZlcnMvZmlybXdhcmUvYXJtX3NjcGkuYyAgICAgICAgICAgfCAgNSArLS0KIGRyaXZlcnMv
aW5wdXQva2V5Ym9hcmQvZ3Bpb19rZXlzLmMgICAgfCAxMyArKy0tLS0tLQogZHJpdmVycy9pbnB1
dC9taXNjL2F4cDIweC1wZWsuYyAgICAgICB8IDE1ICsrLS0tLS0tLQogZHJpdmVycy9wbGF0Zm9y
bS94ODYvaHAtd21pLmMgICAgICAgICB8IDQ3ICsrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLQog
ZHJpdmVycy91aW8vdWlvX2ZzbF9lbGJjX2dwY20uYyAgICAgICB8IDIzICsrKysrLS0tLS0tLS0K
IGRyaXZlcnMvdmlkZW8vZmJkZXYvc201MDFmYi5jICAgICAgICAgfCAzNyArKysrKy0tLS0tLS0t
LS0tLS0tLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvdzEwMGZiLmMgICAgICAgICAgfCAyMyArKysr
KystLS0tLS0tCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3dtODUwNWZiLmMgICAgICAgIHwgMTMgKysr
Ky0tLS0KIGluY2x1ZGUvbGludXgvZGV2aWNlLmggICAgICAgICAgICAgICAgfCAgMyArKwogMTEg
ZmlsZXMgY2hhbmdlZCwgNzYgaW5zZXJ0aW9ucygrKSwgMTM0IGRlbGV0aW9ucygtKQoKLS0gCjIu
MjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
