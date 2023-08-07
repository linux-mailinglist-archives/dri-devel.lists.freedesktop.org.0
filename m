Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62559772826
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 16:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15C7110E298;
	Mon,  7 Aug 2023 14:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DCA10E298
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Aug 2023 14:48:31 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so6097006a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Aug 2023 07:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691419710; x=1692024510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
 b=LAGX7jbG6F4fq0qqXNzbtH86Na7x01qv3FacE1USHXDEuPJpTPvENMIlED/2GBOsJh
 6Altx05H7uymr/LpYE47VAUyns0iHv6/eW9j+xnJkl/WLNPzU18B/VX5CZdpu0+KGAbo
 g5ymBhw+YfaA3o56MEAbZZ3bint0HoWQ94wAejTZCBnAiEeVeIo1JfaRwdq6uof2OraY
 0YtT+Ksc/EgkkHyUS9A2ZhBRbnJJgn67c9lJo7TWxXutCMBQlVi87Hew6c1UnLG/+p5G
 2SWr/80LrE3N9Cp7fu8ZdgYJuQ6uc1cwSa5Q5aa+Ap96J6eNodixg8bEBlI8qqEEZ6bO
 yPog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691419710; x=1692024510;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g5TONaCzenbE58exEYn4kekq6odZjjesIxjsYL+WXEk=;
 b=R+xms5sRkkD+r9/pJivHktQTrWMh8Z4MjjtSMNxAZR2dTaAw3bA6264F1QaoEfIart
 5BgjsV9xCQoqDp2oLrmbZs9cq8zYImUUj2QCP8AeW+m/t4aHCv3mfwDzb3pgJVWVSVho
 zMvgtUUX8cSwxgX1Ns8ISay5ZVusvkMfV1+vVEVUaSOBiZ8Zu00ljIxJDq7KSVq1XS0y
 f74IXakOVJ2WmsygXeu84B7b2A+mcrh+wyY9lgK/HES9iq5pnnedl6RQIbcUotf45cXs
 uN+19v3bgSIbs80oFp3k2rMGUrQ1c7pmo3O7VeOdT03RJvNLlc9/P6MshTm45LNqlAW/
 Y4og==
X-Gm-Message-State: AOJu0YzMMLlUkG3OpQAaxkzTjVeclyh5AQwi/v7JRbWQb3XIOqeEmF+N
 CV3nHs3Q3VHJVSzvHcS1Ac0Mwg==
X-Google-Smtp-Source: AGHT+IEcB9lOnU5D7LUku7kKOfGjfkNp21TKAM5wlwjqT1tboFCW53K/DMPnWxEHWTDQKAQwNEvonA==
X-Received: by 2002:a05:6402:54:b0:523:366b:9cb4 with SMTP id
 f20-20020a056402005400b00523366b9cb4mr3454238edu.1.1691419710016; 
 Mon, 07 Aug 2023 07:48:30 -0700 (PDT)
Received: from localhost (h3221.n1.ips.mtn.co.ug. [41.210.178.33])
 by smtp.gmail.com with ESMTPSA id
 bq1-20020a056402214100b005222c6fb512sm5355657edb.1.2023.08.07.07.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 07:48:29 -0700 (PDT)
Date: Mon, 7 Aug 2023 17:48:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v5] accel/qaic: tighten integer overflow checking in
 map_user_pages()
Message-ID: <e42f15f4-d1a7-4e4d-8efe-e7636634278b@kadam.mountain>
References: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6cbc8a3-c2ae-46be-a731-494470c0a21c@moroto.mountain>
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
Cc: linux-arm-msm@vger.kernel.org, Oded Gabbay <ogabbay@kernel.org>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 07, 2023 at 05:09:34PM +0300, Dan Carpenter wrote:
> +	remaining = in_trans->size - resources->xferred_dma_size;
> +	total = in_trans->size + offset_in_page(xfer_start_addr);
> +	if (total >= SIZE_MAX)

Btw, I wrote it >= instead of > to silence some idiotic static analysis.
On a 64bit system U64_MAX can't be greater than SIZE_MAX so Gcc will
complain.

However this test only affect 32bit systems and > and >= SIZE_MAX on a
32bit system are effecitively the same.  Neither one is ever going to
happen.

regards,
dan carpenter

