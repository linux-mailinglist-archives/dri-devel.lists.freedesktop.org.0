Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC146EDFB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 17:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397FC10E567;
	Thu,  9 Dec 2021 16:53:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5582989F8B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 06:11:55 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id w4so4337281ilv.12
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Dec 2021 22:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:subject:to:cc:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=n5D9j62aLJ1+fG9wTsNvAoJm0MnkmZ9E3fqfoRqVqgQ=;
 b=d2n0WLemxkM3AvTgShubVt87nB+MoNU0jWskn97Aro1M162OelQj920qEtdAPJFuCz
 Dne49bZ1dZUxJadgF2Fu6723qU9Ymk9zt1VT3Oy6dp2dCDNc7/v2r0URxOlf+yWa9Pni
 Yw2R2Noffb/h4Y1+Vop1QSNE8ZIG4bCX1RNJlY7ZH8UqaA1saVBoVvQGAvbu3zWN5egA
 xzcWsWRDf33Y7SHBey0sLvk1PUn32vF1IAv2bocMSj8HR5iD4gd4QefbAxohIZhAURTT
 wVYyvibZqKtG5syR0ZOxOVu8tgysKHW68yVFqI5vU4nGczBQ31LC3fVM4xyv+zh4ctgZ
 IqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=n5D9j62aLJ1+fG9wTsNvAoJm0MnkmZ9E3fqfoRqVqgQ=;
 b=U+AXFV5lTqhuxVgvaPVoVUKM5ALVWDMEFs0zZPFnbOocr+g0f2AgUGvzmdsQcD5uBi
 ZpoIdEyUJ7Gc9wSA20D81Kq0qSvtC3a+UqQjpQv+TUuOuProG14Z2wPkfPuS4JFwJ4UC
 EvRf7jAkXMuKdkNY+fu+MMDutyjGh7RB+vPOnGjtNH/lEvzb8AZYVuxxgfVtPGabz2nx
 Aiv3jgsK6VKdDswc9kw3uZhtyEy3WYLimNcrW+AGCWlMHr92hqjNoRFFzQXgfTsfV2vg
 Sd/1X+YVg5JzuvVMBzKjnLt6YtIAmZF8DC00EQZ8Od+CMGpGT+25bj0tgRsF4UrLtcam
 /3hA==
X-Gm-Message-State: AOAM530tsSrQb9/c8oiMtF08YZY6DzABZDcr2xPkaiZTZsXVyyiMqa9s
 /DQW/OaXitOfPLVBd0FsBSp/9hD1Qco=
X-Google-Smtp-Source: ABdhPJw6hmO7CntdCxZ8lHNThS3s1rc6zaJgR0zqgXiUGoiyuHnsrm0RNM0XpMkJkiO3j1rKXJSh9A==
X-Received: by 2002:a63:f749:: with SMTP id f9mr32031978pgk.330.1639020728016; 
 Wed, 08 Dec 2021 19:32:08 -0800 (PST)
Received: from [183.173.151.43] ([183.173.151.43])
 by smtp.gmail.com with ESMTPSA id f8sm5423951pfc.77.2021.12.08.19.32.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Dec 2021 19:32:07 -0800 (PST)
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] gpu: drm: possible ABBA deadlock in
 drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd()
To: maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch
Message-ID: <ae29d7e4-2794-7d4e-becc-fccb576a706e@gmail.com>
Date: Thu, 9 Dec 2021 11:32:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

My static analysis tool reports a possible ABBA deadlock in the drm 
driver in Linux 5.10:

drm_gem_prime_fd_to_handle()
   mutex_lock(&dev->object_name_lock); --> Line 313 (Lock A)
   drm_gem_handle_delete()
     drm_gem_object_release_handle()
       drm_gem_remove_prime_handles()
         mutex_lock(&filp->prime.lock); --> Line 16 (Lock B)

drm_gem_prime_handle_to_fd()
   mutex_lock(&file_priv->prime.lock); --> Line 433 (Lock B)
   mutex_lock(&dev->object_name_lock); --> Line 466 (Lock A)

When drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd() are 
concurrently executed, the deadlock can occur.

I am not quite sure whether this possible deadlock is real and how to 
fix it if it is real.
Any feedback would be appreciated, thanks :)

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>


Best wishes,
Jia-Ju Bai

