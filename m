Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 79883638F6C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 18:56:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 597DD10E137;
	Fri, 25 Nov 2022 17:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8227810E137
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 17:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ihm+4EZctv3Rj2xHhr1TD8fCM0RyGi7dyrWLPLpLsjM=; b=lg2NqVrW7PiRKTcps/7McTHBbx
 jdNsZGjrWs+fu260K/68fpr7x0Wiu3JNGiKLwTFWXVLlcXkqr3JCSBKa+XDDFz4MXrkx+Axf3Frw3
 OJiGQsU7DYEvdzoDaZ9bE1RhV4XU6ZKGf97seabgyokhkRuDr0SwK9HxlfMBR5XJM97Oab1O9Szgt
 njZkRwaXWqY7exGXzWTwyOzW1HcG7s52wc1aXw+G8fISbUJBivGibXaqJEzO06NeSiOc85fUoxmbG
 Hh9JdgPv4Qnc/aV1Kfq+CE/Te1d86U+GzI/4M9JFu9xhs7i1P4StB3459pq6dhoN6Po4HnORQJwUl
 lTKNAt0A==;
Received: from [2a01:799:95e:1700:6395:ccbd:d000:d42b] (port=49469)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oycwJ-0004yB-2j; Fri, 25 Nov 2022 18:56:39 +0100
Message-ID: <a3dab256-ad95-d1ff-a425-0b1676a332a9@tronnes.org>
Date: Fri, 25 Nov 2022 18:56:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 8/8] drm/mipi-dbi: Move drm_dev_{enter,exit}() out from
 fb_dirty functions
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-9-tzimmermann@suse.de>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20221121104532.8301-9-tzimmermann@suse.de>
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
Cc: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 21.11.2022 11.45, skrev Thomas Zimmermann:
> Call drm_dev_enter() and drm_dev_exit() in the outer-most callbacks
> of the modesetting pipeline. If drm_dev_enter() fails, the driver can
> thus avoid unnecessary work.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Makes sense in order to make the code more readable, the other
*_fb_dirty call sites (*_enable) are already protected.

Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
