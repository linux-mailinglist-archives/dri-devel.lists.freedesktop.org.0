Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5F574E89E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jul 2023 10:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8044110E32F;
	Tue, 11 Jul 2023 08:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 684 seconds by postgrey-1.36 at gabe;
 Tue, 11 Jul 2023 07:38:58 UTC
Received: from mail02.habana.ai (habanamailrelay02.habana.ai [62.90.112.121])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872A310E328
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jul 2023 07:38:58 +0000 (UTC)
Received: internal info suppressed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=habana.ai; s=default;
 t=1689060181; bh=3MrvxpCCrw8Dk6+D34BZWEiOrubZ8Sj3J6bsLwQbQEo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iRRYm4VDIoP4/u0D4ntRKOXRZZXAtVbVOzqPnAjK4ljtgewDr4d+lgFfuQn/Gb0AA
 pMvuU48aSI1qisCiadjTAL8AbY2gx8Q8Ag6BPP7Cisrw/mnMjuD3Tc7WPQYG01oGxQ
 3vRLlpFcbOir9SJKspwVriLCi2awztx/7SIplIRmxeNDPK2P8neerZoxNk1s0z1q2/
 2VfdexXo+CL5uhnyoRrgcCJJmpMjKQ2ov62Y3FY8pLLUnIv2fFQB9O9+O3sHIOJiCd
 RF2zHQBK6Y+OY/OBkU5Z3TJ7iVO+2Fp8U/pGuseJtyEft9RMwsqDNSJooRoKVnZlHD
 F0SGdvyfsvr4g==
Received: from dhirschfeld-vm-u22.habana-labs.com (localhost [127.0.0.1])
 by dhirschfeld-vm-u22.habana-labs.com (8.15.2/8.15.2/Debian-22ubuntu3) with
 SMTP id 36B7N7nH960621; Tue, 11 Jul 2023 10:23:08 +0300
Date: Tue, 11 Jul 2023 10:23:07 +0300
From: Dafna Hirschfeld <dhirschfeld@habana.ai>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 5/5 v3] accel/qaic: Fix a leak in map_user_pages()
Message-ID: <jhqia5lmifb6nsnmnxv3lf4x5irhpgkg6rx6oisuyjqwe4djd7@zvi5oyq65jeo>
References: <ZKzx5nA6Z/0yhBJj@moroto>
 <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <8666cc78-3e15-435e-9c4e-15502ac75bcd@moroto.mountain>
X-Mailman-Approved-At: Tue, 11 Jul 2023 08:01:25 +0000
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
 Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
 Carl Vanderlip <quic_carlv@quicinc.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.07.2023 09:13, Dan Carpenter wrote:
>If get_user_pages_fast() allocates some pages but not as many as we
>wanted, then the current code leaks those pages.  Call put_page() on
>the pages before returning.
>
>Fixes: 129776ac2e38 ("accel/qaic: Add control path")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Dafna Hirschfeld <dhirschfeld@habana.ai>

>---
>no change
>
> drivers/accel/qaic/qaic_control.c | 7 +++++--
> 1 file changed, 5 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
>index d5ce36cb351f..9a6f80f31c65 100644
>--- a/drivers/accel/qaic/qaic_control.c
>+++ b/drivers/accel/qaic/qaic_control.c
>@@ -425,9 +425,12 @@ static int find_and_map_user_pages(struct qaic_device *qdev,
> 	}
>
> 	ret = get_user_pages_fast(xfer_start_addr, nr_pages, 0, page_list);
>-	if (ret < 0 || ret != nr_pages) {
>-		ret = -EFAULT;
>+	if (ret < 0)
> 		goto free_page_list;
>+	if (ret != nr_pages) {
>+		nr_pages = ret;
>+		ret = -EFAULT;
>+		goto put_pages;
> 	}
>
> 	sgt = kmalloc(sizeof(*sgt), GFP_KERNEL);
>-- 
>2.39.2
>
