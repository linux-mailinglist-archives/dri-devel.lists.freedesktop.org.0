Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C33ECE73
	for <lists+dri-devel@lfdr.de>; Mon, 16 Aug 2021 08:10:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E4589BD4;
	Mon, 16 Aug 2021 06:09:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FF989BD4;
 Mon, 16 Aug 2021 06:09:57 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id bo18so24913688pjb.0;
 Sun, 15 Aug 2021 23:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yBXepx96Uzt7lmwTGPkBmOhdZypR4sb8w0ofMcCIZs4=;
 b=NL6JRthm9rulAUGXNXWVph105DI2ohRuebCxj7D8+a6nS/Kdk3H8xW6R1/CiKzI9Pb
 eOu806k5Ui9b9izKOqp93EIb5v1wpJs8uf45xBvkvtj+JjIlKatkoSMycD2dn3coGMQM
 MdLsSMpFWyMi1JUPgu4ARnn+XgUiJ9zQ9Jyy+rUBbKsHnnh2Zk8+S9qonmojC2czLHXW
 LQ0KeciC6/X0jwj1a7b40GLO92sDxw0ZcJgrNTVhsPs1FTSmo5Nyv7u/2aTB9JMzM1Ne
 D9dFm+mgbLsde47q0cB4xYFqKBDJ9RVGjuMB1V4ERDR5T+NGK2HOvOsh8V5jYPcTkLWi
 nKlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yBXepx96Uzt7lmwTGPkBmOhdZypR4sb8w0ofMcCIZs4=;
 b=ARPR+iOZPZuK/bVWFwbPZtBQAyVTB+MZsFXg27n/kwFx+HkAzMdVq/EiW2w/7CxF+i
 sMFniFzJV/XWq0/Na8ONdT3S5Nm0izpitYxw3fQDQwHaiYyw+P6F087tKS+hJlxF8xk8
 xl2n9cityhwBQ0ud8Ea2ZfwfVHrbu96d0c9KMQuLOlkt5DnYG+APK/KSg6GjZR+J4eBV
 Hu+cE0+TRtvuKg7RuIkc24UfC5/ouhpN78E7DparI8O0QvidKfybf+YaTprOLcr6Y+Ux
 P/Pv+CxgNiL/vcPJIYENxF5w0CyWPtMjDTqAkT4wkNS9P8W+8vhu3Hm7CCVwbCdqgEPP
 WDHQ==
X-Gm-Message-State: AOAM5314H9CfFtj0m/6XcQfWSchmqdp7R9JyTeKj4tJzeSxKpEAo9fl7
 cHVNDMVYlYLlpjGIOjMl7dU=
X-Google-Smtp-Source: ABdhPJz7Zbk5K0OogF3OOciuFWfSdaLFO5W2pxGkz13Tapj/4jxxn2a9ahzukk4sel1hoPTBhdoyww==
X-Received: by 2002:a65:6553:: with SMTP id a19mr14691694pgw.8.1629094197266; 
 Sun, 15 Aug 2021 23:09:57 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id l12sm9628104pff.182.2021.08.15.23.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 23:09:56 -0700 (PDT)
Subject: Re: [PATCH v2] drm: avoid races with modesetting rights
To: kernel test robot <lkp@intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Cc: kbuild-all@lists.01.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 skhan@linuxfoundation.org
References: <20210815153740.195330-1-desmondcheongzx@gmail.com>
 <202108160234.Q9HPB7zT-lkp@intel.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <edc6e062-8f13-5d44-bb1a-62133878ade7@gmail.com>
Date: Mon, 16 Aug 2021 14:09:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <202108160234.Q9HPB7zT-lkp@intel.com>
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
> Thank you for the patch! Perhaps something to improve:
> 
> [auto build test WARNING on next-20210813]
> [also build test WARNING on v5.14-rc5]
> [cannot apply to linus/master v5.14-rc5 v5.14-rc4 v5.14-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
> base:    4b358aabb93a2c654cd1dcab1a25a589f6e2b153
> config: arc-randconfig-r031-20210815 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 11.2.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/cf6d8354b7d7953cd866fad004cbb189adfa074f
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Desmond-Cheong-Zhi-Xi/drm-avoid-races-with-modesetting-rights/20210815-234145
>          git checkout cf6d8354b7d7953cd866fad004cbb189adfa074f
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-11.2.0 make.cross ARCH=arc
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All warnings (new ones prefixed by >>):
> 
>>> drivers/gpu/drm/drm_auth.c:483:6: warning: no previous prototype for 'master_flush' [-Wmissing-prototypes]
>       483 | void master_flush(struct callback_head *cb)
>           |      ^~~~~~~~~~~~
> 

My bad, this should have been declared with static. I'll add it in, thanks.

> 
> vim +/master_flush +483 drivers/gpu/drm/drm_auth.c
> 
>     479	
>     480	/* After flushing, all readers that might have seen old master/lease
>     481	 * permissions are guaranteed to have completed.
>     482	 */
>   > 483	void master_flush(struct callback_head *cb)
>     484	{
>     485		struct drm_device *dev = container_of(cb, struct drm_device,
>     486						      master_flush_work);
>     487	
>     488		down_write(&dev->master_rwsem);
>     489		up_write(&dev->master_rwsem);
>     490	}
>     491	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

