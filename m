Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33DC32D8A2
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 18:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FE776EA4D;
	Thu,  4 Mar 2021 17:31:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA4D6EA4D;
 Thu,  4 Mar 2021 17:31:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id dm26so12387982edb.12;
 Thu, 04 Mar 2021 09:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=mFJkIu2FXvtkDpFJE0YmuEWK9i6pyLOFA3YFPGlSnuQ=;
 b=rbfU5Rzi5WWAWPDeItQayYWECjBCBdyIrhMGDTSQadNzXv1rj1LQPD0/71lcd4ffIV
 QGck7qKZWwO0fGOzJ86FRZCB3Ay35I5dNiKN60PQv9n6sxeA7bNjc0waBxHx0XaCJjcl
 PSGeQKKfoWXC/HvxP695/eI/YoTRCZiIbjehNwBmXkIEwJ6WZ2hY8+uACQ6pMNCkf3wd
 hwMLwbLgz9LvxU6eGD7JMyGV6dGbhQWwRICmPzF6spDRsk9UPBK9OjvPJHuryT+98Bcr
 mkjUSnm9Zbb4cQsKFQLNkiGxBZsiscD6INOnHhti06QS3jCMrbCN3zZOxCzjezaEzRSJ
 BZug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mFJkIu2FXvtkDpFJE0YmuEWK9i6pyLOFA3YFPGlSnuQ=;
 b=g/5PoI788KEQOLPtRtxA0j5/06+SdF1hiGamvHGnThh4gdzbNFyZnGe5VSIyF4gwD9
 GBropCdcO6s84jqtztqXZnCOdNaH1jNVD6+26S0F5U1r+K+u0wEnqICd0tcjF2GG5Z1y
 Ep8Ucx6u53eTxfJZ3jQtdlSoptNF3MqQGuiBaznVgjVO9canEyebM2TU6H4A/uq1T1kC
 ct21IOs3Dl0GA85nfVxWaOj0TddQAaIVWwUm1ilLtj/WQ0hpq4WGp2/woFe6EeP0V0WG
 vwkOlwtFk9G7MqCskd/9uuD62/O/zEdolgcrYy+ARlm9PL/BWfvCik+YWTC0Czib9Oqi
 NzbQ==
X-Gm-Message-State: AOAM533HAU58kTXIicbwvWerBgBbt62OvSZH3A83gQNeyPEkCl1hC6eh
 5DW3gOfT8zW8OwkFkW74eEim+yezaNtLIg==
X-Google-Smtp-Source: ABdhPJySeN8uiUqgTpENA26YsEEuwFtAbWjPpIPsqXivHhLe1BffZ6+r04tbmEkvf2yUmhEIlMqi8g==
X-Received: by 2002:a05:6402:10ce:: with SMTP id
 p14mr5535773edu.348.1614879107166; 
 Thu, 04 Mar 2021 09:31:47 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:3d04:4b7c:635f:3a0?
 ([2a02:908:1252:fb60:3d04:4b7c:635f:3a0])
 by smtp.gmail.com with ESMTPSA id b19sm24917478edu.51.2021.03.04.09.31.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 09:31:46 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, brahma_sw_dev@amd.com
References: <1614873891-5836-1-git-send-email-Oak.Zeng@amd.com>
 <69501a46-ffbe-437c-3651-03400b3455a5@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <4fd6a67c-34dd-9510-4057-835c0c8eb190@gmail.com>
Date: Thu, 4 Mar 2021 18:31:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <69501a46-ffbe-437c-3651-03400b3455a5@amd.com>
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
Cc: Alexander.Deucher@amd.com, jinhuieric.huang@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDQuMDMuMjEgdW0gMTg6MDEgc2NocmllYiBCaGFyZHdhaiwgUmFqbmVlc2g6Cj4gSSB3YXMg
d29uZGVyaW5nIGlmIGEgbWFuYWdlZCB2ZXJzaW9uIG9mIHN1Y2ggQVBJIGV4aXN0cyBidXQgbG9v
a3MgbGlrZSAKPiBub25lLiBXZSBvbmx5IGhhdmUgZGV2bV9pb3JlbWFwX3djIGJ1dCB0aGF0IGlz
IHZhbGlkIG9ubHkgZm9yIAo+IFBBR0VfQ0FDSEVfTU9ERV9XQyB3aGVyZWFzIGlvcmVtYXBfY2Fj
aGUgdXNlcyBfV0IuIE9uZSBtb3JlIHNtYWxsIAo+IGNvbW1lbnQgYmVsb3cuCj4KPgo+IEFja2Vk
LWJ5OiBSYWpuZWVzaCBCaGFyZHdhaiA8cmFqbmVlc2guYmhhcmR3YWpAYW1kLmNvbT4KPgo+IE9u
IDMvNC8yMDIxIDExOjA0IEFNLCBPYWsgWmVuZyB3cm90ZToKPj4gSWYgdGJvLm1lbS5idXMuY2Fj
aGluZyBpcyBjYWNoZWQsIGJ1ZmZlciBpcyBpbnRlbmRlZCB0byBiZSBtYXBwZWQKPj4gYXMgY2Fj
aGVkIGZyb20gQ1BVLiBNYXAgaXQgd2l0aCBpb3JlbWFwX2NhY2hlLgo+Pgo+PiBUaGlzIHdhc24n
dCBuZWNlc3NhcnkgYmVmb3JlIGFzIGRldmljZSBtZW1vcnkgd2FzIG5ldmVyIG1hcHBlZAo+PiBh
cyBjYWNoZWQgZnJvbSBDUFUgc2lkZS4gSXQgYmVjb21lcyBuZWNlc3NhcnkgZm9yIGFsZGViYXJh
biBhcwo+PiBkZXZpY2UgbWVtb3J5IGlzIG1hcHBlZCBjYWNoZWQgZnJvbSBDUFUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IE9hayBaZW5nIDxPYWsuWmVuZ0BhbWQuY29tPgo+PiBSZXZpZXdlZC1ieTog
Q2hyaXN0aWFuIEtvbmlnIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgfCAxNCArKysrKysrKysrKysrKwo+PiDC
oCAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIAo+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvX3V0aWwuYwo+PiBpbmRleCAwMzFlNTgxLi43NDI5NDY0IDEwMDY0NAo+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm9fdXRpbC5jCj4+IEBAIC05MSw2ICs5MSwxMCBAQCBzdGF0aWMgaW50IHR0bV9y
ZXNvdXJjZV9pb3JlbWFwKHN0cnVjdCB0dG1fZGV2aWNlIAo+PiAqYmRldiwKPj4gwqAgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChtZW0tPmJ1cy5jYWNoaW5nID09IHR0bV93cml0ZV9jb21iaW5lZCkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYWRkciA9IGlvcmVtYXBfd2MobWVtLT5idXMu
b2Zmc2V0LCBidXNfc2l6ZSk7Cj4+ICsjaWZkZWYgQ09ORklHX1g4Ngo+Cj4KPiBQbGVhc2UgdXNl
ICNpZiBkZWZpbmVkIChDT05GSUdfWDg2KQoKQWN0dWFsbHkgI2lmZGVmIGlzIHVzdWFsbHkgcHJl
ZmVycmVkLgoKQ2hyaXN0aWFuLgoKPgo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAobWVtLT5i
dXMuY2FjaGluZyA9PSB0dG1fY2FjaGVkKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhZGRy
ID0gaW9yZW1hcF9jYWNoZShtZW0tPmJ1cy5vZmZzZXQsIGJ1c19zaXplKTsKPj4gKyNlbmRpZgo+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBh
ZGRyID0gaW9yZW1hcChtZW0tPmJ1cy5vZmZzZXQsIGJ1c19zaXplKTsKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICghYWRkcikgewo+PiBAQCAtMzcyLDYgKzM3NiwxMSBAQCBzdGF0aWMgaW50IHR0
bV9ib19pb3JlbWFwKHN0cnVjdCAKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgaWYgKG1lbS0+YnVzLmNhY2hpbmcgPT0gdHRtX3dyaXRlX2NvbWJpbmVkKQo+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPnZpcnR1YWwgPSBpb3JlbWFwX3djKGJv
LT5tZW0uYnVzLm9mZnNldCArIG9mZnNldCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemUpOwo+PiArI2lmZGVmIENPTkZJR19YODYK
Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKG1lbS0+YnVzLmNhY2hpbmcgPT0gdHRtX2NhY2hl
ZCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbWFwLT52aXJ0dWFsID0gaW9yZW1hcF9jYWNo
ZShiby0+bWVtLmJ1cy5vZmZzZXQgKyBvZmZzZXQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzaXplKTsKPj4gKyNlbmRpZgo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgZWxzZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtYXAtPnZpcnR1
YWwgPSBpb3JlbWFwKGJvLT5tZW0uYnVzLm9mZnNldCArIG9mZnNldCwKPj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2l6ZSk7Cj4+IEBA
IC00OTAsNiArNDk5LDExIEBAIGludCB0dG1fYm9fdm1hcChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKmJvLCAKPj4gc3RydWN0IGRtYV9idWZfbWFwICptYXApCj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBlbHNlIGlmIChtZW0tPmJ1cy5jYWNoaW5nID09IHR0bV93cml0ZV9jb21iaW5lZCkKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFkZHJfaW9tZW0gPSBpb3JlbWFwX3djKG1lbS0+YnVz
Lm9mZnNldCwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBiby0+YmFzZS5zaXplKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKG1lbS0+
YnVzLmNhY2hpbmcgPT0gdHRtX2NhY2hlZCkKPj4gKyNpZmRlZiBDT05GSUdfWDg2Cj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZhZGRyX2lvbWVtID0gaW9yZW1hcF9jYWNoZShtZW0tPmJ1cy5v
ZmZzZXQsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBiby0+YmFzZS5zaXplKTsKPj4gKyNlbmRpZgo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZWxz
ZQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2YWRkcl9pb21lbSA9IGlvcmVtYXAobWVt
LT5idXMub2Zmc2V0LCBiby0+YmFzZS5zaXplKTsKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
