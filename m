Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4D2B77E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 09:02:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F98D6E43A;
	Wed, 18 Nov 2020 08:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A99636E0BE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 03:36:04 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y22so246193plr.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Nov 2020 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=diUqtZunx/UjcqbbhT4Je7Zj6fu6UKGAwXhMW5mk2Gk=;
 b=AMLoDLL3GfVM1STbX9/xTk6VliNiJr0YwOLeAg7i54QP7EoCz7VMk955TElCpWmwiI
 j9N2sIXacWcnmimKGbxoHCEXSLpD7ZmjhUwdUKU1vs/FXxsrdOrgIPsrl/2t60juYxcB
 DDIALijMpGftZLW1UXskLBZsWao12HjQTBWXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=diUqtZunx/UjcqbbhT4Je7Zj6fu6UKGAwXhMW5mk2Gk=;
 b=OSCQbXv1gICP2y6jr3kKPQaveYTihOFKXfVMpsL5PrskkBa7nfD3WCFlmjondqXrry
 sZ4RotGmVY+cpmeRhe1XAGkveH9JRv8vj9GEIU8QQI4+97rgDBPEWCaBZ8tjNOrvBHfV
 3YYbOmlBZlfpKaSeKQLBVheKixlOMLu3uuy0wSE8EoA4hip2csQ2wNrrz1+ZsFguQOz3
 SUUGxhGjv3pFkMyfS0JEua0kBlMSDHV8zPzEyK7ubkmi5Nj7k2Pe1TUfUZqRcOlz8I+T
 RQUjh73KtVAN7tlVeCuoIKzzJfLapY4573pODuW36nM0k7gP0f0MICa86uO6zpQP+oRR
 r+Sg==
X-Gm-Message-State: AOAM531NY68po2sypx5LL76yI1RFuR55Y0Vbu0eHeDDKGAfDzb4Q5W4Y
 GA103SrEbE1k0hg3hlW/74MwLQ==
X-Google-Smtp-Source: ABdhPJzVAK808Ab1am3c1X01IMyQIjbNaSWWOanE2FByJ/Gy8QSGdvWbR0gR5vev+WfHCJmpFHn4jQ==
X-Received: by 2002:a17:90b:805:: with SMTP id
 bk5mr2230390pjb.78.1605670564250; 
 Tue, 17 Nov 2020 19:36:04 -0800 (PST)
Received: from chromium.org ([100.99.132.239])
 by smtp.gmail.com with ESMTPSA id y25sm22603181pfn.44.2020.11.17.19.36.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 19:36:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1605638415-24776-1-git-send-email-khsieh@codeaurora.org>
References: <1605638415-24776-1-git-send-email-khsieh@codeaurora.org>
Subject: Re: [PATCH v2] drm/msm/dp: fix connect/disconnect handled at irq_hpd
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Tue, 17 Nov 2020 19:36:02 -0800
Message-ID: <160567056210.60232.5628804791726356039@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-Mailman-Approved-At: Wed, 18 Nov 2020 08:01:05 +0000
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2020-11-17 10:40:15)
> Some usb type-c dongle use irq_hpd request to perform device connection
> and disconnection. This patch add handling of both connection and
> disconnection are based on the state of hpd_state and sink_count.
> 
> Changes in V2:
> -- add dp_display_handle_port_ststus_changed()
> -- fix kernel test robot complaint
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 26b8d66a399e ("drm/msm/dp: promote irq_hpd handle to handle link training correctly")
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
