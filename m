Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9FC576086
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jul 2022 13:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B4B18A0B9;
	Fri, 15 Jul 2022 11:31:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BFF18A0B9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 11:31:58 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-232.nat.spd-mgts.ru
 [109.252.119.232])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B2E96601A59;
 Fri, 15 Jul 2022 12:31:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1657884716;
 bh=5gXholk/OJLIMb+8T/W3VrYelE3nJJCZ9+44X7RhcbQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BfgLpVECPPJiheV9aVLNz0s1CedXyPtAmLr3IjXGC0QkurOgK6BtzIVnQboIpkA/9
 li5s7Av804ZTZq/rI4avLNZCEK3E3EQ2LPCYqcLqGC2C1KJcksp8+Ec9ymsm7zNFK1
 eT3lBH4wls4wYgWoSitUDO89/g8YOSfGGiXc9fIPLuTLKI324iYxZEV0DMf9Zbl4+/
 mYySebbpbwr15Bsg06RLWlIPYWVKW5V8HVdlbFf15EKA0J0saa5dg9WeUGNkyYNB6a
 AFyNeMB5E9qTmoT+gQ/zuA7J8SUBRwM02O0azOvic+nj18FnYFeOt3JoTziWbRGhai
 KdmcQLJMJZggA==
Message-ID: <fce378f2-50be-ac02-97b1-767e310f28a2@collabora.com>
Date: Fri, 15 Jul 2022 14:31:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20220715111533.467012-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/15/22 14:15, Christian König wrote:
> I've stumbled over this while reviewing patches for DMA-buf and it looks
> like we completely messed the locking up here.
> 
> In general most TTM function should only be called while holding the
> appropriate BO resv lock. Without this we could break the internal
> buffer object state here.

Could you please clarify which part of the TTM state is affected?

-- 
Best regards,
Dmitry
