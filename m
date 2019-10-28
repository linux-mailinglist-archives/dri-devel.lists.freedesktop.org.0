Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6A2E72BE
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 14:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24DD06E870;
	Mon, 28 Oct 2019 13:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79066E870;
 Mon, 28 Oct 2019 13:40:03 +0000 (UTC)
Received: from paulmck-ThinkPad-P72 (50-39-105-78.bvtn.or.frontiernet.net
 [50.39.105.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B1F4214B2;
 Mon, 28 Oct 2019 13:40:03 +0000 (UTC)
Date: Mon, 28 Oct 2019 06:40:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [PATCH tip/core/rcu 03/10] drivers/gpu: Replace
 rcu_swap_protected() with rcu_replace()
Message-ID: <20191028134001.GM4465@paulmck-ThinkPad-P72>
References: <20191022191136.GA25627@paulmck-ThinkPad-P72>
 <20191022191215.25781-3-paulmck@kernel.org>
 <157226744651.5420.128752979550120657@jlahtine-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <157226744651.5420.128752979550120657@jlahtine-desk.ger.corp.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572270003;
 bh=UZ8dGa7oJwy+aRMXt45rmpZRu20mhvclaF5fSnAE4dg=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=hOdD2adQ1NIAyqHNn+N1EINazgzUM2evLaa4K9JbledZF+4UJtlYQaRv4P011M0mQ
 p3fZykUE+sawKaWceaxyB/s3h5CDCdx79SjuQYT6zURxIfzBF7neo5dre3aNdivcut
 hV0sDP/d4IYuOo2kw4Ij1S40dxvwE09NyS95e+NA=
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
Reply-To: paulmck@kernel.org
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, dipankar@in.ibm.com,
 intel-gfx@lists.freedesktop.org, josh@joshtriplett.org, rcu@vger.kernel.org,
 mathieu.desnoyers@efficios.com, rostedt@goodmis.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, tglx@linutronix.de,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDI6NTc6MjZQTSArMDIwMCwgSm9vbmFzIExhaHRpbmVu
IHdyb3RlOgo+IFF1b3RpbmcgcGF1bG1ja0BrZXJuZWwub3JnICgyMDE5LTEwLTIyIDIyOjEyOjA4
KQo+ID4gRnJvbTogIlBhdWwgRS4gTWNLZW5uZXkiIDxwYXVsbWNrQGtlcm5lbC5vcmc+Cj4gPiAK
PiA+IFRoaXMgY29tbWl0IHJlcGxhY2VzIHRoZSB1c2Ugb2YgcmN1X3N3YXBfcHJvdGVjdGVkKCkg
d2l0aCB0aGUgbW9yZQo+ID4gaW50dWl0aXZlbHkgYXBwZWFsaW5nIHJjdV9yZXBsYWNlKCkgYXMg
YSBzdGVwIHRvd2FyZHMgcmVtb3ZpbmcKPiA+IHJjdV9zd2FwX3Byb3RlY3RlZCgpLgo+ID4gCj4g
PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sL0NBSGstPXdpQXNKTHcxZWdGRUU9
WjctR0d0TTZ3Y3Z0eXl0WFpBMStCSHF0YTRnZzZId0BtYWlsLmdtYWlsLmNvbS8KPiA+IFJlcG9y
dGVkLWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Cj4g
PiBbIHBhdWxtY2s6IEZyb20gcmN1X3JlcGxhY2UoKSB0byByY3VfcmVwbGFjZV9wb2ludGVyKCkg
cGVyIEluZ28gTW9sbmFyLiBdCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXVsIEUuIE1jS2VubmV5IDxw
YXVsbWNrQGtlcm5lbC5vcmc+Cj4gPiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4
LmludGVsLmNvbT4KPiA+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0aW5lbkBsaW51
eC5pbnRlbC5jb20+Cj4gPiBDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiA+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Cj4gPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlu
dGVsLmNvbT4KPiA+IENjOiA8aW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KPiA+IENj
OiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KPiAKPiAiZHJtL2k5MTU6IiBwcmVm
ZXJyZWQgYXMgdGhlIHN1YmplY3QgcHJlZml4IGZvciBpbmNyZWFzZWQgc3BlY2lmaWNpdHkuCgoi
ZHJtL2k5MTUiIGl0IGlzIQoKPiBMZXQgbWUga25vdyB3aGljaCB0cmVlIHlvdSBlbmQgdXAgbWVy
Z2luZyB3aXRoLgoKSSBleHBlY3QgdG8gYmUgc2VuZGluZyBhIHB1bGwgcmVxdWVzdCBmb3IgaW5j
bHVzaW9uIGludG8gdGhlIC10aXAKdHJlZSBpbiBhIGRheSBvciB0aHJlZS4KCj4gUmV2aWV3ZWQt
Ynk6IEpvb25hcyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KCkFw
cGxpZWQsIHRoYW5rIHlvdSEKCgkJCQkJCQlUaGFueCwgUGF1bApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
