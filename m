Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A03B59C9
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:32:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52D1B6E0BC;
	Mon, 28 Jun 2021 07:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349BF6E0BC;
 Mon, 28 Jun 2021 07:32:02 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10028"; a="207845851"
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="207845851"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 00:32:00 -0700
X-IronPort-AV: E=Sophos;i="5.83,305,1616482800"; d="scan'208";a="454421242"
Received: from danielmi-mobl2.ger.corp.intel.com (HELO [10.249.254.242])
 ([10.249.254.242])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2021 00:31:58 -0700
Subject: Re: [PATCH v2 1/2] drm/i915/gem: only allow WC for lmem
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210625122751.590289-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <8b41b974-9470-c82e-1450-a5c2e3ad4874@linux.intel.com>
Date: Mon, 28 Jun 2021 09:31:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210625122751.590289-1-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/25/21 2:27 PM, Matthew Auld wrote:
> This is already the case for our kernel internal mappings, and since we
> now only support a single mode this should always be WC if the object
> can be placed in lmem.
>
> v2: rebase and also update set_domain
>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

A couple of questions:

1) Since this now becomes uapi, are we completely sure that we are not 
going to want to map these bos cached when they are evicted or migrated. 
If we think we are going to want to do that, we should probably just 
silently accept any mapping mode user-space wants and then have the 
kernel override user-space's wishes.

Ping Daniel about this as well.

2) How are we going to handle kernel maps to make sure we don't use a 
different kernel map caching mode to these objects. Will that be a later 
series? Seems like we at least need to modify "i915_coherent_map_type"

Apart from this, code looks good to me.

/Thomas


