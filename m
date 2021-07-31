Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3692B3DC420
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 08:47:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E0716E5A1;
	Sat, 31 Jul 2021 06:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65CA6E5A1
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 06:28:42 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso23965014pjq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 23:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=JI/AiDS71PLMhgUv0hBwFcFtgPLD6LDNF4PEDeob9ro=;
 b=MOr0BM39xVuj92jfaMMUBFIQ0dbZrOfjkySR61KBZFifIngNEgamqr8i6fT250V8Za
 dgE9kQMAB+H2ku+52DnI9evayG9+uQF7tBDAf7xl8fT8MSMQt73RTfvhJOC6H1GKhihE
 DWu0XwkEdr8zH0GWJsbOB8/MemoeIdaa1/u6zyicw/OxvaF1PKS9JV8W6CL3ev5TCk4w
 ms5NUqmAXXEd2V0DQp07UrKZQTTAGIqkvV4nFEduPgIFaBC2LOBe3Uq6MdOLxyHTnHov
 P2a1d0MclBg/nGeuSUTjkIylMUTlU+U6SeKEuwNdHJ4RBsdZyxslCJ65ORZjYDf9xRCx
 ggmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=JI/AiDS71PLMhgUv0hBwFcFtgPLD6LDNF4PEDeob9ro=;
 b=KK7tIE1INX441/X0gUkYrwyNm66cHcHv+BLQl6gTuBWXWTH2nUPxChKkavVCbWmjUy
 2XPJteBmH3tplbopVjCHidOvoLXAGHDoxdMQGhvkTNkYKupNSZOzjJxgao/okVfjZjC/
 XDG93z5Zo6VybEC58vv+9ut7umyq1gI0e9Odb4IvuxyV2Xs9aN0OzXx3ETm4QnWjJeI3
 L+r1Evgvi85J12iDzSUclRfvpgEfN8Twkws5AS93hRVgWxxmO0zbS+vuvu2+fObJCAZQ
 iCSbvwMCC2EHLSzdu0qchtPNfekp2rWarLzJtsy2ppEFpXIkzHV1ybPW9KqSsY1Ot0pI
 /S2Q==
X-Gm-Message-State: AOAM531odUGK74Oxt8H/EfIZ+qgBFx99ze5T50FCznthDnj5NblX1ZgS
 T4XlGL6jhB+g7igwPpHJigw=
X-Google-Smtp-Source: ABdhPJzIpd2r4Hg0vSxNMPGAydkVCoSMg0Vn8hPVD1soJeL4Zhdd0jtTSvC5xzqIT+2msYDwWK3+KQ==
X-Received: by 2002:a17:903:41c1:b029:12c:a3eb:21c with SMTP id
 u1-20020a17090341c1b029012ca3eb021cmr422810ple.72.1627712922486; 
 Fri, 30 Jul 2021 23:28:42 -0700 (PDT)
Received: from [10.106.0.50] ([45.135.186.29])
 by smtp.gmail.com with ESMTPSA id p3sm4255848pjt.0.2021.07.30.23.28.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 23:28:42 -0700 (PDT)
To: thomas@winischhofer.net
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
From: Li Tuo <islituo@gmail.com>
Subject: [BUG] video: fbdev: sis: possible uninitialized-variable access in
 SiS_SetCRT2FIFO_300()
Message-ID: <e0f988f3-f010-6299-d000-5c035e5f2e2e@gmail.com>
Date: Sat, 31 Jul 2021 14:28:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Mailman-Approved-At: Sat, 31 Jul 2021 06:46:55 +0000
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

Hello,

Our static analysis tool finds a possible uninitialized-variable access 
in the sis driver in Linux 5.14.0-rc3:

At the beginning of the function SiS_SetCRT2FIFO_300(), the variable 
modeidindex is not initialized.
If the following conditions are false, it remains uninitialized.
5346:    if(!SiS_Pr->CRT1UsesCustomMode)
5438:    if(!SiS_Pr->UseCustomMode)

But it is accessed at:
5466:    colorth = SiS_GetColorDepth(SiS_Pr,CRT2ModeNo,modeidindex) >> 1;

I am not quite sure whether this possible uninitialized-variable access 
is real and how to fix it if it is real.
Any feedback would be appreciated, thanks!

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>

Best wishes,
Tuo Li
