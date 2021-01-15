Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE4F2F7B29
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 14:01:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28436E3D6;
	Fri, 15 Jan 2021 13:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8FEB6E3D6
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 13:01:02 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id u19so9439094edx.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 05:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QXZUvFm4KPYkuREWCM8JyvpguDjjdhpSuSlun4gg4pc=;
 b=juhL8/468v7Hksc+1AkiovWkTKg7zt7hk1qQ0iD4/YRsd8PYClbNmXRVmbcmvykj1f
 GY4rWD2diPZ0ixhGFHfdbROjdIe1vXeSbX0TeUUV3KtFAGnn4DqyumAdc7IolzIy+etY
 lrXmdmlJcKdW6Pt2sXYVLme4T7VLhR8npZTHMO3CbirhIIpdXLLDC9eTgvo9qNZdHV31
 agJZRJ7xq7SwfIB8CaHMyNl4fhfwIQfKI3OFor0e8wt6WM0vkxKqkkXNlhAI0O/5+rsw
 D8pObpdRmSlrmv37Wv9ZXh83M8Z/O4upSKtNbLL+EeahkWHFW9/swG5MuYk6JaRladNq
 T2Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QXZUvFm4KPYkuREWCM8JyvpguDjjdhpSuSlun4gg4pc=;
 b=Ax2TAcA7LhR7xf+pXgiWXzVTr54J7L2zxa7BxOIXro6Ot+tE/qm53MX3JdEwg3zKLO
 SUxYSQEj2JEsTOpjKI+Yw+UJDVy7ENapuwSnp74hG1lshvzps2pyF9/e9L2NpG9fZ50d
 4zujW/oX7DydEP8SDYpMMdIztt2Vv3JqxVcnxue69wtrX47mXdhIa9RNPE0YwLXVvXSR
 bZ5Dv8Mjk5s5Rx60BXh/yspqXxxLeZAPZHpiIlWEetLLZFx4Mwzx/PvRgeBl+pAjPQNG
 M3FNXSK0MygnDxe5X0+5zbv0iTY0eutubCXFPE9kbsPTFSR0Yry4ZfgvTcQ5giaeMQbp
 mtgQ==
X-Gm-Message-State: AOAM530RRpGMtxsQqn1yQYdtya1+T7GdUXT4T9/O7JNBPOErJuJctiSJ
 71bCLWNmYOPMW3pSvdtKbbCwksOTv5k=
X-Google-Smtp-Source: ABdhPJztibZEiboNEjWnOQtjVxpj1v2TQAFVX57/HRg0o8mHMPCZAa3wPTYlPoodltsyRoeVBARoRQ==
X-Received: by 2002:a05:6402:d05:: with SMTP id
 eb5mr9321227edb.143.1610715661232; 
 Fri, 15 Jan 2021 05:01:01 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y8sm1637340edd.97.2021.01.15.05.01.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Jan 2021 05:01:00 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: stop using GFP_TRANSHUGE_LIGHT
To: Hans de Goede <hdegoede@redhat.com>, ray.huang@amd.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
References: <20210113131325.223511-1-christian.koenig@amd.com>
 <75cd4fa9-b359-dd32-c50d-d291687066a5@gmail.com>
 <ccb4a69b-6180-44cd-5645-f22817a5f5f4@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7d2b35e3-df8d-333e-f4fc-ba7b765a338d@gmail.com>
Date: Fri, 15 Jan 2021 14:00:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ccb4a69b-6180-44cd-5645-f22817a5f5f4@redhat.com>
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

QW0gMTUuMDEuMjEgdW0gMTM6NTQgc2NocmllYiBIYW5zIGRlIEdvZWRlOgo+IEhpLAo+Cj4gT24g
MS8xNS8yMSAxOjE0IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+PiBIYW5zIGRvIHlvdSBo
YXZlIGFueSBtb3JlIGNvbW1lbnRzIG9yIGEgdGVzdGVkLWJ5Pwo+IFNvcnJ5LCBJJ3ZlIGJlZW4g
YnVzeSBjaGFzaW5nIGFmdGVyIGFub3RoZXIgNS4xMSByZWdyZXNzaW9uLAo+IG5vIGNvbW1lbnRz
LCBhbHNvIG5vIHRlc3RlZC1ieSwgYnV0IEkgZG8gZnVsbHkgZXhwZWN0IHRoaXMgdG8gc29sdmUK
PiB0aGUgaXNzdWUuCgpZZWFoLCBJIGtub3cgd2hhdCB5b3UgbWVhbiA6KQoKPiAgIAo+PiBPdGhl
cndpc2UgSSBwdXNoIGl0IHRvIGRybS1taXNjLWZpeGVzIHRvZGF5Lgo+IFRoYXQgc291bmRzIGdv
b2QgdG8gbWUuCgpUaGFua3MsIGdvaW5nIHRvIGRvIHNvIGFueSBtb21lbnQuCgpSZWdhcmRzLApD
aHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPgo+IEhhbnMKPgo+Cj4KPgo+PiBUaGFua3MsCj4+IENo
cmlzdGlhbi4KPj4KPj4gQW0gMTMuMDEuMjEgdW0gMTQ6MTMgc2NocmllYiBDaHJpc3RpYW4gS8O2
bmlnOgo+Pj4gVGhlIG9ubHkgZmxhZyB3ZSByZWFsbHkgbmVlZCBpcyBfX0dGUF9OT01FTUFMTE9D
LCBoaWdobWVtIGRlcGVuZHMgb24KPj4+IGRtYTMyIGFuZCBtb3ZlYWJsZS9jb21wb3VuZCBzaG91
bGQgbmV2ZXIgYmUgc2V0IGluIHRoZSBmaXJzdCBwbGFjZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+PiAtLS0KPj4+
ICDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMgfCAxMSArKysrKystLS0tLQo+Pj4g
IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+Pj4gaW5kZXggOGNkNzc2YWRjNTkyLi4xMWUwMzEzZGIw
ZWEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMKPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwo+Pj4gQEAgLTc5LDEyICs3OSwxMyBA
QCBzdGF0aWMgc3RydWN0IHBhZ2UgKnR0bV9wb29sX2FsbG9jX3BhZ2Uoc3RydWN0IHR0bV9wb29s
ICpwb29sLCBnZnBfdCBnZnBfZmxhZ3MsCj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgcGFnZSAqcDsK
Pj4+ICDCoMKgwqDCoMKgIHZvaWQgKnZhZGRyOwo+Pj4gIMKgIC3CoMKgwqAgaWYgKG9yZGVyKSB7
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZ2ZwX2ZsYWdzIHw9IEdGUF9UUkFOU0hVR0VfTElHSFQgfCBf
X0dGUF9OT1JFVFJZIHwKPj4+ICvCoMKgwqAgLyogRG9uJ3Qgc2V0IHRoZSBfX0dGUF9DT01QIGZs
YWcgZm9yIGhpZ2hlciBvcmRlciBhbGxvY2F0aW9ucy4KPj4+ICvCoMKgwqDCoCAqIE1hcHBpbmcg
cGFnZXMgZGlyZWN0bHkgaW50byBhbiB1c2Vyc3BhY2UgcHJvY2VzcyBhbmQgY2FsbGluZwo+Pj4g
K8KgwqDCoMKgICogcHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxvY2F0ZWQgcGFnZSBpcyBpbGxlZ2Fs
Lgo+Pj4gK8KgwqDCoMKgICovCj4+PiArwqDCoMKgIGlmIChvcmRlcikKPj4+ICvCoMKgwqDCoMKg
wqDCoCBnZnBfZmxhZ3MgfD0gX19HRlBfTk9NRU1BTExPQyB8IF9fR0ZQX05PUkVUUlkgfAo+Pj4g
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fR0ZQX0tTV0FQRF9SRUNMQUlNOwo+Pj4gLcKg
wqDCoMKgwqDCoMKgIGdmcF9mbGFncyAmPSB+X19HRlBfTU9WQUJMRTsKPj4+IC3CoMKgwqDCoMKg
wqDCoCBnZnBfZmxhZ3MgJj0gfl9fR0ZQX0NPTVA7Cj4+PiAtwqDCoMKgIH0KPj4+ICDCoCDCoMKg
wqDCoMKgIGlmICghcG9vbC0+dXNlX2RtYV9hbGxvYykgewo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBwID0gYWxsb2NfcGFnZXMoZ2ZwX2ZsYWdzLCBvcmRlcik7CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
