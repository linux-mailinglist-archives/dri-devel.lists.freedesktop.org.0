Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0750C6D54D
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 09:12:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD58B10E230;
	Wed, 19 Nov 2025 08:12:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eDGfnI8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com
 [74.125.224.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079C510E230
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 08:12:36 +0000 (UTC)
Received: by mail-yx1-f41.google.com with SMTP id
 956f58d0204a3-63fca769163so6020862d50.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 00:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763539955; x=1764144755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iUBOgIOLWZDJq2sElRwT1XKILWAq1sCpDCpL57E1eLo=;
 b=eDGfnI8xRgjjLxf4cjJUyLNO4rC26S8mQD9lfoESOHVLeDDQOb1VLZdFO8DciBc2QI
 tsmkgY3s8I7C+3190PdgL+wyvBCbGcCECbdv4MSBMIzRLIzunvg9PCQZVwBZzb/mzFfh
 Lwaxjz3bQzbhoXtAaAGrYme/La3jrNezIeWHVvFEFuKWg3VTXeH9k9w5ruN0AjpSpDy4
 N7AvoOrXqAfbCRYReSIpqPf+Uvgxxw7rRE3mRB5XhNyOA9Y5B7GlPDJqcWaYlaKOtlDc
 WsXoVC8IhqC4GAf8jYzviF6BzkHj+kLPTYxDWYm/HJlITa0QqErPhpEtNKgeGechxGM0
 f8Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763539955; x=1764144755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iUBOgIOLWZDJq2sElRwT1XKILWAq1sCpDCpL57E1eLo=;
 b=jApWw5vyZ1JzA1cluKVAT9iqCllCzD0YZSWwWslToCK/ykgFKiUxNyIPlD/+NzbQxS
 BCbKkfYdqReHu96adp84znA1fFEjXxDaNlUCLlVZf+CyxgdyJA3sVBEZ22glGn9tbu6U
 lP3dYgEajTY2m5zw31ZqDxaC8+VBopjwGLLJKbzblch5XBVSEsZ4akPYUuzBaQo/FfKO
 at/C1iworKdx1w8VGWorhNc7z9GL2sLQsx24BwvkXv7RvpwaxqQ9SKBUeDLf5NI1qorY
 dzPa6ahrO0NOfzuR6PQenP4QAhvsV91lN5zufJbDWvGwOOMdTPPi4cdaHTs6KY4hYp4j
 rHVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Y1P6cET5LwjypH1jEPmMQJ2UgN/3gcMZE3sZBUyLWBH+5tmkiuqDAh4nBQtLI4JJRffAzCUbsUs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/ZbgSXN8EKu2a/FIxJZq2Q3gxG1+T+5AKZ465+bl1E5dGaJib
 fOsh/kSQLfxm4oESOEKx8pTJjUbIvuNrJT4e7DyLZW/q3UUCzSuXRfnY85apJLAiDF3rit6fRir
 RGGEp143bGVBSrYg87kvxmdlsts23U4U=
X-Gm-Gg: ASbGncsgpz0w3WD7moxtu0dBDvD5lFL/HqEj85FT0WcnKyeGmIPB2N1lg5XCgtB9aNS
 hN1De4UTC4IA7xXoxHEaJKz/lBHIPNVKfVMVfq6ksOA86ovh9Lp8KnOaOejbmJBpbuu69XO8Wt5
 qxasGacxcBANfknFt76DMOVt8JXxqdn2YIvF5e3nX1dXz6zWl7UM75qHu1JJqTMIN/t6GbUQuGT
 l1Z/m44PSE4d8KuuHZ4cy7bP94sepEQZFNN6yl2NPp25pF7BnwZJ9bV2hJO5Czdok/OYR3rtbdS
 gqM=
X-Google-Smtp-Source: AGHT+IFG5JkHH3w0rDmCiEszDk0C5VDpTSQ2HNfjVc4Y4ORWv3/uyn6G6ckOqFCw0DgcgLQhtCHkAg9e5KPnhkz002U=
X-Received: by 2002:a05:690e:2445:b0:640:d255:2d75 with SMTP id
 956f58d0204a3-641e7640189mr11697300d50.48.1763539954695; Wed, 19 Nov 2025
 00:12:34 -0800 (PST)
MIME-Version: 1.0
References: <20251118201842.1447666-1-jim.cromie@gmail.com>
 <aR0e0rgrdXWIo8nI@archie.me>
In-Reply-To: <aR0e0rgrdXWIo8nI@archie.me>
From: jim.cromie@gmail.com
Date: Wed, 19 Nov 2025 01:12:08 -0700
X-Gm-Features: AWmQ_bnVSunPg_gmEl4qMo6RodNn7EGT4ai0Tx67Z9u2UeO3XRs9V77HfR2Ou4Q
Message-ID: <CAJfuBxzGKFu9Xd4PhwuBOoEV5uKtrrzeXD9MKLpDAjZL3UqZQw@mail.gmail.com>
Subject: Re: [PATCH v6 00/31] drm/dyndbg: Fix dynamic debug classmap regression
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 gregkh@linuxfoundation.org, jbaron@akamai.com, ukaszb@chromium.org, 
 louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 18, 2025 at 6:35=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Tue, Nov 18, 2025 at 01:18:10PM -0700, Jim Cromie wrote:
> > hello all,
> >
> > commit aad0214f3026 ("dyndbg: add DECLARE_DYNDBG_CLASSMAP macro")
> >
> > added dyndbg's "classmaps" feature, which brought dyndbg's 0-off-cost
> > debug to DRM.  Dyndbg wired to /sys/module/drm/parameters/debug,
> > mapped its bits to classes named "DRM_UT_*", and effected the callsite
> > enablements only on updates to the sys-node (and underlying >control).
> >
> > Sadly, it hit a CI failure, resulting in:
> > commit bb2ff6c27bc9 ("drm: Disable dynamic debug as broken")
> >
> > The regression was that drivers, when modprobed, did not get the
> > drm.debug=3D0xff turn-on action, because that had already been done for
> > drm.ko itself.
> >
> > The core design bug is in the DECLARE_DYNDBG_CLASSMAP macro.  Its use
> > in both drm.ko (ie core) and all drivers.ko meant that they couldn't
> > fundamentally distinguish their respective roles.  They each
> > "re-defined" the classmap separately, breaking K&R-101.
> >
> > My ad-hoc test scripting helped to hide the error from me, by 1st
> > testing various combos of boot-time module.dyndbg=3D... and
> > drm.debug=3D... configurations, and then inadvertently relying upon
> > those initializations.
> >
> > This series addresses both failings:
> >
> > It replaces DECLARE_DYNDBG_CLASSMAP with
> >
> > - `DYNAMIC_DEBUG_CLASSMAP_DEFINE`: Used by core modules (e.g.,
> >   `drm.ko`) to define their classmaps.  Based upon DECLARE, it exports
> >   the classmap so USE can use it.
> >
> > - `DYNAMIC_DEBUG_CLASSMAP_USE`: this lets other "subsystem" users
> >   create a linkage to the classmap defined elsewhere (ie drm.ko).
> >   These users can then find their "parent" and apply its settings.
> >
> > It adds a selftest script, and a 2nd "sub-module" to recapitulate
> > DRM's multi-module "subsystem" use-case, including the specific
> > failure scenario.
> >
> > It also adds minor parsing enhancements, allowing easier construction
> > of multi-part debug configurations.  These enhancements are used to
> > test classmaps in particular, but are not otherwize required.
>
> What commit/tree this series is based on?
>

this is on top of v6.17
dynamic-debug has been unchanged since then


> Confused...
>
> --
> An old man doll... just what I always wanted! - Clara
