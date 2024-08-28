Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336D99633E1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 23:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BE410E04F;
	Wed, 28 Aug 2024 21:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HBpym8/U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7645310E04F;
 Wed, 28 Aug 2024 21:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3ZY8Z1DT/3vijeScpNtPC369Na8qSUqEwaf/wJWyPaEiIRtnaq5F7zM+kLvOTriI+BBNPMFZqyn0UqiI8MGRit9s+eX67D2WA6e/3YlaNXi43z0KmnYNh5/CKxi9esoL0j17RMeD09NUZK4cfJ66fdrnrxEE9zVpMMazg4tz65SeeNQVEn9Tx/MpnR/VCKH8JK3Xslgwv0OtftK3l2LOcDRT95s+zuNTYqXmg83rvGCAcJuyXE0yhyjAqTAHYkhknQxaVofKGK7mYQNnwRr7vIaVJqb6j3tYqRlRNyDrqbHjqYQVek8cQl47XYgTV9HW5pXOuGQtylexbNtYx144A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lqi2dH5FnQxRgXsuaNMyNeMRqxau6iTxhzsUUuxiwNE=;
 b=dxYtLScL1JLssXz86tuAowSpEtZf1tdOtYMd+v/DGp1bnVSGKamw4fKKEHD+ZeOu2Sr973z34WZtDISHohZCuKQQ7l1JabFATJSqhB5UuL3LZ9lMSeNiIbk7YqgH4HbWW9Z+T7oz9V7mx3P6Pyc7963V1JPekV/syXC5C5CjmW5TqFPyDA/FGBIz59R/FJIBiihQc6sNJYOhBpzTiMTs7IlYo1EPxHfSUadXgIaq1DJ6q7H2Hfm1Yd9mmcTwuekjya8uQSS1T4iqKN/SwPgIZKvuRcJDkdB5LOZpUXQp5mLDt2ueHzyOX1ssficLVXr6w6O8xIoiCx1Uif1EC0qy3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lqi2dH5FnQxRgXsuaNMyNeMRqxau6iTxhzsUUuxiwNE=;
 b=HBpym8/UpU/NOC3CAGrHvN9dRTPeGt67shndUIiUL/u5PGY4jC9V/La4KQQK0AnqbzzF1rfzC0y6EYD6f2a/AD7U4wuIUif6DqattB6Adba8c3Ov1+xcd9ouEJ0uxX0p99CCwqbDjeESb1Z0w9iioGhqQTDjxTNJmisNcrcoN2k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6095.namprd12.prod.outlook.com (2603:10b6:8:9c::19) by
 PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7897.25; Wed, 28 Aug 2024 21:31:13 +0000
Received: from DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405]) by DS7PR12MB6095.namprd12.prod.outlook.com
 ([fe80::c48a:6eaf:96b0:8405%7]) with mapi id 15.20.7849.023; Wed, 28 Aug 2024
 21:31:13 +0000
Message-ID: <cff255b7-3f06-45b4-949a-8873562782e9@amd.com>
Date: Wed, 28 Aug 2024 16:31:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: Alex Deucher <alexdeucher@gmail.com>, WangYuli <wangyuli@uniontech.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch, lijo.lazar@amd.com, le.ma@amd.com,
 Jun.Ma2@amd.com, hamza.mahfooz@amd.com, andrealmeid@igalia.com,
 wenlunpeng@uniontech.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 guanwentao@uniontech.com, zhanjun@uniontech.com
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
 <CADnq5_P42A81D_VufAdSkwVwC08ZRiT=6XAS3oHmSH325ygbow@mail.gmail.com>
 <D25D5E6FB683DA94+808c82a3-546f-4289-b531-fa24d7278879@uniontech.com>
 <CADnq5_MJTTX0koP7am-D0RoZro=0_e38ic5BoJuKhbyM6y-99g@mail.gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <CADnq5_MJTTX0koP7am-D0RoZro=0_e38ic5BoJuKhbyM6y-99g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0018.namprd11.prod.outlook.com
 (2603:10b6:806:d3::23) To DS7PR12MB6095.namprd12.prod.outlook.com
 (2603:10b6:8:9c::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6095:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: c08f58d0-dad6-4fbd-507d-08dcc7a8bdc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L280cU56dXAxQjF2R3IzbHFDSGdBZzVrRStXT1BxUVJEVmRoYWpqdGFmYzNI?=
 =?utf-8?B?bmQ4UUZaclFVb1J1Rk9wNlZlMDFjeE5vQngvMldnY1Z5SDJEYTNnaWJyS1FL?=
 =?utf-8?B?L3FUd0E3RlJSbm41c3RaMFRjc0gxa2pUdDRXNTlNL0MwTnIzTnZKT3JzSVZN?=
 =?utf-8?B?aGdENmNVV2puZ25WZkJiRURVaGxiS3YyVmtHSld3bUtVa2dSekpnQWJwd3dB?=
 =?utf-8?B?WFBrb3RobTRSZk8xTG1uU1orbGtZNEFQS0tkOWRPM2diSGVDL0tOYm9lMVov?=
 =?utf-8?B?MlowazVMQkhTWEJXQjQwdGpMUHNjWW9YWjNObXgyVDByK3VxL1dkYkRRZzl2?=
 =?utf-8?B?L0R3TU5PU0NGZ0sxM3Vxc1VqZVBTbFNKSCtGdzhTR0JVdDJDb01YOFB2WUhq?=
 =?utf-8?B?a0swSTNDT0Uwcloxdk1oNkE3T1l4SjE3SDJmaU5jME1sMzZWcjBxdWthZ1pL?=
 =?utf-8?B?S0N4Y3RKV1RER1VWWnNqYVoyYnN2UG1oSVpBUTJOWTFVdW9lcnNGaUFlVzlG?=
 =?utf-8?B?bFZzVWtVV29YSXRHdFpHaEpiRnptVFNROGE2NjUvSmtMRGNFTTE3ZkloWVk1?=
 =?utf-8?B?M3Fva0k3ZkVzaEN4RW11Ni9jQ2hBZWpuc215T256S1NkQWI4WjBPWW9FUGpu?=
 =?utf-8?B?a003bllqeVFPajREVmt5TTNGY25Tb1U3dVRFekdSWENtQ2dwZjc3L1FJMU85?=
 =?utf-8?B?MWNpYXQ0QkNWK1c1L0EyNXc1ejdBdXR6Z2Y0WUpKQUFINWNyc1B1enl3Sld0?=
 =?utf-8?B?M1l4dW1SeTJuQjhjU0VuM1BWdndXc0FvZGppRmMwenRpSXVxUG1qckVPdlFD?=
 =?utf-8?B?eFZjcjBhSUlYTExEVFExZERYMTZMakpVL1YvLytOSUdTZ3RhUkNiR1NyRnhL?=
 =?utf-8?B?anNIVEV0VVJseldSRFFuWjhSbmpMNk80cUxKMUpLWEEwc3lWOCtGOEZITkdM?=
 =?utf-8?B?R3RFdEVXdW40aVlNcnRFc2JSRzRzTmFuNEJSai91YzZYUXl0Nm5jSHh4WWkw?=
 =?utf-8?B?b0NKbUxLd0EyUy9WeFlNcmNZbHkxT1NvQTJuVm01bnREYkRGR0hNU3A4b3N1?=
 =?utf-8?B?Nkt4akJJZ3l5cEg0TGZyOUd5b3lPUS9URldIK24wU3RNRFBrNEJ4RG9yRjUy?=
 =?utf-8?B?bEMvUUszM0xXNnJzNDZId1ZKTFROcWw5NUNlOC9TRnNpQVQ2NHRZMmdrcFVh?=
 =?utf-8?B?RSsyWVNWUVlwNEtHM0tLUXBhR0lxTDJyWlo1UlhHZk05QmVSRkJudTlrYXZ0?=
 =?utf-8?B?d3RjS1B5Z3dhek5CaGtreFJyREl5Y01LTUdKRkk0SHo5NzBCeWRnbVFMODdO?=
 =?utf-8?B?REFuTFp4N01DSDlhdzM3V0ZYOUNhOTlKbWt6eXdkT1BIZmVCalhtQ05TZkkx?=
 =?utf-8?B?YVRPS0dUZElTaUhPSEhQSUgzZkQwdFAzc1JhWVd2K0NtMHlpeDd4eThGelJh?=
 =?utf-8?B?dGVka0ZGZmRwUEdZZDEwMks2a2lMbHNEeXhHa0lZTHk3NjMveGlRS2N0QUNF?=
 =?utf-8?B?QWJSK1BnRmFvYlo3dC9UbVYydjFHTkt1eHJTdlRVSi9QcUJTQUNxWXpvNTNP?=
 =?utf-8?B?VFE5WXFQVHhKMSt1eEVaNk4vMENRRENGTVozS3FwVm8wOS94RWo3bGtzeDQ1?=
 =?utf-8?B?Vjl2ZTQ2YzVqSUM4T2pwRjZ3YWptRE4vL1FCc25VdWxyYjF4VG5aZEE5bDZK?=
 =?utf-8?B?ZnVYRmNDMzkvK0JWaUExTzF2ejdra1FqclhsUlF1TDVuNE5SVHZwNk1FVE5N?=
 =?utf-8?B?Y0kvb1RKZmhvblpxMWRFWm92bFhOeWk0alVEZjRPdjl1R0ZIbmdWNmpLaWln?=
 =?utf-8?B?YWRSQ3lURkhjRUVrRDRRZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6095.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmJJYkRtemFhMUI2dU5ScHVYK2ptanlyUU9jd2VvZUtZdzg0SGRCbkp2Qm9G?=
 =?utf-8?B?S3NYTkZCU0dRMDIxV0hjcGdFQW5POFBjR3JkOEJHUm9oaDY1bXV6ZjFablFK?=
 =?utf-8?B?Z0JMeEh5N2ZScVNDRFM1ZkNEamo3L3JHcDZINWRIeFhTVjA3VXNpVmhwdFRh?=
 =?utf-8?B?VWp2cmJ0TnBrR2syejJBUFRZajM2QVFHYU9WZWFsaU5JM3ArQmwydFBvL3J2?=
 =?utf-8?B?a0hMYU5GYlJOQnRudXVUKzYzL3RMbTFZQytZM1NYZjVVdmVtZjFqdCtKRjdi?=
 =?utf-8?B?RU1xVWlvVC9xRVk2UzhYeGJralhmeEVBWTUwc25wZXFSa3RCM2tjcVVLWHFm?=
 =?utf-8?B?dEpybVhsZ2lMeFFRb3NoYTJwSENSdEhaeWFPTTFvL3M0Z0lJektSWHM4WXlE?=
 =?utf-8?B?SlVlRVZnRDZNU3A0akZETmRPWlJXZVh5dFdualB4QnJNT0NHTEtBZDFscHlR?=
 =?utf-8?B?UDc2WHhUQVh1YmM1bDB1VUh0VjkvYlBQYlRKYWszZEtXT0ZIbDFBYTNqbFlX?=
 =?utf-8?B?L1lPTmZuQjUvYU1ENjJjbzlXalhGV0g3eXc3ME84Vk45QUVsTzg5aEQ4ck9s?=
 =?utf-8?B?eWoxN2VrdUVrRDJ3RC9sNFByaTg0bnFBZTROVlF6emV0cnVHdEVrK2lCYmlY?=
 =?utf-8?B?VXhCTmVLWWllbFdDejFQeU83N2hVUDR2MXNFQXB1ZHBudFQwTGpvZzdtNHZo?=
 =?utf-8?B?SkRQVnNTSFpVZ2RrNlMvaEdqdnY2Snl6dDdNdTk5YitoQ0FRb3Y5MEJ3QnVI?=
 =?utf-8?B?Q2hSdHlDVS9zcTlWL3Z6RnlxNWxuMDZSYzJCTFdTTWJHclpIN01jMnFTazZH?=
 =?utf-8?B?NFBBaC9ucjFFUEZBd1JlK244TGxsanRSTXRicDJQT20wSDZUeVlHQm9BMVRh?=
 =?utf-8?B?ZG0wb0VNa2JReGdSQUkyWUNyUzhGQVhlVmgzWEV1THpnQ3J0VVBrYUh5NDE1?=
 =?utf-8?B?MDc2akg4MkZ5cFNPS0pyVm5hNUJISUJGS2lxQ2hxWGhJcmRiYnZuWWxnOFZY?=
 =?utf-8?B?S3d3OEJ2RGF2R3lwck9IWXg0U29nNVpoZjkzZUFUanNkR2ZCbzlqdnVnL3VG?=
 =?utf-8?B?clduUDNuTGZyMkRGYU8xa2llSEpsMFJEam1taTZtalJkaWlKUUVjYlREbE90?=
 =?utf-8?B?SVA4cHBTUEUxWExuMm42SStCdEZaWHRKTDBLOWlGbEgvLzJoUUIxQnVGZU80?=
 =?utf-8?B?TWlpaytDVG1xQWVxYUVtVGZzOFpHUmFZVTFSSE5hOEZERXFreC82UC9jUG0z?=
 =?utf-8?B?VHdqM2s3bWVpUVlIbmdIOEZuOHR1Ym1tcHJjOWRkb2xWNHlvTzBvVERkMndp?=
 =?utf-8?B?MlhGOHJLR1J3eER3WVBMQnlwYmIrYjdldHB2U3Q1dVNUelowbi9NSGpVY0xM?=
 =?utf-8?B?blh3TmRSK1d2cHRDUzJ0MVhzOEVVT0lDWDRtY0wxbzB5UkZoYVBIMkNQcGFC?=
 =?utf-8?B?TjNkQkhjaUI5WFlPcjI3dkZ3emJHTDhuUGdSWGxoWlJEMHNnMDI0R1dCaU1n?=
 =?utf-8?B?ZFB5d3VSWHJuVXFXM3lpRXJYdXh4NTVvQnFNZU13NENIdnBOUi9XTkhkZDMx?=
 =?utf-8?B?MFhqS0gyYnA0YzNxajV3RWxRNzk0RDBaemRwTWRTeS9UL1BQK2ZYd3FIOHZG?=
 =?utf-8?B?NkdPdVNPQXJGMkYzdC9zazgzazYydWVvRHhKNTgyUy96cGZuS3hWS2s4dEp5?=
 =?utf-8?B?UGt0S0dQS2I1RzgwUHpCbjBsTmo2bFZvdnE0L28yWFN4QmhLOVNsRjIraHh4?=
 =?utf-8?B?M1pJeWRpMW8wWmlvRkQ5V05KeHJoYlRCMCtCeXBYMEZOb0g2N2xlK1EvUjMv?=
 =?utf-8?B?cFgrUDFERGdiUlhUdkwvR0xCTHh0QjZkaGJ2b2phdnJSazZpN093V3JURHJo?=
 =?utf-8?B?Y0ZEMFRseWxvQWRZVHQvYzFuVUZndUpHVlBzMDAybVdDUllBVmlBQ0Zxb1M2?=
 =?utf-8?B?NDh3RjM5aitxSlBRZ1RvTktnR3k5NVdPWHZSd01ESVpVVFZTVy9iWE5leHk5?=
 =?utf-8?B?TXVMcmRnSnptVFVaUzVDUmEwdEVIbllmSkpXWmExNlBKelc1M2RGVzdzbnNT?=
 =?utf-8?B?UmNkZG8vS2R6RXkzZFpEU2RSUFVCN3RNNW56aFV3enBQdnhidW82enU3U2pJ?=
 =?utf-8?Q?ZplPADTqpWpXdN1ZUhGvzH4wG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08f58d0-dad6-4fbd-507d-08dcc7a8bdc2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6095.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 21:31:13.3627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YhhWd5SKuNRoVZNb6Pq36S9x47LdHJk1R4ybUEdsjYtiOqzEPoIBfy9uZKmu74SCXmr+o3KMUwTOf1PLTHEdnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202
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

On 8/28/2024 11:14, Alex Deucher wrote:
> On Wed, Aug 28, 2024 at 11:47 AM WangYuli <wangyuli@uniontech.com> wrote:
>>
>>
>> On 2024/8/28 23:30, Alex Deucher wrote:
>>> On Wed, Aug 28, 2024 at 7:28 AM WangYuli <wangyuli@uniontech.com> wrote:
>>>
>>> This will disable dpm on all devices that you might install on this
>>> platform.  If this is specific to a particular platform and board
>>> combination, it might be better to check the platform in the
>>> dpm_init() code for the specific chip that is problematic.
>>> Additionally, disabling dpm will result in boot clocks which means
>>> performance will be very low.
>>>
>>> Alex
>>
>> This motherboard model doesn't have combinations with different
>> platforms or chipsets now.Their model numbers are unique,so it seems
>> unnecessary to add extra judgment.
> 
> The error message looks to be from an SI board which is a dGPU.  Is
> that dGPU integrated into the motherboard?  Does the motherboard have
> PCIe slots?  If there are PCIe slots you could presumably put any GPU
> into it and if you did, dpm would be disabled by default.
> 
> Alex

I would also then question whether the SI board also has failures in 
other systems.  If notit could point at BIOS bugs with the PCIe 
implementation from the MB.

One thing that you can try to do is turn off pcie port pm using the 
kernel command line and see if things improve.  Some motherboards have 
had issues with this in the past.
