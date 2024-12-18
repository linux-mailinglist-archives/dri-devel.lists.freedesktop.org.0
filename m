Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8600F9F65E1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 13:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FF710E052;
	Wed, 18 Dec 2024 12:25:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=web.de header.i=markus.elfring@web.de header.b="RyABgzY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.web.de (mout.web.de [212.227.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D80210E052
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 12:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1734524725; x=1735129525; i=markus.elfring@web.de;
 bh=rEI9/XBB9+wI1zK7bvLcnE0IuS6BujqC43ua8YifnMM=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RyABgzY2NHjvWPrmrM8mGKczH3Ivb3emw1GnXemSYm+jqnNPD4bwcwWnED9BJg4a
 OBnpAR68Yh9ExCvEbWcl93oGUNPfp9KT9wyU0OIleEQfyhAsz3yT1TwDmMyN3dfay
 zuzB0oNauuZUuICXx8AczlMGA+5nfpofuJj3ustKv1WkRQeJEIsZ3rLQjASkkIm1M
 bZOC41S4rPZDr2sFEmWCB3u0YYPnIRESugfdjM1ElNXyxOCH0SPw3eE2Ci/NYdqG0
 7U7YTvrSGd9LUdLONnZ5WQUaR/Szx4geByD6AE5wYJhonC2YpB4s1oC5u2y6zBxLS
 0DmTt9WijhMHRbyw6A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.41]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MwR4R-1tgmwa2dXx-00ruAz; Wed, 18
 Dec 2024 13:25:25 +0100
Message-ID: <feb72a8c-06c1-48d9-abb0-d680c11922a7@web.de>
Date: Wed, 18 Dec 2024 13:25:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Caleb Connolly <caleb.connolly@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 John Ogness <john.ogness@linutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Petr Mladek <pmladek@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, bluescreen_avenger@verizon.net
Cc: LKML <linux-kernel@vger.kernel.org>, Simona Vetter <simona.vetter@ffwll.ch>
References: <20241204160014.1171469-3-jfalempe@redhat.com>
Subject: Re: [PATCH v9 2/6] drm/log: Introduce a new boot logger to draw the
 kmsg on the screen
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241204160014.1171469-3-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:puXIM79LzTyOh/fToopcbY3TNmb4NiVa+nbSGO5VrPYGNEwFsxu
 ckFdXZBpCPg9QWvd4jqgYbjzBdl2HVSD9bsDlxf3lVHHS/pwddLHT7yOjf+pKXVHF4mlpcz
 xNxhHK36dpA7Zg2oCDZHSuJu/+hSK82MRhu8HQFiiUMyOGZK+FRcGN+t653qbF3bAyMugF3
 ydwZdQyFrYVSFvgEQ21Ww==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/PpFgzxPh7o=;rawjLivMRgirlrzTE0O6YTKFVOe
 kIfdD9Q9NY7oOC9l44FWwfXWpEnOdbTUD3ihReOps0lZzMHPYFwc41/HvL1Plt48ax7K2JLSh
 JxRcNgqPt41YIcJ9hispVEVDkr54/c7GLFgQAgCxUulPXgOUDUJfyiBzzx25t0hqpPeIyRxbC
 ZHQ+tRLVnSrYaZ7nQjjxzXtFbFpoV5OsgcV7wm6Vft3ol5RqZtZQCYpTW8DYGGBXyVOv2ewAs
 BXUcrQ1ZsB5nK58rWrcelZJMF/zEKI+NDTtX7PZvEROQda44aENUifADrZ+dROCUBtI+Hv0zc
 nE2VfiHQ9jyGVYL9WXCDdDEvMrdwG7hWBIOlqZBIQHOIxJrGuey4SWVzZmjLAsONiPZlYa+HE
 7Twdl/pMeZqMtAvIO959pTtehKlIS2WLLnf2la5U9zkLewsxeABV9R5YZcL1VbGlmInuDgeXD
 4AJipwfcJvR7A8zdwu8SA6bMbyVM6rNv+xLM2Lbi8aFCQJedst+PrVA092CIMmCKbL5np/W5z
 DP/Au16BrqQ7DpjfehPRcKCqqooNWeAOl1HYGWy4L+PrtivNHQnSr174rV/Vyr64ixl72RKzw
 Ne+rAAu2uQsCtgBIxDUxKk7kWbtxhfOtwwGTrkw370coSFbUmXgVpa5FV3xlAN74cIlKiioJd
 XTiBALlKcESmWPDrzV37ah4aKuJ6jFrxBdwJe3hbwfZqdpPm5e/cjPRUw7jklc8FZQErF9Gv7
 L7SV+EFXI8WvR/92ayRH14BnYZpENLvc2cKzogl9XQ67/HN64kPtfFHABcKLwWMep2Qtq58kj
 hR1JEe9hZupERndlWOodARHJxoJTH3phFI7SUZM6IX+oGI9rPMDbX/k5M6/gqUh1UQnpPQ6Zd
 JV/tssU3yRkfVKkNwp/5KS2mezUX/9wTeQXRKDqVXuRj44ATlBJM1Gh2Vto1IFEoi3b57E1/B
 9kfyWADPzAKVFyhdGV/I8K1hJmgmYXZRqZZzybfRQ2qnjzgl6jxMpuIbj0kg9YEJwCBY22S7u
 /yvawhqX3M1RpxpWVIKpvXQuYS+4g+vqCNyNOlnUDC2OoHLqT41FKzT2dXBViNK888WHX+RAr
 391Vb3l7s=
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

=E2=80=A6
> +++ b/drivers/gpu/drm/clients/drm_log.c
> @@ -0,0 +1,370 @@
=E2=80=A6
> +static int drm_log_count_modeset(struct drm_client_dev *client)
> +{
> +	struct drm_mode_set *mode_set;
> +	int count =3D 0;
> +
> +	mutex_lock(&client->modeset_mutex);
> +	drm_client_for_each_modeset(mode_set, client)
> +		count++;
> +	mutex_unlock(&client->modeset_mutex);
> +	return count;
> +}
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(mutex)(&client->modeset_mutex);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.13-rc3/source/include/linux/mutex.h#L2=
01

Regards,
Markus
