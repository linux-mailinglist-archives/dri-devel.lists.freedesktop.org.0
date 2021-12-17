Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B5478DF3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 15:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF6A112823;
	Fri, 17 Dec 2021 14:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D797112820
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 14:39:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so1674031wmd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 06:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=HWygtIWBaax9xKMejUdqL907XvRbbIbFJ++8LtFRCPM=;
 b=j709/z9d0nSj4a0LhjxAyTEsN82bBOs0ZuTF0SBlP4ANVkoPs6vU80t/hCULEe2cY6
 e9ePIzlfTZ+pso6oQW4Bx3WLmELFM1ye7QLPCo8kWo/rO02s8Zah0A0VOzXbTP9HrANf
 J76KGHrHfzwzQE1OE/3mx6gNNJoPPlJLh9m+nRgMVcTUKK4m4pVc25BGxaVzBefwoTDg
 GaPrTAWH+hapqZRvVRazMowjmEYmaCNtUgQ7GRK17yhpyP3H0ir+WnjulWYOixtxjulm
 2yDImCe+IiUPn1SOX3haboDK6x7G2bHkqCBdmXNSbEB8qQ1tXjOrPVuJVFh6lL31sC5C
 APfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=HWygtIWBaax9xKMejUdqL907XvRbbIbFJ++8LtFRCPM=;
 b=x6hvX5cUeepMmo1uoDFb9/yMQdun7gE2CC095ZPeRC8nVA/kK4dQoR4+PQ30Q8gnlh
 G+r328muPiXntQ3ZlGTOrne1nGkEtkm21XvLU5LjqDQqI/eUQbruyfCq8Dn1CBRexWOT
 jthAOLxwcVyCLzZY7jgIY1DUoejITJhyA8lcNbYNfAZzAJhztEcbSNS8molwpKltKPRM
 yXu6BsZSlB5fLJdJzFmez/9/a7Bj6ef8Ev1Ty5N0rS6tZA9kwZSgTq5CZV08H3cKwPdo
 tVn6iGa+ut8gskW4hIuVeGCm2neSmlGCJmdlE76//+tNSpH6mj6supGTHrsb9ZK/pnW6
 ZZ2A==
X-Gm-Message-State: AOAM531AJ3A4cj3pY+jTvDMxqV6PGIiDT7Kbr+l368jtmv14wlfYFpay
 B8eysM8s6NcN1sso3p754iFdf0qLGIs=
X-Google-Smtp-Source: ABdhPJyo5WDyT2lwprMsF8S6JSfvPGHlYUch6ROyXUW3mwaC72PuDgs8QSZqOEU1xTpafddGznuFMw==
X-Received: by 2002:a05:600c:8a7:: with SMTP id
 l39mr10158138wmp.138.1639751994168; 
 Fri, 17 Dec 2021 06:39:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:5aaa:182f:8216:9a28?
 ([2a02:908:1252:fb60:5aaa:182f:8216:9a28])
 by smtp.gmail.com with ESMTPSA id l5sm8846192wrs.59.2021.12.17.06.39.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Dec 2021 06:39:53 -0800 (PST)
Subject: Re: completely rework the dma_resv semantic
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20211207123411.167006-1-christian.koenig@amd.com>
Message-ID: <e8c7284f-e18e-0dcc-f0a2-3a1ad6222fd4@gmail.com>
Date: Fri, 17 Dec 2021 15:39:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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

Hi Daniel,

looks like this is going nowhere and you don't seem to have time to review.

What can we do?

Thanks,
Christian.

Am 07.12.21 um 13:33 schrieb Christian König:
> Hi Daniel,
>
> just a gentle ping that you wanted to take a look at this.
>
> Not much changed compared to the last version, only a minor bugfix in
> the dma_resv_get_singleton error handling.
>
> Regards,
> Christian.
>
>

