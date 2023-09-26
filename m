Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5547AEE77
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 16:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D2D10E096;
	Tue, 26 Sep 2023 14:33:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF01410E096;
 Tue, 26 Sep 2023 14:33:16 +0000 (UTC)
Received: from [192.168.68.123] (unknown [177.98.21.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 08BBC660731A;
 Tue, 26 Sep 2023 15:33:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695738795;
 bh=kju2gE2DGmPfyTnJ7SZakfjZawtSff3X+7D4Qw+lORM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=UjjsOj3W+I95MoF5Xy/PStAzqH89uM4NvZ8CsDWpWS6NOes3aH2/uKodQsO1cAI7x
 nmTxqPXgVAoGlAiaztBxVk6XZ93qq5cspNBACcn6m4FU56aCh7GTxjO7X26xri371b
 Hau2XlrJQyqm7IWltqvDuSFAPUncgUebYCZr5TcQKHYcyXuraXfZf3Kv9/bGzPd5hS
 L4MbW+cMRo+b11fqQ+oF91pWkQI4fuNPNlsDM6/FSv9QUCLW6O4imROo6HMNOeF4O2
 zUxa2fZBSok5UnrGcuzFQGKigUpltmBdglwpBQ1WHi0+tlXzvmh6oL2roLRecJfy4h
 O6aI4ykCnTb6w==
Message-ID: <f9423f48-71cc-ae51-ac58-853e60533851@collabora.com>
Date: Tue, 26 Sep 2023 11:33:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RESEND PATCH v2 0/2] drm: Refactor plane size calculation by
 core helper functions
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230926141519.9315-1-gcarlos@disroot.org>
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20230926141519.9315-1-gcarlos@disroot.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Tales Aparecida <tales.aparecida@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Maira Canal <mairacanal@riseup.net>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 26/09/2023 11:15, Carlos Eduardo Gallo Filho wrote:
> There's duplicated functions on drm that do the same job of calculating
> the size of planes from a drm_format_info and the size of its first
> plane. So this patchset throw away the more specific version intended
> to be used from a given framebuffer and make the generic version way
> more portable against the drivers.
> 
> Thanks,
> Carlos

Hey, thanks for your patch.

Do you mind testing on drm/ci and sending here the link of the pipeline 
with the test? It would be awesome to get your feedback on the CI

See instructions on Documentation/gpu/automated_testing.rst

In short you just need an account on gitlab.freedesktop.org, access
https://gitlab.freedesktop.org/janedoe/linux/-/settings/ci_cd), change 
the CI/CD configuration file from .gitlab-ci.yml to 
drivers/gpu/drm/ci/gitlab-ci.yml, now you can execute tests going to 
pipelines (the first one you need to create a new pipeline by hand).

Let me know if you have any questions, I'm koike on irc.

Thanks
Helen

> 
> ---
> v2:
>    - New patch "[PATCH v2 1/2] drm: Remove plane hsub/vsub alignment requirement
>      for core helpers".
> 
> Carlos Eduardo Gallo Filho (2):
>    drm: Remove plane hsub/vsub alignment requirement for core helpers
>    drm: Replace drm_framebuffer plane size functions with its equivalents
> 
>   drivers/gpu/drm/drm_framebuffer.c       | 64 ++-----------------------
>   drivers/gpu/drm/i915/display/intel_fb.c |  2 +-
>   include/drm/drm_fourcc.h                |  5 +-
>   include/drm/drm_framebuffer.h           |  5 --
>   4 files changed, 8 insertions(+), 68 deletions(-)
> 
