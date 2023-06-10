Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6372A9A2
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 09:01:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50D8910E125;
	Sat, 10 Jun 2023 07:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF7810E125;
 Sat, 10 Jun 2023 07:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686380495; x=1717916495;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C8O0iq8e/gO1dnR6Zgf9hJ8CrwUxE0qEy6m2azdeuXw=;
 b=U3VYRI08LBS4YpdFrDWxFGZo70e/LK34UWaf2Bea/KiWGypMslyWilFy
 UlSF97FGABPSI1FbY5B4l/nGdrvN1hzfRyJLQNNnnM06L6Tgk3t6VINLM
 e8tWA3dnjVBkfTivlHnuT8FF0B9x19gNOsb/u/cG9XlQrnxmKG5gn2XNV
 OFeGDk1avCyWpWmqHLbWNqhV+hxrS9FViKAPe6OuPtm0uFKdXSebFkPRO
 bU9zrW6BqxDiQMPBoCxlr01DyWwZYtX+2RAic+8QWrFimWGK3oDzALl7Z
 z7o+H9uGE//2/8mwupyiquvBOuVrWVDmM8T1FNS/CsdbKCm12cXQyB9Ku w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="386109629"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; d="scan'208";a="386109629"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:01:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="775746941"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; d="scan'208";a="775746941"
Received: from mnovakov-mobl1.amr.corp.intel.com (HELO localhost)
 ([10.252.60.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2023 00:01:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v5] drm/i915: avoid flush_scheduled_work() usage
In-Reply-To: <47c5fe59-faec-8eb6-7f3c-f76a4bb0f3cb@I-love.SAKURA.ne.jp>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <d8b73f88-d4aa-ed7e-09ea-5ad5ee803893@I-love.SAKURA.ne.jp>
 <5bbe7093-791e-5653-850b-aea343db3f3f@I-love.SAKURA.ne.jp>
 <87a0ab95-d3d2-91b3-1e89-aca3f86a99f5@I-love.SAKURA.ne.jp>
 <173905bb-78d5-4952-cc31-ab0d5697a169@I-love.SAKURA.ne.jp>
 <47c5fe59-faec-8eb6-7f3c-f76a4bb0f3cb@I-love.SAKURA.ne.jp>
Date: Sat, 10 Jun 2023 10:01:28 +0300
Message-ID: <87zg57pzqv.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Luca Coelho <luciano.coelho@intel.com>, DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 22 May 2023, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp> wrote:
> Like commit c4f135d643823a86 ("workqueue: Wrap flush_workqueue() using a
> macro") says, flush_scheduled_work() is dangerous and will be forbidden.
>
> i915 became the last flush_scheduled_work() user, but developers cannot
> find time for auditing which work items does this flush_scheduled_work()
> need to wait.
>
> Therefore, for now let's start with blind/mechanical conversion within
> the whole drivers/gpu/drm/i915/ directory, based on an assumption that
> i915 does not need to wait for work items outside of this directory.

I'll note also here that I've just pushed Luca's series [1] to switch
i915 to internal device specific workqueues, for the same effect as this
one.


Thanks,
Jani.


[1] https://patchwork.freedesktop.org/series/118947/


-- 
Jani Nikula, Intel Open Source Graphics Center
