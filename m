Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2387C7B4362
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 21:48:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0481B10E180;
	Sat, 30 Sep 2023 19:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29A1710E180;
 Sat, 30 Sep 2023 19:48:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PvGZCtRo3Ehk+CmGkai4gbbfPv8X8IrN5BSI4fe1kt6bVTIF5l8LJDmCXPRwoT4ccK61osTS58N4dRV48W0M/3/Cbzd+i3Ataa3MwTYhcS2ehehpLacuZuy/3o6/a0zsGyYNo3tagj4EPY9i4uDHSE7XEow4sBYoCAKliBzxEZWNABAiAZyvL8ztiFXN/jXzy3J1xaba0EjQX3pTWB0GAY2Voq/BOZLaGUbpTCzlJRk7dAT+5eCarJz+Jks44PV5Dhq0qbBOznXFe5BlHgkQLNYLChReALVWwoRMKURSN8yhdgsADcfCBnfCM6WQ83C046s6+ncdFakwCFWPbstC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xynEcB9WBTisMvwE4QZg6NhUpgBrbV0ao6VWbSG+eL0=;
 b=YSW4Qhj8MjRVvn7OPZumA2MtBT7fyFuxa07aCcPlk3XBcTIhBx1uy+h+2cXHd5bR7mgyq0hvlL+KgoxNSk4rvp/FdvK4EU+R3ENTOrm3ZA3vFq6onp9LbxtFO0vKAxNYd47xFry51C25QnBQK33piotPlWosDozhSnROZxzmmBKTunL6xICSMCpIblJhWg0I7+As+AaFPB0I3h2DfFI2rFVYDchO1J5i684lkhe4UPuUZH0wJgjoUeqGpg8wvHzGBeXr1I3LniO4ntzPcToS9DCj5itGl6BhEhZwUCyfjhJ0nME4gI08ry+wr5KAcbaTajrPNRCYUEcHlXF33rePPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xynEcB9WBTisMvwE4QZg6NhUpgBrbV0ao6VWbSG+eL0=;
 b=T9BnbwdwfOaTjiDF5SeY9qK9IIDbmepxlPy0G361ZApEtub9lb28dSVA3kVRw6EHj+r5Yja+25/AEifEA3wWcBBQ5RmPewOpFm3XPeWCxMP6P0LD/yjGYJGWQXo9+MFXP0KXXtQj5V08rtAAFN8gOPGrbEbM4VZk3rin0fXydlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB9223.namprd12.prod.outlook.com (2603:10b6:510:2f2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Sat, 30 Sep
 2023 19:48:11 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8a67:3bbe:8309:4f87%3]) with mapi id 15.20.6768.029; Sat, 30 Sep 2023
 19:48:11 +0000
Message-ID: <352c6ddd-86f3-41bd-b0c7-cfe3e0cdc04e@amd.com>
Date: Sat, 30 Sep 2023 15:48:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:115.0) Gecko/20100101
 Thunderbird/115.3.0
Subject: Re: [PATCH v4 07/10] drm/sched: Start submission before TDR in
 drm_sched_start
From: Luben Tuikov <luben.tuikov@amd.com>
To: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
References: <20230919050155.2647172-1-matthew.brost@intel.com>
 <20230919050155.2647172-8-matthew.brost@intel.com>
 <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>
Content-Language: en-CA, en-US
Autocrypt: addr=luben.tuikov@amd.com; keydata=
 xjMEY1i6jxYJKwYBBAHaRw8BAQdAhfD+Cc+P5t/fiF08Vw25EMLiwUuxULYRiDQAP6H50MTN
 I0x1YmVuIFR1aWtvdiA8bHViZW4udHVpa292QGFtZC5jb20+wpkEExYKAEEWIQQyyR05VSHw
 x45E/SoppxulNG8HhgUCY1i6jwIbAwUJCWYBgAULCQgHAgIiAgYVCgkICwIEFgIDAQIeBwIX
 gAAKCRAppxulNG8Hhk53AP4k4UY5xfcje0c5OF1k22pNv8tErxtVpgKKZgvfetA4xwD+OoAh
 vesLIYumBDxP0BoLiLN84udxdT15HwPFUGiDmwDOOARjWLqPEgorBgEEAZdVAQUBAQdAzSxY
 a2EtvvIwd09NckBLSTarSLNDkUthmqPnwolwiDYDAQgHwn4EGBYKACYWIQQyyR05VSHwx45E
 /SoppxulNG8HhgUCY1i6jwIbDAUJCWYBgAAKCRAppxulNG8HhnBLAP4yjSGpK6PE1mapKhrq
 8bSl9reo+F6EqdhE8X2TTHPycAEAt8EkTEstSiaOpM66gneU7r+xxzOYULo1b1XjXayGvwM=
In-Reply-To: <24bc965f-61fb-4b92-9afa-360ca85a53af@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0083.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:84::24) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB9223:EE_
X-MS-Office365-Filtering-Correlation-Id: 89dabea5-7844-4df5-35a2-08dbc1ee2cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcF2Iu7aSm5xwi7qZlkjGNT/R4f426POg45CV82NGi7WFjZNlBuyLkkj7ytYsRWJPHmZZPl6N8dehxl+P5S8Hi/hf/CJKqrMrbiR0WOWJ3GD1I0wT0+nfOAO8Aocp92UHAyYygvnggD26aj1MBWj54xxLkRVJdSRufNALxUVZxd9ChZiIo2OpmoEEUKdhFdtcDrESAMAlyff9m78LKYHcVgE0BBpaapbwdavNkqjAwWg2xr1jRqoN5Sit25SZMcR1VcJlqMxVQ9Oeiv5nVZsTfxal03IyIQ/AGiW2FOQcxibHT6mUy8R7ougTbNyOWPG2yuYeGyzvGUy5O5Y7hqq13SfkYRA0VHIxh6gMqPcnE0xxAm6ZWcoJ0+mvh8+5QgTwIzDW5JX45FpOVgsuUv1pHRl9OXaHmgfUlUSowcb7ZV3yg1h5pydEjd2pW8xTCNyxazXSKox0HnsiZDba0BWYXVuVQ+H8l2qIFlMb68ODEoToiToqb9wqQMnT8jF1+sMnIKNhb5WwkLqxdFSPyK/cJY6Gj+c3D0iLQqJIo8Xfg5pILx7nGd0+wbH6lB7goFg5s1JHqEkeDC6lxYMj7U1vgR47HXoo96LlMNBF8y7f5akNt2qnNMlsBpgWx/q717e3jXVsDuTfgPhSiKNKwDiKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(376002)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(6486002)(53546011)(6666004)(36756003)(2616005)(86362001)(31696002)(6506007)(7416002)(8936002)(66946007)(44832011)(6512007)(5660300002)(478600001)(83380400001)(4326008)(38100700002)(8676002)(66476007)(26005)(316002)(2906002)(41300700001)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmFDYk9Tc2N5dVQ2a29mVVRYSTM1cVFBRzEwcS9VTERQUDAxNjZpdEFDOXU2?=
 =?utf-8?B?MDR5aFNpUUVoVUZLYTlBRnhQTTU1VTRySHpPSGt6dnNSSHlQT3p2ODVtM1ZX?=
 =?utf-8?B?STVMOTYrSGduc1M1UG4rZCtZakZYaTViWlN4QUZYRG9XWDVFNUNsa1B0dGEv?=
 =?utf-8?B?UWFWSFNMWGJ2Nm9JVnAxbTRrc1p5U2poR29GNDNodUJvaHF1dDR1eWpvazZH?=
 =?utf-8?B?RkdVakFkSDBid1ZGMUp5NnNUTXRCamJHSXFmWmM3MHg3R3gyLzRjNi82MWVs?=
 =?utf-8?B?eUZjVDRTMzR1UUE4MXBKdGtkWHZTSGl4d3lKTkU2RGtiZ1hSc203VEpFVHJM?=
 =?utf-8?B?VHNuVlJSL0Z4TVUzcmhHZE5CbituK1ZUZWdJbnNoMFFFa1prY1FXQ3VkV29V?=
 =?utf-8?B?OE5oNFZKdmpEcWJPamR1Y3hWQU0rTi81K1ZjaXgwQWZjdmxDblhVSHBtZ2hN?=
 =?utf-8?B?RzFIT2ROeExRNDJpcTZaeGNaNmloWEFUQ3ZabVE3SjBncVJtR08wNnQzalc1?=
 =?utf-8?B?N2YvaGpJcHBGVGVqL25JNnUwN3lWTThwd2JHV1RENFRrNWtSbWRZZVd5clE1?=
 =?utf-8?B?eWZsM29VcWc0U1EwNm8rdzVJQVhxMFlQMUFCU2FpbTlmOG9LMTl6Sm9QT0lZ?=
 =?utf-8?B?cHMxQ0wvY1hYTmFmSjJXU0RsKzVheVcwRk5PeXBPOWNBMUZ6eFZVdEdCTFdY?=
 =?utf-8?B?N0t2Wk5YV2lmb0JCZ25oRkcyN0dwRk5xOHRvaS93ZmxPL3kzd05wQVp3eFJt?=
 =?utf-8?B?ZEFWTlJDV052OWFobG0veGtlRkloUmdIYVNQaGZITEVUQmxwblZtVzZwbE9T?=
 =?utf-8?B?aElXSjFKN1FIMTMrTFdCTDk3MGZTK0hLdGhNcy8rRk1hYWhGUWFib2hRQytP?=
 =?utf-8?B?TVVGK2w3bjdCbng0Tk51bjF3Szd0RGEraWFaUjlERHg1RDVCU01PZjczNktr?=
 =?utf-8?B?N29ZV1ZzbDNnZzFsRmZrUFZWWjBtT3Y2RUZOM3dYR1NhemxoQ2pHUWoxYXhF?=
 =?utf-8?B?ejJ5TTh4ZExCWDJMVitITFAzY0czeVFTVXZVZnZxeHpGcDB2aWU1cjVxVENO?=
 =?utf-8?B?UlluTlEvSkZpY3NoWDdlS1VTRDhOaHVnYWp5dHI4eTN4RmF2cWVxZHpNVVpW?=
 =?utf-8?B?dVlMK1NYQlo3N0NRcDM2K2hzYWlJRlNOZi9VMXVRSk4wU1NwL1R3THpNeUxm?=
 =?utf-8?B?VGEyY3VqSjEvRVNWYktBZlZaUFQxanJkMlRZMDdhY2R2QWNkZVRlRit0aUoy?=
 =?utf-8?B?MjJQVi9uTFVLSzZPVDlmT1VVZTZpWllZaXBIMWplb0JabzQyNkdoK05lOUF6?=
 =?utf-8?B?ZFVwdkJwSlpCTHNDa21oTlI4K2d1ZHRqcUIvSXdVMkJKR2puL1FTcDF2Szk4?=
 =?utf-8?B?Yk5IdHdHL1JsUnlqcWZCS1A1dlkwcUIrNkxqMThZWnpoM25GYlVXYU91czlp?=
 =?utf-8?B?R0REdnViWU5OcXZ5ZnM3WGhxeXl4eWh4VVRXWkVHbndycnArck00cEk2WGhO?=
 =?utf-8?B?WHUzczJRWCtwQ01veThRMWswWHoxNk1DZ3h0cXhJendJeGRXakxjMVlPc1FN?=
 =?utf-8?B?WFhmNnpJUmlGOVZjcWF1azl6WVAvWFplYndzeGNkU2ZkN1J0NlkxUk9hdkdW?=
 =?utf-8?B?Qlo4VUY5dXgvMXoxMmt1L1QyZ0hybmNHd0JuOVN4WElNSmVCTVVHdnFIb1d5?=
 =?utf-8?B?NlNYNGpZeFRjTlY5bm82WEc4STBhNURZdmFnQVM4cUFvSk1GTmkrc2lFNmlo?=
 =?utf-8?B?OEErYXhvNmRPUkMrNUhBanNRMjlXQTlZbWNLcFFrUVBJajdINUZoYmpWN2lt?=
 =?utf-8?B?NVNRUnNleVlZTUNjcW9LMDVVeERZZG9VcnhsdWl0eHErOFB0YTZGUVBCUVpn?=
 =?utf-8?B?djlDb2Zvb2NpQXJwZTZHK0VpUnAwS1plL3BNbGpZdmJoUFcvak03MG1MR1Rt?=
 =?utf-8?B?NEFYTENEekJHQ2JWOEY0cU1jT3N3OEZQWDU1MXB1UXNZV2tLSXJlR0xSK0Nv?=
 =?utf-8?B?S1QvRVRaNGI5cUF2UElqWXYzVFdPUjZ1RlpSV2V0Z0N4dTFtaWpRc3ErRWtX?=
 =?utf-8?B?M1dlWmYySEZyTHRYNXZUWkVMcTdhb3VHcWlkRFcrUUVKTmtoTFdyL24ybEtT?=
 =?utf-8?Q?L82U7IcgUhD92iVPSx6Cnw23s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89dabea5-7844-4df5-35a2-08dbc1ee2cea
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 19:48:10.6728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EvtT92ZNxczwshikTPYz8zRKY7UKLD3zzmmzlpuDOaA6mX+5n2hbpGxJy3aQZ62P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9223
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
Cc: robdclark@chromium.org, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, ketil.johnsen@arm.com, Liviu.Dudau@arm.com,
 mcanal@igalia.com, boris.brezillon@collabora.com, dakr@redhat.com,
 donald.robson@imgtec.com, lina@asahilina.net, christian.koenig@amd.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-09-29 17:53, Luben Tuikov wrote:
> Hi,
> 
> On 2023-09-19 01:01, Matthew Brost wrote:
>> If the TDR is set to a very small value it can fire before the
>> submission is started in the function drm_sched_start. The submission is
>> expected to running when the TDR fires, fix this ordering so this
>> expectation is always met.
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>  drivers/gpu/drm/scheduler/sched_main.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>> index 09ef07b9e9d5..a5cc9b6c2faa 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -684,10 +684,10 @@ void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery)
>>  			drm_sched_job_done(s_job, -ECANCELED);
>>  	}
>>  
>> +	drm_sched_submit_start(sched);
>> +
>>  	if (full_recovery)
>>  		drm_sched_start_timeout_unlocked(sched);
>> -
>> -	drm_sched_submit_start(sched);
>>  }
>>  EXPORT_SYMBOL(drm_sched_start);
> 
> No.
> 
> A timeout timer should be started before we submit anything down to the hardware.
> See Message-ID: <ed3aca10-8a9f-4698-92f4-21558fa6cfe3@amd.com>,
> and Message-ID: <8e5eab14-9e55-42c9-b6ea-02fcc591266d@amd.com>.
> 
> You shouldn't start TDR at an arbitrarily late time after job
> submission to the hardware. To close this, the timer is started
> before jobs are submitted to the hardware.
> 
> One possibility is to increase the timeout timer value.

If we went with this general change as we see here and in the subsequent patch--starting
the TDR _after_ submitting jobs for execution to the hardware--this is what generally happens,
1. submit one or many jobs for execution;
2. one or many jobs may execute, complete, hang, etc.;
3. at some arbitrary time in the future, start TDR.
Which means that the timeout doesn't necessarily track the time allotted for a job to finish
executing in the hardware. It ends up larger than intended.
-- 
Regards,
Luben

