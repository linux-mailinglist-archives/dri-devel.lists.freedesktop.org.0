Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62541C9CA94
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 19:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B95AC10E693;
	Tue,  2 Dec 2025 18:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ftGOcnAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com
 [91.218.175.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E5210E6A1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 18:36:54 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1764700612;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/daahefy1tziCXh8rTYQKwXMLI9Q8fbfkXdYGxbLymQ=;
 b=ftGOcnAtb7rEwvHSSaaZRAO+AOQgEOurnOKBtmTodsWO6JSY5m4ELSaUaLb3QvmB3Hg/zk
 BCYA7h/gq9CLtke1aSUTUXoYJVv+0KP20C577EP/At6w4zQNSlNgeNykAbMmaebxY3wpR7
 6xbWczWt2V6XEa+3RryqlGgsHFMPMDY=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH] fbdev/pxafb: Fix multiple clamped values in
 pxafb_adjust_timing
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
Date: Tue, 2 Dec 2025 19:36:17 +0100
Cc: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Raag Jadav <raag.jadav@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <C3FDBCE7-14D9-4999-B463-C2E3E384E7DB@linux.dev>
References: <20251202181600.511166-2-thorsten.blum@linux.dev>
 <a7213b69-f6ae-4975-8c8b-2783dbe9f9b3@gmx.de>
To: Helge Deller <deller@gmx.de>
X-Migadu-Flow: FLOW_OUT
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

On 2. Dec 2025, at 19:28, Helge Deller wrote:
> On 12/2/25 19:15, Thorsten Blum wrote:
>> The variables were never clamped because the return value of clamp_val()
>> was not used. Fix this by assigning the clamped values, and use clamp()
>> instead of clamp_val().
>> Cc: stable@vger.kernel.org
>> Fixes: 3f16ff608a75 ("[ARM] pxafb: cleanup of the timing checking code")
>> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
>> ---
>>  drivers/video/fbdev/pxafb.c | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Thanks for the patch!
> It looks good, so I'll include it in the fbdev tree.
> Out of curiosity:
> How did you notice? Do you actually have the hardware and tested it?

I only compile-tested it.

I stumbled upon another driver with the same bug and then used grep to
search for other instances and found about 6 or 7, including this one.

Thanks,
Thorsten

