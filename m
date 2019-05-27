Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D86822AF58
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 09:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BECC898C0;
	Mon, 27 May 2019 07:22:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A110898C0;
 Mon, 27 May 2019 07:22:47 +0000 (UTC)
Received: from localhost (unknown [84.241.203.246])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DEB4C21721;
 Mon, 27 May 2019 07:22:46 +0000 (UTC)
Date: Mon, 27 May 2019 09:22:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LKML <linux-kernel@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jens Frederich <jfrederich@gmail.com>, Daniel Drake <dsd@laptop.org>,
 Jon Nettleton <jon.nettleton@gmail.com>
Subject: Re: [PATCH 14/33] staging/olpc: lock_fb_info can't fail
Message-ID: <20190527072243.GC7997@kroah.com>
References: <20190524085354.27411-1-daniel.vetter@ffwll.ch>
 <20190524085354.27411-15-daniel.vetter@ffwll.ch>
 <20190527071010.GK21222@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190527071010.GK21222@phenom.ffwll.local>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1558941767;
 bh=1cA0cnInqvTzulrpX7d6hXfocOLgpBBrZG8Ny9ZxLfk=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=ceREux1QwTsso3dG4v3GF5RI6RERXGAx5Pkm03bCgLmj01YUcOYonXcmpkIeVTfw3
 tDtqyFmhoJoX1Nfm6GyRLl/bcYPP3pYUtr8lxGIjz4x5hi8x2nwzGEaCdGKbirpqf1
 icAfoPLCCpNRl/tP4xPiiB4c+OwZ4V+xOikYIHbc=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjcsIDIwMTkgYXQgMDk6MTA6MTBBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE1heSAyNCwgMjAxOSBhdCAxMDo1MzozNUFNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gU2ltcGx5IGJlY2F1c2Ugb2xwYyBuZXZlciB1bnJlZ2lzdGVycyB0
aGUgZGFtbiB0aGluZy4gSXQgYWxzbwo+ID4gcmVnaXN0ZXJzIHRoZSBmcmFtZWJ1ZmZlciBkaXJl
Y3RseSBieSBwb2tpbmcgYXJvdW5kIGluIGZiZGV2Cj4gPiBjb3JlIGludGVybmFscywgc28gaXQn
cyBhbGwgYXJvdW5kIHJhdGhlciBicm9rZW4uCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IERhbmll
bCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBDYzogSmVucyBGcmVkZXJpY2gg
PGpmcmVkZXJpY2hAZ21haWwuY29tPgo+ID4gQ2M6IERhbmllbCBEcmFrZSA8ZHNkQGxhcHRvcC5v
cmc+Cj4gPiBDYzogSm9uIE5ldHRsZXRvbiA8am9uLm5ldHRsZXRvbkBnbWFpbC5jb20+Cj4gCj4g
SGkgR3JlZywKPiAKPiBTb21laG93IGdldF9tYWludGFpbmVycyBkaWRuJ3QgcGljayB5b3UgdXAg
Zm9yIHRoaXMuIEFjayBmb3IgbWVyZ2luZyB0aGlzCj4gdGhyb3VnaCBkcm0vZmJkZXY/IEl0J3Mg
cGFydCBvZiBhIGJpZ2dlciBzZXJpZXMgdG8gcmV3b3JrIGZiZGV2L2ZiY29uCj4gaW50ZXJhY3Rp
b25zLgoKQWdhaW4sIGFsbCBnb29kIGZvciB5b3UgdG8gdGFrZToKCkFja2VkLWJ5OiBHcmVnIEty
b2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
