Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D79E34E3CD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 11:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722776E881;
	Tue, 30 Mar 2021 09:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EE96E882;
 Tue, 30 Mar 2021 09:00:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41CA061989;
 Tue, 30 Mar 2021 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617094851;
 bh=7BKJpJRJJea7jWMl80W5EN9UAj8omc2Cs2r3GAQepzo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Wsuslf1aShoCKyVO6hEvzEdZFMLQDIu2sbrH3x69Zj3fzv+Ssz4//dpuMEbWngOUq
 Zjq5v+sm416E8eDL5lOizTzEa7Erwc/f8fCuW75qsYfDXgJ3oE6b4i2kQYeYtPZd4I
 FK+fITjA3iXC63XWANkkhj4NvYlqDfeUjJbbuVDoJnM3Z/9egQRLEp8Koxo3BlExlm
 KJf0GkZPfII5XV5fPTrpbDnwtlOxinHOG65Ikgkmm49iP6nf4qHit/q0d/LnVY5qb5
 qa+2M5n3XKCJv1Wm+mrJgHL5nAHA2YFzyo0MHv0A+yCW12hqtwqifDnY1PrNFQltR4
 2Y+g7lZslykhg==
Received: by mail-oo1-f47.google.com with SMTP id
 r17-20020a4acb110000b02901b657f28cdcso3613099ooq.6; 
 Tue, 30 Mar 2021 02:00:51 -0700 (PDT)
X-Gm-Message-State: AOAM530ln4RbYp2RjZJNnBHeIQ94t3+w5dfl4QN4N3QaBxmtdC/+7FWn
 vh7vP3L7KDY1GQN2HDwRyKNWPwE/pV+sV26qAg0=
X-Google-Smtp-Source: ABdhPJzpNNBXFi0zlX+fSlV+iQuwxA7n7pfSwfoGiIinCD5YA1YpFSD4jDETbIF3gyjCIllkPcG9Qx+cRKe7U+THggk=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr25148861ooz.26.1617094850520; 
 Tue, 30 Mar 2021 02:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210322160253.4032422-1-arnd@kernel.org>
 <20210322160253.4032422-7-arnd@kernel.org>
 <YGLkPjSBdgpriC0E@blackbook>
In-Reply-To: <YGLkPjSBdgpriC0E@blackbook>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 30 Mar 2021 11:00:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
Message-ID: <CAK8P3a3nUCGwPpE+E820DniY8Haz1Xx72pA38P6s5MWsbi0iAQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] cgroup: fix -Wzero-length-bounds warnings
To: =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>
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
Cc: Alexei Starovoitov <ast@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Zefan Li <lizefan.x@bytedance.com>, Cong Wang <xiyou.wangcong@gmail.com>,
 Christian Brauner <christian.brauner@ubuntu.com>, Odin Ugedal <odin@uged.al>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 James Smart <james.smart@broadcom.com>, tboot-devel@lists.sourceforge.net,
 Kalle Valo <kvalo@codeaurora.org>, Andrii Nakryiko <andriin@fb.com>,
 ath11k@lists.infradead.org, Serge Hallyn <serge@hallyn.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Ning Sun <ning.sun@intel.com>,
 Anders Larsen <al@alarsen.net>, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Cgroups <cgroups@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Martin Sebor <msebor@gcc.gnu.org>, Networking <netdev@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>,
 Simon Kelley <simon@thekelleys.org.uk>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMzAsIDIwMjEgYXQgMTA6NDEgQU0gTWljaGFsIEtvdXRuw70gPG1rb3V0bnlA
c3VzZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBNYXIgMjIsIDIwMjEgYXQgMDU6MDI6NDRQTSAr
MDEwMCwgQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3JnPiB3cm90ZToKPiA+IEknbSBub3Qg
c3VyZSB3aGF0IGlzIGV4cGVjdGVkIHRvIGhhcHBlbiBmb3Igc3VjaCBhIGNvbmZpZ3VyYXRpb24s
Cj4gPiBwcmVzdW1hYmx5IHRoZXNlIGZ1bmN0aW9ucyBhcmUgbmV2ZXIgY2FsbHMgaW4gdGhhdCBj
YXNlLgo+IFllcywgdGhlIGZ1bmN0aW9ucyB5b3UgcGF0Y2hlZCB3b3VsZCBvbmx5IGJlIGNhbGxl
ZCBmcm9tIHN1YnN5c3RlbXMgb3IKPiB0aGVyZSBzaG91bGQgYmUgbm8gd2F5IHRvIG9idGFpbiBh
IHN0cnVjdCBjZ3JvdXBfc3Vic3lzIHJlZmVyZW5jZQo+IGFueXdheSAoaGVuY2UgaXQncyBvayB0
byBhbHdheXMgYnJhbmNoIGFzIGlmIHNzPT1OVUxMKS4KPgo+IEknZCBwcmVmZXIgYSB2YXJpYW50
IHRoYXQgd291bGRuJ3QgY29tcGlsZSB0aGUgYWZmZWN0ZWQgY29kZXBhdGhzIHdoZW4KPiB0aGVy
ZSBhcmUgbm8gc3Vic3lzdGVtcyByZWdpc3RlcmVkLCBob3dldmVyLCBJIGNvdWxkbid0IGNvbWUg
dXAgd2l0aCBhCj4gd2F5IGhvdyB0byBkbyBpdCB3aXRob3V0IHNvbWUgcHJlcHJvY2Vzc29yIHVn
bGluZXNzLgoKV291bGQgaXQgYmUgcG9zc2libGUgdG8gZW5jbG9zZSBtb3N0IG9yIGFsbCBvZiBr
ZXJuZWwvY2dyb3VwL2Nncm91cC5jCmluIGFuICNpZmRlZiBDR1JPVVBfU1VCU1lTX0NPVU5UIGJs
b2NrPyBJIGRpZG4ndCB0cnkgdGhhdApteXNlbGYsIGJ1dCB0aGlzIG1pZ2h0IGJlIGEgd2F5IHRv
IGd1YXJhbnRlZSB0aGF0IHRoZXJlIGNhbm5vdApiZSBhbnkgY2FsbGVycyAoaXQgd291bGQgY2F1
c2UgYSBsaW5rIGVycm9yKS4KCj4gUmV2aWV3ZWQtYnk6IE1pY2hhbCBLb3V0bsO9IDxta291dG55
QHN1c2UuY29tPgoKVGhhbmtzCgogICAgICAgIEFybmQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
