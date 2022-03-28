Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68CA94E9B20
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 17:30:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195E210ED16;
	Mon, 28 Mar 2022 15:30:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB6E10ED16
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 15:30:31 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id bi12so29519578ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p3XuvSz9El6nko432TGNXkjhObeuwCH/Ie6ye/gIxy8=;
 b=IIz4FdV0mOAafEMr4USQHNy+IBB8W1SLxNvpY/qmwe2L60jIkh+BtkZhRLusE+9byJ
 VVOGC3zinYbOUHGmsCd3rVC2X3mzOikYzWwgTARQiJoLNejLG6UtsmsOLYNWwa5xebSl
 LNl2I+j4OF8XLi8+9lnxeCIEzt7rAW/BtqIbKaPUf0iApZt76Mbpehd2wRQJCk5yR+QI
 8NZpda1g8E03N2qz7Oh7iXrTozXwVZMMJ3MgtA6bpR25EguMNLOn8u0iMynemdSUOket
 6XSWVQ87FGvnAm7+rdyebHF81x9Q1Xf03LzPHMmJiMMQqQsFNEYlNbGAWHzzK9cZeSNW
 3Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p3XuvSz9El6nko432TGNXkjhObeuwCH/Ie6ye/gIxy8=;
 b=cxz6LPTQBHszqa6Kj1wtSwkyf9Ew3ZX6gu4NtXKAd6veQjxBU2+Qoa0nOrBlX7AdNg
 X0V4bD09Nx8IojgJ+48KF/dtic73apRCsWrVITNbjySUwUYfxZWln/4SxX+fxQlDySRk
 9U/jhQmLgqJMjN3OGAW5iYgStBMIMikdWM8XeJk1fxc258qO0TBGfGEjbTS5eyN2GLIJ
 hXzPL9W4NNXD2E/0/cGM3rWsqgTXzM5Z22DxTl3MGOae6935D5wZnxBuCcXDDENMK3NW
 SjpWCCUCgCHF6gYkLOsBD+rX553kdWfyNu4fRkELGhQ2BOJ9RbNANjBlaztj71azHP1Z
 UlVA==
X-Gm-Message-State: AOAM530NsNruObVW1RGw3NiSdNGgMbibkzpR5m+l1OfrW1RIkOsKqHJ4
 yxqioE6Pr9d7ahMQnpbzM9A=
X-Google-Smtp-Source: ABdhPJzTNnMXRuknjU+f0aWqPcOk/WgtWC3qwlzaCIcEolJcpttqYGy3tEe+3vYytAaiM+K47vsWvQ==
X-Received: by 2002:a17:907:d02:b0:6e0:4f1d:7ab1 with SMTP id
 gn2-20020a1709070d0200b006e04f1d7ab1mr27848220ejc.716.1648481430084; 
 Mon, 28 Mar 2022 08:30:30 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
 by smtp.googlemail.com with ESMTPSA id
 bx5-20020a0564020b4500b00418fca53406sm7022210edb.27.2022.03.28.08.30.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Mar 2022 08:30:29 -0700 (PDT)
Subject: Re: [PATCH 0/3] drm: omapdrm: Fix excessive GEM buffers DMM/CMA usage
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
 <e126b6a7-5c34-66d5-d371-b2bae3b94924@ideasonboard.com>
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <653c8cf1-8644-f5cb-810e-81539a99d776@gmail.com>
Date: Mon, 28 Mar 2022 18:30:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e126b6a7-5c34-66d5-d371-b2bae3b94924@ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: tony@atomide.com, merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, airlied@linux.ie, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 28.03.22 г. 12:46 ч., Tomi Valkeinen wrote:
> Hi,
> 
> On 19/01/2022 12:23, Ivaylo Dimitrov wrote:
>> This patch series fixes excessive DMM or CMA usage of GEM buffers 
>> leading to
>> various runtime allocation failures. The series enables daily usage of 
>> devices
>> without exausting limited resources like CMA or DMM space if GPU 
>> rendering is
>> needed.
>>
>> The first patch doesn't bring any functional changes, it just moves some
>> TILER/DMM related code to a separate function, to simplify the review 
>> of the
>> next two patches.
>>
>> The second patch allows off-CPU rendering to non-scanout buffers. 
>> Without that
>> patch, it is basically impossible to use the driver allocated GEM 
>> buffers on
>> OMAP3 for anything else but a basic CPU rendered examples as if we 
>> want GPU
>> rendering, we must allocate buffers as scanout buffers, which are CMA 
>> allocated.
>> CMA soon gets fragmented and we start seeing allocation failures. Such 
>> failres
>> in Xorg cannot be handeled gracefully, so the system is basically 
>> unusable.
>>
>> Third patch fixes similar issue on OMAP4/5, where DMM/TILER spaces get
>> fragmented with time, leading to allocation failures.
>>
>> Series were tested on Motolola Droid4 and Nokia N900, with OMAP DDX and
>> PVR EXA from https://github.com/maemo-leste/xf86-video-omap
>>
>> Ivaylo Dimitrov (3):
>>    drm: omapdrm: simplify omap_gem_pin
>>    drm: omapdrm: Support exporting of non-contiguous GEM BOs
>>    drm: omapdrm: Do no allocate non-scanout GEMs through DMM/TILER
>>
>>   drivers/gpu/drm/omapdrm/omap_gem.c        | 198 
>> +++++++++++++++++-------------
>>   drivers/gpu/drm/omapdrm/omap_gem.h        |   3 +-
>>   drivers/gpu/drm/omapdrm/omap_gem_dmabuf.c |   5 +-
>>   3 files changed, 116 insertions(+), 90 deletions(-)
>>
> 
> I have pushed this to drm-misc-next.
> 

Great, next is VRFB and TE support for Droid4 panel, as soon as I find 
some spare time :)

Ivo

