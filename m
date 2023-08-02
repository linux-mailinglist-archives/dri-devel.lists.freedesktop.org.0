Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4E876D221
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 17:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FD810E1F2;
	Wed,  2 Aug 2023 15:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E209410E18C;
 Wed,  2 Aug 2023 15:36:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiJ2yOazJaagWtx92y1q/OiZfXjVpSFvtgqrUzZS5fJzKQEuGVK4KbfJy9NL5Pa4DUBxnsX7L+3xF8PsZYvUOY79vsabt7D1JP6SkMXvRU5OLl+ErKrjuEJyGky3guTeMsW64fksKrIw+3IKNKb5O9AbTGrOfFh9JjOChwy7gqfNscKHKxMC2mvQfvjW/NjOs/v0uQ2FaM9jCPA79M6F7jroIbrny+GptoVDJ8F/3T7qXlp0U5r1PWMXMDaTLzp7359MIyprnvnbZ3/8QT+ncB1ZTZ0kq5kkudA27RSLghuLIALcVjNOEu2L/NHNQpdrsS0mgyUIpkLPywTU6C9Vkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbUGAJ+MQgXWVeUqLPiQ3O0Xl4sA9YscV+BAigRCeas=;
 b=E7xXKExW5HiQWmXvTBRfp9eKtP2tNPyZQ2qT8jHYRqwENbGBBmkSUvXq5x85gGMR2Jbtvhr5eZ3Iq3bk5zsHuJD9eD90rrpr0v0AiTApn41uGwLb0Uk0hUX2lisxAuz43SnzWu5zxXt0g2iwYX5eVFgxvgV9pfNg5k9+t0NMGxRHb4QX0uvs6ZC3ZQQW9S0fQJL3+yNoZ4v4AAAY5oJ0XsAkLuCchx9jG/y8Kr+dPMpRL0KJnYIw5wY6CHfrAJ8udMJe+61O+xxl7ikghm0kdgqBPwEmNBWVwMBNQemxTyB04jZKgwc+Hf1UOz7Ult4WXxYBiO0QHxZdeiMrI/3oAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbUGAJ+MQgXWVeUqLPiQ3O0Xl4sA9YscV+BAigRCeas=;
 b=kN+BHLNF2jrZIcBkd2jJjSxhoiDD6IV5g2GKkWuVbOUNPDUE/z/ET9S6OKEynRth+gDAr5EuQuTyI7+ajoXGivQJLALI/Yu0VnIDGhMDJsGHf5aYDKTk0hpYFiv4O3lCkF8hvqXyMKJtpdHgH5evcKefYqW/0foJRYqYlBRZ/RU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH8PR12MB6818.namprd12.prod.outlook.com (2603:10b6:510:1c9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 15:36:01 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::236b:d4e2:6fbf:6c2b%4]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 15:36:01 +0000
Message-ID: <63837c06-ad5b-9c60-f4c7-7c9507777a49@amd.com>
Date: Wed, 2 Aug 2023 11:35:56 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: check attr flag before set cursor
 degamma on DCN3+
To: Alex Hung <alex.hung@amd.com>, Melissa Wen <mwen@igalia.com>,
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Bhawanpreet.Lakha@amd.com
References: <20230731083505.1500965-1-mwen@igalia.com>
 <913fb434-a6f6-5320-bb08-89ddf1b242f9@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <913fb434-a6f6-5320-bb08-89ddf1b242f9@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0286.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:109::6) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH8PR12MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 42a47bcb-0984-4cd8-bb9e-08db936e2cf7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wOAjaUwq+mBr9nG1MKYglcXmtGxI/UrfqeN2sY4VrgmBvcpTBzxjPz9O/V75WDUj4fSeD7KbAQqpMUrqctQcTDvNZRpTPycECUcFUSzOBgTddPisCdIKbAxZNVQfWzNmLHQemEuMk0lEHxWRe/PB2DZjac1CzxM8cWX3ucguaaQc+uH6bui0flgxVuXXP79ZhteU1N8M943lUeYR4AF65CB0lvGimf8azfxiwsG0oJAtsAVRLlQGqOGiLPzo3HXf3gmX/az8oss2VWA8/SBjK5QXPUZvsuvF9idJY7sd5WRD9OBe9TbcDFvVbs2XP/z5F015ETVq9UzwlZPUt7uEuThUl73FZm+RacDIwoKlTgPVK370LqNb4r4tExhDYjY0coagYZSNpg9Z6uFC1RxT0ZQNP5nkAmyKJUpcoj5LpqCK6HnEQjpJHLYObL96ys10p7uiPkiuBLTa4GC//FwFJ912xKBUhSXDWXN0e/y6DgWz4TGd8f18iRcwSl7vSJqdeG0mmbCtfjidmj/uq7I2FGHhBuEkKbtImr6dL7oWwZxxgPZqhNqmonrrcZWs4hHyhf6VeL8OqXaivPW0Ac9LYNTsi3hO1k/9pGd6S7PgLuS7BgmI7R/IzTyiEw8zlPGeSQvvMF9fvlCd5QdLfVWVUQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199021)(7416002)(8676002)(5660300002)(83380400001)(2616005)(921005)(41300700001)(38100700002)(316002)(186003)(8936002)(53546011)(6506007)(26005)(31686004)(4326008)(6636002)(86362001)(66946007)(31696002)(66556008)(66476007)(6512007)(966005)(2906002)(6486002)(6666004)(36756003)(478600001)(110136005)(54906003)(44832011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTI3d2ZaVk5wOGw1QUd1OGtzc25uU3VhNGNFZVlqYmJJNFNUc01QTzFLUmcw?=
 =?utf-8?B?d3BOY2YraUFIVXZTTzVQWm5rbENtOHd5Vy81RkluMGFGSG8rM3JpRTN0NDR0?=
 =?utf-8?B?VVZxeDZyWHgzTUUyQm9FYWlQOHo5MStOVCtqNmplMzVmbDgzN0p5VnY4ck9l?=
 =?utf-8?B?V2JMWlUrdEZhbk5OVDY3K2EzSWFVQVgvNk5jK21PY04zWlNUR2FiRlNzc0tL?=
 =?utf-8?B?c0dKTUI4blJ1eVFEZGF3ZnhlcUJnS1lIWGRub3hyUHYzaXl0SWN6MDhOaEhH?=
 =?utf-8?B?akVxbnV3S1Nmb2sxMlQ2amttanA5QTU1a3UvNThNVjREUDU5dWk1UER3UHVB?=
 =?utf-8?B?RlRUdVE3WWwwZzYvWXpGL0lzcG54SjI2N1Nuci85VE1tTndKbjlKNzhpaVc4?=
 =?utf-8?B?TjRaZER2Z0hreWovY0UwU2dldE1tWUptb2Zoamt1M1o1alFIcTc3UnZTU1hk?=
 =?utf-8?B?WDkxWkNMblZzV2VrQjRYKzZWOGpZM1R3M1BaenRDUTE0TTVsZUQ0TjVwMkFw?=
 =?utf-8?B?MUd4L0ZTdDEzMEs1VmdrSC9XOGhXdUJNelR4N05ndjBOZWlJNnVJekRPZHNW?=
 =?utf-8?B?bWFLbXpLSHZ6YlIwMkI2WlRLNmpDVFNBUEFoVlhxZ0lqdkxUakhxbHBnazlH?=
 =?utf-8?B?WlZha3NIQ0wvOGNoNE9hLzd2ZXBweVN6SDhLUTFJeFUxbjBOK1NhQW5YL1hO?=
 =?utf-8?B?djdkdzB1elFUcS9YbXY4VHNVR290R3dLR1Q5cmw2NmdrcDRNQTRmbisvRDFh?=
 =?utf-8?B?ZUQxVHdGUUJGTGd5amVzT1BZa1lxbzhlRWM4SkVyczJrd0tWRUlQV2FlMnZI?=
 =?utf-8?B?RFV1QTR0QTNocys2cnZhTTN1SEY2eEJnUzFjcHNIcmhETXYzd2hzZmgvTWl6?=
 =?utf-8?B?eXhUZU5OalI0bE41QWcyemJpbmdsVkxrSCtQZ01oNGpnNDRnT2NaUUFaaWZS?=
 =?utf-8?B?ejlxd3RHWlVXMXZVMWgzVk9MV1BkLzV5Q0F0MVh5R2t4S2l0ZUtPamtONTQ3?=
 =?utf-8?B?bUxsK1FtREVDU2tUVFdkS0JOY2xQT2twdGhpV2JrQzduNzZHQXZjQmhUTWIw?=
 =?utf-8?B?VHg5aGViRFl3UCtqNnNGY2hvSGU0eWlwNFJaVVo4SzZMK0FZT3N1S2FhNGlu?=
 =?utf-8?B?T1R6cXBZRjVKUUVVbTZCVWh2YkE5TkFuTXV0UUxCa2NhQVpsOUNwejE4cnUr?=
 =?utf-8?B?UVpFaUJYS1A1VStEc1ZrcXE3ZEF5RE1OYlFSamRhYlp4QXNqNG5tNjRVa25o?=
 =?utf-8?B?ckVYYURwT05kMWZJQUFRRUN6SkYwS3BpZUE4SVJVdG5QWVFDb1I5UmZ4L1lQ?=
 =?utf-8?B?bmVKazlFU1pqWG90RGpFUHBhdWcwUi9FTm5pSzhBcy8zdTB6QTlWNitlamp4?=
 =?utf-8?B?M3JGa0hVMzh4bVF5S3BmWGNIcUZLcnZJeSsyVkMwZ0NuRVJMQkVMN2FvSFF1?=
 =?utf-8?B?WGRJTGtJU2h4SmFTSDFGdE9kVGxEakV3clFnMTcwMGhWK29TUjVHamxhRjU2?=
 =?utf-8?B?UlFZWFJXM004UzMyV2RZN0JDVFE4SGFWZ1ZBQkVVYWxkemxpRS9ESXlTdm9m?=
 =?utf-8?B?MTVsL01QN0NVKzVhcjUxVzNpYzZlMHZRQTcxbG9wbU4rb1hmSzlmRmVaYmJW?=
 =?utf-8?B?bEozTFpJd3czQm1Ockh5OXA4Nm16Kzh5Sm85RVVYSktPVGxvU2ZtQ3FzeEJN?=
 =?utf-8?B?dm9WUFE2VXBHUTMvVkNsaENpUG1IUE5ycHA5ZG96Zk10TmVrRWxHWXhtUmtY?=
 =?utf-8?B?NnJmVHZJRXBIZjAxeG5DVmptemJYK2VsVHdsUFZONThCd0plRjhseWpuYzZZ?=
 =?utf-8?B?aERldEtXcWEwS1EzTXpqNTU2bk1Qcmdnb09kMktlWXkwSFVSR0tpT3Jkb0RB?=
 =?utf-8?B?elJ2YmV4clpvT3F4bmNHYTJCdlZmRTlWZGh3MWltalZESDU1VWpKL2c1VEV3?=
 =?utf-8?B?N3l2SGlpNE4yM3luOC9aUnlYU0I0aG5SK0gwWk1TZGFidklmQS9FcFB6NkZk?=
 =?utf-8?B?Z2g1VUdIY1NBSUNobzg4SzNwTFpuTVpsSUk0YmUwQzZmZ3FzMm5tVEZNWXpp?=
 =?utf-8?B?NDdYeXBvak8yTW9aRVQ4TlJ3WnhNNWdSMG9YUDRpa1VCaDVZVzB2N1doaTIx?=
 =?utf-8?Q?+FzsqO/lDbL3Ka86mSRoq2zVg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42a47bcb-0984-4cd8-bb9e-08db936e2cf7
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 15:36:01.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: veUZh6VN3JSFbj3K/2z1Do0hPm3YDFejQD4iNn/u9R04hhJvoUTU9Sx4qo87vm+AEswluxzZwVODMWDbWtazdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6818
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
Cc: Krunoslav Kovac <krunoslav.kovac@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, amd-gfx@lists.freedesktop.org,
 Michel Danzer <mdaenzer@redhat.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Nicholas.Kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks. Change is merged to amd-staging-drm-next.

Harry

On 2023-08-01 00:07, Alex Hung wrote:
> Tested-by: Alex Hung <alex.hung@amd.com>
> 
> On 2023-07-31 02:35, Melissa Wen wrote:
>> Don't set predefined degamma curve to cursor plane if the cursor
>> attribute flag is not set. Applying a degamma curve to the cursor by
>> default breaks userspace expectation. Checking the flag before
>> performing any color transformation prevents too dark cursor gamma in
>> DCN3+ on many Linux desktop environment (KDE Plasma, GNOME,
>> wlroots-based, etc.) as reported at:
>> - https://gitlab.freedesktop.org/drm/amd/-/issues/1513
>>
>> This is the same approach followed by DCN2 drivers where the issue is
>> not present.
>>
>> Fixes: 03f54d7d3448 ("drm/amd/display: Add DCN3 DPP")
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c | 7 +++++--
>>   1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
>> index e5b7ef7422b8..50dc83404644 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
>> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_dpp.c
>> @@ -357,8 +357,11 @@ void dpp3_set_cursor_attributes(
>>       int cur_rom_en = 0;
>>         if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
>> -        color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA)
>> -        cur_rom_en = 1;
>> +        color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
>> +        if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
>> +            cur_rom_en = 1;
>> +        }
>> +    }
>>         REG_UPDATE_3(CURSOR0_CONTROL,
>>               CUR0_MODE, color_format,

