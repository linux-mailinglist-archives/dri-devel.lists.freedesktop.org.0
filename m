Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6C7467281
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 08:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457487343D;
	Fri,  3 Dec 2021 07:21:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 553 seconds by postgrey-1.36 at gabe;
 Fri, 03 Dec 2021 07:21:07 UTC
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC1A73436;
 Fri,  3 Dec 2021 07:21:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0D70A62445;
 Fri,  3 Dec 2021 07:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60916C53FC7;
 Fri,  3 Dec 2021 07:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638515512;
 bh=83CYGlqu4IxdxRASAP3V0vFTniV6uzw++7hL/O+6/M0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BiBjhaMFMXTr8yUd30E6nsfplxjABvl7IKlFzvV5/HAjmRAL8iKhBGupVxzXNVTo0
 jOqXmxMQCMOYsoawohqAxNgqWtK8RkIGAkAAd+KR+iyEHiLsc/hRGO0eV1eTkv3oWR
 JEW4F8wU1v09/Sc0rHQwH87d6EWoTd7DtXn8fcak=
Date: Fri, 3 Dec 2021 08:11:47 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH bpf v2] treewide: add missing includes masked by cgroup
 -> bpf dependency
Message-ID: <YanDM7hD9KucIRq6@kroah.com>
References: <20211202203400.1208663-1-kuba@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211202203400.1208663-1-kuba@kernel.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, songliubraving@fb.com,
 kafai@fb.com, airlied@linux.ie, linux-pci@vger.kernel.org, ast@kernel.org,
 dri-devel@lists.freedesktop.org, andrii@kernel.org, a-govindraju@ti.com,
 ray.huang@amd.com, sbhatta@marvell.com, lorenzo.pieralisi@arm.com,
 daniel@iogearbox.net, krzysztof.kozlowski@canonical.com,
 john.fastabend@gmail.com, hkelam@marvell.com, geert@linux-m68k.org,
 matthew.auld@intel.com, yhs@fb.com, sgoutham@marvell.com,
 thomas.hellstrom@linux.intel.com, pawell@cadence.com, tzimmermann@suse.de,
 mani@kernel.org, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 kpsingh@kernel.org, rogerq@kernel.org, linux-samsung-soc@vger.kernel.org,
 rodrigo.vivi@intel.com, bhelgaas@google.com, sean@poorly.run,
 akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 axboe@kernel.dk, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>,
 lima@lists.freedesktop.org, linux-mm@kvack.org, jingoohan1@gmail.com,
 Peter Chen <peter.chen@kernel.org>, linux-usb@vger.kernel.org,
 christian.koenig@amd.com, yuq825@gmail.com, bpf@vger.kernel.org,
 colin.king@intel.com, freedreno@lists.freedesktop.org, gakula@marvell.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 02, 2021 at 12:34:00PM -0800, Jakub Kicinski wrote:
> cgroup.h (therefore swap.h, therefore half of the universe)
> includes bpf.h which in turn includes module.h and slab.h.
> Since we're about to get rid of that dependency we need
> to clean things up.
> 
> v2: drop the cpu.h include from cacheinfo.h, it's not necessary
> and it makes riscv sensitive to ordering of include files.
> 
> Link: https://lore.kernel.org/all/20211120035253.72074-1-kuba@kernel.org/  # v1
> Link: https://lore.kernel.org/all/20211120165528.197359-1-kuba@kernel.org/ # cacheinfo discussion
> Acked-by: Krzysztof Wilczyński <kw@linux.com>
> Acked-by: Peter Chen <peter.chen@kernel.org>
> Acked-by: SeongJae Park <sj@kernel.org>
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
