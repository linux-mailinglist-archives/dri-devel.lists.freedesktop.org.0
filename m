Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9393529EE07
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 15:21:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF846ECE5;
	Thu, 29 Oct 2020 14:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFBB16ECDF;
 Thu, 29 Oct 2020 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id C7340FB03;
 Thu, 29 Oct 2020 15:20:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id otyjLY3P_joj; Thu, 29 Oct 2020 15:20:57 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 3FEC344637; Thu, 29 Oct 2020 15:20:57 +0100 (CET)
From: =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 0/2] drm: etnaviv: Unmap gems on gem_close
Date: Thu, 29 Oct 2020 15:20:55 +0100
Message-Id: <cover.1603981111.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1603979517.git.agx@sigxcpu.org>
References: <cover.1603979517.git.agx@sigxcpu.org>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBtZWFudCBhcyBhIFJGQyBzaW5jZSBpJ20gbm90IHN1cmUgaWYgdGhpcyBpcyB0aGUg
cmlnaHQKd2F5IHRvIGZpeCB0aGUgcHJvYmxlbToKClNvIGZhciB0aGUgdW5tYXAgZnJvbSBncHUg
YWRkcmVzcyBzcGFjZSBvbmx5IGhhcHBlbmVkIHdoZW4gZHJvcHBpbmcgdGhlCmxhc3QgcmVmIGlu
IGdlbV9mcmVlX29iamVjdF91bmxvY2tlZCwgaG93ZXZlciB0aGF0IGlzIHNraXBwZWQgaWYgdGhl
cmUncwpzdGlsbCBtdWx0aXBsZSBoYW5kbGVzIHRvIHRoZSBzYW1lIEdFTSBvYmplY3QuCgpTaW5j
ZSB1c2Vyc3BhY2UgKGhlcmUgbWVzYSkgaW4gdGhlIGNhc2Ugb2Ygc29mdHBpbiBoYW5kcyBiYWNr
IHRoZSBtZW1vcnkKcmVnaW9uIHRvIHRoZSBwb29sIG9mIGF2YWlsYWJsZSBHUFUgdmlydHVhbCBt
ZW1vcnkgY2xvc2luZyB0aGUgaGFuZGxlCnZpYSBEUk1fSU9DVExfR0VNX0NMT1NFIHRoaXMgY2Fu
IGxlYWQgdG8gZXRuYXZpdl9pb21tdV9pbnNlcnRfZXhhY3QKZmFpbGluZyBsYXRlciBzaW5jZSB1
c2Vyc3BhY2UgdGhpbmtzIHRoZSB2YWRkciBpcyBhdmFpbGFibGUgd2hpbGUgdGhlCmtlcm5lbCB0
aGlua3MgaXQgaXNuJ3QgbWFraW5nIHRoZSBzdWJtaXQgZmFpbCBsaWtlCgogICAgIFtFXSBzdWJt
aXQgZmFpbGVkOiAtMTQgKE5vIHNwYWNlIGxlZnQgb24gZGV2aWNlKSAoZXRuYV9jbWRfc3RyZWFt
X2ZsdXNoOjI0NCkKCkZpeCB0aGlzIGJ5IHVubWFwcGluZyB0aGUgbWVtb3J5IHZpYSB0aGUgLmdl
bV9jbG9zZV9vYmplY3QgY2FsbGJhY2suCgpUaGUgcGF0Y2ggaXMgYWdhaW5zdCA1LjkgYW5kIHdp
bGwgbmVlZCB0byBiZSByZWRvbmUgZm9yIGRybS1taXNjLW5leHQgZHVlIHRvCnRoZSBjb252ZXJz
aW9uIHRvIEdFTSBvYmplY3QgZnVuY3Rpb25zIGJ1dCBpJ20gaGFwcHkgdG8gZG8gdGhhdCBpdCBs
b29rcyBsaWtlCnRoZSByaWdodCBhcHByb2FjaC4KCkkgY2FuIHRyaWdnZXIgdGhlIHByb2JsZW0g
d2hlbiBwbHVnZ2luZy91bnBsdWdnaW5nIGEgRFAgc2NyZWVuIGRyaXZlbiBieSBEQ1NTCndoaWxl
IERTSSBpcyBkcml2ZW4gYnkgbXhzZmIuIEl0IHByZWZlcmFibHkgaGFwcGVucyB3aXRoIDRrIHNp
bmNlIHRoaXMKYWxsb2NhdGVzIGJpZ2dlciBjaHVua3MuCgpJIGFsc28gZm9sZGVkIGluIGEgY29t
bWl0IGNoZWNraW5nIGZvciB0aGUgY29udGV4dC0+bG9jayBpbgpldG5hdml2X2lvbW11X2luc2Vy
dF9leGFjdCBhbmQgZXRuYXZpdl9pb21tdV9yZW1vdmVfbWFwcGluZyB0b28gdG8gbWFrZSBpdApt
YXRjaCBldG5hdml2X2lvbW11X2ZpbmRfaW92YS4KClRvOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT4sUnVzc2VsbCBLaW5nIDxsaW51eCtldG5hdml2QGFybWxpbnV4Lm9yZy51
az4sQ2hyaXN0aWFuIEdtZWluZXIgPGNocmlzdGlhbi5nbWVpbmVyQGdtYWlsLmNvbT4sRGF2aWQg
QWlybGllIDxhaXJsaWVkQGxpbnV4LmllPixEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+
LGV0bmF2aXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnLCBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCgpHdWlkbyBHw7xudGhlciAoMik6CiAgZHJtOiBldG5hdml2OiBBZGQgbG9ja2RlcCBh
bm5vdGF0aW9ucyBmb3IgY29udGV4dCBsb2NrCiAgZHJtOiBldG5hdml2OiBVbm1hcCBnZW1zIG9u
IGdlbV9jbG9zZQoKIGRyaXZlcnMvZ3B1L2RybS9ldG5hdml2L2V0bmF2aXZfZHJ2LmMgfCAgMSAr
CiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5oIHwgIDEgKwogZHJpdmVycy9n
cHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW0uYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwogZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9tbXUuYyB8ICA0ICsrKysKIDQg
ZmlsZXMgY2hhbmdlZCwgMzggaW5zZXJ0aW9ucygrKQoKLS0gCjIuMjguMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
