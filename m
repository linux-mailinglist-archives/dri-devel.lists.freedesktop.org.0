Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 422088B1BB2
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 09:16:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA6D10FC00;
	Thu, 25 Apr 2024 07:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iwy2n8TH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2050.outbound.protection.outlook.com [40.107.95.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E2610FBB2;
 Thu, 25 Apr 2024 07:15:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bVpGfzM0C6BsSgsVSiWpIc+3WOUVcyas9qLvxqaj8m6Nl2Gmz6AgTtXPolAqBa7aW2nbjv0zUFKO5ngoy3z04TLhMW0ccza8S2BIB4WwLXc+hKtxCnxHPPSp9zA63kkWH4onmu9Z8gn+Tw07eRwQe7KMUpa946NMQmjyHa7nEzKyYqL9+viBS6V8WSfTORRvcWh1+CuxwiFM7EwzIyVCANJP4sZJgiTrrSC2mHlozXRhJhBvBkSKFhZMqqIbSQnb033Hxg+u/auaKmxSWbNCjP7V5gD8w15JgkavcYfiaPSfI6YGTClLNK1F2L2REiTEEb9zuvPsEJ3EbFB1JUrYDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+f+gmsUBL6I97cTnfPu9cJE+w9jk+A6osg+JVNg++mw=;
 b=EddewpULWdsjvhsz3oyiYpsq+wjJX9QLUx07489dhJTTzHE7P8V0zurWWNmvR4OCIigX78L2gpSxTMYl6pg1u5YM6MuK+ySvJu5yyW5q9BHbkIRqHvbZfblw4YtTcqYOjFIsUv5KkpudfGTIR1wmgottxF3Q5uIPFzvCZrJVYZlZNfk7LiLZTsVB4HMmWulm/ElaU0Nosyuqf7ThGD0HMDGj/h8phTFNWYhHw7bECqyjqfuYnAZvUm4ek/w7c7+vnrnbS0YzzRIk8XDw4E9LPrkp/9qd1NmfB/7xcI44XjAvpm2pbhH/L2t+9cgcCnCnJOiprD0/rwwQ4yZXG/FIKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+f+gmsUBL6I97cTnfPu9cJE+w9jk+A6osg+JVNg++mw=;
 b=iwy2n8THxDRhNf+0JuUuSl2UZvbT2ZFHX5sqUFp3hN8ymQi/EMecGY2UbB5I40nQd1SnDL2mN9Zx4NHU3uXM14Ei1d89kcXPaWJOBd9OB+OMN9WXjVup8H22SdRUtX/7Hc5171ViOLb9qGK8G1T1Pc7lHRkrF78GLWM0SIRy5zo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ0PR12MB6711.namprd12.prod.outlook.com (2603:10b6:a03:44d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Thu, 25 Apr
 2024 07:15:51 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 07:15:51 +0000
Message-ID: <0031da6c-3064-4603-9af4-ae684842e4e1@amd.com>
Date: Thu, 25 Apr 2024 09:15:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 16/18] drm/amdgpu: Implement SET_PRIORITY GEM op
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
 <20240424165937.54759-17-friedrich.vock@gmx.de>
 <e5224fdf-ecc0-41f2-a7d9-42e3937f2e63@amd.com>
 <6830272c-e3c0-4d54-aa10-6c96c1e644fc@gmx.de>
 <b2e62f12-4490-4438-a54f-10e0c4a4e793@amd.com>
 <38a23351-6f16-462b-be02-187829e3c2c2@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <38a23351-6f16-462b-be02-187829e3c2c2@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0149.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::33) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ0PR12MB6711:EE_
X-MS-Office365-Filtering-Correlation-Id: c659b877-11d2-4b3e-3ef0-08dc64f78a20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z0FLMU5na2RMeEdsdmM4d2hyWVhtNVB3TWlFM0d1ZW01WXhzSCtLMGpRcmwr?=
 =?utf-8?B?MjY0RlR5eERzRUhOdHorSGF0MFl4RDYzdEYvYWF1elBYbWpZMVVQTmE0YzN2?=
 =?utf-8?B?OTJXdnY3eHpzeTFMdUFjR1Q4eFhCaDdsUUZTM0tuek5lUFRnUXlxQTl4aXFT?=
 =?utf-8?B?alhyQUd0cFNxblJuL2s3V3JVcmxrampiS1Vpcmd6dGtJeFEvVlJTL3o1UzJI?=
 =?utf-8?B?SXE3TFFMZUIxeXhSR0NGcFVMOUU5c1hjVGdNd2cvSWY4U25MUUpTallqVGxh?=
 =?utf-8?B?NXIxZDBTT3dSSkw2alErNys5b3JIZ0tqdlRoSEl2QjhqWUd1L3ZiQmFvOWRZ?=
 =?utf-8?B?Lyt4SEplMFNGMWtqNTNycyt5TjBZbWNzaTNJMEFCQVhDZ1Vmc1FXZ3A2YnVB?=
 =?utf-8?B?MUx2dmZOSldBcSs4TGgxNmtMUFdObGt3dlVFNklvODFnVWxKdG5seHlTcFJD?=
 =?utf-8?B?bWpwTGhkNTM3SGRKWnA3VkhiUmRLeDZ4SldJT2FOVDNNTHBSR3JGY0wzTzBp?=
 =?utf-8?B?aXU0MWlpMTVtdHNnRmI4R3VDaWdsb25DdjNYcFJnRDZpcnphMmpLbUM0YmVi?=
 =?utf-8?B?TEtncVFxSFlINEJjN2lEbndPTjJkd0o3Nzh3dmNSYms0d05sQjhkbGsxY3Aw?=
 =?utf-8?B?ZDU1YVZhbm1LRG1aaTZJNUIybHNXM3VlSEZRbnBiU3RnZm90UThlOHcvcS9W?=
 =?utf-8?B?UnZCUnR6MTk4VzhNbmEwUENpRFp6bXZmbmFSdk9Jc0YwSzFNTmlRazRiRHJU?=
 =?utf-8?B?ZS9IVmpQcW8va1ZId1pQRm9tOWxwVEpzdHU1Y2V1eFpMUm1NVjRFV2pXMXIx?=
 =?utf-8?B?Ly9FL0I3MzZKVkJoMUE4RnR0S08zaCt6UTNESzBpdWNpMTFHMXVHVC9hSU00?=
 =?utf-8?B?NlVCTmhEOWhJNFVPRXJVdkpJUldTTzdOR2d3Vjl5c2dSWFIrUS8wd0tXeFZD?=
 =?utf-8?B?NG9QYUVpdjE3dnpqaUJicXExL280b0ViWnd4K0ppWkp6M0NubldlczE4QjRD?=
 =?utf-8?B?c0wzQXl1citzT1N2dDlVZWoxQ1FKQWVGTmgrY1BCUVJDeE1NUE9rNGlBUUxy?=
 =?utf-8?B?Wkl0Sy9ZVUdFdVpwc1JZVXI3bjRLVEUvZFlqRVNYbjFlRXpkMUcxOFMwdUND?=
 =?utf-8?B?WS9jWU9yeFpZWWxvYXZ4Zi94WUN0Y0I0T1NTSnJTMFkrQmRCQTNJWkpWTU5h?=
 =?utf-8?B?K2hrUTFIMVc5UU9mUjBkTzNtMFJrRTkzUENPL1dYbDFHeFVSdFdkeUkxZGhJ?=
 =?utf-8?B?SXN3YXZYaWk3N3g4clh0Ykw5dkttOXIvRDN1Z0J4UGN4NVpSaXhxWTNaRFBW?=
 =?utf-8?B?WFphQnlkcXJWWmViZGdQcTgzaTVpNm9yaGw1M0ZTZFVNb0NFNDFZSHhBcitu?=
 =?utf-8?B?KzE2bEtPRk9WK3M0dzV4WUxGb3E0eVVtcmtPVnFPdGlxcVZ4OStzMHVUdFBN?=
 =?utf-8?B?eEZoZGZHd1JxY1JhVmYvNHJxL3Jzdlk3U1pHYzZ6NTFHSUNFVk9LaDRwOXd4?=
 =?utf-8?B?dE9rTXQybG9hVkpoUG1GMjJZcTUxREt3N0JETWNtOWgxSy9wc2J1c3JkbVgw?=
 =?utf-8?B?d2dHZ0xiSUlSaXlzT0d4ZCt4TkQzbjNENVpnNWVLUXkzYU9Tc2lKblp0bTlB?=
 =?utf-8?B?cHYxU1drU25vWWxoSWVvVWxCS2R6U0hOR1dTWXN6UE9SR3hpbDVocDdsSDlS?=
 =?utf-8?B?eGRlSDFpZkV6RDNMNkNFNXJoak1Cc3JrajhleE96SmFqMnFRMFM1dU5nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJNZi9JcmI4UWZEc2xkU0Fwa1FPRm9tVHlEblZjWHVBV1NBUVc5ci9EK1Rh?=
 =?utf-8?B?RjBkWVFFVUlpTGNYbnhpci8zek0vMEVId0dncEk5L2lCa2NOMVZSbmkvMFkw?=
 =?utf-8?B?TWZjTDZ6VUs2Y0NlMUhWQVFVWjE0UXV0aU5zMXZNU1k2a0tRZ0tHa2pHWHVK?=
 =?utf-8?B?YUR4ejI3V0cwMUJGTUR6cXkrbXc1cFVGY1h5QjFDNlkycHZBVVd1NExQZVN2?=
 =?utf-8?B?Uzd0VC9saE4vV3Q0YXlrL0w4UnkxK0Y2bmpON1l1d2w2cUFzeEJEcC91VUc0?=
 =?utf-8?B?bDA2WWdxdDJUUWt0VFMxNmVZVUVXU1dkNkRxanhzVkd6SGdzTS80d3VZaS9U?=
 =?utf-8?B?cWFaUEFJQ0lzcW5wWnZkZm11aUJJK1phTHo0eUxhOVpBUEJhT2VuenNSMjVS?=
 =?utf-8?B?RnJnUE9yYTN3L0NDb3MvaFc1eUxoVUlVSGx2S3BmbGZaZ0JMTVI0Lyt1UWEz?=
 =?utf-8?B?WTRRUTBEQk5URGk0bFpTYmxRN0lpcTlQTytqWWRxSWoxQTBQTEc4U3B3dE5M?=
 =?utf-8?B?c2p1dmRoZHRmejk1ZjVLcHE5aUVOL2dwcjdHNjM3UThNMC83d0FJa0JKNzRo?=
 =?utf-8?B?bzliL0JxeXpLQ3JlSmdHZVh2d21ET1lJdWlmblZDbC9GdnhkeDVRT2M1d2Q0?=
 =?utf-8?B?SWM2QUhUQ05XV2ZRTC8zSHE5L3NiZGdrcG95cXlYL0JoRlRZUzMyU0NEamtT?=
 =?utf-8?B?VWpSRnJXQWwxNW9WTjBoV0Z2ZXVzUmh2bC9qMi8zNUpuWnBUeDV1bDFVZTBx?=
 =?utf-8?B?RnRTMHQ4V3djZEtrTjExdFY5WUMyZE44Y0lJeTdEbWdkaHZ3UnRLcUM0cUl4?=
 =?utf-8?B?bkF2NytGNXVmNkZRWHIwM3RDZ1d2UkNQZkx5KzBhc09SdW9Yby9QSE9OcGx3?=
 =?utf-8?B?ZjY1RUNhdnFHaXFmdWV6QjJkTlRYSVlLcDg0RXhnRFZ5TE5RK3ZZQkdlOWlZ?=
 =?utf-8?B?U1REZjJFTVN5aEdSWGdIaUhGYjJ0Y3Z6d2pOcE9jL1Z1bFJxd2lWMXVmRGF5?=
 =?utf-8?B?d096YWJDV2F4NC9PTlRrTlZzWUxHdWNmdllSMkxuVFdMTUNiNUo3MFc4WVl0?=
 =?utf-8?B?NmdOUGJ1YVlhY091QitHZnRlMXc3ZVFTcHRHTXJXMHNiNXFqRXZyUys1T21H?=
 =?utf-8?B?T3NiL2htRWpPUU4yNU1rTml2QWxKV3l4TVcwYXgvaGQxYUJ5SXM0cGlFRHF0?=
 =?utf-8?B?WVdOUUVvNmh5M0pCN3hQeFZpem9ZK1U4Vm9NUW51elV5VUNKSkh2ZWFNeXhM?=
 =?utf-8?B?NVJkd3luVE9XMzRhVW1OYkRRSTRYaDZmYkNnM0pmZWlPY3RWTXhDekJXbnh2?=
 =?utf-8?B?OHEwL0hNN21VaE9JTkVUY3RVUzJ3T09SMXRLcjZ5ZDVZbDlQZHVSY2gwQVVl?=
 =?utf-8?B?ZlAwcjlOMUNDUnM1U21kT09RZWRJYnNTUmVYTHhQTEJLQnJRdXUwZDZENDlu?=
 =?utf-8?B?ZHoxTVl0RnovZm85elZYenZURGg2U1BTK25BTnJNK3RaZFlSOW5GNThXUHdF?=
 =?utf-8?B?Y0h5OXNUdjBXYnBWbTROcVpVNXplYUNmOWxCajIwSW5SdlgxVDNNOUtxSXE0?=
 =?utf-8?B?MnJlWUoranNPRVRaOEJ6TGxOMWlYZndIaUtBU2xUako5eEs3dlZLbjBtNnQr?=
 =?utf-8?B?UUtVa2hOZDlNOTJsWGpYZmtIRDh3REFHNGVVVy82NTQ1dDZSSXQvVFFIcHZs?=
 =?utf-8?B?V1BoaXVnZTVvK0NKM1VWYVBCMXJySVRhaDlBSzZFc0s4N3NCVHlrVzA0YWho?=
 =?utf-8?B?WGhnSzlDWDlRZDdoRHRodTJtTmkwb2NsMzRMZDRDL1lUSE9yWVJkUUR0UmJn?=
 =?utf-8?B?aGwrd2JqaHY5QnJWS2lzZkRYb1NQUkVSMFl3emZzMVlTSUhDTzE2bVpqQ3Jm?=
 =?utf-8?B?UlVPRUt1UlRoN2RyYjhyckFyTUo1eWtxalhjYml4cEFCckZqaTRzVlA0NzV6?=
 =?utf-8?B?cEdRamcwMHZxS1JKdnRzRk8xUW9mc29UMlo2YmtGdEFlUmthbUZsVWQrSE1E?=
 =?utf-8?B?dmRCOWE3R28yLzFDZzBlUjFDU2t5aGtXSHdqd0IzZk04UzkzVWlTS0o3MGtS?=
 =?utf-8?B?NGQ4MG9MWG9NcDcweVU1RkFMOUtucVlaVVhtMTlpNnZxRWNIWXdraFpVVXhm?=
 =?utf-8?Q?Jljc+BzcoqOlv3Ylh94KMx3EO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c659b877-11d2-4b3e-3ef0-08dc64f78a20
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 07:15:51.7812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JntShSVPCgaSChcFNE4AfpI1N9VQfr3hq0lrydSNjGeavUXnpn5TKaWz3I8hjbNA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6711
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

Am 25.04.24 um 09:06 schrieb Friedrich Vock:
> On 25.04.24 08:58, Christian König wrote:
>> Am 25.04.24 um 08:46 schrieb Friedrich Vock:
>>> On 25.04.24 08:32, Christian König wrote:
>>>> Am 24.04.24 um 18:57 schrieb Friedrich Vock:
>>>>> Used by userspace to adjust buffer priorities in response to
>>>>> changes in
>>>>> application demand and memory pressure.
>>>>
>>>> Yeah, that was discussed over and over again. One big design criteria
>>>> is that we can't have global priorities from userspace!
>>>>
>>>> The background here is that this can trivially be abused.
>>>>
>>> I see your point when apps are allowed to prioritize themselves above
>>> other apps, and I agree that should probably be disallowed at least for
>>> unprivileged apps.
>>>
>>> Disallowing this is a pretty trivial change though, and I don't really
>>> see the abuse potential in being able to downgrade your own priority?
>>
>> Yeah, I know what you mean and I'm also leaning towards that
>> argumentation. But another good point is also that it doesn't actually
>> help.
>>
>> For example when you have desktop apps fighting with a game, you
>> probably don't want to use static priorities, but rather evict the
>> apps which are inactive and keep the apps which are active in the
>> background.
>>
> Sadly things are not as simple as "evict everything from app 1, keep
> everything from app 2 active". The simplest failure case of this is
> games that already oversubscribe VRAM on their own. Keeping the whole
> app inside VRAM is literally impossible there, and it helps a lot to
> know which buffers the app is most happy with evicting.
>> In other words the priority just tells you which stuff from each app
>> to evict first, but not which app to globally throw out.
>>
> Yeah, but per-buffer priority system could do both of these.

Yeah, but we already have that. See amdgpu_bo_list_entry_cmp() and 
amdgpu_bo_list_create().

This is the per application priority which can be used by userspace to 
give priority to each BO in a submission (or application wide).

The problem is rather that amdgpu/TTM never really made good use of that 
information.

Regards,
Christian.

>
> Regards,
> Friedrich
>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>> Friedrich
>>>
>>>> What we can do is to have per process priorities, but that needs to be
>>>> in the VM subsystem.
>>>>
>>>> That's also the reason why I personally think that the handling
>>>> shouldn't be inside TTM at all.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>>>>> ---
>>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 20 ++++++++++++++++++++
>>>>>   include/uapi/drm/amdgpu_drm.h           |  1 +
>>>>>   2 files changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> index 5ca13e2e50f50..6107810a9c205 100644
>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>> @@ -836,8 +836,10 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>>> void *data,
>>>>>   {
>>>>>       struct amdgpu_device *adev = drm_to_adev(dev);
>>>>>       struct drm_amdgpu_gem_op *args = data;
>>>>> +    struct ttm_resource_manager *man;
>>>>>       struct drm_gem_object *gobj;
>>>>>       struct amdgpu_vm_bo_base *base;
>>>>> +    struct ttm_operation_ctx ctx;
>>>>>       struct amdgpu_bo *robj;
>>>>>       int r;
>>>>>
>>>>> @@ -851,6 +853,9 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>>> void *data,
>>>>>       if (unlikely(r))
>>>>>           goto out;
>>>>>
>>>>> +    memset(&ctx, 0, sizeof(ctx));
>>>>> +    ctx.interruptible = true;
>>>>> +
>>>>>       switch (args->op) {
>>>>>       case AMDGPU_GEM_OP_GET_GEM_CREATE_INFO: {
>>>>>           struct drm_amdgpu_gem_create_in info;
>>>>> @@ -898,6 +903,21 @@ int amdgpu_gem_op_ioctl(struct drm_device *dev,
>>>>> void *data,
>>>>>
>>>>>           amdgpu_bo_unreserve(robj);
>>>>>           break;
>>>>> +    case AMDGPU_GEM_OP_SET_PRIORITY:
>>>>> +        if (args->value > AMDGPU_BO_PRIORITY_MAX_USER)
>>>>> +            args->value = AMDGPU_BO_PRIORITY_MAX_USER;
>>>>> +        ttm_bo_update_priority(&robj->tbo, args->value);
>>>>> +        if (robj->tbo.evicted_type != TTM_NUM_MEM_TYPES) {
>>>>> +            ttm_bo_try_unevict(&robj->tbo, &ctx);
>>>>> +            amdgpu_bo_unreserve(robj);
>>>>> +        } else {
>>>>> +            amdgpu_bo_unreserve(robj);
>>>>> +            man = ttm_manager_type(robj->tbo.bdev,
>>>>> +                robj->tbo.resource->mem_type);
>>>>> +            ttm_mem_unevict_evicted(robj->tbo.bdev, man,
>>>>> +                        true);
>>>>> +        }
>>>>> +        break;
>>>>>       default:
>>>>>           amdgpu_bo_unreserve(robj);
>>>>>           r = -EINVAL;
>>>>> diff --git a/include/uapi/drm/amdgpu_drm.h
>>>>> b/include/uapi/drm/amdgpu_drm.h
>>>>> index bdbe6b262a78d..53552dd489b9b 100644
>>>>> --- a/include/uapi/drm/amdgpu_drm.h
>>>>> +++ b/include/uapi/drm/amdgpu_drm.h
>>>>> @@ -531,6 +531,7 @@ union drm_amdgpu_wait_fences {
>>>>>
>>>>>   #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO    0
>>>>>   #define AMDGPU_GEM_OP_SET_PLACEMENT        1
>>>>> +#define AMDGPU_GEM_OP_SET_PRIORITY              2
>>>>>
>>>>>   /* Sets or returns a value associated with a buffer. */
>>>>>   struct drm_amdgpu_gem_op {
>>>>> -- 
>>>>> 2.44.0
>>>>>
>>>>
>>

