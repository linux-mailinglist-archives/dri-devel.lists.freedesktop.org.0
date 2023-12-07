Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4575808551
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 11:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A04CE10E84F;
	Thu,  7 Dec 2023 10:18:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::608])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E35A210E84F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Dec 2023 10:18:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AizyrrSv6YI5eDUIWv/vSsNOP/HVSqn0Ii+frpJHSynj6FjHacvaVg4syVbm0zH36EkzEa74j3dcrVWWVI7IyRMexsnAR6peBOQkTKwrMs+7pE8AQw5OrcYCzHGRwJPZW73Nn9kolZqhyS1Np5P6bzz/dXWTSi9+me+8kH82almONhxzA+nFvz/V+mrq0d5UtEK1GozjHgoqjpRZHDEp60Yd0ro/WQpluba5ClUcMDGezi30V+8m3PaGA9jFqdlHu7Vzj/xHorBKd8BGzS103YiOxf2kATzvTviBokwBvHBlUaT685TXO2Iif/0km3x4HgIfbTpHcybvA+l2u8yVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nuhxYxlQnvvlrRE7i+rLIfSSvxDb7I9omtvCEu8Y/Qc=;
 b=MddGIr8K4CICOJmoR1JV/Pw5xfH8gi76ghbxK3C1hwgk05zYVDkZXDxhnMtQahIKZs8r0jzpnF9iKYGGj8i6+C2CTuReBySAGNf1pnGM693mx8PNfgQJF69bSprw1GAw315qvjlQYZ39m81HRZHK9MLUMwyTyV9YHIg5BubR7+c1E6Js0DNeSThvO99VXce3wN7CPcDNy1OXXJ0dLacfajQP2NhAtmZSBO0KA81Q/+dBFwFbtFhKtq3a514pbSFC7ywtQ30hbpVEzpHNjEa22C1mivfJ7sZXKDQDa/KdO9bOs02CRsMPBS8dv02pagA/CknYc6Iflu+UtiS1Aqrj2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nuhxYxlQnvvlrRE7i+rLIfSSvxDb7I9omtvCEu8Y/Qc=;
 b=4o/lL/mrQyi/irnzsj/Jo54JOLnjaas24ayLaIh66iLyQTKPpSIYTKAaG/vS1QA3aBD/atp14WZt2AZjwDWzPMoMRvJcryaBztnbo1J/L8SqAT+ZBm4JHP742dA/KeHRttAdsPHjxRZup5HYPaqDhbcMly6PC1bvOvlqMroCNnA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB6937.namprd12.prod.outlook.com (2603:10b6:510:1bc::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.27; Thu, 7 Dec
 2023 10:18:22 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%7]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 10:18:22 +0000
Message-ID: <bed6544c-9434-42df-ba4c-a32022823b24@amd.com>
Date: Thu, 7 Dec 2023 11:18:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: Fix FD ownership check in drm_master_check_perm()
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 Lingkai Dong <Lingkai.Dong@arm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
References: <PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com>
 <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CACRpkdbPoDGrxCsuwmz-ep7V38Gi5P74jkfMBX+XJMPXFb=SJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0373.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::20) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB6937:EE_
X-MS-Office365-Filtering-Correlation-Id: db9bc51c-0f79-4454-fe48-08dbf70dd756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vkAp3AvjEYWZVxX3YS5hopPps82NyEoTxKtnaMKhilZFjbQzYAFzZaPeGKheNj8S0mo7ZDLBg2qOZazzWffN/AzaP3UroITzXQKWbD9jtuk4AKwCueCMXhrPprvhjD7rCstmT6L6K88J6jWfNVy5MX+ViUv3wJi+Vg4Fwpo5Xm4iE3cLFFsIW2vxlqcCyKxFbOCUdRcLU/HLggQhXPg+GsxEWSlJZHUJzzT1Prf/VYsksPefIQJ3ltQrbSGy6oEAhEKktf/wtKozZN3WewnTgTzTCpGQ0L5D8HzhlYO3/lEVFN7uXJmn6/1F02Wbpko4UiGtHf5Evx2IQX6w86Oi481i6rTjspBxXhKdsX+a+A+6V5L/py+aXMJhkP6kWU1utkQVwJVcU2YOtj67kTwswAT6QLbOZdtkOQw3xT8vrbUtY+tJuJiLjzJit9HbRrLMTUWXCL+/VMvj8JGfZlBbNJH35HibH/aUR0pxDe0I1kydb3m98YB6gR3q3qgrR6YdMe9S9Wox9c4yuFIVHFCL6iOjNynJ1g51JAd4N/QuyrD91+sY24Y2ZBKyY0AwA8qIMSlyDUkT2rhDjsGeriLG9FQ0/o01XJctzQuf/bVx/ZWNrsq8b0US14/1o7peV7/Zngqb2ZjjriHOUgHIgqp9yw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(4326008)(2906002)(8676002)(31696002)(8936002)(86362001)(5660300002)(36756003)(41300700001)(83380400001)(53546011)(6512007)(6506007)(6666004)(2616005)(26005)(38100700002)(31686004)(66556008)(110136005)(66476007)(54906003)(316002)(66946007)(478600001)(6486002)(966005)(45080400002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y25JMWszNWtpMnpoSnJLYzdtYi94ZWtqYkZnL0NHY3pvZG9hZHdybmpwTmNC?=
 =?utf-8?B?T1JBd1hNam1CNXo4Q1ZUeVdlRTVVYjhXS3lONFI0aUlDVjJZOHFtU21qMGdR?=
 =?utf-8?B?VTUxY0Z4bmF3azdUUFNtd3lDTTJZc3djUUZrWWxOVlhIYUNCcWxDOTByWlVq?=
 =?utf-8?B?TlJkUnBDSkJZWC9xNUxrTUpWMDhOL01aU0t1a3lDMjVRTWY5K1ptR1oxSW1x?=
 =?utf-8?B?ZWR2b0pEcytZUGFMYXZmWkdhSEJjOUJpQ2dwNzJ6RFhUSExKS1FpRmFxSndo?=
 =?utf-8?B?TDVIY3hNVFNHV2lMVnBySzdFK25PUnROdFh2MlFndXNnd2V0MG9ORjkxT2Rm?=
 =?utf-8?B?Sk1LMnNQbjBzbkNuOHJHNk1KOG5sUUo3d2pqaGVDVFQzZGY4cUJlaUFwQkVO?=
 =?utf-8?B?dWxSUFJoNThNOFczeUVTUysxVWdzUmdoSDV1VklDTzZSVVM4OG90U2JUa3Rh?=
 =?utf-8?B?WU9VeEt5VGhsV2diTEpLbVFSSWI4ZmgwRDM2Y1pVQ0NraHdmTEhyVEZmcGtw?=
 =?utf-8?B?VVBSRGNCVlB2RkhUVXIyNXd3czUxOXRiTXJZZFcxZkhZVUNGWEJQaWVKUXFa?=
 =?utf-8?B?SGx3S0hDcy9SL0ZjRUhiSGtmNnlwc1R3dHl3V29kTERuZXQwejVPNnZZTUM5?=
 =?utf-8?B?RCtBYVhvSmhpOU1DTDlteUQ4c2Q1TEl2aEUza01OYUc4ZGJLMUxTODYzTjk2?=
 =?utf-8?B?YkN1TXVLQ21tS216c0Q2blA1R0I1MUtTUVBDL2RlOWZySDNUTG5LT3hyR0hD?=
 =?utf-8?B?M0xmbEhLV1RLSTMrd2ZUSXVZZG9BNFpXdlFWWjFXNkJ4SFNVZFJwOU1tUVZN?=
 =?utf-8?B?VTROOThCRHFSODhnbWZUM2tDZFFGNGFlbW1qTkpqbTdTa0tseUNmMDFtMXgx?=
 =?utf-8?B?NUJSNGlJMGV5eFNpQVFmdDJXRGgvYzRBeUtXMktXdDF2TXM2UFJ6aEMvTmdt?=
 =?utf-8?B?MVNGMjR5ajhKaWZOVStQWXhib3NBTUZnNHJJNSsvL2V2aG9Nbi9YV0hZRENZ?=
 =?utf-8?B?M0psMmtmOXVBekt5MlJsOFgzS2NpMnBCVjRVZitpT2w5V3BqenI4Ynl4STM4?=
 =?utf-8?B?ZGt5bHQ5WGtrNm40TFRJa0lDbjBrb1hPd1R3OGlJcjY0b21WWCtaRm1qam0x?=
 =?utf-8?B?UDM2elBoVWhYYUpVR1RHcnhUOVZZa05xN1U1ZTFZVE9mVTZqVkZEbTFITGl6?=
 =?utf-8?B?c1FrcTcyMXR5TERscm1GbjVab2VqbjJ0QnJLQTB1MHhIeVQ5cmNBR09LcVJU?=
 =?utf-8?B?RjF4SzJNSkR3d21YeWJzdW1xOXMvSk5MMkdyamtJLy9IUk1qMW9WNFVRQVpH?=
 =?utf-8?B?dm1TdGRKMVVtRGR0MlREMEFnNzZWUUp1cUJRMWxxLzBBVHM2dDJCdUcwYXNn?=
 =?utf-8?B?dkJIRUllV2ZXV2kyYnErckRuRWQ5bkV3MzgxNFJEQWQ2c2F6ZlNiK0pkR0hG?=
 =?utf-8?B?WTMxQ21WQWRueWpqUGpERVUwOHhrNEFBUHh5cjRhN2d6NTZTaFg1eU8xanJt?=
 =?utf-8?B?Z1BqTjlRS21pWFlGRU5yK0lmVEIzd0NuUzEyVm43c0VGaG9ieEwxQkpJU2tL?=
 =?utf-8?B?aTJlbHNjYVVYRDVuRWVudktwcGZCZ1l5dlFKVCtkZ1BYWXBzcWVKSjdFRm1y?=
 =?utf-8?B?VDFJZzVEK0VjZWdKeWg4YlJrRDMxT2cxY2xNdHkwN1VDNjZDZk1IY09mVk1j?=
 =?utf-8?B?Ym1aeEtLYndmS24vMzhaNTJwZWwyRUlmS0VydTR6UVBnQklQWDVCd0JMN3JZ?=
 =?utf-8?B?MGNQOC9WRHB0RHczdWU4ZXVldDFBVDViVVVDSys3MWNZMlRIMU11RFNNbUkz?=
 =?utf-8?B?VDdwWUhUdXd1NEJKSWIxcXcvYmhiMVV5VGJyWGxsN1owMHgrSmhheml2RFVm?=
 =?utf-8?B?Q2FnWmkzT2FEWENVOWVkWC9ENDFzNGdoaGt2ZkZTSTdNR2RDS0RxcDBxc01O?=
 =?utf-8?B?UWpPM2w4YUNOMnRnYXpZUzg0NFgzTGhGWVNkRUZqSW53VkVZcEhQalhYckJo?=
 =?utf-8?B?N2MrMlpmdUlhUkh4dWhucDJHWXRQRkdIR1hLVnJqNlJldk1xVWdkMWV5a1R6?=
 =?utf-8?B?bzE5OFpIaUpPa29YcDNyb3BQVnJzZnY3M01qdHA5cERzeUtaaytQdCt6aHY5?=
 =?utf-8?Q?XDzs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db9bc51c-0f79-4454-fe48-08dbf70dd756
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2023 10:18:22.4922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6lbA0KHYqsMOzEr7vqD+OC4LgSsMLt7mSTtI839DS/r6nhfvyeXhQaAjKU2yWJDZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6937
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
Cc: nd <nd@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 07.12.23 um 11:12 schrieb Linus Walleij:
> On Wed, Dec 6, 2023 at 2:52 PM Lingkai Dong <Lingkai.Dong@arm.com> wrote:
>
>> The DRM subsystem keeps a record of the owner of a DRM device file
>> descriptor using thread group ID (TGID) instead of process ID (PID), to
>> ensures all threads within the same userspace process are considered the
>> owner. However, the DRM master ownership check compares the current
>> thread's PID against the record, so the thread is incorrectly considered to
>> be not the FD owner if the PID is not equal to the TGID. This causes DRM
>> ioctls to be denied master privileges, even if the same thread that opened
>> the FD performs an ioctl. Fix this by checking TGID.
>>
>> Fixes: 4230cea89cafb ("drm: Track clients by tgid and not tid")
>> Signed-off-by: Lingkai Dong <lingkai.dong@arm.com>
> Paging the patch author (Tvrko) and committer (Christian).
> Here is the patch if you don't have it in your mailbox:
> https://lore.kernel.org/dri-devel/PA6PR08MB107665920BE9A96658CDA04CE8884A@PA6PR08MB10766.eurprd08.prod.outlook.com/
>
> I'm seeing this as well (on Android).
>
> Tvrko, Christian: can you look at this?

Good catch, looks like we missed this occasion while switching from PID 
to TGID.

> Will you apply it to the AMD tree for fixes if it looks OK
> or does it go elsewhere?

I can push this to drm-misc-fixes as long as nobody objects in the next 
hour or so.

CC: stable? If yes which versions?

Regards,
Christian.

>
> Yours,
> Linus Walleij

