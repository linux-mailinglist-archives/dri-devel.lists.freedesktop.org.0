Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067E329C9C
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 12:31:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B426E91C;
	Tue,  2 Mar 2021 11:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE2B6E91C;
 Tue,  2 Mar 2021 11:31:17 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p8so8248212ejb.10;
 Tue, 02 Mar 2021 03:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language;
 bh=BoLODKzDmFaUtsj+h2SX9noFp6n0vAlIgW9dQIPqqEM=;
 b=NxfMnznYNBEAeXJ4OaaAFdixmvLjOWgx/ZaXYbyfmgE81Wcz2LsnqFRe9ynNMZmyCy
 Z+tk773xOQQZ8PqhLCNL2hODsXTIyJwXn5QN1/x5gjuPK26Sx64BeglhGgZz2uUr4zEz
 dDXMMZptKotO2sm4fhI5txP9WRMOjdBoreFnO2wi13Vh+DkW5gMhiYVdmQ8uYDi3qWyk
 OUvIati8DtTuhgvsPKGqqPG7eBsqqnaPdKn0UhZeuxeOs6tV45FmE0ld4bguRf0p4qto
 +ofJFMBvYTKVqAGte/MDN8q7qkOimHNjIkZCnv5JIH1cJgguGayNILLvvzJWFLpf3ugZ
 NZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language;
 bh=BoLODKzDmFaUtsj+h2SX9noFp6n0vAlIgW9dQIPqqEM=;
 b=ttYIz36EW9wp/45SmskxuEW15ag4qUfNDez0bm9maRXZC9xKjhiiK5RmCg3Sajt+du
 HnVsYMOzZlaS9otyxEanAuOgpNQzW0WwvwehptJoU1r+Ma5UGVyLAJ4i27GMyddDeJYJ
 oNJHl2ElDekWQUgxZ32YlRRSRrmfzN1VoU1XfwxG0MXlBf7RrloKXixBJe7E5O21qmSc
 wmvz8f3esvochCMdQES0txmruPjfS9Yn6shgxE4xP/ZFJBtei0OJ3TLaDQNrQKcPFBQo
 csXIVEkrkoMtFY9/IdcPG9snxlv1U/CzeFZxR3RX39EiQ6XY3Et0zOzlqn99RuykgVm/
 Ietg==
X-Gm-Message-State: AOAM533A6WEUzNPpbdxmneNEMbGHKyrd3ghrMk0/MKi+6FWKhXvKSxAW
 DqjFTZvMh/vM7eug9mSEIxw=
X-Google-Smtp-Source: ABdhPJyUSLqFrZpI85Kh8ul2529ymqB2WEWKe1iomIkfj60l3YeQMPbGeohjUYkBjCNNN7piw080EQ==
X-Received: by 2002:a17:906:2991:: with SMTP id
 x17mr20642977eje.367.1614684675626; 
 Tue, 02 Mar 2021 03:31:15 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:9804:8dfd:7f6e:acec?
 ([2a02:908:1252:fb60:9804:8dfd:7f6e:acec])
 by smtp.gmail.com with ESMTPSA id i13sm17840726ejj.2.2021.03.02.03.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Mar 2021 03:31:15 -0800 (PST)
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <1614638628-10508-1-git-send-email-Oak.Zeng@amd.com>
 <202103021104.NudsKKei-lkp@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <34b706ca-d15f-223f-e1a3-2ec071d578a2@gmail.com>
Date: Tue, 2 Mar 2021 12:31:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202103021104.NudsKKei-lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, Oak Zeng <Oak.Zeng@amd.com>,
 harish.kasiviswanathan@amd.com, christian.koenig@amd.com,
 jinhuieric.huang@amd.com, Alexander.Deucher@amd.com, Felix.Kuehling@amd.com
Content-Type: multipart/mixed; boundary="===============1849980131=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1849980131==
Content-Type: multipart/alternative;
 boundary="------------EFC9CECAC65C7C49F23625C7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------EFC9CECAC65C7C49F23625C7
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

adding the usual suspects direct. Does anybody of hand know how to check 
if an architecture supports ioremap_cache()?

For now we only need this on X86, but I would feel better if we don't 
use an #ifdef here.

Regards,
Christian.

Am 02.03.21 um 05:12 schrieb kernel test robot:
> Hi Oak,
>
> Thank you for the patch! Yet something to improve:
>
> [auto build test ERROR on drm-intel/for-linux-next]
> [also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210302]
> [cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next drm/drm-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
>
> url:    https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500
> base:   git://anongit.freedesktop.org/drm-intel for-linux-next
> config: parisc-randconfig-r012-20210302 (attached as .config)
> compiler: hppa-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea60a64
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500
>          git checkout 225bb3711439ec559dd72ae5af8e62d34ea60a64
>          # save the attached .config to linux build tree
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>     drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resource_ioremap':
>>> drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]
>        95 |    addr = ioremap_cache(mem->bus.offset, bus_size);
>           |           ^~~~~~~~~~~~~
>           |           ioremap_uc
>     drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>        95 |    addr = ioremap_cache(mem->bus.offset, bus_size);
>           |         ^
>     drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_ioremap':
>     drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       379 |    map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
>           |                 ^
>     drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':
>     drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
>       500 |    vaddr_iomem = ioremap_cache(mem->bus.offset,
>           |                ^
>     cc1: some warnings being treated as errors
>
>
> vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c
>
>      74	
>      75	static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
>      76				       struct ttm_resource *mem,
>      77				       void **virtual)
>      78	{
>      79		int ret;
>      80		void *addr;
>      81	
>      82		*virtual = NULL;
>      83		ret = ttm_mem_io_reserve(bdev, mem);
>      84		if (ret || !mem->bus.is_iomem)
>      85			return ret;
>      86	
>      87		if (mem->bus.addr) {
>      88			addr = mem->bus.addr;
>      89		} else {
>      90			size_t bus_size = (size_t)mem->num_pages << PAGE_SHIFT;
>      91	
>      92			if (mem->bus.caching == ttm_write_combined)
>      93				addr = ioremap_wc(mem->bus.offset, bus_size);
>      94			else if (mem->bus.caching == ttm_cached)
>    > 95				addr = ioremap_cache(mem->bus.offset, bus_size);
>      96			else
>      97				addr = ioremap(mem->bus.offset, bus_size);
>      98			if (!addr) {
>      99				ttm_mem_io_free(bdev, mem);
>     100				return -ENOMEM;
>     101			}
>     102		}
>     103		*virtual = addr;
>     104		return 0;
>     105	}
>     106	
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--------------EFC9CECAC65C7C49F23625C7
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    Hi guys,<br>
    <br>
    adding the usual suspects direct. Does anybody of hand know how to
    check if an architecture supports ioremap_cache()?<br>
    <br>
    For now we only need this on X86, but I would feel better if we
    don't use an #ifdef here.<br>
    <br>
    Regards,<br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 02.03.21 um 05:12 schrieb kernel
      test robot:<br>
    </div>
    <blockquote type="cite"
      cite="mid:202103021104.NudsKKei-lkp@intel.com">
      <pre class="moz-quote-pre" wrap="">Hi Oak,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm-intel/for-linux-next]
[also build test ERROR on drm-tip/drm-tip linus/master v5.12-rc1 next-20210302]
[cannot apply to tegra-drm/drm/tegra/for-next drm-exynos/exynos-drm-next drm/drm-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
<a class="moz-txt-link-freetext" href="https://git-scm.com/docs/git-format-patch">https://git-scm.com/docs/git-format-patch</a>]

url:    <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500">https://github.com/0day-ci/linux/commits/Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500</a>
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
config: parisc-randconfig-r012-20210302 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget <a class="moz-txt-link-freetext" href="https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a> -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea60a64">https://github.com/0day-ci/linux/commit/225bb3711439ec559dd72ae5af8e62d34ea60a64</a>
        git remote add linux-review <a class="moz-txt-link-freetext" href="https://github.com/0day-ci/linux">https://github.com/0day-ci/linux</a>
        git fetch --no-tags linux-review Oak-Zeng/drm-ttm-ioremap-buffer-according-to-TTM-mem-caching-setting/20210302-064500
        git checkout 225bb3711439ec559dd72ae5af8e62d34ea60a64
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <a class="moz-txt-link-rfc2396E" href="mailto:lkp@intel.com">&lt;lkp@intel.com&gt;</a>

All errors (new ones prefixed by &gt;&gt;):

   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_resource_ioremap':
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">drivers/gpu/drm/ttm/ttm_bo_util.c:95:11: error: implicit declaration of function 'ioremap_cache'; did you mean 'ioremap_uc'? [-Werror=implicit-function-declaration]
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">      95 |    addr = ioremap_cache(mem-&gt;bus.offset, bus_size);
         |           ^~~~~~~~~~~~~
         |           ioremap_uc
   drivers/gpu/drm/ttm/ttm_bo_util.c:95:9: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      95 |    addr = ioremap_cache(mem-&gt;bus.offset, bus_size);
         |         ^
   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_ioremap':
   drivers/gpu/drm/ttm/ttm_bo_util.c:379:17: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     379 |    map-&gt;virtual = ioremap_cache(bo-&gt;mem.bus.offset + offset,
         |                 ^
   drivers/gpu/drm/ttm/ttm_bo_util.c: In function 'ttm_bo_vmap':
   drivers/gpu/drm/ttm/ttm_bo_util.c:500:16: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     500 |    vaddr_iomem = ioremap_cache(mem-&gt;bus.offset,
         |                ^
   cc1: some warnings being treated as errors


vim +95 drivers/gpu/drm/ttm/ttm_bo_util.c

    74	
    75	static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
    76				       struct ttm_resource *mem,
    77				       void **virtual)
    78	{
    79		int ret;
    80		void *addr;
    81	
    82		*virtual = NULL;
    83		ret = ttm_mem_io_reserve(bdev, mem);
    84		if (ret || !mem-&gt;bus.is_iomem)
    85			return ret;
    86	
    87		if (mem-&gt;bus.addr) {
    88			addr = mem-&gt;bus.addr;
    89		} else {
    90			size_t bus_size = (size_t)mem-&gt;num_pages &lt;&lt; PAGE_SHIFT;
    91	
    92			if (mem-&gt;bus.caching == ttm_write_combined)
    93				addr = ioremap_wc(mem-&gt;bus.offset, bus_size);
    94			else if (mem-&gt;bus.caching == ttm_cached)
  &gt; 95				addr = ioremap_cache(mem-&gt;bus.offset, bus_size);
    96			else
    97				addr = ioremap(mem-&gt;bus.offset, bus_size);
    98			if (!addr) {
    99				ttm_mem_io_free(bdev, mem);
   100				return -ENOMEM;
   101			}
   102		}
   103		*virtual = addr;
   104		return 0;
   105	}
   106	

---
0-DAY CI Kernel Test Service, Intel Corporation
<a class="moz-txt-link-freetext" href="https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</a>
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------EFC9CECAC65C7C49F23625C7--

--===============1849980131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1849980131==--
