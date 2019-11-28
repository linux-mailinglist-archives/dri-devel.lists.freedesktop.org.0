Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A3710CC90
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD176E857;
	Thu, 28 Nov 2019 16:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C29C6E857
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:15:04 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id a124so43843oii.13
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 08:15:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSC7F7yk/BW+Fyk3jmUFf+tZZmOgmave+L/zyXMm1tM=;
 b=RjX3Ueq2B4jDnHQ/kLpQl1j1mTMMP1FtVIYCyYImhi+/Sb5vnixRKgydFIbakMwZAF
 V35cFtf37CWd+WiCSSGiFQwhuJx/kCvuSsKB5DFJ1Kq2FsZ3UdhqNLXi6+6ldRDzVkeZ
 YBwTvFtjchAbt3gSbMgcB1l+GlK4a5R9WpfXXGW5XiPtqJJVk0Iejma1jaEia9drSRPf
 Hzipa03rGBD2S/jZPRwyDdQRuLwgbcD/nYs8ZhSbYYqz4vJbAcBdWuQNVWe+LRn8APVu
 OSqXdrZJw474xuq1wBmjr2xzInkDX6C/kS1orS3p55MlnSChEUb2bbr+CJoScIFaUCHp
 F5QA==
X-Gm-Message-State: APjAAAWZngXii3q79DdIpEWi9XWFbHyUapZL3G5xywBONK1C2p66ocS/
 r8u7xTuMZ2Lp0xjaZyb417XuEly81C+XFl+BesMuRw==
X-Google-Smtp-Source: APXvYqwhxMUbMGhmMJprgyvzx11BYfaTLnL/vCA9TVN0vVRheLA/jfsQ+eIH24QAnWCqyRTbBQaVbxlcCQSivdHhRCo=
X-Received: by 2002:a54:488d:: with SMTP id r13mr218717oic.103.1574957703131; 
 Thu, 28 Nov 2019 08:15:03 -0800 (PST)
MIME-Version: 1.0
References: <20191128160314.2381249-1-thierry.reding@gmail.com>
 <20191128160314.2381249-2-thierry.reding@gmail.com>
In-Reply-To: <20191128160314.2381249-2-thierry.reding@gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 28 Nov 2019 17:14:51 +0100
Message-ID: <CAJZ5v0haOB1vc8aKk11RR-OnfLHChcqa+z7QkeKyN66s6xM3OA@mail.gmail.com>
Subject: Re: [PATCH 1/2] PM / runtime: Allow drivers to override runtime PM
 behaviour on sleep
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Len Brown <len.brown@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 dri-devel <dri-devel@lists.freedesktop.org>, Pavel Machek <pavel@ucw.cz>,
 linux-tegra <linux-tegra@vger.kernel.org>, Dmitry Osipenko <digetx@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjgsIDIwMTkgYXQgNTowMyBQTSBUaGllcnJ5IFJlZGluZyA8dGhpZXJyeS5y
ZWRpbmdAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5n
QG52aWRpYS5jb20+Cj4KPiBDdXJyZW50bHkgdGhlIGRyaXZlciBQTSBjb3JlIHdpbGwgYXV0b21h
dGljYWxseSBhY3F1aXJlIGEgcnVudGltZSBQTQo+IHJlZmVyZW5jZSBmb3IgZGV2aWNlcyBiZWZv
cmUgc3lzdGVtIHNsZWVwIGlzIGVudGVyZWQuIFRoaXMgaXMgbmVlZGVkCj4gdG8gYXZvaWQgcG90
ZW50aWFsIGlzc3VlcyByZWxhdGVkIHRvIGRldmljZXMnIHBhcmVudHMgZ2V0dGluZyBwdXQgdG8K
PiBydW50aW1lIHN1c3BlbmQgYXQgdGhlIHdyb25nIHRpbWUgYW5kIGNhdXNpbmcgcHJvYmxlbXMg
d2l0aCB0aGVpcgo+IGNoaWxkcmVuLgoKTm90IG9ubHkgZm9yIHRoYXQuCgo+IEluIHNvbWUgY2Fz
ZXMgZHJpdmVycyBhcmUgY2FyZWZ1bGx5IHdyaXR0ZW4gdG8gYXZvaWQgc3VjaCBpc3N1ZXMgYW5k
Cj4gdGhlIGRlZmF1bHQgYmVoYXZpb3VyIGNhbiBiZSBjaGFuZ2VkIHRvIGFsbG93IHJ1bnRpbWUg
UE0gdG8gb3BlcmF0ZQo+IHJlZ3VsYXJseSBkdXJpbmcgc3lzdGVtIHNsZWVwLgoKQnV0IHRoaXMg
Y2hhbmdlIGJyZWFrcyBxdWl0ZSBhIGZldyBhc3N1bXB0aW9ucyBpbiB0aGUgY29yZSB0b28sIHNv
IG5vLAppdCBjYW4ndCBiZSBtYWRlLgoKVGhhbmtzIQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
