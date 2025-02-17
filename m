Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE56A38D0C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 21:12:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C6110E12E;
	Mon, 17 Feb 2025 20:12:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="ajHIbnWT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7104210E12E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 20:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1739823130; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=Xv+OFR6SEBf30oSISQyFK5wNkBjKxC9mpiwrcINfHoixLZi5h1PHGMaleBtAVouRU0KbOxa+vej141bOMERk45Jnjs0RcORa3+xG7PRAnjSwngh4AW5t1+pahL2ZQaZnF9nd/FQhd55VJ2Tml8gYsFEWMphcMmUsGb7f7bQRoSs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1739823130;
 h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc;
 bh=MvlB81+3iRSmBxuYmuxfJIK8WryhrLiJhvKpt/c2gvs=; 
 b=DIXAnkq29EDOH3ifAfNlRNKYea1VEvhbUO2TtrhdDA8uWym9uGf55Zco6eDEEzSLyApnMb2PZo20RQZC15C5lLjNT5d+wuiUnMvYLuL0Qu8iHqKXeCVsGqSVesg+QRQkxELEvuUWDqoWVDvQWA/OdvQB/wizqfZS+bC0YPHV6Ds=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739823130; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
 bh=MvlB81+3iRSmBxuYmuxfJIK8WryhrLiJhvKpt/c2gvs=;
 b=ajHIbnWTBg4L/4IPaESkZaccLpZMxJ/sVU6/xanBxJKO3vYdpyxxicas9fZT5Ex5
 9nX8aBgB72mYN7jJtGg6B8GPzNRYel65bqtvIPrEvlikxfm45yD/XKPj4EJ7AiF9f+z
 WvAw9XrHqKU/dcKVfqO2xovXq223BYPfee3jLOKA=
Received: by mx.zohomail.com with SMTPS id 173982312467572.26170725598013;
 Mon, 17 Feb 2025 12:12:04 -0800 (PST)
Message-ID: <9100653e-df48-446d-8f4a-ad60587aaf1f@collabora.com>
Date: Mon, 17 Feb 2025 23:12:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dma-buf: fix incorrect dma-fence documentation
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 sumit.semwal@linaro.org, tzimmermann@suse.de, simona@ffwll.ch,
 tvrtko.ursulin@igalia.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20250211163109.12200-1-christian.koenig@amd.com>
 <20250211163109.12200-2-christian.koenig@amd.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250211163109.12200-2-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 2/11/25 19:31, Christian König wrote:
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index e7ad819962e3..e230af0d123f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -169,8 +169,8 @@ struct dma_fence_ops {
>  	 * implementation know that there is another driver waiting on the
>  	 * signal (ie. hw->sw case).
>  	 *
> -	 * This function can be called from atomic context, but not
> -	 * from irq context, so normal spinlocks can be used.
> +	 * This is called with irq's disabled, so only spinlocks which also
> +	 * disable irq's can be used.

Nit:

The description sounds a bit cryptic to me. I'd add ".. so only
spinlocks which disable IRQ's can be used in the code outside of this
callback".

Note that I removed the word 'also' because disabling IRQs isn't
necessary for a spinlock taken within interrupt context because IRQs are
already disabled there.

-- 
Best regards,
Dmitry
