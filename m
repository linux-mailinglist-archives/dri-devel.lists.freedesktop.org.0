Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A983A0F48
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 11:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939F36E48F;
	Wed,  9 Jun 2021 09:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2051.outbound.protection.outlook.com [40.107.237.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924C66E48F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 09:06:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQZQ2ARQPwxdXCVhfo5ve4rjr+Bs3D6bNCH/bu4jj2QHiwLKBsCphFVMZuEdKO/3Z93tfDJWjJ369WH521MlTFv9qW/mvp2EkQtWlLC/vkEO22mO2At4thQcpDq2RI1hN+PJsddcxki/lCCuoLZkWpDHTzV8YsUrkLIhMjQxybKzzJvXcR4AGk98b71rN7jUx+tmPR+0JJGk+KCXBN/bVFNt4yGhMBjZC0Z+34HL2AkXUHevIMKkzZTiz1Y/sCOkf9em//ICy5Ac6sm8PsEhCcOtaFI7Edi0E1e+TTkedBFgft91004zI0MWNo3QZJzrx85we69mM2Cu8X8tty3BFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FmFRYeVAJOcSj8jutvWiF/sezuuu6pzhLOuzR1jdMY=;
 b=lojQqhFwC1kTGKagwBtDLRykbhmNNukseWHo+KHSFW3x3tiNzqg88IPXhwy/V3NG2U3WsNuieyW/fwF7eD0p90TwMGXn0FrLnsxIWC0LYviHAECt7FDdTnzUw1ypNTj3FT6Cdze+eeOnTkNMGqO4OBuNfD/8FkkEfGsAuesDPS7gvZm68ltZ0ky7zUltqL57+X48+kOfg+UJ44q0r/WU6b1j7VzG7TyIvMGTRlEbSbocTs5F/O/cVrMi6ekK4Lq6VbdO3T7TOxlfDO6+cC8wFenR9VFeO2VLVm1t5EijtzFaKMrvqKGckeySO/P4acTBN9bLzSxNchp9YlhtGOVfPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1FmFRYeVAJOcSj8jutvWiF/sezuuu6pzhLOuzR1jdMY=;
 b=qsUpJMTfyXYWhf/Xvb4KiCQYvN8ezB6o4bq5fj73E7rALum+UXWOrZ18xH8uaONvOKE+XPp+VI8aryqP9Ke912bRYKnMKzCairttOisj6JAdubnR0dHTnfTk3ihXtkBuZRErXmKu2aMH815Sev9wczYcs30aIQsCd8kQIkdKk90=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.24; Wed, 9 Jun 2021 09:06:03 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::4074:4943:244:a5fa%6]) with mapi id 15.20.4173.037; Wed, 9 Jun 2021
 09:06:03 +0000
Subject: Re: [PATCH 1/1] drm/vmwgfx: use ttm_bo_move_null() when there is
 nothing to move
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <da5e1e94-4283-c929-6540-9522b1757648@amd.com>
 <20210608181306.90008-1-nirmoy.das@amd.com>
 <66d5b69f-7017-f1f7-ade6-b38670186b55@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <e4c0b198-12c4-3320-0fd0-1303b57d726d@amd.com>
Date: Wed, 9 Jun 2021 11:05:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <66d5b69f-7017-f1f7-ade6-b38670186b55@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2003:c5:8f2b:2e00:58cc:a063:2acd:ec70]
X-ClientProxiedBy: PR3P193CA0005.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::10) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2003:c5:8f2b:2e00:58cc:a063:2acd:ec70]
 (2003:c5:8f2b:2e00:58cc:a063:2acd:ec70) by
 PR3P193CA0005.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Wed, 9 Jun 2021 09:06:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18299913-a392-4c17-8dcf-08d92b25cecb
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM8PR12MB541388159B410110DEB4930F8B369@DM8PR12MB5413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:255;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bCaXbDYzdXxstFQyk0fQp/e/u6UfpcVDPBF3aTI1KE5AfmvHA5zkELD5ahLhDadLATsWjCYNVtm70TUeMUTjhZEfd1gcJOp62dsYFfPLgDPLk9MTe2HIQyeWNtVN6wnKDNCy43+iR9eNcpzb5foU+GFbOw8/rfmenUcXqu7QsspZpdKeSPZScOGdDlIdRDj+XkdcxCnxFMblrwQxea3aVQYMahfgKWClo5AXxsL8XRjf9uh3ExD/sX2AdtuhSBUBUuEca1parbAEkxaUMZta1WMDFUGoA2pItH8Jbu03azUw/xY/M1oBUQOYdMGq1h0d1YGkkYN2llhVGe23dWhGJw0Oz1JZ2F4zcm98T6sAQcVraaobkM5UD06C7FiE9eM0iVViJ+vBYatHeZH3+0t3ZKeQ46sBmEUf7E/lIZPmVx3i4dRw8ANjou6ZvVxDbAo4WmUBkKD6n63KKOA6Yc658Nbz0AvzUz7DZ5MId1WmjZP7NdBobrYTKSj57R/PykUrvJUrtJ8Z6BMEm3h0Oh4FnKGZD4YYfDu/BE5BRYDKU3t3XNI90HvwZwHOIUUwkwA7gVtoHmtU69w9wu8GZcaZKKhNqsuWk/4XFJuxrlXXF9pU1EouZx+G8rEAURODyHMs0Dzm0PMS8RMPL5P5FJ3cZfLKJmMrY6yJ8JEI2akvRf/noUk8f8PaooASlSqvEnTV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(396003)(136003)(346002)(4326008)(6486002)(316002)(66946007)(36756003)(8936002)(38100700002)(186003)(66574015)(66476007)(66556008)(16526019)(31696002)(52116002)(8676002)(86362001)(2906002)(2616005)(478600001)(5660300002)(6666004)(83380400001)(31686004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJtUVc2Z3ZBSE81ejUxM2tSdTZ6YUMvZG9zcU1hTmZvbzdzUmtBQXgweU9X?=
 =?utf-8?B?SlJqN2tJQ2VOUkc2N3JEblViU0FXdnB6VnhubGoxNldUZFBtelJUNmtKaHpD?=
 =?utf-8?B?S3JZdWIzYTZUdWdUdzRibkkvOEVaeG4yYy9kMWZGRVM0WWdRTUFDM0ZlMVdI?=
 =?utf-8?B?ajhVSUhpTEJHU2F1aWJiYkFRKzFjNjNqdGpKUHBBUEdLMi96ZjJXSFpuL2sr?=
 =?utf-8?B?SE9SNFBtS3pPMi9nMDI1TUtZaVVjc1VJZlY2REIzNnNVdjE3OStieStQVEdS?=
 =?utf-8?B?bzJJM3RGNUg5MHpTaTF3b01PQkFWMnkwUEpDVDk0eVN0b3N4T1Fvd2w1S3U4?=
 =?utf-8?B?c3BaekpIanpoazVNZkQ4RUpVbFAvS2FsaTF0UjZ5bHl1T3FZbUs4TWh0NWkw?=
 =?utf-8?B?cXRLOS9jV3ZYaThES3MvVWFkNDVGbXNBSjdWUi9XNTFQVmF0S2pPMmQ5bnVQ?=
 =?utf-8?B?YVM2M0YzM1JLWVlMdk00WDNRQTRrZnR2c01SL0xBV3EvdEtpSGRXdmdJV0JK?=
 =?utf-8?B?cDhwQlhpcVJPcUd3dEdMaG4vWTl0cDVJTi9hSUlLRUhaVFlUVWNiRW55N3FO?=
 =?utf-8?B?WU92bzk4L0UvRDJIdnA0K1ZoTFVaMk5YQkgxRnh3MTRDajVYTVFrUndDZUFh?=
 =?utf-8?B?NXk2U3lVbTBIUEpyQ0VrelhmZTc2cUc5TWc5c2NiZlZKdEU4dERsQ1V2QU5D?=
 =?utf-8?B?bHJOYjNFNjd1Um9mdHR1ZDJReHpLS201akpIaUxTRGZQVklHMnhuWFVpMXRZ?=
 =?utf-8?B?SVptem9PVzJVajQxUmZKTDlxbC9DSGw4Y2hicG9ISmlsU2FvdUl6OFhuMDBB?=
 =?utf-8?B?eWZLSFBHWThaemtUZDk3RzQ3dmZzcnQ1dlNTM05UbTNwY3JtaWhiNWxUQUNr?=
 =?utf-8?B?MFkwRjRrRm9kQ0FjS2RiSU1nVWJEajUrNGZUS1J4ZDlkOFdwZlVSVzJYY2Rz?=
 =?utf-8?B?OGJjdURWMDY4NUxSa2dickRvMk8zSWFNVXI5bkRNSkR1dnhVMDZqcG1xRFJS?=
 =?utf-8?B?OXV4Qm5CY3A3bllEZkdybVAzcGJQSTh3cEhjVGE0cFZNR3BJOWFjbkhUbFRQ?=
 =?utf-8?B?SE1OdmFhZUk1YmZqQW1wRnZjL3lBSGdJVnBLOFZWVFQ1aFdMbjdXSHprZE1E?=
 =?utf-8?B?RzdXSVRacW11WEhvMFF6TUVGTlordUtUL3NUZFZUbG93R1pTRjlTK3RzNkI5?=
 =?utf-8?B?aExRSHRBbDhONGp0WUtVUDVsMk9sazVtZDFzcThlbU1jRDUrUGVLai9DMmxi?=
 =?utf-8?B?STRPTWhFZjVaQTYyaDJoaHFmVlZIZFBVQTRTT21mMmJVZStEWWdqZzhzMUVw?=
 =?utf-8?B?d3RHQ0pjREx0UWY3SWdUR0Jrd0J5UW1kWEUvdEhVMFE5a0tTa0xHRGtGaEUz?=
 =?utf-8?B?RjZqVnYvUVB6ZEtCcE5wWlFYK05VOHVkZ1EzZ09vcVdEZzAzcndHYkVZdEs0?=
 =?utf-8?B?Y1VKYUE1eXpLQjVIVU1Xcytzb2pRSlhiRHRIVkoyTERXQ0NuaUsyRzdzaXR6?=
 =?utf-8?B?WStkeXpyWjJwYzNnWWNSQjREelB2VnMxR2xwVGpmLzVVandpcFBIZkplSnlo?=
 =?utf-8?B?WVJIeDh2UzVsTmN4aU03Z2JXRWlvbCtGcXBBc0FCM3pKSWFvTDR3MU1Hd3kw?=
 =?utf-8?B?VjRNODVpcHg2d25QL1dRQ2xWcHhHTEFUZUpsUXhja1JSMDZMekt5dndiVm1J?=
 =?utf-8?B?YnJFdWZScSs3U2lmdVlwU2Y5Q0ZMbis5Z2w5ZmExTUh6cE0wMkZIRE1pNVZ4?=
 =?utf-8?B?Njc1M1ZHRnRrREpRZ0VkdU1QTGlnUHVLc1dSZEVZelcrN0orYkpXZU9LaWhm?=
 =?utf-8?B?U2V3Y1BMLzJmYWQyOUFDNUxCRnMycE5yTHhMOUZPRUZwWmhsYVRycXpNdlV3?=
 =?utf-8?Q?9bGhTOktyF3pC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18299913-a392-4c17-8dcf-08d92b25cecb
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2021 09:06:03.6152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqbetrn+YT1lpbzy6WiZx1hAZCkvAwJ8rSqHIJz0j9hwlWtqOmvHR0tp0rWSCDYE+HcaQnGFpJpqpiQ+0w9xMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5413
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
Cc: thomas_os@shipmail.org, linux-graphics-maintainer@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/9/2021 8:38 AM, Christian König wrote:
> Am 08.06.21 um 20:13 schrieb Nirmoy Das:
>> Use ttm_bo_move_null() instead of ttm_bo_assign_mem().
>>
>> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Looks like I've forgot to push that one. *sigh* I'm getting old.


Nah, you have too many stuff on your plate. I should've pinged.


Regards,

Nirmoy


>
> Thanks,
> Christian.
>
>> ---
>>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c 
>> b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> index bfcf31bf7e37..0488042fb287 100644
>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
>> @@ -733,7 +733,7 @@ static int vmw_move(struct ttm_buffer_object *bo,
>>         if (old_man->use_tt && new_man->use_tt) {
>>           if (bo->resource->mem_type == TTM_PL_SYSTEM) {
>> -            ttm_bo_assign_mem(bo, new_mem);
>> +            ttm_bo_move_null(bo, new_mem);
>>               return 0;
>>           }
>>           ret = ttm_bo_wait_ctx(bo, ctx);
>
