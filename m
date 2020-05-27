Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6648A1E477C
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:31:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532A86E32A;
	Wed, 27 May 2020 15:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFAB06E32E;
 Wed, 27 May 2020 15:31:32 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3CA63208E4;
 Wed, 27 May 2020 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590593492;
 bh=FYlTjZDDWzv75K1cm++7jCZ9U5TmYAzARky7QAXahI0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jXXSlSss9GQcJwOVQ18QpEkpPQ0UHggQ0gnw7GFrNNzCuPWE5+rTO8d+c6uVeB6Cs
 78bnb0WIkRzmYIS3AQo7EY1dOw9IStfAv5KBXtOZEmWdm4DU6tsewCwDtPxhwIJtUo
 seapiYMExTH/ZC9Us+4q6KTSv6ZC6Zm+15xcQP3E=
Date: Wed, 27 May 2020 17:31:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ashwin H <ashwinh@vmware.com>
Subject: Re: [PATCH v4.19.x] make 'user_access_begin()' do 'access_ok()'
Message-ID: <20200527153130.GA525531@kroah.com>
References: <d29f87f3f3abb4e496866253bd170faad976f687.1589305630.git.ashwinh@vmware.com>
 <20200513055548.GA743118@kroah.com>
 <89DE19F6-4CB0-4324-A630-C8574C8D591C@vmware.com>
 <20200513063455.GA752913@kroah.com>
 <MN2PR05MB63814CDAAF6828285929736ACDBF0@MN2PR05MB6381.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR05MB63814CDAAF6828285929736ACDBF0@MN2PR05MB6381.namprd05.prod.outlook.com>
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Steven Rostedt <srostedt@vmware.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "stable@kernel.org" <stable@kernel.org>, Srivatsa Bhat <srivatsab@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 13, 2020 at 05:08:19PM +0000, Ashwin H wrote:
> > Ok, but what does that mean for us?
> > 
> > You need to say why you are sending a patch, otherwise we will guess wrong.
> 
> In drivers/gpu/drm/i915/i915_gem_execbuffer.c, ioctl functions does user_access_begin() without doing access_ok(Checks if a user space pointer is valid)  first.
> A local attacker can craft a malicious ioctl function call to overwrite arbitrary kernel memory, resulting in a Denial of Service or privilege escalation (CVE-2018-20669)
> 
> This patch makes sure that user_access_begin always does access_ok. 
> user_access_begin has been modified to do access_ok internally.

I had this in the tree, but it broke the build on alpha, sh, and maybe a
few others :(

See:
	https://lore.kernel.org/r/20200527140225.GA214763@roeck-us.net
for the details.

Can you dig out all of the needed follow-on patches as well, and send
them all as a patch series for 4.19.y so that I can queue them all up at
once?

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
