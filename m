Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9136BE0B8
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 06:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7F2710E042;
	Fri, 17 Mar 2023 05:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC8910E096
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 05:45:09 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id r11so16198253edd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 22:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679031908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TgAr+7MbgSgBE6+bznkWCTwreN6WsZWhg3XH+EqHEkM=;
 b=jCNu3e/olNK/ZE5UWvofMAIlVMleN17qxAHXPN6z8Te7Cyxz1pf9R7osnrvYd3oVIB
 ab93AAKN6/OJFSzJLhJaoLmOf5psD3zJd44bM+j6N9pov882Z1FDBKsxbfDoMFtJareh
 vbdx90R48Xjs0CZXFAgknqNKk/FoGVnUKjGDOlemVRwUVaceLOdj60GsgVi9ujknNkYV
 wrFfHWPkDayU9tenrvnMndud/yR/ypq0PJdyBCXdZTbZQ+ng6AvYDpJDaDLPftJOuaIP
 ib01Vsc4F3wMoz63qSSoGtAYcjSGxlvKlZA9WOz1lrKtHF+a74klKyLQZW7jOQoavI3q
 FM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679031908;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TgAr+7MbgSgBE6+bznkWCTwreN6WsZWhg3XH+EqHEkM=;
 b=AYZ8sOkksgZrb/tCoYEau87L2MZUt4r20aueRa4sFYtxPqCK8I5FLsAqYK7bgY/fSU
 NPbCOdzgT0mnpkRzDYiIrFwlWNpsi+f7upKeo1X6h9gZMtPtaVBRtpWqII9O5221x5Zj
 wYhXmIzm3DOXTn4HV6+UpQpaME8yf1sfdQVQbQcsaqA0kE/E+twqmfVr7+b4PUwHgU0+
 9L7DNvijo1ttbrrX7MB6n4KjsQIbg8mQhfzhPAJWKvAj/rHTziN9OH6dlenzVu1g/xU0
 Kz6tjWe0m1Zb9wb2GMGe3w4jUw23GRgvoo48u7kjumshF4TnOyKZzWxkSwt8nSIr6z8b
 mbbw==
X-Gm-Message-State: AO0yUKVuKb/zuRz+fnuBTUj0URshsu/yh9NE1oYhAl2cL0j/BzH9fl3S
 03gRTRvpvBSmk4hxvYjztNB0F2cBxf6o2Sh3Q6GTlPZ9
X-Google-Smtp-Source: AK7set9QZw6VUVZGa7Uq6UgT5uvK9k/8bZwQtrAVA+T+DpYlMuypfi4S4/JUU8JJHw5Yz5llGg3i6pEppS+QOsUu22s=
X-Received: by 2002:a17:906:3106:b0:877:747d:4a90 with SMTP id
 6-20020a170906310600b00877747d4a90mr6816599ejx.14.1679031907658; Thu, 16 Mar
 2023 22:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230316072647.406707-1-christian.koenig@amd.com>
 <CAM0jSHPRVgCkWPqzPOs4-4QMDCefp7y5jcTpZDgvXUpEa_a-fQ@mail.gmail.com>
In-Reply-To: <CAM0jSHPRVgCkWPqzPOs4-4QMDCefp7y5jcTpZDgvXUpEa_a-fQ@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 17 Mar 2023 15:44:55 +1000
Message-ID: <CAPM=9twu6F1nHwL_PgTbcZpY6WzStVCqkE1Htst6OF5Q=JiFzg@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: drop extra ttm_bo_put in ttm_bo_cleanup_refs
To: Matthew Auld <matthew.william.auld@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Mar 2023 at 19:27, Matthew Auld
<matthew.william.auld@gmail.com> wrote:
>
> On Thu, 16 Mar 2023 at 07:26, Christian K=C3=B6nig
> <ckoenig.leichtzumerken@gmail.com> wrote:
> >
> > That was accidentially left over when we switched to the delayed delete
> > worker.
> >
> > Suggested-by: Matthew Auld <matthew.william.auld@gmail.com>
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Fixes: ("9bff18d13473") drm/ttm: use per BO cleanup workers
> > Reported-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> > Tested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

I'm taking this directly into drm-fixes, please don't apply it to
drm-misc-fixes at all.

Dave.
