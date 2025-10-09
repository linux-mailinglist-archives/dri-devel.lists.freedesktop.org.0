Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17C1BC745B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 05:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57A9210E1B4;
	Thu,  9 Oct 2025 03:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="RSVqGMis";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CB210E1B4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 03:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759979440; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=jZdPYgqSApYdQRRXWujuoeSMdbHn01y0XiwqyIFUelqgI5p3XduCoUZmMSPZHMRzWK4rBL9xPt8S6AsU3E2MzuaTeJ+/BDQgI/QpfascRyn/OO6X8DpEbLFSk4+V+BkTW8dOH+kqBGsNpYr4kBKc5e8IgFT4JQrVm0mjeloKQlo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759979440;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hZsdNNjFILMsv/4sf5O4JRI0FM2Vy+qnDNsRxAXXB+s=; 
 b=cQUuDeOvPRb2u/Ea7OzWPC76TgsOZsDHEQ6DvvC84LLC8JMSiEE48qsRia2y5IUG733/Eikq84h/jZxximgXbaxDvgjkhbuun8TnnDd0jCBM4usRGSOISX4NptcPYLReWITnkSyVfjTo0/oE7ha4wjHNmboxLMeJrfh9sisnGPk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759979439; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=hZsdNNjFILMsv/4sf5O4JRI0FM2Vy+qnDNsRxAXXB+s=;
 b=RSVqGMistf5IbJW7VIT/Ftm8s3vPDfV6J+QT3H2azJ7Qs1xlQ+CJsErlVRjYG5mO
 6dnf4WPpm8nFGP6YvHyurHBUl9ITv5uomfgbG4/wHfCyMEIL2nSznFvGqADJD/g0Lqj
 uyJoGWCMXc7L8NCPQ56aU4biJtrAGhxdAMHTSAq4=
Received: by mx.zohomail.com with SMTPS id 1759979437801200.34385032429043;
 Wed, 8 Oct 2025 20:10:37 -0700 (PDT)
Message-ID: <080444f2-a95d-4d13-a763-bab06d279dab@collabora.com>
Date: Thu, 9 Oct 2025 06:10:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/virtgpu: Use vblank timer
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20251008130701.246988-1-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20251008130701.246988-1-tzimmermann@suse.de>
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

On 10/8/25 16:06, Thomas Zimmermann wrote:
> Use a vblank timer to simulate the vblank interrupt. The DRM vblank
> helpers provide an implementation on top of Linux' hrtimer. Virtgpu
> enables and disables the timer as part of the CRTC. The atomic_flush
> callback sets up the event. Like vblank interrupts, the vblank timer
> fires at the rate of the display refresh.
> 
> Most userspace limits its page flip rate according to the DRM vblank
> event. Virtgpu's virtual hardware does not provide vblank interrupts, so
> DRM sends each event ASAP. With the fast access times of virtual display
> memory, the event rate is much higher than the display mode's refresh
> rate; creating the next page flip almost immediately. This leads to
> excessive CPU overhead from even small display updates, such as moving
> the mouse pointer.
> 
> This problem affects virtgpu and all other virtual displays. See [1] for
> a discussion in the context of hypervdrm.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Link: https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/ # [1]
> ---
>  drivers/gpu/drm/virtio/virtgpu_display.c | 29 ++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)

Applied to misc-next, thanks.

-- 
Best regards,
Dmitry
