Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61155A9D747
	for <lists+dri-devel@lfdr.de>; Sat, 26 Apr 2025 04:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB7610E03D;
	Sat, 26 Apr 2025 02:33:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NV3HH5cT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FE110E03D
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Apr 2025 02:32:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D961F5C7045;
 Sat, 26 Apr 2025 02:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B430EC4CEE4;
 Sat, 26 Apr 2025 02:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1745634770;
 bh=+RUTWIt3VFeUueyp+/LHBU7OQa1nslQTo03DjgGapQA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NV3HH5cTytNLqUSnhZu/e/1hOQv76j3RXu91ccBhnAZKPShm2ywlHlwxEmP2NFyJ8
 9mJGv0SrHBCtXVkieOdFVL+aj36B86SkAmVo+3g7zY7zwp1CWMsmr/ZbWtOT8bEZyr
 8NA5f5WhQqLgsoDwMQL/xkJ+DI4oOl2RlkHukU3w=
Date: Fri, 25 Apr 2025 19:32:49 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alessandro Carminati <acarmina@redhat.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook
 <keescook@chromium.org>, Daniel Diaz <daniel.diaz@linaro.org>, David Gow
 <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, Brendan
 Higgins <brendan.higgins@linux.dev>, Naresh Kamboju
 <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Daniel
 Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, Guenter
 Roeck <linux@roeck-us.net>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250425193249.78b45d2589575c15f483c3d8@linux-foundation.org>
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 13 Mar 2025 11:43:15 +0000 Alessandro Carminati <acarmina@redhat.com> wrote:

> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.

I've had this series in mm.git's mm-new branch for a while.  I didn't
send it up for 6.15-rc1 due to what I believe to be unresolved review
issues.

I'll drop this v4 series.  Please resend if/when suitable.

Some notes I have taken are:

https://lkml.kernel.org/r/202504190918.JLNuRGVb-lkp@intel.com
https://lkml.kernel.org/r/20250402074550.GQ5880@noisy.programming.kicks-ass.net
#arm64-add-support-for-suppressing-warning-backtraces.patch: check review

Some fixes I had merged which presumably should be carried forward are
https://lore.kernel.org/all/20250330212934.3F898C4CEDD@smtp.kernel.org/T/
https://lkml.kernel.org/r/20250330212739.85827C4CEDD@smtp.kernel.org

Thanks.
