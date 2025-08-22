Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C4B32419
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 23:23:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C9610EBCA;
	Fri, 22 Aug 2025 21:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Pyx3mNhU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925510EBC8;
 Fri, 22 Aug 2025 21:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
 Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bx1132FMwpnlj0DqDe08iTyAVGndOV4v8JUYKT8tkgs=; b=Pyx3mNhU9Hs4whQiyx4PbQAnba
 DX4PNRjD0UlFlyIhSfVv3NCvi8V2UUXJoxWLgTh0nNFyI/1f164Wat4UgGQg6+eLuPLUWxGP6eZdV
 5LR2825AlAYFbYyHy8hcWi8t6buVmLNnjES9BNhJL3ivymlEc5yI9CDSHiQdE2kx0Szwg+p4UXoKy
 fZ+sakUQXx4RQlG7lG3Dt/ebAhMvUcwfs8PMNcL6+gLL2RQxmdLIKSvW0lqeYn1v6/4DAu14GbunE
 B6Zli3ikkZ5hwCmxdV0ehjUhAH9NzHgUsQdTiLAjjOTJdDjaSjhC/9i5qRzVwHBQsPrh5cOwr/ASk
 bD0IyDKQ==;
Received: from [189.6.13.79] (helo=[192.168.31.42])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1upZDq-000IAx-Kr; Fri, 22 Aug 2025 23:22:54 +0200
Message-ID: <b3e84085-8af8-443d-b177-ceb9f3a657a0@igalia.com>
Date: Fri, 22 Aug 2025 18:22:47 -0300
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
I linked in each patch but better refer the AMD issue here too:
- https://gitlab.freedesktop.org/drm/amd/-/issues/4444
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

