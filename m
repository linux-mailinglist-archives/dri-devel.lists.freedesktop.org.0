Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 500C336204B
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 14:54:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FEE96E1F9;
	Fri, 16 Apr 2021 12:54:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DB36E1F9;
 Fri, 16 Apr 2021 12:54:11 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id e14so41951016ejz.11;
 Fri, 16 Apr 2021 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7EUGgFCxVJzb8pyDoiyMM78nVcqyNM7ePeNkigUmMe4=;
 b=YT2X/Fq3yd7QUnOI+LErRgAfU6T2haUDfUl/gmbt/p0O1O/4GHJzmzBnuay/JGl3sT
 58Ba+j57iGN7+yM/6KWyvbAs3SJKvnbEF4rQo8BULSysyV+n8ySVcssRLOtKGCoLlEVT
 Ef/c+3OkaxWD6ZFVlDdbCYmH21TMSNuoOcHmHWq0qOTTOIVUjc5Mf5UiZlva4IqEF5qt
 BeSAL9B4zX5HigKtMF4QMTW0846J7dU5NgMYfeniSt/ktAUpJrCQoaRR93Fhp+Hpz1R7
 9YlO8SAX2yb6op1aBAoHelbe/sLqhLSTP8ujhCKzj3jDfREgtvcDXM+GyPcvFzRnTB4B
 kv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=7EUGgFCxVJzb8pyDoiyMM78nVcqyNM7ePeNkigUmMe4=;
 b=gefVbAVMRGQqUrXHD2rA7/IE50qB54g5ufQpv+aul9kGbkqzAn1pC6wFdX/oTwFMmm
 H7n5eNciQRekrRV71lT7SARpQkbMVOtGk75+L1pguVMO0Tt+oqQPYx/quH8cYtlDomix
 CMYCsPFAwuNiOWU9fvJqJKdt1Pfdsxqi1h7yM2FErZCzhbL3jvm+GBRRUu90U5+qgJ1f
 rVyUVjvgmKD6uEkyvPmMHuqDvQGTefXJ93nrmkJ4zENyAQ8ySKg92btJ2GC8EA0fPh4i
 5cFYnw58BMKEoptlNIqT4+Wlp8kHxuYD0gUxdBgEZeEusmVg6Qy0vxDP/1MZVKWKxBvj
 iS3A==
X-Gm-Message-State: AOAM531IrT/p5I/ElL9H2WaAgtSYSTr7ABY7HYI8BX+tx2vF3BmvP26d
 byvq7nYsf6hiXq3EAJnLqXlme5G7MMw=
X-Google-Smtp-Source: ABdhPJz/ckqeRBEmgo7V+3swl7gUDKhG1Ao+Rv8Rr2mrwcHHd2G9UdkacysCVjxHmdvskHY2ELPreg==
X-Received: by 2002:a17:907:20f0:: with SMTP id
 rh16mr8588642ejb.320.1618577650519; 
 Fri, 16 Apr 2021 05:54:10 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:6a8a:26d6:7403:5ada?
 ([2a02:908:1252:fb60:6a8a:26d6:7403:5ada])
 by smtp.gmail.com with ESMTPSA id l15sm5125833edb.48.2021.04.16.05.54.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Apr 2021 05:54:10 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/amdgpu: make sure we unpin the UVD BO
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210415084730.2057-1-christian.koenig@amd.com>
Message-ID: <a15d4af8-98af-1036-c6f4-7738f08678e1@gmail.com>
Date: Fri, 16 Apr 2021 14:54:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415084730.2057-1-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZz8KCkFtIDE1LjA0LjIxIHVtIDEwOjQ3IHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBS
ZWxlYXNpbmcgcGlubmVkIEJPcyBpcyBpbGxlZ2FsIG5vdy4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiAtLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92N18wLmMgfCAxICsKPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L3V2ZF92N18wLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS91dmRfdjdfMC5jCj4g
aW5kZXggN2NkNjdjYjJhYzVmLi4xYTJiZjJjYTFiZTUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvdXZkX3Y3XzAuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L3V2ZF92N18wLmMKPiBAQCAtMzYzLDYgKzM2Myw3IEBAIHN0YXRpYyBpbnQgdXZkX3Y3
XzBfZW5jX3JpbmdfdGVzdF9pYihzdHJ1Y3QgYW1kZ3B1X3JpbmcgKnJpbmcsIGxvbmcgdGltZW91
dCkKPiAgIAo+ICAgZXJyb3I6Cj4gICAJZG1hX2ZlbmNlX3B1dChmZW5jZSk7Cj4gKwlhbWRncHVf
Ym9fdW5waW4oYm8pOwo+ICAgCWFtZGdwdV9ib191bnJlc2VydmUoYm8pOwo+ICAgCWFtZGdwdV9i
b191bnJlZigmYm8pOwo+ICAgCXJldHVybiByOwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
