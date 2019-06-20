Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F6D4D4A5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 19:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2947F6E5D7;
	Thu, 20 Jun 2019 17:14:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com
 [IPv6:2607:f8b0:4864:20::943])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924D16E5D7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 17:14:33 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id v20so1954282uao.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2019 10:14:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GR6x4on2th+OpGEr++2MdtxVD5WfNFN9wx4DvQ5w7Rc=;
 b=IXfYvJzTncCKq3DZ2eoy+q2dGsocyCUNYpzzVGi72AfGSe6d4oRhaLFf1ih+1u0LGF
 bYXRh2RHQdy3Iai0Xcq+eJcX+SOlGph9RexTeJo9M7JYy7kauuNp45Yr7A77U8OvE2Rl
 w24ZObIWTE0VfSKHhD/22xP2hDY21F8XeDhH8oHzP1uYsXdIHD3/MlDM8oyMq11xQnmJ
 SdiMQmPwYuepZxuav+8I9inAIWD47hmrE376b2URV4iX+jQhqGCa8v9Lh3zUmWg20iSY
 fCKAz4mEuu5H58cVX6Npf55feXyWzPLy4k+kb+W5gUhys7xUl5tPFZZ6YjHFaqMCr0Z9
 nSEg==
X-Gm-Message-State: APjAAAWw/OWngVdr8hmRapWrPOn0sOsGb8CAU41kHY9RBK72sYyRccug
 bKJsHwxQLMnDOgU1Ago1tSNbr1CtIq7wA03bxUc=
X-Google-Smtp-Source: APXvYqy13gguR6NEUfCLLKpXnDy4AttZXqs4ykBs0SX9Cxiei5TfjAP35fuOn0fKJ5MLZcb+jT6s0DLzf4BvjOV0F9U=
X-Received: by 2002:ab0:2556:: with SMTP id l22mr9364887uan.46.1561050872751; 
 Thu, 20 Jun 2019 10:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
In-Reply-To: <1560755897-5002-1-git-send-email-yannick.fertre@st.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 20 Jun 2019 18:12:16 +0100
Message-ID: <CACvgo50vSNCTTTKp9D_07tazOE9YkU-zKAsDywvWe6h0NgcEmQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] drm/stm: drv: fix suspend/resume
To: =?UTF-8?Q?Yannick_Fertr=C3=A9?= <yannick.fertre@st.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GR6x4on2th+OpGEr++2MdtxVD5WfNFN9wx4DvQ5w7Rc=;
 b=V8bIRrbAwIjB8y/e3VK5hdGQiO8fdK96fE89vK+8xM34pSYwtIAitElGMyEc8eEZ8Y
 JNN2Dm3GQX4EuHrYdTR03KQM7saTG0dG9xx5zg8ZkNjOfIr6ls5jeWmDIaheAotE/Yfs
 HELQdZl4/gheu42t/o9XX2Hh2YkYYtpBtob1vLOLhf9cgFBMV0rKwK8fnXV2suKtO/C4
 XaCv7FZXM2vP1vPi93jU4r/GnJzEFBq/C2BcDaw/yl5TkAlj+EOjsIQ+vkSq6f4v28Z8
 W3CDYr6Ag4umJu04mO2GC/WVWTh8HbyridbYuXZEfCtzeI4aRTnbJLsQ1DmiR9jSu4Ai
 gbtw==
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
Cc: David Airlie <airlied@linux.ie>, Philippe Cornu <philippe.cornu@st.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 Benjamin Gaignard <benjamin.gaignard@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgWWFubmljaywKCk9uIE1vbiwgMTcgSnVuIDIwMTkgYXQgMDg6MTgsIFlhbm5pY2sgRmVydHLD
qSA8eWFubmljay5mZXJ0cmVAc3QuY29tPiB3cm90ZToKCj4gQEAgLTE1NSwxNSArMTU0LDE3IEBA
IHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgZHJ2X3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gICAgICAgICBzdHJ1Y3QgbHRkY19kZXZpY2UgKmxkZXYgPSBkZGV2LT5kZXZfcHJpdmF0ZTsK
PiAgICAgICAgIGludCByZXQ7Cj4KPiArICAgICAgIGlmIChXQVJOX09OKCFsZGV2LT5zdXNwZW5k
X3N0YXRlKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKwo+ICAgICAgICAg
cG1fcnVudGltZV9mb3JjZV9yZXN1bWUoZGV2KTsKPiAgICAgICAgIHJldCA9IGRybV9hdG9taWNf
aGVscGVyX3Jlc3VtZShkZGV2LCBsZGV2LT5zdXNwZW5kX3N0YXRlKTsKPiAtICAgICAgIGlmIChy
ZXQpIHsKPiArICAgICAgIGlmIChyZXQpCkhtbSB0aGUgbXNtIGRyaXZlciB1c2VzICFyZXQgaGVy
ZS4gU3VzcGVjdGluZyB0aGF0IHlvdSB3YW50IHRoZSBzYW1lLAphbHRob3VnaCBJIGhhdmVuJ3Qg
Y2hlY2tlZCBpbiBkZXRhaWwuCgpIVEgKLUVtaWwKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
