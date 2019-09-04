Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81E7A816C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 13:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C30898C4;
	Wed,  4 Sep 2019 11:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2648A898C4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 11:51:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (mobile-access-bceeb5-228.dhcp.inet.fi [188.238.181.228])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A1CE3440;
 Wed,  4 Sep 2019 13:51:03 +0200 (CEST)
Date: Wed, 4 Sep 2019 14:50:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm: panel-lvds: Potential Oops in probe error handling
Message-ID: <20190904115057.GC4811@pendragon.ideasonboard.com>
References: <20190904100329.GE7007@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904100329.GE7007@mwanda>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1567597863;
 bh=J3hwPwoYhAyLjnMAABtRRMdtjX9XTxkKUkoIsIWChTU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TS4TkaFmSUfACpth0zQfjpo/b7eb61QAnLvwXDJiN7i7EhGzyi8l6atUEU30/Uu0v
 jy/prfgfAkmEdcv6shKJHo7U67wX+e5hyYE6FP6W13YJ1HAJeky6u3zIKoU3xjPlI8
 4XEWlGMyQJfjMDRWmjaEQy/1pdVuLCnvKKyTz7GY=
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBXZWQsIFNlcCAwNCwgMjAxOSBh
dCAwMTowMzoyOVBNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+IFRoZSAibHZkcy0+YmFj
a2xpZ2h0IiBwb2ludGVyIGNvdWxkIGJlIE5VTGwgaWYgb2ZfcGFyc2VfcGhhbmRsZSgpCj4gcmV0
dXJucyBOVUxMLgo+IAo+IEZpeGVzOiA3YzlkZmY1YmQ2NDMgKCJkcm06IHBhbmVsczogQWRkIExW
RFMgcGFuZWwgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1s
dmRzLmMgfCAzICsrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtbHZkcy5jCj4gaW5kZXggYWQ0N2NjOTU0
NTllLi4zYjRlYjk1OWU5OTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3Bh
bmVsLWx2ZHMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1sdmRzLmMKPiBA
QCAtMjcyLDcgKzI3Miw4IEBAIHN0YXRpYyBpbnQgcGFuZWxfbHZkc19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBlcnJvcjoKPiAtCXB1dF9k
ZXZpY2UoJmx2ZHMtPmJhY2tsaWdodC0+ZGV2KTsKPiArCWlmIChsdmRzLT5iYWNrbGlnaHQpCj4g
KwkJcHV0X2RldmljZSgmbHZkcy0+YmFja2xpZ2h0LT5kZXYpOwoKSG93IGFib3V0IHNpbXBseQoK
LQlwdXRfZGV2aWNlKCZsdmRzLT5iYWNrbGlnaHQtPmRldik7CisJYmFja2xpZ2h0X3B1dChsdmRz
LT5iYWNrbGlnaHQpOwoKPwoKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAgCgotLSAKUmVnYXJkcywK
CkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
