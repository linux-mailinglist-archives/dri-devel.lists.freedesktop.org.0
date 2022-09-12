Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EE85B550F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 09:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A32A10E260;
	Mon, 12 Sep 2022 07:12:39 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5507710E237;
 Mon, 12 Sep 2022 07:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662966754; x=1694502754;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:subject:cc:from:to:message-id:date;
 bh=Jn7VM+KS++uyFgVOMolGz5wkTq/Uyt388tG/tdj89io=;
 b=TYakAjofBOIo5rxRoYpZ884M5JdYP7eXMqvZuJy4ungxrvVpQUHj3mK3
 QbOTZygHvCZXELWj8TcvAYNoohpEAc2h7XsH7KdXK6v2ZIuqUSjqDRo6/
 iuOneQcLMRRN2LH3suaSfIy9Ya+7iAX7mXoB0auJachxvfpy0DqnZu1PC
 8s7H1uZXL8H54OlfMW5fy3wrpsJUPbZinliGmdG66LgCxuGnrFXhrbsdO
 k8KT4G7PlsP9ECKqh8tBdO5NUE5L8SEetI/Q+ak3tS3ttYHgPUakyWYJf
 ShiWQkBLmPOrcTSKCp5fknB9w+vNPzMJ53+qyexzP3UZoa1RE5EK35ich Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="295385395"
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="295385395"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 00:12:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,308,1654585200"; d="scan'208";a="567063910"
Received: from cpboland-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.16.28])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 00:12:27 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <166149498818.8619.15466495110393449610@jlahtine-mobl.ger.corp.intel.com>
References: <20220728022028.2190627-1-John.C.Harrison@Intel.com>
 <20220728022028.2190627-7-John.C.Harrison@Intel.com>
 <166133167788.14547.12249088266216764022@jlahtine-mobl.ger.corp.intel.com>
 <4bd7b51a-caf0-d987-c7df-6cfb24f36597@intel.com>
 <166141170600.5625.4355115277022948576@jlahtine-mobl.ger.corp.intel.com>
 <899bfc43-cc8e-1e26-a58d-eeb80ed74d06@intel.com>
 <166149498818.8619.15466495110393449610@jlahtine-mobl.ger.corp.intel.com>
Subject: Re: [Intel-gfx] [PATCH 6/7] drm/i915/guc: Make GuC log sizes runtime
 configurable
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <john.c.harrison@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <166296674451.3878.1653374638638017690@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Mon, 12 Sep 2022 10:12:24 +0300
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Joonas Lahtinen (2022-08-26 09:23:08)
> Quoting John Harrison (2022-08-25 19:31:39)
> > On 8/25/2022 00:15, Joonas Lahtinen wrote:
> > > Quoting John Harrison (2022-08-24 21:45:09)
> > >> We also don't want to tie the GuC logging buffer size to the DRM
> > >> debugging output. Enabling kernel debug output can change timings and
> > >> prevent the issue that one is trying to capture in the GuC log. And =
it
> > >> seems unlikely we could add an entire new top level DRM debug flag j=
ust
> > >> for an internal i915 only log buffer size. Plus drm.debug is explici=
tly
> > >> stated as being dynamically changeable via sysfs at any time. The GuC
> > >> log buffer size cannot be changed without reloading the i915 driver.=
 Or
> > >> at least, not without reloading the GuC, but we definitely don't wan=
t to
> > >> create a UAPI for arbitrarily reloading the GuC.
> > >>
> > >> We can make these parameters 'unsafe' so that they taint the kernel =
if
> > >> used. But this is exactly what module parameters are for - configura=
tion
> > >> that we don't want to hardcode as CONFIG options but which must be s=
et
> > >> at module load time.
> > > It's better to have sane defaults. And if somebody wants something
> > > strange, they can have a Kconfig behind EXPERT option. But even then
> > > there should really be need for it.
> > Define sane.
>=20
> I was hoping you would be the expert on that as you've suggested the
> patch to begin with.
>=20
> Try to aim to cover >90% of the debug scenarios (that are only 0.001%) and
> we're already only needing to recompile kernel in 1 per million cases.
>=20
> We can live with that.
>=20
> I will push a fixup to remove the module parameters, please figure the
> rest out in a timely manner.

John, what is the status of the followup patch here to configure those
reasonable defaults?

We shouldn't be ignoring this and proceed to pile other GuC patches
on top.

Regards, Joonas
