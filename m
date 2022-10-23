Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573E6094ED
	for <lists+dri-devel@lfdr.de>; Sun, 23 Oct 2022 19:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBE310E095;
	Sun, 23 Oct 2022 17:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FD910E095
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Oct 2022 17:01:32 +0000 (UTC)
Received: from [192.168.2.31] (unknown [109.252.112.196])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 86D4E660231A;
 Sun, 23 Oct 2022 18:01:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666544491;
 bh=URpcSAxzMg+PmcxqDirkleelgbYhO55RtdH6ohbFw+s=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=XlLbKkWzUPvGqpVarrySAieV23UFR8He3rsXS9QgI81CqocdJ+1wO8gR/IeG4i2dp
 3KIROkehklYkKlN0eNPt7nNHE5FyxLaYmc9yZkEHl7pRZ0WgboqWD2FwP29PqfT2gE
 UhJSisSuIY1Yz62JEyMABjjj5TWf5a92aBpmvEpYvBh+SQwrEfOzyipCfsot5P/BfE
 ZXNS9Nt0k1F0ik6ryXNMS8UfTUPI8ZEKI98caFb/+pQdsOrE30i9GOzSsgTQbho/Vi
 NMjB2EOj4LP3EzF/rFkyu5lrR5hHa6gXLEghyZfXd5/f8v4QkoZZ7w0yBV9RRWMH/9
 SJGyajd8uZ9Qg==
Message-ID: <e0c951b1-7e6e-272f-6fc6-bbe4a4b13ee7@collabora.com>
Date: Sun, 23 Oct 2022 20:01:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v1] drm: Switch drm_client_buffer_delete() to unlocked
 drm_gem_vunmap
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20221020213335.309092-1-dmitry.osipenko@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On 10/21/22 00:33, Dmitry Osipenko wrote:
> The drm_client_buffer_delete() wasn't switched to unlocked GEM vunmapping
> by accident when rest of drm_client code transitioned to the unlocked
> variants of the vmapping functions. Make drm_client_buffer_delete() use
> the unlocked variant. This fixes lockdep warning splat about missing
> reservation lock when framebuffer is released.
> 
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Link: https://lore.kernel.org/dri-devel/890f70db-68b0-8456-ca3c-c5496ef90517@collabora.com/T/
> Fixes: 79e2cf2e7a19 ("drm/gem: Take reservation lock for vmap/vunmap operations")
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_client.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
> index fbcb1e995384..38e1be991caa 100644
> --- a/drivers/gpu/drm/drm_client.c
> +++ b/drivers/gpu/drm/drm_client.c
> @@ -235,7 +235,7 @@ static void drm_client_buffer_delete(struct drm_client_buffer *buffer)
>  {
>  	struct drm_device *dev = buffer->client->dev;
>  
> -	drm_gem_vunmap(buffer->gem, &buffer->map);
> +	drm_gem_vunmap_unlocked(buffer->gem, &buffer->map);
>  
>  	if (buffer->gem)
>  		drm_gem_object_put(buffer->gem);

Christian, could you please give yours r-b? The dim insists that the
patch should have r-b or it won't let me push to misc-next. Thanks in
advance!

-- 
Best regards,
Dmitry

