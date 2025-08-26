Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C05E8B37284
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 20:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E43F10E3AB;
	Tue, 26 Aug 2025 18:49:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="cyRse94l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA5410E6B5
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 18:49:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-248681b5892so43875ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 11:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756234141; x=1756838941;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
 b=cyRse94lhrN03tNoNUZne7hw9vNFcXBOYEf2gnA6S5HO/HsiFNSPHcsMQ3wWyViX/e
 UzWloGD2348tmhXFSVbZb6tJAyMut4pkkdmRRIxDVK22SYagmpQ8ZkLsESwHCb/GC9k1
 ho10tbNP9zMDhWg9yaFh/PpzeX7KQI5sFFQFhZlhNWeW3Ri8LpfBHOKTLVxFw9+opIkX
 IAUFPdZB1mUYh7W2zwXlAZT1X8jAn+hxK5DcYnf7uCxcuguMV9euzWr9xFDb/L9cBion
 yOaIQ5RsNmREfFwjytzA9wqzN3puRwZpGPRp0g5E1Ei7/sf8XhKsXZ53WX3jlZ6NDBZ6
 X7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756234141; x=1756838941;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/Ye7/SL7tqTx9oBx/tviBmGnvw5YMp+2zk7nWejWf0=;
 b=gtybNDVpqsUWeFowTv4ZvEoIuzvoj6C1XcS/tYQbCTV54mCog1Uche60Uv9S8z75lQ
 HACZ3dfn/a75yFvdCeCZ8amx9oxIah4+bRJOTGHbvPeW3fEYtYBfC+j01///2c2H386v
 hsGO2myd0+pWfeBHCabrTHuJ6qFGuO3lKHj/FH6OAO4Rv3KOvjVUSpz+/Dhhs9U1PyGy
 jnI7iKIIHf6BjqZbpbUX3zLNZVEYU37MELTrJv+wEYcEhT0JZ4FDpOF0RU7oZt969zO5
 SC6o7guuJ14aNukrt/89Kk+urIcLfB9mSBYoBJ+cI980JfNdkIVCRH7as02WGJcJ+Qy1
 0hNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAAcJeDQzuRL1OP/KTeEunNUb8BlwOaenClhzYfSuhyTNXuXzC2CZhgxG9nr3iSNwgSgTAHQbkopE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVt1UZC51c6h6C6jQ1bnhDyhu2jBZVlu9pDqY14GZEBQvGATkO
 qjczDr+OyPMYA3cI7I6LMlZf/88SP8T/tAxJwwiKjXwML6MzLCbBcfrrBsraxV+aOwdYKza4bC5
 pjvwiReLEmj9J6/egk1Skt5LGqgiZifk7vFZ2NaPV
X-Gm-Gg: ASbGncuPEA/lStaabvxQkgp1x4J4K2VgR8PK9qVN6Z6kZy5ePIoMBp8QtYS6FLwmzqe
 juJr1yRjqJubTopRVdFCGc2NQ1IdPEHpJ2oBAGXjseBA9ULScbktiKy8rtie8sVIBJttzmVsFVz
 XdcavOpCvWxdjjtlwM25UAoYHb3kVOmlZ2t7p7QWP8x5JhyLF8MdC7aaqIRyqoEyj3fQZADs8/c
 ccovcjnG07SdLl7n3HUVa1xf/3WQzZWhxVii1c6sl0PCUpQx9kE/uyLZwrEBSV4
X-Google-Smtp-Source: AGHT+IG+ollMBmiaOYcyGD4fK0EXbH34IwD2F+IqBBnZbD5S5EK8GUe1Cco16tj20beWZxJ5YP1hQInru/5q0vhDcUY=
X-Received: by 2002:a17:903:228c:b0:243:afef:cd88 with SMTP id
 d9443c01a7336-2486395f193mr4627105ad.11.1756234140425; Tue, 26 Aug 2025
 11:49:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1755096883.git.robin.murphy@arm.com>
 <d6cda4e2999aba5794c8178f043c91068fa8080c.1755096883.git.robin.murphy@arm.com>
 <20250826130329.GX4067720@noisy.programming.kicks-ass.net>
 <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
In-Reply-To: <6080e45d-032e-48c2-8efc-3d7e5734d705@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 26 Aug 2025 11:48:48 -0700
X-Gm-Features: Ac12FXxL0fQGFTk6-3SCJz15Qd8Ums9V_bcQA6gIxaEwQacWk3scYfeQZZ7cYZQ
Message-ID: <CAP-5=fXF2x3hW4Sk+A362T-50cBbw6HVd7KY+QEUjFwT+JL37Q@mail.gmail.com>
Subject: Re: [PATCH 12/19] perf: Ignore event state for group validation
To: Robin Murphy <robin.murphy@arm.com>
Cc: Peter Zijlstra <peterz@infradead.org>, mingo@redhat.com, will@kernel.org, 
 mark.rutland@arm.com, acme@kernel.org, namhyung@kernel.org, 
 alexander.shishkin@linux.intel.com, jolsa@kernel.org, adrian.hunter@intel.com, 
 kan.liang@linux.intel.com, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 imx@lists.linux.dev, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-fpga@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, coresight@lists.linaro.org, 
 iommu@lists.linux.dev, linux-amlogic@lists.infradead.org, 
 linux-cxl@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-riscv@lists.infradead.org
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

On Tue, Aug 26, 2025 at 8:32=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2025-08-26 2:03 pm, Peter Zijlstra wrote:
> > On Wed, Aug 13, 2025 at 06:01:04PM +0100, Robin Murphy wrote:
> >> It may have been different long ago, but today it seems wrong for thes=
e
> >> drivers to skip counting disabled sibling events in group validation,
> >> given that perf_event_enable() could make them schedulable again, and
> >> thus increase the effective size of the group later. Conversely, if a
> >> sibling event is truly dead then it stands to reason that the whole
> >> group is dead, so it's not worth going to any special effort to try to
> >> squeeze in a new event that's never going to run anyway. Thus, we can
> >> simply remove all these checks.
> >
> > So currently you can do sort of a manual event rotation inside an
> > over-sized group and have it work.
> >
> > I'm not sure if anybody actually does this, but its possible.
> >
> > Eg. on a PMU that supports only 4 counters, create a group of 5 and
> > periodically cycle which of the 5 events is off.

I'm not sure this is true, I thought this would fail in the
perf_event_open when adding the 5th event and there being insufficient
counters for the group. Not all PMUs validate a group will fit on the
counters, but I thought at least Intel's core PMU would validate and
not allow this. Fwiw, the metric code is reliant on this behavior as
by default all events are placed into a weak group:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/metricgroup.c?h=3Dperf-tools-next#n631
Weak groups are really just groups that when the perf_event_open fails
retry with the grouping removed. PMUs that don't fail the
perf_event_open are problematic as the reads just report "not counted"
and the metric doesn't work. Sometimes the PMU can't help it due to
errata. There are a bunch of workarounds for those cases carried in
the perf tool, but in general weak groups working is relied upon:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/pmu-events/pmu-events.h?h=3Dperf-tools-next#n16

Thanks,
Ian

> > So I'm not against changing this, but changing stuff like this always
> > makes me a little fearful -- it wouldn't be the first time that when it
> > finally trickles down to some 'enterprise' user in 5 years someone come=
s
> > and finally says, oh hey, you broke my shit :-(
>
> Eww, I see what you mean... and I guess that's probably lower-overhead
> than actually deleting and recreating the sibling event(s) each time,
> and potentially less bother then wrangling multiple groups for different
> combinations of subsets when one simply must still approximate a complex
> metric that requires more counters than the hardware offers.
>
> I'm also not keen to break anything that wasn't already somewhat broken,
> especially since this patch is only intended as cleanup, so either we
> could just drop it altogether, or perhaps I can wrap the existing
> behaviour in a helper that can at least document this assumption and
> discourage new drivers from copying it. Am I right that only
> PERF_EVENT_STATE_{OFF,ERROR} would matter for this, though, and my
> reasoning for state <=3D PERF_EVENT_STATE_EXIT should still stand? As for
> the fiddly discrepancy with enable_on_exec between arm_pmu and others
> I'm not really sure what to think...
>
> Thanks,
> Robin.
