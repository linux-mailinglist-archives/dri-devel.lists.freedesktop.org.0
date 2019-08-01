Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8881B7E2AE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 20:53:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E99E6E77A;
	Thu,  1 Aug 2019 18:53:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961AC6E77A;
 Thu,  1 Aug 2019 18:53:41 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id g67so60015099wme.1;
 Thu, 01 Aug 2019 11:53:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hpA12FK0W1igWSv43IQyfHUTzmV9ZaN2qt5GlMGeIqQ=;
 b=j2n2P/1Cb97+WBT4ZBmeu4n1SB1Fx0qBk+vevp/NjNJOQF0gM5uuBhv5j62VHUwe3l
 o3UrRc1tfjznqnnEB6bEL6bHlQFK2eyW6xqGOdP2aPibQqhrACP80woo10dp9s4HD9Qc
 N9nNk2zkku/PEBCnmFzdvhwDb3xoIb/sEDqn3Dq/TRq4YgLoPF4tk1OhSoB5d+Vjee6/
 uVvONAOJwyhdBo+V+smdoUCvfg2OcFn7wp5UwbfeZkaJAazqaoCzHbHwN5m6AFSSibZ6
 ujpjn/8CxQRrVmF+ZRjheyIcXs1kWcBOGM0Tqe8ys3q8l4kkauEYbGgmzFd9A5AiUsPg
 iSvw==
X-Gm-Message-State: APjAAAWt6L76oxrMa3lT/esRW1tEuXjIB0L4l6QdG6aOS0ySS+c5roOB
 FQzWUrgDKwJAFsQV27fQvxA1YJnrhrXI3eRHu68=
X-Google-Smtp-Source: APXvYqwxMAW3EGWSfiHH8NVLzKrNiRVg+4h4WutnKjYpl4NniuItwAt2RcjlWjdKHCF+eI1la04rb0LeZj2R+mji6pA=
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr168497wme.102.1564685619961; 
 Thu, 01 Aug 2019 11:53:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190801111541.13627-1-colin.king@canonical.com>
In-Reply-To: <20190801111541.13627-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Aug 2019 14:53:28 -0400
Message-ID: <CADnq5_OqLtvBWXJhT9c=kxK3HeXSEDdfYS1N7Dh68kbiiLk5+w@mail.gmail.com>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upper bounds
 limit checks
To: Colin King <colin.king@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hpA12FK0W1igWSv43IQyfHUTzmV9ZaN2qt5GlMGeIqQ=;
 b=gtMEStmAFd31BMXpGF4zhD+ld7F8xGcjaP+pHwnSRp0BTfpM66hPkcTHcfrGK5+ilb
 guxlrrTS/h9fM0PEzKclnfMfzVmMap7CnI1/2O748Q8+IdZXgg4gEvow2mv6KSb7CGUz
 amwlkNos23xZzdmDGZ320LBlAdq3tKHIQJYxQIc7AWd4/E7Dgl4ZUzfICe6mznxsULma
 64bFDnyvhmwbgTs+OXW6540nPzO+AS12dyAtFDvZYsJbONlUlttwzucH96ZjQ82pftbp
 qV7vaKOKnCWX8Tb0wYv6m8g4pDYbfHYMtlci02cuTU/u1iF1eRvLgiPZWGxwhuQp35pZ
 h00Q==
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
Cc: David Airlie <airlied@linux.ie>, Kevin Wang <kevin1.wang@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMSwgMjAxOSBhdCA3OjE1IEFNIENvbGluIEtpbmcgPGNvbGluLmtpbmdAY2Fu
b25pY2FsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBDb2xpbiBJYW4gS2luZyA8Y29saW4ua2luZ0Bj
YW5vbmljYWwuY29tPgo+Cj4gVGhlcmUgYXJlIHR3byBvY2N1cnJhbmNlcyBvZiBvZmYtYnktb25l
IHVwcGVyIGJvdW5kIGNoZWNraW5nIG9mIGluZGV4ZXMKPiBjYXVzaW5nIHBvdGVudGlhbCBvdXQt
b2YtYm91bmRzIGFycmF5IHJlYWRzLiBGaXggdGhlc2UuCj4KPiBBZGRyZXNzZXMtQ292ZXJpdHk6
ICgiT3V0LW9mLWJvdW5kcyByZWFkIikKPiBGaXhlczogY2IzMzM2M2QwZTg1ICgiZHJtL2FtZC9w
b3dlcnBsYXk6IGFkZCBzbXUgZmVhdHVyZSBuYW1lIHN1cHBvcnQiKQo+IEZpeGVzOiA2YjI5NDc5
M2UzODQgKCJkcm0vYW1kL3Bvd2VycGxheTogYWRkIHNtdSBtZXNzYWdlIG5hbWUgc3VwcG9ydCIp
Cj4gU2lnbmVkLW9mZi1ieTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNv
bT4KCkFwcGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9hbWRncHVfc211LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2Vy
cGxheS9hbWRncHVfc211LmMKPiBpbmRleCBkMDI5YTk5ZTYwMGUuLmI2NDExMzc0MGViNSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9hbWRncHVfc211LmMKPiBAQCAtMzgs
NyArMzgsNyBAQCBzdGF0aWMgY29uc3QgY2hhciogX19zbXVfbWVzc2FnZV9uYW1lc1tdID0gewo+
Cj4gIGNvbnN0IGNoYXIgKnNtdV9nZXRfbWVzc2FnZV9uYW1lKHN0cnVjdCBzbXVfY29udGV4dCAq
c211LCBlbnVtIHNtdV9tZXNzYWdlX3R5cGUgdHlwZSkKPiAgewo+IC0gICAgICAgaWYgKHR5cGUg
PCAwIHx8IHR5cGUgPiBTTVVfTVNHX01BWF9DT1VOVCkKPiArICAgICAgIGlmICh0eXBlIDwgMCB8
fCB0eXBlID49IFNNVV9NU0dfTUFYX0NPVU5UKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gInVu
a25vd24gc211IG1lc3NhZ2UiOwo+ICAgICAgICAgcmV0dXJuIF9fc211X21lc3NhZ2VfbmFtZXNb
dHlwZV07Cj4gIH0KPiBAQCAtNTEsNyArNTEsNyBAQCBzdGF0aWMgY29uc3QgY2hhciogX19zbXVf
ZmVhdHVyZV9uYW1lc1tdID0gewo+Cj4gIGNvbnN0IGNoYXIgKnNtdV9nZXRfZmVhdHVyZV9uYW1l
KHN0cnVjdCBzbXVfY29udGV4dCAqc211LCBlbnVtIHNtdV9mZWF0dXJlX21hc2sgZmVhdHVyZSkK
PiAgewo+IC0gICAgICAgaWYgKGZlYXR1cmUgPCAwIHx8IGZlYXR1cmUgPiBTTVVfRkVBVFVSRV9D
T1VOVCkKPiArICAgICAgIGlmIChmZWF0dXJlIDwgMCB8fCBmZWF0dXJlID49IFNNVV9GRUFUVVJF
X0NPVU5UKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gInVua25vd24gc211IGZlYXR1cmUiOwo+
ICAgICAgICAgcmV0dXJuIF9fc211X2ZlYXR1cmVfbmFtZXNbZmVhdHVyZV07Cj4gIH0KPiAtLQo+
IDIuMjAuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
