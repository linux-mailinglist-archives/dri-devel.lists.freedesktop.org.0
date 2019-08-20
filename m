Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603DC9675E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 19:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8037389BEC;
	Tue, 20 Aug 2019 17:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7AE89BEC
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 17:24:49 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4D3702054F;
 Tue, 20 Aug 2019 17:24:46 +0000 (UTC)
Subject: Re: [PATCH v13 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, sboyd@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
References: <20190814055108.214253-1-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <5b880f49-0213-1a6e-9c9f-153e6ab91eeb@kernel.org>
Date: Tue, 20 Aug 2019 11:24:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814055108.214253-1-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566321889;
 bh=32bftUSKN3Wtl2ZUSwOigociAvrqIpLWLd4sbLVVuNs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mNf7pt3nluqjn7wPRl9oxtXsVnuSZaSCBUZomyCyPzzn86pMm1C66eV2ovN537fzs
 twDIX2TwIIhksR2hUFeG2rerO7ZyNg5kILiIjocQMh8JrJt3TqkiQ7ehTmVji22V5G
 ZtcCI3OBDRsHFfQ2uCdN2ixEmqYcj9rmuODIJfnw=
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, amir73il@gmail.com,
 dri-devel@lists.freedesktop.org, Alexander.Levin@microsoft.com,
 linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xMy8xOSAxMTo1MCBQTSwgQnJlbmRhbiBIaWdnaW5zIHdyb3RlOgo+ICMjIFRMO0RSCj4g
Cj4gVGhpcyByZXZpc2lvbiBhZGRyZXNzZXMgY29tbWVudHMgZnJvbSBTdGVwaGVuIGFuZCBCam9y
biBIZWxnYWFzLiBNb3N0Cj4gY2hhbmdlcyBhcmUgcHJldHR5IG1pbm9yIHN0dWZmIHRoYXQgZG9l
c24ndCBhZmZlY3QgdGhlIEFQSSBpbiBhbnl3YXkuCj4gT25lIHNpZ25pZmljYW50IGNoYW5nZSwg
aG93ZXZlciwgaXMgdGhhdCBJIGFkZGVkIHN1cHBvcnQgZm9yIGZyZWVpbmcKPiBrdW5pdF9yZXNv
dXJjZSBtYW5hZ2VkIHJlc291cmNlcyBiZWZvcmUgdGhlIHRlc3QgY2FzZSBpcyBmaW5pc2hlZCB2
aWEKPiBrdW5pdF9yZXNvdXJjZV9kZXN0cm95KCkuIEFkZGl0aW9uYWxseSwgQmpvcm4gcG9pbnRl
ZCBvdXQgdGhhdCBJIGJyb2tlCj4gS1VuaXQgb24gY2VydGFpbiBjb25maWd1cmF0aW9ucyAobGlr
ZSB0aGUgZGVmYXVsdCBvbmUgZm9yIHg4Niwgd2hvb3BzKS4KPiAKPiBCYXNlZCBvbiBTdGVwaGVu
J3MgZmVlZGJhY2sgb24gdGhlIHByZXZpb3VzIGNoYW5nZSwgSSB0aGluayB3ZSBhcmUKPiBwcmV0
dHkgY2xvc2UuIEkgYW0gbm90IGV4cGVjdGluZyBhbnkgc2lnbmlmaWNhbnQgY2hhbmdlcyBmcm9t
IGhlcmUgb24KPiBvdXQuCj4gCgpIaSBCcmVuZGFuLAoKSSBmb3VuZCBjaGVja3BhdGNoIGVycm9y
cyBpbiBvbmUgb3IgdHdvIHBhdGNoZXMuIENhbiB5b3UgZml4IHRob3NlIGFuZApzZW5kIHYxNC4K
CnRoYW5rcywKLS0gU2h1YWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
