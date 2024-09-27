Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D511E98889A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 17:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B2610E172;
	Fri, 27 Sep 2024 15:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="riyQJO5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B2910E172
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 15:56:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 122715C5CD1;
 Fri, 27 Sep 2024 15:56:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E677EC4CEC4;
 Fri, 27 Sep 2024 15:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727452584;
 bh=LDGGmgVf9JJZZvlWGW82IbklqNVGYZgzG1K6LHijCQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=riyQJO5rRdwj+aBpiHRdqdHYmGu738xPfJAF38WjjCIL2wNPMu6yTL1J2ZtishcXG
 TWyjy9RNjzVFR5f32GFGduMzUYorFgRAguQwz6gaHHBvcXbgEGyowzZ/5Ncpr6dYfE
 hA4qO2aKABag5k4bBq6SC2U0xOOL/+GcBrL4Vi29xOP93ZOWHzBSAew4Xi4/1R3CPq
 7AK8SPC2jKUxkunxd8JJh0d5IeRtxz3POsUJQ8R+j0A0yDwbkLPJThfiSPSd9L/XNI
 NgvM8wmUOXRHX4J39fvR2SnbUev4EO4KXOH3kCHIsOZ8ZHTqXPIigTyS01Qi5crY7t
 +ZvQQ4lPKrQRA==
Date: Fri, 27 Sep 2024 17:56:19 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>,
 Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/10] HID: multitouch: support getting the contact ID
 from HID_DG_TRANSDUCER_INDEX fields
Message-ID: <xdkn2y6wpnqjrngem3xjxjn2a7cykhrb6dj56w6avz4noj7itu@xlknbwmp63h7>
References: <DD9C41AD-6543-47CE-8504-69E4992229B2@live.com>
 <BD919A98-0D44-42F9-867F-B936BBB8267A@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BD919A98-0D44-42F9-867F-B936BBB8267A@live.com>
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

On Aug 17 2024, Aditya Garg wrote:
> From: Kerem Karabay <kekrby@gmail.com>
> 
> This is needed to support Apple Touch Bars, where the contact ID is
> contained in fields with the HID_DG_TRANSDUCER_INDEX usage.
> 
> Signed-off-by: Kerem Karabay <kekrby@gmail.com>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>
> ---
>  drivers/hid/hid-multitouch.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hid/hid-multitouch.c b/drivers/hid/hid-multitouch.c
> index 56fc78841..3e92789ed 100644
> --- a/drivers/hid/hid-multitouch.c
> +++ b/drivers/hid/hid-multitouch.c
> @@ -635,7 +635,9 @@ static struct mt_report_data *mt_allocate_report_data(struct mt_device *td,
>  
>  		if (field->logical == HID_DG_FINGER || td->hdev->group != HID_GROUP_MULTITOUCH_WIN_8) {
>  			for (n = 0; n < field->report_count; n++) {
> -				if (field->usage[n].hid == HID_DG_CONTACTID) {
> +				unsigned int hid = field->usage[n].hid;
> +
> +				if (hid == HID_DG_CONTACTID || hid == HID_DG_TRANSDUCER_INDEX) {

I'm not super happy about this. The HID spec specifically mentions
CONTACTID to be related to multitouch, when TRANSDUCER is not
specifically for multitouch. I would rather have this hidden behind a
quirk, because I don't think this is standard (the device comes from an
environment where both the hardware and the software stack is
controlled, which already gave some fun decisions from Apple).

Cheers,
Benjamin

>  					rdata->is_mt_collection = true;
>  					break;
>  				}
> @@ -814,6 +816,7 @@ static int mt_touch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
>  			MT_STORE_FIELD(tip_state);
>  			return 1;
>  		case HID_DG_CONTACTID:
> +		case HID_DG_TRANSDUCER_INDEX:
>  			MT_STORE_FIELD(contactid);
>  			app->touches_by_report++;
>  			return 1;
> -- 
> 2.43.0
> 
