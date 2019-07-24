Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA2E74828
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E216D6E680;
	Thu, 25 Jul 2019 07:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145876E5EE;
 Wed, 24 Jul 2019 16:22:36 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id f17so17209586pfn.6;
 Wed, 24 Jul 2019 09:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:message-id:in-reply-to
 :references:subject:mime-version:content-transfer-encoding;
 bh=8HMIhpVktcQhLcnMlnSaMxrwzTT+wDaUZPtys8u8fmw=;
 b=pdRihlUHGKDMsgfGl0LP7rqxjW+3DpMA6OJjmfnDM41G/DPE19Iy4dwrJAWJNEqMBa
 O7Qu+AmOAoVzy70bp3q66feTO+FlNOPSBFHH42yuWGw5XWVSwC54ZwW4tZJpBbOJpo4N
 7Z1V7MpuhzDuSXbh36Ro0JzbqCYnXh5OeAS/FUNV2VwWkuomLLJmiMPbG1ZJQNVuAToi
 a+WE57GsaUp7JTkfz1TEQ/ubGv9l6jJSlMmKVF8U4V1iVN6VeK9HE65WkBEuQ/AkrOpT
 HOvzTBLqCod7s3T5KXYHvYHY62Bk/OAVFHkdYjpuMukCXhE8jkSg8PzK8ig/Idv3EfZn
 T2HQ==
X-Gm-Message-State: APjAAAU090Jw18vxGiwV7xeP2kho6AW1cuKKFihMgs7Sd3X3BAtjHBnK
 Z6kiCY5K8i0eiGxYTPnqufA=
X-Google-Smtp-Source: APXvYqws5GAAL0AstDH8/4fyQ3x/GSONd0VZXKS14G9KUgQ4IflPjwyD4xUKd8HXv4SFO3MhmvN10A==
X-Received: by 2002:a63:8c0e:: with SMTP id m14mr66910923pgd.219.1563985355520; 
 Wed, 24 Jul 2019 09:22:35 -0700 (PDT)
Received: from localhost ([184.63.162.180])
 by smtp.gmail.com with ESMTPSA id b3sm61556650pfp.65.2019.07.24.09.22.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 09:22:34 -0700 (PDT)
Date: Wed, 24 Jul 2019 09:22:26 -0700
From: John Fastabend <john.fastabend@gmail.com>
To: Dmitry Vyukov <dvyukov@google.com>, 
 John Fastabend <john.fastabend@gmail.com>
Message-ID: <5d3885c2e2e20_73c32aebc43b65c08@john-XPS-13-9370.notmuch>
In-Reply-To: <CACT4Y+ZbPmRB9T9ZzhE79VnKKD3+ieHeLpaDGRkcQ72nADKH_g@mail.gmail.com>
References: <0000000000001a51c4058ddcb1b6@google.com>
 <CACT4Y+ZGwKP+f4esJdx60AywO9b3Y5Bxb4zLtH6EEkaHpP6Zag@mail.gmail.com>
 <5d37433a832d_3aba2ae4f6ec05bc3a@john-XPS-13-9370.notmuch>
 <CACT4Y+ZbPmRB9T9ZzhE79VnKKD3+ieHeLpaDGRkcQ72nADKH_g@mail.gmail.com>
Subject: Re: kernel panic: stack is corrupted in pointer
Mime-Version: 1.0
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:message-id:in-reply-to:references:subject
 :mime-version:content-transfer-encoding;
 bh=8HMIhpVktcQhLcnMlnSaMxrwzTT+wDaUZPtys8u8fmw=;
 b=Nb+QKuyfZCPgjcPcKYb70rJP06rSomXYL96XBqGn5uwG+aPhQOUW7JWY+ULGJSxE4c
 NI3ItO2Y9gXpAQK0whGKfKhodO1Iz+bnSeIixWjDbzJwNo1f264USDdHmE/g034mNcUe
 Le9IOlBtvAykhqNIZeC3VigzQBzk+VHJZDHZr2E3rI9pL4iwvxexiMfVrAs99zMQZgFY
 MfncWSTWtjEUVs5K3FBLnhcPIxe/BprBx2BbAZvVh8wkhzK5ivmICs08vuvpnqKaGhgA
 O6+icuuP33Hlu1OHPvh8+kHqExvi57GSYzoO2dSODYlwt5J/4RJVaX7IiOlxYvb588D+
 8ihQ==
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
Cc: Marco Elver <elver@google.com>, Daniel Borkmann <daniel@iogearbox.net>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Alexei Starovoitov <ast@kernel.org>, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, DRI <dri-devel@lists.freedesktop.org>,
 netdev <netdev@vger.kernel.org>, alexander.deucher@amd.com,
 syzbot <syzbot+79f5f028005a77ecb6bb@syzkaller.appspotmail.com>,
 leo.liu@amd.com, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RG1pdHJ5IFZ5dWtvdiB3cm90ZToKPiBPbiBUdWUsIEp1bCAyMywgMjAxOSBhdCA3OjI2IFBNIEpv
aG4gRmFzdGFiZW5kIDxqb2huLmZhc3RhYmVuZEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IERt
aXRyeSBWeXVrb3Ygd3JvdGU6Cj4gPiA+IE9uIFdlZCwgSnVsIDE3LCAyMDE5IGF0IDEwOjU4IEFN
IHN5emJvdAo+ID4gPiA8c3l6Ym90Kzc5ZjVmMDI4MDA1YTc3ZWNiNmJiQHN5emthbGxlci5hcHBz
cG90bWFpbC5jb20+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gSGVsbG8sCj4gPiA+ID4KPiA+ID4g
PiBzeXpib3QgZm91bmQgdGhlIGZvbGxvd2luZyBjcmFzaCBvbjoKPiA+ID4gPgo+ID4gPiA+IEhF
QUQgY29tbWl0OiAgICAxNDM4Y2RlNyBBZGQgbGludXgtbmV4dCBzcGVjaWZpYyBmaWxlcyBmb3Ig
MjAxOTA3MTYKPiA+ID4gPiBnaXQgdHJlZTogICAgICAgbGludXgtbmV4dAo+ID4gPiA+IGNvbnNv
bGUgb3V0cHV0OiBodHRwczovL3N5emthbGxlci5hcHBzcG90LmNvbS94L2xvZy50eHQ/eD0xMzk4
ODA1ODYwMDAwMAo+ID4gPiA+IGtlcm5lbCBjb25maWc6ICBodHRwczovL3N5emthbGxlci5hcHBz
cG90LmNvbS94Ly5jb25maWc/eD0zNDMwYTE1MWUxNDUyMzMxCj4gPiA+ID4gZGFzaGJvYXJkIGxp
bms6IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD03OWY1ZjAyODAwNWE3
N2VjYjZiYgo+ID4gPiA+IGNvbXBpbGVyOiAgICAgICBnY2MgKEdDQykgOS4wLjAgMjAxODEyMzEg
KGV4cGVyaW1lbnRhbCkKPiA+ID4gPiBzeXogcmVwcm86ICAgICAgaHR0cHM6Ly9zeXprYWxsZXIu
YXBwc3BvdC5jb20veC9yZXByby5zeXo/eD0xMTFmYzhhZmEwMDAwMAo+ID4gPgo+ID4gPiBGcm9t
IHRoZSByZXBybyBpdCBsb29rcyBsaWtlIHRoZSBzYW1lIGJwZiBzdGFjayBvdmVyZmxvdyBidWcu
ICtKb2huCj4gPiA+IFdlIG5lZWQgdG8gZHVwIHRoZW0gb250byBzb21lIGNhbm9uaWNhbCByZXBv
cnQgZm9yIHRoaXMgYnVnLCBvciB0aGlzCj4gPiA+IGJlY29tZXMgdW5tYW5hZ2VhYmxlLgo+ID4K
PiA+IEZpeGVzIGluIGJwZiB0cmVlIHNob3VsZCBmaXggdGhpcy4gSG9wZWZ1bGx5LCB3ZSB3aWxs
IHNxdWFzaCB0aGlzIG9uY2UgZml4ZXMKPiA+IHBlcmNvbGF0ZSB1cC4KPiA+Cj4gPiAjc3l6IHRl
c3Q6IGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9icGYvYnBm
LmdpdAo+IAo+IENvb2whIFdoYXQgaXMgdGhlIGZpeD8KCkl0IHRvb2sgYSBzZXJpZXMgb2YgcGF0
Y2hlcyBoZXJlLAoKaHR0cHM6Ly93d3cuc3Bpbmljcy5uZXQvbGlzdHMvbmV0ZGV2L21zZzU4Njk4
Ni5odG1sCgpUaGUgZml4IGNvbW1pdHMgZnJvbSBicGYgdHJlZSBhcmUsCgooZ2l0Oi8vZ2l0Lmtl
cm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2JwZi9icGYuZ2l0KSAKCjMxODg5MmFj
MDY4Mzk3ZjQwZmY4MWQ5MTU1ODk4ZGEwMTQ5M2IxZDIKYWM3OGZjMTQ4ZDgyNDlkYmYzODJjMjEy
NzQ1NmRkMDhlYzViMTYxYwpmODdlNjJkNDVlNTFiMTJkNDhkMmNiNDZiNWNkZThmODNiODY2YmM0
CjMxM2FiMDA0ODA1Y2Y1MmE0MjY3M2IxNTg1MmIzODQyNDc0Y2NkODcKMzI4NTdjZjU3ZjkyMGNk
YzAzYjUwOTVmMDhmZWJlYzk0Y2Y5YzM2Ygo0NWE0NTIxZGNiZDkyZTcxYzllNTMwMzFiNDBlMzQy
MTFkM2I0ZmViCjJiYjkwZTVjYzkwZTFkMDlmNjMxYWVhYjA0MWE5Y2Y5MTNhNWJiZTUKMGU4NTg3
MzljMmQyZWVkZWVhYzFkMzViZmEwZWMzY2MyYTcxOTBkOAo5NWZhMTQ1NDc5ZmJjMGEwYzFmZDMy
NzRjZWI0MmVjMDNjMDQyYTRhCgpUaGUgbGFzdCBjb21taXQgZml4ZXMgdGhpcyBwYXRpY3VsYXIg
c3l6Ym90IGlzc3VlLAoKY29tbWl0IDk1ZmExNDU0NzlmYmMwYTBjMWZkMzI3NGNlYjQyZWMwM2Mw
NDJhNGEKQXV0aG9yOiBKb2huIEZhc3RhYmVuZCA8am9obi5mYXN0YWJlbmRAZ21haWwuY29tPgpE
YXRlOiAgIEZyaSBKdWwgMTkgMTA6Mjk6MjIgMjAxOSAtMDcwMAoKICAgIGJwZjogc29ja21hcC90
bHMsIGNsb3NlIGNhbiByYWNlIHdpdGggbWFwIGZyZWUKClRoZSBvdGhlciBjb21taXRzIGFkZHJl
c3Mgc29tZSBvdGhlciBpc3N1ZXMgZm91bmQgd2hpbGUgdGVzdGluZy4KCj4gV2UgZG9uJ3QgbmVl
ZCB0byB3YWl0IGZvciB0aGUgZml4IHRvIHBlcmNvbGF0ZSB1cCAoYW5kIHRoZW4gZG93bgo+IHRv
byEpLiBzeXpib3QgZ3JhY2VmdWxseSBoYW5kbGVzIHdoZW4gYSBwYXRjaCBpcyBub3QgeWV0IHBy
ZXNlbnQKPiBldmVyeXdoZXJlIChpdCBoYXBwZW5zIGFsbCB0aGUgdGltZSkuCgpHcmVhdC4gQnkg
dGhlIHdheSB0aGUgYWJvdmUgc2hvdWxkIGZpeCBtYW55IG9mIHRoZSBvdXRzdGFuZGluZwpyZXBv
cnRzIGFnYWluc3QgYnBmIHNvY2ttYXAgYW5kIHRscyBzaWRlLiBJJ2xsIGhhdmUgdG8gd2FsayB0
aHJvdWdoCmVhY2ggb25lIGluZGl2aWR1YWxseSB0byBkb3VibGUgY2hlY2sgdGhvdWdoLiBJIGd1
ZXNzIHdlIGNhbiBtYXJrCnRoZW0gYXMgZHVwIHJlcG9ydHMgYW5kIHN5emJvdCBzaG91bGQgc29y
dCBpdCBvdXQ/Cgo+IAo+IEJ0dywgdGhpcyB3YXMgZHVlIHRvIGEgc3RhY2sgb3ZlcmZsb3csIHJp
Z2h0PyBPciBzb21ldGhpbmcgZWxzZT8KClJpZ2h0LCBzdGFjayBvdmVyZmxvdyBkdWUgdG8gcmFj
ZSBpbiB1cGRhdGluZyBzb2NrIG9wcyB3aGVyZSBidWlsZCBhCmNpcmN1bGFyIGNhbGwgY2hhaW4u
Cgo+IFdlIGFyZSB0cnlpbmcgdG8gbWFrZSBLQVNBTiBjb25maWd1cmF0aW9uIGRldGVjdCBzdGFj
ayBvdmVyZmxvd3MgdG9vLAo+IHNvIHRoYXQgaXQgZG9lcyBub3QgY2F1c2UgaGF2b2MgbmV4dCB0
aW1lLiBCdXQgaXQgdHVybnMgb3V0IHRvIGJlCj4gbm9uLXRyaXZpYWwgYW5kIG91ciBjdXJyZW50
IGF0dGVtcHQgc2VlbXMgdG8gZmFpbDoKPiBodHRwczovL2dyb3Vwcy5nb29nbGUuY29tL2ZvcnVt
LyMhdG9waWMva2FzYW4tZGV2L0loWXY3UVloTGZZCj4gCj4gCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
