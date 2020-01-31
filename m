Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9194F14E924
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 08:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50AB6E94D;
	Fri, 31 Jan 2020 07:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90C626E94D
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 07:34:20 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so7450243wro.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 23:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=owDgY2hN74svhwO6V6vESJaP7KSYIDvwh0UpgYJP8tc=;
 b=W5QRTWPq5V1gfy2LTbkoaVWqpWIoew8i2DeZXV+kuXCdSPClSdS8DrQsRlQaLiqrn7
 SabGhJ0iUS/0C9J+n+RaDAKKMwWFY6K5vb6OVMjFSFlUUU9UYeC80j6CVbXtvdWem14s
 IsH/Hjq9Oa5D0p7TSXPBQTztEm1Mcdgik97M1ALqmknH/s18LhzHAHlhoyE14iXhsW3W
 GiTb0w9nkasDAUls/iGZp+RyZP+T8wiYazTdY1DAVB4e7F6+Zeit+HobTIrVOuZbNaNp
 tbtcHlWhTEqviWnCbABW5hHpVC3tN9c40PnMngS1eOjUo5SqMFNmth405QeznNdb925G
 VSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=owDgY2hN74svhwO6V6vESJaP7KSYIDvwh0UpgYJP8tc=;
 b=CwdSD4Z0JB/D7GjS60bct88afixXCdPHfzy1cr+HOFtyd9ZRsAb0qQB5LWBRCteV5Q
 gcfoU5amof9QNP5aYKUmb7ejjXj1E9l0b0nnGJ24Ce0yppIpAjf5xqbunpVMH7x0kgo3
 afdg5n/N8YJ0A8vEWRIK5VZ/JnFmPcHitqW400gibBziAIdaEY1CU6DnNEpikelBRss6
 0I5xf5jFtKziDm6pxHOOV6cxiUlLXL+2Yoz4D0E/12RoxhTG8LHufA+fyppIIPXfbK/G
 IqOBTUaciK3XH0USFhynPzdHmgHT1yJAmgUiT3cqL5ptAmbcZe5lgc/KCJX7TpVQTKVd
 rXxg==
X-Gm-Message-State: APjAAAU0OTNUr3tJ3Jk+5X/Fr4IRtnoh/GKs+EUPc6QPJF+ZScM65Uau
 Att/dwchadR7SIxRcJrz+I9vvnFoE2vUL6KC8k1wgQ==
X-Google-Smtp-Source: APXvYqxE2D1GUZqbFQ7juYd6KtGB0wWZIYc2Q/xIq23fGh/WL0GBK5zKH9bzu3lOwV9+kWP54Y3iKcuDHp21ot8TOJQ=
X-Received: by 2002:a5d:6445:: with SMTP id d5mr8923297wrw.244.1580456059067; 
 Thu, 30 Jan 2020 23:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20180705102121.5091-1-daniel.vetter@ffwll.ch>
From: Daniel Stone <daniel@fooishbar.org>
Date: Fri, 31 Jan 2020 07:34:00 +0000
Message-ID: <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Jul 2018 at 11:21, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> pull in arbitrary other resources, including CRTCs (e.g. when
> reconfiguring global resources).
>
> But in nonblocking mode userspace has then no idea this happened,
> which can lead to spurious EBUSY calls, both:
> - when that other CRTC is currently busy doing a page_flip the
>   ALLOW_MODESET commit can fail with an EBUSY
> - on the other CRTC a normal atomic flip can fail with EBUSY because
>   of the additional commit inserted by the kernel without userspace's
>   knowledge
>
> For blocking commits this isn't a problem, because everyone else will
> just block until all the CRTC are reconfigured. Only thing userspace
> can notice is the dropped frames without any reason for why frames got
> dropped.
>
> Consensus is that we need new uapi to handle this properly, but no one
> has any idea what exactly the new uapi should look like. As a stop-gap
> plug this problem by demoting nonblocking commits which might cause
> issues by including CRTCs not in the original request to blocking
> commits.

Thanks for writing this up Daniel, and for reminding me about it some
time later as well ...

Reviewed-by: Daniel Stone <daniels@collabora.com>

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
