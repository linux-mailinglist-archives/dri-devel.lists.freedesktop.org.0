Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2DE7B7884
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 09:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88DB410E0DB;
	Wed,  4 Oct 2023 07:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E20E10E0DB;
 Wed,  4 Oct 2023 07:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696403863; x=1727939863;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FLShTU0dqFh0c9exjM44E/XKCEvpdLCfGmlemj7eCcQ=;
 b=oJoLsmsKTfUSuLYLndF21/7fX0PtY7MOVWoO+lkvMuIJCQJakr0uFV/v
 ml/oRtkVOjqJZMQkHNcV0fOwKBaIhaLBnln9lu4HkQLOEz71Y/htyGW8Q
 noCyxVoyK7s2nJiU0fn1AiMAOW5ztYWNTbwChp230zSDpASX3UEPdqBmV
 nNsRDHzTfsj9EyIzU0EqSdxrmZotHYf0ITevrdYfA759tJO5Zm1W8B71m
 bRRSnDXLEThLxjE+mxsUdZAziIdNVtiUF7wi8b43KzCfTveTq94GfmLbR
 MXtpe/7yWiVSjUo8aXKAZ1x2bUhvS+QyUZkfifG9gtEppxfyjNjptJBPY g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368143468"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="368143468"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:17:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744833823"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; d="scan'208";a="744833823"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.246])
 ([10.249.254.246])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 00:17:40 -0700
Message-ID: <d29ad7b31b39e95280cc96ad93613967467721bb.camel@linux.intel.com>
Subject: Re: bulk_move in ttm_resource manager
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>
Date: Wed, 04 Oct 2023 09:17:39 +0200
In-Reply-To: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2023-10-04 at 03:52 +0000, Zeng, Oak wrote:
> Hi Christian,
> =C2=A0
> As a follow up to this thread:
> https://www.spinics.net/lists/dri-devel/msg410740.html, I started the
> work of moving the lru out of ttm_resource_manager and make it a
> common library for both ttm and svm. While look into the details of
> the bulk_move in ttm resource manager, I found a potential problem:
> =C2=A0
> For simplicity, let=E2=80=99s say we only have one memory type and one
> priority, so ttm resource manager only maintains one global lru list.
> Let=E2=80=99s say this list has 10 nodes, node1 to node10.
> =C2=A0
> But the lru_bulk_move is per vm. Let=E2=80=99s say vm1 has a bulk_move
> covering node range [node4, node7] and vm2 has a bulk_move covering
> node range [node6, node9]. Notice those two range has an overlap.
> Since two vm can simultaneously add nodes to lru, I think this
> scenario can happen.
> =C2=A0
> Now if we perform a bulk move for vm1, moving [node4, node7] to the
> tail of the lru list. The lru after this bulk move will be: node1,
> node2, node3,node8,node9, node10, node4, node5, node6, node7. Now
> notice that for vm2=E2=80=99s bulk_move, the first pointer =C2=A0(pointin=
g to
> node6) is actually after the last pointer (pointing to node9), which
> doesn=E2=80=99t make sense.
> =C2=A0
> Is this a real problem? As I understand it, with this issue, we only
> mess up the lru list order, but there won=E2=80=99t be any functional
> problem. If it is a real problem, should we make the bulk_move global
> instead of per vm based?
> =C2=A0
> Thanks,
> Oak
> =C2=A0

FWIW I have a patch set that converts the TTM bulk move code to using
sublists; a list item is either a resource or a sublist, and when
performing a bulk move essentially the sublist is moved. Bumping
resource LRU within a VM would touch only the sublist.

Currently functionality and TTM API is essentially the same but when
experimenting with LRU traversal for exhaustive WW-locking eviction
this concept was easier to use. Also hopefully this would reduce
fragility and improve understanding since a scenario like the above
could really never happen...

Let me know if I should send it out as an RFC.

Code is here:
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/351/commits

/Thomas





