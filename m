Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6BC60C98
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 22:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686306E554;
	Fri,  5 Jul 2019 20:45:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4756E554
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 20:45:40 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id q4so4757347pgj.8
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 13:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=NINMgNCtdp9VxxGck6fqsoIqX8vCQf36P/6C5pYBqDM=;
 b=ilim4SZ2qDNZmv8axF8dzJ7Y4Tmnd+7OwaWZ/pagfwGchVH90lY3ZSWBdtp7EyW19+
 IM5ve3VJeckjiueh9VVIPj0fgsRZ9HBfepbqocyhAc+9Jz2soSgg7ElwPfukTHxedle5
 Fgt6df+Y0htMEY2n/zyGlYuCTBekUHUUfwwNTGGMmfqnIy+qdTCx0fiPs/s0/dIa+ORc
 jFKdoVXStRtZop8Bb03etaMjhvTIsomGRpmjiYaqiOyX+FAA6Ue1yLgp51qaCXwBkWqh
 77Z5xoh18y6bufmNyq7kcqK+ClCbGSafzN6rDN2VRPXO3G/AODqa6vt1t6haV+0pPCxh
 yb0Q==
X-Gm-Message-State: APjAAAWnP4FIyJxG1DdV000QysPsEZeB3DQy69sgdOASkV789GD19M7m
 haDOrS9znF024Dw1wSAmjZg=
X-Google-Smtp-Source: APXvYqzORz85r9dXJ+0VShptntCI2Ba5VbMOY6v1/mI3RdkuGvkVnROUEZV4rccMgxpa1+keGNumHQ==
X-Received: by 2002:a17:90a:d58c:: with SMTP id v12mr89451pju.7.1562359539502; 
 Fri, 05 Jul 2019 13:45:39 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id b17sm14479029pgj.73.2019.07.05.13.45.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 05 Jul 2019 13:45:38 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id 9D53F40190; Fri,  5 Jul 2019 20:45:37 +0000 (UTC)
Date: Fri, 5 Jul 2019 20:45:37 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v6 02/18] kunit: test: add test resource management API
Message-ID: <20190705204537.GC19023@42.do-not-panic.com>
References: <20190704003615.204860-1-brendanhiggins@google.com>
 <20190704003615.204860-3-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190704003615.204860-3-brendanhiggins@google.com>
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
 rientjes@google.com, jdike@addtoit.com, dan.carpenter@oracle.com,
 devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, Tim.Bird@sony.com,
 linux-um@lists.infradead.org, rostedt@goodmis.org, julia.lawall@lip6.fr,
 jpoimboe@redhat.com, kunit-dev@googlegroups.com, tytso@mit.edu, richard@nod.at,
 sboyd@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, keescook@google.com,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com, khilman@baylibre.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDU6MzU6NTlQTSAtMDcwMCwgQnJlbmRhbiBIaWdnaW5z
IHdyb3RlOgo+IGRpZmYgLS1naXQgYS9rdW5pdC90ZXN0LmMgYi9rdW5pdC90ZXN0LmMKPiBpbmRl
eCBjMDMwYmE1YTQzZTQwLi5hNzBmYmU0NDllOTIyIDEwMDY0NAo+IC0tLSBhL2t1bml0L3Rlc3Qu
Ywo+ICsrKyBiL2t1bml0L3Rlc3QuYwo+IEBAIC0xMjIsNyArMTIyLDggQEAgc3RhdGljIHZvaWQg
a3VuaXRfcHJpbnRfdGVzdF9jYXNlX29rX25vdF9vayhzdHJ1Y3Qga3VuaXRfY2FzZSAqdGVzdF9j
YXNlLAo+ICAKPiAgdm9pZCBrdW5pdF9pbml0X3Rlc3Qoc3RydWN0IGt1bml0ICp0ZXN0LCBjb25z
dCBjaGFyICpuYW1lKQo+ICB7Cj4gLQlzcGluX2xvY2tfaW5pdCgmdGVzdC0+bG9jayk7CgpPbmNl
IHlvdSByZS1zcGluLCB0aGlzIGFib3ZlIGxpbmUgc2hvdWxkIGJlIHJlbW92ZWQuCgo+ICsJbXV0
ZXhfaW5pdCgmdGVzdC0+bG9jayk7Cj4gKwlJTklUX0xJU1RfSEVBRCgmdGVzdC0+cmVzb3VyY2Vz
KTsKPiAgCXRlc3QtPm5hbWUgPSBuYW1lOwo+ICAJdGVzdC0+c3VjY2VzcyA9IHRydWU7Cj4gIH0K
CiAgTHVpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
