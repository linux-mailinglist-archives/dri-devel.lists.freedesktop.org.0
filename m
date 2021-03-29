Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D9634D6A2
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 20:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86266E4AE;
	Mon, 29 Mar 2021 18:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E87156E4AB;
 Mon, 29 Mar 2021 18:10:47 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ap14so7748332ejc.0;
 Mon, 29 Mar 2021 11:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Plqd5i+LPDd0jPBiJdlzC3DqCduM4xFyiw8RibbunbE=;
 b=GGAJnYFkEf90LJp1AAn7mPBjicf2vH039Kxhfbt+EPABm1WqdzQ2y/h9i1JkwUbiRI
 dAe/5Qwst3GtU96zlTgjA7R4BZ9LhCVbWmxwzwq3wgZ/1Ss7JcOdTvB7umiuDQLh+DhH
 //ub0K9u+OOzbhevvUrccF2TeSHVxG5HwV03AuSs5uDrcKXMSNzfiHTbI9CSzbZL9GCB
 jHt0eyRclnjG07Hp1wsi+97G5O4oj3//A1LAYQFuALNAk0OYMquJtUpFUI5aK619eOLL
 VgL7lcE7WqPwNSGvivaJ+5WV5x0u1mF0N6xw02Fr8544hpbDuLyZ/5x0tcNK4+g78SaJ
 0hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Plqd5i+LPDd0jPBiJdlzC3DqCduM4xFyiw8RibbunbE=;
 b=grI0AYyGooQ4cJV5NrogUs/5TMYt+Xc0r3ZkzeZNHquKIef26g8SupsFL51lnKI339
 1/y16Kpmh7hQLa4YXSw/8I1NCJEbi1y0XV6//c//oaASll2qH+vQOwwFWAsU+MJLbf9u
 R3S7hlIUmV2tT2dbE8rpfqYzbCxxFSJJ1sFH6gavyKxkvmrxbxpCvnKvhsvQOQ8Dozcp
 AWiEtYHTCrlte4MpcrHr0UqpBckmMsWOR+4vE6C1mCRNjqzLs4J0EgSgD4eT5lUg47O8
 CxVXP93kYwV2UAkWUbH5DbXoqTwv8s3bo7HRuaFr2td9ZzGODMbTlmM0Xls8WacjvEe+
 xkBA==
X-Gm-Message-State: AOAM533aUIUpobFyk8xiccfbgnFY6wfwFXAKOHbFjbT8UcXCoaN2BDTY
 OdIG9ScDEkPgJ3TCjXTLx6Y=
X-Google-Smtp-Source: ABdhPJxjZ33z4CQsjnd+1lRZeUqy5TceelIpWoWgfLE8I3eWx5vmN4nP3s62sh0lAkghmk8iycFyyQ==
X-Received: by 2002:a17:906:5295:: with SMTP id
 c21mr29779263ejm.67.1617041446634; 
 Mon, 29 Mar 2021 11:10:46 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd?
 ([2a02:908:1252:fb60:8415:4d1c:ad0a:e8fd])
 by smtp.gmail.com with ESMTPSA id v8sm9586002edq.76.2021.03.29.11.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Mar 2021 11:10:46 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu: fix an underflow on non-4KB-page systems
To: Xi Ruoyao <xry111@mengyan1223.wang>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210329175348.26859-1-xry111@mengyan1223.wang>
 <d192e2a8-8baf-0a8c-93a9-9abbad992c7d@gmail.com>
 <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <9a11c873-a362-b5d1-6d9c-e937034e267d@gmail.com>
Date: Mon, 29 Mar 2021 20:10:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <be9042b9294bda450659d3cd418c5e8759d57319.camel@mengyan1223.wang>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Dan_Hor=c3=a1k?= <dan@danny.cz>, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDMuMjEgdW0gMjA6MDggc2NocmllYiBYaSBSdW95YW86Cj4gT24gMjAyMS0wMy0yOSAy
MDowNCArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gQW0gMjkuMDMuMjEgdW0gMTk6
NTMgc2NocmllYiBY4oS5IFJ1b3lhbzoKPj4+IElmIHRoZSBpbml0aWFsIHZhbHVlIG9mIGBudW1f
ZW50aXJlc2AgKGNhbGN1bGF0ZWQgYXQgbGluZSAxNjU0KSBpcyBub3QKPj4+IGFuIGludGVncmFs
IG11bHRpcGxlIG9mIGBBTURHUFVfR1BVX1BBR0VTX0lOX0NQVV9QQUdFYCwgaW4gbGluZSAxNjgx
IGEKPj4+IHZhbHVlIGdyZWF0ZXIgdGhhbiB0aGUgaW5pdGlhbCB2YWx1ZSB3aWxsIGJlIGFzc2ln
bmVkIHRvIGl0LsKgIFRoYXQgY2F1c2VzCj4+PiBgc3RhcnQgPiBsYXN0ICsgMWAgYWZ0ZXIgbGlu
ZSAxNzA4LsKgIFRoZW4gaW4gdGhlIG5leHQgaXRlcmF0aW9uIGFuCj4+PiB1bmRlcmZsb3cgaGFw
cGVucyBhdCBsaW5lIDE2NTQuwqAgSXQgY2F1c2VzIG1lc3NhZ2UKPj4+Cj4+PiAgwqDCoMKgwqAg
KkVSUk9SKiBDb3VsZG4ndCB1cGRhdGUgQk9fVkEgKC0xMikKPj4+Cj4+PiBwcmludGVkIGluIGtl
cm5lbCBsb2csIGFuZCBHUFUgaGFuZ2luZy4KPj4+Cj4+PiBGb3J0aWZ5IHRoZSBjcml0ZXJpYSBv
ZiB0aGUgbG9vcCB0byBmaXggdGhpcyBpc3N1ZS4KPj4gTkFLIHRoZSB2YWx1ZSBvZiBudW1fZW50
cmllcyBtdXN0IGFsd2F5cyBiZSBhIG11bHRpcGxlIG9mCj4+IEFNREdQVV9HUFVfUEFHRVNfSU5f
Q1BVX1BBR0Ugb3Igb3RoZXJ3aXNlIHdlIGNvcnJ1cHQgdGhlIHBhZ2UgdGFibGVzLgo+Pgo+PiBI
b3cgZG8geW91IHRyaWdnZXIgdGhhdD8KPiBTaW1wbHkgcnVuICJPcGVuR0wgYXJlYSIgZnJvbSBn
dGszLWRlbW8gKHdoaWNoIGp1c3QgcmVuZGVycyBhIHRyaWFuZ2xlIHdpdGggR0wpCj4gdW5kZXIg
WG9yZywgb24gTUlQUzY0LiAgU2VlIHRoZSBCdWdMaW5rLgoKWW91IG5lZWQgdG8gaWRlbnRpZnkg
dGhlIHJvb3QgY2F1c2Ugb2YgdGhpcywgbW9zdCBsaWtlbHkgc3RhcnQgb3IgbGFzdCAKYXJlIG5v
dCBhIG11bHRpcGxlIG9mIEFNREdQVV9HUFVfUEFHRVNfSU5fQ1BVX1BBR0UuCgpDaHJpc3RpYW4u
Cgo+Cj4+IENocmlzdGlhbi4KPj4KPj4+IEJ1Z0xpbms6IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9kcm0vYW1kLy0vaXNzdWVzLzE1NDkKPj4+IEZpeGVzOiBhMzlmMmE4ZDcwNjYgKCJk
cm0vYW1kZ3B1OiBudWtlIGFtZGdwdV92bV9ib19zcGxpdF9tYXBwaW5nIHYyIikKPj4+IFJlcG9y
dGVkLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5nPgo+Pj4gUmVwb3J0ZWQt
Ynk6IERhbiBIb3LDoWsgPGRhbkBkYW5ueS5jej4KPj4+IENjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCj4+PiBTaWduZWQtb2ZmLWJ5OiBYaSBSdW95YW8gPHhyeTExMUBtZW5neWFuMTIyMy53YW5n
Pgo+Pj4gLS0tCj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMg
fCAyICstCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92bS5jCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+PiBp
bmRleCBhZDkxYzBjM2M0MjMuLmNlZTBjYzljODA4NSAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+Pj4gQEAgLTE3MDcsNyArMTcwNyw3IEBAIHN0YXRpYyBp
bnQgYW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKHN0cnVjdAo+Pj4gYW1kZ3B1X2RldmljZSAq
YWRldiwKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoH0KPj4+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0YXJ0ID0gdG1wOwo+Pj4gICAgCj4+PiAtwqDCoMKg
wqDCoMKgwqB9IHdoaWxlICh1bmxpa2VseShzdGFydCAhPSBsYXN0ICsgMSkpOwo+Pj4gK8KgwqDC
oMKgwqDCoMKgfSB3aGlsZSAodW5saWtlbHkoc3RhcnQgPCBsYXN0ICsgMSkpOwo+Pj4gICAgCj4+
PiAgwqDCoMKgwqDCoMKgwqDCoHIgPSB2bS0+dXBkYXRlX2Z1bmNzLT5jb21taXQoJnBhcmFtcywg
ZmVuY2UpOwo+Pj4gICAgCj4+Pgo+Pj4gYmFzZS1jb21taXQ6IGE1ZTEzYzZkZjBlNDE3MDJkMmIy
Yzc3YzhhZDQxNjc3ZWJiMDY1YjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
