Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB1314712
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2710897FF;
	Mon,  6 May 2019 09:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50850897FF
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:04:02 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j9so8239738oie.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2019 02:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w3CwerUbOgOXXiCSnS9RlnGeZVnQdj5otMQLyftCR5U=;
 b=oYpnhHO06IvUK7wKhqBMcVbCsTgHhQTUqQPWOvAPC0OOLZYkAl4HvWbVX7PBuNZcjC
 eC3fHL+TsPaBQIkbiHho+9hB+eEakpFv7NIbX+bBlQ/ZKJAEFSaZXUMp79VmfJT6T2KG
 Ski2HRSzzoMw1xElWYqrEtq2fA6SmoBRMl0jBa6N/Ta1L1/2y1GP4x4oIbVf0RAA4auG
 vZGoSRqnUSab1l8JTmLxqkBNd0tOuC/IsViPdVhmqKRESN4nRHjIhRDzROJe9V/Z09eh
 FPBMVh2aIEX/4rABuWnTlMhdPshO+VnV19jpTznrl6a2jnjpuz+1+qQ+u8QBXA9teBbi
 Oukw==
X-Gm-Message-State: APjAAAWdDf1Cug1yUVdcLo9GteEl8MbP0IjEZ6Osid6QMeCeB117weMK
 zJbflqXhQ4axsxr3N8n4bPaxh3Mjyjculq6hMReL7Q==
X-Google-Smtp-Source: APXvYqwEoyQ/+gdbpiq96mf1vlv5hUoY2bhtp6ecuZwu3ufRDNiX4lPMqoN7zAZpCfyk7yZAb5CAmenmXz4Vrtgwk5I=
X-Received: by 2002:aca:d4cf:: with SMTP id l198mr457112oig.137.1557133441163; 
 Mon, 06 May 2019 02:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190501230126.229218-1-brendanhiggins@google.com>
 <20190501230126.229218-12-brendanhiggins@google.com>
 <8c37fd20-859c-9c34-4465-8adfcfdaab09@kernel.org>
In-Reply-To: <8c37fd20-859c-9c34-4465-8adfcfdaab09@kernel.org>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Mon, 6 May 2019 02:03:49 -0700
Message-ID: <CAFd5g44q3qyahykujDzOoO01DwGMUm+Kce-tOAzSW90U4mQM7w@mail.gmail.com>
Subject: Re: [PATCH v2 11/17] kunit: test: add test managed resource tests
To: shuah <shuah@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=w3CwerUbOgOXXiCSnS9RlnGeZVnQdj5otMQLyftCR5U=;
 b=e+nL3WusVlSphHxBUuOnwpeLcTbcxkM3d0tJwFVnHeQxPP67ruHIlvq20gXdKZhu2H
 bB9lDEUqhP1wiSu91mOioGKtT4ycBoUxoh4FC+hVoBp2F1BbODAaUF2mKyUrYhOAKqit
 T2YBO051njEtXYukqn8B+THQu9IDpG8A3FVKKTOi4pDJ7oz0d7KTjVHPE8z2o4ACwsE9
 ykptic7rc2BJziW9//fZQROuPUNapGoh5nZURetTsM9RFF/vX1CnGbAUdl8YpJIBiHYh
 HGrZrCbs8q8pyJ0vRF0MLBvicTMU2fCeAXdJWGTYB+VAAWlNl7nlXw7CpLz/tNO1+YWN
 PWrQ==
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
Cc: Petr Mladek <pmladek@suse.com>, linux-doc@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Sasha Levin <Alexander.Levin@microsoft.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linux-kselftest@vger.kernel.org,
 Frank Rowand <frowand.list@gmail.com>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, Kevin Hilman <khilman@baylibre.com>,
 Knut Omang <knut.omang@oracle.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>, wfg@linux.intel.com,
 Joel Stanley <joel@jms.id.au>, David Rientjes <rientjes@google.com>,
 Jeff Dike <jdike@addtoit.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 devicetree <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Bird,
 Timothy" <Tim.Bird@sony.com>, Avinash Kondareddy <akndr41@gmail.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Dan Williams <dan.j.williams@intel.com>,
 kunit-dev@googlegroups.com, Richard Weinberger <richard@nod.at>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Kees Cook <keescook@google.com>,
 linux-fsdevel@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBNYXkgMywgMjAxOSBhdCA3OjM0IEFNIHNodWFoIDxzaHVhaEBrZXJuZWwub3JnPiB3
cm90ZToKPgo+IE9uIDUvMS8xOSA1OjAxIFBNLCBCcmVuZGFuIEhpZ2dpbnMgd3JvdGU6Cj4gPiBG
cm9tOiBBdmluYXNoIEtvbmRhcmVkZHkgPGFrbmRyNDFAZ21haWwuY29tPgo+ID4KPiA+IFRlc3Rz
IGhvdyB0ZXN0cyBpbnRlcmFjdCB3aXRoIHRlc3QgbWFuYWdlZCByZXNvdXJjZXMgaW4gdGhlaXIg
bGlmZXRpbWUuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQXZpbmFzaCBLb25kYXJlZGR5IDxha25k
cjQxQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEJyZW5kYW4gSGlnZ2lucyA8YnJlbmRh
bmhpZ2dpbnNAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+Cj4gSSB0aGluayB0aGlzIGNoYW5nZSBsb2cg
Y291bGQgdXNlIG1vcmUgZGV0YWlscy4gSXQgaXMgdmFndWUgb24gd2hhdCBpdAo+IGRvZXMuCgpB
Z3JlZWQuIFdpbGwgZml4IGluIG5leHQgcmV2aXNpb24uCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
