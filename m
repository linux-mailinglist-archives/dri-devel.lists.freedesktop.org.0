Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA6C654630
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 19:54:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E178A10E559;
	Thu, 22 Dec 2022 18:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9785710E559;
 Thu, 22 Dec 2022 18:53:26 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1999227wmb.0; 
 Thu, 22 Dec 2022 10:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mZRm9urdOthWqTYxAw02fxkoMKYNKeTirXSn3tbLtpc=;
 b=DqydNKpoK6xZ9NSkK2c/6XM/aLr5fmVcnfv97GPGX4t5d7SoTa1+Vj7MbKtmyUz2kG
 wEZv9euJIhxdwnS5KDjjxd7WRLWoknTnb7dET+eUcY2RTZ3kIF3m+H4D2G5Ky0PknVfL
 Pb9zTvvYizHD2gGeZwV1XN15iZSqKwdQAZZQMkQzluqK20AayXQfNV9HR5CljPueba3M
 c5JXXjGBW71+n2yDA7hqZ74NPrTba2GW9H8fRTM2AVHcN4M9Zcp/XU5uf5DrmEdLdUwc
 uweuf1M7V6MRMRcExOe2U6+80LMwxr2u7ZMnirQicpzKUo+UtZU0ibU3OTdmV9HcNAjU
 eKCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mZRm9urdOthWqTYxAw02fxkoMKYNKeTirXSn3tbLtpc=;
 b=xpa6+7hlkTKNe+L8m1wM53TvjqBNERqPKnNnbK1eQl1AWyldJG5znsDFNHjTk+Bxcq
 sb0WHin8vqR9doMvZDSy8ze7o+g3xY7BlD/+5st6Zq5afCFYRSPj7PlrVfIkfmhR2kcO
 O81TjUZcrM1/0fniR2R/qohAslf0l3NyjsSwCAuDPKgJl5FhmHTDDQl8dcsSwvKDrRdD
 uvWwc5SX1ciozIPfiE1QaePG7PTsgpv/iYEb6LWbUuYoxV+g6U3Hvch+v1aIkmk7QZao
 0QSe3I54T+R7NUDmPaHM3vWJw4odVVWxDXMfvUwvJETeHaUMaFtcNX1CXTxYhB/xw58f
 BYPg==
X-Gm-Message-State: AFqh2kovhb581eBgUTQXtFDfzmtQizDw3Ex5HNA6wK0MaPWOroGh31lK
 aU6m67lbCDkBwxarKQn3nnI=
X-Google-Smtp-Source: AMrXdXsiZnZT37+W2XIO83aQjb+0JFc6XJ5Ad9sd0DAmV5sXvHfzSlJOJgF0vWfO7rAT6BENa8pdNQ==
X-Received: by 2002:a05:600c:15d4:b0:3d1:d746:d95b with SMTP id
 v20-20020a05600c15d400b003d1d746d95bmr7888624wmf.41.1671735205373; 
 Thu, 22 Dec 2022 10:53:25 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 a6-20020adff7c6000000b002421db5f279sm1163666wrq.78.2022.12.22.10.53.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 10:53:24 -0800 (PST)
Date: Thu, 22 Dec 2022 21:53:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, xinhui pan <xinhui.pan@amd.com>,
 amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v6] drm: Optimise for continuous memory allocation
Message-ID: <202212222042.6Dhv6XWG-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221218065708.93332-1-xinhui.pan@amd.com>
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
Cc: lkp@intel.com, arunpravin.paneerselvam@amd.com,
 intel-gfx@lists.freedesktop.org, xinhui pan <xinhui.pan@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 matthew.auld@intel.com, oe-kbuild-all@lists.linux.dev,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi xinhui,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xinhui-pan/drm-Optimise-for-continuous-memory-allocation/20221218-145922
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20221218065708.93332-1-xinhui.pan%40amd.com
patch subject: [PATCH v6] drm: Optimise for continuous memory allocation
config: s390-randconfig-m041-20221218
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/gpu/drm/drm_buddy.c:501 find_continuous_blocks() error: uninitialized symbol 'block'.

vim +/block +501 drivers/gpu/drm/drm_buddy.c

8a257b57bc11a2 xinhui pan 2022-12-18  472  static struct drm_buddy_block *
8a257b57bc11a2 xinhui pan 2022-12-18  473  find_continuous_blocks(struct drm_buddy *mm,
8a257b57bc11a2 xinhui pan 2022-12-18  474  		       int order,
8a257b57bc11a2 xinhui pan 2022-12-18  475  		       unsigned long flags,
8a257b57bc11a2 xinhui pan 2022-12-18  476  		       struct drm_buddy_block **lb)
8a257b57bc11a2 xinhui pan 2022-12-18  477  {
8a257b57bc11a2 xinhui pan 2022-12-18  478  	struct list_head *head = &mm->free_list[order - 1];
8a257b57bc11a2 xinhui pan 2022-12-18  479  	struct drm_buddy_block *free_block, *first = NULL, *last = NULL;
8a257b57bc11a2 xinhui pan 2022-12-18  480  
8a257b57bc11a2 xinhui pan 2022-12-18  481  	/*
8a257b57bc11a2 xinhui pan 2022-12-18  482  	 * Look for continuous free memory in buddy and buddy-in-law.
8a257b57bc11a2 xinhui pan 2022-12-18  483  	 * IOW, the most left blocks at right of free block and the most right
8a257b57bc11a2 xinhui pan 2022-12-18  484  	 * blocks at left of free block.
8a257b57bc11a2 xinhui pan 2022-12-18  485  	 */
8a257b57bc11a2 xinhui pan 2022-12-18  486  
8a257b57bc11a2 xinhui pan 2022-12-18  487  	list_for_each_entry(free_block, head, link) {
8a257b57bc11a2 xinhui pan 2022-12-18  488  		struct drm_buddy_block *buddy, *parent, *block;
8a257b57bc11a2 xinhui pan 2022-12-18  489  		int left, min_order = 0;
8a257b57bc11a2 xinhui pan 2022-12-18  490  		LIST_HEAD(fbl);
8a257b57bc11a2 xinhui pan 2022-12-18  491  
8a257b57bc11a2 xinhui pan 2022-12-18  492  		parent = free_block->parent;
8a257b57bc11a2 xinhui pan 2022-12-18  493  		if (!parent)
8a257b57bc11a2 xinhui pan 2022-12-18  494  			continue;
8a257b57bc11a2 xinhui pan 2022-12-18  495  
8a257b57bc11a2 xinhui pan 2022-12-18  496  		left = parent->left == free_block;
8a257b57bc11a2 xinhui pan 2022-12-18  497  		list_add(&free_block->tmp_link, &fbl);
8a257b57bc11a2 xinhui pan 2022-12-18  498  		buddy = __get_buddy(free_block);
8a257b57bc11a2 xinhui pan 2022-12-18  499  		__continuous_block_in_tree(buddy, &fbl, left, min_order);
8a257b57bc11a2 xinhui pan 2022-12-18  500  
8a257b57bc11a2 xinhui pan 2022-12-18 @501  		while (parent && !((parent->left == block) ^ left)) {
                                                                                            ^^^^^
Not initialized on first iteration.

8a257b57bc11a2 xinhui pan 2022-12-18  502  			block = parent;
8a257b57bc11a2 xinhui pan 2022-12-18  503  			parent = parent->parent;
8a257b57bc11a2 xinhui pan 2022-12-18  504  		}
8a257b57bc11a2 xinhui pan 2022-12-18  505  
8a257b57bc11a2 xinhui pan 2022-12-18  506  		if (!parent)
8a257b57bc11a2 xinhui pan 2022-12-18  507  			continue;
8a257b57bc11a2 xinhui pan 2022-12-18  508  
8a257b57bc11a2 xinhui pan 2022-12-18  509  		buddy = __get_buddy(block);
8a257b57bc11a2 xinhui pan 2022-12-18  510  		__continuous_block_in_tree(buddy, &fbl, !left, min_order);
8a257b57bc11a2 xinhui pan 2022-12-18  511  
8a257b57bc11a2 xinhui pan 2022-12-18  512  		/* list head of fbl is invalid outside.
8a257b57bc11a2 xinhui pan 2022-12-18  513  		 * Walk through list from first fo last only.
8a257b57bc11a2 xinhui pan 2022-12-18  514  		 */
8a257b57bc11a2 xinhui pan 2022-12-18  515  		if (__free_block_in_order(&fbl, free_block, order, &first, &last))
8a257b57bc11a2 xinhui pan 2022-12-18  516  			break;
8a257b57bc11a2 xinhui pan 2022-12-18  517  	}
8a257b57bc11a2 xinhui pan 2022-12-18  518  
8a257b57bc11a2 xinhui pan 2022-12-18  519  	*lb = last;
8a257b57bc11a2 xinhui pan 2022-12-18  520  	return first;
8a257b57bc11a2 xinhui pan 2022-12-18  521  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

