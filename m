Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90696D09
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 01:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684DE6E8C9;
	Tue, 20 Aug 2019 23:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BED16E8C9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 23:20:54 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id a189so211550vkc.20
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 16:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=d/yRotIqofKL6ivNLT0spFL8C+ImKotVaARxIwjjT6U=;
 b=KNNnwhcaZJcM7j+7oT+2aE8X3eTqR23WLcCphsq1IPRDJwvdvQSB88QQKQzU9QaKsr
 CQb16r4Z6r17l29/rC9XLfUVxdhONDPMizPyXLRXlvYGxrAxUtyWjPvoj6xMlpmCH5rp
 KBr7HWXF1WxXPgMuVvT6uZHt3f0U3j0l1V4JHSv0m4WFawpyzmIJ2Dg99B9XyIdd+e20
 SP9SUY1yxx2SCUSY2pvuFrkmmMkShAXSR0kg8zFRpfmMXI8nCjh7xGyaz4pPuEBz7Arl
 Gs0Dv7a5JuVHlEZeLhmnn20Z5g20SgmVnYnDxeRqMipZOFuHHizSIYZ+c3ei3M5E8Mo1
 8HyQ==
X-Gm-Message-State: APjAAAXy4WXdR9cU7RVOqzpzU3MaEvKB2CMK060kq3oQJ9FctaUafpng
 Yi7FGFQVun2H8YJ9xsNm641yhkCQ1k7OoLGG3ohxAg==
X-Google-Smtp-Source: APXvYqxI/nPId+DHfk6D741GOqFrVhdMCpaqnV+6xqhMReBcYshk3sm1bvTSqco2NKWiElhS3+UgytqYYzLVwPw9MVYXZA==
X-Received: by 2002:a67:2605:: with SMTP id m5mr19353609vsm.120.1566343253112; 
 Tue, 20 Aug 2019 16:20:53 -0700 (PDT)
Date: Tue, 20 Aug 2019 16:20:28 -0700
Message-Id: <20190820232046.50175-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
Subject: [PATCH v14 00/18] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, jpoimboe@redhat.com, 
 keescook@google.com, kieran.bingham@ideasonboard.com, mcgrof@kernel.org, 
 peterz@infradead.org, robh@kernel.org, sboyd@kernel.org, shuah@kernel.org, 
 tytso@mit.edu, yamada.masahiro@socionext.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=d/yRotIqofKL6ivNLT0spFL8C+ImKotVaARxIwjjT6U=;
 b=AVw2bVu+4NwiDCTMe7ctCvAsytyWg/rXh1qSlFIYcZ34MZ2W4zFBX61usfUDXKDI+U
 6mkzeHkKvCm3jsXc7ellvdvzMZ/yYq5pQYIgEJEeej2GmzjldUwbhas7sVL0y1BF9R5Q
 aeLd89FDK15SPfbl+SuyrbqBs3o2uiag6LIW+dn6YgaIXzRVfITYu/qa+PVnh2pu0la1
 EgwkQGeMgeft4WVs3y+cr1sGSCDFeF0e6bPs6wefJLtZGnA3fREotyJnv1WY33ED8Kos
 PZta1YwDrJCXLZftQ0jdf7GzZQX+uUMqkEw7bGquy+vwd3aApIC+kCto7n+WJu4zEbsw
 +lOA==
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
 wfg@linux.intel.com, joel@jms.id.au, rientjes@google.com, jdike@addtoit.com,
 dan.carpenter@oracle.com, devicetree@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Tim.Bird@sony.com, linux-um@lists.infradead.org,
 rostedt@goodmis.org, julia.lawall@lip6.fr, Bjorn Helgaas <bhelgaas@google.com>,
 kunit-dev@googlegroups.com, richard@nod.at, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au,
 linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IyMgVEw7RFIKClRoaXMgcmV2aXNpb24gYWRkcmVzc2VzIGNvbW1lbnRzIGZyb20gU2h1YWggYnkg
cmVtb3ZpbmcgdHdvIG1hY3JvcyB0aGF0CndlcmUgY2F1c2luZyBjaGVja3BhdGNoIGVycm9ycy4g
Tm8gQVBJIG9yIG1ham9yIHN0cnVjdHVhbCBjaGFuZ2VzIGhhdmUKYmVlbiBtYWRlIHNpbmNlIHYx
My4KCiMjIEJhY2tncm91bmQKClRoaXMgcGF0Y2ggc2V0IHByb3Bvc2VzIEtVbml0LCBhIGxpZ2h0
d2VpZ2h0IHVuaXQgdGVzdGluZyBhbmQgbW9ja2luZwpmcmFtZXdvcmsgZm9yIHRoZSBMaW51eCBr
ZXJuZWwuCgpVbmxpa2UgQXV0b3Rlc3QgYW5kIGtzZWxmdGVzdCwgS1VuaXQgaXMgYSB0cnVlIHVu
aXQgdGVzdGluZyBmcmFtZXdvcms7Cml0IGRvZXMgbm90IHJlcXVpcmUgaW5zdGFsbGluZyB0aGUg
a2VybmVsIG9uIGEgdGVzdCBtYWNoaW5lIG9yIGluIGEgVk0KKGhvd2V2ZXIsIEtVbml0IHN0aWxs
IGFsbG93cyB5b3UgdG8gcnVuIHRlc3RzIG9uIHRlc3QgbWFjaGluZXMgb3IgaW4gVk1zCmlmIHlv
dSB3YW50WzFdKSBhbmQgZG9lcyBub3QgcmVxdWlyZSB0ZXN0cyB0byBiZSB3cml0dGVuIGluIHVz
ZXJzcGFjZQpydW5uaW5nIG9uIGEgaG9zdCBrZXJuZWwuIEFkZGl0aW9uYWxseSwgS1VuaXQgaXMg
ZmFzdDogRnJvbSBpbnZvY2F0aW9uCnRvIGNvbXBsZXRpb24gS1VuaXQgY2FuIHJ1biBzZXZlcmFs
IGRvemVuIHRlc3RzIGluIGFib3V0IGEgc2Vjb25kLgpDdXJyZW50bHksIHRoZSBlbnRpcmUgS1Vu
aXQgdGVzdCBzdWl0ZSBmb3IgS1VuaXQgcnVucyBpbiB1bmRlciBhIHNlY29uZApmcm9tIHRoZSBp
bml0aWFsIGludm9jYXRpb24gKGJ1aWxkIHRpbWUgZXhjbHVkZWQpLgoKS1VuaXQgaXMgaGVhdmls
eSBpbnNwaXJlZCBieSBKVW5pdCwgUHl0aG9uJ3MgdW5pdHRlc3QubW9jaywgYW5kCkdvb2dsZXRl
c3QvR29vZ2xlbW9jayBmb3IgQysrLiBLVW5pdCBwcm92aWRlcyBmYWNpbGl0aWVzIGZvciBkZWZp
bmluZwp1bml0IHRlc3QgY2FzZXMsIGdyb3VwaW5nIHJlbGF0ZWQgdGVzdCBjYXNlcyBpbnRvIHRl
c3Qgc3VpdGVzLCBwcm92aWRpbmcKY29tbW9uIGluZnJhc3RydWN0dXJlIGZvciBydW5uaW5nIHRl
c3RzLCBtb2NraW5nLCBzcHlpbmcsIGFuZCBtdWNoIG1vcmUuCgojIyMgV2hhdCdzIHNvIHNwZWNp
YWwgYWJvdXQgdW5pdCB0ZXN0aW5nPwoKQSB1bml0IHRlc3QgaXMgc3VwcG9zZWQgdG8gdGVzdCBh
IHNpbmdsZSB1bml0IG9mIGNvZGUgaW4gaXNvbGF0aW9uLApoZW5jZSB0aGUgbmFtZS4gVGhlcmUg
c2hvdWxkIGJlIG5vIGRlcGVuZGVuY2llcyBvdXRzaWRlIHRoZSBjb250cm9sIG9mCnRoZSB0ZXN0
OyB0aGlzIG1lYW5zIG5vIGV4dGVybmFsIGRlcGVuZGVuY2llcywgd2hpY2ggbWFrZXMgdGVzdHMg
b3JkZXJzCm9mIG1hZ25pdHVkZXMgZmFzdGVyLiBMaWtld2lzZSwgc2luY2UgdGhlcmUgYXJlIG5v
IGV4dGVybmFsIGRlcGVuZGVuY2llcywKdGhlcmUgYXJlIG5vIGhvb3BzIHRvIGp1bXAgdGhyb3Vn
aCB0byBydW4gdGhlIHRlc3RzLiBBZGRpdGlvbmFsbHksIHRoaXMKbWFrZXMgdW5pdCB0ZXN0cyBk
ZXRlcm1pbmlzdGljOiBhIGZhaWxpbmcgdW5pdCB0ZXN0IGFsd2F5cyBpbmRpY2F0ZXMgYQpwcm9i
bGVtLiBGaW5hbGx5LCBiZWNhdXNlIHVuaXQgdGVzdHMgbmVjZXNzYXJpbHkgaGF2ZSBmaW5lciBn
cmFudWxhcml0eSwKdGhleSBhcmUgYWJsZSB0byB0ZXN0IGFsbCBjb2RlIHBhdGhzIGVhc2lseSBz
b2x2aW5nIHRoZSBjbGFzc2ljIHByb2JsZW0Kb2YgZGlmZmljdWx0eSBpbiBleGVyY2lzaW5nIGVy
cm9yIGhhbmRsaW5nIGNvZGUuCgojIyMgSXMgS1VuaXQgdHJ5aW5nIHRvIHJlcGxhY2Ugb3RoZXIg
dGVzdGluZyBmcmFtZXdvcmtzIGZvciB0aGUga2VybmVsPwoKTm8uIE1vc3QgZXhpc3RpbmcgdGVz
dHMgZm9yIHRoZSBMaW51eCBrZXJuZWwgYXJlIGVuZC10by1lbmQgdGVzdHMsIHdoaWNoCmhhdmUg
dGhlaXIgcGxhY2UuIEEgd2VsbCB0ZXN0ZWQgc3lzdGVtIGhhcyBsb3RzIG9mIHVuaXQgdGVzdHMs
IGEKcmVhc29uYWJsZSBudW1iZXIgb2YgaW50ZWdyYXRpb24gdGVzdHMsIGFuZCBzb21lIGVuZC10
by1lbmQgdGVzdHMuIEtVbml0CmlzIGp1c3QgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIHVuaXQgdGVz
dCBzcGFjZSB3aGljaCBpcyBjdXJyZW50bHkgbm90CmJlaW5nIGFkZHJlc3NlZC4KCiMjIyBNb3Jl
IGluZm9ybWF0aW9uIG9uIEtVbml0CgpUaGVyZSBpcyBhIGJ1bmNoIG9mIGRvY3VtZW50YXRpb24g
bmVhciB0aGUgZW5kIG9mIHRoaXMgcGF0Y2ggc2V0IHRoYXQKZGVzY3JpYmVzIGhvdyB0byB1c2Ug
S1VuaXQgYW5kIGJlc3QgcHJhY3RpY2VzIGZvciB3cml0aW5nIHVuaXQgdGVzdHMuCkZvciBjb252
ZW5pZW5jZSBJIGFtIGhvc3RpbmcgdGhlIGNvbXBpbGVkIGRvY3MgaGVyZVsyXS4KCkFkZGl0aW9u
YWxseSBmb3IgY29udmVuaWVuY2UsIEkgaGF2ZSBhcHBsaWVkIHRoZXNlIHBhdGNoZXMgdG8gYQpi
cmFuY2hbM10uIFRoZSByZXBvIG1heSBiZSBjbG9uZWQgd2l0aDoKZ2l0IGNsb25lIGh0dHBzOi8v
a3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eApUaGlzIHBhdGNoc2V0IGlzIG9uIHRoZSBrdW5p
dC9yZmMvdjUuMy92MTQgYnJhbmNoLgoKIyMgQ2hhbmdlcyBTaW5jZSBMYXN0IFZlcnNpb24KCi0g
UmVtb3ZlZCB0byBtYWNyb3Mgd2hpY2ggaGVscGVkIGRlZmluZSBleHBlY3RhdGlvbiBhbmQgYXNz
ZXJ0aW9uCiAgbWFjcm9zOyB0aGVzZSB2YWx1ZXMgYXJlIG5vdyBqdXN0IGNvcGllZCBhbmQgcGFz
dGVkLiBDaGFuZ2Ugd2FzIG1hZGUKICB0byBmaXggY2hlY2twYXRjaCBlcnJvciwgYXMgc3VnZ2Vz
dGVkIGJ5IFNodWFoLgoKWzFdIGh0dHBzOi8vZ29vZ2xlLmdpdGh1Yi5pby9rdW5pdC1kb2NzL3Ro
aXJkX3BhcnR5L2tlcm5lbC9kb2NzL3VzYWdlLmh0bWwja3VuaXQtb24tbm9uLXVtbC1hcmNoaXRl
Y3R1cmVzClsyXSBodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90aGlyZF9wYXJ0
eS9rZXJuZWwvZG9jcy8KWzNdIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9saW51eC8r
L2t1bml0L3JmYy92NS4zL3YxNAoKLS0gCjIuMjMuMC5yYzEuMTUzLmdkZWVkODAzMzBmLWdvb2cK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
