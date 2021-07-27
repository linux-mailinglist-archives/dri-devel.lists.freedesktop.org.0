Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B03D6E2F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 07:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F4F6FBC7;
	Tue, 27 Jul 2021 05:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A6196FBC7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 05:35:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 553D0610E5;
 Tue, 27 Jul 2021 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1627364130;
 bh=QZn3Y/5lDoT1CB5x1bzBxI7iva5uev1ci/Z3NrJyvcQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ccFT+eHKP9bc15BaEMLa0POjMZRlzJJ/bNL6ZlM0iKkYA2E8+J4RecniBbiKJMcJt
 yO6L9yEahBpHTQyKj3ulr5lRfoWTq528otNILO+BEik6p5573scCcYY5hsxQFPtkiv
 EKEJighbKoKHmGImych7iaIwt8bDWRy17Hv1rsf8=
Date: Tue, 27 Jul 2021 07:35:28 +0200
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: =?utf-8?B?dGNzX2tlcm5lbCjohb7orq/kupHlhoXmoLjlvIDlj5HogIUp?=
 <tcs_kernel@tencent.com>
Subject: Re: [Internet]Re: [PATCH] fbcon: Out-Of-Bounds write in
 sys_imageblit, add range check
Message-ID: <YP+bINav7znIU6xF@kroah.com>
References: <D5DF8A1C-5FA2-426B-AAB4-3199AEA0A02E@tencent.com>
 <YP68cQ4WVVusCv0N@ravnborg.org>
 <28F2D8E8-B519-40F6-B6CD-98A0FAD67CD7@tencent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28F2D8E8-B519-40F6-B6CD-98A0FAD67CD7@tencent.com>
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
Cc: "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "ducheng2@gmail.com" <ducheng2@gmail.com>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@i-love.sakura.ne.jp>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "george.kennedy@oracle.com" <george.kennedy@oracle.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 "yepeilin.cs@gmail.com" <yepeilin.cs@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 01:53:13AM +0000, tcs_kernel(腾讯云内核开发者) wrote:
> yres and vyres can be controlled by user mode paramaters, and cause p->vrows to become a negative value. While this value be passed to real_y function, the ypos will be out of screen range.
> This is an out-of-bounds write bug.
> I think updatescrollmode is the right place to validate values supplied by a user ioctl, because only here makes --operation,and 0 is a legal value before that.

Please wrap your changelog text.

> 
> Signed-off-by: Tencent Cloud System tcs_kernel@tencent.com

That is not the name of a person :(

And the format isn't correct, so there's nothing we can do with this
patch, and the patch itself is corrupted and could not be applied :(

Also, what about checking these values earlier?  How can the value be 0
earlier and be acceptable?  Putting bounds on the user-provided values
would be much easier, right?

thanks,

greg k-h
