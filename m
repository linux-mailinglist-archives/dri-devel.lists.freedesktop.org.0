Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D79C9094F5
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2024 02:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D91C10E2B9;
	Sat, 15 Jun 2024 00:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=networkplumber-org.20230601.gappssmtp.com header.i=@networkplumber-org.20230601.gappssmtp.com header.b="JiILEPOQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC8C10E2D3
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2024 00:10:44 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id
 5614622812f47-3c9cc681ee0so1274919b6e.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 17:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=networkplumber-org.20230601.gappssmtp.com; s=20230601; t=1718410243;
 x=1719015043; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IDFKg2giSlNRp2CWnI6wzIZGjcEuH3CutRdpX5N8j6g=;
 b=JiILEPOQclN8fTdrTbaGKnFg+7nw3OvYkQpyjyTNt+y4clmOo5qG1mU1CWsJOIJcV3
 jWs5PpT2tGTJ7ZBr6byLEavI5su+Hc+jLTVtiR9GH+s+AOpUjL5m6tWBQzGkgYBRQ33K
 Xf1cECFED7ju/a/3ZFBe6WD4Ds7xcrWyoZGS9MkQRlSp3RoipJ06oYlZ6JORhsZq0Jdk
 XydomRe4cysXXscBh7CByhyiItTWiULD86FEa1ipJMpP2zzhVKppGNvZXjaBg66D9WCR
 u5cRc4u2aYdAY+pzDXH+HK0RE9dAWXWORUP4qGgAXb2lg+sQVVgO9P4tPjGcfiDYVsav
 ZTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718410243; x=1719015043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDFKg2giSlNRp2CWnI6wzIZGjcEuH3CutRdpX5N8j6g=;
 b=OFu7KYTzR8eK/XxLxjaI/+D/ZBS1oeeEqMb1IZVQ8oYn55GXUds+yw/kkdTs64ad/R
 tldMrzD53J3ebnAfNZWvZAqRaRRjPPct5u/3guTqG21b5LrVw7pfY2VswFmiQ6P4apFD
 M5kGYH5yANvhmgqD77DVw2G69MQ239Z+J9MkPH5oLyF9wz56tA0AWZLCZ6xpj3IiKnbd
 yLdbfk0NZ5hg9Owe8r9zEmxFmhnnrnD5t75AvOQ/SNKyxdJXhx3Iq9qGLKtZpsuobyIe
 /3H95kkAMCJcGTYXwtXKxWvkeURE59kqGNO685RpuRkY/ZBAgH5O1BD/p1fRLTIS0P1P
 GWqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWycC6WJY6xYqq0m3ZBPSxQv8xCOMqcs9OGrw9A9jMmCURplsP+5snBaYmeJbDM2RzCcwhgy/jdbj2A05NOfmnKDsPA7OMDI3dsN+o/Fu0Y
X-Gm-Message-State: AOJu0Yy3zmWnLX9F9hw1ZkPCgm9gIuz5EBE1vqo/6jLDIWANjFhk43HC
 O1wlwUpqwcmsTSjAnrxgLzTvXhXnCQ9VTXW3WBKIlBwre6t57EbZjcRUzO6CEwU=
X-Google-Smtp-Source: AGHT+IETiLeYvMfLS5qJj9lv2YNeygiz2aZ7N7GNkbFdmRrbP/g2iRj/7hvSY6Q5nrBEuc1N17ZyFw==
X-Received: by 2002:a05:6870:f145:b0:258:37f4:755c with SMTP id
 586e51a60fabf-25842b0cfa0mr4379647fac.46.1718410243257; 
 Fri, 14 Jun 2024 17:10:43 -0700 (PDT)
Received: from hermes.local (204-195-96-226.wavecable.com. [204.195.96.226])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705cd498aeesm3574633b3a.23.2024.06.14.17.10.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jun 2024 17:10:42 -0700 (PDT)
Date: Fri, 14 Jun 2024 17:10:41 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Omer Shpigelman <oshpigelman@habana.ai>
Cc: linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ogabbay@kernel.org, zyehudai@habana.ai
Subject: Re: [PATCH 09/15] net: hbl_en: add habanalabs Ethernet driver
Message-ID: <20240614171041.7b880232@hermes.local>
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

On Thu, 13 Jun 2024 11:22:02 +0300
Omer Shpigelman <oshpigelman@habana.ai> wrote:

> +static int hbl_en_ports_reopen(struct hbl_aux_dev *aux_dev)
> +{
> +	struct hbl_en_device *hdev = aux_dev->priv;
> +	struct hbl_en_port *port;
> +	int rc = 0, i;
> +
> +	for (i = 0; i < hdev->max_num_of_ports; i++) {
> +		if (!(hdev->ports_mask & BIT(i)))
> +			continue;
> +
> +		port = &hdev->ports[i];
> +
> +		/* It could be that the port was shutdown by 'ip link set down' and there is no need
> +		 * in reopening it.
> +		 * Since we mark the ports as in reset even if they are disabled, we clear the flag
> +		 * here anyway.
> +		 * See hbl_en_ports_stop_prepare() for more info.
> +		 */
> +		if (!netif_running(port->ndev)) {
> +			atomic_set(&port->in_reset, 0);
> +			continue;
> +		}
> +

Rather than duplicating network device state in your own flags, it would be better to use
existing infrastructure. Read Documentation/networking/operstates.rst

Then you could also get rid of the kludge timer stuff in hbl_en_close().

