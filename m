Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530C43BF23
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 00:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443AC89144;
	Mon, 10 Jun 2019 22:08:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811328910E;
 Mon, 10 Jun 2019 22:08:13 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 317032082E;
 Mon, 10 Jun 2019 22:08:11 +0000 (UTC)
Subject: Re: [PATCH v16 16/16] selftests, arm64: add a selftest for passing
 tagged pointers to kernel
To: Kees Cook <keescook@chromium.org>, Andrey Konovalov <andreyknvl@google.com>
References: <cover.1559580831.git.andreyknvl@google.com>
 <9e1b5998a28f82b16076fc85ab4f88af5381cf74.1559580831.git.andreyknvl@google.com>
 <201906072055.7DFED7B@keescook>
From: shuah <shuah@kernel.org>
Message-ID: <2bc277f8-e67e-30e0-5824-8184c2b03237@kernel.org>
Date: Mon, 10 Jun 2019 16:08:10 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <201906072055.7DFED7B@keescook>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560204493;
 bh=e8XjUFtZMStDPYS3FRKtj43AwF2CGKnQQ24s2uVvYvo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BIlELQVmQiXsINDdVkW14pOS9K8s3Gx2mingJ1IaepHxagdpMTpD4ZzyEKsLXADQu
 LDDLzvbv2yQR2aXp8ujaMwhG5b7sVH+1JVNw3f8Wr643gACxp2ikFsJnG7lIjoeKQt
 enV0L8Nd0qyRS4RKerZLlzNTADXiWwd0A8vbWeho=
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
 Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi83LzE5IDk6NTYgUE0sIEtlZXMgQ29vayB3cm90ZToKPiBPbiBNb24sIEp1biAwMywgMjAx
OSBhdCAwNjo1NToxOFBNICswMjAwLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+PiBUaGlzIHBh
dGNoIGlzIGEgcGFydCBvZiBhIHNlcmllcyB0aGF0IGV4dGVuZHMgYXJtNjQga2VybmVsIEFCSSB0
byBhbGxvdyB0bwo+PiBwYXNzIHRhZ2dlZCB1c2VyIHBvaW50ZXJzICh3aXRoIHRoZSB0b3AgYnl0
ZSBzZXQgdG8gc29tZXRoaW5nIGVsc2Ugb3RoZXIKPj4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFy
Z3VtZW50cy4KPj4KPj4gVGhpcyBwYXRjaCBhZGRzIGEgc2ltcGxlIHRlc3QsIHRoYXQgY2FsbHMg
dGhlIHVuYW1lIHN5c2NhbGwgd2l0aCBhCj4+IHRhZ2dlZCB1c2VyIHBvaW50ZXIgYXMgYW4gYXJn
dW1lbnQuIFdpdGhvdXQgdGhlIGtlcm5lbCBhY2NlcHRpbmcgdGFnZ2VkCj4+IHVzZXIgcG9pbnRl
cnMgdGhlIHRlc3QgZmFpbHMgd2l0aCBFRkFVTFQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEFuZHJl
eSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiAKPiBJJ20gYWRkaW5nIFNodWFo
IHRvIENDIGluIGNhc2Ugc2hlIGhhcyBzb21lIHN1Z2dlc3Rpb25zIGFib3V0IHRoZSBuZXcKPiBz
ZWxmdGVzdC4KClRoYW5rcyBLZWVzLgoKPiAKPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVz
Y29va0BjaHJvbWl1bS5vcmc+Cj4gCj4gLUtlZXMKPiAKCkxvb2tzIGdvb2QgdG8gbWUuCgpBY2tl
ZC1ieTogU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz4KCnRoYW5rcywKLS0g
U2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
