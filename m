Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A91C6B295AD
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 01:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF65389854;
	Sun, 17 Aug 2025 23:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="42P7GHLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D689854
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Aug 2025 23:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=tQ6JTLQMp2lR9NVHV9PDYYFAuOFYRhhA8Cv5cdwQMG8=; b=42P7GHLnb1HcEdW46TQscblVdb
 8TQOeoh+DtnGTrfD8r0eaSLOB5rIwdFUGplFEmbyyVueFQ9/1giVKuCjw2ErxPOSg/cXJtFRZxnce
 02b0/kVzvcrke/Y2rF7BGTJxnQ+vAM9Q9t1jybAFa+p09FMJ0U7bV4iUyv5Wn/cH1zIsAs7vL+qmS
 qsGr2stCUIzcqUwG4x1mKK+p1j/ydcu2vMEytq5ZBMGpCKLh3SRt0ECu3d9D0zjCQIH8tZki5MCfz
 yhSDZbr3ea3Rqhh5vQiQu7lGcfdYWFUfgUKGAR4l0568zPokrPMypaBqXkN0MiR8DJJkSPw0bToy9
 m/K/AJkw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1unmjL-00000006A6h-1wVw; Sun, 17 Aug 2025 23:24:03 +0000
Message-ID: <fefba786-57d4-4138-9454-7cd3d924239d@infradead.org>
Date: Sun, 17 Aug 2025 16:24:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/gpuvm: Wrap drm_gpuvm_sm_map_exec_lock() expected
 usage in literal code block
To: Danilo Krummrich <dakr@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Documentation <linux-doc@vger.kernel.org>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Antonino Maniscalco <antomani103@gmail.com>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Raag Jadav <raag.jadav@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20250709024501.9105-1-bagasdotme@gmail.com>
 <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aade485e-0880-4c68-9b37-d8a27dc122e3@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/9/25 12:37 AM, Danilo Krummrich wrote:
> On 7/9/25 4:45 AM, Bagas Sanjaya wrote:
>> Stephen Rothwell reports multiple indentation warnings when merging
>> drm-msm tree:
>>
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2445: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2447: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2451: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2452: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2456: ERROR: Unexpected indentation. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2457: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2458: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>> Documentation/gpu/drm-mm:506: ./drivers/gpu/drm/drm_gpuvm.c:2459: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
>>
>> Fix these by wrapping drm_gpuvm_sm_map_exec_lock() expected usage
>> example in literal code block.
>>
>> Fixes: 471920ce25d5 ("drm/gpuvm: Add locking helpers")
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Closes: https://lore.kernel.org/linux-next/20250708192038.6b0fd31d@canb.auug.org.au/
>> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> 
> I assume this has to go through the MSM tree?
> 
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> 

Hi,
What's happening with this patch?
It was posted about 6 weeks ago and the build warnings
are still in mainline (6.17-rc2).

thanks.
