Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73E638259
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 03:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0C010E289;
	Fri, 25 Nov 2022 02:23:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE5F10E288;
 Fri, 25 Nov 2022 02:23:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hsAt/6FrYuCngndhVq+5VCfylgadPtDYh4A7RHatgCjVH8AdHr8UjwBmqJbPjBcXfkJx8suCZ7R3sPX1AAApS/g+/jfVtF6bxklJ3R+RH6KSgABNj9v86vHcgdUgxHYHmxTY22T4EOFYROCllQ3IqCj0OmtlwYOds5l4E2erl/FH0ql+ePpbXiadJSzuNHQoTqoE7Am2ASc6FnUs474fEOeeEfFc7bv/z30iYkOunJeC8h5/NNwnxdMTm4YG8273pBJIg5+7pJoD53WDaZIDcnFarE2YMkjAVmFhzhlHaA+zAjehMKfOY8NA6fNYzmfLEeLSHeAjsB/5mcwRp5e4qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WFDsSCk8BY5UV005y1a6c5Kdpr0RFnlI/AQFVJE+WxE=;
 b=j+UWprP+D7X6+CEwMlH+uGi+ICrmq5h/Qr6A8pswVxTNctuRTME0SRyVb0FQd9sOVPv8Xn219kKJ+FRLg7ty8QRCS6f/YRXXZtpC0mGEIxwaHPzwB90GKHWEXo3UTKQswn566xLNi8t6X4ezqJuj9WjJshCJroBv3EaCd0Oo8+P64f9rxWY/B3r4U7Jcxi5jI+Lgs3YDP/QLwvSHTMZOzrAXvNDt+CRFVead8ykxRumKoDDunU1MpLlIKRou2uMlEF4EKbNvrEFWjEju9k8oqtrqahV+Ns92v2xg84NvxNcwXGzlW9NRGv4I+tP8tCBRpM1tf3zutwkO25zGrTB29Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WFDsSCk8BY5UV005y1a6c5Kdpr0RFnlI/AQFVJE+WxE=;
 b=b6HRu2ed7yHI9orT9iD6ltG7ojuRod2R5TdBnqSp4n9z2oGl3iC1OKKyNtVt1H3WIyBIQpDzThgO4vJt+Lv3JANuUHHKuoGNR0KiSUqS5fe2roYjImkFIUGfqADKs4/JIRB4zFLYCesaSwErSWqIfmJ8k6ohUbmsHow/Vlj3qvY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Fri, 25 Nov
 2022 02:23:14 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::2fd1:bdaf:af05:e178%3]) with mapi id 15.20.5857.018; Fri, 25 Nov 2022
 02:23:14 +0000
Message-ID: <0a747797-9b1c-ca60-569f-76eea19a08d3@amd.com>
Date: Thu, 24 Nov 2022 21:23:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] swsmu/amdgpu_smu: Fix the wrong if-condition
Content-Language: en-CA
To: "Quan, Evan" <Evan.Quan@amd.com>, Yu Songping <yusongping@huawei.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>
References: <20221124015237.172948-1-yusongping@huawei.com>
 <DM6PR12MB261939876DAFDBA3B25DEB17E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <DM6PR12MB261939876DAFDBA3B25DEB17E40F9@DM6PR12MB2619.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR10CA0031.namprd10.prod.outlook.com
 (2603:10b6:208:120::44) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: f5f62ea9-a468-4b63-19e6-08dace8c019a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dNe7ZOK+S6ELp9pAeoDjtF1Y/mJOaGX1C3P0vfXhrHst/diYpfW0MH9JIdRh0PpP1c01gSSa08ufcmQLmU0Eg1NJOkDZJ2REgDp6PhBPP93alUnFD5T/TOkHSiJOCe6aP+V3jOtrzs3VtuziopDBXl9T+BrOkUKsGBJSSDbhzrejSK6Xf83jTH3a0NK1T+70BTfnmPLXsSpXbq4rMpTOQKQZNmnM/hiVdWR8MwKOwrzrH6fTdzTKuPl6sf8bNMBTqVLynXPX1t3hiXFlxa1zsK6farZ32dRvSKrHjggeDbdAY+97OaSE13GCJVlgstlaw6zUhB4dq0lC5bMrtqnwTJ3JwBMv3GMm0QZAQR0ExjgJcvTOHn++vkZAird6k8V0Gj9OJ/qz+yKK8E3MTnz7qhfKFfz+K7IDmHo7X5dyLHxftVFkXUfSUuHuAvakwWrMHctWBRBdIibqOPJcSy8GEnc8wqNsBypbs56H5BNeosP8fijY1WivRgFO7TuH8iaV41flaSja24A9rkodvFc5oV/O8zdabIP3MyvXvFMFTgAEVpw6Ogu1mR0RrDifryOsX9LMgAv4ONCdLiKQKTCGVBcpBxs4rPyPwoKyMpH6E8Cna7CTQqJFVs/dCwCRIr2oPjYC7L9msPNRBcNwb5NZDrW1IXM62DL2i0thmsLhCp1cV0qbKZkTX/+o5iZH6nru6dH5CB64AE87liv5P8e9Vm/6eCnlb8a5YcWMEptXitQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199015)(478600001)(6486002)(6506007)(53546011)(186003)(4001150100001)(110136005)(26005)(6666004)(36756003)(2906002)(6512007)(38100700002)(31696002)(86362001)(83380400001)(2616005)(8936002)(41300700001)(44832011)(66946007)(66556008)(66476007)(8676002)(31686004)(4326008)(5660300002)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlBjaUpFVCtwTmQvL1ljQlVNU1cvVncvT2o5WElmZEM0VUdCR1MrZ3ZGYVcx?=
 =?utf-8?B?VlJqekZiZXlzek9XTnlQZCtGWjZJa2RpR2U1NndZeFREU2VjaXBLSlZ3Rkk4?=
 =?utf-8?B?czh0Z2JkMnBEQVRQeW41a1EyVDlYVUpzenRaN2tXc1RHbkV3NC8yWjJpbkd6?=
 =?utf-8?B?RHVucXByeFZaM2crQlFOVmlleGJHOUVYQWt2UStTSWttVHI2S2NQY2x0RnNL?=
 =?utf-8?B?dFh3UGRyc0dqS1BaV0lHam15MkFYMnd0Tk53Zmw5NWZjb29wZXlQeHltSkh5?=
 =?utf-8?B?bG9VeXNFNkM2MzRyZDQ2TEtkVzJxQm9tMzNZcnRyYUo4bW5oWXV6a05QbHln?=
 =?utf-8?B?UTA1UXVhQ1dDM3kvMmplU0oxcmZWOXlhZGpYSFJnZ0IyM3pWbndrSHE0YU1E?=
 =?utf-8?B?bWxVOStzdkVpUEx5Y25MZkdENWR0L3hFQ09ZZ3BZWDFNMHUreFcwcG55NHJI?=
 =?utf-8?B?RkN1cXQrQ01hZ0RlNlRmeGhpWHhnNjl4cGpuQ09SRlFKa25YSTI0RXYrU1d2?=
 =?utf-8?B?QUVLZWh1VHFmY1k0eFNKOC9JUk94RkN1M0l2YWVrTDdOMzNYRHpvV0JvWHZR?=
 =?utf-8?B?YnltbEVuZ25SdGYzNzlNUFppb0hGdHRURm85Mml1SENYaGUrdEhsZm1SdXVs?=
 =?utf-8?B?azZlVy92aXNTWE5peTlsc1RPRS9BYzdkdHJMZWtvZTY0NnZVUG1vcjRmK3RB?=
 =?utf-8?B?QTVGRHhEdWFCdUFJdkRUbDV0bXlPcTdNTXhmeXVTWFZZSGhjV2xPazRCZFF0?=
 =?utf-8?B?S3g1VVIrMjdKYVg2UHFwemlUUkI5dDFqQ0Z0bVlyZWRMaDhZb0lCbzdtRzFV?=
 =?utf-8?B?MTZkZHNCaTZkQVZpRHBQQnlSNFF2dXFmVnZYT2VKckFtbGdKVFZpVWJTSXUr?=
 =?utf-8?B?VVhtNEIwbk1BMnlGZThKNlJucUhaUmdOcmlUVlByUGlBNEdLY1VBRXp4VEZi?=
 =?utf-8?B?ckZHWk16M2JUVjRCZWpZM0Q5RkoxcGk0Mis2eHg2ZEdmS2NEUEdESFJjR2pF?=
 =?utf-8?B?Q0h3OGE0UEk2TTJDd1FvOTFST3VDdHRHVDR5UTJIdGhaTnNhOGdsOTZudmpM?=
 =?utf-8?B?K08yN294aC9pRFFvMEJCdHJJMTRhZVUwYXJzVHFGKzJhQ3FkMkxzRlRKd0li?=
 =?utf-8?B?Nk0zK3VWNTNJVGRKeUl0ZCtCTWlodC9YZEI4ZE9mZmMrUlZ1MU1VSUpIcFh2?=
 =?utf-8?B?bUhlSXpEc3I4TWRRWEpHa0JGUzlGR2pETFB1UVhqb2tQWVE1QnhKU2ZldGRx?=
 =?utf-8?B?anVDNkZ3UGw4RFd3aTJJQmJNbG9vczkyaWhrWTdMcHBVNXlpYnZ6RjF1S0xl?=
 =?utf-8?B?a2xiaTNkNklDaVlpc0Q3aCtqNGpVUEc0M1J1b0lXV1ZjaU94UTU1aXpkUjhV?=
 =?utf-8?B?NUNDNkVKVE5EZEFkRE1vWUgraEF5S1QvTE5XTG5WUXBOYXFMeXE0bzNCazlU?=
 =?utf-8?B?UjJtYWRMbldzN01qZUdkNEgwYVBRNGZGc2FyNHNneHV6aDFJQU9qTTBpVWZ4?=
 =?utf-8?B?bC9jVHllbzdESWFuZEZjMGNOUHV2bU1CTGdITlJlVDVTaHF2ZGwwZ1BJT096?=
 =?utf-8?B?aGI5STdJVk5RQjFYUi81ODdKbllHL29EUVJKaEhHOW50V0R4dW1GdEJKV1pG?=
 =?utf-8?B?RGcySHdZMy93N3hMaDhTRm9DWDNnMDV5N3lGU1hCbTAvcEhCQ3ROalVKME1z?=
 =?utf-8?B?RmdzbHBmUU42UXhqUEdCMVY1YitFajJleHc5a2JoR3FzQVZiTUJBY3lyc3Rn?=
 =?utf-8?B?aHkrUVZGWWQveE5BZ2dWVTR1VC94MlAwempoekMyeGdpWGlFREk4bDhtUkNj?=
 =?utf-8?B?RC8ySjU4QlpjWk0xbk13RytsS0d3MW0rUkZUK1R2UUk1TS9MdGgzcE5HaE56?=
 =?utf-8?B?ZDgrWmR3UHRsWXhNcGxSTXVaaHk1aDdXV1kvODZrSko5RTNZUEtuRW1KRzZJ?=
 =?utf-8?B?MWxpQWhTSjN3eG5QZFhCcmRKMmMyQXJ4bkZEcUllbUZNWlVHay9WTE5RQkhX?=
 =?utf-8?B?RnNxRjNpd1VOa29pYVQwc1pWSWI4MUc3T1crZER0NTV0Z05JR04vTDdpNndk?=
 =?utf-8?B?NWEvc3p1dlZXMjNyTFY1QjZPaTk2ODNaWFRSNFpxVWlIaG9ha2hkVWh0YXJw?=
 =?utf-8?Q?i8T/60xTIW5lbZTt1yNChBTrb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5f62ea9-a468-4b63-19e6-08dace8c019a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 02:23:14.6465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjZyePlWopLAIpSbth4uzRU4Tjb9IPoR2iv3KN55Sym5L3d6UjZA+2P5VN1v9yi4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied!

Thanks,
Luben

On 2022-11-24 05:10, Quan, Evan wrote:
> [AMD Official Use Only - General]
> 
> Reviewed-by: Evan Quan <evan.quan@amd.com>
> 
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Yu
>> Songping
>> Sent: Thursday, November 24, 2022 9:53 AM
>> To: airlied@gmail.com; daniel@ffwll.ch
>> Cc: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org; linux-
>> kernel@vger.kernel.org
>> Subject: [PATCH] swsmu/amdgpu_smu: Fix the wrong if-condition
>>
>> The logical operator '&&' will make
>> smu->ppt_funcs->set_gfx_power_up_by_imu segment fault when
>> ppt_funcs is
>> smu->NULL.
>>
>> Signed-off-by: Yu Songping <yusongping@huawei.com>
>> ---
>>  drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> index b880f4d7d67e..1cb728b0b7ee 100644
>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
>> @@ -161,7 +161,7 @@ int smu_get_dpm_freq_range(struct smu_context
>> *smu,
>>
>>  int smu_set_gfx_power_up_by_imu(struct smu_context *smu)  {
>> -     if (!smu->ppt_funcs && !smu->ppt_funcs-
>>> set_gfx_power_up_by_imu)
>> +     if (!smu->ppt_funcs || !smu->ppt_funcs-
>>> set_gfx_power_up_by_imu)
>>               return -EOPNOTSUPP;
>>
>>       return smu->ppt_funcs->set_gfx_power_up_by_imu(smu);
>> --
>> 2.17.1

