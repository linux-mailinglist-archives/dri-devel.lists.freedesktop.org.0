Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0C80AFA
	for <lists+dri-devel@lfdr.de>; Sun,  4 Aug 2019 14:38:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E5E89CD8;
	Sun,  4 Aug 2019 12:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1DE089CD8
 for <dri-devel@lists.freedesktop.org>; Sun,  4 Aug 2019 12:38:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86799F85;
 Sun,  4 Aug 2019 14:38:16 +0200 (CEST)
Date: Sun, 4 Aug 2019 15:38:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH 1/2] drm/omap: dmm_tiler: Use dmaengine_prep_dma_memcpy()
 for i878 workaround
Message-ID: <20190804123815.GF4984@pendragon.ideasonboard.com>
References: <20190731094233.13890-1-peter.ujfalusi@ti.com>
 <20190731094233.13890-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731094233.13890-2-peter.ujfalusi@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1564922296;
 bh=TZ/Mm5fZzsQkimbhBK6NPHkJmGJQ9a7Krt9LLJKDHqk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VrWlBbln3WaTTQL43tsQcc7d6jHq2Quo3zbIVZlfW+898gLg+v2LulHF7NV58dz+Y
 6o62C9LBqLZg7HG39F1Q8Uv0M0NYb9Az0dhqqoWKWwYP/sp/zdeWS8hR5mnF4gtu5V
 mSoSA5395Glk6GHD2Mo6dB6bFM0KUCE4+9GSgspE=
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
Cc: airlied@linux.ie, jsarha@ti.com, tomi.valkeinen@ti.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUGV0ZXIsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgSnVsIDMxLCAyMDE5
IGF0IDEyOjQyOjMyUE0gKzAzMDAsIFBldGVyIFVqZmFsdXNpIHdyb3RlOgo+IEluc3RlYWQgb2Yg
ZG1hX2Rldi0+ZGV2aWNlX3ByZXBfZG1hX21lbWNweSgpIHVzZSB0aGUgZXhpc3RpbmcgbWFjcm8g
dG8KPiBwcmVwYXJlIHRoZSBtZW1jcHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgVWpmYWx1
c2kgPHBldGVyLnVqZmFsdXNpQHRpLmNvbT4KClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+Cgo+IC0tLQo+ICBkcml2ZXJzL2dw
dS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jIHwgMyArLS0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBk
cm0vb21hcF9kbW1fdGlsZXIuYwo+IGluZGV4IDI1MmY1ZWJiMWFjYy4uNzc3MjhlYWExYTZmIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZG1tX3RpbGVyLmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RtbV90aWxlci5jCj4gQEAgLTgyLDEy
ICs4MiwxMSBAQCBzdGF0aWMgY29uc3QgdTMyIHJlZ1tdWzRdID0gewo+ICAKPiAgc3RhdGljIGlu
dCBkbW1fZG1hX2NvcHkoc3RydWN0IGRtbSAqZG1tLCBkbWFfYWRkcl90IHNyYywgZG1hX2FkZHJf
dCBkc3QpCj4gIHsKPiAtCXN0cnVjdCBkbWFfZGV2aWNlICpkbWFfZGV2ID0gZG1tLT53YV9kbWFf
Y2hhbi0+ZGV2aWNlOwo+ICAJc3RydWN0IGRtYV9hc3luY190eF9kZXNjcmlwdG9yICp0eDsKPiAg
CWVudW0gZG1hX3N0YXR1cyBzdGF0dXM7Cj4gIAlkbWFfY29va2llX3QgY29va2llOwo+ICAKPiAt
CXR4ID0gZG1hX2Rldi0+ZGV2aWNlX3ByZXBfZG1hX21lbWNweShkbW0tPndhX2RtYV9jaGFuLCBk
c3QsIHNyYywgNCwgMCk7Cj4gKwl0eCA9IGRtYWVuZ2luZV9wcmVwX2RtYV9tZW1jcHkoZG1tLT53
YV9kbWFfY2hhbiwgZHN0LCBzcmMsIDQsIDApOwo+ICAJaWYgKCF0eCkgewo+ICAJCWRldl9lcnIo
ZG1tLT5kZXYsICJGYWlsZWQgdG8gcHJlcGFyZSBETUEgbWVtY3B5XG4iKTsKPiAgCQlyZXR1cm4g
LUVJTzsKCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
