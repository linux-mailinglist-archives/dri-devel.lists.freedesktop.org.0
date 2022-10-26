Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D060DF75
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 13:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE3810E4A7;
	Wed, 26 Oct 2022 11:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DBC610E4A7
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 11:24:30 +0000 (UTC)
Received: from [192.168.2.190] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C977E6602534;
 Wed, 26 Oct 2022 12:24:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666783467;
 bh=lCFwG51qgOU7nP/LILNhxiwyDR4ncmY4dkzi9tBswKo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cIAOxZGvT1YJAYDEvRQb19BsPgj6XPI1pd+Dnh8eKuQgEzeCUe8ZUh7n4eNOqL1Yr
 wZN4GwbZ8qP9lYBT8HLwLl+Ti1IZrXh6sNajhyjtFTpymkFAUoQ8TPA9/+3NONB0Nq
 qbC2EqZKTBCdK0qUKmdqNFD0Y+UZBWwm88FB8oXyivVNDy0g+emjGpREdXA7LNEVOZ
 kMNdQ8RxiGmPlrq4jRPCRu99GY0klwgd2PmcoG4r+g4N8uhYOoHuHDE+wAD8PV42Fi
 3Jn0kaUWkZKh/Db5hEms4Y83L3ZNHhmhiWm0kul+Auc6ZZk2MjFbT4KWmcbcLO94wW
 vW9kEm4v6cqug==
Message-ID: <514fa15a-b039-2f84-1be8-b881fee72235@collabora.com>
Date: Wed, 26 Oct 2022 14:24:23 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [bug report] drm/gem: Add drm_gem_object_funcs
To: Dan Carpenter <dan.carpenter@oracle.com>, noralf@tronnes.org
References: <Y1kFEGxT8MVlf32V@kili>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <Y1kFEGxT8MVlf32V@kili>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/26/22 12:59, Dan Carpenter wrote:
> Hello Noralf Trønnes,
> 
> The patch b39b5394fabc: "drm/gem: Add drm_gem_object_funcs" from Nov
> 10, 2018, leads to the following Smatch static checker warning:
> 
> 	drivers/gpu/drm/drm_client.c:240 drm_client_buffer_delete()
> 	warn: variable dereferenced before check 'buffer->gem' (see line 238)
> 
> drivers/gpu/drm/drm_client.c
>     234 static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>     235 {
>     236         struct drm_device *dev = buffer->client->dev;
>     237 
>     238         drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>                                         ^^^^^^^^^^^
> Unchecked dereference inside function call.
> 
>     239 
> --> 240         if (buffer->gem)
>                     ^^^^^^^^^^^
> Too late.  I don't honestly, know why this warning is only showing up
> now four years later.  Perhaps Smatch thought buffer->gem was always
> non-NULL before but now it's not sure.  I've added Dmitry to the CC list
> because he seems to has been working in this area recently and might
> know what's going on.

This is a valid bug. Before my changes drm_gem_vunmap() wasn't touching
buffer->gem when buffer->map=NULL, now it will. I'll prepare the fix,
thank you for the report.

-- 
Best regards,
Dmitry

