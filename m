Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70780CEBCA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 20:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9549D6E149;
	Mon,  7 Oct 2019 18:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 393746E149
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 18:28:55 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r2so9974517lfn.8
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2019 11:28:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FvtqkEan1ZkFtYbeA8YiibFmBMRN4yk0NT1pJkGguxU=;
 b=EBrDzi2/oY7yxPhnfQFr7c9L2+lZZ0AId6xWODd5QGMyW8BxyUMg0R3H+JuTX7HuXA
 jzUu8Y1NyNLydaDKgxdwjJCSoAiSTvBojXe5xNuvLlC4Ysovo/YK/PCYE2Pg+15IVdG7
 n3xHqFfPNrMAf/DxgYB2VQP1HAbp5uUrtkZxGRuVQ+MDCHm51GDPiv+qFGm+kT/kbvbM
 Kbn3IpvS4iO5LpcB2mUdVZxNaAKaLCt3IEGEkxeOEnRfQ7NSTxdJUO0ugR/vFf6jWbIR
 wzS5SHFgxN2xkV/1DfaUTViIqb4meT9KPqrTt8ZnmpNNJFlwhN9BvNji9pa2Acdcu/N0
 lnHw==
X-Gm-Message-State: APjAAAVysjvYFykXwCEILgCaq8cX8lU118c/JGdnSAcaCEKYJAHj+7Jh
 5YHfFp3IDg5FsRB15W642BNVvwnFiPACz2sw26vOedG67So=
X-Google-Smtp-Source: APXvYqwv3nObKiu0NXipQ1vS2k+EljFq/NVizO81krNPaXa8SNIsUElJ10daM9vHEy98wC45TLIoUXEz8Tr6dvdJ9Bw=
X-Received: by 2002:ac2:4a89:: with SMTP id l9mr10789801lfp.122.1570472933345; 
 Mon, 07 Oct 2019 11:28:53 -0700 (PDT)
MIME-Version: 1.0
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
 <871rvopgjj.fsf@keithp.com>
In-Reply-To: <871rvopgjj.fsf@keithp.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 7 Oct 2019 19:28:38 +0100
Message-ID: <CAPj87rNdxxUX8P=mVe+EVCSXJ5-YcJWXdUHbQJpHO+2ewK0zqw@mail.gmail.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
To: Keith Packard <keithp@keithp.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=FvtqkEan1ZkFtYbeA8YiibFmBMRN4yk0NT1pJkGguxU=;
 b=ztgC4NXKgj/i5ZZTGLwAdju9RN0lYSKM+J6SyDA67Fjkh1lzczfTfOvP5NM/1apiR1
 SPU0xQOuQvTcwI97oI2amD9RDXZxKk+Bq2GDI+UjTZSq487gL64xSI9QpyY5ySu3j/cj
 GT/ihacUn4r+ONl13gTJ6u1UTXYt7e18t6M8T1qgKISl26f8At7oh0eY+fFG5fpF1MjC
 SHETAr4Xl0jKmsH0Fi8uLHr5AiFqGSQghWXKVePERD4J0KJqTUiVVkT1sR0VD1p0yqiM
 Lid8TN6yPnq4kQHv8wmej4YS7ICHPX/ieQ65vI6J3Z8AKu8N7E4dQcYvbn+HrkZN1vQS
 6h1g==
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCA3IE9jdCAyMDE5IGF0IDE5OjE2LCBLZWl0aCBQYWNrYXJkIDxrZWl0aHBAa2VpdGhw
LmNvbT4gd3JvdGU6Cj4gRGFuaWVsIFN0b25lIDxkYW5pZWxAZm9vaXNoYmFyLm9yZz4gd3JpdGVz
Ogo+ID4gSSB0aGluayB0aGVyZSB3b3VsZCBiZSBhIGxvYWQgb2YgdmFsdWUgaW4gc3RhcnRpbmcg
d2l0aCBzaW1wbGUgaGVscGVycwo+ID4gd2hpY2ggY2FuIGJlIHVzZWQgaW5kZXBlbmRlbnRseSBv
ZiBhbnkgbGFyZ2VyIHNjaGVtZSwgdGFja2xpbmcgdGhhdAo+ID4gbGlzdCBhYm92ZS4KPgo+IFll
YWgsIGEgaGVscGVyIGxpYnJhcnkgdGhhdCBkaWRuJ3QgZW5mb3JjZSBhdCB0b25uZSBvZiBwb2xp
Y3kgYW5kIGp1c3QKPiBsZXQgdGhlIHVzZXIgZ2x1ZSB0aGluZ3MgdG9nZXRoZXIgb24gdGhlaXIg
b3duIGlzIHByb2JhYmx5IGdvaW5nIHRvIGJlCj4gbW9yZSBnZW5lcmFsbHkgdXNhYmxlIGJ5IGV4
aXN0aW5nIGFuZCBuZXcgc3lzdGVtcy4KPgo+IEkgZGVmaW5pdGVseSBsaWtlIHRoZSBpZGVhIG9m
IHN0ZWFsaW5nIHRoZSBiZXN0IHBhcnRzIG9mIGFsbCBleGlzdGluZwo+IHN5c3RlbXMgYW5kIHRy
eWluZyB0byBtYWtlIHRoZW0gd29yayB0b2dldGhlci4KPgo+IEhvdyBtYW55IGxpYnJhcmllcyB3
ZSBlbmQgdXAgd2l0aCBpc24ndCBuZWFybHkgYXMgaW1wb3J0YW50IHRvIG1lIGFzCj4gbWFraW5n
IHN1cmUgdGhleSB3b3JrIHdlbGwgdG9nZXRoZXI7IGNvbW1vbiBkYXRhIHR5cGVzLCBzaW1pbGFy
IHN0eWxlLAo+IGV0Yy4KClllYWgsIHRvdGFsbHkgQU9MLgoKQ2hlZXJzLApEYW5pZWwKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
