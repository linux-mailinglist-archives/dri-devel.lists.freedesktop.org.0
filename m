Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55222DFDA
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F34E89EFF;
	Sun, 26 Jul 2020 15:02:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch
 [185.70.40.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 574776EA59
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jul 2020 03:04:00 +0000 (UTC)
Date: Sat, 25 Jul 2020 03:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail; t=1595646237;
 bh=VJe3Huszu4b40ueORs4rAhjQ2OOkJfwTddBXPKHHSRk=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=o+agpC85tmfB27Cm6+UmoM76q10l2qgG2bir5AuK1CeJ143FzcpDnCfA8xXKp+EwV
 FoqWa8ez02dj9c7ha5lhsP+MBfUO4SRqph8l//tjNZbdSZ1yxC2zP1b6l3osDI0fZ9
 rMoQfvdvdIX6m3SUDBd+N9QMkukC3pL9+oLwFnR4=
To: Paul Menzel <pmenzel@molgen.mpg.de>
From: Mazin Rezk <mnrzk@protonmail.com>
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
Message-ID: <_vGVoFJcOuoIAvGYtkyemUvqEFeZ-AdO4Jk8wsyVv3MwO-6NEVtULxnZzuBJNeHNkCsQ5Kxn5TPQ_VJ6qyj9wXXXX8v-hc3HptnCAu0UYsk=@protonmail.com>
In-Reply-To: <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
 <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
 <202007241016.922B094AAA@keescook>
 <3c92db94-3b62-a70b-8ace-f5e34e8f268f@molgen.mpg.de>
MIME-Version: 1.0
X-Spam-Status: No, score=-0.5 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,HK_RANDOM_REPLYTO
 shortcircuit=no autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
X-Mailman-Approved-At: Sun, 26 Jul 2020 15:02:45 +0000
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
Reply-To: Mazin Rezk <mnrzk@protonmail.com>
Cc: anthony.ruhier@gmail.com, 1i5t5.duncan@cox.net,
 Kees Cook <keescook@chromium.org>, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpZGF5LCBKdWx5IDI0LCAyMDIwIDU6MTkgUE0sIFBhdWwgTWVuemVsIDxwbWVuemVsQG1v
bGdlbi5tcGcuZGU+IHdyb3RlOgoKPiBEZWFyIEtlZXMsCj4KPiBBbSAyNC4wNy4yMCB1bSAxOToz
MyBzY2hyaWViIEtlZXMgQ29vazoKPgo+ID4gT24gRnJpLCBKdWwgMjQsIDIwMjAgYXQgMDk6NDU6
MThBTSArMDIwMCwgUGF1bCBNZW56ZWwgd3JvdGU6Cj4gPgo+ID4gPiBBbSAyNC4wNy4yMCB1bSAw
MDozMiBzY2hyaWViIEtlZXMgQ29vazoKPiA+ID4KPiA+ID4gPiBPbiBUaHUsIEp1bCAyMywgMjAy
MCBhdCAwOToxMDoxNVBNICswMDAwLCBNYXppbiBSZXprIHdyb3RlOgo+ID4gPiA+IEFzIExpbnV4
IDUuOC1yYzcgaXMgZ29pbmcgdG8gYmUgcmVsZWFzZWQgdGhpcyBTdW5kYXksIEkgd29uZGVyLCBp
ZiBjb21taXQKPiA+ID4gPiAzMjAyZmE2MmYgKCJzbHViOiByZWxvY2F0ZSBmcmVlbGlzdCBwb2lu
dGVyIHRvIG1pZGRsZSBvZiBvYmplY3QiKSBzaG91bGQgYmUKPiA+ID4gPiByZXZlcnRlZCBmb3Ig
bm93IHRvIGZpeCB0aGUgcmVncmVzc2lvbiBmb3IgdGhlIHVzZXJzIGFjY29yZGluZyB0byBMaW51
eOKAmSBubwo+ID4gPiA+IHJlZ3Jlc3Npb24gcG9saWN5LiBPbmNlIHRoZSBBTURHUFUvRFJNIGRy
aXZlciBpc3N1ZSBpcyBmaXhlZCwgaXQgY2FuIGJlCj4gPiA+ID4gcmVhcHBsaWVkLiBJIGtub3cg
aXTigJlzIG5vdCBvcHRpbWFsLCBidXQgYXMgc29tZSB0ZXN0aW5nIGlzIGdvaW5nIHRvIGJlCj4g
PiA+ID4gaW52b2x2ZWQgZm9yIHRoZSBmaXgsIEnigJlkIGFyZ3VlIGl04oCZcyB0aGUgYmVzdCBv
cHRpb24gZm9yIHRoZSB1c2Vycy4KPiA+Cj4gPiBXZWxsLCB0aGUgU0xVQiBkZWZlbnNlIHdhcyBh
bHJlYWR5IHJlbGVhc2VkIGluIHY1LjcsIHNvIEknbSBub3Qgc3VyZSBpdAo+ID4gcmVhbGx5IGhl
bHBzIGZvciBhbWRncHVfZG0gdXNlcnMgc2VlaW5nIGl0IHRoZXJlIHRvby4KPgo+IEluIG15IG9w
aW5pb24sIGl0IHdvdWxkIGhlbHAsIGFzIHRoZSBzdGFibGUgcmVsZWFzZSBjb3VsZCBwaWNrIHVw
IHRoZQo+IHJldmVydCwgb25lcyBpdOKAmXMgaW4gTGludXPigJkgbWFzdGVyIGJyYW5jaC4KPgo+
ID4gVGhlcmUgd2FzIGEgZml4IHRvIGRpc2FibGUgdGhlIGFzeW5jIHBhdGggZm9yIHRoaXMgZHJp
dmVyIHRoYXQgd29ya2VkCj4gPiBhcm91bmQgdGhlIGJ1ZyB0b28sIHllcz8gVGhhdCBzZWVtcyBs
aWtlIGEgc2FmZXIgYW5kIG1vcmUgZm9jdXNlZAo+ID4gY2hhbmdlIHRoYXQgZG9lc24ndCByZXZl
cnQgdGhlIFNMVUIgZGVmZW5zZSBmb3IgYWxsIHVzZXJzLCBhbmQgd291bGQKPiA+IGFjdHVhbGx5
IHByb3ZpZGUgYSBjb21wbGV0ZSwgSSB0aGluaywgd29ya2Fyb3VuZCB3aGVyZWFzIHJldmVydGlu
Zwo+ID4gdGhlIFNMVUIgY2hhbmdlIG1lYW5zIHRoZSByYWNlIHN0aWxsIGV4aXN0cy4gRm9yIGV4
YW1wbGUsIGl0IHdvdWxkIGJlCj4gPiBoaXQgd2l0aCBzbGFiIHBvaXNvbmluZywgZXRjLgo+Cj4g
SSBkbyBub3Qga25vdy4gSWYgdGhlcmUgaXMgc3VjaCBhIGZpeCwgdGhhdCB3b3VsZCBiZSBncmVh
dC4gQnV0IGlmIHlvdQo+IGRvIG5vdCBrbm93LCBob3cgc2hvdWxkIGEgbm9ybWFsIHVzZXI/IDst
KQo+Cj4gS2luZCByZWdhcmRzLAo+Cj4gUGF1bAo+Cj4gS2luZCByZWdhcmRzLAo+Cj4gUGF1bAoK
SWYgd2UncmUgdGFsa2luZyBhYm91dCB3b3JrYXJvdW5kcyBub3csIEkgc3VnZ2VzdCBzaW1wbHkg
c3dhcHBpbmcgdGhlIGJhc2UKYW5kIGNvbnRleHQgdmFyaWFibGVzIGluIHN0cnVjdCBkbV9hdG9t
aWNfc3RhdGUuIEJ5IHRoYXQgd2F5LCB3ZSB3b24ndCBuZWVkCnRvIGNoYW5nZSBub24tYW1kZ3B1
IHBhcnRzIG9mIHRoZSBjb2RlIChlLmcuIGJ5IHJldmVydGluZyB0aGUgU0xVQiBwYXRjaCkuCgpQ
cmlvciB0byAzMjAyZmE2MmYsIHRoZSBmcmVlbGlzdCBwb2ludGVyIHdhcyBzdG9yZWQgaW4gZG1f
c3RhdGUtPmJhc2Ugd2hpY2gKd2FzIG5ldmVyIGRlcmVmZXJlbmNlZCBhbmQgdGhlcmVmb3JlIGNh
dXNlZCBubyBub3RpY2VhYmxlIGlzc3VlLiBBZnRlcgozMjAyZmE2MmYsIHRoZSBmcmVlbGlzdCBw
b2ludGVyIGlzIHN0b3JlZCBpbiB0aGUgbWlkZGxlIG9mIHRoZSBzdHJ1Y3QgKGkuZS4KZG1fc3Rh
dGUtPmNvbnRleHQpLgoKU3dhcHBpbmcgdGhlIHBvc2l0aW9uIG9mIHRoZSBiYXNlIGFuZCBjb250
ZXh0IHZhcmlhYmxlcyBpbiBkbV9hdG9taWNfc3RhdGUKc2hvdWxkLCBpbiB0aGVvcnksIHJldmVy
dCB0aGlzIGNvZGUgYmFjayB0byBpdCdzIHByZS01Ljcgc3RhdGUgc2luY2UgdGhlCmNvZGUgd291
bGQgYmUgYmFjayB0byBvdmVyd3JpdGluZyBiYXNlIGluc3RlYWQuCgpJZiB3ZSBkZWNpZGUgdG8g
dXNlIHRoaXMgd29ya2Fyb3VuZCwgSSBjYW4gd3JpdGUgdGhlIHBhdGNoIGFuZCBkbyBtb3JlCmV4
dGVuZGVkIHRlc3RzIHRvIGNvbmZpcm0gaXQgd29ya3MgYXJvdW5kIHRoZSBpc3N1ZXMuCgpUaGF0
IHNhaWQsIEkgaGF2ZW4ndCBzZWVuIHRoZSBhc3luYyBkaXNhYmxpbmcgcGF0Y2guIElmIHlvdSBj
b3VsZCBsaW5rIHRvCml0LCBJJ2QgYmUgZ2xhZCB0byB0ZXN0IGl0IG91dCBhbmQgcGVyaGFwcyB3
ZSBjYW4gdXNlIHRoYXQgaW5zdGVhZC4KClRoYW5rcywKTWF6aW4gUmV6awoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
