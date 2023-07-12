Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3387751478
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 01:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD0810E5F7;
	Wed, 12 Jul 2023 23:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8433810E5F5;
 Wed, 12 Jul 2023 23:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gwuba1zsKm+9rSAeHe9yRMWuoKfTza9L17M2VmyBhOA=; b=WrU+wnMwAVvEqTzDRxgtaBnFGj
 Kpw3WhylYwK2x8/hTpJOgBDu6ql8M09ef+6xp9thpefPm/7XEK9ZZMe39NGOgRqmMKuE/1suT+cCS
 WR+SzXYLSCYx0JO+ktOP/Lplu9qSnetENV00U2Inh3nBLxtmwV6WgT1spHf4FsKEJIO0lIVEtJ942
 +e5CjtxsTKNpL7wqCFSuxgbAqyPUydYCFRrW4wTlQvR9+wZG+QFwUejsiqp2QaI+NIuRDIZxT6+wk
 OqbtLQcla5LgfwDs4f5MrcgYle8ViKbFm+w1OZGIahejQgzUWjGZE5lda5bE25EG7aBAMjiSYKBv3
 q1WkGnFg==;
Received: from [187.74.70.209] (helo=[192.168.1.111])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qJjHf-00DO3q-OD; Thu, 13 Jul 2023 01:30:11 +0200
Message-ID: <58d90ae1-02f7-2866-dbb1-e7763a2399c5@igalia.com>
Date: Wed, 12 Jul 2023 20:30:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm: Replace drm_framebuffer plane size functions with
 its equivalents
Content-Language: en-US
To: Carlos Eduardo Gallo Filho <gcarlos@disroot.org>
References: <20230627182239.15676-1-gcarlos@disroot.org>
From: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20230627182239.15676-1-gcarlos@disroot.org>
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
Cc: tvrtko.ursulin@linux.intel.com, stanislav.lisovskiy@intel.com,
 juhapekka.heikkila@gmail.com, tales.aparecida@gmail.com,
 intel-gfx@lists.freedesktop.org, mripard@kernel.org, mairacanal@riseup.net,
 matthew.d.roper@intel.com, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, rodrigo.vivi@intel.com,
 niranjana.vishwanathapura@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Carlos,

Em 27/06/2023 15:22, Carlos Eduardo Gallo Filho escreveu:
[...]
> 
> So, replace each drm_framebuffer_plane_{width,height} and
> fb_plane_{width,height} call to drm_format_info_plane_{width,height}
> and remove them.
> 

I see that with this replace, there's a small code change from

	return DIV_ROUND_UP(width, format->hsub);

to
	return width / info->hsub;

is there any case that the replaced function will give different results?
