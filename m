Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AE755C9F
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D132B10E1EC;
	Mon, 17 Jul 2023 07:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3DB10E1EC
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 07:20:07 +0000 (UTC)
Received: from [192.168.2.153] (109-252-154-2.dynamic.spd-mgts.ru
 [109.252.154.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A88486603203;
 Mon, 17 Jul 2023 08:20:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689578406;
 bh=2azQJ2Y4SSayyaeHVwWvWOeHAUzUtm51R0fJQMMVQ5c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QHaic3iJQAnUh41LPL/dSxbTzIoLUHJUqvA9Ca1tskxSrpSt8oXSxP50SxH+ur4tx
 /M19RkGlQGU3ywi/XWLXSf4C9qJau1esH0awecUt3jsSQ88rIgga/XZzYGCb5Z7+AA
 Zu3gwmBu4OT9MXtYwwdryWn8LZsBUudGGRDIgcDFHbIRqL4XSUI1cPkb3Lh28JF/D+
 BPVKiqTpwGIbWoiTbqPyLDY/+4L3NTMkCjVHouapZULziLYjhxuu3caF1cJu7DT62a
 sGNhb8kbkBIcRQzvcGrr0paHt8hVQz/E9i/yJc+1kNUyaotcK1+8YxUaL5ujj9SSPK
 HyEyIDEP7XZdQ==
Message-ID: <80de081a-e443-85a2-1a61-6a8885e8d529@collabora.com>
Date: Mon, 17 Jul 2023 10:20:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [PATCH v1] drm/panfrost: Sync IRQ by job's timeout handler
Content-Language: en-US
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230717065254.1061033-1-dmitry.osipenko@collabora.com>
 <20230717090506.2ded4594@collabora.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20230717090506.2ded4594@collabora.com>
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
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 7/17/23 10:05, Boris Brezillon wrote:
> Hi Dmitry,
> 
> On Mon, 17 Jul 2023 09:52:54 +0300
> Dmitry Osipenko <dmitry.osipenko@collabora.com> wrote:
> 
>> Panfrost IRQ handler may stuck for a long time, for example this happens
>> when there is a bad HDMI connection and HDMI handler takes a long time to
>> finish processing, holding Panfrost. Make Panfrost's job timeout handler
>> to sync IRQ before checking fence signal status in order to prevent
>> spurious job timeouts due to a slow IRQ processing.
> 
> Feels like the problem should be fixed in the HDMI encoder driver
> instead, so it doesn't stall the whole system when processing its
> IRQs (use threaded irqs, maybe). I honestly don't think blocking in the
> job timeout path to flush IRQs is a good strategy.

The syncing is necessary to have for correctness regardless of whether
it's HDMI problem or something else, there could be other reasons for
CPU to delay IRQ processing. It's wrong to say that hw is hung, while
it's not.

-- 
Best regards,
Dmitry

