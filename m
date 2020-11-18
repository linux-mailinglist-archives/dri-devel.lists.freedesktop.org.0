Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 671732B782E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:10:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC866E3AE;
	Wed, 18 Nov 2020 08:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C2C76E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 08:10:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1053ABDE;
 Wed, 18 Nov 2020 08:10:13 +0000 (UTC)
Subject: Re: [PATCH] drm: imx: Move fbdev setup to before output polling
To: Mark Jonas <mark.jonas@de.bosch.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
References: <20201117155229.9837-1-mark.jonas@de.bosch.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <e089d4d5-3bd8-c2cd-3011-ed87ae4284e8@suse.de>
Date: Wed, 18 Nov 2020 09:10:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201117155229.9837-1-mark.jonas@de.bosch.com>
Content-Language: en-US
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
Cc: Leo Ruan <tingquan.ruan@cn.bosch.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCkFtIDE3LjExLjIwIHVtIDE2OjUyIHNjaHJpZWIgTWFyayBKb25hczoKPiBGcm9tOiBMZW8g
UnVhbiA8dGluZ3F1YW4ucnVhbkBjbi5ib3NjaC5jb20+Cj4gCj4gVGhlIGdlbmVyaWMgZmJkZXYg
aGFzIHRvIGJlIHNldHVwIGJlZm9yZSBlbmFibGluZyBvdXRwdXQgcG9sbGluZy4KPiBPdGhlcndp
c2UgdGhlIGZiZGV2IGNsaWVudCBpcyBub3QgcmVhZHkgdG8gaGFuZGxlIGRlbGF5ZWQgZXZlbnRz
Lgo+IAo+IFNpbmNlIGY1MzcwNWZkLCB0aGUgZ2VuZXJpYyBmYmRldiBpcyBzZXR1cCBhZnRlciB0
aGUgb3V0cHV0IHBvbGxpbmcKPiBpbml0LiBEdXJpbmcgZmJkZXYgc2V0dXAsIHdoZW4gZmJkZXYg
cHJvYmVzIGF0dGFjaGVkIG91dHB1dHMgYW5kIGEKPiBzdGF0dXMgY2hhbmdlcyBmcm9tIHVua25v
d24gdG8gY29ubmVjdGVkLCB0aGUgZGVsYXllZCBldmVudCBpcwo+IG1hcmtlZCBhbmQgdGhlIG91
dHB1dF9wb2xsX3dvcmsgdGhyZWFkIGlzIHNjaGVkdWxlZCB3aXRob3V0IGRlbGF5Lgo+IElmIG91
dHB1dF9wb2xsX2V4ZWN1dGUoKSBpcyBydW5zIGltbWVkaWF0ZWx5LCB0aGUgZGVsYXllZCBldmVu
dAo+IGlzIGhhbmRsZWQgd2l0aG91dCBhY3R1YWxseSBwb2xsaW5nIHRoZSBvdXRwdXQgYmVjYXVz
ZSB0aGUgZmJkZXYgaXMgbm90Cj4gcmVnaXN0ZXJlZCB5ZXQuIFNvIHRoZSBkZWxheWVkIGV2ZW50
IGlzIGxvc3QuIFRoaXMgbGVhZHMgdG8gYSBkYXJrCj4gc2NyZWVuIHVudGlsIGEgS01TIGFwcGxp
Y2F0aW9uIChvciBmYmNvbikgc2V0cyB0aGUgc2NyZWVuIG1vZGUuCj4gCj4gVGhpcyBwYXRjaCBm
aXhlcyB0aGUgaXNzdWUgYnkgbW92aW5nIHRoZSBzZXR1cCBvZiBnZW5lcmljIGZiZGV2IGJlZm9y
ZQo+IGluaXRpYWxpemluZyBhbmQgZW5hYmxpbmcgb3V0cHV0IHBvbGxpbmcuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGVvIFJ1YW4gPHRpbmdxdWFuLnJ1YW5AY24uYm9zY2guY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IE1hcmsgSm9uYXMgPG1hcmsuam9uYXNAZGUuYm9zY2guY29tPgo+IC0tLQo+ICBkcml2
ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jIHwgOCArKysrKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9p
bXgtZHJtLWNvcmUuYwo+IGluZGV4IDliZjVhZDZkMThhMi4uMjY2NTA0MGUxMWM3IDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jCj4gQEAgLTI0MCwxNCArMjQwLDE4IEBAIHN0YXRp
YyBpbnQgaW14X2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgCQlsZWdhY3lmYl9kZXB0
aCA9IDE2Owo+ICAJfQo+ICAKPiArCS8qCj4gKwkgKiBUaGUgZ2VuZXJpYyBmYmRldiBoYXMgdG8g
YmUgc2V0dXAgYmVmb3JlIGVuYWJsaW5nIG91dHB1dCBwb2xsaW5nLgo+ICsJICogT3RoZXJ3aXNl
IHRoZSBmYmRldiBjbGllbnQgaXMgbm90IHJlYWR5IHRvIGhhbmRsZSBkZWxheWVkIGV2ZW50cy4K
PiArCSAqLwo+ICsJZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCBsZWdhY3lmYl9kZXB0aCk7
Cj4gKwo+ICAJZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybSk7Cj4gIAo+ICAJcmV0ID0gZHJt
X2Rldl9yZWdpc3Rlcihkcm0sIDApOwo+ICAJaWYgKHJldCkKPiAgCQlnb3RvIGVycl9wb2xsX2Zp
bmk7Cj4gIAo+IC0JZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoZHJtLCBsZWdhY3lmYl9kZXB0aCk7
Cj4gLQoKVGhpcyBkb2VzIG5vdCB3b3JrIHdlbGwuIGZiZGV2IGlzIHN1cHBvc2VkIHRvIGJlIGFu
b3RoZXIgcmVndWxhciBEUk0KY2xpZW50LiBJdCBoYXMgdG8gYmUgZW5hYmxlZCBhZnRlciByZWdp
c3RlcmluZyB0aGUgRFJNIGRldmljZS4KCkknZCByYXRoZXIgaW1wcm92ZSBmYmRldiBvciB0aGUg
ZHJpdmVyIHRvIGhhbmRsZSB0aGlzIGdyYWNlZnVsbHkuCgpCZXN0IHJlZ2FyZHMKVGhvbWFzCgo+
ICAJcmV0dXJuIDA7Cj4gIAo+ICBlcnJfcG9sbF9maW5pOgo+IAoKLS0gClRob21hcyBaaW1tZXJt
YW5uCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
