Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B13449E84
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 22:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15586E40C;
	Mon,  8 Nov 2021 21:55:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2080.outbound.protection.outlook.com [40.107.102.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09B86E28B;
 Mon,  8 Nov 2021 21:55:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFBDcJx/4CZRCTC+yDhkafl4+eyUuDb9O/wcYV0+h6APiF03BBHUt5OdhwpjIeArMZowJvGO3aRU99oV11MWuRBpJ6OFu1ekvu13R3KhHIpqkLb6AK0Tgyz0gaexR6DejeZGpi69y4AI8RcarIGS15i5TKlWJ1x1n0fx0gAOu8uNKo/sWCTefbnMznPGm9XwnCXBULU9lq+1fgtuloRS3WLWuzBvIgg/tCN59r95ZMVhNAr4uaWqIqa3BK6xxdQm6xZ2DzePnoB+5mbISNGtoKIuv92DxK1/fdyXWypKTnTJohC3YJbNI2+OfKKWwQ8/kpcjTpmX+Adb9Ae31u8Zww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPw6AiZnhU4u+/tL6+fHv6cVmG/707Z8kWXwaW+6YDI=;
 b=YgBujRK9tZEJqVksOvxrqgAzXuvRlDAP4xJK3Ztp52bUak0s6CXWjpEHrxxe/vCRRAggAqO3zfXbjaE6TsKe8AFDY7dGXxZXCgM7xGrp7WuTKZYCY0zpJCAf3434bbqAHDNJqrPSabOVLUKF4z98fEOPmyk2MQBD0gTaOW23fLY/+1KFwKoMhQz/cH+wjncGCB3abjFUMiKrmhyAv+s2ZmRtBQFu+GWNHyVaSjHsur8B+iBc+Ctiz7mdjxVJBRTuNskWoorDsVNcSYX0h9+ZFmnLa6iq8D/Z3gExLhjjyISmLgmjihU28rngNmlkPc8+WCwXYtG2kdITX+CnRrmQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPw6AiZnhU4u+/tL6+fHv6cVmG/707Z8kWXwaW+6YDI=;
 b=GH1Kgx8sKRF35Q+h67iGPOJC4i0WPTRZGKPVEAXvUB7GHRZ0sx51bDFj1WGCg0HnLe5x8zsXh/OtjIjT2JGGwnFh6votrm71SJIbgS5TyV74mLGbhULaW+r0EORmdtLbMSuYXTXHIiMHiUbqR3HNbkKHWYCGYZh8WoAsggPeZeU=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Mon, 8 Nov
 2021 21:55:11 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6972:7084:df02:6dc3%9]) with mapi id 15.20.4669.016; Mon, 8 Nov 2021
 21:55:11 +0000
Message-ID: <be33e8c9-e088-4e13-fbf1-0997571e57db@amd.com>
Date: Tue, 9 Nov 2021 03:34:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/8] drm/i915: add free_unused_pages support to i915
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-4-Arunpravin.PaneerSelvam@amd.com>
 <7f2e05dd-eca4-0b4c-0239-b6f46f87a38f@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <7f2e05dd-eca4-0b4c-0239-b6f46f87a38f@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::19) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
Received: from [10.138.142.32] (165.204.156.251) by
 BM1PR01CA0079.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:1::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Mon, 8 Nov 2021 21:55:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab79c88a-5c88-4dac-2576-08d9a3027002
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4317906EE8C45D639E6A4A4CE4919@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EvG5ipLfFOpKcGPiQPLpTwqufCHERyj0S0D/oRhINFGP/OhKXEJyrqw+Wb7WoVzVgAPko6jT3zZLP+0eEMBRRn0oWXhxxINZK0hhGzOjxLIbz6ayOUO+HtADTyCmdKSyWFagn5iv+BTNZV7DQVzqurHGvgC6cvWWsELzWlsM/D3qRd8uvImyHKKZS9X/J6hkOld2zxZExDDTFCXiXNPtaS4qW6+HOP6dT3H6Ipp+sNTxuQmwKZRcwgoSTWfNsWAvvEaZjDhqnGXmjFdadmJM8eRzEI+YEpHE0w3/ZfJXIKLukx/TXHsC1/jZXAZN8G4li9jv4fyXO723q4HuI9AKCBli5nhebR6VKl7VANvQd3dHT0rQqnoDytR2cu8lo9gicqz7By5+2wIhmubSVmL3gz1ROoTzbS+ToRBRRQYUEhjROCyQCuqZrwObPD3q/QmFBHbLtycHp+TPrdHzx8k2zaZdI570KcWmrWOOaoeTa/wIMEyR62RD+OTiZsAmFhdG7DCjpSeskUtEst5oDJ2IUYgnuzBAO5UvXalwpidG0dex+92XXg5QW7KuJywZlD17gXo3XaJ9Sx8FzM4sMja0A5eDqg/Igumjqkm2rEvEph7EyH/iAeLs6M/qDCS4vTGCI1Mzy8UObQ8mXzB+rs45ZDPAUPXUVCtW9x+0OYZypUR2bix5nJe3UUsQKeZaihFNpSm4Y3nr4yqVEyOe/NoQctCuSU/yEcX9YbSGzhtd8yA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(956004)(186003)(2616005)(66946007)(36756003)(4326008)(66476007)(66556008)(8936002)(31696002)(6486002)(508600001)(38100700002)(2906002)(5660300002)(16576012)(31686004)(26005)(316002)(53546011)(6666004)(8676002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXlvak80UmhVc0ZyVWF5UEhkb3h2WmlJVkdyWUNsV2ZpdkZ1bEZscFNTUlUz?=
 =?utf-8?B?RVhlVS92R1Rydlh5eDNpVWd1MnY3MjBab2RjZzdRSEpXRFY3RVhoTVVJTE9U?=
 =?utf-8?B?WnU0OW0vcml2WjJGcUl1VjBLM3ZUNkw3S0g2aDEzTXg1TmdlaWY5T2U0dkhV?=
 =?utf-8?B?d2F5Q0dFREh2WnpZZGE2amJmWmVwRGlZSWJPTW5ZNjdiNTNmMlFCazFCNTlE?=
 =?utf-8?B?TnJiNjdJZ1VQa3lkM3dLV0dsa0xoeSs1cjgweHc2REp6d1lDc0x6bVRDcUd6?=
 =?utf-8?B?Nk5YMHR1U1FWdmNDSU1EbytKckRaWE9peFd6Tlp0MFRtUGh2aHY1cWlLY2tQ?=
 =?utf-8?B?WnV5L3h0S2c3UEZtbjdnaW5XOVFkQ3V4MDhxTWNIZERmS3FLUXBULzhrVFJL?=
 =?utf-8?B?NnV5dnV5RzdCeFVMWk93ZU9Ccnhmd0lJRWs3UElGN0hXbnR6Qmh0RmRmS2l3?=
 =?utf-8?B?RHJHYzBHMnV5SjB6K1FwOUdwc25wWSszU2hlRjg3MUs2d2lYaThsUXlSWXdM?=
 =?utf-8?B?VGI2Vlp0VmVZQVF0SzdLSVhBSXY4d0VCckhzcjhTMjA4MmR5U2RxVkIxTnRU?=
 =?utf-8?B?dU5UcEZSTitPOWhZR3ZoY2d4bklXZ0t2TGl0V3ExR2hlMWE4Z0JhOGhia1pV?=
 =?utf-8?B?ejVlVEVTOU43WVZkSGwzajVTQjIwRDVCcmRoZk1MZlQzclN2VllFbEc3Rnlr?=
 =?utf-8?B?KzhaYTZPcDJyN1ljYWhkWDZRdVlIVm1GUDg4QlhYMUdyYkV0T2cxYXFaYk5I?=
 =?utf-8?B?c1VZQUhNanJvTTNHcEU2WU02RStMeVpBcE1oT3FoNTBGeGJkbjR2UTlzakNM?=
 =?utf-8?B?WHBPd3hWSU5VUGhHUDVqSkxiVnFjU1JlU1l5ejBoazV3N3crUjlaQS91TkFk?=
 =?utf-8?B?U0ZlMld6VW5HZCtnWVJmeEkzZlZYbXUwN2xiaHByZDFzMytHczFnallUMWVE?=
 =?utf-8?B?MjU1Z3o1c1NxUW5KbzdEZ3llVHlLM3dvWXJxQW5XYW0zQzlrcGkvUFJLUUZj?=
 =?utf-8?B?VWFNMndFZ2xJei9KbSszR2hEQzAzYmhUS2pCZTEvampMNUJ5ZCttR2Npb0x3?=
 =?utf-8?B?OGpTMEpqeS9QMWdZRS9lUFBzeXVFd3pLZE16N2FybzhCRjRjbUp5NnFGZzV1?=
 =?utf-8?B?SXFDdzlmTzVhY3ZTMGpLTytEc3F5Nm1PN3l5RWVXNisvcW9LcUhqbkN4NXlp?=
 =?utf-8?B?dmdtNE8rSy94ZW1BSEE3RjNtRlQ0TEY1OW9GTVhvNTZwai93b3BtV1dnSUR5?=
 =?utf-8?B?WHBpaEhXQTR6U2ZDaU16NXdpbk9KMnNHQUVKUm5jYmdrRmhFOHd1R05GVS85?=
 =?utf-8?B?N094ejRqNkluSThITGlBYU1BSnQ1OWNGOHJuOVJrQ2MyMTZzT0Q1TDZ4TjRX?=
 =?utf-8?B?VTFxR0g2OE5YQ1UzVW02aW9iSEttZ1IzWFRvUmc3WXdCU0dzczNvQTdtdkVK?=
 =?utf-8?B?WDJvMENnVkJOQ1BGUTF2Tnp1ZmlObDd1ZWVhcDZCczFWcUVhSTVtTDh3V0dG?=
 =?utf-8?B?MVBsSE5tajF1SGswSkZKU0JJODBPV2pjanVOQ3RMK1hZQUE3ZkFyNkZaSEhv?=
 =?utf-8?B?c0x5dVZJaFhNeGc2d0tVOWFmT2JzWllrbDlydCt5dEVjQ3c2V2dSdVdCdzEx?=
 =?utf-8?B?SjVMNlhxeVZpL0xjSDB1M3pockhRYTU3VzJWNFlXRVBtOXpwSVBjODBYUXl6?=
 =?utf-8?B?cGdQNHRjdkRUeStQWmdlOFdoS1dFU1ZxK1czbGpvK2piUkEwbWlTMFhJeld0?=
 =?utf-8?B?U2NUcFZndFFpdUZYMXBlWFFSanZRcGp5aXV0SStSZHVCSFJaRGsxbFlGTGxV?=
 =?utf-8?B?aTJmOEI2T0Q0a1NOUFhUYlRpSG43NWY2NjJ5bVk2VGRlTjF5ZDR0ZTRoMVp6?=
 =?utf-8?B?QkdBR2plTDNTMFkwNm9SY3BpZUs4UU12bHJJQXhTVzZmelp3c3B5WGFpZjR1?=
 =?utf-8?B?aTZlWXFic1ZpblM4c3h1cmQ0R2tWdWNjaDIyaTRwb0Z6ZTZlczA5UGsxc2I4?=
 =?utf-8?B?b1haK0VObkE2bmsyTzFqZDdCeHVBbngvT0NhZFJLcVhCV0NXczV1MFp4ZnV6?=
 =?utf-8?B?UkdKSTRwOFZMRStYZFhtVUNvY2dzT3NiNzlSUWFNVjZsSytXUVFEL1BUditP?=
 =?utf-8?B?RUhkYnpiZk5wKy9BNzJmSm5vTWI5QlpEeWlyUWhLQ1ZWb09WdmpwZjYzUndZ?=
 =?utf-8?Q?5muorxnRraJkGTVxgxqixuk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab79c88a-5c88-4dac-2576-08d9a3027002
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2021 21:55:11.6864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CawJCoiajbU6RX2iRMioE13sNkGAciNhIl3SEhfjXvCpHuq8U6AiJ+RU5Itxp7JYfQpY2eF1nSqg/XTNEwxdNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 04/11/21 12:48 am, Matthew Auld wrote:
> On 25/10/2021 14:00, Arunpravin wrote:
>> add drm_buddy_free_unused_pages() support on
>> contiguous allocation
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 963468228392..162947af8e04 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -98,6 +98,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	if (unlikely(err))
>>   		goto err_free_blocks;
>>   
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		err = drm_buddy_free_unused_pages(mm, (uint64_t)n_pages << PAGE_SHIFT,
>> +						       &bman_res->blocks);
>> +
>> +		if (unlikely(err))
>> +			goto err_free_blocks;
> 
> That needs some locking, mark_free/mark_split are all globally visible. 
> Some concurrent user might steal the block, or worse.
[Arun] I will lock using mutex
> 
>> +	}
>> +
>>   	*res = &bman_res->base;
>>   	return 0;
>>   
>>
