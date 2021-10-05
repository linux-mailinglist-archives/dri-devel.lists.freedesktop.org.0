Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE004223FC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688476EB4A;
	Tue,  5 Oct 2021 10:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A6346EB49;
 Tue,  5 Oct 2021 10:58:17 +0000 (UTC)
Date: Tue, 5 Oct 2021 12:58:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1633431495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAHyHaCinhZOdFYftqM/89jjw8Xeb/kKScWi7LzzlI8=;
 b=U2ELsyEDWyZbSCrQT/hgnQ5U4NTrq71BGEqvytE3wnGYgZ/s18tjf2dofTb4V7/ozzFAWh
 zdO6LrdWDgNj0/vwzTHdmUupbkf6OUJACTCrp/gPmpOrJzTmriRHfbEDihiD0RPKTyAn0B
 9WRXsbQH0o3MZft46kz9SbpYp+IubU2E/mmz+6XlLLysaupjdoMy6yYCCUnonLNhJ8XBFq
 jtA2uCGmFK9KOW6S1VWUiOETEwfY9XYMaIotOJa2rCGXyUYrDOfeFyim56a03+jgsu23u/
 AsOo/FSc852XWrzQ8FUeRILjdQ851u5AMpDEhvaRILqbtIeyociSRFXfTj+pkQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1633431495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vAHyHaCinhZOdFYftqM/89jjw8Xeb/kKScWi7LzzlI8=;
 b=g4Y4EoJxBIvKJ4cf43bbj9qy5+5cEtk9ao1qxiHnuFq7XwgzpWiFZ7MaWC40tb6D+VDzDu
 A1Y9ZqHXicVuF2Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 john.c.harrison@intel.com, Thomas Gleixner <tglx@linutronix.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH 25/33] drm/i915/guc: Support request
 cancellation
Message-ID: <20211005105813.bgvfjebrizta7tzx@linutronix.de>
References: <20210727002348.97202-1-matthew.brost@intel.com>
 <20210727002348.97202-26-matthew.brost@intel.com>
 <2a417f11-050a-2445-d5e9-38fe354402f2@intel.com>
 <20211005070656.25xszayci52wqe7h@linutronix.de>
 <c43aa0a4-0f3a-e9cd-2221-0f3ce3019421@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c43aa0a4-0f3a-e9cd-2221-0f3ce3019421@linux.intel.com>
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

On 2021-10-05 11:13:16 [+0100], Tvrtko Ursulin wrote:
> Needs this fix:
> 
> commit d576b31bdece7b5034047cbe21170e948198d32f
> Author: Matthew Auld <matthew.auld@intel.com>
> Date:   Fri Sep 24 15:46:46 2021 +0100
> 
>     drm/i915: remember to call i915_sw_fence_fini

Thanks, works. Needed a tweak since it does not apply as-is.

> But in the fix we forgot to add:
> 
> Fixes: 62eaf0ae217d ("drm/i915/guc: Support request cancellation")
> 
> So not sure if it will appear on it's own. Adding Joonas and Rodrigo for
> maintainer level help.
> 
> Regards,
> 
> Tvrtko

Sebastian
