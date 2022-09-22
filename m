Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DF5E6C30
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 21:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7764610E16E;
	Thu, 22 Sep 2022 19:54:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460BE10E20A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 19:54:24 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id f14so16462359lfg.5
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 12:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=zDb70WoeINlNx9irFKk6bRAswY6QKXf8jtRE5Sg+xuc=;
 b=e14Rma8aobSIPoTFiAvddfO9VrrSEWb5OAv/vAYZrJyxHZLKgNe7FRwCy8H+rMq55z
 9SgiTOBTOW5fbmBNgeSLAEswJqAdv+LvGlIkFYAwH5ZmH67wkj9mWeUbArfatAFrMITy
 9DTvu3wxHjcAVDwgrJzXLdF5we1tV7FdJIj9KDmNAUPS02FjiFghQr2HzEoA0jbmBTdD
 yFe40SVo0m6meu1ADwI7rqHmpd4ZXWuul8inj7VP+Iu89bdcLwE+TX3DtI1IyE6YolYu
 EE9zpZO9JDEx7z8DE50gxK2keFlv11vniqms6lWh7RqacygUPDuWhhjAvMThlrht3wx3
 meug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=zDb70WoeINlNx9irFKk6bRAswY6QKXf8jtRE5Sg+xuc=;
 b=Jt32K560FqhqM2Oy5kHn48u4flYcHaikPY0655LMD+IZ2ePZCBYjEKQs2bUF65CgOv
 TgETjm1qx4401FQMbuBdtjUUNTQfS9Wu01Wd7MDnCJSXrUmhs8aGx3lGRojoIm2lA3Xb
 xgS26Q+3VKpUAXMxKigo7ju9C0Y09m0quk8KVG/gcaedkg6rnofvjCGW27xyPO7haCI+
 G13I68zLTg1VxRnMAJ7GulxA+yjnvN2cdSANMCS+HRFj0MmaF3U00DItdAgxidjH69TH
 DiVW2RSEqP/dbDDhirJ4E5X/0AN7IwZil/4iWI7yQ4SjA8hwuuPTGrBS0lbVBNmAuhg3
 6n3A==
X-Gm-Message-State: ACrzQf2z3vljWZbxi+TuPHIDQvnKRbBLRzKvFGLjUo70dV+PaSYhQ2CE
 2ZiMLAvku6MmuQYqvQQIS0krVg==
X-Google-Smtp-Source: AMsMyM6rSKkJT7IrEEGLQaau0EqzxrS/guqoT52jaku/kN4wSEXcJRuY7+W54WkiFW0yNFbLYDB6yQ==
X-Received: by 2002:ac2:454a:0:b0:49c:6212:c44d with SMTP id
 j10-20020ac2454a000000b0049c6212c44dmr2035689lfm.430.1663876462589; 
 Thu, 22 Sep 2022 12:54:22 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 r10-20020ac24d0a000000b0048af3c090f8sm1089401lfi.13.2022.09.22.12.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 12:54:22 -0700 (PDT)
Message-ID: <b3b59b86-d9e8-5706-c9e0-152523661e9e@linaro.org>
Date: Thu, 22 Sep 2022 22:54:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 02/10] drm/msm/dp: fix memory corruption with too many
 bridges
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220913085320.8577-1-johan+linaro@kernel.org>
 <20220913085320.8577-3-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220913085320.8577-3-johan+linaro@kernel.org>
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 stable@vger.kernel.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sean Paul <sean@poorly.run>, Steev Klimaszewski <steev@kali.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2022 11:53, Johan Hovold wrote:
> Add the missing sanity check on the bridge counter to avoid corrupting
> data beyond the fixed-sized bridge array in case there are ever more
> than eight bridges.
> 
> Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> Cc: stable@vger.kernel.org	# 5.17
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

