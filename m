Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFD0651D21
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 10:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2149710E354;
	Tue, 20 Dec 2022 09:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6825A10E350
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 09:20:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD611B811EA;
 Tue, 20 Dec 2022 09:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEECAC433EF;
 Tue, 20 Dec 2022 09:20:28 +0000 (UTC)
Message-ID: <b503589a-7b82-3335-8ea3-598d467f5d40@xs4all.nl>
Date: Tue, 20 Dec 2022 10:20:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <2f252958-1bb1-006a-b450-1315be8a3c9f@xs4all.nl>
 <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <CAMuHMdXd7Q1WWdo-rwfad1-BwuuH5vxt9Kx2Zv2Ok2rQLvh_wA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/12/2022 10:09, Geert Uytterhoeven wrote:
> Hi Hans,
> 
> On Tue, Dec 20, 2022 at 10:01 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>> On 19/12/2022 22:47, Laurent Pinchart wrote:
>>> (CC'ing Sakari and Hans)
>>>
>>> Thank you for the patch.
>>>
>>> On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
>>>> Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
>>>>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
>>>>  2 files changed, 71 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> index 8c2719efda2a..8ccabf5a30c4 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
>>>> @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
>>>>              .bpp = 32,
>>>>              .planes = 1,
>>>>              .hsub = 1,
>>>> +    }, {
>>>> +            .fourcc = DRM_FORMAT_RGBX1010102,
>>>
>>> Ah, here the format makes sense.
>>>
>>>> +            .v4l2 = V4L2_PIX_FMT_XBGR2101010,
>>>
>>> But this is horrible :-( Could we use the same names as DRM for new
>>> formats, when there is no conflict with existing V4L2 formats ?
>>>
>>> Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
>>> the format definitions.
>>
>> V4L2 describes pixel formats based on how they appear in memory from the
>> lowest to highest memory address.
> 
> So that means big endian?

Yes.

> 
>> If I am not mistaken, DRM uses the CPU order. So that explains the difference
>> in naming. I don't think we should hide that difference. And V4L2 has been
>> quite consistent in following memory ordering in the naming (except possibly
>> for some of the really old pixelformats).
> 
> DRM uses little endian.

So not CPU order, but always little endian order? I.e., on a big endian system
a given DRM_FORMAT_ would have the same memory layout as on a little endian
system?

Regards,

	Hans

> 
>> Departing from that would be more of a hindrance than a help, IMHO.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

