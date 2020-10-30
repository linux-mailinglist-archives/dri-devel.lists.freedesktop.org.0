Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7650B29FF4C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 09:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C566E6E964;
	Fri, 30 Oct 2020 08:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2081.outbound.protection.outlook.com [40.107.223.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552ED6E964;
 Fri, 30 Oct 2020 08:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpRoeGHBrLn4ObkrXe2tMuy5uNJ9tuUasLB5YXLy2Uoz6v1J0lYSzGFPtGDlvmg/MWkiKNW+Kb99gZ9lo0jCd0SMOZfBLGtSAooXBqbu6V0Q3LAb36MoNdK9iz0exDQJhntSpo5Z/ycbcpzauJgYmKiRfOI/ybW5fAXCFGV/nv1oH7pjYAFp/6m+rF3z3mMyGnPOAeB1GIFaE8J5Ro1X10lC68U9MwUQlkoqdTL/+YYSsC3dgqIeGPt+U/Oj6Wtq8ffob0WUVb9gK2jEPzy7E4rtVMMmBJtPFL+9CTOdNaOHfBDuu3dMwQiSs8z/EPtL/DXqyo4xx6HHRgbcbxNjmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R50FfW+0YisEFwHW7BnxV3bANK9rDM+i+0z2VN/b5xU=;
 b=BxeiB13zTVsT0pTsUbkz13NCua8y2FlcaS2SsACC8RdSobePoDyfSewb2BiNX5lk2aI5hwkVLaCHpaeNdF/+I6nWKjIXXqUOlBQEkNEEgyQ2v4j9QXK7+FUM+AZTDOyxj7leTvxxENQU1YG3ZKiBUf0mid/6UfIAKceRZtF2eONvH+0IKpgK+NhUvVhr/DeX+C+mXJxHMBTTTkVjDkabyY3MxoTDJcIOM5WqD22AI7/dY1a/B3Ub4/6XOBWrrmO8NGIO1Q3AuGIfbe2lpU6xJVyIj+0ccFKQJMhTCxLcYm8NaE7VKzHqkgDtVKNCRwmU22HCimT1WRNFDOUnPO3ziA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R50FfW+0YisEFwHW7BnxV3bANK9rDM+i+0z2VN/b5xU=;
 b=ZN0/lyWrJR81Iv3ydGoyk8UQ68khAGtwy57Wgzhe7kMa6sRfQAFhtQi63uhlrv7IS16Vh3tUiY/wPfjwMAV743QrApFyznd0FnVu6d+gEDVO5U1RYlFWaSSsoLW1u/FySHCk9GraqaKDlzPLRrd8YloSqEoHyyMKETS6HmKNWKw=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB3764.namprd12.prod.outlook.com (2603:10b6:a03:1ac::17)
 by BYAPR12MB3431.namprd12.prod.outlook.com (2603:10b6:a03:da::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Fri, 30 Oct
 2020 08:00:14 +0000
Received: from BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::21a4:4ed1:c6bb:5437]) by BY5PR12MB3764.namprd12.prod.outlook.com
 ([fe80::21a4:4ed1:c6bb:5437%5]) with mapi id 15.20.3499.027; Fri, 30 Oct 2020
 08:00:13 +0000
Subject: Re: [Outreachy kernel] [PATCH] drm/amdgpu: use
 DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
To: Deepak R Varma <mh12gx2825@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
References: <20201030032245.GA274478@my--box>
 <20201030071120.GA1493629@kroah.com> <20201030075716.GA6976@my--box>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <5a7d8e8d-8db5-ff56-6448-3f1cefc11ef8@amd.com>
Date: Fri, 30 Oct 2020 09:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201030075716.GA6976@my--box>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To BY5PR12MB3764.namprd12.prod.outlook.com
 (2603:10b6:a03:1ac::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.8 via Frontend Transport; Fri, 30 Oct 2020 08:00:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb609e36-384c-486a-68d8-08d87ca9d4af
X-MS-TrafficTypeDiagnostic: BYAPR12MB3431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR12MB34317CCE5EA4818C074F924B83150@BYAPR12MB3431.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NItOQ8x5uK3f/ZiYgkh8vccMDDR2KOp9V9iVscHV8SC+6hgKvIQu2WuKhhEMuKqNyCm84wwsQuM/5p4BF11UjR3xv19MsxhRN0+NXwPLytLHqD7CSGBnhH70rrqyZ+hIyamREmFM2goXI58tA63Yc1zuolG9SK8c1fq9Iz/9KGiPMXmMHKmN21LDD3SFWKyviSkOsAZ+1soGnFAQUv1N8cKtIu4uwCCF4EEQaHqMwpCs9Nm2CtTRbo+MJs9QeBllJg2/2+tJ8+I1tLuYwnByn59VtvIOeMM85hQQ1JMdD+u/N8v/3YVfKChU2X78FJDUUIVH1KFKB4q72MdnGnWBxSMB6IuANNhxq8W0v/sjdZrsNoM4dalrNr3v8LV2wayI2pezvywFS1swpXp3O/1H35dkRiKV1L6LidV6XmgQZvUrxLIz3ZMVZPxqnK6wpKV1kMEKASUURi7d8NpVrTLD0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB3764.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(366004)(396003)(66946007)(66556008)(966005)(5660300002)(36756003)(52116002)(4326008)(316002)(86362001)(83380400001)(7416002)(54906003)(110136005)(66476007)(6486002)(8676002)(16526019)(2616005)(6666004)(478600001)(31686004)(31696002)(186003)(45080400002)(8936002)(2906002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: Ty/hQ5oBKxL5iR5EiOmjONC8IrrPFer9HDkRBgAmeaxI+mWAk5gpGzd33tA+xvSyzTZeyH+1dhaU0VYidtiY9yIGuXCwz5wFDfKyP3svo4W3OaybKOwDAmsvXn4bQGtahoTKI7cIZ+J8BnMy23It4l88vnHd/sAzj2GS97WEEE9lQBTfOU4uSSUZuEB97/e9W2nKYNdjiXVNdW75tpUavQYbwm+aCIDJAABUQ4KpVXDKxHaVHIUBC9ypV+vIrHCYUutqordXKoKeVcEAW6+g8c9zvHlfK09dwsMaiJtmra9gYDJFGzbbMz+bfu28zXYGtx4NYayBO3RjxRSU3I3KB8TbWvOHXx2BpAXDoP5bgexgwwpEaY48JBY02qMppX+cSzzCZjkWpvQW1FPxiYipQOOiwYSXOXPIPkVfMDSLhHDEJ6/lSbLjV3Pac7pFvCU9QpGDhcnThtymh4jKLnDc33dr6UA6vGO0CQG4wLj32I6nMi4dUAd/XLOEay1u5gs5NFHLVOzJDwXrQBAHwuR0Tfs+peApzsfx66l4VZpd7sa6CSWPyvFDqorjM+GDOBFlPCeStjHRRdvBcStIS2ONhudRFyn5IVnZ5iOakiEW7Tc9ETpATGpzikRWZ+PWfkzHmWUhXrE6X/At2mM0NiXGq90o9oGfQjUu4Vwlu1rdB5QLtEce1FNqQjwUQNBUUK3pkX2SwrCpqB9yyBAEG5I+ew==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb609e36-384c-486a-68d8-08d87ca9d4af
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3764.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 08:00:13.6055 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VOHYJ1KCxZDCQNpaVYWZ+qQtCUUjQ88s9/KTk7gKxqCA8zvGJ/ybu/4h65F6OWSF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3431
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
Cc: David Airlie <airlied@linux.ie>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 melissa.srw@gmail.com, outreachy-kernel@googlegroups.com,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.10.20 um 08:57 schrieb Deepak R Varma:
> On Fri, Oct 30, 2020 at 08:11:20AM +0100, Greg KH wrote:
>> On Fri, Oct 30, 2020 at 08:52:45AM +0530, Deepak R Varma wrote:
>>> Using DEFINE_DEBUGFS_ATTRIBUTE macro with debugfs_create_file_unsafe()
>>> function in place of the debugfs_create_file() function will make the
>>> file operation struct "reset" aware of the file's lifetime. Additional
>>> details here: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.archive.carbon60.com%2Flinux%2Fkernel%2F2369498&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cddd7a6ac8164415a639708d87ca97004%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637396414464384011%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=o6GOHvMxNMuOPlC4nhDyURCHBLqfQZhYQq%2BiIMt3D3s%3D&amp;reserved=0
>>>
>>> Issue reported by Coccinelle script:
>>> scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
>>>
>>> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
>>> ---
>>> Please Note: This is a Outreachy project task patch.
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 20 ++++++++++----------
>>>   1 file changed, 10 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> index 2d125b8b15ee..f076b1ba7319 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
>>> @@ -1551,29 +1551,29 @@ static int amdgpu_debugfs_sclk_set(void *data, u64 val)
>>>   	return 0;
>>>   }
>>>   
>>> -DEFINE_SIMPLE_ATTRIBUTE(fops_ib_preempt, NULL,
>>> -			amdgpu_debugfs_ib_preempt, "%llu\n");
>>> +DEFINE_DEBUGFS_ATTRIBUTE(fops_ib_preempt, NULL,
>>> +			 amdgpu_debugfs_ib_preempt, "%llu\n");
>> Are you sure this is ok?  Do these devices need this additional
>> "protection"?  Do they have the problem that these macros were written
>> for?
>>
>> Same for the other patches you just submitted here, I think you need to
>> somehow "prove" that these changes are necessary, checkpatch isn't able
>> to determine this all the time.
> Hi Greg,
> Based on my understanding, the current function debugfs_create_file()
> adds an overhead of lifetime managing proxy for such fop structs. This
> should be applicable to these set of drivers as well. Hence I think this
> change will be useful.

Well since this is only created once per device instance I don't really 
care about this little overhead.

But what exactly is debugfs doing or not doing here?

Regards,
Christian.

>
> I will wait for comments from other experts for driver specific
> consideration / behavior.
>
> Thanks,
> drv
>
>
>> thanks,
>>
>> greg k-h

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
