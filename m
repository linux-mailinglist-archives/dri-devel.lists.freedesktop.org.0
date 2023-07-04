Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D38746C1A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 10:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD3710E14B;
	Tue,  4 Jul 2023 08:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A5B10E14B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 08:38:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5742eso53148475e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 01:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688459902; x=1691051902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w0V57ruCKT8g2KRYl0872Ggc1PX88R6CmL+ReT3+2E4=;
 b=KuahYV1kenec4FVH+QBP0nW573m7azVy/U+M4uh/82HcqTd/trNzBoKgYdN5fuSU+G
 YnBgOYzF3iW4e5JN5b+S1DhNYgy377h+Wv5X4d1dtUcjhlv59ttycBNm65DPWVggUgAv
 L1lSgB/kAxfFM/EknQEj+uB/V48Tl6Pds9yHBGblTCYw0C8wiUrzevSM1uNWvhGSGbAW
 3s5QftmSU4xelg85k1isrCKW3DX/lO4QsO/qjUUgH5zUyaAomLdjMgmQxVA02+4bHN9m
 WjD5JEZI47QESaCd5kwvISRtXyv4dtgS5+sL+IekaTCZ9O7ZMLzPYG8PxPgaMOn1/x/6
 cQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688459902; x=1691051902;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w0V57ruCKT8g2KRYl0872Ggc1PX88R6CmL+ReT3+2E4=;
 b=FZ3dA4g7Qh3td/hoHTVkQneEov+0B7GSEGbP9UJKPw/1LTUCExoyuAAYN1uzCH3plc
 8DkBvM9yEyedBi8Mw9+t0Sw7VawtiNSLDxYjiudTu29A0tSs9v4Lz48YZpIwCv0wCLEy
 adiC96c8L1V7nbZuGqlhxg7bxmFj7cEbV+RwC5w/5hBine2vUZzwpDcMU7A0ouXzkKp8
 pFlX4cnnmHXn3nXnUXZv4jo8HjtkMxAehg40NYz3wsRkSibWN3x6Jyqr/NP74QcDriNc
 mUWx4SaQF9n4SqgcBxhvGDC93gztOrf4As2EBQT9z2gEe/yqa/D8sDRMXv/2JO2+pYAC
 laqg==
X-Gm-Message-State: AC+VfDxqQBqItBBNgLIGuMxHtAtvdzsaOCMUy2OWIOGcJniyJZNSWuPl
 GxIlOQXLMH0PHeI/ZfcmV4HGt7aUXlbiXG2u+TM=
X-Google-Smtp-Source: ACHHUZ4CtBHTSIgBrWtDhVrUr9H6mVr1KJO7Mgb9kq8KYJhSeCz39PgYzNfD0ZElomNA3TYakMGWlg==
X-Received: by 2002:a7b:cc87:0:b0:3fb:a917:b769 with SMTP id
 p7-20020a7bcc87000000b003fba917b769mr11141017wma.21.1688459902605; 
 Tue, 04 Jul 2023 01:38:22 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 4-20020a05600c228400b003fbc216b137sm13093446wmf.3.2023.07.04.01.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 01:38:20 -0700 (PDT)
Date: Tue, 4 Jul 2023 11:38:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <fb5f0a0c-c46f-4eec-bfcc-50b4be44c0a7@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d79cddc-0afb-08c2-8aac-8f3b7761d210@quicinc.com>
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 04, 2023 at 11:57:51AM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> > diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
> > index 5c57f7b4494e..a51b1594dcfa 100644
> > --- a/drivers/accel/qaic/qaic_control.c
> > +++ b/drivers/accel/qaic/qaic_control.c
> > @@ -748,7 +748,8 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> >   	int ret;
> >   	int i;
> > -	if (!user_msg->count) {
> > +	if (!user_msg->count ||
> > +	    user_msg->len < sizeof(*trans_hdr)) {
> >   		ret = -EINVAL;
> >   		goto out;
> >   	}
> > @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> >   	}
> >   	for (i = 0; i < user_msg->count; ++i) {
> > -		if (user_len >= user_msg->len) {
> > +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> If I understand correctly this check is added to verify if we are left with
> trans_hdr size of data. In that case '>' comparison operator should be used.

That was there in the original code and I thought about changing it but
I don't like changing things which aren't necessary and == is also
invalid so I decided to leave it.

> 
> >   			ret = -EINVAL;
> >   			break;
> >   		}
> >   		trans_hdr = (struct qaic_manage_trans_hdr *)(user_msg->data + user_len);
> > -		if (user_len + trans_hdr->len > user_msg->len) {
> > +		if (trans_hdr->len < sizeof(trans_hdr) ||
> > +		    size_add(user_len, trans_hdr->len) > user_msg->len) {

If we change to > then the == will be caught by this check.  So it
doesn't affect runtime either way.

regards,
dan carpenter

