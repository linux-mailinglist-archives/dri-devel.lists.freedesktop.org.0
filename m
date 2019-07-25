Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35857750B5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E4CD6E668;
	Thu, 25 Jul 2019 14:16:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D95C6E764
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:16:14 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:56757
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hqeXU-0002xx-FH; Thu, 25 Jul 2019 16:16:12 +0200
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To: David Lechner <david@lechnology.com>, dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
 <d5e99eeb-1670-75ec-5e01-a5964bbfe0f8@lechnology.com>
 <0456f26b-4886-ae81-4b12-55483b3402b6@tronnes.org>
Message-ID: <faddc8a9-9b8f-4687-aacf-b8a959c01129@tronnes.org>
Date: Thu, 25 Jul 2019 16:16:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <0456f26b-4886-ae81-4b12-55483b3402b6@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject;
 bh=GILxaik7w20D6vpXNpV4uLpC9ICt2/Xoe7s0VH5CLKE=; 
 b=svxeuxC/8UiLFIwvXMY+iuuOdhhcz7U8wHGEjLkPpEAOKk+48qizzFzOpacTmTguIgz/g4AMeQN3v/T3O9pEJmExQHj/+COQs2AMhkvaO+y80+ODJzMDeJLQmr+M709OK6DQMTUCWid9n4fKPWR3EO/LoPxuIUnTdaDL/N67BoZ+5cduCtpXR+mQjVCegrTIttSZ3aidt5gFZCVlNKmfLraAtMSf0+yEqxc9eJhK2SNUvzWER7kPfewMvbok1F16V+AlL7FsJNWptv8d1ngVKjonpIBBCiUCpyCbLUQ/0ZU8bfXHzPvYtazjQ/p7uQAiMHpwl66QW+0dVbiPNVoLfA==;
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

CgpEZW4gMTguMDcuMjAxOSAxNC4xNCwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IAo+IAo+IERl
biAxNy4wNy4yMDE5IDIxLjQ4LCBza3JldiBEYXZpZCBMZWNobmVyOgo+PiBPbiA3LzE3LzE5IDY6
NTggQU0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4+IFRoaXMgaXMgb25seSB1c2VkIGJ5IG1p
cGktZGJpIGRyaXZlcnMgc28gbW92ZSBpdCB0aGVyZS4KPj4+Cj4+PiBUaGUgcmVhc29uIHRoaXMg
aXNuJ3QgbW92ZWQgdG8gdGhlIFNQSSBzdWJzeXN0ZW0gaXMgdGhhdCBpdCB3aWxsIGluIGEKPj4+
IGxhdGVyIHBhdGNoIHBhc3MgYSBkdW1teSByeCBidWZmZXIgZm9yIFNQSSBjb250cm9sbGVycyB0
aGF0IG5lZWQgdGhpcy4KPj4+IExvdyBtZW1vcnkgYm9hcmRzICg2NE1CKSBjYW4gcnVuIGludG8g
YSBwcm9ibGVtIGFsbG9jYXRpbmcgc3VjaCBhICJsYXJnZSIKPj4+IGNvbnRpZ3VvdXMgYnVmZmVy
IG9uIGV2ZXJ5IHRyYW5zZmVyIGFmdGVyIGEgbG9uZyB1cCB0aW1lLgo+Pj4gVGhpcyBsZWF2ZXMg
YSB2ZXJ5IHNwZWNpZmljIHVzZSBjYXNlLCBzbyB3ZSdsbCBrZWVwIHRoZSBmdW5jdGlvbiBoZXJl
Lgo+Pj4gbWlwaS1kYmkgd2lsbCBmaXJzdCBnbyB0aHJvdWdoIGEgcmVmYWN0b3JpbmcgdGhvdWdo
LCBiZWZvcmUgdGhpcyB3aWxsCj4+PiBiZSBkb25lLgo+Pj4KPj4+IFJlbW92ZSBTUEkgdG9kbyBl
bnRyeSBub3cgdGhhdCB3ZSdyZSBkb25lIHdpdGggdGhlIHRpbnlkcm0ua28gU1BJIGNvZGUuCj4+
Pgo+Pj4gQWRkaXRpb25hbGx5IG1vdmUgdGhlIG1pcGlfZGJpX3NwaV9pbml0KCkgZGVjbGFyYXRp
b24gdG8gdGhlIG90aGVyIFNQSQo+Pj4gZnVuY3Rpb25zLgo+Pj4KPj4+IENjOiBEYXZpZCBMZWNo
bmVyIDxkYXZpZEBsZWNobm9sb2d5LmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4
bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgo+Pj4gLS0tCj4+Cj4+IEFja2VkLWJ5OiA6IERhdmlk
IExlY2huZXIgPGRhdmlkQGxlY2hub2xvZ3kuY29tPgo+Pgo+PiBJIGFzc3VtZSB0aGF0IHRoZSBj
b21tZW50cyBoZXJlIG1pZ2h0IGhhdmUgc29tZXRoaW5nIHRvIGRvIHdpdGggdGhlCj4+IGlzc3Vl
WzFdIEkgcmFpc2VkIGEgd2hpbGUgYmFjaz8gU2hvdWxkIEkgZHVzdCB0aGF0IHBhdGNoIG9mZiBh
bmQgcmVzZW5kCj4+IGl0IGFmdGVyIHRoaXMgc2VyaWVzIGxhbmRzPwo+Pgo+PiBbMV06Cj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTUxOTA4MjQ2MS0zMjQwNS0xLWdpdC1zZW5kLWVt
YWlsLWRhdmlkQGxlY2hub2xvZ3kuY29tLwo+Pgo+IAo+IFllcCwgdGhhdCdzIHRoZSBvbmUuIEkg
d2FudCB0byByZWZhY3RvciBtaXBpLWRiaSBmaXJzdCBzcGxpdHRpbmcgc3RydWN0Cj4gbWlwaV9k
YmkgaW50byBhbiBpbnRlcmZhY2UgYW5kIGRpc3BsYXkgcGlwZWxpbmUgcGFydC4gVGhlIGhlbHBl
ciBpcwo+IGdvaW5nIHRvIGJlIG1vdmVkIHRvIGRyaXZlcnMvZ3B1L2RybSB3aXRoIHRoZSBvdGhl
ciBoZWxwZXJzLgo+IFBsZWFzZSB3YWl0IHVudGlsIHRoYXQgaXMgZG9uZSwgSSB3YW50IHRvIHNl
ZSB3aGF0IGtpbmQgb2YgY291cGxpbmcgSQo+IGVuZCB1cCBiZXR3ZWVuIHRoZSB0d28gc3RydWN0
cyBhbmQgZG9uJ3Qgd2FudCBhbm90aGVyIGRlcGVuZGVuY3kgdG8gZGVhbAo+IHdpdGggaWYgSSBj
YW4gYXZvaWQgaXQuCj4gCgpJJ3ZlIGFwcGxpZWQgdGhlIHNlcmllcyBub3cuCgpEbyB5b3UgaGF2
ZSB0aGlzIHByb2JsZW0gb25seSBvbiB0aGUgRVYzIGFuZCB3aXRoIG9ubHkgb25lCmRpc3BsYXkv
ZHJpdmVyPyBJZiBzbyBJJ20gd29uZGVyaW5nIGlmIHRoZXJlJ3MgYSB3YXkgdG8gaW1wbGVtZW50
IHRoaXMKdGhhdCBkb2Vzbid0IGFmZmVjdCB0aGUgb3RoZXIgZHJpdmVycyBzaW5jZSB5b3UgbmVl
ZCBhIHNwZWNpYWwgdXNlIGNhc2UKdG8gYmUgaGl0IGJ5IHRoaXMuCgpOb3JhbGYuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
