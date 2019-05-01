Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B598110F7D
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 01:02:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBDC892C2;
	Wed,  1 May 2019 23:02:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa4a.google.com (mail-vk1-xa4a.google.com
 [IPv6:2607:f8b0:4864:20::a4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D298892B8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 23:02:11 +0000 (UTC)
Received: by mail-vk1-xa4a.google.com with SMTP id y19so258538vky.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 May 2019 16:02:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=De7JrG6+3XL344zZMScSqunmKbgZceVjMJC0FL9AbxY=;
 b=Cg8HdrciV2aTvyOQWUmH1oxdwV71PoO1hse9g55u2zT9QbyU39mN1a0LlKY+9vsbWb
 yQmPYFNMhiS3wngHbdoGp3s8O4EKfKJ/u+XSGcGWwZDCu98Ei2XxFuFU+fb8l/OlSkXy
 zTWZgC9dKs+ejfubxRb+dZOpxhLbkjXA+oeaCfAfF2kYLGPyHnq0JALBZTuscMsmlwN3
 dT1soCrx40sqaWVPAKyRW0qmDvBrGU5POJXY+D9wMFbMhoqR1ySIV0813bmtXB+4ibOY
 knz1bRIDpBb8QSooTCWq/i6QPf/B0kyrGCvUPZ5dVHm8JgHH4Pe3PqB4THEBmJj6b9tz
 8eug==
X-Gm-Message-State: APjAAAWRBAkGJtt+Xp6ffOhK/IKfmj2aA7nFD3nX2KekmWAmcGklQSBK
 Y8QBHgz3bgMIqcU+UVg9qh6BIrWKUdZIjppuUTkbqQ==
X-Google-Smtp-Source: APXvYqytaGaXIlQSl5wsYvREjZvXVeqTJ4FhNvP2xNvz38NyshdL0U4pqVOMRR/ps0I6/FLnggB5b5wmfrnXtO1aUnE0lA==
X-Received: by 2002:ab0:20a1:: with SMTP id y1mr213208ual.101.1556751729917;
 Wed, 01 May 2019 16:02:09 -0700 (PDT)
Date: Wed,  1 May 2019 16:01:09 -0700
Message-Id: <20190501230126.229218-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
Subject: [PATCH v2 00/17] kunit: introduce KUnit, the Linux kernel unit
 testing framework
From: Brendan Higgins <brendanhiggins@google.com>
To: frowand.list@gmail.com, gregkh@linuxfoundation.org, keescook@google.com, 
 kieran.bingham@ideasonboard.com, mcgrof@kernel.org, robh@kernel.org, 
 sboyd@kernel.org, shuah@kernel.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=De7JrG6+3XL344zZMScSqunmKbgZceVjMJC0FL9AbxY=;
 b=qtzfVeePMbJhJqE+Yf+Kv1DhoZE9ng7nvFaWF8RJXgdCikBdWv36SI916RGwYzUukq
 xZ9iRq7CanllZWM7N5EMvSrH76h/QHHPUoEYCnmM+oUL1rzrZdP/C9kf6bQfkkH2oii8
 V97WCJiEG/EbkMT96CrHZ3ULLAQCRx09BXRHAZU8A+nmmtZPD4qqi9tcI9XX7ENyOW6Q
 pByKUepLMJrt85M4mkzTyPvyDYRRbm2pwYxrVTb6Gm/Oqz+saBFL/hmmcJKeXHcDy2/O
 6eNpA52lwMEF/MP27yaxHbVokdjjs1RKVkQH0OPZY00rCv9fgG3G1mGLf74KJ8HBy8CY
 U+lw==
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
 rostedt@goodmis.org, julia.lawall@lip6.fr, dan.j.williams@intel.com,
 kunit-dev@googlegroups.com, richard@nod.at, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

IyMgVExEUgoKSSByZWJhc2VkIHRoZSBsYXN0IHBhdGNoc2V0IG9uIDUuMS1yYzcgaW4gaG9wZXMg
dGhhdCB3ZSBjYW4gZ2V0IHRoaXMgaW4KNS4yLgoKU2h1YWgsIEkgdGhpbmsgeW91LCBHcmVnIEtI
LCBhbmQgbXlzZWxmIHRhbGtlZCBvZmYgdGhyZWFkLCBhbmQgd2UgYWdyZWVkCndlIHdvdWxkIG1l
cmdlIHRocm91Z2ggeW91ciB0cmVlIHdoZW4gdGhlIHRpbWUgY2FtZT8gQW0gSSByZW1lbWJlcmlu
Zwpjb3JyZWN0bHk/CgojIyBCYWNrZ3JvdW5kCgpUaGlzIHBhdGNoIHNldCBwcm9wb3NlcyBLVW5p
dCwgYSBsaWdodHdlaWdodCB1bml0IHRlc3RpbmcgYW5kIG1vY2tpbmcKZnJhbWV3b3JrIGZvciB0
aGUgTGludXgga2VybmVsLgoKVW5saWtlIEF1dG90ZXN0IGFuZCBrc2VsZnRlc3QsIEtVbml0IGlz
IGEgdHJ1ZSB1bml0IHRlc3RpbmcgZnJhbWV3b3JrOwppdCBkb2VzIG5vdCByZXF1aXJlIGluc3Rh
bGxpbmcgdGhlIGtlcm5lbCBvbiBhIHRlc3QgbWFjaGluZSBvciBpbiBhIFZNCmFuZCBkb2VzIG5v
dCByZXF1aXJlIHRlc3RzIHRvIGJlIHdyaXR0ZW4gaW4gdXNlcnNwYWNlIHJ1bm5pbmcgb24gYSBo
b3N0Cmtlcm5lbC4gQWRkaXRpb25hbGx5LCBLVW5pdCBpcyBmYXN0OiBGcm9tIGludm9jYXRpb24g
dG8gY29tcGxldGlvbiBLVW5pdApjYW4gcnVuIHNldmVyYWwgZG96ZW4gdGVzdHMgaW4gdW5kZXIg
YSBzZWNvbmQuIEN1cnJlbnRseSwgdGhlIGVudGlyZQpLVW5pdCB0ZXN0IHN1aXRlIGZvciBLVW5p
dCBydW5zIGluIHVuZGVyIGEgc2Vjb25kIGZyb20gdGhlIGluaXRpYWwKaW52b2NhdGlvbiAoYnVp
bGQgdGltZSBleGNsdWRlZCkuCgpLVW5pdCBpcyBoZWF2aWx5IGluc3BpcmVkIGJ5IEpVbml0LCBQ
eXRob24ncyB1bml0dGVzdC5tb2NrLCBhbmQKR29vZ2xldGVzdC9Hb29nbGVtb2NrIGZvciBDKysu
IEtVbml0IHByb3ZpZGVzIGZhY2lsaXRpZXMgZm9yIGRlZmluaW5nCnVuaXQgdGVzdCBjYXNlcywg
Z3JvdXBpbmcgcmVsYXRlZCB0ZXN0IGNhc2VzIGludG8gdGVzdCBzdWl0ZXMsIHByb3ZpZGluZwpj
b21tb24gaW5mcmFzdHJ1Y3R1cmUgZm9yIHJ1bm5pbmcgdGVzdHMsIG1vY2tpbmcsIHNweWluZywg
YW5kIG11Y2ggbW9yZS4KCiMjIFdoYXQncyBzbyBzcGVjaWFsIGFib3V0IHVuaXQgdGVzdGluZz8K
CkEgdW5pdCB0ZXN0IGlzIHN1cHBvc2VkIHRvIHRlc3QgYSBzaW5nbGUgdW5pdCBvZiBjb2RlIGlu
IGlzb2xhdGlvbiwKaGVuY2UgdGhlIG5hbWUuIFRoZXJlIHNob3VsZCBiZSBubyBkZXBlbmRlbmNp
ZXMgb3V0c2lkZSB0aGUgY29udHJvbCBvZgp0aGUgdGVzdDsgdGhpcyBtZWFucyBubyBleHRlcm5h
bCBkZXBlbmRlbmNpZXMsIHdoaWNoIG1ha2VzIHRlc3RzIG9yZGVycwpvZiBtYWduaXR1ZGVzIGZh
c3Rlci4gTGlrZXdpc2UsIHNpbmNlIHRoZXJlIGFyZSBubyBleHRlcm5hbCBkZXBlbmRlbmNpZXMs
CnRoZXJlIGFyZSBubyBob29wcyB0byBqdW1wIHRocm91Z2ggdG8gcnVuIHRoZSB0ZXN0cy4gQWRk
aXRpb25hbGx5LCB0aGlzCm1ha2VzIHVuaXQgdGVzdHMgZGV0ZXJtaW5pc3RpYzogYSBmYWlsaW5n
IHVuaXQgdGVzdCBhbHdheXMgaW5kaWNhdGVzIGEKcHJvYmxlbS4gRmluYWxseSwgYmVjYXVzZSB1
bml0IHRlc3RzIG5lY2Vzc2FyaWx5IGhhdmUgZmluZXIgZ3JhbnVsYXJpdHksCnRoZXkgYXJlIGFi
bGUgdG8gdGVzdCBhbGwgY29kZSBwYXRocyBlYXNpbHkgc29sdmluZyB0aGUgY2xhc3NpYyBwcm9i
bGVtCm9mIGRpZmZpY3VsdHkgaW4gZXhlcmNpc2luZyBlcnJvciBoYW5kbGluZyBjb2RlLgoKIyMg
SXMgS1VuaXQgdHJ5aW5nIHRvIHJlcGxhY2Ugb3RoZXIgdGVzdGluZyBmcmFtZXdvcmtzIGZvciB0
aGUga2VybmVsPwoKTm8uIE1vc3QgZXhpc3RpbmcgdGVzdHMgZm9yIHRoZSBMaW51eCBrZXJuZWwg
YXJlIGVuZC10by1lbmQgdGVzdHMsIHdoaWNoCmhhdmUgdGhlaXIgcGxhY2UuIEEgd2VsbCB0ZXN0
ZWQgc3lzdGVtIGhhcyBsb3RzIG9mIHVuaXQgdGVzdHMsIGEKcmVhc29uYWJsZSBudW1iZXIgb2Yg
aW50ZWdyYXRpb24gdGVzdHMsIGFuZCBzb21lIGVuZC10by1lbmQgdGVzdHMuIEtVbml0CmlzIGp1
c3QgdHJ5aW5nIHRvIGFkZHJlc3MgdGhlIHVuaXQgdGVzdCBzcGFjZSB3aGljaCBpcyBjdXJyZW50
bHkgbm90CmJlaW5nIGFkZHJlc3NlZC4KCiMjIE1vcmUgaW5mb3JtYXRpb24gb24gS1VuaXQKClRo
ZXJlIGlzIGEgYnVuY2ggb2YgZG9jdW1lbnRhdGlvbiBuZWFyIHRoZSBlbmQgb2YgdGhpcyBwYXRj
aCBzZXQgdGhhdApkZXNjcmliZXMgaG93IHRvIHVzZSBLVW5pdCBhbmQgYmVzdCBwcmFjdGljZXMg
Zm9yIHdyaXRpbmcgdW5pdCB0ZXN0cy4KRm9yIGNvbnZlbmllbmNlIEkgYW0gaG9zdGluZyB0aGUg
Y29tcGlsZWQgZG9jcyBoZXJlOgpodHRwczovL2dvb2dsZS5naXRodWIuaW8va3VuaXQtZG9jcy90
aGlyZF9wYXJ0eS9rZXJuZWwvZG9jcy8KQWRkaXRpb25hbGx5IGZvciBjb252ZW5pZW5jZSwgSSBo
YXZlIGFwcGxpZWQgdGhlc2UgcGF0Y2hlcyB0byBhIGJyYW5jaDoKaHR0cHM6Ly9rdW5pdC5nb29n
bGVzb3VyY2UuY29tL2xpbnV4Lysva3VuaXQvcmZjL3Y1LjEtcmM3L3YxClRoZSByZXBvIG1heSBi
ZSBjbG9uZWQgd2l0aDoKZ2l0IGNsb25lIGh0dHBzOi8va3VuaXQuZ29vZ2xlc291cmNlLmNvbS9s
aW51eApUaGlzIHBhdGNoc2V0IGlzIG9uIHRoZSBrdW5pdC9yZmMvdjUuMS1yYzcvdjEgYnJhbmNo
LgoKIyMgQ2hhbmdlcyBTaW5jZSBMYXN0IFZlcnNpb24KCk5vbmUuIEkganVzdCByZWJhc2VkIHRo
ZSBsYXN0IHBhdGNoc2V0IG9uIHY1LjEtcmM3LgoKLS0gCjIuMjEuMC41OTMuZzUxMWVjMzQ1ZTE4
LWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
