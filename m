Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768EC3D82ED
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 00:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 148346EAD1;
	Tue, 27 Jul 2021 22:30:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828B96EAD1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 22:30:48 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id w6so1194740oiv.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 15:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TM+0hfl782kZ94bU2+mpLOzzj7zbvQhOg+LQO69XhJk=;
 b=OnZ0m3U6tk3aCgWWTpT1MeD5/y+cwwRGzbM1zoIOCsQa4Vm9x21ssaUT8KnrIx+bhB
 Wa4U8xGQ285YoMNgnePTt2oCAcFoa8EIx3hrP27YcLLsbYrem2nEpOrbnmPnPX0ir/Ic
 V51k/BxJeVFK/eNOf91oJ90M75vlYzafc5fjuq+9/rO8ZtxNzXPK1thYL0Dwh0Tn2olv
 SivSSSssPuoXELYpGRGeF7OTsoxb6Cx0zu/1/SiPhOUEi34dJjExAZbJyPC9Z46LMBVp
 AhzMesAzkabVEr5OAd/P4rBe8czDEUBkikopbW0OPFtJ2NPn2COjgAV4AOGkH4MMFPaQ
 1nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TM+0hfl782kZ94bU2+mpLOzzj7zbvQhOg+LQO69XhJk=;
 b=Jo8jELMa7YLGMlD78sX22Un7uSh/gPYcrUNoEDA3jPWJjrpQx3LstZttUCqccmNzTo
 IjQm5nWG13F0x3CXMl1oP5PghAQ5KveStm+3Ts7+VsppJUhiTSJG7NXSbqDlZHN4he/O
 o27T2+ad87Dt2TIiLsD1w8CIRQrCHb3+PvMx45K++hVILYseknDdDqrZ66tNQkUDgn9T
 Sg3Y7/CXflS0Wgjv0qddp2zVSPDmIHs5A6siHDj+Qydcxuo/8KUatuPfVORmr+ZcpAhu
 yPhdRIy2DQJkbJokN57H87vFzmQTu0hD83mGm4Uvl64ikinWuzrydi7IFKvTpslOQz7p
 FQvA==
X-Gm-Message-State: AOAM530MqLELfOcwNawvwn5YGLLdrwDKBfh8aPT5aCQcEmWBgOM7LcUU
 NG+rGYmDI2G1Ws/qehJkFAM=
X-Google-Smtp-Source: ABdhPJz1wrwXjwcPUI1kIk1ky0ig9jrAicZ/h11+lv2H2/uL4SXlKLhoPqS89RPsBt2E7Mkq8bcgCQ==
X-Received: by 2002:aca:d505:: with SMTP id m5mr4174267oig.5.1627425047828;
 Tue, 27 Jul 2021 15:30:47 -0700 (PDT)
Received: from localhost.localdomain (cpe-24-31-246-181.kc.res.rr.com.
 [24.31.246.181])
 by smtp.gmail.com with ESMTPSA id c16sm783982otd.18.2021.07.27.15.30.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Jul 2021 15:30:46 -0700 (PDT)
Subject: Re: [PATCH 07/64] staging: rtl8192e: Use struct_group() for memcpy()
 region
To: Kees Cook <keescook@chromium.org>, linux-hardening@vger.kernel.org
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-8-keescook@chromium.org>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <fa3a9a2f-b611-7fe4-9359-88fa51239765@lwfinger.net>
Date: Tue, 27 Jul 2021 17:30:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210727205855.411487-8-keescook@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linux-kbuild@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, clang-built-linux@googlegroups.com,
 Keith Packard <keithpac@amazon.com>, netdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/21 3:57 PM, Kees Cook wrote:
> In preparation for FORTIFY_SOURCE performing compile-time and run-time
> field bounds checking for memcpy(), memmove(), and memset(), avoid
> intentionally writing across neighboring fields.
> 
> Use struct_group() around members addr1, addr2, and addr3 in struct
> rtllib_hdr_4addr, and members qui, qui_type, qui_subtype, version,
> and ac_info in struct rtllib_qos_information_element, so they can be
> referenced together. This will allow memcpy() and sizeof() to more easily
> reason about sizes, improve readability, and avoid future warnings about
> writing beyond the end of addr1 and qui.
> 
> "pahole" shows no size nor member offset changes to struct
> rtllib_hdr_4addr nor struct rtllib_qos_information_element. "objdump -d"
> shows no meaningful object code changes (i.e. only source line number
> induced differences and optimizations).
> 
> Signed-off-by: Kees Cook<keescook@chromium.org>

Tested-by: Larry Finger <Larry.Finger@lwfinger.net>
Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Looks good.

Larry

