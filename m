Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 920AF7BF38
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 13:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A0389CE1;
	Wed, 31 Jul 2019 11:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1492D89CE1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 11:25:07 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id u25so49111423wmc.4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 04:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=tIk+HhUQyYD/eJ2Cmx5pnhyecG66AT7IN/YK3vgf9qA=;
 b=teDhGRQIwgVZ3nDpIiDMj4bbj5w0L57ne7kajieNz2myVEBRH3rUrz3OMd6/yd9Zl0
 IGBVOIxNWLxnDyPiT8kZrlNroCJ65m827KXwFmhwtYK42IKCJz+RRxAn0RCzDViskoks
 0ntGxZwljJ3nAHQ/QA/bAJrcZ/n4mk9+ksGJ/Zt4vDmy8UjHUGjjG628+3ngB2Fb8PzI
 bFj65lm8phj4VWe7UJ6xe8KPU2NPJwNIdkSQSiF16Ry9SivV2Btwab/+57e1QIYIKu/R
 tfSImY7g/sZpTZQv8IgtDWu01NwD8zJkr8CZxNwxcY0L/O4NRYCexPT7uhqfHzxgpVll
 pJ0Q==
X-Gm-Message-State: APjAAAVk6cj5rvaKBre1Mp2Ybur6Van9xeTDumNoCUb7iQr8D4hezU6m
 z4RpOE3DdgYBqdIzDs/vpr/5JzaA
X-Google-Smtp-Source: APXvYqzJtoj9wGbRsOJztg2EX8aNJOEAoXFm36P++cYHDQitML1Z/Q7nrd3lULDwbjMuLHATl/uL9g==
X-Received: by 2002:a1c:cc0d:: with SMTP id
 h13mr108052177wmb.119.1564572305541; 
 Wed, 31 Jul 2019 04:25:05 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y7sm50218916wmm.19.2019.07.31.04.25.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 31 Jul 2019 04:25:05 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: add dma_fence_chain_for_each_unwrap helper v2
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>, david1.zhou@amd.com, 
 lionel.g.landwerlin@intel.com, chris@chris-wilson.co.uk
References: <20190731092217.51201-1-christian.koenig@amd.com>
 <c58389cc-37e5-cc7c-ab56-e9644666af41@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <43881ca9-456a-a02c-84cf-dbb07e597590@gmail.com>
Date: Wed, 31 Jul 2019 13:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <c58389cc-37e5-cc7c-ab56-e9644666af41@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=tIk+HhUQyYD/eJ2Cmx5pnhyecG66AT7IN/YK3vgf9qA=;
 b=vIAOzTpj1ptzfEWqT+unNGDFaivHY66tAKrvJpoHO544tk4pex37HvWoHM6H1r6noW
 2GSwI92Y2bd6nUcXzP6okBTcH6EDXIbW32SOw08SP7YCI3E8sEUhiihq5zFxNZ5XB0cU
 6hEkIrzuHVrYyeHus/mMy17w0ff35Q6IwuTbCKXPR3RmATPZiTG3E4au17f5hQ0F4rvd
 zzok1OcEKP2SHyXgSUKW1jAmNET4C5fKzNwkxvay8BWxBYk9TlxO0U/J5QLgZvOmTEo+
 AV5E0vwng9u2yDlghq3bng7cYr6xSSX5UFJ22as0jNFVXOF1nXGUfvJXEbJ5ypfUvCA3
 ggoQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMzEuMDcuMTkgdW0gMTE6Mjcgc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDE5LTA3
LTMxIDExOjIyIGEubS4sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFkZCBhbm90aGVyIGZv
cl9lYWNoIGhlbHBlciB0byBpdGVyYXRlIG92ZXIgYWxsIHRoZSBmZW5jZXMgaW4gYSBjaGFpbgo+
PiB3aXRoIHVud3JhcHBpbmcgZWFjaCBjaGFpbiBub2RlLgo+Pgo+PiB2MjogZml4IHR5cG9zLCBz
aW1wbGlmeSBhbmQgcmVuYW1lIHRoZSBuZXcgaGVscGVyCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9kbWEtYnVmL2RtYS1mZW5jZS1jaGFpbi5jIHwgMTEgKysrKy0tLS0tLS0KPj4gICBpbmNs
dWRlL2xpbnV4L2RtYS1mZW5jZS1jaGFpbi5oICAgfCAzMyArKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0
aW9ucygtKQo+IFRoaXMgc2hvdWxkIHByb2JhYmx5IGJlIHNlbnQgdG8gYSB3aWRlciBhdWRpZW5j
ZSwgcGVyIHRoZQo+IHNjcmlwdHMvZ2V0X21haW50YWluZXIucGwgc2NyaXB0LgoKV2VsbCBhbHRl
cm5hdGl2ZWx5IHdlIGNvdWxkIHVwZGF0ZSB0aGUgTUFJTlRBSU5FUlMgZmlsZSA6KSBUaGUgCmRt
YS1mZW5jZS1jaGFpbiBjb250YWluZXIgd2FzIGFkZGVkIGJ5IG1lIHJlY2VudGx5IGFuZCBzbyBm
YXIgaXMgb25seSAKdXNlZCBieSBzdHVmZiB3ZSBtYWludGFpbi4KCkJ1dCB5ZWFoIGZvciB0aGUg
dXBjb21taW5nIHJlc2VydmF0aW9uIG9iamVjdCBjaGFuZ2UgSSBzaG91bGQgcHJvYmFibHkgCnNl
bmQgaXQgYXJvdW5kIHRvIG1vcmUgcGVvcGxlLgoKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
