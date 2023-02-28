Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F79D6A62DB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 23:51:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B4210E0EA;
	Tue, 28 Feb 2023 22:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C929910E0E4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 22:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ad/nCy3QYwNE82dZF0t+Ohf8THrHnSKbacVaq4WhIkc=; b=jdKTYs7AkCQU+P0ABYaUqWAG4f
 5Hvb/K9176CKYE4dYWyGu098p2F13xXg81l9irHpbdimbCPfvEF5BBVGj+GUrch3Aeqjd7YslT1Ut
 mS4dq2vpk1XF/u9ZlI2AhWTZZzPe4GnFCVpKUBPPHNRwodJGfS5rgDthtSOEVm9trHZCBWMB4vOdi
 7a83efIcZn22EP1oPu9o+pffwFNYp52hK2fpqP+sAP74/RgIyRQ3yogKZ31MovWw8oiyFj50XTAm7
 5tR6JHiTd0VWmrAl5PuxMnzoXOUmwM/1TI0jgQ2k6sBvbz81cqjiTWd+dR9wSCCGkPyC57C4oe1Cu
 uf6pLhvQ==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pX8ov-000ipw-7W; Tue, 28 Feb 2023 23:51:41 +0100
Message-ID: <a516d3d0-f946-5853-e26e-d3a02cd05e4e@igalia.com>
Date: Tue, 28 Feb 2023 19:51:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 0/2] drm/vc4: Improve drm_gem_object handling
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>
References: <20230202111943.111757-1-mcanal@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20230202111943.111757-1-mcanal@igalia.com>
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

On 2/2/23 08:19, Maíra Canal wrote:
> Currently, the array of BOs that are lookup up at the start of exec is being
> instantiated as drm_gem_dma_object, which is not needed and makes it difficult
> to use the drm_gem_objects_lookup() helper. Therefore, replace
> drm_gem_dma_object for drm_gem_object and then replace obj lookup steps with
> drm_gem_objects_lookup().
> 
> v1 -> v2:
> 
> * Add André Almeida's Reviewed-by.
> 
> Best Regards,
> - Maíra Canal
> 
> Maíra Canal (2):
>    drm/vc4: replace drm_gem_dma_object for drm_gem_object in vc4_exec_info
>    drm/vc4: replace obj lookup steps with drm_gem_objects_lookup
> 
>   drivers/gpu/drm/vc4/vc4_drv.h      |  2 +-
>   drivers/gpu/drm/vc4/vc4_gem.c      | 78 +++++++-----------------------
>   drivers/gpu/drm/vc4/vc4_validate.c |  4 +-
>   3 files changed, 21 insertions(+), 63 deletions(-)
> 

Applied to drm-misc-next.

Best Regards,
- Maíra Canal
