Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C962EB259
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 19:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDF2893DB;
	Tue,  5 Jan 2021 18:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1466E077
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 18:19:51 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id i9so143025wrc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Jan 2021 10:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=cOgRYAGhbDdumDnVO0CVgLMkuEl9eucNainrEb55H2g=;
 b=VGtR0HJAL5lsaHrqaT8uK3mf+DTnxQuyQOm7IiovXywZTFd7lXlbH1U21UQdBTwfIc
 B0mVdRzX6upkjkYSPAG1luL6XMULNSqC+dZyu3XxfqTrLKpKj6AxXnq3Yeo/kcX+e8kF
 xA3e7GBS8wPBaykb4z1Bo/A3oQLHt8Y5liERcdYR7nq8nE4ZkWB1RF5xqs8WrpVN75B+
 NCz2PDuHETIRx6ulKoU4giYh81BCuIqrEOW9TTH9lExxdonPnhHzQ2M6EV4ye9Y1tnTg
 ZoC02Z7VIDBeuv+bWM+pm0QJEm1Bm5W/Vbb2MJBbgHnF+O0sWJ4vR0mDDxbgmluMhlw2
 PY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=cOgRYAGhbDdumDnVO0CVgLMkuEl9eucNainrEb55H2g=;
 b=tPHMZkSxhRaK2l7C0dP+JMxHKitJPq9T6oZM4O4paQKeO7njqdcQJg7H8uICutIhRY
 Ek5Co5tDmx9GohqWpRwMEgnG8FhTdnpsVLwJGTP5JOZEgiUtD4lVi8UcdHzYIKF/pDdm
 TKDbqt9qeLgmOliZ+8rO85l9GjtkyAcXVUjQslz+JgNmYlsn5tML7aP/u/1GjqarmyEA
 vkd7oHaEa4bjaCzWzbG+D/HBcnecdEaRm5DgWYO14sYHL1edh0r9y4s69bZxeCRDs8lw
 5Il957R2AEeqONFKdw/Xoq2bGXw9OHGQhL9HwyKhPE3PyS2cj3GbZ87coVkj7HHNCWHW
 zMrA==
X-Gm-Message-State: AOAM533ca4tNUn8Tz5PjrGJlS9MMDT2q021ItqpuRt21aT45pLYd0r4h
 Rwd+hG6tFmYusfMIllKW68aL6jATfcg=
X-Google-Smtp-Source: ABdhPJy9AsQB1l5Rq/Dw+Ir8xi/o3YMtGHsHc7Sxkg86ZSoaQEMx2tybiEqHqcRiD6KTTmy9vXdP2Q==
X-Received: by 2002:a5d:6ccc:: with SMTP id c12mr837806wrc.4.1609870790010;
 Tue, 05 Jan 2021 10:19:50 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id x66sm360183wmg.26.2021.01.05.10.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Jan 2021 10:19:49 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: Remove pinned bos from LRU in
 ttm_bo_move_to_lru_tail() v2
To: Lyude Paul <lyude@redhat.com>, dri-devel@lists.freedesktop.org
References: <20210105114505.38210-1-christian.koenig@amd.com>
 <938ae9d3a7ba4eadd36697a5d71d17508755a7c2.camel@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1a3436c6-497c-ff42-8878-7fa80b199632@gmail.com>
Date: Tue, 5 Jan 2021 19:19:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <938ae9d3a7ba4eadd36697a5d71d17508755a7c2.camel@redhat.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDUuMDEuMjEgdW0gMTk6MTIgc2NocmllYiBMeXVkZSBQYXVsOgo+IFJldmlld2VkLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+Cj4gR3Vlc3NpbmcgaXQncyBmaW5lIGlmIEkg
cHVzaCB0aGlzIHdpdGggeW91ciBzb2IgYW5kIHJldmlldyBhZGRlZD8KCldvcmtzIGZvciBtZSwg
anVzdCB0YWtlIGNhcmUgdGhhdCB5b3UgcGljayB0aGUgcmlnaHQgYnJhbmNoLgoKSSBhbHdheXMg
c2VlbSB0byBwdXNoIG15IHN0dWZmIGludG8gdGhlIHdyb25nIG9uZS4KCkNocmlzdGlhbi4KCj4K
PiBPbiBUdWUsIDIwMjEtMDEtMDUgYXQgMTI6NDUgKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4+IEZyb206IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4+Cj4+IFJlY2VudGx5
IGEgcmVncmVzc2lvbiB3YXMgaW50cm9kdWNlZCB3aGljaCBjYXVzZWQgVFRNJ3MgYnVmZmVyIGV2
aWN0aW9uIHRvCj4+IGF0dGVtcHQgdG8gZXZpY3QgYWxyZWFkeS1waW5uZWQgQk9zLCBjYXVzaW5n
IGlzc3VlcyB3aXRoIGJ1ZmZlciBldmljdGlvbgo+PiB1bmRlciBtZW1vcnkgcHJlc3N1cmUgYWxv
bmcgd2l0aCBzdXNwZW5kL3Jlc3VtZToKPj4KPj4gIMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBE
Uk06IGV2aWN0aW5nIGJ1ZmZlcnMuLi4KPj4gIMKgIG5vdXZlYXUgMDAwMDoxZjowMC4wOiBEUk06
IE1vdmluZyBwaW5uZWQgb2JqZWN0IDAwMDAwMDAwYzQyOGMzZmYhCj4+ICDCoCBub3V2ZWF1IDAw
MDA6MWY6MDAuMDogZmlmbzogZmF1bHQgMDAgW1JFQURdIGF0IDAwMDAwMDAwMDAyMDAwMDAgZW5n
aW5lIDA0Cj4+ICDCoCBbQkFSMV0gY2xpZW50IDA3IFtIVUIvSE9TVF9DUFVdIHJlYXNvbiAwMiBb
UFRFXSBvbiBjaGFubmVsIC0xIFswMGZmZWFhMDAwCj4+ICDCoCB1bmtub3duXQo+PiAgwqAgbm91
dmVhdSAwMDAwOjFmOjAwLjA6IGZpZm86IERST1BQRURfTU1VX0ZBVUxUIDAwMDAxMDAwCj4+ICDC
oCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlmbzogZmF1bHQgMDEgW1dSSVRFXSBhdCAwMDAwMDAw
MDAwMDIwMDAwIGVuZ2luZQo+PiAgwqAgMGMgW0hPU1Q2XSBjbGllbnQgMDcgW0hVQi9IT1NUX0NQ
VV0gcmVhc29uIDAyIFtQVEVdIG9uIGNoYW5uZWwgMQo+PiAgwqAgWzAwZmZiMjgwMDAgRFJNXQo+
PiAgwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IGZpZm86IGNoYW5uZWwgMToga2lsbGVkCj4+ICDC
oCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogZmlmbzogcnVubGlzdCAwOiBzY2hlZHVsZWQgZm9yIHJl
Y292ZXJ5Cj4+ICDCoCBbVFRNXSBCdWZmZXIgZXZpY3Rpb24gZmFpbGVkCj4+ICDCoCBub3V2ZWF1
IDAwMDA6MWY6MDAuMDogRFJNOiB3YWl0aW5nIGZvciBrZXJuZWwgY2hhbm5lbHMgdG8gZ28gaWRs
ZS4uLgo+PiAgwqAgbm91dmVhdSAwMDAwOjFmOjAwLjA6IERSTTogZmFpbGVkIHRvIGlkbGUgY2hh
bm5lbCAxIFtEUk1dCj4+ICDCoCBub3V2ZWF1IDAwMDA6MWY6MDAuMDogRFJNOiByZXN1bWluZyBk
aXNwbGF5Li4uCj4+Cj4+IEFmdGVyIHNvbWUgYmlzZWN0aW9uIGFuZCBpbnZlc3RpZ2F0aW9uLCBp
dCBhcHBlYXJzIHRoaXMgcmVzdWx0ZWQgZnJvbSB0aGUKPj4gcmVjZW50IGNoYW5nZXMgdG8gdHRt
X2JvX21vdmVfdG9fbHJ1X3RhaWwoKS4gUHJldmlvdXNseSB3aGVuIGEgYnVmZmVyIHdhcwo+PiBw
aW5uZWQsIHRoZSBidWZmZXIgd291bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSBMUlUgb25jZSB0dG1f
Ym9fdW5yZXNlcnZlCj4+IHRvIG1haW50YWluIHRoZSBMUlUgbGlzdCB3aGVuIHBpbm5pbmcgb3Ig
dW5waW5uaW5nIEJPcy4gSG93ZXZlciwgc2luY2U6Cj4+Cj4+IGNvbW1pdCAzZDFhODhlMTA1MWYg
KCJkcm0vdHRtOiBjbGVhbnVwIExSVSBoYW5kbGluZyBmdXJ0aGVyIikKPj4KPj4gV2UndmUgYmVl
biBleGl0aW5nIGZyb20gdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoKSBhdCB0aGUgdmVyeSBiZWdp
bm5pbmcgb2YKPj4gdGhlIGZ1bmN0aW9uIGlmIHRoZSBibyB3ZSdyZSBsb29raW5nIGF0IGlzIHBp
bm5lZCwgcmVzdWx0aW5nIGluIHRoZSBwaW5uZWQKPj4gQk8gbmV2ZXIgZ2V0dGluZyByZW1vdmVk
IGZyb20gdGhlIGxydSBhbmQgYXMgYSByZXN1bHQgLSBjYXVzaW5nIGlzc3VlcyB3aGVuCj4+IGl0
IGV2ZW50dWFsbHkgYmVjb21lcyB0aW1lIGZvciBldmljdGlvbi4KPj4KPj4gU28sIGxldCdzIGZp
eCB0aGlzIGJ5IGNhbGxpbmcgdHRtX2JvX2RlbF9mcm9tX2xydSgpIGZyb20KPj4gdHRtX2JvX21v
dmVfdG9fbHJ1X3RhaWwoKSBpbiB0aGUgZXZlbnQgdGhhdCB3ZSdyZSBkZWFsaW5nIHdpdGggYSBw
aW5uZWQKPj4gYnVmZmVyLgo+Pgo+PiB2MiAoY2hrKTogcmVkdWNlIHRvIG9ubHkgdGhlIGZpeGlu
ZyBvbmUgbGluZXIgc2luY2Ugd2UgYWx3YXlzIHdhbnQgdG8KPj4gY2FsbCB0aGUgY2FsbGJhY2sg
d2hlbmV2ZXIgd2Ugd291bGQgbW92ZSBvbiB0aGUgTFJVLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBM
eXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgo+PiBGaXhlczogM2QxYTg4ZTEwNTFmICgiZHJt
L3R0bTogY2xlYW51cCBMUlUgaGFuZGxpbmcgZnVydGhlciIpCj4+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IENjOiBEYXZlIEFpcmxpZSA8YWlybGll
ZEByZWRoYXQuY29tPgo+PiAtLS0KPj4gIMKgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8
IDQgKysrLQo+PiAgwqAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCAzMWU4YjNkYTU1NjMuLmI2NWY0YjEy
Zjk4NiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IEBAIC0xMzgsOCArMTM4LDEwIEBAIHZv
aWQgdHRtX2JvX21vdmVfdG9fbHJ1X3RhaWwoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0Cj4+ICpi
bywKPj4gICAKPj4gIMKgwqDCoMKgwqDCoMKgwqBkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFz
ZS5yZXN2KTsKPj4gICAKPj4gLcKgwqDCoMKgwqDCoMKgaWYgKGJvLT5waW5fY291bnQpCj4+ICvC
oMKgwqDCoMKgwqDCoGlmIChiby0+cGluX2NvdW50KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB0dG1fYm9fZGVsX2Zyb21fbHJ1KGJvKTsKPj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgcmV0dXJuOwo+PiArwqDCoMKgwqDCoMKgwqB9Cj4+ICAgCj4+ICDCoMKg
wqDCoMKgwqDCoMKgbWFuID0gdHRtX21hbmFnZXJfdHlwZShiZGV2LCBtZW0tPm1lbV90eXBlKTsK
Pj4gIMKgwqDCoMKgwqDCoMKgwqBsaXN0X21vdmVfdGFpbCgmYm8tPmxydSwgJm1hbi0+bHJ1W2Jv
LT5wcmlvcml0eV0pOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
