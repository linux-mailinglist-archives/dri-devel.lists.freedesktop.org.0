Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF27153FFA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A8BC6FA14;
	Thu,  6 Feb 2020 08:17:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2025C6F8E6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:31:32 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id q9so3376835wmj.5
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3+G4L0nu1D0Q6pMcq/IX3V+VgIqHzMV1kGIvbLHlTec=;
 b=Fy/1wO77sdjmG0zHBvfsHGI9IJ8C1CHba2/tz6D/aMBte2RAWpAj3IvS2Jl+c38rvO
 xv59AN5gXH6U3Bc49vm4TPTZb9gkx+eoQbEgRe0suIog9+r+SPENxuCUxu5cyx+ptCnL
 6hUmSk2uXwMkSaSvMb/TkrsFtA0G4VVYa/E4f1KbG4H9+ZOfrFIrh+Xbm6zzWucz0Hu/
 5DMBEqwVJMUWrrh1y3eZBnZZq6rMxY1rqAz/w9McvgxgKJIsEw3C9K2Ypj9tDFx+hikU
 QVFad8NRjNx1jXZpZB0Zelv+8gaOt5d+vwf4X9WqUogejm6s7Wl2o6Wr57TtpThqnuFv
 SBdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3+G4L0nu1D0Q6pMcq/IX3V+VgIqHzMV1kGIvbLHlTec=;
 b=BkqU/ljE/9Wki2yxt3G6KC18dvVnHQY7l2uy9xHivc9CWEytuT7PkgvO4b8TguQGjO
 wsKW3rVoL6wNmRIAsnWC9zm67eO9U+lcSOlgBIh34abWdeEiY9BKULTyT4mySOoWZWWE
 5jdsKCASpYEQUeUgUi1vGtu83TtZTjGUphmwzsX22YYtfQNBiQr6GYsL4u6mG+Kkzc/X
 0Al9f5i9dQM+lh8AueRcK/eQYURodd4wpcfFZEIvyQI8+FFqEvqp/TXMw6fffMMGbod6
 /DMt6mHbh+xPFu9s7KEinaW/RLgITwcYQB3+sXPFlQL8JUxBlOs5EKEeDdxiaIhMjceA
 JCqA==
X-Gm-Message-State: APjAAAXmqN+/OVN2rwwKMdpj/q0XfpvXVCQgiWLHXb8z00t7gTYZonTu
 ocVAZyny+rvzul9Sh9X6eA5C1aP+
X-Google-Smtp-Source: APXvYqz5os9R/Em7Wqo9EBKwg7FPNUtmnxkdcKXSO8U2jaTJARDrd5wyX18IGgTzZbObowv/54BZQA==
X-Received: by 2002:a1c:688a:: with SMTP id d132mr7309480wmc.189.1580923890585; 
 Wed, 05 Feb 2020 09:31:30 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id z3sm625034wrs.32.2020.02.05.09.31.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:31:30 -0800 (PST)
Subject: Re: [PATCH 3/3] gpu: host1x: Set DMA direction only for DMA-mapped
 buffer objects
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-4-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b3871ad5-39e6-9376-6631-30c1be4bc3dd@gmail.com>
Date: Wed, 5 Feb 2020 20:31:29 +0300
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
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9ob3N0MXgvam9iLmMgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKPiBpbmRleCA4MTk4
YTRkNDJjNzcuLmExMDY0M2FhODlhYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9ob3N0MXgv
am9iLmMKPiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvam9iLmMKPiBAQCAtMjQ4LDYgKzI0OCw3
IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGluX2pvYihzdHJ1Y3QgaG9zdDF4ICpob3N0LCBzdHJ1
Y3QgaG9zdDF4X2pvYiAqam9iKQo+ICAJCQkJZ290byB1bnBpbjsKPiAgCQkJfQo+ICAKPiArCQkJ
am9iLT51bnBpbnNbam9iLT5udW1fdW5waW5zXS5kaXIgPSBETUFfVE9fREVWSUNFOwo+ICAJCQlq
b2ItPnVucGluc1tqb2ItPm51bV91bnBpbnNdLmRldiA9IGhvc3QtPmRldjsKPiAgCQkJcGh5c19h
ZGRyID0gc2dfZG1hX2FkZHJlc3Moc2d0LT5zZ2wpOwo+ICAJCX0KPiBAQCAtMjU1LDcgKzI1Niw2
IEBAIHN0YXRpYyB1bnNpZ25lZCBpbnQgcGluX2pvYihzdHJ1Y3QgaG9zdDF4ICpob3N0LCBzdHJ1
Y3QgaG9zdDF4X2pvYiAqam9iKQo+ICAJCWpvYi0+YWRkcl9waHlzW2pvYi0+bnVtX3VucGluc10g
PSBwaHlzX2FkZHI7Cj4gIAkJam9iLT5nYXRoZXJfYWRkcl9waHlzW2ldID0gcGh5c19hZGRyOwo+
ICAKPiAtCQlqb2ItPnVucGluc1tqb2ItPm51bV91bnBpbnNdLmRpciA9IERNQV9UT19ERVZJQ0U7
Cj4gIAkJam9iLT51bnBpbnNbam9iLT5udW1fdW5waW5zXS5ibyA9IGctPmJvOwo+ICAJCWpvYi0+
dW5waW5zW2pvYi0+bnVtX3VucGluc10uc2d0ID0gc2d0Owo+ICAJCWpvYi0+bnVtX3VucGlucysr
Owo+IAoKClJldmlld2VkLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
