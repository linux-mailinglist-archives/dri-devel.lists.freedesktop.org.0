Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6772428694B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 22:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41E6E9AB;
	Wed,  7 Oct 2020 20:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546EE6E9AB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 20:43:22 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7e285c0000>; Wed, 07 Oct 2020 13:43:08 -0700
Received: from [10.2.85.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 20:43:12 +0000
Subject: Re: [PATCH 02/13] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-3-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <399490f0-7738-db0b-9ed4-2510d4ea8379@nvidia.com>
Date: Wed, 7 Oct 2020 13:43:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007164426.1812530-3-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602103388; bh=ZH2IidqacoMSnuzYghwbg6WDl/o5t7oHmVOXu9c1F+k=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=jXusZWpBkQ1E6jLC+qdDyvRga2/qZ6wGf4TnjYxb2V9EXcRc1zvX7XvzMN/x2XmRV
 amUuUeUpijEytDz23vQicMFFvEDWq9xPU19Z/hHbG+VwmOaASLw1wXJUhec1jkmflu
 JvxzAxQeYwLjgNiZTXC2Edy+0UqxsOxdmjaWFkJug7jWAt82v682QL7yxYxxxTiqYh
 BN2Ra7ou6K3nD/FomQD0uDqVCLol8vmay1Bzkqs35TZglYx3LGw/EP4RnDtgkk8ato
 6xAqVBz0QhxejE3t4KSvuT1TRFuosStCVtPLNr9nfU343+HPTrXAP2pZOBPMrqIVbo
 ASkFmOgWvs3mw==
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Seung-Woo
 Kim <sw0312.kim@samsung.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Andrew
 Morton <akpm@linux-foundation.org>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8yMCA5OjQ0IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZSBleHlub3MgZzJk
IGludGVyZmFjZSBpcyB2ZXJ5IHVudXN1YWwsIGJ1dCBpdCBsb29rcyBsaWtlIHRoZQo+IHVzZXJw
dHIgb2JqZWN0cyBhcmUgcGVyc2lzdGVudC4gSGVuY2UgdGhleSBuZWVkIEZPTExfTE9OR1RFUk0u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5j
b20+Cj4gQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgo+IENjOiBJbmtpIERhZSA8
aW5raS5kYWVAc2Ftc3VuZy5jb20+Cj4gQ2M6IEpvb255b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBz
YW1zdW5nLmNvbT4KPiBDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4K
PiBDYzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4KPiBDYzogS3Vr
amluIEtpbSA8a2dlbmVAa2VybmVsLm9yZz4KPiBDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24u
b3JnPgo+IENjOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gQ2M6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6Pgo+IENjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KPiBDYzog
bGludXgtbW1Aa3ZhY2sub3JnCj4gQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IENjOiBsaW51eC1zYW1zdW5nLXNvY0B2Z2VyLmtlcm5lbC5vcmcKPiBDYzogbGludXgt
bWVkaWFAdmdlci5rZXJuZWwub3JnCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZzJkLmMgfCAzICsrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJk
LmMKPiBpbmRleCBjODNmNmZhYWM5ZGUuLjUxNGZkMDAwZmViMSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKPiBAQCAtNDc4LDcgKzQ3OCw4IEBAIHN0YXRpYyBk
bWFfYWRkcl90ICpnMmRfdXNlcnB0cl9nZXRfZG1hX2FkZHIoc3RydWN0IGcyZF9kYXRhICpnMmQs
Cj4gICAJCWdvdG8gZXJyX2ZyZWU7Cj4gICAJfQo+ICAgCj4gLQlyZXQgPSBwaW5fdXNlcl9wYWdl
c19mYXN0KHN0YXJ0LCBucGFnZXMsIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAo+ICsJcmV0ID0g
cGluX3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnBhZ2VzLAo+ICsJCQkJICBGT0xMX0ZPUkNFIHwg
Rk9MTF9XUklURSB8IEZPTExfTE9OR1RFUk0sCj4gICAJCQkJICBnMmRfdXNlcnB0ci0+cGFnZXMp
Owo+ICAgCWlmIChyZXQgIT0gbnBhZ2VzKSB7Cj4gICAJCURSTV9ERVZfRVJST1IoZzJkLT5kZXYs
Cj4gCgpMb29rcyBnb29kIGZyb20gYSBwaW5fdXNlcl9wYWdlc19mYXN0KCkgcG9pbnQgb2Ygdmll
dy4gSSdtIG9mIGNvdXJzZSBub3QgYSBleHlub3MKZGV2ZWxvcGVyLCBzbyB3ZSBzdGlsbCBuZWVk
IGEgbG9vayBmcm9tIG9uZSBvZiB0aG9zZSwgaWRlYWxseSwgYnV0OgoKUmV2aWV3ZWQtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFy
ZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
