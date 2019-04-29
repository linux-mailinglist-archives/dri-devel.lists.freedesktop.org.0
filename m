Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B200E9BB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 20:09:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478BD89124;
	Mon, 29 Apr 2019 18:09:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10EE789077;
 Mon, 29 Apr 2019 18:09:19 +0000 (UTC)
Received: from localhost (unknown [77.138.135.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E3D052075E;
 Mon, 29 Apr 2019 18:09:17 +0000 (UTC)
Date: Mon, 29 Apr 2019 21:09:15 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v13 16/20] IB/mlx4, arm64: untag user pointers in
 mlx4_get_umem_mr
Message-ID: <20190429180915.GZ6705@mtr-leonro.mtl.com>
References: <cover.1553093420.git.andreyknvl@google.com>
 <1e2824fd77e8eeb351c6c6246f384d0d89fd2d58.1553093421.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1e2824fd77e8eeb351c6c6246f384d0d89fd2d58.1553093421.git.andreyknvl@google.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556561358;
 bh=knicNTsLDrTdl+nHm891iiyJBuFucBVCVsfE5y1OjKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ge2Xh48Kxd01IgsiBFU25hZghQd5+q+im+ydLjo+mtYyaia6ADTbFZySvV4VePK5z
 r9VgnUNtmtNLtHScdqenLcHKoRSORje+QwLH/4jbbGGpP42++KPfd7FJiEuipu3BCH
 v3xZt3Ostbqtxa5SRNMYMZ/s38Q+uTDDuPnoB/D4=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>, kvm@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Alexei Starovoitov <ast@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>,
 linux-kselftest@vger.kernel.org, Chintan Pandya <cpandya@codeaurora.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan <shuah@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Jacob Bramley <Jacob.Bramley@arm.com>, Daniel Borkmann <daniel@iogearbox.net>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 linux-media@vger.kernel.org, Kevin Brodsky <kevin.brodsky@arm.com>,
 Kees Cook <keescook@chromium.org>, Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Lee Smith <Lee.Smith@arm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, netdev@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>,
 Christian K??nig <christian.koenig@amd.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjAsIDIwMTkgYXQgMDM6NTE6MzBQTSArMDEwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4KPiBtbHg0X2dldF91bWVtX21yKCkgdXNlcyBwcm92
aWRlZCB1c2VyIHBvaW50ZXJzIGZvciB2bWEgbG9va3Vwcywgd2hpY2ggY2FuCj4gb25seSBieSBk
b25lIHdpdGggdW50YWdnZWQgcG9pbnRlcnMuCj4KPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRo
aXMgZnVuY3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMg
fCA3ICsrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jIGIv
ZHJpdmVycy9pbmZpbmliYW5kL2h3L21seDQvbXIuYwo+IGluZGV4IDM5NTM3OWE0ODBjYi4uOWEz
NWVkMmM2YTZmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody9tbHg0L21yLmMK
PiArKysgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvbWx4NC9tci5jCj4gQEAgLTM3OCw2ICszNzgs
NyBAQCBzdGF0aWMgc3RydWN0IGliX3VtZW0gKm1seDRfZ2V0X3VtZW1fbXIoc3RydWN0IGliX3Vk
YXRhICp1ZGF0YSwgdTY0IHN0YXJ0LAo+ICAJICogYWdhaW4KPiAgCSAqLwo+ICAJaWYgKCFpYl9h
Y2Nlc3Nfd3JpdGFibGUoYWNjZXNzX2ZsYWdzKSkgewo+ICsJCXVuc2lnbmVkIGxvbmcgdW50YWdn
ZWRfc3RhcnQgPSB1bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiAgCQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYTsKPgo+ICAJCWRvd25fcmVhZCgmY3VycmVudC0+bW0tPm1tYXBfc2VtKTsKPiBAQCAt
Mzg2LDkgKzM4Nyw5IEBAIHN0YXRpYyBzdHJ1Y3QgaWJfdW1lbSAqbWx4NF9nZXRfdW1lbV9tcihz
dHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1NjQgc3RhcnQsCj4gIAkJICogY292ZXIgdGhlIG1lbW9y
eSwgYnV0IGZvciBub3cgaXQgcmVxdWlyZXMgYSBzaW5nbGUgdm1hIHRvCj4gIAkJICogZW50aXJl
bHkgY292ZXIgdGhlIE1SIHRvIHN1cHBvcnQgUk8gbWFwcGluZ3MuCj4gIAkJICovCj4gLQkJdm1h
ID0gZmluZF92bWEoY3VycmVudC0+bW0sIHN0YXJ0KTsKPiAtCQlpZiAodm1hICYmIHZtYS0+dm1f
ZW5kID49IHN0YXJ0ICsgbGVuZ3RoICYmCj4gLQkJICAgIHZtYS0+dm1fc3RhcnQgPD0gc3RhcnQp
IHsKPiArCQl2bWEgPSBmaW5kX3ZtYShjdXJyZW50LT5tbSwgdW50YWdnZWRfc3RhcnQpOwo+ICsJ
CWlmICh2bWEgJiYgdm1hLT52bV9lbmQgPj0gdW50YWdnZWRfc3RhcnQgKyBsZW5ndGggJiYKPiAr
CQkgICAgdm1hLT52bV9zdGFydCA8PSB1bnRhZ2dlZF9zdGFydCkgewo+ICAJCQlpZiAodm1hLT52
bV9mbGFncyAmIFZNX1dSSVRFKQo+ICAJCQkJYWNjZXNzX2ZsYWdzIHw9IElCX0FDQ0VTU19MT0NB
TF9XUklURTsKPiAgCQl9IGVsc2Ugewo+IC0tCgpUaGFua3MsClJldmlld2VkLWJ5OiBMZW9uIFJv
bWFub3Zza3kgPGxlb25yb0BtZWxsYW5veC5jb20+CgpJbnRlcmVzdGluZywgdGhlIGZvbGxvd3Vw
IHF1ZXN0aW9uIGlzIHdoeSBtbHg0IGlzIG9ubHkgb25lIGRyaXZlciBpbiBJQiB3aGljaApuZWVk
cyBzdWNoIGNvZGUgaW4gdW1lbV9tci4gSSdsbCB0YWtlIGEgbG9vayBvbiBpdC4KClRoYW5rcwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
