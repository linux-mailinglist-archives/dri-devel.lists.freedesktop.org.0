Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 205C722DFD6
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 17:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F3A289EAE;
	Sun, 26 Jul 2020 15:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7396E92F;
 Fri, 24 Jul 2020 07:45:22 +0000 (UTC)
Received: from [192.168.0.2] (ip5f5af51b.dynamic.kabel-deutschland.de
 [95.90.245.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 95C4C2002EE2B;
 Fri, 24 Jul 2020 09:45:18 +0200 (CEST)
Subject: Re: [PATCH] amdgpu_dm: fix nonblocking atomic commit use-after-free
To: Kees Cook <keescook@chromium.org>, Mazin Rezk <mnrzk@protonmail.com>
References: <YIGsJ9LlFquvBI2iWPKhJwjKBwDUr_C-38oVpLJJHJ5rDCY_Zrrv392o6UPNxHoeQrcpLYC9U4fZdpD9ilz6Amg2IxkSexGLQMCQIBek8rc=@protonmail.com>
 <202007231524.A24720C@keescook>
From: Paul Menzel <pmenzel@molgen.mpg.de>
Message-ID: <a86cba0b-4513-e7c3-ae75-bb331433f664@molgen.mpg.de>
Date: Fri, 24 Jul 2020 09:45:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202007231524.A24720C@keescook>
Content-Language: en-US
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
Cc: anthony.ruhier@gmail.com, 1i5t5.duncan@cox.net, sunpeng.li@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>, regressions@leemhuis.info,
 amd-gfx@lists.freedesktop.org, Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, mphantomx@yahoo.com.br,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVhciBLZWVzLAoKCkFtIDI0LjA3LjIwIHVtIDAwOjMyIHNjaHJpZWIgS2VlcyBDb29rOgo+IE9u
IFRodSwgSnVsIDIzLCAyMDIwIGF0IDA5OjEwOjE1UE0gKzAwMDAsIE1hemluIFJlemsgd3JvdGU6
Cj4+IFdoZW4gYW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbCBpcyBydW5uaW5nIGluIHRoZSB3
b3JrcXVldWUsCj4+IGRybV9hdG9taWNfc3RhdGVfcHV0IHdpbGwgZ2V0IGNhbGxlZCB3aGlsZSBh
bWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsIGlzCj4+IHJ1bm5pbmcsIGNhdXNpbmcgYSByYWNl
IGNvbmRpdGlvbiB3aGVyZSBzdGF0ZSAoYW5kIHRoZW4gZG1fc3RhdGUpIGlzCj4+IHNvbWV0aW1l
cyBmcmVlZCB3aGlsZSBhbWRncHVfZG1fYXRvbWljX2NvbW1pdF90YWlsIGlzIHJ1bm5pbmcuIFRo
aXMgYnVnIGhhcwo+PiBvY2N1cnJlZCBzaW5jZSA1LjctcmMxIGFuZCBpcyB3ZWxsIGRvY3VtZW50
ZWQgYW1vbmcgcG9sYXJpczExIHVzZXJzIFsxXS4KPj4KPj4gUHJpb3IgdG8gNS43LCB0aGlzIHdh
cyBub3QgYSBub3RpY2VhYmxlIGlzc3VlIHNpbmNlIHRoZSBmcmVlbGlzdCBwb2ludGVyCj4+IHdh
cyBzdG9yZWQgYXQgdGhlIGJlZ2lubmluZyBvZiBkbV9zdGF0ZSAoYmFzZSksIHdoaWNoIHdhcyB1
bnVzZWQuIEFmdGVyCj4+IGNoYW5naW5nIHRoZSBmcmVlbGlzdCBwb2ludGVyIHRvIGJlIHN0b3Jl
ZCBpbiB0aGUgbWlkZGxlIG9mIHRoZSBzdHJ1Y3QsIHRoZQo+PiBmcmVlbGlzdCBwb2ludGVyIG92
ZXJ3cm90ZSB0aGUgY29udGV4dCwgY2F1c2luZyBkY19zdGF0ZSB0byBiZWNvbWUgZ2FyYmFnZQo+
PiBkYXRhIGFuZCBtYWRlIHRoZSBjYWxsIHRvIGRtX2VuYWJsZV9wZXJfZnJhbWVfY3J0Y19tYXN0
ZXJfc3luYyBkZXJlZmVyZW5jZQo+PiBhIGZyZWVsaXN0IHBvaW50ZXIuCj4+Cj4+IFRoaXMgcGF0
Y2ggZml4ZXMgdGhlIGFmb3JlbWVudGlvbmVkIGlzc3VlIGJ5IGNhbGxpbmcgZHJtX2F0b21pY19z
dGF0ZV9nZXQKPj4gaW4gYW1kZ3B1X2RtX2F0b21pY19jb21taXQgYmVmb3JlIGRybV9hdG9taWNf
aGVscGVyX2NvbW1pdCBpcyBjYWxsZWQgYW5kCj4+IGRybV9hdG9taWNfc3RhdGVfcHV0IGFmdGVy
IGFtZGdwdV9kbV9hdG9taWNfY29tbWl0X3RhaWwgaXMgY29tcGxldGUuCj4+Cj4+IEFjY29yZGlu
ZyB0byBteSB0ZXN0aW5nIG9uIDUuOC4wLXJjNiwgdGhpcyBzaG91bGQgZml4IGJ1ZyAyMDczODMg
b24KPj4gQnVnemlsbGEgWzFdLgo+Pgo+PiBbMV0gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3Jn
L3Nob3dfYnVnLmNnaT9pZD0yMDczODMKPiAKPiBOaWNlIHdvcmsgdHJhY2tpbmcgdGhpcyBkb3du
IQo+IAo+PiBGaXhlczogMzIwMmZhNjJmICgic2x1YjogcmVsb2NhdGUgZnJlZWxpc3QgcG9pbnRl
ciB0byBtaWRkbGUgb2Ygb2JqZWN0IikKPiAKPiBJIGRvLCBob3dldmVyLCBvYmplY3QgdG8gdGhp
cyBGaXhlcyB0YWcuIDopIFRoZSBmbGF3IGFwcGVhcnMgdG8gaGF2ZQo+IGJlZW4gd2l0aCBhbWRn
cHVfZG0ncyByZWZlcmVuY2UgdHJhY2tpbmcgb2YgInN0YXRlIiBpbiB0aGUgbm9uYmxvY2tpbmcK
PiBjYXNlLiAoSG93IHRoaXMgcmVmZXJlbmNlIGNvdW50aW5nIGlzIHN1cHBvc2VkIHRvIHdvcmsg
Y29ycmVjdGx5LCB0aG91Z2gsCj4gSSdtIG5vdCBzdXJlLikgSWYgSSBsb29rIGF0IHdoZXJlIHRo
ZSBkcm0gaGVscGVyIHdhcyBzcGxpdCBmcm9tIGJlaW5nCj4gdGhlIGRlZmF1bHQgY2FsbGJhY2ss
IGl0IGxvb2tzIGxpa2UgdGhpcyB3YXMgd2hhdCBpbnRyb2R1Y2VkIHRoZSBidWc6Cj4gCj4gZGE1
YzQ3ZjY4MmFiICgiZHJtL2FtZC9kaXNwbGF5OiBSZW1vdmUgYWNydGMtPnN0cmVhbSIpCj4gCj4g
PyAzMjAyZmE2MmYgY2VydGFpbmx5IGV4cG9zZWQgaXQgbXVjaCBtb3JlIHF1aWNrbHksIGJ1dCB0
aGVyZSB3YXMgYSByYWNlCj4gZXZlbiB3aXRob3V0IDMyMDJmYTYyZiB3aGVyZSBzb21ldGhpbmcg
Y291bGQgaGF2ZSByZWFsbG9jZWQgdGhlIG1lbW9yeQo+IGFuZCB3cml0dGVuIG92ZXIgaXQuCgpJ
IHVuZGVyc3RhbmQgdGhlIEZpeGVzIHRhZyBtYWlubHkgYSBoZWxwIHdoZW4gYmFja3BvcnRpbmcg
Y29tbWl0cy4KCkFzIExpbnV4IDUuOC1yYzcgaXMgZ29pbmcgdG8gYmUgcmVsZWFzZWQgdGhpcyBT
dW5kYXksIEkgd29uZGVyLCBpZiAKY29tbWl0IDMyMDJmYTYyZiAoInNsdWI6IHJlbG9jYXRlIGZy
ZWVsaXN0IHBvaW50ZXIgdG8gbWlkZGxlIG9mIG9iamVjdCIpIApzaG91bGQgYmUgcmV2ZXJ0ZWQg
Zm9yIG5vdyB0byBmaXggdGhlIHJlZ3Jlc3Npb24gZm9yIHRoZSB1c2VycyBhY2NvcmRpbmcgCnRv
IExpbnV44oCZIG5vIHJlZ3Jlc3Npb24gcG9saWN5LiBPbmNlIHRoZSBBTURHUFUvRFJNIGRyaXZl
ciBpc3N1ZSBpcyAKZml4ZWQsIGl0IGNhbiBiZSByZWFwcGxpZWQuIEkga25vdyBpdOKAmXMgbm90
IG9wdGltYWwsIGJ1dCBhcyBzb21lIHRlc3RpbmcgCmlzIGdvaW5nIHRvIGJlIGludm9sdmVkIGZv
ciB0aGUgZml4LCBJ4oCZZCBhcmd1ZSBpdOKAmXMgdGhlIGJlc3Qgb3B0aW9uIGZvciAKdGhlIHVz
ZXJzLgoKCktpbmQgcmVnYXJkcywKClBhdWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
