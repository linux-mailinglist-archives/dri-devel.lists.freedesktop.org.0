Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7A578CC4E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 20:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7979A10E47E;
	Tue, 29 Aug 2023 18:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Tue, 29 Aug 2023 18:43:05 UTC
Received: from kozue.soulik.info (kozue.soulik.info
 [IPv6:2001:19f0:7000:8404:5400:ff:fe00:d7d6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3AE10E47E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 18:43:05 +0000 (UTC)
Received: from [192.168.10.7] (unknown [10.0.12.132])
 by kozue.soulik.info (Postfix) with ESMTPSA id 61E44300258;
 Wed, 30 Aug 2023 03:37:34 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 kozue.soulik.info 61E44300258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=soulik.info; s=mail;
 t=1693334257; bh=yOYePFpwm5ZzdbszBaU2W/RV218+8lz1ZgrFpNPjUgU=;
 h=Date:To:Cc:From:Subject:From;
 b=TsPfpgtU7CNa8beVINNHGx/Frhm1eXOD/mEsYtloovBWB8/rSj+sMdyZvmZyGiJ2Z
 VA2ffYx30DSohh1CLRIj0+lUQx4NVYaV3pZMxhOEkMwO0kbKbstLS2MfcsHWihcg7C
 aX32ZyPHLkhIBb0xLgYjfQunyWz6Hbj9UcHwiI3I=
Message-ID: <f00d2249-df05-a469-52cd-8a81314a38d3@soulik.info>
Date: Wed, 30 Aug 2023 02:37:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: contact@emersion.fr
From: Randy Li <ayaka@soulik.info>
Subject: Allocation Constraints
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
Cc: Hsia-Jun Li <Randy.Li@synaptics.com>, daniels@collabora.com,
 dri-devel@lists.freedesktop.org, Tomasz Figa <tfiga@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello emersion


Since you told me the presentation in XDC 2020, I was thinking what we 
need  for the video codec hardware, I don't have much experience with 
the situation that presentation addressed, sharing between GPU.

I think we must cover the case with and without IOMMU attached to the 
device, besides some page layout information. I would talk it later.


About the pitch(in v4l2, it is bytesperline, or stride in some 
hardware), I think it would indicate three types, one is the menu(a menu 
of N choices), one is integer(ranging from minimum to maximum inclusive).

The menu type could cover the most of cases with a fixed cache 
line(likes 16, 64, 256 bytes alignment). While the integer type covers 
those do no care about cache line, the restriction is about hardware 
desired size, codec hardware could hardly meet this, usually they need 
to meet the requirement of CU or MB from a codec. This also enables the 
padding for vertical direction which could be regarded as the padding 
bytes behinds a plane.

Still it can ___not _ describe the case happening in Rockchip vdpu34x 
for HEVC and VP9,  which requests an odd cache line. For example, if the 
width is 256 (8bit depth) and cache line is 256 bytes as well, the pitch 
would be 256 bytes, when width becomes 512, the pitch should be 768 
bytes. You could learn this from Rockchip MPP rkv_hor_align*();


In study 2, Local memory, codec has the similar requirement but 
difference. Is it GPU internal having different regions for 2d texture, 
3d texture and shader? The non-cache or cached memory (coherence) is 
also cared by codec sometimes, while the most cases the user could 
decide that by whether CPU need to access that buffer.

While, the constraint need to tell its capability about whether it 
supports accessing an secure buffer.


Let's back the IOMMU topic, this feature is not mandatory for the codec. 
And we would like to get rid of M variant pixel formats from V4L2. For 
the hardware doesn't support scatter list, it may have delegated  
registers for each plane.

address type: scatter list or one address

relationship with the previous plane: compact(right after the last byte 
of the previous plane), new page(plane would start in the beginning of a 
page), or None(it has a delegated  register)

page size: this only applied for sgl address type, hardware may need a 
larger contiguous page.


To make a summary what I think we need here:

1. Alignment requirement for vertical direction

2. whether the device supports scatter list

3. what is the page size if the device would support iommu

4.  plane layout in memory


Sincerely

Randy Li



