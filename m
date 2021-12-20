Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8286447B384
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 20:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CF110F7A9;
	Mon, 20 Dec 2021 19:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254910F7A9;
 Mon, 20 Dec 2021 19:11:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a3dZMAE/Evsfo/yPWvHWpU7okOY6NF1WRsag+so28Mky6vyFp91U/PMEJf9expBcQYvE7mwCGHab5nHcGdd1gY8tzRTT7I9Hpucv6rAnapi3bIon0CpS/x5fExBlZBrkbt4BQ45ee3vwjnkg7y4EVNWB5Od1bCBoshFMKFbHuG5PLlxLL7fKeFiks0rMpeL9mV5u/dsHFggPj3rTBNIIAvtqKQWuzLeCWSBrSgRuOvL/rfsxSVc32tq4fHpTUbVs/fk+r34Ruq7acohusyElc+NjmDXYLmEnBqO/WQRZPdvqu1mqmrF9V+rhhepe1+0OAY37Ku05f/DeuteZgqQfZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amN4TZwaOmuc0P3cE/a5KMWE14/uBM3sk7uvSv0LHCw=;
 b=lhL9R+EO5GiOWy/JFyYxTBTwgxdxxMd83DwWwYG1DiQmnmWB3N2/URcgIxO5KySnKmbYNSI/ytbzDa01oLTAhE8pDpo1Xe6NWrCejTz+VJ6uDaHvROq2QHxZomKLwX/O2WWDqDlfbVuj89ZO0M/Gme1oR/YD0fT1mmZBHPVSZtF7qMCfzU6oz9qrklmP9Op3iGug3DrfuhioEsz+oft1gXQHksZVZAr7BbOyAAsdM/ddx/aF5rRE3Y3b6t7T8vyokzjwO/DeiXCuBXpO/k9z1a5XWvI0rON77Osw1S4LhHY9A2pKJk0GuZUqh2H2CKbGyC3lBkrLS5PJr3GLoKvSNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amN4TZwaOmuc0P3cE/a5KMWE14/uBM3sk7uvSv0LHCw=;
 b=FkXK3WKITjdwS+WFIOli40GOM/RrQOh7xxO6g1Zu4iV04g8ylgCMJWg0OD6JcIg9goH4aeW4lXcC65boGoOwlHD8XSTy2tDLK+c8g5rjPXV/7EX6jUzucBUmPHTvHjP2bthccx0EPF9T5nqAgDwrl4WlJxdAFq8lue6JwVLDIlU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB3899.namprd12.prod.outlook.com (2603:10b6:5:149::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 19:11:52 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 19:11:52 +0000
Subject: Re: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <0a30778e-28b8-7d02-01e9-9db690227222@gmail.com>
 <CH0PR12MB5372A4EAE67D6F2C0B06F5DCF47B9@CH0PR12MB5372.namprd12.prod.outlook.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <7e1846e1-a392-fa48-875f-0f6581468a76@amd.com>
Date: Mon, 20 Dec 2021 14:11:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CH0PR12MB5372A4EAE67D6F2C0B06F5DCF47B9@CH0PR12MB5372.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: BL0PR02CA0040.namprd02.prod.outlook.com
 (2603:10b6:207:3d::17) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 11a02bb2-69a3-442a-22db-08d9c3ec9448
X-MS-TrafficTypeDiagnostic: DM6PR12MB3899:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3899088856B78D0A5BE9CF15EA7B9@DM6PR12MB3899.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlHhJuMx0FPZCpv5pe7KqpHevuK8oBee+DDRoGPtBzUsO6/UHD4eRx+TSUIa78OOIfUVMixj4fSMrzN3t7TxbMuNqD2ex4uvJfC+1mBOodTnl8VURSNX7VVh+KZZF3CWXZ2xMXHcy2YQXYEM6XTxWniMhoMyrV8OkFpe65neyYhfhpjemrieQhEeZkaY+iiaWYIeNmo7aBxlD8TxPRKQq4aAHe5zX/xjeAhWnwvHcDqsopptTqzU9V1g/aQ2C4hBVDWVGi1Zq74aOy70uC1hNXGVa/eb+KfjU1To7Mlq16zkOLw48oNdSulEmHZcwdbSw5I0Q2VDOn9Db3EWRM+TaaJC2P2VEVK2xnkHCrfyB2bPQaxwsTk+aPLoYOICFpTSm9K4Fb8lspAYO8A4T5y3qjiuiKW7QOn87/eqVYZY6XEVcNZ2O2spy3LSXeS7VhtBQracc4uB07l87m4pxuWh0Oqb3fh6BNRbJJKIba3zGdJ4DFWW3/qRVJYxDoPv7jg2w38ZYx3BmyqjfPOf2kbTjmVZAbqf2fjKk9qVELByxr4gM3yEMrKsTReuEuDLlq3ueqAhoy1/0wF4LRDeFaQyREdG9yvVcWllaPe7EDLxf4CHrf2pQthIG4Hkka3wzGkC33WsO6CdsQyrltL25nmtHGwn3AWN7oZQSfde/d74mgK5nl31tT5mgCSYGykGLk8+216tQJfhM2fEUqp2rlpZ6IAApGKY5KInSpKewG6WaP9qKH0x9YiczZSNBOg14vE0JJnC69dzQn+5gwWBB434Vbpl8CObg1cnClk7YZ3NQm+9oNZTBHyqhHTJmnCivo/9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(66556008)(6666004)(66946007)(2616005)(38100700002)(44832011)(4326008)(6486002)(45080400002)(6512007)(5660300002)(4001150100001)(31686004)(83380400001)(8676002)(54906003)(316002)(8936002)(86362001)(966005)(2906002)(110136005)(186003)(66574015)(53546011)(6506007)(508600001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWUyTWd1TUd3RUxpVURrWjhXNGpPWVhIdklWcGVYd3Y0N0dVbDdCUjFTdU1J?=
 =?utf-8?B?eGRucjJZQVB2RHpCWGtnYStsNWw3ZjR4bkhwR3VHV2RoazFtRE1seGFJOWd3?=
 =?utf-8?B?QWorVEtqcFZ3TVYzbzJMSHF6OVVsbjhXdlAyY1Z0Y0lRbUN6RVV1Uloxc0Np?=
 =?utf-8?B?d013eWwvZlB0aGw4cGJ3NVpmYzY3OGljdXNSQ0J1eFFuUGNKamJYQUtKei8v?=
 =?utf-8?B?T0tmeU9YV0ZBU3hicDA3UDJjNVZINVU4SkpCWmRrM2laOCsxMDJXcEN6dSsr?=
 =?utf-8?B?OW1MWjloekZ6ZXR2WGF1T2c3eUlxRHNMaGhzK2M5d0pjMjhaRllpYXNHaGVQ?=
 =?utf-8?B?Qmx1alAvNGNnb3IwamtYcElVNkRQaWxSQU53RGtxOFcyWGpURU16OW9OQlZI?=
 =?utf-8?B?ay96OWZ5OVBvaWM3ODBGZ3BMS1FSWmpmZjJiYnJiVkphTGJuRmY5UnFFWWJG?=
 =?utf-8?B?WGJvRHJKbUUxMXk4TkR2cVYxSUxRTmt2UkdmZEtrbE55dGk0S2x0RTlRZEhM?=
 =?utf-8?B?aUtYT1RNRHhoTXB2cU91U1ZIblZiTzRkVlg4Vm8wNXU3Y2lvcUlnalBMZGV1?=
 =?utf-8?B?R2ZVbDJFTFAycWVEQTFmcU40RFJJdDJsRmFoWk1SbXQ1bnhmalZJcWp0OG1w?=
 =?utf-8?B?US9OR0VISW8reWZmbjM0bmd3WFpWbHFDSDhYWXdvV1BzaXArL2dhOXBZaXlD?=
 =?utf-8?B?NGZvSlZJUEZqY3RzQUowbU93clRJN21RRDMveWRyQU9DQUZMaDRPV2pwazZO?=
 =?utf-8?B?NlpIVFNRa29qUlRMWHRFMzJ0Vmpjak9vY2hYNk9XdTMvQmczREJiVUUxLzBa?=
 =?utf-8?B?M0tJa3kyTS9kYVBWUU45dWkvdzE0MXJCQUFhc3dQSXlqNEI0aGxjNVFydjJn?=
 =?utf-8?B?VVg5Vm1Rb0dpUXM0OXFBU29aN3FYTC84T3N3a2JpZmRrc1BZemh1WGs1Nld1?=
 =?utf-8?B?SXFwdEVMYnRZd3RjMko3bmRzbmdqQWkrWndnV3JFdHY1dW9LWjkveEkyTm1h?=
 =?utf-8?B?Mk96Z2JUdUx1TFJhMktEUHhTL2ttQnBJbFZ0NFhOOWNSNmxKMERpOW5kYVNa?=
 =?utf-8?B?b1hWemtrR1UwbG8rbmcxSWVDeklWTkFSWEx3TVgyeEU0bjUwdGo0YTlMSGZr?=
 =?utf-8?B?RGViaFBHb2NJclVtemRhaXhUQjB1WENOV2dqSVBoUit3Ym1MSVhhaWNKeHJo?=
 =?utf-8?B?dFZQWE0vLzkvSy90RFlDSEhuWXdBUUZ4S2h0T25KVENTaTJBK00vaFJOcHJt?=
 =?utf-8?B?V1UzL2QzNUlPYmpZYW5oZUJYR0QzL1NDcFN1ak1vbEViZ3RHUzdSY3hDSERX?=
 =?utf-8?B?d3dYZEd5aG5HcHAxK3ppUnNDMGU2b0ZHUFlicWdZb3ZpM3NITEszeXZXY2xK?=
 =?utf-8?B?R3NEZHdyVzBnNDQyZUxwODI2RlUycjUwbzNoUDRZaUNtTWZZcVFBMEw1T0ZS?=
 =?utf-8?B?aGRoYlIrczZ5aVNUbG81QmpNMUFiRng4ODAyNVNSdSsxdnhCbzZrY1lVaGpS?=
 =?utf-8?B?TEJuS3VTSWE0aENDdlNSQ1M4RnlONW5PMWZLcDh5c3RFejM0VXlOUysxQlFn?=
 =?utf-8?B?MGYyYUp3TDR2R2Yyck5USkpjakJ4TzNjM1VIcDFGKzV5ZE5lem1uQUlSWW1j?=
 =?utf-8?B?RzhxRWRtNnVYZ01INTBocDk2M1F4Z0o3ZTFaQkR5T1lMTzBEb0FtVU5OVERQ?=
 =?utf-8?B?bmxtVHZnSWdaZmRuM3ZLRlJWaUR2MWlrd3Q3UjVmcjI2cm5qeDFvMzM4YVRv?=
 =?utf-8?B?TVUzZU4yYUcyYmZBcGl5ZVZQTWpQM2dhMk9xdFpSOWwxZ2RtelhOZDh4aWI3?=
 =?utf-8?B?Zkc0dVhHQ0pjc05CcWVwRVJSUEhvb05xc1k5bk43NXZWdEg3eFVLSk9acHlm?=
 =?utf-8?B?WUt3YW1oZTlBTlp5Y0dOVFVWOXVPeUcxRWEydWplSWVVbGtXaTFkdHYwTUd6?=
 =?utf-8?B?M1JQY0Ntb0dGR3ZSeVM2TWYyY0p1c2RGQm91ZmpMZG9vamNJdWtqRlRCai9J?=
 =?utf-8?B?Wm9YRitNdE9KOEpGZ1JYTGczMWkrOC9wUGh6V2JuaGFyZ2c2WElqL1NQVTVa?=
 =?utf-8?B?Z3JpS291Zk9SMTdSS3l5WU94ZVlvRDV1U3doMER1Si9SelpQRTlXSWdUWHZ0?=
 =?utf-8?B?YnNVcTB5d0pkem5HNG1UaVJaeWhpSjRaVEdwbmZCdzJvTDh6NXoydURaRVkv?=
 =?utf-8?B?U0U2U0ZyemZNa1cvc0MwaHp3Rk52bFE3ZW5UUlB4ZCtnUGZmb2sxSVNmaXd4?=
 =?utf-8?Q?IcQ9OtvaETgUIzo+dGEXXqD39huWKLl53ZA03gKRxY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a02bb2-69a3-442a-22db-08d9c3ec9448
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 19:11:51.9589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GV0M6RrqPuHuJhUfeZ7zXf/+laZ0F8LSmbIy9A9ToRqW9iEwx1MIfK1qYAPxMOJvurKlx1ZEiuJYe5lu8nMkPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3899
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
Cc: "Liu, Monk" <Monk.Liu@amd.com>, "Chen, Horace" <Horace.Chen@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-20 12:06 p.m., Liu, Shaoyun wrote:

> [AMD Official Use Only]
>
>
> Hi , Andrey
> I actually has some concerns about this  change .
> 1.  on SRIOV configuration , the reset notify coming  from host , and driver already trigger a work queue to handle the reset (check xgpu_*_mailbox_flr_work) , is it a good idea to trigger another work queue inside the work queue ?  Can  we just use the  new one  you added ?


Shouldn't be a problem,  i will change. In fact it's a great idea 
because then it looks like we can totally drop 'adev->in_gpu_reset' 
since we don't need to lock again concurrent resets anymore


> 2. For KFD,  the rocm use the user queue for the submission and it won't call the drm scheduler  and hence no job timeout.  Can  we handle that with  your new change ?


I think that not a problem - a lot of places use direct submissions and 
not scheduler, in case they need to synchronize against concurrent GPU 
resets they lock adev->reset_sem. Nothing changes in this sense.


>   
> 3 . For XGMI  hive, there is only hive  reset for all devices on bare-metal  config ,  but for SRIOV config , the VF will support VF FLR, which means host might only need to reset specific device instead trigger whole hive reset . So we might still need  reset_domain for individual device within the hive for SRIOV configuration.


This is something future right ? I don't see it in the code - in this 
case we will have to account for this as part of the generic design for 
this kind of single device reset within XGMI hive. It should require 
only a minor addition to current design in creating 2 parallel reset 
domains - one for hive and one per device.


>
> Anyway I think this change need to be verified on sriov configuration on XGMI with  some rocm use app is running .


I do have XGMI setup where I still test XGMI resets. It has ROCm stack 
there - can you please login there and tell me if I have what needed 
there to do the tests you advise ? I am not very familiar with ROCm 
tools as i usually test using libdrm. (Ping me on teams for the device 
ip and user name)

Andrey


>
> Regards
> Shaoyun.liu
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Christian König
> Sent: Monday, December 20, 2021 2:25 AM
> To: Grodzovsky, Andrey <Andrey.Grodzovsky@amd.com>; dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: daniel@ffwll.ch; Chen, Horace <Horace.Chen@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Liu, Monk <Monk.Liu@amd.com>
> Subject: Re: [RFC 0/6] Define and use reset domain for GPU recovery in amdgpu
>
> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>> This patchset is based on earlier work by Boris[1] that allowed to
>> have an ordered workqueue at the driver level that will be used by the
>> different schedulers to queue their timeout work. On top of that I
>> also serialized any GPU reset we trigger from within amdgpu code to
>> also go through the same ordered wq and in this way simplify somewhat
>> our GPU reset code so we don't need to protect from concurrency by
>> multiple GPU reset triggeres such as TDR on one hand and sysfs trigger or RAS trigger on the other hand.
>>
>> As advised by Christian and Daniel I defined a reset_domain struct
>> such that all the entities that go through reset together will be
>> serialized one against another.
>>
>> TDR triggered by multiple entities within the same domain due to the
>> same reason will not be triggered as the first such reset will cancel
>> all the pending resets. This is relevant only to TDR timers and not to
>> triggered resets coming from RAS or SYSFS, those will still happen after the in flight resets finishes.
>>
>> [1]
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatc
>> hwork.kernel.org%2Fproject%2Fdri-devel%2Fpatch%2F20210629073510.276439
>> 1-3-boris.brezillon%40collabora.com%2F&amp;data=04%7C01%7CShaoyun.Liu%
>> 40amd.com%7C1d2b07ad556b4da5d58808d9c389decf%7C3dd8961fe4884e608e11a82
>> d994e183d%7C0%7C0%7C637755819206627827%7CUnknown%7CTWFpbGZsb3d8eyJWIjo
>> iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp
>> ;sdata=8C8UbdPmM%2FH6sdTYDP5lZfRfBdQ%2B%2FN7m6s%2FREW8%2BsoM%3D&amp;re
>> served=0
>>
>> P.S Going through drm-misc-next and not amd-staging-drm-next as Boris work hasn't landed yet there.
> Patches #1 and #5, #6 are Reviewed-by: Christian König <christian.koenig@amd.com>
>
> Some minor comments on the rest, but in general absolutely looks like the way we want to go.
>
> Regards,
> Christian.
>
>> Andrey Grodzovsky (6):
>>     drm/amdgpu: Init GPU reset single threaded wq
>>     drm/amdgpu: Move scheduler init to after XGMI is ready
>>     drm/amdgpu: Fix crash on modprobe
>>     drm/amdgpu: Serialize non TDR gpu recovery with TDRs
>>     drm/amdgpu: Drop hive->in_reset
>>     drm/amdgpu: Drop concurrent GPU reset protection for device
>>
>>    drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   9 +
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 206 +++++++++++----------
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c  |  36 +---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |   2 +-
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   2 +
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  10 +-
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |   3 +-
>>    7 files changed, 132 insertions(+), 136 deletions(-)
>>
