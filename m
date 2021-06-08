Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D4D39EF6C
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 09:21:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D94256EAC9;
	Tue,  8 Jun 2021 07:21:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AF16EAC9
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 07:21:12 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id y7so15696427wrh.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Jun 2021 00:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=j8/FqmwmZsIfZyWybnVj5Yc1MfEwokfXxYSVN7v+DbM=;
 b=s3e0utVZ7TGbyoFjacBjTAHT3MoKBAmPhH36Pq4r6bvZK0ZTpEt1VRPPwjMoHb5DL+
 IK3WUja+0XDh8MHzo67wD9CqCo68do0K4M7/lS0+udULfjF93WVBnctXv9p6oPQx/kW6
 8X3T2/g+4q2LuTcYY154pdFB9XInRthkBk3bwF7GL3VOOiNhGp/zPEsyT3v0abplnkRa
 ODxbyX96cMTE4BzNtpuwZPpMxBBBNgKr6IdSD1A9++C/2TxvU0QMJ2kEFQce8PG/Ps8V
 uU7K2VTbPcTt/3nLEjJR3zhQ4ZFExQ79Hen5b8zl9fnLKyRqFwsqiiayaXW0qDePkFLP
 aYKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=j8/FqmwmZsIfZyWybnVj5Yc1MfEwokfXxYSVN7v+DbM=;
 b=IFx6veGM39IRgDl686hPN2v3mazfp7bXLtaRm+rbRD+EDXKBV+xarBnLifXWM8gNON
 oQ1JLjS0pUhL368LzcotxTbI+wJECzgLfP6GrYlYea80qCB7IVFR1We9XiupqqcrIfgu
 OkDwA+Az9adFHOpoGJbQ0xvn9t6Fk2080dgWVJ2eqa/1ljyXLE+j2ZjCH3Hqq8/9fCp6
 5gcEh9zsgmeW+fCdIiRQpenGldacwIZPCTej8nFw/0hTn/c6pMQobPuLe3i0apyX6lPT
 oAiQw7zkiwvFRGHSnmOK/RfZWP5cKfV9Mi5/U4xpevorx+twYCboOowFksgB81Ed6LsI
 5bwg==
X-Gm-Message-State: AOAM532LCb7Z0mXmHpIhUK8ZWFYwIh+r3w3kCVyZbcmI6krgKVbjaSAr
 dS39hs/fJssupeSb0oUU1iFs6+LrRoU=
X-Google-Smtp-Source: ABdhPJxOFfPqA+Ha0I3p1SqQxDdLwBWHPBHf3P92U5E2gV+VTMVQ+FZdE5cbsLH1j9rnmg7QnlwdjQ==
X-Received: by 2002:a5d:6109:: with SMTP id v9mr21155749wrt.0.1623136871685;
 Tue, 08 Jun 2021 00:21:11 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:197a:8536:afbe:3762?
 ([2a02:908:1252:fb60:197a:8536:afbe:3762])
 by smtp.gmail.com with ESMTPSA id l2sm18325721wrp.21.2021.06.08.00.21.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 00:21:11 -0700 (PDT)
Subject: Re: [PATCH 01/10] drm/ttm: allocate resource object instead of
 embedding it v2
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@amd.com>
References: <20210602100914.46246-1-christian.koenig@amd.com>
 <e5e6f3d0-af80-fa59-ba55-bafbb8e7670a@shipmail.org>
 <abe421ae-e09c-101a-5bfb-9a0de40a0e03@shipmail.org>
 <78dbb6a2-99f3-2362-8d74-6489e78df21a@gmail.com>
 <94009311-6161-19ae-d846-59fb396a69b6@shipmail.org>
 <6d316dfe-0378-8284-1f8e-29caf5619e34@gmail.com>
 <a08db95b-7c75-d998-7443-73d809121e47@shipmail.org>
 <aa1d9fea-d425-608d-6696-96e437acd08c@gmail.com>
 <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <adb183d0-fdcb-5b78-a814-76683b6200ff@gmail.com>
Date: Tue, 8 Jun 2021 09:21:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <59e3ccb8-5c6a-e44b-41d7-9d15dc3c63f5@shipmail.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.06.21 um 09:17 schrieb Thomas Hellström (Intel):
> [SNIP]
>> Do you have the log to double check?
>
> Unfortunately not, but IIRC it was directly from vmw_move().

Nirmoy do you still have your vmwgfx test environment?

Thanks,
Christian.

>
> /Thomas
>
>

