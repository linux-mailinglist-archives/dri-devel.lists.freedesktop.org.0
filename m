Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34881D06E2
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 08:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 262FC6E0A6;
	Wed, 13 May 2020 06:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1AE6E0A6;
 Wed, 13 May 2020 06:06:58 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BCE1820718;
 Wed, 13 May 2020 06:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589350015;
 bh=6qZpYcXUD5MiwOqEO1ZY0mCSOUXAEishXLv58UbUkb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PlsesW/IxxtIRgOd2lQP0dqWv9yKqYmK7I0Pdb0PncShDHGqXe38IMwt5hHuJ+kOf
 dIxqCKtzwJuew0r94G4irCnmejKg94wHhnPbr+UD0EdFji1E6dp9EyMJNp0YL2HMWW
 Y2dzCbQdg/J8zQuX2IzJRvUBD4JBDdopZsCztJog=
Date: Wed, 13 May 2020 07:55:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ashwin-h <ashwinh@vmware.com>
Subject: Re: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Message-ID: <20200513055548.GA743118@kroah.com>
References: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
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
Cc: intel-gfx@lists.freedesktop.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 srivatsa@csail.mit.edu, rostedt@goodmis.org, srostedt@vmware.com,
 Linus Torvalds <torvalds@linux-foundation.org>, stable@kernel.org,
 srivatsab@vmware.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 07:19:21AM +0530, ashwin-h wrote:
> From: Linus Torvalds <torvalds@linux-foundation.org>
> 
> commit 594cc251fdd0d231d342d88b2fdff4bc42fb0690 upstream.
> 
> Originally, the rule used to be that you'd have to do access_ok()
> separately, and then user_access_begin() before actually doing the
> direct (optimized) user access.
> 
> But experience has shown that people then decide not to do access_ok()
> at all, and instead rely on it being implied by other operations or
> similar.  Which makes it very hard to verify that the access has
> actually been range-checked.
> 
> If you use the unsafe direct user accesses, hardware features (either
> SMAP - Supervisor Mode Access Protection - on x86, or PAN - Privileged
> Access Never - on ARM) do force you to use user_access_begin().  But
> nothing really forces the range check.
> 
> By putting the range check into user_access_begin(), we actually force
> people to do the right thing (tm), and the range check vill be visible
> near the actual accesses.  We have way too long a history of people
> trying to avoid them.
> 
> Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Ashwin H <ashwinh@vmware.com>
> ---
>  arch/x86/include/asm/uaccess.h             | 11 ++++++++++-
>  drivers/gpu/drm/i915/i915_gem_execbuffer.c | 15 +++++++++++++--
>  include/linux/uaccess.h                    |  2 +-
>  kernel/compat.c                            |  6 ++----
>  kernel/exit.c                              |  6 ++----
>  lib/strncpy_from_user.c                    |  9 +++++----
>  lib/strnlen_user.c                         |  9 +++++----
>  7 files changed, 38 insertions(+), 20 deletions(-)

Are you wanting this merged to a specific stable kernel tree?  If so, why?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
