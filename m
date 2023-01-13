Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E57966A142
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 18:56:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 867D810E200;
	Fri, 13 Jan 2023 17:56:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B28710E230;
 Fri, 13 Jan 2023 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RpPecF2GHngq4UXRCc15Dzjv/9/p21DnywW4W8wi+Zw=; b=dKsuRfHXD3PHBNWIiNOeaV5MSg
 naxWdz3HmyBipOSmXvR7Bw+7HMb3W+MG0OLeFNfdk51KErtLfdBqwqbD9uysR9VwKQOnXLETt9rMp
 DVNDaMucnsRUUuExx7GLdO0W76RcXkF4zJWW3cTUTMbFAaVqz6CcunctmHJrPDrMzG3gYvltuYKXO
 GoZn9SC/M0WHwi81JwWJ1AuLqM3ZXBUDIEv+mQq2ncgjOCJW5GpLWYBXVF1L0rM+G8oxc8pHQvKps
 oCZ2XIFb39H7/TGGucXKY7Qit9triUGKvUMRBYNuIq7vrRofwSqfrvNDVEm683x/bknuW901wGnkS
 yBGB3Tkw==;
Received: from [187.36.234.139] (helo=[192.168.1.195])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1pGOHu-007KCG-H3; Fri, 13 Jan 2023 18:56:22 +0100
Message-ID: <7c82dbef-a7a0-c6b0-00ad-3fd9dd339964@igalia.com>
Date: Fri, 13 Jan 2023 14:56:15 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 2/3] drm/amdgpu: Remove redundant framebuffer format
 check
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
References: <20230113165919.580210-1-mcanal@igalia.com>
 <20230113165919.580210-3-mcanal@igalia.com>
 <feD8ifyiQQcVKESmwwRiyFCSBrXbRd6kGm8LGHgC0ympY2Qsc9Oi3UEqva2xVspk59CvZV4kpgCJUUKPJt9scwsIMAVBvDZrXMihMehs_WM=@emersion.fr>
From: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>
In-Reply-To: <feD8ifyiQQcVKESmwwRiyFCSBrXbRd6kGm8LGHgC0ympY2Qsc9Oi3UEqva2xVspk59CvZV4kpgCJUUKPJt9scwsIMAVBvDZrXMihMehs_WM=@emersion.fr>
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
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 amd-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/13/23 14:06, Simon Ser wrote:
> Hm, unfortunately I think we need to keep the check in amdgpu for the
> same reason as i915: amdgpu will pick a modifier if user-space didn't
> supply one on GFX9+.
> 
> I wonder if that also applies to vmwgfx? Maybe that would be a reason
> to have the check in framebuffer_init()? (Not sure!)

Considering that we could then remove the check from i915 and amdgpu if
we move the check to framebuffer_init(), I believe that this would be a
good reason to perform the check there. I'll send a v4 including the check
on framebuffer_init() and removing the check from i915.

Thanks for the feedback!

Best Regards,
- Maíra Canal
