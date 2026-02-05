Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULJXLTL8g2kXwgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 03:10:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E219EDE1B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 03:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B9CD10E793;
	Thu,  5 Feb 2026 02:10:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fu/bGbgU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FF8E10E795
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 02:10:53 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-823081bb15fso265650b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 18:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770257453; x=1770862253; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ehkuq2O/K2xB5fajZtZYRD4XPWHHY4lOk0zBeiDKX8=;
 b=fu/bGbgUhCqP8JVjMfnCyI/Elt1wkcve8thCZRBPVeZha1R9Hb4mXIP8MpnCagFyS1
 Ug5j48Om6kFzu2/G17CEEvzm3iCvpoKaZ83S7HbEfTaY3a5dLV5v8u09XXBaeWTLnnUW
 bZG137Ybo96UNNGxVQFbW7i/UosrYcUW6W5LwZgnJ0/4lsN5XItzpplFsJ+J0JkBkO0x
 d9+3NBzDrCIRVZlii96mfFQlt+BFva3ePEVxXQoiF0SPhEzrPjVl5YwaQaamko9vWKIF
 6/+znxVN6CgqHWB86q9c6bE6hAz1UCxNVsh+BCuRV9cmp3UoRzWYxNVTlz921zALGNay
 fYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770257453; x=1770862253;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ehkuq2O/K2xB5fajZtZYRD4XPWHHY4lOk0zBeiDKX8=;
 b=olV2W3FbNTFlhXG3mMUSDLE4M7PheJ8Px210pzaHlGPixSc1b6sGbSJYFOoD6Xxgub
 UC259Zd6fAOyF6iTvEBvFhFT52ET25UAhm58E5wB4vYPa0TUfgS1vTDh1UdFPxDRw59N
 iIXu2iA1/ujdwMJVswltZDisvobsBsixm2tbAd4sau7CbUqeAxTrP+lnO/IpnAi6+Nu+
 Cghyg+2o8nFuwQJQ5CWPnHqImEDeUHreoIFAyk1eTcBpEkX3+MxuCOz74YUit4nDkRhH
 kiAOcMC1eOAN5hAMPTzA/j2qn9aqZJV0XNHVT+tIFT3xZbp6Y1GiYLdS9mLdnHQja/id
 q0lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfCPn+NG4GFbOMDq8I2/Hq+qhUFWiazJUyCjYc6ztzEpkqgNQwzOw+WRX5oheSVK5Lz6LXRjgCq0w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHV+qNzxVR8E/LIro8RnFlMofk5cDjRLl3frs2p1Q6+I3TEx/1
 sM1iU3goB8+24cIIsSbA/2k/sk6oZre2YRTOmFkXBblSAHYWm3TN/WPW
X-Gm-Gg: AZuq6aJ3StvJB0N+pnf66qGsnKWGT90cXzR+U7lDr/zHfx85hMgai2esPzfZDMWDSr8
 ZBb5e8CNBeHFyxJIXfLxnNuqdCtuo4ARrTqZycQwMBLLGg9Zt+nFHeLvhIrOFjOnNs8KCMksnSL
 G+Yo1x8aa/EaSe0q0W3XaKI3Hg5ctoxbE1/ktHwFp2ox/pWgvAJS/fDr3y+UnRnO0fYU6jCO7TE
 6fXuzNbzYXOKR4Ftf22QNM7DHcRX70Zh9py6p7pIf8KqxBar4RH7OXn8UrJKieFF0TDVnPocCDD
 6PFh7vW6qBQUglm5ZnuvAvc9hIya3bibAr+tfyHizowab3EMNdY4mbFeLBCkZlfEJhYu8rd5vJY
 alSfwIj1UvLJ8PjKKGAHBOfT16qBYlQqkatRj9lEvKjqSa3KaEUwjD3m7WpBcCwrdB8bZDQRhsG
 ODAFryWajXEEyCyiLipEVmcGFlhTEbXo1VEM+nxBNR2TxWKmNgVJTOxDFkBeMf
X-Received: by 2002:a05:6a20:2594:b0:35e:d74:e4b6 with SMTP id
 adf61e73a8af0-393720986eamr5307829637.7.1770257452551; 
 Wed, 04 Feb 2026 18:10:52 -0800 (PST)
Received: from ?IPV6:2601:1c0:5780:9200:48b3:a9c0:8af4:57e0?
 ([2601:1c0:5780:9200:48b3:a9c0:8af4:57e0])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c6c8506377esm3425616a12.25.2026.02.04.18.10.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Feb 2026 18:10:52 -0800 (PST)
Message-ID: <31fdfcfb-bac0-4fec-96fa-be561167a33c@gmail.com>
Date: Wed, 4 Feb 2026 18:10:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panel: jdi-lt070me05000: Use MIPI DSI multi
 functions
To: Doug Anderson <dianders@chromium.org>
Cc: neil.armstrong@linaro.org, jesszhan0024@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260203044605.5890-1-chintanlike@gmail.com>
 <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
Content-Language: en-US
From: Chintan Patel <chintanlike@gmail.com>
In-Reply-To: <CAD=FV=U=+CvY2qPGWWwsde0a-OQuqk55QG_HqWSPCKZ-TP8Huw@mail.gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,lists.freedesktop.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chromium.org:email]
X-Rspamd-Queue-Id: 0E219EDE1B
X-Rspamd-Action: no action


>> ---
>>
>> Changes in v2:
>> - Replaced mdelay() with mipi_dsi_usleep_range() for timing (tighter bounds per review)
>> - Switched to mipi_dsi_generic_write_seq_multi() for cleaner varargs syntax
>> - Applied lowercase hex notation per kernel style guide
>> - Added error accumulator reset in jdi_panel_off() to preserve power-down behavior
>> - Kept final msleep(100) outside multi context for safety
>>
>>   .../gpu/drm/panel/panel-jdi-lt070me05000.c    | 105 ++++--------------
>>   1 file changed, 24 insertions(+), 81 deletions(-)
> 
> This looks nice to me now, and I think it's a nice improvement to the driver.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> I'll put it in my queue and plan to land it next week unless someone
> beats me to it or has additional comments.

Thank you Doug! I appreciate your review feedback.

> -Doug

