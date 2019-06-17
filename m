Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C11149A09
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD396E0F2;
	Tue, 18 Jun 2019 07:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE6F26E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 22:47:29 +0000 (UTC)
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16]
 helo=midway.dunlab)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hd0P6-0004pi-Aw; Mon, 17 Jun 2019 22:47:08 +0000
Subject: Re: [PATCH v3 2/7] lib/hexdump.c: Relax rowsize checks in
 hex_dump_to_buffer
To: Alastair D'Silva <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20190617020430.8708-1-alastair@au1.ibm.com>
 <20190617020430.8708-3-alastair@au1.ibm.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <94413756-c927-a4ca-dd59-47e3cc87d58d@infradead.org>
Date: Mon, 17 Jun 2019 15:47:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190617020430.8708-3-alastair@au1.ibm.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWCvapawJTmHWfTi4W/xQzd/vam+JtASkBkdfBDmQPA=; b=n2EkBbCtepqSck3LcKcBk9ucLP
 OopaIKVxH7Ft5pKUkNM6axeXE0K/dN0KlZBFHBkuZUjcuBojBVwA6eyj3zIf/SrSJ0AXP+ap36Tfr
 X0WYpzcQ34E0H9clamwWKVPA2G5AqZgtlebPbdol2VZl3hzV0WHHKTyO/DPw8RjqxrUZIc7QdVFKM
 vHCGFyYLYGCxZF9eADucfOb8FK17P9rwh5jOCnBGSKiVmNRqoUfswvbapl0LJeUcbgsSotAmzefsG
 BuQwk3FdoCSOiq6Zwz2/pJMld3yRBwfY9eWtfMYCawPt2uqyoLPRXHwia2hme5jMcDzrgP6F97p9i
 1TAbXIzA==;
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
Cc: linux-fbdev@vger.kernel.org, Stanislaw Gruszka <sgruszka@redhat.com>,
 Petr Mladek <pmladek@suse.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org,
 linux-scsi@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>,
 ath10k@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@oracle.com>, Jose Abreu <Jose.Abreu@synopsys.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kalle Valo <kvalo@codeaurora.org>, Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@ACULAB.COM>, netdev@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCkp1c3QgYSBjb21tZW50IHN0eWxlIG5pdCBiZWxvdy4uLgoKT24gNi8xNi8xOSA3OjA0IFBN
LCBBbGFzdGFpciBEJ1NpbHZhIHdyb3RlOgo+IEZyb206IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0
YWlyQGQtc2lsdmEub3JnPgo+IAo+IFRoaXMgcGF0Y2ggcmVtb3ZlcyB0aGUgaGFyZGNvZGVkIHJv
dyBsaW1pdHMgYW5kIGFsbG93cyBmb3IKPiBvdGhlciBsZW5ndGhzLiBUaGVzZSBsZW5ndGhzIG11
c3Qgc3RpbGwgYmUgYSBtdWx0aXBsZSBvZgo+IGdyb3Vwc2l6ZS4KPiAKPiBUaGlzIGFsbG93cyBz
dHJ1Y3RzIHRoYXQgYXJlIG5vdCAxNi8zMiBieXRlcyB0byBkaXNwbGF5IG9uCj4gYSBzaW5nbGUg
bGluZS4KPiAKPiBUaGlzIHBhdGNoIGFsc28gZXhwYW5kcyB0aGUgc2VsZi10ZXN0cyB0byB0ZXN0
IHJvdyBzaXplcwo+IHVwIHRvIDY0IGJ5dGVzICh0aG91Z2ggdGhleSBjYW4gbm93IGJlIGFyYml0
cmFyaWx5IGxvbmcpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsYXN0YWlyIEQnU2lsdmEgPGFsYXN0
YWlyQGQtc2lsdmEub3JnPgo+IC0tLQo+ICBsaWIvaGV4ZHVtcC5jICAgICAgfCA0OCArKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgbGliL3Rlc3RfaGV4ZHVtcC5j
IHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDc1IGluc2VydGlvbnMoKyksIDI1IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9saWIvaGV4ZHVtcC5jIGIvbGliL2hleGR1bXAuYwo+IGluZGV4IDgxYjcwZWQz
NzIwOS4uMzk0MzUwN2JjMGU5IDEwMDY0NAo+IC0tLSBhL2xpYi9oZXhkdW1wLmMKPiArKysgYi9s
aWIvaGV4ZHVtcC5jCgo+IEBAIC0yNDYsMTcgKzI0OCwyOSBAQCB2b2lkIHByaW50X2hleF9kdW1w
KGNvbnN0IGNoYXIgKmxldmVsLCBjb25zdCBjaGFyICpwcmVmaXhfc3RyLCBpbnQgcHJlZml4X3R5
cGUsCj4gIHsKPiAgCWNvbnN0IHU4ICpwdHIgPSBidWY7Cj4gIAlpbnQgaSwgbGluZWxlbiwgcmVt
YWluaW5nID0gbGVuOwo+IC0JdW5zaWduZWQgY2hhciBsaW5lYnVmWzMyICogMyArIDIgKyAzMiAr
IDFdOwo+ICsJdW5zaWduZWQgY2hhciAqbGluZWJ1ZjsKPiArCXVuc2lnbmVkIGludCBsaW5lYnVm
X2xlbjsKPiAgCj4gLQlpZiAocm93c2l6ZSAhPSAxNiAmJiByb3dzaXplICE9IDMyKQo+IC0JCXJv
d3NpemUgPSAxNjsKPiArCWlmIChyb3dzaXplICUgZ3JvdXBzaXplKQo+ICsJCXJvd3NpemUgLT0g
cm93c2l6ZSAlIGdyb3Vwc2l6ZTsKPiArCj4gKwkvKiBXb3JzdCBjYXNlIGxpbmUgbGVuZ3RoOgo+
ICsJICogMiBoZXggY2hhcnMgKyBzcGFjZSBwZXIgYnl0ZSBpbiwgMiBzcGFjZXMsIDEgY2hhciBw
ZXIgYnl0ZSBpbiwgTlVMTAo+ICsJICovCgpBY2NvcmRpbmcgdG8gRG9jdW1lbnRhdGlvbi9wcm9j
ZXNzL2NvZGluZy1zdHlsZS5yc3Q6CgpUaGUgcHJlZmVycmVkIHN0eWxlIGZvciBsb25nIChtdWx0
aS1saW5lKSBjb21tZW50cyBpczoKCi4uIGNvZGUtYmxvY2s6OiBjCgoJLyoKCSAqIFRoaXMgaXMg
dGhlIHByZWZlcnJlZCBzdHlsZSBmb3IgbXVsdGktbGluZQoJICogY29tbWVudHMgaW4gdGhlIExp
bnV4IGtlcm5lbCBzb3VyY2UgY29kZS4KCSAqIFBsZWFzZSB1c2UgaXQgY29uc2lzdGVudGx5LgoJ
ICoKCSAqIERlc2NyaXB0aW9uOiAgQSBjb2x1bW4gb2YgYXN0ZXJpc2tzIG9uIHRoZSBsZWZ0IHNp
ZGUsCgkgKiB3aXRoIGJlZ2lubmluZyBhbmQgZW5kaW5nIGFsbW9zdC1ibGFuayBsaW5lcy4KCSAq
LwoKCmV4Y2VwdCBpbiBuZXR3b3JraW5nIHNvZnR3YXJlLgoKCj4gKwlsaW5lYnVmX2xlbiA9IHJv
d3NpemUgKiAzICsgMiArIHJvd3NpemUgKyAxOwo+ICsJbGluZWJ1ZiA9IGt6YWxsb2MobGluZWJ1
Zl9sZW4sIEdGUF9LRVJORUwpOwo+ICsJaWYgKCFsaW5lYnVmKSB7Cj4gKwkJcHJpbnRrKCIlcyVz
aGV4ZHVtcDogQ291bGQgbm90IGFsbG9jICV1IGJ5dGVzIGZvciBidWZmZXJcbiIsCj4gKwkJCWxl
dmVsLCBwcmVmaXhfc3RyLCBsaW5lYnVmX2xlbik7Cj4gKwkJcmV0dXJuOwo+ICsJfQoKCi0tIAp+
UmFuZHkKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
