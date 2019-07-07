Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6629F6153B
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 16:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D639289801;
	Sun,  7 Jul 2019 14:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D1D89801
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 14:25:35 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:61619
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hk86f-0001hs-WD; Sun, 07 Jul 2019 16:25:34 +0200
Subject: Re: [PATCH v2 2/6] drm/fb-helper: Map DRM client buffer only when
 required
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch, kraxel@redhat.com, maarten.lankhorst@linux.intel.com,
 maxime.ripard@bootlin.com, sean@poorly.run, sam@ravnborg.org,
 yc_chen@aspeedtech.com
References: <20190705092613.7621-1-tzimmermann@suse.de>
 <20190705092613.7621-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f437366d-9dc2-c160-3b52-ae3650a5e1a2@tronnes.org>
Date: Sun, 7 Jul 2019 16:25:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190705092613.7621-3-tzimmermann@suse.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=bsfRy9iyigym871+zHxGVU81WWGcFG7FZVY068+um8o=; 
 b=OEH6jyX5qwwuBZ1RsSKhHyyePjUinjKtFkUDIOsO+1GOTdaH6Z9gO8JNLOcvo+0+uKkvoIuF4YlG2S5eMR2MvMWONQm0gBmfZ99RpYCwOUXxIVZzt6gclSbFl2HzndN8iXisLzhdpFgxPfS/ckM86SHETe01vF1IEWJupREToF4x+IbTXyQIMkMTwMUKwUyNewgLi5YkQ1AzVd2RTn6fzy4n2Nux+rYUiGdVkHdqSm8F8VoFP8YalnRvm63OfTh55WwzqOLjmi1sHWLRbOQ6adAPI5EWrIwYgNvka/UFE9xOM+MES/JKlHYGkt4LzrRM3czn/cG7e1vKGClI2WJumg==;
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDUuMDcuMjAxOSAxMS4yNiwgc2tyZXYgVGhvbWFzIFppbW1lcm1hbm46Cj4gVGhpcyBw
YXRjaCBjaGFuZ2VzIERSTSBjbGllbnRzIHRvIG5vdCBtYXAgdGhlIGJ1ZmZlciBieSBkZWZhdWx0
LiBUaGUKPiBidWZmZXIsIGxpa2UgYW55IGJ1ZmZlciBvYmplY3QsIHNob3VsZCBiZSBtYXBwZWQg
YW5kIHVubWFwcGVkIHdoZW4KPiBuZWVkZWQuCj4gCj4gQW4gdW5tYXBwZWQgYnVmZmVyIG9iamVj
dCBjYW4gYmUgZXZpY3RlZCB0byBzeXN0ZW0gbWVtb3J5IGFuZCBkb2VzCj4gbm90IGNvbnN1bWUg
dmlkZW8gcmFtIHVudGlsIGRpc3BsYXllZC4gVGhpcyBhbGxvd3MgdG8gdXNlIGdlbmVyaWMgZmJk
ZXYKPiBlbXVsYXRpb24gd2l0aCBkcml2ZXJzIGZvciBsb3ctbWVtb3J5IGRldmljZXMsIHN1Y2gg
YXMgYXN0IGFuZCBtZ2FnMjAwLgo+IAo+IFRoaXMgY2hhbmdlIGFmZmVjdHMgdGhlIGdlbmVyaWMg
ZnJhbWVidWZmZXIgY29uc29sZS4gSFctYmFzZWQgY29uc29sZXMKPiBtYXAgdGhlaXIgY29uc29s
ZSBidWZmZXIgb25jZSBhbmQga2VlcCBpdCBtYXBwZWQuIFVzZXJzcGFjZSBjYW4gbW1hcCB0aGlz
Cj4gYnVmZmVyIGludG8gaXRzIGFkZHJlc3Mgc3BhY2UuIFRoZSBzaGFkb3ctYnVmZmVyZWQgZnJh
bWVidWZmZXIgY29uc29sZQo+IG9ubHkgbmVlZHMgdGhlIGJ1ZmZlciBvYmplY3QgdG8gYmUgbWFw
cGVkIGR1cmluZyB1cGRhdGVzLiBXaGlsZSBub3QgYmVpbmcKPiB1cGRhdGVkIGZyb20gdGhlIHNo
YWRvdyBidWZmZXIsIHRoZSBidWZmZXIgb2JqZWN0IGNhbiByZW1haW4gdW5tYXBwZWQuCj4gVXNl
cnNwYWNlIHdpbGwgYWx3YXlzIG1tYXAgdGhlIHNoYWRvdyBidWZmZXIuCj4gCj4gdjI6Cj4gCSog
Y2hhbmdlIERSTSBjbGllbnQgdG8gbm90IG1hcCBidWZmZXIgYnkgZGVmYXVsdAo+IAkqIG1hbnVh
bGx5IG1hcCBjbGllbnQgYnVmZmVyIGZvciBmYmRldiB3aXRoIEhXIGZyYW1lYnVmZmVyCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
LS0tCgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
