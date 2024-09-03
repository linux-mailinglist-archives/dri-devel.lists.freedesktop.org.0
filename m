Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6742D9696B6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2024 10:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0C4F10E1EF;
	Tue,  3 Sep 2024 08:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xj8FrPg3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3818210E1EF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2024 08:16:24 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-5c241feb80dso5337558a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2024 01:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725351382; x=1725956182; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=et6Oc3OlCMrVxucpzkRBMywggjLDlMnpSE07KjghInI=;
 b=xj8FrPg3gFbGPHDk2p2boXjh4TticB+zKdywqsbdmkxVNFq5TA0GfelcsJ8NBspGGD
 ydvn472Ao4XM+8yo8DkSD3X5GFT3BrUwIsNpKnonHaiH3Djums4xy8yk2mYwa6yvH/19
 DEe2yIyxrWbENMW/SmB3qmQDNIcxYhCg3KSh/YADeMvN6FBKLR09pVp79BOePCQIvdXx
 v0g7Ts1KWzjn2jAQivlK69e7phCFP72k2DXBORxcXpCwLnc512hi828PQjPHdcEaGR/A
 CGnKuSPRmjgx5o8AOu+T2hwNWpPyVi8MK51Cnlwb+qjcpQ2x3LN+NpBeY5uIwPu9lHn2
 3wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725351382; x=1725956182;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=et6Oc3OlCMrVxucpzkRBMywggjLDlMnpSE07KjghInI=;
 b=NJicjD4NfbD7Gik0jRrUmtzfiMAy3ZfDtYVE9d7nBbv+eb4QYg06F3F5qiaEM8KwKQ
 m6FJZOvf1fYHQ9QZw+UriU8XxE6H3bN9Z35ja+oeR+HJ00hYtxkQrjqf1THLafcxU02Y
 r6O1niIPe3dH+j6GUeizrt1ULD5nW88je61FlwW8d2JehxY7XsOxrYQDPmIFsV01Ut0i
 sgOUCFT7lKuHFXczXkMS0DiVQSHpLBjq8ehErsEHbVOErLzAB07V4YKD0hEQQOeGMvqW
 LjryritA0VyMJsfRcvfgw40Zmrp6nrbMXkfJBkX9dprHjyNcx42qoBJkvPR2Zd0/6X2m
 1RnA==
X-Gm-Message-State: AOJu0YzDy+77jGx88SBj1OOB/Ej+SNrSyjaHHcDifRcpbDImnJmkxZBw
 XNNdF+ER1bVyLMq7ciYqEausyIYSM39o0jYFoFdVqB3xY+IbudJeCDlQPu5hkFab1M/Pau0OImo
 0
X-Google-Smtp-Source: AGHT+IFFaKgiizFeRmDG5O0JN+jvqgYpQsj1HAdIhElfNMWM4vkxfGPWRHLrkwQo2PhYMYEdf+8mvw==
X-Received: by 2002:a17:907:3eaa:b0:a80:9c1b:554f with SMTP id
 a640c23a62f3a-a89a292298fmr1701467666b.27.1725351382442; 
 Tue, 03 Sep 2024 01:16:22 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89891daf81sm650417166b.163.2024.09.03.01.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 01:16:22 -0700 (PDT)
Date: Tue, 3 Sep 2024 11:16:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm: add msm8998 hdmi phy/pll support
Message-ID: <a9f756ef-2580-4906-b7a1-d6452331c8b5@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Arnaud Vrac,

Commit caedbf17c48d ("drm/msm: add msm8998 hdmi phy/pll support")
from Jul 24, 2024 (linux-next), leads to the following Smatch static
checker warning:

drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:634 hdmi_8998_pll_prepare() info: return a literal instead of 'ret'
drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c:646 hdmi_8998_pll_prepare() info: return a literal instead of 'ret'

drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c
   620  static int hdmi_8998_pll_prepare(struct clk_hw *hw)
   621  {
   622          struct hdmi_pll_8998 *pll = hw_clk_to_pll(hw);
   623          struct hdmi_phy *phy = pll_get_phy(pll);
   624          int i, ret = 0;
   625  
   626          hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x1);
   627          udelay(100);
   628  
   629          hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
   630          udelay(100);
   631  
   632          ret = hdmi_8998_pll_lock_status(pll);
   633          if (!ret)
   634                  return ret;

This currently returns success.  Should it return an error code?

   635  
   636          for (i = 0; i < HDMI_NUM_TX_CHANNEL; i++) {
   637                  hdmi_tx_chan_write(pll, i,
   638                                     REG_HDMI_8998_PHY_TXn_LANE_CONFIG, 0x1F);
   639          }
   640  
   641          /* Ensure all registers are flushed to hardware */
   642          wmb();
   643  
   644          ret = hdmi_8998_phy_ready_status(phy);
   645          if (!ret)
   646                  return ret;

Same.

   647  
   648          /* Restart the retiming buffer */
   649          hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x58);
   650          udelay(1);
   651          hdmi_phy_write(phy, REG_HDMI_8998_PHY_CFG, 0x59);
   652  
   653          /* Ensure all registers are flushed to hardware */
   654          wmb();
   655  
   656          return 0;
   657  }

regards,
dan carpenter
