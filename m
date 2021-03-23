Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B4234585B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:11:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64D26E836;
	Tue, 23 Mar 2021 07:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81436E836
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:11:51 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id l3so13356887pfc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 00:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=Lig4AcnARc8MsgNCD5GXXxoMSCjcO/mZQ+PYuBtLVyA=;
 b=Dy5D0xgI/YJveiiUmMCWm7jcTO4sz9SAiL2npAowLfIqxFR2XJod1E9fiJBD/p/7BT
 w2x54jkctwK2qtdsq/3ywvjMe0mT6Eroir3tftSFNeHu3w6T7HEvza/hsfvzeF4CzW/Y
 CmZsKmrXd6AH7/A4xJZvT7hb/CtzgZoljYJXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=Lig4AcnARc8MsgNCD5GXXxoMSCjcO/mZQ+PYuBtLVyA=;
 b=U4is3cyTuwWuwJy/8I83XCeybvnDyg5dREIOM19wtGFT7jY7vH8H/YUrzoYt32VsMm
 VxOXFXRLMbHO1Pzdls245Dnng6i8sVrsj+DK220FutDUlPoYWo4+H62N8y2CBE73FXjj
 UHxfT8yV+MK/oglsDdmLTAu811MSIgUPI1WP6D1sWRcij/cC6lhq/zunTblrsDl3Usi6
 qNvhVmFKP4p7+qXNHcxaZKytXnispSSSdATF17whBRDs9XsM3IYA5WvQtkivZ79UGNJa
 XsBT5u/FKs7llTtdyrzE5X9yq4YGQigMD3sPOoRLyzxQGGYNvitNuTTK3INpkvYO3xnc
 ZsKw==
X-Gm-Message-State: AOAM5322Lf+GAXYVfvmGqmNx8VzCoj+sIPa+QNJnsR2Ca89McpeE/Okq
 Fo5gcsc25u2ZQPeDW59ILnNxGg==
X-Google-Smtp-Source: ABdhPJyksLORba9ss7v0AFBqBThHyWdSDjsRTqdFRMe/kAiRqZvRDOOMCKoPkdtYUB+T+YQ2tONtXg==
X-Received: by 2002:a62:ddd2:0:b029:1f1:533b:b1cf with SMTP id
 w201-20020a62ddd20000b02901f1533bb1cfmr3520349pff.56.1616483511646; 
 Tue, 23 Mar 2021 00:11:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e90d:d453:87ae:2e10])
 by smtp.gmail.com with ESMTPSA id p25sm16026892pfe.100.2021.03.23.00.11.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 00:11:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
References: <20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210322030128.2283-5-laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [RFC PATCH 04/11] drm/bridge: ti-sn65dsi86: Use bitmask to store
 valid rates
From: Stephen Boyd <swboyd@chromium.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Tue, 23 Mar 2021 00:11:49 -0700
Message-ID: <161648350988.3012082.2079519894322559104@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2021-03-21 20:01:21)
> The valid rates are stored in an array of 8 booleans. Replace it with a
> bitmask to save space.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
