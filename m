Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2CB7511B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 16:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2ADC6E663;
	Thu, 25 Jul 2019 14:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78E6E663
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 14:29:06 +0000 (UTC)
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:33218 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <david@lechnology.com>)
 id 1hqejw-00GlKw-OA; Thu, 25 Jul 2019 10:29:04 -0400
Subject: Re: [PATCH 06/10] drm/tinydrm: Move tinydrm_spi_transfer()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190717115817.30110-1-noralf@tronnes.org>
 <20190717115817.30110-7-noralf@tronnes.org>
 <d5e99eeb-1670-75ec-5e01-a5964bbfe0f8@lechnology.com>
 <0456f26b-4886-ae81-4b12-55483b3402b6@tronnes.org>
 <faddc8a9-9b8f-4687-aacf-b8a959c01129@tronnes.org>
From: David Lechner <david@lechnology.com>
Message-ID: <b75b1d0f-8372-d241-c8f7-a36656662c07@lechnology.com>
Date: Thu, 25 Jul 2019 09:29:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <faddc8a9-9b8f-4687-aacf-b8a959c01129@tronnes.org>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z+uyUs248xD3XZ7MRfZnPtZskTbIRrKTVFMazIhlNpE=; b=y2o5GoNSjU+35fGujCiqI2l+EX
 6YnbdEiC3QHMCPXQfLb2sHxk9kd0SjISYCEAh8D+8lbslHNWgQFZzwIhYdgmQcyHM/jMtCzjk2UB/
 oa8+8XFPKaNJpXtlnLv1YGaDIWvsedzXzt9G50eE/F+DlfN6y/nRZwCy77N3aZawLT5hLZfDAAgaw
 3CXoQBjVvqOJqL/TF2sp4n6V/uL8CiQ03e/lSOh7pBb5x4stUOeNgN1B6JhVAyKg6pO74wm0cPpwI
 x1/WxDoF0Uf+Evc0w40DRVvcT2zOZ57LPARJtimOf+3K7I6ENrFPWcI7y/wl9veYHv8q2tpeIhN85
 JOsKVi4A==;
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNS8xOSA5OjE2IEFNLCBOb3JhbGYgVHLDuG5uZXMgd3JvdGU6Cj4gCj4gCj4gRGVuIDE4
LjA3LjIwMTkgMTQuMTQsIHNrcmV2IE5vcmFsZiBUcsO4bm5lczoKPj4KPj4KPj4gRGVuIDE3LjA3
LjIwMTkgMjEuNDgsIHNrcmV2IERhdmlkIExlY2huZXI6Cj4+PiBPbiA3LzE3LzE5IDY6NTggQU0s
IE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPj4+PiBUaGlzIGlzIG9ubHkgdXNlZCBieSBtaXBpLWRi
aSBkcml2ZXJzIHNvIG1vdmUgaXQgdGhlcmUuCj4+Pj4KPj4+PiBUaGUgcmVhc29uIHRoaXMgaXNu
J3QgbW92ZWQgdG8gdGhlIFNQSSBzdWJzeXN0ZW0gaXMgdGhhdCBpdCB3aWxsIGluIGEKPj4+PiBs
YXRlciBwYXRjaCBwYXNzIGEgZHVtbXkgcnggYnVmZmVyIGZvciBTUEkgY29udHJvbGxlcnMgdGhh
dCBuZWVkIHRoaXMuCj4+Pj4gTG93IG1lbW9yeSBib2FyZHMgKDY0TUIpIGNhbiBydW4gaW50byBh
IHByb2JsZW0gYWxsb2NhdGluZyBzdWNoIGEgImxhcmdlIgo+Pj4+IGNvbnRpZ3VvdXMgYnVmZmVy
IG9uIGV2ZXJ5IHRyYW5zZmVyIGFmdGVyIGEgbG9uZyB1cCB0aW1lLgo+Pj4+IFRoaXMgbGVhdmVz
IGEgdmVyeSBzcGVjaWZpYyB1c2UgY2FzZSwgc28gd2UnbGwga2VlcCB0aGUgZnVuY3Rpb24gaGVy
ZS4KPj4+PiBtaXBpLWRiaSB3aWxsIGZpcnN0IGdvIHRocm91Z2ggYSByZWZhY3RvcmluZyB0aG91
Z2gsIGJlZm9yZSB0aGlzIHdpbGwKPj4+PiBiZSBkb25lLgo+Pj4+Cj4+Pj4gUmVtb3ZlIFNQSSB0
b2RvIGVudHJ5IG5vdyB0aGF0IHdlJ3JlIGRvbmUgd2l0aCB0aGUgdGlueWRybS5rbyBTUEkgY29k
ZS4KPj4+Pgo+Pj4+IEFkZGl0aW9uYWxseSBtb3ZlIHRoZSBtaXBpX2RiaV9zcGlfaW5pdCgpIGRl
Y2xhcmF0aW9uIHRvIHRoZSBvdGhlciBTUEkKPj4+PiBmdW5jdGlvbnMuCj4+Pj4KPj4+PiBDYzog
RGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4+Pj4gU2lnbmVkLW9mZi1ieTog
Tm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cj4+Pj4gLS0tCj4+Pgo+Pj4gQWNr
ZWQtYnk6IDogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9neS5jb20+Cj4+Pgo+Pj4gSSBh
c3N1bWUgdGhhdCB0aGUgY29tbWVudHMgaGVyZSBtaWdodCBoYXZlIHNvbWV0aGluZyB0byBkbyB3
aXRoIHRoZQo+Pj4gaXNzdWVbMV0gSSByYWlzZWQgYSB3aGlsZSBiYWNrPyBTaG91bGQgSSBkdXN0
IHRoYXQgcGF0Y2ggb2ZmIGFuZCByZXNlbmQKPj4+IGl0IGFmdGVyIHRoaXMgc2VyaWVzIGxhbmRz
Pwo+Pj4KPj4+IFsxXToKPj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTUxOTA4MjQ2
MS0zMjQwNS0xLWdpdC1zZW5kLWVtYWlsLWRhdmlkQGxlY2hub2xvZ3kuY29tLwo+Pj4KPj4KPj4g
WWVwLCB0aGF0J3MgdGhlIG9uZS4gSSB3YW50IHRvIHJlZmFjdG9yIG1pcGktZGJpIGZpcnN0IHNw
bGl0dGluZyBzdHJ1Y3QKPj4gbWlwaV9kYmkgaW50byBhbiBpbnRlcmZhY2UgYW5kIGRpc3BsYXkg
cGlwZWxpbmUgcGFydC4gVGhlIGhlbHBlciBpcwo+PiBnb2luZyB0byBiZSBtb3ZlZCB0byBkcml2
ZXJzL2dwdS9kcm0gd2l0aCB0aGUgb3RoZXIgaGVscGVycy4KPj4gUGxlYXNlIHdhaXQgdW50aWwg
dGhhdCBpcyBkb25lLCBJIHdhbnQgdG8gc2VlIHdoYXQga2luZCBvZiBjb3VwbGluZyBJCj4+IGVu
ZCB1cCBiZXR3ZWVuIHRoZSB0d28gc3RydWN0cyBhbmQgZG9uJ3Qgd2FudCBhbm90aGVyIGRlcGVu
ZGVuY3kgdG8gZGVhbAo+PiB3aXRoIGlmIEkgY2FuIGF2b2lkIGl0Lgo+Pgo+IAo+IEkndmUgYXBw
bGllZCB0aGUgc2VyaWVzIG5vdy4KPiAKPiBEbyB5b3UgaGF2ZSB0aGlzIHByb2JsZW0gb25seSBv
biB0aGUgRVYzIGFuZCB3aXRoIG9ubHkgb25lCj4gZGlzcGxheS9kcml2ZXI/IElmIHNvIEknbSB3
b25kZXJpbmcgaWYgdGhlcmUncyBhIHdheSB0byBpbXBsZW1lbnQgdGhpcwo+IHRoYXQgZG9lc24n
dCBhZmZlY3QgdGhlIG90aGVyIGRyaXZlcnMgc2luY2UgeW91IG5lZWQgYSBzcGVjaWFsIHVzZSBj
YXNlCj4gdG8gYmUgaGl0IGJ5IHRoaXMuCj4gCj4gTm9yYWxmLgo+IAoKSSd2ZSBsZXQgdGhpcyBz
aXQgcnVubmluZyBmb3Igc2V2ZXJhbCBkYXlzIGFuZCBJIGRvbid0IHNlZSB0aGUgZXJyb3IKYW55
IG1vcmUuIFNvIHBlcmhhcHMgc29tZXRoaW5nIHdhcyBmaXhlZCBpbiB0aGUgRE1BIGRyaXZlcj8g
T3IgbWF5YmUKSSBqdXN0IGhhdmVuJ3Qgc2VlbiB0aGUgZXJyb3IgYmVjYXVzZSBpdCBpcyBzaXR0
aW5nIGlkbGUgYW5kIG5vdCB1bmRlcgpoZWF2eSBtZW1vcnkgdXNhZ2U/IChJIGp1c3QgcmFuIHNv
bWUgYXB0IGNvbW1hbmRzIHRoYXQgY3Jhc2hlZCBiZWNhdXNlCm9mIE9PTSBhbmQgbm90aGluZyBo
YXBwZW5lZCB3aXRoIHRoZSBkaXNwbGF5IGRyaXZlci4pCgpJbnRlcmVzdGluZ2x5LCBJIHdhcyBn
ZXR0aW5nIGEgc2ltaWxhciBhbGxvY2F0aW9uIGVycm9yIGZyb20genJhbQppbiB0aGUgNS4yIGtl
cm5lbCwgdXN1YWxseSB0cmlnZ2VyZWQgYnkgc3RhcnRpbmcgYSBTU0ggc2Vzc2lvbiAodG90YWxs
eQp1bnJlbGF0ZWQgdG8gRFJNKS4KClNvLCB1bmxlc3MgSSBzdGFydCBzZWVpbmcgdGhlIHByb2Js
ZW0gYWdhaW4sIEkgdGhpbmsgd2UgY2FuIGxlYXZlIGl0CmFsb25lIGZvciBub3cuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
