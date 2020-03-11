Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70426181B47
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 15:33:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E994D6E204;
	Wed, 11 Mar 2020 14:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A1C36E204;
 Wed, 11 Mar 2020 14:33:05 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s14so2900476wrt.8;
 Wed, 11 Mar 2020 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=CQ0JDxNrcN3shv6a5m0suWWdeJt0vyxFrdr4rHmqkqU=;
 b=iCG7ITCPV+6IA471m5arYSpjP/9x2Omj5aJ3wCYIEKDtN4MZ0oizDH6Xn9Q+jqcjXx
 MeOITCcMjtOHua4CH48S2fIv+2ZV0Iy39e4zuX7clFNibnupKM9pqmRHDVtbib2fAuVe
 f1TA+ZAVqrtKUHa8qQSD9dlM1mEUrok++8+mYnjRBtfKwQD2RF899GZjDSApZFbhg6PQ
 ZMxKARTyEig6ahtFNIG8Ps+QJqobSbEVFakQk/qAQe2IOgF23/WuqVhvdg61tOUb6wLM
 oUzGJWwRa2gECudS0qx9dqcG1IkF7EmIoOg0Kee/kvBbKyTTcZCh+2eZnScEEtHk+1ap
 NNYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=CQ0JDxNrcN3shv6a5m0suWWdeJt0vyxFrdr4rHmqkqU=;
 b=oOQmTZwwmYuc5eJMdGFfH7redsAZH4yynscrPjcZu3oRhT4IPhPRYOHOTfre4uczxT
 2xIzFkzY/vMGHjQ/T6VYA5ATe5SBnKb20ldVFmiWf2n24Ep25lBG9yhnkr3kpJISSjHG
 sQtjmubdRjwOddHQaNHK+GoDaYih24u1LS+EnpcmhPIcbooCk1Klr9xBOY4MKlqvmjeA
 R3nRpwmmPRkQdAdv9UvDx+Ocrh51qUGTXcHZi6xPtNqdALB4IL7uKGv+V4wqk5iPhmTm
 S1Nbb9NT9NTHYMqcf9tXVORyCE/QuMVXDIWuxCJXfMTSmB+YleRtFbKunj0l4ENAgRNH
 vTPA==
X-Gm-Message-State: ANhLgQ16ULzxw+Dpx8+FzijAk12NqSaOL2yYGSdUwpwI9hbfguG4KFls
 ou7ynVQs+FetsbiMyb8ycU3AWoTM
X-Google-Smtp-Source: ADFU+vupajy8DiEtdmUz0h9BP/XwMnaErjf8sHC5057XwoWGaDuCWiInFXD/bVB1J78ZSPNA/rAVZw==
X-Received: by 2002:a5d:4d48:: with SMTP id a8mr4915400wru.246.1583937183716; 
 Wed, 11 Mar 2020 07:33:03 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id c13sm10921011wro.96.2020.03.11.07.33.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Mar 2020 07:33:02 -0700 (PDT)
Subject: Re: [PATCH 4/6] drm/amdgpu: add checks if DMA-buf P2P is supported
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200311135158.3310-1-christian.koenig@amd.com>
 <20200311135158.3310-5-christian.koenig@amd.com>
 <20200311140415.GB31668@ziepe.ca>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <848c2f50-1529-f036-69cd-5104b7ebe27b@gmail.com>
Date: Wed, 11 Mar 2020 15:33:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200311140415.GB31668@ziepe.ca>
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
Cc: Logan Gunthorpe <logang@deltatee.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDMuMjAgdW0gMTU6MDQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gV2VkLCBN
YXIgMTEsIDIwMjAgYXQgMDI6NTE6NTZQTSArMDEwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4gQ2hlY2sgaWYgd2UgY2FuIGRvIHBlZXIycGVlciBvbiB0aGUgUENJZSBidXMuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
Pj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jIHwgNCArKysr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKPj4gaW5kZXggYWVmMTJlZTJmMWUzLi5i
YmY2NzgwMGM4YTYgMTAwNjQ0Cj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMKPj4gQEAgLTM4LDYgKzM4LDcgQEAKPj4gICAjaW5jbHVkZSA8ZHJtL2Ft
ZGdwdV9kcm0uaD4KPj4gICAjaW5jbHVkZSA8bGludXgvZG1hLWJ1Zi5oPgo+PiAgICNpbmNsdWRl
IDxsaW51eC9kbWEtZmVuY2UtYXJyYXkuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9wY2ktcDJwZG1h
Lmg+Cj4+ICAgCj4+ICAgLyoqCj4+ICAgICogYW1kZ3B1X2dlbV9wcmltZV92bWFwIC0gJmRtYV9i
dWZfb3BzLnZtYXAgaW1wbGVtZW50YXRpb24KPj4gQEAgLTE3OSw2ICsxODAsOSBAQCBzdGF0aWMg
aW50IGFtZGdwdV9kbWFfYnVmX2F0dGFjaChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLAo+PiAgIAlz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJkZXYp
Owo+PiAgIAlpbnQgcjsKPj4gICAKPj4gKwlpZiAocGNpX3AycGRtYV9kaXN0YW5jZV9tYW55KGFk
ZXYtPnBkZXYsICZhdHRhY2gtPmRldiwgMSwgdHJ1ZSkgPCAwKQo+PiArCQlhdHRhY2gtPnBlZXIy
cGVlciA9IGZhbHNlOwo+PiArCj4gQXJlIHRoZXJlIG90aGVyIHJlbGF0ZWQgcGF0Y2hlcyB0aGFu
IHRoaXMgc2VyaWVzPwo+Cj4gcDJwIGRtYSBtYXBwaW5nIG5lZWRzIHRvIGJlIGRvbmUgaW4gY29t
bW9uIGNvZGUsIGluIHAycGRtYS5jIC0gaWUgdGhpcwo+IG9wZW4gY29kaW5nIGlzIG1pc3Npbmcg
dGhlIGJ1c19vZmZzZXQgc3R1ZmYsIGF0IGxlYXN0LgoKWWVhaCwgSSdtIGF3YXJlIG9mIHRoaXMu
IEJ1dCBJIGNvdWxkbid0IGZpbmQgYSBiZXR0ZXIgd2F5IGZvciBub3cuCgo+IEkgcmVhbGx5IGRv
IG5vdCB3YW50IHRvIHNlZSBkcml2ZXJzIG9wZW4gY29kZSB0aGlzIHN0dWZmLgo+Cj4gV2UgYWxy
ZWFkeSBoYXZlIGEgcDJwZG1hIEFQSSBmb3IgaGFuZGxpbmcgdGhlIHN0cnVjdCBwYWdlIGNhc2Us
IHNvIEkKPiBzdWdnZXN0IGFkZGluZyBzb21lIG5ldyBwMnBkbWEgQVBJIHRvIGhhbmRsZSB0aGlz
IGZvciBub24tc3RydWN0IHBhZ2UKPiBjYXNlcy4KPgo+IGllIHNvbWUgdGhpbmcgbGlrZToKPgo+
IGludCAncDJwZG1hIG1hcCBiYXInKAo+ICAgICBzdHJ1Y3QgcGNpX2RldmljZSAqc291cmNlLAo+
ICAgICB1bnNpZ25lZCBpbnQgc291cmNlX2Jhcl9udW1iZXIsCj4gICAgIHN0cnVjdCBwY2lfZGV2
aWNlICpkZXN0LAo+ICAgICBwaHlzYWRkciZsZW4gKmFycmF5X29mX29mZnNldHMgJiBsZW5ndGgg
cGFpcnMgaW50byBzb3VyY2UgYmFyLAo+ICAgICBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKm91dHB1dF9z
Z2wpCgpXZWxsIHRoYXQncyBleGFjdGx5IHdoYXQgSSBoYXZlIHRvIGF2b2lkIHNpbmNlIEkgZG9u
J3QgaGF2ZSB0aGUgYXJyYXkgb2YgCm9mZnNldHMgYXJvdW5kIGFuZCB3YW50IHRvIGF2b2lkIGNv
bnN0cnVjdGluZyBpdC4KClNpbWlsYXIgcHJvYmxlbSBmb3IgZG1hX21hcF9yZXNvdXJjZSgpLiBN
eSBleGFtcGxlIGRvZXMgdGhpcyBvbiBkZW1hbmQsIApidXQgZXNzZW50aWFsbHkgd2UgYWxzbyBo
YXZlIHVzZSBjYXNlcyB3aGVyZSB0aGlzIGlzIGRvbmUgb25seSBvbmNlLgoKSWRlYWxseSB3ZSB3
b3VsZCBoYXZlIHNvbWUgZnVuY3Rpb24gdG8gY3JlYXRlIGFuIHNnbCBiYXNlZCBvbiBzb21lIAph
cmJpdHJhcnkgY29sbGVjdGlvbiBvZiBvZmZzZXRzIGFuZCBsZW5ndGggaW5zaWRlIGEgQkFSLgoK
UmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEphc29uCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
