Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8278F01B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 17:19:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D684E10E690;
	Thu, 31 Aug 2023 15:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2084.outbound.protection.outlook.com [40.107.212.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E4510E68D;
 Thu, 31 Aug 2023 15:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWDc2nwhsLdswXpNViSBJDOCOq6eM8G5z9oBWtebf9/xuTw3Y4sDYVYXY7jx3op1RofYq9iddSLGSnwoa4SxTsCwTFoinj+8LEHz9ckEA0DvT1xyz1j98AbokZaXlwUglar3Zk0RyEWfaBFC0SWz1c23P4UMzCNFj0b0HHS5fLutUltSYV0RtUqn0x88sV80YPs9yrt+5Cm8uTn4LOB6uuaED+fKKJrvVGKurqDneAEbgYBtEM4eMrki/dcbp+USavPfBsBjS/4zMeWC/ydGkaytTAcW/VV0ZowBkJeECiBiy7lmx35YYR6THEHGNsC4lF2NaoekGdnlNVdRXX+wTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q88UUY6eYQbsw+XyPgO8p3HNGUTqHCj0fzSOQqNy8zc=;
 b=PWYWl04DWw55z3roWKMcPh6K45EDb30UEp3km8KW/w8Y2SOf+uThCCp+ORQlpF4v6pFyOxExg2lwxbZ2n0RKnucybdDXW0JH/N/lN8N+GWVs7ydUdxOrqFFsef2s/fh7lrAGbZcXOQlAf9Q91pnBu83EQGzgFT6+2afxYhHw3m/enuQGRjwhJ6ALhan32g14d1u/m04jT38Sp0JRxDoTmUIx8WQCzy6SWMvGgbRgLUh4NLMhJJlStt7GIWi1F8Tsg3ppL4G5Duzm7gDAg7rh6UWmsfKqUqJT+tv9r46F+Y4bUmEcz6l3xlqU6r2hWHbhD/uDg2++hgY59avPp2ttjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q88UUY6eYQbsw+XyPgO8p3HNGUTqHCj0fzSOQqNy8zc=;
 b=cBOOsfZujagEP/zD99xgFw6caKhPfHZ23EMjgCe0Wyx8ugYWSe0htHqDCV2Oy6HvFxw3y+K93nt7/IGkFugVv9GS/5vmt01gka+rDPYqpmzemDZHSp+KJH+bymSBnu70PS/4jqxLhEjgV/2HRMCwZZvWxYkT+Rj39ynVM7caQpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 15:19:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6745.021; Thu, 31 Aug 2023
 15:19:17 +0000
Message-ID: <030d631d-1624-987f-1344-6e872862effd@amd.com>
Date: Thu, 31 Aug 2023 17:19:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: Refcounting in drm_exec
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas@shipmail.org>,
 Danilo Krummrich <dakr@redhat.com>
References: <343997f1-d164-84cb-d7ed-3141620a63e4@shipmail.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <343997f1-d164-84cb-d7ed-3141620a63e4@shipmail.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::12) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: d7e862b1-ec29-486a-dd01-08dbaa35a427
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBdQMojtvyOxt22uf9goBEVgqCSVQ1Y8SHYZmCAMcCE2fGwZ5HPfs7hUZaM40KstLTvxGPNf2l/Y/LzyoFU1gRxgkzQew4j3wc485RP/iAMHA+Ui0+mFmxyUuBUajTUHRTbPvvmW7TTYjGLjFsL5oQCAg9Ov0sOg8aislde7j+xYws3/ypqfxdlZneMzZiPw9iUWeINYArIzTiH9mFu8A+hZ5IdB/GoSvKg01QtFAaiSuyidoBfSqkKcjR3bafxUcLXEGD4sHlinwoD6xAwTD3o4J3VsJsiaVNP6Ch8HX0XP5ReE2tjfCm+3ZaIND+sA4DiXB0hkH7NxB7JT+c/zu3wgRx8Gu2goq8mSgYM4kWK4sFK76tfZroMQmVFj6e/jU99rGLL/wj7BrsYg9GPS0ygpguCkfcuI0pmCcuF2s6WEbMftHXdkR0uudWnsPuNGt1t0MD+RNYwg9s8GgNfhnsZBMB8DNuAGXvaQ/2iBXLV9sfEKlVEOl3fZmnEc2wcPOydbMk0PAE9WvPgVo+0K6Q9tThGqJa2cGviC9cqQbUxNZsZtK2XcTnYnTayMC6yAG0+D4wgzqUCmCR363G9jQTf0zokquuxtBf02x3He0HJfkkQkzqLlv+9i7rULrW+PJcxc5ke12do7BXodyb5irw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(186009)(1800799009)(451199024)(26005)(7116003)(5660300002)(6666004)(316002)(86362001)(83380400001)(66946007)(38100700002)(66556008)(54906003)(110136005)(66476007)(4744005)(6512007)(31696002)(478600001)(41300700001)(31686004)(66574015)(8676002)(8936002)(4326008)(36756003)(2616005)(6486002)(6506007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0lpVXp2NzlZQ1dlOW1VM3J1czc2d05Vd0w0NEUxUEVGQk0zcjd5TWtjV2lX?=
 =?utf-8?B?emxvQ1ZaTmNDenNpMWdXVkZqc0d2cCs0cXlkOXZ5djVZV21kTWJJOHR6Z2lr?=
 =?utf-8?B?cjZGaC9LNVJzUm9FNk9VdU93K3VnaGVNUC82SWFCaXUzR1NKM1dxVmlUWXdz?=
 =?utf-8?B?V1doTUV4djR2bTVlbStzRU1YOHE3SUxqVURSQkJXSHBrK0xFRVBFcVYxMXVZ?=
 =?utf-8?B?YTAzQXJES1JpZ1YydStFZk5Ea05YQ2NLSHlUaEF2Mmo4ckVrVEtzYVBiN2Y5?=
 =?utf-8?B?T296SHhlejZhREdnWFcrTUNLSnAxVmlWbXVMaXF3VHh4R0NlNVA1WWFOWTQ0?=
 =?utf-8?B?RStKVmVGcm50MkZEcDhHcHg4R2IybGVxc295eGlnMXRBZHFHNFhLQXRPN1cr?=
 =?utf-8?B?d2lJWnFnS0twNncvRW9FLzk0b1pqWVNYQkhVWURJUEV2THFraHM5UjFqNEVn?=
 =?utf-8?B?NHVGdDYyTmVGaVdpUEp3SG1vZ3JYZ21ySEpJVko5SG8rS1F5ZVA4aE5kVkpG?=
 =?utf-8?B?bUdXWDhXcVVQOXczdWtDNjVaWmRvVE85T2FpSzg4TFFoeHMvRi8vRGRvTWQx?=
 =?utf-8?B?UER0RHB1U00yUDc3UDdKQ3JKdytEbG45d3V2c0tBUkcxL0tvMi9CaUtualh1?=
 =?utf-8?B?MGxFZlltWS9WZWZoaXcxd0JyNU5veVFzRnZiNUlnRDV5M3BqbDI4RjZZMG81?=
 =?utf-8?B?MU9oanVaL0lZTC93czR0OWZZY3o0dTg3VVYyMzRsUlZ4Qkt4cUNuNHFFa0FO?=
 =?utf-8?B?ajVlak5EVk1yVlBqcUhFdnJ4WExpVFlWYXR5NWpUVUJTcmpjSDZ1UHRFaE5B?=
 =?utf-8?B?MFFiZ0ZQRG9DdUF5VDY3VkU3SE5XVmNnbTlWZi9lS2huZ25Vci9jTUJaMkhF?=
 =?utf-8?B?YWIyV3BVWFRUMjJESlR0eGNpa3MvV29INXY2eFFCWnNQV29kVTFRNDJRYlFJ?=
 =?utf-8?B?Kzd2U3RPWWllZ1p6SG5qM2NHVkwrRXlmbm9MRWNGVHFjMnZkK2FXandleTNI?=
 =?utf-8?B?QVBDU3MwNlZXYW5hbzJQQTdrUjlMUXpFSHkvWVphcDhjTXdZWXJrMkdOWFdq?=
 =?utf-8?B?dUptcGtxNE1lUnRzbWNjeENndXIrUGdWVHc2NE1DaU1iUVBOQ3d3dTZncWMz?=
 =?utf-8?B?bENDV3JVU3hrdVNEcjgyaHJWekJEM3RIbkZNZUNMYnRkTlBQb2dLcDZCbWNl?=
 =?utf-8?B?bWk4SXltYjd0SlVkbUNMcHg2cnQ3MTY2ZTFFZUdxWVU3Mi9scDgrUThublBN?=
 =?utf-8?B?Wkh3Zkp3bjFGbTBNR3d6dVlVYVk5MFBJUTNEQk1VaVMvMHRieFFRaWJRQ2Ev?=
 =?utf-8?B?Y21obE5Ic1djOTFBSzJycUlNYkEvc2loV3RzTHkwcGFKeVRmdGRYUlVEdzBy?=
 =?utf-8?B?MzVENDRwZGdCRXhpR2txdjJ5eElFOHhrbXR5K2ZxK3RYSUZjb1NpbnZPQnQ5?=
 =?utf-8?B?QlRhVHZ4cE1SK1ZvMXJBeUxmcTN4a0ZqdzRuZ21YTm5LSUxubkxXR3VVN1dH?=
 =?utf-8?B?VmtaUEk0WFl1QlJnNWxiMVRySy83cThrWUdaNm45WkJTTFhLSWhEVVljeXFZ?=
 =?utf-8?B?Y1ZrR3pVcm1nUEUwSTBHR2w1dkR6LzB3WHJaQ0pFYTRzbTZOZDN6MDBYTnhV?=
 =?utf-8?B?WURpTXFIc05QVlBwTDNjUW1vVkI3YlgrVUJ3WUNzMUo3bkhLM0VKdjZsZ0E2?=
 =?utf-8?B?MkJiMFMxNytSTEg3TW5wK051bWtoSFlqQWJleEZyenhsL2hCS2dKYzEycHlt?=
 =?utf-8?B?eHB3UUYyNnpTSGdTYVVLUm52Q1VCUkQ4MVc3bTJKZUV0WEN3d3ZTRlJjZFBW?=
 =?utf-8?B?b2ZIOW1HNU13V3VnTVZmNnFLb0VPYVVqbFlhZmRxcWNvZ05qQjFzSENLUzhi?=
 =?utf-8?B?OU9Rb2hwM3M0dmZaRjZ4c2lPVm5qaktoNGxvbm5KQ0hBSEttMUJWK3VMTys3?=
 =?utf-8?B?M0JyekN4Q29IckV3SDFsM05yaDMwMU54VzMzamQyYy9aSnY3UStmdm5uV2Vv?=
 =?utf-8?B?L29zRGQyVGlWVWV1ajBoQ2dIVzlWelRRamVGankrcWpMdG1LK3NURHRzaVA1?=
 =?utf-8?B?bWZMTFphQWkwVzI3UzBNd1BqQ0lJRG1rTTB2cVF6R0lCdGZqZjl0Z0ZKTVY2?=
 =?utf-8?Q?83gMKJcwLJH/D2f+MaTkwn7nb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7e862b1-ec29-486a-dd01-08dbaa35a427
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 15:19:16.9947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dregp2kMcdTFYvDThdqecZEwbLhUD8ZeVKCt9/2RYsQGYSElBQZM9JOmdATDWsDY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

Am 31.08.23 um 17:12 schrieb Thomas Hellström:
> Hi, Christian, Danilo
>
> Looking at the drm_exec code it seems we refcount *all* locked objects 
> until drm_exec_fini(). Are callers supposed to be able to *rely* on this?

Yes, that's one of the motivations for this component.

> I'm asking because refcounting appears only strictly necessary for 
> contended- and prelocked objects, and callers would otherwise need to 
> make sure they don't drop a locked object across the lock? It's going 
> to be pretty hard to change this in the future if we want for added 
> efficiency if people start to rely on it.
>
> Also seems drm_exec_unlock_all() drops the prelocked object without 
> unlocking. I'll put together a patch.

That's correct behavior.

The prelocked object is part of the locked objects array as well. So we 
just need to drop the reference.

This was actually a bug in one of the earlier versions.

Regards,
Christian.

>
> Thanks,
>
> Thomas'
>

