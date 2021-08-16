Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 897733ED0A6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 10:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4071F896C7;
	Mon, 16 Aug 2021 08:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E32896C7;
 Mon, 16 Aug 2021 08:53:15 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id n5so4884778pjt.4;
 Mon, 16 Aug 2021 01:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wediW2rQNAFGcxyFW6VD+CmiCi3BD219aCF7GpyjEEU=;
 b=TmQlHO6/pVnUytiENEwc9/8WzC/lixrLcEqbj1EIxba1GAR++VeY3wXSuU6BTINntx
 2XYEnMQ01HvHhvYdpyTQ/jKmWx4aAhFeKavsMqE73VhuD1EWjG3ubdyl0AhnUR+nV2Gw
 gt2mMvb1hEezGPu5pLYPY/L4qLXOVG1nRcUss9TS+ItzU91gtWGIexxeQJVXayQa9aRK
 eN6BnEiWlF11bJghxEKyWqslxkayWAF/WVyM2Cp6k6n8evqw2oMWDxfUVQ7QWmcSR+nd
 oaPawBMpQ4W5RHk6Bzx4GQZoBmYbQWqeex3e8uzUe7p1lkqQuXkl2PNI3N1XY2XhsUvZ
 q9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wediW2rQNAFGcxyFW6VD+CmiCi3BD219aCF7GpyjEEU=;
 b=oNnVxlp0yAhyD6J7qgb7eL0pm55s5cqHk3oCLGTK5ZXkNt+CJNeV+DcKnjoNCyCR4X
 IKq4EN8zE8sZKVOdFqeJtuDm6nOCuU2bNefBlDo6KiK2ADEWsygJbda/k/MK2APXqxnS
 PPgR7e0gM/YKP0uuH5Ua9e9Nfi+g+E7sF3Mk0I+EdxpxbaZz5d4n8ZH4P/4YoEBG1hXx
 /QX/9NnChmKbJ9VG/C9/hWHtHPEUbZrpZTzJfhKxMyNp/AQllng3qBESmyJRh8HXf+iB
 yRr5MN9X/UHIDXziQbBjNm7h/b37AoMOeH01nS4OKnxsF1MfjhGj6fHO7ZB3janYfgKF
 oE5w==
X-Gm-Message-State: AOAM533EwvRtISRN/E22AwQ9BR+GxL5C0aSRmlUe1nSBe+OxMAeullGr
 JSWxY9y+xXI9t0uzI3ajfvw=
X-Google-Smtp-Source: ABdhPJwjtmkAuRRMKifOjbWX4QIGY38V894IQNCB/ZBdw4UZQeT6CTo+O+ko0QSFGwf7xXgopNsdmQ==
X-Received: by 2002:a17:90a:d702:: with SMTP id
 y2mr16584952pju.127.1629103995604; 
 Mon, 16 Aug 2021 01:53:15 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id i11sm10448056pfo.29.2021.08.16.01.53.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Aug 2021 01:53:15 -0700 (PDT)
Subject: Re: [PATCH v2] drm: avoid races with modesetting rights
To: kernel test robot <lkp@intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org
References: <20210815153740.195330-1-desmondcheongzx@gmail.com>
 <202108160208.ONHHWxXy-lkp@intel.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <f88fe698-b40c-b309-96c2-32b314280aad@gmail.com>
Date: Mon, 16 Aug 2021 16:53:10 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108160208.ONHHWxXy-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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

On 16/8/21 2:47 am, kernel test robot wrote:
> Hi Desmond,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on next-20210813]
> [also build test ERROR on v5.14-rc5]
> [cannot apply to linus/master v5.14-rc5 v5.14-rc4 v5.14-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> base:    4b358aabb93a2c654cd1dcab1a25a589f6e2b153
> config: i386-randconfig-a004-20210815 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> reproduce (this is a W=1 build):
>          # https://github.com/0day-ci/linux/commit/cf6d8354b7d7953cd866fad004cbb189adfa074f
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
>          git checkout cf6d8354b7d7953cd866fad004cbb189adfa074f
>          # save the attached .config to linux build tree
>          make W=1 ARCH=i386
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>, old ones prefixed by <<):
> 
>>> ERROR: modpost: "task_work_add" [drivers/gpu/drm/drm.ko] undefined!
> 

I'm a bit uncertain about this. Looking into the .config used, this 
error seems to happen because task_work_add isn't an exported symbol, 
but DRM is being compiled as a loadable kernel module (CONFIG_DRM=m).

One way to deal with this is to export the symbol, but there was a 
proposed patch to do this a few months back that wasn't picked up [1], 
so I'm not sure what to make of this.

I'll export the symbol as part of a v3 series, and check in with the 
task-work maintainers.

Link: 
https://lore.kernel.org/lkml/20210127150029.13766-3-joshi.k@samsung.com/ [1]

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

