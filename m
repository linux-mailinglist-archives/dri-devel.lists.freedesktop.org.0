Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540034BC74B
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5D510F66A;
	Sat, 19 Feb 2022 10:01:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA25410ED0E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:25:24 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id j12so13746804ybh.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 07:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQP46pb+DPsuzuoL3BGGcclWodDFs0G/3Es7HjdxUCo=;
 b=cMfVnVTpouxlUm+jaYnytrgpG4TUi9DLUb+yI8qFyskWkAnXv+M6au1/maKPGNtmO8
 GcaWRklihf6L8yh393NfKIPLun4OQl9mYY1jRZzl8G0dxaxR37h911mKIPqAbIPKz/v+
 6NHpGj21rf8gWajcLnxmDL3+gi1yzfX/0r5GsyQNm0G3ZDxFDCyEhP0ciU9iVcvUP+7O
 O/wtUSIJGcfT+Ts4VAKp3Aryl+D1ZEsXMiVhErXbkzytbGDcWRcL5hG4Z9uexhoyPRc9
 FH+/+Hlyt8N+opqaLI0HBwUBgEOZ3cX4lZaeTqsxqLys+lkPUrmtmR1F+dIq1tL4rZGb
 Yk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQP46pb+DPsuzuoL3BGGcclWodDFs0G/3Es7HjdxUCo=;
 b=oxYpmG5Ws/8k8WvP2pFhjRZQyKoC3CxNwGdrTowY7LdsurwW15DThJuT6Y0DQJ1S5s
 Xu+XMof+9XJ0/QzCVNmIwhxrmBI3AORJODLu64agEKyCr/ukc/ZA9QWJspxISxg1I1Qt
 XJyssaGIUvyqt+hQq0W+vKMmdbQqDbyC4Gmqn4YBqMj7wi18BW0oPpup2qtutVoN/+DC
 FNXcaTwIZ3RA4gBYVCX6yrHwwSXx6+2mKuitZhQgbPAWj60neSDuDfM0XTXqXLvNMC49
 +QcltupyJTMitmenM8b9pg+ZxvKhngZ+0yeawGHSg8WRJiR4EimkM02YgFSB8nHj9bLS
 pRuw==
X-Gm-Message-State: AOAM532ZcCSsBaqaPB7tWB4Yo326LcUFq/GHayJ6ySWhrEtkHbqdcHfD
 H0SkWRT3G9AZCebL4IUAs5Vwv7CD/p4QELUOFmXUGA==
X-Google-Smtp-Source: ABdhPJyRTktloudhS4FEJQohjippofIbUD6G2axzL1w3brFImkJhKhl9UwTpCXgO94Cef378CE+W+AWSzkPuQK6S+cM=
X-Received: by 2002:a5b:7c6:0:b0:60b:a0ce:19b with SMTP id
 t6-20020a5b07c6000000b0060ba0ce019bmr2751275ybq.407.1645111523530; 
 Thu, 17 Feb 2022 07:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20220217140441.1218045-1-andrzej.hajda@intel.com>
 <20220217140441.1218045-3-andrzej.hajda@intel.com>
 <CANn89iKgzztLA3y6V+vw3RiyoScC3K=1Z1_gajj8H56wGWDw6A@mail.gmail.com>
In-Reply-To: <CANn89iKgzztLA3y6V+vw3RiyoScC3K=1Z1_gajj8H56wGWDw6A@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 17 Feb 2022 07:25:12 -0800
Message-ID: <CANn89iKsP=fO9va0pP9VrruXMKGnRhf9geGawDciTMdz3fOKhg@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/ref_tracker: compact stacktraces before printing
To: Andrzej Hajda <andrzej.hajda@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: Chris Wilson <chris.p.wilson@intel.com>, netdev <netdev@vger.kernel.org>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 17, 2022 at 7:23 AM Eric Dumazet <edumazet@google.com> wrote:


> Then, iterating the list and update the array (that you can keep
> sorted by ->stack_handle)

The 'sorted' part might be unnecessary, if all callers keep
@display_limits small enough.
