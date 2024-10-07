Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E25992794
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 10:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2BD10E325;
	Mon,  7 Oct 2024 08:53:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Kqho0iqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58C910E325
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 08:53:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 22211A4177B;
 Mon,  7 Oct 2024 08:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF99C4CEC6;
 Mon,  7 Oct 2024 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728291233;
 bh=E2I90VCXa15X8OJoy912t8r09Tnx1ElPcXygHzsZoTw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Kqho0iqBAIwP4ObeAIYcPtMMQsRM6NKxQgQEgmDvbeDlaFhmISv/2RwgaCJWkvrUz
 7KKTyeoA5evF+h/wbDcXYw+5OYy1TWJXHir3ipFQVimA/Gp6yXWncEFHMjimS92UFy
 HNJZkyw+ypfWflNhCGvvT7qishMH1qRmXu0mX4+Q=
Date: Mon, 7 Oct 2024 10:53:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <2024100729-overall-sugar-d3b8@gregkh>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
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

On Mon, Oct 07, 2024 at 02:15:15PM +0530, Ekansh Gupta wrote:
> +struct fastrpc_invoke_v2 {
> +	struct fastrpc_invoke inv;
> +	__u64 crc;
> +	__u32 reserved[16];

I'm sure we have been over this before, but if you have a reserved
field, you HAVE to check that it is zero if you ever want to use it in
the future.  As you did not check it, just remove it from this structure
as obviously it can never be used for anything.

Your internal review should have caught this, if not, please go fix it
AND get some internal review and signed-off-by before submitting this
series again.

thanks,

greg k-h
