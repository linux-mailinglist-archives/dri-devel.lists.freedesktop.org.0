Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 263179F6486
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 12:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9499110EB70;
	Wed, 18 Dec 2024 11:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="PysA/nE2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF12310EB6D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 11:14:53 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30229d5b22fso66763621fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 03:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734520492; x=1735125292; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CQXGzcBLUuhgC9zgbmH7cd1iWvRUarAb5IMePyYysIc=;
 b=PysA/nE2meXBfR4EkGSD5HP/IEVqxRVMbWNczA4QZVzzAkaPERixTHyu+6tt+VNJEM
 vgXPgTv4opvaJ3W+c3IfG9WOtN2pXdgRsUKpfP8a7LKS2eLqOq8JgvV7ntuTY3DwWPCP
 PlbQ0Ovp5Y8ZWkWP4XbBP625z7aoeTdbpgm2bjdKlVj34ZVPeOU+JeHBuB12KYAY86yw
 wK3pWqf/YiZ6cMi+uroMUl/kA6xMXWRbtLNsznJhomb1lnXBHMAu8lCt9TV3tO/48pLu
 XUcJeXJ/MWGQRCxfiWoG/FK57cWjp0BZ0zxvKMHx0EKzkKE//IrlBUZ+/ddL5fNlQnZY
 iOuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734520492; x=1735125292;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQXGzcBLUuhgC9zgbmH7cd1iWvRUarAb5IMePyYysIc=;
 b=LztSxTLG6Clz8/qknHlg+2vD+K9Qx55aZBae2qKtWnIn4FMqWDxGJhPiOrloYhlYbr
 7BTcsiPivDIfVLSJCgi7IPwKhGyULiQvjCgpEiUNR1imaKUnF+Yl19e14gSp2sXsraEY
 zHnz4MdfYGQwyIXHYZz2HzavdOb3sGrCuQMrvfWqn/W7bFGjvWYlGHJeHwSWou2M/GhT
 06ZF1Hm+CA01ZzSGNomcuZp6nayAzEiEk0lWIH1eblu8ltlFDDWBFLxcqWIoHEqgTSvo
 LfjzwzsL7W+saDkTfDdeJ0axgaUb5ikFsiKrOEehXabdtVK48xqnx74ep8wuRzaLPySS
 dhXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb7OzeizIa3S0jLQdVYX5eoWY05gnRTOtIpxSY3+l4dahFCjvt1jc5LkibYf/rELBc7JmPc/UMHbg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR/C3prnKhfK7wJ6vJ/eTnmpDdF2OYBk7hvT+TZFovCTi2Oi7X
 bnSKLT+Fs9IMqg15FyIWz/K36BXcJEtbFZ2W2bEqPyL/nEs/BZWaB1H/Ee9uOK8=
X-Gm-Gg: ASbGnctczZMKolT7XKae8sy72VPU34Wf+G5nNS/zfdAkqlI37heQ+zve8MVIRrG/A9d
 zCgbKJQtEd+TciZmfLciDWmV8wD3EDAJ+IACKZXPaT65s9lev1YFUPZ9YP62H4l5eCMo5iX8KMF
 10ypAIwTd4Zc+0eLwlpatkb4CkwJYMJhbE71DxaTMOqdytKNlqlpDH1BehsbSOmn9LGiaKfB3Fm
 qwzy2MTwfb5M9+DqFVvR/MTT+crcC2LJ8hogow/EmH9LO63VyY+YCaUeaiJ8YM2YrOMWBJ829JT
 iV+OwjX4Xj/yqJf9J10xdwVebixewHrgsKOF
X-Google-Smtp-Source: AGHT+IF35Qn0v9SRDK1fTSpGFNEC2eNTW/0l9pru1MmKVrUdfP4sXGIPiEDLn5BpGB8GYjkaJSJaaQ==
X-Received: by 2002:a05:6512:3193:b0:540:353a:5b13 with SMTP id
 2adb3069b0e04-541e674d6e6mr1018964e87.22.1734520491990; 
 Wed, 18 Dec 2024 03:14:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120bffc8csm1414480e87.146.2024.12.18.03.14.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 03:14:51 -0800 (PST)
Date: Wed, 18 Dec 2024 13:14:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, 
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
 stable <stable@kernel.org>
Subject: Re: [PATCH v1 2/2] misc: fastrpc: Fix copy buffer page size
Message-ID: <f47spqrlkrwotgt3ibu6rn6bt4lfkrblh37yubrvsbeo6j7svl@44amfzlpor62>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-3-quic_ekangupt@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-3-quic_ekangupt@quicinc.com>
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

On Wed, Dec 18, 2024 at 03:54:29PM +0530, Ekansh Gupta wrote:
> For non-registered buffer, fastrpc driver copies the buffer and
> pass it to the remote subsystem. There is a problem with current
> implementation of page size calculation which is not considering
> the offset in the calculation. This might lead to passing of
> improper and out-of-bounds page size which could result in
> memory issue. Calculate page start and page end using the offset
> adjusted address instead of absolute address.

Which offset?

> 
> Fixes: 02b45b47fbe8 ("misc: fastrpc: fix remote page size calculation")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cfa1546c9e3f..00154c888c45 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1019,8 +1019,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  					(pkt_size - rlen);
>  			pages[i].addr = pages[i].addr &	PAGE_MASK;
>  
> -			pg_start = (args & PAGE_MASK) >> PAGE_SHIFT;
> -			pg_end = ((args + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
> +			pg_start = (rpra[i].buf.pv & PAGE_MASK) >> PAGE_SHIFT;
> +			pg_end = ((rpra[i].buf.pv + len - 1) & PAGE_MASK) >> PAGE_SHIFT;
>  			pages[i].size = (pg_end - pg_start + 1) * PAGE_SIZE;
>  			args = args + mlen;
>  			rlen -= mlen;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
