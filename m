Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC65DE7A
	for <lists+dri-devel@lfdr.de>; Mon, 29 Apr 2019 10:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B98AD891EF;
	Mon, 29 Apr 2019 08:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779E0891EF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 08:54:59 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l25so8402131eda.9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 01:54:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=Vap3GKrXW+hZsu3fe4/zYhc+KuWm71/H/MqfxmHc8XE=;
 b=DlZNcuFqD9+SKLnb/ZjeM8UOtDKbLQjYBLa3rqU6ILZ4//jT23u8k0/u4MJfLVBghO
 7nCEGSPoXrXTOL7gAoKd65IJaLlShutzN6j2vWKjmm+bPHU6vwSHpS2F5tG84JzuKa9r
 QjGStoou8fEQNaH3xGpegnIL0O2GIajZ79YOMynOCsLq/JClJ9/Jy8pzfblqBKAqluxn
 8w7/+kxrr0LhDCf8YM6+EX3YyJgWltua2v1aVHX0TLjwSZ4MmTeQ0jvX4zuZeU2jb7Ak
 0DrR2TiH+mO2zUqd1WZ7vUMjkg8zc23qK7ajrXWeRjU9fhQNQ//tii8wdW7Ul9rx/egn
 AsKw==
X-Gm-Message-State: APjAAAUU5RTOqeDJ4jleUGVlrVAlHD5wINx947Z//2EpgYvAiKT/ahpz
 3Vp7DhQhIb9PkuQm0L85G2jHlNeHlDs=
X-Google-Smtp-Source: APXvYqwmxt9JeneS3yFEDnY7BG5v/5fYHLrjo16n6hgwWcMTvYpJE5LL3FYv12rAoR6wDoFRBRRNnQ==
X-Received: by 2002:aa7:dada:: with SMTP id x26mr9605454eds.77.1556528098168; 
 Mon, 29 Apr 2019 01:54:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id x21sm1471714eju.83.2019.04.29.01.54.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 29 Apr 2019 01:54:57 -0700 (PDT)
Date: Mon, 29 Apr 2019 10:54:55 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/12] dma-buf: start caching of sg_table objects
Message-ID: <20190429085455.GN3271@phenom.ffwll.local>
References: <20190426123638.40221-1-christian.koenig@amd.com>
 <20190426123638.40221-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190426123638.40221-3-christian.koenig@amd.com>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=Vap3GKrXW+hZsu3fe4/zYhc+KuWm71/H/MqfxmHc8XE=;
 b=BSGTucV9iCM7Z1HfakYv2vMW1kb9afOQw+ME0yYeny3NPQLX2v+bhX8CswJR2SVudp
 ucxwRgR15b+rEiqYwUZ3x+C7rt47e6iF4/0BQYUXm6LkXHAoGS+CJJOFw32xQTqiZ2Kk
 SVJSeriMLM69r4+CQdMCQPS61j/mgfb89fam4=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMjYsIDIwMTkgYXQgMDI6MzY6MjlQTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5p
ZyB3cm90ZToKPiBUbyBhbGxvdyBhIHNtb290aCB0cmFuc2l0aW9uIGZyb20gcGlubmluZyBidWZm
ZXIgb2JqZWN0cyB0byBkeW5hbWljCj4gaW52YWxpZGF0aW9uIHdlIGZpcnN0IHN0YXJ0IHRvIGNh
Y2hlIHRoZSBzZ190YWJsZSBmb3IgYW4gYXR0YWNobWVudAo+IHVubGVzcyB0aGUgZHJpdmVyIGhh
cyBpbXBsZW1lbnRlZCB0aGUgZXhwbGljaXRlIHBpbi91bnBpbiBjYWxsYmFja3MuCj4gCj4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoK
Q29ycmVjdGlvbiBvbiBteSAic3F1YXNoIGV2ZXJ5dGhpbmciIHN1Z2dlc3Rpb246IEkgdGhpbmsg
dGhpcyBwYXRjaCBoZXJlCnN0aWxsIG5lZWRzIHRvIGJlIHNlcGFyYXRlLCBzbyB0aGF0ICJ3aHkg
ZGlkIHRoaXMgY2F1c2UgYSByZWdyZXNzaW9uIiBpcwplYXNpZXIgdG8gdW5kZXJzdGFuZC4gQnV0
IHdpdGggYSBzbWFsbCBuaXQuCgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwg
MjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAg
fCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
Ywo+IGluZGV4IDA2NTZkY2YyODliZS4uYTE4ZDEwYzQ0MjVhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4g
QEAgLTYxMCw2ICs2MTAsMjAgQEAgZG1hX2J1Zl9hdHRhY2goY29uc3Qgc3RydWN0IGRtYV9idWZf
YXR0YWNoX2luZm8gKmluZm8pCj4gIAlsaXN0X2FkZCgmYXR0YWNoLT5ub2RlLCAmZG1hYnVmLT5h
dHRhY2htZW50cyk7Cj4gIAo+ICAJbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOwo+ICsKPiAr
CWlmICghZG1hYnVmLT5vcHMtPnBpbikgewoKSSB0aGluayBhIHN0YXRpYyBpbmxpbmUgZG1hX2J1
Zl9pc19keW5hbWljX2F0dGFjaG1lbnQoKSB3b3VsZCBiZSBnb29kCmhlcmUsIHdoaWNoIGluIHRo
aXMgcGF0Y2ggKHNpbmNlIGl0J3MgZWFsaWVyKSB3b3VsZCBhbHdheXMgcmV0dXJuIGZhbHNlLgoK
QXNpZGU6IEkgdGhpbmsgb25seSBjaGVja2luZyBwaW4gaGVyZSAoaS5lLiBjYW4gdGhlIGV4cG9y
dGVyIGRvIGR5bmFtaWMKbWFwcGluZ3MpIGlzbid0IGdvb2QgZW5vdWdoLCB3ZSBhbHNvIG5lZWQg
dG8gY2hlY2sgZm9yIHRoZSBpbXBvcnRlcnMKLT5pbnZhbGlkYXRlLiBIZW5jZSBfaXNfZHluYW1p
Y19hdHRhY2htZW50LCBub3QgX2lzX2R5bmFtaWNfZG1hX2J1Zi4gSWYgd2UKZG9uJ3QgYWxzbyBj
aGVjayBmb3IgdGhlIGltcG9ydGVyIHdlIGFnYWluIGhhdmUgYSByZXNlcnZhdGlvbiBsb2NrIGlu
CmRtYV9idWZfbWFwL3VubWFwLCB3aGljaCB3ZSBrbm93IHdpbGwgYW5nZXIgdGhlIGxvY2tkZXAg
Z29kcyAuLi4KLURhbmllbAoKPiArCQlzdHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiArCj4gKwkJc2d0
ID0gZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgRE1BX0JJRElSRUNUSU9OQUwpOwo+
ICsJCWlmICghc2d0KQo+ICsJCQlzZ3QgPSBFUlJfUFRSKC1FTk9NRU0pOwo+ICsJCWlmIChJU19F
UlIoc2d0KSkgewo+ICsJCQlkbWFfYnVmX2RldGFjaChkbWFidWYsIGF0dGFjaCk7Cj4gKwkJCXJl
dHVybiBFUlJfQ0FTVChzZ3QpOwo+ICsJCX0KPiArCQlhdHRhY2gtPnNndCA9IHNndDsKPiArCX0K
PiArCj4gIAlyZXR1cm4gYXR0YWNoOwo+ICAKPiAgZXJyX2F0dGFjaDoKPiBAQCAtNjMyLDYgKzY0
NiwxMCBAQCB2b2lkIGRtYV9idWZfZGV0YWNoKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVj
dCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCkKPiAgCWlmIChXQVJOX09OKCFkbWFidWYgfHwg
IWF0dGFjaCkpCj4gIAkJcmV0dXJuOwo+ICAKPiArCWlmIChhdHRhY2gtPnNndCkKPiArCQlkbWFi
dWYtPm9wcy0+dW5tYXBfZG1hX2J1ZihhdHRhY2gsIGF0dGFjaC0+c2d0LAo+ICsJCQkJCSAgIERN
QV9CSURJUkVDVElPTkFMKTsKPiArCj4gIAltdXRleF9sb2NrKCZkbWFidWYtPmxvY2spOwo+ICAJ
bGlzdF9kZWwoJmF0dGFjaC0+bm9kZSk7Cj4gIAlpZiAoZG1hYnVmLT5vcHMtPmRldGFjaCkKPiBA
QCAtNjY4LDYgKzY4Niw5IEBAIHN0cnVjdCBzZ190YWJsZSAqZG1hX2J1Zl9tYXBfYXR0YWNobWVu
dChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gsCj4gIAlpZiAoV0FSTl9PTighYXR0
YWNoIHx8ICFhdHRhY2gtPmRtYWJ1ZikpCj4gIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Cj4g
IAo+ICsJaWYgKGF0dGFjaC0+c2d0KQo+ICsJCXJldHVybiBhdHRhY2gtPnNndDsKPiArCj4gIAly
ZXNlcnZhdGlvbl9vYmplY3RfbG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdiwgTlVMTCk7Cj4gIAly
ID0gZG1hX2J1Zl9waW4oYXR0YWNoLT5kbWFidWYpOwo+ICAJcmVzZXJ2YXRpb25fb2JqZWN0X3Vu
bG9jayhhdHRhY2gtPmRtYWJ1Zi0+cmVzdik7Cj4gQEAgLTcwMSw2ICs3MjIsOSBAQCB2b2lkIGRt
YV9idWZfdW5tYXBfYXR0YWNobWVudChzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gs
Cj4gIAlpZiAoV0FSTl9PTighYXR0YWNoIHx8ICFhdHRhY2gtPmRtYWJ1ZiB8fCAhc2dfdGFibGUp
KQo+ICAJCXJldHVybjsKPiAgCj4gKwlpZiAoYXR0YWNoLT5zZ3QgPT0gc2dfdGFibGUpCj4gKwkJ
cmV0dXJuOwo+ICsKPiAgCWF0dGFjaC0+ZG1hYnVmLT5vcHMtPnVubWFwX2RtYV9idWYoYXR0YWNo
LCBzZ190YWJsZSwKPiAgCQkJCQkJZGlyZWN0aW9uKTsKPiAgCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBpbmRleCAwMzIx
OTM5YjFjM2QuLmI5ZDA3MTk1ODFjZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYS1i
dWYuaAo+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCj4gQEAgLTM0NSw2ICszNDUsNyBA
QCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50IHsKPiAgCXN0cnVjdCBkbWFfYnVmICpkbWFidWY7
Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gIAlzdHJ1Y3QgbGlzdF9oZWFkIG5vZGU7Cj4gKwlz
dHJ1Y3Qgc2dfdGFibGUgKnNndDsKPiAgCXZvaWQgKnByaXY7Cj4gIH07Cj4gIAo+IC0tIAo+IDIu
MTcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0
aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
