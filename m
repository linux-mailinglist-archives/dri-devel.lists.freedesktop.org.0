Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9DA36C44
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 07:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F1910E031;
	Sat, 15 Feb 2025 06:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N93v0u5H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E3D10E031
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 06:00:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 171F85C271C;
 Sat, 15 Feb 2025 05:59:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15B1C4CEDF;
 Sat, 15 Feb 2025 06:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739599232;
 bh=983y9FjFDbY+7fyxmKkbqhfjwND3j2gQYU8auIlMhEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N93v0u5HqnCPdfmoV8BiN2Qvozrh0ZNnaZouSqHAQsD7wdckojdfNG/xcMrEaDO5Y
 9o/dOi9FF8GB06tQW9lwJ0kavc4QepI/fcLOdBxWui2npiS1Tzo3K0OzKlGmS8+4Ti
 Vqagvs7UNfvSKYTDfinlB8gN+9+4Zp1InyJDt++A=
Date: Sat, 15 Feb 2025 06:59:26 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Elizabeth Figura <zfigura@codeweavers.com>
Cc: Mike Lothian <mike@fireburn.co.uk>, dri-devel@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linux-api@vger.kernel.org, wine-devel@winehq.org,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Wolfram Sang <wsa@kernel.org>, Arkadiusz Hiler <ahiler@codeweavers.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>
Subject: Re: [PATCH] ntsync: Set the permissions to be 0666
Message-ID: <2025021505-sultry-encrypt-a4c8@gregkh>
References: <20250214122759.2629-2-mike@fireburn.co.uk>
 <2025021456-easiness-facebook-636e@gregkh>
 <1911589.tdWV9SEqCh@camazotz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1911589.tdWV9SEqCh@camazotz>
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

On Fri, Feb 14, 2025 at 12:13:03PM -0600, Elizabeth Figura wrote:
> On Friday, 14 February 2025 07:06:20 CST Greg Kroah-Hartman wrote:
> > On Fri, Feb 14, 2025 at 12:28:00PM +0000, Mike Lothian wrote:
> > > This allows ntsync to be usuable by non-root processes out of the box
> > 
> > Are you sure you need/want that?  If so, why?  How did existing testing
> > not ever catch this?
> 
> Hi, sorry, this is of course my fault.
> 
> We do need /dev/ntsync to be openable from user space for it to be useful. I'm not sure what the most "correct" permissions are to have in this case (when we don't specifically need read or write), but I don't think I see a reason not to just set to 666 or 444.
> 
> I originally assumed that the right way to do this was not to set the mode on the kernel file but rather through udev; I believe I was using the code for /dev/loop-control or /dev/fuse as an example, which both do that. So I (and others who tested) had just manually set up udev rules for this, with the eventual intent of adding a default rule to systemd like the others. I only recently realized that doing something like this patch is possible and precedented.
> 
> I don't know what the best way to address this is, but this is certainly the simplest.
> 
> 

Ok, makes sense, can you give an acked-by or reviewed-by and I'll be
glad to queue it up and get it merged.

thanks,

greg k-h
