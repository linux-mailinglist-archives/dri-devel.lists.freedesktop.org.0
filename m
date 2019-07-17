Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 847AE6BF8A
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 18:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2376E113;
	Wed, 17 Jul 2019 16:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FF16E113
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 16:18:46 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:57261
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hnmdg-0005Bo-S4; Wed, 17 Jul 2019 18:18:44 +0200
Subject: Re: [PATCH 05/10] drm/tinydrm: Clean up tinydrm_spi_transfer()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-6-noralf@tronnes.org>
 <20190717130909.GA4852@ravnborg.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6698e266-4827-2ad5-0cd5-894620f7c10b@tronnes.org>
Date: Wed, 17 Jul 2019 18:18:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190717130909.GA4852@ravnborg.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=bCY9POIYx985nHlvfkKDca+rs/GNo1r4EgzmML8ctqE=; 
 b=HCwdlU9+nvnMAi3D4lSzhWqQ8udQ2m/COxoTXb9KZCXFeuh+foKGrJO1sCwANg9Ab00CJPM318JWmQX1iYT1xbmhtCOCy1xyDHNQbLL/0XcNeomlUDA7AstR8snm0PHetRA0WaFx7VpvQf7hiXjgIKEhTbxGD7Y2w63ia5kclL1OhVIURqK6ruSZy8GkqO/QyLJh6nKlysxadQAeGqYwF6ydut0++U28jLadE96v4U0owwvtlgCjMfq/jBQyVu67dxRQNUSiAfnG5yYPOVnWfOuPma0sgEjcBbsMXS15aqtfAfYNuk4bPn5FE3ahyXAGx42lWowBvDdqbsvZCbAGSQ==;
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
Cc: david@lechnology.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMTcuMDcuMjAxOSAxNS4wOSwgc2tyZXYgU2FtIFJhdm5ib3JnOgo+IE9uIFdlZCwgSnVs
IDE3LCAyMDE5IGF0IDAxOjU4OjEyUE0gKzAyMDAsIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4g
UHJlcCB3b3JrIGJlZm9yZSBtb3ZpbmcgdGhlIGZ1bmN0aW9uIHRvIG1pcGktZGJpLgo+Pgo+PiB0
aW55ZHJtX3NwaV90cmFuc2ZlcigpIHdhcyBtYWRlIHRvIHN1cHBvcnQgb25lIGNsYXNzIG9mIGRy
aXZlcnMgaW4KPj4gZHJpdmVycy9zdGFnaW5nL2ZidGZ0IHRoYXQgaGFzIG5vdCBiZWVuIGNvbnZl
cnRlZCB0byBEUk0geWV0LCBzbyBzdHJpcAo+PiBhd2F5IHRoZSB1bnVzZWQgZnVuY3Rpb25hbGl0
eToKPj4gLSBTdGFydCBieXRlIChoZWFkZXIpIGlzIG5vdCB1c2VkLgo+PiAtIE5vIGRyaXZlciBy
ZWxpZXMgb24gdGhlIGF1dG9tYXRpYyAxNi1iaXQgYnl0ZSBzd2FwcGluZyBvbiBsaXR0bGUgZW5k
aWFuCj4+ICAgbWFjaGluZXMgd2l0aCBTUEkgY29udHJvbGxlcnMgb25seSBzdXBwb3J0aW5nIDgg
Yml0cyBwZXIgd29yZC4KPiAKPiBLZWVwaW5nIHVudXNlZCBjb2RlIGFyb3VuZCBpcyBuZXZlciBh
IGdvb2QgaWRlYS4KPiBPbiB0aGUgb3RoZXIgaGFuZCwgc2hvdWxkIHdlIG5vdCB0cnkgdG8gZ2V0
IHRoZSBkcml2ZXIgaW4gcXVlc3Rpb25zCj4gcG9ydGVkIHNvIHdlIGhhdmUgYSB1c2VyIGFuZCB3
ZSBkbyBub3QgbmVlZCB0byByZS1hZGQgdGhpcyBsYXRlcj8KPiBXaGF0IGRyaXZlci9kaXNwbGF5
IG5lZWRzIHRoaXM/CgpBdCBsZWFzdCBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJfaWxpOTMyezAs
NX0uYyBhbmQgbWF5YmUgYW5vdGhlciBvbmUsIEkKZG9uJ3QgcmVtZW1iZXIuIEkgaGF2ZW4ndCB3
b3JrZWQgb24gZmJ0ZnQgYWZ0ZXIgSSBkaWQgdGlueWRybS4KSXQgbG9va3MgbGlrZSB0aGV5IHN0
aWxsIHNlbGwgdGhlIGh5MjhiOgpodHRwczovL3d3dy5ob3RtY3UuY29tLzI4LXRvdWNoLXNjcmVl
bi10ZnQtbGNkLXdpdGgtYWxsLWludGVyZmFjZS1wLTYzLmh0bWwKCkknbSBub3Qgc3VyZSB3aGF0
IHRoZSBmdXR1cmUgb2YgZmJ0ZnQgaXMuIFRoZSBpZGVhIHdhcyB0aGF0IHRoZSBkcml2ZXJzCnNo
b3VsZCBnZXQgY2xlYW5lZCB1cCBhbmQgbW92ZSBvdXQgb2Ygc3RhZ2luZywgYnV0IHRoZW4gZmJk
ZXYgd2FzIGNsb3NlZApmb3IgbmV3IGRyaXZlcnMgYW5kIEkgZGlkIHRpbnlkcm0uIE9ubHkgdHdv
IGRyaXZlcnMgaGF2ZSBiZWVuIGNvbnZlcnRlZAphcGFydCBmcm9tIG1pMDI4M3F0IHRoYXQgSSBk
aWQgYW5kIHRoYXQgaXMgaHg4MzU3IHdoaWNoIEVyaWMgZGlkIGFuZApzdDc3MzUgdGhhdCBEYXZp
ZCBkaWQuIFRob3NlIDMgY292ZXJzIGEgbG90IG9mIHRoZSB0aW55IFNQSSBkaXNwbGF5Cm1hcmtl
ZCwgQWRhZnJ1aXQgc2VsbHMgdGhlbS4KSXQncyBhIGNoaWNrZW4gYW5kIGVnZyBwcm9ibGVtLCBh
cyBsb25nIGFzIHRoZSBmYnRmdCBkcml2ZXJzIGFyZSB0aGVyZQphbmQgd29ya2luZywgdGhlcmUn
cyBubyBpbmNlbnRpdmUgdG8gY29udmVydCB0aGVtLgoKVGhlcmUncyBhbm90aGVyIGNoYWxsZW5n
ZSB3aXRoIHRoZXNlIGRyaXZlcnMgc2luY2UgaXQgaXMgcG9zc2libGUgdG8Kb3ZlcnJpZGUgdGhl
IGluaXQgc2VxdWVuY2UgaW4gRGV2aWNlIFRyZWUsIG1lYW5pbmcgdGhleSBjYW4gd29yayB3aXRo
CmFsbCBraW5kcyBvZiBkaXNwbGF5cyB3aXRob3V0IHdyaXRpbmcgYSBuZXcgZHJpdmVyLgpJIHdh
cyBub3QgYWxsb3dlZCB0byBrZWVwIHRoYXQgZnVuY3Rpb25hbGl0eSBvdXRzaWRlIG9mIHN0YWdp
bmcuCgpXaGVuIEknbSBkb25lIHdpdGggdGhlIHRpbnlkcm0gY2xlYW51cCwgSSdtIGdvaW5nIHRv
IHdvcmsgb24gYW4gaWRlYSBJCmhhdmU6IHR1cm4gdGhlIFJhc3BiZXJyeSBQaSBaZXJvIGludG8g
YSAkNSBVU0IgdG8KSERNSS9TRFRWL0RTSS9EUEkvU1BJLWRpc3BsYXkgYWRhcHRlci4gSSdtIHBs
YW5uaW5nIHRvIHdyaXRlIGEgZ2VuZXJpYwpVU0IgaG9zdCBkaXNwbGF5IGRyaXZlciB3aXRoIGEg
bWF0Y2hpbmcgTGludXggT1RHIGRldmljZSBkcml2ZXIuCkkgcGxhbiB0byBtYWtlIGl0IGVhc3kg
dG8gZG8gdGhlIGRpc3BsYXkgT1RHIHNpZGUgb24gYSBtaWNyb2NvbnRyb2xsZXIKYXMgd2VsbC4g
VGhpcyB3YXkgaXQgd2lsbCBiZSBwb3NzaWJsZSBmb3IgbWFudWZhY3R1cmVycyB0byBkbyBVU0IK
Y29ubmVjdGVkIGRpc3BsYXlzIG9mIChuZWFybHkpIGFsbCBzaXplcyB3aXRob3V0IGhhdmluZyB0
byB3cml0ZSBhIExpbnV4CmRyaXZlci4KCkl0J3MgZGlmZmljdWx0IHRvIHByZWRpY3QgdGhlIGZ1
dHVyZSwgYnV0IHBvd2VyZnVsIG1pY3JvY29udHJvbGxlcnMgYXJlCmNoZWFwIG5vd2FkYXlzIHNv
IG1heWJlIHRoZXNlIFNQSSBkaXNwbGF5cyB3aWxsIGJlIGZhc2VkIG91dCBieSBjaGVhcApVU0Ig
ZGlzcGxheXMuIFRoZSB1QyBjYW4gcmVwbGFjZSB0aGUgdG91Y2ggY29udHJvbGxlciBjdXR0aW5n
IHNvbWUgb2YKdGhlIHVDIGNvc3QuCgpOb3JhbGYuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
