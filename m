Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F5B5993B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 13:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2776E8DF;
	Fri, 28 Jun 2019 11:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82EC6E8DF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 11:27:28 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so10489943eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 04:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OwUNS7bDjumWiSTyiZRQUBU3L9i8rwmzwl5ZRrFG7qc=;
 b=ccybIO5V8vFD2jEvHAnj1LoTpY6PO4q9V3HRI9R+xy36WuXdFF882Rs17CtblUgHRu
 P3s0OOHGAN/KsfHlF3qjpnsS3fbVw81KZZUEPCQQw/UYikOxiytraCBGA0LNM/PaJLTf
 ikPFrre3ESKDW3qxeJ+SRS6lVO/XLoQ1/pP10rOihqE+VKnVwgs8SY2c2CzG5y5Wfmuv
 jQ9lKctdBb49gSmm5eHVT8VoC/sQtVRegzG1F4IKuEEjheLwnnTah6yUhOmfnwECrED5
 lzT5Wv0nHBSiJgp99tKD8jtSSj9lV1JXPREOj7gi/J/rDxK2Zwypl2TIFVGQTppmbtbB
 HRPA==
X-Gm-Message-State: APjAAAXsI+wFqhMThP+a4Z+JtJZpVD2YpaPKzUKw2kndUCkK7fBGTbaM
 1BnYrx8TFiXsxRSOJ57JJ09s8XLW
X-Google-Smtp-Source: APXvYqyHSqnRr/m5ui03JFd2MW8F18PVoDNxSYmGnCmcTpyRQWPi7l3pAn7LQP3PQB9vw/lZ53ltUg==
X-Received: by 2002:a17:906:4950:: with SMTP id
 f16mr7910812ejt.259.1561721247307; 
 Fri, 28 Jun 2019 04:27:27 -0700 (PDT)
Received: from aurora.visucore.com (92-110-144-95.cable.dynamic.v4.ziggo.nl.
 [92.110.144.95])
 by smtp.gmail.com with ESMTPSA id d44sm602717eda.75.2019.06.28.04.27.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 28 Jun 2019 04:27:26 -0700 (PDT)
Date: Fri, 28 Jun 2019 13:27:24 +0200
From: "Wladimir J. van der Laan" <laanwj@gmail.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH libdrm] etnaviv: Use hash table to track BO indexes
Message-ID: <20190628112724.s6nbxnsg3kdeimal@aurora.visucore.com>
References: <20190603233929.23048-1-marex@denx.de>
 <20190627150924.oh6mf2roech6khkc@aurora.visucore.com>
 <99fd92da-d608-f399-0dcc-78e4428a93b9@denx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <99fd92da-d608-f399-0dcc-78e4428a93b9@denx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OwUNS7bDjumWiSTyiZRQUBU3L9i8rwmzwl5ZRrFG7qc=;
 b=te8xYJri+Xy6c7ugNT9H+fhqHndz+Gnz6sHou5nl8LoxAYUD7iLOokuSmxotFHO8G9
 Vn3IU76SVEDcHw1hr2APs3pTZhIwfK0/enVgG3ohMkUa0Uq/LOj3jDqiTW+GOmn55T6L
 JurkZvZMQSSWwOeDwERbRo9+kGkw/04uJCUEiowvBeAZN0WYfuWmAHwtRgpQmKkE8psi
 Sr0M6a73ct/ZVPgIv/FexKZ/9Nhvc+cey8ZuFPFXXxbfFL6xkvCsqh8itdx2Gv8l0bcs
 uGzNLdiFkyxeEMB2fGxGMnRSRussS7d/5d4Ts4JtaEwXts9kCWa/hWAUyLUXaXOGBMSj
 KnEA==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBNYXliZSB5b3Ugd2FudCB0byBsb29rIGF0Cj4gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Au
b3JnL21lc2EvbWVzYS9tZXJnZV9yZXF1ZXN0cy8xMTkwCj4gCj4gSSB1cGRhdGVkIHRoaXMgcGF0
Y2ggYWdhaW5zdCBtZXNhIG1hc3RlciwgYXBwYXJlbnRseSB0aGUgbGliZHJtLWV0bmF2aXYKPiBi
aXRzIHdlcmUgZm9sZGVkIGludG8gbWVzYSBub3cuCgpUaGFua3MhCgo+ID4+ICAJc3RyZWFtLT5w
aXBlID0gcGlwZTsKPiA+PiAgCXN0cmVhbS0+cmVzZXRfbm90aWZ5ID0gcmVzZXRfbm90aWZ5Owo+
ID4+ICAJc3RyZWFtLT5yZXNldF9ub3RpZnlfcHJpdiA9IHByaXY7Cj4gPj4gKwlzdHJlYW0tPnNl
cW5vID0gKytkZXYtPnN0cmVhbV9jbnQ7Cj4gPiAKPiA+IERvIHdlIGhhdmUgdG8gY2F0Y2ggaW50
ZWdlciBvdmVyZmxvdyBoZXJlPwo+ID4gSXQncyB2ZXJ5IHVubGlrZWx5IGZvciB0aGVyZSB0byBo
YXZlIGJlZW4gMl4zMiBzdHJlYW1zLCBidXQgaWYgaXQgaGFwcGVucyBpdCBtaWdodCBiZSBnb29k
IHRvIGF0IGxlYXN0Cj4gPiB3YXJuLgo+IAo+IEkgZG9uJ3QgdGhpbmsgc28uCj4gCj4gSWYgeW91
IGFsbG9jYXRlZCAoMl4obWFjaGluZSB3b3JkIHNpemUpKS0xIHN0cmVhbXMsIHlvdSB3b3VsZCBl
eGhhdXN0Cj4geW91ciBtZW1vcnkgbG9uZyBiZWZvcmUgdGhhdC4gQW5kIHRoaXMgY2FuIGFjdHVh
bGx5IHJvbGwgb3Zlciwgc2luY2UgaWYKPiB5b3Ugd2VyZSB0byBhbGxvY2F0ZSBzdHJlYW1zIG9u
ZSBhZnRlciB0aGUgb3RoZXIgYW5kIHRoZW4gZnJlZSB0aGVtLAo+IHRoZWlyIG51bWJlcnMgd291
bGQganVzdCBpbmNyZW1lbnQgd2l0aG91dCBjb2xsaWRpbmcuCj4gCj4gSSBndWVzcyB3aGF0IGNv
dWxkIGhhcHBlbiBoZXJlIHdvdWxkIGJlIHNvbWV0aGluZyBsaWtlLCB5b3UgYWxsb2NhdGUKPiBz
dHJlYW0gIzAgLCB0aGVuIGFsbG9jYXRlL2ZyZWUgKDJeKG1hY2hpbmUgd29yZCBzaXplKSkgLSAy
IHN0cmVhbXMgYW5kCj4gdGhlbiBhbGxvY2F0aW5nIHRoZSAoMl4obWFjaGluZSB3b3JkIHNpemUp
KSAtIDF0aCBzdHJlYW0gd291bGQgZW5kIHVwCj4gYWxsb2NhdGluZyBuZXcgc3RyZWFtIHdpdGgg
dGhlIHNhbWUgc3RyZWFtIGNvdW50ICg/KS4KClRoaXMgaXMgdGhlIHNjZW5hcmlvIHRoYXQgSSB3
YXMgaW1hZ2luaW5nLCBpbiB3aGljaCB0d28gc2VwYXJhdGUgc3RyZWFtcyBjb3VsZApjb2xsaWRl
IHdpdGggdGhlIHNhbWUgc2VxIG5vIChyZXN1bHRpbmcgaW4gd2VpcmQgZ2xpdGNoZXMgaW4gYm8g
dHJhY2tpbmcpLCBidXQgeWVzLCBpdApzZWVtcyB2ZXJ5IHVubGlrZWx5LgoKS2luZCByZWdhcmRz
LApXbGFkaW1pcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
