Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A41592B2
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 16:15:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EC86E50E;
	Tue, 11 Feb 2020 15:15:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3D7489D40;
 Tue, 11 Feb 2020 15:15:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m10so2495482wmc.0;
 Tue, 11 Feb 2020 07:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Ao4WC8aY6ytlL9NiBrjN7irpIpUrAb2wpdcU0Lk9hVs=;
 b=oQoVhlwUJQ7U1xcLiKZFNMoWPl3kwor7nhhoVFPh7mcC+RQHJEWuzdK2DHVADsWprw
 ck1CMl/h5sMyrS1mVh1fo0KPQ0+JrmdVDCLhbVbxE8LNMVy6HzCtpWozgZVHSGcqiG4O
 /mSvc0h34i58I+xI5dEj1izoeukcGjVND+8If12jn0blhDvuI8R2/vF31/PYejnZWrtd
 CY2eMWu5HroSkoTx1b2uaMQfpnWzcvGVGrzJws5U/erPzcKzLA5b/ASW57f8/4pSs7oi
 JGRB2a4+xd028wgtLeCpd3BrnS5QBsoPYP9HICQVXwV8cvPYLqwkg1ZXL9cdqrtK2CkS
 ZcBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Ao4WC8aY6ytlL9NiBrjN7irpIpUrAb2wpdcU0Lk9hVs=;
 b=en8LNYEqh0bdg+9NgiG4581xEM6hpkFsP7qHW8bTtwfEJEqmrQPjY5JY5Rj7PZcCyQ
 QI74+Bob8V5T9D0KUgDdgR0qzhcD3rmylM5b9MibOOVHic/D7SHduIDkYsaO7zj2Q1t1
 sruEXLE1RxvOfyuwk0VWrSLo+p3KAmusdBbDU2xxE5efTZ8wlTzhs+O97jujlVMzvCN6
 QPQTht0QtKYfNh9vtsTSNlguHbTt2lk7PtOqvX7zOzYuuioDQ7oNgDsErdgbcBcBIxxM
 qnGX931cDp+R9B/MnQEi9Ynuwmf+7DmuvAazscVCgmrtuw775wIJvVodnCCnp7yDxdrM
 pATA==
X-Gm-Message-State: APjAAAXhtdC5moLrEkXmo8z71rj9ruwctLkGdGDxfN1Tr8B/ysWPtqTq
 BavLHJI7ZxIcIskgfc8VxmiNzxAQ
X-Google-Smtp-Source: APXvYqzmU1gZ+3rV6q/Zl/0ATC1tLxcVKKClpCTRnDjqZ+db2c3reGlf994hhd/7QaDTwtgq2pVSdw==
X-Received: by 2002:a1c:7317:: with SMTP id d23mr6304988wmb.165.1581434119243; 
 Tue, 11 Feb 2020 07:15:19 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id l2sm4075128wme.1.2020.02.11.07.15.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Feb 2020 07:15:18 -0800 (PST)
Subject: Re: [PATCH 5/6] drm/ttm: replace dma_resv object on deleted BOs v2
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200210150907.20616-1-christian.koenig@amd.com>
 <20200210150907.20616-6-christian.koenig@amd.com>
 <20200211141402.GB2363188@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <52b7754b-548d-9166-5285-a5ca35405fa2@gmail.com>
Date: Tue, 11 Feb 2020 16:15:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200211141402.GB2363188@phenom.ffwll.local>
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
Reply-To: christian.koenig@amd.com
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDIuMjAgdW0gMTU6MTQgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgRmVi
IDEwLCAyMDIwIGF0IDA0OjA5OjA2UE0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IFdoZW4gbm9uLWltcG9ydGVkIEJPcyBhcmUgcmVzdXJyZWN0ZWQgZm9yIGRlbGF5ZWQgZGVsZXRl
IHdlIHJlcGxhY2UKPj4gdGhlIGRtYV9yZXN2IG9iamVjdCB0byBhbGxvdyBmb3IgZWFzeSByZWNs
YWltaW5nIG9mIHRoZSByZXNvdXJjZXMuCj4+Cj4+IHYyOiBtb3ZlIHRoYXQgdG8gdHRtX2JvX2lu
ZGl2aWR1YWxpemVfcmVzdgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgfCAxMCArKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggZDA2MjQ2
ODVmNWQyLi40ZDE2MTAzOGRlOTggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtMzkz
LDYgKzM5MywxNCBAQCBzdGF0aWMgaW50IHR0bV9ib19pbmRpdmlkdWFsaXplX3Jlc3Yoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibykKPj4gICAKPj4gICAJciA9IGRtYV9yZXN2X2NvcHlfZmVu
Y2VzKCZiby0+YmFzZS5fcmVzdiwgYm8tPmJhc2UucmVzdik7Cj4+ICAgCWRtYV9yZXN2X3VubG9j
aygmYm8tPmJhc2UuX3Jlc3YpOwo+PiArCWlmIChyKQo+PiArCQlyZXR1cm4gcjsKPj4gKwo+PiAr
CWlmIChiby0+dHlwZSAhPSB0dG1fYm9fdHlwZV9zZykgewo+PiArCQlzcGluX2xvY2soJnR0bV9i
b19nbG9iLmxydV9sb2NrKTsKPj4gKwkJYm8tPmJhc2UucmVzdiA9ICZiby0+YmFzZS5fcmVzdjsK
PiBIYXZpbmcgdGhlIGRtYV9yZXN2IHBvaW50ZXIgYmUgcHJvdGVjdGVkIGJ5IHRoZSBscnVfbG9j
ayBmb3IgdHRtIGludGVybmFsCj4gc3R1ZmYsIGJ1dCBpbnZhcmlhbnQgZXZlcnl3aGVyZSBlbHNl
IGlzIHJlYWxseSBjb25mdXNpbmcuIE5vdCBzdXJlIHRoYXQncwo+IGEgZ3JlYXQgaWRlYSwgSSd2
ZSBqdXN0IGNoYXNlZCBzb21lIHR0bSBjb2RlIGFyb3VuZCBmcmVha2luZyBvdXQgYWJvdXQKPiB0
aGF0LgoKVGhlIGtleSBwb2ludCBpcyB0aGF0IHRoZSByZWZlcmVuY2UgY291bnRlciBpcyB6ZXJv
IGluIHRoaXMgbW9tZW50LgoKVGFraW5nIHRoZSBMUlUgc3BpbmxvY2sgd2FzIGp1c3QgYSBwcmVj
YXV0aW9uIGFuZCBtaWdodCBhY3R1YWxseSBiZSBub3QgCmV2ZW4gbmVjZXNzYXJ5IGhlcmUuCgpJ
IHdpbGwgZG91YmxlIGNoZWNrLApDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+PiArCQlzcGluX3Vu
bG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwo+PiArCX0KPj4gICAKPj4gICAJcmV0dXJuIHI7
Cj4+ICAgfQo+PiBAQCAtNzIwLDcgKzcyOCw3IEBAIHN0YXRpYyBib29sIHR0bV9ib19ldmljdF9z
d2Fwb3V0X2FsbG93YWJsZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiAgIAo+PiAg
IAlpZiAoYm8tPmJhc2UucmVzdiA9PSBjdHgtPnJlc3YpIHsKPj4gICAJCWRtYV9yZXN2X2Fzc2Vy
dF9oZWxkKGJvLT5iYXNlLnJlc3YpOwo+PiAtCQlpZiAoY3R4LT5mbGFncyAmIFRUTV9PUFRfRkxB
R19BTExPV19SRVNfRVZJQ1QgfHwgYm8tPmRlbGV0ZWQpCj4+ICsJCWlmIChjdHgtPmZsYWdzICYg
VFRNX09QVF9GTEFHX0FMTE9XX1JFU19FVklDVCkKPj4gICAJCQlyZXQgPSB0cnVlOwo+PiAgIAkJ
KmxvY2tlZCA9IGZhbHNlOwo+PiAgIAkJaWYgKGJ1c3kpCj4+IC0tIAo+PiAyLjE3LjEKPj4KPj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gZHJpLWRl
dmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+IGh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
