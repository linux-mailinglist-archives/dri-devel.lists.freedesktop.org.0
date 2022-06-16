Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E611854DA7B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 08:23:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E00112BCD;
	Thu, 16 Jun 2022 06:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967F2112798;
 Thu, 16 Jun 2022 06:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655360592; x=1686896592;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=E4Yu97ZpKZVGsZyEumih7vJ5tm4aBVi17DDQTi2gTEE=;
 b=w5BNNIf9s3I+qbkSWO/SFbPNcVKAfXLfK7xJ5fNHJO1FOdhUiZ3fBRdy
 M7MbtD8XZykJI5+BzuqMHvgPd5lDaFaBJeC3T3mvv18G5BWNRVLXl6mOS
 vpENzdDC7ISuBJATSeVrjGuBBbvAwK9sDwB/BInVqj3gMio8GK12Cr7us w=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
 by alexa-out.qualcomm.com with ESMTP; 15 Jun 2022 23:23:12 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2022 23:23:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 15 Jun 2022 23:23:11 -0700
Received: from [10.111.175.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 15 Jun
 2022 23:23:08 -0700
Message-ID: <62ac9e74-70d0-cbfc-fed4-18b8a30dc877@quicinc.com>
Date: Wed, 15 Jun 2022 23:23:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: move intf and wb assignment
 to dpu_encoder_setup_display()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Stephen Boyd
 <swboyd@chromium.org>
References: <1655235140-16424-1-git-send-email-quic_abhinavk@quicinc.com>
 <82b09d4d-1985-519e-3657-0d15e07ccc2f@linaro.org>
 <5b35ee5a-ed94-1440-cdc2-909a82c3aa61@quicinc.com>
 <CAE-0n50gNX6XP2O9FJVJB135YUGhi5e8Gqb1FAxj20YQSvumuQ@mail.gmail.com>
 <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAA8EJpq1Td71FwBP5saYTAnS5zK28om+2C79aMPii06ui2JR+w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dri-devel@lists.freedesktop.org, seanpaul@chromium.org,
 quic_jesszhan@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/15/2022 11:21 PM, Dmitry Baryshkov wrote:
> On Thu, 16 Jun 2022 at 09:18, Stephen Boyd <swboyd@chromium.org> wrote:
>>
>> Quoting Abhinav Kumar (2022-06-15 22:59:25)
>>> Hi Dmitry
>>>
>>> On 6/15/2022 10:55 PM, Dmitry Baryshkov wrote:
>>>> On 14/06/2022 22:32, Abhinav Kumar wrote:
>>>>> intf and wb resources are not dependent on the rm global
>>>>> state so need not be allocated during dpu_encoder_virt_atomic_mode_set().
>>>>>
>>>>> Move the allocation of intf and wb resources to
>>>>> dpu_encoder_setup_display()
>>>>> so that we can utilize the hw caps even during atomic_check() phase.
>>>>>
>>>>> Since dpu_encoder_setup_display() already has protection against
>>>>> setting invalid intf_idx and wb_idx, these checks can now
>>>>> be dropped as well.
>>>>>
>>>>> Fixes: e02a559a720f ("make changes to dpu_encoder to support virtual
>>>>> encoder")
>>>>
>>>> Please adjust the Fixes tags in all three commits. I didn't notice this
>>>> beforehand and Stephen has complained.
>>
>> I think Stephen is Stephen Rothwell.
> 
> Ugh, yes. Please excuse me. My brain didn't kick in to notice the name
> aliasing issue.
> 
>>> Is something wrong with the tag? Format and hash looked right to me.
>>
>>          $ git config pretty.fixes
>>          Fixes: %h ("%s")
>>          $ git help fixes
>>          'fixes' is aliased to 'show -s --pretty=fixes'
>>          $ git fixes e02a559a720f
>>          Fixes: e02a559a720f ("drm/msm/dpu: make changes to dpu_encoder to
>> support virtual encoder")
>>
>> it's missing the drm/msm/dpu prefix.
> 
> I have more or less the same setup using a longer format and using the
> git-log instead of git-show. This way I can just do a git fixes
> drivers/gpu/drm/msm and spot the commit in question.
> 
> [pretty]
>          fixes = %C(auto)commit %H%Creset%nFixes: %h (\"%s\")%nAuthor:
> %aN <%aE>%nDate: %aD%nComitter-Date: %cD%n%n%w(0,4,4)%b

Thank you Stephen and Dmitry.

That was a silly mistake to miss the prefix. Will fix it.
> 
