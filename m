Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2349B837A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2024 20:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7519110E916;
	Thu, 31 Oct 2024 19:32:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VBFnUGOG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B52410E916
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 19:32:54 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53a097aa3daso1290083e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Oct 2024 12:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730403172; x=1731007972; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jcv819KyGF7gb7Milxae3g5KBBPuhxN7NjyGwjKfWLU=;
 b=VBFnUGOGo5Vx0QRHFS02kr94QLJ2qG+YHOkYM7+G3InB9wXZRVX7oU+1C626E5DvFi
 JB029jVoTtUa4+3PYteKxZy4hPJObzrZWq6KsGyCSEa5WERdKV7unwW2GEROfr+vFqa6
 fug0pV6qwqhjGOqJSM1jlP6hoeT3btvKLBaq89UGn0KfnJSBgXFqGMAkRjbb8qOexTCs
 GwhnR9/JQwENL3kXPSncNp6AZMc/wAN1UJRL7emhbCrTibqZfHbVgfw9TJ/EmyK6UVBr
 H3mnGwFbe1SpSqi0JNZ2MjdieQoBvl3QSdBib5fayP+YDCkP3+9HMDbHstRx94ORmWBD
 +SoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730403172; x=1731007972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jcv819KyGF7gb7Milxae3g5KBBPuhxN7NjyGwjKfWLU=;
 b=FkfCtkrCF1fm+2+uaz9HV51eU3i3qEF5Xm+bLQqEhZW6gpb+esw7i5b35NIAFe2t4g
 pRVdZ1ayRppV6fuoW86Y8jbuuEBJ+u5A+u1QH0VNzZRQ/hGYZHQarDtWM1Wf3jM+drZP
 2xkbthS7D/2ggXC5kuSNDGZmyIUbmiOZy3l1+pdhQrTPwgsCesz77KgB9H63lael6ZKi
 DGW6j8waRWgf6r7UhHXUaKss0KP+q4+rSouEAl7gyS4KSORWwOm7AIJLKIVpZDNjDjjB
 jImj/BGt+BdaScygpGYtiGJj21XClpTXCImhJT4Ci96aduf+o+1D6TMlf6FxpI1AxdXa
 zYyA==
X-Gm-Message-State: AOJu0YwdP2s9prynlKYAL1Mc0ODh4zIuC1GowhwKrNCA8avSDgkujjce
 co4wXg5EmK+miHMYybgtNnxcPooUDo3OA9s8w/6JSfQqtSlxCqHDLNvlxpReVxs=
X-Google-Smtp-Source: AGHT+IHJprEln6M+XsL54JaXRSFRk2Lz1FfBJ2GTsM+1MhZcz+bSNqK0YPKdx4trYZ+bl12MmRiwAw==
X-Received: by 2002:ac2:4c46:0:b0:52b:de5b:1b30 with SMTP id
 2adb3069b0e04-53d65e1a5e7mr686686e87.44.1730403172530; 
 Thu, 31 Oct 2024 12:32:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bde0c34sm303481e87.269.2024.10.31.12.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Oct 2024 12:32:51 -0700 (PDT)
Date: Thu, 31 Oct 2024 21:32:48 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Barnes <robbarnes@google.com>
Cc: dri-devel@lists.freedesktop.org, sukoo@google.com
Subject: Re: [PATCH libdrm] modetest: Make modetest availble to vendor on
 Android
Message-ID: <upxsvozu33vh2jpliq7kigp6a62vkibrohi3f7e4arfptptard@44afro6gchfs>
References: <20241029144305.2911711-1-robbarnes@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029144305.2911711-1-robbarnes@google.com>
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

On Tue, Oct 29, 2024 at 02:43:05PM +0000, Rob Barnes wrote:
> Make modetest available to vendors on Android. libdrm_util and
> libdrm_test_headers is also made available to vendors since these are
> depenencies of modetest. This results in the module target
> modetest.vendor being availble to vendor modules.
> 
> Signed-off-by: Rob Barnes <robbarnes@google.com>
> ---
>  tests/Android.bp          | 1 +
>  tests/modetest/Android.bp | 1 +
>  tests/util/Android.bp     | 1 +
>  3 files changed, 3 insertions(+)
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
