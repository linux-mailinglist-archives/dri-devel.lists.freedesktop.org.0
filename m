Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEFC1D12A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 14:29:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FDB6E217;
	Wed, 13 May 2020 12:29:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A38D6E217
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 12:29:46 +0000 (UTC)
IronPort-SDR: mslmK3rfRuCCTe8bojsXfRmjVJQb1Jz8TMYiQml7l9/b8etpNEPPqA93pycdloxw3d8d799nVz
 Ipj0sA+NwQTw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 05:29:46 -0700
IronPort-SDR: R4aSYAhjEWA8mzD5F3Km/XvnrzzQ4fuMw8KDVXCWZPrS3cS2H6BxKWEwywHXWGj9PNtzl9E+XA
 uzvgNW7Jg3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,387,1583222400"; d="scan'208";a="280486575"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 13 May 2020 05:29:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 13 May 2020 15:29:43 +0300
Date: Wed, 13 May 2020 15:29:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Massimo B." <massimo.b@gmx.net>
Subject: Re: [drm] Reducing the compressed framebuffer size
Message-ID: <20200513122943.GC6112@intel.com>
References: <56fb2eaf4241f80799f25733c242489e00c6021a.camel@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56fb2eaf4241f80799f25733c242489e00c6021a.camel@gmx.net>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 12, 2020 at 03:36:01PM +0200, Massimo B. wrote:
> Hello everybody,
> =

> since Kernel 5.6.5 I encounter many syslog lines like
> =

> [kernel] [drm] Reducing the compressed framebuffer size. This may lead to=
 less power savings than a non-reduced-size. Try to increase stolen memory =
size if available in BIOS.
>                 - Last output repeated 4 times -
> =

> I found some explanation at:
> https://wiki.archlinux.org/index.php/intel_graphics#Framebuffer_compressi=
on_(enable_fbc)
> But why do I get this with a i7-4790 Haswell, which is not pre-Sandy?

FBC is a thing for all platform generations.

> =

> Anyway I followed the hint and set
> =

> # cat /etc/modprobe.d/i915.conf
> options i915 enable_fbc=3D0
> =

> After reboot the setting seems active:
> =

> # cat /sys/module/i915/parameters/enable_fbc
> 0
> =

> But I still get the same logs. Which BIOS setting is responsible, how can=
 I fix
> that? Is there a better place to ask?

There is a patch on its way somewhere to linus/stable trees to eliminate
this dmesg spam:
https://cgit.freedesktop.org/drm-intel/commit/?id=3D6b7fc6a3e6af4ff5773949d=
0fed70d8e7f68d5ce

But it's a bit strange you still get it with fbc disabled. The logic
for when to allocate the cfb may be a bit busted atm...

> =

> # lspci |grep VGA
> 00:02.0 VGA compatible controller: Intel Corporation Xeon E3-1200 v3/4th =
Gen Core Processor Integrated Graphics Controller (rev 06)
> =

> # grep name /proc/cpuinfo |tail -n1
> model name	: Intel(R) Core(TM) i7-4790 CPU @ 3.60GHz
> =

> Best regards,
> Massimo
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
