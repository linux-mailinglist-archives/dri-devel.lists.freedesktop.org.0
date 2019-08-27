Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9CD9DA46
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 02:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A74C89EBB;
	Tue, 27 Aug 2019 00:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1417F89EBB
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 00:05:26 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2532931B;
 Tue, 27 Aug 2019 02:05:24 +0200 (CEST)
Date: Tue, 27 Aug 2019 03:05:17 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Message-ID: <20190827000517.GC5274@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-15-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-15-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566864324;
 bh=Jkzf9ucXI/EfCdTUo0LbDuJ5qhZF+9L/kEIa24X2Tv8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t+vusSJPglqdjBfFrg/feSwydVrUj5uKYIA85z7FIg6xXNVT2amlpCXKJJGH0DECj
 PBogkAmD4v8eD01HfOrBI8p5pOZ7pIOt5dNTblMbHrYwUV/QUymYYOz2Go0VXiO477
 pq1FqAXVM1yc9Glvm/LhUDaVmSRR2WLTNorjvj2Q=
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
Cc: muroya@ksk.co.jp, uli@fpond.eu, horms@verge.net.au,
 VenkataRajesh.Kalakodima@in.bosch.com, airlied@linux.ie,
 koji.matsuoka.xm@renesas.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFjb3BvLAoKKFF1ZXN0aW9uIGZvciBEYW5pZWwgYmVsb3cpCgpUaGFuayB5b3UgZm9yIHRo
ZSBwYXRjaC4KCk9uIFN1biwgQXVnIDI1LCAyMDE5IGF0IDAzOjUxOjU0UE0gKzAyMDAsIEphY29w
byBNb25kaSB3cm90ZToKPiBXaGVuIHJlc3VtaW5nIGZyb20gc3lzdGVtIHN1c3BlbmQsIHRoZSBE
VSBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yCj4gcmVwcm9ncmFtbWluZyBhbmQgZW5hYmxpbmcg
dGhlIENNTSB1bml0IGlmIGl0IHdhcyBpbiB1c2UgYXQgdGhlIHRpbWUKPiB0aGUgc3lzdGVtIGVu
dGVyZWQgdGhlIHN1c3BlbmQgc3RhdGUuCj4gCj4gRm9yY2UgdGhlIGNvbG9yX21nbXRfY2hhbmdl
ZCBmbGFnIHRvIHRydWUgaWYgYW55IG9mIHRoZSBEUk0gY29sb3IKPiB0cmFuc2Zvcm1hdGlvbiBw
cm9wZXJ0aWVzIHdhcyBzZXQgaW4gdGhlIENSVEMgc3RhdGUgZHVwbGljYXRlZCBhdAo+IHN1c3Bl
bmQgdGltZSwgYXMgdGhlIENNTSBnZXRzIHJlcHJvZ3JhbW1lZCBvbmx5IGlmIHNhaWQgZmxhZyBp
cyBhY3RpdmUgaW4KPiB0aGUgcmNhcl9kdV9hdG9taWNfY29tbWl0X3VwZGF0ZV9jbW0oKSBtZXRo
b2QuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9u
ZGkub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCj4gaW5kZXggMDE4NDgw
YThmMzVjLi42ZTM4NDk1ZmI3OGYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXIt
ZHUvcmNhcl9kdV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
ZHJ2LmMKPiBAQCAtMTcsNiArMTcsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICAj
aW5jbHVkZSA8bGludXgvd2FpdC5oPgo+ICAKPiArI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljLmg+
Cj4gICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4KPiAgI2luY2x1ZGUgPGRybS9k
cm1fZmJfY21hX2hlbHBlci5oPgo+ICAjaW5jbHVkZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4KPiBA
QCAtNDgyLDYgKzQ4MywyNiBAQCBzdGF0aWMgaW50IHJjYXJfZHVfcG1fc3VzcGVuZChzdHJ1Y3Qg
ZGV2aWNlICpkZXYpCj4gIHN0YXRpYyBpbnQgcmNhcl9kdV9wbV9yZXN1bWUoc3RydWN0IGRldmlj
ZSAqZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgcmNhcl9kdV9kZXZpY2UgKnJjZHUgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiArCXN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSA9IHJjZHUtPmRk
ZXYtPm1vZGVfY29uZmlnLnN1c3BlbmRfc3RhdGU7Cj4gKwl1bnNpZ25lZCBpbnQgaTsKPiArCj4g
Kwlmb3IgKGkgPSAwOyBpIDwgcmNkdS0+bnVtX2NydGNzOyArK2kpIHsKPiArCQlzdHJ1Y3QgZHJt
X2NydGMgKmNydGMgPSAmcmNkdS0+Y3J0Y3NbaV0uY3J0YzsKPiArCQlzdHJ1Y3QgZHJtX2NydGNf
c3RhdGUgKmNydGNfc3RhdGU7Cj4gKwo+ICsJCWNydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9l
eGlzdGluZ19jcnRjX3N0YXRlKHN0YXRlLCBjcnRjKTsKPiArCQlpZiAoIWNydGNfc3RhdGUpCj4g
KwkJCWNvbnRpbnVlOwoKU2hvdWxkbid0IHlvdSBnZXQgdGhlIG5ldyBzdGF0ZSBoZXJlID8KCj4g
Kwo+ICsJCS8qCj4gKwkJICogRm9yY2UgcmUtZW5hYmxlbWVudCBvZiBDTU0gYWZ0ZXIgc3lzdGVt
IHJlc3VtZSBpZiBhbnkKPiArCQkgKiBvZiB0aGUgRFJNIGNvbG9yIHRyYW5zZm9ybWF0aW9uIHBy
b3BlcnRpZXMgd2FzIHNldCBpbgo+ICsJCSAqIHRoZSBzdGF0ZSBzYXZlZCBhdCBzeXN0ZW0gc3Vz
cGVuZCB0aW1lLgo+ICsJCSAqLwo+ICsJCWlmIChjcnRjX3N0YXRlLT5nYW1tYV9sdXQgfHwgY3J0
Y19zdGF0ZS0+ZGVnYW1tYV9sdXQgfHwKPiArCQkgICAgY3J0Y19zdGF0ZS0+Y3RtKQoKV2UgZG9u
J3Qgc3VwcG9ydCBkZWdhbW1hX2x1dCBvciBjcm0sIHNvIEkgd291bGQgZHJvcCB0aG9zZS4KCldp
dGggdGhlc2Ugc21hbGwgaXNzdWVzIGFkZHJlc3NlZCwKClJldmlld2VkLWJ5OiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CgpTaG91bGRuJ3Qgd2Ug
aG93ZXZlciBzcXVhc2ggdGhpcyB3aXRoIHRoZSBwcmV2aW91cyBwYXRjaCB0byBhdm9pZApiaXNl
Y3Rpb24gaXNzdWVzID8KCj4gKwkJCWNydGNfc3RhdGUtPmNvbG9yX21nbXRfY2hhbmdlZCA9IHRy
dWU7CgpEYW5pZWwsIGlzIHRoaXMgc29tZXRoaW5nIHRoYXQgd291bGQgbWFrZSBzZW5zZSBpbiB0
aGUgS01TIGNvcmUgKG9yCmhlbHBlcnMpID8KCj4gKwl9Cj4gIAo+ICAJcmV0dXJuIGRybV9tb2Rl
X2NvbmZpZ19oZWxwZXJfcmVzdW1lKHJjZHUtPmRkZXYpOwo+ICB9CgotLSAKUmVnYXJkcywKCkxh
dXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
