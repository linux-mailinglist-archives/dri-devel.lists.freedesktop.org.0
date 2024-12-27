Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5D9FCF4A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Dec 2024 01:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 213B910E036;
	Fri, 27 Dec 2024 00:38:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Pdtl9TsN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5B310E036
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Dec 2024 00:38:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CCB975C5C43;
 Fri, 27 Dec 2024 00:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E51CC4CED1;
 Fri, 27 Dec 2024 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735259908;
 bh=QYzQx3fJtxFf/kFN+hqMx+i8Lscl27dsjoLsccZaqxA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pdtl9TsNLp09G/nHT+TFIxQvhXeMRS++6sBC7JCR/0C8/v+HyAOrQcgY81ZoBwDuX
 sag9tS+bHXFqNyFeralGwBzFUBydtZgeuWhwlWFEbm5w3kOjovSZgsB5841zQ/OLwy
 TxNXfZM5QQajKBBMbAMBL0oRn0Sp7mQLjnG/oSzqYY0+xtnKcUBwVmBCvlO/IVLn8h
 /ubzetD/Qr5zLk9mKqGTiV3pATBkNVpIrzUsZo4ALAlrQg0L/me1Ra70pxi4cCXGeM
 M/NhEKZFFTeK2DMOCrB1bYkuf5jXgGdePvAx+PPHThgWm+S8mtj6WpM0JKNBs2EaTc
 VzbN8nxqJQA0Q==
Date: Fri, 27 Dec 2024 01:38:23 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: carlos.song@nxp.com
Cc: aisheng.dong@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, sumit.semwal@linaro.org, 
 christian.koenig@amd.com, frank.li@nxp.com, linux-i2c@vger.kernel.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v6] i2c: imx-lpi2c: add eDMA mode support for LPI2C
Message-ID: <ly7mzakvws75xcjncm6x24rie4xewt6ll4dlkz2kl5cblihi6n@7kivy2uqdwvp>
References: <20241125142909.1613245-1-carlos.song@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241125142909.1613245-1-carlos.song@nxp.com>
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

Hi Carlos,

On Mon, Nov 25, 2024 at 10:29:09PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
> 
> Add eDMA mode support for LPI2C.
> 
> There are some differences between TX DMA mode and RX DMA mode.
> LPI2C MTDR register is Controller Transmit Data Register.
> When lpi2c send data, it is tx cmd register and tx data fifo.
> When lpi2c receive data, it is just a rx cmd register. LPI2C MRDR
> register is Controller Receive Data Register, received data are
> stored in this.
> 
> MTDR[8:10] is CMD field and MTDR[0:7] is DATA filed.
> +-----------+-------------------------------+
> |  C  M  D  |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+---+---+---+
> | 10| 9 | 8 | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+---+---+---+
> 
> MRDR is Controller Receive Data Register.
> MRDR[0:7] is DATA filed.
> +-------------------------------+
> |          D  A  T  A           |
> +---+---+---+---+---+---+---+---+
> | 7 | 6 | 5 | 4 | 3 | 2 | 1 | 0 |
> +---+---+---+---+---+---+---+---+
> 
> When the LPI2C controller needs to send data, tx cmd and 8-bit data
> should be written into MTDR:
> CMD: 000b: Transmit the value in DATA[7:0].
> DATA: 8-bit data.
> 
> If lpi2c controller needs to send N 8-bit data, just write N times
> (CMD(W) + DATA(u8)) to MTDR.
> 
> When the LPI2C controller needs to receive data, rx cmd should be
> written into MTDR, the received data will be stored in the MRDR.
> 
> MTDR(CMD): 001b: Receive (DATA[7:0] + 1) 8-bit data.
> MTDR(DATA): byte counter.
> MRDR(DATA): 8-bit data.
> 
> So when lpi2c controller needs to receive N 8-bit data,
> 1. N <= 256:
> Write 1 time (CMD(R) + BYTE COUNT(N-1)) into MTDR and receive data from
> MRDR.
> 2. N > 256:
> Write N/256 times (CMD(R) + BYTE COUNT(255)) + 1 time (CMD(R) + BYTE
> COUNT(N%256)) into MTDR and receive data from MRDR.
> 
> Due to these differences, when lpi2c is in DMA TX mode, only enable TX
> channel to send data. But when lpi2c is in DMA RX mode, TX and RX channel
> are both enabled, TX channel is used to send RX cmd and RX channel is
> used to receive data.
> 
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Frank Li <frank.li@nxp.com>

merged to i2c/i2c-host.

Thanks,
Andi
