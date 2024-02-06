Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539784B89B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 15:58:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF0E610E5E9;
	Tue,  6 Feb 2024 14:58:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZQ/6FEem";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E32410E5E9
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 14:58:01 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-56061ad3d3dso1363023a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 06:58:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707231480; x=1707836280;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VCL4zV/fY4TbR6w8G33YGfXgioFiEYO2kvyU3dpfMUw=;
 b=ZQ/6FEemPWnO63c7fe7+9VIuDaurPVWBjFRCkHbiYBb4untkhNS1T/ld8qgx7RUerW
 /xhinkj5H/unH3YbqXV2S2th0OsizDywukm9b7G7IbvlrAuzz9E6Nkv4QdvLt2y0/gHp
 bEfSP7vL2zgqNqhjNZlYuG6T+gCZ8OPbJe35wGEgGJFRX90xQ1ZkiuhpJvjhBsAl3yMZ
 ZxgZjb3/eKJ5KjMRJzwKMnKbbx2cBrdNUwpYzm5jsYTxU0fbhsyCo+xcCpJeBjX9aJp2
 Vcg8h2Av5KjzhsFx0zDkewWWDGYcR4IRwF2TNeiJXPT8NhWWQB5x5IVcUXE/lm2SKIZd
 LCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231480; x=1707836280;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VCL4zV/fY4TbR6w8G33YGfXgioFiEYO2kvyU3dpfMUw=;
 b=ZKsa/okQbEZrX7V7VHylfd1Z0VmPdAukkMWkpoUe09Ipsrj279W3ZzJI8Qk0AAOM4v
 cTF/lAlGxITy7xY+1n6VPijLER3XCMGL+pE4nncRUamOi76bj9uR8Fjt/1pBHf2J5NIS
 lQ1DtaboGkZ46SKNJalivFXAsR8/oUoJrLUUcpLpEgeqKAk7JuB74t6f8p4vHalU8d05
 HCAVf/9hff5brOrsIPM7iBxEP489Yr6Q8iTn4IU+eVgFxTbz9gwOfMUAQx9kzogexkhw
 bLp4Mmp7hC3xixSzYiBsCK+/zUZFUU3hpvuduPzMV8t5LzGEWWxcra3Rknvdfsub/Em5
 uA2w==
X-Gm-Message-State: AOJu0YzmuhZdL+mZGm/SADmwkPFQGTlEWKCNqdwg9NZ/vfbyt6t02J1y
 ssDQ+V+VI8wwajtBbv02JRvjM1rfmU64NtHFMXzYE4daLKgVMudG7/GoPQhP8dg=
X-Google-Smtp-Source: AGHT+IE/xkMN+vq5s766SYdEh9U5SinilVRtC+iNa3NXit0ZGBcC6EM87J5PH4nbqf7jKMIRuG73mw==
X-Received: by 2002:a50:bac5:0:b0:560:bb98:6b7d with SMTP id
 x63-20020a50bac5000000b00560bb986b7dmr972125ede.10.1707231480008; 
 Tue, 06 Feb 2024 06:58:00 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCV2qU3BBiKmtKQKW+yzgCKFG+aWqLGGCGZ5OIYjaHTbPrBA4VcqyeA2tbkxDyqK6Uv8LGmGZPGVg/aF7sjjagiuwvo2enujdmA3klp0fgwUIN+gU1AzNmx4aroEb8uepPsd1ckdiGwcQLppJvKWeViTjAISYcxXJlRQNQobV1+h9N46OhD5XRfekGxm3mv6v+KkbSfEGnKXRve612YmHswTbkpE6Q8QEomA9mgR/4xdQh2ZQ/BypZUTAc3dypAI1dwEj/pjUdXaSZsxUqp3HXoriAHaLqyNWU7W8tr2n/zcCBqj87uGjm1hvswqATFsWZnCgOsQf/atT/OH4zWU+R0VND68NHY1JOs4JXbvrXFA1/20Bsofkh1KvYNu/bdPfyhikHRxpfWMAYDZ93zCfRYXOxRTclY7o89dMg==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 cz6-20020a0564021ca600b0055d312732dbsm1120026edb.5.2024.02.06.06.57.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 06:57:59 -0800 (PST)
Message-ID: <74778dc1-1c36-4db8-9d5e-abdff9f8d8a5@baylibre.com>
Date: Tue, 6 Feb 2024 15:57:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/9] drm/mediatek: dsi: Cleanup functions
 mtk_dsi_ps_control{_vact}()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-4-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Function mtk_dsi_ps_control() is a subset of mtk_dsi_ps_control_vact():
> merge the two in one mtk_dsi_ps_control() function by adding one
> function parameter `config_vact` which, when true, writes the VACT
> related registers.

-- 
Regards,
Alexandre
