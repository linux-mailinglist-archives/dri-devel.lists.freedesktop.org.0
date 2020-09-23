Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A93B4274F7B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 05:17:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7566E422;
	Wed, 23 Sep 2020 03:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DFD16E422
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 03:17:40 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id p9so25706559ejf.6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 20:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DXWt5u5tuAaPTxzyKqY/1pXkvRToGP40Af24+9Q3ywU=;
 b=uxP8AIjcRmd4ouEfn+Q9k15TVnDwn2lfRp/FlBeIyp0zrooNGvbHNbn09ssstPDy+q
 LLObv0azgdObRcBA3FsbnsWR7KIcpLQim9dD9VVddhSPm/62V/sCoRklC/7hfWBBr6x7
 DNqoUduqbsUCN1suMRRqmliY59BPaWPvPa/oVG1FfzVnU5KHf2ddQEKqS6zDKQTTHcgA
 mblirq3M+SHej2FMHXdpG3NhzfkKMbvWv8yVkmt/VZKBDMJPpuqGLQDKnx9uOk+ZXI0K
 5BICodSjYbhDElqGaKCYC7l8RKt4TeBwCe2L8amGkcddVWtTDFJKM4JKIs3ysTVazZj6
 OkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DXWt5u5tuAaPTxzyKqY/1pXkvRToGP40Af24+9Q3ywU=;
 b=EmxbUXpMUQmbjQ2WWs/kLLNbwH7hXge7DvXkPtzJEpgaOGZ+48liFvwONcE6d/xDNt
 EzQ5Re/b7yo4lJDEQnatI3vEXtKwYEb0QlUEJ1pSvHB2MhV65a8nmjugnKvpHgELnSYG
 hR5fG1RIoUQbhkwtLaSRx8XSxn1oDbrfkDO+k6tuNwT/4NFzLSMr6qQY59UWCL5LAa/q
 1q5tMLiT8jZUvFvpvLT72t+0t7s2W+xsuYrAJxrVbU3dXYHjYb0ztiX1AA1Kzkh7akyB
 FxKThhocsPJgw0HwnyxM468NGnN+H/fjF1csnP7/h/yYRZo5tOAuhWAUrFvhaEht8k8G
 0brA==
X-Gm-Message-State: AOAM531G4/9CiVzwVVyWa9kwgu440LhRh4tNoO4vScP8Sr5nhYelLs3+
 4xM0y9HCh7eOAL1YOzFXRP2zV1SpQm8FBJFUB+l6/Ldr
X-Google-Smtp-Source: ABdhPJyP/w1PAW//MYpol4dOJu8RS4Q/chGe31nhM9DKit/CidFlvCxFPKNlsnrFH+GYl9KjrAeM+rJr0onlYrBYHbc=
X-Received: by 2002:a17:906:2b83:: with SMTP id
 m3mr8141342ejg.456.1600831058978; 
 Tue, 22 Sep 2020 20:17:38 -0700 (PDT)
MIME-Version: 1.0
References: <fabf5079-6c39-7c8f-2973-5b32494f852a@gmail.com>
 <5fb55684-c797-a104-253f-bf43634f0cec@daenzer.net>
 <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
In-Reply-To: <9181f6be-0da1-2f43-2014-7c3195147194@amd.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 23 Sep 2020 13:17:27 +1000
Message-ID: <CAPM=9tzWw3x345AHeODiQ9noDNN6XuTd6J2GsADhu4bQns1_XA@mail.gmail.com>
Subject: Re: Why can't ttm_tt_swapout() handle uncached or WC BOs?
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAxOCBTZXAgMjAyMCBhdCAwMDo0OSwgQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiB3cm90ZToKPgo+IEFtIDE3LjA5LjIwIHVtIDE2OjQ0IHNjaHJpZWIg
TWljaGVsIETDpG56ZXI6Cj4gPiBPbiAyMDIwLTA5LTE3IDI6MjAgcC5tLiwgQ2hyaXN0aWFuIEvD
tm5pZyB3cm90ZToKPiA+PiBIaSBndXlzLAo+ID4+Cj4gPj4gTWljaGVsIG9uY2Ugc3VibWl0dGVk
IGEgcGF0Y2ggdG8gZml4IHRyaWdnZXJpbmcgdGhpcyBCVUdfT04gaW4KPiA+PiB0dG1fdHRfc3dh
cG91dCgpOgo+ID4+Cj4gPj4+IEJVR19PTih0dG0tPmNhY2hpbmdfc3RhdGUgIT0gdHRfY2FjaGVk
KTsKPiA+Pgo+ID4+IE5vdyBteSBxdWVzdGlvbiBpcyBkb2VzIGFueWJvZHkga25vdyB3aHkgd2Ug
aGF2ZSB0aGF0IGluIHRoZSBmaXJzdAo+ID4+IHBsYWNlPwo+ID4+Cj4gPj4gVGhlIG9ubHkgcHJv
YmxlbWF0aWMgdGhpbmcgSSBjYW4gc2VlIGlzIGNhbGxpbmcgY29weV9oaWdocGFnZSgpIGFuZAo+
ID4+IHRoYXQgb25lIGlzIGp1c3QgZG9pbmcgYSBrbWFwX2F0b21pYygpL2t1bm1hcF9hdG9taWMo
KSBvbiB0aGUgc291cmNlCj4gPj4gYW5kIGRlc3RpbmF0aW9uLgo+ID4+Cj4gPj4gSSBjYW4ndCBz
ZWUgd2h5IGl0IHNob3VsZCBiZSBwcm9ibGVtYXRpYyBmb3IgdGhpcyB0ZW1wb3JhcnkgbWFwcGlu
Zwo+ID4+IHRvIGJlIGNhY2hlZCBpbnN0ZWFkIG9mIHVuY2FjaGVkIG9yIFdDPwo+ID4+Cj4gPj4g
RG9lcyBhbnlib2R5IGhhcyBhbnkgaWRlYT8KPiA+Cj4gPiBPbmUgdGhpbmcgaXMgdGhhdCBBRkFJ
SyBzb21lIChBUk0/KSBDUFVzIGNhbiBnZXQgdmVyeSB1cHNldCB3aGVuCj4gPiB0aGVyZSdzIGJv
dGggYSBjYWNoZWQgYW5kIHVuY2FjaGVhYmxlIG1hcHBpbmcgZm9yIHRoZSBzYW1lIHBoeXNpY2Fs
IHBhZ2UuCj4KPiBHb29kIHBvaW50LCBidXQgSSBhbHJlYWR5IGNvbnNpZGVyZWQgdGhpcy4KPgo+
IElmIHRoZXJlIGlzIGFub3RoZXIgbWFwcGluZyBmb3IgdGhhdCBwYWdlIGxlZnQgd2UgYXJlIGNv
bXBsZXRlbHkgYnVzdGVkCj4gYW55d2F5IHNpbmNlIHdlIGFyZSBjdXJyZW50bHkgY2hhbmdpbmcg
dGhlIHVuZGVybHlpbmcgc3RvcmFnZS4KPgoKSXQncyBub3QganVzdCBBUk0gb2YgY291cnNlLCB4
ODYgUEFUIGFsc28gaGFzIG1hbnkgaXNzdWVzIGFib3V0Cm11bHRpcGxlIG1hcHBpbmdzIG9mIHRo
ZSBzYW1lIGJhY2tpbmcgcGFnZSB3aXRoIGRpZmZlcmVudCBhdHRyaWJ1dGVzLgoKVGhlIG9ubHkg
bWFwcGluZ3MgbWlnaHQgYmUgaW4gdGhlIGxpbmVhciBtYXBwaW5nLCBzaW5jZSBub3QgYWxsIHBh
Z2VzCndlIGdldCBoZXJlIHdpbGwgbmVjZXNzYXJpbHkgYmUgaGlnaCBwYWdlcyBJIGFzc3VtZSBh
bmQgdGhlcmVmb3JlCmNvdWxkIGhhdmUgYSBsaW5lYXIgbWFwcGluZy4gSWYgd2UndmUgY2hhbmdl
ZCB0aGUgbGluZWFyIG1hcHBpbmcgdG8Kbm9uLWNhY2hlZCwgdGhlbiBjcmVhdGUgYSBjYWNoZWQg
a21hcCBJJ20gbm90IDEwMCUgdGhhdCB3b24ndCBjYXVzZQppc3N1ZXMuCgpidXQgdGhpcyBpcyBh
IGRlZmluaXRlIG1hemUgb2YgdHdpc3R5IHBhc3NhZ2VzIGFuZCBJJ2QgcHJvYmFibHkgbmVlZAp0
byBzaXQgZG93biBhbmQgYnJlYWsgaXQgYSBiaXQgbW9yZS4KCkRhdmUuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
