Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517671EBB88
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 14:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7C56E1D3;
	Tue,  2 Jun 2020 12:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F6BD6E1D3
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 12:21:57 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id s192so840331vkh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 05:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uhS6wUtL1nQqq687nk7bY+rt6oHfCz/bP20I3cjBhSw=;
 b=iS1cNpg05xcEK6kyHjMSJ22ATuO9KFDUcoDquBU2iOe8OtEp/aHvoOY+Hc1jbuHZ1j
 /Zf/spKV28Tbu++/etF4Zjj4sXvh8pAXYEwRxpTd1PNTIZGqQQJMnllTJIXyTvig+rl7
 ONIP/BDM5lHyDtCrPjr1f21Oc9Ywr8DNAM0/z8teiTSPg84vkpYs7bwL7S0qIB8mmj3v
 mf9cWjDavFRqvO/HxzSGtzUfqAggg0QxBs0uvP1uv0pRsy+lSebm+Nv0HhZ2FR2wX0HW
 cXjB8Ebc8hym8wolXa/Elydr/XWJoBacagzzpPtMsoudz8jLUVGbIiOVugOlM5dRixRi
 NKWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uhS6wUtL1nQqq687nk7bY+rt6oHfCz/bP20I3cjBhSw=;
 b=XZw5nARrBE+/wLoYJlEKFSgsxXoda+V2X/HOL6AedJSdXrKJmpxgvpBK91zcf31n4n
 PKlb4vYr5VYTS5P96jhXWRUvgpEpO/2tpFwjteyYseYfwEJSGh53mWlGYzXzSIxkCZdA
 kctKoE2U1HBFS6LUwYUYkglDmLB4aQ18KJyS8lEenh2DXYW/ba5zn1UZTOqPzkb/PP73
 HH2xM6eFzPOjNE4rlqVEM0qXLqr0Hp4WksqIx8Y+nDfY6D2OAf5cnrtJvJ/IZ3uqp5Lm
 M0LJJDBODYr1jxOItdDkVHI9n/1EJ+ib7rEExuCiEqSh6H5EmpbheTATV2I50zKO4GwZ
 KitQ==
X-Gm-Message-State: AOAM531CG6XsxpOvqglmZBS4x7/yWLs4TSJPmKwebfyNce0BI7dsO3QZ
 Y4WfvG//gz44oW6RnlwTEzx5K/pk9DPc4qOUqpg=
X-Google-Smtp-Source: ABdhPJyFkrbYplf5gWUM2GeUq/gzW7pUpT6I7Z+yO1zl/pK104ACL5dbJongfx+Bv5rPOloANFKde8VOkcaaziUl7fU=
X-Received: by 2002:a1f:2ac6:: with SMTP id q189mr8911630vkq.28.1591100516362; 
 Tue, 02 Jun 2020 05:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200531131237.24781-1-realwakka@gmail.com>
 <CACvgo50SzjUe6usELF33qXW3BWZmH5U4ynPTBorZLDrG-Nx2Pw@mail.gmail.com>
 <20200601002520.hajvtpefi7yzvmuq@smtp.gmail.com>
In-Reply-To: <20200601002520.hajvtpefi7yzvmuq@smtp.gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 13:18:38 +0100
Message-ID: <CACvgo52Vh92TFwMqgagMsopW9yAZ6FGXgyXHu9Bhe3qqPSPcHg@mail.gmail.com>
Subject: Re: [PATCH] drm/vkms: Optimize compute_crc(), blend()
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, David Airlie <airlied@linux.ie>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sidong Yang <realwakka@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 1 Jun 2020 at 01:25, Rodrigo Siqueira
<rodrigosiqueiramelo@gmail.com> wrote:
>
> Hi,
>
> First of all, thanks a lot for all your patch. And thanks Emil for your
> feedback.
>
> I have a suggestion here:
>
> Emil:
> Could you give me your Acked-by or maybe Reviewed-by for the writeback
> series? With that, I can finally apply the series.
>
Sure, once the issues highlighted are resolved. Just left you some
more comprehensive feedback.

-Emil
P.S. Something something top posting sucks :-P
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
