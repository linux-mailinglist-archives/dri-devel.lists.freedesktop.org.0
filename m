Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B05D117783
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 21:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C5E86E527;
	Mon,  9 Dec 2019 20:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D82A6E527
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 20:35:38 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id 203so11755965lfa.12
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2019 12:35:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qOohvwX4XGjXVaQmYXwJYQbj/SKTeE55N+ODU5Zvd+U=;
 b=ISYWlkmWtkCAXK4VOF01vRGYrki8CouiNmpKXKXxiaw1S29xWfKvxv2cxoPZU8HzpL
 IVDxJ39LNVUgGEKOvhvxvPRUARDzrHxSXGKGI90DKvGR7CSg9Rzb2VpiTaJJgenb+EtR
 iygb6HXRusapT72i1HSrPZSsIoeQfdjKTgABNESnUD2TmFK4eCi6kJ/sb3shNOQBMbvV
 K8VuvY33CZ1a9u86PUkS0R4hti4OncI/D7dMAlYLdmQkQRxdaGd0XoDHfL94xk6kqTar
 SvB3KdLLha+l/UgWRQQ44p38VauHq09N0PTMLXZim7UasPXN+Vb+Oel6EESAPes4GLKe
 Qw6Q==
X-Gm-Message-State: APjAAAXV+nGdx9mKl9x08ssHu6EslGRTJcxj96GG4ASsuNyjF+f+VcQy
 ra6zPc1UNmftAg2B2gpRhF2SzhnSjRphgVaP2ZY=
X-Google-Smtp-Source: APXvYqxFRlSSw7/x5rATb8AkrtViJDNVF4OyN9zZjRQ4ZWbEjSyU70WIlwWFpvdBjoAC40j4+Va02JNxRl8fjNBTDQM=
X-Received: by 2002:ac2:420e:: with SMTP id y14mr16933214lfh.145.1575923737015; 
 Mon, 09 Dec 2019 12:35:37 -0800 (PST)
MIME-Version: 1.0
References: <20191209085747.16057-1-hslester96@gmail.com>
In-Reply-To: <20191209085747.16057-1-hslester96@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Mon, 9 Dec 2019 21:35:26 +0100
Message-ID: <CAMeQTsbHFjRpi1HrzsV36vkM5MmU_wi2fLiy+TSkgNCb3wdAwA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: add a missed gma_power_end in error path
To: Chuhong Yuan <hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qOohvwX4XGjXVaQmYXwJYQbj/SKTeE55N+ODU5Zvd+U=;
 b=lXMaa1R4O5zqdvuM3yXaLSWVH7s+5PJJeEtKjJOpVXvwRVMQkKf6Wz9GdjvUhXtdI9
 QjE69/mknRmToGk3tSVuNIXuNtWAO7l6xfkWc1i5dAQl8M4H8yQbqXWmJ/VvMaEuicot
 ORH1+l1V4SMPBOWl7M/wcFYfqE6AsIa5hmRmq1cXd4t66eP0r+lmBdwt6LFsWtRQ1H0+
 GS9CZ4vsuLIzQWSG+h0yR2k7ar4QVnf1AYkN/0syrHYIKPMCbhwSX9zYfCUk5KDP+xcg
 TA253yoID0ZGkTXTu8NLMvt+VzjEE9IVFY17y2Co2LpEXbGx4bvQX617/dquvkCrNDGd
 Ptgg==
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBEZWMgOSwgMjAxOSBhdCA5OjU3IEFNIENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gb2FrdHJhaWxfbHZkc19tb2RlX3NldCgpIG1pc3NlcyBhIGdt
YV9wb3dlcl9lbmQoKSBpbiBhbiBlcnJvciBwYXRoLgo+IEFkZCB0aGUgY2FsbCB0byBmaXggaXQu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZAZ21haWwuY29tPgoK
SGkgQ2h1aG9uZywgdGhhbmtzIGZvciB0aGUgcGF0Y2guCgpBcHBsaWVkIHRvIGRybS1taXNjLW5l
eHQKCi1QYXRyaWsKCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZk
cy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZkcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9vYWt0cmFpbF9sdmRzLmMKPiBpbmRleCA3MzkwNDAzZWExYjcuLjU4MmUwOTU5
NzUwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL29ha3RyYWlsX2x2ZHMu
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvb2FrdHJhaWxfbHZkcy5jCj4gQEAgLTEx
Nyw2ICsxMTcsNyBAQCBzdGF0aWMgdm9pZCBvYWt0cmFpbF9sdmRzX21vZGVfc2V0KHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwKPgo+ICAgICAgICAgaWYgKCFjb25uZWN0b3IpIHsKPiAgICAg
ICAgICAgICAgICAgRFJNX0VSUk9SKCJDb3VsZG4ndCBmaW5kIGNvbm5lY3RvciB3aGVuIHNldHRp
bmcgbW9kZSIpOwo+ICsgICAgICAgICAgICAgICBnbWFfcG93ZXJfZW5kKGRldik7Cj4gICAgICAg
ICAgICAgICAgIHJldHVybjsKPiAgICAgICAgIH0KPgo+IC0tCj4gMi4yNC4wCj4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
