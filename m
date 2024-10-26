Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8699B9B17D3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 14:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD77B10E011;
	Sat, 26 Oct 2024 12:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="hq7wgWu+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EA810E011
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2024 12:11:10 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx1.riseup.net (Postfix) with ESMTPS id 4XbJQj153jzDrNy;
 Sat, 26 Oct 2024 12:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1729944669; bh=AQ3/+Vqj28trLqi817dZc3+Hj8cF9me0bw3ppsI5GUI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=hq7wgWu+2qofBRiHTL5ltlClTVxhevCV7k6HdBvld3J/IHAA4xk/j8C9T2ICpYHkt
 HU65Qsd2YBD27JXG95bxNztTxtrzowLdfhO9Z0JBSa7HsTg3RtCblFIpcwtG8RcqHm
 Y2iTL8e7pYqyssEu8QfbD3Tn544hILkh1h/7b1rQ=
X-Riseup-User-ID: F93AA77ED5E886C2F4EB654852C2ACF3900CB5B9FF30773A7B45C08DCC7C3760
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XbJQY0lZszFtZ6;
 Sat, 26 Oct 2024 12:11:00 +0000 (UTC)
Message-ID: <d3e8bb5a-6053-4a2b-a445-0cf4e610f112@riseup.net>
Date: Sat, 26 Oct 2024 09:10:57 -0300
MIME-Version: 1.0
Subject: Re: [PATCH v12 09/15] drm/vkms: Remove useless drm_rotation_simplify
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Simona Vetter <simona@ffwll.ch>, rdunlap@infradead.org,
 arthurgrillo@riseup.net, pekka.paalanen@haloniitty.fi,
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
References: <ZwzYqihbReaLFn-c@louis-chauvet-laptop>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>
In-Reply-To: <ZwzYqihbReaLFn-c@louis-chauvet-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Louis,

On 14/10/24 05:39, Louis Chauvet wrote:
> On 11/10/24 - 10:53, Maira Canal wrote:
>> Hi Louis,
>>
>> On 10/11/24 06:36, Louis Chauvet wrote:
>>>
>>> Hi all,
>>>
>>> Until this point, this series has not received any major comments since
>>> v9. I will commit patches 1-9 next week if there are no further comments.
>>>
>>
>> Although we are maintainers of VKMS, it isn't recommended that we push
>> our own changes without even the Ack of another person. Please, read the
>> "drm-misc Committer Guidelines" [1].
> 
> Hi Maíra, Maxime,
> 
> I apologize for this rushed commit request. I sent the initial email with
> a delay before the commit action because I was not sure about the
> procedure and wanted to give others a chance to raise any concerns.
> Unfortunately, I overlooked the need to collect an Ack/Review for each
> patch, even when there hadn't been any responses for several months. I'm
> sorry for this oversight.
> 
>> I can ack patches 05/15, 07/15, and 09/15, but it would be more
>> beneficial for the community if you ask for an ack (from me or from the
>> DRM maintainers, which are always around), instead of saying that you
>> are going to commit the patches without any review.
> 
> I will be happy to ask for acknowledgments if needed, but as you mentioned
> multiple times: nobody is paid to maintain VKMS. Since you did not comment
> these series since July, when you told me you would review my patches, I
> assumed it was either okay or you no longer had the time to maintain
> (which I completely understand).

Yeah, I'm a volunteer and no longer have time to maintain VKMS. A couple
of weeks ago I sent a patch removing myself as VKMS maintainer. This
doesn't imply that patches can be pushed without review.

We are a community with several active developers. Although I don't have
time to properly review your patches, you can try to gather other
developers to review your patches. You can try to use #dri-devel to get
reviewers.

That said, you can add my ACK to patches 05/15, 07/15, and 09/15 and
push the patches. I won't ack the YUV patches as I don't feel
comfortable reviewing/acking those.

Acked-by: Maíra Canal <mairacanal@riseup.net>

BTW if the patches are fixing IGT tests, please update the list of fails
and skips on DRM CI.

Best Regards,
- Maíra

> 
> So, I hereby formally request reviews/ACKs for the following series:
> 
> [this series]:https://lore.kernel.org/all/20241007-yuv-v12-0-01c1ada6fec8@bootlin.com/
> [2]:https://lore.kernel.org/all/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com/
> [3]:https://lore.kernel.org/all/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com/
> 
> (I have to send a v2 for [3] because of rebase conflict, but nothing else
> changed)
> 
> Thanks a lot,
> Louis Chauvet
>   
>> [1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-drm-misc.html
>>
>> Best Regards,
>> - Maíra
>>
>>> For patches 10-15, I am currently waiting for feedback from Maxime to
>>> send the next iteration with a fix for kunit tests.
>>>
>>> Thanks,
>>> Louis Chauvet
>>>
>>> On 07/10/24 - 18:10, Louis Chauvet wrote:
>>>> As all the rotation are now supported by VKMS, this simplification does
>>>> not make sense anymore, so remove it.
>>>>
>>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
>>>> ---
>>>>    drivers/gpu/drm/vkms/vkms_plane.c | 7 +------
>>>>    1 file changed, 1 insertion(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> index 8875bed76410..5a028ee96c91 100644
>>>> --- a/drivers/gpu/drm/vkms/vkms_plane.c
>>>> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
>>>> @@ -115,12 +115,7 @@ static void vkms_plane_atomic_update(struct drm_plane *plane,
>>>>    	frame_info->fb = fb;
>>>>    	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_info->map));
>>>>    	drm_framebuffer_get(frame_info->fb);
>>>> -	frame_info->rotation = drm_rotation_simplify(new_state->rotation, DRM_MODE_ROTATE_0 |
>>>> -									  DRM_MODE_ROTATE_90 |
>>>> -									  DRM_MODE_ROTATE_270 |
>>>> -									  DRM_MODE_REFLECT_X |
>>>> -									  DRM_MODE_REFLECT_Y);
>>>> -
>>>> +	frame_info->rotation = new_state->rotation;
>>>>    	vkms_plane_state->pixel_read_line = get_pixel_read_line_function(fmt);
>>>>    }
>>>>
>>>> -- 
>>>> 2.46.2
>>>>
