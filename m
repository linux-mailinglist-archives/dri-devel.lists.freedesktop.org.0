Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 552C8153FE1
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D9FF6F9EC;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9346E9D1
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:11:49 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y17so3687318wrh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yf4xW/LIwGG+ySHgP0MFm4R39Zn9y49rgtedQvVWREs=;
 b=LgjrVUzfsl5GxUXObZxmafNP98ePgOGPypHIifnCY/QgRGlF9pVsjg3S2enmJv+rMB
 UpzaAA7CSsqgoEc3l7NBoUGKefinZIZHiusr2jMF25DXoHBWsUebUNYV43OGBqPXjgz9
 66vg7GeEmnqSCYj8TK0cSo29aGIDnaWgOdNK5d4Ri2UWz4cZ34SAzUtmcQUVztUiXmaZ
 0O+z71wgcSXv4pWfap5M58Y3AU3SRZIR8/ePBE4lmHV1FPLw+mDFAIHjgkDNvbkYaOSp
 IuUHk/AVsBDkOp+KjNmLj3P6Qb/oFrh6pNERQCQpxiazv7qd5TY03PX4ff8kOemb5hi1
 scyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yf4xW/LIwGG+ySHgP0MFm4R39Zn9y49rgtedQvVWREs=;
 b=d7MqdcU/K8HOJUwOyh7cWdYsYXa3Y17eu6N4qdvRBvl20jhUlZiOeO12UD45sEJ+rR
 KTxui1V3zlr1u2tvpD81YTXIP+kHv88QsWFpQHpQO1l+uH22zNLW58CYjhUetZEKXGpO
 f/J/5xmWvqeWK8iMi9FBehdxb1KFmLm+SOrdF2JZIoWWbD1XULsfWfTXluJ8du5QLhTx
 YoY71JfF42HCGuhT4eGraO2DmzVBpbr3XslmEZjetXYkeAOcnFE0vivBf9apCv6DGgtG
 zWqu+zESMjwcpuEbb5Cg1DhXCNkD7X+atahO6CpYgm8XyNtTBnPH8nMjTVz47jBesuWS
 udFw==
X-Gm-Message-State: APjAAAXl5vozCzlJXYX5U9CefOL2psTj6j/8cWh4DYCR2KVvOEhpCnEN
 ZbCiIIMyUjmDSzEVpMLUUh8dlnjI
X-Google-Smtp-Source: APXvYqx4MoqiqALRTIScG6Dzb10pWmOxotqS7tYt2j0uvPD+rV7zJyucLtLEXOrIIq6gtaIsvdJoOg==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr28151088wro.234.1580922708288; 
 Wed, 05 Feb 2020 09:11:48 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id m9sm557235wrx.55.2020.02.05.09.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:11:47 -0800 (PST)
Subject: Re: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped
 buffer objects
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-4-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1a58a820-0765-d0f7-90a2-c863ae8a0b23@gmail.com>
Date: Wed, 5 Feb 2020 20:11:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-4-thierry.reding@gmail.com>
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
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IFRoZSBETUEgZGlyZWN0aW9uIGlz
IG9ubHkgdXNlZCBieSB0aGUgRE1BIEFQSSwgc28gdGhlcmUgaXMgbm8gdXNlIGluCj4gc2V0dGlu
ZyBpdCB3aGVuIGEgYnVmZmVyIG9iamVjdCBpc24ndCBtYXBwZWQgd2l0aCB0aGUgRE1BIEFQSS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKVGVzdGVkLWJ5OiBEbWl0cnkgT3NpcGVu
a28gPGRpZ2V0eEBnbWFpbC5jb20+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
