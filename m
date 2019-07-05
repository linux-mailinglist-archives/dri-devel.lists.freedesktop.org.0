Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3792261B19
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD08E89B66;
	Mon,  8 Jul 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E3C6E4E6
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 15:12:09 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id h28so2221068lfj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jul 2019 08:12:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UJP5d8d4R7j2ybp/z262FGakRH0zeassz+JZDSgOkc=;
 b=evA9TWGVarx0GC79lhpgfmi1n9HVKYCaQ07QmWNmUGlTkWxhA/pvxroI4GOdsC6unj
 uhjTuuDRwovlIuvumTwe6tdJ0KGnZ/kWPNnMKzQ+y3toVvqL62hd6+viwYjCjNofGnKa
 25bvjHUSaPvW26kkaQs8GIiWCZiuAnkywgaUB+AIhHO3XvwgilFTRrkzssE1ldWE36fU
 K0mmOjTdWez7K53t9c2v5e81CC7AorArDPNeB8VYVfObCnPWb8CADUzPt7ef6TIdH1YZ
 NEOryBPyQNN0/FEEmiJ4KaiPw8wbcRNOUGS91/U3UyUctdyRv7nu/fhhijW95UYo0Gdb
 tXTw==
X-Gm-Message-State: APjAAAUbTZz1eGFBVavyJHZrX6lkEotz0nn7DXRmuw1dDQhWXVti46YF
 se9WxFe3Uw+p8yqxRfKQoII=
X-Google-Smtp-Source: APXvYqzz63aFUveYFlYoX/IDK56bwneXg5+8snrrvQOzJrfb+MCKJiREOCmTeOHOkD+rM81Dlf/heg==
X-Received: by 2002:a19:7110:: with SMTP id m16mr2270647lfc.4.1562339527654;
 Fri, 05 Jul 2019 08:12:07 -0700 (PDT)
Received: from localhost.localdomain (ppp79-139-233-208.pppoe.spdop.ru.
 [79.139.233.208])
 by smtp.gmail.com with ESMTPSA id r17sm1851253ljb.77.2019.07.05.08.12.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 08:12:07 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1] drm/tegra: Fix gpiod_get_from_of_node() regression
Date: Fri,  5 Jul 2019 18:11:39 +0300
Message-Id: <20190705151139.19032-1-digetx@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+UJP5d8d4R7j2ybp/z262FGakRH0zeassz+JZDSgOkc=;
 b=hbUbsiXNaQz36B81KUhBjhvIUIfzHd8SYh1zWb7ZPNb2g/Hi9y3Bo/STNk2vlm7M/Z
 aPk4HnZReVoh3mUTjzWMPES5BJoQETWYE0PsO+59zkZ4WIZT5rT+ULo7fKCNZEdjMXXP
 BRLbv+7I6xhwAWYUIAw0qwvV9wV9rRBbyO+GjKtXbiBeVQHzkdQBgbnQ+IwPorCFCuTB
 SPRYph/EJX6rhbHDxLPmNnF/BpRasHhCDZBmRvPGNTldaygtPDv/Q/7gefmzkviKyH+8
 +Qo3knHieQex0gZ1TuxMY3uq/Rre0HiiM+m8dtgi/no7bQjt/61IUO/0oTMcC19J7k9a
 38sg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhdCBmdW5jdGlvbiBub3cgcmV0dXJucyBFUlJfUFRSIGluc3RlYWQgb2YgTlVMTCBpZiAiaHBk
LWdwaW8iIGlzIG5vdApwcmVzZW50IGluIGRldmljZS10cmVlLiBUaGUgb2ZmZW5kaW5nIHBhdGNo
IG1pc3NlZCB0byBhZGFwdCB0aGUgVGVncmEncwpEUk0gZHJpdmVyIGZvciB0aGUgQVBJIGNoYW5n
ZS4KCkZpeGVzOiAwMjViZjM3NzI1ZjEgKCJncGlvOiBGaXggcmV0dXJuIHZhbHVlIG1pc21hdGNo
IG9mIGZ1bmN0aW9uIGdwaW9kX2dldF9mcm9tX29mX25vZGUoKSIpClNpZ25lZC1vZmYtYnk6IERt
aXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVn
cmEvb3V0cHV0LmMgfCA4ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRw
dXQuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYwppbmRleCAyNzRjYjk1NWUyZTEu
LjQ3MWQzMzgwOWNkNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1dC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYwpAQCAtMTI2LDggKzEyNiwxMiBA
QCBpbnQgdGVncmFfb3V0cHV0X3Byb2JlKHN0cnVjdCB0ZWdyYV9vdXRwdXQgKm91dHB1dCkKIAkJ
CQkJCSAgICAgICAibnZpZGlhLGhwZC1ncGlvIiwgMCwKIAkJCQkJCSAgICAgICBHUElPRF9JTiwK
IAkJCQkJCSAgICAgICAiSERNSSBob3RwbHVnIGRldGVjdCIpOwotCWlmIChJU19FUlIob3V0cHV0
LT5ocGRfZ3BpbykpCi0JCXJldHVybiBQVFJfRVJSKG91dHB1dC0+aHBkX2dwaW8pOworCWlmIChJ
U19FUlIob3V0cHV0LT5ocGRfZ3BpbykpIHsKKwkJaWYgKFBUUl9FUlIob3V0cHV0LT5ocGRfZ3Bp
bykgPT0gLUVOT0VOVCkKKwkJCW91dHB1dC0+aHBkX2dwaW8gPSBOVUxMOworCQllbHNlCisJCQly
ZXR1cm4gUFRSX0VSUihvdXRwdXQtPmhwZF9ncGlvKTsKKwl9CiAKIAlpZiAob3V0cHV0LT5ocGRf
Z3BpbykgewogCQllcnIgPSBncGlvZF90b19pcnEob3V0cHV0LT5ocGRfZ3Bpbyk7Ci0tIAoyLjIy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
