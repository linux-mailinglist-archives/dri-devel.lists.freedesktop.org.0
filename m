Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905342723F
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 22:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 734956E101;
	Fri,  8 Oct 2021 20:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46556E101
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 20:28:41 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10131"; a="225357694"
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="225357694"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 13:28:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,358,1624345200"; d="scan'208";a="525161711"
Received: from lenovo-x280.ger.corp.intel.com (HELO [10.249.254.98])
 ([10.249.254.98])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 13:28:22 -0700
Message-ID: <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Date: Fri, 08 Oct 2021 22:28:20 +0200
In-Reply-To: <20211008173146.645127-1-zackr@vmware.com>
References: <20211008173146.645127-1-zackr@vmware.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2021-10-08 at 13:31 -0400, Zack Rusin wrote:
> This is a largely trivial set that makes vmwgfx support module reload
> and PCI hot-unplug. It also makes IGT's core_hotunplug pass instead
> of kernel oops'ing.
> 
> The one "ugly" change is the "Introduce a new placement for MOB page
> tables". It seems vmwgfx has been violating a TTM assumption that
> TTM_PL_SYSTEM buffers are never fenced for a while. Apart from a
> kernel
> oops on module unload it didn't seem to wreak too much havoc, but we
> shouldn't be abusing TTM. So to solve it we're introducing a new
> placement, which is basically system, but can deal with fenced bo's.
> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Hi, Zack,

What part of TTM doesn't allow fenced system memory currently? It was
certainly designed to allow that and vmwgfx has been relying on that
since the introduction of MOBs IIRC. Also i915 is currently relying on
that.

/Thomas


