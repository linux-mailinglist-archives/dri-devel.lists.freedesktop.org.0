Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA95F094C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 12:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8B010EC6F;
	Fri, 30 Sep 2022 10:47:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B633D10E144;
 Fri, 30 Sep 2022 10:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664534852; x=1696070852;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=q2dHTM3USU+BMAo6RHkLsz68CSBSZvHOx9FwJDeiDhU=;
 b=ZdeTy43Kn+FcdEOtzjAXYmeNQNmdlND3G5txN2r+0qtpRLyujt0S1Vsx
 dPqa03XBgKePzXeWeUM0paC8qXiCxAVh+ksTXlkI71oN/Dn4b1ObYM2vT
 2Z9hNNkLyfNHcfLID6T4872ShRRIWfo4aqjOKA1fF9qGlh6l1mK6v4/ER
 s0S7+BixK1OWBT0ptvFsXyf3P5RuVlmOpRk6MEVUh8cc9E92Dd2+SO9n2
 Zi+lMwHg5W343zdh/OLLiKWso5Y3OzthhXorP1dnEaYlQE9CCzaLFibqS
 SMWzsNzepnfIHn4F/fbx/GnJHTZ4FBw31X1LN/zv/7abHF399j5UbpEBD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="328544740"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="328544740"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:47:12 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10485"; a="797930416"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="797930416"
Received: from dtrawins-mobl1.ger.corp.intel.com (HELO [10.252.7.39])
 ([10.252.7.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 03:47:09 -0700
Message-ID: <8fe80949-8b66-2277-0efd-00577b92a0f1@intel.com>
Date: Fri, 30 Sep 2022 11:47:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.0
Subject: Re: [PATCH 11/16] drm/i915/vm_bind: Use common execbuf functions in
 execbuf path
Content-Language: en-GB
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-12-niranjana.vishwanathapura@intel.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220928061918.6340-12-niranjana.vishwanathapura@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, lionel.g.landwerlin@intel.com,
 thomas.hellstrom@intel.com, jason@jlekstrand.net, andi.shyti@linux.intel.com,
 daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
> Update the execbuf path to use common execbuf functions to
> reduce code duplication with the newer execbuf3 path.
> 
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Acked-by: Matthew Auld <matthew.auld@intel.com>
