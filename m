Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC0539A9B
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 05:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3919389213;
	Sat,  8 Jun 2019 03:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4182889214
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2019 03:59:20 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u22so2240679pfm.3
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Jun 2019 20:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rJIAAqD1NAp4Th9vkRNxbBLJIPc3y8ChkLIZvf3dmAk=;
 b=ei0nxYsvreheANnm4Z89aW7D/UmCjmHIbfTxlrnkIyjXySFAWuq/ZQ63qTcQPIamFQ
 Nt+0I1sQo5nF2VsaNhq0P1Z3HFCOLqZFqGTf3Y/COv03aUYdVR963qmpuPB1d12jdebZ
 vSWzE79N2gJMqOi4zrorEot1GHV8baozEYaNbjAid0+mVPHKeonC8KT81kGXqlOaptVR
 B9nB2mv8jJW715/sGuqSsyRRRGP78YIVN7RZRQ7TfCJqtBrTx4WrSzrr4DmXRPZQpPRA
 uuchfpsWJLXkzYJcXqxbuC7wWZuF5d5y3sBkip+uHxEDprKEv0T+OkAGzMr9NI+k3AgZ
 q12w==
X-Gm-Message-State: APjAAAUDI9VE190+N56MHj7/X1pQC0jVBA8WYB0Fn9t7gPNbOxNUHHFC
 RJxLhZ8qBL2VrsXHVpsyRoizaA==
X-Google-Smtp-Source: APXvYqwFvS5ZtgK4hv3bppgp+xNWkWaUdmJ6Dck4NUo25EMo4bji/jhdzX5h+4T1rhnDZmDRvB93qA==
X-Received: by 2002:a17:90a:aa85:: with SMTP id
 l5mr8851590pjq.69.1559966359909; 
 Fri, 07 Jun 2019 20:59:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id o70sm4127428pfo.33.2019.06.07.20.59.18
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Jun 2019 20:59:19 -0700 (PDT)
Date: Fri, 7 Jun 2019 20:59:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Andrey Konovalov <andreyknvl@google.com>
Subject: Re: [PATCH v16 06/16] mm, arm64: untag user pointers in mm/gup.c
Message-ID: <201906072059.7D80BA0@keescook>
References: <cover.1559580831.git.andreyknvl@google.com>
 <e1f6d268135f683fd70c2af27e75f694d7ffaf48.1559580831.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e1f6d268135f683fd70c2af27e75f694d7ffaf48.1559580831.git.andreyknvl@google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=rJIAAqD1NAp4Th9vkRNxbBLJIPc3y8ChkLIZvf3dmAk=;
 b=U7O6NbXBNIeRlPVLj5xwiYB9yIq5HbXkmt1o7eZLIHcCi1sfFtD4pKc4GGOrbqMYRh
 sgIk+ERejfY1WzlSSBSK2Vn9ctskkWUfC7d9RXEYuV+TF3EleJl2nI9tZYJCJJbjZfXj
 ev4abqGBRmVAB5Xa6TnqWXyvladDJfFjes7a4=
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
Cc: Mark Rutland <mark.rutland@arm.com>, kvm@vger.kernel.org,
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Khalid Aziz <khalid.aziz@oracle.com>, linux-kselftest@vger.kernel.org,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 linux-rdma@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dmitry Vyukov <dvyukov@google.com>, Dave Martin <Dave.Martin@arm.com>,
 Evgeniy Stepanov <eugenis@google.com>, linux-media@vger.kernel.org,
 Kevin Brodsky <kevin.brodsky@arm.com>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Kostya Serebryany <kcc@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>, linux-kernel@vger.kernel.org,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDY6NTU6MDhQTSArMDIwMCwgQW5kcmV5IEtvbm92YWxv
diB3cm90ZToKPiBUaGlzIHBhdGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMg
YXJtNjQga2VybmVsIEFCSSB0byBhbGxvdyB0bwo+IHBhc3MgdGFnZ2VkIHVzZXIgcG9pbnRlcnMg
KHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcgZWxzZSBvdGhlcgo+IHRoYW4gMHgw
MCkgYXMgc3lzY2FsbCBhcmd1bWVudHMuCj4gCj4gbW0vZ3VwLmMgcHJvdmlkZXMgYSBrZXJuZWwg
aW50ZXJmYWNlIHRoYXQgYWNjZXB0cyB1c2VyIGFkZHJlc3NlcyBhbmQKPiBtYW5pcHVsYXRlcyB1
c2VyIHBhZ2VzIGRpcmVjdGx5IChmb3IgZXhhbXBsZSBnZXRfdXNlcl9wYWdlcywgdGhhdCBpcyB1
c2VkCj4gYnkgdGhlIGZ1dGV4IHN5c2NhbGwpLiBTaW5jZSBhIHVzZXIgY2FuIHByb3ZpZGVkIHRh
Z2dlZCBhZGRyZXNzZXMsIHdlIG5lZWQKPiB0byBoYW5kbGUgdGhpcyBjYXNlLgo+IAo+IEFkZCB1
bnRhZ2dpbmcgdG8gZ3VwLmMgZnVuY3Rpb25zIHRoYXQgdXNlIHVzZXIgYWRkcmVzc2VzIGZvciB2
bWEgbG9va3Vwcy4KPiAKPiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlr
bnZsQGdvb2dsZS5jb20+CgpSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0BjaHJvbWl1
bS5vcmc+CgotS2VlcwoKPiAtLS0KPiAgbW0vZ3VwLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5j
Cj4gaW5kZXggZGRkZTA5N2NmOWU0Li5jMzdkZjNkNDU1YTIgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3Vw
LmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC04MDIsNiArODAyLDggQEAgc3RhdGljIGxvbmcgX19n
ZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdGFza19zdHJ1Y3QgKnRzaywgc3RydWN0IG1tX3N0cnVjdCAq
bW0sCj4gIAlpZiAoIW5yX3BhZ2VzKQo+ICAJCXJldHVybiAwOwo+ICAKPiArCXN0YXJ0ID0gdW50
YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJVk1fQlVHX09OKCEhcGFnZXMgIT0gISEoZ3VwX2Zs
YWdzICYgRk9MTF9HRVQpKTsKPiAgCj4gIAkvKgo+IEBAIC05NjQsNiArOTY2LDggQEAgaW50IGZp
eHVwX3VzZXJfZmF1bHQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLAo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gIAl2bV9mYXVsdF90IHJldCwg
bWFqb3IgPSAwOwo+ICAKPiArCWFkZHJlc3MgPSB1bnRhZ2dlZF9hZGRyKGFkZHJlc3MpOwo+ICsK
PiAgCWlmICh1bmxvY2tlZCkKPiAgCQlmYXVsdF9mbGFncyB8PSBGQVVMVF9GTEFHX0FMTE9XX1JF
VFJZOwo+ICAKPiAtLSAKPiAyLjIyLjAucmMxLjMxMS5nNWQ3NTczYTE1MS1nb29nCj4gCgotLSAK
S2VlcyBDb29rCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
