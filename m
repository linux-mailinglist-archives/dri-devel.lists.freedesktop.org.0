Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA0C405AE3
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 18:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14546E8B7;
	Thu,  9 Sep 2021 16:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E306E8B7
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8fM6t+CZ3TSxl0jBQrfAnRu3bSUr2tc6gGURbxgCLUE=; b=bBMePvtXPp4cKRU4T+oMuLswT2
 dt1suHpjoK6DJwdogL2e0UPXWwhm27R1p3yJQcnovDCNgpw8xIhlsDv+GZozryPolrukMuKgpt+eB
 nvElMCPOqCPCt4nCzA+9k60oM9h6czLRJ1kMaM8A6nXFiCqt9IgtTwS6n2dmhY8K7q8r3L2sdFrRf
 OlcP5FW5vXrKjJFD9fjnRKbebaZgmDIyWotaxBFDqBLXJrJIGZBZH30bAxCYD1GVzbUcTEzCnyDh8
 a9WElTR2qa8BGnfjA07wpjgdrgiXOtQR7/Yyjqz3zgu7V6PYfRwhtOpQDvye4B5oCdpRds17Fevvc
 LKna/I2A==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:49957
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mOMtG-0002FB-Ip; Thu, 09 Sep 2021 18:27:06 +0200
To: noralf@tronnes.org
Cc: airlied@linux.ie, bp@alien8.de, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, hpa@zytor.com,
 javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mingo@redhat.com, mripard@kernel.org, pbrobinson@gmail.com,
 sam@ravnborg.org, tglx@linutronix.de, tzimmermann@suse.de, x86@kernel.org
References: <2527f0ef-dae1-9ad5-84a4-00712c44940d@tronnes.org>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <ff6a590e-19ee-b2b6-bed5-236962637418@tronnes.org>
Date: Thu, 9 Sep 2021 18:27:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <2527f0ef-dae1-9ad5-84a4-00712c44940d@tronnes.org>
Content-Type: text/plain; charset=utf-8
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


> > Hi Daniel,
> >
> > >
> > > I think for a substantial improvement here in robustness what you
really
> > > want is
> > > - kmscon in userspace
> > > - disable FB layer
> > > - ideally also disable console/vt layer in the kernel
> > > - have a minimal emergency/boot-up log thing in drm, patches for that
> > >   floated around a few times
> >
> > I assume you refer to this work by David Herrmann:
> > "[RFC] drm: add kernel-log renderer"
> > https://lists.freedesktop.org/archives/dri-devel/2014-March/055136.html
> >
>
> There's also this:
>
> [PATCH v2 0/3] drm: Add panic handling
>
https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/

And here's a DRM console example that was part of the early drm_client work:

[RFC v4 25/25] drm/client: Hack: Add DRM VT console client
https://lore.kernel.org/dri-devel/20180414115318.14500-26-noralf@tronnes.org/

Noralf.
