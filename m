Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F127EA116
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 17:16:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A969610E169;
	Mon, 13 Nov 2023 16:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DC510E169
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 16:16:03 +0000 (UTC)
Received: from [10.3.2.161] (zone.collabora.co.uk [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 662196607033;
 Mon, 13 Nov 2023 16:16:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699892161;
 bh=4AD5fghAi5i5VszGsU5RjAqo/6f18RZnyi15QT5ioAc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C3Mx6fc0gkLXn0HDgtT0D8BjMwLesBT1j0WP/A2npPsFaphppcXF8o/5pyrQGQKB5
 wWcoiDZXA0hxd6z7W28HZ4Hvy1sLeIsuedyJsbOkjiVPbEcfwN7iKu+/xncy9ZkfeJ
 mR5eP9KVWa8aiJgTM3IRAULE22opM56987bapSe9U2E9w9v0qToB3mtAfGf8db85H8
 EF2OHAC0FL5aE+1CEFfeJUNc0aj7ZwuCcvmQo4w2Sj/IGeHLGh+I2jfY01If/OiMHg
 f/mKJUXgup/Nr05+nX/9Nx+7Bfo1zb7qN8Tqalzs+vtsVBQ0rVtms8eJLFfFPpvh82
 ndh2IGjtf2nfQ==
Message-ID: <0185fa33-b0c7-194b-d44f-3d6ac967c4b5@collabora.com>
Date: Mon, 13 Nov 2023 19:15:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RFC PATCH v2 1/1] drm/virtio: new fence for every plane update
Content-Language: en-US
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20231003010013.15794-1-dongwon.kim@intel.com>
 <20231003010013.15794-2-dongwon.kim@intel.com>
 <675400bf-74fb-8495-b2b8-3ff717979369@collabora.com>
 <PH8PR11MB687986353C7E238B2298897EFAD8A@PH8PR11MB6879.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <PH8PR11MB687986353C7E238B2298897EFAD8A@PH8PR11MB6879.namprd11.prod.outlook.com>
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
Cc: "kraxel@redhat.com" <kraxel@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/23/23 20:31, Kim, Dongwon wrote:
...
>> Please write a guide how to test it. Are you using spice for the multi-display
>> viewer?
> 
> [DW] Yeah, let me come up with a simple test case. So we use virtio-gpu as KMS device. It is used to share the guest frame with QEMU.
> SPICE is one of client solutions we use but we primarily use QEMU GTK-UI w/ multi displays (QEMU with this params '-device virtio-vga,max_outputs=2,blob=true').
> Thanks!


I'm having trouble wit h reproducing the issue. For GTK-UI you should be
using virtio-vga-gl, shouldn't you?

I assume you meant that your simple case is reproducible using dGPU,
correct? I need a test case that is reproducing using virgl and no dGPU.

Using virtio-vga-gl+virgl+max_outputs=2 I don't see any issues. In the
same time switching to the second virtual display doesn't work with
Qemu's GTK UI, I'm getting black screen for the second display. In the
KDE settings I have two displays and it says both are active. For the
first display that works, I don't see wrong frames ordering.

Please give me a test case that is reproducing using latest version of
vanilla/upstream Qemu.

-- 
Best regards,
Dmitry

