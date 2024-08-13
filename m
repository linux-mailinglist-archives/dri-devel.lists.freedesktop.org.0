Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6BA094FFE1
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 10:31:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3295F10E202;
	Tue, 13 Aug 2024 08:31:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HWFRYbEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043A510E219
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 08:30:59 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id
 41be03b00d2f7-7c2595f5c35so834573a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 01:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1723537859; x=1724142659;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mte+8SBXU4fsMgf1dqa+xia4zg6iVcJujhUtX3mlIL4=;
 b=HWFRYbEfkULCC2iE653W5ELUSIJ4ZSmEGb60H581jggCK7Xt5ywOjwmQhxYBGTVK/y
 1I4zea90/5OJ92EPEiUrkdVtBEd3+AmJ+kqHpYAxIURobgYfpxtbXiX5u4fFj+39gzbg
 fPsWN9kQq9fu+jvTsuy0INrQ2AtQ6UrK4hTEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723537859; x=1724142659;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mte+8SBXU4fsMgf1dqa+xia4zg6iVcJujhUtX3mlIL4=;
 b=R/sPkbBMTI41eI46XtLamybI4eNMTqWkDI6urHN6+z6K7mNL0psjZdr9eOdHUy+PHk
 p6jFoRELfmFz74xadlwYb6mr99HDa0k+gGklxx9p0VkAt6ABzyMtwGNmo6QoKq9XDO0b
 Azae7r6IeUvW5b4hd+LAbWI0SzBPfkBR7L5W/jO8QqpoFwkxeMq/1NS3fKmQ5CmCcx39
 ipDkZJKGa4IDlati79onVeqADLS9IXpYHQt+QD9S1DTYuOVCvH23povLmN/jpIUXNnn/
 cKl8WUS5NaNaKnIy4RhbEDuL0Vjzs1s/myj+F50nM+8DSaEhGlPR0r1cUoQWgyfs9XJQ
 zb4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFZGwwnkXUlqHQRPPgFsmEC7qMjiIiaiAPzLREirV/8acGhp8/X/6xmuKcQArI/8vV+DwrYutdpmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyB+s07d53VWLy5CwCRk08rchLv/l+NsuY46EKMATlRWN/Oz+d2
 Gw02FuaEGUa1V/hFKEE16PQLLmJKywdnWOj8GaahSCIDwuFtkpbjYhpmmVg5WUk=
X-Google-Smtp-Source: AGHT+IH+G4nGhI0UfmV7v12uHGx5Nk07nrbH2qcW0vXTaroCsC8U1dDUEWx60DGbADoAQQeROmNokA==
X-Received: by 2002:a17:90a:6fa5:b0:2cc:fce3:3022 with SMTP id
 98e67ed59e1d1-2d3968f829fmr1039667a91.5.1723537859250; 
 Tue, 13 Aug 2024 01:30:59 -0700 (PDT)
Received: from [192.168.104.75] ([223.118.51.112])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d1c9c5dbaesm9835229a91.10.2024.08.13.01.30.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Aug 2024 01:30:58 -0700 (PDT)
Message-ID: <2aabc166-bf34-49b3-b938-bbfb0f85e8bb@linuxfoundation.org>
Date: Tue, 13 Aug 2024 02:30:54 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpu: ipu-v3: Add cleanup attribute for prg_node for
 auto cleanup
To: Abhinav Jain <jain.abhinav177@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 javier.carrasco.cruz@gmail.com, julia.lawall@inria.fr,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20240704132142.1003887-1-jain.abhinav177@gmail.com>
 <20240812193714.1094339-1-jain.abhinav177@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20240812193714.1094339-1-jain.abhinav177@gmail.com>
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

On 8/12/24 13:37, Abhinav Jain wrote:
> Hello,
> Can this be kindly reviewed? Thanks.

You removed all the relevant information for people to be able to review the
patch :)

thanks,
-- Shuah
