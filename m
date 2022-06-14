Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5998F54ADEC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 12:07:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A6410FBC5;
	Tue, 14 Jun 2022 10:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EFD10F37C;
 Tue, 14 Jun 2022 10:07:12 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id t2so7376768pld.4;
 Tue, 14 Jun 2022 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=1PYCxh/aEy1B/B4SGvA+P1dNrNFqRqlM66HHaxRQnxQ=;
 b=gbB2hKVA+eQR7MyVJbKPG4X7RLQo9rH5gwYb+y/jJjedFWWWUmRMP3Gb0euvIFdf5Z
 V5zg4VDsMicq4bJjIqv61oyyhoYsUjA+qFId7Rg7ubHmW8bYtr03nyNi+KFBNRLl444G
 ppfrqmqFrJXZ/tmu+4Ej/huzsQHBQx/2GVnVl4ifjlT1tmI0NiR+UCYc25JJYDTRg4uu
 lheYuAYhDdmWn9GS4sFb4nDh22AWui+mLXh1G2H7PY3sTOkdQyFtgurYXssmUUJgVD/H
 QmB39t+juHcI/RuKPe5CCaOJglEjmidjmywFI10mf9ZZPBlx0pIWumW5Cf5GEDVAteu3
 hguA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1PYCxh/aEy1B/B4SGvA+P1dNrNFqRqlM66HHaxRQnxQ=;
 b=Y1u1iFQ6BxFFbLPaf5TCGV/pgFGPPpUPThJt5jPiDEWTycaOP/cJkJqB3NpfpA0fdV
 +sjB8RYoo5ja0RaiWqgeSAyuwKgAabh8X92oQ0rNZTqvUxX3LKJ9wqjm85QJrLrdrQGI
 dqxO1HsSYDh9+SSZUgqkOhLozAGpRozGn/W7gAQ7WuM4KmJjVfx4HyNIv4rzbzpwzEO0
 7zqQmyhE8/TmdAwp9uyuNCY9EnfJr9wu3XA8VSruSAnhQUXCfoWy3n3q/6qZoWNTE+pF
 QO18QYylFuhLnMAYRFVhPIKIMYxFZCBe7avM11qIoB8JhxiNehtNMRJIS3njtTUcpU/0
 81kw==
X-Gm-Message-State: AJIora9+9pITH07oAgJ3assxrKrpiol0kU0prkcdAaFFBNo8M3RcxSpx
 io31H1UjJwZP1Z/T5CNPyJ4=
X-Google-Smtp-Source: AGRyM1tfe1iHHvOsLHmLzA4Kc1RqE4mnpfUb1ktvaQdNgaeBEKNlz+WTmfaAU523v0cW0EGHi8l6gQ==
X-Received: by 2002:a17:90a:e50c:b0:1ea:14c1:2236 with SMTP id
 t12-20020a17090ae50c00b001ea14c12236mr3858090pjy.2.1655201232415; 
 Tue, 14 Jun 2022 03:07:12 -0700 (PDT)
Received: from [172.16.4.4] ([219.142.145.25])
 by smtp.gmail.com with ESMTPSA id
 je9-20020a170903264900b0015e8d4eb2e3sm6730333plb.301.2022.06.14.03.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jun 2022 03:07:11 -0700 (PDT)
Message-ID: <0bdb3a64-e795-4aa0-86c9-efd7fc3d5a19@gmail.com>
Date: Tue, 14 Jun 2022 18:07:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf
Content-Language: en-US
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 David Heidelberg <david@ixit.cz>, Guo Zhengkui <guozhengkui@vivo.com>,
 Xu Wang <vulab@iscas.ac.cn>, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220607110841.53889-1-linmq006@gmail.com>
 <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <059e0a81-3c0a-1c8f-90f0-a836da1204f5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

Hi, Abhinav

On 2022/6/11 7:20, Abhinav Kumar wrote:
>
>
> On 6/7/2022 4:08 AM, Miaoqian Lin wrote:
>> of_graph_get_remote_node() returns remote device node pointer with
>> refcount incremented, we should use of_node_put() on it
>> when not need anymore.
>> Add missing of_node_put() to avoid refcount leak.
>>
>> Fixes: 86418f90a4c1 ("drm: convert drivers to use of_graph_get_remote_node")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>> ---
>>   drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>
> This patch itself looks fine and will cover the cases when there was an error and we did not release the refcount.
>
> But, even in the normal cases I am not finding where we are releasing the refcount for the panel_node.
>
> I dont see a of_node_put() on mdp4_lcdc_encoder->panel_node.
>
Thanks for your review.

I don't see it either. It's a bit messy because the reference assigned to mdp4_lcdc_encoder->panel_node and mdp4_lvds_connector->panel_node both.

> Am i missing something?
>
>> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>> index fb48c8c19ec3..17cb1fc78379 100644
>> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
>> @@ -216,6 +216,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>           encoder = mdp4_lcdc_encoder_init(dev, panel_node);
>>           if (IS_ERR(encoder)) {
>>               DRM_DEV_ERROR(dev->dev, "failed to construct LCDC encoder\n");
>> +            of_node_put(panel_node);
>>               return PTR_ERR(encoder);
>>           }
>>   @@ -225,6 +226,7 @@ static int mdp4_modeset_init_intf(struct mdp4_kms *mdp4_kms,
>>           connector = mdp4_lvds_connector_init(dev, panel_node, encoder);
>>           if (IS_ERR(connector)) {
>>               DRM_DEV_ERROR(dev->dev, "failed to initialize LVDS connector\n");
>> +            of_node_put(panel_node);
>>               return PTR_ERR(connector);
>>           }
>>   
