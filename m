Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 914197AD5B0
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 12:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E6B10E16E;
	Mon, 25 Sep 2023 10:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5701E10E16E
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 10:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695637027; x=1727173027;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=B76e3ZmXnZKpaqSyIwgPnXYml4zt1AkESheKK1J1l7k=;
 b=cD+UX2WgfbokUspfcb7pbLm+RO1Cpiwh8Zem1XRO3wJ4woqZZYJyeLcE
 0J3EfvH13qWd7hD/PZ8Ufg4EvIEgrKhkVFPzXfvwjfrG22MsA1Ma/0oOs
 VxQCZch0/+apG8YRxfMuWA1Fvz34fWZEm51x2LlWm+1O0JHqMFzH8Ikbh
 VtYkAKFvgNrWSIgrZR3xpWYzMXwaW4H4YaCF9PLaMl1rroVlANY+zyGfk
 LpS8666aiWKs0GnmMfu0AjDoY61P5ELjoWWHWQxN8ngEKDNAiQcK0YOri
 7qjmtXNcPFz92kNKXRw4l7nVV2A8P/Me6qcMO+YWh4lf1PdfvB/jua1lx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="361471978"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="361471978"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 03:17:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="818559416"
X-IronPort-AV: E=Sophos;i="6.03,174,1694761200"; d="scan'208";a="818559416"
Received: from smgotth-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.46])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2023 03:17:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun Mani J <J.ArunMani@proton.me>, dri-devel@lists.freedesktop.org
Subject: Re: Development of custom virtual monitor
In-Reply-To: <LneaADrt-thjT-QDSquor44L0ZPFATd58AVE4uUbkLCefwa4mFmjOvdPw6PVZAKMuG0meL_DMzXMPZuz7i6XXqDks27o-A4u-JSCir6IwGw=@proton.me>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <LneaADrt-thjT-QDSquor44L0ZPFATd58AVE4uUbkLCefwa4mFmjOvdPw6PVZAKMuG0meL_DMzXMPZuz7i6XXqDks27o-A4u-JSCir6IwGw=@proton.me>
Date: Mon, 25 Sep 2023 13:17:03 +0300
Message-ID: <87cyy6o8v4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Mon, 25 Sep 2023, Arun Mani J <J.ArunMani@proton.me> wrote:
> Hey all
> I would like to develop a virtual monitor, regarding which I need help. The situation is, I need to design a virtual monitor and make it a top-level window. I should be able to move windows to this monitor, render them and do other things which can be done in a physical monitor.
>
> Of course, X11 and Mutter provide APIs to create virtual monitors. but I want it to be as DE independent as possible. So I'm looking for a low-level solution which might interface with the Kernel to act as a universal virtual monitor.
>
> The closest I can get to is DRI and KMS. But I'm stuck on how to take it forward as in how to fake this entire scenario.
>
> My assumption of the situation is like, I create a file in /dev that signals "plugging-in" of a monitor, which makes Kernel load my custom driver. Window managers, DRIs write to this file, as in write the data to be shown on the monitor and my driver would take care of rendering those data on a top-level window. But I think, this won't be that easy...
>
> This is similar to a virtual machine, but I just want to emulate a monitor than a processor or so.
>
> Any pointers and documentation regarding this is highly appreciated. Yes, I'm new to such kinda stuff but I'm ready to invest time and learn :)

Maybe look into drm/vkms [1][2].


BR,
Jani.


[1] https://docs.kernel.org/gpu/vkms.html
[2] https://docs.kernel.org/gpu/drm-uapi.html#using-vkms-to-test-drm-api


-- 
Jani Nikula, Intel
