Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07EB4FCD74
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 06:07:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0A10FB8B;
	Tue, 12 Apr 2022 04:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8B0410FB8B
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 04:07:33 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id 682E7205657E; Mon, 11 Apr 2022 21:07:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 682E7205657E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649736453;
 bh=Ttzy8BQ9PlMSUQQk7cuuFBxQLGJvmjKf1avgoHfG0Jo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OUgRs7uht0+gzG3Y7HoAoh1/dD5KFCf8VL8+wClpj57ksmFdvagPUCaH2LgiHXSEg
 4OAk2AE3kR8dZ/iCBaEqZWDlCYAalakHpuFMMddeQZ1gFMSF4glhkbqZQ9XACk79hg
 KMenDvoISCAWLu+imtKZNc+DoZrHWZ1zYq/Bputw=
Date: Mon, 11 Apr 2022 21:07:33 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Message-ID: <20220412040733.GA6074@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1649650437-17977-1-git-send-email-ssengar@linux.microsoft.com>
 <BYAPR21MB1270B3CFBE674EB0A7537180BFEA9@BYAPR21MB1270.namprd21.prod.outlook.com>
 <20220411075555.GA15355@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
 <DM6PR21MB1275F532C58CF5CE7F67D7E8BFEA9@DM6PR21MB1275.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR21MB1275F532C58CF5CE7F67D7E8BFEA9@DM6PR21MB1275.namprd21.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Michael Kelley \(LINUX\)" <mikelley@microsoft.com>,
 "drawat.floss@gmail.com" <drawat.floss@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 07:02:19PM +0000, Dexuan Cui wrote:
> > From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
> > Sent: Monday, April 11, 2022 12:56 AM
> > > >...
> > > > -	if (fb->pitches[0] * fb->height > hv->fb_size)
> > > > +	if (fb->pitches[0] * fb->height > hv->fb_size) {
> > > > +		drm_err(&hv->dev, "hv->hdev, fb size requested by process %s
> > > > for %d X %d (pitch %d) is greater than allocated size %ld\n",
> > > Should we use drm_err_ratelimited() instead of drm_err()?
> > 
> > The error is not produced in good cases, for every resolution change which is
> > violating this error should print once.
> 
> Thanks for the clarification! Then drm_err() looks good to me.
> 
> > I suggest having it print every time some application tries to violate the policy
> > set at boot time.
> > If we use ratelimit many resolutions error change will be suppressed. Please let
> > me know your thoughts.
>  
> > >
> > > The line exceeds 80 chars.
> > 
> > At first I tried braking the line to respect 80 character boundary, but
> > checkpatch.pl reported it as a problem.
> > And these new lines are suggested by checkpatch.pl itself.
> > Looks the recent rule realted to 80 charachters are changed. Ref :
> > ...
> 
> Good to know! Thanks for sharing the link!
> 
> FYI, the default max_line_length in scripts/checkpatch.pl is 100 now:
>  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f
> 
> "80-chars" is still preferred, but isn't a hard limit. I also noticed
> "never break user-visible strings such as printk messages ", so yes you're 
> correct. It's perfectly fine to have a not-too-long string that exceeds 80 chars.
> 

Good information ! thank you for digging this.

> > > > +		current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
> > > >  		return -EINVAL;
> > > > +	}
> > >
> > > Maybe we can use the below:
> > > 	drm_err_ratelimited(&hv->dev, "%s: requested %dX%d (pitch %d) "
> > >                      "exceeds fb_size %ld\n",
> > >                      current->comm, fb->width, fb->height,
> > >                      fb->pitches[0], hv->fb_size);
> > >
> > > Note: the first chars of last 3 lines should align with the "&" in the
> > > same column. Please run "scripts/checkpatch.pl" against the patch.
> > 
> > I have tested checkpatch.pl before sending, for the current patch there is no
> > problem from checkpatch.pl
> 
> The line is 138-char long, which seems a little longer to me :-)
> IMO we can make it shorter, e.g. be removing the part "hv->hdev as the
> "drm_err(&hv->dev," already tells us which device it's.

Ok, will make it shorter.

> 
> BTW, if we run the script with --strict, it reports the below:
> 
> # scripts/checkpatch.pl --strict 0001-drm-hyperv-Added-error-message-for-fb-size-greater-t.patch
> CHECK: Alignment should match open parenthesis
> #28: FILE: drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:
> +               drm_err(&hv->dev, "hv->hdev, fb size requested by process %s for %d X %d (pitch %d) is greater than allocated size %ld\n",
> +               current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
Sure, will fix this.
