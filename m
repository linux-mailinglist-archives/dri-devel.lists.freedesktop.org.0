Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD03713FC
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 13:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E3B6E08A;
	Mon,  3 May 2021 11:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1443D6E08A
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 11:08:09 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r9so7251895ejj.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=us+m9UJvAbbJoBtZxbtXj0Ziq0X3oOalGL6IjJnVyco=;
 b=U/15sIMVb90zZmbAq4o5lDH29M1wVicPtk0LDEuw0X+T7J9mFIQ6wgUVi+e8yFf1Dc
 jSGczKJmgEmqL2kT96G0dim9L0Te7kWMAH2T8lh/30bekIfmN5JNDfRr8oT1ClTlWu/1
 eNcmZaVaXZiO0GHTvgccfSa/t/U672/TAqgo48IQqPNlZqjj9003Ijg2EjGKMOGTp5gR
 j73j/d5aPzTgxZWI7Iw3ju26+3oXJhf2H1ICfv2rgzpaF882k3Qdni+qq8OVQJXEwwKe
 KEaJfUVfsWLRr1vke6okn4dw2ND1sBIydpuEtF4Z0pz4qz0yAOU77WyWMWheGdd2zRx+
 PkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=us+m9UJvAbbJoBtZxbtXj0Ziq0X3oOalGL6IjJnVyco=;
 b=iLWoOmb1WIZaLyK9+SOQAQ18YooVVNqcqgaEw+11EaBnUindMFB4O2PrmiZTAkqUTK
 GTK7NU0vVCPNSD2mNnl2ZaINI0kFJpprqBsa7NRPRLVUhnGJNqbGkfcHFsJuEqy9FwjW
 kYP7E9qVGRftRb7PbszsYVOFy8KeRp+WaELLgic0tsxQ9bO9vOSGDESg6rMJXIEAFVdf
 smFxlSgp8OsRmqF0YjB9fJuJ1mMjK5IhbqzUSzAaEs7NqmCK7fmafxMgloyQayeKbp51
 9CU/ChHk+MvT++dbk9Agh9Y5fswau2/XPs9aPZGIZHrCfzi6pZkr2aZ7I1Xlyls7o8WT
 QWew==
X-Gm-Message-State: AOAM533u/l6kByPAY6NVvhVg+1v3FdZWvT0TMnHcmKHT99sT9gUoEeRL
 bfuGRefIKmt6g84qPch8DJOgS6FPT7w=
X-Google-Smtp-Source: ABdhPJyuuLV2XMIutnH0EY4XSblwIZBEurcxadxCYhuFfbjxZtBPVvpdfFJtTFti2AExQZGLhjcRUA==
X-Received: by 2002:a17:907:3f08:: with SMTP id
 hq8mr1869271ejc.240.1620040087766; 
 Mon, 03 May 2021 04:08:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:3a91:af9f:fcbf:5d42?
 ([2a02:908:1252:fb60:3a91:af9f:fcbf:5d42])
 by smtp.gmail.com with ESMTPSA id gn36sm2961642ejc.23.2021.05.03.04.08.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 04:08:06 -0700 (PDT)
Subject: Re: [PATCH 07/13] drm/ttm: flip over the sys manager to self
 allocated nodes
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210430092508.60710-1-christian.koenig@amd.com>
 <20210430092508.60710-7-christian.koenig@amd.com>
 <CAM0jSHPX23up+orR+qqkBqsFTPsk1JO1Ds3zLxvjPTtR_WOmfg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <be0d56cf-2001-48c0-62ed-bda3103b8436@gmail.com>
Date: Mon, 3 May 2021 13:08:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHPX23up+orR+qqkBqsFTPsk1JO1Ds3zLxvjPTtR_WOmfg@mail.gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzAuMDQuMjEgdW0gMTc6MDQgc2NocmllYiBNYXR0aGV3IEF1bGQ6Cj4gT24gRnJpLCAzMCBB
cHIgMjAyMSBhdCAxMDoyNSwgQ2hyaXN0aWFuIEvDtm5pZwo+IDxja29lbmlnLmxlaWNodHp1bWVy
a2VuQGdtYWlsLmNvbT4gd3JvdGU6Cj4+IE1ha2Ugc3VyZSB0byBhbGxvY2F0ZSBhIHJlc291cmNl
IG9iamVjdCBoZXJlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3N5c19tYW5hZ2VyLmMgfCA3ICsrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFu
YWdlci5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYwo+PiBpbmRleCBl
ZDkyNjE1MjE0ZTMuLmE5MjYxMTRlZGZlNSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fc3lzX21hbmFnZXIuYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9z
eXNfbWFuYWdlci5jCj4+IEBAIC0zLDE4ICszLDI1IEBACj4+ICAgI2luY2x1ZGUgPGRybS90dG0v
dHRtX3Jlc291cmNlLmg+Cj4+ICAgI2luY2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPgo+PiAg
ICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KPj4gKyNpbmNsdWRlIDxsaW51eC9z
bGFiLmg+Cj4+Cj4+ICAgc3RhdGljIGludCB0dG1fc3lzX21hbl9hbGxvYyhzdHJ1Y3QgdHRtX3Jl
c291cmNlX21hbmFnZXIgKm1hbiwKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgY29uc3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UsCj4+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkKPj4gICB7Cj4+ICsgICAgICAgbWVt
LT5tbV9ub2RlID0ga3phbGxvYyhzaXplb2YoKm1lbSksIEdGUF9LRVJORUwpOwo+PiArICAgICAg
IGlmICghbWVtLT5tbV9ub2RlKQo+PiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4+
ICsKPj4gKyAgICAgICB0dG1fcmVzb3VyY2VfaW5pdChibywgcGxhY2UsIG1lbS0+bW1fbm9kZSk7
Cj4gWWVhaCwgd2h5IGFyZSB3ZSBwYXNzaW5nIHRoZSBtbV9ub2RlIGhlcmUsIGl0J3Mgbm90IHRo
ZSB0dG1fcmVzb3VyY2U/CgpXZWxsIGl0IHRlbXBvcmFyeSBpcyB0aGUgdHRtX3Jlc291cmNlIG9i
amVjdCB1bnRpbCBJIGZsaXAgdGhlIHN3aXRjaCBpbiAKdGhlIGxhc3QgcGF0Y2guCgpDaHJpc3Rp
YW4uCgo+Cj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4KPj4gICBzdGF0aWMgdm9pZCB0
dG1fc3lzX21hbl9mcmVlKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAo+PiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0pCj4+ICAg
ewo+PiArICAgICAgIGtmcmVlKG1lbS0+bW1fbm9kZSk7Cj4+ICAgfQo+Pgo+PiAgIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXJfZnVuYyB0dG1fc3lzX21hbmFnZXJfZnVu
YyA9IHsKPj4gLS0KPj4gMi4yNS4xCj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
