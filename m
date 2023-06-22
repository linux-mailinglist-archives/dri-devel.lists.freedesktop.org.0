Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D42D739FF0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 13:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147CB10E54D;
	Thu, 22 Jun 2023 11:44:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 054B310E54D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 11:44:06 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-31126037f41so6903222f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 04:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687434243; x=1690026243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vz+zkH5gY0YFxkXKDPDpdmNvisb+WWSvSbhKQaEPY2c=;
 b=o/3Aw9aQBJW5d5SpNlLwNvJ/OD/UQbc/BduQWCMw2WgftM7i4nwwwKDTY0TofQmDbR
 gj146JezuJYgkHeV/i/nemQasIlDY25a94P90Q8aak15Ct/duoxw75xBIThBybMDizMX
 AmB3jTwpP3runVINvu47QK+5+HWZBzJ57ILY5DcL6staXGzF5gMGJ0F3U7QZUMuscEIp
 N8UnS5+bpXwp20Yd7RDV2O7qCFL22meSR0fJa1vuHTsQaJENuG5nWROhyaQLmxsjQ7OV
 +vTbBi4TU5f72WpfPEivYY6jIys9FVj16Vsil8GmpfUcp2YpqkbFpT4GxRcvu/hvmaBb
 dYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687434243; x=1690026243;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vz+zkH5gY0YFxkXKDPDpdmNvisb+WWSvSbhKQaEPY2c=;
 b=l1PuHMzkpBLzzm6DMGxRXeNR+Jgyz1jB1I3SJgPyejRm0iEePayfz466rRxWjW/fVf
 FIcA7mcoTUJzRNQ7UxjqGbJHXD85AU+FKX5lBmwC7B+If3NUXD7q9mWGzq1kfgJAxGsA
 4PB7iyQpg8c6RnhyEkkhPObevm4vsVDb1jDtNAFs9pf9GuAuHTnvys8YQ2wfVYQqRBf2
 hCI3lUN5xE4sMTiAE7xYjly0FrCTPM6Qce7ZkLBqfCSk43R+knKYVldRHuQDZA376bfN
 OGR0CZSqnbjVOHSnJWGzQRoHv0SnBvett31kizMeO7OyINRNlrnANrRC4jZVU9sMiPKw
 4XEg==
X-Gm-Message-State: AC+VfDxjfhkHx4GH+BaK4K2bdvp2iRO9caQ6g7L29l/Z1mFQ0zlXlbAy
 /EN3ktCXAaZ0NkFR6/QBVpGuaA==
X-Google-Smtp-Source: ACHHUZ6sg/u/NoK2P+y5+TA/PMeAycfJ3c39vdk0q3MhqBjlbBLYl62kDe3ji3pF7GNMl8aIqjs9Hw==
X-Received: by 2002:a5d:590c:0:b0:30a:8995:1dbc with SMTP id
 v12-20020a5d590c000000b0030a89951dbcmr13954517wrd.26.1687434243462; 
 Thu, 22 Jun 2023 04:44:03 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 y9-20020adfdf09000000b0031122bd3c82sm6906846wrl.17.2023.06.22.04.44.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jun 2023 04:44:00 -0700 (PDT)
Date: Thu, 22 Jun 2023 14:43:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
Subject: Re: [PATCH 1/5] accel/qaic: tighten bounds checking in
 encode_message()
Message-ID: <225a7da6-f0fc-41d1-8bbc-6247a4733731@kadam.mountain>
References: <8dc35a68-7257-41ac-9057-7c89b9ad6e18@moroto.mountain>
 <95ed2c6b-df33-a252-8eba-3cb848c5c40b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95ed2c6b-df33-a252-8eba-3cb848c5c40b@quicinc.com>
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

On Thu, Jun 22, 2023 at 04:54:03PM +0530, Pranjal Ramajor Asha Kanojiya wrote:
> 
> 
> On 6/21/2023 12:51 PM, Dan Carpenter wrote:
> > There are several issues in this code.  The check at the start of the
> > loop:
> > 
> > 	if (user_len >= user_msg->len) {
> > 
> > This check does not ensure that we have enough space for the trans_hdr
> > (8 bytes).  Instead the check needs to be:
> > 
> > 	if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> > 
> > That subtraction is done as an unsigned long we want to avoid
> > negatives.  Add a lower bound to the start of the function.
> > 
> > 	if (user_msg->len < sizeof(*trans_hdr))
> > 
> > There is a second integer underflow which can happen if
> > trans_hdr->len is zero inside the encode_passthrough() function.
> > 
> > 	memcpy(out_trans->data, in_trans->data, in_trans->hdr.len - sizeof(in_trans->hdr));
> > 
> > Instead of adding a check to encode_passthrough() it's better to check
> > in this central place.  Add that check:
> > 
> > 	if (trans_hdr->len < sizeof(trans_hdr)
> > 
> > The final concern is that the "user_len + trans_hdr->len" might have an
> > integer overflow bug.  Use size_add() to prevent that.
> > 
> > -	if (user_len + trans_hdr->len > user_msg->len) {
> > +	if (size_add(user_len, trans_hdr->len) > user_msg->len) {
> > 
> > Fixes: 129776ac2e38 ("accel/qaic: Add control path")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> > This is based on code review and not tested.
> > 
> >   drivers/accel/qaic/qaic_control.c | 8 +++++---
> >   1 file changed, 5 insertions(+), 3 deletions(-)
> > 
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
> Can we have something like this here
> user_msg->len < sizeof(*trans_hdr) * user_msg->count, no?

This check was just to ensure that we have space for one header so that
the "user_msg->len - sizeof(*trans_hdr)" subtraction doesn't overflow.
We're going to need to check that we have space for each header later
anyway.  Can the multiply fail (on 32bit)?

> >   		ret = -EINVAL;
> >   		goto out;
> >   	}
> > @@ -765,12 +766,13 @@ static int encode_message(struct qaic_device *qdev, struct manage_msg *user_msg,
> >   	}
> >   	for (i = 0; i < user_msg->count; ++i) {
> > -		if (user_len >= user_msg->len) {
> > +		if (user_len >= user_msg->len - sizeof(*trans_hdr)) {
> Do you think it is more readable if we have something like this
> user_len + sizeof(*trans_hdr) >= user_msg->len

Either way works.  The math should be on trusted side, and to me the
form is always if (variable >= trusted value) { so I prefer to put the
math on right.  But here both sides are trusted and there is no risk of
integer overflow.  If we did that then we could remove the

	if (user_msg->len < sizeof(*trans_hdr))

condition from the start.

regards,
dan carpenter

