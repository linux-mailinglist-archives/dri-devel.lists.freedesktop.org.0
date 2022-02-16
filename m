Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB514B83E9
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 10:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9003F10EDF2;
	Wed, 16 Feb 2022 09:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B7510EDDE
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 09:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645003537; x=1676539537;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GspdF3cMfTdCGHm/JJQHzlJpXg9C0oShSbsz5mwWwdM=;
 b=G3APksM05hSLkTqAPsL79GxphWR+4ImH7gXAoCecH/fNFA16xKx+rFAY
 l5V/cv1zUbynNxje29ypHnS67lACW6Vls8q/A1kkU8I12dMIz+Qebwdut
 jiwcFHb2nVaaBO6hONjlconJ6a2P9afe+pIK/U2itgYY6u8QgCTXEryHi
 BZq9mCUWZmb6VBVuffXtKtEi3yt0R6u1tCkh4fDbmUMYjUAZOgXakWZcC
 pNJZy+eQ1Lb/DQsFEbnV7pTUHqPi0CnU0Dc0VgJplSVz+GLlTOO+zjyEP
 hu+xiWLTV1M2nFWInmCsYAsL7PXfURC81FoBJMtGP46Y3y3U+i+DjolX0 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="230523285"
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="230523285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:25:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,373,1635231600"; d="scan'208";a="544830333"
Received: from rbilei-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.13.113])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 01:25:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Doug Anderson <dianders@chromium.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>
Subject: Re: [PATCH v2 2/3] drm: Plumb debugfs_init through to panels
In-Reply-To: <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220205001342.3155839-1-dianders@chromium.org>
 <20220204161245.v2.2.Ib0bd5346135cbb0b63006b69b61d4c8af6484740@changeid>
 <5d60473d-be8f-e2dc-2ce9-bc0b9056e4b4@redhat.com>
 <e6670fd7-1f75-56f7-b668-20db9902cac6@intel.com>
 <CAD=FV=Ut3N9syXbN7i939mNsx3h7-u9cU9j6=XFkz9vrh0Vseg@mail.gmail.com>
Date: Wed, 16 Feb 2022 11:25:27 +0200
Message-ID: <87ee435fjs.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jonas Karlman <jonas@kwiboo.se>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, lschyi@chromium.org,
 Sam Ravnborg <sam@ravnborg.org>, jjsu@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 15 Feb 2022, Doug Anderson <dianders@chromium.org> wrote:
> Hi,
>
> On Tue, Feb 15, 2022 at 2:20 PM Andrzej Hajda <andrzej.hajda@intel.com> wrote:
>>
>> On 15.02.2022 23:09, Javier Martinez Canillas wrote:
>> > Hello Doug,
>> >
>> > On 2/5/22 01:13, Douglas Anderson wrote:
>> >
>> > [snip]
>> >
>> >> +static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
>> >> +                                  struct dentry *root)
>> >> +{
>> >> +    struct panel_bridge *panel_bridge = drm_bridge_to_panel_bridge(bridge);
>> >> +    struct drm_panel *panel = panel_bridge->panel;
>> >> +
>> >> +    root = debugfs_create_dir("panel", root);
>> > This could return a ERR_PTR(-errno) if the function doesn't succeed.
>> >
>> > I noticed that most kernel code doesn't check the return value though...
>> >
>> >> +    if (panel->funcs->debugfs_init)
>> > Probably if (!(IS_ERR(root) && panel->funcs->debugfs_init) ?
>> >
>> >> +            panel->funcs->debugfs_init(panel, root);
>> >> +}
>> > [snip]
>> >
>> >> @@ -436,6 +436,9 @@ void drm_debugfs_connector_add(struct drm_connector *connector)
>> >>      /* vrr range */
>> >>      debugfs_create_file("vrr_range", S_IRUGO, root, connector,
>> >>                          &vrr_range_fops);
>> > Same here, wonder if the return value should be checked.
>
> My plan (confirmed with Javier over IRC) is to land my patches and we
> can address as needed with follow-up patches.
>
> I actually wrote said follow-up patches and they were ready to go, but
> when I was trying to come up with the right "Fixes" tag I found commit
> b792e64021ec ("drm: no need to check return value of debugfs_create
> functions"). So what's being requested is nearly the opposite of what
> Greg did there.
>
> I thought about perhaps only checking for directories but even that
> type of check was removed by Greg's patch. Further checking shows that
> start_creating() actually has:
>
> if (IS_ERR(parent))
>   return parent;
>
> ...so I guess that explains why it's fine to skip the check even for parents?
>
> Sure enough I confirmed that if I pass `ERR_PTR(-EINVAL)` as the root
> for `panel->funcs->debugfs_init()` that nothing bad seems to happen...

Yeah, the idea is that you don't need to check for debugfs function
return values and you can safely pass error pointers to debugfs
functions. The worst that can happen is you don't get the debugfs, but
hey, it's debugfs so you shouldn't fail anything else because of that
anyway.

BR,
Jani.

>
>
>> I've seen sometimes that file/dir was already created with the same
>> name, reporting error in such case will be helpful.
>
> It sure looks like start_creating() already handles that type of
> reporting... Sure enough, I tried to create the "force" file twice,
> adding no error checking myself, and I see:
>
> debugfs: File 'force' in directory 'eDP-1' already present!
> debugfs: File 'force' in directory 'DP-1' already present!
>
>
> So tl;dr is that I'm going to land the patches and now am _not_
> planning on doing followup patches. However, if I'm confused about any
> of the above then please let me know and I'll dig more / can send
> follow-up patches.
>
> -Doug

-- 
Jani Nikula, Intel Open Source Graphics Center
