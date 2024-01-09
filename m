Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02082803A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 09:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35210E3F0;
	Tue,  9 Jan 2024 08:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA7910E3BC;
 Tue,  9 Jan 2024 08:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704788106; x=1736324106;
 h=message-id:subject:from:to:date:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=qaN1uP+7/9EnkHDbj9xO2EMILUP1ZO3LHGDHEvykv8E=;
 b=lqhMsg2EQR0yhvsjgOrtq9K4EyUTY4/XZCFNQuL76QjewlWFU0yJ7L5A
 8wTn5R8cYYTxvo5lou9qRtH8a89XVJgZtHR3OLLvXmgagVtq2EsQaM+D6
 sIipeH20b1jGjQkrphil93qQJU9FPqhJdUek5k4sw8BdC/KasLgNGXyh7
 WJHoSFdR3SJiuXRaaiSUiP//f04Gpi1zZKlP+FM6rAWTPzkbFkIooRwFl
 /IYRhhR6fUgnwYzK0vwwGv1sZ/VOu4jvSeAMJdQT68EZpeZ6JPmrPTVtV
 v4gAz3i6YVD88b7Z65Xjcrh4SiBm28efALBtRRsfu/wBB30YvxaLvioaB A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="4869681"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; 
   d="scan'208";a="4869681"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 00:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="757905182"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="757905182"
Received: from djustese-mobl.ger.corp.intel.com (HELO [10.249.254.147])
 ([10.249.254.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 00:14:21 -0800
Message-ID: <70484d976d3af4286652a6b26ed8783a9362f403.camel@linux.intel.com>
Subject: Re: Rework TTMs busy handling
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 zack.rusin@broadcom.com, lyude@redhat.com, kherbst@redhat.com, 
 jani.nikula@linux.intel.com, nouveau@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Date: Tue, 09 Jan 2024 09:14:18 +0100
In-Reply-To: <20240109074729.3646-1-christian.koenig@amd.com>
References: <20240109074729.3646-1-christian.koenig@amd.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 (3.50.2-1.fc39) 
MIME-Version: 1.0
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

Hi, Christian

On Tue, 2024-01-09 at 08:47 +0100, Christian K=C3=B6nig wrote:
> Hi guys,
>=20
> I'm trying to make this functionality a bit more useful for years now
> since we multiple reports that behavior of drivers can be suboptimal
> when multiple placements be given.
>=20
> So basically instead of hacking around the TTM behavior in the driver
> once more I've gone ahead and changed the idle/busy placement list
> into idle/busy placement flags. This not only saves a bunch of code,
> but also allows setting some placements as fallback which are used if
> allocating from the preferred ones didn't worked.
>=20
> Zack pointed out that some removed VMWGFX code was brought back
> because
> of rebasing, fixed in this version.
>=20
> Intel CI seems to be happy with those patches, so any more comments?

Looks like Xe changes are missing? (xe is now in drm-tip).

I also have some doubts about the naming "idle" vs "busy", since an
elaborate eviction mechanism would probably at some point want to check
for gpu idle vs gpu busy, and this might create some confusion moving
forward for people confusing busy as in memory overcommit with busy as
in gpu activity.

I can't immediately think of something better, though.

/Thomas


>=20
> Regards,
> Christian.
>=20
>=20

