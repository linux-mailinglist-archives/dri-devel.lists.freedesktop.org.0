Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F397E22FE05
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 01:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45656E0EF;
	Mon, 27 Jul 2020 23:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A304C89DFA
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 21:55:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1595886915; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2u1FzLcW8eIOp2SQYzgZ+Is9ZYPxVilfNAm6pXqiy2k=;
 b=eI0V0TeXSQnXa1qAFhDaVECLXh87KTjEfFoKTG84y6ZYgpauZhOyu/EUjM/x7ynktiZmJvMJ
 2PsU/JvucnwC+wXRD+L6f7+iyj/KibsWTSHXq6wJPaaXtFyCzjcEZ/tfsJULe7sBBbJ+wtxf
 GjHjb0YjrLIgbQ/t0yuMxsPli48=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-west-2.postgun.com with SMTP id
 5f1f4d34298a38b61606951a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 27 Jul 2020 21:55:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B2FBFC433A0; Mon, 27 Jul 2020 21:55:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cohens)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CD19EC433C9;
 Mon, 27 Jul 2020 21:54:59 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 27 Jul 2020 17:54:59 -0400
From: cohens@codeaurora.org
To: daniel@ffwll.ch
Subject: Re: [Freedreno] [PATCH V2] drm: hold gem reference until object is no
 longer accessed
In-Reply-To: <20200727201128.GX6419@phenom.ffwll.local>
References: <1595284250-31580-1-git-send-email-cohens@codeaurora.org>
 <20200727195507.GA240123@kroah.com>
 <20200727201128.GX6419@phenom.ffwll.local>
Message-ID: <f035111e7139bdaeb7562afd2415f366@codeaurora.org>
X-Sender: cohens@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-Mailman-Approved-At: Mon, 27 Jul 2020 23:32:42 +0000
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
Cc: adelva@google.com, sam@ravnborg.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, pdhaval@codeaurora.org, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-07-27 16:11, daniel@ffwll.ch wrote:
> On Mon, Jul 27, 2020 at 09:55:07PM +0200, Greg KH wrote:
>> On Mon, Jul 20, 2020 at 06:30:50PM -0400, Steve Cohen wrote:
>> > A use-after-free in drm_gem_open_ioctl can happen if the
>> > GEM object handle is closed between the idr lookup and
>> > retrieving the size from said object since a local reference
>> > is not being held at that point. Hold the local reference
>> > while the object can still be accessed to fix this and
>> > plug the potential security hole.
>> >
>> > Signed-off-by: Steve Cohen <cohens@codeaurora.org>
>> > ---
>> >  drivers/gpu/drm/drm_gem.c | 10 ++++------
>> >  1 file changed, 4 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>> > index 7bf628e..ee2058a 100644
>> > --- a/drivers/gpu/drm/drm_gem.c
>> > +++ b/drivers/gpu/drm/drm_gem.c
>> > @@ -871,9 +871,6 @@ drm_gem_flink_ioctl(struct drm_device *dev, void *data,
>> >   * @file_priv: drm file-private structure
>> >   *
>> >   * Open an object using the global name, returning a handle and the size.
>> > - *
>> > - * This handle (of course) holds a reference to the object, so the object
>> > - * will not go away until the handle is deleted.
>> >   */
>> >  int
>> >  drm_gem_open_ioctl(struct drm_device *dev, void *data,
>> > @@ -898,14 +895,15 @@ drm_gem_open_ioctl(struct drm_device *dev, void *data,
>> >
>> >  	/* drm_gem_handle_create_tail unlocks dev->object_name_lock. */
>> >  	ret = drm_gem_handle_create_tail(file_priv, obj, &handle);
>> > -	drm_gem_object_put_unlocked(obj);
>> >  	if (ret)
>> > -		return ret;
>> > +		goto err;
>> >
>> >  	args->handle = handle;
>> >  	args->size = obj->size;
>> >
>> > -	return 0;
>> > +err:
>> > +	drm_gem_object_put_unlocked(obj);
>> > +	return ret;
>> >  }
>> >
>> >  /**
>> 
>> As this seems to fix an important issue, any reason it wasn't cc: 
>> stable
>> on it so that it gets backported properly?
>> 
>> How about a "Fixes:" tag so that we know what commit id it fixes so we
>> know how far back to backport things?
>> 
>> And a hint to the maintainers that "this is an issue that needs to get
>> into 5.8-final, it shouldn't wait around longer please" would have 
>> also
>> been nice to see :)
>> 
>> And what chagned from v1, aren't you supposed to list that somewhere 
>> in
>> the changelog or below the --- line (never remember what DRM drivers
>> want here...)
>> 
>> Care to send a v3?
> 
> Don't worry, I'm pushing this to drm-misc-fixes now, should still make 
> it
> to 5.8. Plus cc: stable. I didn't bother with Fixes: since I think the 
> bug
> is rather old. Also, worst case you leak 32bit of some kernel memory 
> that
> got reused already (but yeah I know that's often enough to get the foot 
> in
> somewhere nasty and crack the door open).
> 
> I think it fell through cracks because Sam said he'll apply, guess that
> didn't happen.

Sam added his Reviewed-By on V1 with a comment to rename the goto label,
but in V2 I also updated the API documentation and the commit text for
a more complete change and thought he would re-add the tag.

> Also yes a changelog, somewhere, for next time around.

Apologies, it won't happen again. Should I still submit a V3?
It looks like you've got Greg's concerns covered.

-Steve

> -Daniel
> 
> 
>> 
>> thanks,
>> 
>> greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
