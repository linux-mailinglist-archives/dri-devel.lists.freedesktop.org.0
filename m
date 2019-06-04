Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D714350CC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2019 22:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBD889C61;
	Tue,  4 Jun 2019 20:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.skrimstad.net (mail.skrimstad.net [139.162.145.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42FB89C61;
 Tue,  4 Jun 2019 20:21:57 +0000 (UTC)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
 by mail.skrimstad.net (Postfix) with ESMTPA id 7C155DE701;
 Tue,  4 Jun 2019 20:21:52 +0000 (UTC)
Date: Tue, 4 Jun 2019 22:21:49 +0200
From: Yrjan Skrimstad <yrjan@skrimstad.net>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/amd/powerplay/smu7_hwmgr: replace blocking delay
 with non-blocking
Message-ID: <20190604202149.GA20116@obi-wan>
References: <20190530000819.GA25416@obi-wan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190530000819.GA25416@obi-wan>
X-Spamd-Bar: /
X-Mailman-Original-Authentication-Results: mail.skrimstad.net;
 auth=pass smtp.auth=yrjan@skrimstad.net smtp.mailfrom=yrjan@skrimstad.net
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Evan Quan <evan.quan@amd.com>, Rex Zhu <rex.zhu@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBNYXkgMzAsIDIwMTkgYXQgMDI6MDg6MjFBTSArMDIwMCwgWXJqYW4gU2tyaW1zdGFk
IHdyb3RlOgo+IFRoaXMgZHJpdmVyIGN1cnJlbnRseSBjb250YWlucyBhIHJlcGVhdGVkIDUwMG1z
IGJsb2NraW5nIGRlbGF5IGNhbGwKPiB3aGljaCBjYXVzZXMgZnJlcXVlbnQgbWFqb3IgYnVmZmVy
IHVuZGVycnVucyBpbiBQdWxzZUF1ZGlvLiBUaGlzIHBhdGNoCj4gZml4ZXMgdGhpcyBpc3N1ZSBi
eSByZXBsYWNpbmcgdGhlIGJsb2NraW5nIGRlbGF5IHdpdGggYSBub24tYmxvY2tpbmcKPiBzbGVl
cCBjYWxsLgoKSSBzZWUgdGhhdCBJIGhhdmUgbm90IGV4cGxhaW5lZCB0aGlzIGJ1ZyB3ZWxsIGVu
b3VnaCwgYW5kIEkgaG9wZSB0aGF0IGlzCnRoZSByZWFzb24gZm9yIHRoZSBsYWNrIG9mIHJlcGxp
ZXMgb24gdGhpcyBwYXRjaC4gSSB3aWxsIGhlcmUgYXR0ZW1wdCB0bwpleHBsYWluIHRoZSBzaXR1
YXRpb24gYmV0dGVyLgoKVG8gc3RhcnQgd2l0aCBzb21lIGhhcmR3YXJlIGRlc2NyaXB0aW9uIEkg
YW0gaGVyZSB1c2luZyBhbiBBTUQgUjkgMzgwCkdQVSwgYW4gQU1EIFJ5emVuIDcgMTcwMCBFaWdo
dC1Db3JlIFByb2Nlc3NvciBhbmQgYW4gQU1EIFgzNzAgY2hpcHNldC4KSWYgYW55IG1vcmUgaGFy
ZHdhcmUgb3Igc29mdHdhcmUgc3BlY2lmaWNhdGlvbnMgYXJlIG5lY2Vzc2FyeSwgcGxlYXNlCmFz
ay4KClRoZSBidWcgaXMgYXMgZm9sbG93czogV2hlbiBwbGF5aW5nIGF1ZGlvIEkgd2lsbCByZWd1
bGFybHkgaGF2ZSBtYWpvcgphdWRpbyBpc3N1ZXMsIHNpbWlsYXIgdG8gdGhhdCBvZiBhIHNraXBw
aW5nIENELiBUaGlzIGlzIHJlcG9ydGVkIGJ5ClB1bHNlQXVkaW8gYXMgc2NoZWR1bGluZyBkZWxh
eXMgYW5kIGJ1ZmZlciB1bmRlcnJ1bnMgd2hlbiBydW5uaW5nClB1bHNlQXVkaW8gdmVyYm9zZWx5
IGFuZCB0aGVzZSBzY2hlZHVsaW5nIGRlbGF5cyBhcmUgYWx3YXlzIGp1c3QgdW5kZXIKNTAwbXMs
IHR5cGljYWxseSBhcm91bmQgNDkwbXMuIFRoaXMgbWFrZXMgbGlzdGVuaW5nIHRvIGFueSBtdXNp
YyBxdWl0ZQp0aGUgaG9ycmlibGUgZXhwZXJpZW5jZSBhcyBQdWxzZUF1ZGlvIGNvbnN0YW50bHkg
d2lsbCBhdHRlbXB0IHRvIHJld2luZAphbmQgY2F0Y2ggdXAuIEl0IGlzIG5vdCBhIGdyZWF0IHNp
dHVhdGlvbiwgYW5kIHNlZW1zIHRvIG1lIHRvIHF1aXRlCmNsZWFybHkgYmUgYSBjYXNlIHdoZXJl
IHJlZ3VsYXIgdXNlciBzcGFjZSBiZWhhdmlvdXIgaGFzIGJlZW4gYnJva2VuLgoKSSB3YW50IHRv
IG5vdGUgdGhhdCB0aGlzIGF1ZGlvIHByb2JsZW0gd2FzIG5vdCBzb21ldGhpbmcgSSBleHBlcmll
bmNlZAp1bnRpbCByZWNlbnRseSwgaXQgaXMgdGhlcmVmb3JlIGEgbmV3IGJ1Zy4KCkkgaGF2ZSBi
aXNlY3RlZCB0aGUga2VybmVsIHRvIGZpbmQgb3V0IHdoZXJlIHRoZSBwcm9ibGVtIG9yaWdpbmF0
ZWQgYW5kCmZvdW5kIHRoZSBmb2xsb3dpbmcgY29tbWl0OgoKIyBmaXJzdCBiYWQgY29tbWl0OiBb
ZjU3NDJlYzM2NDIyYTM5YjU3ZjAyNTZlNDg0N2Y2MWIzYzQzMmY4Y10gZHJtL2FtZC9wb3dlcnBs
YXk6IGNvcnJlY3QgcG93ZXIgcmVhZGluZyBvbiBmaWppCgpUaGlzIGNvbW1pdCBpbnRyb2R1Y2Vz
IGEgYmxvY2tpbmcgZGVsYXkgKG1kZWxheSkgb2YgNTAwbXMsIHdoZXJlYXMgdGhlCm9sZCBiZWhh
dmlvdXIgd2FzIGEgc21hbGxlciBibG9ja2luZyBkZWxheSBvZiBvbmx5IDFtcy4gVGhpcyBzZWVt
cyB0byBtZQp0byBiZSB2ZXJ5IGN1cmlvdXMgYXMgdGhlIHNjaGVkdWxpbmcgZGVsYXlzIG9mIFB1
bHNlQXVkaW8gYXJlIGFsd2F5cwphbG1vc3QgNTAwbXMuIEkgaGF2ZSB0aGVyZWZvcmUgd2l0aCB0
aGUgcHJldmlvdXMgcGF0Y2ggcmVwbGFjZWQgdGhlCnNjaGVkdWxpbmcgZGVsYXkgd2l0aCBhIG5v
bi1ibG9ja2luZyBzbGVlcCAobXNsZWVwKS4KClRoZSByZXN1bHRzIG9mIHRoZSBwYXRjaCBzZWVt
cyBwcm9taXNpbmcgYXMgSSBoYXZlIHlldCB0byBlbmNvdW50ZXIgYW55Cm9mIHRoZSBvbGQgPDUw
MG1zIHNjaGVkdWxpbmcgZGVsYXlzIHdoZW4gdXNpbmcgaXQgYW5kIEkgaGF2ZSBhbHNvIG5vdApl
bmNvdW50ZXJlZCBhbnkga2VybmVsIGxvZyBtZXNzYWdlcyByZWdhcmRpbmcgc2xlZXBpbmcgaW4g
YW4gYXRvbWljCmNvbnRleHQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
