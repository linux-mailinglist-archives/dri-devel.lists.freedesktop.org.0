Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7BFAFE784
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 13:21:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7073F10E794;
	Wed,  9 Jul 2025 11:21:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="avQbggW9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83D6710E794
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 11:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752060080; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZTQnmL25vCTQCKnMFmiVE41ss7GcPB71KpAbDB55ziqJCOE6oHhJ7MkJYdR3QX9BpcO/SeDUj5GMrD1pz7UTAIYkEM7Dtx+ahwG6ISNwhAriqaNIRXsQE3rd/aQmSBLsEJxY6cqv5zQmuyLS9k2KP11SsE+b1VVPBCm5pHeyxvQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752060080;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=c5fc9j/DUWR8I6AGo/JIPv6MbxEjodKBiQQmA9aA30Q=; 
 b=lRC1M4fSS5o0EHWqWc/4Zu+CmEF0scHm6KQelU69EY1jJYzX+7Tf+tD84+VopcYhy2mvAHmEv536jSHfco4oZ/yglnGfxEg9WTBzUusZeintHGb8bP9GjFoZGB6ZW7vC9s9T2GHtr5kAiMspOhCTszctQ15EPpAkqPhPvu4fDVA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752060080; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=c5fc9j/DUWR8I6AGo/JIPv6MbxEjodKBiQQmA9aA30Q=;
 b=avQbggW9YFCTvQGjtZXe4dHSgDMGnqdk6jQLvOa7FXCnFUVI7sxIIeOC1XEz7mmB
 s/7B4P9JILRW/JrGNAYLBmN7TY9QA0o1LgJNI9+D5NUPhQCEHB3YkPaWdR5LrpJ0gkL
 brM37h2FSr6aG9QI9LRQaWvPPztJ9wZmcC/Z+F08=
Received: by mx.zohomail.com with SMTPS id 1752060079217671.4858413806854;
 Wed, 9 Jul 2025 04:21:19 -0700 (PDT)
Message-ID: <24bfb33d-bfa2-4f6f-bb4e-d5a520529a72@collabora.com>
Date: Wed, 9 Jul 2025 14:21:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] drm/virtio: Freeze and restore hooks to support
 suspend and resume
To: dongwon.kim@intel.com, dri-devel@lists.freedesktop.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-2-dongwon.kim@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20250702222430.2316723-2-dongwon.kim@intel.com>
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

On 7/3/25 01:24, dongwon.kim@intel.com wrote:
>  static int __init virtio_gpu_driver_init(void)
> @@ -193,6 +251,7 @@ static int __init virtio_gpu_driver_init(void)
>  
>  	ret = register_virtio_driver(&virtio_gpu_driver);
>  
> +	printk("**dw_debug:: virtio-init\n");

Leftover printk

-- 
Best regards,
Dmitry
