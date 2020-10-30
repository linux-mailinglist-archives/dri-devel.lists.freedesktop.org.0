Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16D2A0C0D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 18:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4AB89BD4;
	Fri, 30 Oct 2020 17:04:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508BF898E8;
 Fri, 30 Oct 2020 17:04:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N14862VLRyBSJUCCQWJ3gJGkb5/OW21v7VHdOa41yzbJBQFb49NNRo4nC7Kkeh3LQ6gxN4bx2NRYq4wUG1L7VZYDa6VvYLi7mm4c1Gy0y/Cai8AoZxJDC2CfE1TAXXa6PzJ2li7VNzVtp+Ky3MZx+VFLrj1P3cS8Q2Ch4wlGbdIqTyzX6nuFulL1HsrJfRbZ/oVLfPFosYMszRjD7Rfm4zVYGuYHgwNBo+TyoYOLQ1qMUDv03qJAJdyKIuMqa9dlUFjfb8uJnOxtPVQZzuTDt2OhmdsAMoaxfFaJ04eMt/SdfMEqGM1oflMD5YHpe23TRqcKm2YcWstMu9w6JJKAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQv1YW498dEsjxT4dujAo0LMiELdCjYJdT1OCPb/kZc=;
 b=f6VfeEerdb/tPgyNzhBiyrQvKIkgiOcsPXXDLhrtPSLg2u4KVyJ4CKABPHOmZrrlIdDg3VBwYrLvL77d+1p+Puf8GKGuK9tnanexWWx2ewWfT0SZAgPS9XSY6Zl+z6O6m8CHISn+ox92uh3hxD0SWDfX49tGXXQImmCwQEBLWYy8K0xOgwCuqCHFUt7PMXZ0TeG4u7uN6EGQBfr/h/lg68ZoTaBFKMisUZwj4fsyQA0MAp8HgGde09SNa/fU5yMGWVZAC/nkmXWk8U7TnFwgYl/MFQc4cmOEC+nj79WndBZEEwrLgPUXxlVEE4XAPdUyI0uFaDW+/pd3cFni+q4KYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQv1YW498dEsjxT4dujAo0LMiELdCjYJdT1OCPb/kZc=;
 b=UEkSESTKckZTveFOep4lCKf7AMcBN+xHTPj2ccS2KTJ7FzkTyJ9LJLlalBWxt4Cv319rpNQTK0DQc2YEqfMTMs5lD1DwmjExeL0HJoOAjEQ+O1tGeP9j+BxgUyisxLQ+wz2CiSg2L+4dh0+nJuazSWLEdnz2oC7DL5cFCd6tDVI=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11)
 by MWHPR1201MB0144.namprd12.prod.outlook.com (2603:10b6:301:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.19; Fri, 30 Oct
 2020 17:04:15 +0000
Received: from MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::e8c1:7ef6:c905:247d]) by MW3PR12MB4379.namprd12.prod.outlook.com
 ([fe80::e8c1:7ef6:c905:247d%8]) with mapi id 15.20.3499.019; Fri, 30 Oct 2020
 17:04:14 +0000
Subject: Re: [PATCH 4/5] drm/amdgpu: fix build_coefficients() argument
To: Alex Deucher <alexdeucher@gmail.com>, Arnd Bergmann <arnd@kernel.org>
References: <20201026210039.3884312-1-arnd@kernel.org>
 <20201026210039.3884312-4-arnd@kernel.org>
 <CADnq5_MdJt02hpdTsvPDVwN4_1D7-1ybDexDreL6GjDipc_Yvw@mail.gmail.com>
From: Harry Wentland <harry.wentland@amd.com>
Message-ID: <c5335426-c19a-c174-40a9-a012711cdf0b@amd.com>
Date: Fri, 30 Oct 2020 13:04:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
In-Reply-To: <CADnq5_MdJt02hpdTsvPDVwN4_1D7-1ybDexDreL6GjDipc_Yvw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [198.200.67.155]
X-ClientProxiedBy: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To MW3PR12MB4379.namprd12.prod.outlook.com
 (2603:10b6:303:5e::11)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.193] (198.200.67.155) by
 YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.19 via Frontend Transport; Fri, 30 Oct 2020 17:04:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c4203a4-3e1b-4dc5-48c4-08d87cf5d459
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0144:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1201MB01448E27EE475BBE200E5D5C8C150@MWHPR1201MB0144.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8CAaOXcgpiFVVk4Zh96EtYZmg8GLrjyxcXAD94DLKikohrospiAXXSjgV4oo2kWvMXaZ7rxVVbzdklNvCSylt2aLzhWX8cq8wECLBW5RmAoMtqXcLFDQgKZBdPgWfuOgJ1WJwKjjfUjdty4uh6L5vcyYij1/OsqzkgDsDFTudY9VclYqMrrs+Wc++3QOcw1EdJvC6/zrRkzmiJzyljtGmZq//EDxIoUi8a//k50pjG7s2tCXWmoLoXdafX1dDaEKP+dw8R9mfRmquEE6ZZH75/p/k+OVkfiXPtYGWfixSwD9loNTy5km8omFy5wJybDvosYMTviLEbqnbtTRVRoIxEqpiYYgHQVTiIexbpMtLfqF0wQzicFc9ZkY1Yt2pn7Mvm64SBL3q81yek7DvjzNwo2iEqUZCIIqNXCNk1MfSis=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4379.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(366004)(376002)(346002)(136003)(31696002)(2906002)(2616005)(6486002)(110136005)(16576012)(66476007)(31686004)(8676002)(36756003)(316002)(54906003)(66556008)(66946007)(5660300002)(8936002)(45080400002)(186003)(26005)(52116002)(956004)(53546011)(16526019)(966005)(44832011)(86362001)(83380400001)(4326008)(4001150100001)(478600001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kFqs5BFzS3XvOSPn6dHeTjQjh0rUBIjZVrUiqYv2T//DbkJlUKxyEci7csXNdYD1BHog329U09NaHZkiKljyjhs/OahTlfWHdenG8XUBXRfmgA34nzpKL2xcWOuCcxjaSlvN4KClPnxYEsoCJt/cqClG2jSfAP97yfvuAGpFm+xhQJfLfFunaL/UNIgml9P9r5cevHf6M742qVQJkUBwMRTyOgeHxQDlPbDVeTVQP2XRnV1u1LylQzOqlwpMtfSXpBuT9Qhqyv9FR/J0QpYRRdJuaFzmEcrYFUe7kA+ZB3902jqqHCrErG8c1oEvdOcKDi6kh1M2h4PQnvQ6l8FoMLkZlrUI5oW07+7v8GA//UihS/9jIdCvOYuONbGLVOJ1jzkwdg6jVKzU2m9dQ3ukhuilD83jyE+LhxZyMUyGr6Awcd2+yghEM8lMi1vSUeYmfl9AuAMEiQ56tleL7hDFMj7+UYM8qoc4Iq10qvEbZ3j2G2v4ocLHrGSO4j5IP7EZGBmU4/ItTNk90dpdxLgNtlVI8hN+PLO3saQeSiwuBomtkFsjhqfPW1SGOOTzJEempVJWcwHut6g8Ol80XDXzhQpojAmyy9Eik4JVOAbVeModzmIB1/dH7IzwADTOgIWtSW77V9u3cl83eBes7rGSjg==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c4203a4-3e1b-4dc5-48c4-08d87cf5d459
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4379.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2020 17:04:14.6996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S2TfPOwqukqMy2FEYt8qDtX+33OrUUDCZxUz8E6BY6Jsb/Ogr2nTAIohQ2f7k4tMrYiOSy32QI1XUvCiQN2YyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0144
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
Cc: Lewis Huang <Lewis.Huang@amd.com>,
 Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Leo Li <sunpeng.li@amd.com>, Josip Pavic <Josip.Pavic@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Reza Amini <Reza.Amini@amd.com>,
 Denis Efremov <efremov@linux.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Koo <Anthony.Koo@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2020-10-29 11:53 p.m., Alex Deucher wrote:
> On Mon, Oct 26, 2020 at 5:01 PM Arnd Bergmann <arnd@kernel.org> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> gcc -Wextra warns about a function taking an enum argument
>> being called with a bool:
>>
>> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c: In function 'apply_degamma_for_user_regamma':
>> drivers/gpu/drm/amd/amdgpu/../display/modules/color/color_gamma.c:1617:29: warning: implicit conversion from 'enum <anonymous>' to 'enum dc_transfer_func_predefined' [-Wenum-conversion]
>>   1617 |  build_coefficients(&coeff, true);
>>
>> It appears that a patch was added using the old calling conventions
>> after the type was changed, and the value should actually be 0
>> (TRANSFER_FUNCTION_SRGB) here instead of 1 (true).
> 
> This looks correct to me.  Harry, Leo?
> 

Confirmed with Kruno, this is correct.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Alex
> 
> 
>>
>> Fixes: 55a01d4023ce ("drm/amd/display: Add user_regamma to color module")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>>   drivers/gpu/drm/amd/display/modules/color/color_gamma.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
>> index b8695660b480..09bc2c249e1a 100644
>> --- a/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
>> +++ b/drivers/gpu/drm/amd/display/modules/color/color_gamma.c
>> @@ -1614,7 +1614,7 @@ static void apply_degamma_for_user_regamma(struct pwl_float_data_ex *rgb_regamma
>>          struct pwl_float_data_ex *rgb = rgb_regamma;
>>          const struct hw_x_point *coord_x = coordinates_x;
>>
>> -       build_coefficients(&coeff, true);
>> +       build_coefficients(&coeff, TRANSFER_FUNCTION_SRGB);
>>
>>          i = 0;
>>          while (i != hw_points_num + 1) {
>> --
>> 2.27.0
>>
>> _______________________________________________
>> amd-gfx mailing list
>> amd-gfx@lists.freedesktop.org
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=04%7C01%7Charry.wentland%40amd.com%7C3b50cfb318a04e2708e308d87c875c07%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637396268091128887%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QGijLrlFTXI3xx2sGx1iNczHBezfWdu%2FP2xkfoq%2FMB0%3D&amp;reserved=0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
