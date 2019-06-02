Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70043237F
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jun 2019 16:11:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4236E892FB;
	Sun,  2 Jun 2019 14:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42CBD892FB
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Jun 2019 14:11:37 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFB5827939;
 Sun,  2 Jun 2019 14:11:36 +0000 (UTC)
Date: Sun, 2 Jun 2019 10:11:35 -0400
From: Sasha Levin <sashal@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH AUTOSEL 4.4 44/56] video: imsttfb: fix potential NULL
 pointer dereferences
Message-ID: <20190602141135.GP12898@sasha-vm>
References: <20190601132600.27427-1-sashal@kernel.org>
 <20190601132600.27427-44-sashal@kernel.org>
 <20190601161929.GA5028@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190601161929.GA5028@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1559484697;
 bh=XWIQtRm3YBgJzMgx47r1GeU6a0hziX3Bayzxz7HYHDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2C6Lsyqjl1lq8cMl5HmJSDmhu68WMgHeXo8d7wvsyLcWYJhTi3LKPzGrDF2N57jni
 RNWBGChMzbkjHSvYFxIzqNjCcgNBi4laBkGooBA61hNXEU13ngYQSa7o5xsteZNDwV
 8n+4BWuAsTcEVS99GcQHNLzJgFGdsGYaHTIessyE=
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, Finn Thain <fthain@telegraphics.com.au>,
 stable@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCBKdW4gMDEsIDIwMTkgYXQgMDk6MTk6MjlBTSAtMDcwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+T24gU2F0LCBKdW4gMDEsIDIwMTkgYXQgMDk6MjU6NDhBTSAtMDQwMCwgU2Fz
aGEgTGV2aW4gd3JvdGU6Cj4+IEZyb206IEthbmdqaWUgTHUgPGtqbHVAdW1uLmVkdT4KPj4KPj4g
WyBVcHN0cmVhbSBjb21taXQgMWQ4NDM1M2QyMDVhOTUzZTIzODEwNDQ5NTNiN2ZhMzFjOGM5NzAy
ZCBdCj4+Cj4+IEluIGNhc2UgaW9yZW1hcCBmYWlscywgdGhlIGZpeCByZWxlYXNlcyByZXNvdXJj
ZXMgYW5kIHJldHVybnMKPj4gLUVOT01FTSB0byBhdm9pZCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBLYW5namllIEx1IDxramx1QHVtbi5lZHU+Cj4+IENj
OiBBZGl0eWEgUGFra2kgPHBha2tpMDAxQHVtbi5lZHU+Cj4+IENjOiBGaW5uIFRoYWluIDxmdGhh
aW5AdGVsZWdyYXBoaWNzLmNvbS5hdT4KPj4gQ2M6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5v
cmc+Cj4+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3Jn
Pgo+PiBbYi56b2xuaWVya2llOiBtaW5vciBwYXRjaCBzdW1tYXJ5IGZpeHVwXQo+PiBTaWduZWQt
b2ZmLWJ5OiBCYXJ0bG9taWVqIFpvbG5pZXJraWV3aWN6IDxiLnpvbG5pZXJraWVAc2Ftc3VuZy5j
b20+Cj4+IFNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KPj4g
LS0tCj4+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2ltc3R0ZmIuYyB8IDUgKysrKysKPj4gIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPgo+V2h5IG9ubHkgNC40Lnk/ICBTaG91bGRuJ3Qg
dGhpcyBiZSBxdWV1ZWQgdXAgZm9yIGV2ZXJ5dGhpbmcgb3Igbm9uZT8KCkl0J3Mgb24gYWxsIGJy
YW5jaGVzLiBTb21ldGhpbmcgd2VpcmQgaGFwcGVuZWQgd2l0aCBnaXQtc2VuZC1lbWFpbCBhbmQK
bWFpbC5rZXJuZWwub3JnLCBhbmQgYXBwYXJlbnRseSB0aGUgcmVzdCBvZiB0aGUgYnJhbmNoZXMg
ZGlkbid0IGdldCBhbGwKdGhlaXIgbWFpbHMgc2VudCBvdXQuIFNhZGx5IEkgZG9uJ3QgaGF2ZSB0
aGUgbG9ncyBmb3IgdGhhdCA6KAoKLS0KVGhhbmtzLApTYXNoYQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
