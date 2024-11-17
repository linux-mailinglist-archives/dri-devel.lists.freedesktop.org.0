Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C09219D02D9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 11:08:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DFE10E04E;
	Sun, 17 Nov 2024 10:08:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ko13AsGw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4312610E04E
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2024 10:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731838075; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Kc6TWjHT1dLF4G+9z9HGJklIfelOCYp6scjyRkJp0/CKJ1Nl5xzhw4GBOrecTviDvKFSaOUb4YW4UhlX2KNt0CdVVNx0RSQzppqqfGJbgrLfHKcHcr+q/h18etond6Eq1T/SoOf0f4I9mFPbFYaywOeXdVtMviWzceX5FiW6mck=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731838075;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=CGOiKyvMy2cXLiPoWyw2nHQoEitR5m27MYGutHaqmeg=; 
 b=DjYRy61lTSbpHnUSUCajIilikQJhHGwFL+IPYzmYH+87NfEhbA5BoJpAVXxSE+iQaaGG4+7jYW6l551dfWSZk90Jofp9H6SsnjkNBblKXk1N0tN6L70DpQrotY2xgb82x83CzlfVZ+4Wwf8N8u5FkLLsINPFF5OEzmi5YR9BMOw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731838075; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=CGOiKyvMy2cXLiPoWyw2nHQoEitR5m27MYGutHaqmeg=;
 b=ko13AsGw4FSEpfxLpCHC6qZFSzSPIVxSg1tIGzgZTl4hxF8ZAhRxh54W4ecvZE2s
 qxUlUHFp11a+npJMOzlwxSxlDqNXLIEgNXY33Spoji1ujbnIJbpAeBOEhz1AvAqfWji
 voyZNQjeAWOXmfd/Ww+KKCy5gfhu+aSA9Kbm9Bvk=
Received: by mx.zohomail.com with SMTPS id 1731838073670905.055656712743;
 Sun, 17 Nov 2024 02:07:53 -0800 (PST)
Message-ID: <092b1a94-bbe0-4d37-b0b6-3870a6a6a0a5@collabora.com>
Date: Sun, 17 Nov 2024 13:07:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113084438.3283737-1-ryasuoka@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241113084438.3283737-1-ryasuoka@redhat.com>
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

On 11/13/24 11:44, Ryosuke Yasuoka wrote:
> From: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Virtio gpu supports the drm_panic module, which displays a message to
> the screen when a kernel panic occurs.
> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

I'll apply this patch tomorrow with a shortened virtio_panic_buffer
variable name if nobody will have more comments to add.

-- 
Best regards,
Dmitry

