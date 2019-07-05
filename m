Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3535E60C9F
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344D26E556;
	Fri,  5 Jul 2019 20:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC726E556
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 20:45:58 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id f25so4755207pgv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 13:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=x4GIgI5QbQFYYHeADDS48yN0XwXbMzJsu3FTa+FaXcs=;
 b=MeC+OcvY+LFh5sdC9pMvzcS+tEn8+MMDd7PSm6o9DR5e+C6xIulB4UWmR1gabnGJC8
 00cNW5mafxbTJEklxKaNnwx2OOOS/rLQm4xLQUEplKtQzDbCr2Nmsr8lyDR6p6pp8dmg
 j8gU+erUGHSay7/GsMCsjn8GPzGpBGcHRTDQ1k8ffz5g83bY0K5PdF1DDRMO1ckfzYCy
 OYuyCEbKdqgYx6c+nCEnDOUv+7Gg+94eB/H+vwld2i47UEF+fNBtACi1GM0a80oKEmXy
 8pWivdJYMCGGxowXbqrxziAi5Rqbe6l0a5tWAJ7KuZOP34RjVHvfWWxtdrmBZkV2V1Be
 M1+g==
X-Gm-Message-State: APjAAAUmVFIP43T3LdoXtyFx5WnII7cbGUJ8afV84++V22jYvBwIl0+O
 0MJudH9S6BfmV1oviwHBxPw=
X-Google-Smtp-Source: APXvYqzeFsCVF2ZvnbfqZHx8vhkEXe3aUADAaqpXImPQcsaBURcoZTbfCuqJiBja1aAbbmI4GIuc+A==
X-Received: by 2002:a63:e018:: with SMTP id e24mr7383945pgh.361.1562359558392; 
 Fri, 05 Jul 2019 13:45:58 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id s66sm13955192pgs.39.2019.07.05.13.45.56
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:45:57 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 9151F40190; Fri,  5 Jul 2019 20:45:56 +0000 (UTC)
Date: Fri, 5 Jul 2019 20:45:56 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 17/18] kernel/sysctl-test: Add null pointer test for
 sysctl.c:proc_dointvec()
Message-ID: <20190705204556.GD19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-18-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-18-brendanhiggins@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: pmladek@suse.com, linux-doc@vger.kernel.org, peterz@infradead.org,
 amir73il@gmail.com, dri-devel@lists.freedesktop.org,
 Alexander.Levin@microsoft.com, yamada.masahiro@socionext.com,
 mpe@ellerman.id.au, linux-kselftest@vger.kernel.org, shuah@kernel.org,
 linux-nvdimm@lists.01.org, frowand.list@gmail.com, knut.omang@oracle.com,
 kieran.bingham@ideasonboard.com, wfg@linux.intel.com, joel@jms.id.au,
 rientjes@google.com, Iurii Zaikin <yzaikin@google.com>, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, jpoimboe@redhat.com,
 kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at, sboyd@kernel.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MzY6MTRQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IEZyb206IEl1cmlpIFphaWtpbiA8eXphaWtpbkBnb29nbGUuY29tPgo+IAo+IEtV
bml0IHRlc3RzIGZvciBpbml0aWFsaXplZCBkYXRhIGJlaGF2aW9yIG9mIHByb2NfZG9pbnR2ZWMg
dGhhdCBpcwo+IGV4cGxpY2l0bHkgY2hlY2tlZCBpbiB0aGUgY29kZS4gSW5jbHVkZXMgYmFzaWMg
cGFyc2luZyB0ZXN0cyBpbmNsdWRpbmcKPiBpbnQgbWluL21heCBvdmVyZmxvdy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBJdXJpaSBaYWlraW4gPHl6YWlraW5AZ29vZ2xlLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBCcmVuZGFuIEhpZ2dpbnMgPGJyZW5kYW5oaWdnaW5zQGdvb2dsZS5jb20+Cj4gUmV2aWV3
ZWQtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4g
UmV2aWV3ZWQtYnk6IExvZ2FuIEd1bnRob3JwZSA8bG9nYW5nQGRlbHRhdGVlLmNvbT4KCkFja2Vk
LWJ5OiBMdWlzIENoYW1iZXJsYWluIDxtY2dyb2ZAa2VybmVsLm9yZz4KCiAgTHVpcwpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
