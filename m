Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1743AA4F7BC
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 08:15:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8404410E6F9;
	Wed,  5 Mar 2025 07:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1+WEupXJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A639310E1B2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 07:15:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7nhI4MvG31CeaY3QW0lY+DlF5GNx1cwKjVSLHqwEIsk65ndW7p/ghghqePmlllCf0E2h6tIVNGlPQpuJQDTpBWgLa0VXZ30GB3gaBHGbhXR2MOm6izFoMedwt/cBRh40yV2YymfDz07I/GyGpYXx7BTCAUDKcO/+2vzr9L/drLbVXf02VJ7iKsPYSvRQMWJQ2Ln1ic2s6QJPIiX/gtIFGnNEx9fRHOKQNJO5d/MhIO1r236sta/3jGwIPW0+s1H540V6aZs/NK67hF38x3uIZTWZuMoOltrXoyvzXtprQhxHQTj275h1vI+LH0jiBpo774ii7MhMhC5ve2SiMxD/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k04cDoP6jTpFZvaI5DPqsScgl+2b+2AfMm4JxjmfYtk=;
 b=HW3GugZFMpOP1gzvTwKkBY4bkCZzraTr0thYUb23T4IZwrwCn7y+ktFwjsryhGtENc83nffwXd5zJ58M4krkc5l9rcnRynr9i7YRGOuKGPeMTgbKNm1jq43m3iXJUpMaT2k6p0JF7wz/0FV8N4jECDG14LTwflNl6BLxYKj6WI4zckFgb4ExNcL7BB7EZLLrUxsqaL1JjDeafNItZC/6F3II3kva/PG96V1LR8H5kpDoGpQ5NJGI3L6ObAe0BqptcJUgj4vJ0y2HCM0wnDy1tGdJ+bQoYMP3HCKvhR3KfX2hzI0AeXY+REhCO5LuDMRmEBf1caN/R4L1wA6ohno1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k04cDoP6jTpFZvaI5DPqsScgl+2b+2AfMm4JxjmfYtk=;
 b=1+WEupXJl/OkxUW7Wgd4zrlrcJhcRmbtQcb8CZzJjkZIE28RZtHjFHNVkR9xA8syTPBvDRCFeC8EhhmUpCj4rQIHeHk4YRfePKQ03z8QyUFNyqKADctsE6w8kDHmw7Q97KFJizla8Yit/+Os1S2A0+KU8F/LCsc7fs9n19u0Fa4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.16; Wed, 5 Mar
 2025 07:15:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8489.025; Wed, 5 Mar 2025
 07:15:40 +0000
Message-ID: <3a30ceb5-f815-4619-a21b-5e2d3c5c7e94@amd.com>
Date: Wed, 5 Mar 2025 08:15:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/1] drm/mm: Introduce address space shifting
To: "Lis, Tomasz" <tomasz.lis@intel.com>, dri-devel@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@amd.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Micha=C5=82_Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
References: <20250204224136.3183710-1-tomasz.lis@intel.com>
 <8ad4e4cf-1b4a-4e08-b880-266399c3e5b0@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8ad4e4cf-1b4a-4e08-b880-266399c3e5b0@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: aa5473e4-8e82-4829-8aa0-08dd5bb58928
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnBaeEtKN0lnNUFzZ3M3YmpFbC9tN1VpVHNFTDltVy9MbHNGQ2FsVlI1R1Iw?=
 =?utf-8?B?MDlQSW9hU3grWWkyV094b1dVUGZTR3hoMmpKd2xUNDhDN2FaT3BNbmI0cTFO?=
 =?utf-8?B?QVhyWTRuOFliZEg1UHQ5K1dhNVlmRDJUZ0JZVDdIaEJJeXVRM0pYY05aYmhX?=
 =?utf-8?B?R2FIK0JsR01SOGtyL2RvSnpYTjJRRG5jSWM3VFZvUUFocitSeXRWaENEb3N0?=
 =?utf-8?B?SGNQVDJjbm1NQVhzMFVNTkxKVjlIcndpQW05VWgreXJ1Z2IyOHJMbi9oMzNG?=
 =?utf-8?B?dkVQbWU0V1hjN3RLRHNhRDFidmI4VTY3cHIwTmNNNURQMTRDd3VLU2xMM1RC?=
 =?utf-8?B?cURRL2JBS1dWTGFHT3BlcXdBK1h0anowL2dZYW8vRmdqdTZlc3VtM1dmTFVp?=
 =?utf-8?B?NGdwM0hRZTJtY3hoNWlJdEtlU0dtRkcvV0RNLzVnZjUrU045V0JuSzRjZ3Z5?=
 =?utf-8?B?ME13RXJDUE96cURjZ2hHRzRiTWVSSitkUGZjZVlDaFpEMnJjSzNCbGJRU3N5?=
 =?utf-8?B?T2d1RUw4MlNJL0tlTld3c2hZQlBwMzdqenpvblhoQzl4WWRQMVM1cXN4OWpw?=
 =?utf-8?B?blAvci85YUdLZFMzN0Q3elVxcDVIdUtmRGdjbUZuT0lneVdxNTdrR0M4bW01?=
 =?utf-8?B?SWE2THRscG4rU052MllPdHhaaTJ2R2hYa2pxODVxWXVUYnNEV1gydkNZNVl0?=
 =?utf-8?B?NHBabXd2aEJGQ3FFQVJwVnlGeXRNdVV1akJkVmtZWEdwM2VJVnF0cWFIOUZs?=
 =?utf-8?B?Wms2RzU4Zkk1d3ZUNWdiR0Vld2V2dmpiS2Y3NDM2R0Z1akZHTlByL2l5TkhU?=
 =?utf-8?B?NlcxbnJNMFo4L2l3aWdwQTI1MVc1dDd6Q0J2RjJlVW5oY1ROcmh4clhPVU16?=
 =?utf-8?B?NCs4MHdzSFlEVWM5eFlNd0xrR3RFUDQwSk9YcGFWMzFobFZ0TnppK0pkTUM0?=
 =?utf-8?B?MHg2MTBEbTZSRG9FWEtrNUtvbU0ySTR6elZrWXBSNk9nN1RNNTdESTFSSjRB?=
 =?utf-8?B?KzFIZGJnNERjbmJBcWVNVmNLSTVYS0hKdHlNL01xcHhTWVVtdWEvL2dvQmlZ?=
 =?utf-8?B?eFVZV3hYZUE5OE9WUzd6NnVnQVR3bU9CS2ZWREpwZWJPSHZ2NDhmZTY1N3VO?=
 =?utf-8?B?bGFVeWNHZmFVdkkzM3YxQkZCZ3IvVklEbURUdUN3MnVWMXV3eEx0ZEVBK0RH?=
 =?utf-8?B?ejR3Z2E1RjhOUlVVV1ZVSWp4WEZHTTg1WVhsR0FZcHo2T2xEWDZMM2lhYnVn?=
 =?utf-8?B?b2JnS3FDd3FLaFczWFBYemFkNEtaWEphMTRWZ1I2aTgrMkFtL1BDUjJFQnBm?=
 =?utf-8?B?c0czdW5wSVJZMnlsWkxLQWVzbVhEOWNCUmdmRHp6QzIvTnJtS1dnSEx6cUIv?=
 =?utf-8?B?VS9xNms2alpWZ0duUUp2WGdtQkNNTHRjMEV0b21hbTNSSGNKT0VTSHh6QTNn?=
 =?utf-8?B?SnBoTTM3QVhTNTNDQnMvdGJhYmtQVkU1VTRhV3pXMXA2TVh5bHovd1c4TjN6?=
 =?utf-8?B?dm91WFhtVy9hSFZzcXdPNEhRZlVhaGFCMHpGMmViZ0M1OThjc1lRSmtOZFpq?=
 =?utf-8?B?YmVtRC9pTEh5M3FyMVpDb3lndUFqSFpRQUJ6dHc0WXVIMkFyYll4eHMveTJS?=
 =?utf-8?B?QzF4N2MzeFRLdzVlZEl5S3pWbURVOTNxZjE2YzVCT0RhUG1ya2pyazdEWEtR?=
 =?utf-8?B?dGdKOGx5bXcyVjd0NWxmUlhLd2U1YW5peUdTaGl6cVRFc3lPaUNobS96emFx?=
 =?utf-8?B?cnZvd0hzdGNJNTFPMnBwWEp5dTZHT1UvRXJIWVJOWUVoczFkaFg4a1dZdzRZ?=
 =?utf-8?B?SDVsb3ZDUEdhOTBKTTJxcEVySjM4YTJtREN0dTdiaTJ2aEluUTgxNVlYTk0w?=
 =?utf-8?Q?FQ3P+2uq2oWU8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzNRR2hQZVNmQ2JrOS9HaUpjUXdadExSN1kvQXJzMnNJaTB6RTVEYnNrdDdv?=
 =?utf-8?B?dFRCK2ZzVXBSUzZDZTQ3eGJBbENtcWQ1UnJBTGZ3RkxubU5MSFI5bWtVdmdP?=
 =?utf-8?B?NU9qSzg1YXkreVBGVVIxVTFiWDdlaWZVT1A0VEpTRkVOQS9hRm5aVVRML0lC?=
 =?utf-8?B?UUk5Sm80UlQ3aDdWamlKZjlxY3NSR1hwMnR4REYyaGZ1T0thTmtEaUlVSGJE?=
 =?utf-8?B?TlpwaktkK1cvcDA2QTJ1bStRUXZDSHdRQ0JWQzArRVcrTFZzZG5BVDlMekZh?=
 =?utf-8?B?WWdlOXhsWVBZdkxLeHpVTzY2ZUNXT25VUzQwUHZJVThvdEFqTmdLZnplbmNh?=
 =?utf-8?B?R1Nob2VIWVdTbXFIQ1FFbGt5cjdzV1hHWmZyY1JVb1ZKQ1BXL09mUmx1c2ky?=
 =?utf-8?B?dWZaaitIeG9BekZEYkpPdzRUR2RZU0NGZWIxdEg4S1A5RkR6WDNNcE9pNUVC?=
 =?utf-8?B?YThBNGVPdVp4NVNBbmRMMGUwK1V1eGg5T1Z1MzNWSWtFUFBwOXRhV2R2Mzcw?=
 =?utf-8?B?QWtyOHQ5TzZZdlFRN3k5QXdFTWdobkRoME44U21sMW53djJocUpQUnQ3aXdO?=
 =?utf-8?B?bUtpV1hhandZMjRoRWtGY2VWM0hDNTR4bDIxQ1g2UnhYS1FrM0V2SmUzeTJj?=
 =?utf-8?B?RDFaZUVHNXVreGR4a0ZXYS85WDdqWVJZbmJEUjIvY1lKdWJtMjZTS3orNnVu?=
 =?utf-8?B?N0pjZnM1cHZITVpjclE5Z01EaWsyaU5CVU9ML1o1MjJCUGxKU29DV2VET0xV?=
 =?utf-8?B?NHd6QUprWDFwNmxsa25sWDYvbkh4azFCdFY2ODdMUDhGVUFBZ0dXdEgxdEd2?=
 =?utf-8?B?MUV1cTBwbCsyRnc4UmNRT0t0TDg0amNES2laR3VxSFRsOHlnbGtiZzZFaExz?=
 =?utf-8?B?VTc1VUJlbjdkOXZsV05BR3Q0elp4aVJVaWxjQ29Pa1pmdUgwQzFLU0V3bFNI?=
 =?utf-8?B?TXM4MHJBbzRFWStRRFNpU2FsYmhldytmQ3FjbzJXSDVxbzZWVjVCRXgxT21T?=
 =?utf-8?B?R2YzYnZRYzE0alBmRGJTWnFHK1pibXFrYzV3TEZEYU5zZUEwbXRYTWpiOU9z?=
 =?utf-8?B?V0FEY1ZwV293ZGhnQ0lhYXNhK212c05DNmFtL0FGeGdtYlJ2cGVJeHZjcUg2?=
 =?utf-8?B?cWxVRDhRTTF6cERoZkEvcktkbnh1Q0NhZnhUVkdsWVI5YjM0V2txZnN3c0t3?=
 =?utf-8?B?VHMwSTJIbHg2NjNvT0VuNTJWT0NsSStkdUFZVjdabk5wTzJvTVQyOEpscUlR?=
 =?utf-8?B?RkpMQjIxblFMK204RFYyaXk1emhpbGFYSDlIbWpxS2ZIdzlxMGFiL05oakJQ?=
 =?utf-8?B?b3NyT0tYOWcwVEVHN1pFampGWkQzNlkxSEF5N0g4UnZxQ1dGaFphZFBxVDhS?=
 =?utf-8?B?a0lzNGlvRm11NGxHU3dUYW5hNHQwRk05NHVXSkpOUy9zQVZIbEJ0ZWg4TW1I?=
 =?utf-8?B?Y01OcHBIL0tZKzZsampRZTV5c1dvaVFLNnJDLy95akg2Zlg3UXNaaUhacUMv?=
 =?utf-8?B?azNmMHlkdEF3WTZBcTZHV1l3MUkxSFh0WW1DRVRIblVXeWduVzFpWjhFOFdz?=
 =?utf-8?B?M1FkZWZYa1h1ZVltT3dEeXREeE9SS2NBTWpXQ1NHaURaRmlLUi9vMzlISGZa?=
 =?utf-8?B?ME03bWUrWXpub0Zmd2M2T0ovcURBUjZuRjIxSWFGRHVVWWZLeTVnbnJGUzFJ?=
 =?utf-8?B?b2ZyMnExc1BZaWF1aU5ZTCthalN4Z1NaRkY0M0Q3eEM3T3F6OFpJWEJHQ3JL?=
 =?utf-8?B?Nkt3RFl3UlNwamxtTXZIZlR4YUptRUJMWXloYzMzWC9EWmJjcjNvRHpLQWdK?=
 =?utf-8?B?eXl2T09BY3JicElWK3dmRlpjZ2k0RncwV1ViY21ocXVBdzVuSUhCWllQbDdT?=
 =?utf-8?B?QmdlUGZFREYrb3djQk15cUpTdlFtZGxHOG0yTDNwekVmOGMwdW1zRys0ZUxa?=
 =?utf-8?B?NWVJTk1MTmM3WE9idlh6d3d3eENVS1puWklic1pHeW56Mm5FWldvbm9ndTQx?=
 =?utf-8?B?SUU1RndydnJ6Q3BYZjE3WFZtM0lVc1dTZU1FNzQ0aHNOREhaWlc1NUNQOWtq?=
 =?utf-8?B?SHMvbDZWUEY0U0IwcllrWmlXK3VDUGNLL0ZFTUtLZUxzZkMybzlRVFROd0JM?=
 =?utf-8?Q?ubG0Syy5aSFdQFC3U8YqU0/QO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa5473e4-8e82-4829-8aa0-08dd5bb58928
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2025 07:15:40.6177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Pfwqh7exi9nw3FkChHcLLZzRrOV75alelcSlAGEuh53JtmJRxGhqlLnx90EoUI3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
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

Am 04.03.25 um 16:39 schrieb Lis, Tomasz:
> There was no NACK, and no further questions/comments for a month.
>
> From that, we conclude that the proposed change is considered acceptable.

Well there was also not any comment from Arun nor Matthew who are the de facto maintainers for this particular code.

Saying that the whole change looks completely unecessary and overly complex to me.

Just maintain the offset for your VF separately to the drm_mm nodes and you don't need to change all nodes any more when that offset changes.

Going to comment on the other reply as well.

Regards,
Christian.

>
> In case anyone disagrees, please respond now.
>
> We are starting work on a series which will use the proposed drm_mm function.
>
> -Tomasz
>
> On 04.02.2025 23:41, Tomasz Lis wrote:
>> This RFC asks for introduction of an interface which allows to shift
>> a range managed by drm_mm instance without repeating the node list
>> creation.
>>
>> The long explanation:
>>
>> Single Root I/O Virtualization is becoming a standard GFX feature
>> in server environments. Virtual Machines provided with direct access
>> to virtualized GFX hardware, in form of VFs, need to support the
>> standard set of features expected by Virtual Machine Managers.
>> These standard features include ability to save the VM state, and
>> later restore the VM, possibly on another machine with different
>> setup. For the restore to succeed, the GFX hardware model must match;
>> but for its configuration, some differences are often allowed. Such
>> alterations may include a different range of non-virtualized
>> resources assigned to the VF, including global address spaces.
>>
>> If any non-virtualized address space is saved, as part of VM state,
>> on one machine and restored on another, it may happen that the target
>> range differs from source range. To shift the address space,
>> currently creating a new drm_mm object is required, and moving all
>> nodes to the new object while adding the shift.
>>
>> GFX hardware handled by Xe driver contains Global Graphics
>> Translation Table, which is an example of such non-virtualized
>> resource. Should this interface change be accepted, a series which
>> utilizes this interface in Xe driver will be prepared.
>>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>
>> Tomasz Lis (1):
>>    drm_mm: Introduce address space shifting
>>
>>   drivers/gpu/drm/drm_mm.c | 24 ++++++++++++++++++++++++
>>   include/drm/drm_mm.h     |  1 +
>>   2 files changed, 25 insertions(+)
>>

