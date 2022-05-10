Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C23752150A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 14:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2D10F53B;
	Tue, 10 May 2022 12:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFED110F54D
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 12:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652185019; x=1683721019;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=JJaaWuWc8sV2e51bEleyOQg6zUB2DlPf9YjM1Nke9to=;
 b=OA1GhaYqHFPwcNkqHyp/vz55cymG5OaITuzPr2HsYsyltsGb0GBZyM1l
 AfLl4fWe3SiHd6CBBN6SPJ/8i2aiO5a/Em9TBHV8woGHflsstrj5B8+fO
 AlaTTli7lp4zVAgvicLGXa6UA113DL2RhNQwvi/eIv+p08JPncawsL7dE g=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 10 May 2022 05:16:58 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 05:16:58 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 05:16:58 -0700
Received: from [10.216.42.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Tue, 10 May
 2022 05:16:54 -0700
Message-ID: <cf3a80e3-301d-7c61-54ab-d63fd355dd48@quicinc.com>
Date: Tue, 10 May 2022 17:46:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dmabuf: ensure unique directory name for dmabuf stats
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Greg KH
 <gregkh@linuxfoundation.org>
References: <1652178212-22383-1-git-send-email-quic_charante@quicinc.com>
 <YnpF1XP1tH83uBlM@kroah.com> <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <039e1acc-8688-2e06-1b2a-1acbe813b91e@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: daniel.vetter@ffwll.ch, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tjmercier@google.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Christian for the inputs!!

On 5/10/2022 5:05 PM, Christian König wrote:
> 
>> And what's to keep the seconds field from also being the same?
> 
> Well exporting two DMA-bufs with the same ino in the same nanosecond
> should be basically impossible, but I would rather opt for using a 64bit
> atomic in that function.
> 
> This should be 100% UAPI compatible and even if we manage to create one
> buffer ever ns we need ~500years to wrap around.

I see that the inode->i_ctime->tv_sec is already defined as
64bit(time64_t tv_sec), hence used it. This way we don't need extra
static atomic_t variable just to get a unique name.

Just pasting excerpt from the reply posted to Greg about why this secs
will always be a unique: with secs field added, to get the same
inode-secs string, the uint should overflow in the same second which is
impossible.

Let me know If you still opt for atomic variable only.
