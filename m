Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0F3153FEC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2C56F9FD;
	Thu,  6 Feb 2020 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D88B6E9D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:11:38 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z9so3651492wrs.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=MTv2PSuf1Uc/JHb6LnA1Xxmg2Wdn+nQXuJIGsPAwmo4=;
 b=uWjs2v207Ck0qvvSxNqMlx3S/W+rqpHNhfcnIk4xvU4/BZfyiEbKzgB8Ob71VFtjnR
 b/yct4A74mghlneZ2JEmVqPUEpEfPhnX2RgU4POJulaGiF8fxHjDc1zaSeRT5BX3BHjt
 jV6CH0QtZe2HzlSnxiniylfpnXEp6pvA/Y4lAequl28H/lrNfsajI53eTb3HKd/MeLH7
 uZ8Ak0oO8o0lYFGM7Og5rM0zqepgh1vz7TOZbeZ8HVAwzxNBPI61NDxz0Nr1UaB3OAOB
 rtlOC/9Dj8uroq739ZbTDSKdE9ZkgogXHARXeeCXzabk1K8tB/9SYvXP544gPTL265C7
 LNCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=MTv2PSuf1Uc/JHb6LnA1Xxmg2Wdn+nQXuJIGsPAwmo4=;
 b=qEYnuYAkZku3RNNJl26i5C4TpjhHJiHlaqG8ktHqhyN4RbUO8ohYphnq/nBQc3fYCr
 0iDXVdrgcS1h6wFuQgLklxQ3azPSYr1gEjbM7tkyh0yRi8HzYqKkTGAj25J1MI6ZQHox
 ywH1diih05ECq9u/vacDNRVau0nelDdhfw29v4CSBiXZqR32mRPNXPbqLeV5GYW4DEQ8
 NAwKvW0LlB+HxP+qP1SCI+ASBz0S05YjMP5BwUuKWMVPpuVHCHcD+zQY+IhyOyJErOFh
 CN/ozl3LdDHEcpdrKEY4motulpI8E8rPa/p3CaR15vB1QU0otMdufrasKHhf2+npb2OB
 jdlA==
X-Gm-Message-State: APjAAAUYWPiqmA2Ucs3jYnsLDXdsHc1DWiKUJDTq/X0wHge+Ew8gt9HY
 WgefJPNSYkt5Gu5AfPDONaZfbTHi
X-Google-Smtp-Source: APXvYqxxqC1qYOGATMdi3kZeuh4fgfzDH0kf9FxlHYPQ71dXAAyaj36hCaGqFVz/GLvZadlpRpdLaQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr28021014wrp.378.1580922697098; 
 Wed, 05 Feb 2020 09:11:37 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id t5sm540595wrr.35.2020.02.05.09.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:11:36 -0800 (PST)
Subject: Re: [PATCH 2/3] drm/tegra: Reuse IOVA mapping where possible
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-3-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <85912bac-6c67-5865-e78e-444720669005@gmail.com>
Date: Wed, 5 Feb 2020 20:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-3-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoaXMgcGFydGlhbGx5IHJldmVy
dHMgdGhlIERNQSBBUEkgc3VwcG9ydCB0aGF0IHdhcyByZWNlbnRseSBtZXJnZWQKPiBiZWNhdXNl
IGl0IHdhcyBjYXVzaW5nIHBlcmZvcm1hbmNlIHJlZ3Jlc3Npb25zIG9uIG9sZGVyIFRlZ3JhIGRl
dmljZXMuCj4gVW5mb3J0dW5hdGVseSwgdGhlIGNhY2hlIG1haW50ZW5hbmNlIHBlcmZvcm1lZCBi
eSBkbWFfbWFwX3NnKCkgYW5kCj4gZG1hX3VubWFwX3NnKCkgY2F1c2VzIHBlcmZvcm1hbmNlIHRv
IGRyb3AgYnkgYSBmYWN0b3Igb2YgMTAuCj4gCj4gVGhlIHJpZ2h0IHNvbHV0aW9uIGZvciB0aGlz
IHdvdWxkIGJlIHRvIGNhY2hlIG1hcHBpbmdzIGZvciBidWZmZXJzIHBlcgo+IGNvbnN1bWVyIGRl
dmljZSwgYnV0IHRoYXQncyBhIGJpdCBpbnZvbHZlZC4gSW5zdGVhZCwgd2Ugc2ltcGx5IHJldmVy
dCB0bwo+IHRoZSBvbGQgYmVoYXZpb3VyIG9mIHNoYXJpbmcgSU9WQSBtYXBwaW5ncyB3aGVuIHdl
IGtub3cgdGhhdCBkZXZpY2VzIGNhbgo+IGRvIHNvIChpLmUuIHRoZXkgc2hhcmUgdGhlIHNhbWUg
SU9NTVUgZG9tYWluKS4KPiAKPiBSZXBvcnRlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhA
Z21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9nZW0uYyAgIHwgMTAgKysrKysr
Ky0KPiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMgfCA0NCArKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQo+ICBkcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMgICAgICB8IDMy
ICsrKysrKysrKysrKysrKysrKysrKystLS0KPiAgMyBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRp
b25zKCspLCAyMyBkZWxldGlvbnMoLSkKClRlc3RlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdl
dHhAZ21haWwuY29tPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
