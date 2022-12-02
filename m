Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F046406B1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 13:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7381810E0CA;
	Fri,  2 Dec 2022 12:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EED10E0CA
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 12:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Goos7h1txFFVlYtk5+lVhvf2k4pyk3ADIcTiJ5dO1/E=; b=HQsorja1Agklr//cWSfZ7lK9GW
 ICsLaMcJgjKpoeoeOg4+Kd/qp+WG6Hdu4XiOZduiKEmuemmgfvYaKQutuxVJKkQytJ941oSvXRzc2
 5Wpm7IoMFa6EfsjMFwX6S7vhFTQnYIbCeWVa5EcWZejT9aHU8Mcf9RuhCahS35etDtP/ZC+hnafXu
 zNc8HssRZ3iPsPGl+U9XTut7d1kTWT2VWnmtaJMFUJ6jNn913lWuHqizUeXPaRZ6Q3lRwW4hxk/UC
 /6gE/SkUBHiCa99jReNHuqUHWHABBcRJQmrkqHNiBWK6+fR/alEeDF2qd4nqAwX+uu42hZNaShY27
 QG9op8qQ==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=63984)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1p153d-0001jo-3j; Fri, 02 Dec 2022 13:22:21 +0100
Message-ID: <c6afdf2a-ef58-d5fd-9f99-b61c9e38d471@tronnes.org>
Date: Fri, 2 Dec 2022 13:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/8] drm/mipi-dbi: Prepare framebuffer copy operation in
 pipe-update helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-6-tzimmermann@suse.de>
 <4e1b19de-04b1-3fa5-6aaa-72a4ad694b64@tronnes.org>
 <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
 <7916346d-a3bb-3027-6598-ea6455b6a81b@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <7916346d-a3bb-3027-6598-ea6455b6a81b@suse.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 02.12.2022 12.50, skrev Thomas Zimmermann:
> 
>>>
>>> You use drm_gem_fb_vmap() in the other places but here you access the
>>> object directly (and in the next hunk), but again not so important since
>>> it goes away in a later patch.
>>
>> I'll update this patch to use drm_gem_fb_vmap() consistently.
> 
> And after looking at the impact and churn, I rather go with the existing
> code that initializes from the GEM DMA object.
> 
> Noralf, is there a reason why most of MIPI DBI uses DMA helpers? In
> terms of flexibility and resource consumption, wouldn't SHMEM helpers be
> a better fit?
> 

The SHMEM helper didn't exist at the time. The SPI subsystem doesn't
have an interface for scatter/gather transfers and DMA is needed in
order to run at full speed. SPI does convert an is_vmalloc_addr() buffer
to an sg list of pages in spi_map_buf() so it solves the missing
interface that way.

I have never tried to pass a shmem buffer to spi_sync() so I don't know
if it works, but I guess that it will work.

Bare in mind that theses buffers are at most 400k in size so I'm not
sure there's much to gain in term of resources at least.

Noralf.
