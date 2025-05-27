Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28AAC5C00
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 23:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9221410E053;
	Tue, 27 May 2025 21:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mmXgAZ19";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D505A10E053
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 21:08:24 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3dd745f8839so44395ab.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 14:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748380104; x=1748984904;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ubiEBlty5LLcHWhiL4ftQwDPhybt329gmxk4FbujYzU=;
 b=mmXgAZ19vegj+jfwAXOs/8eqUwbw+bsleDbX0WdE4KTza2hG99eP9AKk9HQbxKUqeZ
 d+fHg8bV3ZX8I79oZFmFoRa6AnKggDoIGCDtcgNMQQdUvUfmlzAMX/TSupQk2RmX82Kr
 f+4T+/lZNCy1s7spxA3SrIZZQChkA/yPBXje9bIhqKrDefQOJOKJfv3ufoUG9AgHETAa
 mRp3UoA/s72NlHEfpYKk4VAKcMtgsW/i44H2xXp+EUgQcVYbWUMVpZjqhxWXypXr3vX4
 F+f3LNK2a9h9NiZO4luV212Y+k/ca9PkgvNMb+2rPm11RK6RicrLcuhhUJ25O40/yuWf
 harw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748380104; x=1748984904;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ubiEBlty5LLcHWhiL4ftQwDPhybt329gmxk4FbujYzU=;
 b=Mj4G8cXtQS58YUmElrqD+Fb/tOPquhUBZTxdrep9HJFOj92DMr1XlBmv+gUAOspdCc
 IgTfORyju5vtUVt0X6F//kIUHra21XpPJrfHpu537H8++ZkWYyWGCyt840dEF2ZroSa+
 PHoMca5vF8ZDKHX5r9JI1BNFNJTCoJIq54Yo4xSFdqhw2vay/WqK7vn54k0cxD/SAo17
 uEAwV7OGa9VH+0jMGtIRbvWAA7GN/2AWjTTM5EdxAT5Y92VSGbT8vVaxW01Xk0QOEWvj
 JJ1jaUMmpxV3wlYfwiAVNs5yxLkMwtXghwMJ8ikrEfh2MrEL2g2hfs/KqZgFyvmEV0Nr
 HqAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNI5MxgtBXgStf+79nMHvUyJWp6/pves245U6Am80s5dyj6betpt4shWtEQpt9EFJ9gr5Kwb5YJVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA6O+SaVJTLi9INtJeXfUqHaDPO2PMEC2CdWpCB4UWMSwxR12R
 2YWleGrwkGalkmz9MunGWnfe3gJvxFaRMuxKFOEOZCDivqI7lSn0ESyhwgE5687+La5AwoDHiHb
 nh6zOFN7GxOuLS8UCnjeB5RTc4MNxEpJaD56kxh2J
X-Gm-Gg: ASbGnct5TwzfpBVh+F487WWdbkfhYNThKRgZreAsngjYspA7bfIPuNBDggpLlBBZf+T
 OqCnuraGfPZgf+N5tMDN4oaeahQmVdF4qTkIPs3IrL0PGxak5hjNS9JQjBSUrdiakhRnbhwNyeH
 iNQ2ZLzfsYdb/m1F8hf59iZNaKpmL+gVxtDaX5Q9vGjZEN/1GOs5xNePd/ooXZzBoVlh4C1quZ
X-Google-Smtp-Source: AGHT+IH8GAJYpDplkuydkJu8WA/jhGPEYRVfjAxb8lYAz5mHHBeiaWfjPDPmvfhCEv1WeCyp1Cl49JqwlweQk7tq2MQ=
X-Received: by 2002:a05:6e02:b46:b0:3d5:bb1f:843e with SMTP id
 e9e14a558f8ab-3dd89c643f9mr217595ab.29.1748380103741; Tue, 27 May 2025
 14:08:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250403202439.57791-1-irogers@google.com>
 <CAP-5=fXkayZ7pj+EctOtSBiTcGuyi6SHm9c5RZ3HyyPYcot9zA@mail.gmail.com>
 <aBKz_Tg-s20Qsv6k@x1>
In-Reply-To: <aBKz_Tg-s20Qsv6k@x1>
From: Ian Rogers <irogers@google.com>
Date: Tue, 27 May 2025 14:08:12 -0700
X-Gm-Features: AX0GCFvsfgIcbRHL9xzCP_HBfkVqBfuvNmKL4yVjwY42U8vH-HJaieCbVgbJ9dk
Message-ID: <CAP-5=fXZy=2AqmA1L42x57BwndR4cgUTrR6j0S-aHSnMuF9x9A@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Add support for a DRM tool like PMU
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>,
 "Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
 James Clark <james.clark@linaro.org>, Weilin Wang <weilin.wang@intel.com>,
 Dominique Martinet <asmadeus@codewreck.org>, 
 Thomas Richter <tmricht@linux.ibm.com>, Junhao He <hejunhao3@huawei.com>, 
 Jean-Philippe Romain <jean-philippe.romain@foss.st.com>,
 linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, Brendan Gregg <brendan@intel.com>, 
 gabriel.munoz@intel.com, matthew.olson@intel.com, 
 brandon.kammerdiener@intel.com, dri-devel@lists.freedesktop.org
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

On Wed, Apr 30, 2025 at 4:36=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Wed, Apr 30, 2025 at 08:21:59AM -0700, Ian Rogers wrote:
> > On Thu, Apr 3, 2025 at 1:24=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> > >
> > > DRM clients expose information through usage stats as documented in
> > > Documentation/gpu/drm-usage-stats.rst (available online at
> > > https://docs.kernel.org/gpu/drm-usage-stats.html). Add a tool like
> > > PMU, similar to the hwmon PMU, that exposes DRM information.
>
> Looks useful, I'll try to review and test tomorrow, but most probably
> Friday, as tomorrow is labour day in this part of the world.

Ping. Thanks,
Ian

> - Arnaldo
>
> > I'm reminded by Brendan Gregg's new blog:
> > https://www.brendangregg.com/blog/2025-05-01/doom-gpu-flame-graphs.html
> > that this is still outstanding. The patches also reduce some directory
> > scanning for the hwmon "PMU", they are in Google's tree:
> > https://github.com/googleprodkernel/linux-perf/blob/google_tools_master=
/tools/perf/util/drm_pmu.c
> >
> > Thanks,
> > Ian
> >
> > > v3: Minor tweak to the test so the skip (exit 2) doesn't trigger the
> > >     trap cleanup.
> > >
> > > v2: Add support to only scan hwmon and drm PMUs if the event or PMU
> > > wildcard can match. Add a test as requested by Namhyung. Add file
> > > comments.
> > >
> > > v1:
> > > https://lore.kernel.org/lkml/20250211071727.364389-1-irogers@google.c=
om/
> > >
> > > Ian Rogers (4):
> > >   perf parse-events: Avoid scanning PMUs that can't contain events
> > >   perf parse-events: Avoid scanning PMUs that can't match a wildcard
> > >   perf drm_pmu: Add a tool like PMU to expose DRM information
> > >   perf tests: Add a DRM PMU test
> > >
> > >  tools/perf/tests/shell/drm_pmu.sh |  78 ++++
> > >  tools/perf/util/Build             |   1 +
> > >  tools/perf/util/drm_pmu.c         | 689 ++++++++++++++++++++++++++++=
++
> > >  tools/perf/util/drm_pmu.h         |  39 ++
> > >  tools/perf/util/evsel.c           |   9 +
> > >  tools/perf/util/parse-events.c    |  30 +-
> > >  tools/perf/util/pmu.c             |  15 +
> > >  tools/perf/util/pmu.h             |   4 +-
> > >  tools/perf/util/pmus.c            | 101 ++++-
> > >  tools/perf/util/pmus.h            |   2 +
> > >  10 files changed, 952 insertions(+), 16 deletions(-)
> > >  create mode 100755 tools/perf/tests/shell/drm_pmu.sh
> > >  create mode 100644 tools/perf/util/drm_pmu.c
> > >  create mode 100644 tools/perf/util/drm_pmu.h
> > >
> > > --
> > > 2.49.0.504.g3bcea36a83-goog
> > >
