Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FC793A406
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 17:52:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA44B10E013;
	Tue, 23 Jul 2024 15:52:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Yepvqxd7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF0510E013
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1721749949;
 bh=Rm5Y5iNW/32GoQmcTW6S0lvAHwERKDMbGT5yagBdX0M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yepvqxd71jAWDoe683qziilODGx2MnT3pHB4AwzSPj/ns30bPEk40H78R0zLPg237
 2n304IHKiuULikuE/6ggrLJanuY7XqS/5NN5uanBzyT48TreNMXTU3a4M0/F8MQt2Y
 lRCPTl8eTTPBQizjUdBiUewwAshTWJ9vS3XT0QfA++K9RyR0R5rZGnSI7S0J3+itFp
 uWOD5vuEhwK8/sQcaVJeAgKg545vORSXt8ObidsM7dI9rXnCEzEgSOz5Ame5IxqYJC
 QPkeYCbeNMFrADqsifwYB04C2H64Bm2hSmlBk0YwGSp6q8q2a0U3C1muIiCeNXvRWi
 sIwpjhbd3djZw==
Received: from [100.109.49.129] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6A2BC3781144;
 Tue, 23 Jul 2024 15:52:28 +0000 (UTC)
Message-ID: <8e8313d4-b748-460b-bcb8-89d738747211@collabora.com>
Date: Tue, 23 Jul 2024 18:52:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [PATCH RESEND] drm/virtio: fix memory leak of vbuf
To: Weishi Li <liweishi@kylinos.cn>, airlied@redhat.com, kraxel@redhat.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20240509015225.38669-1-liweishi@kylinos.cn>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20240509015225.38669-1-liweishi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
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

On 5/9/24 04:52, Weishi Li wrote:
> @@ -356,12 +356,14 @@ static int virtio_gpu_queue_ctrl_sgs(struct virtio_gpu_device *vgdev,
>  
>  	ret = virtqueue_add_sgs(vq, sgs, outcnt, incnt, vbuf, GFP_ATOMIC);
>  	WARN_ON(ret);
> +	if (ret < 0 && ret != -ENOSPC) {
> +		free_vbuf(vgdev, vbuf);

Don't see why -ENOSPC shouldn't free buffer. If you trying to fix a
theoretical leak, then not worth doing it, IMO. Not apparent how to test
this error code path and it's not easy to review it.

-- 
Best regards,
Dmitry

