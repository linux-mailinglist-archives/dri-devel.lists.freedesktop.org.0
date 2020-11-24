Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02A62C1B0E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 02:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F3A66E170;
	Tue, 24 Nov 2020 01:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DA16E162;
 Tue, 24 Nov 2020 01:46:54 +0000 (UTC)
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D0FEE206FA;
 Tue, 24 Nov 2020 01:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606182413;
 bh=l8PzaObySRRsk8Qr2VGSW2cE2KYLeZxGCFjBrnWF/Lc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=UW7qkn00cv0wKiMaPmt66xG3QkCT8bOVJt7eg3jDQbxlQGPJk4mx/VqCDN8ptUhlR
 dhn0h/4nyOm1M8zdsuA37E4QjM+7Riaqfpsc9IapZPm4KcMQtw7px4ieszGaMfwO0Z
 lfMGoIgQ4EohQhNLmkPGid0CCriQVWDtDbY9z+UQ=
Date: Mon, 23 Nov 2020 17:46:48 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH 000/141] Fix fall-through warnings for Clang
Message-ID: <20201123174648.6a22575b@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
References: <cover.1605896059.git.gustavoars@kernel.org>
 <20201120105344.4345c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011201129.B13FDB3C@keescook>
 <20201120115142.292999b2@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <202011220816.8B6591A@keescook>
 <CAKwvOdntVfXj2WRR5n6Kw7BfG7FdKpTeHeh5nPu5AzwVMhOHTg@mail.gmail.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org,
	linux-atm-general@lists.sourceforge.net,
	dri-devel <dri-devel@lists.freedesktop.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, dm-devel@redhat.com,
	keyrings@vger.kernel.org, GR-everest-linux-l2@marvell.com,
	linux1394-devel@lists.sourceforge.net, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, 32-BIT AND 64-BIT <X86@freedesktop.org>,
	bridge@lists.linux-foundation.org,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	cluster-devel@redhat.com, linux-acpi@vger.kernel.org,
	coreteam@netfilter.org, intel-wired-lan@lists.osuosl.org,
	Kees Cook <keescook@chromium.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	intel-gfx@lists.freedesktop.org, linux-can@vger.kernel.org,
	linux-block@vger.kernel.org, ceph-devel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	GR-Linux-NIC-Dev@marvell.com, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMyBOb3YgMjAyMCAxNzozMjo1MSAtMDgwMCBOaWNrIERlc2F1bG5pZXJzIHdyb3Rl
Ogo+IE9uIFN1biwgTm92IDIyLCAyMDIwIGF0IDg6MTcgQU0gS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+ID4gT24gRnJpLCBOb3YgMjAsIDIwMjAgYXQgMTE6NTE6NDJB
TSAtMDgwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6ICAKPiA+ID4gSWYgbm9uZSBvZiB0aGUgMTQw
IHBhdGNoZXMgaGVyZSBmaXggYSByZWFsIGJ1ZywgYW5kIHRoZXJlIGlzIG5vIGNoYW5nZQo+ID4g
PiB0byBtYWNoaW5lIGNvZGUgdGhlbiBpdCBzb3VuZHMgdG8gbWUgbGlrZSBhIFc9MiBraW5kIG9m
IGEgd2FybmluZy4gIAo+ID4KPiA+IEZXSVcsIHRoaXMgc2VyaWVzIGhhcyBmb3VuZCBhdCBsZWFz
dCBvbmUgYnVnIHNvIGZhcjoKPiA+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvQ0FGQ3dm
MTFpekhGPWcxbUdyeTFmRTVrdkZGRnJ4emhQU002cUtBTzhneFNwPUtyX0NRQG1haWwuZ21haWwu
Y29tLyAgCj4gCj4gU28gbG9va3MgbGlrZSB0aGUgYnVsayBvZiB0aGVzZSBhcmU6Cj4gc3dpdGNo
ICh4KSB7Cj4gICBjYXNlIDA6Cj4gICAgICsreDsKPiAgIGRlZmF1bHQ6Cj4gICAgIGJyZWFrOwo+
IH0KPiAKPiBJIGhhdmUgYSBwYXRjaCB0aGF0IGZpeGVzIHRob3NlIHVwIGZvciBjbGFuZzoKPiBo
dHRwczovL3Jldmlld3MubGx2bS5vcmcvRDkxODk1Cgrwn5iNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
