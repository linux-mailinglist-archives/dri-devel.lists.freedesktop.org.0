Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5538BEFE6F
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 14:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B916E05D;
	Tue,  5 Nov 2019 13:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B15536E8CF
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 00:40:53 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id g9so8512381plp.3
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2019 16:40:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NH6Mp/TMaBiucUkeQscWI4mQOGsiLsHourLQo78kfqY=;
 b=WAgPnUj33kS2Des9PXj1i/h7kpNhu7rToaOYeLwcbVJYokiQ10bJojftWkybKVIGdX
 DDNyyTruND4giOILRNKCQvE0rD44wXSsyug8m+zB+wR9rr+QeR/JT+SNYtuQoJYRGLuM
 ewA4lSf47aeo4R8X7vRwNnfTGE69IEL9sQXq/KORjctvSW7QI0P0rsyifSApv+M2dBLK
 xten918nklPjUNjpJQFQ65xhjYvOqybBXsQWHSJ9eYxg6xrWcPBbd/y9G0q+gP4uIzOV
 BPatBmfHiJX1rktvDU+tOIWDu/CkerJ3RoQHcqxI4947wUoc+O+dbko1W8oXT85aECUa
 8Chg==
X-Gm-Message-State: APjAAAUi+N43HnJEGwT9YvF7QHoSAL8/ICcjW1Mu/FQkgP54TnQqTvln
 AV/568tKN9VeDkANLPYCUCc=
X-Google-Smtp-Source: APXvYqx+5Q4UXBmsh0ZJhAGou536Uk8JpxpxlAhqK1O1BqXfqIe7r+QWdjuZqWIRDfUcDHdWDp6klA==
X-Received: by 2002:a17:902:7084:: with SMTP id
 z4mr29365353plk.15.1572914452984; 
 Mon, 04 Nov 2019 16:40:52 -0800 (PST)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
 by smtp.gmail.com with ESMTPSA id i102sm18000136pje.17.2019.11.04.16.40.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2019 16:40:52 -0800 (PST)
Date: Mon, 4 Nov 2019 16:40:50 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] drm/bridge: ti-tfp410: switch to using
 fwnode_gpiod_get_index()
Message-ID: <20191105004050.GU57214@dtor-ws>
References: <20191014184320.GA161094@dtor-ws>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191014184320.GA161094@dtor-ws>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Approved-At: Tue, 05 Nov 2019 13:29:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NH6Mp/TMaBiucUkeQscWI4mQOGsiLsHourLQo78kfqY=;
 b=BsPxj4exriEWDDIuD6XklU4ucr3XvJPr+KqdCeBAsvBxUXnZOfrDhuAy2JCIXBnDGy
 YdejkP0WG7gbsX2kBY6ff4EP8M2slwkZKun13jpT++xRlUaPMKudi8yUmhG5Bimt9+aA
 GoRJovuaPLMrbRzZhEMVutx/FtICE2iQtpTSEMXGlsryJsYesAVZqg4YobU6cuQkdiAm
 BaxElhQbpievopAtT9NQMwsPx+5oW+ajA08HrDIx8oqc0BOTZruanPCvZoxt9bA/aw28
 KAjlbrNs+m5gmi+38Jrwg8RLsq7yayJohS/4ARwCW9GnSb0hrqihj0vdPxq0FHfy4vy3
 ZzPA==
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMTQsIDIwMTkgYXQgMTE6NDM6MjBBTSAtMDcwMCwgRG1pdHJ5IFRvcm9raG92
IHdyb3RlOgo+IEluc3RlYWQgb2YgZndub2RlX2dldF9uYW1lZF9ncGlvZCgpIHRoYXQgSSBwbGFu
IHRvIGhpZGUgYXdheSwgbGV0J3MgdXNlCj4gdGhlIG5ldyBmd25vZGVfZ3Bpb2RfZ2V0X2luZGV4
KCkgdGhhdCBtaW1pY3MgZ3Bpb2RfZ2V0X2luZGV4KCksIGJ1dAo+IHdvcmtzIHdpdGggYXJiaXRy
YXJ5IGZpcm13YXJlIG5vZGUuCj4gCj4gUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkg
VG9yb2tob3YgPGRtaXRyeS50b3Jva2hvdkBnbWFpbC5jb20+Cj4gLS0tCj4gCj4gQW5kcnplaiwg
TmVpbCwKPiAKPiBUaGlzIGRlcGVuZHMgb24gdGhlIG5ldyBjb2RlIHRoYXQgY2FuIGJlIGJvdW5k
IGluCj4gaWItZndub2RlLWdwaW9kLWdldC1pbmRleCBpbW11dGFibGUgYnJhbmNoIG9mIExpbnVz
JyBXYWxsZWlqIHRyZWU6Cj4gCj4gICAgICAgICBnaXQgcHVsbCBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbGludXN3L2xpbnV4LWdwaW8uZ2l0IGliLWZ3bm9k
ZS1ncGlvZC1nZXQtaW5kZXgKPiAKPiBJIGhvcGUgdGhhdCBpdCB3b3VsZCBiZSBwb3NzaWJsZSB0
byBwdWxsIGluIHRoaXMgaW1tdXRhYmxlIGJyYW5jaCBhbmQKPiBub3Qgd2FpdCB1bnRpbCBhZnRl
ciA1LjUgbWVyZ2Ugd2luZG93LCBvciwgYWx0ZXJuYXRpdmVseSwgbWVyZ2UgdGhyb3VnaAo+IExp
bnVzIFdhbGxlaWoncyB0cmVlLgoKQW55IGNoYW5jZSB0aGlzIGNvdWxkIGJlIG1lcmdlZCwgcGxl
YXNlPwoKPiAKPiBUaGFua3MhCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEw
LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAu
YyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEwLmMKPiBpbmRleCBhYTMxOThkYzk5
MDMuLjZmNmQ2ZDFlNjBhZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Rp
LXRmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90aS10ZnA0MTAuYwo+IEBA
IC0yODUsOCArMjg1LDggQEAgc3RhdGljIGludCB0ZnA0MTBfZ2V0X2Nvbm5lY3Rvcl9wcm9wZXJ0
aWVzKHN0cnVjdCB0ZnA0MTAgKmR2aSkKPiAgCWVsc2UKPiAgCQlkdmktPmNvbm5lY3Rvcl90eXBl
ID0gRFJNX01PREVfQ09OTkVDVE9SX0RWSUQ7Cj4gIAo+IC0JZHZpLT5ocGQgPSBmd25vZGVfZ2V0
X25hbWVkX2dwaW9kKCZjb25uZWN0b3Jfbm9kZS0+Zndub2RlLAo+IC0JCQkJCSJocGQtZ3Bpb3Mi
LCAwLCBHUElPRF9JTiwgImhwZCIpOwo+ICsJZHZpLT5ocGQgPSBmd25vZGVfZ3Bpb2RfZ2V0X2lu
ZGV4KCZjb25uZWN0b3Jfbm9kZS0+Zndub2RlLAo+ICsJCQkJCSAgImhwZCIsIDAsIEdQSU9EX0lO
LCAiaHBkIik7Cj4gIAlpZiAoSVNfRVJSKGR2aS0+aHBkKSkgewo+ICAJCXJldCA9IFBUUl9FUlIo
ZHZpLT5ocGQpOwo+ICAJCWR2aS0+aHBkID0gTlVMTDsKPiAtLSAKPiAyLjIzLjAuNzAwLmc1NmNm
NzY3YmRiLWdvb2cKPiAKPiAKPiAtLSAKPiBEbWl0cnkKCi0tIApEbWl0cnkKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
