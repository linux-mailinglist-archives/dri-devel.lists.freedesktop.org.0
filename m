Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74654716744
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 17:39:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FE5710E3CC;
	Tue, 30 May 2023 15:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4EDE10E3CD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 15:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yErmUKLEV8p541cORXL+ZjgxkNaQgiMOaq6ZyNHls9A=;
 b=kJy4mOQJiQ6YFOtAavW7NVC4LtJUJWoWi0t56Isq6GJEQ94tSFFnKj2QAWLm0XaGC4nsXFkBkakDS
 NJpKJBBKnZj3kxtUaKYQCD2fzGVMwf1GdCYmplTtiUKOMCqmeCodCGDybgd3fBXqq41gTF+jtWaBud
 ZiifDfsFsxbsCYl7jUi6gqu8AP+taGhEp5M1s3Eje2y9B9jvuhLniBwkansgLifx6SE0ZhmmkwwW0S
 kQrmWvCeSptvOj1pNPoctQlqP/WS/dhXugy4DsvtYBfPP4+2ibR1557sMasm0CnZgPmuJJrK37Cziw
 2hQh7NWvetGo07FA/uw7kZ2ePRqcxCg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=yErmUKLEV8p541cORXL+ZjgxkNaQgiMOaq6ZyNHls9A=;
 b=9OBjrRKYEtwrxBpN98hY1nffVfOZmReyI/MyWaIBmOFDtTrxJbnAvKHOUUjnmP+bOTyVAwwn+tCeN
 TfzEQsmCg==
X-HalOne-ID: f3492551-feff-11ed-8093-231b2edd0ed2
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id f3492551-feff-11ed-8093-231b2edd0ed2;
 Tue, 30 May 2023 15:37:58 +0000 (UTC)
Date: Tue, 30 May 2023 17:37:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 13/13] drm/i915: Implement dedicated fbdev I/O helpers
Message-ID: <20230530153757.GA1464878@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-14-tzimmermann@suse.de>
 <20230529193621.GD1370714@ravnborg.org>
 <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <539118fc-ad60-ee3c-4a0c-1472774f5122@suse.de>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

> > > -	if (helper->funcs->fb_dirty) {
> > > -		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
> > > -		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
> > > -				     drm_rect_width(&damage_area),
> > > -				     drm_rect_height(&damage_area));
> > > -	}
> > 
> > The generated helpers do not have the if (helper->funcs->fb_dirty)
> > check.
> > Is this implemented somewhere else that I missed?
> 
> It's not needed any longer.  We used to test if the fbdev code needs damage
> handling by looking for a fb_dirty callback. If so, we ran the damage
> handling code.
> 
> With the patchset applied, the fbdev code that does not need damage handling
> calls fb_{io,sys}_write() directly.  The fbdev code that needs damage
> handling (generic, i915, msm) uses the generator macro that creates
> necessary the calls unconditionally.  We know each case at build time.
> 
> (I think I have to move the msm patch after patch 10/13 to make it
> bisectable.)
> 
> AFAICT the missing test for fb_dirty is also one of the reasons why there's
> a difference in performance.
> 
> Hopefully, this answers your question?
Makes perfect sense - thanks.
That also implies that my conditional r-b's are now OK.

	Sam
