Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C94520E17
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A4E10EF43;
	Tue, 10 May 2022 06:48:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5299510E03F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 02:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1652150625; x=1683686625;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=InTny3n7yeTKHBypR3lvOVYf18pf04hsVskSXrNlYf0=;
 b=ON71lEWx7mghutuiVCTO5SsDDB/l6tbsql9bWuy1VHk2vzzOsGMfOClN
 6QbS9ZXprcm+EQcHfXT5RkeCJDrWfQ1eVf+D7LLv4kE4XQ3kejZwuFNQr
 fqisUfDD8pMnm5su6naUPObVKq+t5/MBpFz+BLgHa5xjI+jHukw1RMNTd 4=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 09 May 2022 19:43:41 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 19:43:41 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 19:43:41 -0700
Received: from [10.216.42.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Mon, 9 May 2022
 19:43:37 -0700
Message-ID: <51bc6d33-c5f5-2a6e-fd83-ffebbe2e0202@quicinc.com>
Date: Tue, 10 May 2022 08:13:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dma-buf: call dma_buf_stats_setup after dmabuf is in
 valid list
Content-Language: en-US
To: "T.J. Mercier" <tjmercier@google.com>
References: <1652125797-2043-1-git-send-email-quic_charante@quicinc.com>
 <CABdmKX2V55tA-Or6Dd+bpbcv3fDHps_+zHHJQwhz819LX_2RSQ@mail.gmail.com>
From: Charan Teja Kalla <quic_charante@quicinc.com>
In-Reply-To: <CABdmKX2V55tA-Or6Dd+bpbcv3fDHps_+zHHJQwhz819LX_2RSQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Mailman-Approved-At: Tue, 10 May 2022 06:48:43 +0000
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
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hridya Valsaraju <hridya@google.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Mercier,

On 5/10/2022 3:19 AM, T.J. Mercier wrote:
> On Mon, May 9, 2022 at 12:50 PM Charan Teja Kalla
> <quic_charante@quicinc.com> wrote:
>> From: Charan Teja Reddy <quic_charante@quicinc.com>
>>
>> When dma_buf_stats_setup() fails, it closes the dmabuf file which
>> results into the calling of dma_buf_file_release() where it does
>> list_del(&dmabuf->list_node) with out first adding it to the proper
>> list. This is resulting into panic in the below path:
>> __list_del_entry_valid+0x38/0xac
>> dma_buf_file_release+0x74/0x158
>> __fput+0xf4/0x428
>> ____fput+0x14/0x24
>> task_work_run+0x178/0x24c
>> do_notify_resume+0x194/0x264
>> work_pending+0xc/0x5f0
>>
>> Fix it by moving the dma_buf_stats_setup() after dmabuf is added to the
>> list.
>>
>> Fixes: bdb8d06dfefd ("dmabuf: Add the capability to expose DMA-BUF stats in sysfs")
>> Signed-off-by: Charan Teja Reddy <quic_charante@quicinc.com>
> Tested-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: T.J. Mercier <tjmercier@google.com>
> 

Thanks for the Ack. Also Realized that it should have:
Cc: <stable@vger.kernel.org> # 5.15.x+
