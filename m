Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E35884B93B
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 16:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87207112572;
	Tue,  6 Feb 2024 15:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="sz1UfJaZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C19A9112572
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 15:21:06 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2d08d34ce3dso41692801fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 07:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1707232865; x=1707837665;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RIc4mpHkEyVhvzKbl3/CXTyhjyWRujcUA5n7Ow/N8Kc=;
 b=sz1UfJaZTFmUiOcjH2ki8XKJKyu4eN54wY404r619fZ9YkPvHlFL3Ha+xrg9xbz1rx
 I6bTBIDwRgKXiYnhNNFksc6b3DklwWcTrhaOtFcsYBcIVW+usvQI1LoexnY5gV7CYm6A
 06L1atid23ipp189d5fMAnTIww/Sv3eSJyAjEmKUdq+48X8k6Rfq5hnVXmeoEbhfxYdk
 ibhmRiSQjFAlupTH2vEgnNocFsPW4akl08WAV3QC9y3moHqLlV2VzJtwSqiVB1f2K1eI
 ESt7g26S13s0yOLDsmuhuPkAY0QlSgOrDT9y7iKr+p57aHgH82Xkou9EmW6Ih4Mvfotb
 VV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707232865; x=1707837665;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RIc4mpHkEyVhvzKbl3/CXTyhjyWRujcUA5n7Ow/N8Kc=;
 b=HgoaKSabVJ9gtxeOVurS12jZLO/C5I7YhwXkaCSvUKpz/R+I5l6EiKKNHi/gvHNhvv
 t+8N2M5J/Arb9RLZjTOIzbfqlX7YNjrCdv5OQE3oNhshj+d31taa5glL5RDheNl5wLYy
 3JKPKQMCfP6p8V+mxUipV5Hiu1a5x1xAVX9eVbvopA6sF/9yFX6vhydGREEBDawEMH5j
 xW2HEz9HCwyw5G2yelyx1IxprqgRecOUWwbDCdmhJ5OXCsi7IeQH6A5qL3UVzUj+lbNy
 MFoxCKMZzHFl+fzQnCyepH+oEgWur/lYHtltdD/UWYniu7CKV9In2Dp/aR0TYAczBUSA
 XwoA==
X-Gm-Message-State: AOJu0YxXGGWUXyq+ozT3ZJEJMpdQ3mfZMLP2q6l2k/HxZkSbK4nFjLyX
 jooy29zgkGL5MekIRI8U84Dw4HbqLzzDRVaDpfrmL4OduwSxxV5126KAunWP78A=
X-Google-Smtp-Source: AGHT+IH6B9hxtB51OAbCk+OHsZztqp+0HCBvlYX0qY5/9gpcQGkhT3ZpT3m/XchRQjfWgcgI6+PF/g==
X-Received: by 2002:a2e:b24d:0:b0:2d0:908e:d825 with SMTP id
 n13-20020a2eb24d000000b002d0908ed825mr2135508ljm.21.1707232864903; 
 Tue, 06 Feb 2024 07:21:04 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVzh2Ov2RC+YTsegCX0tzyIx3Lk6zKPQmeoT6oJ0BC1fRsrm0SsQBPV4G5d8jurnLVezvqIF0LxGaRRFkCFI6iVG7PryI+Fx5Oe9TfkG+BkF7qENEvsMcFd/Q1Xu5i6TEFk9m+ctOVtJ4C2UH//Ks/72ACsYssXDlbe8POsU4ku5swiJNOSS/SyLFcYEDlYSYiTtxZe4xgM59SlWwvKr2Geqojgb0jzz7f5bo7szkiMAUE2a36mnV6xHu8Hy8gbe1SRimKUMiOGO+dK6cV5NktlO4d5oAkXeV1fdDpQiBVe0LqysNOUyBTcTvKIH94M7GHJSyoMg63UjPR/ycon8igVEoL77TUZ/p4TAs7tLyD6Gdb1eoTC9+iSsX45I5B/nYCNucFr1SaFgoUJVTY7rYPRQQNmJbFu1rSlFQ==
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a056402074800b0056022d78141sm1124432edy.56.2024.02.06.07.21.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 07:21:04 -0800 (PST)
Message-ID: <07c825c7-5036-4b9a-946d-eaaaeb4c050b@baylibre.com>
Date: Tue, 6 Feb 2024 16:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 8/9] drm/mediatek: dsi: Compress of_device_id entries
 and add sentinel
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 chunkuang.hu@kernel.org
Cc: fshao@chromium.org, p.zabel@pengutronix.de, airlied@gmail.com,
 daniel@ffwll.ch, matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <20240206120748.136610-1-angelogioacchino.delregno@collabora.com>
 <20240206120748.136610-9-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20240206120748.136610-9-angelogioacchino.delregno@collabora.com>
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
> All entries fit in 82 columns, which is acceptable: compress all of
> the mtk_dsi_of_match[] entries to a single line for each.
> 
> While at it, also add the usual sentinel comment to the last entry.

-- 
Regards,
Alexandre
