Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D29E6CE64
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 14:59:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4CF6E3A2;
	Thu, 18 Jul 2019 12:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451E76E3A2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 12:59:07 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so28562805wru.13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 05:59:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xzSmfnXRcQ0lncJ4oY1al5Tz1krJ5LsMFDXPD4J+9Yg=;
 b=XnBPGHO+jKK1ktlfPbZHh4TuFG4LQeUqQZRIgBWoxX3mK9u7RBunQx1F1w7Dj4N+ZN
 OM79N9bzFvnuLbHEI6nFf80I9qKe4m0bX8KDvQ7Ngjc0dlPpEv4h24BYwFvRk/aM5kBN
 M09gRgp/lFaOan4oEP3YqB9uD/eiS//e6ecng3LtoqpCYOkjwuxXwwdLoiyeuc4CVkd6
 jhMeXZrdmR49z+d1pnjskbtrcwA5C7Kot/aqfFghFQV9fs93hcjL1pwJLhme88CQE26L
 np2m5cOoxH4Y7YfzokMAt2kcJ7RQXJBzR+Xtctmru0wRoj/i521Sbr4tSyw9pDfLbVLz
 D4zA==
X-Gm-Message-State: APjAAAXaw8LIu4LGlUCFcjO3T2Rtagco5JTId4RGO7Xsi6BdJkaMMTjB
 52/Jwe48DAPseLpDr6wJTYxVixWRq5oOxg2Jxxrk
X-Google-Smtp-Source: APXvYqx+UA6wGMTsSYyKydsHPsreGPcADwb0A3zKt9W4oWZfUbYMFYDh4XnvSlOSEREuZ5JLmfQ4N7152jaQCWuJoHM=
X-Received: by 2002:adf:a344:: with SMTP id d4mr49759564wrb.237.1563454745883; 
 Thu, 18 Jul 2019 05:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190718020745.8867-1-fred@fredlawl.com>
 <20190718020745.8867-2-fred@fredlawl.com>
In-Reply-To: <20190718020745.8867-2-fred@fredlawl.com>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Thu, 18 Jul 2019 07:58:52 -0500
Message-ID: <CAErSpo5S=VyyV6Euzf7qhO0zukU_mnXqJgEhy9fwR0AYf4LTpA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Prefer pcie_capability_read_word()
To: Frederick Lawler <fred@fredlawl.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=xzSmfnXRcQ0lncJ4oY1al5Tz1krJ5LsMFDXPD4J+9Yg=;
 b=vrDiNZ9Rnx+Zqc1cpL3YQZDzoErYg0d+VFDXepCbcF5cGqaeFx3c5BM0tQ4QkrU+Dy
 eFw7529GaRzASlFP2QTx4bc+pWcBPFWDu83jKCCl5zrzGxW6xXSB6aB78CJM2XP/7g6G
 m4Qj9Xmmtms+/YX1I6yLI3HSgIxoQjQo6HVkQ3S2L3MccYLA3RNRhq2hYgbFhvO2XjbT
 RhPHTJqDlRmTuE2cHcHNErAT2w67a168Rqb9Dhq/MDemJRn86AupD5qAmlvHcKGLjcTX
 M/bfxIMC6vKZw+ZYxrx2/4R+pffU7qa4XIVMpKXPSyIY44DjzV9bD3Ie/idMEctL5wDk
 JkNQ==
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
Cc: David Airlie <airlied@linux.ie>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgOTowOCBQTSBGcmVkZXJpY2sgTGF3bGVyIDxmcmVkQGZy
ZWRsYXdsLmNvbT4gd3JvdGU6Cj4KPiBDb21taXQgOGMwZDNhMDJjMTMwICgiUENJOiBBZGQgYWNj
ZXNzb3JzIGZvciBQQ0kgRXhwcmVzcyBDYXBhYmlsaXR5IikKPiBhZGRlZCBhY2Nlc3NvcnMgZm9y
IHRoZSBQQ0kgRXhwcmVzcyBDYXBhYmlsaXR5IHNvIHRoYXQgZHJpdmVycyBkaWRuJ3QKPiBuZWVk
IHRvIGJlIGF3YXJlIG9mIGRpZmZlcmVuY2VzIGJldHdlZW4gdjEgYW5kIHYyIG9mIHRoZSBQQ0kK
PiBFeHByZXNzIENhcGFiaWxpdHkuCj4KPiBSZXBsYWNlIHBjaV9yZWFkX2NvbmZpZ193b3JkKCkg
YW5kIHBjaV93cml0ZV9jb25maWdfd29yZCgpIGNhbGxzIHdpdGgKPiBwY2llX2NhcGFiaWxpdHlf
cmVhZF93b3JkKCkgYW5kIHBjaWVfY2FwYWJpbGl0eV93cml0ZV93b3JkKCkuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBGcmVkZXJpY2sgTGF3bGVyIDxmcmVkQGZyZWRsYXdsLmNvbT4KCj4gLSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBwY2lfcmVhZF9jb25maWdfd29yZChhZGV2LT5wZGV2LCBn
cHVfcG9zICsgUENJX0VYUF9MTktDVEwyLCAmdG1wMTYpOwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcGNpZV9jYXBhYmlsaXR5X3JlYWRfd29yZChhZGV2LT5wZGV2LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBQQ0lf
RVhQX0xOS0NUTDIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICZ0bXAxNik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB0bXAxNiAmPSB+KCgxIDw8IDQpIHwgKDcgPDwgOSkpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdG1wMTYgfD0gKGdwdV9jZmcyICYgKCgxIDw8IDQpIHwgKDcgPDwgOSkpKTsK
ClNhbWUgY29tbWVudHMgYXMgZm9yIHJhZGVvbi4gIExvb2tzIGxpa2UgYSBsb3Qgb2Ygc2ltaWxh
ciBjb2RlIGJldHdlZW4KcmFkZW9uIGFuZCBhbWRncHUuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
