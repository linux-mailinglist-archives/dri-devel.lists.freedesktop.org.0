Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A893CBBB0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 20:09:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD466E21C;
	Fri, 16 Jul 2021 18:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1139 seconds by postgrey-1.36 at gabe;
 Fri, 16 Jul 2021 18:09:05 UTC
Received: from vern.gendns.com (vern.gendns.com [98.142.107.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14DB86E21C
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aq7ckziDr7LRnw7KCX79LUFZvdTuuHjD/zKTHJm9hNo=; b=b8NvUAEy3KDBBAC2Ijf3u97kHZ
 cAgljENyOoDixV/oVVMA8wxOwy55M5Oga0028A5dBBbVdLYjdQU1EDYi6N7xeWL35GbeOeju71Wxh
 kvHnuBieudJ1ysAFn0R38JlWbL7GLxAFssxQ9wy8LPOhdGLATxowJFNptT1RcieHp6ZmfbyYYx24t
 tEi2LqzDk0KNeSeu+wkQI1EZnmOY4ulf4fUVi7qiAfHCUlDXIHQxJBIxtr5W2EPDbK8rshhpz0qtE
 NoK8La/PmBy6BLbKra0pnGIwsVLP30eLeK+OfC1rQZI4jTXx3hDweyYo13NR9rA3hKwzJx0WZmyvx
 Qb5zyZBQ==;
Received: from 108-198-5-147.lightspeed.okcbok.sbcglobal.net
 ([108.198.5.147]:42830 helo=[192.168.0.134])
 by vern.gendns.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <david@lechnology.com>)
 id 1m4Ry9-000IKi-Tj; Fri, 16 Jul 2021 13:50:03 -0400
Subject: Re: [PATCH 7/7] drm/st7586: Use framebuffer dma-buf helpers
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 airlied@redhat.com, sean@poorly.run
References: <20210716140801.1215-1-tzimmermann@suse.de>
 <20210716140801.1215-8-tzimmermann@suse.de>
From: David Lechner <david@lechnology.com>
Message-ID: <7fb8bb05-dcd3-6498-a2bc-feb2230ea8e0@lechnology.com>
Date: Fri, 16 Jul 2021 12:50:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716140801.1215-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id:
 davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/16/21 9:08 AM, Thomas Zimmermann wrote:
> Replace dma_buf_begin_cpu_access() with drm_gem_fb_begin_cpu_access();
> same for _end_cpu_access(). Remove some boiler-plate code. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Acked-by: David Lechner <david@lechnology.com>


