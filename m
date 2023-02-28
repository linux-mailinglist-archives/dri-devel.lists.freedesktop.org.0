Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD16A5AC5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 15:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2781F10E202;
	Tue, 28 Feb 2023 14:25:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4116910E202;
 Tue, 28 Feb 2023 14:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677594304; x=1709130304;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CxNiYh3BEfjz8TAgFtXCW4B1/QLNkOmWocrX0EwdQnI=;
 b=RcgFfOKL4BCcyz04QO2h5cCgIkhSJmSmWs0RP3kme5QsXASQiuw31Ctx
 AnXXbdM8xobhEP+ZSHgRYOHX2samyi6OZVT1vkxBYYxzqkNDhBUwsvlmW
 gWPfVUQ7pi3JWd2OxW2d2sJwdwS4jehRQNYePOxOd9Q/VpPyszoLRN54U
 v8ynLL5F4aJRuOkPyydh/a4DLQz/bkFGB6MOEYjPTOZjvQMqq32Mq5Ni5
 5z8p9jAAEKf2vUzQDu614Xn7qZ+vgCsFGJ/fQVMuc/4R3b8JY8xS1wDtl
 EDny2yg3JmsPBVuky85H1Wge1l+clfJUAd8DzhtYdLIvMCa7EOCWumq03 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="313815681"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="313815681"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 06:24:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10635"; a="783848923"
X-IronPort-AV: E=Sophos;i="5.98,222,1673942400"; d="scan'208";a="783848923"
Received: from gsavorni-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.249.41.82])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2023 06:24:53 -0800
Date: Tue, 28 Feb 2023 15:24:44 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] drm/shmem-helper: Fix compile error
Message-ID: <Y/4OrBltJz1J0qxe@ashyti-mobl2.lan>
References: <20230228125054.1952657-1-andi.shyti@linux.intel.com>
 <71dee5cf-3c12-8d5f-5d2a-be0a39647d8c@collabora.com>
 <Y/4AMJ/+3BhTa+FF@ashyti-mobl2.lan> <87bkldzxv1.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bkldzxv1.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Asahi Lina <lina@asahilina.net>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

> >> > Commit 67b7836d4458 ("drm/shmem-helper: Switch to reservation
> >> > lock") removes the drm_gem_shmem_get_pages_locked() and
> >> > drm_gem_shmem_put_pages_locked().
> >> > 
> >> > But then commit ddddedaa0db9 ("drm/shmem-helper: Fix locking for
> >> > drm_gem_shmem_get_pages_sgt()") reintroduces it.
> >> > 
> >> > Somehow these two commits got mixed up and produce the following
> >> > compile error:
> >> 
> >> The 67b7836d4458 goes after ddddedaa0db9 in misc-next. It was a bad
> >> merge conflict resolution in drm-tip that was fixed yesterday, there is
> >> no problem in misc-next. Where do you see this error?
> >
> > yes, indeed! I was indeed surprised to see this mismatch.
> >
> > I see it in the Intel's drm-tip branch[*]
> 
> To set the record straight, drm-tip isn't Intel's, it's an integration
> branch shared by the drm community.

yes of course... it's a matter of fast writing :)

> Looks like the same bad merge resolution has resurrected itself somehow,
> maybe Thomas'
> 
> commit 418ce969b4c8533c7c76cc0b7adeb432ccdc137e
> Author: Thomas Zimmermann <tzimmermann@suse.de>
> Date:   Tue Feb 28 10:03:24 2023 +0100
> 
>     2023y-02m-28d-09h-02m-44s UTC: drm-tip rerere cache update
>     
>     git version 2.39.2
> 
> in drm-rerere brought it back.
> 
> And the build is indeed currently broken.
> 
> Moreover, when the build was fine for a while, apparently the changes in
> shmem broke a bunch of machines in Intel CI. And due to this, we aren't
> getting any CI results for incoming patches right now.

Is there any plans for fixing it?

Andi
