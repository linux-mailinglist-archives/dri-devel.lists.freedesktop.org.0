Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416D8405A74
	for <lists+dri-devel@lfdr.de>; Thu,  9 Sep 2021 17:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A906E6E8A5;
	Thu,  9 Sep 2021 15:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3541A6E8A5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Sep 2021 15:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Subject:References:Cc:To:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uwZkGDe+5yKUNrBX24pEyL/TFCLpIwoT4rE5dF+jo9Q=; b=R6+gKJvEWq5xj0o2GwdFVFdGgr
 9ujtFg02VpVABYtSj1TKtBQfOOSp0HbJePYERRYAcgg6x6rMR4KxKavPzAwCk+JHpeYe8rkBM2d1S
 cCjeFCUsmdJu4j9kozpED3Gt9PsvFKcSXokJOVteEffE/2WCy2U6EdscAI1DDQAsi/wC5SVnJjvvx
 K5BKf+Z1AdHq1NAdDZBdnFgerfV5qZr8syfGd7extn3SHY60xXCgRkb4o0/mZQY9Ck05DPZ65UFcX
 9USVju7taOb2+U8v5QubsB30NsHwojaILxcVi5vfGwWAAE8RMv3Ycv62J1tLvH8+vlFNkI3v3BEyl
 lK10fUEg==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60364
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1mOMLz-0001BY-VF; Thu, 09 Sep 2021 17:52:43 +0200
To: sam@ravnborg.org
Cc: airlied@linux.ie, bp@alien8.de, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, hdegoede@redhat.com, hpa@zytor.com,
 javierm@redhat.com, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mingo@redhat.com, mripard@kernel.org, pbrobinson@gmail.com,
 tglx@linutronix.de, tzimmermann@suse.de, x86@kernel.org
References: <YS+Lhz9gg/0Caa+0@ravnborg.org>
Subject: Re: [RFC PATCH 0/4] Allow to use DRM fbdev emulation layer with
 CONFIG_FB disabled
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <2527f0ef-dae1-9ad5-84a4-00712c44940d@tronnes.org>
Date: Thu, 9 Sep 2021 17:52:40 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YS+Lhz9gg/0Caa+0@ravnborg.org>
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


> Hi Daniel,
>
> >
> > I think for a substantial improvement here in robustness what you really
> > want is
> > - kmscon in userspace
> > - disable FB layer
> > - ideally also disable console/vt layer in the kernel
> > - have a minimal emergency/boot-up log thing in drm, patches for that
> >   floated around a few times
>
> I assume you refer to this work by David Herrmann:
> "[RFC] drm: add kernel-log renderer"
> https://lists.freedesktop.org/archives/dri-devel/2014-March/055136.html
>

There's also this:

[PATCH v2 0/3] drm: Add panic handling
https://lore.kernel.org/dri-devel/20190311174218.51899-1-noralf@tronnes.org/

Noralf.
