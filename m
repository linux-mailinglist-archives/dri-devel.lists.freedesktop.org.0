Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FEF379712
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 20:32:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865616E8D4;
	Mon, 10 May 2021 18:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB576E8D4;
 Mon, 10 May 2021 18:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YoaC3w6RlzuFeIhw3tsgyjEox0V2nzNF+lnclrcaEwCNJ7az9FtrC02U4NAI0R0pGwvpAx6HKEY+FIk4Ki1i0VHfINcEmX+cg9zTESqEnMxf0/0VGL6T+HCiSmTPoI73k+kLB52hwW99PzmM881mvePydxUH2q7V1khkttFypajP3ZZf6wsS+aexxakS7O2QKAxabKkac025Qc+jj3mHrmbhCrIG3Tb/wBRYkPboadWVZgsCr+wHE0yGzyeyWHPzeAfcBderFudjGAvNOJue/gPi4qTiX8Ha9OevRgHvjTEwwn+8uo+N32ub/YCIXGp1XgOrC80PgfWD/NVVCQEyig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCWEekW3vaHNB1XBI/BmYizQz2MiIi3CsqPJgzq0LY=;
 b=kQVhNPZRUNzsi4L6FrsPo9MhUi5knKeR3RXtXPq3xdkUZGX1zj2K4/K10sc9oVL32ZATtKIGSe4qj0BEhd37oYpv8QWicihzFSEzvKS1EEgApdp1Xqg/ZZi0DBxYGBZU3gf7Aa4o5jhEFPKlFLTso+og4RRwsoUbpYZ9xZ5Nzc+LlJFylc5H+t4KYHFszICW6+Sb02GLtU774WuCcSuBhqobtuhGGZ7TDGeh+1xDPc5b813NfH8lQ/w2cPdvcYu/RggjoYAO/MBlYDS9jmUghk0u1Jb3xoVgeJCPX2QUun9cFai2erRBZtqrxWIpI1x0m/jpjFlvbgBXiFP7pm+tdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwCWEekW3vaHNB1XBI/BmYizQz2MiIi3CsqPJgzq0LY=;
 b=DN24Yn6vKGAoLMgXMKE3JrvutgaOK/AIBfSSoqDqZoXpGddogFPh9n/IMx1ilNCR9f3dHKj/iGZRYSl9+oEPIu7ghhqAOpPOELcv9r2cFFhhaJZUjIzGx9rMr7D2enTvJ0rNhCvLeL/JEQXXWmYswzcw/c9A28/w/raF4grNfOU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 18:32:49 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 18:32:49 +0000
Subject: Re: [PATCH v6 02/16] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Felix Kuehling <felix.kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch,
 Harry.Wentland@amd.com
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
 <20210510163625.407105-3-andrey.grodzovsky@amd.com>
 <01afeedb-179b-d105-4e96-139c9bc654ef@amd.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <ce713da1-b993-8ca0-5adb-6916380bf0d5@amd.com>
Date: Mon, 10 May 2021 14:32:46 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <01afeedb-179b-d105-4e96-139c9bc654ef@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Mon, 10 May 2021 18:32:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b134fe74-cc71-439f-1c9b-08d913e20392
X-MS-TrafficTypeDiagnostic: SN6PR12MB4720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB472053961B737ED4143DC3EAEA549@SN6PR12MB4720.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfpVjicjYPLokRiIDQQm6WJzdVi96tC+4IVTrsk3m8SvB7Q00DBQCqNkwMF5XkHbjtk6dC9VElP8U2rHE3fWHXglG/VHR3CgfHD2gFsBqREo0j6mvRg2eaO6ip+tndp0svouGS8Q/FMtq2JKyauKrpkoovSnXjZAI/e3mOtlzeamJozFQMgFDyPTzO1yI/XCYC2Mof9QDVl+a2bC4dHeNUbgIniaKBDsoRr3xAz62SlhIqn2ykNleTO8k+wfiYWeHMdyJuOv0EvYndN3tR0M1bhraIDHAxq5WkEpoYhC4A2SSGLnFBGHAlVOvm7cXvO/2aHL6S1LS9CMHC0ODREqXMdIRekgicPnHhB4iJSawpxEg60/3bOo2PtuE+Ov2gxdFlYT0qc00QDp138KcXOmZ+Lq2fFvhxHJ/yTylIqeOdS41Q0EO0zmwClJkY3R1NuHpdyYb/krmyyAsYDRA57Twz+BxGcpLSSqhPg2Yb56PKlDh2lAfQbwcBc7H+mk7j24EhjE/n5ZTmRJNIA/+wmu7lpmVo19jbAXg4xf+P/zCUpdER7rmYjAmA8723s6NecdK37gyO1+FxdFGMDipyLPfkN5cE9lBWfKrsF6mwZDuRm345G5mYJPFtKbSYnXwZyZTuecIlubJI/KPG2leJUE+3ZVrSjy22v40sOYJ+yCvg+wWsgCnqdTOp5ZzcUj+nMo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(86362001)(478600001)(186003)(5660300002)(53546011)(83380400001)(66556008)(31696002)(66946007)(4326008)(66476007)(6486002)(8676002)(44832011)(316002)(8936002)(52116002)(38100700002)(36756003)(2616005)(2906002)(16526019)(6636002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WUJSbW5hL05ZMnhhY1JuRlpzdW15b1NCdEF3RWwwbnZLclJnd1c5cHpqRkgv?=
 =?utf-8?B?T2JLbEYwazdxMzB4WjgycHFGaWUySURPbTFkOG1FR3VLVHQ4SlNwZTRZMW1W?=
 =?utf-8?B?M0JpSFRRL3FISDFheHk3SUtPT0QrWWdsT1VmaVV2M1lqK3lmMk1jeG04cnZs?=
 =?utf-8?B?MzJkdWtoOVpUK0FYUVoxNzFINVA5Unc2c3IvZXVuUmVjZzZCaERFSHZvWi9W?=
 =?utf-8?B?LzA1eDdXY0xFY3hnWVUxTjg4bjNJc3RXWW45TFhMU3ZWRlNlTHpGRnJseUYz?=
 =?utf-8?B?Vk5uWjFRWHNMaTVVc2lVWEZIY1RZWEt3Mml5YnJtU0VjaEN5ODAwdTBZTmN4?=
 =?utf-8?B?N0tMU1I5ek5IZ0JVQTN6UjNRT0tIZ0Vta25LZk5DdTdZQnppbnlxSDhTUVl0?=
 =?utf-8?B?YjI0bm1ndENaK2IzOThMVW8zQlByL2VjbiswVjBCeVRuWGtzVFBDQ3pKQ2N4?=
 =?utf-8?B?VjJRNUkyb0IyWmt0WC9CMWlVNmhJbktOd0tHcEFqT3o3RmVoTG9jdEI1a1Yw?=
 =?utf-8?B?TEE4QVFkelFpVzNzMjkzVDZJUDJrK3VFcXk2d2pSRUJadS9ET3lPMnZzRHJw?=
 =?utf-8?B?RTdSblRid0NMc2NpcjRpelR3bVFJbTZHSFVmcUxxSTFIbkxmSld4Q3UwdTVr?=
 =?utf-8?B?TEtOckpYaHAwMlcvRC8rV3ZaQXFWcFF3RzNBTXZuVmNnYVJhWXp0L2pTMVZS?=
 =?utf-8?B?ZGJvcGtBK01FY25ydGJGWUZwSGxzOXduVmxhYjVIMUhPYVNUZlRHWGtOa2NN?=
 =?utf-8?B?WlhPb2VWblNLeXJDaEJadCtPOWUwQVVkdm56NlZXNEVTdmZsNC95ZDlyQmZa?=
 =?utf-8?B?OW1aZUx3aUdoQ0ZsNVh5NmlzdWp0MmE2OUVMM2VkY0I5aXJ1TkFSV2pseUQ1?=
 =?utf-8?B?NGU1ZWtFT1lqTVRjdXRyMVB3VmNzdzFlVmxUMk1ZeSs5ODd6ZmlUQjA2NWhy?=
 =?utf-8?B?bnhvcEp2aXRuWFA0QzY3aXhqNWozZ1lRa043K2g2VEZFbzBSNUhCTlloUEdv?=
 =?utf-8?B?OVF6MjY1cU96TkcxK3hnOU9kbWh5cmhHcUNPRXNWd203dlBCMkJpeWthN3F2?=
 =?utf-8?B?aldaOTl4WHBTRTJDREZaY1krRDJFOFMxdHMvTEtvSVdrU2hGd0tKeVFwVGUr?=
 =?utf-8?B?Nk5uR3k3RVliVlpzRWhnQ2h2dEpDZWRHSmNEaUpoRi9NMVg0QVYwaFJxeDA2?=
 =?utf-8?B?OTJ4Z3dKSjVQdVFobUxqaEdLMUorTFk1ZGk3Z243Z3NFVDJRMTZFcnM4Z0ZB?=
 =?utf-8?B?bGpTUm54Qys1S3VGWStDZWExZG0wbkhOeC9yVTJwMFFFYVZ4SHhXNXhNYnRK?=
 =?utf-8?B?ZWhYd1R0NkNIR2JsMmxLdUlrMUZsRXAyMi93Z0RyTUFNYkpkSVZlLzZxNFdC?=
 =?utf-8?B?dFJMZDB4bUw5K1ZsanA5NDMyWUlHQWUrZmw1c1dkWlQrbDFTMDV2WjFMWS9J?=
 =?utf-8?B?VkVFdEwwOHgwaHdmeXBOSG91SUhXRXQ4bWVPbi80MFBmc3AzcWNDL3pqd1Bp?=
 =?utf-8?B?dm9RMW1sTVorQ2FsSG1FQ0VNMDg5Q3RnMkowa0VkUC94ZXhJemFHUVM5aUNJ?=
 =?utf-8?B?RDJHNDF0eEdMYjN1aElqNmdSZDlpelRncllYZllKR3JNZDN2RENnRmtBSUp3?=
 =?utf-8?B?VHF3b2FrWFpzRmVSMSswdWlmeXhGRFVtc0pGOWxObnNvZXBxSkt6THpxbmd5?=
 =?utf-8?B?bnNFZEJGUkd4TGRTV1g3R0RmTngvRXdtWWhDRlZ5QmdrUFk4akdVOXNGZmNo?=
 =?utf-8?B?Z05lalZROWRTMGRlK0ltbzZJaURENkI5cnZPTlpXS3h4aEtHczlQN1Y0U3FU?=
 =?utf-8?B?ZSsvK1VBbGhGUTZqdStQdzhuZmdCNkcxb3Nqb1RGM2FSR2psTkk1QlJESnh2?=
 =?utf-8?Q?o6LVq96OxP8RT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b134fe74-cc71-439f-1c9b-08d913e20392
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 18:32:49.4269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qktSrQ/EM3q545yVBT3m45vly0o1ECbpdVVveA2hZ4NcCA9zco9q8Xk+rubZAHVLHTfSaz5dOH2Zd6qwPFLHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4720
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org, helgaas@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-05-10 2:27 p.m., Felix Kuehling wrote:
> Am 2021-05-10 um 12:36 p.m. schrieb Andrey Grodzovsky:
>> It's needed to drop iommu backed pages on device unplug
>> before device's IOMMU group is released.
> I don't see any calls to ttm_tt_unpopulate in the rest of the series
> now. Is that an accident, or can this patch be dropped?
>
> Regards,
>    Felix


You are right, it can be dropped because it's not required post 5.11 
kernel (at least
not in the use cases I tested).

Andrey

>
>
>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_tt.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index 539e0232cb3b..dfbe1ea8763f 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -433,3 +433,4 @@ void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>>   	if (!ttm_dma32_pages_limit)
>>   		ttm_dma32_pages_limit = num_dma32_pages;
>>   }
>> +EXPORT_SYMBOL(ttm_tt_unpopulate);
