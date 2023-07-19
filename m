Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762CD759075
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:40:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9FE110E42C;
	Wed, 19 Jul 2023 08:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7885210E42C
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:40:06 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fb41682472so10827143e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689756004; x=1692348004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OfNCJHWUchnvMIqHHiATQW5mr5Sy8zim9WS33GnJN6c=;
 b=YIxAjV7eeh7JnxMZVdbcxqmJd7a+8C82frrJX8W6bkO//RAraPb7mtloz0O5bXzDqv
 lMxErKs+Cr0AW9uyG1RHizjoUT/PjF4z3U1Ra1YRgtee6JjZGyuhXbxJtWest4Ykt2yq
 PDXp++m5fUvHDXJgLtuwLjtXH9NILnVNgs890Mds1PjUyevYRSYih14HcmBfpE36XVQI
 tvudy68+oA260HjwxmV00qyzjaTkfS3vQsVQJzLHrnatnzX31d4FO8Wwgjg2X79ytQIH
 2yZgEMGi/txyP0AP+ondE0KmqBwmjjFGsKtt1Xa7v8ITY+VxoxrD+WDVuyLcv4esO4yG
 o8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689756004; x=1692348004;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OfNCJHWUchnvMIqHHiATQW5mr5Sy8zim9WS33GnJN6c=;
 b=DvaVRPXpY6B22xT6hNqnwWa0A3kJDR76YUXmElVe7fGpDwLn08Cs1R8fw1JJOhbxN6
 EjDBYUdWr972eR7a2ATuteiJmvkJTau0xyh79YHPlSOwyP3mQAPfuyyiyNLRwlYwsGIa
 EFjstWqbD/qH0Gz0YpTe2e4BJqgURR6I6Z0QlwzUvtqEw3SMzS54q41tcyLpuPspD/He
 bUqROQUAgBrGmxJnTo20nVcTH8UgPCGV22SnO0Eqi81POuI8fxpKaXrnpq81LGEVydMh
 jvcCYszJnCQD7LDTyy7AR+H7C5tIwrNjjTcMQ/hYC4PIjErW0DlAIKQCPUeGT98OQuRq
 hJWA==
X-Gm-Message-State: ABy/qLYuYBP1VvcBfv736ElWRSf2tpQmt2ajEUNfsXqwj3GV1GUyoPcY
 MHfaa5+ZM9y78MBXU/Iyzazq+w==
X-Google-Smtp-Source: APBJJlEGIh6EJc3hIvURYXfWZwBHenJsUPSIexn/TgtWYX6pQ36DG8dsRVx5yQKCWKTZVKF/YCQ1BA==
X-Received: by 2002:a19:6703:0:b0:4f8:7781:9875 with SMTP id
 b3-20020a196703000000b004f877819875mr14157131lfc.60.1689756003991; 
 Wed, 19 Jul 2023 01:40:03 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 m21-20020a7bcb95000000b003fc00789d5bsm1143380wmi.1.2023.07.19.01.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:40:01 -0700 (PDT)
Date: Wed, 19 Jul 2023 11:39:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: suijingfeng <suijingfeng@loongson.cn>
Subject: Re: [PATCH] drm: loongson: Add a check for lsdc_bo_create() errors
Message-ID: <007d3f52-1094-4814-8e00-15147605ea9a@kadam.mountain>
References: <0da6859b-40cc-4b3e-b8b6-fed157517083@moroto.mountain>
 <c9ac14ee-7cfc-c10b-4a55-37049bbb4338@loongson.cn>
 <bbaa11a9-9984-40c1-bd63-adc8698d0185@kadam.mountain>
 <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <674cc4b7-6cb1-5329-d06d-c981ac8ad240@loongson.cn>
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
Cc: kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, conduct@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Yeah.  Sorry again.  I was frustrated.  Your email basically said
everything was wrong with my patch.  The subject was wrong.  The commit
message was too short.  The Fixes tag was wrong.  The patch wasn't
correct and didn't address the root cause.  And then when you mentioned
"bare brain" I misunderstood and took it personal.

In the end, I think we've all agreed the patch is basically fine.  I
will change the subject and resend.

People are going to send you patches, right?  It's not a big deal.  You
just have to look it over and see if it's useful or not.  You should
try to respond within a week or two.  But even if you apply a bad patch
you have a couple months to test it before it goes to users.  And even
when a bug reaches users, that's unfortunate but it can still be fixed.

regards,
dan carpenter

