Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A867916EEA1
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 20:09:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AF0E6EB96;
	Tue, 25 Feb 2020 19:09:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0D96EB96;
 Tue, 25 Feb 2020 19:09:25 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w12so16131993wrt.2;
 Tue, 25 Feb 2020 11:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=3kTu+BUBz43ggsnxvQYOT9THVn0wDN4oBSgbIJ9N+gE=;
 b=Q/iHJn8/TzSSu8pJxsq99wdBxaqAhu8vVeYZCVYunq0NgyokwzpWaXN/4ETY/Uvxzl
 l2CJjLLImgzrTtbAuAQiaIGc2EoZgQmcNioI4chBphu65fuuykRbV2YSOKGIGFDy+TZT
 oK2doEavlQ+pnSBQvLO3AM/T0j1hKM/UG7KaLqFx0xZp6xSuDP6XQHFQCDK6eSLYCiFw
 n01fqFJWnwEJ2ESF0JnYzOciWtAqm244vB3y5+vY5g28U1CooXoS+11bdjeGZPX7rBIP
 YldF2yEDae7cgMyyBxNPmyGkvcqYSwmfbdV1rhIVvGh6kZrNrbBpWxJBfuUEkffaz+19
 Kpcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=3kTu+BUBz43ggsnxvQYOT9THVn0wDN4oBSgbIJ9N+gE=;
 b=P9gMeE+dLkNiN6Y/qeARHW6thofsbtuyv976w9N4/VLiFd+qPIbnmAObmpuFls+aJ5
 PmyWDibdUP6LFGJG0vE4PS4GOd8ZXw03H6guq8xNPExSUvjYOFvf4X/DrIaU4D6Rb3Yb
 tQog1oZKFV6HwTolol+lJmFmtwNq16E+aLWkXia+VzwC9QZO3yK8cIbH1Im4ghvgB7P6
 q8/FK0adtM0vTCatXLDg8YuMOcxyRqH4qrp2ed7gr4QkdnUErNorJkBJV671JdWheAyM
 3FsOaVKb6jXaUsJu7aE1EuWRfjDne/e56DfHJqMta/2R4RDjZoW+E39dWmNbntZ7Mx2C
 WMyg==
X-Gm-Message-State: APjAAAUAJrxQWyLE+VNmEfeAPl9gw+stli6Fbk7PrjTS+4MkkhdCzRty
 ku4XWvsMtwTIJcdlihZnoDLo6Q4f
X-Google-Smtp-Source: APXvYqyEYeq0uJejzWJVmE6+DHypKVr0OwnBX/lgpFGlnazJeTroSSvkBdTUtF/bJf6lJNjLee+gzA==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr581104wrs.50.1582657764010;
 Tue, 25 Feb 2020 11:09:24 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id z6sm25244288wrw.36.2020.02.25.11.09.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 25 Feb 2020 11:09:23 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: fix leaking fences via ttm_buffer_object_transfer
To: Alex Deucher <alexdeucher@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20200225185614.1058688-1-alexander.deucher@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0e6fa597-62c4-3dd3-27bf-fa5ddd6ec1a4@gmail.com>
Date: Tue, 25 Feb 2020 20:09:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200225185614.1058688-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Ahzo <Ahzo@tutanota.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDIuMjAgdW0gMTk6NTYgc2NocmllYiBBbGV4IERldWNoZXI6Cj4gRnJvbTogQWh6byA8
QWh6b0B0dXRhbm90YS5jb20+Cj4KPiBTZXQgdGhlIGRybV9kZXZpY2UgdG8gTlVMTCwgc28gdGhh
dCB0aGUgbmV3bHkgY3JlYXRlZCBidWZmZXIgb2JqZWN0Cj4gZG9lc24ndCBhcHBlYXIgdG8gdXNl
IHRoZSBlbWJlZGRlZCBnZW0gb2JqZWN0Lgo+Cj4gVGhpcyBpcyBuZWNlc3NhcnksIGJlY2F1c2Ug
b3RoZXJ3aXNlIG5vIGNvcnJlc3BvbmRpbmcgZG1hX3Jlc3ZfZmluaSBmb3IKPiB0aGUgZG1hX3Jl
c3ZfaW5pdCBpcyBjYWxsZWQsIHJlc3VsdGluZyBpbiBhIG1lbW9yeSBsZWFrLgo+Cj4gVGhlIGRt
YV9yZXN2X2ZpbmkgaW4gdHRtX2JvX3JlbGVhc2VfbGlzdCBpcyBvbmx5IGNhbGxlZCBpZiB0aGUg
ZW1iZWRkZWQKPiBnZW0gb2JqZWN0IGlzIG5vdCB1c2VkLCB3aGljaCBpcyBkZXRlcm1pbmVkIGJ5
IGNoZWNraW5nIGlmIHRoZQo+IGRybV9kZXZpY2UgaXMgTlVMTC4KPgo+IEJ1ZzogaHR0cHM6Ly9n
aXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9hbWQvaXNzdWVzLzk1OAo+IEZpeGVzOiAxZTA1M2Ix
MGJhNjAgKCJkcm0vdHRtOiB1c2UgZ2VtIHJlc2VydmF0aW9uIG9iamVjdCIpCj4gU2lnbmVkLW9m
Zi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgoKR29vZCBjYXRjaCBJIHdhcyB0cnlpbmcg
dG8gaHVudCB0aGF0IG9uZSBkb3duIGFzIHdlbGwuCgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKPiAtLS0KPiAgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvX3V0aWwuYyB8IDEgKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gaW5kZXggYzhlMzU5ZGVkMWRmLi40
NGMxZTdhZGZiN2MgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRp
bC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCj4gQEAgLTUxNCw2
ICs1MTQsNyBAQCBzdGF0aWMgaW50IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqYm8sCj4gICAJCWZiby0+YmFzZS5iYXNlLnJlc3YgPSAmZmJvLT5i
YXNlLmJhc2UuX3Jlc3Y7Cj4gICAKPiAgIAlkbWFfcmVzdl9pbml0KCZmYm8tPmJhc2UuYmFzZS5f
cmVzdik7Cj4gKwlmYm8tPmJhc2UuYmFzZS5kZXYgPSBOVUxMOwo+ICAgCXJldCA9IGRtYV9yZXN2
X3RyeWxvY2soJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsKPiAgIAlXQVJOX09OKCFyZXQpOwo+ICAg
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
