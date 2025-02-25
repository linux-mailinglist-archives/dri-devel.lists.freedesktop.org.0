Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A706A438D3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 10:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34EAB10E5D1;
	Tue, 25 Feb 2025 09:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OMBMVRDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAEA10E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740474636; x=1772010636;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sQpPwoXRcrLe1y7aA+MEVSALbJkK7A9Ad3ufdJ8khXk=;
 b=OMBMVRDBWG4Wibjmwu8nLAMw7DGGxoKWylAmGLRy9hwUkhEiIKveFsI9
 GbFYMT+oDwn+9Ar1OiV8dERfR0oybTGgZ/6z6AabGJksn6KQbpdguW0tq
 Ucz1JenRV3iKpyBlFfUgu9JvVRx5uZBPKbuhRMN/uSM2h1sXpdHeoBFUc
 r+dSqADQhjvRzNp/zMOHs05Rues7bxuZRSLBUSxl9C5tAiplBwwb22EDE
 5lgVnAJ56ZhOrjzkdpGj2d/x7fQylgVtf7DE5WjzPqdLLkTS6dLkDALu/
 nBPkRYrFzS0HVB8LdCmUjUcu7dDwJDasmE8fEkmFBbLO882oyvGlMbHcC A==;
X-CSE-ConnectionGUID: bsY6u1aKR7KKKfVAdzAPHQ==
X-CSE-MsgGUID: CiMmw91MTLyJ6ryFqbQEag==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="41185112"
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="41185112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:10:36 -0800
X-CSE-ConnectionGUID: lLouOT1dRo6qMbBUadUawQ==
X-CSE-MsgGUID: XZD0O4wkT8KxtqRGM6PyHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,313,1732608000"; d="scan'208";a="116818412"
Received: from monicael-mobl3 (HELO localhost) ([10.245.246.246])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2025 01:10:32 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Lukas Wunner <lukas@wunner.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Takashi Iwai <tiwai@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Su Hui <suhui@nfschina.com>
Subject: Re: [PATCH] vgaswitcheroo: Fix error checking in
 vga_switcheroo_register_audio_client()
In-Reply-To: <8e161bf8-70f6-4557-8fa8-81d4bbfab91f@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ae24cd32-1e78-4656-b983-051ed22d86b9@stanley.mountain>
 <87eczn7adi.fsf@intel.com>
 <8e161bf8-70f6-4557-8fa8-81d4bbfab91f@stanley.mountain>
Date: Tue, 25 Feb 2025 11:10:29 +0200
Message-ID: <87zfia5r0a.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 24 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> On Mon, Feb 24, 2025 at 03:14:33PM +0200, Jani Nikula wrote:
>> On Wed, 19 Feb 2025, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>> > The "id" variable is an enum and in this context it's treated as an
>> > unsigned int so the error handling can never trigger.  The
>> > ->get_client_id() functions do not currently return any errors but
>> > I imagine that if they did, then the intention was to return
>> > VGA_SWITCHEROO_UNKNOWN_ID on error.  Let's check for both negatives
>> > and UNKNOWN_ID so we'll catch it either way.
>> >
>> > Reported-by: Su Hui <suhui@nfschina.com>
>> > Closes: https://lore.kernel.org/all/20231026021056.850680-1-suhui@nfschina.com/
>> > Fixes: 4aaf448fa975 ("vga_switcheroo: set audio client id according to bound GPU id")
>> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>> > ---
>> >  drivers/gpu/vga/vga_switcheroo.c | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/drivers/gpu/vga/vga_switcheroo.c b/drivers/gpu/vga/vga_switcheroo.c
>> > index 18f2c92beff8..216fb208eb31 100644
>> > --- a/drivers/gpu/vga/vga_switcheroo.c
>> > +++ b/drivers/gpu/vga/vga_switcheroo.c
>> > @@ -375,7 +375,7 @@ int vga_switcheroo_register_audio_client(struct pci_dev *pdev,
>> >  	mutex_lock(&vgasr_mutex);
>> >  	if (vgasr_priv.active) {
>> >  		id = vgasr_priv.handler->get_client_id(vga_dev);
>> > -		if (id < 0) {
>> > +		if ((int)id < 0 || id == VGA_SWITCHEROO_UNKNOWN_ID) {
>> 
>> Maybe we want to do something else here... see [1].
>> 
>> BR,
>> Jani.
>> 
>> 
>> [1] https://lore.kernel.org/r/CAHk-=wgg2A_iHNwf_JDjYJF=XHnKVGOjGp50FzVWniA2Z010bw@mail.gmail.com
>> 
>
> I feel like my patch is good enough...  I guess the concern here is that
> GCC could change enums to something else.  I don't think that's likely as
> it would break a lot of code.  The other option, which is a good option,
> is to change the function signature for vgasr_priv.handler->get_client_id()
> so that we do:
>
> 	ret = vgasr_priv.handler->get_client_id(vga_dev, &id);
> 	if (ret)
> 		return;
>
> That's better code, honestly.  But I can't find motivation enough to do
> the work.

The more I look at this, the more bonkers 4aaf448fa975 feels.

Anyway, I don't think ->get_client_id() hooks should return negative
error codes, and indeed none of them do. None of them return
VGA_SWITCHEROO_UNKNOWN_ID either, but that would be a valid return.

I suggest only checking for id == VGA_SWITCHEROO_UNKNOWN_ID. And doing
that in all the places that have that check, there are two more, but
they assign the return value to an int. So the int ret should be changed
to enum vga_switcheroo_unknown_id id I think.

Any chance of finding enough motivation to do that? ;)

BR,
Jani.



-- 
Jani Nikula, Intel
