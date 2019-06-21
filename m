Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D54C4E6AD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 13:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7E6E369;
	Fri, 21 Jun 2019 11:04:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAE66E369
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 11:04:11 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id x21so5845353otq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 04:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pIOqozyfhKn7m4WqYpghwoY1TJqz2U4IccNzhyYz6Es=;
 b=qiSYrlu5IjxtdgpLRBKn92Nhi2OrjLWMsxFbe731lWmUa1o0c/yEmGDf4NGJ4Pc7Fj
 0TFZC6ebq6L7idGxoRUBypTqQn/8RPt7lz1A3b9q5x/nai/tRLy8uHqJuOL7yhQdFBuw
 oyIJBfR3vUfJnHNx+3eAHbuQEEgl7l2zKWsibMrfSCf1r7D8jsDJMC8A6T80MuoEMBUS
 /4J1u4iWFBNVJBwDf0eAvXLtvKovY4sDklZh4Kx5FI2SbWwlgYmWdFof/jGTlgCJU+CJ
 E0j+wjnX/0qknItqsF6HLpPhIApAQ8XP/eiTAJChvrnhwm1D+Vk7SwwJbTuBcEu4YATq
 zYag==
X-Gm-Message-State: APjAAAW/04ylylCpmXdyHpA5082rtrQcyxMdBGS4tqdNf266LrnLnw4w
 flI2882SU/3koJ8snN/kla1up3AV8TiWXW36+64UfQ==
X-Google-Smtp-Source: APXvYqwO/wEmqou5zJ8QJ+yhVQRy7JZz/4b+sHT0KTFpydR7fijuhMaovXeGjdL1tgJfrN+z6pvREOxbOBclWVoUNLM=
X-Received: by 2002:a05:6830:4b:: with SMTP id
 d11mr12884576otp.106.1561115050405; 
 Fri, 21 Jun 2019 04:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190614120927.GA32412@arch-x1c3>
 <9dbdda6c-8916-e5ae-1676-86828b9890e7@amd.com>
 <20190614155325.GC32412@arch-x1c3>
 <84b3337c-0cdc-44d4-02c6-c56bd729ed47@amd.com>
 <20190620163012.GF1896@arch-x1c3>
 <9cad6e74-4751-0b0a-35d1-e8f0ac4d3efc@amd.com>
 <20190621090953.GZ12905@phenom.ffwll.local>
 <be9f38f5-6bb5-9535-f3d9-bafa83370e0f@amd.com>
 <CAKMK7uE5qO4q3RYNDp22gkMSSJGgz9ChxhuWPYqXO6D1UUvy6Q@mail.gmail.com>
 <20190621102015.GA21486@arch-x1c3>
 <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
In-Reply-To: <d241fab3-b6f0-d38a-b83f-03b70736b355@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 21 Jun 2019 13:03:54 +0200
Message-ID: <CAKMK7uEVziNZJES9=JFBUu=LpmubS8=-A654cMN+QqhEmc8Fvw@mail.gmail.com>
Subject: Re: [PATCH 01/13] drm/amdgpu: introduce and honour DRM_FORCE_AUTH
 workaround
To: "Koenig, Christian" <Christian.Koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=pIOqozyfhKn7m4WqYpghwoY1TJqz2U4IccNzhyYz6Es=;
 b=WdkLiK+VPn1xy4PSmOD/GUACJs+7cJxRLb1+S68YHHWhg59/iPi+b/uu88Lj0sjtmP
 7x5MJ3BY0K8lz268Zmp4sj2r3A/0SLOHmGzrXneV8uxyvArX4lUejedP8+RqF4rQMF4y
 ymyPqxCiBBvcT1Me33K3hzSeKLR1Sx5uDMWGw=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjEsIDIwMTkgYXQgMTI6MzEgUE0gS29lbmlnLCBDaHJpc3RpYW4KPENocmlz
dGlhbi5Lb2VuaWdAYW1kLmNvbT4gd3JvdGU6Cj4gQW0gMjEuMDYuMTkgdW0gMTI6MjAgc2Nocmll
YiBFbWlsIFZlbGlrb3Y6Cj4gPiBJbiBwYXJ0aWN1bGFyLCB0aGF0IHVzZXItc3BhY2Ugd2lsbCAi
cmVtb3ZlIiByZW5kZXIgbm9kZXMuCj4KPiBZZXMsIHRoYXQgaXMgbXkgbWFpbiBjb25jZXJuIGhl
cmUuIFlvdSBiYXNpY2FsbHkgbWFrZSByZW5kZXIgbm9kZXMKPiBzdXBlcmZsdW91c2x5LiBUaGF0
IGdpdmVzIHVzZXJzcGFjZSBhbGwgbGVnaXRpbWl6YXRpb24gdG8gYWxzbyByZW1vdmUKPiBzdXBw
b3J0IGZvciB0aGVtLiBUaGF0IGlzIG5vdCBzdHVwaWQgb3IgZXZpbCBvciB3aGF0ZXZlciwgdXNl
cnNwYWNlCj4gd291bGQganVzdCBmb2xsb3cgdGhlIGtlcm5lbCBkZXNpZ24uCgpUaGlzIGFscmVh
ZHkgaGFwcGVuZWQuIEF0IGxlYXN0IGZvciBrbXMtb25seSBkaXNwbGF5IHNvY3Mgd2UgaGFkIHRv
CmhpZGUgdGhlIHNlcGFyYXRlIHJlbmRlciBub2RlIChhbmQgdGhlcmUgeW91IHJlYWxseSBoYXZl
IHRvIGRlYWwgd2l0aAp0aGUgc2VwYXJhdGUgcmVuZGVyIG5vZGUsIGJlY2F1c2UgaXQncyBhIGRp
c3RpbmN0IGRyaXZlcikgZW50aXJlbHkKd2l0aGluIGdibS9tZXNhLgoKU28gaWYgeW91IHdhbnQg
dG8gZGVwcmFjYXRlIHJlbmRlciBmdW5jdGlvbmFsaXR5IG9uIHByaW1hcnkgbm9kZXMsIHlvdQpf
aGF2ZV8gdG8gZG8gdGhhdCBoaWRpbmcgaW4gdXNlcnNwYWNlLiBPciB5b3UnbGwgYnJlYWsgYSBs
b3Qgb2YKY29tcG9zaXRvcnMgZXZlcnl3aGVyZS4gSnVzdCB0ZXN0aW5nIC1hbWRncHUgZG9lc24n
dCByZWFsbHkgcHJvdmUKYW55dGhpbmcgaGVyZS4gU28geW91IHdvbid0IG1vdmUgdGhlIGxhcmdl
ciBlY29zeXN0ZW0gd2l0aCB0aGlzIGF0CmFsbCwgdGhhdCBzaGlwIHNhaWxlZC4KCkF0IHRoYXQg
cG9pbnQgdGhpcyBhbGwgZmVlbHMgbGlrZSBhIGJpa2VzaGVkLCBhbmQgZm9yIGEgYmlrZXNoZWQg
SQpkb24ndCBjYXJlIHdoYXQgdGhlIGNvbG9yIGlzIHdlIHBpY2ssIGFzIGxvbmcgYXMgdGhleSdy
ZSBhbGwgcGFpbnRlZAp0aGUgc2FtZS4KCk9uY2Ugd2UgcGlja2VkIGEgY29sb3IgaXQncyBhIHNp
bXBsZSB0ZWNobmljYWwgbWF0dGVyIG9mIGhvdyB0byByb2xsCml0IG91dCwgdXNpbmcgS2NvbmZp
ZyBvcHRpb25zLCBvciBvbmx5IGVuYWJsaW5nIG9uIG5ldyBodywgb3IgIm1lcmdlCmFuZCBmaXgg
dGhlIHJlZ3Jlc3Npb25zIGFzIHRoZXkgY29tZSIgb3IgYW55IG9mIHRoZSBvdGhlciB3ZWxsIHBy
b3ZlbgpwYXRocyBmb3J3YXJkLgoKU28gaWYgeW91IHdhbnQgdG8gZG8gdGhpcywgcGxlYXNlIHN0
YXJ0IHdpdGggdGhlIG1lc2Egc2lkZSB3b3JrIChhcwp0aGUgYmlnZ2VzdCB1c2Vyc3BhY2UsIG5v
dCBhbGwgb2YgaXQpIHdpdGggcGF0Y2hlcyB0byByZWRpcmVjdCBhbGwKcHJpbWFyeSBub2RlIHJl
bmRlcmluZyB0byByZW5kZXIgbm9kZXMuIFRoZSBjb2RlIGlzIHRoZXJlIGFscmVhZHkgZm9yCnNv
Y3MsIGp1c3QgbmVlZHMgdG8gYmUgcm9sbGVkIG91dCBtb3JlLiBPciB3ZSBnbyB3aXRoIHRoZSBE
Uk1fQVVUSApob3Jyb3JzLiBPciBhIDNyZCBvcHRpb24sIEkgcmVhbGx5IGRvbid0IGNhcmUgd2hp
Y2ggaXQgaXMsIGFzIGxvbmcgYXMKaXRzIGNvbnNpc3RlbnQuCgp0bGRyOyBjb25zaXN0ZW50IGNv
bG9yIGNob2ljZSBvbiB0aGlzIGJpa2VzaGVkIHBsZWFzZS4KClRoYW5rcywgRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgorNDEgKDAp
IDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
