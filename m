Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E984AD32D95
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jan 2026 15:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A6310E8B0;
	Fri, 16 Jan 2026 14:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qy/vePDy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F5E10E8B0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 14:49:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 414EB60160;
 Fri, 16 Jan 2026 14:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89637C116C6;
 Fri, 16 Jan 2026 14:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1768574950;
 bh=csX8809TxlEacL4NqwLmTvuhRR/3P1BsmTcEtKkSVxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qy/vePDyjSo9d8DBb/EOVPHaVZQe1tQKzz7m2B9pBWsQw2yAyyAXkuyxdaWict8sO
 5/EKRJH3DMlyC+sfvVFbuIHSf//xXJbAcb0tMv1A6sTI7UxaNXJhooazahfnugllxh
 +Jm/MuXQQKB/EbRrPU1fCFWVJ84AUihnpQ9Cxw6A=
Date: Fri, 16 Jan 2026 15:49:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
 linux-arm-msm@vger.kernel.org,
 Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 thierry.escande@linaro.org, abelvesa@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, stable@kernel.org
Subject: Re: [PATCH v2 1/4] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
Message-ID: <2026011621-fang-moneywise-d6b2@gregkh>
References: <20260115082851.570-1-jianping.li@oss.qualcomm.com>
 <20260115082851.570-2-jianping.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115082851.570-2-jianping.li@oss.qualcomm.com>
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

On Thu, Jan 15, 2026 at 04:28:48PM +0800, Jianping Li wrote:
> From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.

What caller passes in NULL here?  I did a quick look, and see where the
callers check this properly if it could be NULL, otherwise it all looks
sane to me.  What in-kernel user is causing a crash here?  Why not fix
the caller up instead?

thanks,

greg k-h
