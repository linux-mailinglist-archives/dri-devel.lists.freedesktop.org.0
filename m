Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6B14EB45
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2019 16:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0584B6E8D3;
	Fri, 21 Jun 2019 14:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com
 [IPv6:2607:f8b0:4864:20::a43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E61BD6E8E1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 14:55:50 +0000 (UTC)
Received: by mail-vk1-xa43.google.com with SMTP id k1so1354685vkb.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2019 07:55:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McASa29lxjZpj0oJ3ZfQEaOaFXbUU/UG3+m1x1GG8co=;
 b=EriqPQqn2IfTCQA4Qa6dpSxJW7wHU0FhFOyWW4PfWsRn4PNFe4HmGdsHeEMoS+Nt2B
 wVqs70cPJ8wPAypCEA4o7qEoncFzuN2ex3ZO8t80kQf1JUxUFdpG3OWTyBe4aQ6SsH8m
 IP5vOkiMAMoyxkk3d91sY737U8+NKal3ILK9U0XYpT50rtZ6C3MHQQFFGpInLwaq05vc
 dmR2jyyP3Tm7FramqZJ3ZZiD1dZPXIjJDylZtetOBksb3ekpOumKcR1jx+YSyM39yJ2V
 sGEpvIC5Ohy784rwnWCL3ZfzrDOFo50rmo7XgGIcaQjqpRZBYUR1Gy6mSpD/JN2kek9E
 M/3A==
X-Gm-Message-State: APjAAAWdrBGRHYjhXUq26EHFp4oPmOE90LKUoJepULU+MQjCPSZf06Fh
 WsAD8TnNHRESTljgB3TJosWvbmNcNkM8LL2P6L8=
X-Google-Smtp-Source: APXvYqxCcxQEXetp+8qxWOCkYRfCFeSjQTr5ue+VK7qlD1hltuVYOFpeQY0fPGUN+r8Luu/8sd8vTD7bA2pcXXHSCQ0=
X-Received: by 2002:a1f:14c1:: with SMTP id 184mr9771787vku.69.1561128950035; 
 Fri, 21 Jun 2019 07:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
 <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
 <2c169739-febb-12a9-0fa1-d5da053ded67@st.com>
In-Reply-To: <2c169739-febb-12a9-0fa1-d5da053ded67@st.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Fri, 21 Jun 2019 15:53:32 +0100
Message-ID: <CACvgo52tK2Gaz7wzJ0Cw1rKsTog6PbGF4G8at=cO-oyiEZ4EUg@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/stm: drv: fix suspend/resume
To: Yannick FERTRE <yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=McASa29lxjZpj0oJ3ZfQEaOaFXbUU/UG3+m1x1GG8co=;
 b=X3xAV4NyA3y9UzA2IA/Mk+qrbdrPKZIojhR+endGbpMJCR38xtZNqJ9k22djG6EF8T
 lgeu4QQxt/tsghp0XWw3YgkSmM36uLQez2tVp4MN+NadgIHC0T2hblyRbSo9szBtCly7
 Wl/mDoc9QOORA8aKlSOXdTAQ2mVhqtKyuShPZOn9t5BGSWAGAHhGSbwIAFb5WEVoeR7E
 kP+EjwXcBAkzjawd196Z/h9+budQycSYG4WoqpHICVdO3OTu0jmpgEthvef+K46SvBJp
 k+whefb30M+1PGYlpvNw5ZQWAt4m/unHVMNLGpia4S28NYrHiRibidO0Ao1/uRPdY6o9
 rBaQ==
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
Cc: David Airlie <airlied@linux.ie>, Philippe CORNU <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alexandre TORGUE <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Benjamin GAIGNARD <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMSBKdW4gMjAxOSBhdCAxNTowMSwgWWFubmljayBGRVJUUkUgPHlhbm5pY2suZmVy
dHJlQHN0LmNvbT4gd3JvdGU6Cj4KPiBIaSBFbWlsLAo+Cj4gVGhlIG1zbSBkcml2ZXIgdGVzdHMg
dGhlIHJldHVybiB2YWx1ZSAmIHNldCBzdGF0ZSB0byBOVUxMIGlmIG5vIGVycm9yIGlzCj4gZGV0
ZWN0ZWQuCj4KPiB0aGUgbHRkYyBkcml2ZXIgdGVzdHMgdGhlIHJldHVybiB2YWx1ZSAmIGZvcmNl
IHRvIHN1c3BlbmQgaWYgYW4gZXJyb3IgaXMKPiBkZXRlY3RlZC4KPgo+IEl0J3Mgbm90IGV4YWN0
bHkgdGhlIHNhbWUuCj4KRCdvaCBJJ3ZlIG1pc3JlYWQgdGhhdCBwYXRjaCBhcyBwbV9ydW50aW1l
X2ZvcmNlX3N1c3BlbmQoKSBiZWluZwpjYWxsZWQgd2hlbiB0aGUgYXRvbWljIGhlbHBlciBzdWNj
ZWVkcy4KClRoYW5rcyBmb3IgdGhlIGNvcnJlY3Rpb24gOi0pCkVtaWwKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
