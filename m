Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1DF83A245
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 07:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2550A10EC85;
	Wed, 24 Jan 2024 06:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C1B10E6B1;
 Wed, 24 Jan 2024 06:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8jxGaa8FX1Hi5Wu4N7fpnSW0jo4iX6wvU929Bnbz3T6iRWlMcVeIvwiiSr1UlE6/S4j0l2xznb/vxOF1vSIlxShwSDvnTaCDZnKXG1q+chDPxZhOWu0hn40FT3qLHxiI+qjAfu+pQ+Yr7oLpF3XJHmNFBm/0VqbmsPuOo2Ta4lk9u4oBHexQsVzdb4SPfJvtGDou36Dst9gtB+MUKcWvLU+56pb1wvezSyvVyjlXxA13MZBmwaMfIHbocbMr2cX5HweEG0z1n39G177BgK4vh8bDvJOQsJckJ7YVGI9SuMBL7YPRKMQq0QyKi2Rr6DBRIm+nbwdCCcmhrlNtl7hXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F8aeRbl6ndkmPmCo4V2mlot/yWFj3KAbX/4174d+HDg=;
 b=jGUjfwglE6SRklu2cQyUWjQ2Ihw3lWZhxTcRskJQpPo/MeZAh8JTccMJI6RMkw62NNigduojhiXVoL7S03/vz9chivlDhayB6X/K1XdjTmqXhbHz0fdWHlKdWwpeauqk+r33zz11YMSDFAzmL5lqBB4L5MOwgqXtK+1IyyMpGl5i4pzRqGlQELUM/rQBmlj9wwF0fFyjAOWeqLJqWFkGhOfo3+6a0UeK8m0se5SOdR/Wawb3jovODt5boMHW6MopZ3RtKUhb0bz9DF2GzdoH04giWjQKblp3snut6LuTZOp9lQygStn+wfbVRnWg2NZVUYyGofBn7zmnv/DLUmexKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F8aeRbl6ndkmPmCo4V2mlot/yWFj3KAbX/4174d+HDg=;
 b=N/VT8Rli4fUDij1q0stzQMFIdwk1o3/8PgelneAkdvTSkFM4jTT4yoOfMiS9g7UEelprTYF5/ZpnJt+bVqOqnsZu+rZdR9/CRg2EM0zSBbazm+JbLwYflP2taJ8RTh6o+BJM4UKp+DKeuigcD/yaQukCBc5t6an/0pg5lFVwU9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8043.namprd12.prod.outlook.com (2603:10b6:8:14d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 06:48:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7202.031; Wed, 24 Jan 2024
 06:48:35 +0000
Message-ID: <1d3144bd-1f0b-42a3-824a-29c9b83ef4e8@amd.com>
Date: Wed, 24 Jan 2024 07:48:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: Making drm_gpuvm work across gpu devices
Content-Language: en-US
To: "Zeng, Oak" <oak.zeng@intel.com>, Danilo Krummrich <dakr@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>, "Welty, Brian"
 <brian.welty@intel.com>
References: <20240117221223.18540-1-oak.zeng@intel.com>
 <20240117221223.18540-22-oak.zeng@intel.com>
 <ad21ec11-a9cb-4fb2-b9fd-00a4fa11525f@intel.com>
 <PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <PH7PR11MB700440CE88BC0A94CFF8499792742@PH7PR11MB7004.namprd11.prod.outlook.com>
 <2928ce36-06a6-4bee-b115-8dd61cc41dca@amd.com>
 <SA1PR11MB699192584C01A26C781E2F9992742@SA1PR11MB6991.namprd11.prod.outlook.com>
 <4c622af4-af92-4e95-957f-a8867925c236@redhat.com>
 <SA1PR11MB69915590D8D282DA41B8783E927B2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <SA1PR11MB6991C144358812EAA2EE67C2927B2@SA1PR11MB6991.namprd11.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <SA1PR11MB6991C144358812EAA2EE67C2927B2@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0200.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8043:EE_
X-MS-Office365-Filtering-Correlation-Id: 33bdf099-1925-4f35-c765-08dc1ca87cc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XJfx01j3x503zngH1xA5cDR0MOP+Pg93vPfDH41fIBX51ih5E63yNJ0iqip6U4NXvEw50oIvm0wsLIQR5NrxzzoMKnDlE8Q1mA9I8ab4pV9Ebsydp7CGNkf85XcxDT0+pZTIUY8mIundiR6YS1ywUy/cKSCEy8WiyjrFcOu+GWZFffeiRY7J6rlHNOgcIHEPx6rUSj5C5KX9u6OmHnxGOwLjX8JD9YJsqvnWBkxCg1s4dCx9ynVTHoX14PUE3fxNHkLYXsbOi6nfzxlQ9EIjm4tI2gFxXYZLBgIfOc3B6icjAlZYwGdYH+dW7GmUiVATfBxuqW89hZySQFBZiGcLJeUIyonVI4cXcQTHMlxJkyVlySRH/Yxgvz/htkldBuKcCiFF8zlt6Im0PzljyPb+wv/orEqicFhBQAu7jWkmprJWFNFgoCQi6yPGWSSoSMnqNO4NZivmiGvl+s8gcLbG/q01lA+1d7Mn6zDQz/3VpRCwqpPtQDDBD2eZPh1zzq1Wx/uO2uT4K6pA3cbiaza+DRLTFfJdnW9bEgQMqyRhdCZ4lNwB2MOaiQ4VZHka0ssVwnsOACuo4PLlyXLBycdXOY3fZQse6m6Y02wg0TRm5m5yplzkC7HIkAaF3SfQxj0XeHloDnhanBlj0GJ2xTlI40l6WLh3eS36L/Xum3hxWj8f1bkdKhE4te2oxNLzqXWzD2hgc65kEC5kVmeI7sTohKna0anbpJWVgAYHpqvF94k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(230173577357003)(230273577357003)(451199024)(1800799012)(186009)(64100799003)(66574015)(6666004)(2616005)(26005)(2906002)(45080400002)(53546011)(6506007)(6512007)(5660300002)(66556008)(83380400001)(478600001)(30864003)(7416002)(6486002)(316002)(8676002)(66476007)(4326008)(66946007)(41300700001)(54906003)(966005)(8936002)(110136005)(86362001)(36756003)(31696002)(38100700002)(66899024)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUgvK2VDaktyV3dGRmZuMkROTkFEdG5ubzZ6NTJLRTNvUmc5RzFacWhDNXMw?=
 =?utf-8?B?MDg1YmJSQ3Q1czc5bXplVDd1V3VmbS80Tlkrc2V6MlZiUWVCbElXSnNRVm10?=
 =?utf-8?B?TlZveE4rMkhMbWErUHByRHJWdVRWMlBTU3I4cmpCZWhwZ3lyZ1JUSkMrRjdw?=
 =?utf-8?B?bXg0cGwzSEdUWnFSZVRnWWFCU1lrNjhLSHNHeEkwRmptUkNXdVdPZ3lPY3lT?=
 =?utf-8?B?M0dsRmF4cGlmckM2ZzkwMkNOMFlsNEF0UUJZSXVTdGJLcDltMlJiR3ZWdWFp?=
 =?utf-8?B?MHZjL09aTFBRbERwNDlEMEY0SWkvZi9WTThDUkZKOTByWTR1YlhrVm9jbE1C?=
 =?utf-8?B?N1ZFaFB3dVJMZjJZd3Bxc3lYRmljdENYT2xpejJmMkRIZUlQRm1ZYzB1ZzJX?=
 =?utf-8?B?SnhuL0F5eFVVQ0FiaWxHZ3FacjR1RU4yU1NFbDBrQ0RyTTZ5ZEtzV0JOaXhn?=
 =?utf-8?B?b3U0bU9hWVY5VHk4WHZneU9iM0dnWlR6WHJ6cHBDc2FPdGdpQzZoNFNxc3lT?=
 =?utf-8?B?eDFIYjNlSEVpTU5QUEZERHp3cnFNUFVRU3RqdkZwazVlWnhrOWtEaUN5eGh3?=
 =?utf-8?B?YzVJKzBkWGtPWmFzTVMvcTJnWHpxY2FhLzVTUTY1ZUpwUmJGS2FoZ3BKb20w?=
 =?utf-8?B?Q0ZlZWNhUGhkV29SR3lCbXRLVXFERWo5SEtxU0NiSGtGSnhWb1FXMlQ4S2Vk?=
 =?utf-8?B?UXgwMVJLK05mYzU4Vm94YVdRcVBxMDhwdmNsMkk0aXNTeFdxTHI5MDVZQzNa?=
 =?utf-8?B?OUhBR21pUzVzSVRJcEJidllldlVLc0NwUlYySVI4ekhFKzd5cFBJbmE2VWNP?=
 =?utf-8?B?QWltRUFxNTJlUmpOcUQwZ3R6RnlCK0Y4TGlkbUNRTDFDRzNaTXJJKzhNTW81?=
 =?utf-8?B?S0x2WXcra2EyMThZc3h3U3FNdURGM3NFN0NzSFVBTTNZb1djY2hQekNKbWlM?=
 =?utf-8?B?c2dmVFBGTFRadW1UTjJURS84SkRMdGUvQVdrc2ZYTm9MOGJGaWNVaEFXSWdE?=
 =?utf-8?B?SlNMM0dBcmp6c1l6cTVCN3ZsQlhFZ3NpRmdTMUdQeVkrSVdPWURoS29JSWMw?=
 =?utf-8?B?UTcxZXhOTTk1WkNSZUY0VU90ZWtUZ1l6ZXNqUTJ6RXBuWVBtb3NCbnNFMGJh?=
 =?utf-8?B?VXcwb1dlbFJkWkJjNVI2R3h2ZWx2dk9sZ25QTHhtMkMwcXJjSUg1N2l5ZHBn?=
 =?utf-8?B?cmtHR2d1S0VYMGpYcVN6N2Yranl5UC9CK2d5bjBONWt4V0xFTjk0ZkdEanAr?=
 =?utf-8?B?NlRxOUVoL04xSHZocFlLaWdzdjNWdVdqd1owNjFvQUJHNDlUY3A1YTh6bXBO?=
 =?utf-8?B?ZUtLdTJYaDVpQUVRdzFMTGl4VUJNaUg2OWoxVFdwQzVDSGozSU5JT1VaNHJU?=
 =?utf-8?B?NzE0Q2ZTU3FZZGt2QmFmdlpEZEM4SHV0TndUa1Z4aC9vUnlZWU9Db1ExS3NX?=
 =?utf-8?B?bk9SZUhUWjVJS21QMENxcnQybmJ4dU1FVk9aSTBEQ3h0OGF2SENtY1RCdEI3?=
 =?utf-8?B?Z29JWjFZUC85L2VwM1JkK01SWVJjaFVZUUh2VEE5TE4xSU5tL1FGWG9Pei81?=
 =?utf-8?B?dEJwKzBEbWFWaHRxRUIrbzhqSTJpWjNBWFBtZTVRdlo0di9Hbndrb2Y1Qnd2?=
 =?utf-8?B?eDVLQlhIdDFuSlQrQzc5dnFrWkNHR3BEZ0RuWjNoSVpsc1BNNmhkd1VXVFQx?=
 =?utf-8?B?cDVCanhGQmZER3dUR0htcHlFQStSSTNRd3lQamRqamNLL2cwdElpRm5zUHdR?=
 =?utf-8?B?Z1AvS1U3MVl1eWtQc09mWVNGL2ZzZHRMZG5JeUF1OUtQNFViRWtlTEZqLzFm?=
 =?utf-8?B?TG9TMG1xd3JxaHZ1OVo5MXNvalIwU05FQ0ptcEFlVUlaYittWGEzY1d4YmlP?=
 =?utf-8?B?Z0s4UVNETTZjZFM5amlDZ1pmVUZZT2c5ejF1RjJhS3IzSTJtWkg2WE16VENO?=
 =?utf-8?B?ZndicC9zbzhXUUpod0ZpUzNLME1QNFRzUE1JKzJtSFhPci9TZENUWGoyamln?=
 =?utf-8?B?Rk1wWGRGSDFtcjdhbG9vSm4rMVpGTTBjSTBxSFo0dUR1UFYwSENKMzh6ZGlq?=
 =?utf-8?B?UmN3ZjhlYmFHdDEzTlh6YmIwY0FnUXFmaXAyNjNMQVZNUGJyODFiNThMWVVZ?=
 =?utf-8?Q?EpspcRm1+RVlV5emuE+FqMbXP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33bdf099-1925-4f35-c765-08dc1ca87cc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2024 06:48:35.4258 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2yfHJj9mIY8LDQHVlr9pRSYhBO14G93bQO6FP9EZzGUC9Kq5rk0CUtOkqzusrGKm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8043
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Ghimiray,
 Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Gupta,
 saurabhg" <saurabhg.gupta@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Vishwanathapura,
 Niranjana" <niranjana.vishwanathapura@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 24.01.24 um 05:14 schrieb Zeng, Oak:
> Danilo,
>
> Maybe before I give up, I should also ask, currently drm_gpuvm is designed for BO-centric world. Is it easy to make the va range split/merge work simply for va range, but without BO? Conceptually this should work as we are merge/splitting virtual address range which can be decoupled completely from BO.

At least AMD GPUs have a similar requirement to manage virtual ranges 
which are not backed by a BO. For example PRT ranges.

I expect that we can still use drm_gpuvm for this and the BO is simply 
NULL in that case.

Regards,
Christian.

>
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Zeng,
>> Oak
>> Sent: Tuesday, January 23, 2024 10:57 PM
>> To: Danilo Krummrich <dakr@redhat.com>; Christian König
>> <christian.koenig@amd.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>; Welty, Brian
>> <brian.welty@intel.com>
>> Cc: Brost, Matthew <matthew.brost@intel.com>;
>> Thomas.Hellstrom@linux.intel.com; dri-devel@lists.freedesktop.org; Ghimiray,
>> Himal Prasad <himal.prasad.ghimiray@intel.com>; Gupta, saurabhg
>> <saurabhg.gupta@intel.com>; Bommu, Krishnaiah
>> <krishnaiah.bommu@intel.com>; Vishwanathapura, Niranjana
>> <niranjana.vishwanathapura@intel.com>; intel-xe@lists.freedesktop.org
>> Subject: RE: Making drm_gpuvm work across gpu devices
>>
>> Thanks a lot Danilo.
>>
>> Maybe I wasn't clear enough. In the solution I proposed, each device still have
>> separate vm/page tables. Each device still need to manage the mapping, page
>> table flags etc. It is just in svm use case, all devices share one drm_gpuvm
>> instance. As I understand it, drm_gpuvm's main function is the va range split and
>> merging. I don't see why it doesn't work across gpu devices.
>>
>> But I read more about drm_gpuvm. Its split merge function takes a
>> drm_gem_object parameter, see drm_gpuvm_sm_map_ops_create and
>> drm_gpuvm_sm_map. Actually the whole drm_gpuvm is designed for BO-centric
>> driver, for example, it has a drm_gpuvm_bo concept to keep track of the
>> 1BO:Ngpuva mapping. The whole purpose of leveraging drm_gpuvm is to re-use
>> the va split/merge functions for SVM. But in our SVM implementation, there is no
>> buffer object at all. So I don't think our SVM codes can leverage drm_gpuvm.
>>
>> I will give up this approach, unless Matt or Brian can see a way.
>>
>> A few replies inline.... @Welty, Brian I had more thoughts inline to one of your
>> original question....
>>
>>> -----Original Message-----
>>> From: Danilo Krummrich <dakr@redhat.com>
>>> Sent: Tuesday, January 23, 2024 6:57 PM
>>> To: Zeng, Oak <oak.zeng@intel.com>; Christian König
>>> <christian.koenig@amd.com>; Dave Airlie <airlied@redhat.com>; Daniel Vetter
>>> <daniel@ffwll.ch>; Felix Kuehling <felix.kuehling@amd.com>
>>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org;
>> intel-
>>> xe@lists.freedesktop.org; Bommu, Krishnaiah <krishnaiah.bommu@intel.com>;
>>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>>> <matthew.brost@intel.com>; Gupta, saurabhg <saurabhg.gupta@intel.com>
>>> Subject: Re: Making drm_gpuvm work across gpu devices
>>>
>>> Hi Oak,
>>>
>>> On 1/23/24 20:37, Zeng, Oak wrote:
>>>> Thanks Christian. I have some comment inline below.
>>>>
>>>> Danilo, can you also take a look and give your feedback? Thanks.
>>> I agree with everything Christian already wrote. Except for the KFD parts, which
>>> I'm simply not familiar with, I had exactly the same thoughts after reading your
>>> initial mail.
>>>
>>> Please find some more comments below.
>>>
>>>>> -----Original Message-----
>>>>> From: Christian König <christian.koenig@amd.com>
>>>>> Sent: Tuesday, January 23, 2024 6:13 AM
>>>>> To: Zeng, Oak <oak.zeng@intel.com>; Danilo Krummrich
>> <dakr@redhat.com>;
>>>>> Dave Airlie <airlied@redhat.com>; Daniel Vetter <daniel@ffwll.ch>
>>>>> Cc: Welty, Brian <brian.welty@intel.com>; dri-devel@lists.freedesktop.org;
>>> intel-
>>>>> xe@lists.freedesktop.org; Bommu, Krishnaiah
>>> <krishnaiah.bommu@intel.com>;
>>>>> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
>>>>> Thomas.Hellstrom@linux.intel.com; Vishwanathapura, Niranjana
>>>>> <niranjana.vishwanathapura@intel.com>; Brost, Matthew
>>>>> <matthew.brost@intel.com>
>>>>> Subject: Re: Making drm_gpuvm work across gpu devices
>>>>>
>>>>> Hi Oak,
>>>>>
>>>>> Am 23.01.24 um 04:21 schrieb Zeng, Oak:
>>>>>> Hi Danilo and all,
>>>>>>
>>>>>> During the work of Intel's SVM code, we came up the idea of making
>>>>> drm_gpuvm to work across multiple gpu devices. See some discussion here:
>>>>> https://lore.kernel.org/dri-
>>>>>
>> devel/PH7PR11MB70049E7E6A2F40BF6282ECC292742@PH7PR11MB7004.namprd
>>>>> 11.prod.outlook.com/
>>>>>> The reason we try to do this is, for a SVM (shared virtual memory across
>> cpu
>>>>> program and all gpu program on all gpu devices) process, the address space
>>> has
>>>>> to be across all gpu devices. So if we make drm_gpuvm to work across
>> devices,
>>>>> then our SVM code can leverage drm_gpuvm as well.
>>>>>> At a first look, it seems feasible because drm_gpuvm doesn't really use the
>>>>> drm_device *drm pointer a lot. This param is used only for printing/warning.
>>> So I
>>>>> think maybe we can delete this drm field from drm_gpuvm.
>>>>>> This way, on a multiple gpu device system, for one process, we can have
>> only
>>>>> one drm_gpuvm instance, instead of multiple drm_gpuvm instances (one
>> for
>>>>> each gpu device).
>>>>>> What do you think?
>>>>> Well from the GPUVM side I don't think it would make much difference if
>>>>> we have the drm device or not.
>>>>>
>>>>> But the experience we had with the KFD I think I should mention that we
>>>>> should absolutely *not* deal with multiple devices at the same time in
>>>>> the UAPI or VM objects inside the driver.
>>>>>
>>>>> The background is that all the APIs inside the Linux kernel are build
>>>>> around the idea that they work with only one device at a time. This
>>>>> accounts for both low level APIs like the DMA API as well as pretty high
>>>>> level things like for example file system address space etc...
>>>> Yes most API are per device based.
>>>>
>>>> One exception I know is actually the kfd SVM API. If you look at the svm_ioctl
>>> function, it is per-process based. Each kfd_process represent a process across N
>>> gpu devices. Cc Felix.
>>>> Need to say, kfd SVM represent a shared virtual address space across CPU
>> and
>>> all GPU devices on the system. This is by the definition of SVM (shared virtual
>>> memory). This is very different from our legacy gpu *device* driver which
>> works
>>> for only one device (i.e., if you want one device to access another device's
>>> memory, you will have to use dma-buf export/import etc).
>>>> We have the same design requirement of SVM. For anyone who want to
>>> implement the SVM concept, this is a hard requirement. Since now drm has the
>>> drm_gpuvm concept which strictly speaking is designed for one device, I want
>> to
>>> see whether we can extend drm_gpuvm to make it work for both single device
>>> (as used in xe) and multipe devices (will be used in the SVM code). That is why I
>>> brought up this topic.
>>>>> So when you have multiple GPUs you either have an inseparable cluster of
>>>>> them which case you would also only have one drm_device. Or you have
>>>>> separated drm_device which also results in separate drm render nodes and
>>>>> separate virtual address spaces and also eventually separate IOMMU
>>>>> domains which gives you separate dma_addresses for the same page and so
>>>>> separate GPUVM page tables....
>>>> I am thinking we can still make each device has its separate
>> drm_device/render
>>> node/iommu domains/gpu page table. Just as what we have today. I am not
>> plan
>>> to change this picture.
>>>> But the virtual address space will support two modes of operation:
>>>> 1. one drm_gpuvm per device. This is when svm is not in the picture
>>>> 2. all devices in the process share one single drm_gpuvm, when svm is in the
>>> picture. In xe driver design, we have to support a mixture use of legacy mode
>>> (such as gem_create and vm_bind) and svm (such as malloc'ed memory for gpu
>>> submission). So whenever SVM is in the picture, we want one single process
>>> address space across all devices. Drm_gpuvm doesn't need to be aware of
>> those
>>> two operation modes. It is driver's responsibility to use different mode.
>>>> For example, in mode #1, a driver's vm structure (such as xe_vm) can inherit
>>> from drm_gpuvm. In mode #2, a driver's svm structure (xe_svm in this series:
>>> https://lore.kernel.org/dri-devel/20240117221223.18540-1-
>> oak.zeng@intel.com/)
>>> can inherit from drm_gpuvm while each xe_vm (still a per-device based struct)
>>> will just have a pointer to the drm_gpuvm structure. This way when svm is in
>> play,
>>> we build a 1 process:1 mm_struct:1 xe_svm:N xe_vm correlations which means
>>> shared address space across gpu devices.
>>>
>>> With a shared GPUVM structure, how do you track actual per device resources
>>> such as
>>> page tables? You also need to consider that the page table layout, memory
>>> mapping
>>> flags may vary from device to device due to different GPU chipsets or revisions.
>> The per device page table, flags etc are still managed per-device based, which is
>> the xe_vm in the xekmd driver.
>>
>>> Also, if you replace the shared GPUVM structure with a pointer to a shared one,
>>> you may run into all kinds of difficulties due to increasing complexity in terms
>>> of locking, synchronization, lifetime and potential unwind operations in error
>>> paths.
>>> I haven't thought it through yet, but I wouldn't be surprised entirely if there are
>>> cases where you simply run into circular dependencies.
>> Make sense, I can't see through this without a prove of concept code either.
>>
>>> Also, looking at the conversation in the linked patch series:
>>>
>>> <snip>
>>>
>>>>> For example as hmm_range_fault brings a range from host into GPU address
>>>>> space,  what if it was already allocated and in use by VM_BIND for
>>>>> a GEM_CREATE allocated buffer?    That is of course application error,
>>>>> but KMD needs to detect it, and provide one single managed address
>>>>> space across all allocations from the application....
>>>> This is very good question. Yes agree we should check this application error.
>>> Fortunately this is doable. All vm_bind virtual address range are tracked in
>>> xe_vm/drm_gpuvm struct. In this case, we should iterate the drm_gpuvm's rb
>>> tree of *all* gpu devices (as xe_vm is for one device only) to see whether
>> there
>>> is a conflict. Will make the change soon.
>>>
>>> <snip>
>>>
>>> How do you do that if xe_vm->gpuvm is just a pointer to the GPUVM structure
>>> within xe_svm?
>> In the proposed approach, we have a single drm_gpuvm instance for one process.
>> All device's xe_vm pointing to this drm_gpuvm instance. This drm_gpuvm's rb
>> tree maintains all the va range we have in this process. We can just walk this rb
>> tree to see if there is a conflict.
>>
>> But I didn't answer Brian's question completely... In a mixed use of vm_bind and
>> malloc/mmap, the virtual address used by vm_bind should first be reserved in
>> user space using mmap. So all valid virtual address should be tracked by linux
>> kernel vma_struct.
>>
>> Both vm_bind and malloc'ed virtual address can cause a gpu page fault. Our fault
>> handler should first see whether this is a vm_bind va and service the fault
>> accordingly; if not, then serve the fault in the SVM path; if SVM path also failed, it
>> is an invalid address. So from user perspective, user can use:
>> Ptr = mmap()
>> Vm_bind(ptr, bo)
>> Submit gpu kernel using ptr
>> Or:
>> Ptr = mmap()
>> Submit gpu kernel using ptr
>> Whether vm_bind is called or not decides the gpu fault handler code path.
>> Hopefully this answers @Welty, Brian's original question
>>
>>
>>>> This requires some changes of drm_gpuvm design:
>>>> 1. The drm_device *drm pointer, in mode #2 operation, this can be NULL,
>>> means this drm_gpuvm is not for specific gpu device
>>>> 2. The common dma_resv object: drm_gem_object *r_obj. *Does one
>>> dma_resv object allocated/initialized for one device work for all devices*? From
>>> first look, dma_resv is just some CPU structure maintaining dma-fences. So I
>>> guess it should work for all devices? I definitely need you to comment.
>>>
>>> The general rule is that drivers can share the common dma_resv across GEM
>>> objects that
>>> are only mapped within the VM owning the dma_resv, but never within
>> another
>>> VM.
>>>
>>> Now, your question is whether multiple VMs can share the same common
>>> dma_resv. I think
>>> that calls for trouble, since it would create dependencies that simply aren't
>>> needed
>>> and might even introduce locking issues.
>>>
>>> However, that's optional, you can simply decide to not make use of the
>> common
>>> dma_resv
>>> and all the optimizations based on it.
>> Ok, got it.
>>>>
>>>>> It's up to you how to implement it, but I think it's pretty clear that
>>>>> you need separate drm_gpuvm objects to manage those.
>>>> As explained above, I am thinking of one drm_gpuvm object across all devices
>>> when SVM is in the picture...
>>>>> That you map the same thing in all those virtual address spaces at the
>>>>> same address is a completely different optimization problem I think.
>>>> Not sure I follow here... the requirement from SVM is, one virtual address
>>> points to same physical backing store. For example, whenever CPU or any GPU
>>> device access this virtual address, it refers to the same physical content. Of
>>> course the physical backing store can be migrated b/t host memory and any of
>>> the GPU's device memory, but the content should be consistent.
>>>
>>> Technically, multiple different GPUs will have separate virtual address spaces,
>> it's
>>> just that you create mappings within all of them such that the same virtual
>>> address
>>> resolves to the same physical content on all of them.
>>>
>>> So, having a single GPUVM instance representing all of them might give the
>>> illusion of
>>> a single unified address space, but you still need to maintain each device's
>>> address
>>> space backing resources, such as page tables, separately.
>> Yes agreed.
>>
>> Regards,
>> Oak
>>> - Danilo
>>>
>>>> So we are mapping same physical content to the same virtual address in
>> either
>>> cpu page table or any gpu device's page table...
>>>>> What we could certainly do is to optimize hmm_range_fault by making
>>>>> hmm_range a reference counted object and using it for multiple devices
>>>>> at the same time if those devices request the same range of an mm_struct.
>>>>>
>>>> Not very follow. If you are trying to resolve a multiple devices concurrent
>> access
>>> problem, I think we should serialize concurrent device fault to one address
>> range.
>>> The reason is, during device fault handling, we might migrate the backing store
>> so
>>> hmm_range->hmm_pfns[] might have changed after one device access it.
>>>>> I think if you start using the same drm_gpuvm for multiple devices you
>>>>> will sooner or later start to run into the same mess we have seen with
>>>>> KFD, where we moved more and more functionality from the KFD to the
>> DRM
>>>>> render node because we found that a lot of the stuff simply doesn't work
>>>>> correctly with a single object to maintain the state.
>>>> As I understand it, KFD is designed to work across devices. A single pseudo
>>> /dev/kfd device represent all hardware gpu devices. That is why during kfd
>> open,
>>> many pdd (process device data) is created, each for one hardware device for
>> this
>>> process. Yes the codes are a little complicated.
>>>> Kfd manages the shared virtual address space in the kfd driver codes, like the
>>> split, merging etc. Here I am looking whether we can leverage the drm_gpuvm
>>> code for those functions.
>>>> As of the shared virtual address space across gpu devices, it is a hard
>>> requirement for svm/system allocator (aka malloc for gpu program). We need
>> to
>>> make it work either at driver level or drm_gpuvm level. Drm_gpuvm is better
>>> because the work can be shared b/t drivers.
>>>> Thanks a lot,
>>>> Oak
>>>>
>>>>> Just one more point to your original discussion on the xe list: I think
>>>>> it's perfectly valid for an application to map something at the same
>>>>> address you already have something else.
>>>>>
>>>>> Cheers,
>>>>> Christian.
>>>>>
>>>>>> Thanks,
>>>>>> Oak

