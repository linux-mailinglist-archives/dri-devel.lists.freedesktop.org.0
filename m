Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4F0233160
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 14:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C00626E8DB;
	Thu, 30 Jul 2020 11:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ADD96E8D7;
 Thu, 30 Jul 2020 11:59:56 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id d6so13850522ejr.5;
 Thu, 30 Jul 2020 04:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:reply-to:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=07nW2UVA858HgospscXtrxYCSAyX/Q4/fNk+b3n8qgE=;
 b=AnhdREikQYo0AtDgSDdBAwXIuy7qUEpdo0ZJ9dA96rekMGp86jwtWnQ6wS4CzHJ4ha
 okyKP6rJ9Kc4VkBjHAIK/OYy9G/DuFP2curCQFThdmgn6sknqR4TCnx5UzvGVvw+mWf6
 pFPlYtietDwjskWdQ9juErMqjLmsc7OAKyU+Pcaid/Ol91s41lE28em4pDt2Kjjybx6u
 I2w67HBkBTFFsJ3jq0X5n/qfv+iZ3XxG2gmwlIEzwCu4Qe7e8yqc8cCMl5y2HMnMGG3o
 3cZ5wnh/jfm1S8Pf2H0BTz9v+S9Enh+70NpfpXYHWKBzj9zMoAH6Yr9ELmlGUgFHLU5B
 +0cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:reply-to:references
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=07nW2UVA858HgospscXtrxYCSAyX/Q4/fNk+b3n8qgE=;
 b=q7IdBdDfAR3zvb3ujm25CXgvLuPUY9BQTBKRDmiWtAcjj0Ete6JduA3SIWpzFcV6Rs
 KDXVaFRpWXaiF2UxmcIMvlVNpcyLfs8d+PG8x6yTXbLKfz2EJge1zgCeovth5cwusKU/
 pusPQBOStR9+LVuf9DqgI5aNJ5DL4nk5zGu6yrQNZrxtNYkcjzSsdBGOj7yWNYvujPpw
 9v+A5Xv0+NncX2QGfSMrbSTzzfQ5aLgc+dcTYFuBo/WkZTiP4546bLXwoydgo4gA6kqR
 uKnwW3BLV+w3x93q+gxYmdk/cHxYFmmXu+6vQfpMD5rEZ8Y1l/JCaGx2ntJ/fnRHFJRS
 +X6w==
X-Gm-Message-State: AOAM531J1fUNilcy67JkQ6urG7Yq04a2C0pxbGHuYoAssrFBSkn76qz4
 TZi6nSilPhX0/r+QTRdOrNY=
X-Google-Smtp-Source: ABdhPJyE4n9o7CIE7gl50NtOcNUYEWRdElBuENHz1QnouMUNbuGXYuLC6lAzIWRxkeQY6addIyIPJQ==
X-Received: by 2002:a17:906:289a:: with SMTP id
 o26mr493298ejd.309.1596110395091; 
 Thu, 30 Jul 2020 04:59:55 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f22sm5743543edt.91.2020.07.30.04.59.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 04:59:54 -0700 (PDT)
Subject: Re: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20200728182704.1809-1-Felix.Kuehling@amd.com>
 <9994a650-8065-c51c-6454-47064d20c729@gmail.com>
 <7c389ab3-4322-ebd5-f042-e80204dbcfbc@amd.com>
 <MW3PR12MB4491D68CC4AEC80F9B724E46F7700@MW3PR12MB4491.namprd12.prod.outlook.com>
 <9b384c46-ec71-46be-ac60-1335e9682c05@email.android.com>
 <CAKMK7uEDPpqLtTqJztDNTUiG0UOZ7s75p3e4EqhMK98zc=fiAA@mail.gmail.com>
 <cddf3671-b714-81df-e70b-6162250cd366@gmail.com>
Message-ID: <a96ad704-d770-0b57-6216-8bf18169a7c4@gmail.com>
Date: Thu, 30 Jul 2020 13:59:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cddf3671-b714-81df-e70b-6162250cd366@gmail.com>
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, "Morichetti,
 Laurent" <Laurent.Morichetti@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDcuMjAgdW0gMTM6NTAgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+IEFtIDMwLjA3
LjIwIHVtIDEzOjQwIHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4gT24gV2VkLCBKdWwgMjksIDIw
MjAgYXQgNTozNCBQTSBLb2VuaWcsIENocmlzdGlhbgo+PiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQu
Y29tPiB3cm90ZToKPj4+IFN1cmUuCj4+IE5vdGUgdGhhdCBkcm0tbWlzYy1uZXh0IGlzbid0IHRo
ZSByaWdodCBicmFuY2ggZm9yIGNjOiBzdGFibGUgc3R1ZmYsIHNlZQo+Pgo+PiBodHRwczovL25h
bTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZk
cm0ucGFnZXMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbnRhaW5lci10b29scyUyRmNvbW1pdHRlci1k
cm0tbWlzYy5odG1sJTIzd2hlcmUtZG8taS1hcHBseS1teS1wYXRjaCZhbXA7ZGF0YT0wMiU3QzAx
JTdDQ2hyaXN0aWFuLktvZW5pZyU0MGFtZC5jb20lN0NmZGI4MGYzMTY4ODc0M2MxMjc5ZjA4ZDgz
NDdlY2U1MCU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2Mzcz
MTcwNjY1MTc4MDE4MjcmYW1wO3NkYXRhPWdLQ1RFZ0pMYVA5Zjk2ZjN3SlVHdTB5ZmFWJTJGeUcz
VTNXdlhESjUlMkZZck9jJTNEJmFtcDtyZXNlcnZlZD0wIAo+Pgo+Cj4gU28gdGhpcyBzaG91bGQg
Z28gaW50byBkcm0tbWlzYy1maXhlcz8gVGhlIGJ1ZyBpcyB0aGVyZSBmb3IgcXVpdGUgYSAKPiB3
aGlsZS4KCk9rLCBzbyBJIHB1c2hlZCB0aGlzIHRvIGRybS1taXNjLWZpeGVzLCBidXQgZm9yZ290
IHRvIGFkZCB0aGUgQ0Mgc3RhYmxlIHRhZy4KClRvIG11Y2ggdG8gZG8gYW5kIG5vdCBlbm91Z2gg
dGltZSwKQ2hyaXN0aWFuLgoKPgo+IENocmlzdGlhbi4KPgo+Pgo+PiBKdXN0IHRvIGF2b2lkIGNv
bmZ1c2lvbiBhbmQgbmVlZGxlc3MgY2hlcnJ5cGlja2luZyBhY3Jvc3MgYnJhbmNoZXMuCj4+IC1E
YW5pZWwKPj4KPj4+IENocmlzdGlhbi4KPj4+Cj4+PiBBbSAyOS4wNy4yMDIwIDE3OjMwIHNjaHJp
ZWIgIkRldWNoZXIsIEFsZXhhbmRlciIgCj4+PiA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT46
Cj4+Pgo+Pj4gW0FNRCBQdWJsaWMgVXNlXQo+Pj4KPj4+Cj4+PiBDaHJpc3RpYW4sIENhbiB5b3Ug
Y2Mgc3RhYmxlIHdoZW4geW91IGFwcGx5IGl0IHRvIGRybS1taXNjPwo+Pj4KPj4+IEFsZXgKPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBGcm9tOiBLdWVobGluZywgRmVs
aXggPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+PiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMjks
IDIwMjAgMTA6MTUgQU0KPj4+IFRvOiBLb2VuaWcsIENocmlzdGlhbiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPjsgCj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIDxkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgCj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZyA8YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyAKPj4+IERldWNoZXIsIEFsZXhh
bmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4KPj4+IENjOiBNb3JpY2hldHRpLCBMYXVy
ZW50IDxMYXVyZW50Lk1vcmljaGV0dGlAYW1kLmNvbT4KPj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0gg
MS8xXSBkcm0vdHRtOiBmaXggb2Zmc2V0IGluIFZNQXMgd2l0aCBhIHBnX29mZnMgCj4+PiBpbiB0
dG1fYm9fdm1fYWNjZXNzCj4+Pgo+Pj4gQW0gMjAyMC0wNy0yOSB1bSA0OjA4IGEubS4gc2Nocmll
YiBDaHJpc3RpYW4gS8O2bmlnOgo+Pj4+IEFtIDI4LjA3LjIwIHVtIDIwOjI3IHNjaHJpZWIgRmVs
aXggS3VlaGxpbmc6Cj4+Pj4+IFZNQXMgd2l0aCBhIHBnX29mZnMgdGhhdCdzIG9mZnNldCBmcm9t
IHRoZSBzdGFydCBvZiB0aGUgdm1hX25vZGUgbmVlZAo+Pj4+PiB0byBhZGp1c3QgdGhlIG9mZnNl
dCB3aXRoaW4gdGhlIEJPIGFjY29yZGluZ2x5LiBUaGlzIG1hdGNoZXMgdGhlCj4+Pj4+IG9mZnNl
dCBjYWxjdWxhdGlvbiBpbiB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQuCj4+Pj4+Cj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29tPgo+Pj4+
PiBUZXN0ZWQtYnk6IExhdXJlbnQgTW9yaWNoZXR0aSA8bGF1cmVudC5tb3JpY2hldHRpQGFtZC5j
b20+Cj4+Pj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KPj4+Pgo+Pj4+IEdvaW5nIHRvIHBpY2sgdGhhdCB1cCBmb3IgaW5jbHVzaW9uIGlu
IGRybS1taXNjLW5leHQuCj4+PiBUaGFua3MuIEknbGwgc3VibWl0IGl0IHRvIGFtZC1zdGFnaW5n
LWRybS1uZXh0IHNvIGl0IG1ha2VzIGl0cyB3YXkgaW50bwo+Pj4gb3VyIERLTVMgYnJhbmNoIHF1
aWNrbHkuCj4+Pgo+Pj4gQWxleCwgd291bGQgeW91IHB1c2ggdGhpcyB0byBkcm0tZml4ZXM/Cj4+
Pgo+Pj4gUmVnYXJkcywKPj4+IMKgwqAgRmVsaXgKPj4+Cj4+Pgo+Pj4+PiAtLS0KPj4+Pj4gwqDC
oCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIHwgNCArKystCj4+Pj4+IMKgwqAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+Pj4+PiBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPj4+Pj4gaW5kZXggMzg5MTI4YjhjNGRkLi42MGI0
MTQ0N2JlYzggMTAwNjQ0Cj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3Zt
LmMKPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwo+Pj4+PiBAQCAt
NDA1LDggKzQwNSwxMCBAQCBzdGF0aWMgaW50IHR0bV9ib192bV9hY2Nlc3Nfa21hcChzdHJ1Y3QK
Pj4+Pj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+Pj4+PiDCoMKgIGludCB0dG1fYm9fdm1fYWNj
ZXNzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIAo+Pj4+PiBhZGRy
LAo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdm9pZCAqYnVmLCBpbnQgbGVu
LCBpbnQgd3JpdGUpCj4+Pj4+IMKgwqAgewo+Pj4+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgb2Zm
c2V0ID0gKGFkZHIpIC0gdm1hLT52bV9zdGFydDsKPj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8gPSB2bWEtPnZtX3ByaXZhdGVfZGF0YTsKPj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBsb25nIG9mZnNldCA9IChhZGRyKSAtIHZtYS0+dm1fc3RhcnQgKwo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqAgKCh2bWEtPnZtX3Bnb2ZmIC0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZiby0+
YmFzZS52bWFfbm9kZSkpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgIDw8IFBBR0VfU0hJRlQpOwo+
Pj4+PiDCoMKgwqDCoMKgwqAgaW50IHJldDsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAobGVu
IDwgMSB8fCAob2Zmc2V0ICsgbGVuKSA+PiBQQUdFX1NISUZUID4gYm8tPm51bV9wYWdlcykKPj4+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4+
PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZsaXN0cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZk
cmktZGV2ZWwmYW1wO2RhdGE9MDIlN0MwMSU3Q0NocmlzdGlhbi5Lb2VuaWclNDBhbWQuY29tJTdD
ZmRiODBmMzE2ODg3NDNjMTI3OWYwOGQ4MzQ3ZWNlNTAlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4
MmQ5OTRlMTgzZCU3QzAlN0MwJTdDNjM3MzE3MDY2NTE3ODAxODI3JmFtcDtzZGF0YT1aUW9mUHFH
QUhObWdsTWNEUFF6anBxMEF6R2J6YVV4NVJBZndyOXpmSiUyRlElM0QmYW1wO3Jlc2VydmVkPTAg
Cj4+Pgo+Pgo+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
