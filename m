Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03779A2C783
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 16:43:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537B010E258;
	Fri,  7 Feb 2025 15:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="VW9SUXNZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252B210EB58
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2025 15:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738942746; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=b0nAViDGp1RGwFyxhncmKRPc2tWAdI7b6eKm0N1Jk/7HtkD+XU9kuMROvBrsjMVuALfMQSZozjEdEgem7NQ+qkEPQj6IueI9yUaBmaBxtWo44LFYcafxj0Foe+v46OEC7RuLdhHMDx9O88TLQvjuY17pOzmS7hImcX5P2DLpZIY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738942746;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=noPKdAGMhKnySUeZCxaTVh70QpxObYms/g1w1qWYI6c=; 
 b=i6Wh5VwJS9AusmV8gFFNqBU9H5/+Kpb5ePJLSWG5Xb044MFAoJ1MlsvTADadzT9p9AhtkP5WQGL5Wh+MBew/Adn7YAIr9ITxgSL49JRdaWMq88xnwZWJWT+ax0LwQDCRKsBtsCtsBHrpxKgr7I64UtOcuTU54iMTbdbemKk5mMw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738942746; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=noPKdAGMhKnySUeZCxaTVh70QpxObYms/g1w1qWYI6c=;
 b=VW9SUXNZxCSpawzAgc7nxTJ7o/klcGzTUqYt9idyYt1Zyb/ujIdFywfSZ1fYZR3u
 SsySLn7680u+xgvFEuGSbWvOCcgR/EcjRP1RsyI1M2PfvXuCwwZY0PJgPxeUvjTkN/T
 yaG1J4YQMv9lccKVob15PHVPOLujYhnSS1uiugpU=
Received: by mx.zohomail.com with SMTPS id 1738942744008697.8303695987066;
 Fri, 7 Feb 2025 07:39:04 -0800 (PST)
Message-ID: <b7eb131d-1ca6-44f1-aea1-ace991912c3e@collabora.com>
Date: Fri, 7 Feb 2025 18:38:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/virtio: Align host mapping request to maximum
 platform page size
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev
References: <20250125-virtgpu-mixed-page-size-v2-1-c40c555cf276@gmail.com>
 <2f3394a5-0c63-49bf-bc85-f43388050ab8@collabora.com>
 <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAMT+MTQrKWzNfsUqiDawCv=s84XOvUGwsrv34aqmZ6rR482OqA@mail.gmail.com>
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

On 2/6/25 18:17, Sasha Finkelstein wrote:
> On Wed, 29 Jan 2025 at 15:40, Dmitry Osipenko
> <dmitry.osipenko@collabora.com> wrote:
>> Otherwise, the proper solution would be to pass info about host's page
>> size to guest using extended virtio protocol.
> 
> It is not fully clear to me, as to what exactly is meant by that.
> IIUC, virtio is a spec managed externally, so does that mean
> that i should write to the virtio people to add the relevant bits
> to the specification?

Virtio people will only approve the new bits. You who will have to
research how to add new virtio feature, propose and discuss the virtio
spec change with virtio people till the change is accepted, implement
new feature in the code. Anyone can propose spec changes, the process is
documented and you may look up ML archives to find what other people did
for upstreaming new features.

Virtio spec is managed externally, but in reality is tightly coupled
with Linux, all virtio people are also Linux devs. For the first step
you may write a quick *kernel* RFC patches to spark the discussion. Cc
all relevant people, see how much interest will be in the new feature,
ask how to properly add the new property if unsure.

Could be that virtio crowd will reject the idea of having a common
generic property and then we may try to make it private to the
virtio-gpu device.

-- 
Best regards,
Dmitry
