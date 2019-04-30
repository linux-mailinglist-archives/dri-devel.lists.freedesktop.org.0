Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4F9FB41
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 16:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6828589182;
	Tue, 30 Apr 2019 14:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C17689182
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 14:18:33 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id y67so12491821ede.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 07:18:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to:user-agent;
 bh=otbKHx1kbDrhzXsUaxwaowr0xfC3gUnn0Or3HOxg/8Q=;
 b=Db1iLIPCX7nbln1NXXbRlUxUc/ldKLlZu5W3tJtjJTL+Q4fhPVIN+myZop7w1rdTp8
 Rm3iLS5aJWDl8UE/PuZ8UAoHs/f6QbVty2rO3osSHawZ6ieSOyVfP1Ue81UB5WnkCl8W
 RQO3kDlN2ZSmnAjqRtROq2/Ab/e1K813P0PpvM9HprmrJ7QnVDfxZbJzWfEa/+GXfBDS
 i6DEh5778IlZa5GEgu2oBYA9+ubzbC2eA9KcsOE0mO4yUuDr9bhiG8T/MA26UX1tXUcR
 wQrImtv3DMuKZhXe+Mj6mFX7vHPRAIYcPSpI/TvLrOgbr+OdZT/ImS8W5lK0Yf2u6jVu
 LxgQ==
X-Gm-Message-State: APjAAAXnEb9PbkMkzzKkC2hlaAFhqatte8rWkhOZYdOYiDX54L3TNIIa
 EM6Ov19O8rF//oDUbqXlMWwxiw==
X-Google-Smtp-Source: APXvYqyPZHhcbWcvS8mArKY9jXSTeh12ubgCwrndu9GFau/kthe8Xwx5eKwL994kchxwuFwxqGH3uw==
X-Received: by 2002:a50:a389:: with SMTP id s9mr5808730edb.113.1556633912179; 
 Tue, 30 Apr 2019 07:18:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id q18sm6225301ejp.56.2019.04.30.07.18.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 30 Apr 2019 07:18:31 -0700 (PDT)
Date: Tue, 30 Apr 2019 16:18:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/12] dma-buf: start caching of sg_table objects
Message-ID: <20190430141827.GU3271@phenom.ffwll.local>
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
 bh=otbKHx1kbDrhzXsUaxwaowr0xfC3gUnn0Or3HOxg/8Q=;
 b=VbJdjFf+c4xK7VdGAZ2LYnCVXaagxYfjTajMFwCDZuc3igGWxHFn3MuF3E9lNmJ43y
 Z1GINO3U01QLNYDFkcb2iAJGuOzpBEIctcKfs63kL/kt4pRG5FtGUsDcvqjD5xVZsFdK
 Glr7gT58IVzYDK+ZBHAvWVQgvnlhm5XoAyQh4=
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
YnR3IGdpdmVuIGhvdyBodWdlIGEgY2hhbmdlIHRoaXMgaXMgdGhlIGRvYyB1cGRhdGUgaXMgcmF0
aGVyIHRoaW4gOi0pCgpQcm9iYWJseSBiZXR0ZXIgdG8gcmV2aXNlIHRoaXMgYWxsIHRvZ2V0aGVy
LCBzbyB3ZSBoYXZlIGEgY29oZXJlbnQKZG9jdW1lbnRhdGlvbiBzdG9yeSBiZXR3ZWVuIHN0YXRp
YyBhbmQgZHluYW1pYyBkbWEtYnVmIGF0dGFjaG1lbnRzIGFuZAp3aGF0IGV4YWN0bHkgdGhhdCBt
ZWFucyBpbiBlYWNoIGNhc2UuCgo+IC0tLQo+ICBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwg
MjQgKysrKysrKysrKysrKysrKysrKysrKysrCj4gIGluY2x1ZGUvbGludXgvZG1hLWJ1Zi5oICAg
fCAgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYu
Ywo+IGluZGV4IDA2NTZkY2YyODliZS4uYTE4ZDEwYzQ0MjVhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMKPiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCj4g
QEAgLTYxMCw2ICs2MTAsMjAgQEAgZG1hX2J1Zl9hdHRhY2goY29uc3Qgc3RydWN0IGRtYV9idWZf
YXR0YWNoX2luZm8gKmluZm8pCj4gIAlsaXN0X2FkZCgmYXR0YWNoLT5ub2RlLCAmZG1hYnVmLT5h
dHRhY2htZW50cyk7Cj4gIAo+ICAJbXV0ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOwo+ICsKPiAr
CWlmICghZG1hYnVmLT5vcHMtPnBpbikgewo+ICsJCXN0cnVjdCBzZ190YWJsZSAqc2d0Owo+ICsK
PiArCQlzZ3QgPSBkbWFidWYtPm9wcy0+bWFwX2RtYV9idWYoYXR0YWNoLCBETUFfQklESVJFQ1RJ
T05BTCk7Cj4gKwkJaWYgKCFzZ3QpCj4gKwkJCXNndCA9IEVSUl9QVFIoLUVOT01FTSk7Cj4gKwkJ
aWYgKElTX0VSUihzZ3QpKSB7Cj4gKwkJCWRtYV9idWZfZGV0YWNoKGRtYWJ1ZiwgYXR0YWNoKTsK
PiArCQkJcmV0dXJuIEVSUl9DQVNUKHNndCk7Cj4gKwkJfQo+ICsJCWF0dGFjaC0+c2d0ID0gc2d0
Owo+ICsJfQo+ICsKPiAgCXJldHVybiBhdHRhY2g7Cj4gIAo+ICBlcnJfYXR0YWNoOgo+IEBAIC02
MzIsNiArNjQ2LDEwIEBAIHZvaWQgZG1hX2J1Zl9kZXRhY2goc3RydWN0IGRtYV9idWYgKmRtYWJ1
Ziwgc3RydWN0IGRtYV9idWZfYXR0YWNobWVudCAqYXR0YWNoKQo+ICAJaWYgKFdBUk5fT04oIWRt
YWJ1ZiB8fCAhYXR0YWNoKSkKPiAgCQlyZXR1cm47Cj4gIAo+ICsJaWYgKGF0dGFjaC0+c2d0KQo+
ICsJCWRtYWJ1Zi0+b3BzLT51bm1hcF9kbWFfYnVmKGF0dGFjaCwgYXR0YWNoLT5zZ3QsCj4gKwkJ
CQkJICAgRE1BX0JJRElSRUNUSU9OQUwpOwo+ICsKPiAgCW11dGV4X2xvY2soJmRtYWJ1Zi0+bG9j
ayk7Cj4gIAlsaXN0X2RlbCgmYXR0YWNoLT5ub2RlKTsKPiAgCWlmIChkbWFidWYtPm9wcy0+ZGV0
YWNoKQo+IEBAIC02NjgsNiArNjg2LDkgQEAgc3RydWN0IHNnX3RhYmxlICpkbWFfYnVmX21hcF9h
dHRhY2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKPiAgCWlmIChXQVJO
X09OKCFhdHRhY2ggfHwgIWF0dGFjaC0+ZG1hYnVmKSkKPiAgCQlyZXR1cm4gRVJSX1BUUigtRUlO
VkFMKTsKPiAgCj4gKwlpZiAoYXR0YWNoLT5zZ3QpCj4gKwkJcmV0dXJuIGF0dGFjaC0+c2d0Owo+
ICsKPiAgCXJlc2VydmF0aW9uX29iamVjdF9sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2LCBOVUxM
KTsKPiAgCXIgPSBkbWFfYnVmX3BpbihhdHRhY2gtPmRtYWJ1Zik7Cj4gIAlyZXNlcnZhdGlvbl9v
YmplY3RfdW5sb2NrKGF0dGFjaC0+ZG1hYnVmLT5yZXN2KTsKPiBAQCAtNzAxLDYgKzcyMiw5IEBA
IHZvaWQgZG1hX2J1Zl91bm1hcF9hdHRhY2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQg
KmF0dGFjaCwKPiAgCWlmIChXQVJOX09OKCFhdHRhY2ggfHwgIWF0dGFjaC0+ZG1hYnVmIHx8ICFz
Z190YWJsZSkpCj4gIAkJcmV0dXJuOwo+ICAKPiArCWlmIChhdHRhY2gtPnNndCA9PSBzZ190YWJs
ZSkKPiArCQlyZXR1cm47Cj4gKwo+ICAJYXR0YWNoLT5kbWFidWYtPm9wcy0+dW5tYXBfZG1hX2J1
ZihhdHRhY2gsIHNnX3RhYmxlLAo+ICAJCQkJCQlkaXJlY3Rpb24pOwo+ICAKPiBkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9kbWEtYnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaAo+IGlu
ZGV4IDAzMjE5MzliMWMzZC4uYjlkMDcxOTU4MWNkIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGlu
dXgvZG1hLWJ1Zi5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgKPiBAQCAtMzQ1LDYg
KzM0NSw3IEBAIHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgewo+ICAJc3RydWN0IGRtYV9idWYg
KmRtYWJ1ZjsKPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsKPiAgCXN0cnVjdCBsaXN0X2hlYWQgbm9k
ZTsKPiArCXN0cnVjdCBzZ190YWJsZSAqc2d0Owo+ICAJdm9pZCAqcHJpdjsKPiAgfTsKPiAgCj4g
LS0gCj4gMi4xNy4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwg
Q29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
