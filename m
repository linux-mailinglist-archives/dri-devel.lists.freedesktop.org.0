Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 102A660CB4F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0251A10E347;
	Tue, 25 Oct 2022 11:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D92F10E347
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 11:54:19 +0000 (UTC)
Received: from [192.168.2.138] (109-252-112-196.nat.spd-mgts.ru
 [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BBB76602319;
 Tue, 25 Oct 2022 12:54:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666698857;
 bh=CM9SUyGUZjRK32lF2nMUcm5fnYnXZQSTpl8mK0OA4/M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SYWB3oRm02i1F+PNy+YxbcswkyLrAHGWh7QRmBIIE+C6/PEx3Tw5sMwAIBms87HDv
 +uGH1Y0e9TEtaqzQUagGv356kM6hpbQprMWNAjAg5igKIylxJ8v/LNjwJjV+zzvE7k
 dIl+L3BUEeZ0ctTN66yubWGbPWdEf8U0IL4j0mSC8PK1dp0Fgo8gQJ6exMYicdHv0o
 Z59VuhC73Kxx5UU3pOsEVP+SM/PZDGqCtDoix++75veIdSce7XfG7871crguS3eSTf
 +p03DmwSbZlvG13I3yi5BzmT6Btkw7SevEMys5ZbI24kEtGJ3lr5R2mo09DNUAFkYQ
 4Ev46TmtDQXDQ==
Message-ID: <c88f5500-cf98-ffe1-2df0-2af4d11d0f94@collabora.com>
Date: Tue, 25 Oct 2022 14:54:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [bug report] dma-buf: Move dma_buf_attach() to dynamic locking
 specification
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <Y1fLfsccW3AS/o+/@kili>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <Y1fLfsccW3AS/o+/@kili>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/25/22 14:41, Dan Carpenter wrote:
> Hello Dmitry Osipenko,
> 
> The patch 809d9c72c2f8: "dma-buf: Move dma_buf_attach() to dynamic
> locking specification" from Oct 17, 2022, leads to the following
> Smatch static checker warning:
> 
> 	drivers/dma-buf/dma-buf.c:957 dma_buf_dynamic_attach()
> 	error: double unlocked 'dmabuf->resv' (orig line 915)
> 
> drivers/dma-buf/dma-buf.c
>    987  /**
>    988   * dma_buf_detach - Remove the given attachment from dmabuf's attachments list
>    989   * @dmabuf:     [in]    buffer to detach from.
>    990   * @attach:     [in]    attachment to be detached; is free'd after this call.
>    991   *
>    992   * Clean up a device attachment obtained by calling dma_buf_attach().
>    993   *
>    994   * Optionally this calls &dma_buf_ops.detach for device-specific detach.
>    995   */
>    996  void dma_buf_detach(struct dma_buf *dmabuf, struct dma_buf_attachment *attach)
>    997  {
>    998          if (WARN_ON(!dmabuf || !attach))
>    999                  return;
>   1000  
>   1001          dma_resv_lock(attach->dmabuf->resv, NULL);
> 
> In the original code used to take this both the "attach->dmabuf->resv"
> and "dmabuf->resv" locks and unlock them both.  But now it takes one
> lock and unlocks the other.  Seems sus.

It will be the same lock. Apparently I copied the part of code from
other function, that's why lock/unlock aren't consistent there. The
dma_buf_detach() doesn't really need the `dmabuf` argument, perhaps it
was more useful in the past.

I'll prepare the patch to clean up the locking pointer. Thank you for
the report!

-- 
Best regards,
Dmitry

