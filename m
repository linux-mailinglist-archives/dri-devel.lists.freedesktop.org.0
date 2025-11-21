Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657E4C788E9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 11:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E16610E84D;
	Fri, 21 Nov 2025 10:39:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VmWMSom1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5C910E84D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UA5zKpGj6q/iFCQeu7osXCTGE0BPTUm68ll3JOdW5QA=; b=VmWMSom1uEt/I8gLd8cCn2LcBG
 OX0DfuDfqxstH0nJC+lZQfR3sp3hLCLRcqsIoFhExb5JQWQshT+7m4pJeeoReZPAFu1alABOb26ME
 7qebPLWj1IWRpBRwYgY0Ft+pO1xzThnWj1b/TgxABzjKAujGk631wESUfh2Y5rquBeRneOL5JjQg2
 NWlvgy1TTnEBO9eTGPDzWm++p5FBBqEW6hxUicG+0mEjBQfLqm3aPlTxcvzyzSgfXq4ePNk20vNyi
 I9PV1zUwF3o2TQjyVgMYfGCmOB3wNtb75N8BmOl0zA0eI+QcVfd0GwRN91NJS9kEvoNsNZelX5UzD
 6w5xHY1g==;
Received: from 179-125-79-205-dinamico.pombonet.net.br ([179.125.79.205]
 helo=quatroqueijos.cascardo.eti.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vMOY1-003cjT-70; Fri, 21 Nov 2025 11:39:25 +0100
Date: Fri, 21 Nov 2025 07:39:21 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH 4/4] drm/ttm: Tidy usage of local variables a little bit
Message-ID: <aSBBWcuqmZA_0yEY@quatroqueijos.cascardo.eti.br>
References: <20250919131530.91247-1-tvrtko.ursulin@igalia.com>
 <20250919131530.91247-5-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919131530.91247-5-tvrtko.ursulin@igalia.com>
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

On Fri, Sep 19, 2025 at 02:15:30PM +0100, Tvrtko Ursulin wrote:
> At the moment the TTM code has a few places which exibit sub-optimal
> patterns regarding local variable usage:
> 
>  * Having a local with some object cached but not always using it.
>  * Having a local for a single use object member access.
>  * Failed opportunities to use a local to cache a pointer.
> 
> Lets tidy this a little bit and apply some more consistency.
> 
> It is mostly for consistency and redability but I have also checked that
> there are not negative code generation effects. In fact there are more
> positives:
> 
> add/remove: 0/0 grow/shrink: 3/9 up/down: 12/-175 (-163)
> Function                                     old     new   delta
> ttm_pool_restore_and_alloc                   415     423      +8
> ttm_bo_vunmap                                147     149      +2
> ttm_bo_evict                                 521     523      +2
> ttm_bo_vm_fault_reserved                     972     970      -2
> ttm_bo_vm_dummy_page                         155     152      -3
> ttm_bo_vm_fault                              203     196      -7
> ttm_bo_populate                              158     150      -8
> ttm_bo_move_memcpy                           600     592      -8
> ttm_bo_kmap                                  667     644     -23
> ttm_bo_shrink                                333     305     -28
> ttm_bo_release                               750     720     -30
> ttm_bo_swapout_cb                            691     625     -66
> Total: Before=42717, After=42554, chg -0.38%
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Reviewed-by: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
