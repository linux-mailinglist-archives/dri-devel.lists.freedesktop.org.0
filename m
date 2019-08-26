Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D76EF9CFFA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC83389CF5;
	Mon, 26 Aug 2019 13:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309AF89CB2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 13:01:54 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57660
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1i2Ed5-0003H5-Vb; Mon, 26 Aug 2019 15:01:51 +0200
Subject: Re: [PATCH] drm/tinydrm: fix a loop in debugfs code
To: Dan Carpenter <dan.carpenter@oracle.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20190821072456.GJ26957@mwanda>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <9718fea0-49f0-34d4-b1fc-f69e99b7a690@tronnes.org>
Date: Mon, 26 Aug 2019 15:01:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190821072456.GJ26957@mwanda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=H3jtYoxQ3XbExd4HXxnlQvVgu8Q+804xJ3Zv6QomKsc=; 
 b=QcPt9n10uj1n1YO1WbjMh9PgJkNhqP834sq4Y+F1CcoMwuV3L1/USnK95lBTe/rYf9AfQ6ICYnr5E9Zp8bZijzp6A6F4/92fmKGaBw+SJ7jtFwSD3JYXpkEmt9M4SKQ9FPib8x9ZjTotjBUn3O0GGqJAL4Pprfk1Dn4iAgQkbmFvWmkwvoFQ/KIMI46fNSyF0gXSRV0ytrNsRephR8hKeHNUGwdjBINyMtKFll8qtWVlTtPp1sRdEu60y4Goh3RAzT5A8RtTqf/P4rMzhcK/mDPxRhhsb0OSO8pRLwxowa4uIuLkYnDVNVaGoBrJIh3IGBAkNyYLiRmJTe6E4KcHsQ==;
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjEuMDguMjAxOSAwOS4yNCwgc2tyZXYgRGFuIENhcnBlbnRlcjoKPiBUaGlzIGNvZGUg
d2lsbCBsaWtlbHkgY3Jhc2ggaWYgd2UgdHJ5IHRvIGRvIGEgemVybyBieXRlIHdyaXRlLiAgVGhl
IGNvZGUKPiBsb29rcyBsaWtlIHRoaXM6Cj4gCj4gICAgICAgICAvKiBzdHJpcCB0cmFpbGluZyB3
aGl0ZXNwYWNlICovCj4gICAgICAgICBmb3IgKGkgPSBjb3VudCAtIDE7IGkgPiAwOyBpLS0pCj4g
ICAgICAgICAgICAgICAgIGlmIChpc3NwYWNlKGJ1ZltpXSkpCj4gCQkJLi4uCj4gCj4gV2UncmUg
d3JpdGluZyB6ZXJvIGJ5dGVzIHNvIGNvdW50ID0gMC4gIFlvdSB3b3VsZCB0aGluayB0aGF0ICJj
b3VudCAtIDEiCj4gd291bGQgYmUgbmVnYXRpdmUgb25lLCBidXQgYmVjYXVzZSAiaSIgaXMgdW5z
aWduZWQgaXQgaXMgYSBsYXJnZQo+IHBvc2l0aXZlIG51bWVyIGluc3RlYWQuICBUaGUgImkgPiAw
IiBjb25kaXRpb24gaXMgdHJ1ZSBhbmQgdGhlICJidWZbaV0iCj4gYWNjZXNzIHdpbGwgYmUgb3V0
IG9mIGJvdW5kcy4KPiAKPiBUaGUgZml4IGlzIHRvIG1ha2UgImkiIHNpZ25lZCBhbmQgbm93IGV2
ZXJ5dGhpbmcgd29ya3MgYXMgZXhwZWN0ZWQuICBUaGUKPiB1cHBlciBib3VuZCBvZiAiY291bnQi
IGlzIGNhcHBlZCBpbiBfX2tlcm5lbF93cml0ZSgpIGF0IE1BWF9SV19DT1VOVCBzbwo+IHdlIGRv
bid0IGhhdmUgdG8gd29ycnkgYWJvdXQgaXQgYmVpbmcgaGlnaGVyIHRoYW4gSU5UX01BWC4KPiAK
PiBGaXhlczogMDJkZDk1ZmUzMTY5ICgiZHJtL3Rpbnlkcm06IEFkZCBNSVBJIERCSSBzdXBwb3J0
IikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5j
b20+Cj4gLS0tCgpUaGFua3MgRGFuLCBhcHBsaWVkIHRvIGRybS1taXNjLW5leHQgd2l0aCBhZGp1
c3RlZCB0aXRsZToKLWRybS90aW55ZHJtOiBmaXggYSBsb29wIGluIGRlYnVnZnMgY29kZQorZHJt
L21pcGktZGJpOiBmaXggYSBsb29wIGluIGRlYnVnZnMgY29kZQoKTm9yYWxmLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
