Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6C81304A
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 16:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A257A6E7BF;
	Fri,  3 May 2019 14:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A46F6E7BF
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 14:34:43 +0000 (UTC)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net
 [24.9.64.241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 25143205ED;
 Fri,  3 May 2019 14:34:41 +0000 (UTC)
Subject: Re: [PATCH v2 11/17] kunit: test: add test managed resource tests
To: Brendan Higgins <brendanhiggins@google.com>, frowand.list@gmail.com,
 gregkh@linuxfoundation.org, keescook@google.com,
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org,
 sboyd@kernel.org
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-12-brendanhiggins@google.com>
From: shuah <shuah@kernel.org>
Message-ID: <8c37fd20-859c-9c34-4465-8adfcfdaab09@kernel.org>
Date: Fri, 3 May 2019 08:34:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501230126.229218-12-brendanhiggins@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556894083;
 bh=/MHif5okGldV0zJQO9uwxXPuEkzcX3tjHeme2xBr56I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=NQY37OjiDkyluGn7wp+DEOQ/rusC2ZYGlS4OkQ7N+lGvPlx4i/cOygGh1BvxNcmx4
 rY1AGyNGOTnMTv1qPj+ls8/RXFBM4ovpE9ABphx0LXCOgriZ0pfU6jiokQXi8WZYPY
 1sBgomiACkkAoeaTjbiQILVPV80zL82ux9sv8C8Q=
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
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 Avinash Kondareddy <akndr41@gmail.com>, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS8xLzE5IDU6MDEgUE0sIEJyZW5kYW4gSGlnZ2lucyB3cm90ZToKPiBGcm9tOiBBdmluYXNo
IEtvbmRhcmVkZHkgPGFrbmRyNDFAZ21haWwuY29tPgo+IAo+IFRlc3RzIGhvdyB0ZXN0cyBpbnRl
cmFjdCB3aXRoIHRlc3QgbWFuYWdlZCByZXNvdXJjZXMgaW4gdGhlaXIgbGlmZXRpbWUuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQXZpbmFzaCBLb25kYXJlZGR5IDxha25kcjQxQGdtYWlsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+
Cj4gLS0tCgpJIHRoaW5rIHRoaXMgY2hhbmdlIGxvZyBjb3VsZCB1c2UgbW9yZSBkZXRhaWxzLiBJ
dCBpcyB2YWd1ZSBvbiB3aGF0IGl0CmRvZXMuCgp0aGFua3MsCi0tIFNodWFoCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
