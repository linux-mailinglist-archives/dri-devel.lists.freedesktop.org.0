Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C054FB566
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 09:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBC7010F271;
	Mon, 11 Apr 2022 07:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7B36A10F271
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 07:55:56 +0000 (UTC)
Received: by linux.microsoft.com (Postfix, from userid 1127)
 id EF7EA205657E; Mon, 11 Apr 2022 00:55:55 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EF7EA205657E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1649663755;
 bh=2hqdJe2z5thDY+V/BIGSxpcl+9YoCnMAkDESTCF9xJQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gmBaCO43MEeaINcc6CWCMzgY6Zvh99f+2wobY/cTP0Z2sMzuBVznCAZDOddmQkzjp
 GoZgLolr4cwFzP82BmphuKjEsvSG5Vy/2JwLep3CXHr9WKDpUEiiAgukhv0wnBKc7F
 sTxi9iNizaNafkdNfYw4zMfiHrZMSuyxunKP5IMI=
Date: Mon, 11 Apr 2022 00:55:55 -0700
From: Saurabh Singh Sengar <ssengar@linux.microsoft.com>
To: Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH v3] drm/hyperv: Added error message for fb size greater
 than allocated
Message-ID: <20220411075555.GA15355@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <1649650437-17977-1-git-send-email-ssengar@linux.microsoft.com>
 <BYAPR21MB1270B3CFBE674EB0A7537180BFEA9@BYAPR21MB1270.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR21MB1270B3CFBE674EB0A7537180BFEA9@BYAPR21MB1270.namprd21.prod.outlook.com>
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

On Mon, Apr 11, 2022 at 06:40:38AM +0000, Dexuan Cui wrote:
> > Subject: [PATCH v3] drm/hyperv: Added error message for fb size greater than
> > allocated
> > 
> > Added error message when the size of requested framebuffer is more than
> > the allocated size by vmbus mmio region for framebuffer
> 
> "Added" --> "Add"? My impression is that we don't use past tense in the 

Ok.

> Subject and the commit message. See
> "git log drivers/gpu/drm/hyperv/hyperv_drm_modeset.c".
>  
> > --- a/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > +++ b/drivers/gpu/drm/hyperv/hyperv_drm_modeset.c
> > @@ -123,8 +123,11 @@ static int hyperv_pipe_check(struct
> > drm_simple_display_pipe *pipe,
> >  	if (fb->format->format != DRM_FORMAT_XRGB8888)
> >  		return -EINVAL;
> > 
> > -	if (fb->pitches[0] * fb->height > hv->fb_size)
> > +	if (fb->pitches[0] * fb->height > hv->fb_size) {
> > +		drm_err(&hv->dev, "hv->hdev, fb size requested by process %s
> > for %d X %d (pitch %d) is greater than allocated size %ld\n",
> Should we use drm_err_ratelimited() instead of drm_err()?

The error is not produced in good cases, for every resolution change which is violating this error should print once.
I suggest having it print every time some application tries to violate the policy set at boot time.
If we use ratelimit many resolutions error change will be suppressed. Please let me know your thoughts.


> 
> The line exceeds 80 chars.

At first I tried braking the line to respect 80 character boundary, but checkpatch.pl reported it as a problem.
And these new lines are suggested by checkpatch.pl itself.
Looks the recent rule realted to 80 charachters are changed. Ref : https://www.theregister.com/2020/06/01/linux_5_7/#:~:text=Linux%20kernel%20overlord%20Linus%20Torvalds,the%20topic%20of%20line%20lengths.

> 
> > +		current->comm, fb->width, fb->height, fb->pitches[0], hv->fb_size);
> >  		return -EINVAL;
> > +	}
> 
> Maybe we can use the below:
> 	drm_err_ratelimited(&hv->dev, "%s: requested %dX%d (pitch %d) "
>                      "exceeds fb_size %ld\n",
>                      current->comm, fb->width, fb->height,
>                      fb->pitches[0], hv->fb_size);
> 
> Note: the first chars of last 3 lines should align with the "&" in the
> same column. Please run "scripts/checkpatch.pl" against the patch.

I have tested checkpatch.pl before sending, for the current patch there is no problem from checkpatch.pl
