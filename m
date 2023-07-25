Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B16F37627A3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 02:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FFE10E0A0;
	Wed, 26 Jul 2023 00:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148B10E0A0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 00:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690330045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqtBRl91W0JZDd0g7bqH9GXNg2xVDfF+qvrH5f+9Vjc=;
 b=NzbIIp5fmJ6B/2B+nHr1jsYyVrBS/H22ZePH46ntML6qXKCk2/sCZCT/qc00D4i51Rh/Ss
 zlZo+KdKG9faKO3T6uYvsQYT2sBplXYeosOWKzmJOil70eFOjMPk+NIu8rdbT9wD8Z1rw/
 3igL7aOjej//AjacXdfY+m6BjArlfMY=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-cdNX5GWMNGGhf-4mZ1Bg8w-1; Tue, 25 Jul 2023 20:07:24 -0400
X-MC-Unique: cdNX5GWMNGGhf-4mZ1Bg8w-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-51bef8bb689so389716a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 17:07:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690330043; x=1690934843;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WqtBRl91W0JZDd0g7bqH9GXNg2xVDfF+qvrH5f+9Vjc=;
 b=JYkfR//29aijISGzBZDuOuMYDUM+z9NnRLpfm5dYV7wX9BMo9RNT2xIvkFGzd+EVXm
 H6xmVr+hQkiA7eQ63X1W9cIf48ENGX061E17eW1gkf+Eyx5ntuYJCoDPcta8ctdTR7XO
 Ly3CVYhA09/rvwajX2bMkA4Mu7mifFw2VtRnyfuL+LpRogpnuJLUPIOWvtUkssPpAXrK
 dqGWWwMWE9Ue+HNEgINqlAU9QUkgpvcPwMmGtD4sru/whgB4VYNFmBXtD/1f20/+7g/h
 GMkLyFSg4WWdYXkHXgUxoG0t9CaGrvlz6gg9Fm/MJGpUNAyk27UyoyRjhX01IDR6KvnU
 u3EQ==
X-Gm-Message-State: ABy/qLYbZ5LAB+2kX84LZNCdSFN6GX9FDSsFmguseYgWe63/l//YyO3s
 VKlCa9kKkbZbTxG1ZKPLzsZFfk33hXxyPFoKkB/nVM8QQXQJTXIR5fj6Ro3kl3aSV9whbe51h0A
 KUKqQ7Dy5dsnHvvI5qDahLLEQcvL8
X-Received: by 2002:aa7:d3c8:0:b0:522:18b6:c01f with SMTP id
 o8-20020aa7d3c8000000b0052218b6c01fmr803969edr.3.1690330043383; 
 Tue, 25 Jul 2023 17:07:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlH33z4KvbbCtfFWxIdLDrVWs9B6+85VlCdq0KNzorTB3TDsgiY2x+LYShQcj3IHvHXUzDheFQ==
X-Received: by 2002:aa7:d3c8:0:b0:522:18b6:c01f with SMTP id
 o8-20020aa7d3c8000000b0052218b6c01fmr803953edr.3.1690330043120; 
 Tue, 25 Jul 2023 17:07:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r7-20020aa7da07000000b005222aee9ef9sm3818876eds.97.2023.07.25.17.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 17:07:22 -0700 (PDT)
Message-ID: <9d49d9b1-1db8-63c9-b0f6-aa72904f6aaa@redhat.com>
Date: Wed, 26 Jul 2023 00:25:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [drm-misc:for-linux-next 2/2]
 drivers/gpu/drm/drm_debugfs.c:212:33: sparse: sparse: non size-preserving
 pointer to integer cast
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <202307210230.t2OnM5g0-lkp@intel.com>
 <20230724092744.5c5b5700@collabora.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230724092744.5c5b5700@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Boris Brezillon <bbrezillon@kernel.org>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/24/23 09:27, Boris Brezillon wrote:
> On Fri, 21 Jul 2023 02:06:16 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
>> tree:   git://anongit.freedesktop.org/drm/drm-misc for-linux-next
>> head:   c7a472297169156252a50d76965eb36b081186e2
>> commit: 4f66feeab173bd73e71028b8c2e1dcea07e32dd5 [2/2] drm: debugfs: provide infrastructure to dump a DRM GPU VA space
>> config: i386-randconfig-r092-20230720 (https://download.01.org/0day-ci/archive/20230721/202307210230.t2OnM5g0-lkp@intel.com/config)
>> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
>> reproduce: (https://download.01.org/0day-ci/archive/20230721/202307210230.t2OnM5g0-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202307210230.t2OnM5g0-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>>>> drivers/gpu/drm/drm_debugfs.c:212:33: sparse: sparse: non size-preserving pointer to integer cast
>>
>> vim +212 drivers/gpu/drm/drm_debugfs.c
>>
>>     178	
>>     179	/**
>>     180	 * drm_debugfs_gpuva_info - dump the given DRM GPU VA space
>>     181	 * @m: pointer to the &seq_file to write
>>     182	 * @mgr: the &drm_gpuva_manager representing the GPU VA space
>>     183	 *
>>     184	 * Dumps the GPU VA mappings of a given DRM GPU VA manager.
>>     185	 *
>>     186	 * For each DRM GPU VA space drivers should call this function from their
>>     187	 * &drm_info_list's show callback.
>>     188	 *
>>     189	 * Returns: 0 on success, -ENODEV if the &mgr is not initialized
>>     190	 */
>>     191	int drm_debugfs_gpuva_info(struct seq_file *m,
>>     192				   struct drm_gpuva_manager *mgr)
>>     193	{
>>     194		struct drm_gpuva *va, *kva = &mgr->kernel_alloc_node;
>>     195	
>>     196		if (!mgr->name)
>>     197			return -ENODEV;
>>     198	
>>     199		seq_printf(m, "DRM GPU VA space (%s) [0x%016llx;0x%016llx]\n",
>>     200			   mgr->name, mgr->mm_start, mgr->mm_start + mgr->mm_range);
>>     201		seq_printf(m, "Kernel reserved node [0x%016llx;0x%016llx]\n",
>>     202			   kva->va.addr, kva->va.addr + kva->va.range);
>>     203		seq_puts(m, "\n");
>>     204		seq_puts(m, " VAs | start              | range              | end                | object             | object offset\n");
>>     205		seq_puts(m, "-------------------------------------------------------------------------------------------------------------\n");
>>     206		drm_gpuva_for_each_va(va, mgr) {
>>     207			if (unlikely(va == kva))
>>     208				continue;
>>     209	
>>     210			seq_printf(m, "     | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx | 0x%016llx\n",
>>     211				   va->va.addr, va->va.range, va->va.addr + va->va.range,
>>   > 212				   (u64)va->gem.obj, va->gem.offset);
> 
> Oops, I didn't notice it when reviewing. You're leaking a kernel address
> to user space here. You should probably use %p to print the GEM object
> address, and add `no_hash_pointers` to your cmdline when you want to
> debug things.

%p doesn't really work well in terms of formatting, plus for debugfs I 
thought this might be fine. I could maybe use ptr_to_hashval(), but then 
'no_hash_pointers' wouldn't do anything for it.

> 
>>     213		}
>>     214	
>>     215		return 0;
>>     216	}
>>     217	EXPORT_SYMBOL(drm_debugfs_gpuva_info);
>>     218	
>>
> 

