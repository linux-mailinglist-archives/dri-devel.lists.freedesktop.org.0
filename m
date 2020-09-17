Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D94526E81C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 00:17:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B9A6E41F;
	Thu, 17 Sep 2020 22:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB706EC48
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 15:24:58 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id e7so2134158qtj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Sep 2020 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=/MIjfA84FROcmh2Yr+++vHpa0nobfYfMg9k42KNVp2M=;
 b=KItZq7TLRwXkeSUDV7TVakSYOYYpYVj1lFuOvU0VuV2nyeTZkDl+5SDk5YU6xRfdQb
 mmJrGXwRgXiqpqZBf8DLOJr/gMeGErqhZkM8rZSmNzY3KpK/NJt55cQb3C29WXfmsp40
 KJdpWLxQBDyknwAoYt/ULy2EsSn//x6zNDDJW/sQmVP1idUubfNstwrhi9t017rZ3QZJ
 3sDqFSKs5FzHiMnyyMyLtAnPX0Naf0m0oIbzEeYFHkliee0CZ1/6R0VN7TcyiVwxLFrO
 JOOOGOMacxM9ezg1v7YEt3scmLEmwNPGkyrd88i/jnPrnz/LvnJkdxDuuHZJUSvAh0TC
 tmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=/MIjfA84FROcmh2Yr+++vHpa0nobfYfMg9k42KNVp2M=;
 b=jb0tPxWQaucmI+KAEgX+a4gBFFcEWnUPcsfOvyoYyfvZ+luPuoFanUSovqmkVpJVLo
 799/Jepze0KTru1DuRGlMMBT10ZrpdD7IneFH4AyJn7xjiuGkyqKo/Lt/dupC+/xWXDP
 lyzx23IaiBl1zGW982d9CPAQOkY4AnGbbBS/AE/oWOZjR+gMXcRNaDNZIFj0IGhRRIYP
 psEF3OrBUTwte2NyM7RzlpXGojITRvQjUQ+kgvKa33qzdUq5zMFpMOrG9Xk3ph6BMMQl
 xjWzqvQ1DZXmeEqxSaEpifPFg4DGHuqs8XG5kCOptw+eGDtdzBdDZqTMoFHMwfum5iKK
 XooQ==
X-Gm-Message-State: AOAM5334L222Kh/chqHhxbxTjf0t7Zf7sTapp1jBADGPQH7/jJ6Yo41y
 youMWZWfJSbRy6EjOw04RK4g0g==
X-Google-Smtp-Source: ABdhPJyml2ehbabsQ2p5uBo50b15HPhlS1qE50x7EQpnsGFfmEF+Ym7+K38vhRLvzw2lQSd1AWRM1Q==
X-Received: by 2002:ac8:5d04:: with SMTP id f4mr16143583qtx.290.1600356297898; 
 Thu, 17 Sep 2020 08:24:57 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id z74sm86638qkb.11.2020.09.17.08.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:24:57 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kIvmK-000VsL-KF; Thu, 17 Sep 2020 12:24:56 -0300
Date: Thu, 17 Sep 2020 12:24:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: christian.koenig@amd.com
Subject: Re: [Linaro-mm-sig] Changing vma->vm_file in dma_buf_mmap()
Message-ID: <20200917152456.GH8409@ziepe.ca>
References: <aa953b09-53b1-104b-dc4b-156ad8a75e62@gmail.com>
 <CAKMK7uHJNRzCJfWVSmMrLmGXE0qo+OCXiMd+zPTOkeG2pnVrmQ@mail.gmail.com>
 <8d8693db-a3f0-4f5f-3e32-57d23ca620f8@amd.com>
 <CAKMK7uE=UqZD3PVC8XZAXrgGH-VsUF_-YQD3MLV8KK1kpxO4yQ@mail.gmail.com>
 <20200917113110.GE8409@ziepe.ca>
 <6fd74b84-959c-8b3b-c27b-e9fbf66396c7@gmail.com>
 <20200917121858.GF8409@ziepe.ca>
 <d82f08ee-2dec-18e8-fb06-d26f18ed777a@gmail.com>
 <20200917143551.GG8409@ziepe.ca>
 <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5b330920-c789-fac7-e9b1-49f3bc1097a8@gmail.com>
X-Mailman-Approved-At: Thu, 17 Sep 2020 22:17:03 +0000
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTcsIDIwMjAgYXQgMDQ6NTQ6NDRQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBBbSAxNy4wOS4yMCB1bSAxNjozNSBzY2hyaWViIEphc29uIEd1bnRob3JwZToK
PiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDAyOjI0OjI5UE0gKzAyMDAsIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4gPiA+IEFtIDE3LjA5LjIwIHVtIDE0OjE4IHNjaHJpZWIgSmFzb24gR3Vu
dGhvcnBlOgo+ID4gPiA+IE9uIFRodSwgU2VwIDE3LCAyMDIwIGF0IDAyOjAzOjQ4UE0gKzAyMDAs
IENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiA+ID4gPiBBbSAxNy4wOS4yMCB1bSAxMzozMSBz
Y2hyaWViIEphc29uIEd1bnRob3JwZToKPiA+ID4gPiA+ID4gT24gVGh1LCBTZXAgMTcsIDIwMjAg
YXQgMTA6MDk6MTJBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3cm90ZToKPiA+ID4gPiA+ID4gCj4g
PiA+ID4gPiA+ID4gWWVhaCwgYnV0IGl0IGRvZXNuJ3Qgd29yayB3aGVuIGZvcndhcmRpbmcgZnJv
bSB0aGUgZHJtIGNoYXJkZXYgdG8gdGhlCj4gPiA+ID4gPiA+ID4gZG1hLWJ1ZiBvbiB0aGUgaW1w
b3J0ZXIgc2lkZSwgc2luY2UgeW91J2QgbmVlZCBhIHRvbiBvZiBkaWZmZXJlbnQKPiA+ID4gPiA+
ID4gPiBhZGRyZXNzIHNwYWNlcy4gQW5kIHlvdSBzdGlsbCByZWx5IG9uIHRoZSBjb3JlIGNvZGUg
cGlja2luZyB1cCB5b3VyCj4gPiA+ID4gPiA+ID4gcGdvZmYgbWFuZ2xpbmcsIHdoaWNoIGZlZWxz
IGFib3V0IGFzIHJpc2t5IHRvIG1lIGFzIHRoZSB2bWEgZmlsZQo+ID4gPiA+ID4gPiA+IHBvaW50
ZXIgd3JhbmdsaW5nIC0gaWYgaXQncyBub3QgY29uc2lzdGVudGx5IGFwcGxpZWQgdGhlIHJldmVy
c2UgbWFwCj4gPiA+ID4gPiA+ID4gaXMgdG9hc3QgYW5kIHVubWFwX21hcHBpbmdfcmFuZ2UgZG9l
c24ndCB3b3JrIGNvcnJlY3RseSBmb3Igb3VyIG5lZWRzLgo+ID4gPiA+ID4gPiBJIHdvdWxkIHRo
aW5rIHRoZSBwZ29mZiBoYXMgdG8gYmUgdHJhbnNsYXRlZCBhdCB0aGUgc2FtZSB0aW1lIHRoZQo+
ID4gPiA+ID4gPiB2bS0+dm1fZmlsZSBpcyBjaGFuZ2VkPwo+ID4gPiA+ID4gPiAKPiA+ID4gPiA+
ID4gVGhlIG93bmVyIG9mIHRoZSBkbWFfYnVmIHNob3VsZCBoYXZlIG9uZSB2aXJ0dWFsIGFkZHJl
c3Mgc3BhY2UgYW5kIEZELAo+ID4gPiA+ID4gPiBhbGwgaXRzIGRtYSBidWZzIHNob3VsZCBiZSBs
aW5rZWQgdG8gaXQsIGFuZCBhbGwgcGdvZmZzIHRyYW5zbGF0ZWQgdG8KPiA+ID4gPiA+ID4gdGhh
dCBzcGFjZS4KPiA+ID4gPiA+IFllYWgsIHRoYXQgaXMgZXhhY3RseSBsaWtlIGFtZGdwdSBpcyBk
b2luZyBpdC4KPiA+ID4gPiA+IAo+ID4gPiA+ID4gR29pbmcgdG8gZG9jdW1lbnQgdGhhdCBzb21l
aG93IHdoZW4gSSdtIGRvbmUgd2l0aCBUVE0gY2xlYW51cHMuCj4gPiA+ID4gQlRXLCB3aGlsZSBw
ZW9wbGUgYXJlIGxvb2tpbmcgYXQgdGhpcywgaXMgdGhlcmUgYSB3YXkgdG8gZ28gZnJvbSBhIFZN
QQo+ID4gPiA+IHRvIGEgZG1hX2J1ZiB0aGF0IG93bnMgaXQ/Cj4gPiA+IE9ubHkgYSBkcml2ZXIg
c3BlY2lmaWMgb25lLgo+ID4gU291bmRzIE9LCj4gPiAKPiA+ID4gRm9yIFRUTSBkcml2ZXJzIHZt
YS0+dm1fcHJpdmF0ZV9kYXRhIHBvaW50cyB0byB0aGUgYnVmZmVyIG9iamVjdC4gTm90IHN1cmUK
PiA+ID4gYWJvdXQgdGhlIGRyaXZlcnMgdXNpbmcgR0VNIG9ubHkuCj4gPiBXaHkgYXJlIGRyaXZl
cnMgaW4gY29udHJvbCBvZiB0aGUgdm1hPyBJIHdvdWxkIHRoaW5rIGRtYV9idWYgc2hvdWxkIGJl
Cj4gPiB0aGUgdm1hIG93bmVyLiBJSVJDIG1vZHVsZSBsaWZldGltZSBjb3JyZWN0bmVzcyBlc3Nl
bnRpYWxseSBoaW5ncyBvbgo+ID4gdGhlIG1vZHVsZSBvd25lciBvZiB0aGUgc3RydWN0IGZpbGUK
PiAKPiBCZWNhdXNlIHRoZSBwYWdlIGZhdWx0IGhhbmRsaW5nIGlzIGNvbXBsZXRlbHkgZHJpdmVy
IHNwZWNpZmljLgo+Cj4gV2UgY291bGQgaW5zdGFsbCBzb21lIERNQS1idWYgdm1vcHMsIGJ1dCB0
aGF0IHdvdWxkIGp1c3QgYmUgYW5vdGhlciBsYXllciBvZgo+IHJlZGlyZWN0aW9uLgoKSWYgaXQg
aXMgYWxyZWFkeSB0YWtpbmcgYSBwYWdlIGZhdWx0IEknbSBub3Qgc3VyZSB0aGUgZXh0cmEgZnVu
Y3Rpb24KY2FsbCBpbmRpcmVjdGlvbiBpcyBnb2luZyB0byBiZSBhIGJpZyBkZWFsLiBIYXZpbmcg
YSB1bmlmb3JtIFZNQQpzb3VuZHMgc2FuZXIgdGhhbiBldmVyeSBkcml2ZXIgY3VzdG9tIHJvbGxp
bmcgc29tZXRoaW5nLgoKV2hlbiBJIHVud291bmQgYSBzaW1pbGFyIG1lc3MgaW4gUkRNQSBhbGwg
dGhlIGN1c3RvbSBWTUEgc3R1ZmYgaW4gdGhlCmRyaXZlcnMgdHVybmVkIG91dCB0byBiZSBnZW5l
cmFsbHkgYnVnZ3ksIGF0IGxlYXN0LgoKSXMgdm1hLT52bV9maWxlLT5wcml2YXRlX2RhdGEgdW5p
dmVyc2FsbHkgYSBkbWFfYnVmIHBvaW50ZXIgYXQgbGVhc3Q/Cgo+ID4gU28sIHVzZXIgVkEgLT4g
ZmluZF92bWEgLT4gZG1hX2J1ZiBvYmplY3QgLT4gZG1hX2J1ZiBvcGVyYXRpb25zIG9uIHRoZQo+
ID4gbWVtb3J5IGl0IHJlcHJlc2VudHMKPiAKPiBBaCwgeWVzIHdlIGFyZSBhbHJlYWR5IGRvaW5n
IHRoaXMgaW4gYW1kZ3B1IGFzIHdlbGwuIEJ1dCBvbmx5IGZvciBETUEtYnVmcwo+IG9yIG1vcmUg
Z2VuZXJhbGx5IGJ1ZmZlcnMgd2hpY2ggYXJlIG1tYXBlZCBieSB0aGlzIGRyaXZlciBpbnN0YW5j
ZS4KClNvIHRoZXJlIGlzIG5vIGdlbmVyYWwgZG1hX2J1ZiBzZXJ2aWNlPyBUaGF0IGlzIGEgcmVh
bCBidW1tZXIKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
