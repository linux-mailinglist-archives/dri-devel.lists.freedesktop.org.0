Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912609DF4D7
	for <lists+dri-devel@lfdr.de>; Sun,  1 Dec 2024 06:37:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A8310E09F;
	Sun,  1 Dec 2024 05:37:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="EpmJUQuJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3757810E09F
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Dec 2024 05:37:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E7030E0002;
 Sun,  1 Dec 2024 05:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1733031419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pG3aq7ChDFKR5kxszkO7RJhggVK2WiMzGe31zZp8WjM=;
 b=EpmJUQuJ/u6gYkCs8YkwbPIch//T9TaQEG3mI7pU4HKwsmou6w4XDhS7td5y+uiinjvguE
 z41xfna0ngdtJ9ha8O3/VxUe9NFtpup8/jSsTQGxm9bFOQiCiSMuRPnc9U61vuu9sa5m+Q
 C7FdiJo7oAbRzFWBlPfGFpH90gWRzSKU6OY063wCRI5eUv39VreMU+3eC7D0jZ59I7igev
 l7Nte1hnRkzfiVFsUQJlVC69XDh/ZAFiutdSbo/97/xTf6EL7koR4YWYT/vxjmB/hz4ygY
 HUCttssjpd0LXLic4qaaB6Qspmp+Ks0kDYzkWM8VE6/SlGiU/fOl8FqLiIUcCg==
Date: Sun, 1 Dec 2024 06:36:53 +0100
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Ananta Srikar Puranam <srikarananta01@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: Interest in Contributing to VKMS Development
Message-ID: <Z0v19YeZa2IAooUV@fedora>
References: <09cf19a7-b153-4da4-8704-f702f41909d3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09cf19a7-b153-4da4-8704-f702f41909d3@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

+Cc: dri-devel@lists.freedesktop.org 

On 30/11/24 - 13:49, Ananta Srikar Puranam wrote:
> Dear Louis Chauvet,

Hi Srikar!

> I was able to successfully compile Linux with VKMS enabled and have set up
> igt-gpu-tests in a QEMU machine. I can now run some tests successfully.

Congratulation!
 
> I have a surface-level understanding of the DRM and KMS subsystems
> (framebuffers, planes, CRTCs, encoders, and connectors) and am eager to dive
> deeper into the VKMS module and contribute.

I am very happy to see some interest in VKMS development, do you have a 
specific feature that you want to test?

> I understand VKMS helps test the DRM subsystem, but I’m struggling to fully
> grasp how the absence of visible display output aligns with its testing
> goals. Any guidance on this would be highly appreciated.

That the whole point of "V"KMS, everything is virtual, even the display 
output :)

There are two way to get some information about the output content:
- CRC compuation [1]
- Writeback connector [2]

The CRC will allows you to write a test like this:

	create_reference_image();
	ref_crc = grab_crc();

	test_procedure();
	test_crc = grab_crc();

	assert(ref_crc, test_crc);

This is used in the igt test "kms_plane" to test color conversion, they 
compute a reference CRC and then test the conversion between multiple 
formats [3].

The writeback connector is useful to grab a "screenshot" of the output, 
but it is a bit less efficient. It can be used when a simple "reference 
CRC" is not possible. 
To grab a picture from the writeback connector, you have to do something 
like this:

	setup_pipeline();
	wb_fb = create_fb();
	while (true) {
		send_fb_to_wb_connector(wb_fb);
		wait_for_picture();
		do_something_with_result(wb_fb);
	}

There is a writeback example in igt [4], but I don't know how it works.

[1]:https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/vkms/vkms_composer.c#L209
[2]:https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/vkms/vkms_writeback.c#L171
[3]:https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_plane.c#L1036
[4]:https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c

> Additionally, I noticed the TODO item to add the plane feature (background
> color KMS property). It seems like a good starting point, and I would be
> grateful for direction on how to approach it.

I think this is the good direction, yes!

All your patches must be on top of drm-misc-next [5]. If you are not 
familiar with kernel contribution, I invite you to look at the kernel 
documentation [6] and at the amazing b4 tool [7].

For the implementation itself, I think you have to work in the function 
blend, probably around the fill_background function [8]. You also need to 
attach a BACKGROUND property on the CRTC [9]. I think you have to do it 
somewhere in crtc initialization [10].

[5]:https://gitlab.freedesktop.org/drm/misc/kernel/-/tree/drm-misc-next 
[6]:https://docs.kernel.org/process/contribution-maturity-model.html
[7]:https://b4.docs.kernel.org/
[8]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/vkms/vkms_composer.c#L389
[9]:https://drmdb.emersion.fr/properties/3435973836/BACKGROUND
[10]:https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drivers/gpu/drm/vkms/vkms_crtc.c?ref_type=heads#L273

> Thank you for your time, and I look forward to your guidance.
> 
> Best regards,
> Srikar

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
