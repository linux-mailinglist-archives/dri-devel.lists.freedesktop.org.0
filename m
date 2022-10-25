Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A000760D5C8
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 22:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EF7C10E367;
	Tue, 25 Oct 2022 20:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458FC10E35D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 20:40:59 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29PKQ10Y029683;
 Tue, 25 Oct 2022 20:39:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=hV83H0gJRcc8UZy3c8PWl533yLTOQjwK6DRSijPfsq8=;
 b=HqWQR95ByLtUfxaC3vuYOKz0fvAdBpyPxQ9qyN+cAT9glJVHiE4PAcoVmcWmfedS+h9K
 ORZaZNoQWp28O+LnZoAO6lFB08b/jja2bYfEdPC4fam7mbWWSIR9C7qMOJ951ptJCe29
 bevrUyzaLJ9gvSpzyzt2j6WESGlvgrz2G9OpXzIHT886PtsH7Ijwt3Vgag6AYZ7u4EJ1
 I0rHaUt/5V2Ip4BQ366Q30zML24PrqlYyu9c27ud4z6QkUiOmp5IDJkdeIHSE8K+wSGV
 sE8+UHJB5ERs+LjDeLqMA1G8CHBveMPSd+nX7FrhADuySuI4B/o2zfkySVVRMYHHc7lg bA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kedfr23ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:39:53 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 29PKdqMo002027
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 Oct 2022 20:39:52 GMT
Received: from [10.111.168.19] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 25 Oct
 2022 13:39:50 -0700
Message-ID: <956de566-d60a-f257-edff-85a2eac06d99@quicinc.com>
Date: Tue, 25 Oct 2022 13:39:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/edid: Dump the EDID when drm_edid_get_panel_id() has
 an error
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>
References: <20221021130637.1.I8c2de0954a4e54e0c59a72938268e2ead91daa98@changeid>
 <e6bc800b-2d3b-aac9-c1cb-7c08d618fc8e@quicinc.com>
 <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <CAD=FV=V4m5HNavewSTkrh64_BzLAkivR2mRkTQdaxA8k9JKQbA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: GDB1INBuMLB06v35DYLSfO7gmGdo3Rri
X-Proofpoint-GUID: GDB1INBuMLB06v35DYLSfO7gmGdo3Rri
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-25_13,2022-10-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=830 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210250115
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug

On 10/24/2022 1:28 PM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Oct 21, 2022 at 2:18 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>>
>> Hi Doug
>>
>> On 10/21/2022 1:07 PM, Douglas Anderson wrote:
>>> If we fail to get a valid panel ID in drm_edid_get_panel_id() we'd
>>> like to see the EDID that was read so we have a chance of
>>> understanding what's wrong. There's already a function for that, so
>>> let's call it in the error case.
>>>
>>> NOTE: edid_block_read() has a retry loop in it, so actually we'll only
>>> print the block read back from the final attempt. This still seems
>>> better than nothing.
>>>
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>
>> Instead of checkinf for edid_block_status_valid() on the base_block, do
>> you want to use drm_edid_block_valid() instead?
>>
>> That way you get the edid_block_dump() for free if it was invalid.
> 
> I can... ...but it feels a bit awkward and maybe not quite how the
> functions were intended to work together?
> 
> One thing I notice is that if I call drm_edid_block_valid() I'm doing
> a bunch of duplicate work that already happened in edid_block_read(),
> which already calls edid_block_check() and handles fixing headers. I
> guess also if I call drm_edid_block_valid() then I should ignore the
> "status" return value of edid_block_read() because we don't need to
> pass it anywhere (because the work is re-done in
> drm_edid_block_valid()).
> 
> So I guess I'm happy to do a v2 like that if everyone likes it better,
> but to me it feels a little weird.
> 
> -Doug

Alright, agreed. There is some duplication of code happening if we use 
drm_edid_block_valid(). I had suggested that because it has inherent 
support for dumping the bad EDID.

In that case, this change LGTM, because in principle you are doing the 
same thing as _drm_do_get_edid() (with the only difference being here we 
read only the base block as opposed to the full EDID there).

Hence,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

