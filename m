Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A1A007F0
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 11:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EF610E027;
	Fri,  3 Jan 2025 10:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="CUIUcqcJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780FE10E852
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 10:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CgX+/jkAjKgfVV24YuT9oZpilN3RUhSBGNfhS6MP8xs=; b=CUIUcqcJvBWSJruGltxYKS2i6e
 oOwOMykghj9+J8LciB9OG4bqFRskoye5vtT1gl1u9CN+fR+EcBnRVfbO3hvee+/6JU0knBzCrb9J2
 3iY7tSxaaiZbu+1sYWa8e/JQtnTYpmSz5WS7bDEUbyB+EOw6Rfj6gK4i3X6RR/snrtSD/B2wikQ7s
 rE4HSoK1IOJnOJUT4ZMJvhgPd10jANA+WRZm/WVqZoiIlqCG+Gj2IJvl909Oc8dmgkLbEQTekJe3r
 ucts4GvjpNnVKW8Tl/NweYxGh7ANAKC1Dw8CnXT8Y2CYA5lm7DVcAcFA6qGLHYTLr8Y4TY2qDPTAn
 0c9HIm3w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tTf42-00BBhT-MJ; Fri, 03 Jan 2025 11:37:58 +0100
Message-ID: <4bd63d84-8e40-461a-a842-540b12d89c3a@igalia.com>
Date: Fri, 3 Jan 2025 10:37:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] A few drm_syncobj optimisations
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250102194418.70383-1-tursulin@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250102194418.70383-1-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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


On 02/01/2025 19:44, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> 
> A small set of drm_syncobj optimisations which should make things a tiny bit
> more efficient on the CPU side of things.
> 
> /Maybe/ between 1-2% more FPS can be observed with "vkgears -present-mailbox" on
> the Steam Deck Plasma desktop but I am reluctant to make a definitive claim. It
> would be best if someone could verify or suggest a more heavy workload for
> syncobjs.

Later I added two more patches to the series which add a fast path to 
replace the kmalloc/kfree path for vast majority of invocations.

For example during Cyberpunk 2077 benchmark 96.7% lookups is for a 
single syncobj, 3.2% for two, and nothing above 3. Syncobj wait 
distribution is very similar.

With that and some kernel hardening options turned off it still seems 
around 1.5% improvement for vkgears.

Regards,

Tvrtko

> Less lines of source code and "Every little helps" (tm), right?
> 
> Tvrtko Ursulin (6):
>    drm/syncobj: Avoid double memset in drm_syncobj_find_fence
>    drm/syncobj: Remove unhelpful helper
>    drm/syncobj: Do not allocate an array to store zeros
>    drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
>    drm/syncobj: Use put_user in drm_syncobj_query_ioctl
>    drm/syncobj: Avoid temporary allocation in
>      drm_syncobj_timeline_signal_ioctl
> 
>   drivers/gpu/drm/drm_syncobj.c | 238 +++++++++++++++-------------------
>   1 file changed, 106 insertions(+), 132 deletions(-)
> 
