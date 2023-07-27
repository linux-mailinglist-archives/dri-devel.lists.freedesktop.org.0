Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB20276561B
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B4810E584;
	Thu, 27 Jul 2023 14:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A9510E584;
 Thu, 27 Jul 2023 14:41:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 454DC61E95;
 Thu, 27 Jul 2023 14:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA913C433C7;
 Thu, 27 Jul 2023 14:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690468880;
 bh=aBSoh8vyUSFQygN17NIxATijctvrIz3m9z5UE5Aolwo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QX60Xks3nyqfTY+hUSinT9rcvhFuieEG/0UfencjdPpD4YKKjXei+ZMoZ7X5vexlq
 QUsQ6SKYp1DQzt995n3aBoXP5+NrYSFR3ez4hqljwWBrrP+M6SLOiLVKiDlOEfAxf3
 6spGwnGhd1+smh/wELppsZjf9dvHHbqKWuW1NDyNLrSXBvkDdA659TUUCSTfgjj6WA
 VReFZElAZWaGsSpRjSIjsT7OULttKhZkxnmo40rpztTXI9O/LWGrrccA6xtcSku+mo
 hF4V21aQW7KBK/58pgIMHcYZUIgYuK2SDjlWcf2ZFQGzvrS8tmQ9rK4N1Lf9nRYY3f
 DKFSWHsKo2e7g==
Date: Thu, 27 Jul 2023 07:41:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Maira Canal <mcanal@igalia.com>
Subject: Re: [PATCH 1/2] drm/v3d: Avoid -Wconstant-logical-operand in
 nsecs_to_jiffies_timeout()
Message-ID: <20230727144118.GA2013261@dev-arch.thelio-3990X>
References: <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-0-36ed8fc8faea@kernel.org>
 <20230718-nsecs_to_jiffies_timeout-constant-logical-operand-v1-1-36ed8fc8faea@kernel.org>
 <daaf05b5-3b18-c365-62e8-e7848c403ab7@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daaf05b5-3b18-c365-62e8-e7848c403ab7@igalia.com>
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
Cc: justinstitt@google.com, tvrtko.ursulin@linux.intel.com,
 llvm@lists.linux.dev, emma@anholt.net, trix@redhat.com,
 intel-gfx@lists.freedesktop.org, ndesaulniers@google.com,
 patches@lists.linux.dev, mwen@igalia.com, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maira,

On Thu, Jul 27, 2023 at 11:01:27AM -0300, Maira Canal wrote:
> Hi Nathan,
> 
> On 7/18/23 18:44, Nathan Chancellor wrote:
> > A proposed update to clang's -Wconstant-logical-operand to warn when the
> > left hand side is a constant shows the following instance in
> > nsecs_to_jiffies_timeout() when NSEC_PER_SEC is not a multiple of HZ,
> > such as CONFIG_HZ=300:
> > 
> >    In file included from drivers/gpu/drm/v3d/v3d_debugfs.c:12:
> >    drivers/gpu/drm/v3d/v3d_drv.h:343:24: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
> >      343 |         if (NSEC_PER_SEC % HZ &&
> >          |             ~~~~~~~~~~~~~~~~~ ^
> >    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: use '&' for a bitwise operation
> >      343 |         if (NSEC_PER_SEC % HZ &&
> >          |                               ^~
> >          |                               &
> >    drivers/gpu/drm/v3d/v3d_drv.h:343:24: note: remove constant to silence this warning
> >    1 warning generated.
> > 
> > Turn this into an explicit comparison against zero to make the
> > expression a boolean to make it clear this should be a logical check,
> > not a bitwise one.
> > 
> > Link: https://reviews.llvm.org/D142609
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> 
> Thanks for all the hard work with clang! Let me know if you need someone
> to push it to drm-misc-next.

Yes I will, I do not have drm commit rights. I think the i915 patch can
go to drm-misc as well with Tvrtko's ack. Thanks a lot for taking a
look!

Cheers,
Nathan

> Best Regards,
> - Maíra
> 
> > ---
> >   drivers/gpu/drm/v3d/v3d_drv.h | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
> > index b74b1351bfc8..7f664a4b2a75 100644
> > --- a/drivers/gpu/drm/v3d/v3d_drv.h
> > +++ b/drivers/gpu/drm/v3d/v3d_drv.h
> > @@ -340,7 +340,7 @@ struct v3d_submit_ext {
> >   static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
> >   {
> >   	/* nsecs_to_jiffies64() does not guard against overflow */
> > -	if (NSEC_PER_SEC % HZ &&
> > +	if ((NSEC_PER_SEC % HZ) != 0 &&
> >   	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
> >   		return MAX_JIFFY_OFFSET;
> > 
