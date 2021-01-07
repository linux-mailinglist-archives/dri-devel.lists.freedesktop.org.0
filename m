Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166AB2ECE4D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 11:57:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1991F6E434;
	Thu,  7 Jan 2021 10:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529D96E424;
 Thu,  7 Jan 2021 10:57:12 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id k10so4792161wmi.3;
 Thu, 07 Jan 2021 02:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=ygUncX8euyQCxJ9S39LS0h/1A8JfejNuvEM2nPrwP6w=;
 b=R9ps05TLwL1+Hmkj+Dicyh4/JN6qNZvNbxlemPadz3zL5sz6/JX683BGnsY/dS6OCE
 hyjObuSSWu7Y/76g5XE7NEx33C77wnF4ylIM2Ya1cQaAdNKJIP21KCBvqv8yFzylj5HJ
 Cj7qv2/iMwv9t5U2jrkMixoGrpRIchSVgmTMOmf5LmzTAqW5qkxlbhO59LjN9He84zjb
 UDVgZ5AKSX7koYEMKX20Ha5bWZ6eQcoPFwZhGAyfNJ/L+/bujKhkpqtUQwGmiML81Cer
 tNuTgREVEap1cce/UHYV2WFe5mai4M+X91RAR5BMU3iGZIV+cA5qiUftEn7Ej2Gja3lJ
 dwMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=ygUncX8euyQCxJ9S39LS0h/1A8JfejNuvEM2nPrwP6w=;
 b=mMIqm/Z7yIRwvOol3w7Sx07EfBsVZ3DuzNLxbsOUASHEQC/sjMN9EoMgKCtF/hN4Kx
 xxZfhAo6uhdWcKLyAG1qItiiRGuVOWd316DWOwwwzVaMdV489JeXs9wLZyuYq3JBKWo/
 rgHXURu3Q8h3qD3G+qkNVd5mRReYPhJ0+NoRDYGpkolWKoCC2edospnkOR0wIX1nkxOB
 oko1UIsq6Wkd5GZctX4CZ8Soe5DxGVTB2NefJ796kFv33HDJBb2J/C6n0lesMzmAhYw4
 OIhnkPW8sfVpt3OTjMjC7iXaE9xBBwGxtQFNwtBAKj+jqeM57RNc2OkvTkTzabJh9Ya2
 jc0Q==
X-Gm-Message-State: AOAM53105LnkiMyjN/WEwtQDuyrTP+C/PHQCUJKCIGS6Mzvh3cK8ViXI
 OX4fbtAFAPBJHEd5XD3UFtlKqpBqsEU=
X-Google-Smtp-Source: ABdhPJw58ZEQr2+1IbhcJHWqO3ZRqczQLRGNCsVp9S/bkHjUS+iof1xnGcteNdD0XiIuLjveniKxog==
X-Received: by 2002:a7b:c205:: with SMTP id x5mr7775793wmi.115.1610017031029; 
 Thu, 07 Jan 2021 02:57:11 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m2sm6726344wml.34.2021.01.07.02.57.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 02:57:10 -0800 (PST)
Subject: Re: [PATCH 31/35] drm/amdgpu: reserve fence slot to update page table
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-32-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <86c076f7-47e8-2141-71ae-7eaeeed2f462@gmail.com>
Date: Thu, 7 Jan 2021 11:57:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210107030127.20393-32-Felix.Kuehling@amd.com>
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
Cc: alex.sierra@amd.com, Philip Yang <Philip.Yang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDcuMDEuMjEgdW0gMDQ6MDEgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPiBGcm9tOiBQaGls
aXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KPgo+IEZvcmdvdCB0byByZXNlcnZlIGEgZmVu
Y2Ugc2xvdCB0byB1c2Ugc2RtYSB0byB1cGRhdGUgcGFnZSB0YWJsZSwgY2F1c2UKPiBiZWxvdyBr
ZXJuZWwgQlVHIGJhY2t0cmFjZSB0byBoYW5kbGUgdm0gcmV0cnkgZmF1bHQgd2hpbGUgYXBwbGlj
YXRpb24gaXMKPiBleGl0aW5nLgo+Cj4gWyAgMTMzLjA0ODE0M10ga2VybmVsIEJVRyBhdCAvaG9t
ZS95YW5ncC9naXQvY29tcHV0ZV9zdGFnaW5nL2tlcm5lbC9kcml2ZXJzL2RtYS1idWYvZG1hLXJl
c3YuYzoyODEhCj4gWyAgMTMzLjA0ODQ4N10gV29ya3F1ZXVlOiBldmVudHMgYW1kZ3B1X2lycV9o
YW5kbGVfaWgxIFthbWRncHVdCj4gWyAgMTMzLjA0ODUwNl0gUklQOiAwMDEwOmRtYV9yZXN2X2Fk
ZF9zaGFyZWRfZmVuY2UrMHgyMDQvMHgyODAKPiBbICAxMzMuMDQ4NjcyXSAgYW1kZ3B1X3ZtX3Nk
bWFfY29tbWl0KzB4MTM0LzB4MjIwIFthbWRncHVdCj4gWyAgMTMzLjA0ODc4OF0gIGFtZGdwdV92
bV9ib191cGRhdGVfcmFuZ2UrMHgyMjAvMHgyNTAgW2FtZGdwdV0KPiBbICAxMzMuMDQ4OTA1XSAg
YW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdCsweDIwMi8weDM3MCBbYW1kZ3B1XQo+IFsgIDEzMy4wNDkw
MzFdICBnbWNfdjlfMF9wcm9jZXNzX2ludGVycnVwdCsweDFhYi8weDMxMCBbYW1kZ3B1XQo+IFsg
IDEzMy4wNDkxNjVdICA/IGtnZDJrZmRfaW50ZXJydXB0KzB4OWEvMHgxODAgW2FtZGdwdV0KPiBb
ICAxMzMuMDQ5Mjg5XSAgPyBhbWRncHVfaXJxX2Rpc3BhdGNoKzB4YjYvMHgyNDAgW2FtZGdwdV0K
PiBbICAxMzMuMDQ5NDA4XSAgYW1kZ3B1X2lycV9kaXNwYXRjaCsweGI2LzB4MjQwIFthbWRncHVd
Cj4gWyAgMTMzLjA0OTUzNF0gIGFtZGdwdV9paF9wcm9jZXNzKzB4OWIvMHgxYzAgW2FtZGdwdV0K
PiBbICAxMzMuMDQ5NjU3XSAgYW1kZ3B1X2lycV9oYW5kbGVfaWgxKzB4MjEvMHg2MCBbYW1kZ3B1
XQo+IFsgIDEzMy4wNDk2NjldICBwcm9jZXNzX29uZV93b3JrKzB4MjlmLzB4NjQwCj4gWyAgMTMz
LjA0OTY3OF0gIHdvcmtlcl90aHJlYWQrMHgzOS8weDNmMAo+IFsgIDEzMy4wNDk2ODVdICA/IHBy
b2Nlc3Nfb25lX3dvcmsrMHg2NDAvMHg2NDAKPgo+IFNpZ25lZC1vZmYtYnk6IFBoaWxpcCBZYW5n
IDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEZlbGl4IEt1ZWhsaW5nIDxG
ZWxpeC5LdWVobGluZ0BhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdm0uYyB8IDEwICsrKysrKysrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdm0uYwo+IGluZGV4IGFiZGQ0ZTdiNGMzYi4uYmQ5ZGU4NzBmOGYxIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiBAQCAtMzMwMSw3ICszMzAxLDcgQEAg
Ym9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1
bnNpZ25lZCBpbnQgcGFzaWQsCj4gICAJc3RydWN0IGFtZGdwdV9ibyAqcm9vdDsKPiAgIAl1aW50
NjRfdCB2YWx1ZSwgZmxhZ3M7Cj4gICAJc3RydWN0IGFtZGdwdV92bSAqdm07Cj4gLQlsb25nIHI7
Cj4gKwlpbnQgcjsKPiAgIAlib29sIGlzX2NvbXB1dGVfY29udGV4dCA9IGZhbHNlOwo+ICAgCj4g
ICAJc3Bpbl9sb2NrKCZhZGV2LT52bV9tYW5hZ2VyLnBhc2lkX2xvY2spOwo+IEBAIC0zMzU5LDYg
KzMzNTksMTIgQEAgYm9vbCBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2LCB1bnNpZ25lZCBpbnQgcGFzaWQsCj4gICAJCXZhbHVlID0gMDsKPiAgIAl9Cj4g
ICAKPiArCXIgPSBkbWFfcmVzdl9yZXNlcnZlX3NoYXJlZChyb290LT50Ym8uYmFzZS5yZXN2LCAx
KTsKPiArCWlmIChyKSB7Cj4gKwkJcHJfZGVidWcoImZhaWxlZCAlZCB0byByZXNlcnZlIGZlbmNl
IHNsb3RcbiIsIHIpOwo+ICsJCWdvdG8gZXJyb3JfdW5sb2NrOwo+ICsJfQo+ICsKPiAgIAlyID0g
YW1kZ3B1X3ZtX2JvX3VwZGF0ZV9tYXBwaW5nKGFkZXYsIGFkZXYsIHZtLCB0cnVlLCBmYWxzZSwg
TlVMTCwgYWRkciwKPiAgIAkJCQkJYWRkciwgZmxhZ3MsIHZhbHVlLCBOVUxMLCBOVUxMLAo+ICAg
CQkJCQlOVUxMKTsKPiBAQCAtMzM3MCw3ICszMzc2LDcgQEAgYm9vbCBhbWRncHVfdm1faGFuZGxl
X2ZhdWx0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCB1bnNpZ25lZCBpbnQgcGFzaWQsCj4g
ICBlcnJvcl91bmxvY2s6Cj4gICAJYW1kZ3B1X2JvX3VucmVzZXJ2ZShyb290KTsKPiAgIAlpZiAo
ciA8IDApCj4gLQkJRFJNX0VSUk9SKCJDYW4ndCBoYW5kbGUgcGFnZSBmYXVsdCAoJWxkKVxuIiwg
cik7Cj4gKwkJRFJNX0VSUk9SKCJDYW4ndCBoYW5kbGUgcGFnZSBmYXVsdCAoJWQpXG4iLCByKTsK
PiAgIAo+ICAgZXJyb3JfdW5yZWY6Cj4gICAJYW1kZ3B1X2JvX3VucmVmKCZyb290KTsKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
