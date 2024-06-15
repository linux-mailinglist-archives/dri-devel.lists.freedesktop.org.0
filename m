Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4EC9094FA
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 02:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6353710E1C5;
	Sat, 15 Jun 2024 00:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="VNJBg19y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DC110E2D3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 00:16:21 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-7041e39a5beso2141331b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1718410580;
 x=1719015380; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dbQfy6Bm8n8TNDG5hBa+dXfTA5IW7C1pPdTr7l75iCw=;
 b=VNJBg19ymYAEnpsZx2qFcZtWS75s3knRaCBlg/luaBnQRwISN7RgwmrJtfbm+83gRt
 bgE07NOwdQO7SKJQxOP7K7WYInAH5vVpSV7WYeYoEwAAQWyScJHcN7xGrWHIhQUlUbdA
 zBDhkLANt/gcK/MYiaGgNn7/xxoV/gV/33f830mfCL+BY1tnPUqMqUUe8RVnm/4iDgOu
 Iobr4Pbri3fmy17rjf6aYYLvYR9oZmK5Zz4ddoE7jivU+jdm3zvIkhbucupSSIOt+A5M
 0rFX98STw0fYZaeeyrnvKiutqmkHsCfquZfpIgK+eF6KKW8EFTrgh0qoh92fYMbXzrJO
 u8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718410580; x=1719015380;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dbQfy6Bm8n8TNDG5hBa+dXfTA5IW7C1pPdTr7l75iCw=;
 b=Vl6d+pBCc5MjfzJ4wUYCMmfl4X5FpXLidvZ2paYSEjH3H2NII2ODcpt/FXK3UGDCYl
 PRtvqCxb+7yIqo6+K3UdDGl4RBhE8cOYCU41zi8ek179Fm9Wjd60y6sPvE5yuVuy8QAk
 83jEACTtHHQuvj7Fs5AL/qkUSmaREKk6ryOom/pzUICr8BSq+7LrEXyfBvMar8hATMB9
 Ua1BPEyguxnx4WVfN6zz3e16D/mAADBt+fv7svjX5nadpgpTNJV6MSlgIy9ZrjOuOask
 6xiuOelUSqrqOfqKtqwpGjKCTd7G2YkdvuBep2KCVuvQC33Eq5cpdiJaXRfiSqWoaVw6
 qsEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvXyu/6iYRPHWw65yHCoX1k7S3JlPC8Xsl0NfL8HfZWaLOBk/KfpeKMmJGqJCnwzh/dvOhcPkTydn7bw4fw54IHcRdZ33dvq6pzITnNBgf
X-Gm-Message-State: AOJu0Yx3vvPeJnlZ3My12ndIYw1VO6twk5SGpc1Ady7l08duK0Rf3qpB
 mleg3aiWXzid6hs/ofu03K6mjWGiyo1PC2LkrPf6n/qUapu3BgvCNXqHysMBfxw=
X-Google-Smtp-Source: AGHT+IGnrXmEyH8r24NhyhAqUyF2qFmWVTxhyF32OwfqT86eX9M8aSQDG2YlmH6KZDu1FSFJOoZ/0A==
X-Received: by 2002:a05:6a20:d80d:b0:1b2:cf6c:d5ae with SMTP id
 adf61e73a8af0-1bae844443cmr4560825637.59.1718410580416; 
 Fri, 14 Jun 2024 17:16:20 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cc967334sm3638921b3a.57.2024.06.14.17.16.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 17:16:20 -0700 (PDT)
Date: Fri, 14 Jun 2024 17:16:18 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <20240614171618.3b65b3c9@hermes.local>
In-Reply-To: <20240613082208.1439968-10-oshpigelman@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-10-oshpigelman@habana.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> +
> +/* get the src IP as it is done in devinet_ioctl() */
> +static int hbl_en_get_src_ip(struct hbl_aux_dev *aux_dev, u32 port_idx, u32 *src_ip)
> +{
> +	struct hbl_en_port *port = HBL_EN_PORT(aux_dev, port_idx);
> +	struct net_device *ndev = port->ndev;
> +	struct in_device *in_dev;
> +	struct in_ifaddr *ifa;
> +	int rc = 0;
> +
> +	/* for the case where no src IP is configured */
> +	*src_ip = 0;
> +
> +	/* rtnl lock should be acquired in relevant flows before taking configuration lock */
> +	if (!rtnl_is_locked()) {
> +		netdev_err(port->ndev, "Rtnl lock is not acquired, can't proceed\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	in_dev = __in_dev_get_rtnl(ndev);
> +	if (!in_dev) {
> +		netdev_err(port->ndev, "Failed to get IPv4 struct\n");
> +		rc = -EFAULT;
> +		goto out;
> +	}
> +
> +	ifa = rtnl_dereference(in_dev->ifa_list);
> +
> +	while (ifa) {
> +		if (!strcmp(ndev->name, ifa->ifa_label)) {
> +			/* convert the BE to native and later on it will be
> +			 * written to the HW as LE in QPC_SET
> +			 */
> +			*src_ip = be32_to_cpu(ifa->ifa_local);
> +			break;
> +		}
> +		ifa = rtnl_dereference(ifa->ifa_next);
> +	}
> +out:
> +	return rc;
> +}

Does this device require IPv4? What about users and infrastructures that use IPv6 only?
IPv4 is legacy at this point.
