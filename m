Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74472305F00
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 16:02:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F414B6E0B9;
	Wed, 27 Jan 2021 15:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B4426E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 15:02:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6EFE6207D0;
 Wed, 27 Jan 2021 15:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611759758;
 bh=a6xIqEAeZUgI/gWd9D7ZmCNMvsD1qRiSI3ez+rb5KZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=choT2OBuWlOG8kg05sEL8BUB29DZt19Nnaa4X8KY+sYFpz0tJ9bLHBh75H5vRMj4t
 PTX45RhDBDU/tS+F5IKP8GYt4lpyu0zo5/akga73hKAy8VgP9KyyFDm4dhSmsvZAdR
 i2woKDQKkpc9YbekJzh8aNTdmXz9JNTnpeFU2AUg=
Date: Wed, 27 Jan 2021 16:02:35 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v10] staging: fbtft: add tearing signal detect
Message-ID: <YBGAi+14PlXIdvxF@kroah.com>
References: <1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com>
 <YBFv+12xfsoxacDb@kroah.com> <20210127220809.000026fb@gmail.com>
 <YBF08Xf7qaZx3YZ1@kroah.com> <20210127221708.00002568@gmail.com>
 <YBF30EEUkhEMY5ti@kroah.com> <20210127144946.GF2696@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210127144946.GF2696@kadam>
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 mh12gx2825@gmail.com, oliver.graute@kococonnector.com,
 Andy Whitcroft <apw@canonical.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sbrivio@redhat.com,
 carlis <zhangxuezhi3@gmail.com>, Joe Perches <joe@perches.com>,
 colin.king@canonical.com, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 27, 2021 at 05:49:46PM +0300, Dan Carpenter wrote:
> On Wed, Jan 27, 2021 at 03:25:20PM +0100, Greg KH wrote:
> > On Wed, Jan 27, 2021 at 10:17:08PM +0800, carlis wrote:
> > > On Wed, 27 Jan 2021 15:13:05 +0100
> > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > 
> > > > On Wed, Jan 27, 2021 at 10:08:09PM +0800, carlis wrote:
> > > > > On Wed, 27 Jan 2021 14:51:55 +0100
> > > > > Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > >   
> > > > > > On Wed, Jan 27, 2021 at 09:42:52PM +0800, Carlis wrote:  
> > > > > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > > > > > > 
> > > > > > > For st7789v ic,when we need continuous full screen refresh, it
> > > > > > > is best to wait for the TE signal arrive to avoid screen tearing
> > > > > > > 
> > > > > > > Signed-off-by: zhangxuezhi <zhangxuezhi1@yulong.com>    
> > > > > > 
> > > > > > Please slow down and wait at least a day between patch
> > > > > > submissions, there is no rush here.
> > > > > > 
> > > > > > And also, ALWAYS run scripts/checkpatch.pl on your submissions, so
> > > > > > that you don't have a maintainer asking you about basic problems,
> > > > > > like are in this current patch :(
> > > > > > 
> > > > > > thanks,
> > > > > > 
> > > > > > greg k-h  
> > > > > 
> > > > > hi,
> > > > >   This is my first patch contribution to Linux, so some of the rules
> > > > > are not very clear .In addition, I can confirm that before sending
> > > > > patch, I check it with checkPatch.py every time.Thank you very much
> > > > > for your help  
> > > > 
> > > > Please read Documentation/SubmittingPatches which has a link to the
> > > > checklist and other documentation you should read.
> > > > 
> > > > And I doubt you are running checkpatch on your submission, as there is
> > > > obvious coding style issues in it.  If so, please provide the output
> > > > as it must be broken :(
> > > > 
> > > > thanks,
> > > > 
> > > > greg k-h
> > > hi, the patch v11 checkpatch.pl output is below:
> > > 
> > > carlis@bf-rmsz-10:~/work/linux-kernel/linux$ ./scripts/checkpatch.pl
> > > 0001-staging-fbtft-add-tearing-signal-detect.patch total: 0 errors, 0
> > > warnings, 0 checks, 176 lines checked
> > > 
> > > 0001-staging-fbtft-add-tearing-signal-detect.patch has no obvious style
> > > problems and is ready for submission.
> > 
> > Wow, my apologies!
> > 
> > Andy and Joe, there's something wrong here that is missing the fact that
> > a line is being indented with spaces and not tabs in the patch
> > at https://lore.kernel.org/r/1611754972-151016-1-git-send-email-zhangxuezhi3@gmail.com
> > 
> > Any ideas what broke?
> > 
> 
>     /*Tearing Effect Line On*/
> 
> Comments are the exception to the "no spaces at the start of a line"
> rule.  I was expecting that the kbuild-bot would send a Smatch warning
> for inconsistent indenting, but comments are not counted there either.
> 
> I'm sort of surprised that we don't have checkpatch rule about the
> missing space characters.  It should be: "/* Tearing Effect Line On */".

That was going to be my next question, lots of comments added in this
patch don't have spaces...

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
