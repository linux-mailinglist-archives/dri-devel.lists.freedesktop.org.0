Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5691D846CE4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 10:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CFCB10E2E9;
	Fri,  2 Feb 2024 09:48:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bctLq51q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7666A10EAB7
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 09:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRN/NsExQkJmU0g3kxSlHpfGdmwbxrUNsEQHQAzCp8k=; b=bctLq51qqFg/6DlviA8mh+MPGe
 4FxXYPzaA/4fgDKAHijPTX4dv37Z89t929ymc0DrWefywsAD+pSnXwK/7lMZSCIQOhp882sHAb40Z
 1reOuNliPGvQVN4jCLrlqcG/yUKgEpyLHJ1wZHJtR1uy7Ww9jJfVHNqIu1PUXGKQ5EKEWJbu0Eojb
 DL6+bLo8RXoe+5rkHO6YrhRmMwzLUECt2JWhsxt4WgF+gaQ8k+GVLTPO4lT8vI5sREmsrBuisj/sr
 nqKdyHlb9Xmgw2BIWB/yLWMBhCDFAXD0eI3k7NJ6mq5qza0sb+I99+OujgVZEmsRbLC/KuI530iI/
 w+bVj7Cg==;
Received: from [179.234.233.159] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rVq9P-00CuBg-Ph; Fri, 02 Feb 2024 10:48:00 +0100
Message-ID: <d3d2c0bb-7abe-4c8c-805b-bd8d0469eab6@igalia.com>
Date: Fri, 2 Feb 2024 06:47:52 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/vkms: Use a simpler composition function
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, marcheu@google.com, seanpaul@google.com,
 nicolejadeyee@google.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, thomas.petazzoni@bootlin.com
References: <20240201-yuv-v1-0-3ca376f27632@bootlin.com>
 <20240201-yuv-v1-2-3ca376f27632@bootlin.com>
 <20240202105522.43128e19@eldfell> <20240202102601.70b6d49c@xps-13>
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Autocrypt: addr=mcanal@igalia.com; keydata=
 xjMEZIsaeRYJKwYBBAHaRw8BAQdAGU6aY8oojw61KS5rGGMrlcilFqR6p6ID45IZ6ovX0h3N
 H01haXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT7CjwQTFggANxYhBDMCqFtIvFKVRJZQ
 hDSPnHLaGFVuBQJkixp5BQkFo5qAAhsDBAsJCAcFFQgJCgsFFgIDAQAACgkQNI+cctoYVW5u
 GAEAwpaC5rI3wD8zqETKwGVoXd6+AbmGfZuVD40xepy7z/8BAM5w95/oyPsHUqOsg/xUTlNp
 rlbhA+WWoaOXA3XgR+wCzjgEZIsaeRIKKwYBBAGXVQEFAQEHQGoOK0jgh0IorMAacx6WUUWb
 s3RLiJYWUU6iNrk5wWUbAwEIB8J+BBgWCAAmFiEEMwKoW0i8UpVEllCENI+cctoYVW4FAmSL
 GnkFCQWjmoACGwwACgkQNI+cctoYVW6cqwD/Q9R98msvkhgRvi18fzUPFDwwogn+F+gQJJ6o
 pwpgFkAA/R2zOfla3IT6G3SBoV5ucdpdCpnIXFpQLbmfHK7dXsAC
In-Reply-To: <20240202102601.70b6d49c@xps-13>
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

Hi Miquel,

On 2/2/24 06:26, Miquel Raynal wrote:
> Hi Pekka,
> 
> pekka.paalanen@haloniitty.fi wrote on Fri, 2 Feb 2024 10:55:22 +0200:
> 
>> On Thu, 01 Feb 2024 18:31:32 +0100
>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
>>
>>> Change the composition algorithm to iterate over pixels instead of lines.
>>> It allows a simpler management of rotation and pixel access for complex formats.
>>>
>>> This new algorithm allows read_pixel function to have access to x/y
>>> coordinates and make it possible to read the correct thing in a block
>>> when block_w and block_h are not 1.
>>> The iteration pixel-by-pixel in the same method also allows a simpler
>>> management of rotation with drm_rect_* helpers. This way it's not needed
>>> anymore to have misterious switch-case distributed in multiple places.
>>
>> Hi,
>>
>> there was a very good reason to write this code using lines:
>> performance. Before lines, it was indeed operating on individual pixels.
>>
>> Please, include performance measurements before and after this series
>> to quantify the impact on the previously already supported pixel
>> formats, particularly the 32-bit-per-pixel RGB variants.
>>
>> VKMS will be used more and more in CI for userspace projects, and
>> performance actually matters there.
>>
>> I'm worrying that this performance degradation here is significant. I
>> believe it is possible to keep blending with lines, if you add new line
>> getters for reading from rotated, sub-sampled etc. images. That way you
>> don't have to regress the most common formats' performance.
> 
> While I understand performance is important and should be taken into
> account seriously, I cannot understand how broken testing could be
> considered better. Fast but inaccurate will always be significantly
> less attractive to my eyes.
> 
> I am in favor of making this working first, and then improving the code
> for faster results. Maybe the line-driven approach can be dedicated to
> "simpler" formats where more complex corner cases do not happen. But
> for now I don't see the point in comparing performances between broken
> and (hopefully) non broken implementations.

We still haven't landed the YUV series for VKMS. Therefore, the code
available in the repository is not broken.

Performance is crucial for VKMS, as Pekka mentioned. First, because it
will be used more and more in CI. Second, because I wouldn't like to see
IGT tests timing out in VKMS.

Best Regards,
- Maíra

> 
> Thanks,
> Miquèl
