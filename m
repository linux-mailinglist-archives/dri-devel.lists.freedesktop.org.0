Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12067B33113
	for <lists+dri-devel@lfdr.de>; Sun, 24 Aug 2025 17:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 442BA10E05A;
	Sun, 24 Aug 2025 15:09:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="IsUikDbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B626010E05A
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 15:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1756048164; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lKowyqX00FV7gLkyv1HQJ6tn2kFIusOaYUBokEmwx5mvZYip2psRM+2hIM0xkj0j8TUUXLjCVHTdvpy1RU28N7Dw6Iv3nHJB3/mJ2X5b+Z5YFfP0zJMUrdVcD8KQW6/F2TKQepMu6CRPx2xbnwC05w69cHCqcr1FB9l0O2eNsBs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1756048164;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=q2zrd0fbzYJX0wNx48Z6Fjw5jDCzd1MAN4icHnl0398=; 
 b=fQTBF5B274UclKncukHr9A5ac/h2hIzso3knDqUcDYUAO2QIUaQRHPe1vQJR6hyS0pbSLKzC+2N13V6kh9DNb4l8ZrnXazJCsjwrBlAihuAiZMTQIpXIJp1bdcewjj6AMleyFGjg1u6AAveNAA3ftjgmIZ6Y7LkTYUt8yeC2ufw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756048164; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=q2zrd0fbzYJX0wNx48Z6Fjw5jDCzd1MAN4icHnl0398=;
 b=IsUikDbxlKqUC1uDt6heXWSeIoVO+vGXANKN5UUMLjzCZLsqQoTLtPPYd8o2zjTW
 o9vZsMDN7VWdyg2mDn3IPW1IRrWfui37GH7eHGDpMUpO99CPfHPeWppKnBDSVagwj3W
 nmGPAIMaAiWQoQPDm9SoMGK6jeJQ4DKIGZnlTpZQ=
Received: by mx.zohomail.com with SMTPS id 1756048162536525.8534642251517;
 Sun, 24 Aug 2025 08:09:22 -0700 (PDT)
Message-ID: <a522b08a-4cf3-41e8-a339-50cd3033d6d4@collabora.com>
Date: Sun, 24 Aug 2025 18:09:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/virtio: Implement save and restore for
 virtio_gpu_objects
To: "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
References: <20250702222430.2316723-1-dongwon.kim@intel.com>
 <20250702222430.2316723-3-dongwon.kim@intel.com>
 <633a9922-2281-4119-8378-8d35089ce89e@collabora.com>
 <PH8PR11MB6879AE6EDD72B112AADC0BF6FA49A@PH8PR11MB6879.namprd11.prod.outlook.com>
 <0eb5e316-5eb5-468e-bee0-b4fc8d0490ae@collabora.com>
 <PH0PR11MB5112F7A64697C5D30F08539DFA33A@PH0PR11MB5112.namprd11.prod.outlook.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <PH0PR11MB5112F7A64697C5D30F08539DFA33A@PH0PR11MB5112.namprd11.prod.outlook.com>
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

Hi,

On 8/20/25 20:37, Kim, Dongwon wrote:
> Hi Dmitry,
> 
> Sorry, I have been busy in handling some other high priority tasks so couldn't follow up
> with this. Yeah, so to confirm, you are saying this object save/restore mechanism
> should only be used for S4 case (in the PM notifier for virtio-gpu driver) and handle
> S3 case by not resetting virtio-gpu from QEMU?
> 
> I will take a look at that option.

Thanks, sounds correct. Save/restore for S4. No reset for S3.

-- 
Best regards,
Dmitry
