Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 190E77F4406
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 11:38:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C98D10E19A;
	Wed, 22 Nov 2023 10:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B66510E19A
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 10:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700649520; x=1732185520;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=QO6KT53uGxDzbodKNjgEms8sifAV1LGc8IN38AUbNUw=;
 b=cvHmRm8q1VLyTsvh9l2sWNw2317dXnQ1PRhPw64aY03cJh0YPdiH384k
 UXZkt1+EIgYoyi7jPaK304+TL/m0Lo+fYPnyYI6PqpyCakuEyEyCSSR5K
 YYgpjs538XCA+76Ke5w9IP80T4J65LeukfuX8RXzwlXK1fBGjrI3zMyeh
 6bk2UbKg3Q511grJagU4V7P0eHsQk69IlmoDH4aB82q+HUF7Avu+nXfEl
 rmwvFT3kt4wsQlQH9F8SHw/f6sbyHCGsBBtbbGA+dniLD5XK0Z+3qebT7
 2+qwx5rpguY8K5TZwDA2uxahemCXvMsEB9y/oHbkU9v84+c48a6IWZI3s w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="382424989"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="382424989"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 02:38:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="884563056"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; d="scan'208";a="884563056"
Received: from tjquresh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 02:38:36 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Powered off Philips TV sends corrupt EDID causing flickering
In-Reply-To: <c9e3a8f1-d053-4203-a364-0d0703fafd19@molgen.mpg.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <c9e3a8f1-d053-4203-a364-0d0703fafd19@molgen.mpg.de>
Date: Wed, 22 Nov 2023 12:38:34 +0200
Message-ID: <87leaqm5sl.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023, Paul Menzel <pmenzel@molgen.mpg.de> wrote:
> Dear Linux folks,
>
>
> Connecting a USB Type-C port replicator [1] to the only USB Type-C port=20
> of the Dell XPS 13 9360 with Debian sid/unstable and Debian=E2=80=99s Lin=
ux=20
> kernel 6.10.5, and then connecting a Philips 40PFL5206H/12 TV device,=20
> that is powered off or in standby, to the HDMI port, Linux logs:
>
> ```
> [    0.000000] Linux version 6.5.0-4-amd64=20
> (debian-kernel@lists.debian.org) (gcc-13 (Debian 13.2.0-6) 13.2.0, GNU=20
> ld (GNU Binutils for Debian) 2.41) #1 SMP PREEMPT_DYNAMIC Debian=20
> 6.5.10-1 (2023-11-03)
> [=E2=80=A6]
> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> [=E2=80=A6]
> [  160.004836] EDID has corrupt header
> [  160.004866] 	[00] BAD  00 00 00 00 00 00 00 00 00 7f ff ff ff ff ff ff
> [  160.004875] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004881] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004886] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004905] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004911] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004917] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.004921] 	[00] BAD  ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> [  160.013662] Registered IR keymap rc-cec
> [  160.014001] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
> [  160.014305] input: DP-1 as=20
> /devices/pci0000:00/0000:00:02.0/rc/rc0/input33
> [  160.228342] EDID has corrupt header
> [  160.408917] EDID has corrupt header
> ```
>
> The internal display of the laptop also switches off shortly, but comes=20
> back after two or three seconds. This is very likely due to me=20
> configuring the internal display to turn off once an external display is=
=20
> used.
>
> No idea, why the TV is able to transmit anything at all, when it is=20
> turned/powered off. To avoid the flickering, would it be possible to=20
> ignore events from displays sending such incorrect EDID?

Depending on how the port replicator works, this may not come from the
TV at all.

And all of this probably depends on GPU and driver, which are not
mentioned.

If it's i915, please see [1] on how to file a bug.

Thanks,
Jani.


[1] https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

>
>
> Kind regards,
>
> Paul

--=20
Jani Nikula, Intel
