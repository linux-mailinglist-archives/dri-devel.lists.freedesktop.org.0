Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E088458C0C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 11:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D036E3B2;
	Mon, 22 Nov 2021 10:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ED26E3B2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 10:05:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 65DD83FA5E;
 Mon, 22 Nov 2021 10:05:19 +0000 (UTC)
Subject: Re: [PATCH 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_dstclip()
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-3-marcan@marcan.st> <20211122115247.257f30fa@eldfell>
From: Hector Martin <marcan@marcan.st>
Message-ID: <7e1356b9-3122-e169-193e-37547a50499a@marcan.st>
Date: Mon, 22 Nov 2021 19:05:16 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211122115247.257f30fa@eldfell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: es-ES
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/11/2021 18.52, Pekka Paalanen wrote:
> On Wed, 17 Nov 2021 23:58:28 +0900
> Hector Martin <marcan@marcan.st> wrote:
> 
>> Add XRGB8888 emulation support for devices that can only do XRGB2101010.
>>
>> This is chiefly useful for simpledrm on Apple devices where the
>> bootloader-provided framebuffer is 10-bit, which already works fine with
>> simplefb. This is required to make simpledrm support this too.
>>
>> Signed-off-by: Hector Martin <marcan@marcan.st>
>> ---
>>   drivers/gpu/drm/drm_format_helper.c | 64 +++++++++++++++++++++++++++++
>>   include/drm/drm_format_helper.h     |  4 ++
>>   2 files changed, 68 insertions(+)
> 
> Hi Hector,
> 
> I'm curious, since the bootloader seems to always set up a 10-bit mode,
> is there a reason for it that you can guess? Is the monitor in WCG or
> even HDR mode?

My guess is that Apple prefer to use 10-bit framebuffers for seamless 
handover with their graphics stack, which presumably uses 10-bit 
framebuffers these days. It seems to be unconditional; I've never seen 
anything but 10 bits across all Apple devices, both with the internal 
panels on laptops and with bog standard external displays on the Mac 
Mini via HDMI. HDR is not necessary, even very dumb capture cards and 
old screens get a 10-bit framebufer in memory.

The only time I see an 8-bit framebuffer is with *no* monitor connected 
on the Mini, in which case you get an 8-bit 640x1136 dummy framebuffer 
(that's the iPhone 5 screen resolution... :-) )

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
