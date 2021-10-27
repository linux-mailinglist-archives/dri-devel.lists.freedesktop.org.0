Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B311743C955
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A26F96E5BE;
	Wed, 27 Oct 2021 12:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD7D6E5BE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:13:38 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10149"; a="230093103"
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="230093103"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 05:13:38 -0700
X-IronPort-AV: E=Sophos;i="5.87,186,1631602800"; d="scan'208";a="497841528"
Received: from smaharan-mobl.gar.corp.intel.com (HELO localhost)
 ([10.251.214.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2021 05:13:33 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>, Alex
 Deucher <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] [RESEND] drm: fb_helper: fix CONFIG_FB dependency
In-Reply-To: <878ryeit9i.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210927142816.2069269-1-arnd@kernel.org>
 <202109270923.97AFDE89DB@keescook> <YVXJLE8UqgcUNIKl@phenom.ffwll.local>
 <878ryeit9i.fsf@intel.com>
Date: Wed, 27 Oct 2021 15:13:29 +0300
Message-ID: <8735omis2e.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 27 Oct 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Thu, 30 Sep 2021, Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Mon, Sep 27, 2021 at 09:23:45AM -0700, Kees Cook wrote:
>>> On Mon, Sep 27, 2021 at 04:28:02PM +0200, Arnd Bergmann wrote:
>>> > From: Arnd Bergmann <arnd@arndb.de>
>>> > 
>>> > With CONFIG_FB=m and CONFIG_DRM=y, we get a link error in the fb helper:
>>> > 
>>> > aarch64-linux-ld: drivers/gpu/drm/drm_fb_helper.o: in function `drm_fb_helper_alloc_fbi':
>>> > (.text+0x10cc): undefined reference to `framebuffer_alloc'
>>> > 
>>> > Tighten the dependency so it is only allowed in the case that DRM can
>>> > link against FB.
>>> > 
>>> > Fixes: f611b1e7624c ("drm: Avoid circular dependencies for CONFIG_FB")
>>> > Link: https://lore.kernel.org/all/20210721152211.2706171-1-arnd@kernel.org/
>>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>> 
>>> Thanks for fixing this!
>>> 
>>> Reviewed-by: Kees Cook <keescook@chromium.org>
>>
>> Stuffed into drm-misc-next.
>
> The problem is, I don't think the patch is semantically correct.
>
> drm_fb_helper.o is not part of drm.ko, it's part of
> drm_kms_helper.ko. This adds some sort of indirect dependency via DRM
> which might work, maybe by coincidence, maybe not - but it's certainly
> not obvious.
>
> The likely culprit is, again, the overuse of select, and in this case
> select DRM_KMS_HELPER. And DRM_KMS_HELPER should depend on FB if
> DRM_FBDEV_EMULATION=y. That's the problem.

Almost all of the recurring Kconfig related dependency issues would go
away by following Documentation/kbuild/kconfig-language.rst:

  Note:
	select should be used with care. select will force
	a symbol to a value without visiting the dependencies.
	By abusing select you are able to select a symbol FOO even
	if FOO depends on BAR that is not set.
	In general use select only for non-visible symbols
	(no prompts anywhere) and for symbols with no dependencies.
	That will limit the usefulness but on the other hand avoid
	the illegal configurations all over.

If the kconfig parser had a lint mode to issue a warning for all of
those uses, and someone persistent enough followed through with fixing
them, we'd all be better off.

Oh, and maybe the menuconfig tools also need better ways to recursively
enable config options with dependencies, because one of the reasons
people like select is the convenience of just enabling a config option,
and it selects everything that's needed (albeit with the occasional
dependency issues). With dependencies, you need to start with the leaf
dependencies and work your way up to what you need, and it's not easy.


BR,
Jani.


>
> All of the drm Kconfigs could use an overhaul to be semantically
> correct, but that's a hill nobody wants to die on. Instead we keep
> piling up tweaks to paper over the issues, ad infinitum.
>
> (And this ties to a previous comment I had about the organization of
> files under drm/, a hundred files in one big lump that belong to
> different modules, and it's not helping people figure out the
> dependencies.)
>
>
> BR,
> Jani.
>
>
> PS. I was brought here via [1] which is another complicated "fix" to the
> same problem.
>
>
> [1] https://lore.kernel.org/r/20211027072044.4105113-1-javierm@redhat.com

-- 
Jani Nikula, Intel Open Source Graphics Center
