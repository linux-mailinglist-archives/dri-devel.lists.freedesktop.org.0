Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B87B947C884
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 21:59:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27D610F407;
	Tue, 21 Dec 2021 20:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C96A810F407
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 20:59:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bq20so581052lfb.4
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 12:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EMjej9HUtAXOcAMoyZw+nimK8vBoVTGCydufGYxXW3A=;
 b=QBxyUvO5aXbxIR0XthlyHePXA11I979yfrf++6Y0YXUqD3swGqlQJM6N0SK/yeSF+N
 oPD03Rnl39x+aXv/H/sdi+RAKmXkUy/P7qzmBLNwphVzzxjXMF2uhCvotIV9ESDHgQHu
 SF8BPoPlscsudtTMuzetF1bNB+QRvQJzVOxCgUe2mVVbMlcoMvzYfM9GeHQyuEVNdsro
 3u8bS2UuxWFsWIKF9oOCdJgkiptAxYRerVHbNFcYYTuAHFFyttwtE/I9WiYnIpH5Az1N
 kkKHi4GRLrufxZTanpKnTmHxuoB0gY4w/VSml3M4Vauilk8+gRLJHbMrGLiVdQdsDjBh
 QwjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EMjej9HUtAXOcAMoyZw+nimK8vBoVTGCydufGYxXW3A=;
 b=6tX0ap/TKb2+bS3avFo1idNGSQeYmCVCBDCX0KsGpGPeKT37Gx0cpjBzr8QH/BBdJd
 WEjjHPcgU0SwThVHVmvBB/ha1aqr1FqonAGzvD4aTZ9um6dHW6Me86HsfBrP1Fin+RVM
 8NOijQhhGNLofAOTZB2A4Jqqic8RNhyKxeubU4tY6V0AXBB4qIbQgxhCpupcSQhG7S2C
 aWSYPCLTIWrk7YyKmS1Bkiq/w6chDW/yvzdU3uHEiUnEh5fsyK2NlzAp9SsinDYVF5sO
 s6j9uZrPuILR+6wJ/mHd6gC0o7Jz5LNuUE2NtN67a/SipTkLk6/kgV+dqvc7MsDHlAxm
 Wjug==
X-Gm-Message-State: AOAM532VEAZCbRb7Dbr5ryQTr36LTsBLBOfwyiFO46pSeq+1WBCvzgil
 CvsF3M2q65/GK90hw6IiXcU=
X-Google-Smtp-Source: ABdhPJyQqGTd/AQR3V4qGYEJ+lnA9nHyBoOuC+0UYbMfak9DWTHgpUTRFKkjLQB10viCSl/8d/IXNw==
X-Received: by 2002:a05:6512:691:: with SMTP id
 t17mr125939lfe.55.1640120340186; 
 Tue, 21 Dec 2021 12:59:00 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru.
 [46.138.43.24])
 by smtp.googlemail.com with ESMTPSA id bj11sm200ljb.62.2021.12.21.12.58.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Dec 2021 12:58:59 -0800 (PST)
Subject: Re: [PATCH v16 08/40] gpu: host1x: Add initial runtime PM and OPP
 support
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
References: <20211130232347.950-1-digetx@gmail.com>
 <20211130232347.950-9-digetx@gmail.com>
 <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <41edc53b-5ed1-d524-2546-c3d1ee6cdea4@gmail.com>
Date: Tue, 21 Dec 2021 23:58:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <21212ddb-205f-71d6-0199-d75768eaf32c@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Thank you for testing it all.

21.12.2021 21:55, Jon Hunter пишет:
> Hi Dmitry, Thierry,
> 
> On 30/11/2021 23:23, Dmitry Osipenko wrote:
>> Add runtime PM and OPP support to the Host1x driver. For the starter we
>> will keep host1x always-on because dynamic power management require a
>> major
>> refactoring of the driver code since lot's of code paths are missing the
>> RPM handling and we're going to remove some of these paths in the future.
> 
> 
> Unfortunately, this change is breaking boot on Tegra186. Bisect points
> to this and reverting on top of -next gets the board booting again.
> Sadly, there is no panic or error reported, it is just a hard hang. I
> will not have time to look at this this week and so we may need to
> revert for the moment.

Only T186 broken? What about T194?

Which board model fails to boot? Is it running in hypervisor mode?

Do you use any additional patches?

Could you please test the below diff? I suspect that
host1x_syncpt_save/restore may be entirely broken for T186 since we
never used these funcs before.

--- >8 ---

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index f5b4dcded088..fd5dfb875422 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -580,7 +580,6 @@ static int __maybe_unused
host1x_runtime_suspend(struct device *dev)
 	int err;

 	host1x_intr_stop(host);
-	host1x_syncpt_save(host);

 	err = reset_control_bulk_assert(host->nresets, host->resets);
 	if (err) {
@@ -596,9 +595,8 @@ static int __maybe_unused
host1x_runtime_suspend(struct device *dev)
 	return 0;

 resume_host1x:
-	host1x_setup_sid_table(host);
-	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
+	host1x_setup_sid_table(host);

 	return err;
 }
@@ -626,9 +624,8 @@ static int __maybe_unused
host1x_runtime_resume(struct device *dev)
 		goto disable_clk;
 	}

-	host1x_setup_sid_table(host);
-	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
+	host1x_setup_sid_table(host);

 	return 0;

