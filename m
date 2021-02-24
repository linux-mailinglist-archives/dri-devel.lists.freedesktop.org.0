Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6711323957
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 10:22:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B49489BC0;
	Wed, 24 Feb 2021 09:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Wed, 24 Feb 2021 09:22:04 UTC
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B446E8B1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 09:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 698E93FB8E;
 Wed, 24 Feb 2021 10:16:01 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="MhA+2q2N";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ysZtkX8b-I9f; Wed, 24 Feb 2021 10:15:59 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BB3A33FB77;
 Wed, 24 Feb 2021 10:15:56 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2F140360057;
 Wed, 24 Feb 2021 10:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1614158156; bh=ix+su6huoHUWLoam5bGdxjErhPEi4qIOKLMdA1dPgHU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MhA+2q2NGiHMfMcJDMTa7neNduFcPwmpSmsTPFQG0lbRffsO/vhzORz07U1rvua4A
 8ha06+kF4kkAAYtf6NGt1wC2+iu8HzUXwqeK1TKRr94eT8Jz6ne45QO9HM7vr3LTDd
 vNINgDMca1lMbaQ/SVtY1PkxJM2aSkX7JsaLBiUs=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
Date: Wed, 24 Feb 2021 10:15:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDIvMjQvMjEgOTo0NSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBPbiBXZWQsIEZlYiAy
NCwgMjAyMSBhdCA4OjQ2IEFNIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkKPiA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4gd3JvdGU6Cj4+Cj4+IE9uIDIvMjMvMjEgMTE6NTkgQU0sIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+PiB0bGRyOyBETUEgYnVmZmVycyBhcmVuJ3Qgbm9ybWFsIG1lbW9yeSwg
ZXhwZWN0aW5nIHRoYXQgeW91IGNhbiB1c2UKPj4+IHRoZW0gbGlrZSB0aGF0IChsaWtlIGNhbGxp
bmcgZ2V0X3VzZXJfcGFnZXMgd29ya3MsIG9yIHRoYXQgdGhleSdyZQo+Pj4gYWNjb3VudGluZyBs
aWtlIGFueSBvdGhlciBub3JtYWwgbWVtb3J5KSBjYW5ub3QgYmUgZ3VhcmFudGVlZC4KPj4+Cj4+
PiBTaW5jZSBzb21lIHVzZXJzcGFjZSBvbmx5IHJ1bnMgb24gaW50ZWdyYXRlZCBkZXZpY2VzLCB3
aGVyZSBhbGwKPj4+IGJ1ZmZlcnMgYXJlIGFjdHVhbGx5IGFsbCByZXNpZGVudCBzeXN0ZW0gbWVt
b3J5LCB0aGVyZSdzIGEgaHVnZQo+Pj4gdGVtcHRhdGlvbiB0byBhc3N1bWUgdGhhdCBhIHN0cnVj
dCBwYWdlIGlzIGFsd2F5cyBwcmVzZW50IGFuZCB1c2VhYmxlCj4+PiBsaWtlIGZvciBhbnkgbW9y
ZSBwYWdlY2FjaGUgYmFja2VkIG1tYXAuIFRoaXMgaGFzIHRoZSBwb3RlbnRpYWwgdG8KPj4+IHJl
c3VsdCBpbiBhIHVhcGkgbmlnaHRtYXJlLgo+Pj4KPj4+IFRvIHN0b3AgdGhpcyBnYXAgcmVxdWly
ZSB0aGF0IERNQSBidWZmZXIgbW1hcHMgYXJlIFZNX1BGTk1BUCwgd2hpY2gKPj4+IGJsb2NrcyBn
ZXRfdXNlcl9wYWdlcyBhbmQgYWxsIHRoZSBvdGhlciBzdHJ1Y3QgcGFnZSBiYXNlZAo+Pj4gaW5m
cmFzdHJ1Y3R1cmUgZm9yIGV2ZXJ5b25lLiBJbiBzcGlyaXQgdGhpcyBpcyB0aGUgdWFwaSBjb3Vu
dGVycGFydCB0bwo+Pj4gdGhlIGtlcm5lbC1pbnRlcm5hbCBDT05GSUdfRE1BQlVGX0RFQlVHLgo+
Pj4KPj4+IE1vdGl2YXRlZCBieSBhIHJlY2VudCBwYXRjaCB3aGljaCB3YW50ZWQgdG8gc3dpY2gg
dGhlIHN5c3RlbSBkbWEtYnVmCj4+PiBoZWFwIHRvIHZtX2luc2VydF9wYWdlIGluc3RlYWQgb2Yg
dm1faW5zZXJ0X3Bmbi4KPj4+Cj4+PiB2MjoKPj4+Cj4+PiBKYXNvbiBicm91Z2h0IHVwIHRoYXQg
d2UgYWxzbyB3YW50IHRvIGd1YXJhbnRlZSB0aGF0IGFsbCBwdGVzIGhhdmUgdGhlCj4+PiBwdGVf
c3BlY2lhbCBmbGFnIHNldCwgdG8gY2F0Y2ggZmFzdCBnZXRfdXNlcl9wYWdlcyAob24gYXJjaGl0
ZWN0dXJlcwo+Pj4gdGhhdCBzdXBwb3J0IHRoaXMpLiBBbGxvd2luZyBWTV9NSVhFRE1BUCAobGlr
ZSBWTV9TUEVDSUFMIGRvZXMpIHdvdWxkCj4+PiBzdGlsbCBhbGxvdyB2bV9pbnNlcnRfcGFnZSwg
YnV0IGxpbWl0aW5nIHRvIFZNX1BGTk1BUCB3aWxsIGNhdGNoIHRoYXQuCj4+Pgo+Pj4gICBGcm9t
IGF1ZGl0aW5nIHRoZSB2YXJpb3VzIGZ1bmN0aW9ucyB0byBpbnNlcnQgcGZuIHB0ZSBlbnRpcmVz
Cj4+PiAodm1faW5zZXJ0X3Bmbl9wcm90LCByZW1hcF9wZm5fcmFuZ2UgYW5kIGFsbCBpdCdzIGNh
bGxlcnMgbGlrZQo+Pj4gZG1hX21tYXBfd2MpIGl0IGxvb2tzIGxpa2UgVk1fUEZOTUFQIGlzIGFs
cmVhZHkgcmVxdWlyZWQgYW55d2F5LCBzbwo+Pj4gdGhpcyBzaG91bGQgYmUgdGhlIGNvcnJlY3Qg
ZmxhZyB0byBjaGVjayBmb3IuCj4+Pgo+PiBJZiB3ZSByZXF1aXJlIFZNX1BGTk1BUCwgZm9yIG9y
ZGluYXJ5IHBhZ2UgbWFwcGluZ3MsIHdlIGFsc28gbmVlZCB0bwo+PiBkaXNhbGxvdyBDT1cgbWFw
cGluZ3MsIHNpbmNlIGl0IHdpbGwgbm90IHdvcmsgb24gYXJjaGl0ZWN0dXJlcyB0aGF0Cj4+IGRv
bid0IGhhdmUgQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMLCAoc2VlIHRoZSBkb2NzIGZvciB2
bV9ub3JtYWxfcGFnZSgpKS4KPiBIbSBJIGZpZ3VyZWQgZXZlcnlvbmUganVzdCB1c2VzIE1BUF9T
SEFSRUQgZm9yIGJ1ZmZlciBvYmplY3RzIHNpbmNlCj4gQ09XIHJlYWxseSBtYWtlcyBhYnNvbHV0
ZWx5IG5vIHNlbnNlLiBIb3cgd291bGQgd2UgZW5mb3JjZSB0aGlzPwoKUGVyaGFwcyByZXR1cm5p
bmcgLUVJTlZBTCBvbiBpc19jb3dfbWFwcGluZygpIGF0IG1tYXAgdGltZS4gRWl0aGVyIHRoYXQg
Cm9yIGFsbG93aW5nIE1JWEVETUFQLgoKPj4gQWxzbyB3b3J0aCBub3RpbmcgaXMgdGhlIGNvbW1l
bnQgaW4gIHR0bV9ib19tbWFwX3ZtYV9zZXR1cCgpIHdpdGgKPj4gcG9zc2libGUgcGVyZm9ybWFu
Y2UgaW1wbGljYXRpb25zIHdpdGggeDg2ICsgUEFUICsgVk1fUEZOTUFQICsgbm9ybWFsCj4+IHBh
Z2VzLiBUaGF0J3MgYSB2ZXJ5IG9sZCBjb21tZW50LCB0aG91Z2gsIGFuZCBtaWdodCBub3QgYmUg
dmFsaWQgYW55bW9yZS4KPiBJIHRoaW5rIHRoYXQncyB3aHkgdHRtIGhhcyBhIHBhZ2UgY2FjaGUg
Zm9yIHRoZXNlLCBiZWNhdXNlIGl0IGluZGVlZAo+IHN1Y2tzLiBUaGUgUEFUIGNoYW5nZXMgb24g
cGFnZXMgYXJlIHJhdGhlciBleHBlbnNpdmUuCgpJSVJDIHRoZSBwYWdlIGNhY2hlIHdhcyBpbXBs
ZW1lbnRlZCBiZWNhdXNlIG9mIHRoZSBzbG93bmVzcyBvZiB0aGUgCmNhY2hpbmcgbW9kZSB0cmFu
c2l0aW9uIGl0c2VsZiwgbW9yZSBzcGVjaWZpY2FsbHkgdGhlIHdiaW52ZCgpIGNhbGwgKyAKZ2xv
YmFsIFRMQiBmbHVzaC4KCj4KPiBUaGVyZSBpcyBzdGlsbCBhbiBpc3N1ZSBmb3IgaW9tZW0gbWFw
cGluZ3MsIGJlY2F1c2UgdGhlIFBBVCB2YWxpZGF0aW9uCj4gZG9lcyBhIGxpbmVhciB3YWxrIG9m
IHRoZSByZXNvdXJjZSB0cmVlIChsb2wpIGZvciBldmVyeSB2bV9pbnNlcnRfcGZuLgo+IEJ1dCBm
b3IgaTkxNSBhdCBsZWFzdCB0aGlzIGlzIGZpeGVkIGJ5IHVzaW5nIHRoZSBpb19tYXBwaW5nCj4g
aW5mcmFzdHJ1Y3R1cmUsIHdoaWNoIGRvZXMgdGhlIFBBVCByZXNlcnZhdGlvbiBvbmx5IG9uY2Ug
d2hlbiB5b3Ugc2V0Cj4gdXAgdGhlIG1hcHBpbmcgYXJlYSBhdCBkcml2ZXIgbG9hZC4KClllcywg
SSBndWVzcyB0aGF0IHdhcyB0aGUgaXNzdWUgdGhhdCB0aGUgY29tbWVudCBkZXNjcmliZXMsIGJ1
dCB0aGUgCmlzc3VlIHdhc24ndCB0aGVyZSB3aXRoIHZtX2luc2VydF9taXhlZCgpICsgVk1fTUlY
RURNQVAuCgo+Cj4gQWxzbyBUVE0gdXNlcyBWTV9QRk5NQVAgcmlnaHQgbm93IGZvciBldmVyeXRo
aW5nLCBzbyBpdCBjYW4ndCBiZSBhCj4gcHJvYmxlbSB0aGF0IGh1cnRzIG11Y2ggOi0pCgpIbW0s
IGJvdGggNS4xMSBhbmQgZHJtLXRpcCBhcHBlYXJzIHRvIHN0aWxsIHVzZSBNSVhFRE1BUD8KCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUv
ZHJtL3R0bS90dG1fYm9fdm0uYyNMNTU0Cgo+IC1EYW5pZWwKCi9UaG9tYXMKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
