Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F024373FF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B7A6E904;
	Fri, 22 Oct 2021 08:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142E66E904;
 Fri, 22 Oct 2021 08:52:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="210050500"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="210050500"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:52:17 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="484600568"
Received: from dkarner-mobl.ger.corp.intel.com (HELO [10.252.48.154])
 ([10.252.48.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:52:16 -0700
Subject: Re: [Intel-gfx] [PATCH 19/28] drm/i915: Pass trylock context to
 callers
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-19-maarten.lankhorst@linux.intel.com>
 <CAM0jSHO1qugMmDtgJLsQaPvOnynPZaAb9xNNdZV87Nd2SsS11w@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <8c528a04-5a7c-75b6-e713-69aa3457504b@linux.intel.com>
Date: Fri, 22 Oct 2021 10:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHO1qugMmDtgJLsQaPvOnynPZaAb9xNNdZV87Nd2SsS11w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 21-10-2021 om 20:03 schreef Matthew Auld:
> On Thu, 21 Oct 2021 at 11:37, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Needs a proper commit message.

What about this?

drm/i915: Pass trylock context to callers

We are moving away from short term pinning, and need a way to evict objects locked by the current context. Pass the ww context to all eviction functions, so that they can evict objects that are already locked by the current ww context.

On top of that, this slightly improves ww handling because the locked objects are marked as locked by the correct ww.

