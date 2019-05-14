Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5BB1C384
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 08:57:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32162891E1;
	Tue, 14 May 2019 06:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63D7891E1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 06:57:28 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQRMj-0002fe-RX; Tue, 14 May 2019 06:56:46 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 9F1E72029F87A; Tue, 14 May 2019 08:56:43 +0200 (CEST)
Date: Tue, 14 May 2019 08:56:43 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v3 08/18] objtool: add kunit_try_catch_throw to the
 noreturn list
Message-ID: <20190514065643.GC2589@hirez.programming.kicks-ass.net>
References: <20190514054251.186196-1-brendanhiggins@google.com>
 <20190514054251.186196-9-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190514054251.186196-9-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v6APzDCScyQRGBUkB7LKS/TbLCe8zxe216BVyYqK3ns=; b=RF2Lq0gfAM4omh5yrcevmJcVC
 ZUkrfPEy9aQM9id/jJJWAZOURvPYMFDcmoO3MoAh3BPSsiihL7g05UP5KRY3E43AcCvrGgVBL5DGM
 GwGXgqAf8drGPoBXMbgsJcYnOKoGK/xxPPKsPdIk0q24oj68lr7LkXgBGu20PUJw8vgrMYfI0b0ai
 0q7aIdfi+1HQBEXB/OhXVr77sKFYoIui69swPHN1UUAqUy48HssgvHEiwHZgAqjnYlMQwCIE9rTXq
 sYqILbYIekuTXBMuFfkorK2wKBbKk82Xz5be3Su/MHXyHQRfMpWahH6khzp2m/rQ8lsL0tdiJ2UX1
 oksjnH9/Q==;
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
 yamada.masahiro@socionext.com, mpe@ellerman.id.au,
 linux-kselftest@vger.kernel.org, shuah@kernel.org,
 kbuild test robot <lkp@intel.com>, linux-nvdimm@lists.01.org,
 frowand.list@gmail.com, knut.omang@oracle.com, kieran.bingham@ideasonboard.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr,
 Josh Poimboeuf <jpoimboe@redhat.com>, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mcgrof@kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMTMsIDIwMTkgYXQgMTA6NDI6NDJQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IFRoaXMgZml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHNlZW4gb24gR0NDIDcu
MzoKPiAgIGt1bml0L3Rlc3QtdGVzdC5vOiB3YXJuaW5nOiBvYmp0b29sOiBrdW5pdF90ZXN0X3Vu
c3VjY2Vzc2Z1bF90cnkoKSBmYWxscyB0aHJvdWdoIHRvIG5leHQgZnVuY3Rpb24ga3VuaXRfdGVz
dF9jYXRjaCgpCj4gCgpXaGF0IGlzIHRoYXQgZmlsZSBhbmQgZnVuY3Rpb247IG5vIGtlcm5lbCB0
cmVlIG5lYXIgbWUgc2VlbXMgdG8gaGF2ZQp0aGF0LgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
