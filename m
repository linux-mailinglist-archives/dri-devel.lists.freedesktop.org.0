Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 972A299287E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 11:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0BC910E33F;
	Mon,  7 Oct 2024 09:46:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NV8QO7o2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3C010E33F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 09:46:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5c721803a89so5718118a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 02:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728294413; x=1728899213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sIZYGUSm5n0CM1xfOyOcn+J2PQRTi3eRyKONbBJ1NXI=;
 b=NV8QO7o2tvZ1zqEqRS/PwgKHsCmn8PdWO5FfsX29iNMf6gauEkuhz8XoyaC66ne2g1
 3O7qccr51vP+9ZItX6P198foUqMXRrcOktke9wX+/Kk8b7Q2PhmWqtkzzWAAZPsOiI/8
 qyZY/iV9k05s2kbXoHM5x8KArn7Obd1ZoGZvzR7eoyrdZWyI00N9o+ioms1eAkbOiibM
 wJtXiL6KalAzVcvCSPQoqdrjMk6StilNIjhhck4sKvFSKc3RzODLPwaJ1jl5nIMuMB8i
 8/p4DeyBgGLCYyRghLxosoErCr1QSY7FbymUMEqxOMfiiuuZKF/dv1HdpCyGXimKFtsX
 TpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728294413; x=1728899213;
 h=content-transfer-encoding:cc:to:subject:from:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sIZYGUSm5n0CM1xfOyOcn+J2PQRTi3eRyKONbBJ1NXI=;
 b=vTy67C1woTLxaSIhsVrc9x+iekW+qb61bwwDFh1GdYFQTwGA1LDvRlGxD788BwtwO1
 3LoJLXb1RVZZsvUPzxYrHFdfqpXvDCSRdZfqgq/ddnnvnZxkvUyINFm2MyFhOLX+pqoM
 ci/PiDtwmO4smLAKvM/nclH22hrWhiAp1DZLSMfeI61sQr//DMxowV4xeiaZiJyA39Z7
 mKeVK/DOcs9LgZf50jVL7PoTOEuxZetwIOpUI5nADOP1xDEEivSFOCl3P7YCeq9wsq+x
 14rvHvIaEDNxL0PZXxwWefvHGitsGiQ7x3RJ3XGw08aPcU/KEgCiyOdBPu6dcaVsP8xK
 +G6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWBZI3cwvJmsw5uzczWW//1LWaConu8cKuVoobcn6N1QPsII/JxdoDcWQqKZNM1TbpQV0AEEPl3I8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5ZAsaZ+sZdS0OJF4A0Uyx09yB+ZolDszLtSW9vTqzLG6KeYAD
 g5Pbr9D7m3Jrzce4uRT7iRZ4mY3bkC1Fp86RCkcz+/3udjzOoBqL
X-Google-Smtp-Source: AGHT+IHEMav/mhqiwv4Rl0XtoGZSLctL+PY6K8s9ycs+1ZRaigkFvSgNGU9ywK47/fmJDNEDOb1TNQ==
X-Received: by 2002:a05:6402:4015:b0:5c7:2209:e937 with SMTP id
 4fb4d7f45d1cf-5c8d2e1141fmr9847728a12.12.1728294412638; 
 Mon, 07 Oct 2024 02:46:52 -0700 (PDT)
Received: from [192.168.0.101]
 (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
 by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05a7e87sm2983791a12.24.2024.10.07.02.46.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Oct 2024 02:46:52 -0700 (PDT)
Message-ID: <cd76a15e-70e9-4abf-9932-38d520b66205@gmail.com>
Date: Mon, 7 Oct 2024 10:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: "Colin King (gmail)" <colin.i.king@gmail.com>
Subject: shift and mask issue in drivers/gpu/drm/sprd/megacores_pll.c
To: Kevin Tang <kevin3.tang@gmail.com>
Cc: Kevin Tang <kevin.tang@unisoc.com>, Orson Zhai <orsonzhai@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I noticed a shift/mask issue in dphy_set_pll_reg() in 
drivers/gpu/drm/sprd/megacores_pll.c, the expression (pll->kint << 4) & 
0xf is
always zero:

         ...
         reg_val[4] = pll->kint >> 12;
         reg_val[5] = pll->kint >> 4;
         reg_val[6] = pll->out_sel | ((pll->kint << 4) & 0xf);
         ...

I'm not sure what the correct expression should be, but the current 
assignment to reg_val[6] seems incorrect to me.

Colin





