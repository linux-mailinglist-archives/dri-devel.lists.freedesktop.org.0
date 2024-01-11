Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFE0382B477
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 19:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9153410E969;
	Thu, 11 Jan 2024 18:05:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1918510E969
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jan 2024 18:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1SaNoseh6vJsc/nF+IbLxQ/M4CdkuGNWT5XaWYmBY8w=; b=eACA4YbApHb7EUsR7fHtThtdo4
 hf9ukczBJM7N6SBcQiBmDXSpQr8Zs6yVCvR4YbI9+kpotjN60dV8Dq6lxJNM0cqMzhDZe19tp+FwD
 mf32RdF6cG7obcp+Te7L5hhufAUeN5lF7lC9shds+wLVygr4itVWSacXJyJJMpaEBWlwqo88xITy/
 EgKgIApZgC3wVl4yxbZUH9HesfrpdCiWtec+N42Jgv5FAcFB3xo6iKoceZUpnbKg2fcBTU6cBsQW6
 Bo6Gw1NIaDpdfufQ/SLBxhfWRkNrn75KnOfFQM9IW2ElOJ1Yq6ABit/CXpnK3tK1mdJcxK3g5MXR1
 N5HLYirg==;
Received: from 189-68-200-18.dsl.telesp.net.br ([189.68.200.18]
 helo=[192.168.1.111]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1rNzQd-005UC7-T5; Thu, 11 Jan 2024 19:05:20 +0100
Message-ID: <984ea5d0-83fe-4739-ab71-e408a5e92d50@igalia.com>
Date: Thu, 11 Jan 2024 15:05:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: allow IN_FENCE_FD and FB_DAMAGE_CLIPS to be changed
 with async commits
Content-Language: en-US
To: Xaver Hugl <xaver.hugl@gmail.com>, Simon Ser <contact@emersion.fr>
References: <20240111165615.27587-1-xaver.hugl@gmail.com>
 <ID9ZgIO-0g8gNMKtaQFJTKRl5uh6UBgKViGwKB8634Pa4d6c8a-EQD4aaTiIbIqkqFiVChj4SLN2Ufs5PEF3F084HHLGn8gK-2-onYXES4g=@emersion.fr>
 <CAFZQkGx0jp2KmCaKOwRqORfAUMwwPkdSPfh_dMegXMu0ax2cyA@mail.gmail.com>
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <CAFZQkGx0jp2KmCaKOwRqORfAUMwwPkdSPfh_dMegXMu0ax2cyA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em 11/01/2024 14:59, Xaver Hugl escreveu:
> Am Do., 11. Jan. 2024 um 18:13 Uhr schrieb Simon Ser 
> <contact@emersion.fr <mailto:contact@emersion.fr>>:
> 
>     Are we sure that all drivers handle these two props properly with async
>     page-flips? This is a new codepath not taken by the legacy uAPI.
> 
> I've only tested on amdgpu so far. Afacs the other drivers that would need
> testing / that support atomic and async pageflips are
> - i915
> - noueveau (though atomic is disabled by default, so maybe it doesn't 
> matter?)
> - vc4
> - atmel-hlcdc
> 
> The first two I can test, the latter I don't have the hardware for. I 
> don't know if I can
> extensively test fb_damage_clips either / how I'd even know if it's 
> being applied
> correctly, but in the worst case I'd expect the driver to not do the 
> optimizations the
> property allows.
> 
> As an alternative to this, would it be okay to expose a driver hook for 
> optional
> driver-specific checks that drm_atomic_set_property can delegate to, and 
> only
> allow this with the properties and hardware that's been tested? Then more
> properties (like cursor position changes on amdgpu) could be easily 
> added later
> on too.

I'm working on some mechanism to allow overlay planes on amdgpu, and I 
think I can add your needs to it. I'll share in the mailing list when I 
have something more concrete.
