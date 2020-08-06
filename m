Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FB123E03B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 20:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA5C89568;
	Thu,  6 Aug 2020 18:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 899D689568;
 Thu,  6 Aug 2020 18:18:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iL5aS7FuXuEFkNvd0xSj/1SoxiwDoh845prJ04rFcU9hmMsDPRszRaCIoDgkDzNcFD3oqzz5tT9XkCplxFTmA8QXPKPq3ZYQ1TQoPKToNeXQ5US/6/D7JKk3Xq8GXRbmR5MYfemP6EGB32+3IKYCcXKAbLax7uvwIKq3dmdXa0Hqd84eL237ncMFyO5WJHBMvHlNDnzrTJQeYrTMtu/TOfaLYV+YsqzbfhO7ucK5PT2vKkWjebcaz9n9LFtptOFXBrES3rii2kWwIPdr3G9diFeIZBaD8ZyM3YoQ0kvCnE4EJ1WUYdteK+H8WJDWK/QyK2pXKFwFxyy37vboSo9WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPZtqKvl8kOsOaU+dLsbLe5B/w4FDHb79L6//szefws=;
 b=DSdMvKTEgFlvrHV97PFwhsKi82urxRru78C0r0RPI+hN4w5cwS/gxfr7w/j20rB6pdnwBMsmnD/NEQkhg3YM55gCXLlNxo1N4ROHy5obtDVt4/o4uN/oYcjqeqDxyoLsrOgRz2Qev7B4bsLb7//L1v+MTH/JJGZmCzlOO0/WgeYyPewjPICc63aTDImB/Cu6eUloin8icEQfTzi2ZpL8/vnDG6QMkr4zB4JWEQ7wyDl4uAzqWjRataI7/sMufomgNFLlMk55Z0RNNJ1Wi1ilCyLOKHhEMVdqOEGtBMvR2yToVMP+tAfHXEYzAgUXM3bJm4dqOhHd4dexSgAkmzWrWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPZtqKvl8kOsOaU+dLsbLe5B/w4FDHb79L6//szefws=;
 b=q9aSF3sXxl+ZK5HLCu2RY4degP+B2JsOFKQHDCunXds94HghxZYw8Y5Tr4LTAMir3aEga8wsw6V/HiIlow5BtDsvyoJyWd9KyMUBNqxavKHm8XKCc7+gVGChMj7K9faMU/uBoFb6SibQa+k6wacKNUUYu78LuIPm2NuVVKJ9OhM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3561.namprd12.prod.outlook.com (2603:10b6:5:3e::26) by
 DM6PR12MB4283.namprd12.prod.outlook.com (2603:10b6:5:211::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.19; Thu, 6 Aug 2020 18:18:05 +0000
Received: from DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b]) by DM6PR12MB3561.namprd12.prod.outlook.com
 ([fe80::6df0:61cb:d37:2a0b%6]) with mapi id 15.20.3239.022; Thu, 6 Aug 2020
 18:18:05 +0000
Subject: Re: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
 <20200805211114.m5iw6f5usj2b2yrt@outlook.office365.com>
From: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Message-ID: <1261225a-9ce1-0f21-ca93-f51282b47cf6@amd.com>
Date: Thu, 6 Aug 2020 14:18:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
In-Reply-To: <20200805211114.m5iw6f5usj2b2yrt@outlook.office365.com>
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::15) To DM6PR12MB3561.namprd12.prod.outlook.com
 (2603:10b6:5:3e::26)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.148.234] (165.204.55.211) by
 YTOPR0101CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18 via Frontend
 Transport; Thu, 6 Aug 2020 18:18:04 +0000
X-Originating-IP: [165.204.55.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9879b067-df2a-4020-e638-08d83a350fef
X-MS-TrafficTypeDiagnostic: DM6PR12MB4283:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB42832607D831722A3EF1DBA1EC480@DM6PR12MB4283.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uZ9poNZSBVKNtrEoagnPi84LKbQGqGnn9IaBCwxlOC1uJaYcUPjre+AkjC5Zdch4uvF0P3mi5dfc8i9B8579D5T42snqZXDUBdKNg81YXjxARHxzKWDIg34ew7A/oKsBD1ITM8+P6CyOeeYLsR5593VhobBy5+QOJ2wrfzNEcgGk8/47a/PH8Ce1FADDLWTy1xEW68BzXenfEWObP07KX8YXaHcuDliqEU24bt0CGJcLmfLvav9DEvg9lMxVWDvzMluX9ajtyw+YXPG4P66Jc3l0mnTl3AOZqZ+3G76jumCzO5iRHpB5gMUiPMbn6SvUJSvO2TjiKhi8X045nsmFC0cxgb142mUBRns+thF24povpgfFnoYg9yN1OVQSi+4W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3561.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(366004)(8676002)(31696002)(6636002)(16526019)(53546011)(2906002)(478600001)(66946007)(5660300002)(186003)(6486002)(8936002)(6666004)(6862004)(26005)(4326008)(66556008)(52116002)(66476007)(37006003)(86362001)(956004)(54906003)(31686004)(2616005)(36756003)(316002)(83380400001)(450100002)(16576012)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: nR0qDhSxmMN8FL/dvubibiABlqu8Jha/+N2lvve4JYQqgZn2Lcr1i7OqUQVCuGqFGTkidkrTidZyyat+XWaHeMF5Qq0QcuBSlsGgfcAGwgdri8Td3lbZ7q1wHgsQAqGKF2rBXysvXfkm76kIpfGENbV7RKCaxtq09/wG4dsAzVoU5mAnUc6JjyoWkQ2ovx9swlZiubkINrpJgivDvcVRo1knJfbQDfj9x7rce0zoROuci3aFqxyJmP+R0LQyO1eNP44JBkADeOHnatxqttbCSZb2Mg/XpGMCo24//c/Vdl0xkxtsTAlRZl+vfstu4RKrC1pJ4eIwOQi5/VYrMxbWLo3CxOfcfm4J8e+LWh8soNxAq0HVINO3mRjPU6n/HYAXKL5rVYAib9GkvFvJERD4uIbLHaa7bUhFEr+IYM86Hqeyyp9XXPm0MjqvbFJVpJfbfEeKIRua3qx3pITp7bFcOyBiWfjDaC3V7QqRRU+fkuNgxu+9OaZm9069cTu9KrVe7vaDanBYl77v8WmuQFoWHVWq9JnEqVYroZdp2BQpGBuZgYeeZaI0C08oAD6qBc13g0ZetNNWD1G01SUjiZG66Jlz/e5v4SSmjUeEFVV1naJIspISHjH8e1gmdtNTDbAcRJr/2L1tozGTFwKL7k0WaA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9879b067-df2a-4020-e638-08d83a350fef
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3561.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2020 18:18:05.0291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ehe/a7Nz5lbycZw0Eon31O0QaCQKASib8IXBs4R0j2e7JQ/Lsz9ficokkbovSiiprkhgI18V+si1bWj4d2bTrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4283
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
Cc: Hersen Wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-08-05 5:11 p.m., Rodrigo Siqueira wrote:
> On 07/30, Nicholas Kazlauskas wrote:
>> [Why]
>> Enabling or disable DCC or switching between tiled and linear formats
>> can require bandwidth updates.
>>
>> They're currently skipping all DC validation by being treated as purely
>> surface updates.
>>
>> [How]
>> Treat tiling_flag changes (which encode DCC state) as a condition for
>> resetting the plane.
>>
>> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>> Cc: Hersen Wu <hersenxs.wu@amd.com>
>> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 7cc5ab90ce13..bf1881bd492c 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -8332,6 +8332,8 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>>   	 * TODO: Come up with a more elegant solution for this.
>>   	 */
>>   	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other_state, i) {
>> +		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
>> +
>>   		if (other->type == DRM_PLANE_TYPE_CURSOR)
>>   			continue;
>>   
>> @@ -8342,9 +8344,20 @@ static bool should_reset_plane(struct drm_atomic_state *state,
>>   		if (old_other_state->crtc != new_other_state->crtc)
>>   			return true;
>>   
>> -		/* TODO: Remove this once we can handle fast format changes. */
>> -		if (old_other_state->fb && new_other_state->fb &&
>> -		    old_other_state->fb->format != new_other_state->fb->format)
>> +		/* Framebuffer checks fall at the end. */
>> +		if (!old_other_state->fb || !new_other_state->fb)
>> +			continue;
>> +
>> +		/* Pixel format changes can require bandwidth updates. */
>> +		if (old_other_state->fb->format != new_other_state->fb->format)
>> +			return true;
>> +
>> +		old_dm_plane_state = to_dm_plane_state(old_other_state);
>> +		new_dm_plane_state = to_dm_plane_state(new_other_state);
>> +
>> +		/* Tiling and DCC changes also require bandwidth updates. */
>> +		if (old_dm_plane_state->tiling_flags !=
>> +		    new_dm_plane_state->tiling_flags)
> 
> Why not add a case when we move to a TMZ area?
> 
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

TMZ doesn't affect DML calculations or validation in this case so we can 
safely skip it.

Regards,
Nicholas Kazlauskas

> 
>>   			return true;
>>   	}
>>   
>> -- 
>> 2.25.1
>>
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
