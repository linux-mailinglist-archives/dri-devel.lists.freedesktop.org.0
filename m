Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 145D18D399D
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:46:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B9010FE6F;
	Wed, 29 May 2024 14:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="I5dr4BWc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2089.outbound.protection.outlook.com [40.107.92.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B9A10FD27;
 Wed, 29 May 2024 14:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDxddvTPGhn41msssMtWeoPDjTzkk1LB2AZiJVNFXWpjxE/zwoOwT2Cqr6ieiATRy/Z2wLrztjOkPKkP6kIwmjIVc7acxQzYIp+W4Jm6PXiA1r2FVvAjmnalaj7MM+r0LTMWDYee/yoHjtOeI0yK3LfxLtv768FMrn73Lw/CTrHNei1masf6w98ZLPo7xZhXLCmiZDEklueGpyYOI+zAExoBJ44IsauAVmCHD1Nr7HGElMQd094KkWB/U7ua3SLFFx2szZAonYSEc02Whz7j4RLgMBDgNkGHIB27DB/cdEVWJ/yU7TMT1hXFTAdCeTHFkWpLGCynE71Qr3KjwQie8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fcOi31UY4GZC28UNCXKl0viT0RzuAyEwF37iLciwK0I=;
 b=TJXTPQTMKeJPwq5IlpsXWbT3DgmNzpfAmC2boMp8l1S8iVfYI8t2TMnP9zTG1OGZqLKVvSRVX+gGzhZxk/J6DqQTz5E5ujUFfKki6CrvlGc6IpQVh8hnd6YpDd3CnUP8XQbXZY1NauEP+pQj9kaRDf8j4nvW5vMBnaPd+Zr1Q1hLwet6sMSkhrIn5AL3ZUvcPpCUmjZs1TaROoVvxzzJrLi/dVHbLaMjKG06QiVjjwI2q6nvx0h1xx15uyb5ecof1uV8y+xqb0INgGi6EKEz/SRyvYcbgfDLj8dBWNRbU+aaG6V9BOxT0Ip+gjmUJF8DeF+gNrHMAfzdTU+qYwNHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fcOi31UY4GZC28UNCXKl0viT0RzuAyEwF37iLciwK0I=;
 b=I5dr4BWc+IIJq6i+7lFRlwzUNFnNurlsjbuUKz5urTsWEiyUy/ak9pwsTKZ3UcOjCymloar8+pssnGT4EbVxkQ7g3BZgf+MSadCUshauWrvA3I6IOWTP9Iy9LR8v/K9eIhdEG4fTd6zX5FlZYZ0H1jEji8qxVjFEbxMds4HpDec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM3PR12MB9349.namprd12.prod.outlook.com (2603:10b6:0:49::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Wed, 29 May
 2024 14:46:01 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 14:46:00 +0000
Message-ID: <197d195f-9206-41dd-8ff1-f4bb4988fb9b@amd.com>
Date: Wed, 29 May 2024 09:45:55 -0500
User-Agent: Mozilla Thunderbird
From: Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH v2] drm/client: Detect when ACPI lid is closed during
 initialization
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, Chris Bainbridge <chris.bainbridge@gmail.com>,
 hughsient@gmail.com
References: <20240528210319.1242-1-mario.limonciello@amd.com>
 <Zlc4V1goFvU2antl@intel.com>
Content-Language: en-US
In-Reply-To: <Zlc4V1goFvU2antl@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0709.namprd03.prod.outlook.com
 (2603:10b6:408:ef::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM3PR12MB9349:EE_
X-MS-Office365-Filtering-Correlation-Id: f621f36c-e6b6-487c-8c3a-08dc7fee0ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|7416005|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dzhYbllHWWdlRm96N2dxeHRjQmh3N1BCSjFXMjV6bm1veGsvZDVacmx2R0JB?=
 =?utf-8?B?MFZkNHlBNU1qRGpDdVBRMDZ2OWNXTS9JZUVPdm15NDlOWmpvWXUybTduWlFs?=
 =?utf-8?B?N2tnRzRTbU5UK3hxb0JYc0RpQUhnc1pzbFF4Q3czZGtkbkdVem53K1pWcjlO?=
 =?utf-8?B?ZlR4d2FtSW4vMGFoUThCQ3ppb2xNOCsydlN3N0tpNFRRb0lSUXdBOHZ0QzFJ?=
 =?utf-8?B?K29WR2VqSHdwMW4zVFFaSTA4bDRNcDUyNEZOSzZ1aFlucXk2aThYTlZSQWE2?=
 =?utf-8?B?QWZZQzlyOVhUMGJVeTlNc1dUMUk2NzNRQkNpSGJTS3B3Zk1PaXNBa2xjb1Mz?=
 =?utf-8?B?TmU1bUEzZE1YUmRVY25PMm9jM29EYXZDSW9jVnN6LzhEWTZYakJ4K0YwOWdj?=
 =?utf-8?B?aWwzR1NhTUFFTSszWVFaaFRNb056WFY5RjUxamVEZEZuNEVxWVdSd0NDSkpq?=
 =?utf-8?B?NVFYSFlZUDlKNG9TM1RxVENRQ3RSTjhTOHcrTTdPbEduNTRNc0lWWUduVzVk?=
 =?utf-8?B?eHpzenhqeDZTemcwSUYxMXNiZGU3YW5OTm5rMndaWGVsZFV5VkRYM2NLcFBI?=
 =?utf-8?B?MVV4ekFUZU9PYm90dXc4aVhxc0lObHBoc21mSlJOajlKWFFEbTF5V0k3YWRJ?=
 =?utf-8?B?YjVQMUQ2T2VYVHBxRzhuZ3ZqSUhoV09ib2wrRUVra1VJMmR2WGZhWS9EcUpt?=
 =?utf-8?B?SUZ1UHg4T2p5Z2tUZVlkYzUwZ01FVDVraWp1cndTVzRGMks1d2VDblRla3Bi?=
 =?utf-8?B?SnJoR3JCM0lXNjV6ZUtMYlY3ajJtK0lhYXFDK2VHeEQxWlUySTRyRHptbUJz?=
 =?utf-8?B?cUc5VFkwSWlzUC9CV3J2WFFMdkRtR2o4MnNuSmhKZFpKaWphWEhqLzk2SFFS?=
 =?utf-8?B?THVVVDJTVEJFeERmZnMvY2liM0dzaCt6NHFkK3V5bVNrb2RXYXdBQ0c2bkZp?=
 =?utf-8?B?LzBQRWxJS2tHUVFZbndqVU1XdWdIRHV0WWR2Z0pIaEEwa200VkZNREY4QUJy?=
 =?utf-8?B?UHlpd1JSUjk0UDNvamNZcmd5Z0xPN2JvdUFZZXl1NFNpTFd4V3FzU0c0TDN5?=
 =?utf-8?B?cFc3UnVIbzRRenI5SU5kaTUvZVpOSENnd0FOdytZcWE4VlVDZzhPUjJDN1l5?=
 =?utf-8?B?R29ZdGZWaHVTdE1ielE5bmpMVFpxaXlZOUhtQ0xlejRwb1h6Mm9yYUl0NmNY?=
 =?utf-8?B?Z2VEUjVDL2FvM1RTU3ZJdUpuRFU2bHpud2tlbmF2VFAxbm4yUHQwMXFWZzgx?=
 =?utf-8?B?R2Nsd3V0UzM0N0JqNUpSRjV4MWRyVTA4VVplZGJIejd1WVFGZUltVlVWcmRX?=
 =?utf-8?B?YWZwRWZGV1V1LzJ3OUUrMWlkMEJrbjkxcnFCWTljUytjYlVsbWdNSSsrMnBw?=
 =?utf-8?B?L004VzNTeC9WdXMwMFI4ZWF0K3MxQ29MUnhZVXhhQkxVZFFZOVR0S2Q1Z2xz?=
 =?utf-8?B?cHY2ZkZ4cDBhY0RoN29OWkNFa3orZEM5bGFnYlpwYU9LdDhYaHp6S0JrNkxO?=
 =?utf-8?B?L0dTeUJlWnUwdVJIZ2xsdEZxNHVqUUhSakNGRmo0c0l0RzlHaE1vMjd4ZEFB?=
 =?utf-8?B?MUNnQ1VSM25GeGsrRHdtMUhYcUZjZmRZYXFQQjR2a2RtOW4yYWxTVFAwbktv?=
 =?utf-8?B?SlNtbzU1T2twTUpYSklFbTlNYklYMmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlhydWVGZkoyazZzYkh6b1BqNTBjTWwwNG5iMHArN1NYWkRYcjhvTzZMSXBl?=
 =?utf-8?B?QlY2YmhpeVNiaEE2ZmZBL2ZjV0pHai9DdTFFUzQ0QitXMW1VN1F3R0tsM1o0?=
 =?utf-8?B?UUQwckRmTEZneWNwS0NOWkN3ZnJzdlVkckJ3eW9VS0JPRTk5TjRFamZIOUU5?=
 =?utf-8?B?ZnF6Y3NGRWxZd2FONEwwdHVPWVNFem9BaWNQckxWYmdZbnE3KzFKalB4eEdn?=
 =?utf-8?B?YytwRGpEdTdxbHgwOUpzZ2lUQllTWEhCenV4THlqQWY1V01wNXdjUkpHSGla?=
 =?utf-8?B?alB6UlplVlpLSFAzRXN6eWl1bXE1UmZkMGNDbHpTVXZKVWJYNTMvdTZORWVX?=
 =?utf-8?B?elpjTDRqZFg5Wk1OMDIrcmNkOVNHNzYzenV1T0Fjc09sbWh5ZmZKcXNiV1VP?=
 =?utf-8?B?M3c5YTRTazZWN3ZmeVBrcjVZZ0NpVnJIMXl5eHEwQnJFVzVpd2gyYjhoTVV2?=
 =?utf-8?B?NWZxbGtMbXlhS09NckwxNjRjTDZuQTgvR0ZQTjBqSDRqVDIrc25DTlVWOXA4?=
 =?utf-8?B?QUdlY1d6SFVBdHEvRWpxZ2JOZzBsV0daMEVFVU11Tzl5YmViSzU0clFCV1N5?=
 =?utf-8?B?dExDNlBOTlNNQUJXRmF0UGxGdnJXT0NXWFdJdGtmTUlnNzdsKzhzSDhDK3dU?=
 =?utf-8?B?U01Mb0d0NjdNUmkrTDhhV3dJcXlqaE5wRTByeEdyUVc1dXJyeUVMVi9sTml5?=
 =?utf-8?B?ZHlyaGNCRGszOEpUV2pRT3dCcW4wUGxaNW45b3NmWm9tdW85MnRFMkZnMWRv?=
 =?utf-8?B?NWFISXBpRW0ra0RuT1N1QThHZzVRUjh4aDJvVEhqYVVhVlBsTFFNdm05cDh3?=
 =?utf-8?B?Y3gyMGFVMzJCQzlQZTEzM2ljV1hjUWNsMzB0T1A3UkZBanNuR2xkbXdXRFI3?=
 =?utf-8?B?VDFhVVdGa3RhWG93NDl6aEtLTTB6dVBsUFVxOTh6ei94VnU0VHNpNVpuNUov?=
 =?utf-8?B?OU9WNnVrRDZSUlY3NWpJaDhSWC8wWDlyaERQN2NsazlNUEI0QXYrSlBBRVR1?=
 =?utf-8?B?TmFrdGtmQ2VDMS9xTHZObzNEK0ErU2V2WldHTWJsMDNJa2UyUVAxNStKVG43?=
 =?utf-8?B?bVp1emFaRjF4VURrb0JyMUdiQkxCVXJxbnNGelAwc1haNDErL2Y4L2plcXVE?=
 =?utf-8?B?ZWM4SElQTVNtYjZBN0paUnRYYy9ObHVHQ1BLNllRSmYrQ0VYUjljOXRqelFO?=
 =?utf-8?B?WWNETDdlcWx1RWVQc0dGUFVHL1lzOThPek55Z2JGMGNUYkl4M0k0K2hKZjho?=
 =?utf-8?B?b2c5QVpONXJuSUxOMXp2bk91Z3BGKy9TYTR6azZiNEtmRWVhVFczUE52QmFY?=
 =?utf-8?B?akpTTXJKY1JWSmtpSndEZmZmNEwzWjJXRVp5QVI2Qm9pOWtrSGhmcDV3OFY0?=
 =?utf-8?B?OGVSbVpVcEYxQUU2TnN5ZVBJajJLV3JRdzd3L200QklwQ3pjR3JMeVRpT0hN?=
 =?utf-8?B?bU9OUSs2QSt3bkZ4RE9scDRCQ3BwV0d6NTg2a05GRm1IQmtwSkZKa3NDdFRW?=
 =?utf-8?B?RDExV2dGWHFyWmJSV0l0R3Z2OEZ1dm96c0xTVXcvZXVoVk1wVk1abGN3RUlS?=
 =?utf-8?B?Vll2T0ZXVHRidHpXUE1oRWl4cmU1VXpObWUyTTFxdFp1akVaTHRxRTNzeU1r?=
 =?utf-8?B?SWh2UG5TaXM3SkJ3UTgvVmtjT2lydFpxdGNFdDRvNU5Zd3pMbTN4bnFMTlBB?=
 =?utf-8?B?TVN6K1dib2VTKzIxRVFwRUt0cHkwbFNhdmxYS0R5VG5YV2J0a2dKUDZycVV1?=
 =?utf-8?B?V1dhQnZqNHEwV3hLMkVISUtScmtadVptd0JMZCtvbUVXeEdRV1lMMVdFTWFC?=
 =?utf-8?B?dXZiUmZlNDkrelFBa29udU4zeHd2ZmoxVGRqQVFYZEMwNWNkWnB5NDBmTE5F?=
 =?utf-8?B?Uk1yMmdBekxlRmhTL1FlRXBmZUxsb2pBZDJYR3k0UVNPeGxnM2ZjamxaMGtS?=
 =?utf-8?B?V01TK3RnR2xRMGdyaHZDdXVYRTJaN2xYQkdyWTNpNWhyR1QwV1JIRUMydHJP?=
 =?utf-8?B?ZjczZlNFV05KTWs5S2w0Wk8xeWsrY3djMjB6YUF6OHpzRGdTaVJkOGxKdXlN?=
 =?utf-8?B?OWI1T0xCOGtwNmE5S3QyODgyNXY1SGdGbXRZdUNwVUhodms1eUVmZWRwSEk5?=
 =?utf-8?Q?7lumjl1xmSYxNUGIQnS59D3Bi?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f621f36c-e6b6-487c-8c3a-08dc7fee0ede
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 14:46:00.9150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UuVa5hPkb7HzWwT8qnlHUe6X+8hiIXX/L7bf1NjKN8xIQDKtg26shwsluKKQkSLt9ya4dIyGogEVB3gvSzoqsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9349
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/29/2024 09:14, Ville Syrjälä wrote:
> On Tue, May 28, 2024 at 04:03:19PM -0500, Mario Limonciello wrote:
>> If the lid on a laptop is closed when eDP connectors are populated
>> then it remains enabled when the initial framebuffer configuration
>> is built.
>>
>> When creating the initial framebuffer configuration detect the ACPI
>> lid status and if it's closed disable any eDP connectors.
>>
>> Reported-by: Chris Bainbridge <chris.bainbridge@gmail.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3349
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>> Cc: hughsient@gmail.com
>> v1->v2:
>>   * Match LVDS as well
>> ---
>>   drivers/gpu/drm/drm_client_modeset.c | 30 ++++++++++++++++++++++++++++
>>   1 file changed, 30 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
>> index 31af5cf37a09..0b0411086e76 100644
>> --- a/drivers/gpu/drm/drm_client_modeset.c
>> +++ b/drivers/gpu/drm/drm_client_modeset.c
>> @@ -8,6 +8,7 @@
>>    */
>>   
>>   #include "drm/drm_modeset_lock.h"
>> +#include <acpi/button.h>
>>   #include <linux/module.h>
>>   #include <linux/mutex.h>
>>   #include <linux/slab.h>
>> @@ -257,6 +258,34 @@ static void drm_client_connectors_enabled(struct drm_connector **connectors,
>>   		enabled[i] = drm_connector_enabled(connectors[i], false);
>>   }
>>   
>> +static void drm_client_match_edp_lid(struct drm_device *dev,
>> +				     struct drm_connector **connectors,
>> +				     unsigned int connector_count,
>> +				     bool *enabled)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < connector_count; i++) {
>> +		struct drm_connector *connector = connectors[i];
>> +
>> +		switch (connector->connector_type) {
>> +		case DRM_MODE_CONNECTOR_LVDS:
>> +		case DRM_MODE_CONNECTOR_eDP:
>> +			if (!enabled[i])
>> +				continue;
>> +			break;
>> +		default:
>> +			continue;
>> +		}
>> +
>> +		if (!acpi_lid_open()) {
>> +			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] lid is closed, disabling\n",
>> +				    connector->base.id, connector->name);
>> +			enabled[i] = false;
>> +		}
>> +	}
>> +}
> 
> If you don't hook into some lid notify event how is one supposed to get
> the display back to life after opening the lid?

I guess in my mind it's a tangential to the "initial modeset".  The DRM 
master can issue a modeset to enable the combination as desired.

When I tested I did confirm that with mutter such an event is received 
and it does the modeset to enable the eDP when lid is opened.

Let me ask this - what happens if no DRM master running and you hotplug 
a DP cable?  Does a "new" clone configuration get done?
> 
>> +
>>   static bool drm_client_target_cloned(struct drm_device *dev,
>>   				     struct drm_connector **connectors,
>>   				     unsigned int connector_count,
>> @@ -844,6 +873,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>>   		memset(crtcs, 0, connector_count * sizeof(*crtcs));
>>   		memset(offsets, 0, connector_count * sizeof(*offsets));
>>   
>> +		drm_client_match_edp_lid(dev, connectors, connector_count, enabled);
>>   		if (!drm_client_target_cloned(dev, connectors, connector_count, modes,
>>   					      offsets, enabled, width, height) &&
>>   		    !drm_client_target_preferred(dev, connectors, connector_count, modes,
>> -- 
>> 2.43.0
> 

