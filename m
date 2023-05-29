Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E718714FA7
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 21:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 455C510E19F;
	Mon, 29 May 2023 19:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:402::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9564A10E127
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 19:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xwmlMtqlVAbaTkC5KPIaDaFug1I9apRWf/wLMNoERFk=;
 b=RcvTikbxSKYdsW5xUhTUWIYAnvCYFScqJry5K5MWANzd6G1RXDDas7mhH6lm7w4qQOiTHFht4TzLz
 5js/9j+NZ5n9fWjTNTqIAmGB+fdH5q6Kif5YlXpY/tufSsGjZH4SS8NURBpK0ToLSYxfnqJN0v3Wsq
 tI5Gn0rVa9orxKzI78akiccpOrIFBsnEaFJUOhf0SH/LC7w1NiZ++FY+1E6/bW9KH/YhuX2J0R7w4X
 Jerh7acE7tx93xyEw5ekP3Sa0FAexJ4c2WepNQNjkNgRIUf3uZSPQ0gtkPxK5ehinEkj65T2v8Kqcs
 Tb6Oo5QVKjkFNqIRuTJwrVu7lteW87g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=xwmlMtqlVAbaTkC5KPIaDaFug1I9apRWf/wLMNoERFk=;
 b=AnuLEmPdR4hRTdwshvfNg+hztUBftoiHcgOILegLU4HYH/zFHvMHV9HwFw03/fy7/qoD+85f81dvA
 6KfesBwDw==
X-HalOne-ID: 54b70415-fe56-11ed-8e9f-b90637070a9d
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3 (Halon) with ESMTPSA
 id 54b70415-fe56-11ed-8e9f-b90637070a9d;
 Mon, 29 May 2023 19:23:48 +0000 (UTC)
Date: Mon, 29 May 2023 21:23:47 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 02/13] fbdev: Add initializer macros for struct fb_ops
Message-ID: <20230529192347.GB1370714@ravnborg.org>
References: <20230524092150.11776-1-tzimmermann@suse.de>
 <20230524092150.11776-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230524092150.11776-3-tzimmermann@suse.de>
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 11:21:39AM +0200, Thomas Zimmermann wrote:
> For framebuffers in I/O and system memory, add macros that set
> struct fb_ops to the respective callback functions.
> 
> For deferred I/O, add macros that generate callback functions with
> damage handling. Add initializer macros that set struct fb_ops to
> the generated callbacks.
> 
> These macros can remove a lot boilerplate code from fbdev drivers.
> The drivers are supposed to use the macro that is required for its
> framebuffer. Each macro is split into smaller helpers, so that
> drivers with non-standard callbacks can pick and customize callbacks
> as needed. There are individual helper macros for read/write, mmap
> and drawing.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
I am not a fan of public functions/macros names __something.
But I see it used in so many places, so maybe it is just me.
And everything looks consistent, so OK.

With the white space issues fixed:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
