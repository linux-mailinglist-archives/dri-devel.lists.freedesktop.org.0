Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C42C684B904
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8A710EBBC;
	Tue,  6 Feb 2024 15:13:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="H/Us66/S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECEEE10EBBC
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:13:42 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso72255931fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232421; x=1707837221;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=;
 b=H/Us66/SbqrO2yAwdIRlp+k3TJ3EUUYYPO5i7Oe3aHT37ST9J+0IlurpGwo+zrFGDN
 1QgIYUcgDWoVA+kKCFnKNgVPtwJuSsvMBeQ/0lP3DRFmOQ7H+IM0wQ4KQhgMnyuGcx8c
 JD7vDju4uSVvTg73ICIy5a+mz5WmICvo6qwtri7SNVOYAKcXgduRCdt2/IUQrq7gX+lI
 J5NJZAUVlhEiFJICVLiUAihXF5feyRwzyK1u2TnSS3ieMzDzJkICm/KSCttagiCKkq92
 yFxBMwIt8iVkAq6ze1GhVFnsY6SG8S5wipic63xoFaF7KejnpOlyXWdcMWRSt27NiPa1
 IUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707232421; x=1707837221;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QWyaCH5kvW4ESs4M9KfJgiCk+SaUNMNInQ13HAztrpU=;
 b=kVHczpS7gGRlVybwNEbhVg772J0p6LWGGE/NyqdcYTwe7Qs311XxVwx2/QS2fjqMG+
 HrP+TDc5FZP01sR8G7zRrWWvj9vva7TNgq/coYiqBXTgwi3FHOGzPvLeM4Igv0jXKsXc
 kQ/DsEcCnBHVN0Uw7m1nlK+JtlAggjc7qYkQ+qZqizsiekY1d+VI0r/4X09RXCXYuS4D
 1PHsyI9hfrTjP8OXEKsSMtnol4OGGwinbr6xOyVB2B6pJBdIl8jF9cqshEVRzmwBC9Ke
 Ve9weMxtPtlDdobz+0XiS9sDho4hg7Llu7qm1E8xKNLbqIFFv3cOclU43MzNUhNdiVjT
 U+vw==
X-Gm-Message-State: AOJu0Yy3/3Ksu+l03+uKBkxNCKizcaaoTmQFicYro6lCzd0w8D/mpPkX
 ecVPfibJ8RhwVcQXGY56TOXOocZmbaLqoltlUqhl55zTVN5RdGSbGSrRyOcHntg=
X-Google-Smtp-Source: AGHT+IGixMnuJqGSOO1at9tSdlKV/uRXYeSHD7PzB5wvq+D88CIqZTbaqBdLuk5ykQQYRj9lYwj2oA==
X-Received: by 2002:a2e:911a:0:b0:2d0:94b8:72f6 with SMTP id
 m26-20020a2e911a000000b002d094b872f6mr1876981ljg.20.1707232420922; 
 Tue, 06 Feb 2024 07:13:40 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWGUn9bDa/+cXpeDv22Bt5ksTKulOOn/dRxfCkNbPExvTOQ8/mbXtrpu7RRJZQHOjOXTlIM8+OEfU39pP0pdAIzfjNpdv3YOY6yhEe2++JI0Dx6STaNnH6EGMU2WZ6EpsX4e4JB5SXR3KzONHQfNt+IMQdI5zBMc5ssut3RJrb3jyiiDigMR7R+JW1iO2JXcwOw0e8a5QEI1d62NQqoN2rf9iJ7ftIsdZPxfsvHwDbREBQu0VCSUGL6h7m0A42MMmpKwontEOqmfvpHMRalFUFTYCQqxVseL+FkyQMl+4elp1rygVUk3j8yKETORIUp/cvJy92eTEsoSOtyj7MWyo8wN91AUX0p6/un/ouuxSlSWLnU1J5vWYPS+WiESocvAKoVuGF8shbNicLltg+Xw0gRolHIFHi2rSRkjQ==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05640243c300b0055c60ba9640sm1113733edc.77.2024.02.06.07.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:13:40 -0800 (PST)
Message-ID: <2d97df42-1d23-456e-9f0f-36b8aef08670@baylibre.com>
Date: Tue, 6 Feb 2024 16:13:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/9] drm/mediatek: dsi: Register DSI host after
 acquiring clocks and PHY
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-7-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-7-angelogioacchino.delregno@collabora.com>
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


On 06/02/2024 13:07, AngeloGioacchino Del Regno wrote:
> Registering the dsi host with its ops before getting dsi->regs is
> simply wrong: even though there's nothing (for now) asynchronously
> calling those ops before the end of the probe function, installing
> ops that are using iospace(s) and clocks before even initializing
> those is too fragile.
> 
> Register the DSI host after getting clocks, iospace and PHY.
> This wil also allow to simplify the error paths in a later commit.
wil => will

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre
