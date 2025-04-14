Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F34E6A87DBA
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 12:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FFB10E54E;
	Mon, 14 Apr 2025 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="khTcKpHF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0F910E54E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 10:32:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744626770; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lSGIxZEcRaMuMq1Xy4afMJqdxKcU169ah6yHmO4bnxWEdHSxNGjI+sUaD0N7svV3Zd6YADKFUBcliyxs3cLL6HYkofskkA2nVYUpO+eXUuA0Bplu5CJFP7wzFCstGt5B9GcSRPN3jiQmAYjwPc2Z7ALNYpVKyu3mtctDGTwzVYw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744626770;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=0VetcWztW9U5rYzFVgJhmUoLggwox7+P5zRgUvI92cM=; 
 b=HIazI49MCAVVU8X71989rggT4C+/opo5rtHzASkLFb2o8T7lo5r5CpsgjyCCfJcVYi+hgtFUFmniDq2dESXCsbQlK2vRrqPNrLGYAZ1NfDYfHov40e1UFBbLE6gI9oTBbn+N1d1V3m4ZlKrlQiXMhv8fO+RCjRwn8GEpvtjKaHI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744626770; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=0VetcWztW9U5rYzFVgJhmUoLggwox7+P5zRgUvI92cM=;
 b=khTcKpHFOktJSqHrUe+6mh7ZaUh2P8BD7wljZ9z2MvIyPUTGm9gSMODS+hwgrzVr
 pXdTQ+E4PXSsBeBBfA33pKsd5tx5D2TDUhA50L8B4q7UugAOTUs8ZNqGobCXWLfehZM
 FISHzaiCb7xHB7apjy5OQ5YLuzEHCl+MymIDRW9U=
Received: by mx.zohomail.com with SMTPS id 1744626768929890.98778752496;
 Mon, 14 Apr 2025 03:32:48 -0700 (PDT)
Message-ID: <d1622c93-3d03-4328-990c-c7646f5c5e41@collabora.com>
Date: Mon, 14 Apr 2025 13:32:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/gem-vram: Un-export pin helpers
To: Thomas Zimmermann <tzimmermann@suse.de>, boris.brezillon@collabora.com,
 airlied@gmail.com, simona@ffwll.ch, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
References: <20250404132907.225803-1-tzimmermann@suse.de>
 <20250404132907.225803-4-tzimmermann@suse.de>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404132907.225803-4-tzimmermann@suse.de>
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

On 4/4/25 16:23, Thomas Zimmermann wrote:
> There are no external callers of the gem-vram pin helpers. Hence
> unexport them.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
