Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C89CB4BF4E4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 10:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A41410E54B;
	Tue, 22 Feb 2022 09:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1010010E578
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645523002; x=1677059002;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=W8iVugSvwQ4gW0wm4pDYSLwIWzTyFZQ5WLS6dOIcegA=;
 b=JGPLaHZy0D/R/84sW3fmtWdh+yTQh+kuMAEmIlxbPIehD6FWS15GARFd
 s8QEGH+zKKaWd81/fY/QKyXxS8VyEGkMcADtwBh1dZtry/oMQb7EwIQEA
 jVDbJgEIxQwRpS1gK2Stv9AqZhNTjCh+psCAliVYhd0OmxWCGAneYhZua
 gkV3SqbjXyEhiIl2N9nA6I4A19iydXUzpVybm9+8wQlU8pF2ti5u06DOY
 CV158gMCluuy/o+rgPeGjxC8j8XrWOlXWgsbmHnP4lvbNbCpzwMyPLIrl
 qvQGKHYsyBB+HtDBtnNcnl9pHfc1Iu9fd36fokWdhcXRIS4GRdCUZxNpI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="250476605"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="250476605"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 01:43:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="507921109"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga006.jf.intel.com with SMTP; 22 Feb 2022 01:43:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 22 Feb 2022 11:43:17 +0200
Date: Tue, 22 Feb 2022 11:43:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH 1/3] drm/edid: parse multiple CEA extension block
Message-ID: <YhSwNY6OS31zpXv5@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
 <YhSQgtQp7Ou2WqNB@intel.com> <87czjf8dik.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87czjf8dik.fsf@intel.com>
X-Patchwork-Hint: comment
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
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 22, 2022 at 11:19:15AM +0200, Jani Nikula wrote:
> On Tue, 22 Feb 2022, Ville Syrjälä <ville.syrjala@linux.intel.com> wrote:
> > On Tue, Feb 22, 2022 at 02:38:17PM +0800, Lee Shawn C wrote:
> >> Try to find and parse more CEA ext blocks if edid->extensions
> >> is greater than one.
> >> 
> >> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> >> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> >> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> >> Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
> >> ---
> >>  drivers/gpu/drm/drm_edid.c | 75 +++++++++++++++++++++++---------------
> >>  1 file changed, 45 insertions(+), 30 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> >> index 12893e7be89b..3d5dbbeca7f9 100644
> >> --- a/drivers/gpu/drm/drm_edid.c
> >> +++ b/drivers/gpu/drm/drm_edid.c
> >> @@ -4313,43 +4313,58 @@ add_cea_modes(struct drm_connector *connector, struct edid *edid)
> >>  	const u8 *cea = drm_find_cea_extension(edid);
> >>  	const u8 *db, *hdmi = NULL, *video = NULL;
> >>  	u8 dbl, hdmi_len, video_len = 0;
> >> -	int modes = 0;
> >> +	int modes = 0, j;
> >>  
> >> -	if (cea && cea_revision(cea) >= 3) {
> >> -		int i, start, end;
> >> +	if (!cea)
> >> +		return 0;
> >>  
> >> -		if (cea_db_offsets(cea, &start, &end))
> >> -			return 0;
> >> +	for (j = (cea - (u8 *)edid) / EDID_LENGTH; j <= edid->extensions;) {
> >
> > That looks rather illegible. I think we want a
> > drm_find_cea_extension(const struct edid *edid, int *ext_index)
> > and then just loop until it stops giving us stuff.
> 
> Neither approach takes multiple CEA blocks within DisplayID extension
> into account. Or some blocks outside and some inside DisplayID
> extension.
> 
> I think we're going to need abstracted EDID iteration similar to what
> I've done for DisplayID iteration. We can't have all places
> reimplementing the iteration like we have now.

Aye. We need so many layers of iteration in various places
that the whole thing is starting to resemble a Russian doll.
Following a common form should probably make that a lot more
manageable.

I've been already thinking about introducing an iterator for
the cea db stuff. But the EDID ext blocks is definitely another
target we need to look at.

And someone is going to have to figure out what are all the
ways these need to nest. I suppose the high level code
should only have to care about the deepest layer of stuff
and the iterators should take care to iterate through all
the potential containers? Eg. if the high level code wants
to look at cea dbs then it just iterates those and 
shouldn't have to care at all where they are stored.

-- 
Ville Syrjälä
Intel
