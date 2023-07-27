Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DCA76584D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 18:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA0410E5BC;
	Thu, 27 Jul 2023 16:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823B810E5BA;
 Thu, 27 Jul 2023 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EQJuMAJSGL6ttEyLaOeJWDVPtC4nPLTazz3w/7T8YEs=; b=iZehVCeZ/aZdcCVwzxFikSCFG2
 BcyLCLf+Laa1fVdpy4XV/VOvaoENHb9CChj/q9Nbi+q/QYgolctVy9YrQTzdMK6sojLZrCxtnne+M
 kLLiOnVxckYo2U4KrTm/b57/++cHeaWWWEvO2zHkZRbMtEszjsJWb/a/JAUXA6IbIwH+351cbnkbg
 L/5f3uTSd09dZaI8/GUGcXz075KfcLYaeFbHxxfcyVZZlF65Qkaw3jPOwr/TucEFgd1zvUSbt+EFL
 tTPUvxSiFtTqJBvmZziCuogNelVApPFCxDFbOJe8m25U13n4nPRj4Tu3FRF0/TE87Z7x6r1CrYNDF
 SQkGv7tQ==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qP3XI-004ilg-WB; Thu, 27 Jul 2023 18:08:21 +0200
Message-ID: <2b3d9647-b1db-cbb6-2421-b12ec3482eae@igalia.com>
Date: Thu, 27 Jul 2023 13:08:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 tvrtko.ursulin@linux.intel.com, emma@anholt.net, mwen@igalia.com
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: trix@redhat.com, intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev,
 ndesaulniers@google.com, patches@lists.linux.dev,
 dri-devel@lists.freedesktop.org, justinstitt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/18/23 18:44, Nathan Chancellor wrote:
> Hi all,
> 
> A proposed update to clang's -Wconstant-logical-operand [1] to warn when
> the left hand side is a constant as well now triggers with the modulo
> expression in nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a
> multiple of HZ, such as CONFIG_HZ=300:
> 
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      189 |         if (NSEC_PER_SEC % HZ &&
>          |             ~~~~~~~~~~~~~~~~~ ^
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: use '&' for a bitwise operation
>      189 |         if (NSEC_PER_SEC % HZ &&
>          |                               ^~
>          |                               &
>    drivers/gpu/drm/i915/gem/i915_gem_wait.c:189:24: note: remove constant to silence this warning
>    1 warning generated.
> 
>    In file included from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
>      343 |         if (NSEC_PER_SEC % HZ &&
>          |             ~~~~~~~~~~~~~~~~~ ^
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: use '&' for a bitwise operation
>      343 |         if (NSEC_PER_SEC % HZ &&
>          |                               ^~
>          |                               &
>    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: remove constant to silence this warning
>    1 warning generated.
> 
> These patches add an explicit comparison to zero to make the
> expression a boolean, which clears up the warning.
> 
> The patches have no real dependency on each other but I felt like they
> made send together since it is the same code.
> 
> If these could go into mainline sooner rather than later to avoid
> breaking builds that can hit this with CONFIG_WERROR, that would be
> nice, but I won't insist since I don't think our own CI has builds that
> has those conditions, but others might.
> 
> ---
> Nathan Chancellor (2):
>        drm/v3d: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()
>        drm/i915: Avoid -Wconstant-logical-operand in nsecs_to_jiffies_timeout()

Applied both patches to drm-misc/drm-misc-next!

Best Regards,
- Maíra

> 
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 2 +-
>   drivers/gpu/drm/v3d/v3d_drv.h            | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> ---
> base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
> change-id: 20230718-nsecs_to_jiffies_timeout-constant-logical-operand-4a944690f3e9
> 
> Best regards,
