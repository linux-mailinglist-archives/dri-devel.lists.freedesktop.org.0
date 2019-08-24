Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048539BEF8
	for <lists+dri-devel@lfdr.de>; Sat, 24 Aug 2019 19:29:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3446E0DA;
	Sat, 24 Aug 2019 17:29:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9D476E0DA
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Aug 2019 17:29:20 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6F9F020870;
 Sat, 24 Aug 2019 17:29:17 +0000 (UTC)
Subject: Re: [PATCH v15 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190824013425.175645-1-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <a657b995-32b3-3352-bc10-834547e44dd4@kernel.org>
Date: Sat, 24 Aug 2019 11:29:16 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190824013425.175645-1-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566667760;
 bh=D3nLnnNPLuL/zFk4MNDUmFGzPOfuIQGc/sSLWQeMJCo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=qQvJssVcUppRZfxWiCWZqD4orXYOwW51Do+MjiJOlXvIE1EasomxA6H/BjQg/l+0v
 fa5vfHkA/8e+t+mj1UEi7/X+/xak2vcoK3eKYd2CcRnPgYkX6N9X5nDioWKtJGCcNl
 sMf76jjgFYGDYB4WceIHBLhFl/0T9P84t2fquPsY=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, kunit-dev@googlegroups.com,
 richard@nod.at, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMy8xOSA3OjM0IFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gIyMgVEw7RFIKPiAK
PiBUaGlzIHJldmlzaW9uIGFkZHJlc3NlcyBjb21tZW50cyBmcm9tIFNodWFoIGJ5IGZpeGluZyBh
IGNvdXBsZQo+IGNoZWNrcGF0Y2ggd2FybmluZ3MgYW5kIGZpeGluZyBzb21lIGNvbW1lbnQgcmVh
ZGFiaWxpdHkgaXNzdWVzLiBObyBBUEkKPiBvciBtYWpvciBzdHJ1Y3R1YWwgY2hhbmdlcyBoYXZl
IGJlZW4gbWFkZSBzaW5jZSB2MTMuCj4gCj4gIyMgQmFja2dyb3VuZAo+IAo+IFRoaXMgcGF0Y2gg
c2V0IHByb3Bvc2VzIEtVbml0LCBhIGxpZ2h0d2VpZ2h0IHVuaXQgdGVzdGluZyBhbmQgbW9ja2lu
Zwo+IGZyYW1ld29yayBmb3IgdGhlIExpbnV4IGtlcm5lbC4KPiAKPiBVbmxpa2UgQXV0b3Rlc3Qg
YW5kIGtzZWxmdGVzdCwgS1VuaXQgaXMgYSB0cnVlIHVuaXQgdGVzdGluZyBmcmFtZXdvcms7Cj4g
aXQgZG9lcyBub3QgcmVxdWlyZSBpbnN0YWxsaW5nIHRoZSBrZXJuZWwgb24gYSB0ZXN0IG1hY2hp
bmUgb3IgaW4gYSBWTQo+IChob3dldmVyLCBLVW5pdCBzdGlsbCBhbGxvd3MgeW91IHRvIHJ1biB0
ZXN0cyBvbiB0ZXN0IG1hY2hpbmVzIG9yIGluIFZNcwo+IGlmIHlvdSB3YW50WzFdKSBhbmQgZG9l
cyBub3QgcmVxdWlyZSB0ZXN0cyB0byBiZSB3cml0dGVuIGluIHVzZXJzcGFjZQo+IHJ1bm5pbmcg
b24gYSBob3N0IGtlcm5lbC4gQWRkaXRpb25hbGx5LCBLVW5pdCBpcyBmYXN0OiBGcm9tIGludm9j
YXRpb24KPiB0byBjb21wbGV0aW9uIEtVbml0IGNhbiBydW4gc2V2ZXJhbCBkb3plbiB0ZXN0cyBp
biBhYm91dCBhIHNlY29uZC4KPiBDdXJyZW50bHksIHRoZSBlbnRpcmUgS1VuaXQgdGVzdCBzdWl0
ZSBmb3IgS1VuaXQgcnVucyBpbiB1bmRlciBhIHNlY29uZAo+IGZyb20gdGhlIGluaXRpYWwgaW52
b2NhdGlvbiAoYnVpbGQgdGltZSBleGNsdWRlZCkuCj4gCj4gS1VuaXQgaXMgaGVhdmlseSBpbnNw
aXJlZCBieSBKVW5pdCwgUHl0aG9uJ3MgdW5pdHRlc3QubW9jaywgYW5kCj4gR29vZ2xldGVzdC9H
b29nbGVtb2NrIGZvciBDKysuIEtVbml0IHByb3ZpZGVzIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5n
Cj4gdW5pdCB0ZXN0IGNhc2VzLCBncm91cGluZyByZWxhdGVkIHRlc3QgY2FzZXMgaW50byB0ZXN0
IHN1aXRlcywgcHJvdmlkaW5nCj4gY29tbW9uIGluZnJhc3RydWN0dXJlIGZvciBydW5uaW5nIHRl
c3RzLCBtb2NraW5nLCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCj4gCj4gIyMjIFdoYXQncyBzbyBz
cGVjaWFsIGFib3V0IHVuaXQgdGVzdGluZz8KPiAKPiBBIHVuaXQgdGVzdCBpcyBzdXBwb3NlZCB0
byB0ZXN0IGEgc2luZ2xlIHVuaXQgb2YgY29kZSBpbiBpc29sYXRpb24sCj4gaGVuY2UgdGhlIG5h
bWUuIFRoZXJlIHNob3VsZCBiZSBubyBkZXBlbmRlbmNpZXMgb3V0c2lkZSB0aGUgY29udHJvbCBv
Zgo+IHRoZSB0ZXN0OyB0aGlzIG1lYW5zIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywgd2hpY2gg
bWFrZXMgdGVzdHMgb3JkZXJzCj4gb2YgbWFnbml0dWRlcyBmYXN0ZXIuIExpa2V3aXNlLCBzaW5j
ZSB0aGVyZSBhcmUgbm8gZXh0ZXJuYWwgZGVwZW5kZW5jaWVzLAo+IHRoZXJlIGFyZSBubyBob29w
cyB0byBqdW1wIHRocm91Z2ggdG8gcnVuIHRoZSB0ZXN0cy4gQWRkaXRpb25hbGx5LCB0aGlzCj4g
bWFrZXMgdW5pdCB0ZXN0cyBkZXRlcm1pbmlzdGljOiBhIGZhaWxpbmcgdW5pdCB0ZXN0IGFsd2F5
cyBpbmRpY2F0ZXMgYQo+IHByb2JsZW0uIEZpbmFsbHksIGJlY2F1c2UgdW5pdCB0ZXN0cyBuZWNl
c3NhcmlseSBoYXZlIGZpbmVyIGdyYW51bGFyaXR5LAo+IHRoZXkgYXJlIGFibGUgdG8gdGVzdCBh
bGwgY29kZSBwYXRocyBlYXNpbHkgc29sdmluZyB0aGUgY2xhc3NpYyBwcm9ibGVtCj4gb2YgZGlm
ZmljdWx0eSBpbiBleGVyY2lzaW5nIGVycm9yIGhhbmRsaW5nIGNvZGUuCj4gCj4gIyMjIElzIEtV
bml0IHRyeWluZyB0byByZXBsYWNlIG90aGVyIHRlc3RpbmcgZnJhbWV3b3JrcyBmb3IgdGhlIGtl
cm5lbD8KPiAKPiBOby4gTW9zdCBleGlzdGluZyB0ZXN0cyBmb3IgdGhlIExpbnV4IGtlcm5lbCBh
cmUgZW5kLXRvLWVuZCB0ZXN0cywgd2hpY2gKPiBoYXZlIHRoZWlyIHBsYWNlLiBBIHdlbGwgdGVz
dGVkIHN5c3RlbSBoYXMgbG90cyBvZiB1bml0IHRlc3RzLCBhCj4gcmVhc29uYWJsZSBudW1iZXIg
b2YgaW50ZWdyYXRpb24gdGVzdHMsIGFuZCBzb21lIGVuZC10by1lbmQgdGVzdHMuIEtVbml0Cj4g
aXMganVzdCB0cnlpbmcgdG8gYWRkcmVzcyB0aGUgdW5pdCB0ZXN0IHNwYWNlIHdoaWNoIGlzIGN1
cnJlbnRseSBub3QKPiBiZWluZyBhZGRyZXNzZWQuCj4gCj4gIyMjIE1vcmUgaW5mb3JtYXRpb24g
b24gS1VuaXQKPiAKPiBUaGVyZSBpcyBhIGJ1bmNoIG9mIGRvY3VtZW50YXRpb24gbmVhciB0aGUg
ZW5kIG9mIHRoaXMgcGF0Y2ggc2V0IHRoYXQKPiBkZXNjcmliZXMgaG93IHRvIHVzZSBLVW5pdCBh
bmQgYmVzdCBwcmFjdGljZXMgZm9yIHdyaXRpbmcgdW5pdCB0ZXN0cy4KPiBGb3IgY29udmVuaWVu
Y2UgSSBhbSBob3N0aW5nIHRoZSBjb21waWxlZCBkb2NzIGhlcmVbMl0uCj4gCj4gQWRkaXRpb25h
bGx5IGZvciBjb252ZW5pZW5jZSwgSSBoYXZlIGFwcGxpZWQgdGhlc2UgcGF0Y2hlcyB0byBhCj4g
YnJhbmNoWzNdLiBUaGUgcmVwbyBtYXkgYmUgY2xvbmVkIHdpdGg6Cj4gZ2l0IGNsb25lIGh0dHBz
Oi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eAo+IFRoaXMgcGF0Y2hzZXQgaXMgb24gdGhl
IGt1bml0L3JmYy92NS4zL3YxNSBicmFuY2guCj4gCj4gIyMgQ2hhbmdlcyBTaW5jZSBMYXN0IFZl
cnNpb24KPiAKPiAtIE1vdmVkIGNvbW1lbnQgZnJvbSBpbmxpbmUgaW4gbWFjcm8gdG8ga2VybmVs
LWRvYyB0byBhZGRyZXNzIGNoZWNrcGF0Y2gKPiAgICB3YXJuaW5nLgo+IC0gRGVtb3RlZCBCVUco
KSB0byBXQVJOX09OLgo+IC0gRm9ybWF0dGVkIHNvbWUga2VybmVsLWRvYyBjb21tZW50cyB0byBt
YWtlIHRoZW0gbW9yZSByZWFkaWJsZS4KPiAKPiBbMV0gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlv
L2t1bml0LWRvY3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3MvdXNhZ2UuaHRtbCNrdW5pdC1vbi1u
b24tdW1sLWFyY2hpdGVjdHVyZXMKPiBbMl0gaHR0cHM6Ly9nb29nbGUuZ2l0aHViLmlvL2t1bml0
LWRvY3MvdGhpcmRfcGFydHkva2VybmVsL2RvY3MvCj4gWzNdIGh0dHBzOi8va3VuaXQuZ29vZ2xl
c291cmNlLmNvbS9saW51eC8rL2t1bml0L3JmYy92NS4zL3YxNQo+IAoKSGkgQnJlbmRhbiwKClRo
YW5rcyBmb3IgZG9pbmcgdGhpcyB3b3JrLgoKVGhhbmtzIGZvciBhY2NvbW1vZGF0aW5nIG15IHJl
cXVlc3QgdG8gaW1wcm92ZSB0aGUgZG9jdW1lbnQvY29tbWVudApibG9ja3MgaW4gcGF0Y2ggMDEg
YW5kIHJlbW92aW5nIEJVRygpIGZyb20gcGF0Y2ggMDkuIFRoZSBjb21tZW50IGJsb2NrCnJlYWRz
IHdlbGwgbm93LgoKQXBwbGllZCB0aGUgc2VyaWVzIHRvIGxpbnV4LWtzZWxmdGVzdCBuZXh0IGZv
ciA1LjQtcmMxLgoKdGhhbmtzLAotLSBTaHVhaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
