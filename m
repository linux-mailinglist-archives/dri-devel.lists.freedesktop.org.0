Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B691749BF7
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 14:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E33310E496;
	Thu,  6 Jul 2023 12:38:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372A510E496
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 12:38:19 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4fb94b1423eso850416e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jul 2023 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688647097; x=1691239097;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
 b=jykPrMUJAY4xBJwbGQgO7s7ViTgCEdjaK8p8r2Hl31f/ME81nnrE/qSUvaYDs3GbCr
 INRyrEdsVpysqBZs5wiJiqbcqwckhRRknydKNYKrnZEcWk1h3fMMLHHsIeI6LzztFReE
 wp3ExGqP7Rv7GbrrYqG8yUTxrSw2fbJQ5BXkzXUmJwDbG839K+prDf3VKbcHmNZ0rCkS
 S/2XxhGghDnDJT/J+XpXk4ChuISHxazpOGEganlOb+rViR2g8kLLCCZVzTIOe8zbI45w
 AMSdB6z/sVGEyN05Mc4nxMAj21opnQYAzzlKRX0lAhov6DNcH7i7yhyNQuejDj15w8UH
 tz2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688647097; x=1691239097;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+g5JOoGl8L8DXw0neDwErTp0xK2oXN7bvn2LD/LXr3M=;
 b=cIy2q7DGpaH+9UcxEi8HknJWGWL7tiIZV5WMkuWSBcTq1KNSUVE5bOc+QM4oXIRrzH
 8ihkh5MPAjrXsGpJJ3arbqDCKs6L0rWNVI4RxgxGOZOJf/bkq6lOfoAVEcM3s2Q6rogK
 NUpwHiEjtexqxFQBVSeaQQ8088Z9ZQQz4to0SRQNI3ZF8zCQN76qv/mQz8Noj+WXXWRY
 sissqSFWWwtZgrhgmfz8VPhH+tOQzMQ3I1RIzNU3PI3ijz1YbsUeY+Uasl+/n7xqv5qM
 ltPjIG3nMRhFUce5YoaUQwHzlPAnMbqfhI/WotAmQheAEoQVbY1qRQODAOhuTMj108Ch
 /3PA==
X-Gm-Message-State: ABy/qLYTwB5MgUZ0reEo0UOepIBiSlnTYaACPpyROl4Kb46lbNO1bie/
 YzVTWk+rlEMoLOtOtf6M5OYcXQ==
X-Google-Smtp-Source: APBJJlF7wnRSHF3/ATn3A9Kl9VBqBuZ1BW8ExsnFLaT6PZ0SXIHbr52DrsYzDXswnOwKrpEZC0n+4g==
X-Received: by 2002:a19:434a:0:b0:4f8:6833:b13c with SMTP id
 m10-20020a19434a000000b004f86833b13cmr1275916lfj.14.1688647096863; 
 Thu, 06 Jul 2023 05:38:16 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l25-20020a1ced19000000b003faef96ee78sm5006920wmh.33.2023.07.06.05.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 05:38:15 -0700 (PDT)
Date: Thu, 6 Jul 2023 15:38:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: fix an error pointer vs NULL bug
Message-ID: <534fcba2-2303-4e53-aafd-9668413fbf9d@kadam.mountain>
References: <694691bf-f591-4286-a615-df91d2ebab93@moroto.mountain>
 <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0f52b97d-0a67-3795-c9d7-3eaac9003aa8@amd.com>
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
Cc: Gustavo Padovan <gustavo@padovan.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Luben Tuikov <luben.tuikov@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 06, 2023 at 08:21:35AM +0200, Christian König wrote:
> Am 06.07.23 um 07:52 schrieb Dan Carpenter:
> > The __dma_fence_unwrap_merge() function is supposed to return NULL on
> > error.  But the dma_fence_allocate_private_stub() returns error pointers
> > so check for that and covert the error pointers to NULL returns.
> > Otherwise, the callers do not expect error pointers and it leads to an
> > Oops.
> 
> Oh, good catch.
> 
> But I think we should probably change dma_fence_allocate_private_stub()
> instead, that this function returns an ERR_PTR doesn't seem to make to much
> sense.

Sure, I've sent v2.

regards,
dan carpenter

