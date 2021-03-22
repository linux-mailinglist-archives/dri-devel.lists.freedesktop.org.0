Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A113445C6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 14:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEAB189B95;
	Mon, 22 Mar 2021 13:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85B4884D4;
 Mon, 22 Mar 2021 13:32:42 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id f16so21108268ljm.1;
 Mon, 22 Mar 2021 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=W5ecTjmVdbrQD11B/vup1BEFfXdOneluoyLzujfFcSA=;
 b=Ij1WqPkqvfGbyeNI532IuvqkOJrn6j2nsDE1WvDQkLWV8648eyOBG9GuLVDgssbUI7
 7KvsMEmtgG2yVvdNn1TBEPSFdxDhOIzk2LEKhyuV3BB8D2ykDpcT0x1enURvI/HZvIgp
 /SpiuV4P4WJu84eLiM+rdBkEMXCvVNLUXVhEoPzZn8LQ/bAlPxvcgpcraYcnovyadg6L
 mXXdpF77+eKNPni9kfS1iqYjtV+aqEQHc0u7cSHX3u6t7hPDiN4eZ1x4MPRKYKoIGkro
 aZIGzKouyuJlbLrj2gtUBDmReNQCNJDo96jfX3+Lk0sMIIjLA3JACZhZ0IC8ZfcVdueK
 3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=W5ecTjmVdbrQD11B/vup1BEFfXdOneluoyLzujfFcSA=;
 b=JSj4uUk8OH60DsWb4Mvp9j66jb2ZuzNSHJaRYK2+GN4ZmcX+kVatmPkGQFdwdj5JBa
 m2oDVnMG3g2aLlEnAuE78O7i0GfvBcgGv0jz75J1ajEzTXjlMijVsuxTBYWh1M3KiuCL
 4NHU4pnLVpEtSAsC29ByIx1juHVfumyqwSnKa3donniPnb0EHzozXdSfPi9G3nSs9Q6C
 sZ3gC1YlkaRKQJJCSR4guoX7n69gohTNsN+ThaB1pGCKpx088sYndY7DL6ILA2kqMq/F
 lLhD9o3nwTJx4Ug1y12MqB+DDwzzaxel69ssau8gR6OwtdZkSS1lm+kCW7EgQoP5ViTs
 /bEg==
X-Gm-Message-State: AOAM533z9H+qRfHF7NHy+WZkMnstPnDS1Sb2T/IUOTwpOj6TaRUFS4Kf
 2GUn1dNYDaL+7F5DgJduOu4=
X-Google-Smtp-Source: ABdhPJzw4M/kytTB+bnRALYSiYSPNzJcPpd7Z18jLSyzWBuUTjc0aOZ7mF6gpPVVta/z7KM2RgfBMw==
X-Received: by 2002:a2e:7807:: with SMTP id t7mr9739066ljc.313.1616419961248; 
 Mon, 22 Mar 2021 06:32:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:e345:6f8e:fa4b:2c52?
 ([2a02:908:1252:fb60:e345:6f8e:fa4b:2c52])
 by smtp.gmail.com with ESMTPSA id a1sm1576550lfk.148.2021.03.22.06.32.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 06:32:40 -0700 (PDT)
Subject: Re: [PATCH 29/44] drm/amdgpu: reserve fence slot to update page table
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
 <20210322105900.14068-30-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ec3394a9-fbfb-c40c-e1aa-f90b953adce2@gmail.com>
Date: Mon, 22 Mar 2021 14:32:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210322105900.14068-30-Felix.Kuehling@amd.com>
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
Cc: Philip Yang <Philip.Yang@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyMi4wMy4yMSB1bSAxMTo1OCBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+IEZyb206IFBo
aWxpcCBZYW5nIDxQaGlsaXAuWWFuZ0BhbWQuY29tPgo+Cj4gRm9yZ290IHRvIHJlc2VydmUgYSBm
ZW5jZSBzbG90IHRvIHVzZSBzZG1hIHRvIHVwZGF0ZSBwYWdlIHRhYmxlLCBjYXVzZQo+IGJlbG93
IGtlcm5lbCBCVUcgYmFja3RyYWNlIHRvIGhhbmRsZSB2bSByZXRyeSBmYXVsdCB3aGlsZSBhcHBs
aWNhdGlvbiBpcwo+IGV4aXRpbmcuCj4KPiBbICAxMzMuMDQ4MTQzXSBrZXJuZWwgQlVHIGF0IC9o
b21lL3lhbmdwL2dpdC9jb21wdXRlX3N0YWdpbmcva2VybmVsL2RyaXZlcnMvZG1hLWJ1Zi9kbWEt
cmVzdi5jOjI4MSEKPiBbICAxMzMuMDQ4NDg3XSBXb3JrcXVldWU6IGV2ZW50cyBhbWRncHVfaXJx
X2hhbmRsZV9paDEgW2FtZGdwdV0KPiBbICAxMzMuMDQ4NTA2XSBSSVA6IDAwMTA6ZG1hX3Jlc3Zf
YWRkX3NoYXJlZF9mZW5jZSsweDIwNC8weDI4MAo+IFsgIDEzMy4wNDg2NzJdICBhbWRncHVfdm1f
c2RtYV9jb21taXQrMHgxMzQvMHgyMjAgW2FtZGdwdV0KPiBbICAxMzMuMDQ4Nzg4XSAgYW1kZ3B1
X3ZtX2JvX3VwZGF0ZV9yYW5nZSsweDIyMC8weDI1MCBbYW1kZ3B1XQo+IFsgIDEzMy4wNDg5MDVd
ICBhbWRncHVfdm1faGFuZGxlX2ZhdWx0KzB4MjAyLzB4MzcwIFthbWRncHVdCj4gWyAgMTMzLjA0
OTAzMV0gIGdtY192OV8wX3Byb2Nlc3NfaW50ZXJydXB0KzB4MWFiLzB4MzEwIFthbWRncHVdCj4g
WyAgMTMzLjA0OTE2NV0gID8ga2dkMmtmZF9pbnRlcnJ1cHQrMHg5YS8weDE4MCBbYW1kZ3B1XQo+
IFsgIDEzMy4wNDkyODldICA/IGFtZGdwdV9pcnFfZGlzcGF0Y2grMHhiNi8weDI0MCBbYW1kZ3B1
XQo+IFsgIDEzMy4wNDk0MDhdICBhbWRncHVfaXJxX2Rpc3BhdGNoKzB4YjYvMHgyNDAgW2FtZGdw
dV0KPiBbICAxMzMuMDQ5NTM0XSAgYW1kZ3B1X2loX3Byb2Nlc3MrMHg5Yi8weDFjMCBbYW1kZ3B1
XQo+IFsgIDEzMy4wNDk2NTddICBhbWRncHVfaXJxX2hhbmRsZV9paDErMHgyMS8weDYwIFthbWRn
cHVdCj4gWyAgMTMzLjA0OTY2OV0gIHByb2Nlc3Nfb25lX3dvcmsrMHgyOWYvMHg2NDAKPiBbICAx
MzMuMDQ5Njc4XSAgd29ya2VyX3RocmVhZCsweDM5LzB4M2YwCj4gWyAgMTMzLjA0OTY4NV0gID8g
cHJvY2Vzc19vbmVfd29yaysweDY0MC8weDY0MAo+Cj4gU2lnbmVkLW9mZi1ieTogUGhpbGlwIFlh
bmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcg
PEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKSSdtIGdvaW5nIHRvIHB1c2ggdGhpcyB0byBhbWQt
c3RhZ2luZy1kcm0tbmV4dCBzaW5jZSBpdCBpcyByZWFsbHkgYW4gCmluZGVwZW5kZW50IGJ1ZyBm
aXguCgpDaHJpc3RpYW4uCgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3ZtLmMgfCAxMCArKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Zt
LmMKPiBpbmRleCBhNjFkZjIzNGYwMTIuLjNlMzJmNzZjZDdiYiAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCj4gQEAgLTMzMDIsNyArMzMwMiw3IEBAIGJvb2wgYW1k
Z3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHBhc2lk
LAo+ICAgCXN0cnVjdCBhbWRncHVfYm8gKnJvb3Q7Cj4gICAJdWludDY0X3QgdmFsdWUsIGZsYWdz
Owo+ICAgCXN0cnVjdCBhbWRncHVfdm0gKnZtOwo+IC0JbG9uZyByOwo+ICsJaW50IHI7Cj4gICAJ
Ym9vbCBpc19jb21wdXRlX2NvbnRleHQgPSBmYWxzZTsKPiAgIAo+ICAgCXNwaW5fbG9jaygmYWRl
di0+dm1fbWFuYWdlci5wYXNpZF9sb2NrKTsKPiBAQCAtMzM2MCw2ICszMzYwLDEyIEBAIGJvb2wg
YW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwgdTMyIHBh
c2lkLAo+ICAgCQl2YWx1ZSA9IDA7Cj4gICAJfQo+ICAgCj4gKwlyID0gZG1hX3Jlc3ZfcmVzZXJ2
ZV9zaGFyZWQocm9vdC0+dGJvLmJhc2UucmVzdiwgMSk7Cj4gKwlpZiAocikgewo+ICsJCXByX2Rl
YnVnKCJmYWlsZWQgJWQgdG8gcmVzZXJ2ZSBmZW5jZSBzbG90XG4iLCByKTsKPiArCQlnb3RvIGVy
cm9yX3VubG9jazsKPiArCX0KPiArCj4gICAJciA9IGFtZGdwdV92bV9ib191cGRhdGVfbWFwcGlu
ZyhhZGV2LCBhZGV2LCB2bSwgdHJ1ZSwgZmFsc2UsIE5VTEwsIGFkZHIsCj4gICAJCQkJCWFkZHIs
IGZsYWdzLCB2YWx1ZSwgTlVMTCwgTlVMTCwKPiAgIAkJCQkJTlVMTCk7Cj4gQEAgLTMzNzEsNyAr
MzM3Nyw3IEBAIGJvb2wgYW1kZ3B1X3ZtX2hhbmRsZV9mYXVsdChzdHJ1Y3QgYW1kZ3B1X2Rldmlj
ZSAqYWRldiwgdTMyIHBhc2lkLAo+ICAgZXJyb3JfdW5sb2NrOgo+ICAgCWFtZGdwdV9ib191bnJl
c2VydmUocm9vdCk7Cj4gICAJaWYgKHIgPCAwKQo+IC0JCURSTV9FUlJPUigiQ2FuJ3QgaGFuZGxl
IHBhZ2UgZmF1bHQgKCVsZClcbiIsIHIpOwo+ICsJCURSTV9FUlJPUigiQ2FuJ3QgaGFuZGxlIHBh
Z2UgZmF1bHQgKCVkKVxuIiwgcik7Cj4gICAKPiAgIGVycm9yX3VucmVmOgo+ICAgCWFtZGdwdV9i
b191bnJlZigmcm9vdCk7CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
