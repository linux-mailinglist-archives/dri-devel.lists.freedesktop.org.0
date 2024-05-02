Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601E8B9FA6
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2024 19:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98DA710F714;
	Thu,  2 May 2024 17:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f6K7Jxum";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A2B10F714
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2024 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714671525; x=1746207525;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sf1Qdd2UkUQkAQYRWQyE/89wEDcIr0K3hbM/E0xf3M0=;
 b=f6K7JxumklpcOBsaATxZAOj2OhP0FRO4OcbVrV0A/Fh71ylxpiT7Gh3T
 UWcj+ypdACb+y/yRw1MTM9KvilemTiOKPkjjd6dMS4ncWlmjdBKyxzZOC
 lv08t5g1kO0BmlT4OrS1qDDa/ueuGtHHesBDQS5ZKctHA7JNXbDYmgdPP
 WhdCS6R45wb3zcKtfdh0FZsy6iUJPEMBB1aKLuk2ZJu0sPQV1pcRtwemz
 9sforJx7WgExE1LP36GYMfYG4sYnCV9HgD3gg/mSn3RpE2Ek2Th6KaFMl
 w4zzbNH6k0XeVUbIOTMUg7rHRbuAiptGbzmPtmFXVCmlcZhzn34OHKcSe w==;
X-CSE-ConnectionGUID: tVf+2Xh6QFqxhY0fHre2oA==
X-CSE-MsgGUID: KO/Xow+oTAewsY/xtocXTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10328289"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="10328289"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 10:38:33 -0700
X-CSE-ConnectionGUID: XMmvij5bS0a+jvz/TTvINQ==
X-CSE-MsgGUID: vKZpUTx9TPi0mG8HBfhLdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; d="scan'208";a="31659697"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2024 10:38:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1s2aO3-00000003P1R-0KJB; Thu, 02 May 2024 20:38:27 +0300
Date: Thu, 2 May 2024 20:38:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sui Jingfeng <sui.jingfeng@linux.dev>
Cc: neil.armstrong@linaro.org, Maxime Ripard <mripard@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [v1,1/3] drm/panel: ili9341: Correct use of device property APIs
Message-ID: <ZjPPktqO9f6LWPim@smile.fi.intel.com>
References: <c2d41916-0b6c-43b5-98eb-514eb0511f84@linux.dev>
 <ZiqqiAztCaiAgI8e@smile.fi.intel.com>
 <2599705c-0a64-4742-b1d7-330e9fde6e7a@linux.dev>
 <20240426-married-augmented-mantis-ff7edd@penduick>
 <509b3822-dcf6-45eb-9516-ba8ff2cc4382@linux.dev>
 <20240429-bouncy-attentive-vole-9964f1@houat>
 <795bec5d-c7ba-4fc2-9be9-78c4063743d9@linux.dev>
 <20240430-unnatural-steel-spaniel-dbacef@houat>
 <75a89efb-f653-4185-a451-ef496dffd804@linaro.org>
 <1509ec3a-be84-42b0-a704-51c10482f406@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1509ec3a-be84-42b0-a704-51c10482f406@linux.dev>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, May 03, 2024 at 01:28:26AM +0800, Sui Jingfeng wrote:
> On 2024/5/2 15:34, Neil Armstrong wrote:
> > On 30/04/2024 11:34, Maxime Ripard wrote:
> > > On Tue, Apr 30, 2024 at 12:54:39AM +0800, Sui Jingfeng wrote:
> > > > On 2024/4/29 19:55, Maxime Ripard wrote:
> > > > > On Sat, Apr 27, 2024 at 01:57:46PM +0800, Sui Jingfeng wrote:
> > > > > > On 2024/4/26 14:23, Maxime Ripard wrote:
> > > > > > > On Fri, Apr 26, 2024 at 04:43:18AM +0800, Sui Jingfeng wrote:
> > > > > > > > On 2024/4/26 03:10, Andy Shevchenko wrote:
> > > > > > > > > On Fri, Apr 26, 2024 at 02:08:16AM +0800, Sui Jingfeng wrote:
> > > > > > > > > > On 2024/4/25 22:26, Andy Shevchenko wrote:

...

> > > > > > > > > > > It seems driver missed the point of proper use of device
> > > > > > > > > > > property APIs.  Correct this by updating headers and
> > > > > > > > > > > calls respectively.

> > > > > > > > > > You are using the 'seems' here exactly saying that you are
> > > > > > > > > > not 100% sure.

> > > > > > > > > > Please allow me to tell you the truth: This patch again has
> > > > > > > > > > ZERO effect.  It fix nothing. And this patch is has the
> > > > > > > > > > risks to be wrong.

> > > > > > > > > Huh?! Really, stop commenting the stuff you do not understand.

> > > > > > > > I'm actually a professional display drivers developer at the
> > > > > > > > downstream in the past, despite my contribution to upstream is
> > > > > > > > less. But I believe that all panel driver developers know what
> > > > > > > > I'm talking about. So please have take a look at my replies.

> > > > > > > Most of the interactions you had in this series has been uncalled
> > > > > > > for.  You might be against a patch, but there's no need to go to
> > > > > > > such length.
> > > > > > > 
> > > > > > > As far as I'm concerned, this patch is fine to me in itself, and
> > > > > > > I don't see anything that would prevent us from merging it.

> > > > > > No one is preventing you, as long as don't misunderstanding what
> > > > > > other people's technical replies intentionally. I'm just a usual
> > > > > > and normal contributor, I hope the world will better than
> > > > > > yesterday.

> > > > > You should seriously consider your tone when replying then.
> > > > > 
> > > > > > Saying such thing to me may not proper, I guess you may want to talk
> > > > > > to peoples who has the push rights

> > > > > I think you misunderstood me. My point was that your several rants
> > > > > were uncalled for and aren't the kind of things we're doing here.
> > > > > 
> > > > > I know very well how to get a patch merged, thanks.
> > > > > 
> > > > > > just make sure it isn't a insult to the professionalism of drm bridge
> > > > > > community itself though.

> > > > > I'm not sure why you're bringing the bridge community or its
> > > > > professionalism. It's a panel, not a bridge, and I never doubted the
> > > > > professionalism of anyone.
> > > > 
> > > > I means that the code itself could be adopted, as newer and younger
> > > > programmer (like Andy) need to be encouraged to contribute.
> > > 
> > > Andy has thousands of commits in Linux. He's *very* far from being a new
> > > contributor.
> > > 
> > > > I express no obvious objections, just hints him that something else
> > > > probably should also be taken into consideration as well.
> > > 
> > > That might be what you wanted to express, but you definitely didn't
> > > express it that way.
> > > 
> > > > On the other hand, we probably should allow other people participate in
> > > > discussion so that it is sufficient discussed and ensure that it won't
> > > > be reverted by someone in the future for some reasons. Backing to out
> > > > case happens here, we may need to move things forward.  Therefore, it
> > > > definitely deserve to have a try. It is not a big deal even though it
> > > > gets reverted someday.
> > > > 
> > > > In the end, I don't mind if you think there is nothing that could
> > > > prevent you from merge it, but I still suggest you have a glance at
> > > > peoples siting at the Cc list. I'm busy now and I have a lot of other
> > > > tasks to do, and may not be able to reply you emails on time. So it up
> > > > to you and other maintainers to decide.
> > > > Thank you.
> > > 
> > > So far, you're the only one who reviewed those patches. I'm not sure
> > > what you're talking about here.
> > 
> > Well I (as drm-panel maintainer) did review them positively

[...]

> > because the patches looked perfectly correct in regards of the commit
> > message
> 
> The point is the 'fixes' tag.
> 
> Then, can I ask what's the issue it fixes? I'm asking because I see the
> submitting-patches.html [1] documentation told us that a fixes tag indicates
> that the patch fixes an issue in a previous commit.
> 
> Previously, the driver only meant to be used on the DT systems, so what's issue?

It fixes copy'n'paste error as far as I understand the motivation of this code.

> [1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#reviewer-s-statement-of-oversight
> 
> I copy & paste the paragraph from link [1] for easier to read. See below:
> 
> "A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
> is used to make it easy to determine where a bug originated, which can help
> review a bug fix. This tag also assists the stable kernel team in determining
> which stable kernel versions should receive your fix. This is the preferred
> method for indicating a bug fixed by the patch."
> 
> > and the patchset motivation and
> 
> OK, the motivation is good, I agree and I admit.
> 
> > because I trust Andy being a long time contributor with a lot of
> > expertise.
> 
> Does this means that you are going to merge patches from the experts without have a glance and
> reject or ignore novice's patches unconditionally?
> 
> I'm asking because I see there still have a lot of other panel drivers use of_device_get_match_data()
> function to get a match, and most of them has the 'OF' guard. However, in theory, panel should be
> able to use on any CPU architecture if necessary. Does the remains has the similar issue? or Do we
> need to fixed them together?
> 
> $ find . -name "*.c" -type f | xargs grep "of_device_get_match_data"

$ git log --oneline --no-merges --grep device_get_match_data --author="Rob Herring"

So what does this prove?

> > Anyway since the rant is finished I'll land the patches.
> 
> It's just *comments* or *remarks*, there really no need to use the 'rant'
> to insult and/or devalue other peoples, as it make no sense.

P.S.
You really need to study a kernel code a bit more before replying with long messages.
It will help everybody, I believe.

-- 
With Best Regards,
Andy Shevchenko


