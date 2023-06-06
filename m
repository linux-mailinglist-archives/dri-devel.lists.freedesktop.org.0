Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1657972585F
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB5810E49B;
	Wed,  7 Jun 2023 08:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ECF10E36B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 14:35:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1686062111; cv=none; d=zohomail.in; s=zohoarc; 
 b=FoV90p8s7KGaX/AFXXGRhVbKUQdUKO2sbtjs5ppLjap3oUZw8CqU+N13Wg3aTYAqRPSZAi52hCdPoxdrkrOwiYQ5AzBPtnP7KBKbv8QXVhczksabmfWjJpcZdJ8NRP3SNi67eOCUejoRpbRx4e8Wxb/kgExij9EA8zBwObstuKM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in;
 s=zohoarc; t=1686062111;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=nhq6ObVRtO0F/91ipiCPjsG/qJ9zJ64B4gXqedyDihU=; 
 b=PjoWZh7AMGFCsBVZgB5ttbmU3/UHrqT7dv0aiYmOX0OhmemYaEErbOG3EjlW8rgKrHDQ/7zW/LztC/9GbkVrbn6V3JbMaX2TiwYXAHUn7+68S8Su7m+ClVcaPRysuB8hRgrn1/BV39vdyNbfVRBuAJHoaziuXXAb3MrZoluFTSg=
ARC-Authentication-Results: i=1; mx.zohomail.in; dkim=pass  header.i=siddh.me;
 spf=pass  smtp.mailfrom=code@siddh.me;
 dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1686062111; 
 s=zmail; d=siddh.me; i=code@siddh.me;
 h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=nhq6ObVRtO0F/91ipiCPjsG/qJ9zJ64B4gXqedyDihU=;
 b=ea4aSFICrqljBDAllkvvJUzxGaPmplAPZ2LzUC+BO7tT/ohYqTLT90xsiK+dbii2
 G+X3unpnzvNEFHfaUCzqdTkb2dSbphflmz6Gdhhk12QxbnLMaT8QSH3X1Jw+yqwY3Nt
 45IOMsAysJn4VEi895FZ3m3qQ2P5s7v40DmzhDXU=
Received: from mail.zoho.in by mx.zoho.in
 with SMTP id 168606207938986.73514266463042;
 Tue, 6 Jun 2023 20:04:39 +0530 (IST)
Date: Tue, 06 Jun 2023 20:04:39 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Message-ID: <18891219d8e.6a7d8f15119986.32609419593331086@siddh.me>
In-Reply-To: <20230606140512.GA5197@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <ae42791195a788bb77b3f9c2b87bca5d4e78cf83.1686047727.git.code@siddh.me>
 <20230606140512.GA5197@pendragon.ideasonboard.com>
Subject: Re: [PATCH v9 2/8] drm/print: Fix and add support for NULL as first
 argument in drm_* macros
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Mailman-Approved-At: Wed, 07 Jun 2023 08:45:25 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Jun 2023 19:35:12 +0530, Laurent Pinchart wrote:
> Hi Siddh,
> 
> Thank you for the patch.

Anytime :)

> On Tue, Jun 06, 2023 at 04:15:16PM +0530, Siddh Raman Pant wrote:
> > Comments say macros DRM_DEBUG_* are deprecated in favor of
> > drm_dbg_*(NULL, ...), but they have broken support for it,
> > as the macro will result in `(NULL) ? (NULL)->dev : NULL`.
> 
> What's the problem there ?

(NULL)->dev is invalid C. It's a macro, so preprocessor substitutes
that text directly, there is no evaluation. GCC will throw an error
regarding dereferencing a void* pointer.

> >  /* Helper for struct drm_device based logging. */
> >  #define __drm_printk(drm, level, type, fmt, ...)                     \
> > -     dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> > +({                                                                   \
> > +     struct device *__dev_ = __drm_dev_ptr(drm);                     \
> > +     if (__dev_)                                                     \
> > +             dev_##level##type(__dev_, "[drm] " fmt, ##__VA_ARGS__); \
> > +     else                                                            \
> > +             pr_##level##type("[drm] " fmt, ##__VA_ARGS__);          \
> 
> If I recall correctly, dev_*() handle a NULL dev pointer just fine. Do
> we need to manually fall back to pr_*() ?

I took drm_dev_printk (on line 261 of drm_print.c) as the reference,
wherein it uses a conditional for determining whether dev_printk or
printk should be called.

I suppose it is to avoid printing "(NULL device *)", which dev_printk
does if it gets a NULL device pointer (refer the definition on line
4831 of drivers/base/core.c). Though if I'm wrong, kindly let me know.

Thanks,
Siddh
