Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F5823B4CA
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FEEA6E40C;
	Tue,  4 Aug 2020 06:06:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7298A89BF0;
 Tue,  4 Aug 2020 06:06:19 +0000 (UTC)
IronPort-SDR: z5WP32Pc76f2ZQ3OdClMoQRxKsKotNVSpYFvWz36LthNqQ8JRh1FQzeB2kqzi20VMe5LWL62Wk
 DDVzzSmWXuyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9702"; a="152221967"
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="152221967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2020 23:06:18 -0700
IronPort-SDR: wPcmg8ksMQPMpGJ4jGIFNNgG3GjeBBIQx5EiwX42nr4EY4iSI8M6q96UvFGg3MwYdu8gh/63Vm
 EQpvEboOjFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,433,1589266800"; d="scan'208";a="274347693"
Received: from kbs1-mobl1.gar.corp.intel.com (HELO [10.213.68.75])
 ([10.213.68.75])
 by fmsmga007.fm.intel.com with ESMTP; 03 Aug 2020 23:06:15 -0700
Subject: Re: [PATCH v5 0/5] Asynchronous flip implementation for i915
To: "Kulkarni, Vandita" <vandita.kulkarni@intel.com>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>,
 "Vetter, Daniel" <daniel.vetter@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20200720113117.16131-1-karthik.b.s@intel.com>
 <9e43a819525424c36438329222fa1a3946c57c89.camel@intel.com>
 <57510F3E2013164E925CD03ED7512A3B86351230@BGSMSX102.gar.corp.intel.com>
 <f439795a-6a95-2e96-b511-42b4f5725e04@daenzer.net>
 <57510F3E2013164E925CD03ED7512A3B916F1058@BGSMSX152.gar.corp.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <a540f414-79b6-e298-c2e4-3e68734056b0@intel.com>
Date: Tue, 4 Aug 2020 11:36:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <57510F3E2013164E925CD03ED7512A3B916F1058@BGSMSX152.gar.corp.intel.com>
Content-Language: en-US
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
Cc: "Shankar, Uma" <uma.shankar@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpPbiA4LzQvMjAyMCAxMToxOSBBTSwgS3Vsa2FybmksIFZhbmRpdGEgd3JvdGU6Cj4+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtaWNoZWxAZGFl
bnplci5uZXQ+Cj4+IFNlbnQ6IFdlZG5lc2RheSwgSnVseSAyOSwgMjAyMCAxOjA0IFBNCj4+IFRv
OiBLdWxrYXJuaSwgVmFuZGl0YSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRlbC5jb20+OyBaYW5vbmks
IFBhdWxvIFIKPj4gPHBhdWxvLnIuemFub25pQGludGVsLmNvbT47IFZldHRlciwgRGFuaWVsIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT47IEIgUywKPj4gS2FydGhpayA8a2FydGhpay5iLnNAaW50
ZWwuY29tPjsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgU2hhbmthciwgVW1hCj4+IDx1bWEuc2hhbmthckBpbnRl
bC5jb20+OyBuaWNob2xhcy5rYXpsYXVza2FzQGFtZC5jb20KPj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2NSAwLzVdIEFzeW5jaHJvbm91cyBmbGlwIGltcGxlbWVudGF0aW9uIGZvciBpOTE1Cj4+Cj4+
IE9uIDIwMjAtMDctMjkgOToyMyBhLm0uLCBLdWxrYXJuaSwgVmFuZGl0YSB3cm90ZToKPj4+Cj4+
PiBPbiBhc3luYyBmbGlwcywgdGhlcmUgbmVlZHMgdG8gYmUgc29tZSBjbGFyaXR5L2d1aWRlbGlu
ZSBvbiB0aGUKPj4+IGJlaGF2aW91ciBhbmQgZXZlbnQgZXhwZWN0YXRpb24gZnJvbSB0aGUgZHJp
dmVyIGJ5IHVzZXIgc3BhY2UuCj4+PiBIZXJlIGFyZSBmZXcgYXNzdW1wdGlvbnMgdGhhdCB3ZSBo
YXZlLCAxLiBPdXIgdW5kZXJzdGFuZGluZyBpcyB0aGF0Cj4+PiB0aGUgdXNlciBzcGFjZSBkb2Vz
buKAmXQgZXhwZWN0IHRoZSB0aW1lc3RhbXAgZm9yIGFzeW5jIGZsaXBzIChidXQgc3RpbGwKPj4+
IGV4cGVjdHMgdmJsYW5rIHRpbWVzdGFtcCkgLCBvciBkb2VzbuKAmXQgZG8gYW55dGhpbmcgd2l0
aCB0aGF0LCBzYW1lIGlzIHRoZQo+PiBhc3N1bXB0aW9uIHdydCB0aGUgZmxpcCBzZXF1ZW5jZSwg
cGxlYXNlIGNvcnJlY3QgdXMgaWYgd2UgYXJlIHdyb25nLgo+Pj4gMi4gSW4gdGhlIHNlcXVlbmNl
IHRoZSB1c2VyIHNwYWNlIHN0aWxsIGV4cGVjdHMgdGhlIGNvdW50ZXIgdGhhdCBtYXJrcwo+PiB2
YmxhbmtzLgo+Pj4gMy4gVGhlIHVzZXIgc3BhY2UgY2FuIHVzZSBkaWZmZXJlbnQgZXZlbnQgdHlw
ZXMgbGlrZSBEUk1fRVZFTlRfVkJMQU5LCj4+PiBvciBEUk1fRVZFTlRfRkxJUF9DT01QTEVURSBm
b3IgZ2V0dGluZyB0aGUgY29ycmVzcG9uZGluZyBldmVudC4gQW5kCj4+IHRoZWlyIGRlc2lnbnMg
YXJlIHN0aWxsIGFsaWduZWQgdG8gdGhpcyBldmVuIGluIGNhc2Ugb2YgYXN5bmMuCj4+Pgo+Pj4g
SWYgdGhlcmUgYXJlIGFueSBtb3JlIGV4cGVjdGF0aW9ucyBmcm9tIHRoZSB1c2VyIHNwYWNlIHdy
dCB0byB0aGUKPj4+IGV2ZW50IHRoYXQgaXMgYmVpbmcgc2VudCBmcm9tIHRoZSBkcml2ZXIgaW4g
Y2FzZSBvZiBhc3luYyBmbGlwLCBwbGVhc2UgbGV0IHVzCj4+IGtub3cuCj4+Pgo+Pj4gSWYgdGhl
IHVzZXIgc3BhY2UgZG9lc27igJl0IGNhcmUgbXVjaCBhYm91dCB0aGUgZmxpcCBzZXF1ZW5jZSB0
aGVuLCB3ZQo+Pj4gY2FuIGp1c3Qgbm90IGRvIGFueXRoaW5nIGxpa2UgcmV0dXJuaW5nIHRoZSBm
bGlwIGNvdW50ZXIgbGlrZSB0aGlzIHZlcnNpb24gaXMKPj4gZG9pbmcgYW5kIGp1c3Qgc3RpY2sg
dG8gcmV0dXJuaW5nIG9mIHRoZSBmcmFtZSBjb3VudGVyIHZhbHVlKHdoaWNoIG1hcmtzCj4+IHZi
bGFua3MpLgo+Pgo+PiBUaGVyZSdzIG5vIHN1Y2ggdGhpbmcgYXMgYSAiZmxpcCBzZXF1ZW5jZSIg
aW4gdGhlIEtNUyBBUEkuIFRoZXJlJ3Mgb25seSB0aGUKPj4gcGVyLUNSVEMgdmJsYW5rIGNvdW50
ZXIuIEVhY2ggZmxpcCBjb21wbGV0aW9uIGV2ZW50IG5lZWRzIHRvIGNvbnRhaW4gdGhlCj4+IHZh
bHVlIG9mIHRoYXQgY291bnRlciB3aGVuIHRoZSBoYXJkd2FyZSBjb21wbGV0ZWQgdGhlIGZsaXAs
IHJlZ2FyZGxlc3Mgb2YKPj4gd2hldGhlciBpdCB3YXMgYW4gYXN5bmMgZmxpcCBvciBub3QuCj4+
Cj4+IEFzIGZvciB0aGUgdGltZXN0YW1wIGluIHRoZSBldmVudCwgSSdtIG5vdCBzdXJlIHdoYXQg
dGhlIGV4cGVjdGF0aW9ucyBhcmUgZm9yCj4+IGFzeW5jIGZsaXBzLCBidXQgSSBzdXNwZWN0IGl0
IG1heSBub3QgcmVhbGx5IG1hdHRlci4gRS5nLiB0aGUgdGltZXN0YW1wCj4+IGNhbGN1bGF0ZWQg
dG8gY29ycmVzcG9uZCB0byB0aGUgZW5kIG9mIHRoZSBwcmV2aW91cyB2ZXJ0aWNhbCBibGFuayBw
ZXJpb2QKPj4gbWlnaHQgYmUgZmluZS4KPiAKPiBUaGFua3MgTWljaGVsLCBQYXVsbywgRGFuaWVs
LCBOaWNob2xhcywgVmlsbGUgZm9yIHlvdXIgaW5wdXRzLgo+IEFmdGVyIGFsbCB0aGUgZGlzY3Vz
c2lvbnMsIGxvb2tzIGxpa2UgdGhlIGFzeW5jIGZsaXAgdGltZSBzdGFtcCBpcyBub3Qgb2YgbXVj
aAo+IHVzZSB0byB0aGUgdXNlcnNwYWNlIGFuZCB0aGUgYXN5bmMgZmxpcCBzZXF1ZW5jZTsgaGVu
Y2Ugd2Ugd2lsbCBzdGljayB0byB0aGUgYXBwcm9hY2ggb2Ygc2VuZGluZyB2YmxhbmsgdGltZSBz
dGFtcAo+IGl0c2VsZiBhbmQgaGF2ZSBhIHRlc3QgY2FzZSBpbiB0aGUgaWd0IHRvIGNvdmVyIHRo
ZSBhc3luYyBmbGlwcyBjYXNlcyBpbiBhIHNsaWdodGx5IGRpZmZlcmVudCB3YXkuCj4gQW5kIHVw
ZGF0ZSB0aGUgZG9jdW1lbnRhdGlvbi4KPiAKClRoYW5rcyBhIGxvdCBmb3IgYWxsIHRoZSBpbnB1
dHMuCgpJIHdpbGwgbWFrZSBjaGFuZ2VzIGluIElHVCB0byBjYWxjdWxhdGUgdGhlIHRpbWUgc3Rh
bXBzIGZyb20gdXNlcnNwYWNlIAppdHNlbGYsIGFzIHdlIGhhdmUgbm93IGNvbmNsdWRlZCB0aGF0
IHRoZSBrZXJuZWwgd2lsbCBiZSByZXR1cm5pbmcgdmJsIAp0aW1lc3RhbXBzIGV2ZW4gaW4gdGhl
IGNhc2Ugb2YgYXN5bmMgZmxpcHMuCgpBbHNvLCBhcyBzdWdnZXN0ZWQgYnkgRGFuaWVsLCBJIHdp
bGwgYmUgYWRkaW5nIG9uZSBtb3JlIHN1YnRlc3QgdG8gCnZlcmlmeSB0aGF0IHRoZSBhc3luYyBm
bGlwIHRpbWUgc3RhbXAgbGllcyBpbiBiZXR3ZWVuIHRoZSB0aW1lc3RhbXBzIG9mIAp0aGUgcHJl
dmlvdXMgYW5kIHRoZSBuZXh0IHZibGFuay4KClRoYW5rcywKS2FydGhpay5CLlMKPiBUaGFua3Ms
Cj4gVmFuZGl0YQo+Pgo+Pgo+PiAtLQo+PiBFYXJ0aGxpbmcgTWljaGVsIETDpG56ZXIgICAgICAg
ICAgICAgICB8ICAgICAgICAgICAgICAgaHR0cHM6Ly9yZWRoYXQuY29tCj4+IExpYnJlIHNvZnR3
YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFuZCBYIGRldmVs
b3BlcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
