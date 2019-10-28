Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0354FE7232
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 13:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1F16E858;
	Mon, 28 Oct 2019 12:57:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0433C6E856;
 Mon, 28 Oct 2019 12:57:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 05:57:36 -0700
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="193247150"
Received: from jlahtine-desk.ger.corp.intel.com (HELO localhost)
 ([10.252.18.53])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 05:57:29 -0700
MIME-Version: 1.0
To: paulmck@kernel.org, rcu@vger.kernel.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
In-Reply-To: <20191022191215.25781-3-paulmck@kernel.org>
References: <20191022191136.GA25627@paulmck-ThinkPad-P72>
 <20191022191215.25781-3-paulmck@kernel.org>
Message-ID: <157226744651.5420.128752979550120657@jlahtine-desk.ger.corp.intel.com>
User-Agent: alot/0.7
Subject: Re: [PATCH tip/core/rcu 03/10] drivers/gpu: Replace
 rcu_swap_protected() with rcu_replace()
Date: Mon, 28 Oct 2019 14:57:26 +0200
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
Cc: peterz@infradead.org, fweisbec@gmail.com, jiangshanlai@gmail.com,
 dri-devel@lists.freedesktop.org, oleg@redhat.com, dhowells@redhat.com,
 edumazet@google.com, joel@joelfernandes.org, mingo@kernel.org,
 David Airlie <airlied@linux.ie>, dipankar@in.ibm.com,
 "Paul E. McKenney" <paulmck@kernel.org>, intel-gfx@lists.freedesktop.org,
 josh@joshtriplett.org, mathieu.desnoyers@efficios.com, rostedt@goodmis.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, tglx@linutronix.de,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBwYXVsbWNrQGtlcm5lbC5vcmcgKDIwMTktMTAtMjIgMjI6MTI6MDgpCj4gRnJvbTog
IlBhdWwgRS4gTWNLZW5uZXkiIDxwYXVsbWNrQGtlcm5lbC5vcmc+Cj4gCj4gVGhpcyBjb21taXQg
cmVwbGFjZXMgdGhlIHVzZSBvZiByY3Vfc3dhcF9wcm90ZWN0ZWQoKSB3aXRoIHRoZSBtb3JlCj4g
aW50dWl0aXZlbHkgYXBwZWFsaW5nIHJjdV9yZXBsYWNlKCkgYXMgYSBzdGVwIHRvd2FyZHMgcmVt
b3ZpbmcKPiByY3Vfc3dhcF9wcm90ZWN0ZWQoKS4KPiAKPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9sa21sL0NBSGstPXdpQXNKTHcxZWdGRUU9WjctR0d0TTZ3Y3Z0eXl0WFpBMStCSHF0
YTRnZzZId0BtYWlsLmdtYWlsLmNvbS8KPiBSZXBvcnRlZC1ieTogTGludXMgVG9ydmFsZHMgPHRv
cnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPgo+IFsgcGF1bG1jazogRnJvbSByY3VfcmVwbGFj
ZSgpIHRvIHJjdV9yZXBsYWNlX3BvaW50ZXIoKSBwZXIgSW5nbyBNb2xuYXIuIF0KPiBTaWduZWQt
b2ZmLWJ5OiBQYXVsIEUuIE1jS2VubmV5IDxwYXVsbWNrQGtlcm5lbC5vcmc+Cj4gQ2M6IEphbmkg
TmlrdWxhIDxqYW5pLm5pa3VsYUBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IEpvb25hcyBMYWh0aW5l
biA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4KPiBDYzogUm9kcmlnbyBWaXZpIDxy
b2RyaWdvLnZpdmlAaW50ZWwuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogQ2hyaXMgV2ls
c29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gQ2M6IDxpbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnPgo+IENjOiA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KCiJkcm0vaTkxNToi
IHByZWZlcnJlZCBhcyB0aGUgc3ViamVjdCBwcmVmaXggZm9yIGluY3JlYXNlZCBzcGVjaWZpY2l0
eS4KCkxldCBtZSBrbm93IHdoaWNoIHRyZWUgeW91IGVuZCB1cCBtZXJnaW5nIHdpdGguCgpSZXZp
ZXdlZC1ieTogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMubGFodGluZW5AbGludXguaW50ZWwuY29t
PgoKUmVnYXJkcywgSm9vbmFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
