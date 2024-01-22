Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65588836F82
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 19:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E785710EBF9;
	Mon, 22 Jan 2024 18:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDEDD10E7BB;
 Mon, 22 Jan 2024 18:17:06 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3bc21303a35so742251b6e.0; 
 Mon, 22 Jan 2024 10:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705947426; x=1706552226;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bq9M9cm+CE6WAD/PzAq+M4FYMF5cDyj5a+NJZ7ioaVI=;
 b=Xfuq2s5oLZpsL8XKlXYl8kT5q9SNN9HagNrHUl8GvXsS2UqP9wTpMKR3YlsKiq0fXw
 TGkFNpVS/L3k4erSROpw1v/AA62b/wuwsGPIcYdh7ICXVplQDJ7Jp9AGpnUSsqH0CkOQ
 S94636IWiP5UT6xOL1tQeYh3AVj4YuPKMfjU1SnkDo9KoT4JaqIq0ERV+04BF1F2VVhO
 gLD/A4bHjyoJe73mdGOQ2sSsQb1UhF5YxlEVv8TIr0nAwJ16+ildhFOkeivOwGcztTli
 nHR8Kuf9oQ3KjV5OIfg1y4eq+beWUuKpyC4NH/G1esN/1FEIfzzS7LKrMJYSBxTX6fwg
 A2QQ==
X-Gm-Message-State: AOJu0Yy8M7cQw5H58cuVChNWNF/VJzGGnxloikl8yOnVTQ+CkCwwyhCg
 PHdg7JeymmEGORX8H5eb2mNcLFufEiE/epNv5Ocx4+Wvi82P2Jjumq0VpMA2dBkxkLR+HP5tpKN
 vtABbvu8CmvtRjiU/GCUtiPiNxkk=
X-Google-Smtp-Source: AGHT+IG7X57s+1Hb3UmgWa4B2VhnsQsEmm2qhDCXpsDoekvAtRW8AijnCpEwtrAHQizHxz0U/8KF3rieJlIr+BPH7Us=
X-Received: by 2002:a05:6808:308f:b0:3bd:a741:a048 with SMTP id
 bl15-20020a056808308f00b003bda741a048mr9775473oib.1.1705947426060; Mon, 22
 Jan 2024 10:17:06 -0800 (PST)
MIME-Version: 1.0
References: <20240122114121.56752-2-sakari.ailus@linux.intel.com>
 <20240122181205.GA275751@bhelgaas>
In-Reply-To: <20240122181205.GA275751@bhelgaas>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 22 Jan 2024 19:16:54 +0100
Message-ID: <CAJZ5v0gUpo6Shz2kQzie4XE23=fiPvD0=2yhjGptw8QbCq2SAg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] pm: runtime: Simplify pm_runtime_get_if_active()
 usage
To: Bjorn Helgaas <helgaas@kernel.org>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jaroslav Kysela <perex@perex.cz>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 laurent.pinchart@ideasonboard.com, David Airlie <airlied@gmail.com>,
 Paul Elder <paul.elder@ideasonboard.com>, linux-media@vger.kernel.org,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Takashi Iwai <tiwai@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, netdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 22, 2024 at 7:12=E2=80=AFPM Bjorn Helgaas <helgaas@kernel.org> =
wrote:
>
> On Mon, Jan 22, 2024 at 01:41:21PM +0200, Sakari Ailus wrote:
> > There are two ways to opportunistically increment a device's runtime PM
> > usage count, calling either pm_runtime_get_if_active() or
> > pm_runtime_get_if_in_use(). The former has an argument to tell whether =
to
> > ignore the usage count or not, and the latter simply calls the former w=
ith
> > ign_usage_count set to false. The other users that want to ignore the
> > usage_count will have to explitly set that argument to true which is a =
bit
> > cumbersome.
>
> s/explitly/explicitly/
>
> > To make this function more practical to use, remove the ign_usage_count
> > argument from the function. The main implementation is renamed as
> > pm_runtime_get_conditional().
> >
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Reviewed-by: Alex Elder <elder@linaro.org> # drivers/net/ipa/ipa_smp2p.=
c
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Acked-by: Takashi Iwai <tiwai@suse.de> # sound/
> > Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com> # dr=
ivers/accel/ivpu/
> > Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com> # drivers/gpu/drm/i915/
> > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com> # drivers/pci/
>
> > -EXPORT_SYMBOL_GPL(pm_runtime_get_if_active);
> > +EXPORT_SYMBOL_GPL(pm_runtime_get_conditional);
>
> If pm_runtime_get_conditional() is exported, shouldn't it also be
> documented in Documentation/power/runtime_pm.rst?
>
> But I'm dubious about exporting it because
> __intel_runtime_pm_get_if_active() is the only caller, and you end up
> with the same pattern there that we have before this series in the PM
> core.  Why can't intel_runtime_pm.c be updated to use
> pm_runtime_get_if_active() or pm_runtime_get_if_in_use() directly, and
> make pm_runtime_get_conditional() static?

Sounds like a good suggestion to me.
