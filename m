Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9363A2F65ED
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB3589A86;
	Thu, 14 Jan 2021 16:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5981089A86
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:28:41 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DE8A2B3;
 Thu, 14 Jan 2021 17:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641719;
 bh=nKghQ/mH92OH+mKhVZWSEjmXxLX1Hyb82OzDXoSCnuU=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ro8JmhLeWvi1lznZHo77cDrsbt6sCf5msmS7+XRoKOvz7zFKRDAQ6an9ARusofR/A
 E1tMMLJpBe/GdWtgSdjDs79wSzBNLPBvljrg/5hRGocQoWP46eQvf7qb6I8M+4xmxT
 ogwC6XxsB2Mn06GZ8lsJYtST5xv8hiXQAIpax2nc=
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, eric@anholt.net,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
 <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>
Date: Thu, 14 Jan 2021 16:28:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLAoKT24gMTQvMDEvMjAyMSAxNToxNSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
Cj4+Pj4gT24gMjMvMTEvMjAyMCAxMTo1NiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cj4+Pj4+
IFRoZSBuZXcgR0VNIG9iamVjdCBmdW5jdGlvbiBkcm1fZ2VtX2NtYV9tbWFwKCkgc2V0cyB0aGUg
Vk1BIGZsYWdzCj4+Pj4+IGFuZCBvZmZzZXQgYXMgaW4gdGhlIG9sZCBpbXBsZW1lbnRhdGlvbiBh
bmQgaW1tZWRpYXRlbHkgbWFwcyBpbiB0aGUKPj4+Pj4gYnVmZmVyJ3MgbWVtb3J5IHBhZ2VzLgo+
Pj4+Pgo+Pj4+PiBDaGFuZ2luZyBDTUEgaGVscGVycyB0byB1c2UgdGhlIEdFTSBvYmplY3QgZnVu
Y3Rpb24gYWxsb3dzIGZvciB0aGUKPj4+Pj4gcmVtb3ZhbCBvZiB0aGUgc3BlY2lhbCBpbXBsZW1l
bnRhdGlvbnMgZm9yIG1tYXAgYW5kIGdlbV9wcmltZV9tbWFwCj4+Pj4+IGNhbGxiYWNrcy4gVGhl
IHJlZ3VsYXIgZnVuY3Rpb25zIGRybV9nZW1fbW1hcCgpIGFuZAo+Pj4+PiBkcm1fZ2VtX3ByaW1l
X21tYXAoKQo+Pj4+PiBhcmUgbm93IHVzZWQuCj4+Pj4KPj4+PiBJJ3ZlIGVuY291bnRlcmVkIGEg
bWVtb3J5IGxlYWsgcmVncmVzc2lvbiBpbiBvdXIgUmVuZXNhcyBSLUNhciBEVQo+Pj4+IHRlc3Rz
LAo+Pj4+IGFuZCBnaXQgYmlzZWN0aW9uIGhhcyBsZWQgbWUgdG8gdGhpcyBwYXRjaCAoYXMgY29t
bWl0IGY1Y2E4ZWI2ZjkpLgo+Pj4+Cj4+Pj4gUnVubmluZyB0aGUgdGVzdHMgc2VxdWVudGlhbGx5
LCB3aGlsZSBncmVwcGluZyAvcHJvYy9tZW1pbmZvIGZvcgo+Pj4+IENtYSwgaXQKPj4+PiBpcyBl
dmlkZW50IHRoYXQgQ01BIG1lbW9yeSBpcyBub3QgcmVsZWFzZWQsIHVudGlsIGV4aGF1c3RlZCBh
bmQgdGhlCj4+Pj4gYWxsb2NhdGlvbnMgZmFpbCAoc2VlbiBpbiBbMF0pIHNob3duIGJ5IHRoZSBl
cnJvciByZXBvcnQ6Cj4+Pj4KPj4+Pj4gwqDCoMKgwqDCoCBzZWxmLmZicy5hcHBlbmQocHlrbXMu
RHVtYkZyYW1lYnVmZmVyKHNlbGYuY2FyZCwgbW9kZS5oZGlzcGxheSwKPj4+Pj4gbW9kZS52ZGlz
cGxheSwgIlhSMjQiKSkKPj4+Pj4gVmFsdWVFcnJvcjogRFJNX0lPQ1RMX01PREVfQ1JFQVRFX0RV
TUIgZmFpbGVkOiBDYW5ub3QgYWxsb2NhdGUgbWVtb3J5Cj4+Pj4KPj4+Pgo+Pj4+IEZhaWxpbmcg
dGVzdHMgYXQgZjVjYThlYjZmOSBjYW4gYmUgc2VlbiBhdCBbMF0sIHdoaWxlIHRoZSB0ZXN0cyBw
YXNzCj4+Pj4gc3VjY2Vzc2Z1bGx5IFsxXSBvbiB0aGUgY29tbWl0IHByZXZpb3VzIHRvIHRoYXQg
KGJjMjUzMmFiN2MyKToKPj4+Pgo+Pj4+IFJldmVydGluZyBmNWNhOGViNmY5IGFsc28gcHJvZHVj
ZXMgYSBzdWNjZXNzZnVsIHBhc3MgWzJdCj4+Pj4KPj4+PiDCoMKgIFswXSBodHRwczovL3Bhc3Rl
LnVidW50dS5jb20vcC9WalBHUGdzd3hSLyAjIEZhaWxlZCBhdCBmNWNhOGViNmY5Cj4+Pj4gwqDC
oCBbMV0gaHR0cHM6Ly9wYXN0ZS51YnVudHUuY29tL3AvNzhSUnAyV3BOUi8gIyBTdWNjZXNzIGF0
IGJjMjUzMmFiN2MyCj4+Pj4gwqDCoCBbMl0gaHR0cHM6Ly9wYXN0ZS51YnVudHUuY29tL3AvcUpL
alpaTjJwdC8gIyBTdWNjZXNzIHdpdGggcmV2ZXJ0Cj4+Pj4KPj4+Pgo+Pj4+IEkgZG9uJ3QgYmVs
aWV2ZSB3ZSBoYW5kbGUgbW1hcCBzcGVjaWFsbHkgaW4gdGhlIFJDYXItRFUgZHJpdmVyLCBzbyBJ
Cj4+Pj4gd29uZGVyIGlmIHRoaXMgaXNzdWUgaGFzIGhpdCBhbnlvbmUgZWxzZSBhcyB3ZWxsPwo+
Pj4+Cj4+Pj4gQW55IGlkZWFzIG9mIGEgcmVwYWlyIHdpdGhvdXQgYSByZXZlcnQgPyBPciBkbyB3
ZSBqdXN0IG5lZWQgdG8gc3VibWl0IGEKPj4+PiByZXZlcnQ/Cj4+Pgo+Pj4gSSB0aGluayB3ZSBt
aWdodCBub3QgYmUgc2V0dGluZyB0aGUgVk1BIG9wcyBhbmQgdGhlcmVmb3JlIG5vdCBmaW5hbGl6
ZQo+Pj4gdGhlIEJPIGNvcnJlY3RseS4gQ291bGQgeW91IHBsZWFzZSBhcHBseSB0aGUgYXR0Y2hl
ZCAocXVpY2stYW5kLWRpcnR5KQo+Pj4gcGF0Y2ggYW5kIHRyeSBhZ2Fpbj8KPj4KPj4gVGhhbmtz
IGZvciB0aGUgcXVpY2sgcmVzcG9uc2UuCj4+Cj4+IEkgY2FuIGNvbmZpcm0gdGhlIHF1aWNrLWFu
ZC1kaXJ0eSBwYXRjaCByZXNvbHZlcyB0aGUgaXNzdWU6Cj4+IMKgwqAgaHR0cHM6Ly9wYXN0ZS51
YnVudHUuY29tL3Avc0tEcDNkTnZ3Vi8KPj4KPj4gWW91IGNhbiBhZGQgYQo+PiBUZXN0ZWQtYnk6
IEtpZXJhbiBCaW5naGFtIDxraWVyYW4uYmluZ2hhbStyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+
Cj4gCj4gR3JlYXQhIElmIHlvdSBkb24ndCBtaW5kLCBJJ2QgYWxzbyBhZGQgeW91IGluIHRoZSBS
ZXBvcnRlZC1ieSB0YWcuCgpDZXJ0YWlubHkhCgo+Pgo+PiBpZiBpdCBzdGF5cyBsaWtlIHRoYXQs
IGJ1dCBJIHN1c3BlY3QgdGhlcmUgbWlnaHQgYmUgYSBiZXR0ZXIgcGxhY2UgdG8KPj4gaW5pdGlh
bGlzZSB0aGUgb3BzIHJhdGhlciB0aGFuIGluIHRoZSBtbWFwIGNhbGwgaXRzZWxmLgo+IAo+IEkg
dGhpbmsgdGhhdCdzIHRoZSBmaXgsIGJhc2ljYWxseS4gV2UgY291bGQgcHV0IHN1Y2ggYSBsaW5l
IGFzIGEKPiBmYWxsLWJhY2sgc29tZXdoZXJlIGludG8gdGhlIERSTSBjb3JlIGNvZGUuIEJ1dCBJ
IGRvbid0IGtub3cgaWYgdGhpcwo+IHJlYWxseSB3b3JrcyB3aXRoIGFsbCBkcml2ZXJzLiBNYXli
ZSB0aGVyZSdzIG9uZSB0aGF0IHJlcXVpcmVzIHZtX29wcyB0bwo+IGJlIE5VTEwuCgpPaywgdGhh
dCdzIHJlYWNoaW5nIGJleW9uZCBjb2RlIEkndmUgZXhwbG9yZWQsIHNvIEknbGwgbGVhdmUgaXQg
dG8geW91LgoKCj4gVGhhbmtzIGZvciByZXBvcnRpbmcgdGhpcyBpc3N1ZSBhbmQgdGVzdGluZyBx
dWlja2x5LgoKVGhhbmtzIGZvciBmaXhpbmcgc28gcXVpY2tseSA6LSkKClJlZ2FyZHMKCktpZXJh
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
