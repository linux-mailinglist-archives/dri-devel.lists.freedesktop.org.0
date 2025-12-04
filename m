Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D03CA55DC
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 21:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D888910E217;
	Thu,  4 Dec 2025 20:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hduvl/EL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2401110E02C;
 Thu,  4 Dec 2025 20:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881077; x=1796417077;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6YGvAfs3lyljrYuki+T4raDPYlnPO6LfvudQTO3ecIU=;
 b=hduvl/ELCQC1daOHfcNJBFEK7dbwwZdd97M0O0rYDz0/JRQHiMRulU7j
 O+SMmprbavWNEha2cR+nLeE8miuifx/PzNJSd+QObiMtaRvNk+3PMOtYZ
 zkRmG3UYdE+IhlhbY00swDeEEX+Kbswi6nyjYX9tdIca3Fy9LyOGoKeOC
 0XTAZ7qBZPiVIhrjyjda1YrS+ydcac2OMOMtuzkm/08rNTuZvoNuEhFUi
 lno5uTeuvPwxVGzAJwWi5JWqm4vlW61cEY/tUZ2BpIDKTbMLyRyCSzfVM
 dX1vw1YFb+EiaJq6mrnUiG7B5IEQf402NkDxetLyb97Il0q2vOX7Dpf8U w==;
X-CSE-ConnectionGUID: sC4+OAroRP2eVoj+biGZ3g==
X-CSE-MsgGUID: SyKXcRqPSa+KxwDTJHL7MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="77597659"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="77597659"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:44:37 -0800
X-CSE-ConnectionGUID: QTw/aKYAT5+MqiKWRJa6mg==
X-CSE-MsgGUID: PWCT8kCrRCKSM+qhe9pyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="226052095"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.245.167])
 ([10.245.245.167])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:44:35 -0800
Message-ID: <e3fe071073ae54dc58012c1c2d892a18be8036d8.camel@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Fix duplicated put due to merge resolution
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Dave
 Airlie <airlied@redhat.com>
Date: Thu, 04 Dec 2025 21:44:33 +0100
In-Reply-To: <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
References: <20251204202059.326605-1-thomas.hellstrom@linux.intel.com>
 <CAHk-=wja02iemw40Sn4Vio6b1-rr3idFBcUrOV+=vodhOmZZ=Q@mail.gmail.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-2.fc41) 
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

Hi, Linus

On Thu, 2025-12-04 at 12:41 -0800, Linus Torvalds wrote:
> On Thu, 4 Dec 2025 at 12:21, Thomas Hellstr=C3=B6m
> <thomas.hellstrom@linux.intel.com> wrote:
> >=20
> > An incorrect backmerge resolution resulted in an
> > incorrect duplicate put. Fix.
>=20
> Ack. I can confirm that this seems to fix the issue for me. Thanks
> for
> the quick response.
>=20
> Should I just apply it directly?
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linus

OK with me if ok with Dave.

Thanks,
Thomas

