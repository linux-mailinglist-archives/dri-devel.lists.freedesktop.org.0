Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E58A96FE2BC
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 18:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D80710E258;
	Wed, 10 May 2023 16:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9775410E258
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 16:48:25 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f315735514so254594245e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 09:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683737303; x=1686329303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MwVVyzBwHFgq5mjt1+OBVM71N6e1slDHiUKoKcjYW0Q=;
 b=yy0HCIvUH4Sd4z+3E6svVggUDeh72opPe44l+Bem25petIjeKIIYzQqIWoBHzl0UNL
 u8N7qm1cfYKJD1Ud9Mt207BcE7wIRoHy5kG7p3GN6XH5gbPk9a9QsPQFB8wRk7t3ofPb
 irL1km6PsxvZruvN922JFOGjHAm15x9jXWprgf38trxk65/fHgrIdA5B21I1Eaxx5U5U
 Vr9vc6Ht/FGK2UikGQRSwBVMjn+MURFnJaJB+b6VjaIY9OW2l6qZWYznyy4flM8XPjzv
 T7OLdbQBdX4JqZsW5cTIjUhOJ0XTVn+QRau4Lu2oA7/p/THSVE1O6yCmsl+0iv+PveoN
 oQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683737303; x=1686329303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MwVVyzBwHFgq5mjt1+OBVM71N6e1slDHiUKoKcjYW0Q=;
 b=AoTk+JH/mEPwkYcNLwU/4SLxAfoyHnkMtTA7/DZv0C2joMik0UBDDnJ8/UUoRyAAX+
 ue6yHhMuf8bIc8ZlbWrIq6DJqBpI7Fj1mrx+l6HjKN0/uKSlh/sVGONAWwKQwsIAKQJW
 rVtEC09mm5l6yVDswpZcS15+rK833Xr1LzpfevguftbI9OqOqLOqI6FH+1aCh9ozHV1F
 Bi3hOHNuAFTRxwGwrXisZZBZNPjtP2TqPYx2X/JC6mqvTZhtDpUN1eiWOOpWOrMZXSo8
 rBk8O/pbVxX1PAEKLnbGIBjADndh0EKTPXbSMsfFhIIUuhbOW07V2V5GtnuD8BHgBiLZ
 zA0A==
X-Gm-Message-State: AC+VfDwoGF8nATglFHy7QpWqluJL1etT0aoMTZ6gPebApzr8c0BylWdO
 oNBIcYBtwiBztVYAenzvdatMJg==
X-Google-Smtp-Source: ACHHUZ6pAsUXjnPzQPlETYmn2EITVP8Au3ALpgkfd7X43evubc0YmSsEetI21aWFcNDrnelF4WvqLw==
X-Received: by 2002:a05:600c:3b91:b0:3f1:7b63:bf0e with SMTP id
 n17-20020a05600c3b9100b003f17b63bf0emr12869963wms.18.1683737303342; 
 Wed, 10 May 2023 09:48:23 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y5-20020a1c4b05000000b003f429d59e37sm6135075wma.34.2023.05.10.09.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:48:21 -0700 (PDT)
Date: Wed, 10 May 2023 19:48:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH] accel/qaic: silence some uninitialized variable warnings
Message-ID: <d4c73c29-b604-4b0c-92bb-000369b0a5d7@kili.mountain>
References: <d11ee378-7b06-4b5e-b56f-d66174be1ab3@kili.mountain>
 <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2d1fb58f-f98b-ba17-65e9-9ea4b467102a@quicinc.com>
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
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 10, 2023 at 08:57:03AM -0600, Jeffrey Hugo wrote:
> On 5/3/2023 4:41 AM, Dan Carpenter wrote:
> > Smatch complains that these are not initialized if get_cntl_version()
> > fails but we still print them in the debug message.  Not the end of
> > the world, but true enough.  Let's just initialize them to a dummy value
> > to make the checker happy.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Thanks for the cleanup.
> 
> Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> 
> Could use a fixes tag

The fixes tag thing could have gone either way.  It's really minor.

> and also I'd prefer to maintain the style of sorting
> the variable declaration lines by line length.  Given the minor nature of
> these nits, I plan to address them.

Thanks!

regards,
dan carpenter
