Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 584BCB3F0A8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 23:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB1110E533;
	Mon,  1 Sep 2025 21:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eaOwAcLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A658E10E532;
 Mon,  1 Sep 2025 21:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ADt+4hga8RmaHbaePDzGK7tLeipSCTu6X1WoJGXyaG4=; b=eaOwAcLkWYa+fkvGFljI2IjMcy
 CKOlwEQk0P7/IE2hqm9D8jpXn9ogXjbjm7Fhsv3KrD8S2G7itDJJUS0LVf9Zsz3uij7vZMfnZn4v1
 +nioPgb3UhS6hUSxxxObv32UWXVtZea6nivKxXO5pISmd0myx+GTOAc6YS/LxnARFOEE5IKB0y3i2
 /T1zhaSy+PUot5s20XNFHSFHjZvIrjnqYMSZXhDhLgD4D08AqypCBngf8IWWNWU68uUOrNlxm0QZY
 gYp6haRsVQ+4PL8YJMszGdSBmMJRRoKdGVeGlLkCwtAPbeAeV6Q1hBKJMBMYJNCq0RYYcvXNmWvKP
 /KT6n7Fg==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1utCMU-005Rqb-L4; Mon, 01 Sep 2025 23:46:50 +0200
Message-ID: <c10c7918-a073-4c3f-85c5-3ebb25133723@igalia.com>
Date: Mon, 1 Sep 2025 18:46:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/amd/display: don't overwrite regamma LUT with
 empty data
From: Melissa Wen <mwen@igalia.com>
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 harry.wentland@amd.com, simona@ffwll.ch, sunpeng.li@amd.com
Cc: Xaver Hugl <xaver.hugl@gmail.com>, Christopher Snowhill
 <kode54@gmail.com>, =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250822211552.1472375-1-mwen@igalia.com>
Content-Language: en-US
In-Reply-To: <20250822211552.1472375-1-mwen@igalia.com>
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



On 22/08/2025 18:14, Melissa Wen wrote:
> Hey,
>
>
> KDE/Plasma users reported some flickering when applying the regamma CRTC
> LUT to an AMD display hardware set using an external or integrated
> screen. There is some instability in how the driver stores and updates
> color blocks based on color management changes or full update request.
> It uses update_flag bits for surface and stream and forces some color
> blocks to update without considering the previous settings.
>
> This two-patch series avoids this issue by
> (1) not calling set_output_transfer_func when the output TF has not
> changed;
> (2) preserve the previous out_tf value in the case of a full
> update, which was unconditionally setting all update_flag bits to true
> regardless of previous values.
>
> This modifies DC and may affect behavior on other platforms. On the
> other hand, it avoids unnecessary reprogramming of MPC output gamma.
FWIW, I just sent a v2 with a completely different approach that solves 
all Gamma LUT issues on DM (without touching DC).

https://lore.kernel.org/amd-gfx/20250901214413.12675-1-mwen@igalia.com/

Melissa

>
> Melissa
>
> Melissa Wen (2):
>    Revert "drm/amd/display: program output tf when required"
>    drm/amd/display: don't update out gamma if out_tf didn't change
>
>   drivers/gpu/drm/amd/display/dc/core/dc.c                | 5 +++++
>   drivers/gpu/drm/amd/display/dc/hwss/dcn20/dcn20_hwseq.c | 5 +----
>   2 files changed, 6 insertions(+), 4 deletions(-)
>

