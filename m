Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D3DB18E1
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 106536EEB3;
	Fri, 13 Sep 2019 07:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 903 seconds by postgrey-1.36 at gabe;
 Thu, 12 Sep 2019 21:06:40 UTC
Received: from mx1.yrkesakademin.fi (mx1.yrkesakademin.fi [85.134.45.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA52C6EE2D;
 Thu, 12 Sep 2019 21:06:40 +0000 (UTC)
Subject: Re: [PATCH AUTOSEL 5.2 13/23] drm/i915/userptr: Acquire the page lock
 around set_page_dirty()
To: Sasha Levin <sashal@kernel.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>
References: <20190903162424.6877-1-sashal@kernel.org>
 <20190903162424.6877-13-sashal@kernel.org>
From: Thomas Backlund <tmb@mageia.org>
Message-ID: <36993214-6ce7-260f-68c7-6fbb0630143f@mageia.org>
Date: Thu, 12 Sep 2019 23:51:33 +0300
MIME-Version: 1.0
In-Reply-To: <20190903162424.6877-13-sashal@kernel.org>
Content-Language: en-US
X-WatchGuard-Spam-ID: str=0001.0A0C0209.5D7AB361.007B, ss=1, re=0.000,
 recu=0.000, reip=0.000, cl=1, cld=1, fgs=0
X-WatchGuard-Spam-Score: 0, clean; 0, virus threat unknown
X-WatchGuard-Mail-Client-IP: 85.134.45.194
X-WatchGuard-Mail-From: tmb@mageia.org
X-Mailman-Approved-At: Fri, 13 Sep 2019 07:24:41 +0000
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVuIDAzLTA5LTIwMTkga2wuIDE5OjI0LCBza3JldiBTYXNoYSBMZXZpbjoKPiBGcm9tOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAKPiBbIFVwc3RyZWFtIGNvbW1p
dCBhYTU2YTI5MmNlNjIzNzM0ZGRkMzBmNTJkNzNmNTI3ZDFmMzUyOWI1IF0KPiAKPiBzZXRfcGFn
ZV9kaXJ0eSBzYXlzOgo+IAo+IAlGb3IgcGFnZXMgd2l0aCBhIG1hcHBpbmcgdGhpcyBzaG91bGQg
YmUgZG9uZSB1bmRlciB0aGUgcGFnZSBsb2NrCj4gCWZvciB0aGUgYmVuZWZpdCBvZiBhc3luY2hy
b25vdXMgbWVtb3J5IGVycm9ycyB3aG8gcHJlZmVyIGEKPiAJY29uc2lzdGVudCBkaXJ0eSBzdGF0
ZS4gVGhpcyBydWxlIGNhbiBiZSBicm9rZW4gaW4gc29tZSBzcGVjaWFsCj4gCWNhc2VzLCBidXQg
c2hvdWxkIGJlIGJldHRlciBub3QgdG8uCj4gCj4gVW5kZXIgdGhvc2UgcnVsZXMsIGl0IGlzIG9u
bHkgc2FmZSBmb3IgdXMgdG8gdXNlIHRoZSBwbGFpbiBzZXRfcGFnZV9kaXJ0eQo+IGNhbGxzIGZv
ciBzaG1lbWZzL2Fub255bW91cyBtZW1vcnkuIFVzZXJwdHIgbWF5IGJlIHVzZWQgd2l0aCByZWFs
Cj4gbWFwcGluZ3MgYW5kIHNvIG5lZWRzIHRvIHVzZSB0aGUgbG9ja2VkIHZlcnNpb24gKHNldF9w
YWdlX2RpcnR5X2xvY2spLgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5v
cmcvc2hvd19idWcuY2dpP2lkPTIwMzMxNwo+IEZpeGVzOiA1Y2M5ZWQ0YjlhN2EgKCJkcm0vaTkx
NTogSW50cm9kdWNlIG1hcHBpbmcgb2YgdXNlciBwYWdlcyBpbnRvIHZpZGVvIG1lbW9yeSAodXNl
cnB0cikgaW9jdGwiKQo+IFJlZmVyZW5jZXM6IDZkY2M2OTNiYzU3ZiAoImV4dDQ6IHdhcm4gd2hl
biBwYWdlIGlzIGRpcnRpZWQgd2l0aG91dCBidWZmZXJzIikKPiBTaWduZWQtb2ZmLWJ5OiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiBDYzogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwo+
IFJldmlld2VkLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+
IExpbms6IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDE5
MDcwODE0MDMyNy4yNjgyNS0xLWNocmlzQGNocmlzLXdpbHNvbi5jby51awo+IChjaGVycnkgcGlj
a2VkIGZyb20gY29tbWl0IGNiNmQ3YzdkYzdmZjhjYWNlNjY2ZGRlYzY2MzM0MTE3YTYwNjhjZTIp
Cj4gU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Cj4gLS0tCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV91c2VycHRyLmMgfCAxMCArKysrKysrKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3VzZXJwdHIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX3VzZXJwdHIuYwo+IGluZGV4IDgwNzllYTNhZjEwMzku
LmIxZmMxNWM3ZjU5OTcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9n
ZW1fdXNlcnB0ci5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9nZW1fdXNlcnB0
ci5jCj4gQEAgLTY3OCw3ICs2NzgsMTUgQEAgaTkxNV9nZW1fdXNlcnB0cl9wdXRfcGFnZXMoc3Ry
dWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaiwKPiAgIAo+ICAgCWZvcl9lYWNoX3NndF9wYWdl
KHBhZ2UsIHNndF9pdGVyLCBwYWdlcykgewo+ICAgCQlpZiAob2JqLT5tbS5kaXJ0eSkKPiAtCQkJ
c2V0X3BhZ2VfZGlydHkocGFnZSk7Cj4gKwkJCS8qCj4gKwkJCSAqIEFzIHRoaXMgbWF5IG5vdCBi
ZSBhbm9ueW1vdXMgbWVtb3J5IChlLmcuIHNobWVtKQo+ICsJCQkgKiBidXQgZXhpc3Qgb24gYSBy
ZWFsIG1hcHBpbmcsIHdlIGhhdmUgdG8gbG9jawo+ICsJCQkgKiB0aGUgcGFnZSBpbiBvcmRlciB0
byBkaXJ0eSBpdCAtLSBob2xkaW5nCj4gKwkJCSAqIHRoZSBwYWdlIHJlZmVyZW5jZSBpcyBub3Qg
c3VmZmljaWVudCB0bwo+ICsJCQkgKiBwcmV2ZW50IHRoZSBpbm9kZSBmcm9tIGJlaW5nIHRydW5j
YXRlZC4KPiArCQkJICogUGxheSBzYWZlIGFuZCB0YWtlIHRoZSBsb2NrLgo+ICsJCQkgKi8KPiAr
CQkJc2V0X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKPiAgIAo+ICAgCQltYXJrX3BhZ2VfYWNjZXNz
ZWQocGFnZSk7Cj4gICAJCXB1dF9wYWdlKHBhZ2UpOwo+IAoKClBsZWFzZSBkcm9wIHRoaXMgb25l
IGZyb20gYWxsIDUuMiBhbmQgNC4xOSBzdGFibGUgcXVldWVzCgpJdCBoYXMgbm93IGJlZW4gcmV2
ZXJ0ZWQgaW4gTGludXMgdHJlZToKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L2NvbW1pdC8/aWQ9NTA1YThlYzdlMTFhZTUy
MzZjNGExNTRhMWUyNGVmNDlhODM0OTYwMAoKLS0KVGhvbWFzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
