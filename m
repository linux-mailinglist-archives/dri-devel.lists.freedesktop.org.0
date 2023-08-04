Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5886876F760
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 04:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5D9A10E0DB;
	Fri,  4 Aug 2023 02:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F016A10E0DB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 02:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=qWDpikalQA0ynmod7iopQRiHJdZC3scyJ6dSev0m44Q=; b=E5/faL5CK7uvnzvBzgx4w1/AGi
 XySNUHjs7jy/eaP7Qkx6gNvO4LtJvmWM8LRiJO0bGmzg9fJAy1sies4/oKH2PECS+updQ0IJHaNcO
 UtUxzELCT3c+X7pGz0qmmLv4fadEinwgqx1U5ri2vKNgSulvKbN6nxbtqIK2l6A6/IlVfzem8yKmH
 h2kNYu4DILMpJPkkRaBLZMgRbW8vUZPOiONTKG1wgz5a02yQskvYPEGypN3lcdA+vwki6i8w1MhXb
 wxFEMaUlVbbgSNCm1C+45tIWcKTTlBj6vpC3jhQqANf8ZTlK/Ti6/2mRS/dn1BnB/EebOzoM1kPLP
 DvBDTAFA==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qRk8H-00BJlI-1M; Fri, 04 Aug 2023 02:01:39 +0000
Message-ID: <9e77ccc3-07db-f1fe-ef99-981852d4772b@infradead.org>
Date: Thu, 3 Aug 2023 19:01:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: drivers/gpu/drm/bridge/samsung-dsim.c link error
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, Aleksandr Nogikh <nogikh@google.com>
References: <20230803144227.2187749-1-nogikh@google.com>
 <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAHCN7x+8Qq6w0eRC0NwBfhgS7XH7fmmPr9xwhR54rWFNY37Ugg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 syzkaller@googlegroups.com, jagan@amarulasolutions.com, dvyukov@google.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi--

On 8/3/23 08:24, Adam Ford wrote:
> On Thu, Aug 3, 2023 at 9:42 AM Aleksandr Nogikh <nogikh@google.com> wrote:
>>
>> Hello,
>>
>> We've been seing the following linker error on arm64 syzbot instances:
>>
>> ld.lld: error: undefined symbol: phy_mipi_dphy_get_default_config_for_hsclk
>>>>> referenced by samsung-dsim.c:731 (drivers/gpu/drm/bridge/samsung-dsim.c:731)
>>>>>               drivers/gpu/drm/bridge/samsung-dsim.o:(samsung_dsim_init) in archive vmlinux.a
>>
>> Steps to reproduce on the latest linux-next:
>>
>> $ git checkout next-20230803
>> $ wget -O '.config' 'https://raw.githubusercontent.com/google/syzkaller/master/dashboard/config/linux/upstream-arm64-kasan.config'
>> $ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- olddefconfig
>>
>> This also prints:
>>
>> WARNING: unmet direct dependencies detected for GENERIC_PHY_MIPI_DPHY
>>   Depends on [n]: GENERIC_PHY [=n]
>>   Selected by [y]:
>>   - DRM_NWL_MIPI_DSI [=y] && DRM_BRIDGE [=y] && DRM [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>>   - DRM_SAMSUNG_DSIM [=y] && DRM [=y] && DRM_BRIDGE [=y] && COMMON_CLK [=y] && OF [=y] && HAS_IOMEM [=y]
>>
>> $ make CC=clang ARCH=arm64 LD=ld.lld CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)
>>
>> The kernel should have still compiled fine even despite the message above, right?

No. See drivers/Makefile:
obj-$(CONFIG_GENERIC_PHY)	+= phy/

so the drivers/phy/ subdir is only built when CONFIG_GENERIC_PHY is set,
but it's not set.

>> Could you please take a look?
> 
> GENERIC_PHY_MIPI_DPHY was enabled to use
> phy_mipi_dphy_get_default_config() which takes in the pixel clock,
> bits-per-pixel, number of lanes and phy structure.  It applies a bunch
> of math based on the info passed and fills in the structure, but that
> function itself doesn't appear to be referencing phy code, so it's
> likely safe.
> 
> I think this can be resolved by enabling GENERIC_PHY.  I just checked
> linux-next and when I built the arm64 defconfig, it enables
> GENERIC_PHY=y, so I don't think this is an issue.  I also checked the

defconfig doesn't matter in this case. The .config that was provided has:
# CONFIG_GENERIC_PHY is not set
CONFIG_GENERIC_PHY_MIPI_DPHY=y

but yes, selecting GENERIC_PHY (needed in 3 places) does fix the warnings
and build error.  2 instance in drm/bridge/Kconfig and one in
drm/bridge/cadence/Kconfig (found by inspection).



> multi_v7_defconfig for ARM and it also sets GENERIC_PHY=y for 32-bit
> ARM people using some of the Exynos boards.
> 
> I don't know what version of Linux you're trying to build, but I can't
> replicate your issue.

I had no problem replicating the kconfig warnings and build error.

-- 
~Randy
