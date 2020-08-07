Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6855123F167
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 18:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A86E9FE;
	Fri,  7 Aug 2020 16:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCAE6E153
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:41:56 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com
 [209.85.161.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8415D20866
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 16:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596818516;
 bh=JIT48tVRZh5QtnoL/3kqeGILzTIHzJZvgKbBayuzwqU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dPP690LZGh53qfbPoHyUj4HNywvQpaH0I2L9T7cN2sYIwZQ4y6AbA37GIcwX7zoge
 OSEn6hsUR1GnTYIcivIindYHmyYBiXDDmzbQ9cnZIKCDl35IPk46zYlyb+bKa85lCI
 iHcx3TvxeaL/TOl46JAj7eGTq8tlN2m1DD815vfY=
Received: by mail-oo1-f41.google.com with SMTP id x6so545294ooe.8
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 09:41:56 -0700 (PDT)
X-Gm-Message-State: AOAM530SdZ25R+UfX1y1UPBij1oJzANaEvzGrmVzEL3Ds7Ec8ZF83FE/
 rYFa1usCJIvEDhfEmYdtzfv7/CHJLDEYg6WGLA==
X-Google-Smtp-Source: ABdhPJxXF7xlJBdJbBfvgJ7wVxDHE0mBYYElrK+mZmq/H0MW2EPUj3703ciHpT2JonAPVTvSMnecxOdH4pb5oGlg/eE=
X-Received: by 2002:a4a:a60a:: with SMTP id e10mr13335121oom.25.1596818515873; 
 Fri, 07 Aug 2020 09:41:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200614063619.44944-1-navid.emamdoost@gmail.com>
In-Reply-To: <20200614063619.44944-1-navid.emamdoost@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 7 Aug 2020 10:41:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKvrKU6RScJSsHFNn7GHx0N9XCdZmNupRGDqg4h0UKV9w@mail.gmail.com>
Message-ID: <CAL_JsqKvrKU6RScJSsHFNn7GHx0N9XCdZmNupRGDqg4h0UKV9w@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: perfcnt: fix ref count leak in
 panfrost_perfcnt_enable_locked
To: Navid Emamdoost <navid.emamdoost@gmail.com>
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
Cc: wu000273@umn.edu, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, mccamant@cs.umn.edu,
 Navid Emamdoost <emamd001@umn.edu>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 12:36 AM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> in panfrost_perfcnt_enable_locked, pm_runtime_get_sync is called which
> increments the counter even in case of failure, leading to incorrect
> ref count. In case of failure, decrement the ref count before returning.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Applied.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
