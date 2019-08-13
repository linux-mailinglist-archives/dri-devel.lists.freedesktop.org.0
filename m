Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7098AE0F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2019 06:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FB46E62E;
	Tue, 13 Aug 2019 04:48:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F11C6E62E
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2019 04:48:35 +0000 (UTC)
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 39CA02063F;
 Tue, 13 Aug 2019 04:48:35 +0000 (UTC)
MIME-Version: 1.0
In-Reply-To: <20190812182421.141150-18-brendanhiggins@google.com>
References: <20190812182421.141150-1-brendanhiggins@google.com>
 <20190812182421.141150-18-brendanhiggins@google.com>
Subject: Re: [PATCH v12 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
From: Stephen Boyd <sboyd@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, jpoimboe@redhat.com, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, peterz@infradead.org,
 robh@kernel.org, shuah@kernel.org, tytso@mit.edu,
 yamada.masahiro@socionext.com
User-Agent: alot/0.8.1
Date: Mon, 12 Aug 2019 21:48:34 -0700
Message-Id: <20190813044835.39CA02063F@mail.kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565671715;
 bh=QXx95JHQavFYmhBtK1amQ05YmO13U6KK6dWrKZHkLVg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HqHG6DVdhoJuM67UdsQm4CKi7hZ76pLPnud+IQ9JNeG+t8SspwZa69JSEK0WhP2jx
 MB6WQ6phReCL9+EDNtamsG4EDw0rkn3WsdfnKLG2XauGMgWk9vTSsf0wDQ3tqxtnUv
 rFaB41ZSUHZ1K3scmbrjGVepNYJ05Vx4fNyYgqI0=
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
 Brendan Higgins <brendanhiggins@google.com>, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, linux-kselftest@vger.kernel.org,
 linux-nvdimm@lists.01.org, khilman@baylibre.com, knut.omang@oracle.com,
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com,
 Iurii Zaikin <yzaikin@google.com>, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBCcmVuZGFuIEhpZ2dpbnMgKDIwMTktMDgtMTIgMTE6MjQ6MjApCj4gRnJvbTogSXVy
aWkgWmFpa2luIDx5emFpa2luQGdvb2dsZS5jb20+Cj4gCj4gS1VuaXQgdGVzdHMgZm9yIGluaXRp
YWxpemVkIGRhdGEgYmVoYXZpb3Igb2YgcHJvY19kb2ludHZlYyB0aGF0IGlzCj4gZXhwbGljaXRs
eSBjaGVja2VkIGluIHRoZSBjb2RlLiBJbmNsdWRlcyBiYXNpYyBwYXJzaW5nIHRlc3RzIGluY2x1
ZGluZwo+IGludCBtaW4vbWF4IG92ZXJmbG93Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEl1cmlpIFph
aWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lu
cyA8YnJlbmRhbmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1I
YXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiBSZXZpZXdlZC1ieTogTG9nYW4g
R3VudGhvcnBlIDxsb2dhbmdAZGVsdGF0ZWUuY29tPgo+IEFja2VkLWJ5OiBMdWlzIENoYW1iZXJs
YWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KPiAtLS0KClJldmlld2VkLWJ5OiBTdGVwaGVuIEJveWQg
PHNib3lkQGtlcm5lbC5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
