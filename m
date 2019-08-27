Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A11CF9E026
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 10:00:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B16C898D9;
	Tue, 27 Aug 2019 08:00:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5B25898D9
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 08:00:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E6772F0;
 Tue, 27 Aug 2019 10:00:53 +0200 (CEST)
Date: Tue, 27 Aug 2019 11:00:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2 15/50] drm/bridge: tfp410: Replace manual connector
 handling with bridge
Message-ID: <20190827080045.GE5054@pendragon.ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-16-laurent.pinchart@ideasonboard.com>
 <9ca1ccf0-eb37-8012-ce6e-4f7e4b47d39e@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ca1ccf0-eb37-8012-ce6e-4f7e4b47d39e@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566892853;
 bh=2oa4FdjmEAEgyVHFswUSwgHxoawQBh9ap86agq1yags=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7LqNQnoxJyelYi7OA59X4uqWR4mRbKzm0Dzhx35ROgtgtgimL3NyT/AMDo01dkZp
 o8BoTltdQhHFTd3DxZL1XC3gb36T5xIZfOXZkFye3h5p1hioDZFegcpRoTibOsdlwg
 0aBBG5jU/6u0uHS4C7O+CXdQlIppbllBcDXQ+fNQ=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKCk9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDEwOjQzOjE1QU0gKzAzMDAsIFRvbWkg
VmFsa2VpbmVuIHdyb3RlOgo+IE9uIDIwLzA4LzIwMTkgMDQ6MTYsIExhdXJlbnQgUGluY2hhcnQg
d3JvdGU6Cj4gPiBOb3cgdGhhdCBhIGRyaXZlciBpcyBhdmFpbGFibGUgZm9yIGRpc3BsYXkgY29u
bmVjdG9ycywgcmVwbGFjZSB0aGUKPiA+IG1hbnVhbCBjb25uZWN0b3IgaGFuZGxpbmcgY29kZSB3
aXRoIHVzYWdlIG9mIHRoZSBEUk0gYnJpZGdlIEFQSS4gVGhlCj4gPiB0ZnA0MTAgZHJpdmVyIGRv
ZXNuJ3QgZGVhbCB3aXRoIHRoZSBkaXNwbGF5IGNvbm5lY3RvciBkaXJlY3RseSBhbnltb3JlLAo+
ID4gYnV0IHN0aWxsIGRlbGVnYXRlcyBkcm1fY29ubmVjdG9yIG9wZXJhdGlvbnMgdG8gdGhlIG5l
eHQgYnJpZGdlLiBUaGlzCj4gPiBicmluZ3MgdXMgb25lIHN0ZXAgY2xvc2VyIHRvIGhhdmluZyB0
aGUgdGZwNDEwIGRyaXZlciBoYW5kbGluZyB0aGUKPiA+IFRGUDQxMCBvbmx5Lgo+IAo+IFRoZSBu
ZXh0IHN0ZXAgd2lsbCBkcm9wIHRob3NlIGhwZCByZWxhdGVkIGRlbGF5ZWQgd29ya3M/IFRoZXkg
bG9vayAKPiBwcmV0dHkgdWdseSA9KS4KClllc24gYWxsIHRoZSBjb25uZWN0b3ItcmVsYXRlZCBj
b2RlIHdpbGwgZGlzYXBwZWFyIG9uY2UgdXNlcnMgb2YgdGhlClRGUDQxMCB3aWxsIHN3aXRjaCB0
byB0aGUgbmV3IG1vZGVsLgoKPiA+ICsJZHZpLT5icmlkZ2UudHlwZSA9IERSTV9NT0RFX0NPTk5F
Q1RPUl9EVklEOwo+IAo+IFRoaXMgaXMgbm90IHRoZSBjb25uZWN0b3IgdHlwZSBzZWVuIGJ5IHVz
ZXJzcGFjZSwgaXMgaXQ/IEkgaGF2ZSBuZXZlciAKPiBzZWVuIGEgYm9hcmQgdXNlIFRGUDQxMCB3
aXRoIGEgRFZJIGNvbm5lY3Rvci4uLgoKVGhlIGNvbm5lY3RvciB0eXBlIHJlcG9ydGVkIHRvIHVz
ZXJzcGFjZSBjb21lcyBmcm9tIHRoZSBIRE1JIGNvbm5lY3RvcgpEVCBub2RlLCBzbyBkdmktPmJy
aWRnZS50eXBlIGlzbid0IHZlcnkgcmVsZXZhbnQgdGhlcmUuIEkndmUgc2V0IGl0IHRvCkRWSUQg
dG8gbWF0Y2ggdGhlIGhhcmR3YXJlLgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
