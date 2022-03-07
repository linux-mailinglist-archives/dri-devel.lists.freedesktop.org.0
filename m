Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD934D02E0
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 16:29:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F034B10E027;
	Mon,  7 Mar 2022 15:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA4B10E027;
 Mon,  7 Mar 2022 15:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646666969; x=1678202969;
 h=message-id:date:mime-version:to:cc:references:from:
 subject:in-reply-to:content-transfer-encoding;
 bh=+Ryh1cggbQNBN3ci8CirZd3kAvv6BbXwKIEkPSgvYgY=;
 b=JMxTF1fSCVM8W57maYuXQGwAw1E8Godzt4FHpwgklmGDsgDWWtvFpSwG
 adYr9f76bUJXWs8XNCtfWqohPB4glgULKg+h4ln0WkdSitUlUO/cygBOQ
 EBkDGhy6QpvZZR/y0Zs2IL3mqd0XIEqf8ZpIGx7S+LSE9+uTVHrb9OCnI
 ZezShSjTIukEEWy/cKk/wPsjP2jYlYcAaLdkw7sm7qxdbTcYJOYeCjkg6
 Qfd3r701DeheGHzAkTZgnhxRdBt2qX3pDkLlyvkzzkv2Ir+WMiU6BxWiF
 fhsi7p0SPe6edFVkx85MUM3kR+O70q1VZt6WNX+7xtZlaggcLi7MyAfXi w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254145141"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254145141"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 07:29:28 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643281164"
Received: from mshipman-mobl5.amr.corp.intel.com (HELO [10.251.12.40])
 ([10.251.12.40])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 07:29:28 -0800
Message-ID: <3c974f25-ece6-102b-01c3-bd7e6274f613@intel.com>
Date: Mon, 7 Mar 2022 07:29:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>
References: <20220306032655.97863-1-jarkko@kernel.org>
 <20220306152456.2649b1c56da2a4ce4f487be4@linux-foundation.org>
 <c3083144-bfc1-3260-164c-e59b2d110df8@intel.com> <YiXsJRE8CWOvFNWH@iki.fi>
From: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH RFC v2] mm: Add f_ops->populate()
In-Reply-To: <YiXsJRE8CWOvFNWH@iki.fi>
Content-Type: text/plain; charset=UTF-8
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
Cc: codalist@telemann.coda.cs.cmu.edu, jaharkes@cs.cmu.edu,
 Nathaniel McCallum <nathaniel@profian.com>, linux-unionfs@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Dave Hansen <dave.hansen@linux.intel.com>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Reinette Chatre <reinette.chatre@intel.com>, linux-sgx@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/7/22 03:27, Jarkko Sakkinen wrote:
> But e.g. in __mm_populate() anything with (VM_IO | VM_PFNMAP) gets
> filtered out and never reach that function.
> 
> I don't know unorthodox that'd be but could we perhaps have a VM
> flag for SGX?

SGX only works on a subset of the chips from one vendor on one
architecture.  That doesn't seem worth burning a VM flag.
