Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71B081344
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AB2189C19;
	Mon,  5 Aug 2019 07:34:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4276E48E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 20:33:47 +0000 (UTC)
Received: from willy by bombadil.infradead.org with local (Exim 4.92 #3 (Red
 Hat Linux)) id 1hteFE-00046N-Fr; Fri, 02 Aug 2019 20:33:44 +0000
Date: Fri, 2 Aug 2019 13:33:44 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [Bug 204407] New: Bad page state in process Xorg
Message-ID: <20190802203344.GD5597@bombadil.infradead.org>
References: <bug-204407-27@https.bugzilla.kernel.org/>
 <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190802132306.e945f4420bc2dcddd8d34f75@linux-foundation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=76k/NEV4yV518KF6BPeXC0U+XVQr3xgUEZxyw7BoNew=; b=qw5B+oHgG/uhMN22taH88XDhp
 RYDfcsmY7UOyJW7ubedNhxlXQpFF7q6uBVUZawl5Td3WP5lEzmJXzY3+gZuEWd8VB2VdlwjJtQ9hQ
 I1HTX9QtjpmfM3Dai/QTgW4pD4GLm4laSQuEK2tuzWqRMT2rQ4Nk5TkhbKXnkIdnR7O/ZZUVqLz74
 BQKTkwYEzr0Oo+2mtZPnsnCV73JFDrhmQNDZm1q8/HUulDPcUK5ygY6RysoT1VPfdeJqAKYalQTT/
 bgWoc0pbnJfgwXHrtfjRk/R6ymW/UaK9wwVNJGrsvROr25wvI8WgCQsBYdeH3y4tKXwp1N2+q99XG
 HQl9Dt7UQ==;
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
Cc: David Airlie <airlied@linux.ie>, bugzilla-daemon@bugzilla.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Huang Rui <ray.huang@amd.com>, petr@vandrovec.name,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDIsIDIwMTkgYXQgMDE6MjM6MDZQTSAtMDcwMCwgQW5kcmV3IE1vcnRvbiB3
cm90ZToKPiA+IFsyNTk3MDEuMzg3MzY1XSBCVUc6IEJhZCBwYWdlIHN0YXRlIGluIHByb2Nlc3Mg
WG9yZyAgcGZuOjJhMzAwCj4gPiBbMjU5NzAxLjM5MzU5M10gcGFnZTpmZmZmZWEwMDAwYThjMDAw
IHJlZmNvdW50OjAgbWFwY291bnQ6LTEyOAo+ID4gbWFwcGluZzowMDAwMDAwMDAwMDAwMDAwIGlu
ZGV4OjB4MAoKbWFwY291bnQgLTEyOCBpcyBQQUdFX01BUENPVU5UX1JFU0VSVkUsIGFrYSBQYWdl
QnVkZHkuICBJIHRoaW5rIHNvbWVib2R5CmNhbGxlZCBwdXRfcGFnZSgpIG9uY2UgbW9yZSB0aGFu
IHRoZXkgc2hvdWxkIGhhdmUuICBUaGUgb25lIGJlZm9yZSB0aGlzCmNhdXNlZCBpdCB0byBiZSBm
cmVlZCB0byB0aGUgcGFnZSBhbGxvY2F0b3IsIHdoaWNoIHNldCBQYWdlQnVkZHkuICBUaGVuCnRo
aXMgb25lIGhhcHBlbmVkIGFuZCB3ZSBnb3QgYSBjb21wbGFpbnQuCgo+ID4gWzI1OTcwMS40MDI4
MzJdIGZsYWdzOiAweDIwMDAwMDAwMDAwMDAwMDAoKQo+ID4gWzI1OTcwMS40MDc0MjZdIHJhdzog
MjAwMDAwMDAwMDAwMDAwMCBmZmZmZmZmZjgyMmFiNzc4IGZmZmZlYTAwMDBhOGYyMDgKPiA+IDAw
MDAwMDAwMDAwMDAwMDAKPiA+IFsyNTk3MDEuNDE1OTAwXSByYXc6IDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMDAwMDAwMDAwMyAwMDAwMDAwMGZmZmZmZjdmCj4gPiAwMDAwMDAwMDAwMDAwMDAwCj4g
PiBbMjU5NzAxLjQyNDM3M10gcGFnZSBkdW1wZWQgYmVjYXVzZTogbm9uemVybyBtYXBjb3VudAoK
SXQgb2NjdXJzIHRvIG1lIHRoYXQgd2hlbiBhIHBhZ2UgaXMgZnJlZWQsIHdlIGNvdWxkIHJlY29y
ZCBzb21lIHVzZWZ1bCBiaXRzCm9mIGluZm9ybWF0aW9uIGluIHRoZSBwYWdlIGZyb20gdGhlIHN0
YWNrIHRyYWNlIHRvIGhlbHAgZGVidWcgZG91YmxlLWZyZWUgCnNpdHVhdGlvbnMuICBFdmVuIGp1
c3Qgc3Rhc2hpbmcgX19idWlsdGluX3JldHVybl9hZGRyZXNzIGluIHBhZ2UtPm1hcHBpbmcKd291
bGQgYmUgaGVscGZ1bCwgSSB0aGluay4KCj4gPiBbMjU5NzAxLjU0OTM4Ml0gQ2FsbCBUcmFjZToK
PiA+IFsyNTk3MDEuNTQ5MzgyXSAgZHVtcF9zdGFjaysweDQ2LzB4NjAKPiA+IFsyNTk3MDEuNTQ5
MzgyXSAgYmFkX3BhZ2UuY29sZC4yOCsweDgxLzB4YjQKPiA+IFsyNTk3MDEuNTQ5MzgyXSAgX19m
cmVlX3BhZ2VzX29rKzB4MjM2LzB4MjQwCj4gPiBbMjU5NzAxLjU0OTM4Ml0gIF9fdHRtX2RtYV9m
cmVlX3BhZ2UrMHgyZi8weDQwCj4gPiBbMjU5NzAxLjU0OTM4Ml0gIHR0bV9kbWFfdW5wb3B1bGF0
ZSsweDI5Yi8weDM3MAo+ID4gWzI1OTcwMS41NDkzODJdICB0dG1fdHRfZGVzdHJveS5wYXJ0LjYr
MHg0NC8weDUwCj4gPiBbMjU5NzAxLjU0OTM4Ml0gIHR0bV9ib19jbGVhbnVwX21lbXR5cGVfdXNl
KzB4MjkvMHg3MAo+ID4gWzI1OTcwMS41NDkzODJdICB0dG1fYm9fcHV0KzB4MjI1LzB4MjgwCj4g
PiBbMjU5NzAxLjU0OTM4Ml0gIHR0bV9ib192bV9jbG9zZSsweDEwLzB4MjAKPiA+IFsyNTk3MDEu
NTQ5MzgyXSAgcmVtb3ZlX3ZtYSsweDIwLzB4NDAKPiA+IFsyNTk3MDEuNTQ5MzgyXSAgX19kb19t
dW5tYXArMHgyZGEvMHg0MjAKPiA+IFsyNTk3MDEuNTQ5MzgyXSAgX192bV9tdW5tYXArMHg2Ni8w
eGMwCj4gPiBbMjU5NzAxLjU0OTM4Ml0gIF9feDY0X3N5c19tdW5tYXArMHgyMi8weDMwCj4gPiBb
MjU5NzAxLjU0OTM4Ml0gIGRvX3N5c2NhbGxfNjQrMHg1ZS8weDFhMAo+ID4gWzI1OTcwMS41NDkz
ODJdICA/IHByZXBhcmVfZXhpdF90b191c2VybW9kZSsweDc1LzB4YTAKPiA+IFsyNTk3MDEuNTQ5
MzgyXSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQo+ID4gWzI1OTcw
MS41NDkzODJdIFJJUDogMDAzMzoweDdmNTA0ZDBlYzFkNwo+ID4gWzI1OTcwMS41NDkzODJdIENv
ZGU6IDEwIGU5IDY3IGZmIGZmIGZmIDBmIDFmIDQ0IDAwIDAwIDQ4IDhiIDE1IGIxIDZjIDBjIDAw
IGY3Cj4gPiBkOCA2NCA4OSAwMiA0OCBjNyBjMCBmZiBmZiBmZiBmZiBlOSA2YiBmZiBmZiBmZiBi
OCAwYiAwMCAwMCAwMCAwZiAwNSA8NDg+IDNkIDAxCj4gPiBmMCBmZiBmZiA3MyAwMSBjMyA0OCA4
YiAwZCA4OSA2YyAwYyAwMCBmNyBkOCA2NCA4OSAwMSA0OAo+ID4gWzI1OTcwMS41NDkzODJdIFJT
UDogMDAyYjowMDAwN2ZmZTUyOWRiMTM4IEVGTEFHUzogMDAwMDAyMDYgT1JJR19SQVg6Cj4gPiAw
MDAwMDAwMDAwMDAwMDBiCj4gPiBbMjU5NzAxLjU0OTM4Ml0gUkFYOiBmZmZmZmZmZmZmZmZmZmRh
IFJCWDogMDAwMDU2NGE1ZWFiY2U3MCBSQ1g6Cj4gPiAwMDAwN2Y1MDRkMGVjMWQ3Cj4gPiBbMjU5
NzAxLjU0OTM4Ml0gUkRYOiAwMDAwN2ZmZTUyOWRiMTQwIFJTSTogMDAwMDAwMDAwMDQwMDAwMCBS
REk6Cj4gPiAwMDAwN2Y1MDQ0YjY1MDAwCj4gPiBbMjU5NzAxLjU0OTM4Ml0gUkJQOiAwMDAwNTY0
YTVlYWZlNDYwIFIwODogMDAwMDAwMDAwMDAwMDAwYiBSMDk6Cj4gPiAwMDAwMDAwMTAyODNlMDAw
Cj4gPiBbMjU5NzAxLjU0OTM4Ml0gUjEwOiAwMDAwMDAwMDAwMDAwMDAxIFIxMTogMDAwMDAwMDAw
MDAwMDIwNiBSMTI6Cj4gPiAwMDAwNTY0YTVlNDc1YjA4Cj4gPiBbMjU5NzAxLjU0OTM4Ml0gUjEz
OiAwMDAwNTY0YTVlNDc1YzgwIFIxNDogMDAwMDdmZmU1MjlkYjE5MCBSMTU6Cj4gPiAwMDAwMDAw
MDAwMDAwYzgwCj4gPiBbMjU5NzAxLjcwNzIzOF0gRGlzYWJsaW5nIGxvY2sgZGVidWdnaW5nIGR1
ZSB0byBrZXJuZWwgdGFpbnQKPiAKPiBJIGFzc3VtZSB0aGUgYWJvdmUgaXMgbWlzYmVoYXZpb3Vy
IGluIHRoZSBEUk0gY29kZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
