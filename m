Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EC1B440E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 00:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440EE6EAA1;
	Mon, 16 Sep 2019 22:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 609536EAA1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:36:36 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
 [209.85.160.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29996216C8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 22:36:36 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d2so1935637qtr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2019 15:36:36 -0700 (PDT)
X-Gm-Message-State: APjAAAVOli96mzYYX31Xwu4dUUVMZ+mjigK753NRVHHOj0Rlu3FpbKOY
 yldaG9b6ap+YFJ1Ls7AGGOR0dJvzvSa4kJ0MwA==
X-Google-Smtp-Source: APXvYqw9nfK6ijHIbDLE2u7dIhOwDFr+8HHs9pqMsZRdNI8f/ZH1FLofjrqiO0RCgz8ge0OlTDVmu8hzE7dKP0XR2/c=
X-Received: by 2002:a0c:9e20:: with SMTP id p32mr630806qve.39.1568673395267;
 Mon, 16 Sep 2019 15:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190912112804.10104-1-steven.price@arm.com>
 <20190912112804.10104-3-steven.price@arm.com>
 <20190913174343.GB5387@kevin>
In-Reply-To: <20190913174343.GB5387@kevin>
From: Rob Herring <robh@kernel.org>
Date: Mon, 16 Sep 2019 17:36:24 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHqvwJrO2jocoMx38z8rMtVrK+PcMRHO13Y7EQaQK+DQ@mail.gmail.com>
Message-ID: <CAL_JsqJHqvwJrO2jocoMx38z8rMtVrK+PcMRHO13Y7EQaQK+DQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panfrost: Simplify devfreq utilisation tracking
To: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1568673396;
 bh=cgBibUhFcjP8VZBif2i2zXEf+Enx1YGlyHXoEAUrbKw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RtoKHQtYhKKbVbqAM3whuZWcJCtPehxBOH9376myc9sgouP9y/ioxa+3sWpPAVYYl
 wYIgIo4XyeUpHXDyAECMN8Qjt9w2xYWM0yrwXNCvubi0/9UpG1wVw4D/Y43sOzfS50
 42aYFCg8l+lQe4TlriCDwgF+IyLsdKFntFNFsWbc=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMTMsIDIwMTkgYXQgMTI6NDMgUE0gQWx5c3NhIFJvc2VuendlaWcKPGFseXNz
YS5yb3Nlbnp3ZWlnQGNvbGxhYm9yYS5jb20+IHdyb3RlOgo+Cj4gUGF0Y2ggMSBpczoKPgo+ICAg
ICAgICAgQWNrZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xs
YWJvcmEuY29tPgo+Cj4gUGF0Y2ggMiBpczoKPgo+ICAgICAgICAgUmV2aWV3ZWQtYnk6IEFseXNz
YSBSb3Nlbnp3ZWlnIDxhbHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgoKSW4gdGhlIGZ1
dHVyZSwgcGxlYXNlIHJlcGx5IHRvIGVhY2ggcGF0Y2ggd2l0aCB5b3VyIHRhZy4gVGhlIHJlYXNv
bgpiZWluZyBpcyBwYXRjaHdvcmsgd2lsbCBhdXRvbWF0aWNhbGx5IGFkZCB0aGVtIGluc3RlYWQg
b2YgbWUgZG9pbmcgaXQKbWFudWFsbHkuIEZvciBhIHRhZyBvbiBhIHdob2xlIHNlcmllcywgcmVw
bHlpbmcgdG8gcGF0Y2ggIzAgaXMgZmluZS4KUGF0Y2h3b3JrIGRvZXNuJ3QgaGFuZGxlIHRoYXQs
IGJ1dCBJIHZpZXcgdGhhdCBhcyBhIHBhdGNod29yawpsaW1pdGF0aW9uLgoKUm9iCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
