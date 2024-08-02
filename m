Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7B946090
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 17:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B103C10E173;
	Fri,  2 Aug 2024 15:33:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="R2+aNIIn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Fri, 02 Aug 2024 15:33:02 UTC
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E504310E173
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2024 15:33:02 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4Wb8nD4pX9z9tM7;
 Fri,  2 Aug 2024 17:26:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1722612384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IbiOHuuK++HVqf4Ly0K8XIOEOZLhizAbHkNRlvigC5k=;
 b=R2+aNIInlYHCHZ2caXa7mIUa0XaVi1NbbxC4Sc0k23Tv6Cd77LrKwMYv0HcLd/NPZT19h0
 V9gXA9vCM32XI7l0mJvMr1w4BDM8kRMXHt57HkNoGUzKjjxpvvj97tZg9p9kyrB43EBSQc
 RuJWYANqMDxRfmnYipbG//P2htyDtB4PXxwzS6GZSHdlESLPCf9MyEWyDbSu3byDG6PCJ+
 Uxf9f+ZerJEbGi/4e7nUpPelWnR4aaLy1nJPlIFsi9HrGNsS1oNPKB1U9as8Mnji9biv1e
 /LNTN9alkIvHiIOuO28LMNR6TEld0ugCOnrpPsnFyLKyzSKr3bz3xpCiQQtQ2Q==
Message-ID: <86d7ca9c-1493-474b-95d6-1e38b5703a67@mailbox.org>
Date: Fri, 2 Aug 2024 17:26:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] udmbuf bug fix and some improvements
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>, Huan Yang
 <link@vivo.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240801104512.4056860-1-link@vivo.com>
 <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: en-CA, de-CH-frami
In-Reply-To: <IA0PR11MB7185EDB259502BC6937CE566F8B22@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: jraeashjkoya6xgp7jomd86xn6cw6ttf
X-MBO-RS-ID: a8c9a5cf6cddf16cf40
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

On 2024-08-01 20:32, Kasireddy, Vivek wrote:
> Hi Huan,
> 
>> This patchset attempts to fix some errors in udmabuf and remove the
>> upin_list structure.
>>
>> Some of this fix just gather the patches which I upload before.
>>
>> Patch1
>> ===
>> Try to remove page fault mmap and direct map it.
>> Due to current udmabuf has already obtained and pinned the folio
>> upon completion of the creation.This means that the physical memory has
>> already been acquired, rather than being accessed dynamically. The
>> current page fault method only saves some page table memory.
>>
>> As a result, the page fault mechanism has lost its purpose as a demanding
>> page. Due to the fact that page fault requires trapping into kernel mode
>> and filling in when accessing the corresponding virtual address in mmap,
>> this means that user mode access to virtual addresses needs to trap into
>> kernel mode.
>>
>> Therefore, when creating a large size udmabuf, this represents a
>> considerable overhead.
> Just want to mention that for the main use-case the udmabuf driver is designed for,
> (sharing Qemu Guest FB with Host for GPU DMA), udmabufs are not created very
> frequently. And, I think providing CPU access via mmap is just a backup, mainly
> intended for debugging purposes.

FYI, Mesa now uses udmabuf for supporting dma-bufs with software rendering.


-- 
Earthling Michel Dänzer            |                  https://redhat.com
Libre software enthusiast          |         Mesa and Xwayland developer

