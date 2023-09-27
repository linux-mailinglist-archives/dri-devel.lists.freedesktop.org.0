Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDCD7B0B3F
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 19:44:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C00710E589;
	Wed, 27 Sep 2023 17:44:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060.outbound.protection.outlook.com [40.107.223.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C2010E076;
 Wed, 27 Sep 2023 17:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmrDIZEyQqj8APMnEeRAHrfN0J/JhrGT6dOJtWMpToH3KfR6JARTPkcvVLsGKkQnn3+Mrb+8LIBgvjdKNht3cHF8wMWwIApjy9CmFcLydBTMSC+jdBGNT6RZaK1yhjOPgLP1j4Mb53sMQCmb2TWN2P1X3JhCK8napHtUxhqLkoNmkvOgXCABMIOag1jnlNr7OZUhL/xNHYtOF39c3CBlpwPYd2d21ieRbqgcNXtP6vPcgIUjEyN1kjMg5GF99oEug78qwo0Ar5FOmOTCeOHH9tA8K8jqUrZQMIvC6N72aLBsENW89Scg13myv3OzxRhjX83PC9E/4N4PPAdCfrXFfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JCdYcfr2O3S3YqZDfsEgQo8RhZwEP5J43puABrHW10=;
 b=A8Ka6e0abiwuV616eQzCxMhZZq07RH9bUOjRiTY0kQpDu44WI8mS5Ou3QJpcMAO4hzL5RdJuSBoMcHIiWgJb5X0HiXd5YTGwoxrgzI/838bJbUDB84NkErGHkictjJw7u2UwkDqxcWqH8p+X73pMXvIz3arp3/CkzWt3KHkhFjTKqXWHoUhrLt9uvdYb9fAYZGKQAPVEepxeIxeu/e9UgGO+tJ3jLshUqeu24iOEfU59RC3RI4n6q+78wPsKLZF7aUA5HOEXsiKxWQJ08tfrkNqTruTLvcQgVPP6kuwHSMszXq1yj527Ws4vgPe2B7hhH3TBNZoM0LfJ7ibvY5dyLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JCdYcfr2O3S3YqZDfsEgQo8RhZwEP5J43puABrHW10=;
 b=s2llHYcSc7j1pARQOM4hr0oFc6pjNrQWxOvOMlcebEDBTNO8maLjl+IP876PV99myyMBcHPFxGR8J43o/yjTN+30bJ/fV9Bjw32eMgR5Yzz9WYhu4TdjiAXYu90X1YHSadS9To14eulxrSJLHOA5NJN0JTOnWY6P8KWHLOsdqbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8864.namprd12.prod.outlook.com (2603:10b6:208:485::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.27; Wed, 27 Sep
 2023 17:44:16 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6813.018; Wed, 27 Sep 2023
 17:44:16 +0000
Message-ID: <76906487-8d4a-4ee9-ad28-dcef3694ed00@amd.com>
Date: Wed, 27 Sep 2023 13:44:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amd/display: Fix null pointer dereference in
 error message
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cong Liu <liucong2@kylinos.cn>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Tom Chung <chiahsuan.chung@amd.com>
References: <20230926055618.119195-1-liucong2@kylinos.cn>
 <a71a61fb-2330-4fba-85a7-9ba2a3642dc7@amd.com>
 <82ff7880-f323-b208-b52b-90bd568af934@amd.com>
 <7375c718-86fb-4c71-a4b4-b96909181fa5@amd.com>
In-Reply-To: <7375c718-86fb-4c71-a4b4-b96909181fa5@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0432.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10b::27) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8864:EE_
X-MS-Office365-Filtering-Correlation-Id: 58e6517e-99ec-4af7-8427-08dbbf815e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtgriF/DOV2e/ZJOy78y3+BmDK4uAoE9nrBn1gKbfsIXhAsOEk7ThKiuulDVBPimdoOb+tEKl53/gbYPsWUXLnM16QBpCF2dzm93V/SfhKKUKRXC/J/4zo97W+VknaO32id5ghrM6OJezc6VWIa0mEF0/Rkb2OE8c0DTZTMRUj7COC3lmazLpCYz8f0eKZ/V/y96HLdNV2vgtkNSb/WMVPdwfiWG2iV+Q81JydqRvqTuoaZDm4TFkr90rNpnJzGUJE3T1CA9ChUokWpLvKBHcegdRdWOtb4ifrxlRsq3HwJ/mnGGMEvyW1OSa3Rveirs9s5OxIJOINEJAZmt7UEtESYs6BsfnrU8EsPaGTC8yY+ZIJmsTfsL3sNSySoUNUHkXJ7nB+Pne7bmKIPAdiK3K6sq8JJSejgZEmQa4SGrSJfq+w2rExVB4BK3k+kVqGp/E1CBJdhi1teSNgfC/RJTo/vu6L7jO/mr3d/2nqZ5pvs2m8Ro4uk+MUjyCXjYc37f3J339ctRf970tuQyPXsPh1SYIF2ccOPbOes5slCIrfrxowuM7aRXXO+mvRBjSGztLL4PM0x9a+5ubcWPsvnJHQvWOONi8eLcKfON5GmTFom6Xi0n3ufNFV0+s9567G8r/UgL6qcw1UuwLVJu6qvPKkIyB+xC37QKtjzy9zKfWtE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(39860400002)(396003)(346002)(366004)(230922051799003)(451199024)(186009)(1800799009)(31686004)(6486002)(83380400001)(15650500001)(31696002)(8676002)(8936002)(26005)(921005)(5660300002)(478600001)(36756003)(4326008)(86362001)(2906002)(38100700002)(66946007)(6636002)(316002)(66476007)(41300700001)(110136005)(66556008)(44832011)(53546011)(2616005)(6512007)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UG1RQlo0Ri8vc3hDdkhlWnVvVjhkWGpjbENnZ2FLeit0UndURGNzbFQzUlIw?=
 =?utf-8?B?dkRidEV6d0h0TUp2ZXBXR1JhRXJFVXpSS0tKb3ZNS2FRZmJ6TVpRQlBtWFhL?=
 =?utf-8?B?aTA3VlRhUTNNK0VzVmI1MW43Z254WmdCNkVtVVN6NHF5eFJWU0EwSThhOWov?=
 =?utf-8?B?WUI0S1VFRkYxcGc5OGdWemRtckJMZTdic21rOGt4bnZRR1FyWDRsOVVWQ21P?=
 =?utf-8?B?alhrVlFKZXJZb3ZvaTdPcUEzdi83bFNHejJNQkxhU2FhK25QMkNJUzY1cjdm?=
 =?utf-8?B?N0t6c3U4dkdwdVoyRTd3Rzl5R2JVNHhBN3ZOSGNtZFlZRFVQNlF5aXlrbmxk?=
 =?utf-8?B?U0tzcHNnSTFRMVgwUjNqQkRkdnV5YUFlQnJCcVp5djA5NGg5S1UvZDlyT1dB?=
 =?utf-8?B?SE5wR3lGSE51UFBST3UvWTBJcU1ncVc0ZlpyS0cycjBDSVFvV2FpQ0pJS0lP?=
 =?utf-8?B?MUludDNwU2UvZjdFK1V6eXJzMlRFckhidVd1K3R6bmk5dTg5WURpUkUzUW8v?=
 =?utf-8?B?V0k5UDU2N2NXcUpQMjRhVklQYmQ3Z21LUjZEWlRMT1JPc240c3RYOVQzR2Mz?=
 =?utf-8?B?MXF4aDhuWU1IaHczcHROVDF3QSsxQWFxR1VGdHRiYmVIcHo2cUZkdU5wMXpy?=
 =?utf-8?B?V2pRMFV5MzdEMkpwMFAzOEhEdVlNYk1CNW96d0NzMzcwYnR3enFocExyZFVt?=
 =?utf-8?B?V0ROWXE5YXdkNEtESHhYRmdNMmdPWmFzRU1LL0c5ZW9jNFY3Z3FOaTV3cW9s?=
 =?utf-8?B?Uld4Rmh6SjFRRFI4a0hHcm15UFdqZXpyMC9GMEJqcFhSNkZ3U29lRjhDaUlu?=
 =?utf-8?B?alhxREZOK1gxTXBGWjJzRm5aNVpsNjBpNFBDSURmbDI3dlRVcGd4L0IvcUMv?=
 =?utf-8?B?T2RLQ012Qi9VeWc0WXJFMGdmclVXLzNkRitja2cvUy8yYS9yc3MvbG5LMDBr?=
 =?utf-8?B?WkRCWFlXZXFTK2h2SDZPNWlsd0cyOWhFMVh5blFSOWR2dXFjYjVJZ0E4bWRC?=
 =?utf-8?B?VUZPdGlIWEI5ZFQrNFJQazZrVTZWVThEdUtSaGtzTTFmQWVkK3NjTEo1dmJL?=
 =?utf-8?B?WmhtOFI4OVAzM21aRGFPOE11a0o5dENpZVo5aW5jQUpBenBwU25JdGo1akVW?=
 =?utf-8?B?TG1vV0lsLzhkN3pxNmgzV1hhUzhiYXBtcWhxdjVyNXRxa2RjcWY5REI2SUpU?=
 =?utf-8?B?MFdhd01NSGpYQzh5UEUwbldiVXh1QmVuZkM0U2NUemdEMXhxS0toTTdOSjlR?=
 =?utf-8?B?cVVQN3pXOE5lTHY2dlRQdGF1cnB6aEJmcTVqWGhlSG03S2RmQ1RmOFhJRmhj?=
 =?utf-8?B?MzM0ZDQ3TWg5eW5jbVRadVdVNlpLdzV1M08xd2E0SWpRekZ4eVBVYUU0MmRL?=
 =?utf-8?B?c1JSRXhoZjdlN0RjdkgyNzU1TzNDWkpCUGE5dXV5MnR4T0pzd2V3L3Yvd2lr?=
 =?utf-8?B?eUJSbnNqaFZnbWFRN041MVk0cXRPbllVcldsUkM4cGYyYy9iL2tWczQ3eTZP?=
 =?utf-8?B?T3o2RmMwaUlRVkFseThlVUl1NXhYZ3h1NDlNZEh3QTBCSHIvRzYwTmEvVkZX?=
 =?utf-8?B?RU44c2hxQXZMbWtiRkM0NFNGcUdXcHlkemZTZTNKWktFNEd0LzdDM2hBRW9Y?=
 =?utf-8?B?dk1vQSt5eUFiaEFUSzYyL1owd04zcUtiT2hUdjlrMEJGSG04R1ozdENvb0hV?=
 =?utf-8?B?SDQ1WXdDcm1HcFVub1ZIOUNyN1pGaHRWQTJpNWxFbTdUNXhXRk1iWVdZZDFO?=
 =?utf-8?B?Qy9HV1llVkFZTFVoZ2tBM3JFdWllQUlNM3pHTVpjUE1ZUUJDRG9wbzc5RmpN?=
 =?utf-8?B?bmRMSW1odEZQWENqY2xycm1aYUlXNy9NN1Bya25RaHFvdEx4VjFjdGwwYkI3?=
 =?utf-8?B?N2NFd2ZValJqb2lrclloWmR0TjJsMXpIK3NGOG81NE9mSVdMOTJyV0lzTEc0?=
 =?utf-8?B?K2ZHL25hSlNsZkI4aUgrdXhQMlNvWEc0SVI0R0ZUNVdvZHRPQTJaMWdISkVS?=
 =?utf-8?B?d21ZU2lHSVdhWFk0b0pNMTBrb0FwT1lnNEJZWk1rcWxjTXFkTTl6a3pCbzla?=
 =?utf-8?B?SHJoalRteEU5TXJQVHFiT0djVGZqTS9PWUJBaTV6NzJrb2FaTFJZU3d1bDdi?=
 =?utf-8?Q?fI/HhQCQPJ8i2NHUCazA3hEAl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58e6517e-99ec-4af7-8427-08dbbf815e80
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 17:44:16.3081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v1LP1v31nBb8U7DHfzL9nQcb3jmMx+r0GGapDWu8XiVu+UcpcR4yeSHRjkEzCk4Y5JK/UpPTvzMFOt5NObP8dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8864
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-09-27 10:07, Harry Wentland wrote:
> 
> 
> On 2023-09-27 01:23, Christian König wrote:
>> Am 26.09.23 um 15:09 schrieb Harry Wentland:
>>>
>>> On 2023-09-26 01:56, Cong Liu wrote:
>>>> This patch fixes a null pointer dereference in the error message that is
>>>> printed when the Display Core (DC) fails to initialize. The original
>>>> message includes the DC version number, which is undefined if the DC is
>>>> not initialized.
>>>>
>>>> Fixes: 9788d087caff ("drm/amd/display: improve the message printed when loading DC")
>>>> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
>>>> ---
>>>>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> index 8e98dda1e084..bf52a909f558 100644
>>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>>>> @@ -1703,8 +1703,7 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
>>>>           DRM_INFO("Display Core v%s initialized on %s\n", DC_VER,
>>>>                dce_version_to_string(adev->dm.dc->ctx->dce_version));
>>>>       } else {
>>>> -        DRM_INFO("Display Core v%s failed to initialize on %s\n", DC_VER,
>>>> -             dce_version_to_string(adev->dm.dc->ctx->dce_version));
>>>> +        DRM_INFO("Display Core failed to initialize with v%s!\n", DC_VER);
>>> There is value in printing the version number. Let's not remove it.
>>>
>>> Instead you can probably fix it by doing a NULL check on adev->dm.dc->ctx.
>>
>> But as far as I understand it adev->dm.dc->ctx will always be NULL in this case.
>>
> 
> Thanks, Christian. We're in the else of the NULL check for
> adev-dm.dc, so obviously we can't get the version. Silly me.
> 
> Your patch is
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
> 

Patch is merged.

Harry

> Harry
> 
>> Regards,
>> Christian.
>>
>>>
>>> Harry
>>>
>>>>           goto error;
>>>>       }
>>>>   
>>
> 

