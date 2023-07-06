Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4326574A351
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 19:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067310E485;
	Thu,  6 Jul 2023 17:43:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BB910E483
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 17:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=bp7torwHPDd5eLPJe0WGi7efdWJvnoEKvs296k74Pf0=;
 b=aXlfRn9oO/QjRv5h6ryHLEbKiV2TMQyffeHBSueAJ3fOaseobTu/Yj0qttWfaNPaEVHIHc97AKiE0
 ZgUPPZYnOmJYhvL4cpu+0duR9V4dkBIuVV7DSEN6IPkKr43Jc1V0VGvyrww3zzgxgztg4SSmbpyFp/
 FilYpIFVVKTv5XR36vyeFv1lhAN5JOmsQtkzh9zRe78uK3yOHALj3gaTOzHl84YHf1toy5Q90EGJOf
 esNH3n1+/byr3aI0nldBXYnNZTX88SlOkxjRvZIokktgTxLpSrYGSD+v3eud6qaPYRh+4O/T6AgWNZ
 +uvWDqRctl69cF0T9JcxK28CbN5aFyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=bp7torwHPDd5eLPJe0WGi7efdWJvnoEKvs296k74Pf0=;
 b=KZJrKC62SkbFOADYDfY2lTdet1592aTNhxb5/yVQSoMLhFd9jWNHmPN6GyCzA4P16zXfNSBF7YZny
 mqKXCMkAA==
X-HalOne-ID: 950f486c-1c24-11ee-b2ac-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 950f486c-1c24-11ee-b2ac-6f01c1d0a443;
 Thu, 06 Jul 2023 17:43:16 +0000 (UTC)
Date: Thu, 6 Jul 2023 19:43:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 00/10] fbdev: Generate deferred-I/O helpers
Message-ID: <20230706174315.GB226645@ravnborg.org>
References: <20230706151432.20674-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230706151432.20674-1-tzimmermann@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, deller@gmx.de, javierm@redhat.com,
 linux-fbdev@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jul 06, 2023 at 05:08:43PM +0200, Thomas Zimmermann wrote:
> Generate the I/O callbacks for drivers with deferred I/O. As in
> the old, opencoded functions, the generated functions operate on
> system memory and trigger damage handling if necessary. Also bring
> the drivers' Kconfig options up to date.
> 
> Generating and initializing via helpers macros will later allow for
> a fine-grained setup, depending on Kconfig options. For example, it
> will be possible to leave out file I/O if FB_DEVICE has not been set.
> 
> Thomas Zimmermann (10):
>   fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
>   fbdev/broadsheetfb: Generate deferred I/O ops
>   fbdev/hecubafb: Select FB_SYS_HELPERS_DEFERRED
>   fbdev/hecubafb: Generate deferred I/O ops
>   fbdev/metronomefb: Select FB_SYS_HELPERS_DEFERRED
>   fbdev/metronomefb: Generate deferred I/O ops
>   fbdev/ssd1307fb: Select FB_SYS_HELPERS_DEFERRED
>   fbdev/ssd1307fb: Generate deferred I/O ops
>   fbdev/xen-fbfront: Select FB_SYS_HELPERS_DEFERRED
>   fbdev/xen-fbfront: Generate deferred I/O ops

Browsed the full series - nice reduction in complexity all over.
Everything looked good so:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
