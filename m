Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2177916E3
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 14:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA1E10E334;
	Mon,  4 Sep 2023 12:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B30310E334
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 12:09:36 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-52a3ff5f0abso1813665a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Sep 2023 05:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1693829375; x=1694434175;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fe52d7wymHVSRnUd4doTrEpU+qOQW0Adu/PC0B+zMbY=;
 b=ZtP1hB9LYUyU9vrvkfJmWOAv7PgYODvq0bJ+c44/C1u1+RWvGtlah+9iiB6jYIOSth
 PcvjgoX107d3zkH9oIhdgqit5EQFkGmDbE+Kk/BoS5V1jc4uowvGQjHz3+gMYphF5UH5
 lN1rjUNZRANhdnMFwzWcly8s6dzrup0QReglWpYDoq5sg7fchJvNjgl9Pr2oUzrX+Ztb
 0tpgbx55tloLk54/rKUvdshKhAAsYdT1oKQYb4yhiKBgtwk2Jh9PWwxIb/Xf8W1yVACq
 L9VY7wRd4CGMlD/Xr9cWNMzyjIN+LjAAqjv/71a8EnYqnabP4NpdppcUAcG5YTCmQ0ej
 qRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693829375; x=1694434175;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Fe52d7wymHVSRnUd4doTrEpU+qOQW0Adu/PC0B+zMbY=;
 b=MCIxUertGDpf0gtWZMfJdCE21CNnlGS/D1GOBAmd8vvlIk8oVGhdit83vORFoTEZyi
 o7ST4FOUVpAt9Gnjzj6+fQRiKVQtX/+D0PGj+o1BlH0/sEaPsSTHD/Y6JcDPwQEN5/cs
 JTZW3YJ2Y5Ly5vV8uxCW3x09St00eG6X9iZ5R3MTbfTT1eE6hQHtsnbikYhcv3olhvA1
 fnyAlSd7fXEDGp4m5Gto5h5dVmlr7hHW5WdWQUBYTRHsBbWKp6nQ9xc7xOTiJ5uolVLE
 3gN++WXcMzwT05dlCFAnwfVbJt0hfT08+btrmNiqECqCjTNqWGp2gGrIgJ3nE+71J5m8
 eARg==
X-Gm-Message-State: AOJu0YwtE8zRj/UYBCGDmzJjysJDH7ekvBnt4UCAQW/eVE6t+Do7ax3O
 wlXmWAH3oNmZyHzM/Zl0G7kFag==
X-Google-Smtp-Source: AGHT+IG4htU9jlytfOWTOOiTRhiMXfK1Yx8nBb4GGdVYDdsVmhh1c205BCxily+P8XS3+GVSvF6GUg==
X-Received: by 2002:a05:6402:1f82:b0:52c:b469:bb01 with SMTP id
 c2-20020a0564021f8200b0052cb469bb01mr3263539edc.38.1693829374607; 
 Mon, 04 Sep 2023 05:09:34 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056402320900b0052e2472f884sm1443153eda.21.2023.09.04.05.09.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 05:09:34 -0700 (PDT)
Message-ID: <e380a452-ce93-8af2-4075-ef23987d693a@baylibre.com>
Date: Mon, 4 Sep 2023 14:09:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mediatek: Add spinlock for setting vblank event in
 atomic_begin
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230822132646.9811-1-jason-jh.lin@mediatek.com>
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
Cc: Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>, dri-devel@lists.freedesktop.org,
 Shawn Sung <shawn.sung@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 22/08/2023 15:26, Jason-JH.Lin wrote:
> Add spinlock protection to avoid race condition on vblank event
> between mtk_drm_crtc_atomic_begin() and mtk_drm_finish_page_flip().

-- 
Regards,
Alexandre
