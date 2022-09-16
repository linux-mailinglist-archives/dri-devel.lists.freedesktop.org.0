Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 917265BA826
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0923210ECDF;
	Fri, 16 Sep 2022 08:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556C510ECDF
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:24:50 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C73B47C;
 Fri, 16 Sep 2022 10:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1663316689;
 bh=TBheFs7a/heafyLccN5CvrNZP43Myi2No4cFtTqVNI8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Si5SbfrlJNDT1P8RiJxCpd7Lh7BG8A+FP3vh3HsoXwKagaldcQv8B+1z5brzcdkuM
 Ukwwsk9GJ3LHE6Fo2HDDPd36cx8jZNfu/2PAHpWQAZVIxiY6kIbAjQ0EYAnbwDix/Y
 iHDITC5h2KkCAo0GP3WtTyp2mAdKTn6EgIYyQcBI=
Message-ID: <6c0d4973-7f7e-1893-58b2-9bbe19160045@ideasonboard.com>
Date: Fri, 16 Sep 2022 11:24:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size
 of 1060 bytes is larger than 1024 bytes
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>
References: <202209160259.7f3Z5krO-lkp@intel.com>
 <9b4152e9-34cb-4ed6-b5e3-ef045b40dff2@www.fastmail.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <9b4152e9-34cb-4ed6-b5e3-ef045b40dff2@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/09/2022 21:49, Arnd Bergmann wrote:
> On Thu, Sep 15, 2022, at 8:17 PM, kernel test robot wrote:
>> Hi Arnd,
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>> master
>> head:   3245cb65fd91cd514801bf91f5a3066d562f0ac4
>> commit: 3d427228f7370894680580fcd0381c0349624fa1 ARM: ixp4xx: enable
>> multiplatform support
> 
> This did not cause the problem, the bisection just landed on a
> commit that enabled additional configuraitons.
> 
>>     drivers/gpu/drm/omapdrm/dss/dsi.c: In function 'dsi_dump_dsi_irqs':
>>>> drivers/gpu/drm/omapdrm/dss/dsi.c:1126:1: warning: the frame size of 1060 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>      1126 | }
> 
> I think hte problem is that struct dsi_irq_stats is just too
> large, at 776 bytes. The interrupts are disabled during a copy
> from 'dsi->irq_stats' into 'stats'. A trivial workaround would
> avoid the local copy and keep interrupts disabled through
> the entire function so it can operate directly on the source
> data, but that would introduce a longer time with irqs disabled,
> which might be bad as well.
> 
> Since this is only called from a debugfs file, and reading that
> file is probably not performance critical itself, maybe
> using kmalloc on the large structure would be best.

I think that makes sense. I have sent a patch using kmalloc.

Oddly enough, I was not able to reproduce the warning with my normal 
toolchain, gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf. I even 
reduced the frame size limit to 700, and saw warnings from other places, 
but not from omapdrm.

  Tomi
