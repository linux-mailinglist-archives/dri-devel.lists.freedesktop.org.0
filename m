Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D43A870103
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C8B11209E;
	Mon,  4 Mar 2024 12:15:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QIoKzumz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208611209B;
 Mon,  4 Mar 2024 12:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709554507; x=1741090507;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=NOBPUIRjTkKdzyBxvXMtqy/Bmk6fNoVtdIUaHOWNOtw=;
 b=QIoKzumzVcOP3Qoh05KU58BzEvmFEcYqJAvTVcn4L4AvCKMR/fM7uKFx
 WX42rDKcORZLx3w/v2H1ncqXviF0eGzduOi6DVCWY32pGnioYS2AflsAY
 qaxIO9HKw/0z/QczRXi/hTbH5u9LEa6yxMwNXQJosNSbo9VQLOXS7ipOQ
 xeYoYd2vAbW/8YfLyAC2r3FXFCEihe3YjDCP6GTR0LCULbxtX7gdrRExa
 AExN2tgF7yN5dipGlpbu0Y5L6G410W5YnwD40I/9ryp86r5TFc8sC+p8G
 SvE0IB0ZoEzj0dG339cV5WsUdhjYH0Aj4T/lI0JpshlSCtaXzryo20ZD6 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11002"; a="4619192"
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="4619192"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:15:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,203,1705392000"; 
   d="scan'208";a="9158028"
Received: from syakovle-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.51.3])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2024 04:15:04 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Timur Tabi <timur@kernel.org>, Duoming Zhou <duoming@zju.edu.cn>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] nouveau/dmem: handle kcalloc() allocation failure
In-Reply-To: <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240303081330.61091-1-duoming@zju.edu.cn>
 <CAOZdJXUebAScPBjJdCbdzzA_Hmotk11bd7MvLLxe+pqS5-upHQ@mail.gmail.com>
Date: Mon, 04 Mar 2024 14:14:52 +0200
Message-ID: <87y1ay42ir.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Sun, 03 Mar 2024, Timur Tabi <timur@kernel.org> wrote:
> On Sun, Mar 3, 2024 at 4:46=E2=80=AFAM Duoming Zhou <duoming@zju.edu.cn> =
wrote:
>>
>> The kcalloc() in nouveau_dmem_evict_chunk() will return null if
>> the physical memory has run out. As a result, if we dereference
>> src_pfns, dst_pfns or dma_addrs, the null pointer dereference bugs
>> will happen.
>>
>> This patch uses stack variables to replace the kcalloc().
>
> Won't this blow the stack?  And why not just test the return value of
> kcalloc?

VLAs should not be used in the kernel anymore. Building this results in
a warning due to -Wvla. See 0bb95f80a38f ("Makefile: Globally enable VLA
warning").

Error checking and propagation is the way to go.


BR,
Jani.

--=20
Jani Nikula, Intel
