Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 74CE4394DB3
	for <lists+dri-devel@lfdr.de>; Sat, 29 May 2021 20:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88D2D6E59F;
	Sat, 29 May 2021 18:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2062.outbound.protection.outlook.com [40.107.100.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4608B6E59F;
 Sat, 29 May 2021 18:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HedB0G3iQYDsmefND71jfcTbQIoJmHdY8TRCUgft4bcxZPxjFQp3T0CRFwytIqzcC86es8YYe0b7jJ8RLUQWQjVG8M2fK/Xil8fj2bBxR+UEIL9ibEROdqZMhPLYfjImAObY33LB4+5Fomn7XJoYQ+cXCZklZ7gzZ3jM4zyRh1fnxx8KJJVpKvKqXJ1MIA6f4qiTFD10wRpMoACEAIgewNgknk7oFmiTgCIQIhjN52WpaYm+ft0kIYX4PUAaNi5B+vzEfZOgR3lYXQeEiCkt76YfFVt/M1sa/2vRmXY1k8i+htoB7+m5kkLsQkWOtkuDTLqnhftyj7UoouDqgViUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um5SzYYBar9xF2UWeqhd9Ziqz6bSounZAcGSaIPkxdM=;
 b=g+xFRjLWctsDeuFqxKRYbcqr0vVx3xniHISsQQLxlfosVrioSXArLqAe1ol9GU0+0v5aXU1U90/HI07hpApzg8O+xHaVtzX2GtxuUdsni7YIiB41ZvFwqtB95FsoMOf73S8Y3KOXNAi2s7PvzV6FdnygWaYpQ52pdO59MkpAJFky456z+rw3FA4LQvDDQljsKUCGia0d0V+tWO8orHrUWyCUDpSbL3proQENvieeF1R6B8Ci/1QoxJcpLTDru+iWhmsqyF9kLCosdQYz5VXy8Fyhty6zEzZoVKmG6kyiy+c9odzlMTTC0QMTfcJxd3OSQIL0Ttb3O5WeaTdq+V/iMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Um5SzYYBar9xF2UWeqhd9Ziqz6bSounZAcGSaIPkxdM=;
 b=sPcjDHetbox/8OjbhKqJHM8HMPnOi60QEMmaooFPbMblRnUfNRqLV0QWyRVFlpgfnBCBbCMlVRD1ccf02PUkL0vTMy3uZG5fM2Q0isd6/cqcANqbng4VkdZLldjRqVa3yxEoW707BZv+1eSjjuJ5amPHxHbWKHyQV8UDj9AtDm4=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5225.namprd12.prod.outlook.com (2603:10b6:408:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Sat, 29 May
 2021 18:43:02 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4173.028; Sat, 29 May 2021
 18:43:02 +0000
Subject: Re: [RFC PATCH 1/5] drm/amdkfd: add SPM support for SVM
To: Christoph Hellwig <hch@lst.de>
References: <20210527230809.3701-1-Felix.Kuehling@amd.com>
 <20210527230809.3701-2-Felix.Kuehling@amd.com>
 <20210529063828.GA15834@lst.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <fd19b84a-8657-aa2c-7ce2-f8d29c5850c4@amd.com>
Date: Sat, 29 May 2021 14:42:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210529063828.GA15834@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [142.116.203.225]
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.203.225) by
 YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.27 via Frontend Transport; Sat, 29 May 2021 18:43:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f92f47ca-1ea4-4750-572b-08d922d19669
X-MS-TrafficTypeDiagnostic: BN9PR12MB5225:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB52250EC94CD2D33B0E4C75B892219@BN9PR12MB5225.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1KM9i30gCVItcYp1tpYhOhL6lSIFsFRaeCYxe7sEno9f55ozvHbRtbqvgZM4LTvGpXm2K78UOQNpvdoh5VNfRUR8bPKY3honSaV6KYTjdAvKXzPlxvMOXnynNoxUzjeTw9ML/ANTB6kSvQaQw578W1NyFNee5vQ2C5uIiQCw8R7jK8rHltmQ6DB+s8yfGcUo7eHVIGwy+Qg1oEQkDqe3plCoqVmfGeO/6gnIKTlN7Qw6PnqmC8yUG4vMb+kozZXxTKD6s3//xwDdTJSBpJg9vcHWqhO5UMRBukWfA7aR1VopURz8ebefuP8BS+S6LsMSGeqfYHV/uN2Otn7vmYqBcDLvizuW2VpSHXsxgrkXcrdVE0Wa/rtw4ubv4PMKrSsfvblyJVt9cJ63yCw8W4h2ouFQR1yo5pIGjnM8c02cyq4Mfb9EbYSANkoVeMWLEEMSMVBjq5N8yznaO9P+1oWmUj5mj5Wm6Ef8UQV0ZUYVou7XKEOBUrTgjJVshYV58lX6qLbkcSEh/BMCLoP24uRhbgeBj8K3CjaG8t/UY50pi4KK/SNdKZZGdHQooK1t7IczCrIbIbVxYJJ18rQ3mukcfedvd7ThUXkcHSLC4NqX0T2S4f9cji4DaPHUTZo08Gvnx0FYuj3VzSQCzNaAcQnRKYSlX0T9hrmSlrx4Xb8R7ltK77iAgf4QSMyOxxKOVgfS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(366004)(376002)(396003)(136003)(83380400001)(478600001)(4326008)(38100700002)(6486002)(6666004)(2616005)(36756003)(8676002)(2906002)(956004)(6916009)(16576012)(316002)(5660300002)(26005)(16526019)(8936002)(86362001)(66556008)(31696002)(44832011)(66476007)(31686004)(186003)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?c01MdHhyeUtlTDhoTUJaeWNISTh6MEVEQjBGRUdXM29hMGQrVE9xaWtaaG13?=
 =?utf-8?B?NTlPTnVXQnNrcmZ4ZEQ4OEd1M2NpSWNlLzkvWDAyUjNrcjdVLzVmdWNFLy81?=
 =?utf-8?B?eHRhWWtEWnQ1dkFYOHJscmQ1WjNYcy9sSmYyc3BRTkRVUGtBMWdGMXBocDNK?=
 =?utf-8?B?SmhOeXIvelhjd1MwRUZQWUh4TVZvdmVaVmtRN05RWW9qNllPNG5XN0NaVXFi?=
 =?utf-8?B?eUQrMGZWV3Z4UHlsMXhiWWkwYTNpc1U0L1pnZzRFdHpQSXhXS2lnSlpoMnov?=
 =?utf-8?B?KzNhR1NSYzFhaUxONUtlYTRZa2xsV1dzdkRVUFZ1V0VjUERMRk9DV085YWRp?=
 =?utf-8?B?MFl2ZERERldXUTdRYytZSVlHS290ZWdsQzd2NUFzTys4S3QvaXpOZHpmZ0dZ?=
 =?utf-8?B?cEd3RXRidGFKZE9KcWFwU014blFSb292NmFyNmcyS2U2Nk1sKzBjVEx1QkRp?=
 =?utf-8?B?STlhRnoxREYyVkRUQ2ZJcjJjRkFOc2VyY1ZnL1RlZkdrVCtaS3FWcGh2bXo3?=
 =?utf-8?B?WlQ0QTlBOW9meWhiWGQrcWdSQ1B6SWNTSTZPcG05Zk9zOUdwQUZUSXVkR3I3?=
 =?utf-8?B?V3gyYjdOdlcrSVZWenRSaktFWDFQZ3kzb3JuZW1FWkFZNitBeU1GTldYVWxL?=
 =?utf-8?B?dDAvRmZxSWFVRzBSdGVra1Z5TC9YeDlpUy82MjY0aWdUam5DUE1OUE9WMlgv?=
 =?utf-8?B?QUNrc3ZQOU00TFlRM2c1c1M5YkladUtxL3N1MlFBNHFzQmxIb2IvWFVwd2c1?=
 =?utf-8?B?a0NYNnRJdWxJTDc1VVNjcU83NW44aUZjY3VHUEhsZHJLWG1ab3ZIZnFCZkhN?=
 =?utf-8?B?eFhvcmpuSHZkckFOQ3RPUUhJN2Z2dWsyRGlZUjZQWUxpZEVhdzVsc0R2bWxW?=
 =?utf-8?B?Q0ZLY0xmWklHQndXeDhjSk5iaEJmRXVBWGpDR2ZCTmpEdCtoKzFodis5b2RO?=
 =?utf-8?B?QTRPZFpvaCtYRi8xVHdvUm5hWTFHc2pUMHZVZFhwMEtYQ1M5KzQyWS9qY0NC?=
 =?utf-8?B?U2Rub28yZnRPWUZLdk9yUVkyck50RldrK20wNEJXbmtkTlVHd1A1SXdHWDFz?=
 =?utf-8?B?eEc5VE5zNVVqaVVPSTB0dkp3QUt1YXZkbk1RWFd1ZmUxNHlUMHM5d0VGUGJL?=
 =?utf-8?B?Z05OMWxrVi9VeTZBcFhXbHF5LzdoZG9jVjc2SDliVmVNYVFtb1JRdE8xNFRq?=
 =?utf-8?B?OU10RGwvNXE2d0FpcTR6Qk1Ca2NJeVVmckp1SjhWaC9maXFycmhoTHJLbEIw?=
 =?utf-8?B?akF4N0w1bTIwQWNYM0FjTklvWVI0S2tNY2hUbm4rbWhkYzdSM0hodnEzQVlt?=
 =?utf-8?B?SDQ2ejgvT0RCR0xLclVHbkpwd3JmWG1nVktuV1JmZkRVTVJsbm1jVDB0L0lu?=
 =?utf-8?B?by9oMzdmN1lTYlNuMjFMRHdXcFNLMFgybFdCbnZQMGFGcEhkZUJlaFFyZ2dK?=
 =?utf-8?B?cWNyaUpRSjNNZnlwNkRkcGFtNWhqalJ3SFRFSW5FdkhoeEZYcm1VTFJoTElz?=
 =?utf-8?B?Z3Z0UytEcTNjbTQ0U2MyaVpsZ1NIOGsyQjRXUkhKTVBqQldlZGFFUVQ2SVp6?=
 =?utf-8?B?WXh0MTBXUElhUXZZZ2E3dHdaQXprRXBVbU9kSDBTTlhXKzBlNGFZNkdvU01l?=
 =?utf-8?B?N0tJYUgwM3ZKUTlXT0xsNThVVGZGNWpaUVdzWmRBK0MvMVdDL0F2RnlTc2dU?=
 =?utf-8?B?VTNEa2x5a29jVjM3U3c5TkFMdmEzdFBvekJwSndkU3ZQVHZyZ083c2pLaUNt?=
 =?utf-8?Q?tOcl66BG78WiIkW4d+DXGfmGvBN7whaa8lYnrwn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f92f47ca-1ea4-4750-572b-08d922d19669
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2021 18:43:01.9040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nscXJSJU+kRLR2i8MwDTPg+i4HtJvKuqROnTINuUXMrtfjG8QPbvXS77p8IRlL/oL5k2kmkRQRxUuHDmxkl9Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5225
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
Cc: Alex Sierra <alex.sierra@amd.com>, felix.kuehling@amd.com,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org, jglisse@redhat.com,
 amd-gfx@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-05-29 um 2:38 a.m. schrieb Christoph Hellwig:
> On Thu, May 27, 2021 at 07:08:05PM -0400, Felix Kuehling wrote:
>> diff --git a/kernel/resource.c b/kernel/resource.c
>> index 627e61b0c124..da137553b83e 100644
>> --- a/kernel/resource.c
>> +++ b/kernel/resource.c
>> @@ -783,7 +783,7 @@ struct resource *lookup_resource(struct resource *root, resource_size_t start)
>>  
>>  	return res;
>>  }
>> -
>> +EXPORT_SYMBOL(lookup_resource);
> NAK on hiding random exports in a driver patch.  This needs to be a proper
> patch with a proper rationale, a kerneldoc comment and use
> EXPORT_SYMBOL_GPL.  And even then it smells rather fishy, but I'll wait
> for the rationale.

Yeah, I missed that in internal review. I agree this needs to be a
separate patch.

The rationale is, that the GPU driver needs to be able to look up and
claim the resource corresponding to its VRAM in order to register it as
DEVICE_GENERIC memory with devmap. If there is a better way to do this,
I'm open to suggestions.

Regards,
  Felix

