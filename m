Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377DB81A2D
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:02:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E4C89C05;
	Mon,  5 Aug 2019 13:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B10F89C05
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:02:55 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p74so74638700wme.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 06:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9uaf5f1EruupLH+UvxFqFMDq22bfdJ2mzJ0EJCKwk0k=;
 b=Ab1Nv3K+pxrWp0O6T8R5OwBH51qUS7e9PKSzx07mXSGgKG3GvM7NGnblH5+R4UXIck
 g7bq5h/WuBA8LJFkeT8UCsSK1AExZCbPJB7dm/mjigMLWY10KEi5FT1sDPPzA8IsjZAP
 Ev8yQYWjw7NzZm3O1sOANogApCGuMmYYf/SNli1venQAprsSHBOapoEKOtK08/cGr/BD
 j2DbUa4Fw2er/9Rs7Exw7PFiAykvPrrjR079gWrzOAWz69kIqaVQTmbkZYzMQNh8Ye7G
 jGYVP3w7K1I/4knKviEJNAA8xeLzSBQTm7qyGiRbHF8Y/jnvmzicCrB82QqznpQJyd/T
 HlBQ==
X-Gm-Message-State: APjAAAX9F/AMHcqrgv7ixrvF/Z/6ZZT3b64b6OCFeH4fM1pJWArb/mmd
 4WpnstqODlPncrImwmCyvHY=
X-Google-Smtp-Source: APXvYqx4RZID5s5azdRz6nZP0D6YNMWfkt7PTDppy2Dc1Se4CZNw815R2imim0o1ZZnYo8/NDJBahw==
X-Received: by 2002:a7b:c1da:: with SMTP id a26mr18815020wmj.128.1565010173730; 
 Mon, 05 Aug 2019 06:02:53 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id 5sm72138200wmg.42.2019.08.05.06.02.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 06:02:52 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org, david1.zhou@amd.com
References: <20190805073657.1389-1-christian.koenig@amd.com>
 <1ad7ef20-0207-7f80-ee12-ec98c1d5dfcb@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <af470fba-fb46-e0c4-caa0-220d6083ffc3@gmail.com>
Date: Mon, 5 Aug 2019 15:02:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1ad7ef20-0207-7f80-ee12-ec98c1d5dfcb@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9uaf5f1EruupLH+UvxFqFMDq22bfdJ2mzJ0EJCKwk0k=;
 b=DmMtLzo/yhqv0mGKtYfeA7dFLJzIomZ+eSW89PFE1kKDd/8UVk498aNPLjbdpF+kHs
 DvVzGvnNtHVSzBr8nZqwJdhAfNbTOdpsF5oUVDybbOkMVe7Q5O4SR67+WrUOx/ZDIC9M
 731MDIf8PgmMrdX5ymPYk9W3WTW0IbNwn/fb6EtDuusCpiDwhK/rsYGoFadZkpC3SvDT
 M1tyxEtRVGhpW1Pm7ux/nUsNS2F9IA7yvIp1Dq3otEmUZ2sldcTOrtn37zHJiUu5AuzU
 P8QyZznpgMbWo1fi25Y0CgoWtIuSMM0Ze2ffpEyOmgk0PN+2HQbhqqctmfABWRO61DnL
 RB0A==
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IGV2ZW4gcmVtb3RlbHkgOilJIHRlc3RlZCB0aGlzIHdpdGggbXkgb3duIGNyYWZ0ZWQgY29k
ZSBpbnNpZGUgdGhlIAprZXJuZWwuCgpJdCdzIHByb2JhYmx5IHF1aXRlIHNvbWUgaGFzc2xlIHRv
IGFjdHVhbGx5IHRyaWdnZXIgdGhpcyBwcm9ibGVtIGZyb20gCnVzZXJzcGFjZSBhbmQgSSBvbmx5
IGZvdW5kIGl0IGJlY2F1c2UgSSBjcmVhdGVkIGEgdmVyeSB2ZXJ5IGxvbmcgCnNlcXVlbmNlIGNo
YWluIGJ5IGFjY2lkZW50LgoKQ2hyaXN0aWFuLgoKQW0gMDUuMDguMTkgdW0gMTQ6MDMgc2Nocmll
YiBMaW9uZWwgTGFuZHdlcmxpbjoKPiBCeSBhbnkgY2hhbmdlLCBkaWQgeW91IHJ1biBpbnRvIHRo
aXMgd2l0aCBhIENUUyB0ZXN0IHdob3NlIG5hbWUgZW5kcyAKPiB3aXRoICIuY2hhaW4iID8gOikK
Pgo+IC1MaW9uZWwKPgo+IE9uIDA1LzA4LzIwMTkgMTA6MzYsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+IFdlIGNhbid0IGZyZWUgdXAgdGhlIGNoYWluIHVzaW5nIHJlY3Vyc2lvbiBvciB3ZSBy
dW4gaW50byBhIHN0YWNrIAo+PiBvdmVyZmxvdy4KPj4KPj4gTWFudWFsbHkgZnJlZSB1cCB0aGUg
ZGFuZ2xpbmcgY2hhaW4gbm9kZXMgdG8gYXZvaWQgcmVjdXJzaW9uLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+
PiDCoCBkcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMgfCAyNCArKysrKysrKysrKysr
KysrKysrKysrKy0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hh
aW4uYyAKPj4gYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWluLmMKPj4gaW5kZXggYjUw
ODlmNjRiZTJhLi40NGE3NDE2NzdkMjUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9k
bWEtZmVuY2UtY2hhaW4uYwo+PiArKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWZlbmNlLWNoYWlu
LmMKPj4gQEAgLTE3OCw4ICsxNzgsMzAgQEAgc3RhdGljIGJvb2wgZG1hX2ZlbmNlX2NoYWluX3Np
Z25hbGVkKHN0cnVjdCAKPj4gZG1hX2ZlbmNlICpmZW5jZSkKPj4gwqAgc3RhdGljIHZvaWQgZG1h
X2ZlbmNlX2NoYWluX3JlbGVhc2Uoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCj4+IMKgIHsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICpjaGFpbiA9IHRvX2RtYV9mZW5jZV9j
aGFpbihmZW5jZSk7Cj4+ICvCoMKgwqAgc3RydWN0IGRtYV9mZW5jZSAqcHJldjsKPj4gKwo+PiAr
wqDCoMKgIC8qIE1hbnVhbGx5IHVubGluayB0aGUgY2hhaW4gYXMgbXVjaCBhcyBwb3NzaWJsZSB0
byBhdm9pZCByZWN1cnNpb24KPj4gK8KgwqDCoMKgICogYW5kIHBvdGVudGlhbCBzdGFjayBvdmVy
Zmxvdy4KPj4gK8KgwqDCoMKgICovCj4+ICvCoMKgwqAgd2hpbGUgKChwcmV2ID0gcmN1X2RlcmVm
ZXJlbmNlX3Byb3RlY3RlZChjaGFpbi0+cHJldiwgdHJ1ZSkpKSB7Cj4+ICvCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICpwcmV2X2NoYWluOwo+PiArCj4+ICvCoMKgwqDCoMKg
wqDCoCBpZiAoa3JlZl9yZWFkKCZwcmV2LT5yZWZjb3VudCkgPiAxKQo+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4gKwo+PiArwqDCoMKgwqDCoMKgwqAgcHJldl9jaGFp
biA9IHRvX2RtYV9mZW5jZV9jaGFpbihwcmV2KTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlmICghcHJl
dl9jaGFpbikKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7Cj4+ICsKPj4gK8KgwqDC
oMKgwqDCoMKgIC8qIE5vIG5lZWQgZm9yIGF0b21pYyBvcGVyYXRpb25zIHNpbmNlIHdlIGhvbGQg
dGhlIGxhc3QKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiByZWZlcmVuY2UgdG8gcHJldl9jaGFpbi4K
Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8KPj4gK8KgwqDCoMKgwqDCoMKgIGNoYWluLT5wcmV2ID0g
cHJldl9jaGFpbi0+cHJldjsKPj4gK8KgwqDCoMKgwqDCoMKgIFJDVV9JTklUX1BPSU5URVIocHJl
dl9jaGFpbi0+cHJldiwgTlVMTCk7Cj4+ICvCoMKgwqDCoMKgwqDCoCBkbWFfZmVuY2VfcHV0KHBy
ZXYpOwo+PiArwqDCoMKgIH0KPj4gK8KgwqDCoCBkbWFfZmVuY2VfcHV0KHByZXYpOwo+PiDCoCAt
wqDCoMKgIGRtYV9mZW5jZV9wdXQocmN1X2RlcmVmZXJlbmNlX3Byb3RlY3RlZChjaGFpbi0+cHJl
diwgdHJ1ZSkpOwo+PiDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoY2hhaW4tPmZlbmNlKTsKPj4g
wqDCoMKgwqDCoCBkbWFfZmVuY2VfZnJlZShmZW5jZSk7Cj4+IMKgIH0KPgo+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
