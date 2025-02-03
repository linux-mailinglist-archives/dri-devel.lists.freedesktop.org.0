Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C485A25104
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 02:07:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F9F10E0C2;
	Mon,  3 Feb 2025 01:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="Ri8gky45";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CA0B10E0C2;
 Mon,  3 Feb 2025 01:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738544841; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PAWag2A7a1OVTqEWxPEBABzr/en3f0pfIR7P/gedajimLiPSMcIbkNL0Gwx005BUwrnOjk1izQP6cTMltoLjmt8jLIGtj/tpstdJKLNXNKYcQY9jAGdziW4YMlTItOQ/E/C8X3p5haehrAUIsHLF/PuVzKItGNHsOC+CwnTehog=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738544841;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=KnGTluyypwtazBIRrVkSvKuikw6cFhABGbbWmFW2RaU=; 
 b=IkF66q/QuaoBGxJLPPQdrXWXQ4EB92JbYzhWn6GGTfqs0y9ku0y+N57XclzvyiIj/HMjJyEp8MD661hAvxXpw3qri16GOTeQzQZ3vy1udJ5ubYhztlnNunUt2RERmrRfWeNxsgZm1wu98MSEVcHG6iTWdF2uIJQV+a7i0nDUm1Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738544841; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=KnGTluyypwtazBIRrVkSvKuikw6cFhABGbbWmFW2RaU=;
 b=Ri8gky45buTDhbjOUQq6J3IB83+m70o013N/TwbbklDQuDh4V8cbe5XTVUUDw1i4
 Y8BTk7EuubEXjs1qZfCj+6WjfGslR+isUEyZojA/ao69nVsxwNAVSxp2LwygQfB0VCP
 b5pmdp/fTDp/+8meJiYsazgbWgsBED8CNXpmOtvI=
Received: by mx.zohomail.com with SMTPS id 1738544837827544.081124145429;
 Sun, 2 Feb 2025 17:07:17 -0800 (PST)
Message-ID: <b3fe0f90-761b-4dea-aa43-e7187a2ffd5a@collabora.com>
Date: Mon, 3 Feb 2025 04:07:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/virtio: Add drm_panic support
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, daniel@ffwll.ch, christophe.jaillet@wanadoo.fr
Cc: virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20241129122408.4167150-1-ryasuoka@redhat.com>
 <be01d2f7-8423-4e10-b65b-a84a7bc7c99e@collabora.com>
 <3ca0382c-a410-4424-a5a4-7c1b8be7ebed@collabora.com>
 <a0fc9b8c-e86d-46a2-a1d2-5ce8793ad2a5@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <a0fc9b8c-e86d-46a2-a1d2-5ce8793ad2a5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 12/2/24 20:19, Jocelyn Falempe wrote:
>>>
>>> I've now noticed that drm_gem_shmem_vmap() expects BO reservation lock
>>> to be held and we can't take lock it at a panic time.
>>>
>>> https://elixir.bootlin.com/linux/v6.12.1/source/drivers/gpu/drm/
>>> drm_gem_shmem_helper.c#L330
>>>
>>> This resv warning isn't triggered because bo->base.vaddr is set for VT
>>> framebufffer BO when panic happens.
> 
> I usually test using gnome desktop in the VM, and in this case vaddr is
> not set, and calling vmap() is needed. (and I don't get the warning, I
> will check why).

All those get_pages() and vmap() that drm_gem_shmem_vmap() uses may
sleep. You'll need to add atomic variants for the vmap funcs if it's
really needed.

Like I said in the comment to v6, let's start with rejecting BOs that
aren't vmapped. If atomic vmap will become needed, it will be a separate
problem to solve.

-- 
Best regards,
Dmitry

