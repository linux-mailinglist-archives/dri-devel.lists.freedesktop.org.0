Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17B354AB88
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 10:16:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F98910E32B;
	Tue, 14 Jun 2022 08:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F6210E55D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 08:16:34 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id d129so7855489pgc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 01:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fireburn-co-uk.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jXa8xvrkQ1lZvQMYQK5w8BDUYXIzUNuQbVKmAR8OyQs=;
 b=LH/+3Ii/QQ7f0xZGG7fbzL8MuJGPzDBlqmKpsddrQwTgzSkmVfkTW/hy5OCtbNZx83
 2SXgWR9niM3S/cQxq/+riKWIvEFfyk3daSo3LdLK0xoteapAERKtm2NrhPNHvnGCZlAt
 xTuw+k1zXhH0g68yvZHTmSCWtxUql1+uy2Kaa2ZAxL8fd84aD7ublxLN04BYWWRpHk6n
 B+DXHXDXIzK213RmcB4sgVfXo8tklaLAN5WGVyBVqyglZcLjqrlQAnmLmhhC2U394DoZ
 9YqetBKq7Hu3AewUgUR8mHb+HnAXx+NDAeeYrMEmkyXjVr7on6yPR0wh60mrx1q+6eBJ
 nIYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jXa8xvrkQ1lZvQMYQK5w8BDUYXIzUNuQbVKmAR8OyQs=;
 b=Q+ZeOZuQrjKNyI5KYucZkq71ROz82tKVT1/4Y+mbABhCnjSJFNuQjfR/9V8gDcD8dp
 yQrqq8ShiJWesqvRGc/24WlUJjoHudQgnXEMMwc3Xj9WGqkX2JF6K7BHs0blPaksGMTC
 CyZKKEVmkxcSU3HDIv9b1iUXjGaz1QWQaKn/9uEb7xssFUPKS9Acz8YqyNpOnfTANoKN
 H3X215zqT9G1k88Do6wYSEQO9aWmvOl9hKQNZiY1ArGwNj1y71YfuMNeJTr/PcB4Fvkn
 zs7YLTiO1eRdxfXOpw74trMs8DRfnj+rcFeskLUNBsdvdP4T7rVNaXphWcNCqgPVFEF2
 +VXg==
X-Gm-Message-State: AOAM531nDlA5YFN+oKKDCQJv+KLgBttU8G+4a0JJlHIb9DC32df5ZDt6
 1YVt5p/9+BJxkUYmqDEm6wQQQlxRG+x0pOLaZ+Gfdw==
X-Google-Smtp-Source: ABdhPJxJrKYit0TOO6xDqGmFbxJZMqu7TH2jfFBLlagMWZx3N/pNko7K3PwkTFTlkoPMn8/ue2uAiZr2LmKm8F/VmDc=
X-Received: by 2002:a05:6a00:1690:b0:517:cc9e:3e2d with SMTP id
 k16-20020a056a00169000b00517cc9e3e2dmr3514915pfc.0.1655194593385; Tue, 14 Jun
 2022 01:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220610135426.670120-1-michel@daenzer.net>
 <2260b6a6-153c-6c12-212c-2b3f5199e6dc@gmail.com>
 <71d16c84-494c-1204-3944-d37aac8fed82@daenzer.net>
In-Reply-To: <71d16c84-494c-1204-3944-d37aac8fed82@daenzer.net>
From: Mike Lothian <mike@fireburn.co.uk>
Date: Tue, 14 Jun 2022 09:16:22 +0100
Message-ID: <CAHbf0-Gk8jds_iNh9d8qNvc5+5jVjyCeiSqMNJjzri-ohJSmxw@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>
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
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 13 Jun 2022 at 10:11, Michel D=C3=A4nzer <michel@daenzer.net> wrote=
:
>
> On 2022-06-11 09:19, Christian K=C3=B6nig wrote:
> > Am 10.06.22 um 15:54 schrieb Michel D=C3=A4nzer:
> >> From: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >>
> >> The commit below changed the TTM manager size unit from pages to
> >> bytes, but failed to adjust the corresponding calculations in
> >> amdgpu_ioctl.
> >>
> >> Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
> >> Bug: https://gitlab.freedesktop.org/drm/amd/-/issues/1930
> >> Bug: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6642
> >> Signed-off-by: Michel D=C3=A4nzer <mdaenzer@redhat.com>
> >
> > Ah, WTF! You won't believe how long I have been searching for this one.
>
> Don't feel too bad, similar things have happened to me before. :) Even af=
ter Marek's GitLab comment got me on the right track, it still took a fair =
amount of trial, error & head scratching to put this one to bed.
>
>
> --
> Earthling Michel D=C3=A4nzer            |                  https://redhat=
.com
> Libre software enthusiast          |         Mesa and Xwayland developer

That's indeed fixed the Tomb Raider / vulkan issue

I'm still seeing some strange warnings and errors on Linus's tree so
I've updated https://gitlab.freedesktop.org/drm/amd/-/issues/1992
https://gitlab.freedesktop.org/drm/amd/-/issues/2034, I'm not sure if
that's Buddy allocator, TTM Bulk moves or a whole new issue

If it's not too late feel free to add my tested by
