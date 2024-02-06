Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1549584B934
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B9710EEE4;
	Tue,  6 Feb 2024 15:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ow88ENNw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E9A10EEE4
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:20:13 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2d051fb89fbso13994281fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232812; x=1707837612;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8O4/FEfA+7IjxF8Rp85VBJ4sBehSYPl7j+rejDvNsk4=;
 b=ow88ENNwQyKSOzjfubxScxa+pZWC+FP7MGZ+uc3JQV88vkox5UmnH6eaepM1hrAHoN
 awwY9ESenOUoSutl0RcugKuPtLkeLMRggeKS+qbkC40bCtc9/ab2OiKQjTJ8LdSHIEBI
 2G8S4uHz6kF4cTaaixYR+LxgRUj6yEoRKcV8JZSeiDxIDTK56EWHngzWRg9EUPtSIwYH
 zexsdv1ZO1zbZOeqturf7g7VCK+Nl/2Q3D8TWRkBOXO/wf3oQNUm13jvd0k/nKjqHO0A
 kMIsO4GFkGyEKQpiUwvu0BFLQkRmlt6vVkOLUwtuLCv6DIPZDGXM77VLwpliTAOrbbA1
 XGaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707232812; x=1707837612;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8O4/FEfA+7IjxF8Rp85VBJ4sBehSYPl7j+rejDvNsk4=;
 b=U5UlBqYqCsIqSK41anFsIJ1s36GZx3bXcJU6H9dsYb/IakZrsosorRJGKKqfuptHJP
 +HMfGgEjcLz3QmzKa+FCIJCJWKKPso9Ju+dnwLHz0fnETwXIglW+GgSlfUp4IgSVM39+
 MjPuKq/bsxEduaHyeA1EzQYCQC4ntfQXYCkH4ePp/Sz13QGXkwWEG8J0j4yVIgkdmJne
 N39of/usTQ3ZSKndbknoyjdzZwJQ2C/Xq7/PLmTYUbhAdDMxAyubjEJgBKxDxuwE0AIb
 klDBnbgLaCUy29qFRVwNgJirg+4+0l+3/vup/B7ypPEKE+r8lEWHUxWRER3ZWcbmMRjQ
 NP2Q==
X-Gm-Message-State: AOJu0YwGQbpiNropJ6j/WazSTGErY4Ys92RKujAl6fyN0l7+axTZ834b
 Emr8rytWU1/FC3W2TxW/73t6Csjh81KSC8O2SaGKZyUQKgYhZ0Zn/1ILiS1YW98=
X-Google-Smtp-Source: AGHT+IHVu9iBrdkkkgq+oanSyuWk5pt0e4V58k5SlYTmULii3Sdu3Gp9l3tagiGY3Gjuxx1SlBhGgg==
X-Received: by 2002:a2e:9958:0:b0:2d0:a8f6:c882 with SMTP id
 r24-20020a2e9958000000b002d0a8f6c882mr2456827ljj.42.1707232812015; 
 Tue, 06 Feb 2024 07:20:12 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUwLA653clU15DlK9NIMq4RaBjxjUy1wiuWtski4FAmOO5NGL5Abxxx/EJ2Vr/tEQDYz6FZ1d7pn+XYl8AAHsPwD0n8P7EoIlK2DQywsZmf3vFJ8Upybe5Y4PzWdGi4cd9RICB3horY4KcRap21y0g5Hjmlnj5yw5CUdG9rff2rbgwzzeaDyVg1c9tDWrQeAXpJGw038Yybu+534ZRjUGwC17W2fJDMqUt+yLWyf0HxLR4YVjG7pw29ebFRAnyzS3n/yhz+xuqaRGJx3q8WQEocmyGmbp+eSbxxE/OnOkoIPkKeq1H04NjblKqBgQtEhu+EwM2EwvQrA/Rz/481UY6puAx5CRVQLzhKkRKTBc4FxXedcItqpw2DZivFCJfbpvfrgfLc8Dtb57L0CCZnntFaJUrGnlNjHGivPQ==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056402074800b0056022d78141sm1124432edy.56.2024.02.06.07.20.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:20:11 -0800 (PST)
Message-ID: <16bc6402-c60a-4857-a7e9-a60c3507c979@baylibre.com>
Date: Tue, 6 Feb 2024 16:20:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/9] drm/mediatek: dsi: Simplify with dev_err_probe and
 remove gotos
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-8-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-8-angelogioacchino.delregno@collabora.com>
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
> Most of the functions that are called in the probe callback are
> devm managed, or all but mipi_dsi_host_register(): simplify the probe
> function's error paths with dev_err_probe() and remove the lonely
> instance of `goto err_unregister_host` by just directly calling the
> mipi_dsi_host_unregister() function in the devm_request_irq() error
> path, allowing to also remove the same label.

-- 
Regards,
Alexandre
