Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE4341BF5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 13:07:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FC7A6E1A5;
	Fri, 19 Mar 2021 12:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F996E1A5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 12:07:08 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id x21so10470538eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 05:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=Al37MJydlMGr2njK3Rs+gQkH+JD+kyrZAzQzhVtO1Qs=;
 b=qu5IcDDMydI23eQb0gvJmq3079Irl0drkFY3bmkiMUqc2g3dSrp9sAHJ30Tb2e3/4v
 i68SK7bXAc5HXU6fmTeQuMuLd3Y4xa6Erzoj08GrHsQL1dZtv0wsVKhprCgk1hDI2JJL
 LUBjT8O6lQR6DWcVX4x7f7YUJdnv3aRUTEp7GjbrecHekEUfIZ0vjqawt0xcpm3+IcaK
 9g27q6Z9h9tmjJFIKMqiQ+Z4mT/9Udc67Fjfe+qwyk4tG/BkmHLRqdnrFblgD3t7AfK1
 nIDJvwghOeIYBTlqwTHOVjtYeCNoo1HZX3t6aLoGox69whXBxWxH9GDZGcSoPjvanVBc
 7cEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Al37MJydlMGr2njK3Rs+gQkH+JD+kyrZAzQzhVtO1Qs=;
 b=KTvIyig6iDjLM5R97bqZSJOZoncmWtkH+6QLz6O+g4rD7Kn5VJU9rdE7YpWF3iYZQv
 OJx0dDhK4XUDDVFWSN1bLpeGkhWn5GX4BhnvNI2HPx7sx0W4ggvkeg+HaT4EzRAVjfQ/
 jv9q4HiIhBTCNWCeoD9yDBWyMpWQdBbYiQa4HDorqPZF3XT69WhNnm0hrdIIcNilAbP1
 H4J8TNJpEsctOlVEr+rj8BAMVXH2Jv/+nxIU/eIfFO4+WoucX8Ea+3cY6MarPL60a/ja
 zspQdd2PvznRe4mvj+xHIqvk4o7r9Gx+KLUdAlwApK+uvwg24yE5xHLYXNtzX2Vo5H79
 D2LA==
X-Gm-Message-State: AOAM531tpxWqf280+O+IwAF0p63RbvYE5AffIeevJZqSUur8a2uQcFCZ
 iuNnTFuz4uMJCWnynFwBW6g=
X-Google-Smtp-Source: ABdhPJxGJ/Ht1/sMUrwD9+Z++hvrHrFVCaRubF3S/K/QspaH2E6SMzxwXbeWYeluRSGbHd2s0aBjXQ==
X-Received: by 2002:a05:6402:51d4:: with SMTP id
 r20mr9073960edd.112.1616155627194; 
 Fri, 19 Mar 2021 05:07:07 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:2273:f2cc:fdad:3191?
 ([2a02:908:1252:fb60:2273:f2cc:fdad:3191])
 by smtp.gmail.com with ESMTPSA id g21sm3557515ejd.6.2021.03.19.05.07.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Mar 2021 05:07:06 -0700 (PDT)
Subject: Re: [PATCH 1/3] drm/ttm: move swapout logic around v2
To: dri-devel@lists.freedesktop.org, lkml <linux-kernel@vger.kernel.org>
References: <20210318124719.13656-1-christian.koenig@amd.com>
 <202103190217.QRu8z9Vb-lkp@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <44e0374c-05b6-88d2-5687-79efde9ce0df@gmail.com>
Date: Fri, 19 Mar 2021 13:07:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <202103190217.QRu8z9Vb-lkp@intel.com>
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

General question for the audience: Is there any way to silence the build 
bot here?

This is a well known false positive.

Regards,
Christian.

Am 18.03.21 um 19:13 schrieb kernel test robot:
> Hi "Christian,
>
> I love your patch! Yet something to improve:
>
> [auto build test ERROR on drm-tip/drm-tip]
> [also build test ERROR on next-20210318]
> [cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next linus/master v5.12-rc3]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Christian-K-nig/drm-ttm-move-swapout-logic-around-v2/20210318-204848
> base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
> config: x86_64-randconfig-a005-20210318 (attached as .config)
> compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6db3ab2903f42712f44000afb5aa467efbd25f35)
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # install x86_64 cross compiling tool for clang build
>          # apt-get install binutils-x86-64-linux-gnu
>          # https://github.com/0day-ci/linux/commit/a454d56ea061b53d24a62a700743e4508dd6c9b1
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Christian-K-nig/drm-ttm-move-swapout-logic-around-v2/20210318-204848
>          git checkout a454d56ea061b53d24a62a700743e4508dd6c9b1
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=x86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>>> drivers/gpu/drm/ttm/ttm_device.c:109:5: error: conflicting types for 'ttm_global_swapout'
>     int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>         ^
>     include/drm/ttm/ttm_device.h:300:6: note: previous declaration is here
>     long ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags);
>          ^
>     1 error generated.
>
>
> vim +/ttm_global_swapout +109 drivers/gpu/drm/ttm/ttm_device.c
>
>     104	
>     105	/**
>     106	 * A buffer object shrink method that tries to swap out the first
>     107	 * buffer object on the global::swap_lru list.
>     108	 */
>   > 109	int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>     110	{
>     111		struct ttm_global *glob = &ttm_glob;
>     112		struct ttm_buffer_object *bo;
>     113		unsigned i;
>     114		int ret;
>     115	
>     116		spin_lock(&glob->lru_lock);
>     117		for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>     118			list_for_each_entry(bo, &glob->swap_lru[i], swap) {
>     119				uint32_t num_pages = bo->ttm->num_pages;
>     120	
>     121				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>     122				/* ttm_bo_swapout has dropped the lru_lock */
>     123				if (!ret)
>     124					return num_pages;
>     125				if (ret != -EBUSY)
>     126					return ret;
>     127			}
>     128		}
>     129		spin_unlock(&glob->lru_lock);
>     130		return 0;
>     131	}
>     132	EXPORT_SYMBOL(ttm_global_swapout);
>     133	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
