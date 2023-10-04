Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E951D7B7F8E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 14:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29C2510E11B;
	Wed,  4 Oct 2023 12:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADDC410E0B7;
 Wed,  4 Oct 2023 12:45:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIND1HZUlVmZvdH8K2q1MmIc2sGlMDc83bCwRF1yIlR1WatF0G4cCiBcBO7KKWauUBuX1oH37I7lKoa3qJ287nSN/qnVySzpOWvyTJHop9TJu6h6Hy5LtrXKQH2FzQM/0My0oBrSlBIhKENpDr/jHDyMj89xZKhebihxSqKZt+6XWV2VH2YH7SfmwQBt/lVtq+MWM6Nras+UzyxcTQd67uODZoVjeRlOrCY/8GM2DXi5zXhK7U5e+l3tc9XF+pL1MK81EcdNiciqwsR0tv8l748KckXGDPd3A87dZW1MiQ3gTk6FpWpuGOCUEAtN83EmWdhJq/ulsECseusqw6UpXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hv5Pktx/NBZvr6Plo60pOG4m4OT/S57IIcQeeaki0wU=;
 b=gT74AiLjsber4s8iV1yoRirBMwulAj5w4XJ7Ni0jg5ksFaQR+H3/cBSV2ly6lWDKT3ZVCnaBfXkLhM7RGkSGJzAOQmA571gilLK2+YiMiqDflYKPjGf2is2Ne4qUYNTjrgzC1O+KJI5+Drm1Q/WCpjlf6Zg31KIB4jdh4Oh1ORFRVfkkPTh0BNkxKaTrz1BBCIcr9jf18oNauifM6Fkqt7OotaTbOOJYD+aMB10gVAWHg2O9mWkp/pkGdu1jHNg8r3LcBEz1VjbCfPWcBKWIylPNQoO8PqJ62S2vFc68zNUStDBN+fCzHtdxhjE4iCyHF7ZNRWCMaBfRcn1D2qTFUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hv5Pktx/NBZvr6Plo60pOG4m4OT/S57IIcQeeaki0wU=;
 b=BS/HVHId3W7J5s3ZLF/F1UWz8C/gfo159LIqQtg0W1h0znpyUEf5xA65sFRL4wpI81vfhw9W54nr7hDvGio5EHaDUuid30PMo9r3sTMSY+yoj1RH9eSgN4Whn3HpUjLpuavSX2JoOk2dHRFbhQqnTbvSz/zPid5p8BTqj/FZ2Fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.31; Wed, 4 Oct
 2023 12:45:03 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::121e:5e68:c78a:1f2f%3]) with mapi id 15.20.6838.024; Wed, 4 Oct 2023
 12:45:02 +0000
Message-ID: <afad1d4a-6572-43bd-98cb-8f326ad02061@amd.com>
Date: Wed, 4 Oct 2023 08:44:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/amd/display: Remove migrate-disable and move
 memory allocation.
From: Harry Wentland <harry.wentland@amd.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20230921141516.520471-1-bigeasy@linutronix.de>
 <8be685cb-f44a-1143-60ec-d1073fda8e16@gmail.com>
 <20231002105813.NrEGqSCY@linutronix.de>
 <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
Content-Language: en-US
In-Reply-To: <7a3875f6-122f-426e-95c9-06ed8123249b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0203.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::11) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e82d50b-aed3-4545-bb94-08dbc4d7ba5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kNTdw7qwNlaFHwayxy2R/ZM52rjSahCYHS7OgZ9/ske2jI9JJL/DJPBhjesm0H9hFueRkQklFx1EwFxnd+kfEovAJ0aQFvKKf80A7KGPr0Z/u8ZiTBvJa5+RSGImmV5QdYLQjkNz+kbjCd8O3lCFwqIqPu2eqR8SjtkGj6UaTscRxZMaIbdcd9v4M1uy2P560FFdAgf17x/o+QVpKF1cxr5M5V3KoYsBv9oJtVARXkVugcjIlnPa6hdcmrKitUTbiIdjEzOD1X9VU0pViP691Ioh5DaJ0XUtpl0EhYNWy+b4cAhuDC1z/sYKywlSqAt9XNPDaPswEEgpn13HjfYfeNaYG9qUze3uh8r1zNR4TCoY4nv3Zqm0eTdMofVX1XwxZSnS6UQVfGTys9ojB8brou4wDie66Yo5i4fFCcJEyGcdekriSnBZ+NidXtz89+ayEwBX6l5IwcoTkP6I/QJjjICpNTHen9VafSWn3DAsmahCgHv1pQFcIsr3qi5aN3NMtE+Tk7EM0WENhzI/Aj3lpGmh31NXQmJXm9P8BzthOFWHzs9eBQvLrLwX0VQxlNTsTzyefEPQ6zj/9JpGKC/ZklG/N3AyYBQZQcpr6DT0L74VOA/Lywwm+EwBchdczqHXRTNMgTBxu6KRWz0zmrKeag==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(39860400002)(136003)(366004)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(31696002)(36756003)(31686004)(8676002)(44832011)(4326008)(316002)(6486002)(53546011)(6512007)(478600001)(8936002)(66476007)(110136005)(66556008)(66946007)(66574015)(41300700001)(2616005)(5660300002)(26005)(54906003)(2906002)(6506007)(38100700002)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0RPRkJUTmsvSXZpWE9qOCtKZ2RWSnczQldMYnpQVFRBZkd6STduRTVuZjFt?=
 =?utf-8?B?d0J2OGthaFNpc1l4UWdiQmZyREVDTzEwQ2JzeEwrcC9sM044bFp6UUNBN3RU?=
 =?utf-8?B?RVpIUlZFWE5HSU1OZS9FcG9jQzhkd2kxZTB5bFFKbE9uVkZvWHFEOFRGWEc3?=
 =?utf-8?B?NjdyakE2b1pnVGo1ajB6UTFOMTVvNmxsbDZ5RFRKbE1qVG5FTGQycGJLNWtu?=
 =?utf-8?B?M09mTXRlV2RwbmZaQ054blRxcEdFS2drREI1TmF4blZJbWVGTWFuVE9FV0ty?=
 =?utf-8?B?R1EwSkpWTmVBU0x1bG5zbi9NL2NqUUJjS29Zd0NhUnhqTXFyNEhHTEpEcTVo?=
 =?utf-8?B?UTRKT1c2K0E5OG1NamR1c1lrUXNwWWp5eFBpRTl4cGJQL3F4dzJSbGVJRzJ4?=
 =?utf-8?B?enpXWUU2YkM0UlFEc3ZuSTNyZ0cvR1ZOWHRsdjczeDRMOTc3dHZiR0M2RlFt?=
 =?utf-8?B?NG1oN213dXE2YVlGenMzUWYrd3djOEFVYlJMeUh1SDNaUHJQNXZGNVhvcUVS?=
 =?utf-8?B?YjZuTTgra09kWjdOVDBZcVRkYXNxYW9KS3pGSGxrd1FHeDNzRGswWWk2cjFl?=
 =?utf-8?B?S3JQZnd5RmVSa3VVaVJJTE1lelRiWjVXbUsyVVhoQkhHYjhnZkhMVStrK08v?=
 =?utf-8?B?Y3F0RDRtTm9qZ1YrUEFSbHNnTVJoOWxPNG5zMUJ1U3JmK3BYL3VxNzYzRmlK?=
 =?utf-8?B?RlhjWG0rL2NFd1JEcCt5NGxTczVYWElsUnhqdFpIQVoyTysyeGxXY0xCMHNn?=
 =?utf-8?B?eXJNdXBhRlV0SkJhU1prd09Hcm56VlNITTVjeEpUUDVjZkVlaEt1MTZxaEZQ?=
 =?utf-8?B?d05BSlNNWDhGR1ZrTWdkNGV6bVQwUTkxV0ZOeHRNV0l6S0dYYklOTjVoNlJP?=
 =?utf-8?B?Ykg2bStnZzYydlZhbHVySW1BYzdlTTNnOWVQVE9VZEFNbnVSZUJFVFlQUzJa?=
 =?utf-8?B?MmpBSDJTdk5tQnRhdUQrTXRGMG9yTUNtQ1p4NENFWE55bFZWVm5mVkh6NkhS?=
 =?utf-8?B?cHo5K2t6d3pLQUMyeStyUDVtUjN1dGJXenk1UjNaU2lkY2RpSGFacW5YVWhR?=
 =?utf-8?B?UkxFcS9oOW1yeHhoekFHdmdkOGtsUmdUY2F5Q0NNc1FzaHp0Y1JoT3BsQ0RJ?=
 =?utf-8?B?empkYzNlbGlqL3lVWUpLNXZwdU9EMGVBUHkzWDdnN3BoNEFpU0JTRGRZbmhk?=
 =?utf-8?B?bFZHRDhUSVpRQUNCOE1ZaUVydXpBbFl4eHpvMEcvc2JHNTFCUGQ2SGRkalQw?=
 =?utf-8?B?d3JkSHJIOFVBY3dCaldaKzArd1ZIcUpubVVrUVRLQXBFd0dtb2pKU0VJRkls?=
 =?utf-8?B?UHVZNnR2TXhRMW5rWjc5Z0NTN09aSDc4a2tjVVV4SVpHOGJHNmErVjdpL1NJ?=
 =?utf-8?B?anpBRWQ3VXI2eEZHSndmR09YSExJQWQvNnkycHhiVUo4Q0JlMDdVeFM0Mzkr?=
 =?utf-8?B?em12M1U3cWV6RnpWeGxDNGZZbGxJU3Z1SkVLd2p4bDhIcUx3ajd6N0pYc1Ny?=
 =?utf-8?B?Z0Q3Y2Q2dHdabTI1K1RlM3FEblR4M3NZcWhnbHZUOGVucjUzdndPazR6ZkpC?=
 =?utf-8?B?bWFVcGZBUUEyR1JGZDE0WEpMRnFXZjV6RUtMaEIzbDJuNjZOTlhjMzhZZFd0?=
 =?utf-8?B?QTBpOU9xRkJob3ordk54N2hWb0ZGZ1UzdWQ2dHJCdkJiQWpaZzR1eS96V2x1?=
 =?utf-8?B?NWNaWnl4U2gzQkVFQzJMeVBiTmNCWlJPN1AwNUZhbzc3enl5N3NSZHRFbElT?=
 =?utf-8?B?VmFOTFZ5OG9kZUF5bVU1VzB1Y2VqYWtoWlY5VThCUFFHLzBDVXRzT3JySm1q?=
 =?utf-8?B?RWhmZFJ0MENYM2xCRTJSNjJncm5GTURqZGRxbXpBNTFuUGNKcU5GTTFYWngv?=
 =?utf-8?B?b3dubG9ROGNHRENoQVdsV0lqU21ncEswTzlNNDBZRE1CR0lkZWd0bnc0OGw3?=
 =?utf-8?B?QnFJSlIraTJna001aEhBMHpLbVJTb2QwYU5SWkpvZGVvNHJ1cUtnUHVnKzlE?=
 =?utf-8?B?UGdQQTVQMEFlTGdxWGVVVE5HWWdidXh2QVo0UUJXalAyR1pWelJWWWluN3Ux?=
 =?utf-8?B?YmZrMjdVcjNYYU5WbjlWeGYxTUwwT2RmNFZDak95L3o1QlBab2xHZ2NDMkt1?=
 =?utf-8?Q?7iXaZBenAGaipfFtzJU4UPSkc?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e82d50b-aed3-4545-bb94-08dbc4d7ba5f
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 12:45:02.8884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9lAGkdGH0Wd4UZJf4LsZkhywsr5D17yrF9u0e/uEs11lHKl5gcpTcL6iWeghX3CWMe0AhKc1jMIWIJr17ILrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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
Cc: Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, dri-devel@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2023-10-03 15:54, Harry Wentland wrote:
> On 2023-10-02 06:58, Sebastian Andrzej Siewior wrote:
>> On 2023-09-22 07:33:26 [+0200], Christian König wrote:
>>> Am 21.09.23 um 16:15 schrieb Sebastian Andrzej Siewior:
>>>> Hi,
>>>>
>>>> I stumbled uppon the amdgpu driver via a bugzilla report. The actual fix
>>>> is #4 + #5 and the rest was made while looking at the code.
>>>
>>> Oh, yes please :)
>>>
>>> Rodrigo and I have been trying to sort those things out previously, but
>>> that's Sisyphean work.
>>>
>>> In general the DC team needs to judge, but of hand it looks good to me.
>>
>> Any way to get this merged? There was no reply from the DC team… No
>> reply from the person breaking it either. The bugzilla reporter stated
>> that it solves his trouble. He didn't report anything new ;)
>>
> 
> Apologies for the slow progress. We're feeding it through our CI and
> will let you know the verdict soon.
> 
> Do you happen to have the bugzilla link that this is fixing? It would
> be helpful to include that as a link in the patches as well, to give
> them context.
> 

CI passed.

Series is
Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> Harry
> 
>>> Christian.
>>
>> Sebastian
> 

