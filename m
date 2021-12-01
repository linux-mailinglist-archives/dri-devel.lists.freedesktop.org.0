Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DCE464E80
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 14:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8136EA3B;
	Wed,  1 Dec 2021 13:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BDD6EADD;
 Wed,  1 Dec 2021 13:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyftDsM9lcE8oy1Zur+NNhJIJb9X4Rfk1+KZ9kZ8jugqLyfFwoIX6ajny5McVYQtf2/91Bq8OF/EdCpKK+sTIQZ7JuEjS5id6Y5ej17QDNhtCgvBe1ubAdEXEKOqCwJeAGeNd2koZJ5QXzvwgolz47qRCDCqHfTJ281ghYV1cvWJjzKX4xkVP6YsS8CkRLqgA237kBE70UQI29aOHAIofMCiZfC7o2czOt/eE38CktotKXtal97LXCOSduNymIb35MGZN4/uzuI0/69iVQ2lxQkmp6wrW01RJ8Z11oBy8YkP9C3Po0qnI/fUe0HhahG/Q3h4alTiIpqrN28DoiHamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pe/mRmuZCyKJde2HDYsNnIxWyAJ96Xsbqd3ijHa9UNQ=;
 b=hNYTU+QQH1eh7zLCz+oBrrVdu6o+1F2ZchtAwQgJnOeE20lipHtpHMC4RvY3ZEwZShYBA0HldazhGJo0JIKVR3DQZeWt55i2FL/vEcNgwipGvIa94Ilih1avcdSBV7nHXaTwg19QK4++HPaIBmHgoJCr+v4L+zJ665M69CGn6ptsyzX5GYlzRY47cxaV4mHK4FuMtmXQYTMer4dFUo6v5+yRjsjRZXXChHUivVmbMPYuJfKSys123agsm0N1z+LaarsNjr/OsvDt6Bm/RR4etBqK4JFHOUd06s5L3phPREOU+KXEzQN3LQgBR85Nju80jxnQ1NBKLmvhpFhqnRB7Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pe/mRmuZCyKJde2HDYsNnIxWyAJ96Xsbqd3ijHa9UNQ=;
 b=UzTwNGFH9npWC+GYuMhxH+czpL2Do3bO6M+4pXribB34C6cbbZLMXEbHBE34NiLeEno2VmvVZbLt5wLbB3MFzofjpSdO8PRztRtLUiLrmJlBHQooErm2CNoJ4Nbaddf8QX0ET5K/MFEkESYv5y6NqpZ2Ns/IF5OYAi+UlXhghD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1712.namprd12.prod.outlook.com
 (2603:10b6:300:112::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 13:08:14 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.027; Wed, 1 Dec 2021
 13:08:14 +0000
Subject: Re: [PATCH v4] drm/radeon/radeon_kms: Fix a NULL pointer dereference
 in radeon_driver_open_kms()
To: Qingyang Zhou <zhou1615@umn.edu>
References: <20211130155720.178214-1-zhou1615@umn.edu>
 <20211201032214.26889-1-zhou1615@umn.edu>
 <d7c890d8-9535-b349-0c28-b08e5074f714@amd.com>
 <CA+Cm_xRjYWun_u7rod9X=c0-WExb798TLGJ6fMJMBqOMxAeuHw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <e2685075-fbc5-6f36-907f-76b6f76a59ce@amd.com>
Date: Wed, 1 Dec 2021 14:08:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CA+Cm_xRjYWun_u7rod9X=c0-WExb798TLGJ6fMJMBqOMxAeuHw@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------E23D0C36A2162A68C0349A62"
Content-Language: en-US
X-ClientProxiedBy: AM6P195CA0076.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:209:86::17) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AM6P195CA0076.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Wed, 1 Dec 2021 13:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a20b3de-7d91-4c28-601f-08d9b4cba1cc
X-MS-TrafficTypeDiagnostic: MWHPR12MB1712:
X-Microsoft-Antispam-PRVS: <MWHPR12MB171286DF8DAB28146947F2E583689@MWHPR12MB1712.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OXkm7HZaO5UlsnkEo653Ikj1rXYMq+dcxLbFTl+/qEnsDlj+J5iXSdW+SJm3swmo6ALoZ4aU1y3bfns8fyYmFV47THCBdR2SvdG+us7QSr3Ve7P4jvIF+3YJnRkXVZAFKdgzT41lwlOjRNxlbYVZuI3e7FM8VENvkCeoFITA3Tbc6uCT03QFV2y3YFIhyK5qkKsNUoLjHGtkC08yPR5cCZlsYeo5aIi2BLPZplXf0Z934fFBvGgdQ7YwGc8ufRIb4Xd2LPFgG8BZGWbCVFlz8QpUDvVqOU0pHLOw+mOV1L2OVD9wJP39oXlEWAqQwuwuklrmWEPKiyFvRN8LgUmGSOyi4qrWcBfI7JfzVUvSyKBznsHQPauTdM3y5MMgB7vgfkMP9UuyUG3TtOitiQK8h0exmRPa8EX6H9EM+24YmQeEPhbvkFPi8h9fZN8YJ0+PJSjTrcU8wmOSXzpRRD2snrL4x0vjefJhK+8P0iagSD8fTyCMGL2KtkmC3Tdhyq8l0GNr1IT3OQaubBT2L+U6IjUSX3riu60Vp2cMsk/RcbZapQLdjN6T0EUPMg3+F2emOwe1RHZTAzrPvuRQluD8tIlrUBkb7JIbNuw7M8aA2hIsyRjV5yn7rWgE4ADCKvnaXOJN/h0vjIqV3GapYonaIWSPSJutoW262F8DHSxQlegzkEVBWh8VDCMZS+WYCXM2kQnsEDi79kcUjAKzW2DeVo/zXkzardoHbXtN8+HTRxGlG9ms4vwFRXZ5sDxP+XPB6TNlCBeKS/m53fcmg7buHtCPlSTd3UiItYQLoUrt/c5X+TVnM7rLx98FO0i1FgHpSzqPatzikJDxqdIKD5w1aRkrIpNCx1/DNiO8Z+g005c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(54906003)(316002)(33964004)(16576012)(5660300002)(4001150100001)(31686004)(30864003)(38100700002)(45080400002)(66476007)(2616005)(66946007)(6666004)(8936002)(83380400001)(956004)(31696002)(26005)(86362001)(186003)(6486002)(966005)(8676002)(36756003)(508600001)(4326008)(53546011)(166002)(66556008)(6916009)(66574015)(43740500002)(45980500001)(559001)(579004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vk1BVTcxa3RFbWlmbzNDUmNpYTBadU8veFN3MTVtY2p4WW1ENE9zM04zOTFi?=
 =?utf-8?B?TVRKOEhHSVJFSHpWZFRka1NTS1FsMUJLYzd1RzI3WmxjdTMwZDhBZUh6Y1R0?=
 =?utf-8?B?SXB2UmNYQWhoOW8vbEV1dW9BelBJTlJBY2hyRS82NXlGS2RFdEM2S2lPTVp3?=
 =?utf-8?B?bGoyQ1BTZ1RiNmZVVUNxSzgxR2FhOURUTlN5RkZvSEEwS3pVVlh1WnVmUnha?=
 =?utf-8?B?aVE2VXpqdFlJSGhjNDlyalhiMlU4V0RwSC9BbEpoOG00Tkw1WVNoM1ltY05I?=
 =?utf-8?B?b1V3ZWZNeFpoS2Mya0R3cjR5MzdUc0FabjBhMU5qcGkwMEwzNkpHc0g1NlF5?=
 =?utf-8?B?OU9iOVE2SUhVOVpKSkFhcEQvWGYvdmEvaFkvTk02d3h6UzJGY2ZVazZkeGJF?=
 =?utf-8?B?NW14cHdYSFV6YW1KUEI2RmppRmVrZERUclJhblJHWUprbzEzMUlKYVN3RVVt?=
 =?utf-8?B?Qys0ZkNjdldOcUgxWlF1NFNoNUU5MGlzRDIzeEM0ZjYvTU4zVDhOc1FLdFBq?=
 =?utf-8?B?bllnRGluNGdGY3hudzk1VTdXZitQSmF2eW1VTFZXamE3QU9zbllScCtLUGpX?=
 =?utf-8?B?WTZ2WjgyQndFNEhVMVVtSVFsNTR6R0xqSzZ4V1NqcnVOekp0eW5LVmRaWjN5?=
 =?utf-8?B?NC9VZXg4U1BLUUNweHVGOUVEWVVaazY0dFhEK1VEY2xpa2YwTnQwZWNvM1NX?=
 =?utf-8?B?eXNFSWZ0bkRxQ1IzbmFscmRyb3VmbS8rVGlHWUJaOURYM0hWUC93dWJFZDkw?=
 =?utf-8?B?bUI3bGhmZlZENUZnMkxrVFphcGNia3JTdGNYRHZXUHJ3NTJ5TE8yRlF5R0NP?=
 =?utf-8?B?ZDQxK2MrMEVZamNIajlhclNrcEwxV1FvRDdnZXdNM1RFZm1ic3NkanBYeStC?=
 =?utf-8?B?bm05ZG1HSlhpNWVvOSszbFZOK2tUYm9HcjdUQ0IvWUlSR3RKNWt0S3RLYzh5?=
 =?utf-8?B?NGwwQ1FydDRHdkhWTmwvd241K1J3aTEvbno2dGh3bTcvSnhKb3ErcVJZK1RT?=
 =?utf-8?B?SWtSSVNtMWhZYWZkZ0FBMkIvMzF1bXhZRmxnY05GMEh2emhDVStYS1dGQ0Ex?=
 =?utf-8?B?ZVhFTXFWSHpGSCsyOENJRVBqUlFZK0pFRU1UR3AvRlB6K2FHblNxU0RnbkxO?=
 =?utf-8?B?eFBBZmhpY08yeDBFeW9TbFhVUzlya3JxTzVPdXdEZVo4dlZNRXJNY1dvOWVP?=
 =?utf-8?B?dlVmNElWc3lDN3hzM0QyN25lUlRLMEgwRVNYb0NadnVtVnpUN3gxWHVLTGs4?=
 =?utf-8?B?VWtNbm9SeGJyblhzY2FYSWQzQjZORS8vZXJlT0FidlZTQWVCRDg0WW01eHBQ?=
 =?utf-8?B?RWZDMVlqclRVNW94RkhPZ3JwTVBnM21lK3VNWks0dDV4Z0YrRzJUSG9UODhS?=
 =?utf-8?B?YlpmQmx3MHlsSDR3aW5VNGxEb0k5a0l4SGRjQ0VQRWNkQXoyTkNmVWx5a1hv?=
 =?utf-8?B?c2R1NExENUpyTExvU25iUzN5WlhFSm92eTY5VW9TWWlWLzdPWmFOZzJFQkk5?=
 =?utf-8?B?TzQ4Q0F0a3l4L3MzTTlHR01OcHJIWFlMRHRRa0NPc2FndEYyMFFudlZVbmFW?=
 =?utf-8?B?K3cwai92NS8rRFFORmxkKysyZTVaeU9wN3RJdmwrNGdzNWVOMCtGd2JYdVRW?=
 =?utf-8?B?TnFKSzc2bHl2U2w4ejFOTTNSRnNZeGhiYTN4NFAxbXNsZGlJcXRKVUtHMldF?=
 =?utf-8?B?U0dkejZmaFBNdlhlK2xGdEV5ZkY0cXJENVM3ZTdEZit4azJXaXhDR0JmM1Fw?=
 =?utf-8?B?RjRBcTlVc1VCVVdaaEZoK3NleGFTRFN2d3FlUkNXdnZJSTV6ODVHSGR3Nisw?=
 =?utf-8?B?bTUydUs4ZVBmZE42cHdBSjhMVGhZOXRSbW5SWW1QRENtMGhyWlplMDdrMHph?=
 =?utf-8?B?SmVDQ1g3S2NJQlV5Yit6VFBTYnNXVjAvM1R0ZytLSlNvbE1OckFNYzY3cWRn?=
 =?utf-8?B?dnRDVEhUNzF5bko1ZFRqd2NBQVVDUlBBcW5iNk1vakJXbHQrZEhNTmJnOERC?=
 =?utf-8?B?SkVDdmMxQmZtczBiRk5BZ3RXTmtDOEZIZVBxV0VTZm16Y05oRWMzRVBxUEda?=
 =?utf-8?B?eE93QSsxcDR5d2xWS3JNUW5lYVByT1dORzRybXQyeTFCaElKV3NVbStCQitz?=
 =?utf-8?Q?g8KM=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a20b3de-7d91-4c28-601f-08d9b4cba1cc
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 13:08:14.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XGbgRLzmV00POp8XeBElSQjKLDHL1SiunpxbIXs9sRgxrRx0jxD0+xkTV49TrhqH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1712
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Kangjie Lu <kjlu@umn.edu>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--------------E23D0C36A2162A68C0349A62
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Zhou,

mhm I see. Problem is that zero initializing things just to silence the 
warning is considered really bad practice.

Have you tried to use "goto out_suspend" instead of the "if(r)" at the 
end of the good case?

That might silence the compiler warning, but might look a bit better 
than initializing all the local variables.

Christian.

Am 01.12.21 um 13:48 schrieb Qingyang Zhou:
> Hi Christian:
>
> The warning is from the kernel test robot, I quote it here. The key 
> point is that vm may be used in radeon_vm_fini(rdev, vm) without 
> initialization. Although it is not possible in practice, I still add 
> initializations to silence the warning of llvm.
>
> ---------- Forwarded message ---------
> From: *kernel test robot* <lkp@intel.com <mailto:lkp@intel.com>>
> Date: Wed, Dec 1, 2021 at 4:32 AM
> Subject: drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning: variable 
> 'vm' is used uninitialized whenever 'if' condition is false
> To: Zhou Qingyang <zhou1615@umn.edu <mailto:zhou1615@umn.edu>>
> Cc: <llvm@lists.linux.dev <mailto:llvm@lists.linux.dev>>, 
> <kbuild-all@lists.01.org <mailto:kbuild-all@lists.01.org>>, 
> <linux-kernel@vger.kernel.org <mailto:linux-kernel@vger.kernel.org>>, 
> 0day robot <lkp@intel.com <mailto:lkp@intel.com>>
>
>
> tree: 
> https://github.com/0day-ci/linux/commits/UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FUPDATE-20211130-233655%2FZhou-Qingyang%2Fdrm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms%2F20211130-231509&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241621159%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=xidj6HQeF%2BN4Iaf%2BlsTNyLtUi5O6RfPQXdIP%2FSiDTaA%3D&reserved=0>
> head:   123fb3d217e89c4388fdb08b63991bac7c324219
> commit: 123fb3d217e89c4388fdb08b63991bac7c324219 
> drm/radeon/radeon_kms: Fix a NULL pointer dereference in 
> radeon_driver_open_kms()
> date:   5 hours ago
> config: mips-randconfig-r014-20211128 
> (https://download.01.org/0day-ci/archive/20211201/202112010420.xkXHciHS-lkp@intel.com/config 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20211201%2F202112010420.xkXHciHS-lkp%40intel.com%2Fconfig&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241631158%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=bFtNPX12YoMNV5vmbsU0Yqctl9bM4%2BHwr844eDiNJ9Y%3D&reserved=0>)
> compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241641152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=02UXY8X18bDlrLzP2ShvfHZLzNMhveWG3ax6jaYjQ8g%3D&reserved=0> 25eb7fa01d7ebbe67648ea03841cda55b4239ab2)
> reproduce (this is a W=1 build):
>         wget 
> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241641152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=2Ynt8wRS%2FegIFRy7OXHVvkto8skoNpI6n6nB8XPyBFY%3D&reserved=0> -O 
> ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install mips cross compiling tool for clang build
>         # apt-get install binutils-mips-linux-gnu
>         # 
> https://github.com/0day-ci/linux/commit/123fb3d217e89c4388fdb08b63991bac7c324219 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F123fb3d217e89c4388fdb08b63991bac7c324219&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241651152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=WiHolpngKWiQ3N2ztZnBMJpHk8K8dVGyG69UVboG1fc%3D&reserved=0>
>         git remote add linux-review https://github.com/0day-ci/linux 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241661151%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=NneL5vqGdpoQ%2Fmy%2Fr36qZjBr4lmrRszvC1S1hL2xsMM%3D&reserved=0>
>         git fetch --no-tags linux-review 
> UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509
>         git checkout 123fb3d217e89c4388fdb08b63991bac7c324219
>         # save the config file to linux build tree
>         mkdir build_dir
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 
> O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/radeon/
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com <mailto:lkp@intel.com>>
>
> All warnings (new ones prefixed by >>):
>
> >> drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning: variable 'vm' 
> is used uninitialized whenever 'if' condition is false 
> [-Wsometimes-uninitialized]
>                    if (rdev->accel_working) {
>                        ^~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: uninitialized use 
> occurs here
>            radeon_vm_fini(rdev, vm);
>                                 ^~
>    drivers/gpu/drm/radeon/radeon_kms.c:672:3: note: remove the 'if' if 
> its condition is always true
>                    if (rdev->accel_working) {
>                    ^~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/radeon/radeon_kms.c:664:6: warning: variable 'vm' 
> is used uninitialized whenever 'if' condition is false 
> [-Wsometimes-uninitialized]
>            if (rdev->family >= CHIP_CAYMAN) {
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/radeon/radeon_kms.c:705:23: note: uninitialized use 
> occurs here
>            radeon_vm_fini(rdev, vm);
>                                 ^~
>    drivers/gpu/drm/radeon/radeon_kms.c:664:2: note: remove the 'if' if 
> its condition is always true
>            if (rdev->family >= CHIP_CAYMAN) {
>            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    drivers/gpu/drm/radeon/radeon_kms.c:653:22: note: initialize the 
> variable 'vm' to silence this warning
>            struct radeon_vm *vm;
>                                ^
>                                 = NULL
>    2 warnings generated.
>
>
> vim +672 drivers/gpu/drm/radeon/radeon_kms.c
>
> 771fe6b912fca54 Jerome Glisse      2009-06-05  638
> f482a1419545ded Alex Deucher       2012-07-17  639  /**
> f482a1419545ded Alex Deucher       2012-07-17  640   * 
> radeon_driver_open_kms - drm callback for open
> f482a1419545ded Alex Deucher       2012-07-17  641   *
> f482a1419545ded Alex Deucher       2012-07-17  642   * @dev: drm dev 
> pointer
> f482a1419545ded Alex Deucher       2012-07-17  643   * @file_priv: drm 
> file
> f482a1419545ded Alex Deucher       2012-07-17  644   *
> f482a1419545ded Alex Deucher       2012-07-17  645   * On device open, 
> init vm on cayman+ (all asics).
> f482a1419545ded Alex Deucher       2012-07-17  646   * Returns 0 on 
> success, error on failure.
> f482a1419545ded Alex Deucher       2012-07-17  647   */
> 771fe6b912fca54 Jerome Glisse      2009-06-05  648  int 
> radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
> 771fe6b912fca54 Jerome Glisse      2009-06-05  649  {
> 721604a15b934f0 Jerome Glisse      2012-01-05  650 struct 
> radeon_device *rdev = dev->dev_private;
> 10ebc0bc09344ab Dave Airlie        2012-09-17  651      int r;
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  652 struct radeon_fpriv 
> *fpriv;
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  653 struct radeon_vm *vm;
> 721604a15b934f0 Jerome Glisse      2012-01-05  654
> 721604a15b934f0 Jerome Glisse      2012-01-05  655 
> file_priv->driver_priv = NULL;
> 721604a15b934f0 Jerome Glisse      2012-01-05  656
> 10ebc0bc09344ab Dave Airlie        2012-09-17  657      r = 
> pm_runtime_get_sync(dev->dev);
> 9fb10671011143d Aditya Pakki       2020-06-13  658      if (r < 0) {
> 9fb10671011143d Aditya Pakki       2020-06-13  659     
> pm_runtime_put_autosuspend(dev->dev);
> 10ebc0bc09344ab Dave Airlie        2012-09-17  660     return r;
> 9fb10671011143d Aditya Pakki       2020-06-13  661      }
> 10ebc0bc09344ab Dave Airlie        2012-09-17  662
> 721604a15b934f0 Jerome Glisse      2012-01-05  663      /* new gpu 
> have virtual address space support */
> 721604a15b934f0 Jerome Glisse      2012-01-05  664      if 
> (rdev->family >= CHIP_CAYMAN) {
> 721604a15b934f0 Jerome Glisse      2012-01-05  665
> 721604a15b934f0 Jerome Glisse      2012-01-05  666     fpriv = 
> kzalloc(sizeof(*fpriv), GFP_KERNEL);
> 721604a15b934f0 Jerome Glisse      2012-01-05  667     if 
> (unlikely(!fpriv)) {
> 32c59dc14b72803 Alex Deucher       2016-08-31  668             r = 
> -ENOMEM;
> 32c59dc14b72803 Alex Deucher       2016-08-31  669             goto 
> out_suspend;
> 721604a15b934f0 Jerome Glisse      2012-01-05  670     }
> 721604a15b934f0 Jerome Glisse      2012-01-05  671
> 544143f9e01a60a Alex Deucher       2015-01-28 @672     if 
> (rdev->accel_working) {
> cc9e67e3d7000c1 Christian König    2014-07-18  673             vm = 
> &fpriv->vm;
> cc9e67e3d7000c1 Christian König    2014-07-18  674             r = 
> radeon_vm_init(rdev, vm);
> 74073c9dd299056 Quentin Casasnovas 2014-03-18  675             if (r) {
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  676                     
> goto out_fpriv;
> 74073c9dd299056 Quentin Casasnovas 2014-03-18  677             }
> d72d43cfc5847c1 Christian König    2012-10-09  678
> f1e3dc708aaadb9 Christian König    2014-02-20  679             r = 
> radeon_bo_reserve(rdev->ring_tmp_bo.bo 
> <https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241661151%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=u%2FJICBkdCMwgZH0zsmtS%2F2kQTtkwatlaQ51hnB8C1xo%3D&reserved=0>, 
> false);
> 74073c9dd299056 Quentin Casasnovas 2014-03-18  680             if (r) {
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  681                     
> goto out_vm_fini;
> 74073c9dd299056 Quentin Casasnovas 2014-03-18  682             }
> f1e3dc708aaadb9 Christian König    2014-02-20  683
> d72d43cfc5847c1 Christian König    2012-10-09  684             /* map 
> the ib pool buffer read only into
> d72d43cfc5847c1 Christian König    2012-10-09  685              * 
> virtual address space */
> cc9e67e3d7000c1 Christian König    2014-07-18  686             
> vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
> d72d43cfc5847c1 Christian König    2012-10-09  687                     
>                         rdev->ring_tmp_bo.bo 
> <https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241671146%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=Xci0wMHbXbhIcvQuZXPCdhhNXCOls%2BjoEhOVUPUQLhE%3D&reserved=0>);
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  688             if 
> (!vm->ib_bo_va) {
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  689                     
> r = -ENOMEM;
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  690                     
> goto out_vm_fini;
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  691             }
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  692
> cc9e67e3d7000c1 Christian König    2014-07-18  693             r = 
> radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
> cc9e67e3d7000c1 Christian König    2014-07-18  694                     
>                   RADEON_VA_IB_OFFSET,
> d72d43cfc5847c1 Christian König    2012-10-09  695 
> RADEON_VM_PAGE_READABLE |
> d72d43cfc5847c1 Christian König    2012-10-09  696 
> RADEON_VM_PAGE_SNOOPED);
> 721604a15b934f0 Jerome Glisse      2012-01-05  697             if (r) {
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  698                     
> goto out_vm_fini;
> 721604a15b934f0 Jerome Glisse      2012-01-05  699             }
> 24f47acc78b0ab5 Jérôme Glisse      2014-05-07  700     }
> 721604a15b934f0 Jerome Glisse      2012-01-05  701     
> file_priv->driver_priv = fpriv;
> 721604a15b934f0 Jerome Glisse      2012-01-05  702      }
> 10ebc0bc09344ab Dave Airlie        2012-09-17  703
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  704 out_vm_fini:
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  705 
> radeon_vm_fini(rdev, vm);
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  706 out_fpriv:
> 123fb3d217e89c4 Zhou Qingyang      2021-11-30  707 kfree(fpriv);
> 32c59dc14b72803 Alex Deucher       2016-08-31  708 out_suspend:
> 10ebc0bc09344ab Dave Airlie        2012-09-17  709 
> pm_runtime_mark_last_busy(dev->dev);
> 10ebc0bc09344ab Dave Airlie        2012-09-17  710 
> pm_runtime_put_autosuspend(dev->dev);
> 32c59dc14b72803 Alex Deucher       2016-08-31  711 return r;
> 771fe6b912fca54 Jerome Glisse      2009-06-05  712  }
> 771fe6b912fca54 Jerome Glisse      2009-06-05  713
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org 
> <https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241681142%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=PxpqV%2Fgh3oZuixBzm0aZxnoy3NAJzdxW7R9fOkqD8pQ%3D&reserved=0>
>
> On Wed, Dec 1, 2021 at 3:20 PM Christian König 
> <christian.koenig@amd.com <mailto:christian.koenig@amd.com>> wrote:
>
>     Am 01.12.21 um 04:22 schrieb Zhou Qingyang:
>     > In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
>     > vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
>     > radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
>     > which could lead to a NULL pointer dereference on failure of
>     > radeon_vm_bo_add().
>     >
>     > Fix this bug by adding a check of vm->ib_bo_va.
>     >
>     > This bug was found by a static analyzer. The analysis employs
>     > differential checking to identify inconsistent security operations
>     > (e.g., checks or kfrees) between two code paths and confirms
>     that the
>     > inconsistent operations are not recovered in the current function or
>     > the callers, so they constitute bugs.
>     >
>     > Note that, as a bug found by static analysis, it can be a false
>     > positive or hard to trigger. Multiple researchers have
>     cross-reviewed
>     > the bug.
>     >
>     > Builds with CONFIG_DRM_RADEON=m show no new warnings,
>     > and our static analyzer no longer warns about this code.
>     >
>     > Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
>     > Reported-by: kernel test robot <lkp@intel.com
>     <mailto:lkp@intel.com>>
>     > Signed-off-by: Zhou Qingyang <zhou1615@umn.edu
>     <mailto:zhou1615@umn.edu>>
>     > ---
>     > Changes in v2:
>     >    -  Initialize the variables to silence warning
>
>     What warning do you get? Double checking the code that shouldn't be
>     necessary and is usually rather frowned upon.
>
>     Thanks,
>     Christian.
>
>     >
>     > Changes in v3:
>     >    -  Fix the bug that good case will also be freed
>     >    -  Improve code style
>     >
>     > Changes in v2:
>     >    -  Improve the error handling into goto style
>     >
>     >   drivers/gpu/drm/radeon/radeon_kms.c | 37
>     ++++++++++++++++-------------
>     >   1 file changed, 20 insertions(+), 17 deletions(-)
>     >
>     > diff --git a/drivers/gpu/drm/radeon/radeon_kms.c
>     b/drivers/gpu/drm/radeon/radeon_kms.c
>     > index 482fb0ae6cb5..9d0f840286a1 100644
>     > --- a/drivers/gpu/drm/radeon/radeon_kms.c
>     > +++ b/drivers/gpu/drm/radeon/radeon_kms.c
>     > @@ -648,7 +648,9 @@ void radeon_driver_lastclose_kms(struct
>     drm_device *dev)
>     >   int radeon_driver_open_kms(struct drm_device *dev, struct
>     drm_file *file_priv)
>     >   {
>     >       struct radeon_device *rdev = dev->dev_private;
>     > -     int r;
>     > +     struct radeon_fpriv *fpriv = NULL;
>     > +     struct radeon_vm *vm = NULL;
>     > +     int r = 0;
>     >
>     >       file_priv->driver_priv = NULL;
>     >
>     > @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct drm_device
>     *dev, struct drm_file *file_priv)
>     >
>     >       /* new gpu have virtual address space support */
>     >       if (rdev->family >= CHIP_CAYMAN) {
>     > -             struct radeon_fpriv *fpriv;
>     > -             struct radeon_vm *vm;
>     >
>     >               fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);
>     >               if (unlikely(!fpriv)) {
>     > @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct
>     drm_device *dev, struct drm_file *file_priv)
>     >               if (rdev->accel_working) {
>     >                       vm = &fpriv->vm;
>     >                       r = radeon_vm_init(rdev, vm);
>     > -                     if (r) {
>     > -                             kfree(fpriv);
>     > -                             goto out_suspend;
>     > -                     }
>     > +                     if (r)
>     > +                             goto out_fpriv;
>     >
>     >                       r = radeon_bo_reserve(rdev->ring_tmp_bo.bo
>     <https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241681142%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=H7WLEFylDXgOQLTAa5rPfEfbU8LtsqRxnGG8hWjI5IQ%3D&reserved=0>,
>     false);
>     > -                     if (r) {
>     > -                             radeon_vm_fini(rdev, vm);
>     > -                             kfree(fpriv);
>     > -                             goto out_suspend;
>     > -                     }
>     > +                     if (r)
>     > +                             goto out_vm_fini;
>     >
>     >                       /* map the ib pool buffer read only into
>     >                        * virtual address space */
>     >                       vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
>     >  rdev->ring_tmp_bo.bo
>     <https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241691135%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&sdata=SSR7%2FvFI3gwMRiolWqM79J47Mje8Yz6B%2Ba6jmeX%2FA0E%3D&reserved=0>);
>     > +                     if (!vm->ib_bo_va) {
>     > +                             r = -ENOMEM;
>     > +                             goto out_vm_fini;
>     > +                     }
>     > +
>     >                       r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
>     >  RADEON_VA_IB_OFFSET,
>     >  RADEON_VM_PAGE_READABLE |
>     >  RADEON_VM_PAGE_SNOOPED);
>     > -                     if (r) {
>     > -                             radeon_vm_fini(rdev, vm);
>     > -                             kfree(fpriv);
>     > -                             goto out_suspend;
>     > -                     }
>     > +                     if (r)
>     > +                             goto out_vm_fini;
>     >               }
>     >               file_priv->driver_priv = fpriv;
>     >       }
>     >
>     > +out_vm_fini:
>     > +     if (r)
>     > +             radeon_vm_fini(rdev, vm);
>     > +out_fpriv:
>     > +     if (r)
>     > +             kfree(fpriv);
>     >   out_suspend:
>     >       pm_runtime_mark_last_busy(dev->dev);
>     >       pm_runtime_put_autosuspend(dev->dev);
>


--------------E23D0C36A2162A68C0349A62
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    Hi Zhou,<br>
    <br>
    mhm I see. Problem is that zero initializing things just to silence
    the warning is considered really bad practice.<br>
    <br>
    Have you tried to use &quot;goto out_suspend&quot; instead of the &quot;if(r)&quot; at
    the end of the good case?<br>
    <br>
    That might silence the compiler warning, but might look a bit better
    than initializing all the local variables.<br>
    <br>
    Christian.<br>
    <br>
    <div class="moz-cite-prefix">Am 01.12.21 um 13:48 schrieb Qingyang
      Zhou:<br>
    </div>
    <blockquote type="cite" cite="mid:CA+Cm_xRjYWun_u7rod9X=c0-WExb798TLGJ6fMJMBqOMxAeuHw@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">Hi&nbsp;Christian:
          <div><br>
          </div>
          <div>The warning is from the kernel test robot, I quote it
            here. The key point is that vm may be used in
            radeon_vm_fini(rdev, vm) without initialization. Although it
            is not possible in practice, I still add initializations to
            silence&nbsp;the warning of llvm.</div>
          <div><br>
          </div>
          <div>
            <div dir="ltr" class="gmail_attr">---------- Forwarded
              message ---------<br>
              From:&nbsp;<strong class="gmail_sendername" dir="auto">kernel
                test robot</strong>&nbsp;<span dir="auto">&lt;<a href="mailto:lkp@intel.com" moz-do-not-send="true">lkp@intel.com</a>&gt;</span><br>
              Date: Wed, Dec 1, 2021 at 4:32 AM<br>
              Subject: drivers/gpu/drm/radeon/radeon_kms.c:672:7:
              warning: variable 'vm' is used uninitialized whenever 'if'
              condition is false<br>
              To: Zhou Qingyang &lt;<a href="mailto:zhou1615@umn.edu" moz-do-not-send="true">zhou1615@umn.edu</a>&gt;<br>
              Cc: &lt;<a href="mailto:llvm@lists.linux.dev" moz-do-not-send="true">llvm@lists.linux.dev</a>&gt;,
              &lt;<a href="mailto:kbuild-all@lists.01.org" moz-do-not-send="true">kbuild-all@lists.01.org</a>&gt;,
              &lt;<a href="mailto:linux-kernel@vger.kernel.org" moz-do-not-send="true">linux-kernel@vger.kernel.org</a>&gt;,
              0day robot &lt;<a href="mailto:lkp@intel.com" moz-do-not-send="true">lkp@intel.com</a>&gt;<br>
            </div>
            <br>
            <br>
            tree:&nbsp; &nbsp;<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommits%2FUPDATE-20211130-233655%2FZhou-Qingyang%2Fdrm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms%2F20211130-231509&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241621159%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=xidj6HQeF%2BN4Iaf%2BlsTNyLtUi5O6RfPQXdIP%2FSiDTaA%3D&amp;reserved=0" originalsrc="https://github.com/0day-ci/linux/commits/UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509" shash="rUOB7hKLE7y6jsLkjTYBy1/NAG+q5oEeT6Iv/+j3pHV7ZGV759rVPLcx9+DQvp1PFF4dvYwkxmSHF6jJDROtcelI9ZeEb4WikjQWWaI5t5udeT1TWF4VUYM+oLxSPpXl8ELzgMQ06QfgS0WmyauJcZAFwiuDt8olOyX+CAiqGdg=" rel="noreferrer" target=
 "_blank" moz-do-not-send="true">https://github.com/0day-ci/linux/commits/UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509</a><br>
            head:&nbsp; &nbsp;123fb3d217e89c4388fdb08b63991bac7c324219<br>
            commit: 123fb3d217e89c4388fdb08b63991bac7c324219
            drm/radeon/radeon_kms: Fix a NULL pointer dereference in
            radeon_driver_open_kms()<br>
            date:&nbsp; &nbsp;5 hours ago<br>
            config: mips-randconfig-r014-20211128 (<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdownload.01.org%2F0day-ci%2Farchive%2F20211201%2F202112010420.xkXHciHS-lkp%40intel.com%2Fconfig&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241631158%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=bFtNPX12YoMNV5vmbsU0Yqctl9bM4%2BHwr844eDiNJ9Y%3D&amp;reserved=0" originalsrc="https://download.01.org/0day-ci/archive/20211201/202112010420.xkXHciHS-lkp@intel.com/config" shash="S1ezIwpwIw2k/3Jnp6sakp8sO6Ctq+dZaU7iSsCdINwnANdKyuzXbOP/F1umTMps9+/OcILeF3+jYFROlF+c6pXLMmOYYAwnJ9SLBbj7GLVxu/JASCk8xSZXBY5PopKzznErvFCYHmZTEd9KifVvxYl9dw9jJaZvuRyLzZ08+OM=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://download.01.org/0day-ci/archive/20211201/202112010420.xkXHciHS-lkp@intel.com/config</a>)<br>
            compiler: clang version 14.0.0 (<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fllvm%2Fllvm-project&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241641152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=02UXY8X18bDlrLzP2ShvfHZLzNMhveWG3ax6jaYjQ8g%3D&amp;reserved=0" originalsrc="https://github.com/llvm/llvm-project" shash="let9khaiWN6pxyyuGbQUci49TaTX52q46YwIQkTZmdej3eTs0w3/1OzTjEzbVqDqz2hp5dgIbQMgoZ/l4tlNEZYxppbn9ih+ya1phGgkkegTD/g7x2hki7VObJpfFHp+/AwJrszHuS3w4Sq4iZOXGuPoaQECWJ+ReizhzEAPkDs=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/llvm/llvm-project</a>&nbsp;25eb7fa01d7ebbe67648ea03841cda55b4239ab2)<br>
            reproduce (this is a W=1 build):<br>
            &nbsp; &nbsp; &nbsp; &nbsp; wget&nbsp;<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fraw.githubusercontent.com%2Fintel%2Flkp-tests%2Fmaster%2Fsbin%2Fmake.cross&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241641152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=2Ynt8wRS%2FegIFRy7OXHVvkto8skoNpI6n6nB8XPyBFY%3D&amp;reserved=0" originalsrc="https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross" shash="YMN5cBMDfUbAXVEPrnD0FatwFrfkqtuGfjt50FHUl3/SpytgTa2d4f1VkNCbLpEHVPKAF6bC/vqNvmB2G+rZaaLTh3LjCBzFrnBBiH3OWhjCbQo6O/ufYYI+CDq09DwEk+H4ABjCQ8lRciCRLq4qWOb6NF574Y7OpmsAQR+yyZg=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross</a>&nbsp;-O
            ~/bin/make.cross<br>
            &nbsp; &nbsp; &nbsp; &nbsp; chmod +x ~/bin/make.cross<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # install mips cross compiling tool for clang build<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # apt-get install binutils-mips-linux-gnu<br>
            &nbsp; &nbsp; &nbsp; &nbsp; #&nbsp;<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux%2Fcommit%2F123fb3d217e89c4388fdb08b63991bac7c324219&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241651152%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=WiHolpngKWiQ3N2ztZnBMJpHk8K8dVGyG69UVboG1fc%3D&amp;reserved=0" originalsrc="https://github.com/0day-ci/linux/commit/123fb3d217e89c4388fdb08b63991bac7c324219" shash="yxkpZ+2R5X4uimHPl1QHedkv4EMlZ0nAiHchIpWjbu/z9sudpvsj1Qfm2sKt3j6n8oRZL/+b9zjUaOM2hvVITtRIK2MDvDz00FxbRPITZvJxTKwYmSFN6R828rmDYIdu4JPcTEs2XnTTkVYzTFyUTZoIZwiyXnSmYTvwJ4RZXZo=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/0day-ci/linux/commit/123fb3d217e89c4388fdb08b63991bac7c324219</a><br>
            &nbsp; &nbsp; &nbsp; &nbsp; git remote add linux-review&nbsp;<a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2F0day-ci%2Flinux&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241661151%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=NneL5vqGdpoQ%2Fmy%2Fr36qZjBr4lmrRszvC1S1hL2xsMM%3D&amp;reserved=0" originalsrc="https://github.com/0day-ci/linux" shash="yHMKjNhDe+PGEb6grRxXhJ7w4mw0WTqUlNQm8OFZPB0WR5BpD3Kye20Ppq9ou0Ezztz+fF8d7M4fSRUMnOC7REFVHj1L0sQlBLPdnibHTBi6UncLlJ+YCWynJMNhXaEAR6bm+AFHP5O1v2tinVYMMRBZPrDbqEbW51p0NYvpRHQ=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://github.com/0day-ci/linux</a><br>
            &nbsp; &nbsp; &nbsp; &nbsp; git fetch --no-tags linux-review
UPDATE-20211130-233655/Zhou-Qingyang/drm-radeon-radeon_kms-Fix-a-NULL-pointer-dereference-in-radeon_driver_open_kms/20211130-231509<br>
            &nbsp; &nbsp; &nbsp; &nbsp; git checkout
            123fb3d217e89c4388fdb08b63991bac7c324219<br>
            &nbsp; &nbsp; &nbsp; &nbsp; # save the config file to linux build tree<br>
            &nbsp; &nbsp; &nbsp; &nbsp; mkdir build_dir<br>
            &nbsp; &nbsp; &nbsp; &nbsp; COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang
            make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash
            drivers/gpu/drm/radeon/<br>
            <br>
            If you fix the issue, kindly add following tag as
            appropriate<br>
            Reported-by: kernel test robot &lt;<a href="mailto:lkp@intel.com" target="_blank" moz-do-not-send="true">lkp@intel.com</a>&gt;<br>
            <br>
            All warnings (new ones prefixed by &gt;&gt;):<br>
            <br>
            &gt;&gt; drivers/gpu/drm/radeon/radeon_kms.c:672:7: warning:
            variable 'vm' is used uninitialized whenever 'if' condition
            is false [-Wsometimes-uninitialized]<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;accel_working) {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:705:23: note:
            uninitialized use occurs here<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;radeon_vm_fini(rdev, vm);<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:672:3: note: remove
            the 'if' if its condition is always true<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;accel_working) {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:664:6: warning:
            variable 'vm' is used uninitialized whenever 'if' condition
            is false [-Wsometimes-uninitialized]<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;family &gt;= CHIP_CAYMAN) {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:705:23: note:
            uninitialized use occurs here<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;radeon_vm_fini(rdev, vm);<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:664:2: note: remove
            the 'if' if its condition is always true<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;family &gt;= CHIP_CAYMAN) {<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
            &nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c:653:22: note:
            initialize the variable 'vm' to silence this warning<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct radeon_vm *vm;<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^<br>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; = NULL<br>
            &nbsp; &nbsp;2 warnings generated.<br>
            <br>
            <br>
            vim +672 drivers/gpu/drm/radeon/radeon_kms.c<br>
            <br>
            771fe6b912fca54 Jerome Glisse&nbsp; &nbsp; &nbsp; 2009-06-05&nbsp; 638&nbsp;<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 639&nbsp; /**<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 640&nbsp; &nbsp;*
            radeon_driver_open_kms - drm callback for open<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 641&nbsp; &nbsp;*<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 642&nbsp; &nbsp;* @dev:
            drm dev pointer<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 643&nbsp; &nbsp;*
            @file_priv: drm file<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 644&nbsp; &nbsp;*<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 645&nbsp; &nbsp;* On
            device open, init vm on cayman+ (all asics).<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 646&nbsp; &nbsp;*
            Returns 0 on success, error on failure.<br>
            f482a1419545ded Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2012-07-17&nbsp; 647&nbsp; &nbsp;*/<br>
            771fe6b912fca54 Jerome Glisse&nbsp; &nbsp; &nbsp; 2009-06-05&nbsp; 648&nbsp; int
            radeon_driver_open_kms(struct drm_device *dev, struct
            drm_file *file_priv)<br>
            771fe6b912fca54 Jerome Glisse&nbsp; &nbsp; &nbsp; 2009-06-05&nbsp; 649&nbsp; {<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 650&nbsp; &nbsp; &nbsp;
            struct radeon_device *rdev = dev-&gt;dev_private;<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 651&nbsp; &nbsp; &nbsp; int
            r;<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 652&nbsp; &nbsp; &nbsp;
            struct radeon_fpriv *fpriv;<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 653&nbsp; &nbsp; &nbsp;
            struct radeon_vm *vm;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 654&nbsp;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 655&nbsp; &nbsp; &nbsp;
            file_priv-&gt;driver_priv = NULL;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 656&nbsp;<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 657&nbsp; &nbsp; &nbsp; r =
            pm_runtime_get_sync(dev-&gt;dev);<br>
            9fb10671011143d Aditya Pakki&nbsp; &nbsp; &nbsp; &nbsp;2020-06-13&nbsp; 658&nbsp; &nbsp; &nbsp; if
            (r &lt; 0) {<br>
            9fb10671011143d Aditya Pakki&nbsp; &nbsp; &nbsp; &nbsp;2020-06-13&nbsp; 659&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; pm_runtime_put_autosuspend(dev-&gt;dev);<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 660&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; return r;<br>
            9fb10671011143d Aditya Pakki&nbsp; &nbsp; &nbsp; &nbsp;2020-06-13&nbsp; 661&nbsp; &nbsp; &nbsp; }<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 662&nbsp;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 663&nbsp; &nbsp; &nbsp; /*
            new gpu have virtual address space support */<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 664&nbsp; &nbsp; &nbsp; if
            (rdev-&gt;family &gt;= CHIP_CAYMAN) {<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 665&nbsp;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 666&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; fpriv = kzalloc(sizeof(*fpriv), GFP_KERNEL);<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 667&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; if (unlikely(!fpriv)) {<br>
            32c59dc14b72803 Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2016-08-31&nbsp; 668&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = -ENOMEM;<br>
            32c59dc14b72803 Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2016-08-31&nbsp; 669&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_suspend;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 670&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; }<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 671&nbsp;<br>
            544143f9e01a60a Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2015-01-28 @672&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; if (rdev-&gt;accel_working) {<br>
            cc9e67e3d7000c1 Christian König&nbsp; &nbsp; 2014-07-18&nbsp; 673&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm = &amp;fpriv-&gt;vm;<br>
            cc9e67e3d7000c1 Christian König&nbsp; &nbsp; 2014-07-18&nbsp; 674&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = radeon_vm_init(rdev, vm);<br>
            74073c9dd299056 Quentin Casasnovas 2014-03-18&nbsp; 675&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (r) {<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 676&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_fpriv;<br>
            74073c9dd299056 Quentin Casasnovas 2014-03-18&nbsp; 677&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 678&nbsp;<br>
            f1e3dc708aaadb9 Christian König&nbsp; &nbsp; 2014-02-20&nbsp; 679&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = radeon_bo_reserve(rdev-&gt;<a href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241661151%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=u%2FJICBkdCMwgZH0zsmtS%2F2kQTtkwatlaQ51hnB8C1xo%3D&amp;reserved=0" originalsrc="http://ring_tmp_bo.bo/" shash="pTGztZVSUux8Zzx8dm06iJ/99tHo963mFrW7/2yaCSQbF6jENMoqLd7/NuLzvhsrpOUWe3G6JW0fws+5cO07smxx2YxxA0uoyJ9V3xoC4I3HEK/6/nW93iw1SwO5Y7oMyf1XmmHOZdnoV9pfV/MKz23D5/e90OryVoE6dKHErfs=" rel="noreferrer" target="_blank" moz-do-not-send="true">ring_tmp_bo.bo</a>,
            false);<br>
            74073c9dd299056 Quentin Casasnovas 2014-03-18&nbsp; 680&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (r) {<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 681&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_vm_fini;<br>
            74073c9dd299056 Quentin Casasnovas 2014-03-18&nbsp; 682&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            f1e3dc708aaadb9 Christian König&nbsp; &nbsp; 2014-02-20&nbsp; 683&nbsp;<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 684&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* map the ib pool buffer read only into<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 685&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* virtual address space */<br>
            cc9e67e3d7000c1 Christian König&nbsp; &nbsp; 2014-07-18&nbsp; 686&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vm-&gt;ib_bo_va = radeon_vm_bo_add(rdev, vm,<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 687&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; rdev-&gt;<a href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241671146%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Xci0wMHbXbhIcvQuZXPCdhhNXCOls%2BjoEhOVUPUQLhE%3D&amp;reserved=0" originalsrc="http://ring_tmp_bo.bo/" shash="NCA/gGTzQNyZoi1FOUzrPRd1Wl6RvI2EUieq0uPx+nYBF4BJT0GRLvgXjGL708/o1sJWKDYHxpaCTdPGROzZTZnyuEozl9m2LdrPj2k1TYUIK7lqybqaiwEL+N6OuElJ0ark7M56gFqLbLEuhDfb3Hky7+XPDLacInDcur5UR3c=" rel="noreferrer" target="_blank" moz-do-not-send="true">ring_tmp_bo.bo</a>);<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 688&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (!vm-&gt;ib_bo_va) {<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 689&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = -ENOMEM;<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 690&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_vm_fini;<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 691&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 692&nbsp;<br>
            cc9e67e3d7000c1 Christian König&nbsp; &nbsp; 2014-07-18&nbsp; 693&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; r = radeon_vm_bo_set_addr(rdev, vm-&gt;ib_bo_va,<br>
            cc9e67e3d7000c1 Christian König&nbsp; &nbsp; 2014-07-18&nbsp; 694&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; RADEON_VA_IB_OFFSET,<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 695&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            RADEON_VM_PAGE_READABLE |<br>
            d72d43cfc5847c1 Christian König&nbsp; &nbsp; 2012-10-09&nbsp; 696&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            RADEON_VM_PAGE_SNOOPED);<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 697&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (r) {<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 698&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto out_vm_fini;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 699&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            24f47acc78b0ab5 Jérôme Glisse&nbsp; &nbsp; &nbsp; 2014-05-07&nbsp; 700&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; }<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 701&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; file_priv-&gt;driver_priv = fpriv;<br>
            721604a15b934f0 Jerome Glisse&nbsp; &nbsp; &nbsp; 2012-01-05&nbsp; 702&nbsp; &nbsp; &nbsp; }<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 703&nbsp;<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 704&nbsp;
            out_vm_fini:<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 705&nbsp; &nbsp; &nbsp;
            radeon_vm_fini(rdev, vm);<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 706&nbsp;
            out_fpriv:<br>
            123fb3d217e89c4 Zhou Qingyang&nbsp; &nbsp; &nbsp; 2021-11-30&nbsp; 707&nbsp; &nbsp; &nbsp;
            kfree(fpriv);<br>
            32c59dc14b72803 Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2016-08-31&nbsp; 708&nbsp;
            out_suspend:<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 709&nbsp; &nbsp; &nbsp;
            pm_runtime_mark_last_busy(dev-&gt;dev);<br>
            10ebc0bc09344ab Dave Airlie&nbsp; &nbsp; &nbsp; &nbsp; 2012-09-17&nbsp; 710&nbsp; &nbsp; &nbsp;
            pm_runtime_put_autosuspend(dev-&gt;dev);<br>
            32c59dc14b72803 Alex Deucher&nbsp; &nbsp; &nbsp; &nbsp;2016-08-31&nbsp; 711&nbsp; &nbsp; &nbsp;
            return r;<br>
            771fe6b912fca54 Jerome Glisse&nbsp; &nbsp; &nbsp; 2009-06-05&nbsp; 712&nbsp; }<br>
            771fe6b912fca54 Jerome Glisse&nbsp; &nbsp; &nbsp; 2009-06-05&nbsp; 713&nbsp;<br>
            <br>
            ---<br>
            0-DAY CI Kernel Test Service, Intel Corporation<br>
            <a href="https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.01.org%2Fhyperkitty%2Flist%2Fkbuild-all%40lists.01.org&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241681142%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=PxpqV%2Fgh3oZuixBzm0aZxnoy3NAJzdxW7R9fOkqD8pQ%3D&amp;reserved=0" originalsrc="https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org" shash="isyXmnK7yV+bUpySUbw3Y86JgYYPXitd76nUdvH2vCcdgTC2Yaj8+csxjdxtBBUB8xbnyk9arFZVp+R/D5/vY00DYJbgrubdVH9bjn5a4QmNJc0rTxQMRva8z3CVuEzJwBlXqNCgpEMHdQLfCDuL652A36AASjz+hIh2aZsecdo=" rel="noreferrer" target="_blank" moz-do-not-send="true">https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org</a><br>
          </div>
          <div><br>
          </div>
        </div>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Wed, Dec 1, 2021 at 3:20
            PM Christian König &lt;<a href="mailto:christian.koenig@amd.com" target="_blank" moz-do-not-send="true">christian.koenig@amd.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Am 01.12.21 um 04:22
            schrieb Zhou Qingyang:<br>
            &gt; In radeon_driver_open_kms(), radeon_vm_bo_add() is
            assigned to<br>
            &gt; vm-&gt;ib_bo_va and passes and used in
            radeon_vm_bo_set_addr(). In<br>
            &gt; radeon_vm_bo_set_addr(), there is a dereference of
            vm-&gt;ib_bo_va,<br>
            &gt; which could lead to a NULL pointer dereference on
            failure of<br>
            &gt; radeon_vm_bo_add().<br>
            &gt;<br>
            &gt; Fix this bug by adding a check of vm-&gt;ib_bo_va.<br>
            &gt;<br>
            &gt; This bug was found by a static analyzer. The analysis
            employs<br>
            &gt; differential checking to identify inconsistent security
            operations<br>
            &gt; (e.g., checks or kfrees) between two code paths and
            confirms that the<br>
            &gt; inconsistent operations are not recovered in the
            current function or<br>
            &gt; the callers, so they constitute bugs.<br>
            &gt;<br>
            &gt; Note that, as a bug found by static analysis, it can be
            a false<br>
            &gt; positive or hard to trigger. Multiple researchers have
            cross-reviewed<br>
            &gt; the bug.<br>
            &gt;<br>
            &gt; Builds with CONFIG_DRM_RADEON=m show no new warnings,<br>
            &gt; and our static analyzer no longer warns about this
            code.<br>
            &gt;<br>
            &gt; Fixes: cc9e67e3d700 (&quot;drm/radeon: fix VM IB handling&quot;)<br>
            &gt; Reported-by: kernel test robot &lt;<a href="mailto:lkp@intel.com" target="_blank" moz-do-not-send="true">lkp@intel.com</a>&gt;<br>
            &gt; Signed-off-by: Zhou Qingyang &lt;<a href="mailto:zhou1615@umn.edu" target="_blank" moz-do-not-send="true">zhou1615@umn.edu</a>&gt;<br>
            &gt; ---<br>
            &gt; Changes in v2:<br>
            &gt;&nbsp; &nbsp; -&nbsp; Initialize the variables to silence warning<br>
            <br>
            What warning do you get? Double checking the code that
            shouldn't be <br>
            necessary and is usually rather frowned upon.<br>
            <br>
            Thanks,<br>
            Christian.<br>
            <br>
            &gt;<br>
            &gt; Changes in v3:<br>
            &gt;&nbsp; &nbsp; -&nbsp; Fix the bug that good case will also be freed<br>
            &gt;&nbsp; &nbsp; -&nbsp; Improve code style<br>
            &gt;<br>
            &gt; Changes in v2:<br>
            &gt;&nbsp; &nbsp; -&nbsp; Improve the error handling into goto style<br>
            &gt;<br>
            &gt;&nbsp; &nbsp;drivers/gpu/drm/radeon/radeon_kms.c | 37
            ++++++++++++++++-------------<br>
            &gt;&nbsp; &nbsp;1 file changed, 20 insertions(+), 17 deletions(-)<br>
            &gt;<br>
            &gt; diff --git a/drivers/gpu/drm/radeon/radeon_kms.c
            b/drivers/gpu/drm/radeon/radeon_kms.c<br>
            &gt; index 482fb0ae6cb5..9d0f840286a1 100644<br>
            &gt; --- a/drivers/gpu/drm/radeon/radeon_kms.c<br>
            &gt; +++ b/drivers/gpu/drm/radeon/radeon_kms.c<br>
            &gt; @@ -648,7 +648,9 @@ void
            radeon_driver_lastclose_kms(struct drm_device *dev)<br>
            &gt;&nbsp; &nbsp;int radeon_driver_open_kms(struct drm_device *dev,
            struct drm_file *file_priv)<br>
            &gt;&nbsp; &nbsp;{<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;struct radeon_device *rdev = dev-&gt;dev_private;<br>
            &gt; -&nbsp; &nbsp; &nbsp;int r;<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct radeon_fpriv *fpriv = NULL;<br>
            &gt; +&nbsp; &nbsp; &nbsp;struct radeon_vm *vm = NULL;<br>
            &gt; +&nbsp; &nbsp; &nbsp;int r = 0;<br>
            &gt;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;file_priv-&gt;driver_priv = NULL;<br>
            &gt;<br>
            &gt; @@ -660,8 +662,6 @@ int radeon_driver_open_kms(struct
            drm_device *dev, struct drm_file *file_priv)<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;/* new gpu have virtual address space support */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;family &gt;= CHIP_CAYMAN) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct radeon_fpriv *fpriv;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;struct radeon_vm *vm;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;fpriv = kzalloc(sizeof(*fpriv),
            GFP_KERNEL);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (unlikely(!fpriv)) {<br>
            &gt; @@ -672,35 +672,38 @@ int radeon_driver_open_kms(struct
            drm_device *dev, struct drm_file *file_priv)<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (rdev-&gt;accel_working) {<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vm = &amp;fpriv-&gt;vm;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = radeon_vm_init(rdev, vm);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(fpriv);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_suspend;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_fpriv;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = radeon_bo_reserve(rdev-&gt;<a href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241681142%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=H7WLEFylDXgOQLTAa5rPfEfbU8LtsqRxnGG8hWjI5IQ%3D&amp;reserved=0" originalsrc="http://ring_tmp_bo.bo/" shash="eoY3+JZXDD/goFe1WFORglFGANE8LvfKsQGrDV+jnveVvpR29eLda5nX37daBWWaUliDq+Ul4nkqo26Dar4l4TshbI2EAe6beZiEVt7kUpFWXmiqzVl1bcrEqIBMMePLZw11G2tNTA/N+8pTodvp38vIsQtn82QKc43kGdvsfo0=" rel="noreferrer" target="_blank" moz-do-not-send="true">ring_tmp_bo.bo</a>,
            false);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;radeon_vm_fini(rdev, vm);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(fpriv);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_suspend;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_vm_fini;<br>
            &gt;&nbsp; &nbsp;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* map the ib pool buffer read
            only into<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; * virtual address space */<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;vm-&gt;ib_bo_va =
            radeon_vm_bo_add(rdev, vm,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;rdev-&gt;<a href="https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fring_tmp_bo.bo%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cd8f40721cdb04ff26c4e08d9b4c8f26a%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637739602241691135%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=SSR7%2FvFI3gwMRiolWqM79J47Mje8Yz6B%2Ba6jmeX%2FA0E%3D&amp;reserved=0" originalsrc="http://ring_tmp_bo.bo/" shash="v8y+D4E5UmSTgxXKq6TPUoANf4ELlXySyeq869SLzsMtrnuebLLOdL51fuQTvLEMilXWVNmTdXljflNsDY+whEMQzvo+iOqtWPxZ7/Jas39u+oLJU24XxhNXteb0+36uIVj6EKnz3CLBv1qtddEnQHG5M3G4HhobIDutuOZF18c=" rel="noreferrer" target="_blank" moz-do-not-send="true">ring_tmp_bo.bo</a>);<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!vm-&gt;ib_bo_va) {<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = -ENOMEM;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_vm_fini;<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;r = radeon_vm_bo_set_addr(rdev,
            vm-&gt;ib_bo_va,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;RADEON_VA_IB_OFFSET,<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;RADEON_VM_PAGE_READABLE |<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;RADEON_VM_PAGE_SNOOPED);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r) {<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;radeon_vm_fini(rdev, vm);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(fpriv);<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_suspend;<br>
            &gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;goto out_vm_fini;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;file_priv-&gt;driver_priv = fpriv;<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&nbsp; &nbsp;<br>
            &gt; +out_vm_fini:<br>
            &gt; +&nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;radeon_vm_fini(rdev, vm);<br>
            &gt; +out_fpriv:<br>
            &gt; +&nbsp; &nbsp; &nbsp;if (r)<br>
            &gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;kfree(fpriv);<br>
            &gt;&nbsp; &nbsp;out_suspend:<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;pm_runtime_mark_last_busy(dev-&gt;dev);<br>
            &gt;&nbsp; &nbsp; &nbsp; &nbsp;pm_runtime_put_autosuspend(dev-&gt;dev);<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------E23D0C36A2162A68C0349A62--
