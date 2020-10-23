Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0058F297D9E
	for <lists+dri-devel@lfdr.de>; Sat, 24 Oct 2020 19:05:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 001036E901;
	Sat, 24 Oct 2020 17:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEF56E2E1;
 Fri, 23 Oct 2020 18:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=sSHscReIOky4s2YqhdJExEQEr3QLb6PUad1azvWlF30=; b=bmsxUUxca14wmg+tWuc9J1Um54
 mwroxkG794AcVyl8IP7HQsnwrASV2FxLYnIfozn/D8XrX/Mo+fexew4sRMCVCOnkMdWZkjtcgEDjX
 REIeoGHTnPvZ1jCNCHVxphOPMLqGWJ4WXE2e6sRjXih7ax+g+bRCkDRpBAZgG9FzszKFIb6ejmT5i
 N9zLluyc760N2toNQTl5e2otI6XmQORpnxTNE/HcSLj+sD5Xqh6hjvdtr13zzC+iHhh5FmIaoJ6wc
 r+JuKK4IQruoWQ1HN+oDW0Lcy2j+AjJdTPwcXmJAKrdMjUuhoT7npBSLr6TuWbu6zZqIKEehPkxnv
 8rNvuoAQ==;
Received: from [2601:1c0:6280:3f0::507c]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kW1QW-0005sn-H0; Fri, 23 Oct 2020 18:04:32 +0000
Subject: Re: [PATCH] drm/modes: Switch to 64bit maths to avoid integer overflow
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <a9b837f9-1293-b513-230a-5aa7385e2a3f@infradead.org>
Date: Fri, 23 Oct 2020 11:04:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201022194256.30978-1-ville.syrjala@linux.intel.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 24 Oct 2020 17:05:18 +0000
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMjIvMjAgMTI6NDIgUE0sIFZpbGxlIFN5cmphbGEgd3JvdGU6Cj4gRnJvbTogVmlsbGUg
U3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiAKPiBUaGUgbmV3ID44
ayBDRUEgbW9kZXMgaGF2ZSBkb3RjbG9ja3MgcmVhY2hpbmcgNS45NCBHSHosIHdoaWNoCj4gbWVh
bnMgb3VyIGNsb2NrKjEwMDAgd2lsbCBub3cgb3ZlcmZsb3cgdGhlIDMyYml0IHVuc2lnbmVkCj4g
aW50ZWdlci4gU3dpdGNoIHRvIDY0Yml0IG1hdGhzIHRvIGF2b2lkIGl0Lgo+IAo+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4gUmVwb3J0ZWQtYnk6IFJhbmR5IER1bmxhcCA8cmR1bmxhcEBp
bmZyYWRlYWQub3JnPgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3ly
amFsYUBsaW51eC5pbnRlbC5jb20+CgpUaGlzIGN1cmVzIHRoZSBwcm9ibGVtIHRoYXQgSSByZXBv
cnRlZC4gVGhhbmtzLgoKVGVzdGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFk
Lm9yZz4KCj4gLS0tCj4gQW4gaW50ZXJlc3RpbmcgcXVlc3Rpb24gaG93IG1hbnkgb3RoZXIgcGxh
Y2UgbWlnaHQgc3VmZmVyIGZyb20gc2ltaWxhcgo+IG92ZXJmbG93cy4gSSB0aGluayBpOTE1IHNo
b3VsZCBiZSBtb3N0bHkgT0suIFRoZSBvbmUgcGxhY2UgSSBrbm93IHdlIHVzZQo+IEh6IGluc3Rl
YWQga0h6IGlzIHRoZSBoc3cgRFBMTCBjb2RlLCB3aGljaCBJIHdvdWxkIHByZWZlciB3ZSBhbHNv
IGNoYW5nZQo+IHRvIHVzZSBrSHouIFRoZSBvdGhlciBjb25jZXJuIGlzIHdoZXRoZXIgd2UgaGF2
ZSBhbnkgcG90ZW50aWFsIG92ZXJmbG93cwo+IGJlZm9yZSB3ZSBjaGVjayB0aGlzIGFnYWluc3Qg
dGhlIHBsYXRmb3JtJ3MgbWF4IGRvdGNsb2NrLgo+IAo+IEkgZG8gaGF2ZSB0aGlzIHVucmV2aWV3
ZWQgaWd0IHNlcmllcyAKPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVz
LzY5NTMxLyB3aGljaCBleHRlbmRzIHRoZQo+IGN1cnJlbnQgdGVzdGluZyB3aXRoIHNvbWUgb3Ro
ZXIgZm9ybXMgb2YgaW52YWxpZCBtb2Rlcy4gQ291bGQgcHJvYmFibHkKPiBleHRlbmQgdGhhdCB3
aXRoIGEgbW9kZS5jbG9jaz1JTlRfTUFYIHRlc3QgdG8gc2VlIGlmIGFueXRoaW5nIGVsc2UgbWln
aHQKPiB0cmlwIHVwLgo+IAo+IE5vIGlkZWEgYWJvdXQgb3RoZXIgZHJpdmVycy4KPiAKPiAgZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IGluZGV4IDUw
MWI0ZmU1NWEzZC4uNTExY2RlNWM3ZmE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwo+IEBAIC03NjIs
NyArNzYyLDcgQEAgaW50IGRybV9tb2RlX3ZyZWZyZXNoKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxh
eV9tb2RlICptb2RlKQo+ICAJaWYgKG1vZGUtPmh0b3RhbCA9PSAwIHx8IG1vZGUtPnZ0b3RhbCA9
PSAwKQo+ICAJCXJldHVybiAwOwo+ICAKPiAtCW51bSA9IG1vZGUtPmNsb2NrICogMTAwMDsKPiAr
CW51bSA9IG1vZGUtPmNsb2NrOwo+ICAJZGVuID0gbW9kZS0+aHRvdGFsICogbW9kZS0+dnRvdGFs
Owo+ICAKPiAgCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJMQUNFKQo+IEBA
IC03NzIsNyArNzcyLDcgQEAgaW50IGRybV9tb2RlX3ZyZWZyZXNoKGNvbnN0IHN0cnVjdCBkcm1f
ZGlzcGxheV9tb2RlICptb2RlKQo+ICAJaWYgKG1vZGUtPnZzY2FuID4gMSkKPiAgCQlkZW4gKj0g
bW9kZS0+dnNjYW47Cj4gIAo+IC0JcmV0dXJuIERJVl9ST1VORF9DTE9TRVNUKG51bSwgZGVuKTsK
PiArCXJldHVybiBESVZfUk9VTkRfQ0xPU0VTVF9VTEwobXVsX3UzMl91MzIobnVtLCAxMDAwKSwg
ZGVuKTsKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGRybV9tb2RlX3ZyZWZyZXNoKTsKPiAgCj4gCgoK
LS0gCn5SYW5keQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
