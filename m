Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A58D746D44
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 11:25:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E1C10E2BE;
	Tue,  4 Jul 2023 09:25:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81CD110E2BE;
 Tue,  4 Jul 2023 09:25:29 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2b6a0d91e80so86739331fa.3; 
 Tue, 04 Jul 2023 02:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688462726; x=1691054726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w3WG4cGF8CRsbmj1ToTEuLfuzUDIEOrIrelQmjq4q3k=;
 b=o9zy4rdoGn3NN1323n5JeCPR2P82Vf7Xrb/k/pDWdQHvrcIZ5KNk8E5Rc9AOWvUohR
 8JC5CIa5pDomtb1dfZMDcahgFK74EO8eDQO9LSJYgjPzn4Ic41LS4QQHFX6p621xcc3u
 XO4jHaVK/oWekFPVOXt8KXkFrL5uwNVhzPe0OW6mFqCpgsPLCDGha7mZqCOpezE+7azY
 JK43WUYppygu4AR6pSjwNQ4n71biZrLvyDxyiBacmVPLZW4xC0G71z1vFrh8dIliQYVo
 8F/dIQJ/5ufMEC1w88uKtvPWoHp5fDYBZKYi1NiHQpep1YJRz5d/czwVmMlpXQets9oL
 KN+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688462726; x=1691054726;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w3WG4cGF8CRsbmj1ToTEuLfuzUDIEOrIrelQmjq4q3k=;
 b=ak8pQyLVoqOxOZki/yRnVePiU4quEx9cVof5hrPpog+onAiXXr85bAnHK5Q+PpkIHd
 v7y8txhPmL6RUBI1IlrppA1U+yiThPo0PuwO8IcwOYnx4procm40axOruN3H4TPx2sNH
 jv7gGoKb6In9WCkwMYTPmCwVAeqjVBfCiaB8iOe5wvsa44Q5ZJ9gD+9g8C+NUVhUmJC0
 KTZF5XU7CbuxGE11m2hYctLtlgEe4GEZ1tb2gkdko+nhMfszIdWp0Ei7O0vIgWLXRIWl
 j40pnNtx2fnRPuVrKDoBjKZTPb7isAp6bT9ywXDNjWda0bs31xIUqcwPDckHMouveSfT
 8zQw==
X-Gm-Message-State: ABy/qLaUut81cocUMKlwO/k5jP+6WDIvT5ng4tYpWp6nTDr3CVI5raZZ
 C608qVmvVXYXT2vLk6J4BnnZm/QSoLdHn5VeuZI=
X-Google-Smtp-Source: APBJJlHbSJ2Cml2qn4cb/1edSGf064IsnqMZE4INWgBRJ+bUKVKGU+1ukWl3wQA36b7Pv4rNzHUvKd3ZOMoslroDlxM=
X-Received: by 2002:a2e:3218:0:b0:2b6:f1d5:619 with SMTP id
 y24-20020a2e3218000000b002b6f1d50619mr1554642ljy.14.1688462726472; Tue, 04
 Jul 2023 02:25:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230703150859.6176-1-ubizjak@gmail.com>
 <87o7ks16gh.fsf@intel.com>
 <CAFULd4YDHqUud94Q1mbKyKqGHh==Gv7+FpNhgm5s1p=0ZwcAXg@mail.gmail.com>
 <87lefw139r.fsf@intel.com>
In-Reply-To: <87lefw139r.fsf@intel.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Tue, 4 Jul 2023 11:25:15 +0200
Message-ID: <CAFULd4azR=ft9kEYN19WjxORcJNT_-v7q3sVs904Bf_td-VgEg@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/pmu: Use local64_try_cmpxchg in
 i915_pmu_event_read
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 4, 2023 at 10:37=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 04 Jul 2023, Uros Bizjak <ubizjak@gmail.com> wrote:
> > On Tue, Jul 4, 2023 at 9:28=E2=80=AFAM Jani Nikula <jani.nikula@linux.i=
ntel.com> wrote:
> >> You could save everyone a lot of time by actually documenting what the=
se
> >> functions do. Assume you don't know what local64_try_cmpxchg() does, a=
nd
> >> see how many calls you have to go through to figure it out.
> >
> > These functions are documented in Documentation/atomic_t.txt (under
> > "RMW ops:" section), and the difference is explained in a separate
> > section "CMPXCHG vs TRY_CMPXCGS" in the same file.
>
> Thanks, but *sigh*.
>
> No kernel-doc above the functions, not even a regular comment
> referencing atomic_t.txt.
>
> $ git grep local.*_try -- Documentation
> [nothing]

Unfortunately, this was always the state w.r.t. local.* atomic
functions. There is an effort to improve the documentation of atomics,
perhaps it will be also extended to local variants.

Uros.
